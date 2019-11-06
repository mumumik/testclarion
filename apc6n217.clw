

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N217.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N003.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N005.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N008.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N049.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N104.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N119.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N145.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N160.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N210.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N218.INC'),ONCE        !Req'd for module callout resolution
                     END


Trig_BrowseRawatJalanNonBill PROCEDURE                     ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
loc:total            REAL                                  !
loc:ada              BYTE                                  !
FilesOpened          BYTE                                  !
loc::thread          BYTE                                  !
Lunas                STRING(5)                             !
Poliklinik           STRING(1)                             !
LOC::No_transaksi    STRING(15)                            !Nomor Transaksi
vl_total             REAL                                  !
BRW1::View:Browse    VIEW(APHTRANS)
                       PROJECT(APH:Nomor_mr)
                       PROJECT(APH:Tanggal)
                       PROJECT(APH:Jam)
                       PROJECT(APH:Biaya)
                       PROJECT(APH:N0_tran)
                       PROJECT(APH:NoNota)
                       PROJECT(APH:Kode_Apotik)
                       PROJECT(APH:Asal)
                       PROJECT(APH:User)
                       PROJECT(APH:cara_bayar)
                       PROJECT(APH:dokter)
                       PROJECT(APH:NomorEPresribing)
                       PROJECT(APH:Kontrak)
                       JOIN(JTra:KeyNoNota,APH:NoNota)
                         PROJECT(JTra:NamaJawab)
                         PROJECT(JTra:No_Nota)
                       END
                       JOIN(JKon:KeyKodeKtr,APH:Kontrak)
                         PROJECT(JKon:NAMA_KTR)
                         PROJECT(JKon:KODE_KTR)
                       END
                       JOIN(JPas:KeyNomorMr,APH:Nomor_mr)
                         PROJECT(JPas:Nama)
                         PROJECT(JPas:Nomor_mr)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APH:Nomor_mr           LIKE(APH:Nomor_mr)             !List box control field - type derived from field
JPas:Nama              LIKE(JPas:Nama)                !List box control field - type derived from field
JTra:NamaJawab         LIKE(JTra:NamaJawab)           !List box control field - type derived from field
JKon:NAMA_KTR          LIKE(JKon:NAMA_KTR)            !List box control field - type derived from field
APH:Tanggal            LIKE(APH:Tanggal)              !List box control field - type derived from field
APH:Jam                LIKE(APH:Jam)                  !List box control field - type derived from field
APH:Biaya              LIKE(APH:Biaya)                !List box control field - type derived from field
APH:N0_tran            LIKE(APH:N0_tran)              !List box control field - type derived from field
APH:N0_tran_NormalFG   LONG                           !Normal forground color
APH:N0_tran_NormalBG   LONG                           !Normal background color
APH:N0_tran_SelectedFG LONG                           !Selected forground color
APH:N0_tran_SelectedBG LONG                           !Selected background color
APH:NoNota             LIKE(APH:NoNota)               !List box control field - type derived from field
APH:Kode_Apotik        LIKE(APH:Kode_Apotik)          !List box control field - type derived from field
APH:Asal               LIKE(APH:Asal)                 !List box control field - type derived from field
APH:User               LIKE(APH:User)                 !List box control field - type derived from field
APH:cara_bayar         LIKE(APH:cara_bayar)           !List box control field - type derived from field
APH:dokter             LIKE(APH:dokter)               !List box control field - type derived from field
APH:NomorEPresribing   LIKE(APH:NomorEPresribing)     !List box control field - type derived from field
Glo::kode_apotik       LIKE(Glo::kode_apotik)         !Browse hot field - type derived from global data
JTra:No_Nota           LIKE(JTra:No_Nota)             !Related join file key field - type derived from field
JKon:KODE_KTR          LIKE(JKon:KODE_KTR)            !Related join file key field - type derived from field
JPas:Nomor_mr          LIKE(JPas:Nomor_mr)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW6::View:Browse    VIEW(APDTRANS)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:ktt)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Total)
                       PROJECT(APD:Diskon)
                       PROJECT(APD:Camp)
                       PROJECT(APD:N0_tran)
                       PROJECT(APD:Harga_Dasar)
                       JOIN(GBAR:KeyKodeBrg,APD:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Ket2)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
APD:Kode_brg           LIKE(APD:Kode_brg)             !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Ket2              LIKE(GBAR:Ket2)                !List box control field - type derived from field
APD:ktt                LIKE(APD:ktt)                  !List box control field - type derived from field
APD:Jumlah             LIKE(APD:Jumlah)               !List box control field - type derived from field
APD:Total              LIKE(APD:Total)                !List box control field - type derived from field
APD:Diskon             LIKE(APD:Diskon)               !List box control field - type derived from field
APD:Camp               LIKE(APD:Camp)                 !List box control field - type derived from field
APD:N0_tran            LIKE(APD:N0_tran)              !List box control field - type derived from field
APD:Harga_Dasar        LIKE(APD:Harga_Dasar)          !List box control field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Transaksi Instalasi Farmasi- Rawat Jalan (Tidak Masuk Billing)'),AT(,,531,289),FONT('Arial',8,,),CENTER,IMM,HLP('Tran_Poliklinik'),SYSTEM,GRAY,MDI
                       ELLIPSE,AT(207,2,23,17),USE(?Ellipse1),COLOR(COLOR:Red),FILL(COLOR:Red)
                       ELLIPSE,AT(290,2,23,17),USE(?Ellipse1:2),COLOR(COLOR:Green),FILL(COLOR:Green)
                       STRING('= Retur Obat'),AT(235,6),USE(?String1)
                       BUTTON('T&ransaksi (Ins)'),AT(346,140,83,26),USE(?Insert:3),LEFT,FONT('Times New Roman',12,COLOR:Blue,FONT:regular),KEY(InsertKey),ICON(ICON:Open)
                       BUTTON('Cetak &Nota'),AT(117,50,61,26),USE(?Print:2),HIDE,LEFT,FONT('Times New Roman',10,COLOR:Blue,FONT:bold),ICON(ICON:Print)
                       BUTTON('Cetak &Detail'),AT(9,140,61,26),USE(?Print),LEFT,FONT('Times New Roman',10,COLOR:Blue,FONT:bold),ICON(ICON:Print1)
                       LIST,AT(10,25,514,112),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('47L|FM~Nomor RM~C@N010_@103L|FM~Nama~C@s35@48L|FM~Keterangan~C@s40@100L|FM~Kontr' &|
   'aktor~C@s100@51R(1)|M~Tanggal~C(0)@D8@40R(1)|M~Jam~C(0)@t04@55R(1)|M~Biaya~C(0)@' &|
   'n-14@64L|M*~No. Transaksi~C@s15@40L|M~No Bill~@s10@26L|M~Apotik~@s5@44L|M~Asal~@' &|
   's10@25L|M~User~@s4@38L|M~cara bayar~@n1@24L|M~dokter~@s5@80L|M~Nomor EP resribin' &|
   'g~@s20@'),FROM(Queue:Browse:1)
                       LIST,AT(7,173,514,92),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('45L|FM~Kode Barang~C@s10@115L|FM~Nama Obat~C@s40@74L|FM~Keterangan~C@s50@16L|FM~' &|
   'KTT~C@n3@43D(14)|M~Jumlah~C(0)@n-10.2@55D(14)|M~Total~C(0)@n-15.2@60R(2)|M~Disko' &|
   'n~C(0)@n-15.2@60L~Camp~C@n2@60L|~N 0 tran~C@s15@44D|~Harga Dasar~C@n15.2@'),FROM(Queue:Browse)
                       BUTTON('History Per Pasien'),AT(433,140,85,26),USE(?Insert:2),LEFT,FONT('Times New Roman',12,COLOR:Blue,FONT:regular),KEY(InsertKey)
                       BUTTON('Cetak &Kwitansi'),AT(135,140,77,26),USE(?Print:3),LEFT,FONT('Times New Roman',10,COLOR:Blue,FONT:bold),ICON(ICON:Print)
                       BUTTON('&Select'),AT(271,41,45,14),USE(?Select:2),HIDE
                       BUTTON('&Change'),AT(221,41,45,14),USE(?Change:3),DISABLE,HIDE,DEFAULT
                       BUTTON('&Delete'),AT(171,41,45,14),USE(?Delete:3),DISABLE,HIDE
                       SHEET,AT(5,8,523,161),USE(?CurrentTab)
                         TAB('No. Transaksi [F2]'),USE(?Tab:2),KEY(F2Key),FONT('Times New Roman',10,,)
                           BUTTON('Cetak &Detail PPN'),AT(161,102,61,26),USE(?Print:4),HIDE,LEFT,FONT('Times New Roman',10,COLOR:Blue,FONT:bold),ICON(ICON:Print1)
                           BUTTON('Cetak Detail (KTT)'),AT(74,140,58,26),USE(?Button12),LEFT,FONT(,,,FONT:regular,CHARSET:ANSI),ICON(ICON:Print1)
                           PROMPT('No Transaksi :'),AT(213,147),USE(?LOC::No_transaksi:Prompt),FONT('Times New Roman',10,,)
                           ENTRY(@s15),AT(269,145,71,13),USE(LOC::No_transaksi),FONT('Times New Roman',10,COLOR:Black,),MSG('Nomor Transaksi'),TIP('Nomor Transaksi')
                         END
                         TAB('Nomor RM [F3]'),USE(?Tab:3),KEY(F3Key),FONT('Times New Roman',10,COLOR:Black,)
                           BUTTON('Cetak Detail (KTT)'),AT(74,140,58,26),USE(?Button12:2),LEFT,FONT(,,,FONT:regular,CHARSET:ANSI),ICON(ICON:Print1)
                           PROMPT('Nomor RM :'),AT(220,145),USE(?APH:Nomor_mr:Prompt)
                           ENTRY(@N010_),AT(270,145,71,13),USE(APH:Nomor_mr),IMM,MSG('Nomor Medical record pasien'),TIP('Nomor KIUP')
                         END
                         TAB('No. Billing [F4]'),USE(?Tab3),KEY(F4Key)
                           BUTTON('Cetak Detail (KTT)'),AT(74,140,58,26),USE(?Button12:3),LEFT,FONT(,,,FONT:regular,CHARSET:ANSI),ICON(ICON:Print1)
                           PROMPT('No Billing:'),AT(236,148),USE(?APH:NoNota:Prompt)
                           ENTRY(@s10),AT(270,147,71,13),USE(APH:NoNota)
                         END
                       END
                       STRING('= Keluar Obat'),AT(316,6),USE(?String1:2)
                       BOX,AT(399,3,126,17),USE(?Box1),COLOR(COLOR:Red),FILL(COLOR:White)
                       STRING('Tidak Masuk Billing'),AT(402,5),USE(?String3),FONT(,14,COLOR:Red,FONT:bold,CHARSET:ANSI)
                       BUTTON('&Tutup'),AT(365,265,83,22),USE(?Close),LEFT,ICON(ICON:Cross)
                       BUTTON('Help'),AT(321,41,45,14),USE(?Help),HIDE,STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetFromAsk           PROCEDURE(*BYTE Request,*BYTE Response),DERIVED ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
SetQueueRecord         PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  FilterLocatorClass                    ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW1::Sort1:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW6                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetQueue             PROCEDURE(BYTE ResetMode),DERIVED   ! Method added to host embed code
                     END

BRW6::Sort0:Locator  StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False) ! Method added to host embed code
                     END

view::sql view(filesql)
            project(FIL:FString1)
          end

view::real view(filesql2)
            project(FIL1:Real1,FIL1:Real2,FIL1:Real3)
          end

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
  ! untuk mengambil data setup persentase
  SHARE(ISetupAp)
  IF ERRORCODE() OR RECORDS(ISetupAp) = 0 THEN
     MESSAGE ('Jalankan menu SET UP dahulu')
     POST(EVENT:CloseWindow)
  END
  Iset:deskripsi = 'Bea_R'
  Get(IsetupAp,Iset:by_deskripsi)
  GL_beaR = Iset:Nilai
  Iset:deskripsi = 'KLS_UC'
  Get(IsetupAp,Iset:by_deskripsi)
  GL_Um_kls1 = Iset:Nilai
  Iset:deskripsi = 'KLS_UN'
  Get(IsetupAp,Iset:by_deskripsi)
  GL_nt_kls2 = Iset:Nilai
  Iset:deskripsi = 'PPN'
  Get(IsetupAp,Iset:by_deskripsi)
  GL_PPN = Iset:Nilai
  Access:ISetupAp.Close()
  ! Untuk tambah 2 data di GBarang, yaitu _campur dan _ biaya ( untuk obat campur )
  GBAR:Kode_brg = '_Campur'
  IF Access:GBarang.Fetch(GBAR:KeyKodeBrg) <> level:benign THEN
      GBAR:Kode_brg = '_Campur'
      GBAR:Nama_Brg = 'Total Obat Campur'
      Access:GBarang.Insert()
  END
  GBAR:Kode_brg = '_Biaya'
  IF Access:GBarang.Fetch(GBAR:KeyKodeBrg) <> level:benign
      GBAR:Kode_brg = '_Biaya'
      GBAR:Nama_Brg = 'Biaya Obat Campur'
      Access:GBarang.Insert()
  END
  ! Untuk transaksi rutine, jika ada discount
  GBAR:Kode_brg = '_Disc'
  IF Access:GBarang.Fetch(GBAR:KeyKodeBrg) <> level:benign
      GBAR:Kode_brg = '_Disc'
      GBAR:Nama_Brg = 'Discount'
      Access:GBarang.Insert()
  END
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_BrowseRawatJalanNonBill')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  WindowTanggal()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Ellipse1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('VG_TANGGAL1',VG_TANGGAL1)                          ! Added by: BrowseBox(ABC)
  BIND('VG_TANGGAL2',VG_TANGGAL2)                          ! Added by: BrowseBox(ABC)
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  BIND('Glo::kode_apotik',Glo::kode_apotik)                ! Added by: BrowseBox(ABC)
  loc::thread=glo::mainthreadno
  POST(EVENT:Disable_RJalan,,loc::thread)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:APDTRANS.SetOpenRelated()
  Relate:APDTRANS.Open                                     ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql.Open                                      ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql2.Open                                     ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:JDBILLING.Open                                    ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:JDDBILLING.Open                                   ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:JHBILLING.Open                                    ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:SMPegawai.SetOpenRelated()
  Relate:SMPegawai.Open                                    ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:TBTransResepDokterHeader.Open                     ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JTransaksi.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JDokter.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKontrak.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GRekapBK.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:APHTRANS,SELF) ! Initialize the browse manager
  BRW6.Init(?List,Queue:Browse.ViewPosition,BRW6::View:Browse,Queue:Browse,Relate:APDTRANS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon APH:Nomor_mr for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,APH:by_medrec)   ! Add the sort order for APH:by_medrec for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?APH:Nomor_mr,APH:Nomor_mr,1,BRW1) ! Initialize the browse locator using ?APH:Nomor_mr using key: APH:by_medrec , APH:Nomor_mr
  BRW1.AppendOrder('aph:n0_tran')                          ! Append an additional sort order
  BRW1.SetFilter('(aph:tanggal>=VG_TANGGAL1 and aph:tanggal<<=VG_TANGGAL2 and (sub(APH:N0_tran,1,3)=''APJ'' or sub(APH:N0_tran,1,3)=''APB'') and APH:Kode_Apotik=GL_entryapotik)') ! Apply filter expression to browse
  BRW1.AddSortOrder(,APH:nonota_aphtras_key)               ! Add the sort order for APH:nonota_aphtras_key for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(?APH:NoNota,APH:NoNota,1,BRW1)  ! Initialize the browse locator using ?APH:NoNota using key: APH:nonota_aphtras_key , APH:NoNota
  BRW1::Sort2:Locator.FloatRight = 1
  BRW1.AppendOrder('aph:n0_tran')                          ! Append an additional sort order
  BRW1.SetFilter('(aph:tanggal>=VG_TANGGAL1 and aph:tanggal<<=VG_TANGGAL2 and (sub(APH:N0_tran,1,3)=''APJ'' or sub(APH:N0_tran,1,3)=''APB'') and APH:Kode_Apotik=GL_entryapotik)') ! Apply filter expression to browse
  BRW1.AddSortOrder(,APH:by_medrec)                        ! Add the sort order for APH:by_medrec for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,APH:Nomor_mr,1,BRW1)           ! Initialize the browse locator using  using key: APH:by_medrec , APH:Nomor_mr
  BRW1.SetFilter('(aph:tanggal>=VG_TANGGAL1 and aph:tanggal<<=VG_TANGGAL2 and (sub(APH:N0_tran,1,3)=''APJ'' or sub(APH:N0_tran,1,3)=''APB'') and APH:Kode_Apotik=GL_entryapotik)') ! Apply filter expression to browse
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon APH:N0_tran for sort order 4
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,APH:by_transaksi) ! Add the sort order for APH:by_transaksi for sort order 4
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort0:Locator.Init(?LOC::No_transaksi,APH:N0_tran,,BRW1) ! Initialize the browse locator using ?LOC::No_transaksi using key: APH:by_transaksi , APH:N0_tran
  BRW1.SetFilter('(aph:tanggal>=VG_TANGGAL1 and aph:tanggal<<=VG_TANGGAL2 and sub(APH:N0_tran,1,3)=''APO'' and APH:Ra_jal = 1 and APH:Kode_Apotik=GL_entryapotik)') ! Apply filter expression to browse
  BRW1.AddField(APH:Nomor_mr,BRW1.Q.APH:Nomor_mr)          ! Field APH:Nomor_mr is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nama,BRW1.Q.JPas:Nama)                ! Field JPas:Nama is a hot field or requires assignment from browse
  BRW1.AddField(JTra:NamaJawab,BRW1.Q.JTra:NamaJawab)      ! Field JTra:NamaJawab is a hot field or requires assignment from browse
  BRW1.AddField(JKon:NAMA_KTR,BRW1.Q.JKon:NAMA_KTR)        ! Field JKon:NAMA_KTR is a hot field or requires assignment from browse
  BRW1.AddField(APH:Tanggal,BRW1.Q.APH:Tanggal)            ! Field APH:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(APH:Jam,BRW1.Q.APH:Jam)                    ! Field APH:Jam is a hot field or requires assignment from browse
  BRW1.AddField(APH:Biaya,BRW1.Q.APH:Biaya)                ! Field APH:Biaya is a hot field or requires assignment from browse
  BRW1.AddField(APH:N0_tran,BRW1.Q.APH:N0_tran)            ! Field APH:N0_tran is a hot field or requires assignment from browse
  BRW1.AddField(APH:NoNota,BRW1.Q.APH:NoNota)              ! Field APH:NoNota is a hot field or requires assignment from browse
  BRW1.AddField(APH:Kode_Apotik,BRW1.Q.APH:Kode_Apotik)    ! Field APH:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(APH:Asal,BRW1.Q.APH:Asal)                  ! Field APH:Asal is a hot field or requires assignment from browse
  BRW1.AddField(APH:User,BRW1.Q.APH:User)                  ! Field APH:User is a hot field or requires assignment from browse
  BRW1.AddField(APH:cara_bayar,BRW1.Q.APH:cara_bayar)      ! Field APH:cara_bayar is a hot field or requires assignment from browse
  BRW1.AddField(APH:dokter,BRW1.Q.APH:dokter)              ! Field APH:dokter is a hot field or requires assignment from browse
  BRW1.AddField(APH:NomorEPresribing,BRW1.Q.APH:NomorEPresribing) ! Field APH:NomorEPresribing is a hot field or requires assignment from browse
  BRW1.AddField(Glo::kode_apotik,BRW1.Q.Glo::kode_apotik)  ! Field Glo::kode_apotik is a hot field or requires assignment from browse
  BRW1.AddField(JTra:No_Nota,BRW1.Q.JTra:No_Nota)          ! Field JTra:No_Nota is a hot field or requires assignment from browse
  BRW1.AddField(JKon:KODE_KTR,BRW1.Q.JKon:KODE_KTR)        ! Field JKon:KODE_KTR is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nomor_mr,BRW1.Q.JPas:Nomor_mr)        ! Field JPas:Nomor_mr is a hot field or requires assignment from browse
  BRW6.Q &= Queue:Browse
  BRW6.AddSortOrder(,APD:notran_kode)                      ! Add the sort order for APD:notran_kode for sort order 1
  BRW6.AddRange(APD:N0_tran,Relate:APDTRANS,Relate:APHTRANS) ! Add file relationship range limit for sort order 1
  BRW6.AddLocator(BRW6::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW6::Sort0:Locator.Init(,APD:Kode_brg,,BRW6)            ! Initialize the browse locator using  using key: APD:notran_kode , APD:Kode_brg
  BRW6.AddField(APD:Kode_brg,BRW6.Q.APD:Kode_brg)          ! Field APD:Kode_brg is a hot field or requires assignment from browse
  BRW6.AddField(GBAR:Nama_Brg,BRW6.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW6.AddField(GBAR:Ket2,BRW6.Q.GBAR:Ket2)                ! Field GBAR:Ket2 is a hot field or requires assignment from browse
  BRW6.AddField(APD:ktt,BRW6.Q.APD:ktt)                    ! Field APD:ktt is a hot field or requires assignment from browse
  BRW6.AddField(APD:Jumlah,BRW6.Q.APD:Jumlah)              ! Field APD:Jumlah is a hot field or requires assignment from browse
  BRW6.AddField(APD:Total,BRW6.Q.APD:Total)                ! Field APD:Total is a hot field or requires assignment from browse
  BRW6.AddField(APD:Diskon,BRW6.Q.APD:Diskon)              ! Field APD:Diskon is a hot field or requires assignment from browse
  BRW6.AddField(APD:Camp,BRW6.Q.APD:Camp)                  ! Field APD:Camp is a hot field or requires assignment from browse
  BRW6.AddField(APD:N0_tran,BRW6.Q.APD:N0_tran)            ! Field APD:N0_tran is a hot field or requires assignment from browse
  BRW6.AddField(APD:Harga_Dasar,BRW6.Q.APD:Harga_Dasar)    ! Field APD:Harga_Dasar is a hot field or requires assignment from browse
  BRW6.AddField(GBAR:Kode_brg,BRW6.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_BrowseRawatJalanNonBill',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW6.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW6.ToolbarItem.HelpButton = ?Help
  BRW1.PrintProcedure = 2
  BRW1.PrintControl = ?Print
  BRW6.PrintProcedure = 3
  BRW6.PrintControl = ?Print:2
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:FileSql.Close
    Relate:FileSql2.Close
    Relate:JDBILLING.Close
    Relate:JDDBILLING.Close
    Relate:JHBILLING.Close
    Relate:Nomor_SKR.Close
    Relate:SMPegawai.Close
    Relate:TBTransResepDokterHeader.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_BrowseRawatJalanNonBill',QuickWindow) ! Save window data to non-volatile store
  END
  POST(EVENT:Enable_RJalan,,loc::thread)
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
      Trig_UpdateRawatJalan1NonBill
      PrintTransRawatJalanA5
      Cetak_nota_apotik
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
      NOM1:No_urut=3
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
    OF ?Print:3
      glo:nomor=APH:N0_tran
      display
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Insert:2
      ThisWindow.Update
      START(BrowseObatPerPasienPerTanggal, 25000)
      ThisWindow.Reset
    OF ?Print:3
      ThisWindow.Update
      START(PrintKwitansiRajal, 25000)
      ThisWindow.Reset
    OF ?Change:3
      ThisWindow.Update
      cycle
    OF ?Delete:3
      ThisWindow.Update
      cycle
    OF ?Print:4
      ThisWindow.Update
      PrintTransRawatJalan1PPN
      ThisWindow.Reset
    OF ?Button12
      ThisWindow.Update
      PrintTransRawatJalanA5KTT()
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
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
  ReturnValue = PARENT.TakeSelected()
    CASE FIELD()
    OF ?APH:NoNota
      select(?Browse:1)
    END
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
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:CloseWindow
      close(view::sql)
    OF EVENT:OpenWindow
      open(view::sql)
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


BRW1.ResetFromAsk PROCEDURE(*BYTE Request,*BYTE Response)

  CODE
  PARENT.ResetFromAsk(Request,Response)
  !message('reset from ask')
  if request=1 and response=1 then
     loc:total=0
     loc:ada=0
     open(view::real)
     view::real{prop:sql}='select jumlah,total,diskon from dba.apdtrans where n0_tran='''&APH:N0_tran&''''
     loop
        next(view::real)
        if errorcode() then break.
  !      message(FIL1:Real1&' '&FIL1:Real2&' '&FIL1:Real3)
        loc:total+=FIL1:Real2-FIL1:Real3
        if FIL1:Real1=0 then
           loc:ada=1
        end
     end
     close(view::real)
     if loc:ada=1 then
        get(aphtrans,APH:by_transaksi)
        APH:Biaya=round(loc:total,1000)
        put(aphtrans)
        brw1.resetsort(1)
     end
  !   JDB:NOMOR            =APH:NoNota
  !   JDB:NOMOR            =APH:NoNota
  !   JDB:NOTRAN_INTERNAL  =APH:N0_tran
  !   JDB:KODEJASA         ='FAR.00001.00.00'
  !   JDB:TOTALBIAYA       =APH:Biaya
  !   JDB:KETERANGAN       =''
  !   JDB:JUMLAH           =1
  !!   if GL_entryapotik='FM04' or GL_entryapotik='FM09' or GL_entryapotik='FM10' then
  !!      JDB:KODE_BAGIAN      ='FARMASI'
  !!   else
  !!      JDB:KODE_BAGIAN      ='FARPD'
  !!   end
  !   JDB:KODE_BAGIAN      =APH:Kode_Apotik
  !   JDB:STATUS_TUTUP     =0
  !   JDB:StatusBatal      =0
  !   JDB:STATUS_TUTUP     =0
  !   JDB:StatusBatal      =0
  !   JDB:JUMLAH_BYR       =0
  !   JDB:SISA_BYR         =0
  !   JDB:NO_PEMBAYARAN    =''
  !   JDB:DISCOUNT         =0
  !   JDB:BYRSELISIH       =0
  !   
  !      JDB:Validasi=1
  !      JDB:UsrValidasi=APH:User
  !      JDB:JmValidasi=clock()
  !      JDB:TglValidasi=APH:Tanggal
  !
  !   if APH:cara_bayar<>3 then
  !      JDB:DTG_JD           =0
  !   else
  !      if APH:Nomor_mr=99999999 then
  !         JDB:DTG_JD           =0
  !      else
  !         JDB:DTG_JD           =APH:biaya_dtg
  !      end
  !   end
  !   !JDB:TglValidasi      =today()
  !   !JDB:JmValidasi       =clock()
  !   JDB:KoreksiTarif     =0
  !   JDB:JenisPembayaran  =APH:cara_bayar
  !   JDB:TglTransaksi     =APH:Tanggal
  !   JDB:JamTransaksi     =APH:Jam
  !   JDB:ValidasiProduksi =1
  !   JDB:TglValidasiProduksi=APH:Tanggal
  !   JDB:JamValidasiProduksi=APH:Jam
  !   JDB:UservalidasiProduksi=APH:User
  !   JDB:hppobat = GLO:HARGA_DASAR
  !   
  !   access:jdbilling.insert()
  !   JDDB:NOMOR           =APH:NoNota
  !   JDDB:NOMOR           =APH:NoNota
  !   JDDB:NOTRAN_INTERNAL =APH:N0_tran
  !   JDDB:KODEJASA        ='FAR.00001.00.00'
  !   JDDB:SUBKODEJASA     ='FAR.00001.04.00'
  !   JDDB:KETERANGAN      =''
  !   JDDB:JUMLAH          =1
  !   JDDB:TOTALBIAYA      =APH:Biaya
  !   JDDB:hppobat = GLO:HARGA_DASAR
  !   JDB:ValidasiProduksi =1
  !
  !   if APH:cara_bayar<>3 then
  !      JDDB:DTG_JD           =0
  !   else
  !      if APH:Nomor_mr=99999999 then
  !         JDDB:DTG_JD           =0
  !      else
  !         JDDB:DTG_JD           =APH:biaya_dtg
  !      end
  !   end
  !
  !   access:jddbilling.insert()
     !Update Status Resep Elektronik
     TBT2:NoTrans=APH:NomorEPresribing
     if access:tbtransresepdokterheader.fetch(TBT2:PK)=level:benign then
        TBT2:Status=1
        access:tbtransresepdokterheader.update()
     end
  
     !glo::no_nota=APH:N0_tran
  !  PrintTransRawatJalan
  end


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


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (aph:biaya<0)
    SELF.Q.APH:N0_tran_NormalFG = 255                      ! Set conditional color values for APH:N0_tran
    SELF.Q.APH:N0_tran_NormalBG = -1
    SELF.Q.APH:N0_tran_SelectedFG = 255
    SELF.Q.APH:N0_tran_SelectedBG = -1
  ELSIF (aph:biaya>=0)
    SELF.Q.APH:N0_tran_NormalFG = 32768                    ! Set conditional color values for APH:N0_tran
    SELF.Q.APH:N0_tran_NormalBG = -1
    SELF.Q.APH:N0_tran_SelectedFG = 32768
    SELF.Q.APH:N0_tran_SelectedBG = -1
  ELSE
    SELF.Q.APH:N0_tran_NormalFG = -1                       ! Set color values for APH:N0_tran
    SELF.Q.APH:N0_tran_NormalBG = -1
    SELF.Q.APH:N0_tran_SelectedFG = -1
    SELF.Q.APH:N0_tran_SelectedBG = -1
  END


BRW6.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW6.ResetQueue PROCEDURE(BYTE ResetMode)

  CODE
  PARENT.ResetQueue(ResetMode)
  !access:aphtrans.fetch(APH:by_transaksi)
  !!message('1')
  !vl_total=0
  !set(BRW6::View:Browse)
  !loop
  !   next(BRW6::View:Browse)
  !   if errorcode() then break.
  !   vl_total+=APD:Total-APD:Diskon
  !end
  !!message('2')
  !if round(vl_total,1)<>APH:Biaya then
  !   if (APH:Biaya-round(vl_total,1))<=1 then
  !      vl_total=round(vl_total,1)+1
  !   else
  !      message('Total beda dengan detil, harap hubungi Divisi SIMRS ! '&round(vl_total,1)&' '&APH:Biaya)
  !      access:aphtrans.fetch(APH:by_transaksi)
  !      APH:Biaya=round(vl_total,1)
  !      access:aphtrans.update()
  !!      brw1.resetfromfile
  !!     brw1.resetsort(1)
  !      message('Data sudah disamakan, silahkan cetak ulang struk !')
  !   end
  !end
  !!message('3')


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

