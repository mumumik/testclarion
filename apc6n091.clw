

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N091.INC'),ONCE        !Local module procedure declarations
                     END


BrowseAPObatRuang PROCEDURE                                ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(APObatRuang)
                       PROJECT(APO1:NoTransaksi)
                       PROJECT(APO1:NomorMR)
                       PROJECT(APO1:no_urut)
                       PROJECT(APO1:Kode_Apotik)
                       PROJECT(APO1:Kode_Barang)
                       PROJECT(APO1:Jumlah)
                       PROJECT(APO1:Harga)
                       PROJECT(APO1:Diskon)
                       PROJECT(APO1:Total)
                       PROJECT(APO1:JenisTransaksi)
                       PROJECT(APO1:Tanggal)
                       PROJECT(APO1:Jam)
                       PROJECT(APO1:KodeMitra)
                       JOIN(JPas:KeyNomorMr,APO1:NomorMR)
                         PROJECT(JPas:Nama)
                         PROJECT(JPas:Nomor_mr)
                       END
                       JOIN(JKon:KeyKodeKtr,APO1:KodeMitra)
                         PROJECT(JKon:NAMA_KTR)
                         PROJECT(JKon:KODE_KTR)
                       END
                       JOIN(GBAR:KeyKodeBrg,APO1:Kode_Barang)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Kode_brg)
                       END
                       JOIN(GAPO:KeyNoApotik,APO1:Kode_Apotik)
                         PROJECT(GAPO:Nama_Apotik)
                         PROJECT(GAPO:Kode_Apotik)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APO1:NoTransaksi       LIKE(APO1:NoTransaksi)         !List box control field - type derived from field
APO1:NomorMR           LIKE(APO1:NomorMR)             !List box control field - type derived from field
APO1:no_urut           LIKE(APO1:no_urut)             !List box control field - type derived from field
JPas:Nama              LIKE(JPas:Nama)                !List box control field - type derived from field
APO1:Kode_Apotik       LIKE(APO1:Kode_Apotik)         !List box control field - type derived from field
GAPO:Nama_Apotik       LIKE(GAPO:Nama_Apotik)         !List box control field - type derived from field
APO1:Kode_Barang       LIKE(APO1:Kode_Barang)         !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
JKon:NAMA_KTR          LIKE(JKon:NAMA_KTR)            !List box control field - type derived from field
APO1:Jumlah            LIKE(APO1:Jumlah)              !List box control field - type derived from field
APO1:Harga             LIKE(APO1:Harga)               !List box control field - type derived from field
APO1:Diskon            LIKE(APO1:Diskon)              !List box control field - type derived from field
APO1:Total             LIKE(APO1:Total)               !List box control field - type derived from field
APO1:JenisTransaksi    LIKE(APO1:JenisTransaksi)      !List box control field - type derived from field
APO1:Tanggal           LIKE(APO1:Tanggal)             !List box control field - type derived from field
APO1:Jam               LIKE(APO1:Jam)                 !List box control field - type derived from field
JPas:Nomor_mr          LIKE(JPas:Nomor_mr)            !Related join file key field - type derived from field
JKon:KODE_KTR          LIKE(JKon:KODE_KTR)            !Related join file key field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
GAPO:Kode_Apotik       LIKE(GAPO:Kode_Apotik)         !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Obat Pasien Ke Ruangan'),AT(,,654,355),FONT('Arial',8,,),IMM,HLP('BrowseAPObatRuang'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,639,309),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('50L(2)|M~No Transaksi~@s20@[45R(2)|M~Nomor MR~L@n-14@28R(2)|M~Urut~L@n-7@73R(2)|' &|
   'M~Nama~L@s35@]|M~Pasien~[25L(2)|M~Kode~@s5@120L(2)|M~Nama Apotik~@s30@](93)|M~Ap' &|
   'otik~[44L(2)|M~Kode~@s10@160L(2)|M~Nama~@s40@](118)|M~Obat / Alkes~50L(2)|M~Kont' &|
   'raktor~C(0)@s50@35R(2)|M~Jumlah~C(0)@n10.2@49R(2)|M~Harga~C(0)@n15.2@45R(2)|M~Di' &|
   'skon~C(0)@n15.2@60R(2)|M~Total~C(0)@n15.2@57R(2)|M~Jenis Transaksi~C(0)@n3@51R(2' &|
   ')|M~Tanggal~C(0)@d17@80R(2)|M~Jam~C(0)@t7@'),FROM(Queue:Browse:1)
                       SHEET,AT(4,4,647,330),USE(?CurrentTab)
                         TAB('&1) NoTransaksi'),USE(?Tab:2)
                         END
                       END
                       BUTTON('Close'),AT(609,338,45,14),USE(?Close)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
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
  GlobalErrors.SetProcedureName('BrowseAPObatRuang')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('APO1:NoTransaksi',APO1:NoTransaksi)                ! Added by: BrowseBox(ABC)
  BIND('APO1:Kode_Apotik',APO1:Kode_Apotik)                ! Added by: BrowseBox(ABC)
  BIND('APO1:Kode_Barang',APO1:Kode_Barang)                ! Added by: BrowseBox(ABC)
  BIND('APO1:JenisTransaksi',APO1:JenisTransaksi)          ! Added by: BrowseBox(ABC)
  BIND('APO1:Tanggal',APO1:Tanggal)                        ! Added by: BrowseBox(ABC)
  BIND('APO1:Jam',APO1:Jam)                                ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:APObatRuang.Open                                  ! File APObatRuang used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:APObatRuang,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,APO1:Apotik_ObatRuangan_FK)           ! Add the sort order for APO1:Apotik_ObatRuangan_FK for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,APO1:Kode_Apotik,1,BRW1)       ! Initialize the browse locator using  using key: APO1:Apotik_ObatRuangan_FK , APO1:Kode_Apotik
  BRW1.AddSortOrder(,APO1:Barang_ObatRuangan_FK)           ! Add the sort order for APO1:Barang_ObatRuangan_FK for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,APO1:Kode_Barang,1,BRW1)       ! Initialize the browse locator using  using key: APO1:Barang_ObatRuangan_FK , APO1:Kode_Barang
  BRW1.AddSortOrder(,APO1:PK)                              ! Add the sort order for APO1:PK for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,APO1:NoTransaksi,,BRW1)        ! Initialize the browse locator using  using key: APO1:PK , APO1:NoTransaksi
  BRW1.AddField(APO1:NoTransaksi,BRW1.Q.APO1:NoTransaksi)  ! Field APO1:NoTransaksi is a hot field or requires assignment from browse
  BRW1.AddField(APO1:NomorMR,BRW1.Q.APO1:NomorMR)          ! Field APO1:NomorMR is a hot field or requires assignment from browse
  BRW1.AddField(APO1:no_urut,BRW1.Q.APO1:no_urut)          ! Field APO1:no_urut is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nama,BRW1.Q.JPas:Nama)                ! Field JPas:Nama is a hot field or requires assignment from browse
  BRW1.AddField(APO1:Kode_Apotik,BRW1.Q.APO1:Kode_Apotik)  ! Field APO1:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GAPO:Nama_Apotik,BRW1.Q.GAPO:Nama_Apotik)  ! Field GAPO:Nama_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(APO1:Kode_Barang,BRW1.Q.APO1:Kode_Barang)  ! Field APO1:Kode_Barang is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Nama_Brg,BRW1.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW1.AddField(JKon:NAMA_KTR,BRW1.Q.JKon:NAMA_KTR)        ! Field JKon:NAMA_KTR is a hot field or requires assignment from browse
  BRW1.AddField(APO1:Jumlah,BRW1.Q.APO1:Jumlah)            ! Field APO1:Jumlah is a hot field or requires assignment from browse
  BRW1.AddField(APO1:Harga,BRW1.Q.APO1:Harga)              ! Field APO1:Harga is a hot field or requires assignment from browse
  BRW1.AddField(APO1:Diskon,BRW1.Q.APO1:Diskon)            ! Field APO1:Diskon is a hot field or requires assignment from browse
  BRW1.AddField(APO1:Total,BRW1.Q.APO1:Total)              ! Field APO1:Total is a hot field or requires assignment from browse
  BRW1.AddField(APO1:JenisTransaksi,BRW1.Q.APO1:JenisTransaksi) ! Field APO1:JenisTransaksi is a hot field or requires assignment from browse
  BRW1.AddField(APO1:Tanggal,BRW1.Q.APO1:Tanggal)          ! Field APO1:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(APO1:Jam,BRW1.Q.APO1:Jam)                  ! Field APO1:Jam is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nomor_mr,BRW1.Q.JPas:Nomor_mr)        ! Field JPas:Nomor_mr is a hot field or requires assignment from browse
  BRW1.AddField(JKon:KODE_KTR,BRW1.Q.JKon:KODE_KTR)        ! Field JKon:KODE_KTR is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Kode_brg,BRW1.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  BRW1.AddField(GAPO:Kode_Apotik,BRW1.Q.GAPO:Kode_Apotik)  ! Field GAPO:Kode_Apotik is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseAPObatRuang',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APObatRuang.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseAPObatRuang',QuickWindow)         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

