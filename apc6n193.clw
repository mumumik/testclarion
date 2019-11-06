

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N193.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N049.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N168.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N169.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N170.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N171.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N172.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N173.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N175.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N194.INC'),ONCE        !Req'd for module callout resolution
                     END


Trig_BrowseRawatJalanBpjs PROCEDURE                        ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
Lunas                STRING(5)                             !
Poliklinik           STRING(1)                             !
LOC::No_tran         STRING(15)                            !Nomor Transaksi
loc::thread          BYTE                                  !
vl_total             REAL                                  !
BRW1::View:Browse    VIEW(APHTRANSBPJS)
                       PROJECT(APHB:Nomor_mr)
                       PROJECT(APHB:Tanggal)
                       PROJECT(APHB:Biaya)
                       PROJECT(APHB:N0_tran)
                       PROJECT(APHB:NoNota)
                       PROJECT(APHB:Jam)
                       PROJECT(APHB:Kode_Apotik)
                       PROJECT(APHB:Asal)
                       PROJECT(APHB:User)
                       PROJECT(APHB:cara_bayar)
                       PROJECT(APHB:Kontrak)
                       PROJECT(APHB:dokter)
                       JOIN(JPas:KeyNomorMr,APHB:Nomor_mr)
                         PROJECT(JPas:Nama)
                         PROJECT(JPas:Nomor_mr)
                       END
                       JOIN(JKon:KeyKodeKtr,APHB:Kontrak)
                         PROJECT(JKon:NAMA_KTR)
                         PROJECT(JKon:KODE_KTR)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APHB:Nomor_mr          LIKE(APHB:Nomor_mr)            !List box control field - type derived from field
JPas:Nama              LIKE(JPas:Nama)                !List box control field - type derived from field
JKon:NAMA_KTR          LIKE(JKon:NAMA_KTR)            !List box control field - type derived from field
APHB:Tanggal           LIKE(APHB:Tanggal)             !List box control field - type derived from field
APHB:Biaya             LIKE(APHB:Biaya)               !List box control field - type derived from field
APHB:Biaya_NormalFG    LONG                           !Normal forground color
APHB:Biaya_NormalBG    LONG                           !Normal background color
APHB:Biaya_SelectedFG  LONG                           !Selected forground color
APHB:Biaya_SelectedBG  LONG                           !Selected background color
APHB:N0_tran           LIKE(APHB:N0_tran)             !List box control field - type derived from field
APHB:NoNota            LIKE(APHB:NoNota)              !List box control field - type derived from field
APHB:Jam               LIKE(APHB:Jam)                 !List box control field - type derived from field
APHB:Kode_Apotik       LIKE(APHB:Kode_Apotik)         !List box control field - type derived from field
APHB:Asal              LIKE(APHB:Asal)                !List box control field - type derived from field
APHB:User              LIKE(APHB:User)                !List box control field - type derived from field
APHB:cara_bayar        LIKE(APHB:cara_bayar)          !List box control field - type derived from field
APHB:Kontrak           LIKE(APHB:Kontrak)             !List box control field - type derived from field
APHB:dokter            LIKE(APHB:dokter)              !List box control field - type derived from field
Lunas                  LIKE(Lunas)                    !List box control field - type derived from local data
JPas:Nomor_mr          LIKE(JPas:Nomor_mr)            !Related join file key field - type derived from field
JKon:KODE_KTR          LIKE(JKon:KODE_KTR)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW6::View:Browse    VIEW(APDTRANS)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Total)
                       PROJECT(APD:Diskon)
                       PROJECT(APD:Camp)
                       PROJECT(APD:N0_tran)
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
APD:Jumlah             LIKE(APD:Jumlah)               !List box control field - type derived from field
APD:Total              LIKE(APD:Total)                !List box control field - type derived from field
APD:Diskon             LIKE(APD:Diskon)               !List box control field - type derived from field
APD:Camp               LIKE(APD:Camp)                 !List box control field - type derived from field
APD:N0_tran            LIKE(APD:N0_tran)              !List box control field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Transaksi Instalasi Farmasi - Rawat Jalan BPJS'),AT(,,532,309),FONT('Arial',8,,),CENTER,IMM,HLP('Tran_Poliklinik'),MSG('Transaksi Instalasi Farmasi'),SYSTEM,GRAY,MDI
                       LIST,AT(13,20,514,109),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('40L|FM~Nomor RM~C@N010_@96L|FM~Nama~C@s35@100L|FM~Kontraktor~C@s100@44L|FM~Tangg' &|
   'al~C@D8@55R(1)|M*~Biaya~C(0)@n-15.2@64L|M~No Transaksi~C@s15@44L|M~No Billing~@s' &|
   '10@35R(1)|M~Jam~C(0)@t04@45L|M~Kode Apotik~@s5@40L|M~Asal~@s10@27L|M~User~@s4@37' &|
   'L|M~cara bayar~@n1@40L|M~Kontrak~@s10@20L|M~dokter~@s5@27L|M~Lunas~@s5@'),FROM(Queue:Browse:1)
                       LIST,AT(9,162,515,119),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('45L|FM~Kode Barang~C@s10@160L|FM~Nama Obat~C@s40@78L|FM~Keterangan~C@s50@71D(14)' &|
   '|M~Jumlah~C(0)@n-14.2@59R(2)|M~Total~C(0)@n-15.2@60R(2)|M~Diskon~C(0)@n-15.2@60L' &|
   '~Camp~C@n2@60L~N 0 tran~C@s15@'),FROM(Queue:Browse)
                       BUTTON('Button 9'),AT(71,289,45,14),USE(?Button9),HIDE
                       BUTTON('Cetak &Detail'),AT(9,130,61,26),USE(?Print),LEFT,FONT('Times New Roman',10,COLOR:Blue,FONT:bold),HLP('Cetak Detail Transaksi'),MSG('Mencetak Detail Transaksi'),ICON(ICON:Print)
                       BUTTON('Cetak &Nota'),AT(404,137,67,15),USE(?Print:2),HIDE,LEFT,FONT('Times New Roman',,COLOR:Blue,FONT:bold),HLP('Cetak Nota transaksi'),MSG('Mencetak Nota Transaksi'),ICON(ICON:Print1)
                       BUTTON('T&ransaksi (Insert)'),AT(326,130,76,26),USE(?Insert:3),LEFT,FONT('Times New Roman',10,,FONT:bold+FONT:italic),HLP('Transaksi Barang'),MSG('Melakukan Transaksi Barang'),TIP('Transaksi Barang'),KEY(InsertKey),ICON(ICON:Open)
                       BUTTON('&Select'),AT(279,1,45,14),USE(?Select:2),HIDE
                       BUTTON('&Change'),AT(229,1,45,14),USE(?Change:3),DISABLE,HIDE,DEFAULT
                       BUTTON('&Delete'),AT(179,1,45,14),USE(?Delete:3),DISABLE,HIDE
                       SHEET,AT(4,4,524,156),USE(?CurrentTab)
                         TAB('No. Transaksi :'),USE(?Tab:2)
                           BUTTON('Cetak &Detail'),AT(73,130,61,26),USE(?Print:3),HIDE,LEFT,FONT('Times New Roman',10,,FONT:bold),HLP('Cetak Detail Transaksi'),MSG('Mencetak Detail Transaksi'),ICON(ICON:Print)
                           ENTRY(@s15),AT(235,137,69,15),USE(LOC::No_tran),FONT('Times New Roman',10,COLOR:Black,),MSG('Nomor Transaksi'),TIP('Nomor Transaksi')
                           PROMPT('No. Transaksi :'),AT(177,140),USE(?LOC::No_tran:Prompt),TRN,FONT('Times New Roman',10,COLOR:Black,)
                         END
                         TAB('Nomor RM'),USE(?Tab:3)
                           PROMPT('Nomor RM :'),AT(83,138),USE(?APHB:Nomor_mr:Prompt)
                         END
                       END
                       BUTTON('&Tutup'),AT(362,285,87,20),USE(?Close)
                       BUTTON('Help'),AT(329,1,45,14),USE(?Help),HIDE,STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
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
ResetFromAsk           PROCEDURE(*BYTE Request,*BYTE Response),DERIVED ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
SetQueueRecord         PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 2
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
  IF RECORDS(ISetupAp) = 0 THEN
     MESSAGE ('Jalankan menu SET UP dahulu')
     POST(EVENT:CloseWindow)
  END
  LOOP
      Iset:deskripsi = 'Bea_R'
      Get(IsetupAp,ISET:by_deskripsi)
      IF ERRORCODE() > 0
          CYCLE
      ELSE
          GL_beaR = Iset:Nilai
          BREAK
      END
  END
  LOOP
      Iset:deskripsi = 'KLS_1'
      Get(IsetupAp,Iset:by_deskripsi)
      IF ERRORCODE() > 0 THEN
          CYcLE
      ELSE
          Glo::rwt1 = Iset:Nilai
          BREAK
      END
  END
  LOOP
      Iset:deskripsi = 'KLS_2'
      Get(IsetupAp,Iset:by_deskripsi)
      IF ERRORCODE() > 0 THEN
          CYCLE
      ELSE
          glo::rwt2 = Iset:Nilai
          BREAK
      END
  END
  LOOP
      Iset:deskripsi = 'KLS_3'
      Get(IsetupAp,Iset:by_deskripsi)
      IF ERRORCODE() > 0 THEN
          CYCLE
      ELSE
          glo::rwt3 = Iset:Nilai
          BREAK
      END
  END
  
  LOOP
      Iset:deskripsi = 'KLS_Vip'
      Get(IsetupAp,Iset:by_deskripsi)
      IF ERRORCODE() > 0 THEN
          CYCLE
      ELSE
          glo::rwtvip = Iset:Nilai
          BREAK
      END
  END
  LOOP
      Iset:deskripsi = 'PPN'
      Get(IsetupAp,Iset:by_deskripsi)
      IF ERRORCODE() > 0 THEN
          CYCLE
      ELSE
          GL_PPN = Iset:Nilai
          BREAK
      END
  END
  
  
  ! Untuk tambah 2 data di GBarang, yaitu _campur dan _ biaya ( untuk obat campur )
  GBAR:Kode_brg = '_Campur'
  GET(GBarang,GBAR:KeyKodeBrg)
  IF ERRORCODE() = 35
      GBAR:Kode_brg = '_Campur'
      GBAR:Nama_Brg = 'Total Obat Campur'
      Access:GBarang.Insert()
  END
  GBAR:Kode_brg = '_Biaya'
  GET(GBarang,GBAR:KeyKodeBrg)
  IF ERRORCODE() = 35
      GBAR:Kode_brg = '_Biaya'
      GBAR:Nama_Brg = 'Biaya Obat Campur'
      Access:GBarang.Insert()
  END
  ! Untuk transaksi rutine, jika ada discount
  GBAR:Kode_brg = '_Disc'
  GET(GBarang,GBAR:KeyKodeBrg)
  IF ERRORCODE() = 35
      GBAR:Kode_brg = '_Disc'
      GBAR:Nama_Brg = 'Discount'
      Access:GBarang.Insert()
  END
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_BrowseRawatJalanBpjs')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  WindowTanggal()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('VG_TANGGAL1',VG_TANGGAL1)                          ! Added by: BrowseBox(ABC)
  BIND('VG_TANGGAL2',VG_TANGGAL2)                          ! Added by: BrowseBox(ABC)
  BIND('Lunas',Lunas)                                      ! Added by: BrowseBox(ABC)
  loc::thread=glo::mainthreadno
  !POST(EVENT:Disable_RInap,,loc::thread)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:APDTRANS.Open                                     ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:APHTRANSBPJS.Open                                 ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Aphtransadd.Open                                  ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:ISetupAp.Open                                     ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:RI_PinRuang.UseFile                               ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:RI_HRInap.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITbrRwt.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:APHTRANSBPJS,SELF) ! Initialize the browse manager
  BRW6.Init(?List,Queue:Browse.ViewPosition,BRW6::View:Browse,Queue:Browse,Relate:APDTRANS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon APHB:Nomor_mr for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,APHB:by_medrec)  ! Add the sort order for APHB:by_medrec for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,APHB:Nomor_mr,1,BRW1)          ! Initialize the browse locator using  using key: APHB:by_medrec , APHB:Nomor_mr
  BRW1.SetFilter('(aphb:tanggal>=VG_TANGGAL1 and aphb:tanggal<<=VG_TANGGAL2)') ! Apply filter expression to browse
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon APHB:N0_tran for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,APHB:by_transaksi) ! Add the sort order for APHB:by_transaksi for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?LOC::No_tran,APHB:N0_tran,,BRW1) ! Initialize the browse locator using ?LOC::No_tran using key: APHB:by_transaksi , APHB:N0_tran
  BRW1.SetFilter('(aphb:tanggal>=VG_TANGGAL1 and aphb:tanggal<<=VG_TANGGAL2)') ! Apply filter expression to browse
  BRW1.AddField(APHB:Nomor_mr,BRW1.Q.APHB:Nomor_mr)        ! Field APHB:Nomor_mr is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nama,BRW1.Q.JPas:Nama)                ! Field JPas:Nama is a hot field or requires assignment from browse
  BRW1.AddField(JKon:NAMA_KTR,BRW1.Q.JKon:NAMA_KTR)        ! Field JKon:NAMA_KTR is a hot field or requires assignment from browse
  BRW1.AddField(APHB:Tanggal,BRW1.Q.APHB:Tanggal)          ! Field APHB:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(APHB:Biaya,BRW1.Q.APHB:Biaya)              ! Field APHB:Biaya is a hot field or requires assignment from browse
  BRW1.AddField(APHB:N0_tran,BRW1.Q.APHB:N0_tran)          ! Field APHB:N0_tran is a hot field or requires assignment from browse
  BRW1.AddField(APHB:NoNota,BRW1.Q.APHB:NoNota)            ! Field APHB:NoNota is a hot field or requires assignment from browse
  BRW1.AddField(APHB:Jam,BRW1.Q.APHB:Jam)                  ! Field APHB:Jam is a hot field or requires assignment from browse
  BRW1.AddField(APHB:Kode_Apotik,BRW1.Q.APHB:Kode_Apotik)  ! Field APHB:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(APHB:Asal,BRW1.Q.APHB:Asal)                ! Field APHB:Asal is a hot field or requires assignment from browse
  BRW1.AddField(APHB:User,BRW1.Q.APHB:User)                ! Field APHB:User is a hot field or requires assignment from browse
  BRW1.AddField(APHB:cara_bayar,BRW1.Q.APHB:cara_bayar)    ! Field APHB:cara_bayar is a hot field or requires assignment from browse
  BRW1.AddField(APHB:Kontrak,BRW1.Q.APHB:Kontrak)          ! Field APHB:Kontrak is a hot field or requires assignment from browse
  BRW1.AddField(APHB:dokter,BRW1.Q.APHB:dokter)            ! Field APHB:dokter is a hot field or requires assignment from browse
  BRW1.AddField(Lunas,BRW1.Q.Lunas)                        ! Field Lunas is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nomor_mr,BRW1.Q.JPas:Nomor_mr)        ! Field JPas:Nomor_mr is a hot field or requires assignment from browse
  BRW1.AddField(JKon:KODE_KTR,BRW1.Q.JKon:KODE_KTR)        ! Field JKon:KODE_KTR is a hot field or requires assignment from browse
  BRW6.Q &= Queue:Browse
  BRW6.AddSortOrder(,APD:notran_kode)                      ! Add the sort order for APD:notran_kode for sort order 1
  BRW6.AddRange(APD:N0_tran,Relate:APDTRANS,Relate:APHTRANSBPJS) ! Add file relationship range limit for sort order 1
  BRW6.AddLocator(BRW6::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW6::Sort0:Locator.Init(,APD:Kode_brg,,BRW6)            ! Initialize the browse locator using  using key: APD:notran_kode , APD:Kode_brg
  BRW6.AddField(APD:Kode_brg,BRW6.Q.APD:Kode_brg)          ! Field APD:Kode_brg is a hot field or requires assignment from browse
  BRW6.AddField(GBAR:Nama_Brg,BRW6.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW6.AddField(GBAR:Ket2,BRW6.Q.GBAR:Ket2)                ! Field GBAR:Ket2 is a hot field or requires assignment from browse
  BRW6.AddField(APD:Jumlah,BRW6.Q.APD:Jumlah)              ! Field APD:Jumlah is a hot field or requires assignment from browse
  BRW6.AddField(APD:Total,BRW6.Q.APD:Total)                ! Field APD:Total is a hot field or requires assignment from browse
  BRW6.AddField(APD:Diskon,BRW6.Q.APD:Diskon)              ! Field APD:Diskon is a hot field or requires assignment from browse
  BRW6.AddField(APD:Camp,BRW6.Q.APD:Camp)                  ! Field APD:Camp is a hot field or requires assignment from browse
  BRW6.AddField(APD:N0_tran,BRW6.Q.APD:N0_tran)            ! Field APD:N0_tran is a hot field or requires assignment from browse
  BRW6.AddField(GBAR:Kode_brg,BRW6.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_BrowseRawatJalanBpjs',QuickWindow)    ! Restore window settings from non-volatile store
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
    Relate:APHTRANSBPJS.Close
    Relate:Aphtransadd.Close
    Relate:ISetupAp.Close
    Relate:Nomor_SKR.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_BrowseRawatJalanBpjs',QuickWindow) ! Save window data to non-volatile store
  END
  !POST(EVENT:Enable_RInap,,loc::thread)
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
      Trig_UpdateRawatJalanBpjs
      PrintTransRawatInapA5bpjs
      Cetak_nota_apotik11bpjs
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
    OF ?Button9
      IF APHB:Ra_jal = 1 AND APHB:Bayar = 0
          MESSAGE('Belum Transaksi Kasir, Tidak dapat dibuat SBBK / Nota')
          RETURN Level:Notify
      END
      if APHB:Biaya>=0 then
         printtransrawatinap1bpjs
      else
         printreturrawatinap1bpjs
      end
    OF ?Print
      IF APHB:Ra_jal = 1 AND APHB:Bayar = 0
          MESSAGE('Belum Transaksi Kasir, Tidak dapat dibuat SBBK / Nota')
          RETURN Level:Notify
      END
      
    OF ?Insert:3
      NOM1:No_urut=1
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
      glo:nomor=APHB:N0_tran
      if APHB:Biaya>0 then
         start(PrintTransRawatInap1CDbpjs,25000)
      else
         start(PrintReturRawatInap1CDbpjs,25000)
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


BRW1.ResetFromAsk PROCEDURE(*BYTE Request,*BYTE Response)

  CODE
  PARENT.ResetFromAsk(Request,Response)
  if request=1 and response=1 then
     
  
     
  !   vl_total=0
  !   set(BRW6::View:Browse)
  !   loop
  !      next(BRW6::View:Browse)
  !      if errorcode() then break.
  !      vl_total+=APD:Total
  !   end
     
  
  !   vl_total=0
  !   apdtrans{prop:sql}='select * from dba.apdtrans where n0_tran='''&APH:N0_tran&''''
  !   loop
  !      if access:apdtrans.next()<>level:benign then break.
  !      vl_total+=APD:Total
  !   end
  !   message(vl_total&' '&APH:Biaya)
  !
  !   RI_HR:Nomor_mr       =APHB:Nomor_mr
  !   RI_HR:Status_Keluar  =0
  !   if access:ri_hrinap.fetch(RI_HR:KNomr_status)=level:benign then
  !      APH1:Nomor    =APHB:N0_tran
  !      APH1:Ruangan  =RI_HR:LastRoom
  !      access:aphtransadd.insert()
  !   end
  !   glo::no_nota=APHB:N0_tran
  !   PrintTransRawatInap
  
  end


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


BRW1.SetQueueRecord PROCEDURE

  CODE
  IF ('APHB:Bayar' = 1)
    Lunas = 'Lunas'
  ELSE
    Lunas = 'Belum'
  END
  IF ('APHB:Ra_jal' = 1)
    APHB:Ra_jal = 'Y'
  ELSE
    APHB:Ra_jal = 'N'
  END
  PARENT.SetQueueRecord
  
  SELF.Q.APHB:Biaya_NormalFG = -1                          ! Set color values for APHB:Biaya
  SELF.Q.APHB:Biaya_NormalBG = -1
  SELF.Q.APHB:Biaya_SelectedFG = -1
  SELF.Q.APHB:Biaya_SelectedBG = -1
  SELF.Q.Lunas = Lunas                                     !Assign formula result to display queue


BRW6.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW6.ResetQueue PROCEDURE(BYTE ResetMode)

  CODE
  PARENT.ResetQueue(ResetMode)
  vl_total=0
  set(BRW6::View:Browse)
  loop
     next(BRW6::View:Browse)
     if errorcode() then break.
     vl_total+=APD:Total-APD:Diskon
  end
  
  !message(round(vl_total,1)&' '&APHB:Biaya)
  
  if round(vl_total,1)<>APHB:Biaya then
     if (APHB:Biaya-round(vl_total,1))<=1 then
        vl_total=round(vl_total,1)+1
     else
        message('Total beda dengan detil, harap hubungi Divisi SIMRS ! '&round(vl_total,1)&' '&APHB:Biaya)
        access:aphtransbpjs.fetch(APHB:by_transaksi)
        APHB:Biaya=round(vl_total,1)
        access:aphtransbpjs.update()
        message('Data sudah disamakan, silahkan cetak ulang struk !')
     end
  end


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

