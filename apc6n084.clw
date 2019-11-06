

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N084.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N009.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N085.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N120.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N121.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N122.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N123.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N124.INC'),ONCE        !Req'd for module callout resolution
                     END


Trig_BrowseRawatInapBarcode PROCEDURE                      ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
vl_nomor             STRING(20)                            !
FilesOpened          BYTE                                  !
Lunas                STRING(5)                             !
Poliklinik           STRING(1)                             !
LOC::No_tran         STRING(15)                            !Nomor Transaksi
loc::thread          BYTE                                  !
vl_total             REAL                                  !
loc:barang           STRING(20)                            !
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
                       BUTTON('Button 9'),AT(66,225,45,14),USE(?Button9),HIDE
                       PROMPT('Barang:'),AT(119,227),USE(?loc:barang:Prompt)
                       ENTRY(@s20),AT(147,225,124,15),USE(loc:barang)
                       BUTTON('SIMPAN'),AT(274,225,45,14),USE(?Button12),DEFAULT
                       STRING('BARU'),AT(93,6,36,12),USE(?String1),TRN,FONT('Arial',10,,FONT:bold)
                       BUTTON('Cetak &Detail'),AT(9,82,61,26),USE(?Print),HIDE,LEFT,FONT('Times New Roman',10,COLOR:Blue,FONT:bold),HLP('Cetak Detail Transaksi'),MSG('Mencetak Detail Transaksi'),ICON(ICON:Print)
                       BUTTON('Cetak &Nota'),AT(404,89,41,15),USE(?Print:2),HIDE,LEFT,FONT('Times New Roman',,COLOR:Blue,FONT:bold),HLP('Cetak Nota transaksi'),MSG('Mencetak Nota Transaksi'),ICON(ICON:Print1)
                       BUTTON('T&ransaksi (Insert)'),AT(326,82,76,26),USE(?Insert:3),LEFT,FONT('Arial',8,,FONT:bold+FONT:italic),HLP('Transaksi Barang'),MSG('Melakukan Transaksi Barang'),TIP('Transaksi Barang'),KEY(InsertKey),ICON(ICON:Open)
                       BUTTON('&Select'),AT(279,1,45,14),USE(?Select:2),HIDE
                       BUTTON('&Change'),AT(229,1,45,14),USE(?Change:3),DISABLE,HIDE
                       BUTTON('&Delete'),AT(179,1,45,14),USE(?Delete:3),DISABLE,HIDE
                       SHEET,AT(4,4,445,111),USE(?CurrentTab)
                         TAB('No. Nota'),USE(?Tab:2)
                           BUTTON('Cetak &Detail'),AT(73,82,61,26),USE(?Print:3),LEFT,FONT('Arial',8,,FONT:bold),HLP('Cetak Detail Transaksi'),MSG('Mencetak Detail Transaksi'),ICON(ICON:Print)
                           BUTTON('ISI'),AT(139,82,30,26),USE(?Button11),KEY(F9Key)
                           ENTRY(@s15),AT(235,89,69,15),USE(LOC::No_tran),FONT('Times New Roman',10,COLOR:Black,),MSG('Nomor Transaksi'),TIP('Nomor Transaksi')
                           PROMPT('No. Transaksi :'),AT(177,92),USE(?LOC::No_tran:Prompt),TRN,FONT('Times New Roman',10,COLOR:Black,)
                         END
                         TAB('Nomor RM'),USE(?Tab:3)
                           PROMPT('Nomor RM :'),AT(83,87),USE(?APH:Nomor_mr:Prompt)
                           ENTRY(@N010_),AT(133,85,69,15),USE(APH:Nomor_mr),IMM,MSG('Nomor Medical record pasien'),TIP('Nomor KIUP')
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
!Proses Penomoran Otomatis Transaksi
Isi_Nomor Routine
   vl_nomor=''
   display
   loop
      logout(1,nomor_batal)
      if errorcode()=56 then
         cycle.
      !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
      NOM:No_Urut=1
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
         NOMU:Urut =1
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
        NOM1:No_urut=1
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
           NOMU:Urut =1
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
      nomor_batal{prop:sql}='delete dba.nomor_batal where No=1'
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 1=Transaksi Apotik ke pasien Rawat Inap
         NOM1:No_urut=1
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
  GlobalErrors.SetProcedureName('Trig_BrowseRawatInapBarcode')
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
  Relate:APDTRANS.Open                                     ! File Nomor_Batal used by this procedure, so make sure it's RelationManager is open
  Relate:Aphtransadd.Open                                  ! File Nomor_Batal used by this procedure, so make sure it's RelationManager is open
  Relate:ISetupAp.Open                                     ! File Nomor_Batal used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File Nomor_Batal used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_Batal.Open                                  ! File Nomor_Batal used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File Nomor_Batal used by this procedure, so make sure it's RelationManager is open
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
  BRW1::Sort1:Locator.Init(?APH:Nomor_mr,APH:Nomor_mr,1,BRW1) ! Initialize the browse locator using ?APH:Nomor_mr using key: APH:by_medrec , APH:Nomor_mr
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon APH:N0_tran for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,APH:by_transaksi) ! Add the sort order for APH:by_transaksi for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?LOC::No_tran,APH:N0_tran,,BRW1) ! Initialize the browse locator using ?LOC::No_tran using key: APH:by_transaksi , APH:N0_tran
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
  INIMgr.Fetch('Trig_BrowseRawatInapBarcode',QuickWindow)  ! Restore window settings from non-volatile store
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
    Relate:NomorUse.Close
    Relate:Nomor_Batal.Close
    Relate:Nomor_SKR.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_BrowseRawatInapBarcode',QuickWindow) ! Save window data to non-volatile store
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
      Trig_UpdateRawatInapBarcode
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
      glo:nomor=APH:N0_tran
      if APH:Biaya>0 then
         start(PrintTransRawatInap1CD,25000)
      else
         start(PrintReturRawatInap1CD,25000)
      end
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button12
      ThisWindow.Update
      APD:N0_tran =APH:N0_tran
      APD:Kode_brg=loc:barang
      APD:Jumlah  =1
      
      GSTO:Kode_Apotik = GL_entryapotik
      GSTO:Kode_Barang = APD:Kode_brg
      GET(GStokaptk,GSTO:KeyBarang)
      APD:Total = GL_beaR + |
                 (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1 + (Glo::rwt1 / 100 ))) * APD:Jumlah)
      APD:Camp    =0
      APD:Harga_Dasar =GSTO:Harga_Dasar
      APD:Diskon  =0
      APD:Jum1    =0
      APD:Jum2    =0
      access:apdtrans.insert()
      brw6.resetsort(1)
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
  
  !message(round(vl_total,1)&' '&APH:Biaya)
  
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

