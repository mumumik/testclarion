

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N220.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N006.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N010.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N123.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N207.INC'),ONCE        !Req'd for module callout resolution
                     END


Trig_UpdateRawatInapNonBilling PROCEDURE                   ! Generated from procedure template - Window

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
QuickWindow          WINDOW('Transaksi Instalasi Farmasi -Rawat Inap (Tidak Masuk Billing)'),AT(,,531,306),FONT('Arial',8,,),CENTER,IMM,HLP('UpdateAPHTRANS'),ALRT(EscKey),TIMER(100),GRAY,MDI
                       ENTRY(@N010_),AT(65,3,81,13),USE(APH:Nomor_mr),DISABLE,FONT('Times New Roman',16,,FONT:bold),MSG('Nomor Medical record pasien'),TIP('Nomor KIUP')
                       BUTTON('F2'),AT(150,3,20,13),USE(?Button8),KEY(F2Key)
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
      NOM:No_Urut=63
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
        NOM1:No_urut=63
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
   NOM:Keterangan='Aptk Non Billing'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
   !NOMU:Urut =1
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   !NOMU:Nomor=APH:N0_tran
   !access:nomoruse.fetch(NOMU:PrimaryKey)
   !delete(nomoruse)

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
  GlobalErrors.SetProcedureName('Trig_UpdateRawatInapNonBilling')
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
  INIMgr.Fetch('Trig_UpdateRawatInapNonBilling',QuickWindow) ! Restore window settings from non-volatile store
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
    INIMgr.Update('Trig_UpdateRawatInapNonBilling',QuickWindow) ! Save window data to non-volatile store
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
                  APD:Total=(((GSGD:Harga_Beli*1.215)*1.1)*APD:Jumlah)+1500
                  APD:total_dtg=0
               elsif glo:rekap=3 then
                  if sub(APD:Kode_brg,1,1)='B'
                      !Update penambahan tuslah 1500 (3 Desember 2018)
                      APD:Total=(((GSGD:Harga_Beli*1.215)*1.1)*APD:Jumlah)+1500
                      APD:total_dtg=APD:Total
                  else
                      !Update penambahan tuslah 1500 (3 Desember 2018)
                      APD:Total=(((GSGD:Harga_Beli*1.315)*1.1)*APD:Jumlah)+1500
                      APD:total_dtg=APD:Total
                  end
               end
            APD:Harga_Dasar = GSGD:Harga_Beli
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

