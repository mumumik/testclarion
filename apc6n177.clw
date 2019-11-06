

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N177.INC'),ONCE        !Local module procedure declarations
                     END


cari_brg_lokal4bpjs PROCEDURE                              ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
loc::nama_brg        STRING(40)                            !Nama Barang
LOC::STOK            REAL                                  !Saldo
BRW1::View:Browse    VIEW(GBarang)
                       PROJECT(GBAR:Kode_brg)
                       PROJECT(GBAR:Nama_Brg)
                       PROJECT(GBAR:Kandungan)
                       PROJECT(GBAR:Ket2)
                       PROJECT(GBAR:Kelompok)
                       PROJECT(GBAR:Status)
                       PROJECT(GBAR:FarNonFar)
                       JOIN(GSTO:KeyBarang,GBAR:Kode_brg)
                         PROJECT(GSTO:Saldo)
                         PROJECT(GSTO:Harga_Dasar)
                         PROJECT(GSTO:Kode_Apotik)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Kandungan         LIKE(GBAR:Kandungan)           !List box control field - type derived from field
GSTO:Saldo             LIKE(GSTO:Saldo)               !List box control field - type derived from field
GSTO:Harga_Dasar       LIKE(GSTO:Harga_Dasar)         !List box control field - type derived from field
GBAR:Ket2              LIKE(GBAR:Ket2)                !List box control field - type derived from field
GBAR:Kelompok          LIKE(GBAR:Kelompok)            !List box control field - type derived from field
GBAR:Status            LIKE(GBAR:Status)              !List box control field - type derived from field
GSTO:Kode_Apotik       LIKE(GSTO:Kode_Apotik)         !List box control field - type derived from field
GBAR:FarNonFar         LIKE(GBAR:FarNonFar)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Melihat Data Barang'),AT(,,417,190),FONT('Arial Narrow',10,,),IMM,HLP('cari_brg_lokal4'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,401,130),USE(?Browse:1),IMM,HVSCROLL,FONT(,12,,),MSG('Browsing Records'),FORMAT('59L(2)|M~Kode Barang~@s10@139L(2)|M~Nama Obat~@s40@134L(2)|M~Kandungan~@s40@54R(' &|
   '2)|M~Stok~L@n16.2@65R(2)|M~Harga Dasar~L@n15.2@81L(2)|M~Keterangan~@s50@24R(2)|M' &|
   '~Kelompok~L@n6@12R(2)|M~Status~L@n3@20R(2)|M~Kode Apotik~L@s5@12R(2)|M~Far Non F' &|
   'ar~L@n3@'),FROM(Queue:Browse:1)
                       BUTTON('&Pilih'),AT(62,163,45,14),USE(?Select:2),HIDE
                       BUTTON('&STOK [Ctrl]'),AT(144,162,91,14),USE(?Button4),HIDE,KEY(529)
                       STRING(@n-12.2),AT(244,162,89,15),USE(LOC::STOK),HIDE,LEFT,FONT('Times New Roman',16,,FONT:regular),COLOR(0EEC41CH)
                       SHEET,AT(4,4,411,182),USE(?CurrentTab)
                         TAB('Kode Barang [F2]'),USE(?Tab:2),KEY(F2Key)
                           ENTRY(@s10),AT(63,152,60,10),USE(GBAR:Kode_brg),MSG('Kode Barang')
                           STRING('Kode Barang : '),AT(14,152),USE(?String3)
                         END
                         TAB('Nama Barang [F3]'),USE(?Tab:3),KEY(F3Key)
                           ENTRY(@s40),AT(63,152,60,10),USE(GBAR:Nama_Brg),MSG('Nama Barang')
                           STRING('Nama Barang : '),AT(12,153),USE(?String4)
                         END
                         TAB('Kandungan'),USE(?Tab3)
                           ENTRY(@s40),AT(63,152,60,10),USE(GBAR:Kandungan)
                           STRING('Kandungan : '),AT(18,152),USE(?String5)
                         END
                       END
                       BUTTON('Close'),AT(13,163,45,14),USE(?Close),HIDE
                       BUTTON('Help'),AT(165,0,45,14),USE(?Help),DISABLE,HIDE,STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Open                   PROCEDURE(),DERIVED                 ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  FilterLocatorClass                    ! Default Locator
BRW1::Sort1:Locator  FilterLocatorClass                    ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab)=3
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False) ! Method added to host embed code
                     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It's called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('cari_brg_lokal4bpjs')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo:apotikfilter',glo:apotikfilter)                ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:GBarang.Open                                      ! File vstokfifo used by this procedure, so make sure it's RelationManager is open
  Relate:vstokfifo.Open                                    ! File vstokfifo used by this procedure, so make sure it's RelationManager is open
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GBarang,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,GBAR:KeyNama)                         ! Add the sort order for GBAR:KeyNama for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,GBAR:Nama_Brg,,BRW1)           ! Initialize the browse locator using  using key: GBAR:KeyNama , GBAR:Nama_Brg
  BRW1::Sort1:Locator.FloatRight = 1
  BRW1.SetFilter('(gbar:status=1 and gbar:farnonfar=0 and gsto:kode_apotik=glo:apotikfilter and gsto:saldo<<>0)') ! Apply filter expression to browse
  BRW1.AddSortOrder(,GBAR:KeyKodeKandungan)                ! Add the sort order for GBAR:KeyKodeKandungan for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,GBAR:Kandungan,1,BRW1)         ! Initialize the browse locator using  using key: GBAR:KeyKodeKandungan , GBAR:Kandungan
  BRW1.SetFilter('(gbar:status=1 and gbar:farnonfar=0 and gsto:kode_apotik=glo:apotikfilter and gsto:saldo<<>0)') ! Apply filter expression to browse
  BRW1.AddSortOrder(,GBAR:KeyKodeBrg)                      ! Add the sort order for GBAR:KeyKodeBrg for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(?GBAR:Kode_brg,GBAR:Kode_brg,,BRW1) ! Initialize the browse locator using ?GBAR:Kode_brg using key: GBAR:KeyKodeBrg , GBAR:Kode_brg
  BRW1::Sort0:Locator.FloatRight = 1
  BRW1.SetFilter('(gbar:status=1 and gbar:farnonfar=0 and gsto:kode_apotik=glo:apotikfilter and gsto:saldo<<>0)') ! Apply filter expression to browse
  BRW1.AddField(GBAR:Kode_brg,BRW1.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Nama_Brg,BRW1.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Kandungan,BRW1.Q.GBAR:Kandungan)      ! Field GBAR:Kandungan is a hot field or requires assignment from browse
  BRW1.AddField(GSTO:Saldo,BRW1.Q.GSTO:Saldo)              ! Field GSTO:Saldo is a hot field or requires assignment from browse
  BRW1.AddField(GSTO:Harga_Dasar,BRW1.Q.GSTO:Harga_Dasar)  ! Field GSTO:Harga_Dasar is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Ket2,BRW1.Q.GBAR:Ket2)                ! Field GBAR:Ket2 is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Kelompok,BRW1.Q.GBAR:Kelompok)        ! Field GBAR:Kelompok is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Status,BRW1.Q.GBAR:Status)            ! Field GBAR:Status is a hot field or requires assignment from browse
  BRW1.AddField(GSTO:Kode_Apotik,BRW1.Q.GSTO:Kode_Apotik)  ! Field GSTO:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:FarNonFar,BRW1.Q.GBAR:FarNonFar)      ! Field GBAR:FarNonFar is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('cari_brg_lokal4bpjs',QuickWindow)          ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:GBarang.Close
    Relate:vstokfifo.Close
  END
  IF SELF.Opened
    INIMgr.Update('cari_brg_lokal4bpjs',QuickWindow)       ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Open PROCEDURE

  CODE
  select(?Tab:3)
  PARENT.Open


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE ACCEPTED()
    OF ?Button4
      !VST:kode_apotik = GL_entryapotik
      !VST:kode_barang = GBAR:Kode_brg
      !GET(vstokfifo,VST:primarykey)
      !IF NOT ERRORCODE()
      !    LOC::STOK = VST:jumlah
      !    DISPLAY
      !END
      !SELECT(?BROWSE:1)
      
      GSTO:Kode_Apotik = GL_entryapotik
      GSTO:Kode_Barang = GBAR:Kode_brg
      GET(gstokaptk,GSTO:KeyBarang)
      IF NOT ERRORCODE()
          LOC::STOK = GSTO:Saldo
          DISPLAY
      END
      SELECT(?BROWSE:1)
    END
  ReturnValue = PARENT.TakeAccepted()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab)=3
    RETURN SELF.SetSort(2,Force)
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

