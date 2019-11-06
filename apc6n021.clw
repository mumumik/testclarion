

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N021.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N126.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N127.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N128.INC'),ONCE        !Req'd for module callout resolution
                     END


BrowseDaruratAPHTRANS PROCEDURE                            ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
vl_total             REAL                                  !
FilesOpened          BYTE                                  !
Lunas                STRING(5)                             !
Poliklinik           STRING(1)                             !
LOC::No_tran         STRING(15)                            !Nomor Transaksi
loc::thread          BYTE                                  !
BRW1::View:Browse    VIEW(APHTRANS)
                       PROJECT(APH:Nomor_mr)
                       PROJECT(APH:Tanggal)
                       PROJECT(APH:Biaya)
                       PROJECT(APH:N0_tran)
                       PROJECT(APH:NoNota)
                       PROJECT(APH:Kode_Apotik)
                       PROJECT(APH:Asal)
                       PROJECT(APH:User)
                       PROJECT(APH:cara_bayar)
                       PROJECT(APH:Jam)
                       PROJECT(APH:Batal)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APH:Nomor_mr           LIKE(APH:Nomor_mr)             !List box control field - type derived from field
APH:Tanggal            LIKE(APH:Tanggal)              !List box control field - type derived from field
APH:Biaya              LIKE(APH:Biaya)                !List box control field - type derived from field
APH:N0_tran            LIKE(APH:N0_tran)              !List box control field - type derived from field
APH:NoNota             LIKE(APH:NoNota)               !List box control field - type derived from field
Lunas                  LIKE(Lunas)                    !List box control field - type derived from local data
APH:Kode_Apotik        LIKE(APH:Kode_Apotik)          !List box control field - type derived from field
APH:Asal               LIKE(APH:Asal)                 !List box control field - type derived from field
APH:User               LIKE(APH:User)                 !List box control field - type derived from field
APH:cara_bayar         LIKE(APH:cara_bayar)           !List box control field - type derived from field
APH:Jam                LIKE(APH:Jam)                  !List box control field - type derived from field
APH:NoNota             LIKE(APH:NoNota)               !List box control field - type derived from field - type derived from field
APH:Batal              LIKE(APH:Batal)                !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW6::View:Browse    VIEW(APDTRANS)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Total)
                       PROJECT(APD:Harga_Dasar)
                       PROJECT(APD:Diskon)
                       PROJECT(APD:Camp)
                       PROJECT(APD:N0_tran)
                       JOIN(GBAR:KeyKodeBrg,APD:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
APD:Kode_brg           LIKE(APD:Kode_brg)             !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
APD:Jumlah             LIKE(APD:Jumlah)               !List box control field - type derived from field
APD:Total              LIKE(APD:Total)                !List box control field - type derived from field
APD:Harga_Dasar        LIKE(APD:Harga_Dasar)          !List box control field - type derived from field
APD:Diskon             LIKE(APD:Diskon)               !List box control field - type derived from field
APD:Camp               LIKE(APD:Camp)                 !List box control field - type derived from field
APD:N0_tran            LIKE(APD:N0_tran)              !List box control field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Transaksi Instalasi Farmasi - Rawat Inap'),AT(,,457,244),FONT('Arial',8,,),CENTER,IMM,HLP('Tran_Poliklinik'),MSG('Transaksi Instalasi Farmasi'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,435,57),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('49L|FM~Nomor RM~C@N010_@47R(1)|M~Tanggal~C(0)@D8@55R(1)|M~Biaya~C(0)@n-15.2@64L|' &|
   'M~N 0 tran~C@s15@47L|M~No Nota~C@s10@27L|M~Lunas~@s5@41L|M~Kode Apotik~@s5@44L|M' &|
   '~Asal~@s10@16L|M~User~@s4@19L|M~cara bayar~@n1@40L|M~Jam~@t06@40L|M~No Nota~@s10' &|
   '@12L|M~Batal~@n3@'),FROM(Queue:Browse:1)
                       LIST,AT(5,117,443,103),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('45L|FM~Kode Barang~C@s10@129L|FM~Nama Obat~C@s40@71D(14)|M~Jumlah~C(0)@n-14.2@59' &|
   'R(2)|M~Total~C(0)@n-15.2@49R(2)|M~Harga Dasar~C(0)@n-15.2@60R(2)|M~Diskon~C(0)@n' &|
   '-15.2@60L~Camp~C@n2@60L~N 0 tran~C@s15@'),FROM(Queue:Browse)
                       BUTTON('Insert Ke Billing'),AT(7,223,81,14),USE(?Button12)
                       BUTTON('&Insert'),AT(114,225,42,12),USE(?Insert)
                       BUTTON('&Change'),AT(156,225,42,12),USE(?Change)
                       BUTTON('&Delete'),AT(198,225,42,12),USE(?Delete),DISABLE,HIDE
                       PROMPT('TOTAL :'),AT(242,226),USE(?vl_total:Prompt)
                       ENTRY(@n-17.2),AT(273,224,69,15),USE(vl_total),DECIMAL(14)
                       BUTTON('Cetak &Detail'),AT(9,82,61,26),USE(?Print),LEFT,FONT('Arial',8,,FONT:bold),HLP('Cetak Detail Transaksi'),MSG('Mencetak Detail Transaksi'),ICON(ICON:Print)
                       BUTTON('Cetak &Nota'),AT(78,82,61,26),USE(?Print:2),LEFT,FONT('Arial',8,,FONT:bold),HLP('Cetak Nota transaksi'),MSG('Mencetak Nota Transaksi'),ICON(ICON:Print1)
                       BUTTON('T&ransaksi (Insert)'),AT(311,83,76,26),USE(?Insert:3),LEFT,FONT('Arial',8,,FONT:bold+FONT:italic),HLP('Transaksi Barang'),MSG('Melakukan Transaksi Barang'),TIP('Transaksi Barang'),KEY(InsertKey),ICON(ICON:Open)
                       BUTTON('&Select'),AT(279,1,45,14),USE(?Select:2),HIDE
                       BUTTON('&Change'),AT(229,1,45,14),USE(?Change:3),DEFAULT
                       BUTTON('&Delete'),AT(179,1,45,14),USE(?Delete:3),DISABLE,HIDE
                       SHEET,AT(4,4,445,111),USE(?CurrentTab)
                         TAB('No. Nota'),USE(?Tab:2)
                           BUTTON('&Query'),AT(394,91,45,14),USE(?Query)
                           ENTRY(@s15),AT(235,89,69,15),USE(LOC::No_tran),FONT('Times New Roman',10,COLOR:Black,),MSG('Nomor Transaksi'),TIP('Nomor Transaksi')
                           PROMPT('No. Transaksi :'),AT(177,92),USE(?LOC::No_tran:Prompt),TRN,FONT('Arial',8,COLOR:Black,)
                         END
                         TAB('Nomor RM'),USE(?Tab:3)
                         END
                         TAB('Nota'),USE(?Tab3)
                           PROMPT('No Nota:'),AT(145,89),USE(?APH:NoNota:Prompt)
                           ENTRY(@s10),AT(186,89,78,15),USE(APH:NoNota)
                         END
                       END
                       BUTTON('&Tutup'),AT(357,223,87,20),USE(?Close)
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
QBE10                QueryFormClass                        ! QBE List Class. 
QBV10                QueryFormVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
SetQueueRecord         PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW1::Sort1:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW6                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetFromView          PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW6::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::EIPManager     BrowseEIPManager                      ! Browse EIP Manager for Browse using ?Browse:1
BRW6::EIPManager     BrowseEIPManager                      ! Browse EIP Manager for Browse using ?List
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
  !! untuk mengambil data setup persentase
  !IF RECORDS(ISetupAp) = 0 THEN
  !   MESSAGE ('Jalankan menu SET UP dahulu')
  !   POST(EVENT:CloseWindow)
  !END
  !LOOP
  !    Iset:deskripsi = 'Bea_R'
  !    Get(IsetupAp,ISET:by_deskripsi)
  !    IF ERRORCODE() > 0
  !        CYCLE
  !    ELSE
  !        GL_beaR = Iset:Nilai
  !        BREAK
  !    END
  !END
  !LOOP
  !    Iset:deskripsi = 'KLS_1'
  !    Get(IsetupAp,Iset:by_deskripsi)
  !    IF ERRORCODE() > 0 THEN
  !        CYcLE
  !    ELSE
  !        Glo::rwt1 = Iset:Nilai
  !        BREAK
  !    END
  !END
  !LOOP
  !    Iset:deskripsi = 'KLS_2'
  !    Get(IsetupAp,Iset:by_deskripsi)
  !    IF ERRORCODE() > 0 THEN
  !        CYCLE
  !    ELSE
  !        glo::rwt2 = Iset:Nilai
  !        BREAK
  !    END
  !END
  !LOOP
  !    Iset:deskripsi = 'KLS_3'
  !    Get(IsetupAp,Iset:by_deskripsi)
  !    IF ERRORCODE() > 0 THEN
  !        CYCLE
  !    ELSE
  !        glo::rwt3 = Iset:Nilai
  !        BREAK
  !    END
  !END
  !
  !LOOP
  !    Iset:deskripsi = 'KLS_Vip'
  !    Get(IsetupAp,Iset:by_deskripsi)
  !    IF ERRORCODE() > 0 THEN
  !        CYCLE
  !    ELSE
  !        glo::rwtvip = Iset:Nilai
  !        BREAK
  !    END
  !END
  !LOOP
  !    Iset:deskripsi = 'PPN'
  !    Get(IsetupAp,Iset:by_deskripsi)
  !    IF ERRORCODE() > 0 THEN
  !        CYCLE
  !    ELSE
  !        GL_PPN = Iset:Nilai
  !        BREAK
  !    END
  !END
  !
  !
  !! Untuk tambah 2 data di GBarang, yaitu _campur dan _ biaya ( untuk obat campur )
  !GBAR:Kode_brg = '_Campur'
  !GET(GBarang,GBAR:KeyKodeBrg)
  !IF ERRORCODE() = 35
  !    GBAR:Kode_brg = '_Campur'
  !    GBAR:Nama_Brg = 'Total Obat Campur'
  !    Access:GBarang.Insert()
  !END
  !GBAR:Kode_brg = '_Biaya'
  !GET(GBarang,GBAR:KeyKodeBrg)
  !IF ERRORCODE() = 35
  !    GBAR:Kode_brg = '_Biaya'
  !    GBAR:Nama_Brg = 'Biaya Obat Campur'
  !    Access:GBarang.Insert()
  !END
  !! Untuk transaksi rutine, jika ada discount
  !GBAR:Kode_brg = '_Disc'
  !GET(GBarang,GBAR:KeyKodeBrg)
  !IF ERRORCODE() = 35
  !    GBAR:Kode_brg = '_Disc'
  !    GBAR:Nama_Brg = 'Discount'
  !    Access:GBarang.Insert()
  !END
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowseDaruratAPHTRANS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Lunas',Lunas)                                      ! Added by: BrowseBox(ABC)
  loc::thread=glo::mainthreadno
  !POST(EVENT:Disable_RInap,,loc::thread)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:APDTRANS.Open                                     ! File JDDBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:ISetupAp.Open                                     ! File JDDBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:JDBILLING.Open                                    ! File JDDBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:JDDBILLING.Open                                   ! File JDDBILLING used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:RI_PinRuang.UseFile                               ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:RI_HRInap.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:APHTRANS,SELF) ! Initialize the browse manager
  BRW6.Init(?List,Queue:Browse.ViewPosition,BRW6::View:Browse,Queue:Browse,Relate:APDTRANS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  QBE10.Init(QBV10, INIMgr,'BrowseDaruratAPHTRANS', GlobalErrors)
  QBE10.QkSupport = True
  QBE10.QkMenuIcon = 'QkQBE.ico'
  QBE10.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon APH:Nomor_mr for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,APH:by_medrec)   ! Add the sort order for APH:by_medrec for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,APH:Nomor_mr,1,BRW1)           ! Initialize the browse locator using  using key: APH:by_medrec , APH:Nomor_mr
  BRW1.AddSortOrder(,APH:nonota_aphtras_key)               ! Add the sort order for APH:nonota_aphtras_key for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(?APH:NoNota,APH:NoNota,1,BRW1)  ! Initialize the browse locator using ?APH:NoNota using key: APH:nonota_aphtras_key , APH:NoNota
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon APH:N0_tran for sort order 3
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,APH:by_transaksi) ! Add the sort order for APH:by_transaksi for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(?LOC::No_tran,APH:N0_tran,,BRW1) ! Initialize the browse locator using ?LOC::No_tran using key: APH:by_transaksi , APH:N0_tran
  BRW1.AddField(APH:Nomor_mr,BRW1.Q.APH:Nomor_mr)          ! Field APH:Nomor_mr is a hot field or requires assignment from browse
  BRW1.AddField(APH:Tanggal,BRW1.Q.APH:Tanggal)            ! Field APH:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(APH:Biaya,BRW1.Q.APH:Biaya)                ! Field APH:Biaya is a hot field or requires assignment from browse
  BRW1.AddField(APH:N0_tran,BRW1.Q.APH:N0_tran)            ! Field APH:N0_tran is a hot field or requires assignment from browse
  BRW1.AddField(APH:NoNota,BRW1.Q.APH:NoNota)              ! Field APH:NoNota is a hot field or requires assignment from browse
  BRW1.AddField(Lunas,BRW1.Q.Lunas)                        ! Field Lunas is a hot field or requires assignment from browse
  BRW1.AddField(APH:Kode_Apotik,BRW1.Q.APH:Kode_Apotik)    ! Field APH:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(APH:Asal,BRW1.Q.APH:Asal)                  ! Field APH:Asal is a hot field or requires assignment from browse
  BRW1.AddField(APH:User,BRW1.Q.APH:User)                  ! Field APH:User is a hot field or requires assignment from browse
  BRW1.AddField(APH:cara_bayar,BRW1.Q.APH:cara_bayar)      ! Field APH:cara_bayar is a hot field or requires assignment from browse
  BRW1.AddField(APH:Jam,BRW1.Q.APH:Jam)                    ! Field APH:Jam is a hot field or requires assignment from browse
  BRW1.AddField(APH:NoNota,BRW1.Q.APH:NoNota)              ! Field APH:NoNota is a hot field or requires assignment from browse
  BRW1.AddField(APH:Batal,BRW1.Q.APH:Batal)                ! Field APH:Batal is a hot field or requires assignment from browse
  BRW6.Q &= Queue:Browse
  BRW6.AddSortOrder(,APD:notran_kode)                      ! Add the sort order for APD:notran_kode for sort order 1
  BRW6.AddRange(APD:N0_tran,Relate:APDTRANS,Relate:APHTRANS) ! Add file relationship range limit for sort order 1
  BRW6.AddLocator(BRW6::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW6::Sort0:Locator.Init(,APD:Kode_brg,,BRW6)            ! Initialize the browse locator using  using key: APD:notran_kode , APD:Kode_brg
  BRW6.AddField(APD:Kode_brg,BRW6.Q.APD:Kode_brg)          ! Field APD:Kode_brg is a hot field or requires assignment from browse
  BRW6.AddField(GBAR:Nama_Brg,BRW6.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW6.AddField(APD:Jumlah,BRW6.Q.APD:Jumlah)              ! Field APD:Jumlah is a hot field or requires assignment from browse
  BRW6.AddField(APD:Total,BRW6.Q.APD:Total)                ! Field APD:Total is a hot field or requires assignment from browse
  BRW6.AddField(APD:Harga_Dasar,BRW6.Q.APD:Harga_Dasar)    ! Field APD:Harga_Dasar is a hot field or requires assignment from browse
  BRW6.AddField(APD:Diskon,BRW6.Q.APD:Diskon)              ! Field APD:Diskon is a hot field or requires assignment from browse
  BRW6.AddField(APD:Camp,BRW6.Q.APD:Camp)                  ! Field APD:Camp is a hot field or requires assignment from browse
  BRW6.AddField(APD:N0_tran,BRW6.Q.APD:N0_tran)            ! Field APD:N0_tran is a hot field or requires assignment from browse
  BRW6.AddField(GBAR:Kode_brg,BRW6.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseDaruratAPHTRANS',QuickWindow)        ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE10,1)
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW6.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW6.ToolbarItem.HelpButton = ?Help
  BRW1.PrintProcedure = 1
  BRW1.PrintControl = ?Print
  BRW6.PrintProcedure = 2
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
    Relate:ISetupAp.Close
    Relate:JDBILLING.Close
    Relate:JDDBILLING.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseDaruratAPHTRANS',QuickWindow)     ! Save window data to non-volatile store
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
      PrintTransRawatInap11
      Cetak_nota_apotik111
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
    OF ?Print
      !IF APH:Ra_jal = 1 AND APH:Bayar = 0
      !    MESSAGE('Belum Transaksi Kasir, Tidak dapat dibuat SBBK / Nota')
      !    RETURN Level:Notify
      !END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button12
      ThisWindow.Update
         JDB:NOMOR            =APH:NoNota
         JDB:NOTRAN_INTERNAL  =APH:N0_tran
         JDB:KODEJASA         ='FAR.00001.00.00'
         JDB:TOTALBIAYA       =APH:Biaya
         JDB:KETERANGAN       =''
         JDB:JUMLAH           =1
         if GL_entryapotik='FM04' or GL_entryapotik='FM09' or GL_entryapotik='FM10' then
            JDB:KODE_BAGIAN      ='FARMASI'
         else
            JDB:KODE_BAGIAN      ='FARPD'
         end
         JDB:VALIDASI         =0
         JDB:STATUS_TUTUP     =0
         JDB:StatusBatal      =0
         JDB:VALIDASI         =0
         JDB:STATUS_TUTUP     =0
         JDB:StatusBatal      =0
         JDB:JUMLAH_BYR       =0
         JDB:SISA_BYR         =0
         JDB:NO_PEMBAYARAN    =''
         JDB:DISCOUNT         =0
         JDB:BYRSELISIH       =0
         JDB:VALIDASI         =0
         JDB:JenisPembayaran  =APH:cara_bayar
         JDB:TglTransaksi     =APH:Tanggal
         JDB:JamTransaksi     =APH:Jam
         JDB:ValidasiProduksi =1
         JDB:TglValidasiProduksi=APH:Tanggal
         JDB:JamValidasiProduksi=APH:Jam
         JDB:UservalidasiProduksi=APH:User
         access:jdbilling.insert()
      
         JDDB:NOMOR           =APH:NoNota
         JDDB:NOTRAN_INTERNAL =APH:N0_tran
         JDDB:KODEJASA        ='FAR.00001.00.00'
         JDDB:SUBKODEJASA     ='FAR.00001.04.00'
         JDDB:KETERANGAN      =''
         JDDB:JUMLAH          =1
         JDDB:TOTALBIAYA      =APH:Biaya
         JDB:ValidasiProduksi =1
         access:jddbilling.insert()
      
      
      
    OF ?Change:3
      ThisWindow.Update
      !cycle
    OF ?Delete:3
      ThisWindow.Update
      !cycle
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
  SELF.EIP &= BRW1::EIPManager                             ! Set the EIP manager
  SELF.AddEditControl(,6)
  SELF.DeleteAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Default+EIPAction:Remain+EIPAction:RetainColumn
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
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  IF (APH:Bayar = 1)
    Lunas = 'Lunas'
  ELSE
    Lunas = 'Belum'
  END
  IF (APH:Ra_jal = 1)
    APH:Ra_jal = 'Y'
  ELSE
    APH:Ra_jal = 'N'
  END
  PARENT.SetQueueRecord
  
  SELF.Q.Lunas = Lunas                                     !Assign formula result to display queue


BRW6.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW6.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  SELF.EIP &= BRW6::EIPManager                             ! Set the EIP manager
  SELF.AddEditControl(,2)
  SELF.DeleteAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Default+EIPAction:Remain+EIPAction:RetainColumn
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW6.ResetFromView PROCEDURE

vl_total:Sum         REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:APDTRANS.SetQuickScan(1)
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
    vl_total:Sum += APD:Total
  END
  vl_total = vl_total:Sum
  PARENT.ResetFromView
  Relate:APDTRANS.SetQuickScan(0)
  SETCURSOR()


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

BrowseBPBManual PROCEDURE                                  ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
str                  STRING(20)                            !
vl_nomor             STRING(10)                            !
loc::thread          BYTE                                  !
BRW1::View:Browse    VIEW(GHBPB)
                       PROJECT(GHBPB:NoBPB)
                       PROJECT(GHBPB:Kode_Apotik)
                       PROJECT(GHBPB:Tanggal)
                       PROJECT(GHBPB:JamInput)
                       PROJECT(GHBPB:Status)
                       PROJECT(GHBPB:UserInput)
                       JOIN(GAPO:KeyNoApotik,GHBPB:Kode_Apotik)
                         PROJECT(GAPO:Nama_Apotik)
                         PROJECT(GAPO:Kode_Apotik)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GHBPB:NoBPB            LIKE(GHBPB:NoBPB)              !List box control field - type derived from field
GHBPB:Kode_Apotik      LIKE(GHBPB:Kode_Apotik)        !List box control field - type derived from field
GAPO:Nama_Apotik       LIKE(GAPO:Nama_Apotik)         !List box control field - type derived from field
GHBPB:Tanggal          LIKE(GHBPB:Tanggal)            !List box control field - type derived from field
GHBPB:JamInput         LIKE(GHBPB:JamInput)           !List box control field - type derived from field
GHBPB:Status           LIKE(GHBPB:Status)             !List box control field - type derived from field
GHBPB:UserInput        LIKE(GHBPB:UserInput)          !List box control field - type derived from field
GAPO:Kode_Apotik       LIKE(GAPO:Kode_Apotik)         !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(GDBPB)
                       PROJECT(GDBPB:Kode_Brg)
                       PROJECT(GDBPB:Jumlah)
                       PROJECT(GDBPB:Qty_Accepted)
                       PROJECT(GDBPB:Keterangan)
                       PROJECT(GDBPB:NoBPB)
                       JOIN(GBAR:KeyKodeBrg,GDBPB:Kode_Brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Ket1)
                         PROJECT(GBAR:No_Satuan)
                         PROJECT(GBAR:Ket2)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
GDBPB:Kode_Brg         LIKE(GDBPB:Kode_Brg)           !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Ket1              LIKE(GBAR:Ket1)                !List box control field - type derived from field
GBAR:No_Satuan         LIKE(GBAR:No_Satuan)           !List box control field - type derived from field
GDBPB:Jumlah           LIKE(GDBPB:Jumlah)             !List box control field - type derived from field
GDBPB:Qty_Accepted     LIKE(GDBPB:Qty_Accepted)       !List box control field - type derived from field
GBAR:Ket2              LIKE(GBAR:Ket2)                !List box control field - type derived from field
GDBPB:Keterangan       LIKE(GDBPB:Keterangan)         !List box control field - type derived from field
GDBPB:NoBPB            LIKE(GDBPB:NoBPB)              !Primary key field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('BPB '),AT(,,463,258),FONT('Arial',8,,),CENTER,IMM,HLP('BrowseInputOrder'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,447,68),USE(?Browse:1),IMM,HVSCROLL,FONT('Arial',8,,FONT:regular),MSG('Browsing Records'),FORMAT('45L(2)|_M~Nomor~@s10@45L(2)|_M~Kode Apotik~@s5@104L(2)|_M~Nama SubFarmasi~@s30@4' &|
   '9R(2)|_M~Tanggal~C(0)@D6@39R(2)|_M~Jam Input~C(0)@t04@28L(2)|_M~Status~@s5@80L(2' &|
   ')|_M~User Input~@s20@'),FROM(Queue:Browse:1)
                       BUTTON('&Tambah (+)'),AT(99,92,67,16),USE(?Insert:2),DISABLE,HIDE,LEFT,KEY(PlusKey),ICON(ICON:New)
                       BUTTON('&Ubah'),AT(170,93,67,14),USE(?Change:2),LEFT,ICON(ICON:Open),DEFAULT
                       BUTTON('&Hapus'),AT(241,93,67,14),USE(?Delete:2),DISABLE,HIDE,LEFT,ICON(ICON:Cut)
                       PANEL,AT(4,114,456,124),USE(?Panel1)
                       LIST,AT(8,118,447,115),USE(?List),IMM,HVSCROLL,FONT('Arial',8,,FONT:regular),MSG('Browsing Records'),FORMAT('45L(1)|_M~Kode Brg~C@s10@129L(1)|_M~Nama Obat~C@s40@65L(1)|_M~Kemasan~C@s20@43L(' &|
   '1)|_M~Satuan~C@s10@54D(14)|_M~Jumlah~C(1)@n16.2@48R(1)|_M~Diterima~@n-12.2@77L(1' &|
   ')|_M~Ket~C@s50@80D(14)|_M~Keterangan~C(1)@s20@'),FROM(Queue:Browse)
                       SHEET,AT(4,5,456,107),USE(?CurrentTab)
                         TAB('Terurut berdasar No BPB'),USE(?Tab:2)
                           PROMPT('Nomor:'),AT(11,94),USE(?GHBPB:NoBPB:Prompt)
                           ENTRY(@s10),AT(35,94,58,12),USE(GHBPB:NoBPB),MSG('No BPB'),TIP('No BPB')
                         END
                         TAB('Semua BPB'),USE(?Tab2)
                         END
                       END
                       BUTTON('&Selesai'),AT(99,241,67,14),USE(?Close),LEFT,ICON(ICON:Tick)
                       BUTTON('&Print'),AT(170,241,67,14),USE(?Button5),LEFT,FONT('Arial',9,COLOR:Black,FONT:bold+FONT:italic),ICON(ICON:Print1)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Ask                    PROCEDURE(BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetFromAsk           PROCEDURE(*BYTE Request,*BYTE Response),DERIVED ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  EntryLocatorClass                     ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - choice(?CurrentTab)=2
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW5                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetFromAsk           PROCEDURE(*BYTE Request,*BYTE Response),DERIVED ! Method added to host embed code
                     END

BRW5::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::EIPManager     BrowseEIPManager                      ! Browse EIP Manager for Browse using ?Browse:1
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
  GlobalErrors.SetProcedureName('BrowseBPBManual')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  loc::thread=glo::mainthreadno
  !POST(EVENT:Disable_BPB,,loc::thread)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:GApotik.SetOpenRelated()
  Relate:GApotik.Open                                      ! File GNOBBPB used by this procedure, so make sure it's RelationManager is open
  Relate:GNOABPB.Open                                      ! File GNOBBPB used by this procedure, so make sure it's RelationManager is open
  Relate:GNOBBPB.Open                                      ! File GNOBBPB used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  !set(GNOABPB)
  !loop
  !   access:gnoabpb.next()
  !   break
  !end
  !   If Records(GNOABPB) = 0 Then
  !    GNOABPB:No = 1
  !    GNOABPB:Nomor='BP'&format(month(today()),@P##P)&sub(format(year(today()),@P####P),3,2)&'0001'
  !    access:gnoabpb.Insert()
  !   End
  !
  !if month(today())<>format(sub(GNOABPB:Nomor,3,2),@n2) then
  !   GNOABPB:Nomor='BP'&format(month(today()),@P##P)&sub(format(year(today()),@P####P),3,2)&'0001'
  !   access:gnoabpb.update()
  !   set(GNOBBPB)
  !   loop
  !      if access:gnobbpb.next()<>level:benign then break.
  !      delete(gnobbpb)
  !   end
  !end
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GHBPB,SELF) ! Initialize the browse manager
  BRW5.Init(?List,Queue:Browse.ViewPosition,BRW5::View:Browse,Queue:Browse,Relate:GDBPB,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,GHBPB:KeyNoBPB)                       ! Add the sort order for GHBPB:KeyNoBPB for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,GHBPB:NoBPB,,BRW1)             ! Initialize the browse locator using  using key: GHBPB:KeyNoBPB , GHBPB:NoBPB
  BRW1.SetFilter('(GHBPB:Kode_Apotik=GL_entryapotik )')    ! Apply filter expression to browse
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon GHBPB:NoBPB for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,GHBPB:KeyNoBPB)  ! Add the sort order for GHBPB:KeyNoBPB for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?GHBPB:NoBPB,GHBPB:NoBPB,,BRW1) ! Initialize the browse locator using ?GHBPB:NoBPB using key: GHBPB:KeyNoBPB , GHBPB:NoBPB
  BRW1.AddField(GHBPB:NoBPB,BRW1.Q.GHBPB:NoBPB)            ! Field GHBPB:NoBPB is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB:Kode_Apotik,BRW1.Q.GHBPB:Kode_Apotik) ! Field GHBPB:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GAPO:Nama_Apotik,BRW1.Q.GAPO:Nama_Apotik)  ! Field GAPO:Nama_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB:Tanggal,BRW1.Q.GHBPB:Tanggal)        ! Field GHBPB:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB:JamInput,BRW1.Q.GHBPB:JamInput)      ! Field GHBPB:JamInput is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB:Status,BRW1.Q.GHBPB:Status)          ! Field GHBPB:Status is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB:UserInput,BRW1.Q.GHBPB:UserInput)    ! Field GHBPB:UserInput is a hot field or requires assignment from browse
  BRW1.AddField(GAPO:Kode_Apotik,BRW1.Q.GAPO:Kode_Apotik)  ! Field GAPO:Kode_Apotik is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse
  BRW5.AddSortOrder(,GDBPB:KeyBPBItem)                     ! Add the sort order for GDBPB:KeyBPBItem for sort order 1
  BRW5.AddRange(GDBPB:NoBPB,Relate:GDBPB,Relate:GHBPB)     ! Add file relationship range limit for sort order 1
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort0:Locator.Init(,GDBPB:Kode_Brg,,BRW5)          ! Initialize the browse locator using  using key: GDBPB:KeyBPBItem , GDBPB:Kode_Brg
  BRW5.AddField(GDBPB:Kode_Brg,BRW5.Q.GDBPB:Kode_Brg)      ! Field GDBPB:Kode_Brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Nama_Brg,BRW5.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Ket1,BRW5.Q.GBAR:Ket1)                ! Field GBAR:Ket1 is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:No_Satuan,BRW5.Q.GBAR:No_Satuan)      ! Field GBAR:No_Satuan is a hot field or requires assignment from browse
  BRW5.AddField(GDBPB:Jumlah,BRW5.Q.GDBPB:Jumlah)          ! Field GDBPB:Jumlah is a hot field or requires assignment from browse
  BRW5.AddField(GDBPB:Qty_Accepted,BRW5.Q.GDBPB:Qty_Accepted) ! Field GDBPB:Qty_Accepted is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Ket2,BRW5.Q.GBAR:Ket2)                ! Field GBAR:Ket2 is a hot field or requires assignment from browse
  BRW5.AddField(GDBPB:Keterangan,BRW5.Q.GDBPB:Keterangan)  ! Field GDBPB:Keterangan is a hot field or requires assignment from browse
  BRW5.AddField(GDBPB:NoBPB,BRW5.Q.GDBPB:NoBPB)            ! Field GDBPB:NoBPB is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Kode_brg,BRW5.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseBPBManual',QuickWindow)              ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
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
    Relate:GApotik.Close
    Relate:GNOABPB.Close
    Relate:GNOBBPB.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseBPBManual',QuickWindow)           ! Save window data to non-volatile store
  END
  !POST(EVENT:Enable_BPB,,loc::thread)
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
    OF ?Button5
      vg_bpb=GHBPB:NoBPB
      display
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Change:2
      ThisWindow.Update
      !brw5.resetsort(1)
      !cycle
    OF ?Delete:2
      ThisWindow.Update
      cycle
    OF ?Button5
      ThisWindow.Update
      START(PrintBPB2, 25000)
      ThisWindow.Reset
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
    CASE EVENT()
    OF EVENT:Timer
      brw1.ResetSort(1)
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Ask PROCEDURE(BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  !if request=3 then
  !   vl_nomor=GHBPB:NoBPB
  !   display
  !end
  ReturnValue = PARENT.Ask(Request)
  RETURN ReturnValue


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  SELF.EIP &= BRW1::EIPManager                             ! Set the EIP manager
  SELF.AddEditControl(,3)
  SELF.DeleteAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Default+EIPAction:Remain+EIPAction:RetainColumn
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:2
    SELF.ChangeControl=?Change:2
    SELF.DeleteControl=?Delete:2
  END


BRW1.ResetFromAsk PROCEDURE(*BYTE Request,*BYTE Response)

  CODE
  PARENT.ResetFromAsk(Request,Response)
  !if request=3 and response=1 then
  !   GNOBBPB:NoBPB=vl_nomor
  !   access:gnobbpb.insert()
  !end
  brw1.resetsort(1)
  brw5.resetsort(1)


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF choice(?CurrentTab)=2
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


BRW5.ResetFromAsk PROCEDURE(*BYTE Request,*BYTE Response)

  CODE
  PARENT.ResetFromAsk(Request,Response)
  brw1.resetsort(1)
  brw5.resetsort(1)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

SelectGBarKel PROCEDURE                                    ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(GBarKel)
                       PROJECT(GBA1:Kode)
                       PROJECT(GBA1:Nama)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GBA1:Kode              LIKE(GBA1:Kode)                !List box control field - type derived from field
GBA1:Nama              LIKE(GBA1:Nama)                !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a GBarKel Record'),AT(,,158,188),FONT('Arial',8,,),IMM,HLP('SelectGBarKel'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,142,124),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('64R(2)|M~Kode~C(0)@n-14@80L(2)|M~Nama~L(2)@s40@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(105,148,45,14),USE(?Select:2)
                       SHEET,AT(4,4,150,162),USE(?CurrentTab)
                         TAB('GBA1:PK'),USE(?Tab:2)
                         END
                       END
                       BUTTON('Close'),AT(60,170,45,14),USE(?Close)
                       BUTTON('Help'),AT(109,170,45,14),USE(?Help),STD(STD:Help)
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
  GlobalErrors.SetProcedureName('SelectGBarKel')
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
  Relate:GBarKel.Open                                      ! File GBarKel used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GBarKel,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,GBA1:PK)                              ! Add the sort order for GBA1:PK for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,GBA1:Kode,,BRW1)               ! Initialize the browse locator using  using key: GBA1:PK , GBA1:Kode
  BRW1.AddField(GBA1:Kode,BRW1.Q.GBA1:Kode)                ! Field GBA1:Kode is a hot field or requires assignment from browse
  BRW1.AddField(GBA1:Nama,BRW1.Q.GBA1:Nama)                ! Field GBA1:Nama is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectGBarKel',QuickWindow)                ! Restore window settings from non-volatile store
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
    Relate:GBarKel.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectGBarKel',QuickWindow)             ! Save window data to non-volatile store
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

