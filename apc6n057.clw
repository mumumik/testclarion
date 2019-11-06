

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N057.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N044.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N056.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N058.INC'),ONCE        !Req'd for module callout resolution
                     END


BrowsePerbaikanHargaObatPasienTelkom PROCEDURE             ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
loc:total            REAL                                  !
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
BRW4::View:Browse    VIEW(RI_HRInap)
                       PROJECT(RI_HR:Nomor_mr)
                       PROJECT(RI_HR:NoUrut)
                       PROJECT(RI_HR:Kontraktor)
                       PROJECT(RI_HR:LastRoom)
                       PROJECT(RI_HR:Tanggal_Masuk)
                       PROJECT(RI_HR:Tanggal_Keluar)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
RI_HR:Nomor_mr         LIKE(RI_HR:Nomor_mr)           !List box control field - type derived from field
RI_HR:NoUrut           LIKE(RI_HR:NoUrut)             !List box control field - type derived from field
RI_HR:Kontraktor       LIKE(RI_HR:Kontraktor)         !List box control field - type derived from field
RI_HR:LastRoom         LIKE(RI_HR:LastRoom)           !List box control field - type derived from field
RI_HR:Tanggal_Masuk    LIKE(RI_HR:Tanggal_Masuk)      !List box control field - type derived from field
RI_HR:Tanggal_Keluar   LIKE(RI_HR:Tanggal_Keluar)     !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(APHTRANS)
                       PROJECT(APH:Tanggal)
                       PROJECT(APH:Jam)
                       PROJECT(APH:NoNota)
                       PROJECT(APH:Urut)
                       PROJECT(APH:Nomor_mr)
                       PROJECT(APH:N0_tran)
                       JOIN(APD:notran_kode,APH:N0_tran)
                         PROJECT(APD:Kode_brg)
                         PROJECT(APD:Jumlah)
                         PROJECT(APD:Harga_Dasar)
                         PROJECT(APD:Total)
                         PROJECT(APD:N0_tran)
                         JOIN(GBAR:KeyKodeBrg,APD:Kode_brg)
                           PROJECT(GBAR:Nama_Brg)
                           PROJECT(GBAR:Kode_brg)
                         END
                       END
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?List:2
APH:Tanggal            LIKE(APH:Tanggal)              !List box control field - type derived from field
APH:Jam                LIKE(APH:Jam)                  !List box control field - type derived from field
APD:Kode_brg           LIKE(APD:Kode_brg)             !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
APD:Jumlah             LIKE(APD:Jumlah)               !List box control field - type derived from field
APD:Harga_Dasar        LIKE(APD:Harga_Dasar)          !List box control field - type derived from field
APD:Total              LIKE(APD:Total)                !List box control field - type derived from field
APH:NoNota             LIKE(APH:NoNota)               !List box control field - type derived from field
APH:Urut               LIKE(APH:Urut)                 !List box control field - type derived from field
APD:N0_tran            LIKE(APD:N0_tran)              !List box control field - type derived from field
APH:Nomor_mr           LIKE(APH:Nomor_mr)             !List box control field - type derived from field
APH:N0_tran            LIKE(APH:N0_tran)              !Primary key field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the JPasien File'),AT(,,492,285),FONT('MS Sans Serif',8,COLOR:Black,),IMM,HLP('BrowsePerbaikanHargaObatPasienTelkom'),SYSTEM,GRAY,RESIZE,MDI
                       LIST,AT(8,23,243,105),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('80R(2)|M~Nomor MR~C(0)@N010_@80L(2)|M~Nama~L(2)@s35@80R(2)|M~Tanggal Lahir~C(0)@' &|
   'D06@20R(2)|M~Umur~C(0)@n3@36R(2)|M~Umur Bln~C(0)@n3@56L(2)|M~Jenis kelamin~L(2)@' &|
   's1@80L(2)|M~Alamat~L(2)@s35@16R(2)|M~RT~C(0)@N3@16R(2)|M~RW~C(0)@N3@'),FROM(Queue:Browse:1)
                       SHEET,AT(4,4,253,145),USE(?CurrentTab)
                         TAB('Nomor RM (F2)'),USE(?Tab:2),KEY(F2Key)
                           PROMPT('Nomor MR :'),AT(9,132),USE(?JPas:Nomor_mr:Prompt)
                           ENTRY(@N010_),AT(59,132,60,10),USE(JPas:Nomor_mr),IMM,MSG('Nomor Medical record pasien'),TIP('Nomor KIUP')
                         END
                       END
                       LIST,AT(261,24,229,105),USE(?List),IMM,VSCROLL,MSG('Browsing Records'),FORMAT('40R|M~Nomor mr~L@n010_@17R|M~Urut~L@n-7@37R|M~Kontraktor~L@s10@31R|M~Ruang~L@s10' &|
   '@47R|M~Tanggal Masuk~L@D06@51R|M~Tanggal Keluar~L@D06@'),FROM(Queue:Browse)
                       LIST,AT(8,157,483,105),USE(?List:2),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('44L|M~Tanggal~@D8@40L|M~Jam~@t06@44L|M~Kode Barang~@s10@107L|M~Nama Obat~@s40@32' &|
   'D|M~Jumlah~L@n-11.2@44R|M~Harga Dasar~L@n11.2@58R|M~Harga Total~L@n-15.2@40R|M~N' &|
   'o Nota~L@s10@28R|M~Urut~L@n-7@60L|M~N 0 tran~@s15@40L|M~Nomor RM~@N010_@'),FROM(Queue:Browse:2)
                       BUTTON('Proses Sesuaikan Harga Telkom'),AT(327,133,111,14),USE(?Button3)
                       BUTTON('Close'),AT(405,268,45,14),USE(?Close)
                       BUTTON('&Query'),AT(141,265,45,14),USE(?Query)
                       PROMPT('Total :'),AT(263,268),USE(?loc:total:Prompt)
                       ENTRY(@n-17.2),AT(306,268,60,10),USE(loc:total),DECIMAL(14),READONLY
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
QBE6                 QueryFormClass                        ! QBE List Class. 
QBV6                 QueryFormVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
BRW1::Sort5:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 6
BRW1::Sort7:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 8
BRW1::Sort8:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 9
BRW4                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
                     END

BRW4::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW5                 CLASS(BrowseClass)                    ! Browse using ?List:2
Q                      &Queue:Browse:2                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetFromView          PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW5::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
  GlobalErrors.SetProcedureName('BrowsePerbaikanHargaObatPasienTelkom')
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
  Relate:APDTRANS.SetOpenRelated()
  Relate:APDTRANS.Open                                     ! File JKontrak used by this procedure, so make sure it's RelationManager is open
  Relate:APDTRANSBackup.Open                               ! File JKontrak used by this procedure, so make sure it's RelationManager is open
  Relate:APHTRANSBackup.Open                               ! File JKontrak used by this procedure, so make sure it's RelationManager is open
  Access:JKecamatan.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKota.UseFile                                     ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:RI_HRInap.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKontrakMaster.UseFile                            ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKontrak.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:JPasien,SELF) ! Initialize the browse manager
  BRW4.Init(?List,Queue:Browse.ViewPosition,BRW4::View:Browse,Queue:Browse,Relate:RI_HRInap,SELF) ! Initialize the browse manager
  BRW5.Init(?List:2,Queue:Browse:2.ViewPosition,BRW5::View:Browse,Queue:Browse:2,Relate:APHTRANS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  ?List:2{Prop:LineHeight} = 0
  Do DefineListboxStyle
  QBE6.Init(QBV6, INIMgr,'BrowsePerbaikanHargaObatPasienTelkom', GlobalErrors)
  QBE6.QkSupport = True
  QBE6.QkMenuIcon = 'QkQBE.ico'
  QBE6.QkIcon = 'QkLoad.ico'
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
  BRW1.AddSortOrder(,JPas:KeyKelurahan)                    ! Add the sort order for JPas:KeyKelurahan for sort order 7
  BRW1.AddLocator(BRW1::Sort7:Locator)                     ! Browse has a locator for sort order 7
  BRW1::Sort7:Locator.Init(,JPas:Kelurahan,1,BRW1)         ! Initialize the browse locator using  using key: JPas:KeyKelurahan , JPas:Kelurahan
  BRW1.AddSortOrder(,JPas:Inap_JPasien_FK)                 ! Add the sort order for JPas:Inap_JPasien_FK for sort order 8
  BRW1.AddLocator(BRW1::Sort8:Locator)                     ! Browse has a locator for sort order 8
  BRW1::Sort8:Locator.Init(,JPas:Inap,1,BRW1)              ! Initialize the browse locator using  using key: JPas:Inap_JPasien_FK , JPas:Inap
  BRW1.AddSortOrder(,JPas:KeyNomorMr)                      ! Add the sort order for JPas:KeyNomorMr for sort order 9
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 9
  BRW1::Sort0:Locator.Init(?JPas:Nomor_mr,JPas:Nomor_mr,,BRW1) ! Initialize the browse locator using ?JPas:Nomor_mr using key: JPas:KeyNomorMr , JPas:Nomor_mr
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
  BRW4.Q &= Queue:Browse
  BRW4.AddSortOrder(,RI_HR:PrimaryKey)                     ! Add the sort order for RI_HR:PrimaryKey for sort order 1
  BRW4.AddRange(RI_HR:Nomor_mr,Relate:RI_HRInap,Relate:JPasien) ! Add file relationship range limit for sort order 1
  BRW4.AddLocator(BRW4::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW4::Sort0:Locator.Init(,RI_HR:NoUrut,1,BRW4)           ! Initialize the browse locator using  using key: RI_HR:PrimaryKey , RI_HR:NoUrut
  BRW4.AddField(RI_HR:Nomor_mr,BRW4.Q.RI_HR:Nomor_mr)      ! Field RI_HR:Nomor_mr is a hot field or requires assignment from browse
  BRW4.AddField(RI_HR:NoUrut,BRW4.Q.RI_HR:NoUrut)          ! Field RI_HR:NoUrut is a hot field or requires assignment from browse
  BRW4.AddField(RI_HR:Kontraktor,BRW4.Q.RI_HR:Kontraktor)  ! Field RI_HR:Kontraktor is a hot field or requires assignment from browse
  BRW4.AddField(RI_HR:LastRoom,BRW4.Q.RI_HR:LastRoom)      ! Field RI_HR:LastRoom is a hot field or requires assignment from browse
  BRW4.AddField(RI_HR:Tanggal_Masuk,BRW4.Q.RI_HR:Tanggal_Masuk) ! Field RI_HR:Tanggal_Masuk is a hot field or requires assignment from browse
  BRW4.AddField(RI_HR:Tanggal_Keluar,BRW4.Q.RI_HR:Tanggal_Keluar) ! Field RI_HR:Tanggal_Keluar is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse:2
  BRW5.AddSortOrder(,APH:by_medrec)                        ! Add the sort order for APH:by_medrec for sort order 1
  BRW5.AddRange(APH:Nomor_mr,Relate:APHTRANS,Relate:JPasien) ! Add file relationship range limit for sort order 1
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort0:Locator.Init(,APH:Nomor_mr,1,BRW5)           ! Initialize the browse locator using  using key: APH:by_medrec , APH:Nomor_mr
  BRW5.AppendOrder('aph:n0_tran,apd:kode_brg')             ! Append an additional sort order
  BRW5.AddField(APH:Tanggal,BRW5.Q.APH:Tanggal)            ! Field APH:Tanggal is a hot field or requires assignment from browse
  BRW5.AddField(APH:Jam,BRW5.Q.APH:Jam)                    ! Field APH:Jam is a hot field or requires assignment from browse
  BRW5.AddField(APD:Kode_brg,BRW5.Q.APD:Kode_brg)          ! Field APD:Kode_brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Nama_Brg,BRW5.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW5.AddField(APD:Jumlah,BRW5.Q.APD:Jumlah)              ! Field APD:Jumlah is a hot field or requires assignment from browse
  BRW5.AddField(APD:Harga_Dasar,BRW5.Q.APD:Harga_Dasar)    ! Field APD:Harga_Dasar is a hot field or requires assignment from browse
  BRW5.AddField(APD:Total,BRW5.Q.APD:Total)                ! Field APD:Total is a hot field or requires assignment from browse
  BRW5.AddField(APH:NoNota,BRW5.Q.APH:NoNota)              ! Field APH:NoNota is a hot field or requires assignment from browse
  BRW5.AddField(APH:Urut,BRW5.Q.APH:Urut)                  ! Field APH:Urut is a hot field or requires assignment from browse
  BRW5.AddField(APD:N0_tran,BRW5.Q.APD:N0_tran)            ! Field APD:N0_tran is a hot field or requires assignment from browse
  BRW5.AddField(APH:Nomor_mr,BRW5.Q.APH:Nomor_mr)          ! Field APH:Nomor_mr is a hot field or requires assignment from browse
  BRW5.AddField(APH:N0_tran,BRW5.Q.APH:N0_tran)            ! Field APH:N0_tran is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Kode_brg,BRW5.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowsePerbaikanHargaObatPasienTelkom',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW5.QueryControl = ?Query
  BRW5.UpdateQuery(QBE6,1)
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW4.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW5.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:APDTRANSBackup.Close
    Relate:APHTRANSBackup.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowsePerbaikanHargaObatPasienTelkom',QuickWindow) ! Save window data to non-volatile store
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
    OF ?Button3
      JKon:KODE_KTR=RI_HR:Kontraktor
      access:jkontrak.fetch(JKon:KeyKodeKtr)
      if JKon:HargaObat=1.09 then
         vg_kontraktor=RI_HR:Kontraktor
         glo:mr=RI_HR:Nomor_mr
         glo:urut=RI_HR:NoUrut
      
         display
      else
         message('Kontraktor bukan Telkom, tarif bukan 1.09% !!!')
         cycle
      end
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button3
      ThisWindow.Update
      START(ProsesSesuaikanHargaTelkom, 25000)
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
  ELSE
    RETURN SELF.SetSort(9,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW4.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW5.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW5.ResetFromView PROCEDURE

loc:total:Sum        REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:APHTRANS.SetQuickScan(1)
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
    loc:total:Sum += APD:Total
  END
  loc:total = loc:total:Sum
  PARENT.ResetFromView
  Relate:APHTRANS.SetQuickScan(0)
  SETCURSOR()


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

ProsesSesuaikanHargaTelkom1 PROCEDURE                      ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
Process:View         VIEW(APHTRANS)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ProgressMgr          StepClass                             ! Progress Manager

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
  GlobalErrors.SetProcedureName('ProsesSesuaikanHargaTelkom1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo:mr',glo:mr)                                    ! Added by: Process
  BIND('glo:nota',glo:nota)                                ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:APDTRANS.SetOpenRelated()
  Relate:APDTRANS.Open                                     ! File JKontrak used by this procedure, so make sure it's RelationManager is open
  Relate:APDTRANSBackup.Open                               ! File JKontrak used by this procedure, so make sure it's RelationManager is open
  Relate:APHTRANSBackup.Open                               ! File JKontrak used by this procedure, so make sure it's RelationManager is open
  Access:JKontrakMaster.UseFile                            ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKontrak.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesSesuaikanHargaTelkom1',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:APHTRANS, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ThisProcess.SetFilter('APH:Nomor_mr=glo:mr and APH:NoNota=glo:nota')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(APHTRANS,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:APDTRANSBackup.Close
    Relate:APHTRANSBackup.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesSesuaikanHargaTelkom1',ProgressWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  APH2:N0_tran    =APH:N0_tran
  if access:aphtransbackup.fetch(APH2:by_transaksi)=level:benign then
     message('Sudah pernah diproses, hubungi SIMRS !')
     !break
  else
     APH2:record=APH:record
     access:aphtransbackup.insert()
  
     JKon:KODE_KTR=vg_kontraktor
     access:jkontrak.fetch(JKon:KeyKodeKtr)
     !message(JKon:HargaObat&' '&'select * from dba.apdtrans where n0_tran='''&clip(APH:N0_tran)&'''')
     if JKon:HargaObat>0 then
        apdtrans{prop:sql}='select * from dba.apdtrans where n0_tran='''&clip(APH:N0_tran)&''''
        apdtrans{prop:sql}='select * from dba.apdtrans where n0_tran='''&clip(APH:N0_tran)&''''
        loop
           if access:apdtrans.next()<>level:benign then break.
           APD3:record=APD:record
           access:apdtransbackup.insert()
           APD:Total = GL_beaR + (APD:Harga_Dasar*(1.1)*JKon:HargaObat*APD:Jumlah)
           access:apdtrans.update()
        end
     end
  end
  RETURN ReturnValue

BrowsePerbaikanHargaObatPasienTelkomRajal PROCEDURE        ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
loc:total            REAL                                  !
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
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW4::View:Browse    VIEW(JTransaksi)
                       PROJECT(JTra:Nomor_Mr)
                       PROJECT(JTra:Tanggal)
                       PROJECT(JTra:No_Nota)
                       PROJECT(JTra:Kontraktor)
                       PROJECT(JTra:Kode_poli)
                       PROJECT(JTra:Kode_dokter)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
JTra:Nomor_Mr          LIKE(JTra:Nomor_Mr)            !List box control field - type derived from field
JTra:Tanggal           LIKE(JTra:Tanggal)             !List box control field - type derived from field
JTra:No_Nota           LIKE(JTra:No_Nota)             !List box control field - type derived from field
JTra:Kontraktor        LIKE(JTra:Kontraktor)          !List box control field - type derived from field
JTra:Kode_poli         LIKE(JTra:Kode_poli)           !List box control field - type derived from field
JTra:Kode_dokter       LIKE(JTra:Kode_dokter)         !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(APHTRANS)
                       PROJECT(APH:Tanggal)
                       PROJECT(APH:Jam)
                       PROJECT(APH:NoNota)
                       PROJECT(APH:Urut)
                       PROJECT(APH:Nomor_mr)
                       PROJECT(APH:N0_tran)
                       JOIN(APD:notran_kode,APH:N0_tran)
                         PROJECT(APD:Kode_brg)
                         PROJECT(APD:Jumlah)
                         PROJECT(APD:Harga_Dasar)
                         PROJECT(APD:Total)
                         PROJECT(APD:N0_tran)
                         JOIN(GBAR:KeyKodeBrg,APD:Kode_brg)
                           PROJECT(GBAR:Nama_Brg)
                           PROJECT(GBAR:Kode_brg)
                         END
                       END
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?List:2
APH:Tanggal            LIKE(APH:Tanggal)              !List box control field - type derived from field
APH:Jam                LIKE(APH:Jam)                  !List box control field - type derived from field
APD:Kode_brg           LIKE(APD:Kode_brg)             !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
APD:Jumlah             LIKE(APD:Jumlah)               !List box control field - type derived from field
APD:Harga_Dasar        LIKE(APD:Harga_Dasar)          !List box control field - type derived from field
APD:Total              LIKE(APD:Total)                !List box control field - type derived from field
APH:NoNota             LIKE(APH:NoNota)               !List box control field - type derived from field
APH:Urut               LIKE(APH:Urut)                 !List box control field - type derived from field
APD:N0_tran            LIKE(APD:N0_tran)              !List box control field - type derived from field
APH:Nomor_mr           LIKE(APH:Nomor_mr)             !List box control field - type derived from field
APH:N0_tran            LIKE(APH:N0_tran)              !Primary key field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the JPasien File'),AT(,,492,285),FONT('MS Sans Serif',8,COLOR:Black,),IMM,HLP('BrowsePerbaikanHargaObatPasienTelkom'),SYSTEM,GRAY,RESIZE,MDI
                       LIST,AT(8,23,243,105),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('80R(2)|M~Nomor MR~C(0)@N010_@80L(2)|M~Nama~@s35@80R(2)|M~Tanggal Lahir~C(0)@D06@' &|
   '20R(2)|M~Umur~C(0)@n3@36R(2)|M~Umur Bln~C(0)@n3@56L(2)|M~Jenis kelamin~@s1@80L(2' &|
   ')|M~Alamat~@s35@16R(2)|M~RT~C(0)@N3@16R(2)|M~RW~C(0)@N3@'),FROM(Queue:Browse:1)
                       SHEET,AT(4,4,253,145),USE(?CurrentTab)
                         TAB('Nomor RM (F2)'),USE(?Tab:2),KEY(F2Key)
                           PROMPT('Nomor MR :'),AT(9,132),USE(?JPas:Nomor_mr:Prompt)
                           ENTRY(@N010_),AT(59,132,60,10),USE(JPas:Nomor_mr),IMM,MSG('Nomor Medical record pasien'),TIP('Nomor KIUP')
                         END
                         TAB('Nama (F3)'),USE(?Tab2),KEY(F3Key)
                           PROMPT('Nama :'),AT(8,132),USE(?JPas:Nama:Prompt)
                           ENTRY(@s35),AT(58,132,60,10),USE(JPas:Nama),HLP('Nama mendahului gelar'),MSG('Nama pasien'),REQ,CAP
                         END
                       END
                       LIST,AT(261,24,229,105),USE(?List),IMM,VSCROLL,MSG('Browsing Records'),VCR,FORMAT('40R|M~Nomor Mr~L@N010_@40R|M~Tanggal~L@D06@40R|M~No Nota~L@s10@40R|M~Kontraktor~' &|
   'L@s10@40R|M~Kode poli~L@s10@40R|M~Kode dokter~L@s10@'),FROM(Queue:Browse)
                       LIST,AT(8,157,483,105),USE(?List:2),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('44L|M~Tanggal~@D8@40L|M~Jam~@t06@44L|M~Kode Barang~@s10@107L|M~Nama Obat~@s40@32' &|
   'D|M~Jumlah~L@n-11.2@44R|M~Harga Dasar~L@n11.2@58R|M~Harga Total~L@n-15.2@40R|M~N' &|
   'o Nota~L@s10@28R|M~Urut~L@n-7@60L|M~N 0 tran~@s15@40L|M~Nomor RM~@N010_@'),FROM(Queue:Browse:2)
                       BUTTON('Proses Sesuaikan Harga Telkom'),AT(327,133,111,14),USE(?Button3)
                       BUTTON('Close'),AT(405,268,45,14),USE(?Close)
                       BUTTON('&Query'),AT(141,265,45,14),USE(?Query)
                       PROMPT('Total :'),AT(263,268),USE(?loc:total:Prompt)
                       ENTRY(@n-17.2),AT(306,268,60,10),USE(loc:total),DECIMAL(14),READONLY
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
QBE6                 QueryFormClass                        ! QBE List Class. 
QBV6                 QueryFormVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW4                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
                     END

BRW4::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW5                 CLASS(BrowseClass)                    ! Browse using ?List:2
Q                      &Queue:Browse:2                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetFromView          PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW5::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
  GlobalErrors.SetProcedureName('BrowsePerbaikanHargaObatPasienTelkomRajal')
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
  Relate:APDTRANS.SetOpenRelated()
  Relate:APDTRANS.Open                                     ! File JKontrak used by this procedure, so make sure it's RelationManager is open
  Relate:APDTRANSBackup.Open                               ! File JKontrak used by this procedure, so make sure it's RelationManager is open
  Relate:APHTRANSBackup.Open                               ! File JKontrak used by this procedure, so make sure it's RelationManager is open
  Access:JKecamatan.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKota.UseFile                                     ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:RI_HRInap.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKontrakMaster.UseFile                            ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKontrak.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:JPasien,SELF) ! Initialize the browse manager
  BRW4.Init(?List,Queue:Browse.ViewPosition,BRW4::View:Browse,Queue:Browse,Relate:JTransaksi,SELF) ! Initialize the browse manager
  BRW5.Init(?List:2,Queue:Browse:2.ViewPosition,BRW5::View:Browse,Queue:Browse:2,Relate:APHTRANS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  ?List:2{Prop:LineHeight} = 0
  Do DefineListboxStyle
  QBE6.Init(QBV6, INIMgr,'BrowsePerbaikanHargaObatPasienTelkomRajal', GlobalErrors)
  QBE6.QkSupport = True
  QBE6.QkMenuIcon = 'QkQBE.ico'
  QBE6.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,JPas:KeyNama)                         ! Add the sort order for JPas:KeyNama for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?JPas:Nama,JPas:Nama,,BRW1)     ! Initialize the browse locator using ?JPas:Nama using key: JPas:KeyNama , JPas:Nama
  BRW1.AddSortOrder(,JPas:KeyNomorMr)                      ! Add the sort order for JPas:KeyNomorMr for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?JPas:Nomor_mr,JPas:Nomor_mr,,BRW1) ! Initialize the browse locator using ?JPas:Nomor_mr using key: JPas:KeyNomorMr , JPas:Nomor_mr
  BRW1.AddField(JPas:Nomor_mr,BRW1.Q.JPas:Nomor_mr)        ! Field JPas:Nomor_mr is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nama,BRW1.Q.JPas:Nama)                ! Field JPas:Nama is a hot field or requires assignment from browse
  BRW1.AddField(JPas:TanggalLahir,BRW1.Q.JPas:TanggalLahir) ! Field JPas:TanggalLahir is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Umur,BRW1.Q.JPas:Umur)                ! Field JPas:Umur is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Umur_Bln,BRW1.Q.JPas:Umur_Bln)        ! Field JPas:Umur_Bln is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Jenis_kelamin,BRW1.Q.JPas:Jenis_kelamin) ! Field JPas:Jenis_kelamin is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Alamat,BRW1.Q.JPas:Alamat)            ! Field JPas:Alamat is a hot field or requires assignment from browse
  BRW1.AddField(JPas:RT,BRW1.Q.JPas:RT)                    ! Field JPas:RT is a hot field or requires assignment from browse
  BRW1.AddField(JPas:RW,BRW1.Q.JPas:RW)                    ! Field JPas:RW is a hot field or requires assignment from browse
  BRW4.Q &= Queue:Browse
  BRW4.AddSortOrder(,JTra:KeyNomorMr)                      ! Add the sort order for JTra:KeyNomorMr for sort order 1
  BRW4.AddRange(JTra:Nomor_Mr,Relate:JTransaksi,Relate:JPasien) ! Add file relationship range limit for sort order 1
  BRW4.AddLocator(BRW4::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW4::Sort0:Locator.Init(,JTra:Nomor_Mr,1,BRW4)          ! Initialize the browse locator using  using key: JTra:KeyNomorMr , JTra:Nomor_Mr
  BRW4.AppendOrder('jtra:tanggal')                         ! Append an additional sort order
  BRW4.AddField(JTra:Nomor_Mr,BRW4.Q.JTra:Nomor_Mr)        ! Field JTra:Nomor_Mr is a hot field or requires assignment from browse
  BRW4.AddField(JTra:Tanggal,BRW4.Q.JTra:Tanggal)          ! Field JTra:Tanggal is a hot field or requires assignment from browse
  BRW4.AddField(JTra:No_Nota,BRW4.Q.JTra:No_Nota)          ! Field JTra:No_Nota is a hot field or requires assignment from browse
  BRW4.AddField(JTra:Kontraktor,BRW4.Q.JTra:Kontraktor)    ! Field JTra:Kontraktor is a hot field or requires assignment from browse
  BRW4.AddField(JTra:Kode_poli,BRW4.Q.JTra:Kode_poli)      ! Field JTra:Kode_poli is a hot field or requires assignment from browse
  BRW4.AddField(JTra:Kode_dokter,BRW4.Q.JTra:Kode_dokter)  ! Field JTra:Kode_dokter is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse:2
  BRW5.AddSortOrder(,APH:nonota_aphtras_key)               ! Add the sort order for APH:nonota_aphtras_key for sort order 1
  BRW5.AddRange(APH:NoNota,Relate:APHTRANS,Relate:JTransaksi) ! Add file relationship range limit for sort order 1
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort0:Locator.Init(,APH:NoNota,1,BRW5)             ! Initialize the browse locator using  using key: APH:nonota_aphtras_key , APH:NoNota
  BRW5.AddField(APH:Tanggal,BRW5.Q.APH:Tanggal)            ! Field APH:Tanggal is a hot field or requires assignment from browse
  BRW5.AddField(APH:Jam,BRW5.Q.APH:Jam)                    ! Field APH:Jam is a hot field or requires assignment from browse
  BRW5.AddField(APD:Kode_brg,BRW5.Q.APD:Kode_brg)          ! Field APD:Kode_brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Nama_Brg,BRW5.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW5.AddField(APD:Jumlah,BRW5.Q.APD:Jumlah)              ! Field APD:Jumlah is a hot field or requires assignment from browse
  BRW5.AddField(APD:Harga_Dasar,BRW5.Q.APD:Harga_Dasar)    ! Field APD:Harga_Dasar is a hot field or requires assignment from browse
  BRW5.AddField(APD:Total,BRW5.Q.APD:Total)                ! Field APD:Total is a hot field or requires assignment from browse
  BRW5.AddField(APH:NoNota,BRW5.Q.APH:NoNota)              ! Field APH:NoNota is a hot field or requires assignment from browse
  BRW5.AddField(APH:Urut,BRW5.Q.APH:Urut)                  ! Field APH:Urut is a hot field or requires assignment from browse
  BRW5.AddField(APD:N0_tran,BRW5.Q.APD:N0_tran)            ! Field APD:N0_tran is a hot field or requires assignment from browse
  BRW5.AddField(APH:Nomor_mr,BRW5.Q.APH:Nomor_mr)          ! Field APH:Nomor_mr is a hot field or requires assignment from browse
  BRW5.AddField(APH:N0_tran,BRW5.Q.APH:N0_tran)            ! Field APH:N0_tran is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Kode_brg,BRW5.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowsePerbaikanHargaObatPasienTelkomRajal',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW5.QueryControl = ?Query
  BRW5.UpdateQuery(QBE6,1)
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW4.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW5.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:APDTRANSBackup.Close
    Relate:APHTRANSBackup.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowsePerbaikanHargaObatPasienTelkomRajal',QuickWindow) ! Save window data to non-volatile store
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
    OF ?Button3
      JKon:KODE_KTR=JTra:Kontraktor
      access:jkontrak.fetch(JKon:KeyKodeKtr)
      if JKon:HargaObat=1.09 then
         vg_kontraktor=JTra:Kontraktor
         glo:nota=JTra:No_Nota
         glo:mr=JTra:Nomor_Mr
         display
      else
         message('Kontraktor bukan Telkom, tarif bukan 1.09% !!!')
         cycle
      end
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button3
      ThisWindow.Update
      START(ProsesSesuaikanHargaTelkom1, 25000)
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
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW4.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW5.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW5.ResetFromView PROCEDURE

loc:total:Sum        REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:APHTRANS.SetQuickScan(1)
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
    loc:total:Sum += APD:Total
  END
  loc:total = loc:total:Sum
  PARENT.ResetFromView
  Relate:APHTRANS.SetQuickScan(0)
  SETCURSOR()


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

BrowsePerbaikanHargaObatPasinTelkomRajal1 PROCEDURE        ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
loc:total            REAL                                  !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(JTransaksi)
                       PROJECT(JTra:Nomor_Mr)
                       PROJECT(JTra:Tanggal)
                       PROJECT(JTra:Kode_poli)
                       PROJECT(JTra:Kode_dokter)
                       PROJECT(JTra:Kontraktor)
                       PROJECT(JTra:No_Nota)
                       JOIN(JPas:KeyNomorMr,JTra:Nomor_Mr)
                         PROJECT(JPas:Nomor_mr)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
JTra:Nomor_Mr          LIKE(JTra:Nomor_Mr)            !List box control field - type derived from field
JTra:Tanggal           LIKE(JTra:Tanggal)             !List box control field - type derived from field
JTra:Kode_poli         LIKE(JTra:Kode_poli)           !List box control field - type derived from field
JTra:Kode_dokter       LIKE(JTra:Kode_dokter)         !List box control field - type derived from field
JTra:Kontraktor        LIKE(JTra:Kontraktor)          !List box control field - type derived from field
JTra:No_Nota           LIKE(JTra:No_Nota)             !Primary key field - type derived from field
JPas:Nomor_mr          LIKE(JPas:Nomor_mr)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(APHTRANS)
                       PROJECT(APH:Tanggal)
                       PROJECT(APH:Jam)
                       PROJECT(APH:NoNota)
                       PROJECT(APH:Urut)
                       PROJECT(APH:Nomor_mr)
                       PROJECT(APH:N0_tran)
                       JOIN(APD:notran_kode,APH:N0_tran)
                         PROJECT(APD:Kode_brg)
                         PROJECT(APD:Jumlah)
                         PROJECT(APD:Harga_Dasar)
                         PROJECT(APD:Total)
                         PROJECT(APD:N0_tran)
                         JOIN(GBAR:KeyKodeBrg,APD:Kode_brg)
                           PROJECT(GBAR:Nama_Brg)
                           PROJECT(GBAR:Kode_brg)
                         END
                       END
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?List:2
APH:Tanggal            LIKE(APH:Tanggal)              !List box control field - type derived from field
APH:Jam                LIKE(APH:Jam)                  !List box control field - type derived from field
APD:Kode_brg           LIKE(APD:Kode_brg)             !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
APD:Jumlah             LIKE(APD:Jumlah)               !List box control field - type derived from field
APD:Harga_Dasar        LIKE(APD:Harga_Dasar)          !List box control field - type derived from field
APD:Total              LIKE(APD:Total)                !List box control field - type derived from field
APH:NoNota             LIKE(APH:NoNota)               !List box control field - type derived from field
APH:Urut               LIKE(APH:Urut)                 !List box control field - type derived from field
APD:N0_tran            LIKE(APD:N0_tran)              !List box control field - type derived from field
APH:Nomor_mr           LIKE(APH:Nomor_mr)             !List box control field - type derived from field
APH:N0_tran            LIKE(APH:N0_tran)              !Primary key field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the JPasien File'),AT(,,492,285),FONT('MS Sans Serif',8,COLOR:Black,),IMM,HLP('BrowsePerbaikanHargaObatPasienTelkom'),SYSTEM,GRAY,RESIZE,MDI
                       LIST,AT(8,23,474,105),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('40R(2)|M~Nomor Mr~L(0)@N010_@40R(2)|M~Tanggal~L(0)@D06@40R(2)|M~Kode poli~L(0)@s' &|
   '10@40R(2)|M~Kode dokter~L(0)@s10@40R(2)|M~Kontraktor~L(0)@s10@'),FROM(Queue:Browse:1)
                       SHEET,AT(4,4,486,145),USE(?CurrentTab)
                         TAB('Nomor RM (F2)'),USE(?Tab:2),KEY(F2Key)
                           PROMPT('Nomor MR :'),AT(9,132),USE(?JPas:Nomor_mr:Prompt)
                           ENTRY(@N010_),AT(59,132,60,10),USE(JTra:Nomor_Mr),IMM,MSG('Nomor Medical record pasien'),TIP('Nomor KIUP')
                         END
                         TAB('Nota (F3)'),USE(?Tab2),KEY(F3Key)
                           PROMPT('No Nota:'),AT(9,132),USE(?JTra:No_Nota:Prompt)
                           ENTRY(@s10),AT(59,132,60,10),USE(JTra:No_Nota),MSG('No urut nota'),TIP('No urut nota')
                         END
                       END
                       LIST,AT(8,172,474,90),USE(?List:2),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('44L|M~Tanggal~@D8@40L|M~Jam~@t06@44L|M~Kode Barang~@s10@107L|M~Nama Obat~@s40@32' &|
   'D|M~Jumlah~L@n-11.2@44R|M~Harga Dasar~L@n11.2@58R|M~Harga Total~L@n-15.2@40R|M~N' &|
   'o Nota~L@s10@28R|M~Urut~L@n-7@60L|M~N 0 tran~@s15@40L|M~Nomor RM~@N010_@'),FROM(Queue:Browse:2)
                       BUTTON('Proses Sesuaikan Harga Telkom'),AT(10,152,111,14),USE(?Button3)
                       BUTTON('Close'),AT(405,268,45,14),USE(?Close)
                       BUTTON('&Query'),AT(141,265,45,14),USE(?Query)
                       PROMPT('Total :'),AT(263,268),USE(?loc:total:Prompt)
                       ENTRY(@n-17.2),AT(306,268,60,10),USE(loc:total),DECIMAL(14),READONLY
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
QBE6                 QueryFormClass                        ! QBE List Class. 
QBV6                 QueryFormVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW5                 CLASS(BrowseClass)                    ! Browse using ?List:2
Q                      &Queue:Browse:2                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetFromView          PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW5::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
  GlobalErrors.SetProcedureName('BrowsePerbaikanHargaObatPasinTelkomRajal1')
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
  Relate:APDTRANS.SetOpenRelated()
  Relate:APDTRANS.Open                                     ! File JKontrak used by this procedure, so make sure it's RelationManager is open
  Relate:APDTRANSBackup.Open                               ! File JKontrak used by this procedure, so make sure it's RelationManager is open
  Relate:APHTRANSBackup.Open                               ! File JKontrak used by this procedure, so make sure it's RelationManager is open
  Access:JKecamatan.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKota.UseFile                                     ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:RI_HRInap.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKontrakMaster.UseFile                            ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKontrak.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:JTransaksi,SELF) ! Initialize the browse manager
  BRW5.Init(?List:2,Queue:Browse:2.ViewPosition,BRW5::View:Browse,Queue:Browse:2,Relate:APHTRANS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List:2{Prop:LineHeight} = 0
  Do DefineListboxStyle
  QBE6.Init(QBV6, INIMgr,'BrowsePerbaikanHargaObatPasinTelkomRajal1', GlobalErrors)
  QBE6.QkSupport = True
  QBE6.QkMenuIcon = 'QkQBE.ico'
  QBE6.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,JTra:KeyNoNota)                       ! Add the sort order for JTra:KeyNoNota for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?JTra:No_Nota,JTra:No_Nota,1,BRW1) ! Initialize the browse locator using ?JTra:No_Nota using key: JTra:KeyNoNota , JTra:No_Nota
  BRW1.AddSortOrder(,JTra:KeyNomorMr)                      ! Add the sort order for JTra:KeyNomorMr for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?JTra:Nomor_Mr,JTra:Nomor_Mr,1,BRW1) ! Initialize the browse locator using ?JTra:Nomor_Mr using key: JTra:KeyNomorMr , JTra:Nomor_Mr
  BRW1.AddField(JTra:Nomor_Mr,BRW1.Q.JTra:Nomor_Mr)        ! Field JTra:Nomor_Mr is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Tanggal,BRW1.Q.JTra:Tanggal)          ! Field JTra:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Kode_poli,BRW1.Q.JTra:Kode_poli)      ! Field JTra:Kode_poli is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Kode_dokter,BRW1.Q.JTra:Kode_dokter)  ! Field JTra:Kode_dokter is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Kontraktor,BRW1.Q.JTra:Kontraktor)    ! Field JTra:Kontraktor is a hot field or requires assignment from browse
  BRW1.AddField(JTra:No_Nota,BRW1.Q.JTra:No_Nota)          ! Field JTra:No_Nota is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nomor_mr,BRW1.Q.JPas:Nomor_mr)        ! Field JPas:Nomor_mr is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse:2
  BRW5.AddSortOrder(,APH:nonota_aphtras_key)               ! Add the sort order for APH:nonota_aphtras_key for sort order 1
  BRW5.AddRange(APH:NoNota,Relate:APHTRANS,Relate:JTransaksi) ! Add file relationship range limit for sort order 1
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort0:Locator.Init(,APH:NoNota,1,BRW5)             ! Initialize the browse locator using  using key: APH:nonota_aphtras_key , APH:NoNota
  BRW5.AddField(APH:Tanggal,BRW5.Q.APH:Tanggal)            ! Field APH:Tanggal is a hot field or requires assignment from browse
  BRW5.AddField(APH:Jam,BRW5.Q.APH:Jam)                    ! Field APH:Jam is a hot field or requires assignment from browse
  BRW5.AddField(APD:Kode_brg,BRW5.Q.APD:Kode_brg)          ! Field APD:Kode_brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Nama_Brg,BRW5.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW5.AddField(APD:Jumlah,BRW5.Q.APD:Jumlah)              ! Field APD:Jumlah is a hot field or requires assignment from browse
  BRW5.AddField(APD:Harga_Dasar,BRW5.Q.APD:Harga_Dasar)    ! Field APD:Harga_Dasar is a hot field or requires assignment from browse
  BRW5.AddField(APD:Total,BRW5.Q.APD:Total)                ! Field APD:Total is a hot field or requires assignment from browse
  BRW5.AddField(APH:NoNota,BRW5.Q.APH:NoNota)              ! Field APH:NoNota is a hot field or requires assignment from browse
  BRW5.AddField(APH:Urut,BRW5.Q.APH:Urut)                  ! Field APH:Urut is a hot field or requires assignment from browse
  BRW5.AddField(APD:N0_tran,BRW5.Q.APD:N0_tran)            ! Field APD:N0_tran is a hot field or requires assignment from browse
  BRW5.AddField(APH:Nomor_mr,BRW5.Q.APH:Nomor_mr)          ! Field APH:Nomor_mr is a hot field or requires assignment from browse
  BRW5.AddField(APH:N0_tran,BRW5.Q.APH:N0_tran)            ! Field APH:N0_tran is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Kode_brg,BRW5.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowsePerbaikanHargaObatPasinTelkomRajal1',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW5.QueryControl = ?Query
  BRW5.UpdateQuery(QBE6,1)
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW5.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:APDTRANSBackup.Close
    Relate:APHTRANSBackup.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowsePerbaikanHargaObatPasinTelkomRajal1',QuickWindow) ! Save window data to non-volatile store
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
    OF ?Button3
      JKon:KODE_KTR=JTra:Kontraktor
      access:jkontrak.fetch(JKon:KeyKodeKtr)
      if JKon:HargaObat=1.09 then
         vg_kontraktor=RI_HR:Kontraktor
         glo:nota=JTra:No_Nota
         glo:mr=JTra:Nomor_Mr
         display
      else
         message('Kontraktor bukan Telkom, tarif bukan 1.09% !!!')
         cycle
      end
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button3
      ThisWindow.Update
      START(ProsesSesuaikanHargaTelkom1, 25000)
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
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW5.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW5.ResetFromView PROCEDURE

loc:total:Sum        REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:APHTRANS.SetQuickScan(1)
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
    loc:total:Sum += APD:Total
  END
  loc:total = loc:total:Sum
  PARENT.ResetFromView
  Relate:APHTRANS.SetQuickScan(0)
  SETCURSOR()


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

Trig_BrowseAntarApotik PROCEDURE                           ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
loc::kode_sub        STRING(5)                             !
loc::kode_tran       STRING(15)                            !nomor transaksi
loc::thread          BYTE                                  !
BRW1::View:Browse    VIEW(AptoApHe)
                       PROJECT(APTH:N0_tran)
                       PROJECT(APTH:Tanggal)
                       PROJECT(APTH:Kode_Apotik)
                       PROJECT(APTH:ApotikKeluar)
                       PROJECT(APTH:Total_Biaya)
                       PROJECT(APTH:User)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APTH:N0_tran           LIKE(APTH:N0_tran)             !List box control field - type derived from field
APTH:Tanggal           LIKE(APTH:Tanggal)             !List box control field - type derived from field
APTH:Kode_Apotik       LIKE(APTH:Kode_Apotik)         !List box control field - type derived from field
APTH:ApotikKeluar      LIKE(APTH:ApotikKeluar)        !List box control field - type derived from field
APTH:Total_Biaya       LIKE(APTH:Total_Biaya)         !List box control field - type derived from field
APTH:User              LIKE(APTH:User)                !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW6::View:Browse    VIEW(APtoAPde)
                       PROJECT(APTO:Kode_Brg)
                       PROJECT(APTO:Jumlah)
                       PROJECT(APTO:Biaya)
                       PROJECT(APTO:N0_tran)
                       JOIN(GBAR:KeyKodeBrg,APTO:Kode_Brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Ket2)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
APTO:Kode_Brg          LIKE(APTO:Kode_Brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Ket2              LIKE(GBAR:Ket2)                !List box control field - type derived from field
APTO:Jumlah            LIKE(APTO:Jumlah)              !List box control field - type derived from field
APTO:Biaya             LIKE(APTO:Biaya)               !List box control field - type derived from field
APTO:N0_tran           LIKE(APTO:N0_tran)             !List box control field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Transaksi antar SubInstalasi Farmasi'),AT(,,312,186),FONT('Arial',8,,),CENTER,IMM,HLP('Transaksi_antar_sub'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,244,54),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('64L(2)|FM~No. Transaksi~C@s15@49C|M~Tanggal~@D06@34L(2)|M~Sub Asal~C(0)@s5@41L(2' &|
   ')|M~Sub Dituju~C(0)@s5@56R(1)|M~Total Biaya~L(2)@n-15.2@16R(1)|M~User~L(2)@s4@'),FROM(Queue:Browse:1)
                       BUTTON('&Transaksi (F4)'),AT(264,16,45,37),USE(?Insert:3),ICON(ICON:Application)
                       STRING('Detail Alat-alat yang dikeluarkan'),AT(8,100),USE(?String1),FONT(,,COLOR:Black,FONT:bold+FONT:italic+FONT:underline)
                       LIST,AT(8,111,302,70),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('45L(1)|FM~Kode Barang~C(0)@s10@115L(1)|M~Nama Barang~C(0)@s40@63L(1)|M~Keteranga' &|
   'n~C(0)@s50@50R(1)|M~Jumlah~L(2)@n-14.2@49R(2)|M~Biaya~L@n-15.2@60R(2)|M~N 0 tran' &|
   '~L@s15@'),FROM(Queue:Browse)
                       BUTTON('&Select'),AT(133,0,45,14),USE(?Select:2),HIDE
                       BUTTON('&Change'),AT(165,0,45,14),USE(?Change:3),HIDE,DEFAULT
                       BUTTON('&Delete'),AT(183,0,45,14),USE(?Delete:3),HIDE
                       SHEET,AT(4,2,254,97),USE(?CurrentTab)
                         TAB('Kode Sub Farmasi [F2]'),USE(?Tab:2),KEY(F2Key),COLOR(0FAEFC9H)
                           PROMPT('Kode Sub-Instalasi :'),AT(130,81),USE(?Prompt1)
                           ENTRY(@s5),AT(196,81,,10),USE(loc::kode_sub),FONT('Times New Roman',12,COLOR:Black,)
                         END
                         TAB('No. Transaksi [F3]'),USE(?Tab:3),KEY(F3Key)
                           ENTRY(@s15),AT(191,82,60,10),USE(loc::kode_tran),FONT('Times New Roman',10,,)
                         END
                       END
                       BUTTON('&Keluar'),AT(264,64,45,37),USE(?Close),ICON(ICON:Cross)
                       BUTTON('Cetak &Detail'),AT(12,76,52,21),USE(?Print),LEFT,FONT('Times New Roman',10,COLOR:Black,),ICON(ICON:Print)
                       BUTTON('Help'),AT(212,0,45,14),USE(?Help),HIDE,STD(STD:Help)
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
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  EntryLocatorClass                     ! Default Locator
BRW1::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW1::Sort1:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW6                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
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
  GlobalErrors.SetProcedureName('Trig_BrowseAntarApotik')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  loc::thread=glo::mainthreadno
  !POST(EVENT:Disable_AntarApotik,,loc::thread)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:APtoAPde.Open                                     ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Access:GApotik.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:AptoApHe,SELF) ! Initialize the browse manager
  BRW6.Init(?List,Queue:Browse.ViewPosition,BRW6::View:Browse,Queue:Browse,Relate:APtoAPde,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon APTH:N0_tran for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,APTH:key_notran) ! Add the sort order for APTH:key_notran for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?loc::kode_tran,APTH:N0_tran,1,BRW1) ! Initialize the browse locator using ?loc::kode_tran using key: APTH:key_notran , APTH:N0_tran
  BRW1.SetFilter('(apth:kode_apotik=GL_entryapotik)')      ! Apply filter expression to browse
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon APTH:Kode_Apotik for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,APTH:key_kode_ap) ! Add the sort order for APTH:key_kode_ap for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?loc::kode_sub,APTH:Kode_Apotik,1,BRW1) ! Initialize the browse locator using ?loc::kode_sub using key: APTH:key_kode_ap , APTH:Kode_Apotik
  BRW1.SetFilter('(apth:kode_apotik=GL_entryapotik)')      ! Apply filter expression to browse
  BRW1.AddField(APTH:N0_tran,BRW1.Q.APTH:N0_tran)          ! Field APTH:N0_tran is a hot field or requires assignment from browse
  BRW1.AddField(APTH:Tanggal,BRW1.Q.APTH:Tanggal)          ! Field APTH:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(APTH:Kode_Apotik,BRW1.Q.APTH:Kode_Apotik)  ! Field APTH:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(APTH:ApotikKeluar,BRW1.Q.APTH:ApotikKeluar) ! Field APTH:ApotikKeluar is a hot field or requires assignment from browse
  BRW1.AddField(APTH:Total_Biaya,BRW1.Q.APTH:Total_Biaya)  ! Field APTH:Total_Biaya is a hot field or requires assignment from browse
  BRW1.AddField(APTH:User,BRW1.Q.APTH:User)                ! Field APTH:User is a hot field or requires assignment from browse
  BRW6.Q &= Queue:Browse
  BRW6.AddSortOrder(,APTO:key_no_nota)                     ! Add the sort order for APTO:key_no_nota for sort order 1
  BRW6.AddRange(APTO:N0_tran,Relate:APtoAPde,Relate:AptoApHe) ! Add file relationship range limit for sort order 1
  BRW6.AddLocator(BRW6::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW6::Sort0:Locator.Init(,APTO:Kode_Brg,1,BRW6)          ! Initialize the browse locator using  using key: APTO:key_no_nota , APTO:Kode_Brg
  BRW6.AddField(APTO:Kode_Brg,BRW6.Q.APTO:Kode_Brg)        ! Field APTO:Kode_Brg is a hot field or requires assignment from browse
  BRW6.AddField(GBAR:Nama_Brg,BRW6.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW6.AddField(GBAR:Ket2,BRW6.Q.GBAR:Ket2)                ! Field GBAR:Ket2 is a hot field or requires assignment from browse
  BRW6.AddField(APTO:Jumlah,BRW6.Q.APTO:Jumlah)            ! Field APTO:Jumlah is a hot field or requires assignment from browse
  BRW6.AddField(APTO:Biaya,BRW6.Q.APTO:Biaya)              ! Field APTO:Biaya is a hot field or requires assignment from browse
  BRW6.AddField(APTO:N0_tran,BRW6.Q.APTO:N0_tran)          ! Field APTO:N0_tran is a hot field or requires assignment from browse
  BRW6.AddField(GBAR:Kode_brg,BRW6.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_BrowseAntarApotik',QuickWindow)       ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW6.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW6.ToolbarItem.HelpButton = ?Help
  BRW1.PrintProcedure = 2
  BRW1.PrintControl = ?Print
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APtoAPde.Close
    Relate:Nomor_SKR.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_BrowseAntarApotik',QuickWindow)    ! Save window data to non-volatile store
  END
  !POST(EVENT:Enable_AntarApotik,,loc::thread)
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
    EXECUTE Number
      Trig_UpdateAntarApotik
      cetak_tran_antar_sub
    END
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
    OF ?Insert:3
      NOM1:No_urut=4
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
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Change:3
      ThisWindow.Update
      cycle
    OF ?Delete:3
      ThisWindow.Update
      cycle
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
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END


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


BRW6.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

