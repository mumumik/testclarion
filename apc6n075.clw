

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N075.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N005.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N006.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N007.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N008.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N044.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N060.INC'),ONCE        !Req'd for module callout resolution
                     END


Tabel_apstokop PROCEDURE                                   ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
loc::ok              BYTE                                  !
Window               WINDOW('Tentukan Taggal Kerja dan Kode Apotik'),AT(,,272,64),FONT('MS Sans Serif',10,COLOR:Black,FONT:regular),GRAY
                       BUTTON('OK'),AT(228,8,35,14),USE(?OkButton),DEFAULT
                       PROMPT('Tanggal Stok Opname :'),AT(12,12),USE(?GLO:TanggalAwal:Prompt)
                       ENTRY(@d06),AT(97,12,60,10),USE(GLO:TanggalAwal),RIGHT(1)
                       PROMPT('Kode Apotik:'),AT(12,36),USE(?Glo::kode_apotik:Prompt)
                       ENTRY(@s5),AT(97,35,60,10),USE(Glo::kode_apotik),MSG('Kode apotik'),TIP('Kode apotik')
                       BUTTON('F2'),AT(166,35,12,12),USE(?CallLookup),KEY(F2Key)
                       BUTTON('Cancel'),AT(228,31,36,14),USE(?CancelButton)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass

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
  GlobalErrors.SetProcedureName('Tabel_apstokop')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OkButton
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  GLO:TanggalAwal = TODAY()
  Glo::kode_apotik = GL_entryapotik
  Relate:GApotik.SetOpenRelated()
  Relate:GApotik.Open                                      ! File GApotik used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Tabel_apstokop',Window)                    ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:GApotik.Close
  END
  IF SELF.Opened
    INIMgr.Update('Tabel_apstokop',Window)                 ! Save window data to non-volatile store
  END
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
    Cari_apotik
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
    OF ?OkButton
      Glo:lap = 1
       POST(Event:CloseWindow)
    OF ?CancelButton
      GLO:TanggalAwal = TODAY()
      Glo::kode_apotik = ''
       POST(Event:CloseWindow)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Glo::kode_apotik
      IF Glo::kode_apotik OR ?Glo::kode_apotik{Prop:Req}
        GAPO:Kode_Apotik = Glo::kode_apotik
        IF Access:GApotik.TryFetch(GAPO:KeyNoApotik)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            Glo::kode_apotik = GAPO:Kode_Apotik
          ELSE
            SELECT(?Glo::kode_apotik)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      GAPO:Kode_Apotik = Glo::kode_apotik
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        Glo::kode_apotik = GAPO:Kode_Apotik
      END
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
    OF EVENT:OpenWindow
      Iset:deskripsi = 'PPN'
      Get(IsetupAp,Iset:by_deskripsi)
      GL_PPN = Iset:Nilai
      Glo:lap = 0
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

Trig_UpdateRawatJalan PROCEDURE                            ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
vl_round             REAL                                  !
vl_no_urut           LONG                                  !
vl_sudah             BYTE                                  !
vl_nomor             STRING(15)                            !
masuk_disc           BYTE                                  !
sudah_nomor          BYTE                                  !
Loc::delete          BYTE                                  !
Tahun_ini            LONG                                  !
loc::copy_total      LONG                                  !Total Biaya Pembelian
loc::camp            BYTE                                  !
Loc::SavPoint        LONG                                  !
putar                ULONG                                 !
CEK_RUN              BYTE                                  !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
discount             LONG                                  !
pers_disc            LONG                                  !
LOC::TOTAL           LONG                                  !
Hitung_campur        BYTE                                  !
loc::nama            STRING(20)                            !
loc::alamat          STRING(35)                            !
loc::RT              BYTE                                  !
loc::rw              BYTE                                  !
loc::kota            STRING(20)                            !
vl_real              REAL                                  !
vl_hasil             REAL                                  !
vl_seribu            REAL                                  !
vl_selisih           REAL                                  !
BRW4::View:Browse    VIEW(APDTRANS)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Total)
                       PROJECT(APD:Diskon)
                       PROJECT(APD:Camp)
                       PROJECT(APD:N0_tran)
                       JOIN(GBAR:KeyKodeBrg,APD:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse:4       QUEUE                            !Queue declaration for browse/combo box using ?Browse:4
APD:Kode_brg           LIKE(APD:Kode_brg)             !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
APD:Jumlah             LIKE(APD:Jumlah)               !List box control field - type derived from field
APD:Total              LIKE(APD:Total)                !List box control field - type derived from field
APD:Diskon             LIKE(APD:Diskon)               !List box control field - type derived from field
APD:Camp               LIKE(APD:Camp)                 !List box control field - type derived from field
APD:N0_tran            LIKE(APD:N0_tran)              !List box control field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::APH:Record  LIKE(APH:RECORD),THREAD
QuickWindow          WINDOW('Transaksi Instalasi Farmasi - Rawat Jalan'),AT(,,456,256),FONT('Times New Roman',8,,),CENTER,IMM,HLP('UpdateAPHTRANS'),ALRT(EscKey),TIMER(100),GRAY,RESIZE,MDI
                       BUTTON('&Tambah Obat (+)'),AT(5,193,139,19),USE(?Insert:5),FONT('Times New Roman',10,,FONT:bold),KEY(PlusKey)
                       SHEET,AT(2,5,452,112),USE(?CurrentTab)
                         TAB('Poliklinik (F5)'),USE(?Tab:1),KEY(F5Key),FONT('Times New Roman',10,COLOR:Black,)
                           ENTRY(@N10),AT(142,23,81,16),USE(APH:Nomor_mr),IMM,FONT('Times New Roman',16,,FONT:bold),MSG('Nomor Medical record pasien'),TIP('Nomor KIUP')
                           PROMPT('RM :'),AT(120,25),USE(?APH:Nomor_mr:Prompt),FONT('Times New Roman',10,,FONT:bold)
                           OPTION('Status Pembayaran'),AT(6,19,99,49),USE(status),BOXED,FONT('Times New Roman',12,COLOR:Navy,)
                             RADIO('&Gratis / Pegawai'),AT(12,30),USE(?Option1:Radio1),FONT('Times New Roman',10,COLOR:Green,FONT:bold),VALUE('1')
                             RADIO('&Tunai'),AT(12,42),USE(?Option1:Radio3),FONT('Times New Roman',10,,),VALUE('2')
                             RADIO('&KONTRAKTOR'),AT(12,52,91,13),USE(?Option1:Radio2),FONT('Times New Roman',12,COLOR:Red,FONT:bold),VALUE('3')
                           END
                           ENTRY(@s10),AT(287,23,62,16),USE(APH:Asal),FONT('Times New Roman',14,,),MSG('Kode Poliklinik'),TIP('Kode Poliklinik')
                           BUTTON('&P (F3)'),AT(350,22,26,16),USE(?CallLookup),KEY(F3Key)
                           PROMPT('Nama  :'),AT(112,43),USE(?Prompt5)
                           ENTRY(@s35),AT(142,43,93,10),USE(JPas:Nama),DISABLE,FONT(,,,FONT:bold),HLP('Nama mendahului gelar'),MSG('Nama pasien'),REQ,CAP
                           ENTRY(@s35),AT(239,42,97,10),USE(loc::nama,,?loc::nama:2)
                           PROMPT('Alamat :'),AT(109,57),USE(?Prompt6)
                           ENTRY(@s35),AT(142,57,93,10),USE(JPas:Alamat),DISABLE,HLP('contoh : Kopo Jl'),MSG('Alamat Pasien'),CAP
                           ENTRY(@s35),AT(239,57,97,10),USE(loc::alamat,,?loc::alamat:2)
                           PROMPT('Kota :'),AT(341,57),USE(?APH:NoNota:Prompt:2)
                           PROMPT('NIP:'),AT(8,72),USE(?APH:NIP:Prompt)
                           ENTRY(@s7),AT(24,72,45,10),USE(APH:NIP),DISABLE
                           BUTTON('F4'),AT(73,72,19,10),USE(?Button10),DISABLE
                           ENTRY(@s40),AT(24,85,112,10),USE(PEGA:Nama),DISABLE
                           PROMPT('Kontraktor:'),AT(141,72),USE(?APH:Kontraktor:Prompt)
                           ENTRY(@s10),AT(185,72,55,10),USE(APH:Kontrak),DISABLE
                           BUTTON('F5'),AT(243,72,19,10),USE(?Button11),DISABLE
                           ENTRY(@s100),AT(264,72,132,10),USE(JKon:NAMA_KTR),DISABLE
                           PROMPT('Nota:'),AT(341,42),USE(?APH:NoNota:Prompt)
                           ENTRY(@s10),AT(367,42,69,10),USE(APH:NoNota),REQ
                           BUTTON('F8'),AT(438,42,13,10),USE(?calllookup:3),KEY(F8Key)
                           ENTRY(@s20),AT(367,57,69,10),USE(loc::kota,,?loc::kota:2)
                           PROMPT('Dokter:'),AT(141,85),USE(?APH:dokter:Prompt)
                           ENTRY(@s5),AT(185,85,55,10),USE(APH:dokter),DISABLE
                           BUTTON('F7'),AT(243,85,19,10),USE(?CallLookup:2),KEY(F7Key)
                           ENTRY(@s30),AT(264,85,132,10),USE(JDok:Nama_Dokter),DISABLE,MSG('Nama Dokter'),TIP('Nama Dokter'),UPR
                           PROMPT('Pembeli Lgs:'),AT(15,102),USE(?JTra:NamaJawab:Prompt)
                           ENTRY(@s40),AT(65,102,87,10),USE(JTra:NamaJawab)
                           PROMPT('Alamat :'),AT(159,102),USE(?JTra:AlamatJawab:Prompt)
                           ENTRY(@s50),AT(194,102,110,10),USE(JTra:AlamatJawab)
                           STRING(@s25),AT(377,26,66,10),USE(JPol:NAMA_POLI)
                           PROMPT('Asal:'),AT(256,23),USE(?APH:Asal:Prompt),FONT('Times New Roman',16,,)
                           BUTTON('F2'),AT(225,22,26,16),USE(?Button12),HIDE,KEY(F2Key)
                         END
                       END
                       PROMPT('Kode Apotik:'),AT(187,3,46,10),USE(?APH:Kode_Apotik:Prompt)
                       ENTRY(@s5),AT(237,3,39,10),USE(APH:Kode_Apotik),DISABLE,MSG('Kode Apotik'),TIP('Kode Apotik')
                       PROMPT('&TANGGAL:'),AT(284,3,37,10),USE(?APH:Tanggal:Prompt)
                       PROMPT('N0 tran:'),AT(7,217),USE(?APH:N0_tran:Prompt),FONT('Times New Roman',12,COLOR:Black,FONT:bold+FONT:italic+FONT:underline)
                       ENTRY(@s15),AT(46,217,95,13),USE(APH:N0_tran),DISABLE,FONT('Arial',12,COLOR:Black,FONT:bold),MSG('nomor transaksi'),TIP('nomor transaksi')
                       LINE,AT(279,233,163,0),USE(?Line1),COLOR(COLOR:Black),LINEWIDTH(2)
                       LIST,AT(7,120,440,69),USE(?Browse:4),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('47L(2)|FM~Kode Barang~L(0)@s10@163L(2)|M~Nama Obat~C(0)@s40@52R(2)|M~Jumlah~C(0)' &|
   '@n-12.2@53R(2)|M~Total~C(0)@n-13.2@60R(2)|M~Diskon~C(0)@n-15.2@27L|M~Camp~C@n2@6' &|
   '3L(2)|FM~N 0 tran~L(0)@s15@'),FROM(Queue:Browse:4)
                       PROMPT('Total :'),AT(285,240),USE(?APH:Biaya:Prompt),FONT('Times New Roman',14,COLOR:Black,FONT:bold+FONT:italic)
                       ENTRY(@n-15.2),AT(345,239,97,14),USE(APH:Biaya),DISABLE,RIGHT(1),MSG('Total Biaya Pembelian'),TIP('Total Biaya Pembelian')
                       PANEL,AT(5,214,139,19),USE(?Panel2)
                       BUTTON('&OK (End)'),AT(205,193,45,35),USE(?OK),FONT('Times New Roman',10,,),KEY(EndKey),ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(153,193,45,35),USE(?Cancel),FONT('Times New Roman',12,COLOR:Black,),ICON(ICON:Cross)
                       BUTTON('Pembulatan [-]'),AT(148,237,102,18),USE(?Button9),FONT('Times New Roman',10,COLOR:Black,FONT:regular),KEY(MinusKey)
                       PROMPT('Sub Total'),AT(285,194),USE(?Prompt10),FONT('Times New Roman',12,COLOR:Black,)
                       ENTRY(@n-15.2),AT(345,212,97,14),USE(discount),DISABLE
                       PROMPT('Diskon :'),AT(285,212),USE(?Prompt8),FONT('Times New Roman',12,,)
                       BUTTON('&Edit [Ctrl]'),AT(5,237,139,18),USE(?Change:5),FONT(,,COLOR:Blue,FONT:bold),KEY(529)
                       BUTTON('&Delete'),AT(403,0,45,14),USE(?Delete:5),HIDE
                       ENTRY(@n-15.2),AT(345,194,97,14),USE(LOC::TOTAL),DISABLE
                       ENTRY(@D8),AT(326,3,70,10),USE(APH:Tanggal),DISABLE,RIGHT(1),FONT('Times New Roman',12,,),MSG('Tanggal berobat pasen'),TIP('Tanggal berobat pasen')
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
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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

view::jtrans view(filesql2)
                project(FIL1:Byte1,FIL1:Byte2,FIL1:String1,FIL1:String2,FIL1:String3,FIL1:String4,FIL1:String5)
             end
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
BATAL_D_UTAMA ROUTINE
    SET( BRW4::View:Browse)
    LOOP
        NEXT(BRW4::View:Browse)
        IF ERRORCODE() THEN BREAK.
        DELETE(BRW4::View:Browse)
    END

BATAL_D_DUA ROUTINE
    SET(APDTcam)
    APD1:N0_tran=glo::no_nota
    SET(APD1:by_tranno,APD1:by_tranno)
    LOOP
        IF Access:APDTcam.Next()<>Level:Benign OR APD1:N0_tran <> glo::no_nota THEN BREAK.
        DELETE( APDTcam)
    END

BATAL_Transaksi ROUTINE
    SET(APDTcam)
    APD1:N0_tran=glo::no_nota
    APD1:Camp=APD:Camp
    SET(APD1:by_tran_cam,APD1:by_tran_cam)
    LOOP
        IF Access:APDTcam.Next()<>Level:Benign OR APD1:Camp<>APD:Camp THEN BREAK.
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
      !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
      NOM:No_Urut=3
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
         NOMU:Urut =3
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
        !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
        NOM1:No_urut=3
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
           NOMU:Urut =3
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
      !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
      nomor_batal{prop:sql}='delete dba.nomor_batal where No=3'
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 3=Transaksi Apotik ke pasien Rawat Jalan
         NOM1:No_urut=3
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
   !Silahkan diganti ---> 3=Transaksi Apotik ke pasien Rawat Jalan
   NOM:No_Urut =3
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=APH:N0_tran
   NOM:Keterangan='Aptk R. Jalan'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 3=Transaksi Apotik ke pasien Rawat Jalan
   NOMU:Urut =3
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOMU:Nomor=APH:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   delete(nomoruse)

Hapus_Nomor_Use Routine
   NOMU:Urut =3
   NOMU:Nomor=APH:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   if errorcode()=0 then
      delete(nomoruse)
   end

!Proses Penomoran Otomatis Transaksi
Isi_Nomor1 Routine
   vl_nomor=''
   display
   loop
      logout(1,nomor_batal)
      if errorcode()=56 then
         cycle.
      !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
      NOM:No_Urut=vl_no_urut
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
         NOMU:Urut =vl_no_urut
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
        !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
        NOM1:No_urut=vl_no_urut
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
           NOMU:Urut =vl_no_urut
           NOMU:Nomor=vl_nomor
           add(nomoruse)
           if errorcode()>0 then
              rollback
              cycle
           end
           NOM1:No_Trans=sub(vl_nomor,1,8)&format(deformat(sub(vl_nomor,9,4),@n4)+1,@p####p)
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
   if format(sub(vl_nomor,7,2),@n2)<>month(today()) then
      !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
      nomor_batal{prop:sql}='delete dba.nomor_batal where No='&vl_no_urut
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 3=Transaksi Apotik ke pasien Rawat Jalan
         NOM1:No_urut=vl_no_urut
         access:nomor_skr.fetch(NOM1:PrimaryKey)
         if not(errorcode()) then
            vl_nomor =NOM1:No_Trans
            NOM1:No_Trans=sub(vl_nomor,1,4)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'0002'
            access:nomor_skr.update()
            if errorcode()<>0 then
               rollback
               cycle
            else
               vl_nomor=sub(vl_nomor,1,4)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'0001'
               commit
            end
         end
         break
      end
   end
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   APH:N0_tran=vl_nomor
   display

Batal_Nomor1 Routine
   !Silahkan diganti ---> 3=Transaksi Apotik ke pasien Rawat Jalan
   NOM:No_Urut =vl_no_urut
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=APH:N0_tran
   NOM:Keterangan='Aptk R. Jalan'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 3=Transaksi Apotik ke pasien Rawat Jalan
   NOMU:Urut =vl_no_urut
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOMU:Nomor=APH:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   delete(nomoruse)

Hapus_Nomor_Use1 Routine
   NOMU:Urut =vl_no_urut
   NOMU:Nomor=APH:N0_tran
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
    ActionMessage = 'Changing a APHTRANS Record'
  END
  status=2
  CLEAR(JPas:Nama)
  CLEAR(JPas:Alamat)
  CLEAR(JPol:Nama_poli)
  CLEAR(loc::nama)
  CLEAR(loc::alamat)
  CLEAR(loc::RT)
  CLEAR(loc::rw)
  CLEAR(loc::kota)
  CEK_RUN=0
  ?OK{PROP:DISABLE}=TRUE
  discount=0
  pers_disc=0
  ?BROWSE:4{PROP:DISABLE}=TRUE
  ?Insert:5{PROP:DISABLE}=TRUE
  Hitung_campur = 0
  sudah_nomor = 0
  masuk_disc = 0
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_UpdateRawatJalan')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Insert:5
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  APH:Nomor_mr = 99999999
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APH:Record,History::APH:Record)
  SELF.AddHistoryField(?APH:Nomor_mr,1)
  SELF.AddHistoryField(?APH:Asal,8)
  SELF.AddHistoryField(?APH:NIP,13)
  SELF.AddHistoryField(?APH:Kontrak,14)
  SELF.AddHistoryField(?APH:NoNota,17)
  SELF.AddHistoryField(?APH:dokter,16)
  SELF.AddHistoryField(?APH:Kode_Apotik,10)
  SELF.AddHistoryField(?APH:N0_tran,4)
  SELF.AddHistoryField(?APH:Biaya,3)
  SELF.AddHistoryField(?APH:Tanggal,2)
  SELF.AddUpdateFile(Access:APHTRANS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  case deformat(sub(clip(GL_entryapotik),3,2),@n2)
     of '01'
        vl_no_urut=22
     of '02'
        vl_no_urut=23
     of '04'
        vl_no_urut=24
     of '06'
        vl_no_urut=25
     of '07'
        vl_no_urut=26
     of '08'
        vl_no_urut=27
  END
  Relate:APDTRANS.Open                                     ! File FileSql2 used by this procedure, so make sure it's RelationManager is open
  Relate:APDTRANSDet.Open                                  ! File FileSql2 used by this procedure, so make sure it's RelationManager is open
  Relate:Ano_pakai.Open                                    ! File FileSql2 used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket.Open                                     ! File FileSql2 used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql.Open                                      ! File FileSql2 used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql2.Open                                     ! File FileSql2 used by this procedure, so make sure it's RelationManager is open
  Relate:IAP_SET.Open                                      ! File FileSql2 used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File FileSql2 used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_Batal.Open                                  ! File FileSql2 used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File FileSql2 used by this procedure, so make sure it's RelationManager is open
  Relate:SMPegawai.SetOpenRelated()
  Relate:SMPegawai.Open                                    ! File FileSql2 used by this procedure, so make sure it's RelationManager is open
  Relate:Tbstawal.Open                                     ! File FileSql2 used by this procedure, so make sure it's RelationManager is open
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPoli.UseFile                                     ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKelPeg.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APDTcam.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ApReLuar.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JTransaksi.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:APHTRANS
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel                      ! No confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  BRW4.Init(?Browse:4,Queue:Browse:4.ViewPosition,BRW4::View:Browse,Queue:Browse:4,Relate:APDTRANS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  if self.request=1 then
     do isi_nomor
  end
  open(view::jtrans)
  ?Browse:4{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW4.Q &= Queue:Browse:4
  BRW4::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon APD:N0_tran for sort order 1
  BRW4.AddSortOrder(BRW4::Sort0:StepClass,APD:notran_kode) ! Add the sort order for APD:notran_kode for sort order 1
  BRW4.AddRange(APD:N0_tran,Relate:APDTRANS,Relate:APHTRANS) ! Add file relationship range limit for sort order 1
  BRW4.AddField(APD:Kode_brg,BRW4.Q.APD:Kode_brg)          ! Field APD:Kode_brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Nama_Brg,BRW4.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW4.AddField(APD:Jumlah,BRW4.Q.APD:Jumlah)              ! Field APD:Jumlah is a hot field or requires assignment from browse
  BRW4.AddField(APD:Total,BRW4.Q.APD:Total)                ! Field APD:Total is a hot field or requires assignment from browse
  BRW4.AddField(APD:Diskon,BRW4.Q.APD:Diskon)              ! Field APD:Diskon is a hot field or requires assignment from browse
  BRW4.AddField(APD:Camp,BRW4.Q.APD:Camp)                  ! Field APD:Camp is a hot field or requires assignment from browse
  BRW4.AddField(APD:N0_tran,BRW4.Q.APD:N0_tran)            ! Field APD:N0_tran is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Kode_brg,BRW4.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_UpdateRawatJalan',QuickWindow)        ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW4.AskProcedure = 3
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
     DO BATAL_D_DUA
     DO BATAL_D_UTAMA
  end
  if self.request=1 and self.response=1 then
     do hapus_nomor_use
  end
  close(view::jtrans)
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:APDTRANSDet.Close
    Relate:Ano_pakai.Close
    Relate:Apetiket.Close
    Relate:FileSql.Close
    Relate:FileSql2.Close
    Relate:IAP_SET.Close
    Relate:NomorUse.Close
    Relate:Nomor_Batal.Close
    Relate:Nomor_SKR.Close
    Relate:SMPegawai.Close
    Relate:Tbstawal.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_UpdateRawatJalan',QuickWindow)     ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
    APH:Tanggal = Today()
    APH:Kode_Apotik = GL_entryapotik
    APH:Jam = clock()
    APH:User = glo:user_id
  PARENT.PrimeFields


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  JTra:No_Nota = APH:NoNota                                ! Assign linking field value
  Access:JTransaksi.Fetch(JTra:KeyNoNota)
  JDok:Kode_Dokter = APH:dokter                            ! Assign linking field value
  Access:JDokter.Fetch(JDok:KeyKodeDokter)
  JKon:KODE_KTR = APH:Kontrak                              ! Assign linking field value
  Access:JKontrak.Fetch(JKon:KeyKodeKtr)
  PEGA:Nik = APH:NIP                                       ! Assign linking field value
  Access:SMPegawai.Fetch(PEGA:Pkey)
  APH:Biaya = (LOC::TOTAL - discount)
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
      Cari_nama_poli
      SelectDokter
      Trig_UpdateRawatJalanDetil
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
    OF ?APH:Nomor_mr
      if vl_sudah=0
         IF CLIP(loc::nama) = ''
             JPas:Nomor_mr=APH:Nomor_mr
             GET( JPasien,JPas:KeyNomorMr)
             IF ERRORCODE() = 35 THEN
                 MESSAGE('Nomor RM Tidak Ada Dalam daftar')
                 JKon:KODE_KTR    =''
                 access:jkontrak.fetch(JKon:KeyKodeKtr)
                 PEGA:Nik         =''
                 access:smpegawai.fetch(PEGA:Pkey)
                 JDok:Kode_Dokter=''
                 access:jdokter.fetch(JDok:KeyKodeDokter)
                 APH:dokter       =''
                 APH:Asal         =''
                 APH:NIP          =''
                 APH:Kontrak      =''
                 APH:NoNota       =''
                 !APH:Nomor_mr     = 99999999
                 APH:cara_bayar   =2
                 status           =2
                 ?BROWSE:4{PROP:DISABLE}=1
                 ?Insert:5{PROP:DISABLE}=TRUE
                 ?APH:NIP{PROP:DISABLE}=true
                 ?APH:Kontrak{PROP:DISABLE}=TRUE
                 ?Button11{PROP:DISABLE}=TRUE
                 ?Button10{PROP:DISABLE}=true
                 ?APH:NoNota{PROP:DISABLE}=true
                 ?CallLookup:3{PROP:DISABLE}=false
                 CLEAR (JPas:Nama)
                 CLEAR (JPas:Alamat)
                 DISPLAY
                 SELECT(?APH:Nomor_mr)
             ELSE
                 ?BROWSE:4{PROP:DISABLE}=0
                 ?Insert:5{PROP:DISABLE}=0
                 glo::campur=0
                 !message('select kode_transaksi,lamabaru,kode_dokter,kontraktor,kode_poli,no_nota,nip from dba.jtransaksi where statusBatal<<>1 and nomor_mr='&aph:nomor_mr&' and tanggal='''&format(today(),@d10)&''' order by no_nota')
                 !(statusBatal<<>1 or statusBatal is null) and 
                 view::jtrans{prop:sql}='select kode_transaksi,lamabaru,kode_dokter,kontraktor,kode_poli,no_nota,nip from dba.jtransaksi where (statusBatal<<>1 or statusBatal is null) and nomor_mr='&aph:nomor_mr&' and tanggal='''&format(today(),@d10)&''' order by no_nota'
                 !if errorcode() then message(error()).
                 next(view::jtrans)
                 if not errorcode() then
                    JPas:Nomor_mr=aph:nomor_mr
                    access:jpasien.fetch(JPas:KeyNomorMr)
                    JDok:Kode_Dokter=FIL1:String1
                    access:jdokter.fetch(JDok:KeyKodeDokter)
                    APH:Asal     =FIL1:String3
                    APH:dokter   =FIL1:String1
                    !message(JTra:Kode_Transaksi)
                    !message(FIL1:Byte1&' '&FIL1:String2)
                    if FIL1:Byte1=3 then
                       JKon:KODE_KTR=FIL1:String2
                       access:jkontrak.fetch(JKon:KeyKodeKtr)
                       !message(JKon:NAMA_KTR)
                       APH:Kontrak =FIL1:String2
                       APH:NIP      =''
                       PEGA:Nik         =''
                       APH:NoNota    =FIL1:String4
                       access:smpegawai.fetch(PEGA:Pkey)
                       ?Button11{PROP:DISABLE}=false
                       ?Button10{PROP:DISABLE}=true
                       ?APH:NIP{PROP:DISABLE}=true
                       ?APH:Kontrak{PROP:DISABLE}=false
                       ?APH:NoNota{PROP:DISABLE}=false
                       ?CallLookup:3{PROP:DISABLE}=false
                    elsif FIL1:Byte1=1 then
                       JKon:KODE_KTR =''
                       access:jkontrak.fetch(JKon:KeyKodeKtr)
                       APH:Kontrak   =''
                       APH:NoNota    =''
                       PEGA:Nik      =FIL1:String5
                       access:smpegawai.fetch(PEGA:Pkey)
                       APH:NIP       =FIL1:String5
                       ?Button11{PROP:DISABLE}=true
                       ?Button10{PROP:DISABLE}=false
                       !?APH:NIP{PROP:DISABLE}=false
                       ?APH:Kontrak{PROP:DISABLE}=TRUE
                       ?APH:NoNota{PROP:DISABLE}=true
                       ?CallLookup:3{PROP:DISABLE}=false
                    else
                       JKon:KODE_KTR =''
                       access:jkontrak.fetch(JKon:KeyKodeKtr)
                       PEGA:Nik      =''
                       access:smpegawai.fetch(PEGA:Pkey)
                       APH:NIP       =''
                       APH:Kontrak   =''
                       APH:NoNota    =''
                       ?Button10{PROP:DISABLE}=true
                       ?Button11{PROP:DISABLE}=true
                       ?APH:NIP{PROP:DISABLE}=true
                       ?APH:Kontrak{PROP:DISABLE}=TRUE
                       ?APH:NoNota{PROP:DISABLE}=true
                       ?CallLookup:3{PROP:DISABLE}=false
                    end
                    APH:LamaBaru  =FIL1:Byte2
                    APH:cara_bayar=FIL1:Byte1
                    status=FIL1:Byte1
                    display
                 else
                    !message(JTra:Kode_Transaksi&' '&errorcode())
                    JKon:KODE_KTR    =''
                    access:jkontrak.fetch(JKon:KeyKodeKtr)
                    PEGA:Nik         =''
                    access:smpegawai.fetch(PEGA:Pkey)
                    JDok:Kode_Dokter=''
                    access:jdokter.fetch(JDok:KeyKodeDokter)
                    APH:dokter       =''
                    APH:Asal         =''
                    APH:NIP          =''
                    APH:Kontrak      =''
                    APH:NoNota       =''
                    APH:cara_bayar   =2
                    status=2
                    ?APH:NIP{PROP:DISABLE}=true
                    ?APH:Kontrak{PROP:DISABLE}=TRUE
                    ?APH:NoNota{PROP:DISABLE}=true
                    ?Button10{PROP:DISABLE}=true
                    ?Button11{PROP:DISABLE}=true
                    ?CallLookup:3{PROP:DISABLE}=false
                 end
             END
         ELSE
             APH:Nomor_mr = 99999999
         END
      end
      display
      !if vl_sudah=0
      !IF CLIP(loc::nama) = ''
      !    JPas:Nomor_mr=APH:Nomor_mr
      !    GET( JPasien,JPas:KeyNomorMr)
      !    IF ERRORCODE() = 35 THEN
      !        MESSAGE('Nomor RM Tidak Ada Dalam daftar')
      !        JKon:KODE_KTR    =''
      !        access:jkontrak.fetch(JKon:KeyKodeKtr)
      !        PEGA:Nik         =''
      !        access:smpegawai.fetch(PEGA:Pkey)
      !        JDok:Kode_Dokter=''
      !        access:jdokter.fetch(JDok:KeyKodeDokter)
      !        APH:dokter       =''
      !        APH:Asal         =''
      !        APH:NIP          =''
      !        APH:Kontrak      =''
      !        APH:NoNota       =''
      !        !APH:Nomor_mr     = 99999999
      !        APH:cara_bayar   =2
      !        status           =2
      !        ?BROWSE:4{PROP:DISABLE}=1
      !        ?Insert:5{PROP:DISABLE}=TRUE
      !        ?APH:NIP{PROP:DISABLE}=true
      !        ?APH:Kontrak{PROP:DISABLE}=TRUE
      !        ?Button11{PROP:DISABLE}=TRUE
      !        ?Button10{PROP:DISABLE}=true
      !        ?APH:NoNota{PROP:DISABLE}=true
      !
      !        CLEAR (JPas:Nama)
      !        CLEAR (JPas:Alamat)
      !        DISPLAY
      !        SELECT(?APH:Nomor_mr)
      !    ELSE
      !        ?BROWSE:4{PROP:DISABLE}=0
      !        ?Insert:5{PROP:DISABLE}=0
      !        glo::campur=0
      !        jtransaksi{prop:sql}='select * from dba.jtransaksi where nomor_mr='&aph:nomor_mr&' and tanggal='''&format(today(),@d10)&''' order by no_nota'
      !        jtransaksi{prop:sql}='select * from dba.jtransaksi where nomor_mr='&aph:nomor_mr&' and tanggal='''&format(today(),@d10)&''' order by no_nota'
      !        next(jtransaksi)
      !        if not errorcode() then
      !           JPas:Nomor_mr=aph:nomor_mr
      !           access:jpasien.fetch(JPas:KeyNomorMr)
      !           JDok:Kode_Dokter=JTra:Kode_dokter
      !           access:jdokter.fetch(JDok:KeyKodeDokter)
      !           APH:Asal     =JTra:Kode_poli
      !           APH:dokter   =JTra:Kode_dokter
      !           !message(JTra:Kode_Transaksi)
      !           if JTra:Kode_Transaksi=3 then
      !              JKon:KODE_KTR=JTra:Kontraktor
      !              access:jkontrak.fetch(JKon:KeyKodeKtr)
      !              APH:Kontrak =JTra:Kontraktor
      !              APH:NoNota  =JTra:No_Nota
      !              APH:NIP      =''
      !              PEGA:Nik         =''
      !              access:smpegawai.fetch(PEGA:Pkey)
      !              ?Button11{PROP:DISABLE}=false
      !              ?Button10{PROP:DISABLE}=true
      !              ?APH:NIP{PROP:DISABLE}=true
      !              ?APH:Kontrak{PROP:DISABLE}=false
      !              ?APH:NoNota{PROP:DISABLE}=false
      !           elsif JTra:Kode_Transaksi=1 then
      !              JKon:KODE_KTR =''
      !              access:jkontrak.fetch(JKon:KeyKodeKtr)
      !              APH:Kontrak   =''
      !              APH:NoNota    =JTra:No_Nota
      !              PEGA:Nik      =JTra:NIP
      !              access:smpegawai.fetch(PEGA:Pkey)
      !              APH:NIP       =JTra:NIP
      !              ?Button11{PROP:DISABLE}=true
      !              ?Button10{PROP:DISABLE}=true
      !              ?APH:NIP{PROP:DISABLE}=false
      !              ?APH:Kontrak{PROP:DISABLE}=TRUE
      !              ?APH:NoNota{PROP:DISABLE}=true
      !           else
      !              JKon:KODE_KTR =''
      !              access:jkontrak.fetch(JKon:KeyKodeKtr)
      !              PEGA:Nik      =''
      !              access:smpegawai.fetch(PEGA:Pkey)
      !              APH:Asal      =''
      !              APH:NIP       =''
      !              APH:Kontrak   =''
      !              APH:NoNota    =JTra:No_Nota
      !              ?Button10{PROP:DISABLE}=false
      !              ?Button11{PROP:DISABLE}=true
      !              ?APH:NIP{PROP:DISABLE}=true
      !              ?APH:Kontrak{PROP:DISABLE}=TRUE
      !              ?APH:NoNota{PROP:DISABLE}=true
      !           end
      !           APH:LamaBaru  =JTra:LamaBaru
      !           APH:cara_bayar=JTra:Kode_Transaksi
      !           status=JTra:Kode_Transaksi
      !           display
      !        else
      !           !message(JTra:Kode_Transaksi&' '&errorcode())
      !           JKon:KODE_KTR    =''
      !           access:jkontrak.fetch(JKon:KeyKodeKtr)
      !           PEGA:Nik         =''
      !           access:smpegawai.fetch(PEGA:Pkey)
      !           JDok:Kode_Dokter=''
      !           access:jdokter.fetch(JDok:KeyKodeDokter)
      !           APH:dokter       =''
      !           APH:Asal         =''
      !           APH:NIP          =''
      !           APH:Kontrak      =''
      !           APH:NoNota       =''
      !           APH:cara_bayar   =2
      !           status=2
      !           ?APH:NIP{PROP:DISABLE}=true
      !           ?APH:Kontrak{PROP:DISABLE}=TRUE
      !           ?APH:NoNota{PROP:DISABLE}=true
      !        end
      !    END
      !ELSE
      !    APH:Nomor_mr = 99999999
      !END
      !end
      !display
    OF ?status
      if vl_sudah=0
      IF CEK_RUN = 0
        CASE status
        OF 1
           JKon:KODE_KTR=''
           access:jkontrak.fetch(JKon:KeyKodeKtr)
           APH:Kontrak=''
           !APH:NoNota=''
           ?APH:Kontrak{PROP:DISABLE}=TRUE
           ?Button11{PROP:DISABLE}=TRUE
           ?Button10{PROP:DISABLE}=false
           ?APH:NoNota{PROP:DISABLE}=false
           ?CallLookup:3{PROP:DISABLE}=false
           ?Insert:5{PROP:DISABLE}=false
           display
           !select(?Button10)
        of 2
           JKon:KODE_KTR=''
           access:jkontrak.fetch(JKon:KeyKodeKtr)
           APH:Kontrak=''
           PEGA:Nik=''
           access:smpegawai.fetch(PEGA:Pkey)
           APH:NIP=''
           !APH:NoNota=''
           ?APH:Kontrak{PROP:DISABLE}=TRUE
           ?Button11{PROP:DISABLE}=TRUE
           ?APH:NIP{PROP:DISABLE}=TRUE
           ?Button10{PROP:DISABLE}=true
           ?APH:NoNota{PROP:DISABLE}=false
           ?CallLookup:3{PROP:DISABLE}=false
           ?Insert:5{PROP:DISABLE}=false
           display
        OF 3
           PEGA:Nik=''
           access:smpegawai.fetch(PEGA:Pkey)
           APH:NIP=''
           ?APH:NIP{PROP:DISABLE}=TRUE
           ?APH:Kontrak{PROP:DISABLE}=false
           ?Button11{PROP:DISABLE}=false
           ?Button10{PROP:DISABLE}=true
           ?APH:NoNota{PROP:DISABLE}=false
           ?CallLookup:3{PROP:DISABLE}=false
           ?Insert:5{PROP:DISABLE}=false
           display
           !select(?Button11)
        end
        APH:cara_bayar=status
      end
      end
    OF ?OK
      if APH:NoNota='' then
         message('No nota harus terisi !!!')
         cycle
      end
      !if vl_sudah=0
      sudah_nomor = 0
      glo::no_nota = APH:N0_tran
      !memperbaharui file Aphtrans, apdtrans, gstokaptk, apreluar
      CEK_RUN=1
      APH:User=GL::Prefix
      ! *****UNTUK file ApHTrans******
      APH:Bayar=0
      APH:Ra_jal=1
      APH:cara_bayar=status
      APH:Kode_Apotik=GL_entryapotik
      APH:User = Glo:USER_ID
      
      !untuk file ApReLuar
      IF CLIP(loc::nama) <> ''
          APR:Nama = loc::nama
          APR:Alamat = loc::alamat
          APR:RT     = loc::RT
          APR:RW     = loc::rw
          APR:Kota   = loc::kota
          APR:N0_tran = APH:N0_tran
          Access:ApReLuar.Insert()
      END
      
      !untuk file ApDTrans
      !IF discount <> 0
      !    APD:N0_tran = APH:N0_tran
      !    APD:Kode_brg = '_Disc'
      !    APD:Total = - discount
      !    APD:Jumlah = pers_disc
      !    Access:APDTRANS.Insert()
      !END
      
      !cek dulu bulannya ya, kalau sudah berubah, tulis dulu ke file awal bulan
      IF MONTH(glo::tgl_awal_kerja) <> mONTH(TODAY())
         APH:Tanggal = TODAY()
         Tahun_ini = YEAR(TODAY())
         Loc::delete=0
         SET(APDTRANS)
         APD:N0_tran = APH:N0_tran
         SET(APD:by_transaksi,APD:by_transaksi)
         LOOP
            IF Access:APDTRANS.Next()<>Level:Benign OR APD:N0_tran <> APH:N0_tran THEN BREAK.
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
            END
         END
      END
      !end
      vl_sudah=1
    OF ?Cancel
      !if vl_sudah=0
      !    DO BATAL_D_DUA
      !    DO BATAL_D_UTAMA
      !end
    OF ?discount
      if vl_sudah=0
      IF DISCOUNT > 0 AND masuk_disc = 0
          masuk_disc = 1
      END
      end
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CallLookup
      ThisWindow.Update
      JPol:POLIKLINIK = APH:Asal
      IF SELF.Run(1,SelectRecord) = RequestCompleted       ! Call lookup procedure and verify RequestCompleted
        APH:Asal = JPol:POLIKLINIK
      END
      ThisWindow.Reset(1)
    OF ?Button10
      ThisWindow.Update
      if vl_sudah=0
         globalrequest=selectrecord
         selectpegawai
         APH:NIP=PEGA:Nik
         display
         if status=1 then
         !aph:nip<>'' then
            enable(?ok)
         else
            disable(?ok)
         end
      
         if APH:NIP<>'' then
            ?insert:5{prop:disable}=false
         else
            ?insert:5{prop:disable}=true
         end
      end
    OF ?APH:Kontrak
      if vl_sudah=0
         JKon:KODE_KTR=APH:Kontrak
         access:jkontrak.fetch(JKon:KeyKodeKtr)
         if APH:NoNota<>'' and APH:Kontrak<>'' then
            ?insert:5{prop:disable}=false
         else
            ?insert:5{prop:disable}=true
         end
         display
      end
    OF ?Button11
      ThisWindow.Update
      if vl_sudah=0
         globalrequest=selectrecord
         selectjkontrak
         APH:Kontrak=JKon:KODE_KTR
         if APH:NoNota<>'' and APH:Kontrak<>'' then
            ?insert:5{prop:disable}=false
         else
            ?insert:5{prop:disable}=true
         end
         display
         if status=3 then
         !and APH:Kontraktor<>'' then
            enable(?ok)
         else
            disable(?ok)
         end
      end
      display
    OF ?APH:NoNota
      if vl_sudah=0
         JTra:No_Nota=aph:nonota
         if access:jtransaksi.fetch(JTra:KeyNoNota)=level:benign then
            if JTra:Kontraktor='' then
               message('Bukan pasien kontraktor !!!')
               aph:nonota=''
            else
               JKon:KODE_KTR=JTra:Kontraktor
               access:jkontrak.fetch(JKon:KeyKodeKtr)
               APH:Kontrak=JTra:Kontraktor
            end
         else
            message('Tidak ada nomor transaksi seperti di atas !!!')
            aph:nonota=''
         end
         if APH:NoNota<>'' and APH:Kontrak<>'' then
            ?insert:5{prop:disable}=false
         else
            ?insert:5{prop:disable}=true
         end
         display
      end
      
    OF ?calllookup:3
      ThisWindow.Update
      glo:mr=APH:Nomor_mr
      display
      globalrequest=selectrecord
      if GLO:LEVEL>1 then
      SelectJTransaksiMR()
      else
      SelectJTransaksiMRPengatur()
      end
      if vl_sudah=0
         !if JTra:Kontraktor='' then
         !   message('Bukan pasien kontraktor !!!')
         !   aph:nonota=''
         !else
            APH:NoNota=JTra:No_Nota
            display
            JKon:KODE_KTR=JTra:Kontraktor
            access:jkontrak.fetch(JKon:KeyKodeKtr)
            APH:Kontrak=JTra:Kontraktor
            if JTra:No_Nota<>'' then
            enable(?Insert:5)
            enable(?Browse:4)
            end
         !end
         !f APH:NoNota<>'' and APH:Kontrak<>'' then
         !  ?insert:5{prop:disable}=false
         !lse
         !  ?insert:5{prop:disable}=true
         !nd
         display
      end
      
    OF ?APH:dokter
      IF APH:dokter OR ?APH:dokter{Prop:Req}
        JDok:Kode_Dokter = APH:dokter
        IF Access:JDokter.TryFetch(JDok:KeyKodeDokter)
          IF SELF.Run(2,SelectRecord) = RequestCompleted
            APH:dokter = JDok:Kode_Dokter
          ELSE
            SELECT(?APH:dokter)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup:2
      ThisWindow.Update
      JDok:Kode_Dokter = APH:dokter
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        APH:dokter = JDok:Kode_Dokter
      END
      ThisWindow.Reset(1)
    OF ?Button12
      ThisWindow.Update
      if vl_sudah=0
         globalrequest=selectrecord
         selectjtransaksi
         if JTra:Kontraktor<>'' then
            JKon:KODE_KTR=JTra:Kontraktor
            access:jkontrak.fetch(JKon:KeyKodeKtr)
            JPas:Nomor_mr=JTra:Nomor_Mr
            access:jpasien.fetch(JPas:KeyNomorMr)
            APH:dokter=JTra:Kode_dokter
            access:jdokter.fetch(JDok:KeyKodeDokter)
            APH:NoNota=JTra:No_Nota
            APH:Nomor_mr=JTra:Nomor_Mr
            APH:NIP      =JTra:NIP
            APH:Kontrak =JTra:Kontraktor
            if APH:Kontrak<>'' then
               APH:NoNota  =JTra:No_Nota
            else
               APH:NoNota  =''
            end
            display
            APH:LamaBaru =JTra:LamaBaru
            APH:cara_bayar=JTra:Kode_Transaksi
         else
            JKon:KODE_KTR =''
            access:jkontrak.fetch(JKon:KeyKodeKtr)
            APH:Asal      =''
            APH:NIP       =''
            APH:Kontrak   =''
            APH:NoNota    =''
            APH:LamaBaru  =JTra:LamaBaru
            APH:cara_bayar=JTra:Kode_Transaksi
            APH:dokter    =JTra:Kode_dokter
            access:jdokter.fetch(JDok:KeyKodeDokter)
            APH:NoNota    =JTra:No_Nota
            display
         end
         status=JTra:Kode_Transaksi
         if status=0 then
            status=2
         end
         ?BROWSE:4{PROP:DISABLE}=0
         ?Insert:5{PROP:DISABLE}=0
         glo::campur=0
         APH:Asal=JTra:Kode_poli
         display
      end
    OF ?OK
      ThisWindow.Update
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?Button9
      ThisWindow.Update
      if vl_sudah=0
         IF LOC::TOTAL <> 0
             !vl_round = round(APH:Biaya)
             !Pembulatan
             vl_hasil=0
             vl_real=APH:Biaya
             vl_seribu=round(APH:Biaya,1000)
             !message(vl_seribu)
             if vl_seribu<vl_real then
                vl_selisih=vl_real-vl_seribu
                !message(vl_selisih)
                if vl_selisih>100 then
                   vl_selisih=500
                   vl_hasil=vl_seribu+vl_selisih
                else
                   vl_hasil=vl_seribu
                end
             else
                vl_selisih=vl_seribu-vl_real
                !message(vl_selisih)
                if vl_selisih>400 then
                   vl_hasil=vl_seribu-500
                else
                   vl_hasil=vl_seribu
                end
             end
             !selesai
             !APH:Biaya = ROUND( ((APH:Biaya /100) + 0.4999) , 1 ) *100
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
                             IF APD:Kode_brg = '_Campur'
                                 APD:Total = APD:Total + loc::copy_total - LOC::TOTAL
                                 PUT(APDTRANS)
                                 SET(APDTcam)
                                 APD1:N0_tran = APH:N0_tran
                                 APD1:Camp = APD:Camp
                                 SET (APD1:by_tranno,APD1:by_tranno)
                                 LOOP
                                     NEXT( APDTcam )
                                     IF APD1:Kode_brg = '_Biaya'
                                         APD1:Total = APD1:Total  + loc::copy_total - LOC::TOTAL
                                         PUT(APDTcam)
                                         BREAK
                                     END
                                 END
      
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
    OF ?discount
      ThisWindow.Reset(1)
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
    OF ?APH:Asal
      JPol:POLIKLINIK = APH:Asal
      IF Access:JPoli.TryFetch(JPol:BY_POLI)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          APH:Asal = JPol:POLIKLINIK
        END
      END
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
    OF EVENT:AlertKey
      select(?cancel)
      presskey( 13)
    OF EVENT:CloseWindow
      IF SELF.RESPONSE = 1 THEN
         !PrintTransRawatJalan
      END
    OF EVENT:Timer
      if vl_sudah=0
         IF LOC::TOTAL = 0
             ?OK{PROP:DISABLE}=1
         ELSE
             ?OK{PROP:DISABLE}=0
         END
      end
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APH:Biaya = (LOC::TOTAL - discount)


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
  set(BRW4::View:Browse)
  next(BRW4::View:Browse)
  if not(errorcode()) then
     ?Button10{PROP:DISABLE}=true
     ?Button11{PROP:DISABLE}=true
     ?APH:Kontrak{PROP:DISABLE}=TRUE
     ?APH:NoNota{PROP:DISABLE}=true
     ?CallLookup:3{PROP:DISABLE}=true
  else
     if status=3 then
        ?Button11{PROP:DISABLE}=false
        ?Button10{PROP:DISABLE}=true
        ?APH:Kontrak{PROP:DISABLE}=false
        ?APH:NoNota{PROP:DISABLE}=false
        ?CallLookup:3{PROP:DISABLE}=false
     elsif status=1 then
        ?Button11{PROP:DISABLE}=true
        ?Button10{PROP:DISABLE}=false
        ?APH:Kontrak{PROP:DISABLE}=TRUE
        ?APH:NoNota{PROP:DISABLE}=true
        ?CallLookup:3{PROP:DISABLE}=true
     else
        ?Button10{PROP:DISABLE}=true
        ?Button11{PROP:DISABLE}=true
        ?APH:Kontrak{PROP:DISABLE}=TRUE
        ?APH:NoNota{PROP:DISABLE}=true
        ?CallLookup:3{PROP:DISABLE}=true
     end
  end
  
  disable(?status)


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

SelectJPoli PROCEDURE                                      ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(JPoli)
                       PROJECT(JPol:NAMA_POLI)
                       PROJECT(JPol:POLIKLINIK)
                       PROJECT(JPol:TEMPAT)
                       PROJECT(JPol:NO_POLI)
                       PROJECT(JPol:UPF)
                       PROJECT(JPol:BiayaRSI)
                       PROJECT(JPol:BiayaDokter)
                       PROJECT(JPol:TotalBiaya)
                       PROJECT(JPol:User)
                       PROJECT(JPol:Lantai)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
JPol:NAMA_POLI         LIKE(JPol:NAMA_POLI)           !List box control field - type derived from field
JPol:POLIKLINIK        LIKE(JPol:POLIKLINIK)          !List box control field - type derived from field
JPol:TEMPAT            LIKE(JPol:TEMPAT)              !List box control field - type derived from field
JPol:NO_POLI           LIKE(JPol:NO_POLI)             !List box control field - type derived from field
JPol:UPF               LIKE(JPol:UPF)                 !List box control field - type derived from field
JPol:BiayaRSI          LIKE(JPol:BiayaRSI)            !List box control field - type derived from field
JPol:BiayaDokter       LIKE(JPol:BiayaDokter)         !List box control field - type derived from field
JPol:TotalBiaya        LIKE(JPol:TotalBiaya)          !List box control field - type derived from field
JPol:User              LIKE(JPol:User)                !List box control field - type derived from field
JPol:Lantai            LIKE(JPol:Lantai)              !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a JPoli Record'),AT(,,358,188),FONT('MS Sans Serif',8,COLOR:Black,),IMM,HLP('SelectJPoli'),SYSTEM,GRAY,RESIZE,MDI
                       LIST,AT(8,20,342,124),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('80L(2)|M~NAMA_POLI~L(2)@s25@44L(2)|M~POLIKLINIK~L(2)@s10@28L(2)|M~TEMPAT~L(2)@s5' &|
   '@64R(2)|M~NO_POLI~C(0)@n-14@44L(2)|M~UPF~L(2)@s10@44D(12)|M~BiayaRSI~C(0)@n10.2@' &|
   '48D(12)|M~BiayaDokter~C(0)@n10.2@44D(12)|M~TotalBiaya~C(0)@n10.2@44L(2)|M~User~L' &|
   '(2)@s10@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(305,148,45,14),USE(?Select:2)
                       SHEET,AT(4,4,350,162),USE(?CurrentTab)
                         TAB('JPol:BY_POLI'),USE(?Tab:2)
                         END
                         TAB('JPol:BY_NAMA'),USE(?Tab:3)
                         END
                         TAB('JPol:ByUPF'),USE(?Tab:4)
                         END
                         TAB('JPol:ByNoPoli'),USE(?Tab:5)
                         END
                         TAB('JPol:KeyTempat'),USE(?Tab:6)
                         END
                         TAB('JPol:KeyLantai'),USE(?Tab:7)
                         END
                       END
                       BUTTON('Close'),AT(260,170,45,14),USE(?Close)
                       BUTTON('Help'),AT(309,170,45,14),USE(?Help),STD(STD:Help)
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
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
BRW1::Sort5:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 6
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
  GlobalErrors.SetProcedureName('SelectJPoli')
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
  Relate:JPoli.SetOpenRelated()
  Relate:JPoli.Open                                        ! File JPoli used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:JPoli,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,JPol:BY_NAMA)                         ! Add the sort order for JPol:BY_NAMA for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,JPol:NAMA_POLI,,BRW1)          ! Initialize the browse locator using  using key: JPol:BY_NAMA , JPol:NAMA_POLI
  BRW1.AddSortOrder(,JPol:ByUPF)                           ! Add the sort order for JPol:ByUPF for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,JPol:UPF,,BRW1)                ! Initialize the browse locator using  using key: JPol:ByUPF , JPol:UPF
  BRW1.AddSortOrder(,JPol:ByNoPoli)                        ! Add the sort order for JPol:ByNoPoli for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,JPol:NO_POLI,1,BRW1)           ! Initialize the browse locator using  using key: JPol:ByNoPoli , JPol:NO_POLI
  BRW1.AddSortOrder(,JPol:KeyTempat)                       ! Add the sort order for JPol:KeyTempat for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,JPol:TEMPAT,,BRW1)             ! Initialize the browse locator using  using key: JPol:KeyTempat , JPol:TEMPAT
  BRW1.AddSortOrder(,JPol:KeyLantai)                       ! Add the sort order for JPol:KeyLantai for sort order 5
  BRW1.AddLocator(BRW1::Sort5:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort5:Locator.Init(,JPol:Lantai,1,BRW1)            ! Initialize the browse locator using  using key: JPol:KeyLantai , JPol:Lantai
  BRW1.AddSortOrder(,JPol:BY_POLI)                         ! Add the sort order for JPol:BY_POLI for sort order 6
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 6
  BRW1::Sort0:Locator.Init(,JPol:POLIKLINIK,,BRW1)         ! Initialize the browse locator using  using key: JPol:BY_POLI , JPol:POLIKLINIK
  BRW1.AddField(JPol:NAMA_POLI,BRW1.Q.JPol:NAMA_POLI)      ! Field JPol:NAMA_POLI is a hot field or requires assignment from browse
  BRW1.AddField(JPol:POLIKLINIK,BRW1.Q.JPol:POLIKLINIK)    ! Field JPol:POLIKLINIK is a hot field or requires assignment from browse
  BRW1.AddField(JPol:TEMPAT,BRW1.Q.JPol:TEMPAT)            ! Field JPol:TEMPAT is a hot field or requires assignment from browse
  BRW1.AddField(JPol:NO_POLI,BRW1.Q.JPol:NO_POLI)          ! Field JPol:NO_POLI is a hot field or requires assignment from browse
  BRW1.AddField(JPol:UPF,BRW1.Q.JPol:UPF)                  ! Field JPol:UPF is a hot field or requires assignment from browse
  BRW1.AddField(JPol:BiayaRSI,BRW1.Q.JPol:BiayaRSI)        ! Field JPol:BiayaRSI is a hot field or requires assignment from browse
  BRW1.AddField(JPol:BiayaDokter,BRW1.Q.JPol:BiayaDokter)  ! Field JPol:BiayaDokter is a hot field or requires assignment from browse
  BRW1.AddField(JPol:TotalBiaya,BRW1.Q.JPol:TotalBiaya)    ! Field JPol:TotalBiaya is a hot field or requires assignment from browse
  BRW1.AddField(JPol:User,BRW1.Q.JPol:User)                ! Field JPol:User is a hot field or requires assignment from browse
  BRW1.AddField(JPol:Lantai,BRW1.Q.JPol:Lantai)            ! Field JPol:Lantai is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectJPoli',QuickWindow)                  ! Restore window settings from non-volatile store
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
    Relate:JPoli.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectJPoli',QuickWindow)               ! Save window data to non-volatile store
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
  ELSE
    RETURN SELF.SetSort(6,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

SelectJPTmpKel PROCEDURE                                   ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(JPTmpKel)
                       PROJECT(JPTK:Nomor_mr)
                       PROJECT(JPTK:Nama)
                       PROJECT(JPTK:TanggalLahir)
                       PROJECT(JPTK:Umur)
                       PROJECT(JPTK:Umur_Bln)
                       PROJECT(JPTK:Jenis_kelamin)
                       PROJECT(JPTK:Alamat)
                       PROJECT(JPTK:RT)
                       PROJECT(JPTK:RW)
                       PROJECT(JPTK:Kecamatan)
                       PROJECT(JPTK:Kota)
                       PROJECT(JPTK:kembali)
                       PROJECT(JPTK:Tanggal)
                       PROJECT(JPTK:Lantai)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
JPTK:Nomor_mr          LIKE(JPTK:Nomor_mr)            !List box control field - type derived from field
JPTK:Nama              LIKE(JPTK:Nama)                !List box control field - type derived from field
JPTK:TanggalLahir      LIKE(JPTK:TanggalLahir)        !List box control field - type derived from field
JPTK:Umur              LIKE(JPTK:Umur)                !List box control field - type derived from field
JPTK:Umur_Bln          LIKE(JPTK:Umur_Bln)            !List box control field - type derived from field
JPTK:Jenis_kelamin     LIKE(JPTK:Jenis_kelamin)       !List box control field - type derived from field
JPTK:Alamat            LIKE(JPTK:Alamat)              !List box control field - type derived from field
JPTK:RT                LIKE(JPTK:RT)                  !List box control field - type derived from field
JPTK:RW                LIKE(JPTK:RW)                  !List box control field - type derived from field
JPTK:Kecamatan         LIKE(JPTK:Kecamatan)           !Browse key field - type derived from field
JPTK:Kota              LIKE(JPTK:Kota)                !Browse key field - type derived from field
JPTK:kembali           LIKE(JPTK:kembali)             !Browse key field - type derived from field
JPTK:Tanggal           LIKE(JPTK:Tanggal)             !Browse key field - type derived from field
JPTK:Lantai            LIKE(JPTK:Lantai)              !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a JPTmpKel Record'),AT(,,358,188),FONT('MS Sans Serif',8,COLOR:Black,),IMM,HLP('SelectJPTmpKel'),SYSTEM,GRAY,RESIZE,MDI
                       LIST,AT(8,20,342,124),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('80R(2)|M~Nomor MR~C(0)@N010_@80L(2)|M~Nama~L(2)@s35@80R(2)|M~Tanggal Lahir~C(0)@' &|
   'D06@20R(2)|M~Umur~C(0)@n3@36R(2)|M~Umur Bln~C(0)@n3@56L(2)|M~Jenis kelamin~L(2)@' &|
   's1@80L(2)|M~Alamat~L(2)@s35@16R(2)|M~RT~C(0)@N3@16R(2)|M~RW~C(0)@N3@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(305,148,45,14),USE(?Select:2)
                       SHEET,AT(4,4,350,162),USE(?CurrentTab)
                         TAB('Nomor RM'),USE(?Tab:2)
                         END
                         TAB('Nama'),USE(?Tab:3)
                         END
                         TAB('JPTK:KeyKec'),USE(?Tab:4)
                         END
                         TAB('Status RM'),USE(?Tab:5)
                         END
                         TAB('tgl. kunjungan'),USE(?Tab:6)
                         END
                         TAB('JPTK:KeyKota'),USE(?Tab:7)
                         END
                         TAB('JPTK:KeyLantai'),USE(?Tab:8)
                         END
                       END
                       BUTTON('Close'),AT(260,170,45,14),USE(?Close)
                       BUTTON('Help'),AT(309,170,45,14),USE(?Help),STD(STD:Help)
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
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
BRW1::Sort5:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 6
BRW1::Sort6:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 7
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
  GlobalErrors.SetProcedureName('SelectJPTmpKel')
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
  Relate:JPTmpKel.Open                                     ! File JPTmpKel used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:JPTmpKel,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,JPTK:KeyNama)                         ! Add the sort order for JPTK:KeyNama for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,JPTK:Nama,1,BRW1)              ! Initialize the browse locator using  using key: JPTK:KeyNama , JPTK:Nama
  BRW1.AddSortOrder(,JPTK:KeyKec)                          ! Add the sort order for JPTK:KeyKec for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,JPTK:Kecamatan,1,BRW1)         ! Initialize the browse locator using  using key: JPTK:KeyKec , JPTK:Kecamatan
  BRW1.AddSortOrder(,JPTK:KeyKembali)                      ! Add the sort order for JPTK:KeyKembali for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,JPTK:kembali,1,BRW1)           ! Initialize the browse locator using  using key: JPTK:KeyKembali , JPTK:kembali
  BRW1.AddSortOrder(,JPTK:KeyTanggal)                      ! Add the sort order for JPTK:KeyTanggal for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,JPTK:Tanggal,1,BRW1)           ! Initialize the browse locator using  using key: JPTK:KeyTanggal , JPTK:Tanggal
  BRW1.AddSortOrder(,JPTK:KeyKota)                         ! Add the sort order for JPTK:KeyKota for sort order 5
  BRW1.AddLocator(BRW1::Sort5:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort5:Locator.Init(,JPTK:Kota,1,BRW1)              ! Initialize the browse locator using  using key: JPTK:KeyKota , JPTK:Kota
  BRW1.AddSortOrder(,JPTK:KeyLantai)                       ! Add the sort order for JPTK:KeyLantai for sort order 6
  BRW1.AddLocator(BRW1::Sort6:Locator)                     ! Browse has a locator for sort order 6
  BRW1::Sort6:Locator.Init(,JPTK:Lantai,1,BRW1)            ! Initialize the browse locator using  using key: JPTK:KeyLantai , JPTK:Lantai
  BRW1.AddSortOrder(,JPTK:KeyNomorMr)                      ! Add the sort order for JPTK:KeyNomorMr for sort order 7
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 7
  BRW1::Sort0:Locator.Init(,JPTK:Nomor_mr,1,BRW1)          ! Initialize the browse locator using  using key: JPTK:KeyNomorMr , JPTK:Nomor_mr
  BRW1.AddField(JPTK:Nomor_mr,BRW1.Q.JPTK:Nomor_mr)        ! Field JPTK:Nomor_mr is a hot field or requires assignment from browse
  BRW1.AddField(JPTK:Nama,BRW1.Q.JPTK:Nama)                ! Field JPTK:Nama is a hot field or requires assignment from browse
  BRW1.AddField(JPTK:TanggalLahir,BRW1.Q.JPTK:TanggalLahir) ! Field JPTK:TanggalLahir is a hot field or requires assignment from browse
  BRW1.AddField(JPTK:Umur,BRW1.Q.JPTK:Umur)                ! Field JPTK:Umur is a hot field or requires assignment from browse
  BRW1.AddField(JPTK:Umur_Bln,BRW1.Q.JPTK:Umur_Bln)        ! Field JPTK:Umur_Bln is a hot field or requires assignment from browse
  BRW1.AddField(JPTK:Jenis_kelamin,BRW1.Q.JPTK:Jenis_kelamin) ! Field JPTK:Jenis_kelamin is a hot field or requires assignment from browse
  BRW1.AddField(JPTK:Alamat,BRW1.Q.JPTK:Alamat)            ! Field JPTK:Alamat is a hot field or requires assignment from browse
  BRW1.AddField(JPTK:RT,BRW1.Q.JPTK:RT)                    ! Field JPTK:RT is a hot field or requires assignment from browse
  BRW1.AddField(JPTK:RW,BRW1.Q.JPTK:RW)                    ! Field JPTK:RW is a hot field or requires assignment from browse
  BRW1.AddField(JPTK:Kecamatan,BRW1.Q.JPTK:Kecamatan)      ! Field JPTK:Kecamatan is a hot field or requires assignment from browse
  BRW1.AddField(JPTK:Kota,BRW1.Q.JPTK:Kota)                ! Field JPTK:Kota is a hot field or requires assignment from browse
  BRW1.AddField(JPTK:kembali,BRW1.Q.JPTK:kembali)          ! Field JPTK:kembali is a hot field or requires assignment from browse
  BRW1.AddField(JPTK:Tanggal,BRW1.Q.JPTK:Tanggal)          ! Field JPTK:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(JPTK:Lantai,BRW1.Q.JPTK:Lantai)            ! Field JPTK:Lantai is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectJPTmpKel',QuickWindow)               ! Restore window settings from non-volatile store
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
    Relate:JPTmpKel.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectJPTmpKel',QuickWindow)            ! Save window data to non-volatile store
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
  ELSE
    RETURN SELF.SetSort(7,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

