

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N219.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N009.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N049.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N120.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N121.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N122.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N123.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N124.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N162.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N182.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N183.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N209.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N220.INC'),ONCE        !Req'd for module callout resolution
                     END


Trig_BrowseRawatInapNonBilling PROCEDURE                   ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
vl_nomor             STRING(15)                            !
FilesOpened          BYTE                                  !
Lunas                STRING(5)                             !
Poliklinik           STRING(1)                             !
LOC::No_tran         STRING(15)                            !Nomor Transaksi
loc::thread          BYTE                                  !
vl_total             REAL                                  !
ActionMessage        CSTRING(40)                           !
BRW1::View:Browse    VIEW(APHTRANS)
                       PROJECT(APH:Nomor_mr)
                       PROJECT(APH:Tanggal)
                       PROJECT(APH:Biaya)
                       PROJECT(APH:N0_tran)
                       PROJECT(APH:NoNota)
                       PROJECT(APH:Jam)
                       PROJECT(APH:Kode_Apotik)
                       PROJECT(APH:Asal)
                       PROJECT(APH:User)
                       PROJECT(APH:cara_bayar)
                       PROJECT(APH:Kontrak)
                       PROJECT(APH:dokter)
                       PROJECT(APH:NoTransaksiAsal)
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
JKon:NAMA_KTR          LIKE(JKon:NAMA_KTR)            !List box control field - type derived from field
APH:Tanggal            LIKE(APH:Tanggal)              !List box control field - type derived from field
APH:Biaya              LIKE(APH:Biaya)                !List box control field - type derived from field
APH:Biaya_NormalFG     LONG                           !Normal forground color
APH:Biaya_NormalBG     LONG                           !Normal background color
APH:Biaya_SelectedFG   LONG                           !Selected forground color
APH:Biaya_SelectedBG   LONG                           !Selected background color
APH:N0_tran            LIKE(APH:N0_tran)              !List box control field - type derived from field
APH:NoNota             LIKE(APH:NoNota)               !List box control field - type derived from field
APH:Jam                LIKE(APH:Jam)                  !List box control field - type derived from field
APH:Kode_Apotik        LIKE(APH:Kode_Apotik)          !List box control field - type derived from field
APH:Asal               LIKE(APH:Asal)                 !List box control field - type derived from field
APH:User               LIKE(APH:User)                 !List box control field - type derived from field
APH:cara_bayar         LIKE(APH:cara_bayar)           !List box control field - type derived from field
APH:Kontrak            LIKE(APH:Kontrak)              !List box control field - type derived from field
APH:dokter             LIKE(APH:dokter)               !List box control field - type derived from field
APH:NoTransaksiAsal    LIKE(APH:NoTransaksiAsal)      !List box control field - type derived from field
Lunas                  LIKE(Lunas)                    !List box control field - type derived from local data
Glo::kode_apotik       LIKE(Glo::kode_apotik)         !Browse hot field - type derived from global data
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
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Transaksi Instalasi Farmasi - Rawat Inap (Tidak Masuk Billing)'),AT(,,532,309),FONT('Arial',8,,),CENTER,IMM,HLP('Tran_Poliklinik'),MSG('Transaksi Instalasi Farmasi'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,514,109),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('49L|FM~Nomor RM~C@N010_@96L|FM~Nama~C@s35@100L|FM~Kontraktor~C@s100@47R(1)|M~Tan' &|
   'ggal~C(0)@D06@55R(1)|M*~Biaya~C(0)@n-15.2@64L|M~No. Transaksi~C@s15@44L|M~No Bil' &|
   'ling~@s10@35R(1)|M~Jam~C(0)@t04@45L|M~Kode Apotik~@s5@44L|M~Asal~@s10@27L|M~User' &|
   '~@s4@37L|M~cara bayar~@n1@40L|M~Kontrak~@s10@20L|M~dokter~@s5@60L|M~No Transaksi' &|
   ' Asal~@s15@27L|M~Lunas~@s5@'),FROM(Queue:Browse:1)
                       LIST,AT(10,163,515,119),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('45L|FM~Kode Barang~C@s10@160L|FM~Nama Obat~C@s40@78L|FM~Keterangan~C@s50@15L|FM~' &|
   'KTT~C@n3@71D(14)|M~Jumlah~C(0)@n-14.2@59R(2)|M~Total~C(0)@n-15.2@60R(2)|M~Diskon' &|
   '~C(0)@n-15.2@60L~Camp~C@n2@60L~N 0 tran~C@s15@'),FROM(Queue:Browse)
                       BUTTON('Button 9'),AT(71,289,45,14),USE(?Button9),HIDE
                       BUTTON('Cetak &Detail'),AT(9,130,61,26),USE(?Print),LEFT,FONT('Times New Roman',10,COLOR:Blue,FONT:bold),HLP('Cetak Detail Transaksi'),MSG('Mencetak Detail Transaksi'),ICON(ICON:Print)
                       BUTTON('Cetak &Nota'),AT(404,137,67,15),USE(?Print:2),HIDE,LEFT,FONT('Times New Roman',,COLOR:Blue,FONT:bold),HLP('Cetak Nota transaksi'),MSG('Mencetak Nota Transaksi'),ICON(ICON:Print1)
                       BUTTON('T&ransaksi (Insert)'),AT(326,130,76,26),USE(?Insert:3),LEFT,FONT('Times New Roman',10,,FONT:bold+FONT:italic),HLP('Transaksi Barang'),MSG('Melakukan Transaksi Barang'),TIP('Transaksi Barang'),KEY(InsertKey),ICON(ICON:Open)
                       BUTTON('&Select'),AT(214,1,45,14),USE(?Select:2),HIDE
                       BUTTON('&Change'),AT(164,1,45,14),USE(?Change:3),HIDE,DEFAULT
                       BUTTON('&Delete'),AT(114,1,45,14),USE(?Delete:3),DISABLE,HIDE
                       SHEET,AT(4,4,524,156),USE(?CurrentTab)
                         TAB('No. Transaksi :'),USE(?Tab:2)
                           STRING('Tidak Masuk Billing'),AT(416,3),USE(?String1),FONT(,12,COLOR:Red,FONT:bold,CHARSET:ANSI)
                           BUTTON('Cetak &Detail (KTT)'),AT(129,130,61,26),USE(?Print:3),HIDE,LEFT,FONT('Times New Roman',10,,FONT:bold),HLP('Cetak Detail Transaksi'),MSG('Mencetak Detail Transaksi'),ICON(ICON:Print)
                           ENTRY(@s15),AT(235,137,69,15),USE(LOC::No_tran),FONT('Times New Roman',10,COLOR:Black,),MSG('Nomor Transaksi'),TIP('Nomor Transaksi')
                           BUTTON('Cetak Detail (KTT)'),AT(74,130,61,26),USE(?Button16),LEFT,FONT(,,,FONT:bold,CHARSET:ANSI),ICON(ICON:Print1)
                           BUTTON('History Per Pasien'),AT(472,132,52,25),USE(?Button13),LEFT
                           PROMPT('No. Transaksi :'),AT(177,140),USE(?LOC::No_tran:Prompt),TRN,FONT('Times New Roman',10,COLOR:Black,)
                           BUTTON('Convert ke BPJS'),AT(148,131,69,25),USE(?Button11),DISABLE,HIDE,LEFT,FONT('Times New Roman',9,,FONT:bold,CHARSET:ANSI),ICON(ICON:JumpPage)
                           BUTTON('tes kopi'),AT(184,128,45,14),USE(?OK),HIDE,DEFAULT
                         END
                         TAB('Nomor RM'),USE(?Tab:3)
                           BUTTON('Cetak Detail (KTT)'),AT(74,130,61,26),USE(?Button16:2),LEFT,FONT(,,,FONT:bold,CHARSET:ANSI),ICON(ICON:Print1)
                           BUTTON('Convert ke BPJS'),AT(139,131,69,25),USE(?Button11:2),DISABLE,HIDE,LEFT,FONT('Times New Roman',9,,FONT:bold,CHARSET:ANSI),ICON(ICON:JumpPage)
                           BUTTON('History Per Pasien'),AT(472,132,52,25),USE(?Button13:2),LEFT
                           PROMPT('Nomor RM :'),AT(196,140),USE(?APH:Nomor_mr:Prompt)
                           ENTRY(@N010_),AT(235,137,69,15),USE(APH:Nomor_mr),IMM,MSG('Nomor Medical record pasien'),TIP('Nomor KIUP')
                         END
                       END
                       BOX,AT(414,2,103,14),USE(?Box1),COLOR(COLOR:Red),FILL(COLOR:Red)
                       BUTTON('&Tutup'),AT(362,285,87,20),USE(?Close)
                       BUTTON('Help'),AT(264,1,45,14),USE(?Help),HIDE,STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Reset                  PROCEDURE(BYTE Force=0),DERIVED     ! Method added to host embed code
Run                    PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
Isi_Nomor_bpjs Routine
   vl_nomor=''
   display
   loop
      logout(1,nomor_batal)
      if errorcode()=56 then
         cycle.
      !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
      NOM:No_Urut=76
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
         NOMU:Urut =76
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
        NOM1:No_urut=76
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
           NOMU:Urut =76
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
      nomor_batal{prop:sql}='delete dba.nomor_batal where No=69'
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 1=Transaksi Apotik ke pasien Rawat Inap
         NOM1:No_urut=76
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
   APHB:N0_tran=vl_nomor
   display

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Record will be Added'
  OF ChangeRecord
    GlobalErrors.Throw(Msg:UpdateIllegal)
    RETURN
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  ! untuk mengambil data setup persentase
  IF RECORDS(ISetupAp) = 0 THEN
     MESSAGE ('Jalankan menu SET UP dahulu')
     POST(EVENT:CloseWindow)
  END
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
  GlobalErrors.SetProcedureName('Trig_BrowseRawatInapNonBilling')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  WindowTanggal()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('VG_TANGGAL1',VG_TANGGAL1)                          ! Added by: BrowseBox(ABC)
  BIND('VG_TANGGAL2',VG_TANGGAL2)                          ! Added by: BrowseBox(ABC)
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  BIND('Lunas',Lunas)                                      ! Added by: BrowseBox(ABC)
  BIND('Glo::kode_apotik',Glo::kode_apotik)                ! Added by: BrowseBox(ABC)
  loc::thread=glo::mainthreadno
  POST(EVENT:Disable_RInap,,loc::thread)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  SELF.AddUpdateFile(Access:APHTRANSBPJS)
  Relate:APDTRANS.Open                                     ! File APHTRANSBPJS used by this procedure, so make sure it's RelationManager is open
  Relate:APHTRANSBPJS.Open                                 ! File APHTRANSBPJS used by this procedure, so make sure it's RelationManager is open
  Relate:Aphtransadd.Open                                  ! File APHTRANSBPJS used by this procedure, so make sure it's RelationManager is open
  Relate:ISetupAp.Open                                     ! File APHTRANSBPJS used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File APHTRANSBPJS used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_Batal.Open                                  ! File APHTRANSBPJS used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File APHTRANSBPJS used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:RI_PinRuang.UseFile                               ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:RI_HRInap.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITbrRwt.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:APHTRANSBPJS
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:None                        ! Changes not allowed
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
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
  BRW1.SetFilter('(aph:tanggal>=VG_TANGGAL1 and aph:tanggal<<=VG_TANGGAL2 and sub(APH:N0_tran,1,3)=''API'' and APH:Kode_Apotik=GL_entryapotik)') ! Apply filter expression to browse
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon APH:N0_tran for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,APH:by_transaksi) ! Add the sort order for APH:by_transaksi for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?LOC::No_tran,APH:N0_tran,,BRW1) ! Initialize the browse locator using ?LOC::No_tran using key: APH:by_transaksi , APH:N0_tran
  BRW1.SetFilter('(aph:tanggal>=VG_TANGGAL1 and aph:tanggal<<=VG_TANGGAL2 and sub(APH:N0_tran,1,3)=''APO'' and APH:Ra_jal = 0 and APH:Kode_Apotik=GL_entryapotik)') ! Apply filter expression to browse
  BRW1.AddField(APH:Nomor_mr,BRW1.Q.APH:Nomor_mr)          ! Field APH:Nomor_mr is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nama,BRW1.Q.JPas:Nama)                ! Field JPas:Nama is a hot field or requires assignment from browse
  BRW1.AddField(JKon:NAMA_KTR,BRW1.Q.JKon:NAMA_KTR)        ! Field JKon:NAMA_KTR is a hot field or requires assignment from browse
  BRW1.AddField(APH:Tanggal,BRW1.Q.APH:Tanggal)            ! Field APH:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(APH:Biaya,BRW1.Q.APH:Biaya)                ! Field APH:Biaya is a hot field or requires assignment from browse
  BRW1.AddField(APH:N0_tran,BRW1.Q.APH:N0_tran)            ! Field APH:N0_tran is a hot field or requires assignment from browse
  BRW1.AddField(APH:NoNota,BRW1.Q.APH:NoNota)              ! Field APH:NoNota is a hot field or requires assignment from browse
  BRW1.AddField(APH:Jam,BRW1.Q.APH:Jam)                    ! Field APH:Jam is a hot field or requires assignment from browse
  BRW1.AddField(APH:Kode_Apotik,BRW1.Q.APH:Kode_Apotik)    ! Field APH:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(APH:Asal,BRW1.Q.APH:Asal)                  ! Field APH:Asal is a hot field or requires assignment from browse
  BRW1.AddField(APH:User,BRW1.Q.APH:User)                  ! Field APH:User is a hot field or requires assignment from browse
  BRW1.AddField(APH:cara_bayar,BRW1.Q.APH:cara_bayar)      ! Field APH:cara_bayar is a hot field or requires assignment from browse
  BRW1.AddField(APH:Kontrak,BRW1.Q.APH:Kontrak)            ! Field APH:Kontrak is a hot field or requires assignment from browse
  BRW1.AddField(APH:dokter,BRW1.Q.APH:dokter)              ! Field APH:dokter is a hot field or requires assignment from browse
  BRW1.AddField(APH:NoTransaksiAsal,BRW1.Q.APH:NoTransaksiAsal) ! Field APH:NoTransaksiAsal is a hot field or requires assignment from browse
  BRW1.AddField(Lunas,BRW1.Q.Lunas)                        ! Field Lunas is a hot field or requires assignment from browse
  BRW1.AddField(Glo::kode_apotik,BRW1.Q.Glo::kode_apotik)  ! Field Glo::kode_apotik is a hot field or requires assignment from browse
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
  BRW6.AddField(GBAR:Kode_brg,BRW6.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_BrowseRawatInapNonBilling',QuickWindow) ! Restore window settings from non-volatile store
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
    Relate:NomorUse.Close
    Relate:Nomor_Batal.Close
    Relate:Nomor_SKR.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_BrowseRawatInapNonBilling',QuickWindow) ! Save window data to non-volatile store
  END
  POST(EVENT:Enable_RInap,,loc::thread)
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  JKon:KODE_KTR = APHB:Kontrak                             ! Assign linking field value
  Access:JKontrak.Fetch(JKon:KeyKodeKtr)
  JPas:Nomor_mr = APHB:Nomor_mr                            ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
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
      Trig_UpdateRawatInapNonBilling
      PrintTransRawatInapA5
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
      glo::no_nota=APH:N0_tran
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
      glo::no_nota=APH:N0_tran
      !if APH:Biaya>0 then
      !   start(PrintTransRawatInapA5KTT,25000)
      !else
      !   start(PrintTransRawatInapA5KTT,25000)
      !end
    OF ?OK
      get(aphtrans,APH:by_transaksi)
      do isi_nomor_bpjs
      APHB:NIP         = APH:NIP
      APHB:LamaBaru    = APH:LamaBaru
      APHB:Urut        = APH:Urut
      APHB:Nomor_mr    = APH:Nomor_mr
      APHB:Tanggal     = APH:Tanggal
      APHB:Biaya       = APH:Biaya
      APHB:NoNota      = APH:NoNota
      APHB:Jam         = APH:Jam
      APHB:Kode_Apotik = APH:Kode_Apotik
      APHB:Asal        = APH:Asal
      APHB:User        = APH:User
      APHB:cara_bayar  = APH:cara_bayar
      APHB:Kontrak     = APH:Kontrak
      APHB:dokter      = APH:dokter
      APHB:NoPaket     = APH:NoPaket
      access:aphtransbpjs.Insert
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Change:3
      ThisWindow.Update
      cycle
    OF ?Delete:3
      ThisWindow.Update
      cycle
    OF ?Print:3
      ThisWindow.Update
      START(PrintTransRawatInapA5KTT, 25000)
      ThisWindow.Reset
    OF ?Button16
      ThisWindow.Update
      glo:nomor=APH:N0_tran
      glo::no_nota=APH:N0_tran
      display
      PrintTransRawatInapA5KTT()
    OF ?Button13
      ThisWindow.Update
      START(BrowseObatPerPasienPerTanggal_Inap, 25000)
      ThisWindow.Reset
    OF ?Button11
      ThisWindow.Update
      glo:bpjs_no_mr =aph:nomor_mr
      JPas:Nomor_mr = APH:Nomor_mr
      get(aphtrans,APH:by_transaksi)
      GET(JPasien,JPas:KeyNomorMr)
      
      glo:bpjs_nama_pasien =JPas:Nama
      glo:bpjs_alamat_pasien =JPas:Alamat
      
      glo:bpjs_tanggal =aph:tanggal
      glo:bpjs_biaya =aph:biaya
      glo:bpjs_no_tran =aph:n0_tran
      glo:bpjs_nonota =aph:nonota
      glo:bpjs_jam =aph:jam
      glo:bpjs_kode_apotik =aph:kode_apotik
      glo:bpjs_asal =aph:asal
      glo:bpjs_user =aph:user
      glo:bpjs_cara_bayar =aph:cara_bayar
      glo:bpjs_kontrak =aph:kontrak
      glo:bpjs_dokter =aph:dokter
      glo:bpjs_lunas =lunas
      glo:bpjs_urut = APH:Urut
      glo:bpjs_noPaket = APH:NoPaket
      
      Trig_UpdateRawatInapCopyKeBpjs
      display
    OF ?OK
      ThisWindow.Update
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?Button11:2
      ThisWindow.Update
      glo:bpjs_no_mr =aph:nomor_mr
      JPas:Nomor_mr = APH:Nomor_mr
      get(aphtrans,APH:by_transaksi)
      GET(JPasien,JPas:KeyNomorMr)
      
      glo:bpjs_nama_pasien =JPas:Nama
      glo:bpjs_alamat_pasien =JPas:Alamat
      
      glo:bpjs_tanggal =aph:tanggal
      glo:bpjs_biaya =aph:biaya
      glo:bpjs_no_tran =aph:n0_tran
      glo:bpjs_nonota =aph:nonota
      glo:bpjs_jam =aph:jam
      glo:bpjs_kode_apotik =aph:kode_apotik
      glo:bpjs_asal =aph:asal
      glo:bpjs_user =aph:user
      glo:bpjs_cara_bayar =aph:cara_bayar
      glo:bpjs_kontrak =aph:kontrak
      glo:bpjs_dokter =aph:dokter
      glo:bpjs_lunas =lunas
      glo:bpjs_urut = APH:Urut
      glo:bpjs_noPaket = APH:NoPaket
      
      Trig_UpdateRawatInapCopyKeBpjs
      display
    OF ?Button13:2
      ThisWindow.Update
      START(BrowseObatPerPasienPerTanggal_Inap, 25000)
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
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:OpenWindow
      !if Glo:Bagian = 'BPJS' or Glo:Bagian = 'SIM' then
      !    enable(?Button11)
      !end
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
  !vl_total=0
  !set(BRW6::View:Browse)
  !loop
  !   next(BRW6::View:Browse)
  !   if errorcode() then break.
  !   vl_total+=APD:Total-APD:Diskon
  !end
  !
  !!message(round(vl_total,1)&' '&APH:Biaya)
  !
  !if round(vl_total,1)<>APH:Biaya then
  !   if (APH:Biaya-round(vl_total,1))<=1 then
  !      vl_total=round(vl_total,1)+1
  !   else
  !      message('Total beda dengan detil, harap hubungi Divisi SIMRS ! '&round(vl_total,1)&' '&APH:Biaya)
  !      access:aphtrans.fetch(APH:by_transaksi)
  !      APH:Biaya=round(vl_total,1)
  !      access:aphtrans.update()
  !      message('Data sudah disamakan, silahkan cetak ulang struk !')
  !   end
  !end


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

