

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N043.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N044.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N045.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N141.INC'),ONCE        !Req'd for module callout resolution
                     END


Trig_BrowseProduksi PROCEDURE                              ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(ApHProd)
                       PROJECT(APHP:N0_tran)
                       PROJECT(APHP:Kode_Apotik)
                       PROJECT(APHP:Tanggal)
                       PROJECT(APHP:User)
                       PROJECT(APHP:Total_Biaya)
                       PROJECT(APHP:Jenis)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APHP:N0_tran           LIKE(APHP:N0_tran)             !List box control field - type derived from field
APHP:Kode_Apotik       LIKE(APHP:Kode_Apotik)         !List box control field - type derived from field
APHP:Tanggal           LIKE(APHP:Tanggal)             !List box control field - type derived from field
APHP:User              LIKE(APHP:User)                !List box control field - type derived from field
APHP:Total_Biaya       LIKE(APHP:Total_Biaya)         !List box control field - type derived from field
APHP:Jenis             LIKE(APHP:Jenis)               !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(ApDProd)
                       PROJECT(APDP:Kode_Brg)
                       PROJECT(APDP:Jumlah)
                       PROJECT(APDP:Biaya)
                       PROJECT(APDP:N0_tran)
                       JOIN(GBAR:KeyKodeBrg,APDP:Kode_Brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Ket2)
                         PROJECT(GBAR:No_Satuan)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
APDP:Kode_Brg          LIKE(APDP:Kode_Brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Ket2              LIKE(GBAR:Ket2)                !List box control field - type derived from field
GBAR:No_Satuan         LIKE(GBAR:No_Satuan)           !List box control field - type derived from field
APDP:Jumlah            LIKE(APDP:Jumlah)              !List box control field - type derived from field
APDP:Biaya             LIKE(APDP:Biaya)               !List box control field - type derived from field
APDP:N0_tran           LIKE(APDP:N0_tran)             !Primary key field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW6::View:Browse    VIEW(ApDDProd)
                       PROJECT(APDDP:N0_tran)
                       PROJECT(APDDP:Kode_Brg)
                       PROJECT(APDDP:Kode_Asal)
                       PROJECT(APDDP:Jumlah)
                       PROJECT(APDDP:Biaya)
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?List:2
APDDP:N0_tran          LIKE(APDDP:N0_tran)            !List box control field - type derived from field
APDDP:Kode_Brg         LIKE(APDDP:Kode_Brg)           !List box control field - type derived from field
APDDP:Kode_Asal        LIKE(APDDP:Kode_Asal)          !List box control field - type derived from field
APDDP:Jumlah           LIKE(APDDP:Jumlah)             !List box control field - type derived from field
APDDP:Biaya            LIKE(APDDP:Biaya)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Transaksi Obat Campur'),AT(,,406,318),FONT('Arial',8,,),CENTER,IMM,HLP('Trig_BrowseProduksi'),SYSTEM,GRAY,MDI
                       LIST,AT(6,22,392,98),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('64L(2)|M~N 0 tran~@s15@48L(2)|M~Kode Apotik~@s5@80R(2)|M~Tanggal~C(0)@D08@20L(2)' &|
   '|M~User~@s4@64R(2)|M~Total Biaya~C(0)@n-14@12R(2)|M~Jenis~@n3@'),FROM(Queue:Browse:1)
                       BUTTON('&Tambah (+)'),AT(96,124,45,14),USE(?Insert:2),KEY(PlusKey)
                       BUTTON('&Ubah'),AT(194,124,45,14),USE(?Change:2),DISABLE,HIDE
                       BUTTON('&Hapus'),AT(242,124,45,14),USE(?Delete:2),DISABLE,HIDE
                       LIST,AT(6,146,392,65),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('40L|M~Kode Brg~@s10@111L|M~Nama Obat~@s40@99L|M~Keterangan~@s50@40L|M~Satuan~@s1' &|
   '0@49R|M~Jumlah~L@n-14.2@56R|M~Biaya~L@n-14.2@'),FROM(Queue:Browse)
                       SHEET,AT(1,4,402,138),USE(?CurrentTab)
                         TAB('No Transkasi'),USE(?Tab:2)
                           BUTTON('&Print'),AT(146,124,45,14),USE(?Button5)
                           PROMPT('N0 tran:'),AT(4,126),USE(?APTI:N0_tran:Prompt)
                           ENTRY(@s15),AT(34,126,60,10),USE(APHP:N0_tran),MSG('nomor transaksi'),TIP('nomor transaksi')
                         END
                       END
                       BUTTON('&Selesai'),AT(277,303,45,14),USE(?Close),DEFAULT
                       BUTTON('&Cek Stok'),AT(146,216,45,14),USE(?Button6)
                       BUTTON('Kirim ke Apotik Lain'),AT(200,216,101,14),USE(?Button7)
                       LIST,AT(6,235,392,64),USE(?List:2),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('60L|M~N 0 tran~@s15@40L|M~Kode Brg~@s10@40L|M~Kode Asal~@s10@40D|M~Jumlah~L@n10.' &|
   '2@40D|M~Biaya~L@n10.2@'),FROM(Queue:Browse:2)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW5                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
                     END

BRW5::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW6                 CLASS(BrowseClass)                    ! Browse using ?List:2
Q                      &Queue:Browse:2                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
                     END

BRW6::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
  GlobalErrors.SetProcedureName('Trig_BrowseProduksi')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:ApDDProd.Open                                     ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Access:GApotik.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:ApHProd,SELF) ! Initialize the browse manager
  BRW5.Init(?List,Queue:Browse.ViewPosition,BRW5::View:Browse,Queue:Browse,Relate:ApDProd,SELF) ! Initialize the browse manager
  BRW6.Init(?List:2,Queue:Browse:2.ViewPosition,BRW6::View:Browse,Queue:Browse:2,Relate:ApDDProd,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  ?List:2{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,APHP:key_no_tran)                     ! Add the sort order for APHP:key_no_tran for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,APHP:N0_tran,1,BRW1)           ! Initialize the browse locator using  using key: APHP:key_no_tran , APHP:N0_tran
  BRW1.SetFilter('(aphp:kode_apotik=GL_entryapotik)')      ! Apply filter expression to browse
  BRW1.AddField(APHP:N0_tran,BRW1.Q.APHP:N0_tran)          ! Field APHP:N0_tran is a hot field or requires assignment from browse
  BRW1.AddField(APHP:Kode_Apotik,BRW1.Q.APHP:Kode_Apotik)  ! Field APHP:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(APHP:Tanggal,BRW1.Q.APHP:Tanggal)          ! Field APHP:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(APHP:User,BRW1.Q.APHP:User)                ! Field APHP:User is a hot field or requires assignment from browse
  BRW1.AddField(APHP:Total_Biaya,BRW1.Q.APHP:Total_Biaya)  ! Field APHP:Total_Biaya is a hot field or requires assignment from browse
  BRW1.AddField(APHP:Jenis,BRW1.Q.APHP:Jenis)              ! Field APHP:Jenis is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse
  BRW5.AddSortOrder(,APDP:key_no_nota)                     ! Add the sort order for APDP:key_no_nota for sort order 1
  BRW5.AddRange(APDP:N0_tran,Relate:ApDProd,Relate:ApHProd) ! Add file relationship range limit for sort order 1
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort0:Locator.Init(,APDP:Kode_Brg,1,BRW5)          ! Initialize the browse locator using  using key: APDP:key_no_nota , APDP:Kode_Brg
  BRW5.AddField(APDP:Kode_Brg,BRW5.Q.APDP:Kode_Brg)        ! Field APDP:Kode_Brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Nama_Brg,BRW5.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Ket2,BRW5.Q.GBAR:Ket2)                ! Field GBAR:Ket2 is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:No_Satuan,BRW5.Q.GBAR:No_Satuan)      ! Field GBAR:No_Satuan is a hot field or requires assignment from browse
  BRW5.AddField(APDP:Jumlah,BRW5.Q.APDP:Jumlah)            ! Field APDP:Jumlah is a hot field or requires assignment from browse
  BRW5.AddField(APDP:Biaya,BRW5.Q.APDP:Biaya)              ! Field APDP:Biaya is a hot field or requires assignment from browse
  BRW5.AddField(APDP:N0_tran,BRW5.Q.APDP:N0_tran)          ! Field APDP:N0_tran is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Kode_brg,BRW5.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  BRW6.Q &= Queue:Browse:2
  BRW6.AddSortOrder(,APDDP:key_no_nota)                    ! Add the sort order for APDDP:key_no_nota for sort order 1
  BRW6.AddRange(APDDP:Kode_Brg,Relate:ApDDProd,Relate:ApDProd) ! Add file relationship range limit for sort order 1
  BRW6.AddLocator(BRW6::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW6::Sort0:Locator.Init(,APDDP:Kode_Asal,1,BRW6)        ! Initialize the browse locator using  using key: APDDP:key_no_nota , APDDP:Kode_Asal
  BRW6.AddField(APDDP:N0_tran,BRW6.Q.APDDP:N0_tran)        ! Field APDDP:N0_tran is a hot field or requires assignment from browse
  BRW6.AddField(APDDP:Kode_Brg,BRW6.Q.APDDP:Kode_Brg)      ! Field APDDP:Kode_Brg is a hot field or requires assignment from browse
  BRW6.AddField(APDDP:Kode_Asal,BRW6.Q.APDDP:Kode_Asal)    ! Field APDDP:Kode_Asal is a hot field or requires assignment from browse
  BRW6.AddField(APDDP:Jumlah,BRW6.Q.APDDP:Jumlah)          ! Field APDDP:Jumlah is a hot field or requires assignment from browse
  BRW6.AddField(APDDP:Biaya,BRW6.Q.APDDP:Biaya)            ! Field APDDP:Biaya is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_BrowseProduksi',QuickWindow)          ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW5.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW6.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ApDDProd.Close
    Relate:Nomor_SKR.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_BrowseProduksi',QuickWindow)       ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdateApHProd
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


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
    OF ?Insert:2
      NOM1:No_urut=12
      access:nomor_skr.fetch(NOM1:PrimaryKey)
      if not(errorcode()) then
         if sub(format(year(today()),@p####p),3,2)<format(sub(clip(NOM1:No_Trans),4,2),@n2) then
            message('Tanggal sistem lebih kecil dari tanggal penomoran, tidak bisa dilanjutkan !!!')
            cycle
         elsif month(today())<format(sub(clip(NOM1:No_Trans),6,2),@n2) and sub(format(year(today()),@p####p),3,2)=format(sub(clip(NOM1:No_Trans),4,2),@n2) then
            message('Tanggal sistem lebih kecil dari tanggal penomoran, tidak bisa dilanjutkan !!!')
            cycle
         end
      end
    OF ?Button5
      glo::nomor=APHP:N0_tran
      display
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button5
      ThisWindow.Update
      START(PrintProduksiObat, 25000)
      ThisWindow.Reset
    OF ?Button6
      ThisWindow.Update
      START(BrowseCekStok, 25000)
      ThisWindow.Reset
    OF ?Button7
      ThisWindow.Update
      START(BrowseAntarApotik1, 25000)
      ThisWindow.Reset
    END
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
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:2
    SELF.ChangeControl=?Change:2
    SELF.DeleteControl=?Delete:2
  END


BRW5.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW6.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

BrowseCekStok PROCEDURE                                    ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
loc:nama_brg         STRING(40)                            !Nama Barang
loc:kode_brg         STRING(10)                            !Kode Barang
Loc:Jumlah           LONG                                  !
BRW1::View:Browse    VIEW(GStokAptk)
                       PROJECT(GSTO:Kode_Barang)
                       PROJECT(GSTO:Saldo)
                       PROJECT(GSTO:Harga_Dasar)
                       PROJECT(GSTO:Saldo_Minimal)
                       PROJECT(GSTO:Kode_Apotik)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GSTO:Kode_Barang       LIKE(GSTO:Kode_Barang)         !List box control field - type derived from field
GSTO:Saldo             LIKE(GSTO:Saldo)               !List box control field - type derived from field
GSTO:Harga_Dasar       LIKE(GSTO:Harga_Dasar)         !List box control field - type derived from field
GSTO:Saldo_Minimal     LIKE(GSTO:Saldo_Minimal)       !List box control field - type derived from field
GSTO:Kode_Apotik       LIKE(GSTO:Kode_Apotik)         !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(GBarang)
                       PROJECT(GBAR:Nama_Brg)
                       PROJECT(GBAR:Kode_brg)
                       PROJECT(GBAR:No_Satuan)
                       PROJECT(GBAR:Jenis_Brg)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !List box control field - type derived from field
GBAR:No_Satuan         LIKE(GBAR:No_Satuan)           !List box control field - type derived from field
GBAR:Jenis_Brg         LIKE(GBAR:Jenis_Brg)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Tabel Barang setempat'),AT(,,350,206),FONT('Arial',8,,),IMM,HLP('tabel_stok_lokal'),SYSTEM,GRAY,MDI
                       SHEET,AT(2,1,345,111),USE(?Sheet2)
                         TAB('Nama Barang [F2]'),USE(?Tab2),KEY(F2Key),FONT('Times New Roman',8,,FONT:regular)
                           ENTRY(@s40),AT(151,96,139,12),USE(loc:nama_brg),FONT('Times New Roman',10,COLOR:Black,)
                         END
                         TAB('Kode Barang [F3]'),USE(?Tab3),KEY(F3Key),FONT('Times New Roman',8,COLOR:Black,)
                           ENTRY(@s10),AT(153,96,139,12),USE(loc:kode_brg),FONT('Times New Roman',10,,)
                         END
                       END
                       LIST,AT(6,18,336,73),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('137L|FM~Nama Obat~C@s40@48L(2)|M~Kode Barang~@s10@40L(2)|M~Satuan~@s10@27L(2)|~J' &|
   'enis Brg~@s5@'),FROM(Queue:Browse)
                       LIST,AT(6,132,336,36),USE(?Browse:1),IMM,MSG('Browsing Records'),FORMAT('54L|M~Kode Barang~@s10@68D(14)|M~Saldo~@n-16.2@51D(14)|M~Harga Dasar~C(0)@n-11.2' &|
   '@68D(14)|M~Saldo Minimal~C(0)@n-16.2@20D(14)|M~Kode Apotik~C(0)@s5@'),FROM(Queue:Browse:1)
                       SHEET,AT(2,114,345,60),USE(?CurrentTab)
                         TAB('Stok di Sub Farmasi Setempat'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Selesai'),AT(275,179,64,23),USE(?Close),LEFT,ICON(ICON:Cross)
                       BUTTON('Help'),AT(14,189,45,14),USE(?Help),DISABLE,HIDE,STD(STD:Help)
                       GROUP,AT(69,176,189,30),USE(?Group1)
                         BUTTON('&Tambah [+]'),AT(75,179,53,23),USE(?Insert:2),KEY(PlusKey)
                         BUTTON('&Ubah'),AT(137,179,53,23),USE(?Change:2),DEFAULT
                         BUTTON('&Hapus'),AT(199,179,53,23),USE(?Delete:2)
                       END
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetFromView          PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW5                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW5::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW5::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?Sheet2)=2
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

ThisWindow.Ask PROCEDURE

  CODE
  IF GLO:LEVEL > 1
      ?Group1{PROP:DISABLE}=TRUE
  ELSE
      ?Group1{PROP:DISABLE}=FALSE
  END
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowseCekStok')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?loc:nama_brg
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:GBarang.Open                                      ! File GBarang used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GStokAptk,SELF) ! Initialize the browse manager
  BRW5.Init(?List,Queue:Browse.ViewPosition,BRW5::View:Browse,Queue:Browse,Relate:GBarang,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,GSTO:key_kd_brg)                      ! Add the sort order for GSTO:key_kd_brg for sort order 1
  BRW1.AddRange(GSTO:Kode_Barang,Relate:GStokAptk,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,GSTO:Kode_Barang,,BRW1)        ! Initialize the browse locator using  using key: GSTO:key_kd_brg , GSTO:Kode_Barang
  BRW1.SetFilter('(gsto:kode_apotik=''FM07'')')            ! Apply filter expression to browse
  BRW1.AddField(GSTO:Kode_Barang,BRW1.Q.GSTO:Kode_Barang)  ! Field GSTO:Kode_Barang is a hot field or requires assignment from browse
  BRW1.AddField(GSTO:Saldo,BRW1.Q.GSTO:Saldo)              ! Field GSTO:Saldo is a hot field or requires assignment from browse
  BRW1.AddField(GSTO:Harga_Dasar,BRW1.Q.GSTO:Harga_Dasar)  ! Field GSTO:Harga_Dasar is a hot field or requires assignment from browse
  BRW1.AddField(GSTO:Saldo_Minimal,BRW1.Q.GSTO:Saldo_Minimal) ! Field GSTO:Saldo_Minimal is a hot field or requires assignment from browse
  BRW1.AddField(GSTO:Kode_Apotik,BRW1.Q.GSTO:Kode_Apotik)  ! Field GSTO:Kode_Apotik is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse
  BRW5.AddSortOrder(,GBAR:KeyKodeBrg)                      ! Add the sort order for GBAR:KeyKodeBrg for sort order 1
  BRW5.AddLocator(BRW5::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort1:Locator.Init(?loc:kode_brg,GBAR:Kode_brg,,BRW5) ! Initialize the browse locator using ?loc:kode_brg using key: GBAR:KeyKodeBrg , GBAR:Kode_brg
  BRW5.SetFilter('(vst:kode_apotik=)')                     ! Apply filter expression to browse
  BRW5.AddSortOrder(,GBAR:KeyNama)                         ! Add the sort order for GBAR:KeyNama for sort order 2
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW5::Sort0:Locator.Init(?loc:nama_brg,GBAR:Nama_Brg,,BRW5) ! Initialize the browse locator using ?loc:nama_brg using key: GBAR:KeyNama , GBAR:Nama_Brg
  BRW5.AddField(GBAR:Nama_Brg,BRW5.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Kode_brg,BRW5.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:No_Satuan,BRW5.Q.GBAR:No_Satuan)      ! Field GBAR:No_Satuan is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Jenis_Brg,BRW5.Q.GBAR:Jenis_Brg)      ! Field GBAR:Jenis_Brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseCekStok',QuickWindow)                ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW5.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW5.ToolbarItem.HelpButton = ?Help
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:GBarang.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseCekStok',QuickWindow)             ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  IF GLO:LEVEL > 1
    MESSAGE('ANDA TIDAK MEMPUNYAI HAK UNTUK FASILITAS INI')
    RETURN RequestCancelled
  END
  ReturnValue = PARENT.Run(Number,Request)
  RETURN ReturnValue


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW1.ResetFromView PROCEDURE

Loc:Jumlah:Sum       REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:GStokAptk.SetQuickScan(1)
  SELF.Reset
  LOOP
    CASE SELF.Next()
    OF Level:Notify
      BREAK
    OF Level:Fatal
      SETCURSOR()
      RETURN
    END
    SELF.SetQueueRecord
    Loc:Jumlah:Sum += GSTO:Saldo
  END
  Loc:Jumlah = Loc:Jumlah:Sum
  PARENT.ResetFromView
  Relate:GStokAptk.SetQuickScan(0)
  SETCURSOR()


BRW5.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW5.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?Sheet2)=2
    RETURN SELF.SetSort(1,Force)
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

