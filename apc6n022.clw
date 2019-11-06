

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N022.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N007.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N018.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N021.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N023.INC'),ONCE        !Req'd for module callout resolution
                     END


BrowseBarangKeluarPerBarang PROCEDURE                      ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(GBarang)
                       PROJECT(GBAR:Kode_brg)
                       PROJECT(GBAR:Nama_Brg)
                       PROJECT(GBAR:Jenis_Brg)
                       PROJECT(GBAR:No_Satuan)
                       PROJECT(GBAR:Dosis)
                       PROJECT(GBAR:Stok_Total)
                       PROJECT(GBAR:Kode_UPF)
                       PROJECT(GBAR:Kode_Apotik)
                       PROJECT(GBAR:Kelompok)
                       PROJECT(GBAR:Kode_Asli)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Jenis_Brg         LIKE(GBAR:Jenis_Brg)           !List box control field - type derived from field
GBAR:No_Satuan         LIKE(GBAR:No_Satuan)           !List box control field - type derived from field
GBAR:Dosis             LIKE(GBAR:Dosis)               !List box control field - type derived from field
GBAR:Stok_Total        LIKE(GBAR:Stok_Total)          !List box control field - type derived from field
GBAR:Kode_UPF          LIKE(GBAR:Kode_UPF)            !List box control field - type derived from field
GBAR:Kode_Apotik       LIKE(GBAR:Kode_Apotik)         !List box control field - type derived from field
GBAR:Kelompok          LIKE(GBAR:Kelompok)            !List box control field - type derived from field
GBAR:Kode_Asli         LIKE(GBAR:Kode_Asli)           !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW4::View:Browse    VIEW(APDTRANS)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Total)
                       PROJECT(APD:Harga_Dasar)
                       PROJECT(APD:Diskon)
                       PROJECT(APD:N0_tran)
                       PROJECT(APD:Camp)
                       JOIN(APH:by_transaksi,APD:N0_tran)
                         PROJECT(APH:Kode_Apotik)
                         PROJECT(APH:Tanggal)
                         PROJECT(APH:N0_tran)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
APH:Kode_Apotik        LIKE(APH:Kode_Apotik)          !List box control field - type derived from field
APH:Tanggal            LIKE(APH:Tanggal)              !List box control field - type derived from field
APD:Kode_brg           LIKE(APD:Kode_brg)             !List box control field - type derived from field
APD:Jumlah             LIKE(APD:Jumlah)               !List box control field - type derived from field
APD:Total              LIKE(APD:Total)                !List box control field - type derived from field
APD:Harga_Dasar        LIKE(APD:Harga_Dasar)          !List box control field - type derived from field
APD:Diskon             LIKE(APD:Diskon)               !List box control field - type derived from field
APD:N0_tran            LIKE(APD:N0_tran)              !List box control field - type derived from field
APD:Camp               LIKE(APD:Camp)                 !Primary key field - type derived from field
APH:N0_tran            LIKE(APH:N0_tran)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Barang ...'),AT(,,358,300),FONT('Arial',8,,),IMM,HLP('BrowseBarangKeluarPerBarang'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,342,124),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('48L(2)|M~Kode Barang~L(2)@s10@80L(2)|M~Nama Obat~L(2)@s40@40L(2)|M~Jenis Brg~L(2' &|
   ')@s5@44L(2)|M~Satuan~L(2)@s10@32R(2)|M~Dosis~C(0)@n7@76D(24)|M~Stok Total~C(0)@n' &|
   '18.2@44L(2)|M~Kode UPF~L(2)@s10@48L(2)|M~Kode Apotik~L(2)@s5@36R(2)|M~Kelompok~C' &|
   '(0)@n6@'),FROM(Queue:Browse:1)
                       LIST,AT(8,169,342,124),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('20L|M~Kode Apotik~@s5@44L|M~Tanggal~@D8@57L|M~Kode Barang~@s10@44D|M~Jumlah~L@n-' &|
   '11.2@48R|M~Total~L@n-15.2@44D|M~Harga Dasar~L@n-14.2@60D|M~Diskon~L@n15.2@69L|M~' &|
   'N 0 tran~@s15@'),FROM(Queue:Browse)
                       SHEET,AT(4,4,350,162),USE(?CurrentTab)
                         TAB('Kode Barang'),USE(?Tab:2)
                           PROMPT('Kode Barang:'),AT(9,149),USE(?GBAR:Kode_brg:Prompt)
                           ENTRY(@s10),AT(59,149,60,10),USE(GBAR:Kode_brg),MSG('Kode Barang'),TIP('Kode Barang')
                         END
                         TAB('Nama Barang'),USE(?Tab:3)
                           PROMPT('Nama Obat:'),AT(9,150),USE(?GBAR:Nama_Brg:Prompt)
                           ENTRY(@s40),AT(59,150,60,10),USE(GBAR:Nama_Brg),MSG('Nama Barang'),TIP('Nama Barang')
                         END
                         TAB('GBAR:KeyKodeUPF'),USE(?Tab:4)
                           BUTTON('Select JUPF'),AT(8,148,94,14),USE(?SelectJUPF)
                         END
                         TAB('GBAR:KeyKodeKelompok'),USE(?Tab:5)
                           BUTTON('Select GBarKel'),AT(8,148,94,14),USE(?SelectGBarKel)
                         END
                         TAB('GBAR:KeyKodeAsliBrg'),USE(?Tab:6)
                         END
                       END
                       BUTTON('Close'),AT(260,548,45,14),USE(?Close)
                       BUTTON('Help'),AT(309,548,45,14),USE(?Help),STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
BRW4                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
                     END

BRW4::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
  GlobalErrors.SetProcedureName('BrowseBarangKeluarPerBarang')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  globalrequest=selectrecord
  SelectApotik()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo:apotik',glo:apotik)                            ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:APDTRANS.SetOpenRelated()
  Relate:APDTRANS.Open                                     ! File JUPF used by this procedure, so make sure it's RelationManager is open
  Access:GBarKel.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GBarUPF.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GPBF.UseFile                                      ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JUPF.UseFile                                      ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GBarang,SELF) ! Initialize the browse manager
  BRW4.Init(?List,Queue:Browse.ViewPosition,BRW4::View:Browse,Queue:Browse,Relate:APDTRANS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,GBAR:KeyNama)                         ! Add the sort order for GBAR:KeyNama for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?GBAR:Nama_Brg,GBAR:Nama_Brg,,BRW1) ! Initialize the browse locator using ?GBAR:Nama_Brg using key: GBAR:KeyNama , GBAR:Nama_Brg
  BRW1.AddSortOrder(,GBAR:KeyKodeUPF)                      ! Add the sort order for GBAR:KeyKodeUPF for sort order 2
  BRW1.AddSortOrder(,GBAR:KeyKodeKelompok)                 ! Add the sort order for GBAR:KeyKodeKelompok for sort order 3
  BRW1.AddSortOrder(,GBAR:KeyKodeAsliBrg)                  ! Add the sort order for GBAR:KeyKodeAsliBrg for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,GBAR:Kode_Asli,1,BRW1)         ! Initialize the browse locator using  using key: GBAR:KeyKodeAsliBrg , GBAR:Kode_Asli
  BRW1.AddSortOrder(,GBAR:KeyKodeBrg)                      ! Add the sort order for GBAR:KeyKodeBrg for sort order 5
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort0:Locator.Init(?GBAR:Kode_brg,GBAR:Kode_brg,,BRW1) ! Initialize the browse locator using ?GBAR:Kode_brg using key: GBAR:KeyKodeBrg , GBAR:Kode_brg
  BRW1.AddField(GBAR:Kode_brg,BRW1.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Nama_Brg,BRW1.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Jenis_Brg,BRW1.Q.GBAR:Jenis_Brg)      ! Field GBAR:Jenis_Brg is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:No_Satuan,BRW1.Q.GBAR:No_Satuan)      ! Field GBAR:No_Satuan is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Dosis,BRW1.Q.GBAR:Dosis)              ! Field GBAR:Dosis is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Stok_Total,BRW1.Q.GBAR:Stok_Total)    ! Field GBAR:Stok_Total is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Kode_UPF,BRW1.Q.GBAR:Kode_UPF)        ! Field GBAR:Kode_UPF is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Kode_Apotik,BRW1.Q.GBAR:Kode_Apotik)  ! Field GBAR:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Kelompok,BRW1.Q.GBAR:Kelompok)        ! Field GBAR:Kelompok is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Kode_Asli,BRW1.Q.GBAR:Kode_Asli)      ! Field GBAR:Kode_Asli is a hot field or requires assignment from browse
  BRW4.Q &= Queue:Browse
  BRW4.AddSortOrder(,APD:by_kodebrg)                       ! Add the sort order for APD:by_kodebrg for sort order 1
  BRW4.AddRange(APD:Kode_brg,Relate:APDTRANS,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW4.AddLocator(BRW4::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW4::Sort0:Locator.Init(,APD:Kode_brg,,BRW4)            ! Initialize the browse locator using  using key: APD:by_kodebrg , APD:Kode_brg
  BRW4.SetFilter('(APH:Kode_Apotik=glo:apotik)')           ! Apply filter expression to browse
  BRW4.AddField(APH:Kode_Apotik,BRW4.Q.APH:Kode_Apotik)    ! Field APH:Kode_Apotik is a hot field or requires assignment from browse
  BRW4.AddField(APH:Tanggal,BRW4.Q.APH:Tanggal)            ! Field APH:Tanggal is a hot field or requires assignment from browse
  BRW4.AddField(APD:Kode_brg,BRW4.Q.APD:Kode_brg)          ! Field APD:Kode_brg is a hot field or requires assignment from browse
  BRW4.AddField(APD:Jumlah,BRW4.Q.APD:Jumlah)              ! Field APD:Jumlah is a hot field or requires assignment from browse
  BRW4.AddField(APD:Total,BRW4.Q.APD:Total)                ! Field APD:Total is a hot field or requires assignment from browse
  BRW4.AddField(APD:Harga_Dasar,BRW4.Q.APD:Harga_Dasar)    ! Field APD:Harga_Dasar is a hot field or requires assignment from browse
  BRW4.AddField(APD:Diskon,BRW4.Q.APD:Diskon)              ! Field APD:Diskon is a hot field or requires assignment from browse
  BRW4.AddField(APD:N0_tran,BRW4.Q.APD:N0_tran)            ! Field APD:N0_tran is a hot field or requires assignment from browse
  BRW4.AddField(APD:Camp,BRW4.Q.APD:Camp)                  ! Field APD:Camp is a hot field or requires assignment from browse
  BRW4.AddField(APH:N0_tran,BRW4.Q.APH:N0_tran)            ! Field APH:N0_tran is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseBarangKeluarPerBarang',QuickWindow)  ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW4.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW4.ToolbarItem.HelpButton = ?Help
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseBarangKeluarPerBarang',QuickWindow) ! Save window data to non-volatile store
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?SelectJUPF
      ThisWindow.Update
      GlobalRequest = SelectRecord
      SelectJUPF
      ThisWindow.Reset
    OF ?SelectGBarKel
      ThisWindow.Update
      GlobalRequest = SelectRecord
      SelectGBarKel
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


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSIF CHOICE(?CurrentTab) = 5
    RETURN SELF.SetSort(4,Force)
  ELSE
    RETURN SELF.SetSort(5,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW4.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

SelectJUPF PROCEDURE                                       ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(JUPF)
                       PROJECT(JUPF:Kode_UPF)
                       PROJECT(JUPF:Nama_UPF)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
JUPF:Kode_UPF          LIKE(JUPF:Kode_UPF)            !List box control field - type derived from field
JUPF:Nama_UPF          LIKE(JUPF:Nama_UPF)            !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a JUPF Record'),AT(,,158,198),FONT('Arial',8,,),IMM,HLP('SelectJUPF'),SYSTEM,GRAY,MDI
                       LIST,AT(8,30,142,124),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('44L(2)|M~Kode UPF~L(2)@s10@80L(2)|M~Deskripsi~L(2)@s30@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(105,158,45,14),USE(?Select:2)
                       SHEET,AT(4,4,150,172),USE(?CurrentTab)
                         TAB('JUPF:KeyKodeUpf'),USE(?Tab:2)
                         END
                         TAB('JUPF:KeyNamaUpf'),USE(?Tab:3)
                         END
                       END
                       BUTTON('Close'),AT(60,180,45,14),USE(?Close)
                       BUTTON('Help'),AT(109,180,45,14),USE(?Help),STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
  GlobalErrors.SetProcedureName('SelectJUPF')
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
  Relate:JUPF.Open                                         ! File JUPF used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:JUPF,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,JUPF:KeyNamaUpf)                      ! Add the sort order for JUPF:KeyNamaUpf for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,JUPF:Nama_UPF,,BRW1)           ! Initialize the browse locator using  using key: JUPF:KeyNamaUpf , JUPF:Nama_UPF
  BRW1.AddSortOrder(,JUPF:KeyKodeUpf)                      ! Add the sort order for JUPF:KeyKodeUpf for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,JUPF:Kode_UPF,,BRW1)           ! Initialize the browse locator using  using key: JUPF:KeyKodeUpf , JUPF:Kode_UPF
  BRW1.AddField(JUPF:Kode_UPF,BRW1.Q.JUPF:Kode_UPF)        ! Field JUPF:Kode_UPF is a hot field or requires assignment from browse
  BRW1.AddField(JUPF:Nama_UPF,BRW1.Q.JUPF:Nama_UPF)        ! Field JUPF:Nama_UPF is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectJUPF',QuickWindow)                   ! Restore window settings from non-volatile store
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
    Relate:JUPF.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectJUPF',QuickWindow)                ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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

SelectJDokter PROCEDURE                                    ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(JDokter)
                       PROJECT(JDok:Kode_Dokter)
                       PROJECT(JDok:Nama_Dokter)
                       PROJECT(JDok:Status)
                       PROJECT(JDok:Keterangan)
                       PROJECT(JDok:Tlp_Rumah)
                       PROJECT(JDok:Tlp_Tmp_Praktek)
                       PROJECT(JDok:TANGGAL)
                       PROJECT(JDok:JAM)
                       PROJECT(JDok:USER)
                       PROJECT(JDok:status_mitra_pengantar)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
JDok:Kode_Dokter       LIKE(JDok:Kode_Dokter)         !List box control field - type derived from field
JDok:Nama_Dokter       LIKE(JDok:Nama_Dokter)         !List box control field - type derived from field
JDok:Status            LIKE(JDok:Status)              !List box control field - type derived from field
JDok:Keterangan        LIKE(JDok:Keterangan)          !List box control field - type derived from field
JDok:Tlp_Rumah         LIKE(JDok:Tlp_Rumah)           !List box control field - type derived from field
JDok:Tlp_Tmp_Praktek   LIKE(JDok:Tlp_Tmp_Praktek)     !List box control field - type derived from field
JDok:TANGGAL           LIKE(JDok:TANGGAL)             !List box control field - type derived from field
JDok:JAM               LIKE(JDok:JAM)                 !List box control field - type derived from field
JDok:USER              LIKE(JDok:USER)                !List box control field - type derived from field
JDok:status_mitra_pengantar LIKE(JDok:status_mitra_pengantar) !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a JDokter Record'),AT(,,358,188),FONT('Arial',8,,),IMM,HLP('SelectJDokter'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,342,124),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('32L(2)|M~KODE_DR~L(2)@s5@80L(2)|M~NAMA_DR~L(2)@s30@44L(2)|M~Status~L(2)@s10@80L(' &|
   '2)|M~Keterangan~L(2)@s30@80L(2)|M~Tlp Rumah~L(2)@s20@80L(2)|M~Tlp Tmp Praktek~L(' &|
   '2)@s20@60R(2)|M~TANGGAL~C(0)@n-13@60R(2)|M~JAM~C(0)@n-13@80L(2)|M~USER~L(2)@s20@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(305,148,45,14),USE(?Select:2)
                       SHEET,AT(4,4,350,162),USE(?CurrentTab)
                         TAB('JDok:KeyKodeDokter'),USE(?Tab:2)
                         END
                         TAB('JDok:KeyNamaDokter'),USE(?Tab:3)
                         END
                         TAB('JDok:KeyStatus'),USE(?Tab:4)
                         END
                         TAB('JDok:Kstatusmitra'),USE(?Tab:5)
                         END
                       END
                       BUTTON('Close'),AT(260,170,45,14),USE(?Close)
                       BUTTON('Help'),AT(309,170,45,14),USE(?Help),STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
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
  GlobalErrors.SetProcedureName('SelectJDokter')
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
  Relate:JDokter.Open                                      ! File JDokter used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:JDokter,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,JDok:KeyNamaDokter)                   ! Add the sort order for JDok:KeyNamaDokter for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,JDok:Nama_Dokter,,BRW1)        ! Initialize the browse locator using  using key: JDok:KeyNamaDokter , JDok:Nama_Dokter
  BRW1.AddSortOrder(,JDok:KeyStatus)                       ! Add the sort order for JDok:KeyStatus for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,JDok:Status,,BRW1)             ! Initialize the browse locator using  using key: JDok:KeyStatus , JDok:Status
  BRW1.AddSortOrder(,JDok:Kstatusmitra)                    ! Add the sort order for JDok:Kstatusmitra for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,JDok:status_mitra_pengantar,1,BRW1) ! Initialize the browse locator using  using key: JDok:Kstatusmitra , JDok:status_mitra_pengantar
  BRW1.AddSortOrder(,JDok:KeyKodeDokter)                   ! Add the sort order for JDok:KeyKodeDokter for sort order 4
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort0:Locator.Init(,JDok:Kode_Dokter,,BRW1)        ! Initialize the browse locator using  using key: JDok:KeyKodeDokter , JDok:Kode_Dokter
  BRW1.AddField(JDok:Kode_Dokter,BRW1.Q.JDok:Kode_Dokter)  ! Field JDok:Kode_Dokter is a hot field or requires assignment from browse
  BRW1.AddField(JDok:Nama_Dokter,BRW1.Q.JDok:Nama_Dokter)  ! Field JDok:Nama_Dokter is a hot field or requires assignment from browse
  BRW1.AddField(JDok:Status,BRW1.Q.JDok:Status)            ! Field JDok:Status is a hot field or requires assignment from browse
  BRW1.AddField(JDok:Keterangan,BRW1.Q.JDok:Keterangan)    ! Field JDok:Keterangan is a hot field or requires assignment from browse
  BRW1.AddField(JDok:Tlp_Rumah,BRW1.Q.JDok:Tlp_Rumah)      ! Field JDok:Tlp_Rumah is a hot field or requires assignment from browse
  BRW1.AddField(JDok:Tlp_Tmp_Praktek,BRW1.Q.JDok:Tlp_Tmp_Praktek) ! Field JDok:Tlp_Tmp_Praktek is a hot field or requires assignment from browse
  BRW1.AddField(JDok:TANGGAL,BRW1.Q.JDok:TANGGAL)          ! Field JDok:TANGGAL is a hot field or requires assignment from browse
  BRW1.AddField(JDok:JAM,BRW1.Q.JDok:JAM)                  ! Field JDok:JAM is a hot field or requires assignment from browse
  BRW1.AddField(JDok:USER,BRW1.Q.JDok:USER)                ! Field JDok:USER is a hot field or requires assignment from browse
  BRW1.AddField(JDok:status_mitra_pengantar,BRW1.Q.JDok:status_mitra_pengantar) ! Field JDok:status_mitra_pengantar is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectJDokter',QuickWindow)                ! Restore window settings from non-volatile store
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
    Relate:JDokter.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectJDokter',QuickWindow)             ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSE
    RETURN SELF.SetSort(4,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

BrowseJTransaksi PROCEDURE                                 ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(JTransaksi)
                       PROJECT(JTra:Nomor_Mr)
                       PROJECT(JTra:Tanggal)
                       PROJECT(JTra:Baru_Lama)
                       PROJECT(JTra:Kode_poli)
                       PROJECT(JTra:Kode_dokter)
                       PROJECT(JTra:BiayaRSI)
                       PROJECT(JTra:BiayaDokter)
                       PROJECT(JTra:BiayaTotal)
                       PROJECT(JTra:Kode_Transaksi)
                       PROJECT(JTra:No_Nota)
                       PROJECT(JTra:Rujukan)
                       PROJECT(JTra:Selesai)
                       PROJECT(JTra:Cetak)
                       PROJECT(JTra:NIP)
                       PROJECT(JTra:Kontraktor)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
JTra:Nomor_Mr          LIKE(JTra:Nomor_Mr)            !List box control field - type derived from field
JTra:Tanggal           LIKE(JTra:Tanggal)             !List box control field - type derived from field
JTra:Baru_Lama         LIKE(JTra:Baru_Lama)           !List box control field - type derived from field
JTra:Kode_poli         LIKE(JTra:Kode_poli)           !List box control field - type derived from field
JTra:Kode_dokter       LIKE(JTra:Kode_dokter)         !List box control field - type derived from field
JTra:BiayaRSI          LIKE(JTra:BiayaRSI)            !List box control field - type derived from field
JTra:BiayaDokter       LIKE(JTra:BiayaDokter)         !List box control field - type derived from field
JTra:BiayaTotal        LIKE(JTra:BiayaTotal)          !List box control field - type derived from field
JTra:Kode_Transaksi    LIKE(JTra:Kode_Transaksi)      !List box control field - type derived from field
JTra:No_Nota           LIKE(JTra:No_Nota)             !Primary key field - type derived from field
JTra:Rujukan           LIKE(JTra:Rujukan)             !Browse key field - type derived from field
JTra:Selesai           LIKE(JTra:Selesai)             !Browse key field - type derived from field
JTra:Cetak             LIKE(JTra:Cetak)               !Browse key field - type derived from field
JTra:NIP               LIKE(JTra:NIP)                 !Browse key field - type derived from field
JTra:Kontraktor        LIKE(JTra:Kontraktor)          !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the JTransaksi File'),AT(,,358,208),FONT('Arial',8,,),IMM,HLP('BrowseJTransaksi'),SYSTEM,GRAY,MDI
                       LIST,AT(8,42,342,124),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('80R(2)|M~Nomor Mr~C(0)@N010_@80R(2)|M~Tanggal~C(0)@D06@40L(2)|M~Baru Lama~L(2)@s' &|
   '1@44L(2)|M~Kode poli~L(2)@s10@48L(2)|M~Kode dokter~L(2)@s10@60D(18)|M~Biaya RSI~' &|
   'C(0)@n14.2@60D(12)|M~Biaya Dokter~C(0)@n14.2@60D(14)|M~Biaya Total~C(0)@n14.2@60' &|
   'R(2)|M~Kode Transaksi~C(0)@n1@'),FROM(Queue:Browse:1)
                       SHEET,AT(4,4,350,182),USE(?CurrentTab)
                         TAB('JTra:KeyNomorMr'),USE(?Tab:2)
                           BUTTON('Select JPasien'),AT(8,168,94,14),USE(?SelectJPasien)
                         END
                         TAB('JTra:KeyKodeDokter'),USE(?Tab:3)
                           BUTTON('Select JDokter'),AT(8,168,94,14),USE(?SelectJDokter)
                         END
                         TAB('JTra:KeyRujukan'),USE(?Tab:4)
                           BUTTON('Select JRujuk'),AT(8,168,94,14),USE(?SelectJRujuk)
                         END
                         TAB('JTra:KeyKodePoli'),USE(?Tab:5)
                           BUTTON('Select JTindaka'),AT(8,168,94,14),USE(?SelectJTindaka)
                         END
                         TAB('JTra:KeyTanggal'),USE(?Tab:6)
                         END
                         TAB('JTra:KeyNoNota'),USE(?Tab:7)
                         END
                         TAB('JTra:KeySelesai'),USE(?Tab:8)
                         END
                         TAB('JTra:KeyCetak'),USE(?Tab:9)
                         END
                         TAB('JTra:KeyTransaksi'),USE(?Tab:10)
                           BUTTON('Select JTbTransaksi'),AT(8,168,94,14),USE(?SelectJTbTransaksi)
                         END
                         TAB('JTra:Pegawai_JTransaksi_FK'),USE(?Tab:11)
                           BUTTON('Select SMPegawai'),AT(8,168,94,14),USE(?SelectSMPegawai)
                         END
                         TAB('JTra:Kontraktor_JTransaksi_FK'),USE(?Tab:12)
                           BUTTON('Select JKontrak'),AT(8,168,94,14),USE(?SelectJKontrak)
                         END
                       END
                       BUTTON('Close'),AT(260,190,45,14),USE(?Close)
                       BUTTON('Help'),AT(309,190,45,14),USE(?Help),STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
BRW1::Sort5:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 6
BRW1::Sort6:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 7
BRW1::Sort7:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 8
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
  GlobalErrors.SetProcedureName('BrowseJTransaksi')
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
  Relate:JDokter.Open                                      ! File SMPegawai used by this procedure, so make sure it's RelationManager is open
  Relate:JPTmpKel.Open                                     ! File SMPegawai used by this procedure, so make sure it's RelationManager is open
  Relate:JRujuk.Open                                       ! File SMPegawai used by this procedure, so make sure it's RelationManager is open
  Relate:JTbTransaksi.Open                                 ! File SMPegawai used by this procedure, so make sure it's RelationManager is open
  Relate:SMPegawai.SetOpenRelated()
  Relate:SMPegawai.Open                                    ! File SMPegawai used by this procedure, so make sure it's RelationManager is open
  Access:JKontrak.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPoli.UseFile                                     ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JTBayar.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JTindaka.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:JTransaksi,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,JTra:KeyKodeDokter)                   ! Add the sort order for JTra:KeyKodeDokter for sort order 1
  BRW1.AddSortOrder(,JTra:KeyRujukan)                      ! Add the sort order for JTra:KeyRujukan for sort order 2
  BRW1.AddSortOrder(,JTra:KeyKodePoli)                     ! Add the sort order for JTra:KeyKodePoli for sort order 3
  BRW1.AddSortOrder(,JTra:KeyTanggal)                      ! Add the sort order for JTra:KeyTanggal for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,JTra:Tanggal,1,BRW1)           ! Initialize the browse locator using  using key: JTra:KeyTanggal , JTra:Tanggal
  BRW1.AddSortOrder(,JTra:KeyNoNota)                       ! Add the sort order for JTra:KeyNoNota for sort order 5
  BRW1.AddLocator(BRW1::Sort5:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort5:Locator.Init(,JTra:No_Nota,1,BRW1)           ! Initialize the browse locator using  using key: JTra:KeyNoNota , JTra:No_Nota
  BRW1.AddSortOrder(,JTra:KeySelesai)                      ! Add the sort order for JTra:KeySelesai for sort order 6
  BRW1.AddLocator(BRW1::Sort6:Locator)                     ! Browse has a locator for sort order 6
  BRW1::Sort6:Locator.Init(,JTra:Selesai,1,BRW1)           ! Initialize the browse locator using  using key: JTra:KeySelesai , JTra:Selesai
  BRW1.AddSortOrder(,JTra:KeyCetak)                        ! Add the sort order for JTra:KeyCetak for sort order 7
  BRW1.AddLocator(BRW1::Sort7:Locator)                     ! Browse has a locator for sort order 7
  BRW1::Sort7:Locator.Init(,JTra:Cetak,1,BRW1)             ! Initialize the browse locator using  using key: JTra:KeyCetak , JTra:Cetak
  BRW1.AddSortOrder(,JTra:KeyTransaksi)                    ! Add the sort order for JTra:KeyTransaksi for sort order 8
  BRW1.AddSortOrder(,JTra:Pegawai_JTransaksi_FK)           ! Add the sort order for JTra:Pegawai_JTransaksi_FK for sort order 9
  BRW1.AddSortOrder(,JTra:Kontraktor_JTransaksi_FK)        ! Add the sort order for JTra:Kontraktor_JTransaksi_FK for sort order 10
  BRW1.AddSortOrder(,JTra:KeyNomorMr)                      ! Add the sort order for JTra:KeyNomorMr for sort order 11
  BRW1.AddRange(JTra:Nomor_Mr,Relate:JTransaksi,Relate:JPasien) ! Add file relationship range limit for sort order 11
  BRW1.AddField(JTra:Nomor_Mr,BRW1.Q.JTra:Nomor_Mr)        ! Field JTra:Nomor_Mr is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Tanggal,BRW1.Q.JTra:Tanggal)          ! Field JTra:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Baru_Lama,BRW1.Q.JTra:Baru_Lama)      ! Field JTra:Baru_Lama is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Kode_poli,BRW1.Q.JTra:Kode_poli)      ! Field JTra:Kode_poli is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Kode_dokter,BRW1.Q.JTra:Kode_dokter)  ! Field JTra:Kode_dokter is a hot field or requires assignment from browse
  BRW1.AddField(JTra:BiayaRSI,BRW1.Q.JTra:BiayaRSI)        ! Field JTra:BiayaRSI is a hot field or requires assignment from browse
  BRW1.AddField(JTra:BiayaDokter,BRW1.Q.JTra:BiayaDokter)  ! Field JTra:BiayaDokter is a hot field or requires assignment from browse
  BRW1.AddField(JTra:BiayaTotal,BRW1.Q.JTra:BiayaTotal)    ! Field JTra:BiayaTotal is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Kode_Transaksi,BRW1.Q.JTra:Kode_Transaksi) ! Field JTra:Kode_Transaksi is a hot field or requires assignment from browse
  BRW1.AddField(JTra:No_Nota,BRW1.Q.JTra:No_Nota)          ! Field JTra:No_Nota is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Rujukan,BRW1.Q.JTra:Rujukan)          ! Field JTra:Rujukan is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Selesai,BRW1.Q.JTra:Selesai)          ! Field JTra:Selesai is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Cetak,BRW1.Q.JTra:Cetak)              ! Field JTra:Cetak is a hot field or requires assignment from browse
  BRW1.AddField(JTra:NIP,BRW1.Q.JTra:NIP)                  ! Field JTra:NIP is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Kontraktor,BRW1.Q.JTra:Kontraktor)    ! Field JTra:Kontraktor is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseJTransaksi',QuickWindow)             ! Restore window settings from non-volatile store
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
    Relate:JDokter.Close
    Relate:JPTmpKel.Close
    Relate:JRujuk.Close
    Relate:JTbTransaksi.Close
    Relate:SMPegawai.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseJTransaksi',QuickWindow)          ! Save window data to non-volatile store
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?SelectJPasien
      ThisWindow.Update
      GlobalRequest = SelectRecord
      SelectJPasien
      ThisWindow.Reset
    OF ?SelectJDokter
      ThisWindow.Update
      GlobalRequest = SelectRecord
      SelectJDokter
      ThisWindow.Reset
    OF ?SelectJRujuk
      ThisWindow.Update
      GlobalRequest = SelectRecord
      SelectJRujuk
      ThisWindow.Reset
    OF ?SelectJTindaka
      ThisWindow.Update
      GlobalRequest = SelectRecord
      SelectJTindaka
      ThisWindow.Reset
    OF ?SelectJTbTransaksi
      ThisWindow.Update
      GlobalRequest = SelectRecord
      SelectJTbTransaksi
      ThisWindow.Reset
    OF ?SelectSMPegawai
      ThisWindow.Update
      GlobalRequest = SelectRecord
      SelectSMPegawai
      ThisWindow.Reset
    OF ?SelectJKontrak
      ThisWindow.Update
      GlobalRequest = SelectRecord
      SelectJKontrak
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


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSIF CHOICE(?CurrentTab) = 5
    RETURN SELF.SetSort(4,Force)
  ELSIF CHOICE(?CurrentTab) = 6
    RETURN SELF.SetSort(5,Force)
  ELSIF CHOICE(?CurrentTab) = 7
    RETURN SELF.SetSort(6,Force)
  ELSIF CHOICE(?CurrentTab) = 8
    RETURN SELF.SetSort(7,Force)
  ELSIF CHOICE(?CurrentTab) = 9
    RETURN SELF.SetSort(8,Force)
  ELSIF CHOICE(?CurrentTab) = 10
    RETURN SELF.SetSort(9,Force)
  ELSIF CHOICE(?CurrentTab) = 11
    RETURN SELF.SetSort(10,Force)
  ELSE
    RETURN SELF.SetSort(11,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

SelectJPasien PROCEDURE                                    ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(JPasien)
                       PROJECT(JPas:Nomor_mr)
                       PROJECT(JPas:Nama)
                       PROJECT(JPas:TanggalLahir)
                       PROJECT(JPas:Umur)
                       PROJECT(JPas:Umur_Bln)
                       PROJECT(JPas:Jenis_kelamin)
                       PROJECT(JPas:Alamat)
                       PROJECT(JPas:RT)
                       PROJECT(JPas:RW)
                       PROJECT(JPas:Kecamatan)
                       PROJECT(JPas:Kota)
                       PROJECT(JPas:kembali)
                       PROJECT(JPas:Tanggal)
                       PROJECT(JPas:Kelurahan)
                       PROJECT(JPas:Inap)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
JPas:Nomor_mr          LIKE(JPas:Nomor_mr)            !List box control field - type derived from field
JPas:Nama              LIKE(JPas:Nama)                !List box control field - type derived from field
JPas:TanggalLahir      LIKE(JPas:TanggalLahir)        !List box control field - type derived from field
JPas:Umur              LIKE(JPas:Umur)                !List box control field - type derived from field
JPas:Umur_Bln          LIKE(JPas:Umur_Bln)            !List box control field - type derived from field
JPas:Jenis_kelamin     LIKE(JPas:Jenis_kelamin)       !List box control field - type derived from field
JPas:Alamat            LIKE(JPas:Alamat)              !List box control field - type derived from field
JPas:RT                LIKE(JPas:RT)                  !List box control field - type derived from field
JPas:RW                LIKE(JPas:RW)                  !List box control field - type derived from field
JPas:Kecamatan         LIKE(JPas:Kecamatan)           !Browse key field - type derived from field
JPas:Kota              LIKE(JPas:Kota)                !Browse key field - type derived from field
JPas:kembali           LIKE(JPas:kembali)             !Browse key field - type derived from field
JPas:Tanggal           LIKE(JPas:Tanggal)             !Browse key field - type derived from field
JPas:Kelurahan         LIKE(JPas:Kelurahan)           !Browse key field - type derived from field
JPas:Inap              LIKE(JPas:Inap)                !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a JPasien Record'),AT(,,358,198),FONT('Arial',8,,),IMM,HLP('SelectJPasien'),SYSTEM,GRAY,MDI
                       LIST,AT(8,30,342,124),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('80R(2)|M~Nomor MR~C(0)@N010_@80L(2)|M~Nama~@s35@80R(2)|M~Tanggal Lahir~C(0)@D06@' &|
   '20R(2)|M~Umur~C(0)@n3@36R(2)|M~Umur Bln~C(0)@n3@56L(2)|M~Jenis kelamin~@s1@80L(2' &|
   ')|M~Alamat~@s35@16R(2)|M~RT~C(0)@N3@16R(2)|M~RW~C(0)@N3@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(305,158,45,14),USE(?Select:2)
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('Nomor RM'),USE(?Tab:2)
                         END
                         TAB('JPas:KeyAlamat'),USE(?Tab:3)
                         END
                         TAB('Nama'),USE(?Tab:4)
                         END
                         TAB('JPas:KeyKec'),USE(?Tab:5)
                         END
                         TAB('Status RM'),USE(?Tab:6)
                         END
                         TAB('tgl. kunjungan'),USE(?Tab:7)
                         END
                         TAB('JPas:KeyKota'),USE(?Tab:8)
                         END
                         TAB('JPas:KeyKelurahan'),USE(?Tab:9)
                         END
                         TAB('JPas:Inap_JPasien_FK'),USE(?Tab:10)
                         END
                       END
                       BUTTON('Close'),AT(260,180,45,14),USE(?Close)
                       BUTTON('Help'),AT(309,180,45,14),USE(?Help),STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
BRW1::Sort5:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 6
BRW1::Sort6:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 7
BRW1::Sort7:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 8
BRW1::Sort8:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 9
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
  GlobalErrors.SetProcedureName('SelectJPasien')
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
  Relate:JPasien.Open                                      ! File JPasien used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:JPasien,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,JPas:KeyAlamat)                       ! Add the sort order for JPas:KeyAlamat for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,JPas:Alamat,,BRW1)             ! Initialize the browse locator using  using key: JPas:KeyAlamat , JPas:Alamat
  BRW1.AddSortOrder(,JPas:KeyNama)                         ! Add the sort order for JPas:KeyNama for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,JPas:Nama,,BRW1)               ! Initialize the browse locator using  using key: JPas:KeyNama , JPas:Nama
  BRW1.AddSortOrder(,JPas:KeyKec)                          ! Add the sort order for JPas:KeyKec for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,JPas:Kecamatan,,BRW1)          ! Initialize the browse locator using  using key: JPas:KeyKec , JPas:Kecamatan
  BRW1.AddSortOrder(,JPas:KeyKembali)                      ! Add the sort order for JPas:KeyKembali for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,JPas:kembali,,BRW1)            ! Initialize the browse locator using  using key: JPas:KeyKembali , JPas:kembali
  BRW1.AddSortOrder(,JPas:KeyTanggal)                      ! Add the sort order for JPas:KeyTanggal for sort order 5
  BRW1.AddLocator(BRW1::Sort5:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort5:Locator.Init(,JPas:Tanggal,1,BRW1)           ! Initialize the browse locator using  using key: JPas:KeyTanggal , JPas:Tanggal
  BRW1.AddSortOrder(,JPas:KeyKota)                         ! Add the sort order for JPas:KeyKota for sort order 6
  BRW1.AddLocator(BRW1::Sort6:Locator)                     ! Browse has a locator for sort order 6
  BRW1::Sort6:Locator.Init(,JPas:Kota,,BRW1)               ! Initialize the browse locator using  using key: JPas:KeyKota , JPas:Kota
  BRW1.AddSortOrder(,JPas:KeyKelurahan)                    ! Add the sort order for JPas:KeyKelurahan for sort order 7
  BRW1.AddLocator(BRW1::Sort7:Locator)                     ! Browse has a locator for sort order 7
  BRW1::Sort7:Locator.Init(,JPas:Kelurahan,1,BRW1)         ! Initialize the browse locator using  using key: JPas:KeyKelurahan , JPas:Kelurahan
  BRW1.AddSortOrder(,JPas:Inap_JPasien_FK)                 ! Add the sort order for JPas:Inap_JPasien_FK for sort order 8
  BRW1.AddLocator(BRW1::Sort8:Locator)                     ! Browse has a locator for sort order 8
  BRW1::Sort8:Locator.Init(,JPas:Inap,1,BRW1)              ! Initialize the browse locator using  using key: JPas:Inap_JPasien_FK , JPas:Inap
  BRW1.AddSortOrder(,JPas:KeyNomorMr)                      ! Add the sort order for JPas:KeyNomorMr for sort order 9
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 9
  BRW1::Sort0:Locator.Init(,JPas:Nomor_mr,,BRW1)           ! Initialize the browse locator using  using key: JPas:KeyNomorMr , JPas:Nomor_mr
  BRW1.AddField(JPas:Nomor_mr,BRW1.Q.JPas:Nomor_mr)        ! Field JPas:Nomor_mr is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nama,BRW1.Q.JPas:Nama)                ! Field JPas:Nama is a hot field or requires assignment from browse
  BRW1.AddField(JPas:TanggalLahir,BRW1.Q.JPas:TanggalLahir) ! Field JPas:TanggalLahir is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Umur,BRW1.Q.JPas:Umur)                ! Field JPas:Umur is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Umur_Bln,BRW1.Q.JPas:Umur_Bln)        ! Field JPas:Umur_Bln is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Jenis_kelamin,BRW1.Q.JPas:Jenis_kelamin) ! Field JPas:Jenis_kelamin is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Alamat,BRW1.Q.JPas:Alamat)            ! Field JPas:Alamat is a hot field or requires assignment from browse
  BRW1.AddField(JPas:RT,BRW1.Q.JPas:RT)                    ! Field JPas:RT is a hot field or requires assignment from browse
  BRW1.AddField(JPas:RW,BRW1.Q.JPas:RW)                    ! Field JPas:RW is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Kecamatan,BRW1.Q.JPas:Kecamatan)      ! Field JPas:Kecamatan is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Kota,BRW1.Q.JPas:Kota)                ! Field JPas:Kota is a hot field or requires assignment from browse
  BRW1.AddField(JPas:kembali,BRW1.Q.JPas:kembali)          ! Field JPas:kembali is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Tanggal,BRW1.Q.JPas:Tanggal)          ! Field JPas:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Kelurahan,BRW1.Q.JPas:Kelurahan)      ! Field JPas:Kelurahan is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Inap,BRW1.Q.JPas:Inap)                ! Field JPas:Inap is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectJPasien',QuickWindow)                ! Restore window settings from non-volatile store
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
    Relate:JPasien.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectJPasien',QuickWindow)             ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSIF CHOICE(?CurrentTab) = 5
    RETURN SELF.SetSort(4,Force)
  ELSIF CHOICE(?CurrentTab) = 6
    RETURN SELF.SetSort(5,Force)
  ELSIF CHOICE(?CurrentTab) = 7
    RETURN SELF.SetSort(6,Force)
  ELSIF CHOICE(?CurrentTab) = 8
    RETURN SELF.SetSort(7,Force)
  ELSIF CHOICE(?CurrentTab) = 9
    RETURN SELF.SetSort(8,Force)
  ELSE
    RETURN SELF.SetSort(9,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

