

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N009.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N006.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N010.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N120.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N121.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N122.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N123.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N124.INC'),ONCE        !Req'd for module callout resolution
                     END


BrowseRanapNonBilling PROCEDURE                            ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
Lunas                STRING(5)                             !
Poliklinik           STRING(1)                             !
LOC::No_tran         STRING(15)                            !Nomor Transaksi
loc::thread          BYTE                                  !
vl_total             REAL                                  !
BRW1::View:Browse    VIEW(APHTRANS)
                       PROJECT(APH:Nomor_mr)
                       PROJECT(APH:Tanggal)
                       PROJECT(APH:Jam)
                       PROJECT(APH:Biaya)
                       PROJECT(APH:N0_tran)
                       PROJECT(APH:Kode_Apotik)
                       PROJECT(APH:Asal)
                       PROJECT(APH:User)
                       PROJECT(APH:cara_bayar)
                       PROJECT(APH:Kontrak)
                       PROJECT(APH:NoNota)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APH:Nomor_mr           LIKE(APH:Nomor_mr)             !List box control field - type derived from field
APH:Tanggal            LIKE(APH:Tanggal)              !List box control field - type derived from field
APH:Jam                LIKE(APH:Jam)                  !List box control field - type derived from field
APH:Biaya              LIKE(APH:Biaya)                !List box control field - type derived from field
APH:Biaya_NormalFG     LONG                           !Normal forground color
APH:Biaya_NormalBG     LONG                           !Normal background color
APH:Biaya_SelectedFG   LONG                           !Selected forground color
APH:Biaya_SelectedBG   LONG                           !Selected background color
APH:N0_tran            LIKE(APH:N0_tran)              !List box control field - type derived from field
APH:Kode_Apotik        LIKE(APH:Kode_Apotik)          !List box control field - type derived from field
APH:Asal               LIKE(APH:Asal)                 !List box control field - type derived from field
APH:User               LIKE(APH:User)                 !List box control field - type derived from field
APH:cara_bayar         LIKE(APH:cara_bayar)           !List box control field - type derived from field
APH:Kontrak            LIKE(APH:Kontrak)              !List box control field - type derived from field
APH:NoNota             LIKE(APH:NoNota)               !List box control field - type derived from field
Lunas                  LIKE(Lunas)                    !List box control field - type derived from local data
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
QuickWindow          WINDOW('Transaksi Instalasi Farmasi - Rawat Inap'),AT(,,457,244),FONT('Arial',8,,),CENTER,IMM,HLP('Tran_Poliklinik'),MSG('Transaksi Instalasi Farmasi'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,435,57),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('49L|FM~Nomor RM~C@N010_@47R(1)|M~Tanggal~C(0)@D8@35R(1)|M~Jam~C(0)@t04@55R(1)|M*' &|
   '~Biaya~C(0)@n-15.2@64L|M~N 0 tran~C@s15@45L|M~Kode Apotik~@s5@44L|M~Asal~@s10@27' &|
   'L|M~User~@s4@37L|M~cara bayar~@n1@40L|M~Kontrak~@s10@40L|M~No Nota~@s10@27L|M~Lu' &|
   'nas~@s5@'),FROM(Queue:Browse:1)
                       LIST,AT(5,117,443,103),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('45L|FM~Kode Barang~C@s10@160L|FM~Nama Obat~C@s40@78L|FM~Keterangan~C@s50@71D(14)' &|
   '|M~Jumlah~C(0)@n-14.2@59R(2)|M~Total~C(0)@n-15.2@60R(2)|M~Diskon~C(0)@n-15.2@60L' &|
   '~Camp~C@n2@60L~N 0 tran~C@s15@'),FROM(Queue:Browse)
                       BUTTON('Button 9'),AT(66,222,45,14),USE(?Button9),HIDE
                       STRING('KELUAR OBAT RANAP TIDAK UPDATE BILLING !!!'),AT(190,4,268,12),USE(?String1),TRN,FONT('Arial',12,COLOR:Red,FONT:bold)
                       BUTTON('Cetak &Detail'),AT(9,82,61,26),USE(?Print),HIDE,LEFT,FONT('Times New Roman',10,COLOR:Blue,FONT:bold),HLP('Cetak Detail Transaksi'),MSG('Mencetak Detail Transaksi'),ICON(ICON:Print)
                       BUTTON('Cetak &Nota'),AT(404,89,41,15),USE(?Print:2),HIDE,LEFT,FONT('Times New Roman',,COLOR:Blue,FONT:bold),HLP('Cetak Nota transaksi'),MSG('Mencetak Nota Transaksi'),ICON(ICON:Print1)
                       BUTTON('T&ransaksi (Insert)'),AT(326,82,76,26),USE(?Insert:3),LEFT,FONT('Arial',8,COLOR:Black,FONT:bold+FONT:italic),HLP('Transaksi Barang'),MSG('Melakukan Transaksi Barang'),TIP('Transaksi Barang'),KEY(InsertKey),ICON(ICON:Open)
                       BUTTON('&Select'),AT(279,1,45,14),USE(?Select:2),HIDE
                       BUTTON('&Change'),AT(229,1,45,14),USE(?Change:3),DISABLE,HIDE,DEFAULT
                       BUTTON('&Delete'),AT(179,1,45,14),USE(?Delete:3),DISABLE,HIDE
                       SHEET,AT(4,4,445,111),USE(?CurrentTab)
                         TAB('No. Nota'),USE(?Tab:2)
                           BUTTON('Cetak &Detail'),AT(73,82,61,26),USE(?Print:3),LEFT,FONT('Arial',8,COLOR:Blue,FONT:bold),HLP('Cetak Detail Transaksi'),MSG('Mencetak Detail Transaksi'),ICON(ICON:Print)
                           ENTRY(@s15),AT(235,89,69,15),USE(LOC::No_tran),FONT('Times New Roman',10,COLOR:Black,),MSG('Nomor Transaksi'),TIP('Nomor Transaksi')
                           PROMPT('No. Transaksi :'),AT(177,92),USE(?LOC::No_tran:Prompt),TRN,FONT('Times New Roman',10,COLOR:Black,)
                         END
                         TAB('Nomor RM'),USE(?Tab:3)
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
  GlobalErrors.SetProcedureName('BrowseRanapNonBilling')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  BIND('Lunas',Lunas)                                      ! Added by: BrowseBox(ABC)
  loc::thread=glo::mainthreadno
  !POST(EVENT:Disable_RInapN,,loc::thread)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:APDTRANS.Open                                     ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Aphtransadd.Open                                  ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:ISetupAp.Open                                     ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:RI_PinRuang.UseFile                               ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:RI_HRInap.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITbrRwt.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
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
  BRW1::Sort1:Locator.Init(,APH:Nomor_mr,1,BRW1)           ! Initialize the browse locator using  using key: APH:by_medrec , APH:Nomor_mr
  BRW1.SetFilter('(aph:kode_apotik=GL_entryapotik)')       ! Apply filter expression to browse
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon APH:N0_tran for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,APH:by_transaksi) ! Add the sort order for APH:by_transaksi for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?LOC::No_tran,APH:N0_tran,,BRW1) ! Initialize the browse locator using ?LOC::No_tran using key: APH:by_transaksi , APH:N0_tran
  BRW1.SetFilter('(aph:kode_apotik=GL_entryapotik)')       ! Apply filter expression to browse
  BRW1.AddField(APH:Nomor_mr,BRW1.Q.APH:Nomor_mr)          ! Field APH:Nomor_mr is a hot field or requires assignment from browse
  BRW1.AddField(APH:Tanggal,BRW1.Q.APH:Tanggal)            ! Field APH:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(APH:Jam,BRW1.Q.APH:Jam)                    ! Field APH:Jam is a hot field or requires assignment from browse
  BRW1.AddField(APH:Biaya,BRW1.Q.APH:Biaya)                ! Field APH:Biaya is a hot field or requires assignment from browse
  BRW1.AddField(APH:N0_tran,BRW1.Q.APH:N0_tran)            ! Field APH:N0_tran is a hot field or requires assignment from browse
  BRW1.AddField(APH:Kode_Apotik,BRW1.Q.APH:Kode_Apotik)    ! Field APH:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(APH:Asal,BRW1.Q.APH:Asal)                  ! Field APH:Asal is a hot field or requires assignment from browse
  BRW1.AddField(APH:User,BRW1.Q.APH:User)                  ! Field APH:User is a hot field or requires assignment from browse
  BRW1.AddField(APH:cara_bayar,BRW1.Q.APH:cara_bayar)      ! Field APH:cara_bayar is a hot field or requires assignment from browse
  BRW1.AddField(APH:Kontrak,BRW1.Q.APH:Kontrak)            ! Field APH:Kontrak is a hot field or requires assignment from browse
  BRW1.AddField(APH:NoNota,BRW1.Q.APH:NoNota)              ! Field APH:NoNota is a hot field or requires assignment from browse
  BRW1.AddField(Lunas,BRW1.Q.Lunas)                        ! Field Lunas is a hot field or requires assignment from browse
  BRW6.Q &= Queue:Browse
  BRW6.AddSortOrder(,APD:notran_kode)                      ! Add the sort order for APD:notran_kode for sort order 1
  BRW6.AddRange(APD:N0_tran,Relate:APDTRANS,Relate:APHTRANS) ! Add file relationship range limit for sort order 1
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
  INIMgr.Fetch('BrowseRanapNonBilling',QuickWindow)        ! Restore window settings from non-volatile store
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
    Relate:Aphtransadd.Close
    Relate:ISetupAp.Close
    Relate:Nomor_SKR.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseRanapNonBilling',QuickWindow)     ! Save window data to non-volatile store
  END
  !QPOST(EVENT:Enable_RInapN,,loc::thread)
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
      Trig_UpdateRawatInap1
      PrintTransRawatInap1
      Cetak_nota_apotik11
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
      IF APH:Ra_jal = 1 AND APH:Bayar = 0
          MESSAGE('Belum Transaksi Kasir, Tidak dapat dibuat SBBK / Nota')
          RETURN Level:Notify
      END
      if APH:Biaya>=0 then
         printtransrawatinap1
      else
         printreturrawatinap1
      end
    OF ?Print
      IF APH:Ra_jal = 1 AND APH:Bayar = 0
          MESSAGE('Belum Transaksi Kasir, Tidak dapat dibuat SBBK / Nota')
          RETURN Level:Notify
      END
    OF ?Insert:3
      NOM1:No_urut=63
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
      if APH:Biaya>0 then
         start(PrintTransRawatInap1CD,25000)
      else
         start(PrintReturRawatInap1CD,25000)
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
  
     RI_HR:Nomor_mr       =APH:Nomor_mr
     RI_HR:Status_Keluar  =0
     if access:ri_hrinap.fetch(RI_HR:KNomr_status)=level:benign then
        APH1:Nomor    =APH:N0_tran
        APH1:Ruangan  =RI_HR:LastRoom
        access:aphtransadd.insert()
     end
     glo::no_nota=APH:N0_tran
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
  
  IF (aph:biaya<0)
    SELF.Q.APH:Biaya_NormalFG = 255                        ! Set conditional color values for APH:Biaya
    SELF.Q.APH:Biaya_NormalBG = -1
    SELF.Q.APH:Biaya_SelectedFG = 255
    SELF.Q.APH:Biaya_SelectedBG = -1
  ELSE
    SELF.Q.APH:Biaya_NormalFG = -1                         ! Set color values for APH:Biaya
    SELF.Q.APH:Biaya_NormalBG = -1
    SELF.Q.APH:Biaya_SelectedFG = -1
    SELF.Q.APH:Biaya_SelectedBG = -1
  END
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
  
  if round(vl_total,1)<>APH:Biaya then
     if (APH:Biaya-round(vl_total,1))<=1 then
        vl_total=round(vl_total,1)+1
     else
        message('Total beda dengan detil, harap hubungi Divisi SIMRS ! '&round(vl_total,1)&' '&APH:Biaya)
        access:aphtrans.fetch(APH:by_transaksi)
        APH:Biaya=round(vl_total,1)
        access:aphtrans.update()
        message('Data sudah disamakan, silahkan cetak ulang struk !')
     end
  end


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

Cetak_nota_apotik11 PROCEDURE                              ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
vl_jam               TIME                                  !
Process:View         VIEW(APHTRANS)
                       PROJECT(APH:Biaya)
                       PROJECT(APH:Kode_Apotik)
                       PROJECT(APH:N0_tran)
                       PROJECT(APH:Nomor_mr)
                       PROJECT(APH:Tanggal)
                       PROJECT(APH:User)
                       JOIN(JPas:KeyNomorMr,APH:Nomor_mr)
                         PROJECT(JPas:Nama)
                       END
                       JOIN(GAPO:KeyNoApotik,APH:Kode_Apotik)
                         PROJECT(GAPO:Nama_Apotik)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(10,3,150,146),PAPER(PAPER:USER,4000,3500),PRE(RPT),FONT('Times New Roman',10,COLOR:Black,),MM
detail1                DETAIL,AT(,,66,46),USE(?detail1)
                         STRING('Ins. Farmasi'),AT(1,1),USE(?String21),TRN,FONT('Times New Roman',8,,)
                         STRING(@s5),AT(4,28,10,4),USE(APH:Kode_Apotik),FONT('Times New Roman',8,,FONT:italic)
                         STRING('Transaksi obat Rawat Inap'),AT(1,5,41,4),LEFT,FONT('Times New Roman',8,,)
                         BOX,AT(1,13,60,6),USE(?Box1),COLOR(COLOR:Black)
                         STRING('Nomor RM      :'),AT(1,9,25,4),TRN,FONT('Times New Roman',8,,)
                         STRING(@N010_),AT(26,9,26,4),USE(APH:Nomor_mr),FONT('Times New Roman',8,,)
                         STRING(@s35),AT(3,14,56,4),USE(JPas:Nama),FONT('Times New Roman',8,,)
                         STRING(@n-14),AT(34,20,23,4),USE(APH:Biaya),RIGHT(1),FONT('Times New Roman',8,,)
                         STRING('Total Penagihan  :  Rp.'),AT(1,20,30,4),TRN,FONT('Times New Roman',8,,)
                         STRING(@s15),AT(34,24,30,4),USE(APH:N0_tran),FONT('Times New Roman',8,,)
                         STRING('No. Transaksi  :'),AT(1,24,23,4),TRN,FONT('Times New Roman',10,,)
                         STRING(@D06),AT(33,1,16,4),USE(APH:Tanggal),RIGHT(1),FONT('Times New Roman',8,,)
                         STRING(@t04),AT(49,1),USE(vl_jam),FONT('Arial',8,,FONT:regular)
                         STRING(@s30),AT(16,28,49,5),USE(GAPO:Nama_Apotik),FONT('Times New Roman',8,,)
                         STRING('Penanggung Jawab'),AT(37,32,24,4),TRN,FONT('Times New Roman',8,,)
                         STRING(@s4),AT(44,39,9,4),USE(APH:User),FONT('Times New Roman',8,,)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Reset                  PROCEDURE(BYTE Force=0),DERIVED     ! Method added to host embed code
Update                 PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ProgressMgr          StepStringClass                       ! Progress Manager

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
  GlobalErrors.SetProcedureName('Cetak_nota_apotik11')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  vl_jam = CLOCK()
  Relate:APHTRANS.Open                                     ! File APHTRANS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Cetak_nota_apotik11',ProgressWindow)       ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:APHTRANS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, APH:N0_tran)
  ThisReport.AddSortOrder(APH:by_transaksi)
  ThisReport.AddRange(APH:N0_tran,APH:N0_tran)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report)
  ?Progress:UserString{Prop:Text}=''
  Relate:APHTRANS.SetQuickScan(1,Propagate:OneMany)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APHTRANS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Cetak_nota_apotik11',ProgressWindow)    ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  JPas:Nomor_mr = APH:Nomor_mr                             ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
  GAPO:Kode_Apotik = APH:Kode_Apotik                       ! Assign linking field value
  Access:GApotik.Fetch(GAPO:KeyNoApotik)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  JPas:Nomor_mr = APH:Nomor_mr                             ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
  GAPO:Kode_Apotik = APH:Kode_Apotik                       ! Assign linking field value
  Access:GApotik.Fetch(GAPO:KeyNoApotik)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail1)
  RETURN ReturnValue

Trig_UpdateRawatInap1 PROCEDURE                            ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
vl_ok                BYTE                                  !
vl_nomor             STRING(15)                            !
sudah                BYTE(0)                               !
masuk_disc           BYTE                                  !
sudah_nomor          BYTE                                  !
Loc::delete          BYTE                                  !
Tahun_ini            LONG                                  !
loc::camp            BYTE                                  !
loc::savpoint        LONG                                  !
putar                ULONG                                 !
CEK_RUN              BYTE                                  !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
discount             LONG                                  !
pers_disc            LONG                                  !
LOC::TOTAL           LONG                                  !
LOC::Status          STRING(10)                            !
Hitung_campur        BYTE                                  !Untuk hitung jumlah obat campur yang telah diproses
loc_mr               LONG                                  !
BRW4::View:Browse    VIEW(APDTRANS)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Total)
                       PROJECT(APD:Diskon)
                       PROJECT(APD:N0_tran)
                       PROJECT(APD:Camp)
                       JOIN(GBAR:KeyKodeBrg,APD:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Ket2)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse:4       QUEUE                            !Queue declaration for browse/combo box using ?Browse:4
APD:Kode_brg           LIKE(APD:Kode_brg)             !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Ket2              LIKE(GBAR:Ket2)                !List box control field - type derived from field
APD:Jumlah             LIKE(APD:Jumlah)               !List box control field - type derived from field
APD:Total              LIKE(APD:Total)                !List box control field - type derived from field
APD:Diskon             LIKE(APD:Diskon)               !List box control field - type derived from field
APD:N0_tran            LIKE(APD:N0_tran)              !List box control field - type derived from field
APD:Camp               LIKE(APD:Camp)                 !Primary key field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::APH:Record  LIKE(APH:RECORD),THREAD
QuickWindow          WINDOW('Transaksi Instalasi Farmasi -Rawat Inap'),AT(,,456,248),FONT('Arial',8,,),CENTER,IMM,HLP('UpdateAPHTRANS'),ALRT(EscKey),TIMER(100),GRAY,MDI
                       ENTRY(@N010_),AT(65,3,81,13),USE(APH:Nomor_mr),FONT('Times New Roman',16,COLOR:Black,FONT:bold),MSG('Nomor Medical record pasien'),TIP('Nomor KIUP')
                       BUTTON('F2'),AT(150,3,20,13),USE(?Button8),HIDE,KEY(F2Key)
                       ENTRY(@n-7),AT(173,3,57,13),USE(APH:Urut),RIGHT(1),READONLY
                       PROMPT('Ruang Rawat :'),AT(233,19),USE(?Prompt11),FONT('Times New Roman',12,COLOR:Black,FONT:bold+FONT:italic+FONT:underline)
                       STRING(@s20),AT(302,20,101,13),USE(ITbr:NAMA_RUANG),FONT('Times New Roman',12,COLOR:Blue,FONT:bold)
                       PROMPT('Status     :'),AT(233,36),USE(?Prompt12)
                       STRING(@n1),AT(267,36),USE(APH:cara_bayar)
                       STRING(@s10),AT(276,36),USE(LOC::Status)
                       OPTION('Status Bayar'),AT(406,0,49,35),USE(APH:LamaBaru),DISABLE,BOXED
                         RADIO('Lama'),AT(410,11),USE(?Option1:Radio1),VALUE('0')
                         RADIO('Baru'),AT(410,21),USE(?Option1:Radio2),VALUE('1')
                       END
                       PROMPT('NAMA :'),AT(30,19,32,14),USE(?Prompt5),RIGHT,FONT('Times New Roman',10,COLOR:Black,FONT:bold)
                       ENTRY(@s35),AT(65,19,165,13),USE(JPas:Nama),DISABLE,FONT(,,COLOR:Black,FONT:bold),HLP('Nama mendahului gelar'),MSG('Nama pasien'),REQ,CAP
                       STRING('Kelas Biaya :'),AT(321,36),USE(?String6)
                       STRING(@s3),AT(369,35),USE(glo_kls_rawat),FONT('Arial',12,COLOR:Blue,FONT:bold)
                       PROMPT('ALAMAT :'),AT(20,35,42,14),USE(?Prompt6),RIGHT,FONT('Times New Roman',10,COLOR:Black,FONT:bold)
                       ENTRY(@s35),AT(65,35,165,13),USE(JPas:Alamat),DISABLE,HLP('contoh : Kopo Jl'),MSG('Alamat Pasien'),CAP
                       PROMPT('RUANGAN :'),AT(19,67),USE(?APH:Ruang:Prompt),RIGHT,FONT(,,COLOR:Black,FONT:bold)
                       ENTRY(@s10),AT(65,67,47,13),USE(APH:Ruang),DISABLE
                       PROMPT('Dr.:'),AT(114,68),USE(?APH:dokter:Prompt),FONT(,,COLOR:Black,FONT:bold)
                       ENTRY(@s5),AT(128,67,25,13),USE(APH:dokter),DISABLE
                       BUTTON('F3'),AT(155,67,20,13),USE(?CallLookup),KEY(F3Key)
                       PROMPT('NIP :'),AT(31,51,31,14),USE(?APH:NIP:Prompt),RIGHT,FONT('Times New Roman',10,COLOR:Black,FONT:bold)
                       ENTRY(@s7),AT(65,51,47,13),USE(APH:NIP),DISABLE
                       ENTRY(@s40),AT(115,51,115,13),USE(PEGA:Nama),DISABLE
                       PROMPT('KONTRAKTOR :'),AT(233,51,63,10),USE(?APH:NIP:Prompt:2),RIGHT,FONT('Times New Roman',8,COLOR:Black,FONT:bold)
                       ENTRY(@s10),AT(299,51,41,13),USE(APH:Kontrak),DISABLE
                       STRING(@s100),AT(343,52),USE(JKon:NAMA_KTR),FONT(,10,COLOR:Blue,FONT:bold)
                       BUTTON('&Tambah Obat (+)'),AT(7,186,127,19),USE(?Insert:5),FONT('Arial',8,COLOR:Black,FONT:bold),KEY(PlusKey)
                       PROMPT('APOTIK :'),AT(233,3,42,14),USE(?APH:Kode_Apotik:Prompt)
                       ENTRY(@s5),AT(279,3,27,13),USE(APH:Kode_Apotik),DISABLE,MSG('Kode Apotik'),TIP('Kode Apotik')
                       PROMPT('&TANGGAL:'),AT(314,3,37,14),USE(?APH:Tanggal:Prompt)
                       PROMPT('No Trans:'),AT(12,210),USE(?APH:N0_tran:Prompt),FONT('Arial',8,,FONT:bold+FONT:italic+FONT:underline)
                       ENTRY(@s15),AT(53,208,77,13),USE(APH:N0_tran),DISABLE,FONT('Arial',12,COLOR:Black,FONT:bold),MSG('nomor transaksi'),TIP('nomor transaksi')
                       LINE,AT(285,224,158,0),USE(?Line1),COLOR(COLOR:Black),LINEWIDTH(2)
                       LIST,AT(8,85,440,97),USE(?Browse:4),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('48L|FM~Kode Barang~@s10@160L|M~Nama Obat~C@s40@95L|M~Keterangan~C@s50@44D(14)|M~' &|
   'Jumlah~C(0)@n-14.2@48D(14)|M~Total~C(0)@n-14.2@60R(2)|M~Diskon~C(0)@n-15.2@60D(1' &|
   '4)|M~N 0 tran~C(0)@s15@'),FROM(Queue:Browse:4)
                       PROMPT('Total :'),AT(285,230),USE(?APH:Biaya:Prompt),FONT('Arial',9,COLOR:Black,FONT:bold+FONT:italic)
                       ENTRY(@n-15.2),AT(345,228,97,14),USE(APH:Biaya),DISABLE,RIGHT(1),MSG('Total Biaya Pembelian'),TIP('Total Biaya Pembelian')
                       ENTRY(@s30),AT(178,67,67,13),USE(JDok:Nama_Dokter),DISABLE,MSG('Nama Dokter'),TIP('Nama Dokter'),UPR
                       PROMPT('NO. PAKET :'),AT(249,69),USE(?APH:NoPaket:Prompt)
                       ENTRY(@n-7),AT(299,67,41,13),USE(APH:NoPaket),DISABLE,RIGHT(1)
                       BUTTON('F4'),AT(343,67,20,13),USE(?Button9),KEY(F4Key)
                       PANEL,AT(7,206,127,19),USE(?Panel2)
                       BUTTON('&OK [End]'),AT(208,187,56,38),USE(?OK),FONT('Arial',8,COLOR:Black,),KEY(EndKey),ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(148,187,56,38),USE(?Cancel),FONT('Arial',8,COLOR:Black,),ICON(ICON:Cross)
                       ENTRY(@n-15.2),AT(345,187,97,14),USE(LOC::TOTAL),DISABLE
                       PROMPT('Sub Total'),AT(285,189),USE(?Prompt10),FONT('Arial',9,COLOR:Black,)
                       ENTRY(@n-15.2),AT(345,205,97,14),USE(discount)
                       PROMPT('Diskon :'),AT(285,207),USE(?Prompt8),FONT('Arial',9,COLOR:Black,)
                       BUTTON('&Edit [Ctrl]'),AT(7,226,127,19),USE(?Change:5),FONT(,,COLOR:Black,FONT:bold),KEY(529)
                       BUTTON('&Delete'),AT(148,230,56,14),USE(?Delete:5),HIDE
                       ENTRY(@D8),AT(353,3,51,13),USE(APH:Tanggal),DISABLE,RIGHT(1),FONT('Times New Roman',12,COLOR:Black,),MSG('Tanggal berobat pasen'),TIP('Tanggal berobat pasen')
                       PROMPT('NOMOR RM :'),AT(4,3,58,14),USE(?APH:Nomor_mr:Prompt),RIGHT,FONT('Times New Roman',10,COLOR:Black,FONT:bold)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
Reset                  PROCEDURE(BYTE Force=0),DERIVED     ! Method added to host embed code
Run                    PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Update                 PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW4                 CLASS(BrowseClass)                    ! Browse using ?Browse:4
Q                      &Queue:Browse:4                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetFromAsk           PROCEDURE(*BYTE Request,*BYTE Response),DERIVED ! Method added to host embed code
ResetFromView          PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW4::Sort0:StepClass StepStringClass                      ! Default Step Manager
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False) ! Method added to host embed code
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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
!Batal Transaksi
BATAL_D_UTAMA ROUTINE
    !message('delete dba.apdtrans where n0_tran='''&APH:N0_tran&'''')
    apdtrans{prop:sql}='delete dba.apdtrans where n0_tran='''&APH:N0_tran&''''
    apdtrans{prop:sql}='delete dba.apdtrans where n0_tran='''&APH:N0_tran&''''
    !SET( BRW4::View:Browse)
    !LOOP
    !    NEXT(BRW4::View:Browse)
    !    IF ERRORCODE() > 0 THEN BREAK.
    !    MESSAGE(APD:Kode_brg)
    !    DELETE(apdtrans)
    !END

BATAL_D_DUA ROUTINE
 SET(APDTcam)
    APD1:N0_tran=APH:N0_tran
    SET(APD1:by_tranno,APD1:by_tranno)
    LOOP
        IF Access:APDTcam.Next()<>Level:Benign OR APD1:N0_tran <> APH:N0_tran THEN BREAK.
        DELETE( APDTcam)
    END

BATAL_Transaksi ROUTINE
    SET(APDTcam)
    APD1:N0_tran=APH:N0_tran
    APD1:Camp=APD:Camp
    SET(APD1:by_tran_cam,APD1:by_tran_cam)
    LOOP
        IF Access:APDTcam.Next()<>Level:Benign  OR APD1:Camp<>APD:Camp THEN BREAK.
        DELETE( APDTcam)
    END

!Proses Penomoran Otomatis Transaksi
Isi_Nomor Routine
   vl_nomor=''
   display
   loop
      logout(1,nomor_batal)
      if errorcode()=56 then
         cycle.
      !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
      NOM:No_Urut=63
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
         NOMU:Urut =63
         NOMU:Nomor=vl_nomor
         add(nomoruse)
         if errorcode()>0 then
            vl_nomor=''
            rollback
            cycle
         end
         delete(nomor_batal)
         commit
         if errorcode()>0 then
            vl_nomor=''
            display
            cycle
         end
      else
         vl_nomor=''
         display
         rollback
      end
      break
   end
   if vl_nomor='' then
      loop
        logout(1,nomor_skr,nomoruse)
        if errorcode()=56 then cycle.
        !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
        NOM1:No_urut=63
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
           NOMU:Urut =63
           NOMU:Nomor=vl_nomor
           add(nomoruse)
           if errorcode()>0 then
              rollback
              cycle
           end
           NOM1:No_Trans=sub(vl_nomor,1,7)&format(deformat(sub(vl_nomor,8,5),@n5)+1,@p#####p)
           put(nomor_skr)
           if errorcode()=90 then
              rollback
              cycle
           elsif errorcode()>0 then
              rollback
              cycle
           else
              commit
           end
        else
           rollback
           cycle
        end
        break
      end
   end
   if format(sub(vl_nomor,6,2),@n2)<>month(today()) then
      !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
      nomor_batal{prop:sql}='delete dba.nomor_batal where No=63'
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 1=Transaksi Apotik ke pasien Rawat Inap
         NOM1:No_urut=63
         access:nomor_skr.fetch(NOM1:PrimaryKey)
         if not(errorcode()) then
            vl_nomor =NOM1:No_Trans
            NOM1:No_Trans=sub(vl_nomor,1,3)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'00002'
            access:nomor_skr.update()
            if errorcode()<>0 then
               rollback
               cycle
            else
               vl_nomor=sub(vl_nomor,1,3)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'00001'
               commit
            end
         end
         break
      end
   end
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   APH:N0_tran=vl_nomor
   display

Batal_Nomor Routine
   !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
   NOM:No_Urut =63
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=APH:N0_tran
   NOM:Keterangan='Keluar Apotik Non Billing'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
   NOMU:Urut =63
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOMU:Nomor=APH:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   delete(nomoruse)

hapus_nomor_use routine
   NOMU:Urut    =63
   NOMU:Nomor   =APH:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   if errorcode()=0 then
      delete(nomoruse)
   end

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    CLEAR(ActionMessage)
  OF ChangeRecord
    GlobalErrors.Throw(Msg:UpdateIllegal)
    RETURN
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  !Security dan Inisialisasi
  CLEAR(JPas:Nama)
  CLEAR(JPas:Alamat)
  CLEAR(JPol:Nama_poli)
  CLEAR(LOC::Status)
  !CLEAR(IPas:Status)
  ?OK{PROP:DISABLE}=TRUE
  discount      =0
  pers_disc     =0
  ?BROWSE:4{PROP:DISABLE}=TRUE
  ?Insert:5{PROP:DISABLE}=TRUE
  Hitung_campur =0
  sudah_nomor   =0
  masuk_disc    =0
  glo_kls_rawat =0
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_UpdateRawatInap1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APH:Nomor_mr
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APH:Record,History::APH:Record)
  SELF.AddHistoryField(?APH:Nomor_mr,1)
  SELF.AddHistoryField(?APH:Urut,18)
  SELF.AddHistoryField(?APH:cara_bayar,9)
  SELF.AddHistoryField(?APH:LamaBaru,15)
  SELF.AddHistoryField(?APH:Ruang,19)
  SELF.AddHistoryField(?APH:dokter,16)
  SELF.AddHistoryField(?APH:NIP,13)
  SELF.AddHistoryField(?APH:Kontrak,14)
  SELF.AddHistoryField(?APH:Kode_Apotik,10)
  SELF.AddHistoryField(?APH:N0_tran,4)
  SELF.AddHistoryField(?APH:Biaya,3)
  SELF.AddHistoryField(?APH:NoPaket,20)
  SELF.AddHistoryField(?APH:Tanggal,2)
  SELF.AddUpdateFile(Access:APHTRANS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:APDTRANS.Open                                     ! File ApPaketD used by this procedure, so make sure it's RelationManager is open
  Relate:Ano_pakai.Open                                    ! File ApPaketD used by this procedure, so make sure it's RelationManager is open
  Relate:ApPaketD.SetOpenRelated()
  Relate:ApPaketD.Open                                     ! File ApPaketD used by this procedure, so make sure it's RelationManager is open
  Relate:Aphtransadd.Open                                  ! File ApPaketD used by this procedure, so make sure it's RelationManager is open
  Relate:IAP_SET.Open                                      ! File ApPaketD used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File ApPaketD used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_Batal.Open                                  ! File ApPaketD used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File ApPaketD used by this procedure, so make sure it's RelationManager is open
  Relate:Tbstawal.Open                                     ! File ApPaketD used by this procedure, so make sure it's RelationManager is open
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKelPeg.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APDTcam.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITbrRwt.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:IPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITrPasen.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITbKelas.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:IDataKtr.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:RI_HRInap.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:RI_PinRuang.UseFile                               ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:APHTRANS
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:None                        ! Changes not allowed
    SELF.CancelAction = Cancel:Cancel                      ! No confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  BRW4.Init(?Browse:4,Queue:Browse:4.ViewPosition,BRW4::View:Browse,Queue:Browse:4,Relate:APDTRANS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  if self.request=1 then
     do isi_nomor
  end
  vl_ok=0
  ?Browse:4{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW4.Q &= Queue:Browse:4
  BRW4::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon APD:Kode_brg for sort order 1
  BRW4.AddSortOrder(BRW4::Sort0:StepClass,APD:notran_kode) ! Add the sort order for APD:notran_kode for sort order 1
  BRW4.AddRange(APD:N0_tran,Relate:APDTRANS,Relate:APHTRANS) ! Add file relationship range limit for sort order 1
  BRW4.AddField(APD:Kode_brg,BRW4.Q.APD:Kode_brg)          ! Field APD:Kode_brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Nama_Brg,BRW4.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Ket2,BRW4.Q.GBAR:Ket2)                ! Field GBAR:Ket2 is a hot field or requires assignment from browse
  BRW4.AddField(APD:Jumlah,BRW4.Q.APD:Jumlah)              ! Field APD:Jumlah is a hot field or requires assignment from browse
  BRW4.AddField(APD:Total,BRW4.Q.APD:Total)                ! Field APD:Total is a hot field or requires assignment from browse
  BRW4.AddField(APD:Diskon,BRW4.Q.APD:Diskon)              ! Field APD:Diskon is a hot field or requires assignment from browse
  BRW4.AddField(APD:N0_tran,BRW4.Q.APD:N0_tran)            ! Field APD:N0_tran is a hot field or requires assignment from browse
  BRW4.AddField(APD:Camp,BRW4.Q.APD:Camp)                  ! Field APD:Camp is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Kode_brg,BRW4.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_UpdateRawatInap1',QuickWindow)        ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW4.AskProcedure = 2
  SELF.AddItem(ToolbarForm)
  BRW4.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  if (self.request=1 and self.response=2) or (self.request=3 and self.response=1) then
     do batal_nomor
     DO BATAL_D_UTAMA
  !   DO BATAL_D_DUA
  end
  if self.request=1 and self.response=1 then
     do hapus_nomor_use
  end
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:Ano_pakai.Close
    Relate:ApPaketD.Close
    Relate:Aphtransadd.Close
    Relate:IAP_SET.Close
    Relate:NomorUse.Close
    Relate:Nomor_Batal.Close
    Relate:Nomor_SKR.Close
    Relate:Tbstawal.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_UpdateRawatInap1',QuickWindow)     ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
    APH:Tanggal = Today()
    sudah = 0
    APH:Kode_Apotik = GL_entryapotik
    APH:Jam = clock()
    APH:User = glo:user_id
  PARENT.PrimeFields


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  APP2:No = APH:NoPaket                                    ! Assign linking field value
  Access:ApPaketH.Fetch(APP2:PrimaryKey)
  JDok:Kode_Dokter = APH:dokter                            ! Assign linking field value
  Access:JDokter.Fetch(JDok:KeyKodeDokter)
  JKon:KODE_KTR = APH:Kontrak                              ! Assign linking field value
  Access:JKontrak.Fetch(JKon:KeyKodeKtr)
  PEGA:Nik = APH:NIP                                       ! Assign linking field value
  Access:SMPegawai.Fetch(PEGA:Pkey)
  APH:Biaya = LOC::TOTAL - discount
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
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
      SelectDokter
      Trig_UpdateRawatInapDetil1
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
    OF ?Insert:5
      if vl_ok=0 then
      glo::nomor=APH:Nomor_mr
      display
      end
    OF ?OK
      !Perhitungan Biaya dan Update ke Stok
      vl_ok=1
      sudah_nomor = 0
      glo::no_nota = APH:N0_tran
      
      !Isi beberapa field aphtrans
      APH:User        =Glo:USER_ID
      APH:Bayar       =0
      APH:Ra_jal      =0
      APH:cara_bayar  =RI_HR:Pembayaran
      APH:Kode_Apotik =GL_entryapotik
      APH:Asal        =RI_PI:Ruang
      
      !cek dulu bulannya ya, kalau sudah berubah, tulis dulu ke file awal bulan
      IF MONTH(glo::tgl_awal_kerja) <> mONTH(TODAY())
      
         !cek sampai sini dulu untuk if pertama
         GSTO:Kode_Barang = APD:Kode_brg
         GSTO:Kode_Apotik = GL_entryapotik
         GET(GStokAptk,GSTO:KeyBarang)
      
         !disini isi dulu tbstawal
         TBS:Kode_Apotik = GL_entryapotik
         TBS:Kode_Barang = APD:Kode_brg
         TBS:Tahun = Tahun_ini
         GET(Tbstawal,TBS:kdap_brg)
         IF ERRORCODE() = 0
            CASE MONTH(TODAY())
               OF 1
                  IF TBS:Januari= 0
                     TBS:Januari = GSTO:Saldo
                     PUT(Tbstawal)
                  END
               OF 2
                  IF TBS:Februari= 0
                     TBS:Februari = GSTO:Saldo
                     PUT(Tbstawal)
                  END
               OF 3
                  IF TBS:Maret= 0
                     TBS:Maret = GSTO:Saldo
                     PUT(Tbstawal)
                  END
               OF 4
                  IF TBS:April= 0
                     TBS:April = GSTO:Saldo
                     PUT(Tbstawal)
                  END
               OF 5
                  IF TBS:Mei= 0
                     TBS:Mei = GSTO:Saldo
                     PUT(Tbstawal)
                  END
               OF 6
                  IF TBS:Juni= 0
                     TBS:Juni = GSTO:Saldo
                     PUT(Tbstawal)
                  END
               OF 7
                  IF TBS:Juli= 0
                     TBS:Juli = GSTO:Saldo
                     PUT(Tbstawal)
                  END
               OF 8
                  IF TBS:Agustus= 0
                     TBS:Agustus = GSTO:Saldo
                     PUT(Tbstawal)
                  END
               OF 9
                  IF TBS:September= 0
                     TBS:September = GSTO:Saldo
                     PUT(Tbstawal)
                  END
               OF 10
                  IF TBS:Oktober= 0
                     TBS:Oktober = GSTO:Saldo
                     PUT(Tbstawal)
                  END
               OF 11
                  IF TBS:November= 0
                     TBS:November = GSTO:Saldo
                     PUT(Tbstawal)
                  END
               OF 12
                  IF TBS:Desember= 0
                     TBS:Desember = GSTO:Saldo
                     PUT(Tbstawal)
                  END
            END
         ELSE
            CASE MONTH(TODAY())
               OF 1
                  TBS:Januari = GSTO:Saldo
               OF 2
                  TBS:Februari = GSTO:Saldo
               OF 3
                  TBS:Maret = GSTO:Saldo
               OF 4
                  TBS:April = GSTO:Saldo
               OF 5
                  TBS:Mei = GSTO:Saldo
               OF 6
                  TBS:Juni = GSTO:Saldo
               OF 7
                  TBS:Juli = GSTO:Saldo
               OF 8
                  TBS:Agustus = GSTO:Saldo
               OF 9
                  TBS:September = GSTO:Saldo
               OF 10
                  TBS:Oktober = GSTO:Saldo
               OF 11
                  TBS:November = GSTO:Saldo
               OF 12
                  TBS:Desember = GSTO:Saldo
            END
            TBS:Kode_Apotik = GL_entryapotik
            TBS:Kode_Barang = GSTO:Kode_Barang
            TBS:Tahun = Tahun_ini
            ADD(Tbstawal)
            IF ERRORCODE() > 0
            END
      
         END
      END
      sudah=1
    OF ?Cancel
      vl_ok=1
      sudah_nomor = 0
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?APH:Nomor_mr
      !Cek Data Pasien
      if vl_ok=0 then
      if sudah=0 then
         JPas:Nomor_mr=APH:Nomor_mr
         GET(JPasien,JPas:KeyNomorMr)
         if not(errorcode()) then
            !Pasien Opname Ada
      !      IF JPas:Inap= 0
      !         MESSAGE('Nomor RM Tidak Ada Dalam daftar Rawat Inap')
      !         ?BROWSE:4{PROP:DISABLE}=1
      !         ?Insert:5{PROP:DISABLE}=TRUE
      !         CLEAR (JPas:Nama)
      !         CLEAR (JPas:Alamat)
      !         CLEAR (RI_PI:Ruang)
      !         CLEAR (LOC::Status)
      !         CLEAR (JPas:Inap)
      !         DISPLAY
      !         SELECT(?APH:Nomor_mr)
      !      ELSE
               !Cari Kelas
               ri_hrinap{prop:sql}='select * from dba.ri_hrinap where nomor_mr='&aph:nomor_mr&' order by NoUrut desc'
               ri_hrinap{prop:sql}='select * from dba.ri_hrinap where nomor_mr='&aph:nomor_mr&' order by NoUrut desc'
               if access:ri_hrinap.next()<>level:benign then
                  message('Pasien belum pernah dirawat !!!')
                  ?BROWSE:4{PROP:DISABLE}=1
                  ?Insert:5{PROP:DISABLE}=TRUE
                  CLEAR (JPas:Nama)
                  CLEAR (JPas:Alamat)
                  CLEAR (RI_PI:Ruang)
                  CLEAR (LOC::Status)
                  CLEAR (JPas:Inap)
                  DISPLAY
                  SELECT(?APH:Nomor_mr)
               else
                  if RI_HR:StatusTutupFar=1 then
                     message('Status Farmasi sudah ditutup !')
                     ?BROWSE:4{PROP:DISABLE}=1
                     ?Insert:5{PROP:DISABLE}=TRUE
                     CLEAR (JPas:Nama)
                     CLEAR (JPas:Alamat)
                     CLEAR (RI_PI:Ruang)
                     CLEAR (LOC::Status)
                     CLEAR (JPas:Inap)
                     DISPLAY
                     SELECT(?APH:Nomor_mr)
                  elsif RI_HR:No_Nota<>'' then
                     message('Status Nota sudah tutup !')
                     ?BROWSE:4{PROP:DISABLE}=1
                     ?Insert:5{PROP:DISABLE}=TRUE
                     CLEAR (JPas:Nama)
                     CLEAR (JPas:Alamat)
                     CLEAR (RI_PI:Ruang)
                     CLEAR (LOC::Status)
                     CLEAR (JPas:Inap)
                     DISPLAY
                     SELECT(?APH:Nomor_mr)
                  else
                  IF RI_HR:Pembayaran= 3
                      LOC::Status = 'Kontraktor'
                      Glo:Rekap = 3  
                  ELSIF RI_HR:Pembayaran = 2
                      LOC::Status = 'Tunai'
                      Glo:Rekap = 2
                  ELSIF RI_HR:Pembayaran = 1
                      LOC::Status = 'Pegawai'
                      Glo:Rekap = 1
                  END
                  APH:NIP         =RI_HR:NIP
                  APH:Kontrak     =RI_HR:Kontraktor
                  APH:LamaBaru    =RI_HR:LamaBaru
                  APH:cara_bayar  =RI_HR:Pembayaran
                  APH:Urut        =RI_HR:NoUrut
                  if RI_HR:statusbayar=1 then
                     message('Pasien Sudah Dibuatkan Nota !!! Hubungi Keuangan !!!')
                     ?BROWSE:4{PROP:DISABLE}=1
                     ?Insert:5{PROP:DISABLE}=TRUE
                     CLEAR (JPas:Nama)
                     CLEAR (JPas:Alamat)
                     CLEAR (RI_PI:Ruang)
                     CLEAR (LOC::Status)
                     CLEAR (JPas:Inap)
                     DISPLAY
                     SELECT(?APH:Nomor_mr)
                     cycle
                  end
                  ri_pinruang{prop:sql}='select * from dba.ri_pinruang where nomor_mr='&RI_HR:Nomor_mr&' and nourut='&RI_HR:NoUrut&' order by Tanggal_Masuk desc,jam_masuk desc'
                  ri_pinruang{prop:sql}='select * from dba.ri_pinruang where nomor_mr='&RI_HR:Nomor_mr&' and nourut='&RI_HR:NoUrut&' order by Tanggal_Masuk desc,jam_masuk desc'
                  if access:ri_pinruang.next()<>level:benign then
                     message('Ruangan Pasien Tidak Ada !!! Hub. EDP !!!')
                     ?BROWSE:4{PROP:DISABLE}=1
                     ?Insert:5{PROP:DISABLE}=TRUE
                     CLEAR (JPas:Nama)
                     CLEAR (JPas:Alamat)
                     CLEAR (RI_PI:Ruang)
                     CLEAR (LOC::Status)
                     CLEAR (JPas:Inap)
                     DISPLAY
                     SELECT(?APH:Nomor_mr)
                  else
                     IF RI_PI:Status=1
                        ?BROWSE:4{PROP:DISABLE}=false
                        ?Insert:5{PROP:DISABLE}=false
                        display
                        ITbr:KODE_RUANG=RI_PI:Ruang
                        GET(ITbrRwt,ITbr:KeyKodeRuang)
                        ITbk:KodeKelas=ITbr:KODEKelas
                        GET(ITbKelas,ITbk:KeyKodeKelas)
                        glo_kls_rawat = ITbk:Kelas
                     else
                        loc_mr = 0
                        SELECT(?APH:Nomor_mr)
                     END
                  end
                  APH:Ruang       =RI_PI:Ruang
                  JKon:KODE_KTR=RI_HR:Kontraktor
                  access:jkontrak.fetch(JKon:KeyKodeKtr)
                  end
               end
            !end
         ELSE
            !Pasien Opname Tidak Ada
            MESSAGE('Nomor RM Tidak Ada Dalam daftar Rawat JALAN !!!')
            ?BROWSE:4{PROP:DISABLE}=1
            ?Insert:5{PROP:DISABLE}=TRUE
            CLEAR (JPas:Nama)
            CLEAR (JPas:Alamat)
            CLEAR (RI_PI:Ruang)
            CLEAR (LOC::Status)
            CLEAR (JPas:Jenis_Pasien)
            DISPLAY
            SELECT(?APH:Nomor_mr)
         END
         display
      end
      display
      end
    OF ?Button8
      ThisWindow.Update
      !Cek Pasien
      if vl_ok=0 then
      globalrequest=selectrecord
      Cari_mr_pasien_inap
      APH:Nomor_mr=JPas:Nomor_mr
      display
      JPas:Nomor_mr=APH:Nomor_mr
      GET(JPasien,JPas:KeyNomorMr)
      if not(errorcode()) then
         IF JPas:Inap= 0
            MESSAGE('Nomor RM Tidak Ada Dalam daftar Rawat Inap')
            ?BROWSE:4{PROP:DISABLE}=1
            ?Insert:5{PROP:DISABLE}=TRUE
            CLEAR (JPas:Nama)
            CLEAR (JPas:Alamat)
            CLEAR (RI_PI:Ruang)
            CLEAR (LOC::Status)
            CLEAR (JPas:Inap)
            DISPLAY
            SELECT(?APH:Nomor_mr)
         ELSE
            ri_hrinap{prop:sql}='select * from dba.ri_hrinap where nomor_mr='&aph:nomor_mr&' order by NoUrut desc'
            access:ri_hrinap.next()
            if errorcode() then
               message('Ruangan Pasien Tidak Ada !!! Hub. Ruangan !!!')
               ?BROWSE:4{PROP:DISABLE}=1
               ?Insert:5{PROP:DISABLE}=TRUE
               CLEAR (JPas:Nama)
               CLEAR (JPas:Alamat)
               CLEAR (RI_PI:Ruang)
               CLEAR (LOC::Status)
               CLEAR (JPas:Inap)
               DISPLAY
               SELECT(?APH:Nomor_mr)
            else
               IF RI_HR:Pembayaran= 3
                      LOC::Status = 'Kontraktor'
                      Glo:Rekap = 3  
               ELSIF RI_HR:Pembayaran = 2
                      LOC::Status = 'Tunai'
                      Glo:Rekap = 2
               ELSIF RI_HR:Pembayaran = 1
                      LOC::Status = 'Pegawai'
                      Glo:Rekap = 1
               END
      
               APH:NIP        =RI_HR:NIP
               APH:Kontrak    =RI_HR:Kontraktor
               APH:LamaBaru   =RI_HR:LamaBaru
               APH:cara_bayar =RI_HR:Pembayaran
               APH:Urut       =RI_HR:NoUrut
      
               if RI_HR:statusbayar=1 then
                  message('Pasien Sudah Dibuatkan Nota !!! Hubungi Keuangan !!1')
                  ?BROWSE:4{PROP:DISABLE}=1
                  ?Insert:5{PROP:DISABLE}=TRUE
                  CLEAR (JPas:Nama)
                  CLEAR (JPas:Alamat)
                  CLEAR (RI_PI:Ruang)
                  CLEAR (LOC::Status)
                  CLEAR (JPas:Inap)
                  DISPLAY
                  SELECT(?APH:Nomor_mr)
                  cycle
               end
               ri_pinruang{prop:sql}='select * from dba.ri_pinruang where nomor_mr='&RI_HR:Nomor_mr&' and nourut='&RI_HR:NoUrut&' order by Tanggal_Masuk desc,jam_masuk desc'
               access:ri_pinruang.next()
               if errorcode() then
                  message('Pasien Tidak Ada di Ruangan !!! Hub. Ruangan')
                  ?BROWSE:4{PROP:DISABLE}=1
                  ?Insert:5{PROP:DISABLE}=TRUE
                  CLEAR (JPas:Nama)
                  CLEAR (JPas:Alamat)
                  CLEAR (RI_PI:Ruang)
                  CLEAR (LOC::Status)
                  CLEAR (JPas:Inap)
                  DISPLAY
                  SELECT(?APH:Nomor_mr)
                  cycle
               else
                  IF RI_PI:Status=1
                     ?BROWSE:4{PROP:DISABLE}=0
                     ?Insert:5{PROP:DISABLE}=0
                     ITbr:KODE_RUANG=RI_PI:Ruang
                     GET(ITbrRwt,ITbr:KeyKodeRuang)
                     ITbk:KodeKelas=ITbr:KODEKelas
                     GET(ITbKelas,ITbk:KeyKodeKelas)
                     glo_kls_rawat = ITbk:Kelas
                  else
                     loc_mr = 0
                     SELECT(?APH:Nomor_mr)
                  END
               end
               JKon:KODE_KTR=RI_HR:Kontraktor
               access:jkontrak.fetch(JKon:KeyKodeKtr)
            end
         end
      ELSE
         MESSAGE('Nomor RM Tidak Ada Dalam daftar Rawat JALAN')
         ?BROWSE:4{PROP:DISABLE}=1
         ?Insert:5{PROP:DISABLE}=TRUE
         CLEAR (JPas:Nama)
         CLEAR (JPas:Alamat)
         CLEAR (RI_PI:Ruang)
         CLEAR (LOC::Status)
         CLEAR (JPas:Jenis_Pasien)
         DISPLAY
         SELECT(?APH:Nomor_mr)
      END
      display
      end
    OF ?APH:dokter
      IF APH:dokter OR ?APH:dokter{Prop:Req}
        JDok:Kode_Dokter = APH:dokter
        IF Access:JDokter.TryFetch(JDok:KeyKodeDokter)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            APH:dokter = JDok:Kode_Dokter
          ELSE
            SELECT(?APH:dokter)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      JDok:Kode_Dokter = APH:dokter
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        APH:dokter = JDok:Kode_Dokter
      END
      ThisWindow.Reset(1)
    OF ?Button9
      ThisWindow.Update
      if vl_ok=0 then
      globalrequest=selectrecord
      selectpaketobat
      APH:NoPaket=APP2:No
      APH:Biaya=APP2:Harga
      display
      appaketd{prop:sql}='select * from dba.appaketd where no='&APP2:No
      appaketd{prop:sql}='select * from dba.appaketd where no='&APP2:No
      loop
         if access:appaketd.next()<>level:benign then break.
         !message(APP21:Kode_Barang)
         APD:N0_tran      =APH:N0_tran
         APD:Kode_brg     =APP21:Kode_Barang
         APD:Jumlah       =APP21:Jumlah
         APD:Total        =APP21:Jumlah*APP21:Harga
         APD:Camp         =0
         APD:Harga_Dasar  =APP21:Harga
         APD:Diskon       =0
         APD:Jum1         =0
         APD:Jum2         =0
         access:apdtrans.insert()
      end
      brw4.resetsort(1)
      end
    OF ?OK
      ThisWindow.Update
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?discount
      ThisWindow.Reset(1)
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
    OF EVENT:AlertKey
      !Shortcut
      select(?cancel)
      presskey( 13)
    OF EVENT:CloseWindow
      IF SELF.RESPONSE = 1
      !   PrintTransRawatInap
      END
    OF EVENT:Timer
      !Security
      IF LOC::TOTAL = 0
         ?OK{PROP:DISABLE}=1
      ELSE
         ?OK{PROP:DISABLE}=0
      END
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APH:Biaya = LOC::TOTAL - discount


BRW4.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW4.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:5
    SELF.ChangeControl=?Change:5
    SELF.DeleteControl=?Delete:5
  END


BRW4.ResetFromAsk PROCEDURE(*BYTE Request,*BYTE Response)

  CODE
  PARENT.ResetFromAsk(Request,Response)
  brw4.resetsort(1)


BRW4.ResetFromView PROCEDURE

LOC::TOTAL:Sum       REAL                                  ! Sum variable for browse totals
discount:Sum         REAL                                  ! Sum variable for browse totals
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
    LOC::TOTAL:Sum += APD:Total
    discount:Sum += APD:Diskon
  END
  LOC::TOTAL = LOC::TOTAL:Sum
  discount = discount:Sum
  PARENT.ResetFromView
  Relate:APDTRANS.SetQuickScan(0)
  SETCURSOR()


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

Trig_UpdateRawatInapDetil1 PROCEDURE                       ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
vl_hna               REAL                                  !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
vl_total             REAL                                  !
loc::disk_pcs        REAL                                  !
History::APD:Record  LIKE(APD:RECORD),THREAD
QuickWindow          WINDOW('Update '),AT(,,207,160),FONT('Arial',8,,),IMM,HLP('UpdateAPDTRANS'),ALRT(EscKey),GRAY,MDI
                       PROMPT('N0 tran:'),AT(81,4),USE(?APD:N0_tran:Prompt)
                       ENTRY(@s15),AT(105,4,48,10),USE(APD:N0_tran),DISABLE,MSG('nomor transaksi'),TIP('nomor transaksi')
                       SHEET,AT(4,14,201,116),USE(?CurrentTab)
                         TAB('Data Transaksi'),USE(?Tab:1)
                           STRING('BARU'),AT(66,16,29,11),USE(?String2),TRN,FONT('Arial',10,,FONT:bold)
                           PROMPT('Kode Barang:'),AT(8,30),USE(?APD:Kode_brg:Prompt)
                           ENTRY(@s10),AT(65,30,48,10),USE(APD:Kode_brg),DISABLE,COLOR(COLOR:White),MSG('Kode Barang'),TIP('Kode Barang')
                           BUTTON('&H'),AT(117,29,13,13),USE(?Button6),KEY(F2Key)
                           PROMPT('Nama Barang'),AT(8,45),USE(?Prompt4)
                           STRING(@s40),AT(60,45),USE(GBAR:Nama_Brg)
                           PROMPT('Jumlah:'),AT(8,58),USE(?APD:Jumlah:Prompt)
                           ENTRY(@n15.2),AT(65,58,48,10),USE(APD:Jumlah),RIGHT(2),MSG('Jumlah'),TIP('Jumlah')
                           PROMPT('Harga :'),AT(8,76),USE(?APD:Total:Prompt)
                           ENTRY(@n-15.2),AT(65,76,48,10),USE(APD:Total),RIGHT(2),MSG('Harga Dasar'),TIP('Harga Dasar'),READONLY
                           ENTRY(@n5.2),AT(33,93,22,10),USE(loc::disk_pcs),RIGHT(2)
                           PROMPT('%'),AT(57,93),USE(?APD:Jumlah:Prompt:2)
                           ENTRY(@n-15.2),AT(65,93,48,10),USE(APD:Diskon),RIGHT(2),READONLY
                           PROMPT('Diskon:'),AT(8,93),USE(?APD:Diskon:Prompt)
                           PROMPT('Total:'),AT(8,109),USE(?vl_total:Prompt)
                           ENTRY(@n-15.2),AT(65,109,48,10),USE(vl_total),RIGHT(2)
                           BUTTON('Obat &Campur (F4)'),AT(125,69,70,31),USE(?Button5),HIDE,LEFT,FONT(,,COLOR:Black,FONT:bold),KEY(F4Key)
                         END
                       END
                       BUTTON('&OK [End]'),AT(36,133,61,24),USE(?OK),LEFT,KEY(EndKey),ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(111,133,61,24),USE(?Cancel),LEFT,KEY(EscKey),ICON(ICON:Cross)
                       BUTTON('Help'),AT(157,1,45,14),USE(?Help),HIDE,STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
Reset                  PROCEDURE(BYTE Force=0),DERIVED     ! Method added to host embed code
Run                    PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False) ! Method added to host embed code
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Adding a APDTRANS Record'
  OF ChangeRecord
    ActionMessage = 'Changing a APDTRANS Record'
  END
  !message(APH:cara_bayar)
  ?OK{PROP:DISABLE}=TRUE
  ?APD:Total{PROP:READONLY}=TRUE
  !if APD:Diskon<>0 then
  !   loc::disk_pcs=APD:Diskon*100/APD:Total
  !end
  !vl_total  =APD:Total-APD:Diskon
  display
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_UpdateRawatInapDetil1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APD:N0_tran:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APD:Record,History::APD:Record)
  SELF.AddHistoryField(?APD:N0_tran,1)
  SELF.AddHistoryField(?APD:Kode_brg,2)
  SELF.AddHistoryField(?APD:Jumlah,3)
  SELF.AddHistoryField(?APD:Total,4)
  SELF.AddHistoryField(?APD:Diskon,7)
  SELF.AddUpdateFile(Access:APDTRANS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:APDTRANS.SetOpenRelated()
  Relate:APDTRANS.Open                                     ! File JKontrakObat used by this procedure, so make sure it's RelationManager is open
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APOBKONT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITbrRwt.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKontrak.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStockGdg.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKontrakMaster.UseFile                            ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKontrakObat.UseFile                              ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:APDTRANS
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_UpdateRawatInapDetil1',QuickWindow)   ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
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
    INIMgr.Update('Trig_UpdateRawatInapDetil1',QuickWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
    APD:Diskon = 0
  PARENT.PrimeFields


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
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
    OF ?APD:Kode_brg
      GSTO:Kode_Apotik=GL_entryapotik
      GSTO:Kode_Barang=APD:Kode_brg
      GET(GStokAptk,GSTO:KeyBarang)
      IF ERRORCODE()
          ?APD:Jumlah{PROP:DISABLE}=1
          MESSAGE('Barang tersebut tidak ada dalam Daftar Obat')
          CLEAR (APD:Kode_brg )
          CLEAR (GBAR:Nama_Brg)
          DISPLAY
          SELECT(?APD:Kode_brg)
      ELSE
          ?APD:Jumlah{PROP:DISABLE}=0
          SELECT(?APD:Jumlah)
      END
    OF ?Button5
      glo::campur = glo::campur+1
      start(Trig_BrowseCampur,25000,APD:N0_tran)
    OF ?OK
      if APD:Total=0 then
         message('harga nol !!! tidak bisa ditransaksikan !!!')
         cycle
      end
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button6
      ThisWindow.Update
      APD:Jumlah       =0
      APD:Total        =0
      APD:Camp         =0
      APD:Harga_Dasar  =0
      APD:Diskon       =0
      APD:Jum1         =0
      APD:Jum2         =0
      loc::disk_pcs    =0
      vl_total         =0
      display
      
      globalrequest=selectrecord
      cari_brg_lokal4
      APD:Kode_brg=GBAR:Kode_brg
      GSTO:Kode_Apotik=GL_entryapotik
      GSTO:Kode_Barang=GBAR:Kode_brg
      GET(GStokAptk,GSTO:KeyBarang)
      IF ERRORCODE()
          ?APD:Jumlah{PROP:DISABLE}=1
          MESSAGE('Barang tersebut tidak ada dalam Daftar Obat')
          CLEAR (APD:Kode_brg )
          CLEAR (GBAR:Nama_Brg)
          DISPLAY
          SELECT(?Button6)
      ELSE
          !untuk menentukan cara bayar pasen
      !    if Glo:Rekap=3 then
      !       JKon:KODE_KTR=APH:Kontrak
      !       access:jkontrak.fetch(JKon:KeyKodeKtr)
      !       JKOM:Kode    =JKon:GROUP
      !       access:jkontrakmaster.fetch(JKOM:PrimaryKey)
      !       if JKOM:StatusTabelObat=0 then
      !          JKOO:KodeKontrak  =JKOM:Kode
      !          JKOO:Kode_brg     =GBAR:Kode_brg
      !          if access:jkontrakobat.fetch(JKOO:by_kode_ktr)=level:benign then
      !             MESSAGE('Barang tersebut tidak ditanggung')
      !             ?APD:Jumlah{PROP:DISABLE}=1
      !             CLEAR (APD:Kode_brg )
      !             CLEAR (GBAR:Nama_Brg)
      !             DISPLAY
      !             SELECT(?Button6)
      !             cycle
      !          end
      !       elsif JKOM:StatusTabelObat=1 then
      !          JKOO:KodeKontrak  =JKOM:Kode
      !          JKOO:Kode_brg     =GBAR:Kode_brg
      !          if access:jkontrakobat.fetch(JKOO:by_kode_ktr)<>level:benign then
      !             MESSAGE('Barang tersebut tidak ditanggung')
      !             ?APD:Jumlah{PROP:DISABLE}=1
      !             CLEAR (APD:Kode_brg )
      !             CLEAR (GBAR:Nama_Brg)
      !             DISPLAY
      !             SELECT(?Button6)
      !             cycle
      !          end
      !       end
      !    end
      END
      ?APD:Jumlah{PROP:DISABLE}=0
      SELECT(?APD:Jumlah)
      display
      !message(GBAR:Kelompok)
    OF ?APD:Jumlah
      !message(clip(glo_kls_rawat))
      if APD:Kode_brg='' then
         message('Kode Masih Kosong !!!')
         ?OK{PROP:DISABLE}=1
         cycle
      else
         if GSTO:Saldo=0 then
            message('STOK KOSONG !!!')
            APD:Jumlah       =0
            APD:Total        =0
            APD:Camp         =0
            APD:Harga_Dasar  =0
            APD:Diskon       =0
            APD:Jum1         =0
            APD:Jum2         =0
            loc::disk_pcs    =0
            vl_total         =0
            display
         elsif GSTO:Saldo<APD:Jumlah then
            message('STOK TINGGAL '&format(GSTO:Saldo,@n6)&' !!!')
            APD:Jumlah       =0
            APD:Total        =0
            APD:Camp         =0
            APD:Harga_Dasar  =0
            APD:Diskon       =0
            APD:Jum1         =0
            APD:Jum2         =0
            loc::disk_pcs    =0
            vl_total         =0
            display
         else
            IF APD:Jumlah = 0
                ?OK{PROP:DISABLE}=1
            ELSE
               GSTO:Kode_Apotik = GL_entryapotik
               GSTO:Kode_Barang = APD:Kode_brg
               GET(GStokaptk,GSTO:KeyBarang)
               CASE Glo:Rekap
               !untuk menentukan cara bayar pasen
               OF 3
                  !UNTUK pasien kontraktor, cari dahulu persentasenya
                  JKon:KODE_KTR=APH:Kontrak
                  access:jkontrak.fetch(JKon:KeyKodeKtr)
                  if JKon:HargaObat>0 then
                     !Kontraktor Telkom
                     APD:Total = GL_beaR + |
                                   (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) *JKon:HargaObat) * APD:Jumlah)
                  else
                     APO:KODE_KTR = GLO::back_up
                     APO:Kode_brg = APD:Kode_brg
                     GET(APOBKONT,APO:by_kode_ktr)
                     IF ERRORCODE() > 0
                        !Perhitungan biasa
                        CASE clip(glo_kls_rawat)
                        OF '1'
                               APD:Total = GL_beaR + |
                                   (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1 + (Glo::rwt1 / 100 ))) * APD:Jumlah)
                        OF '2'
                               APD:Total = GL_beaR + |
                                   (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1 + (Glo::rwt2 / 100 ))) * APD:Jumlah)
                        OF '3'
                               APD:Total = GL_beaR + |
                                   (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1 + (Glo::rwt3 / 100 ))) * APD:Jumlah)
                        OF 'VIP' 
                               APD:Total = GL_beaR + |
                                   (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1 + (Glo::rwtvip / 100 ))) * APD:Jumlah)
                        OF 'VVI'
                                   APD:Total = GL_beaR + |
                                   (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1 + (Glo::rwtvip / 100 ))) * APD:Jumlah)
                        ELSE
                               APD:Total = GL_beaR + |
                                   (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1 + (Glo::rwt1 / 100 ))) * APD:Jumlah)
                        END
                     ELSE
                        !kekecualian berdasarkan tabel ApobKont
                        APD:Total = GL_beaR + |
                                   (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1 + (APO:PERS_TAMBAH / 100 ))) * APD:Jumlah)
                     END
                  end
               OF 2
                  !UNTUK pasien umum, cari dahulu persentasenya
                  CASE clip(glo_kls_rawat)
                  OF '1'
                            APD:Total = GL_beaR + |
                                (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(Glo::rwt1 / 100 ))) * APD:Jumlah)
                  OF '2'
                            APD:Total = GL_beaR + |
                                (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(Glo::rwt2 / 100 ))) * APD:Jumlah)
                  OF '3'
                            APD:Total = GL_beaR + |
                                (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(Glo::rwt3 / 100 ))) * APD:Jumlah)
                  OF 'VIP' 
                            APD:Total = GL_beaR + |
                                (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) *  (1+(Glo::rwtvip / 100 ))) * APD:Jumlah)
                  OF 'VVI'
                            APD:Total = GL_beaR + |
                                (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) *  (1+(Glo::rwtvip / 100 ))) * APD:Jumlah)
                  END
               OF 1
                  APD:Total = GL_beaR + ( GSTO:Harga_Dasar * APD:Jumlah*(1+(GL_PPN/100)))
              END
      
              !Awal Perbaikan Tgl 10/10/2005 --> obat-obat Obat Onkologi
              ?OK{PROP:DISABLE}=0
              if GBAR:Kelompok=20 then
                 GSGD:Kode_brg=APD:Kode_brg
                 access:gstockgdg.fetch(GSGD:KeyKodeBrg)
                 APD:Total = GL_beaR + ((GSTO:Harga_Dasar*(1-GSGD:Discount/100))*(1+GL_PPN/100)) * APD:Jumlah
              end
              !Akhir Perbaikan Tgl 10/10/2005 Obat Onkologi
      
              !Awal Perbaikan Tgl 20/10/2005 Obat Askes
              if sub(clip(APD:Kode_brg),1,3)='3.3' then
                 IF sub(clip(APD:Kode_brg),1,8)='3.3.EMBA'
                    !Resep Jadi
                    GSGD:Kode_brg=APD:Kode_brg
                    access:gstockgdg.fetch(GSGD:KeyKodeBrg)
                    APD:Total = GSTO:Harga_Dasar * APD:Jumlah
                 else
                    !Resep Jadi
                    GSGD:Kode_brg=APD:Kode_brg
                    access:gstockgdg.fetch(GSGD:KeyKodeBrg)
                    vl_hna=(GSTO:Harga_Dasar*(1-GSGD:Discount/100))*1.1
                    if vl_hna<50000 then
                       APD:Total = GL_beaR + vl_hna * APD:Jumlah * 1.2
      !              elsif vl_hna<100000 then
      !                 APD:Total = GL_beaR + vl_hna * APD:Jumlah * 1.15
                    else
                       APD:Total = GL_beaR + vl_hna * APD:Jumlah * 1.15
                    end
                    display
                 end
              end
              !Akhir Perbaikan Tgl 20/10/2005 Obat Askes
              IF sub(clip(APD:Kode_brg),1,8)='3.1.EMBA'
                 !Resep Jadi
                 GSGD:Kode_brg=APD:Kode_brg
                 access:gstockgdg.fetch(GSGD:KeyKodeBrg)
                 APD:Total = GSTO:Harga_Dasar * APD:Jumlah
              end
              display
      
      
              APD:Harga_Dasar = GSTO:Harga_Dasar
              if APD:Diskon<>0 then
                 loc::disk_pcs=APD:Diskon*100/APD:Total
              end
              vl_total     =APD:Total-APD:Diskon
            END
         end
      end
      display
    OF ?loc::disk_pcs
      if loc::disk_pcs<>0 then
         APD:Diskon=APD:Total*(loc::disk_pcs/100)
      end
      vl_total  =APD:Total-APD:Diskon
      display
    OF ?APD:Diskon
      if APD:Diskon<>0 then
         loc::disk_pcs=APD:Diskon*100/APD:Total
      end
      vl_total     =APD:Total-APD:Diskon
      display
    OF ?OK
      ThisWindow.Update
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
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
    OF EVENT:OpenWindow
      if self.request=2 then
         if APD:Diskon<>0 then
            loc::disk_pcs=APD:Diskon*100/APD:Total
         else
            loc::disk_pcs=0
         end
         vl_total     =APD:Total-APD:Diskon
      end
      display
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

Trig_UpdateCampur PROCEDURE                                ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
tombol_ok            BYTE                                  !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
loc::hitung          BYTE                                  !
History::APD1:Record LIKE(APD1:RECORD),THREAD
QuickWindow          WINDOW('Merubah Data Obat Campur'),AT(,,325,165),FONT('Arial',8,,),IMM,HLP('UpdateAPDTcam'),SYSTEM,GRAY,MDI
                       PROMPT('No Transaksi :'),AT(77,4),USE(?APD1:N0_tran:Prompt)
                       ENTRY(@s15),AT(130,4,64,10),USE(APD1:N0_tran),DISABLE,MSG('nomor transaksi'),TIP('nomor transaksi')
                       PROMPT('No. Camp. :'),AT(205,4),USE(?APD1:Camp:Prompt),FONT('Times New Roman',10,COLOR:Black,)
                       ENTRY(@n2),AT(258,5,40,10),USE(APD1:Camp),DISABLE
                       SHEET,AT(7,16,315,117),USE(?CurrentTab)
                         TAB('Data Obat'),USE(?Tab:1)
                           PROMPT('Kode Barang:'),AT(11,40),USE(?APD1:Kode_brg:Prompt)
                           ENTRY(@s10),AT(65,37,65,13),USE(APD1:Kode_brg),FONT('Times New Roman',14,COLOR:Black,),MSG('Kode Barang'),TIP('Kode Barang')
                           BUTTON('&H'),AT(133,36,12,12),USE(?CallLookup),KEY(F2Key)
                           STRING(@s40),AT(157,39),USE(GBAR:Nama_Brg)
                           PROMPT('Jumlah:'),AT(11,60),USE(?APD1:Jumlah:Prompt)
                           ENTRY(@n-14.2),AT(65,60,65,13),USE(APD1:Jumlah),DECIMAL(14),FONT('Times New Roman',12,COLOR:Black,),MSG('Jumlah'),TIP('Jumlah')
                           IMAGE('YRPLUS.ICO'),AT(183,58,19,20),USE(?Image1)
                           IMAGE('YRPLUS.ICO'),AT(203,58),USE(?Image2)
                           GROUP('Nilai Konversi'),AT(233,60,75,49),USE(?Group1),BOXED,FONT('Times New Roman',10,COLOR:Black,)
                             STRING(@s10),AT(244,71),USE(APB:Sat_besar),LEFT(1)
                             STRING('='),AT(291,71),USE(?String5),FONT(,,,FONT:bold)
                             STRING(@n-14),AT(244,84,52,9),USE(APB:Nilai_konversi)
                             STRING(@s10),AT(244,95),USE(APB:Sat_kecil,,?APB:Sat_kecil:2)
                           END
                           STRING(@s10),AT(139,63),USE(APB:Sat_kecil),FONT('Times New Roman',10,COLOR:Black,)
                           BUTTON('Hitung (F4)'),AT(65,79,65,26),USE(?Button5),LEFT,FONT('Arial',8,,FONT:bold),KEY(F4Key),ICON(ICON:Exclamation)
                           PROMPT('Total:'),AT(11,111),USE(?APD1:Total:Prompt)
                           ENTRY(@n11.2),AT(65,111,65,13),USE(APD1:Total),DECIMAL(14),FONT('Times New Roman',10,COLOR:Black,),MSG('Harga Dasar'),TIP('Harga Dasar')
                         END
                       END
                       BUTTON('&OK [End]'),AT(203,138,83,22),USE(?OK),LEFT,FONT('Arial',10,,),KEY(EndKey),ICON(ICON:Save),DEFAULT
                       BUTTON('&Batal'),AT(100,139,83,22),USE(?Cancel),LEFT,FONT('Arial',10,,),KEY(EscKey),ICON(ICON:Cross)
                       BUTTON('Help'),AT(1,143,45,14),USE(?Help),STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Reset                  PROCEDURE(BYTE Force=0),DERIVED     ! Method added to host embed code
Run                    PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False) ! Method added to host embed code
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    CLEAR(ActionMessage)
  OF ChangeRecord
    CLEAR(ActionMessage)
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  ?APD1:Total{PROP:READONLY}=TRUE
  APD1:Jumlah{PROP:DISABLE}=1
  IF Dtd_ndtd = 2 THEN ?Button5{PROP:DISABLE}=1.
  ?OK{PROP:DISABLE}=1
  APD1:Camp    =glo::campur
  APD1:N0_tran =glo::nomor
  tombol_ok = 0
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_UpdateCampur')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APD1:N0_tran:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APD1:Record,History::APD1:Record)
  SELF.AddHistoryField(?APD1:N0_tran,1)
  SELF.AddHistoryField(?APD1:Camp,6)
  SELF.AddHistoryField(?APD1:Kode_brg,2)
  SELF.AddHistoryField(?APD1:Jumlah,3)
  SELF.AddHistoryField(?APD1:Total,5)
  SELF.AddUpdateFile(Access:APDTcam)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:APBRGCMP.Open                                     ! File APHTRANS used by this procedure, so make sure it's RelationManager is open
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:APDTcam
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.DeleteAction = Delete:Auto                        ! Automatic deletions
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel                      ! No confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_UpdateCampur',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APBRGCMP.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_UpdateCampur',QuickWindow)         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = APD1:Kode_brg                            ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    cari_brg_lokal4
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
    OF ?APD1:Kode_brg
      !cek tabel obat campur (apbrgcmp)
      APB:Kode_brg= APD1:Kode_brg
      GET(APBRGCMP,APB:by_kd_barang)
      IF ERRORCODE()
          MESSAGE( 'Barang Tidak Terdapat pada Tabel Obat Campur')
          SELECT (?APD1:Kode_brg)
          ?APD1:Jumlah{PROP:DISABLE}=1
          CYCLE
      END
      !cocokkan tabel gbarang
      GBAR:Kode_brg = APD1:Kode_brg
      Access:GBarang.Fetch(GBAR:KeyKodeBrg)
      !cek di tabel gstokaptk
      GSTO:Kode_Apotik = GL_entryapotik
      GSTO:Kode_Barang=APD1:Kode_brg
      GET(GStokAptk,GSTO:KeyBarang)
      IF ERRORCODE()
          ?APD1:Jumlah{PROP:DISABLE}=1
          MESSAGE('Barang tersebut tidak ada dalam Daftar Obat')
          CLEAR (APD1:Kode_brg )
          CLEAR (GBAR:Nama_Brg)
          DISPLAY
          SELECT(?APD1:Kode_brg)
      ELSE
          ?APD1:Jumlah{PROP:DISABLE}=0
          select(?APD1:Jumlah)
      END
    OF ?APD1:Jumlah
      if tombol_ok = 0
      loc::hitung = 0
      IF APD1:Jumlah = 0
          ?OK{PROP:DISABLE}=1
      ELSE
          IF self.request = changerecord
                  GSTO:Kode_Apotik = GL_entryapotik
                  GSTO:Kode_Barang = APD1:Kode_brg
                  GET(GStokaptk,GSTO:KeyBarang)
          END
          APD1:J_potong = ROUND ((APD1:Jumlah / APB:Nilai_konversi) + 0.4999,1)
          IF APD1:J_potong > GSTO:Saldo
              MESSAGE('Jumlah Stok yang ada : ' & GSTO:Saldo )
              SELECT (?APD1:Jumlah)
              CYCLE
          END
          ?OK{PROP:DISABLE}=0
          CASE Glo:Rekap   !Glo:Rekap = cara pembayaran pasen
              OF 3
                  ! UNTUK pasien kontraktor, cari dahulu persentasenya
                  APO:KODE_KTR = GLO::back_up
                  APO:Kode_brg = APD1:Kode_brg
                  GET(APOBKONT,APO:by_kode_ktr)
                  IF ERRORCODE()
                      !Perhitungan biasa
                      CASE clip(glo_kls_rawat)
                          OF '1'
                              APD1:Total = GL_beaR + |
                              (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(Glo::rwt1 / 100 ))) * APD1:J_potong)
                          OF '2'
                              APD1:Total = GL_beaR + |
                              (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+( Glo::rwt2 / 100 ))) * APD1:J_potong)
                          OF '3'
                              APD1:Total = GL_beaR + |
                              (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(Glo::rwt3 / 100 ))) * APD1:J_potong)
                          OF 'VIP'
                              APD1:Total = GL_beaR + |
                              (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(Glo::rwtvip / 100 ))) * APD1:J_potong)
                          ELSE
                              APD1:Total = GL_beaR + |
                              (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(Glo::rwt1 / 100 ))) * APD1:J_potong)
                      END
                  ELSE
                      !kekecualian berdasarkan tabel ApobKont
                      APD1:Total = GL_beaR + |
                      (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(APO:PERS_TAMBAH / 100 ))) * APD1:J_potong)
                  END
              OF 2
                  CASE clip(glo_kls_rawat)
                      OF '1'
                          APD1:Total = GL_beaR + |
                          (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(Glo::rwt1 / 100 ))) * APD1:J_potong)
                      OF '2'
                          APD1:Total = GL_beaR + |
                          (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(Glo::rwt2 / 100 ))) * APD1:J_potong)
                      OF '3'
                          APD1:Total = GL_beaR + |
                          (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(Glo::rwt3 / 100 ))) * APD1:J_potong)
                      OF 'VIP'
                          APD1:Total = GL_beaR + |
                          (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(Glo::rwtvip / 100 ))) * APD1:J_potong)
                  END
              OF 1
                  APD1:Total = GL_beaR + ( GSTO:Harga_Dasar * APD1:J_potong)
          END
          APD1:Harga_Dasar = GSTO:Harga_Dasar
          DISPLAY
      END
      END
    OF ?Button5
      IF loc::hitung = 0
          APD1:Jumlah = GLO::jml_cmp * APD1:Jumlah
          APD1:J_potong = ROUND ( (APD1:Jumlah / APB:Nilai_konversi)+0.4999,1)
          IF APD1:J_potong > GSTO:Saldo
              MESSAGE('Jumlah Stok yang ada : ' & GSTO:Saldo )
              SELECT (?APD1:Jumlah)
              CYCLE
          END
          ?OK{PROP:DISABLE}=0
          CASE Glo:Rekap  !untuk menentukan cara bayar pasen
            OF 3
              ! UNTUK pasien kontraktor, cari dahulu persentasenya
              APO:KODE_KTR = GLO::back_up
              APO:Kode_brg = APD1:Kode_brg
              GET(APOBKONT,APO:by_kode_ktr)
              IF ERRORCODE()
                  !Perhitungan biasa
                  CASE clip(glo_kls_rawat)
                    OF '1'
                      APD1:Total = GL_beaR + |
                      (( GSTO:Harga_Dasar + (Glo::rwt1 * GSTO:Harga_Dasar / 100 )) * APD1:J_potong)
                    OF '2'
                      APD1:Total = GL_beaR + |
                      (( GSTO:Harga_Dasar + (Glo::rwt2 * GSTO:Harga_Dasar / 100 )) * APD1:J_potong)
                    OF '3'
                      APD1:Total = GL_beaR + |
                      (( GSTO:Harga_Dasar + (Glo::rwt3 * GSTO:Harga_Dasar / 100 )) * APD1:J_potong)
                    OF 'VIP'
                      APD1:Total = GL_beaR + |
                      (( GSTO:Harga_Dasar + (Glo::rwtvip * GSTO:Harga_Dasar / 100 )) * APD1:J_potong)
                  END
              ELSE
                  !kekecualian berdasarkan tabel ApobKont
                  APD1:Total = GL_beaR + |
                  (( GSTO:Harga_Dasar + (APO:PERS_TAMBAH * GSTO:Harga_Dasar / 100 )) * APD1:J_potong)
              END
            OF 2
              CASE clip(glo_kls_rawat)
                  OF '1'
                      APD1:Total = GL_beaR + |
                      (( GSTO:Harga_Dasar + (Glo::rwt1 * GSTO:Harga_Dasar / 100 )) * APD1:J_potong)
                  OF '2'
                      APD1:Total = GL_beaR + |
                      (( GSTO:Harga_Dasar + (Glo::rwt2 * GSTO:Harga_Dasar / 100 )) * APD1:J_potong)
                  OF '3'
                      APD1:Total = GL_beaR + |
                      (( GSTO:Harga_Dasar + (Glo::rwt3 * GSTO:Harga_Dasar / 100 )) * APD1:J_potong)
                  OF 'VIP'
                      APD1:Total = GL_beaR + |
                      (( GSTO:Harga_Dasar + (Glo::rwtvip * GSTO:Harga_Dasar / 100 )) * APD1:J_potong)
              END
            OF 1
              APD1:Total = GL_beaR + ( GSTO:Harga_Dasar * APD1:J_potong)
          END
          DISPLAY
          loc::hitung = 1
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?APD1:Kode_brg
      IF APD1:Kode_brg OR ?APD1:Kode_brg{Prop:Req}
        GBAR:Kode_brg = APD1:Kode_brg
        IF Access:GBarang.TryFetch(GBAR:KeyKodeBrg)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            APD1:Kode_brg = GBAR:Kode_brg
          ELSE
            SELECT(?APD1:Kode_brg)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      GBAR:Kode_brg = APD1:Kode_brg
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        APD1:Kode_brg = GBAR:Kode_brg
      END
      ThisWindow.Reset(1)
      !cek di tabel obat campur (apbrgcmp)
      APB:Kode_brg= APD1:Kode_brg
      GET(APBRGCMP,APB:by_kd_barang)
      IF ERRORCODE()
          MESSAGE( 'Barang Tidak Terdapat pada Tabel Obat Campur')
          SELECT (?APD1:Kode_brg)
          ?APD1:Jumlah{PROP:DISABLE}=1
          CYCLE
      END
      !cek di tabel gstokaptk
      GSTO:Kode_Apotik = GL_entryapotik
      GSTO:Kode_Barang=APD1:Kode_brg
      GET(GStokAptk,GSTO:KeyBarang)
      IF ERRORCODE()
          ?APD1:Jumlah{PROP:DISABLE}=1
          MESSAGE('Barang tersebut tidak ada dalam Daftar Obat')
          CLEAR (APD1:Kode_brg )
          CLEAR (GBAR:Nama_Brg)
          DISPLAY
          SELECT(?APD1:Kode_brg)
      ELSE
          ?APD1:Jumlah{PROP:DISABLE}=0
      END
    OF ?OK
      ThisWindow.Update
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

