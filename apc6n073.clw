

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N073.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N072.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N149.INC'),ONCE        !Req'd for module callout resolution
                     END


IsiAwalBulan PROCEDURE                                     ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(Tbstawal)
                       PROJECT(TBS:Kode_Barang)
                       PROJECT(TBS:Tahun)
                       PROJECT(TBS:Januari)
                       PROJECT(TBS:Februari)
                       PROJECT(TBS:Maret)
                       PROJECT(TBS:April)
                       PROJECT(TBS:Mei)
                       PROJECT(TBS:Juni)
                       PROJECT(TBS:Juli)
                       PROJECT(TBS:Agustus)
                       PROJECT(TBS:September)
                       PROJECT(TBS:Oktober)
                       PROJECT(TBS:November)
                       PROJECT(TBS:Desember)
                       PROJECT(TBS:Kode_Apotik)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
TBS:Kode_Barang        LIKE(TBS:Kode_Barang)          !List box control field - type derived from field
TBS:Tahun              LIKE(TBS:Tahun)                !List box control field - type derived from field
TBS:Januari            LIKE(TBS:Januari)              !List box control field - type derived from field
TBS:Februari           LIKE(TBS:Februari)             !List box control field - type derived from field
TBS:Maret              LIKE(TBS:Maret)                !List box control field - type derived from field
TBS:April              LIKE(TBS:April)                !List box control field - type derived from field
TBS:Mei                LIKE(TBS:Mei)                  !List box control field - type derived from field
TBS:Juni               LIKE(TBS:Juni)                 !List box control field - type derived from field
TBS:Juli               LIKE(TBS:Juli)                 !List box control field - type derived from field
TBS:Agustus            LIKE(TBS:Agustus)              !List box control field - type derived from field
TBS:September          LIKE(TBS:September)            !List box control field - type derived from field
TBS:Oktober            LIKE(TBS:Oktober)              !List box control field - type derived from field
TBS:November           LIKE(TBS:November)             !List box control field - type derived from field
TBS:Desember           LIKE(TBS:Desember)             !List box control field - type derived from field
TBS:Kode_Apotik        LIKE(TBS:Kode_Apotik)          !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Tabel Stok Awal Bulan Ybs'),AT(,,308,196),FONT('MS Sans Serif',8,COLOR:Black,),IMM,HLP('IsiAwalBulan'),SYSTEM,GRAY,RESIZE
                       LIST,AT(7,22,292,137),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('48L(2)|M~Kode Barang~@s10@24R(2)|M~Tahun~C(0)@n4@32R(2)|M~Januari~C(0)@n6@36R(2)' &|
   '|M~Februari~C(0)@n6@28R(2)|M~Maret~C(0)@n6@28R(2)|M~April~C(0)@n6@28R(2)|M~Mei~C' &|
   '(0)@n6@28R(2)|M~Juni~C(0)@n6@24L(2)|M~Juli~@n6@24L(2)|M~Agustus~@n6@24L(2)|M~Sep' &|
   'tember~@n6@24L(2)|M~Oktober~@n6@24L(2)|M~November~@n6@24L(2)|M~Desember~@n6@48L(' &|
   '2)|M~Kode Apotik~@s5@'),FROM(Queue:Browse:1)
                       SHEET,AT(4,4,300,162),USE(?CurrentTab)
                         TAB('Disusun berdasar kode barang'),USE(?Tab:2),FONT('Times New Roman',8,,)
                         END
                       END
                       BUTTON('&Selesai'),AT(234,168,70,26),USE(?Close),LEFT,ICON('EXIT5.ICO')
                       BUTTON('Help'),AT(219,0,45,14),USE(?Help),HIDE,STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
  GlobalErrors.SetProcedureName('IsiAwalBulan')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:GStokAptk.Open                                    ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Relate:Tbstawal.Open                                     ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  proses_isi_awal_bln
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Tbstawal,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,TBS:kdap_brg)                         ! Add the sort order for TBS:kdap_brg for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,TBS:Kode_Apotik,,BRW1)         ! Initialize the browse locator using  using key: TBS:kdap_brg , TBS:Kode_Apotik
  BRW1.AddField(TBS:Kode_Barang,BRW1.Q.TBS:Kode_Barang)    ! Field TBS:Kode_Barang is a hot field or requires assignment from browse
  BRW1.AddField(TBS:Tahun,BRW1.Q.TBS:Tahun)                ! Field TBS:Tahun is a hot field or requires assignment from browse
  BRW1.AddField(TBS:Januari,BRW1.Q.TBS:Januari)            ! Field TBS:Januari is a hot field or requires assignment from browse
  BRW1.AddField(TBS:Februari,BRW1.Q.TBS:Februari)          ! Field TBS:Februari is a hot field or requires assignment from browse
  BRW1.AddField(TBS:Maret,BRW1.Q.TBS:Maret)                ! Field TBS:Maret is a hot field or requires assignment from browse
  BRW1.AddField(TBS:April,BRW1.Q.TBS:April)                ! Field TBS:April is a hot field or requires assignment from browse
  BRW1.AddField(TBS:Mei,BRW1.Q.TBS:Mei)                    ! Field TBS:Mei is a hot field or requires assignment from browse
  BRW1.AddField(TBS:Juni,BRW1.Q.TBS:Juni)                  ! Field TBS:Juni is a hot field or requires assignment from browse
  BRW1.AddField(TBS:Juli,BRW1.Q.TBS:Juli)                  ! Field TBS:Juli is a hot field or requires assignment from browse
  BRW1.AddField(TBS:Agustus,BRW1.Q.TBS:Agustus)            ! Field TBS:Agustus is a hot field or requires assignment from browse
  BRW1.AddField(TBS:September,BRW1.Q.TBS:September)        ! Field TBS:September is a hot field or requires assignment from browse
  BRW1.AddField(TBS:Oktober,BRW1.Q.TBS:Oktober)            ! Field TBS:Oktober is a hot field or requires assignment from browse
  BRW1.AddField(TBS:November,BRW1.Q.TBS:November)          ! Field TBS:November is a hot field or requires assignment from browse
  BRW1.AddField(TBS:Desember,BRW1.Q.TBS:Desember)          ! Field TBS:Desember is a hot field or requires assignment from browse
  BRW1.AddField(TBS:Kode_Apotik,BRW1.Q.TBS:Kode_Apotik)    ! Field TBS:Kode_Apotik is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('IsiAwalBulan',QuickWindow)                 ! Restore window settings from non-volatile store
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
    Relate:GStokAptk.Close
    Relate:Tbstawal.Close
  END
  IF SELF.Opened
    INIMgr.Update('IsiAwalBulan',QuickWindow)              ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

Cari_apotik1 PROCEDURE                                     ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(GApotik)
                       PROJECT(GAPO:Kode_Apotik)
                       PROJECT(GAPO:Nama_Apotik)
                       PROJECT(GAPO:Keterangan)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GAPO:Kode_Apotik       LIKE(GAPO:Kode_Apotik)         !List box control field - type derived from field
GAPO:Nama_Apotik       LIKE(GAPO:Nama_Apotik)         !List box control field - type derived from field
GAPO:Keterangan        LIKE(GAPO:Keterangan)          !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Tabel Sub-Instalasi Farmasi'),AT(,,216,170),FONT('MS Sans Serif',8,COLOR:Black,),IMM,HLP('Cari_apotik'),SYSTEM,GRAY,RESIZE
                       LIST,AT(8,24,200,105),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('48L(2)|M~Kode Sub~@s5@80L(2)|M~Nama Sub-Farmasi~@s30@80L(2)|M~Keterangan~@s20@'),FROM(Queue:Browse:1)
                       SHEET,AT(4,4,208,135),USE(?CurrentTab)
                         TAB('Kode Sub-Farmasi (F2)'),USE(?Tab:2),COLOR(0DF64CAH)
                           BUTTON('&Pilih'),AT(152,140,55,25),USE(?Select:2),LEFT,ICON(ICON:Tick)
                         END
                         TAB('Nama Sub_Farmasi (F3)'),USE(?Tab:3),COLOR(0B160D9H)
                         END
                       END
                       BUTTON('&Keluar'),AT(18,142,64,25),USE(?Close),HIDE,LEFT
                       BUTTON('Help'),AT(159,0,45,14),USE(?Help),HIDE,STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW1::Sort1:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('Cari_apotik1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo:akses',glo:akses)                              ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:GApotik.SetOpenRelated()
  Relate:GApotik.Open                                      ! File GApotik used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GApotik,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon GAPO:Nama_Apotik for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,GAPO:KeyNama)    ! Add the sort order for GAPO:KeyNama for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,GAPO:Nama_Apotik,1,BRW1)       ! Initialize the browse locator using  using key: GAPO:KeyNama , GAPO:Nama_Apotik
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon GAPO:Kode_Apotik for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,GAPO:KeyNoApotik) ! Add the sort order for GAPO:KeyNoApotik for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,GAPO:Kode_Apotik,1,BRW1)       ! Initialize the browse locator using  using key: GAPO:KeyNoApotik , GAPO:Kode_Apotik
  BRW1.SetFilter('(GAPO:keterangan=glo:akses)')            ! Apply filter expression to browse
  BRW1.AddField(GAPO:Kode_Apotik,BRW1.Q.GAPO:Kode_Apotik)  ! Field GAPO:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GAPO:Nama_Apotik,BRW1.Q.GAPO:Nama_Apotik)  ! Field GAPO:Nama_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GAPO:Keterangan,BRW1.Q.GAPO:Keterangan)    ! Field GAPO:Keterangan is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Cari_apotik1',QuickWindow)                 ! Restore window settings from non-volatile store
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
    Relate:GApotik.Close
  END
  IF SELF.Opened
    INIMgr.Update('Cari_apotik1',QuickWindow)              ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeSelected PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all Selected events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE FIELD()
    OF ?Browse:1
      IF RECORDS(GApotik) = 0 THEN
      !   LOCK(GApotik,1)            !Lock the iSetupap file, try 1 second
      !   IF ERRORCODE() = 32             !If someone else has it
      !        RETURN 0
      !   END
         GAPO:Kode_Apotik = 'FM01'
         GAPO:Nama_Apotik = 'Farmasi pusat'
         GAPO:Keterangan = 'Default Dari setup'
         ADD(GApotik)
      !   UNLOCK( GApotik )
      !   COMMIT
         BRW1.ResetSort(1)
      END
    END
  ReturnValue = PARENT.TakeSelected()
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
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

EntryApotikFilter PROCEDURE                                ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
I                    BYTE                                  !
ST_simpan1           BYTE                                  !
St_simpan2           BYTE                                  !
putar                BYTE                                  !
window               WINDOW('Pendaftaran Layanan Apotik'),AT(,,185,92),FONT('Times New Roman',10,COLOR:Black,),CENTER,GRAY
                       PROMPT('Kode Apotik :'),AT(41,32),USE(?GL_entryapotik:Prompt)
                       ENTRY(@s5),AT(95,30),USE(GL_entryapotik),MSG('kode apotik'),TIP('kode apotik')
                       STRING('Masukkan Kode  Apotik'),AT(43,9,101,10),USE(?String1)
                       BUTTON('&H'),AT(131,30,12,12),USE(?CallLookup),FONT('Times New Roman',10,,),KEY(F2Key)
                       STRING(@s30),AT(39,47),USE(GAPO:Nama_Apotik),FONT(,,,FONT:bold)
                       BUTTON('&OK'),AT(103,67,35,20),USE(?OkButton),DEFAULT
                       PANEL,AT(16,24,160,41),USE(?Panel1)
                       BUTTON('&Batal'),AT(145,67,35,20),USE(?CancelButton)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass

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
  GlobalErrors.SetProcedureName('EntryApotikFilter')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GL_entryapotik:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AAwalBln.Open                                     ! File AAwalBln used by this procedure, so make sure it's RelationManager is open
  Relate:GApotik.SetOpenRelated()
  Relate:GApotik.Open                                      ! File AAwalBln used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('EntryApotikFilter',window)                 ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAwalBln.Close
    Relate:GApotik.Close
  END
  IF SELF.Opened
    INIMgr.Update('EntryApotikFilter',window)              ! Save window data to non-volatile store
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
    Cari_apotik1
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
    OF ?OkButton
      if clip(GL_entryapotik) = '' then
          message('Isi sub Farmasi....!')
          cycle
      end
      GL_entryapotik = UPPER(GL_entryapotik)
      GAPO:Kode_Apotik=GL_entryapotik
      GET(GApotik,GAPO:KeyNoApotik)
      if errorCode() > 0  Then
        HALT
      end
      GL_namaapotik=GAPO:Nama_Apotik
      
      !AAWL:Kode_apotik= GL_entryapotik
      !AAWL:Bulan      = MONTH(TODAY())
      !GET(AAwalBln,AAWL:key_bln_aptk)
      !IF ERRORCODE()
      !   IsiAwalBulan
      !ELSE
      !   putar = 1
      !   IF AAWL:status <> 1
      !      St_simpan1 = AAWL:status
      !      LOOP
      !         LOOP I= 1 TO 500.
      !         AAWL:Kode_apotik= GL_entryapotik
      !         AAWL:Bulan      = MONTH(TODAY())
      !         GET(AAwalBln,AAWL:key_bln_aptk)
      !         St_simpan2 = AAWL:status
      !         IF St_simpan2 = 1
      !            BREAK
      !         ELSE
      !            IF St_simpan1 = St_simpan2
      !               if putar < 5
      !                  putar = putar + 1
      !                  cycle
      !               else
      !                  IsiAwalBulan()
      !                  BREAK
      !               end
      !            ELSE
      !               MESSAGE('User lain Sedang Proses Awal Bulan, Coba 5 Menit Lagi')
      !               HALT
      !            END
      !         END
      !      END
      !   END
      !END
      BREAK
    OF ?CancelButton
      HALT
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?GL_entryapotik
      IF GL_entryapotik OR ?GL_entryapotik{Prop:Req}
        GAPO:Kode_Apotik = GL_entryapotik
        IF Access:GApotik.TryFetch(GAPO:KeyNoApotik)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            GL_entryapotik = GAPO:Kode_Apotik
          ELSE
            SELECT(?GL_entryapotik)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      GAPO:Kode_Apotik = GL_entryapotik
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        GL_entryapotik = GAPO:Kode_Apotik
      END
      ThisWindow.Reset(1)
      GLO:INSDIGUNAKAN=GAPO:Keterangan
      display
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

LoginBoxEsc PROCEDURE                                      ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
VL_Password          STRING(10)                            !
VL_TryLogin          BYTE                                  !
Showtime             ULONG                                 !
jum                  USHORT                                !
str1                 STRING(30)                            !
Loc:Password         STRING(20)                            !
Loc:I                ULONG                                 !
Loc:Huruf            STRING(20)                            !
Loc:J                ULONG                                 !
loc:ada              BYTE                                  !
loc:pas              STRING(20)                            !
window               WINDOW('Pemeriksaan Password '),AT(,,204,88),FONT('Times New Roman',10,,FONT:bold),CENTER,ALRT(EscKey),CENTERED,GRAY,DOUBLE
                       ENTRY(@s20),AT(70,15,88,10),USE(VG_USER),UPR
                       ENTRY(@s20),AT(71,34,,10),USE(Loc:Password),PASSWORD
                       BUTTON('&OK'),AT(15,57,62,26),USE(?OkButton),LEFT,FONT('Times New Roman',10,COLOR:Black,FONT:bold),ICON('SECUR05.ICO'),DEFAULT,REPEAT(3),DELAY(268)
                       BUTTON('&Batal'),AT(131,58,62,25),USE(?CancelButton),LEFT,FONT('Arial',9,COLOR:Black,FONT:bold+FONT:italic),ICON(ICON:Hand)
                       PANEL,AT(1,4,202,47),USE(?Panel1),BEVEL(1)
                       IMAGE('MISC28.ICO'),AT(7,10,19,18),USE(?Image4)
                       IMAGE('RSI2.BMP'),AT(92,58,27,25),USE(?Image1)
                       IMAGE('SECUR08.ICO'),AT(170,33,21,16),USE(?Image2)
                       PROMPT('Pemakai:'),AT(32,17),USE(?VL_User:Prompt),FONT('Arial',10,COLOR:Black,FONT:bold+FONT:italic)
                       IMAGE('SECUR02B.ICO'),AT(7,30),USE(?Image3)
                       PROMPT('Password:'),AT(32,36),USE(?VL_Password:Prompt),FONT('Arial',10,COLOR:Black,FONT:bold+FONT:italic)
                       IMAGE('SMCROSS.ICO'),AT(170,32),USE(?Image6)
                       PANEL,AT(1,53,202,33),USE(?Panel2),BEVEL(1)
                       IMAGE('SECUR02A.ICO'),AT(7,30),USE(?Image5)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass

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
  GlobalErrors.SetProcedureName('LoginBoxEsc')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?VG_USER
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:JPASSWRD.SetOpenRelated()
  Relate:JPASSWRD.Open                                     ! File JPASSWRD used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('LoginBoxEsc',window)                       ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:JPASSWRD.Close
  END
  IF SELF.Opened
    INIMgr.Update('LoginBoxEsc',window)                    ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
    OF ?OkButton
      Loc:Pas = Clip(Loc:Password)&Clip(Glo:Kunci1)
      !Loop Loc:I=1 to Len(Clip(Loc:Password))
      Loop Loc:I=1 to 10
          Loc:J = Val(Sub(Loc:Pas,Loc:I,1)) + Val(Sub(GLo:Kunci,Loc:I,1))
          !Loc:J = (26 - Loc:J % 26 ) + 96
          Loc:Huruf[Loc:I] = CHR(Loc:J)
      end
      
      !If Glo:Flag > 3 then
      !   Beep
      !   Halt(0,'Batas Kesalahan 3X (Program DIPROTEK)....!, Hub : MIS/EDP')
      !end
      
      JPSW:ID=Clip(Loc:Huruf)
      !Access:JPasswrd.Fetch(JPSW:KeyId)
      Set( JPSW:KeyId, JPSW:KeyId )
      If not errorcode() then
          !kemungkinan password sama tapi nama beda
          !Loc:Huruf = JPSW:ID
          Loc:ada=0
          Loop
              Next(JPasswrd)
              If Errorcode() Then Break.
              If JPSW:ID = Loc:Huruf Then
                  If Clip(JPSW:User_Id) = Clip(VG_USER) then
                      If Clip(JPSW:Bagian) = 'FARMASI' or JPSW:Level = 0 or JPSW:Level = 1       then
                         Glo:Level = JPSW:Level
                         Glo:Akses = JPSW:Akses
                         Glo:Bagian = JPSW:Bagian
                         Glo:Jam = CLock()
                         Loc:ada=1
                         Glo:USER_ID = JPSW:Prefix
                         Break
                      End
                  End
              Else
                  Break
              End
          End
          If Loc:ada = 1 Then
              Break
          Else
              Beep
              Message('Anda Tidak Diperbolehkan Mengakses Program ini..!, Hub:MIS/EDP','  Peringatan',Icon:Exclamation)
              Clear(loc:Huruf)
              Glo:Flag += 1
              cycle
          End
      else
          Beep
          Message('Password Tidak Ditemukan..!','  Peringatan',Icon:Exclamation)
          Select(?Loc:Password)
      End
    OF ?CancelButton
      Beep
      Halt(0,'Akses Program Dibatalkan...!')
    END
  ReturnValue = PARENT.TakeAccepted()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE EVENT()
    OF EVENT:AlertKey
      case event()
      of event:alertkey
          if keycode() = EscKey
              Beep
              HALT(0,'Akses Program Dibatalkan !')
          end
      end
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

