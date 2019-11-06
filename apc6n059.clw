

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N059.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N003.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N005.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N006.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N008.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N009.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N010.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N049.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N060.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N104.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N119.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N120.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N121.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N122.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N123.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N124.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N145.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N160.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N162.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N182.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N183.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N205.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N207.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N209.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N210.INC'),ONCE        !Req'd for module callout resolution
                     END


Trig_BrowseRawatInap PROCEDURE                             ! Generated from procedure template - Window

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
QuickWindow          WINDOW('Transaksi Instalasi Farmasi - Rawat Inap'),AT(,,532,309),FONT('Arial',8,,),CENTER,IMM,HLP('Tran_Poliklinik'),MSG('Transaksi Instalasi Farmasi'),SYSTEM,GRAY,MDI
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
                       BUTTON('&Select'),AT(279,1,45,14),USE(?Select:2),HIDE
                       BUTTON('&Change'),AT(229,1,45,14),USE(?Change:3),HIDE,DEFAULT
                       BUTTON('&Delete'),AT(179,1,45,14),USE(?Delete:3),DISABLE,HIDE
                       SHEET,AT(4,4,524,156),USE(?CurrentTab)
                         TAB('No. Transaksi :'),USE(?Tab:2)
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
                       BUTTON('&Tutup'),AT(362,285,87,20),USE(?Close)
                       BUTTON('Help'),AT(329,1,45,14),USE(?Help),HIDE,STD(STD:Help)
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
  GlobalErrors.SetProcedureName('Trig_BrowseRawatInap')
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
  BRW1.SetFilter('(aph:tanggal>=VG_TANGGAL1 and aph:tanggal<<=VG_TANGGAL2 and sub(APH:N0_tran,1,3)=''API'' and APH:Kode_Apotik=GL_entryapotik)') ! Apply filter expression to browse
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
  INIMgr.Fetch('Trig_BrowseRawatInap',QuickWindow)         ! Restore window settings from non-volatile store
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
    INIMgr.Update('Trig_BrowseRawatInap',QuickWindow)      ! Save window data to non-volatile store
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
      Trig_UpdateRawatInap
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

Trig_UpdateRawatInap PROCEDURE                             ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
loc::copy_total      LONG                                  !
vl_sudah             BYTE                                  !
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
vl_real              REAL                                  !
vl_hasil             REAL                                  !
vl_seribu            REAL                                  !
vl_selisih           REAL                                  !
vl_diskon_pct        REAL                                  !
vl_total             REAL                                  !
vl_hna               REAL                                  !
vl_pembulatan        BYTE                                  !
LOC::TOTAL_DTG       REAL                                  !
vl_nourut            LONG                                  !
BRW4::View:Browse    VIEW(APDTRANS)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:ktt)
                       PROJECT(APD:Camp)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:namaobatracik)
                       PROJECT(APD:Total)
                       PROJECT(APD:Diskon)
                       PROJECT(APD:N0_tran)
                       PROJECT(APD:Harga_Dasar)
                       PROJECT(APD:Jum1)
                       PROJECT(APD:total_dtg)
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
APD:ktt                LIKE(APD:ktt)                  !List box control field - type derived from field
APD:Camp               LIKE(APD:Camp)                 !List box control field - type derived from field
APD:Jumlah             LIKE(APD:Jumlah)               !List box control field - type derived from field
APD:namaobatracik      LIKE(APD:namaobatracik)        !List box control field - type derived from field
APD:Total              LIKE(APD:Total)                !List box control field - type derived from field
APD:Diskon             LIKE(APD:Diskon)               !List box control field - type derived from field
APD:N0_tran            LIKE(APD:N0_tran)              !List box control field - type derived from field
APD:Harga_Dasar        LIKE(APD:Harga_Dasar)          !List box control field - type derived from field
APD:Jum1               LIKE(APD:Jum1)                 !List box control field - type derived from field
APD:total_dtg          LIKE(APD:total_dtg)            !List box control field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::APH:Record  LIKE(APH:RECORD),THREAD
QuickWindow          WINDOW('Transaksi Instalasi Farmasi -Rawat Inap'),AT(,,531,306),FONT('Arial',8,,),CENTER,IMM,HLP('UpdateAPHTRANS'),ALRT(EscKey),TIMER(100),GRAY,MDI
                       ENTRY(@N010_),AT(65,3,81,13),USE(APH:Nomor_mr),FONT('Times New Roman',16,,FONT:bold),MSG('Nomor Medical record pasien'),TIP('Nomor KIUP')
                       BUTTON('F2'),AT(150,3,20,13),USE(?Button8),DISABLE,KEY(F2Key)
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
                       PROMPT('NAMA :'),AT(30,19,32,14),USE(?Prompt5),RIGHT,FONT('Times New Roman',10,,FONT:bold)
                       ENTRY(@s35),AT(65,19,165,13),USE(JPas:Nama),DISABLE,FONT(,,COLOR:Black,FONT:bold),HLP('Nama mendahului gelar'),MSG('Nama pasien'),REQ,CAP
                       STRING('Kelas Biaya :'),AT(321,36),USE(?String6)
                       STRING(@s3),AT(369,35),USE(glo_kls_rawat),FONT('Arial',12,COLOR:Blue,FONT:bold)
                       PROMPT('ALAMAT :'),AT(20,35,42,14),USE(?Prompt6),RIGHT,FONT('Times New Roman',10,,FONT:bold)
                       ENTRY(@s35),AT(65,35,165,13),USE(JPas:Alamat),DISABLE,HLP('contoh : Kopo Jl'),MSG('Alamat Pasien'),CAP
                       PROMPT('RUANGAN :'),AT(19,83),USE(?APH:Ruang:Prompt),RIGHT,FONT(,,,FONT:bold)
                       ENTRY(@s10),AT(65,83,47,13),USE(APH:Ruang),DISABLE
                       PROMPT('Dr.:'),AT(114,84),USE(?APH:dokter:Prompt),FONT(,,,FONT:bold)
                       ENTRY(@s5),AT(128,83,25,13),USE(APH:dokter),DISABLE
                       BUTTON('F3'),AT(155,83,20,13),USE(?CallLookup),KEY(F3Key)
                       PROMPT('NIP :'),AT(31,66,31,14),USE(?APH:NIP:Prompt),RIGHT,FONT('Times New Roman',10,,FONT:bold)
                       ENTRY(@s7),AT(65,66,47,13),USE(APH:NIP),DISABLE
                       ENTRY(@s40),AT(115,66,115,13),USE(PEGA:Nama),DISABLE
                       PROMPT('KONTRAKTOR :'),AT(233,51,63,10),USE(?APH:NIP:Prompt:2),RIGHT,FONT('Times New Roman',8,,FONT:bold)
                       ENTRY(@s10),AT(299,51,41,13),USE(APH:Kontrak),DISABLE
                       STRING(@s100),AT(343,52),USE(JKon:NAMA_KTR),FONT(,10,COLOR:Blue,FONT:bold)
                       ENTRY(@s15),AT(65,50,165,13),USE(JPas:Telepon),DISABLE,HLP('contoh : Kopo Jl'),MSG('Alamat Pasien'),CAP
                       PROMPT('NO. TLP :'),AT(20,52,42,14),USE(?Prompt6:2),RIGHT,FONT('Times New Roman',10,,FONT:bold)
                       BUTTON('&Tambah Obat (+)'),AT(7,243,127,19),USE(?Insert:5),FONT('Times New Roman',10,,FONT:bold),KEY(PlusKey)
                       PROMPT('APOTIK :'),AT(233,3,42,14),USE(?APH:Kode_Apotik:Prompt)
                       ENTRY(@s5),AT(279,3,27,13),USE(APH:Kode_Apotik),DISABLE,MSG('Kode Apotik'),TIP('Kode Apotik')
                       PROMPT('&TANGGAL:'),AT(314,3,37,14),USE(?APH:Tanggal:Prompt)
                       PROMPT('N0 tran:'),AT(12,267),USE(?APH:N0_tran:Prompt),FONT('Times New Roman',12,COLOR:Black,FONT:bold+FONT:italic+FONT:underline)
                       ENTRY(@s15),AT(53,265,77,13),USE(APH:N0_tran),DISABLE,FONT('Arial',11,COLOR:Black,FONT:bold),MSG('nomor transaksi'),TIP('nomor transaksi')
                       LINE,AT(285,281,158,0),USE(?Line1),COLOR(COLOR:Black),LINEWIDTH(2)
                       LIST,AT(8,107,515,130),USE(?Browse:4),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('48L|FM~Kode Barang~@s10@160L|M~Nama Obat~C@s40@61L|M~Keterangan~C@s50@16L|M~KTT~' &|
   'C@n3@25L|M~Racik~C@n2@44D(14)|M~Jumlah~C(0)@n-14.2@79R(14)|M~namaobatracik~C(0)@' &|
   's40@48D(14)|M~Total~C(0)@n-14.2@60R(2)|M~Diskon~C(0)@n-15.2@60D(14)|M~N 0 tran~C' &|
   '(0)@s15@44D(14)|M~Harga Dasar~C(0)@n11.2@28R(14)|M~Urut~C(0)@n-7@64D(14)|M~total' &|
   ' dtg~C(0)@N-16.2@'),FROM(Queue:Browse:4)
                       PROMPT('Total :'),AT(285,285),USE(?APH:Biaya:Prompt),FONT('Times New Roman',14,COLOR:Black,FONT:bold+FONT:italic)
                       ENTRY(@n-15.2),AT(345,285,97,14),USE(APH:Biaya),DISABLE,RIGHT(1),MSG('Total Biaya Pembelian'),TIP('Total Biaya Pembelian')
                       ENTRY(@s30),AT(178,83,67,13),USE(JDok:Nama_Dokter),DISABLE,MSG('Nama Dokter'),TIP('Nama Dokter'),UPR
                       PROMPT('NO. PAKET :'),AT(249,69),USE(?APH:NoPaket:Prompt)
                       ENTRY(@n-7),AT(299,67,41,13),USE(APH:NoPaket),DISABLE,RIGHT(1)
                       BUTTON('F4'),AT(343,67,20,13),USE(?Button9),KEY(F4Key)
                       PANEL,AT(7,263,127,19),USE(?Panel2)
                       BUTTON('&OK [End]'),AT(208,244,56,38),USE(?OK),FONT('Times New Roman',10,COLOR:Black,),KEY(EndKey),ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(148,244,56,38),USE(?Cancel),FONT('Times New Roman',12,COLOR:Black,),ICON(ICON:Cross)
                       ENTRY(@n-15.2),AT(345,244,97,14),USE(LOC::TOTAL),DISABLE
                       PROMPT('Harga Dasar:'),AT(459,250),USE(?APH:Harga_Dasar:Prompt),HIDE
                       ENTRY(@n10.2),AT(452,261,69,13),USE(APH:Harga_Dasar),HIDE,DECIMAL(14)
                       PROMPT('Sub Total'),AT(285,244),USE(?Prompt10),FONT('Times New Roman',12,COLOR:Black,)
                       ENTRY(@n-15.2),AT(345,262,97,14),USE(discount)
                       PROMPT('Diskon :'),AT(285,263),USE(?Prompt8),FONT('Times New Roman',12,,)
                       BUTTON('&Edit [Ctrl]'),AT(7,283,127,19),USE(?Change:5),FONT(,,COLOR:Black,FONT:bold),KEY(529)
                       BUTTON('&Delete'),AT(148,287,56,14),USE(?Delete:5),HIDE
                       BUTTON('PEMBULATAN'),AT(208,287,61,14),USE(?Button10)
                       ENTRY(@D06),AT(353,3,51,13),USE(APH:Tanggal),RIGHT(1),FONT('Times New Roman',10,,),MSG('Tanggal berobat pasen'),TIP('Tanggal berobat pasen')
                       PROMPT('NOMOR RM :'),AT(4,3,58,14),USE(?APH:Nomor_mr:Prompt),RIGHT,FONT('Times New Roman',10,,FONT:bold)
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
      NOM:No_Urut=1
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
         !NOMU:Urut =1
         !NOMU:Nomor=vl_nomor
         !add(nomoruse)
         !if errorcode()>0 then
         !   vl_nomor=''
         !   rollback
         !   cycle
         !end
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
           !NOMU:Urut =1
           !NOMU:Nomor=vl_nomor
           !add(nomoruse)
           !if errorcode()>0 then
           !   rollback
           !   cycle
           !end
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

Batal_Nomor Routine
   !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
   NOM:No_Urut =1
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=APH:N0_tran
   NOM:Keterangan='Trans R. Inap'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
   !NOMU:Urut =1
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   !NOMU:Nomor=APH:N0_tran
   !access:nomoruse.fetch(NOMU:PrimaryKey)
   !delete(nomoruse)

hapus_nomor_use routine
   NOMU:Urut    =1
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
  GlobalErrors.SetProcedureName('Trig_UpdateRawatInap')
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
  SELF.AddHistoryField(?APH:Harga_Dasar,29)
  SELF.AddHistoryField(?APH:Tanggal,2)
  SELF.AddUpdateFile(Access:APHTRANS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:APDTRANS.Open                                     ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Relate:Ano_pakai.Open                                    ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Relate:ApPaketD.SetOpenRelated()
  Relate:ApPaketD.Open                                     ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Relate:Aphtransadd.Open                                  ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Relate:IAP_SET.Open                                      ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_Batal.Open                                  ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Relate:Tbstawal.Open                                     ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
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
  Access:GStockGdg.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
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
  vl_pembulatan=0
  glo:resepranap1=0
  glo:resepranap2=0
  glo:resepranap3=0
  glo:resepranap4=0
  glo:resepranap5=0
  glo:totalresepranap1=0
  glo:totalresepranap2=0
  glo:totalresepranap3=0
  glo:totalresepranap4=0
  glo:totalresepranap5=0
  glo:ktt=0
  ?Browse:4{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW4.Q &= Queue:Browse:4
  BRW4::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon APD:Kode_brg for sort order 1
  BRW4.AddSortOrder(BRW4::Sort0:StepClass,APD:notran_kode) ! Add the sort order for APD:notran_kode for sort order 1
  BRW4.AddRange(APD:N0_tran,Relate:APDTRANS,Relate:APHTRANS) ! Add file relationship range limit for sort order 1
  BRW4.AddField(APD:Kode_brg,BRW4.Q.APD:Kode_brg)          ! Field APD:Kode_brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Nama_Brg,BRW4.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Ket2,BRW4.Q.GBAR:Ket2)                ! Field GBAR:Ket2 is a hot field or requires assignment from browse
  BRW4.AddField(APD:ktt,BRW4.Q.APD:ktt)                    ! Field APD:ktt is a hot field or requires assignment from browse
  BRW4.AddField(APD:Camp,BRW4.Q.APD:Camp)                  ! Field APD:Camp is a hot field or requires assignment from browse
  BRW4.AddField(APD:Jumlah,BRW4.Q.APD:Jumlah)              ! Field APD:Jumlah is a hot field or requires assignment from browse
  BRW4.AddField(APD:namaobatracik,BRW4.Q.APD:namaobatracik) ! Field APD:namaobatracik is a hot field or requires assignment from browse
  BRW4.AddField(APD:Total,BRW4.Q.APD:Total)                ! Field APD:Total is a hot field or requires assignment from browse
  BRW4.AddField(APD:Diskon,BRW4.Q.APD:Diskon)              ! Field APD:Diskon is a hot field or requires assignment from browse
  BRW4.AddField(APD:N0_tran,BRW4.Q.APD:N0_tran)            ! Field APD:N0_tran is a hot field or requires assignment from browse
  BRW4.AddField(APD:Harga_Dasar,BRW4.Q.APD:Harga_Dasar)    ! Field APD:Harga_Dasar is a hot field or requires assignment from browse
  BRW4.AddField(APD:Jum1,BRW4.Q.APD:Jum1)                  ! Field APD:Jum1 is a hot field or requires assignment from browse
  BRW4.AddField(APD:total_dtg,BRW4.Q.APD:total_dtg)        ! Field APD:total_dtg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Kode_brg,BRW4.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_UpdateRawatInap',QuickWindow)         ! Restore window settings from non-volatile store
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
  glo:resepranap1=0
  glo:resepranap2=0
  glo:resepranap3=0
  glo:resepranap4=0
  glo:resepranap5=0
  glo:totalresepranap1=0
  glo:totalresepranap2=0
  glo:totalresepranap3=0
  glo:totalresepranap4=0
  glo:totalresepranap5=0
  glo:ktt=0
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
    INIMgr.Update('Trig_UpdateRawatInap',QuickWindow)      ! Save window data to non-volatile store
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
  APH:Harga_Dasar = GLO:HARGA_DASAR_INAP
  APH:biaya_dtg = LOC::TOTAL_DTG
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
      Trig_UpdateRawatInapDetil2
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
         status=Glo:Rekap
      !  message(status&' '&Glo:Rekap)
         glo:jumobat=1
         set(BRW4::View:Browse)
         loop
            next(BRW4::View:Browse)
            if errorcode() then break.
            glo:jumobat+=1
         end
      end
    OF ?OK
      if vg_tanggal1>APH:Tanggal
         message('Periode Tanggal Filter Salah, Perbaiki !')
         cycle
      else
         if vg_tanggal2<APH:Tanggal then
            message('Periode Tanggal Filter Salah, Perbaiki !')
            cycle
         end
      end
      ri_hrinap{prop:sql}='select * from dba.ri_hrinap where nomor_mr='&aph:nomor_mr&' order by NoUrut desc'
      ri_hrinap{prop:sql}='select * from dba.ri_hrinap where nomor_mr='&aph:nomor_mr&' order by NoUrut desc'
      if access:ri_hrinap.next()=level:benign then
         if RI_HR:No_Nota<>'' or RI_HR:statusbayar=1 then
            message('Nota sudah tutup, transaksikan tidak dapat diteruskan !!!')
            cycle
         end
      end
      
      if glo:resepranap1 = 1 then
          if glo:totalresepranap1 < 2 then
              message('Mohon masukan bahan obat untuk Racikan Obat ke-1')
              cycle
          end
      end
      
      if glo:resepranap2 = 1 then
          if glo:totalresepranap2 < 2 then
              message('Mohon masukan bahan obat untuk Racikan Obat ke-2')
              cycle
          end
      end
      
      if glo:resepranap3 = 1 then
          if glo:totalresepranap3 < 2 then
              message('Mohon masukan bahan obat untuk Racikan Obat ke-3')
              cycle
          end
      end
      
      if glo:resepranap4 = 1 then
          if glo:totalresepranap4 < 2 then
              message('Mohon masukan bahan obat untuk Racikan Obat ke-4')
              cycle
          end
      end
      
      if glo:resepranap5 = 1 then
          if glo:totalresepranap5 < 2 then
              message('Mohon masukan bahan obat untuk Racikan Obat ke-5')
              cycle
          end
      end
      
      
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
      APH:shift       =vg_shift_apotik
      APH:Asal        =RI_PI:Ruang
      APH:NoNota      =RI_HR:nomortrans
      
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
                  ELSE
                      message('Status Pembayaran Pasien tidak diketahui')
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
      !                  ITbr:KODE_RUANG=RI_PI:Ruang
      !                  GET(ITbrRwt,ITbr:KeyKodeRuang)
      !                  ITbk:KodeKelas=ITbr:KODEKelas
      !                  GET(ITbKelas,ITbk:KeyKodeKelas)
                        glo_kls_rawat = RI_HR:hakkelas
                     else
                        loc_mr = 0
                        SELECT(?APH:Nomor_mr)
                     END
                  end
                  glo_kls_rawat = RI_HR:hakkelas
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
         !IF JPas:Inap= 0
         !   MESSAGE('Nomor RM Tidak Ada Dalam daftar Rawat Inap')
         !   ?BROWSE:4{PROP:DISABLE}=1
         !   ?Insert:5{PROP:DISABLE}=TRUE
         !   CLEAR (JPas:Nama)
         !   CLEAR (JPas:Alamat)
         !   CLEAR (RI_PI:Ruang)
         !   CLEAR (LOC::Status)
         !   CLEAR (JPas:Inap)
         !   DISPLAY
         !   SELECT(?APH:Nomor_mr)
         !ELSE
            ri_hrinap{prop:sql}='select * from dba.ri_hrinap where nomor_mr='&aph:nomor_mr&' order by NoUrut desc'
            access:ri_hrinap.next()
            if errorcode() then
              message('Ruangan Pasien Tidak Ada, Hubungi Ruangan')
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
              vl_nourut=RI_HR:NoUrut
            end
            RI_HR:Nomor_mr=aph:nomor_mr
            RI_HR:NoUrut=vl_nourut
            GET(RI_HRInap,RI_HR:KMrUrtDiscn)
            if errorcode() then
               message('Ruangan Pasien Tidak Ada, Hubungi Ruangan')
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
               ELSE
                      message('Status Pembayaran Pasien tidak diketahui')
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
               END
      
               APH:NIP        =RI_HR:NIP
               APH:Kontrak    =RI_HR:Kontraktor
               APH:LamaBaru   =RI_HR:LamaBaru
               APH:cara_bayar =RI_HR:Pembayaran
               APH:Urut       =RI_HR:NoUrut
               !message(RI_HR:hakkelas)
      
               if RI_HR:statusbayar=1 then
                  message('Pasien Sudah Dibuatkan Nota, Hubungi Keuangan')
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
                  message('Pasien Tidak Ada di Ruangan, Hubungi Ruangan')
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
      !               ITbr:KODE_RUANG=RI_PI:Ruang
      !               GET(ITbrRwt,ITbr:KeyKodeRuang)
      !               ITbk:KodeKelas=ITbr:KODEKelas
      !               GET(ITbKelas,ITbk:KeyKodeKelas)
                     glo_kls_rawat = RI_HR:hakkelas
                  else
                     loc_mr = 0
                     SELECT(?APH:Nomor_mr)
                  END
               end
               glo_kls_rawat = RI_HR:hakkelas
               JKon:KODE_KTR=RI_HR:Kontraktor
               access:jkontrak.fetch(JKon:KeyKodeKtr)
            end
         !end
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
      appaketd{prop:sql}='select * from dba.appaketd where No='&APP2:No
      loop
         if access:appaketd.next()<>level:benign then break.
         !message('ada')
         APD:N0_tran        =APH:N0_tran
         APD:Kode_brg       =APP21:Kode_Barang
         APD:Jumlah         =APP21:Jumlah
         APD:Camp           =APP21:Jenis
         APD:Diskon         =0
         APD:Jum1           =0
         APD:Jum2           =0
      
         GBAR:Kode_brg      =APP21:Kode_Barang
         access:gbarang.fetch(GBAR:KeyKodeBrg)
      
         GSGD:Kode_brg      =APP21:Kode_Barang
         access:gstockgdg.fetch(GSGD:KeyKodeBrg)
      
         GSTO:Kode_Apotik = GL_entryapotik
         GSTO:Kode_Barang = APP21:Kode_Barang
         GET(GStokaptk,GSTO:KeyBarang)
         IF APP21:Jumlah > GSTO:Saldo
            MESSAGE(clip(GBAR:Nama_Brg)&' jumlah stok tinggal '&GSTO:Saldo)
            APD:Jumlah=0
            APD:Total = 0
         else
            if glo:rekap=2 then
                  !Update penambahan tuslah 1500 (3 Desember 2018)
                  !Update perubahan margin pasien umum menjadi 1.25 (31 Desember 2018)
                  !Update penambahan diskon dari gudang saat penjualan (31 Desember 2018)
                  APD:Total=((((GSGD:Harga_Beli-(GSGD:Discount/100*GSGD:Harga_Beli))*1.25)*1.1)*APD:Jumlah)+1500
                  APD:total_dtg=0
               elsif glo:rekap=3 then
                  if sub(APD:Kode_brg,1,1)='B'
                      !Update penambahan tuslah 1500 (3 Desember 2018)
                      !Update penambahan diskon dari gudang saat penjualan (31 Desember 2018)
                      APD:Total=((((GSGD:Harga_Beli-(GSGD:Discount/100*GSGD:Harga_Beli))*1.215)*1.1)*APD:Jumlah)+1500
                      APD:total_dtg=APD:Total
                  else
                      !Update penambahan tuslah 1500 (3 Desember 2018)
                      !Update penambahan diskon dari gudang saat penjualan (31 Desember 2018)
                      !Update perubahan margin pasien kontraktor non bpjs menjadi 1.25 (13 Maret 2019)
                      APD:Total=((((GSGD:Harga_Beli-(GSGD:Discount/100*GSGD:Harga_Beli))*1.25)*1.1)*APD:Jumlah)+1500
                      APD:total_dtg=APD:Total
                  end
               end
            !Update penambahan diskon dari gudang saat penjualan (31 Desember 2018)
            APD:Harga_Dasar = GSGD:Harga_Beli-(GSGD:Discount/100*GSGD:Harga_Beli)
            access:apdtrans.insert()
         end
      END
      brw4.resetsort(1)
      end
    OF ?OK
      ThisWindow.Update
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?discount
      ThisWindow.Reset(1)
    OF ?Button10
      ThisWindow.Update
      if vl_sudah=0
         IF LOC::TOTAL <> 0
            vl_hasil=0
            vl_real  =APH:Biaya
            vl_hasil =round(APH:Biaya,100)
      !      if vl_hasil<vl_real then
      !         vl_hasil=vl_hasil+100
      !      end
      
            APH:Biaya = vl_hasil
            IF discount <>0
               loc::copy_total = APH:Biaya + discount
               masuk_disc = 1
               ?discount{PROP:READONLY}=FALSE
            ELSE
               loc::copy_total = APH:Biaya
            END
            SET( BRW4::View:Browse)
            LOOP
               NEXT(BRW4::View:Browse)
               IF APD:Camp = 0 AND APD:N0_tran = APH:N0_tran
                  APD:Total = APD:Total + loc::copy_total - LOC::TOTAL
                  PUT(APDTRANS)
                  BREAK
               END
               IF ERRORCODE() > 0  OR  APD:N0_tran <> APH:N0_tran
                  SET( BRW4::View:Browse)
                  LOOP
                     NEXT( BRW4::View:Browse )
                     IF sub(APD:Kode_brg,1,7) = '_Campur'
                        APD:Total = APD:Total + loc::copy_total - LOC::TOTAL
                        PUT(APDTRANS)
      !                  SET(APDTcam)
      !                  APD1:N0_tran = APH:N0_tran
      !                  APD1:Camp = APD:Camp
      !                  SET (APD1:by_tranno,APD1:by_tranno)
      !                  LOOP
      !                     NEXT( APDTcam )
      !                     IF APD1:Kode_brg = '_Biaya'
      !                        APD1:Total = APD1:Total  + loc::copy_total - LOC::TOTAL
      !                        PUT(APDTcam)
      !                        BREAK
      !                     END
      !                  END
                        BREAK
                     END
                  END
                  BREAK
               END
            END
            LOC::TOTAL = loc::copy_total
            DISPLAY
            BRW4.RESETSORT(1)
         END
      end
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
      IF LOC::TOTAL = 0 and glo:ktt=0
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
  APH:Harga_Dasar = GLO:HARGA_DASAR_INAP
  APH:biaya_dtg = LOC::TOTAL_DTG


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
GLO:HARGA_DASAR_INAP:Sum REAL                              ! Sum variable for browse totals
LOC::TOTAL_DTG:Sum   REAL                                  ! Sum variable for browse totals
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
    IF (APD:ktt=0)
      LOC::TOTAL:Sum += APD:Total
    END
    IF (APD:ktt=0)
      discount:Sum += APD:Diskon
    END
    GLO:HARGA_DASAR_INAP:Sum += APD:Harga_Dasar * APD:Jumlah
    IF (APD:ktt=0)
      LOC::TOTAL_DTG:Sum += APD:total_dtg
    END
  END
  LOC::TOTAL = LOC::TOTAL:Sum
  discount = discount:Sum
  GLO:HARGA_DASAR_INAP = GLO:HARGA_DASAR_INAP:Sum
  LOC::TOTAL_DTG = LOC::TOTAL_DTG:Sum
  PARENT.ResetFromView
  Relate:APDTRANS.SetQuickScan(0)
  SETCURSOR()


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

Trig_UpdateRawatInapDetil PROCEDURE                        ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
FilesOpened          BYTE                                  !
vl_hna               REAL                                  !
vl_total             REAL                                  !
loc::disk_pcs        REAL                                  !
History::APD:Record  LIKE(APD:RECORD),THREAD
QuickWindow          WINDOW('Update '),AT(,,207,215),FONT('Arial',8,,),IMM,HLP('UpdateAPDTRANS'),ALRT(EscKey),GRAY,MDI
                       PROMPT('No.Trans :'),AT(74,1),USE(?APD:N0_tran:Prompt)
                       ENTRY(@s15),AT(107,1,48,10),USE(APD:N0_tran),DISABLE,MSG('nomor transaksi'),TIP('nomor transaksi')
                       SHEET,AT(4,13,198,162),USE(?CurrentTab)
                         TAB('Data Transaksi'),USE(?Tab:1)
                           STRING('BARU'),AT(62,15),USE(?String2),TRN,FONT('Arial',10,,FONT:bold)
                           PROMPT('Kode Barang:'),AT(8,34),USE(?APD:Kode_brg:Prompt)
                           ENTRY(@s10),AT(65,34,48,10),USE(APD:Kode_brg),DISABLE,COLOR(COLOR:White),MSG('Kode Barang'),TIP('Kode Barang')
                           BUTTON('&H'),AT(117,33,13,13),USE(?Button6),KEY(F2Key)
                           PROMPT('Nama Barang'),AT(8,49),USE(?Prompt4)
                           STRING(@s40),AT(60,49),USE(GBAR:Nama_Brg)
                           PROMPT('Nama Obat Racik:'),AT(7,62),USE(?APD:namaobatracik:Prompt)
                           ENTRY(@s40),AT(65,62,127,10),USE(APD:namaobatracik),DISABLE
                           OPTION('Bahan untuk resep ke -'),AT(7,78,187,21),USE(APD:Camp),BOXED
                             RADIO('1'),AT(22,86),USE(?APD:Camp:Radio1),DISABLE,VALUE('1')
                             RADIO('2'),AT(56,86),USE(?APD:Camp:Radio2),DISABLE,VALUE('2')
                             RADIO('3'),AT(90,86),USE(?APD:Camp:Radio3),DISABLE,VALUE('3')
                             RADIO('4'),AT(124,86),USE(?APD:Camp:Radio4),DISABLE,VALUE('4')
                             RADIO('5'),AT(158,86),USE(?APD:Camp:Radio5),DISABLE,VALUE('5')
                           END
                           PROMPT('Jumlah:'),AT(8,108),USE(?APD:Jumlah:Prompt)
                           ENTRY(@n15.2),AT(65,107,48,10),USE(APD:Jumlah),RIGHT(2),MSG('Jumlah'),TIP('Jumlah')
                           PROMPT('Harga :'),AT(8,123),USE(?APD:Total:Prompt)
                           ENTRY(@n-15.2),AT(65,123,48,10),USE(APD:Total),RIGHT(2),MSG('Harga Dasar'),TIP('Harga Dasar'),READONLY
                           STRING(''),AT(109,38),USE(?String3)
                           ENTRY(@n5.2),AT(33,199,22,10),USE(loc::disk_pcs),DISABLE,HIDE,RIGHT(2)
                           PROMPT('%'),AT(57,199),USE(?APD:Jumlah:Prompt:2),DISABLE,HIDE
                           ENTRY(@n-15.2),AT(65,199,48,10),USE(APD:Diskon),DISABLE,HIDE,RIGHT(2),READONLY
                           PROMPT('Diskon:'),AT(8,199),USE(?APD:Diskon:Prompt),DISABLE,HIDE
                           PROMPT('Total:'),AT(8,138),USE(?vl_total:Prompt)
                           ENTRY(@n-15.2),AT(65,138,48,10),USE(vl_total),RIGHT(2)
                           PROMPT('Harga Dasar:'),AT(8,153),USE(?APD:Harga_Dasar:Prompt)
                           ENTRY(@n11.2),AT(65,153,48,10),USE(APD:Harga_Dasar),DISABLE,DECIMAL(14),MSG('Harga Dasar'),TIP('Harga Dasar')
                           BUTTON('Obat &Campur (F4)'),AT(119,133,70,22),USE(?Button5),HIDE,LEFT,FONT(,,,FONT:bold),KEY(F4Key)
                         END
                       END
                       BUTTON('&OK [End]'),AT(36,179,61,24),USE(?OK),LEFT,KEY(EndKey),ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(111,179,61,24),USE(?Cancel),LEFT,KEY(EscKey),ICON(ICON:Cross)
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
  GlobalErrors.SetProcedureName('Trig_UpdateRawatInapDetil')
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
  SELF.AddHistoryField(?APD:namaobatracik,10)
  SELF.AddHistoryField(?APD:Camp,5)
  SELF.AddHistoryField(?APD:Jumlah,3)
  SELF.AddHistoryField(?APD:Total,4)
  SELF.AddHistoryField(?APD:Diskon,7)
  SELF.AddHistoryField(?APD:Harga_Dasar,6)
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
  INIMgr.Fetch('Trig_UpdateRawatInapDetil',QuickWindow)    ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  !apd:total=0
  message(format(apd:total,@n15.2))
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_UpdateRawatInapDetil',QuickWindow) ! Save window data to non-volatile store
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
      !    if sub(APD:Kode_brg,1,7)='_Campur' then
      !        ?APD:namaobatracik{PROP:DISABLE}=0
      !        ?APD:total{PROP:DISABLE}=0
      !    end
      !    APD:N0_tran = APD:N0_tran
      !    SET (APD:by_transaksi,APD:by_transaksi)
      !    LOOP
      !       NEXT( APDTrans )
      !       IF APD:Kode_brg = '_Campur1'
      !        ?APD:Camp:Radio2{PROP:DISABLE}=0
      !        BREAK
      !       END
      !       IF APD:Kode_brg = '_Campur2'
      !        ?APD:Camp:Radio3{PROP:DISABLE}=0
      !        BREAK
      !       END
      !       IF APD:Kode_brg = '_Campur3'
      !        ?APD:Camp:Radio4{PROP:DISABLE}=0
      !        BREAK
      !       END
      !       IF APD:Kode_brg = '_Campur4'
      !        ?APD:Camp:Radio5{PROP:DISABLE}=0
      !        BREAK
      !       END
      !       IF APD:Kode_brg = '_Campur5'
      !        ?APD:Camp:Radio6{PROP:DISABLE}=0
      !        BREAK
      !       END
      !    END
      !    ?APD:Jumlah{PROP:DISABLE}=0
      !    SELECT(?APD:Jumlah)
      END
    OF ?Button5
      glo::campur = glo::campur+1
      start(Trig_BrowseCampur,25000,APD:N0_tran)
    OF ?OK
      !message(APD:Camp)
      !message('APD:no tran '&APD:N0_tran)
      !message('APD:kode barang '&APD:Kode_brg)
      !message('APD:jumlah '&APD:Jumlah)
      !message('APD:total '&APD:Total)
      !message('APD:camp'&APD:Camp)
      !message('APD:harga dasar'&APD:Harga_Dasar)
      !message('APD:diskon'&APD:Diskon)
      !message('APD:jum1'&APD:Jum1)
      !message('APD:jum2'&APD:Jum2)
      !message('APD:namaobatracik'&APD:namaobatracik)
      if apd:camp<>0 and sub(APD:Kode_brg,1,7)<>'_Campur' then
          APD:Total=0
          display
      end
      !if APD:Total=0 and apd:camp=0 then
      !   message('harga nol !!! tidak bisa ditransaksikan !!!')
      !   cycle
      !end
      if APD:Total=0 and sub(APD:Kode_brg,1,7)='_Campur' then
         message('Harga resep tidak boleh 0, mohon cek kembali')
         cycle
      end
      IF APD:Kode_brg = '_Campur1'
          glo:resepranap1=1
      elsIF APD:Kode_brg = '_Campur2'
          glo:resepranap2=1
      elsIF APD:Kode_brg = '_Campur3'
          glo:resepranap3=1
      elsIF APD:Kode_brg = '_Campur4'
          glo:resepranap4=1
      elsIF APD:Kode_brg = '_Campur5'
          glo:resepranap5=1
      END
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
      !APD:Jum1         =0
      APD:Jum2         =0
      loc::disk_pcs    =0
      vl_total         =0
      display
      
      globalrequest=selectrecord
      cari_brg_lokal4
      APD:Kode_brg=GBAR:Kode_brg
      display
      !message(GL_entryapotik&' '&GBAR:Kode_brg)
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
          if sub(APD:Kode_brg,1,7)='_Campur' then
              ?APD:namaobatracik{PROP:DISABLE}=0
              IF APD:Kode_brg = '_Campur1'
                  APD:Camp=1
              elsIF APD:Kode_brg = '_Campur2'
                  APD:Camp=2
              elsIF APD:Kode_brg = '_Campur3'
                  APD:Camp=3
              elsIF APD:Kode_brg = '_Campur4'
                  APD:Camp=4
              elsIF APD:Kode_brg = '_Campur5'
                  APD:Camp=5
              END
              APD:Jumlah=1
              ?APD:jumlah{PROP:disable}=1
              ?APD:total{PROP:READONLY}=0
              ?OK{PROP:DISABLE}=0
              SELECT(?APD:namaobatracik)
          else
              ?APD:Jumlah{PROP:DISABLE}=0
              SELECT(?APD:Jumlah)
          end
          IF glo:resepranap1=1
              ?APD:Camp:Radio1{PROP:DISABLE}=0
          END
          IF glo:resepranap2=1
              ?APD:Camp:Radio2{PROP:DISABLE}=0
          END
          IF glo:resepranap3=1
              ?APD:Camp:Radio3{PROP:DISABLE}=0
          END
          IF glo:resepranap4=1
              ?APD:Camp:Radio4{PROP:DISABLE}=0
          END
          IF glo:resepranap5=1
              ?APD:Camp:Radio5{PROP:DISABLE}=0
          END
      END
      display
      !message(GBAR:Kelompok)
    OF ?APD:Camp:Radio1
      if sub(APD:Kode_brg,1,7)<>'_Campur' then
          APD:total=0
          display
      end
    OF ?APD:Camp:Radio2
      if sub(APD:Kode_brg,1,7)<>'_Campur' then
          APD:total=0
          display
      end
    OF ?APD:Camp:Radio3
      if sub(APD:Kode_brg,1,7)<>'_Campur' then
          APD:total=0
          display
      end
    OF ?APD:Camp:Radio4
      if sub(APD:Kode_brg,1,7)<>'_Campur' then
          APD:total=0
          display
      end
    OF ?APD:Camp:Radio5
      if sub(APD:Kode_brg,1,7)<>'_Campur' then
          APD:total=0
          display
      end
    OF ?APD:Jumlah
      !IF tombol_ok = 0
         if APD:Kode_brg='' then
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
            !APD:Jum1         =0
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
            !APD:Jum1         =0
            APD:Jum2         =0
            loc::disk_pcs    =0
            vl_total         =0
            display
         else
            IF APD:Jumlah = 0
               ?OK{PROP:DISABLE}=1
            ELSE
               GBAR:Kode_brg     =APD:Kode_brg
               access:gbarang.fetch(GBAR:KeyKodeBrg)
      
             if sub(APD:Kode_brg,1,7)='_Campur' then
               ?APD:total{PROP:READONLY}=0
               ?OK{PROP:DISABLE}=0
             else
               GSGD:Kode_brg      =APD:Kode_brg
               access:gstockgdg.fetch(GSGD:KeyKodeBrg)
      
               GSTO:Kode_Apotik = GL_entryapotik
               GSTO:Kode_Barang = APD:Kode_brg
               GET(GStokaptk,GSTO:KeyBarang)
               IF APD:Jumlah > GSTO:Saldo
                  MESSAGE('JUMLAH di stok tinggal :'& GSTO:Saldo)
                  SELECT(?APD:Jumlah)
                  CYCLE
               END
               ?OK{PROP:DISABLE}=0
               if GBAR:Kelompok=28 then
                  if GBAR:StatusGen=1 or GBAR:StatusGen=3 then
                     if GSGD:Harga_Beli > 0 AND GSGD:Harga_Beli < 501  then
                        APD:Total = GSGD:Harga_Beli * APD:Jumlah * 3.5
                     elsif GSGD:Harga_Beli > 500 AND GSGD:Harga_Beli < 1001  then
                        APD:Total = GSGD:Harga_Beli * APD:Jumlah * 2
                     elsif GSGD:Harga_Beli > 1000  then
                        APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.5
                     end
                  else
                     APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.35
                  end
               else
               CASE  status
               OF 1
                  if GBAR:StatusGen=1 or GBAR:StatusGen=3 then
                     if GSGD:Harga_Beli > 0 AND GSGD:Harga_Beli < 501  then
                        APD:Total = GSGD:Harga_Beli * APD:Jumlah * 3.5
                     elsif GSGD:Harga_Beli > 500 AND GSGD:Harga_Beli < 1001  then
                        APD:Total = GSGD:Harga_Beli * APD:Jumlah * 2
                     elsif GSGD:Harga_Beli > 1000  then
                        APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.5
                     end
                  else
                     APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.35
                  end
               of 3
                  JKon:KODE_KTR=APH:Kontrak
                  access:jkontrak.fetch(JKon:KeyKodeKtr)
                  JKOM:Kode=JKon:GROUP
                  if GBAR:StatusGen=1 or GBAR:StatusGen=3 then
                     if GSGD:Harga_Beli > 0 AND GSGD:Harga_Beli < 501  then
                        APD:Total = GSGD:Harga_Beli * APD:Jumlah * 3.5
                     elsif GSGD:Harga_Beli > 500 AND GSGD:Harga_Beli < 1001  then
                        APD:Total = GSGD:Harga_Beli * APD:Jumlah * 2
                     elsif GSGD:Harga_Beli > 1000  then
                        APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.5
                     end
                  else
                     APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.35
                  end
               else
                  if GBAR:StatusGen=1 or GBAR:StatusGen=3 then
                     if GSGD:Harga_Beli > 0 AND GSGD:Harga_Beli < 501  then
                        APD:Total = GSGD:Harga_Beli * APD:Jumlah * 3.5
                     elsif GSGD:Harga_Beli > 500 AND GSGD:Harga_Beli < 1001  then
                        APD:Total = GSGD:Harga_Beli * APD:Jumlah * 2
                     elsif GSGD:Harga_Beli > 1000  then
                        APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.5
                     end
                  else
                     APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.35
                  end
               end
               end
               if apd:camp<>0 then
                  APD:Total=0
               end
               APD:Harga_Dasar = GSGD:Harga_Beli
             end
               DISPLAY
            END
            loc::disk_pcs=(APD:Diskon*100)/APD:Total
            vl_total     =APD:Total-APD:Diskon
            display
         end
         END
    OF ?APD:Total
      if sub(APD:Kode_brg,1,7)='_Campur' then
          vl_total=APD:Jumlah*APD:Total
          ?vl_total{PROP:readonly}=1
          display
      end
    OF ?loc::disk_pcs
      if loc::disk_pcs<>0 then
      !   if loc::disk_pcs>10 then
      !      APD:Diskon=0
      !      loc::disk_pcs=0
      !      display
      !   else
            APD:Diskon=APD:Total*(loc::disk_pcs/100)
            display
      !   end
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
      APD:Jum1=glo:jumobat
      APD:Camp=0
      if self.request=2 then
         if APD:Diskon<>0 then
            loc::disk_pcs=APD:Diskon*100/APD:Total
         else
            loc::disk_pcs=0
         end
         vl_total     =APD:Total-APD:Diskon
      end
      !message(status)
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

Trig_BrowseRawatJalan PROCEDURE                            ! Generated from procedure template - Window

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
QuickWindow          WINDOW('Transaksi Instalasi Farmasi- Rawat Jalan'),AT(,,531,289),FONT('Arial',8,,),CENTER,IMM,HLP('Tran_Poliklinik'),SYSTEM,GRAY,MDI
                       ELLIPSE,AT(284,2,23,17),USE(?Ellipse1),COLOR(COLOR:Red),FILL(COLOR:Red)
                       ELLIPSE,AT(367,2,23,17),USE(?Ellipse1:2),COLOR(COLOR:Green),FILL(COLOR:Green)
                       STRING('= Retur Obat'),AT(312,6),USE(?String1)
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
                       STRING('= Keluar Obat'),AT(393,6),USE(?String1:2)
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
  GlobalErrors.SetProcedureName('Trig_BrowseRawatJalan')
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
  BRW1.SetFilter('(aph:tanggal>=VG_TANGGAL1 and aph:tanggal<<=VG_TANGGAL2 and (sub(APH:N0_tran,1,3)=''APJ'' or sub(APH:N0_tran,1,3)=''APB'') and APH:Kode_Apotik=GL_entryapotik)') ! Apply filter expression to browse
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
  INIMgr.Fetch('Trig_BrowseRawatJalan',QuickWindow)        ! Restore window settings from non-volatile store
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
    INIMgr.Update('Trig_BrowseRawatJalan',QuickWindow)     ! Save window data to non-volatile store
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
      Trig_UpdateRawatJalan1
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

