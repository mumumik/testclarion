

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N060.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N005.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N006.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N007.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N008.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N010.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N192.INC'),ONCE        !Req'd for module callout resolution
                     END


Trig_UpdateRawatJalan1 PROCEDURE                           ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
loc:tgl              DATE                                  !
loc:temth2           LONG                                  !
loc:bl2              SHORT                                 !
loc:bls2             STRING(2)                             !
loc:th22             STRING(2)                             !
loc:th32             STRING(2)                             !
loc:nums2            STRING(5)                             !
loc:nomor            STRING(20)                            !
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
vl_diskon_pct        REAL                                  !
vl_total             REAL                                  !
vl_hna               REAL                                  !
LOC:HARGA_DASAR      LONG                                  !
LOC::TOTAL_DTG       REAL                                  !
vl_pembulatandtg     REAL                                  !
BRW4::View:Browse    VIEW(APDTRANS)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:ktt)
                       PROJECT(APD:Camp)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:namaobatracik)
                       PROJECT(APD:Total)
                       PROJECT(APD:Diskon)
                       PROJECT(APD:N0_tran)
                       PROJECT(APD:Jum1)
                       PROJECT(APD:Harga_Dasar)
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
APD:Jum1               LIKE(APD:Jum1)                 !List box control field - type derived from field
APD:Harga_Dasar        LIKE(APD:Harga_Dasar)          !List box control field - type derived from field
APD:total_dtg          LIKE(APD:total_dtg)            !List box control field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::APH:Record  LIKE(APH:RECORD),THREAD
QuickWindow          WINDOW('Transaksi Instalasi Farmasi - Rawat Jalan'),AT(,,445,271),FONT('Times New Roman',10,,FONT:regular),CENTER,IMM,HLP('UpdateAPHTRANS'),ALRT(EscKey),GRAY,RESIZE,MDI
                       ENTRY(@s20),AT(55,18,81,10),USE(loc:nomor),FONT(,12,COLOR:Navy,FONT:bold),UPR
                       PROMPT('Asal :'),AT(142,18,37,10),USE(?Prompt6:2),RIGHT,FONT(,12,,FONT:bold)
                       STRING(@s35),AT(184,18,116,12),USE(APH:Asal),FONT('Times New Roman',12,COLOR:Navy,FONT:bold)
                       BUTTON('&Tambah Obat (+)'),AT(5,205,144,19),USE(?Insert:5),FONT('Times New Roman',10,COLOR:Black,FONT:bold),KEY(PlusKey)
                       PROMPT('Apotik :'),AT(17,4,37,10),USE(?APH:Kode_Apotik:Prompt),RIGHT,FONT('Times New Roman',12,,FONT:bold)
                       ENTRY(@s5),AT(55,4,81,10),USE(APH:Kode_Apotik),SKIP,TRN,FONT('Times New Roman',12,COLOR:Red,FONT:bold),MSG('Kode Apotik'),TIP('Kode Apotik')
                       PROMPT('Tanggal :'),AT(142,4,37,10),USE(?APH:Tanggal:Prompt),RIGHT,FONT('Times New Roman',12,,FONT:bold)
                       ENTRY(@D06),AT(184,4,70,10),USE(APH:Tanggal),RIGHT(1),FONT('Times New Roman',12,COLOR:Red,FONT:bold),MSG('Tanggal berobat pasen'),TIP('Tanggal berobat pasen')
                       PROMPT('No E-Pre:'),AT(364,102),USE(?APH:NomorEPresribing:Prompt)
                       ENTRY(@s20),AT(394,101,35,10),USE(APH:NomorEPresribing),DISABLE
                       STRING(@N010_),AT(56,31),USE(APH:Nomor_mr,,?APH:Nomor_mr:2),FONT('Times New Roman',12,COLOR:Red,FONT:bold)
                       PROMPT('Nota :'),AT(17,18,37,10),USE(?loc:nomortrans:Prompt),RIGHT,FONT(,12,,FONT:bold)
                       PROMPT('No MR :'),AT(17,31,37,10),USE(?loc:nomortrans:Prompt:2),RIGHT,FONT(,12,,FONT:bold)
                       STRING(@s25),AT(286,19,66,10),USE(JPol:NAMA_POLI)
                       BUTTON('...'),AT(432,100,12,12),USE(?CallLookup:3)
                       PROMPT('Nama :'),AT(150,32,29,10),USE(?Prompt5),RIGHT,FONT(,12,,FONT:bold)
                       STRING(@s30),AT(185,32,98,12),USE(JPas:Nama),FONT('Times New Roman',12,COLOR:Red,FONT:bold)
                       ENTRY(@s35),AT(286,32,97,10),USE(loc::nama,,?loc::nama:2),SKIP,TRN,FONT(,12,COLOR:Red,FONT:bold)
                       PROMPT('Alamat :'),AT(17,46,37,10),USE(?Prompt6),RIGHT,FONT(,12,,FONT:bold)
                       STRING(@S30),AT(56,46,116,12),USE(JPas:Alamat),FONT('Times New Roman',12,COLOR:Navy,FONT:bold)
                       ENTRY(@s35),AT(184,46,97,10),USE(loc::alamat,,?loc::alamat:2),SKIP,TRN,FONT(,12,COLOR:Navy,FONT:bold)
                       ENTRY(@s20),AT(286,46,97,10),USE(loc::kota,,?loc::kota:2),SKIP,TRN,FONT(,12,COLOR:Navy,FONT:bold)
                       PROMPT('No. Tlp :'),AT(17,60,37,10),USE(?Prompt6:3),RIGHT,FONT(,12,,FONT:bold)
                       STRING(@s15),AT(56,60,116,12),USE(JPas:Telepon),FONT('Times New Roman',12,COLOR:Navy,FONT:bold)
                       OPTION('Jenis Pembayaran'),AT(320,72,110,25),USE(status),SKIP,DISABLE,BOXED,FONT('Times New Roman',12,COLOR:Navy,)
                         RADIO('&Umum'),AT(326,80),USE(?Option1:Radio3),SKIP,TRN,FONT('Times New Roman',12,,FONT:bold),VALUE('2')
                         RADIO('&Non Umum'),AT(371,80,55,13),USE(?Option1:Radio2),SKIP,TRN,FONT('Times New Roman',12,COLOR:Red,FONT:bold),VALUE('3')
                       END
                       PROMPT('Kontraktor :'),AT(5,74,49,12),USE(?APH:Kontraktor:Prompt),RIGHT,FONT(,12,,FONT:bold)
                       STRING(@s35),AT(56,74,82,12),USE(APH:Kontrak),FONT('Times New Roman',12,COLOR:Red,FONT:bold)
                       ENTRY(@s100),AT(184,74,132,10),USE(JKon:NAMA_KTR),SKIP,TRN,FONT(,12,COLOR:Navy,FONT:bold)
                       BUTTON('F5'),AT(142,75,19,10),USE(?Button11),DISABLE,HIDE
                       PROMPT('Dokter :'),AT(5,87,49,12),USE(?APH:Kontraktor:Prompt:2),RIGHT,FONT(,12,,FONT:bold)
                       ENTRY(@s5),AT(56,87,81,10),USE(APH:dokter),DISABLE
                       BUTTON('...'),AT(139,86,12,12),USE(?CallLookup:2)
                       BUTTON('&Delete'),AT(390,31,45,14),USE(?Delete:5),HIDE
                       ENTRY(@s30),AT(184,88,132,10),USE(JDok:Nama_Dokter),SKIP,TRN,FONT(,12,COLOR:Navy,FONT:bold),MSG('Nama Dokter'),TIP('Nama Dokter'),UPR
                       PROMPT('Pembeli Lgs :'),AT(3,101),USE(?JTra:NamaJawab:Prompt),FONT(,12,,FONT:bold)
                       ENTRY(@s40),AT(56,102,81,10),USE(JTra:NamaJawab),SKIP,TRN,FONT(,12,COLOR:Red,FONT:bold)
                       PROMPT('Alamat :'),AT(146,102),USE(?JTra:AlamatJawab:Prompt),FONT(,12,,FONT:bold)
                       ENTRY(@s50),AT(184,102,110,10),USE(JTra:AlamatJawab),SKIP,TRN,FONT(,14,COLOR:Red,FONT:bold)
                       PROMPT('No Paket:'),AT(297,102),USE(?APH:NoPaket:Prompt)
                       ENTRY(@n-7),AT(329,102,18,10),USE(APH:NoPaket),DISABLE,RIGHT(1)
                       BUTTON('...'),AT(351,101,12,12),USE(?CallLookup)
                       LIST,AT(7,116,435,85),USE(?Browse:4),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('47L(2)|FM~Kode Barang~L(0)@s10@163L(2)|M~Nama Obat~C(0)@s40@65L(2)|M~Keterangan~' &|
   'C(0)@s50@17L(2)|M~KTT~C(0)@n3@27L|M~Racik~C@n2@52R(2)|M~Jumlah~C(0)@n-12.2@99L(2' &|
   ')|M~Nama Obat Racik~C(0)@s40@53R(2)|M~Total~C(0)@n-13.2@60R(2)|M~Diskon~C(0)@n-1' &|
   '5.2@63L(2)|FM~N 0 tran~L(0)@s15@28R(2)|FM~Urut~L(0)@n-7@44D(2)|FM~Harga Dasar~L(' &|
   '0)@n11.2@64D(2)|FM~total dtg~L(0)@N-16.2@'),FROM(Queue:Browse:4)
                       BUTTON('&OK (End)'),AT(162,205,45,35),USE(?OK),FONT('Times New Roman',10,,),KEY(EndKey),ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(209,205,45,35),USE(?Cancel),FONT('Times New Roman',12,,),ICON(ICON:Cross)
                       PROMPT('Sub Total'),AT(285,206),USE(?Prompt10),FONT('Times New Roman',12,COLOR:Black,)
                       ENTRY(@n-17.2),AT(345,206,97,14),USE(LOC::TOTAL),SKIP,RIGHT(1),FONT('Arial',12,,FONT:bold),READONLY
                       PROMPT('Diskon :'),AT(285,224),USE(?Prompt8),FONT('Times New Roman',12,COLOR:Black,)
                       ENTRY(@n-17.2),AT(345,224,97,14),USE(discount),SKIP,RIGHT(1),FONT('Arial',12,,FONT:bold),READONLY
                       PROMPT('No Transaksi:'),AT(7,229),USE(?APH:N0_tran:Prompt),FONT('Times New Roman',12,,FONT:bold)
                       ENTRY(@s15),AT(71,229,77,13),USE(APH:N0_tran),DISABLE,FONT('Arial',12,COLOR:Black,FONT:bold),MSG('nomor transaksi'),TIP('nomor transaksi')
                       LINE,AT(279,245,163,0),USE(?Line1),COLOR(COLOR:Black),LINEWIDTH(2)
                       BUTTON('&Edit [Ctrl]'),AT(5,249,144,18),USE(?Change:5),DISABLE,FONT(,,COLOR:Blue,FONT:bold),KEY(529)
                       BUTTON('Pembulatan [-]'),AT(161,249,93,18),USE(?Button9),FONT('Times New Roman',10,COLOR:Black,FONT:regular),KEY(MinusKey)
                       ENTRY(@n-17.2),AT(345,251,97,14),USE(APH:Biaya),SKIP,RIGHT(1),FONT('Arial',12,,FONT:bold),MSG('Total Biaya Pembelian'),TIP('Total Biaya Pembelian'),READONLY
                       PROMPT('Total :'),AT(285,252),USE(?APH:Biaya:Prompt),FONT('Times New Roman',14,,FONT:bold)
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
    SET(BRW4::View:Browse)
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
         !NOMU:Urut =3
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
        !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
        NOM1:No_urut=3
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
           !NOMU:Urut =3
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
   !NOMU:Urut =3
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   !NOMU:Nomor=APH:N0_tran
   !access:nomoruse.fetch(NOMU:PrimaryKey)
   !delete(nomoruse)

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
  select(?loc:nomor)
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_UpdateRawatJalan1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?loc:nomor
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  GLO:HARGA_DASAR=0
  glo:nonota = ''
  glo:reseprajal1=0
  glo:reseprajal2=0
  glo:reseprajal3=0
  glo:reseprajal4=0
  glo:reseprajal5=0
  glo:totalreseprajal1=0
  glo:totalreseprajal2=0
  glo:totalreseprajal3=0
  glo:totalreseprajal4=0
  glo:totalreseprajal5=0
  glo:ktt=0
  APH:Nomor_mr = 99999999
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APH:Record,History::APH:Record)
  SELF.AddHistoryField(?APH:Asal,8)
  SELF.AddHistoryField(?APH:Kode_Apotik,10)
  SELF.AddHistoryField(?APH:Tanggal,2)
  SELF.AddHistoryField(?APH:NomorEPresribing,23)
  SELF.AddHistoryField(?APH:Nomor_mr:2,1)
  SELF.AddHistoryField(?APH:Kontrak,14)
  SELF.AddHistoryField(?APH:dokter,16)
  SELF.AddHistoryField(?APH:NoPaket,20)
  SELF.AddHistoryField(?APH:N0_tran,4)
  SELF.AddHistoryField(?APH:Biaya,3)
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
  Relate:APDTRANS.Open                                     ! File APEPRED used by this procedure, so make sure it's RelationManager is open
  Relate:APDTRANSDet.Open                                  ! File APEPRED used by this procedure, so make sure it's RelationManager is open
  Relate:APEPRED.Open                                      ! File APEPRED used by this procedure, so make sure it's RelationManager is open
  Relate:APEPREH.Open                                      ! File APEPRED used by this procedure, so make sure it's RelationManager is open
  Relate:Ano_pakai.Open                                    ! File APEPRED used by this procedure, so make sure it's RelationManager is open
  Relate:ApPaketD.SetOpenRelated()
  Relate:ApPaketD.Open                                     ! File APEPRED used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket.Open                                     ! File APEPRED used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql.Open                                      ! File APEPRED used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql2.Open                                     ! File APEPRED used by this procedure, so make sure it's RelationManager is open
  Relate:IAP_SET.Open                                      ! File APEPRED used by this procedure, so make sure it's RelationManager is open
  Relate:JHBILLING.Open                                    ! File APEPRED used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File APEPRED used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_Batal.Open                                  ! File APEPRED used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File APEPRED used by this procedure, so make sure it's RelationManager is open
  Relate:SMPegawai.SetOpenRelated()
  Relate:SMPegawai.Open                                    ! File APEPRED used by this procedure, so make sure it's RelationManager is open
  Relate:TBTransResepDokterDetail.Open                     ! File APEPRED used by this procedure, so make sure it's RelationManager is open
  Relate:TBTransResepDokterEtiket.Open                     ! File APEPRED used by this procedure, so make sure it's RelationManager is open
  Relate:TBTransResepDokterHeader.Open                     ! File APEPRED used by this procedure, so make sure it's RelationManager is open
  Relate:TBTransResepObatCampur.Open                       ! File APEPRED used by this procedure, so make sure it's RelationManager is open
  Relate:Tbstawal.Open                                     ! File APEPRED used by this procedure, so make sure it's RelationManager is open
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
     select(?loc:nomor)
  end
  open(view::jtrans)
  ?Browse:4{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW4.Q &= Queue:Browse:4
  BRW4::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon APD:N0_tran for sort order 1
  BRW4.AddSortOrder(BRW4::Sort0:StepClass,APD:transjum_apdtrans_fk) ! Add the sort order for APD:transjum_apdtrans_fk for sort order 1
  BRW4.AddRange(APD:N0_tran,Relate:APDTRANS,Relate:APHTRANS) ! Add file relationship range limit for sort order 1
  BRW4.AppendOrder('apd:n0_tran,apd:n0_tran')              ! Append an additional sort order
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
  BRW4.AddField(APD:Jum1,BRW4.Q.APD:Jum1)                  ! Field APD:Jum1 is a hot field or requires assignment from browse
  BRW4.AddField(APD:Harga_Dasar,BRW4.Q.APD:Harga_Dasar)    ! Field APD:Harga_Dasar is a hot field or requires assignment from browse
  BRW4.AddField(APD:total_dtg,BRW4.Q.APD:total_dtg)        ! Field APD:total_dtg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Kode_brg,BRW4.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_UpdateRawatJalan1',QuickWindow)       ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW4.AskProcedure = 5
  SELF.AddItem(ToolbarForm)
  BRW4.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  if (self.request=1 and self.response=2) or (self.request=3 and self.response=1) then
  !   message('aha')
     do batal_nomor
     DO BATAL_D_DUA
     DO BATAL_D_UTAMA
  end
  if self.request=1 and self.response=1 then
     do hapus_nomor_use
  end
  
  glo:reseprajal1=0
  glo:reseprajal2=0
  glo:reseprajal3=0
  glo:reseprajal4=0
  glo:reseprajal5=0
  glo:totalreseprajal1=0
  glo:totalreseprajal2=0
  glo:totalreseprajal3=0
  glo:totalreseprajal4=0
  glo:totalreseprajal5=0
  glo:ktt=0
  close(view::jtrans)
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:APDTRANSDet.Close
    Relate:APEPRED.Close
    Relate:APEPREH.Close
    Relate:Ano_pakai.Close
    Relate:ApPaketD.Close
    Relate:Apetiket.Close
    Relate:FileSql.Close
    Relate:FileSql2.Close
    Relate:IAP_SET.Close
    Relate:JHBILLING.Close
    Relate:NomorUse.Close
    Relate:Nomor_Batal.Close
    Relate:Nomor_SKR.Close
    Relate:SMPegawai.Close
    Relate:TBTransResepDokterDetail.Close
    Relate:TBTransResepDokterEtiket.Close
    Relate:TBTransResepDokterHeader.Close
    Relate:TBTransResepObatCampur.Close
    Relate:Tbstawal.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_UpdateRawatJalan1',QuickWindow)    ! Save window data to non-volatile store
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
  APE3:N0_tran = APH:NomorEPresribing                      ! Assign linking field value
  Access:APEPREH.Fetch(APE3:by_transaksi)
  APP2:No = APH:NoPaket                                    ! Assign linking field value
  Access:ApPaketH.Fetch(APP2:PrimaryKey)
  JTra:No_Nota = APH:NoNota                                ! Assign linking field value
  Access:JTransaksi.Fetch(JTra:KeyNoNota)
  JDok:Kode_Dokter = APH:dokter                            ! Assign linking field value
  Access:JDokter.Fetch(JDok:KeyKodeDokter)
  JKon:KODE_KTR = APH:Kontrak                              ! Assign linking field value
  Access:JKontrak.Fetch(JKon:KeyKodeKtr)
  PEGA:Nik = APH:NIP                                       ! Assign linking field value
  Access:SMPegawai.Fetch(PEGA:Pkey)
  APH:Biaya = (LOC::TOTAL - discount)
  APH:biaya_dtg = LOC::TOTAL_DTG
  APH:Harga_Dasar = GLO:HARGA_DASAR
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
      selectepre2
      SelectDokter
      selectpaketobat
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
      !     ?Button10{PROP:DISABLE}=false
      !     ?APH:NoNota{PROP:DISABLE}=false
      !     ?CallLookup:3{PROP:DISABLE}=false
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
      !     ?APH:NIP{PROP:DISABLE}=TRUE
      !     ?Button10{PROP:DISABLE}=true
      !     ?APH:NoNota{PROP:DISABLE}=false
      !     ?CallLookup:3{PROP:DISABLE}=false
           ?Insert:5{PROP:DISABLE}=false
           display
        OF 3
           PEGA:Nik=''
           access:smpegawai.fetch(PEGA:Pkey)
           APH:NIP=''
      !     ?APH:NIP{PROP:DISABLE}=TRUE
           ?APH:Kontrak{PROP:DISABLE}=false
           ?Button11{PROP:DISABLE}=false
      !     ?Button10{PROP:DISABLE}=true
      !     ?APH:NoNota{PROP:DISABLE}=false
      !     ?CallLookup:3{PROP:DISABLE}=false
           ?Insert:5{PROP:DISABLE}=false
           display
           !select(?Button11)
        end
        APH:cara_bayar=status
      end
      end
    OF ?CallLookup:2
      !message(APH:NomorEPresribing)
      !apepred{prop:sql}='select * from dba.apepred where N0_tran='&APH:NomorEPresribing
      !loop
      !   if access:apepred.next()<>level:benign then break.
      !   !message('ada')
      !   APD:N0_tran        =APH:N0_tran
      !   APD:Kode_brg       =APE4:Kode_brg
      !   APD:Jumlah         =APE4:Jumlah
      !   APD:Camp           =APE4:Camp
      !   APD:Diskon         =0
      !   APD:Jum1           =0
      !   APD:Jum2           =0
      !
      !   GBAR:Kode_brg      =APE4:Kode_brg
      !   access:gbarang.fetch(GBAR:KeyKodeBrg)
      !
      !   GSGD:Kode_brg      =APE4:Kode_brg
      !   access:gstockgdg.fetch(GSGD:KeyKodeBrg)
      !
      !   GSTO:Kode_Apotik = GL_entryapotik
      !   GSTO:Kode_Barang = APE4:Kode_brg
      !   GET(GStokaptk,GSTO:KeyBarang)
      !   IF APE4:Jumlah > GSTO:Saldo
      !      MESSAGE(clip(GBAR:Nama_Brg)&' jumlah stok tinggal '&GSTO:Saldo)
      !      APD:Jumlah=0
      !      APD:Total = 0
      !   else
      !      if GBAR:StatusGen=1 or GBAR:StatusGen=3 then
      !          if GSGD:Harga_Beli > 0 AND GSGD:Harga_Beli < 501  then
      !            APD:Total = GSGD:Harga_Beli * APD:Jumlah * 3.5
      !          elsif GSGD:Harga_Beli > 500 AND GSGD:Harga_Beli < 1001  then
      !            APD:Total = GSGD:Harga_Beli * APD:Jumlah * 2
      !          elsif GSGD:Harga_Beli > 1000  then
      !            APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.5
      !          end
      !      else
      !          APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.35
      !      end
      !      APD:Harga_Dasar = GSGD:Harga_Beli
      !      access:apdtrans.insert()
      !   end
      !END
      !brw4.resetsort(1)
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
      
      
      JHB:NOMOR=loc:nomor
      if access:jhbilling.fetch(JHB:KNOMOR)=level:benign then
         !message(JHB:TUTUP)
         if JHB:TUTUP=1 then
            message('Nota sudah ditutup !!!')
            cycle
         end
      else
         message('Nota tidak ada !!!')
         cycle
      end
      
      if APH:NoNota='' then
         message('No nota harus terisi !!!')
         cycle
      end
      
      if glo:reseprajal1 = 1 then
          if glo:totalreseprajal1 < 2 then
              message('Mohon masukan bahan obat untuk Racikan Obat ke-1')
              cycle
          end
      end
      
      if glo:reseprajal2 = 1 then
          if glo:totalreseprajal2 < 2 then
              message('Mohon masukan bahan obat untuk Racikan Obat ke-2')
              cycle
          end
      end
      
      if glo:reseprajal3 = 1 then
          if glo:totalreseprajal3 < 2 then
              message('Mohon masukan bahan obat untuk Racikan Obat ke-3')
              cycle
          end
      end
      
      if glo:reseprajal4 = 1 then
          if glo:totalreseprajal4 < 2 then
              message('Mohon masukan bahan obat untuk Racikan Obat ke-4')
              cycle
          end
      end
      
      if glo:reseprajal5 = 1 then
          if glo:totalreseprajal5 < 2 then
              message('Mohon masukan bahan obat untuk Racikan Obat ke-5')
              cycle
          end
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
      APH:shift       =vg_shift_apotik
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
         !APH:Tanggal = TODAY()
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
    OF ?LOC::TOTAL
      select(?OK)
    OF ?discount
      if vl_sudah=0
      IF DISCOUNT > 0 AND masuk_disc = 0
          masuk_disc = 1
      END
      select(?OK)
      end
    OF ?APH:Biaya
      select(?OK)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?loc:nomor
      if vl_sudah=0
         !if loc:nomor<>'' then
         if loc:tgl=0 then
            loc:tgl=today()
         end
         !khusus untuk nomor pake jjjjjjjjj
         if loc:nomor<>'' then
            if numeric(loc:nomor)=1 then
              ! loc:ang_string=numeric(loc:Trans_lokal) 
               loc:temth2=year(loc:tgl)
               loc:bl2=month(loc:tgl)
               loc:bls2=format(loc:bl2,@p##p)
               loc:th22=sub(loc:temth2,3,2)
               loc:th32=format(loc:th22,@p##p)
               loc:nums2=format(loc:nomor,@p#####p)
               loc:nomor=clip('J')&''&clip(loc:th32)&''&clip(loc:bls2)&''&clip(loc:nums2)
            end
            JTra:No_Nota=loc:nomor
            GET(jtRANSAKSI,JTra:KeyNoNota)
            IF NOT ERRORCODE() THEN
            END
            if JTra:StatusBatal=1 then
               message('Registrasi sudah batal !!!')
               loc:nomor=''
               select(?loc:nomor)
               cycle
            end
            !message(loc:nomor)
            JHB:NOMOR=loc:nomor
            if access:jhbilling.fetch(JHB:KNOMOR)=level:benign then
               !message(JHB:TUTUP)
               if JHB:TUTUP=1 then
                  message('Nota sudah ditutup !!!')
                  loc:nomor=''
                  select(?loc:nomor)
                  cycle
               else
                  APH:NoNota=loc:nomor
                  DISPLAY
               end
            else
               message('Nota sudah ditutup !!!')
               loc:nomor=''
               select(?loc:nomor)
               cycle
            end
            APH:NoNota=loc:nomor
            
            APH:Nomor_mr=JTra:Nomor_Mr
            display
      
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
      !              ?APH:NIP{PROP:DISABLE}=true
                    ?APH:Kontrak{PROP:DISABLE}=TRUE
                    ?Button11{PROP:DISABLE}=TRUE
      !              ?Button10{PROP:DISABLE}=true
      !              ?APH:NoNota{PROP:DISABLE}=true
      !              ?CallLookup:3{PROP:DISABLE}=false
                    CLEAR (JPas:Nama)
                    CLEAR (JPas:Alamat)
                    DISPLAY
                    !SELECT(?APH:Nomor_mr)
                ELSE
                    ?BROWSE:4{PROP:DISABLE}=0
                    ?Insert:5{PROP:DISABLE}=0
                    glo::campur=0
                    !message('select kode_transaksi,lamabaru,kode_dokter,kontraktor,kode_poli,no_nota,nip from dba.jtransaksi where statusBatal<<>1 and nomor_mr='&aph:nomor_mr&' and tanggal='''&format(today(),@d10)&''' order by no_nota')
                    !(statusBatal<<>1 or statusBatal is null) and 
                    !view::jtrans{prop:sql}='select kode_transaksi,lamabaru,kode_dokter,kontraktor,kode_poli,no_nota,nip from dba.jtransaksi where (statusBatal<<>1 or statusBatal is null) and No_Nota='''&clip(loc:nomor)&''' and tanggal='''&format(today(),@d10)&''' order by no_nota desc'
                    view::jtrans{prop:sql}='select kode_transaksi,lamabaru,kode_dokter,kontraktor,kode_poli,no_nota,nip from dba.jtransaksi where (statusBatal<<>1 or statusBatal is null) and No_Nota='''&clip(loc:nomor)&''' order by no_nota desc'
                    !if errorcode() then message(error()).
                    next(view::jtrans)
                    if not errorcode() then
                       enable(?OK)
                       !message(FIL1:String1&' '&FIL1:String2&' '&FIL1:String3)
                       JPas:Nomor_mr=aph:nomor_mr
                       access:jpasien.fetch(JPas:KeyNomorMr)
                       JDok:Kode_Dokter=FIL1:String1
                       access:jdokter.fetch(JDok:KeyKodeDokter)
                       APH:Asal     =FIL1:String3
                       APH:dokter   =FIL1:String1
                       !PH:NoNota   =
                       display
                       !message(JTra:Kode_Transaksi)
                       !message(FIL1:Byte1&' '&FIL1:String2)
                       if FIL1:Byte1=3 then
                          JKon:KODE_KTR=FIL1:String2
                          access:jkontrak.fetch(JKon:KeyKodeKtr)
                          !message(JKon:NAMA_KTR)
                          APH:Kontrak =FIL1:String2
                          APH:NIP      =''
                          PEGA:Nik         =''
                          status=3
                          APH:NoNota    =FIL1:String4
                          access:smpegawai.fetch(PEGA:Pkey)
                          !?Button11{PROP:DISABLE}=false
      !                    ?Button10{PROP:DISABLE}=true
      !                    ?APH:NIP{PROP:DISABLE}=true
                          !?APH:Kontrak{PROP:DISABLE}=false
                          !?APH:NoNota{PROP:DISABLE}=false
                          !?CallLookup:3{PROP:DISABLE}=false
      !                 elsif FIL1:Byte1=1 then
      !                    JKon:KODE_KTR =''
      !                    access:jkontrak.fetch(JKon:KeyKodeKtr)
      !                    APH:Kontrak   =''
      !                    !APH:NoNota    =''
      !                    PEGA:Nik      =FIL1:String5
      !                    access:smpegawai.fetch(PEGA:Pkey)
      !                    APH:NIP       =FIL1:String5
      !                    status=1
      !                    ?Button11{PROP:DISABLE}=true
      !                    ?Button10{PROP:DISABLE}=false
      !                    !?APH:NIP{PROP:DISABLE}=false
      !                    ?APH:Kontrak{PROP:DISABLE}=TRUE
      !                    ?APH:NoNota{PROP:DISABLE}=true
      !                    ?CallLookup:3{PROP:DISABLE}=false
                       else
                          JKon:KODE_KTR =''
                          access:jkontrak.fetch(JKon:KeyKodeKtr)
                          PEGA:Nik      =''
                          access:smpegawai.fetch(PEGA:Pkey)
                          APH:NIP       =''
                          APH:Kontrak   =''
                          !APH:NoNota    =''
                          status=2
      !                    ?Button10{PROP:DISABLE}=true
                          ?Button11{PROP:DISABLE}=true
      !                    ?APH:NIP{PROP:DISABLE}=true
                          ?APH:Kontrak{PROP:DISABLE}=TRUE
      !                    ?APH:NoNota{PROP:DISABLE}=true
                          !?CallLookup:3{PROP:DISABLE}=false
                       end
                       APH:LamaBaru  =FIL1:Byte2
                       APH:cara_bayar=FIL1:Byte1
                       status=FIL1:Byte1
                       display
                    else
                       message('Nota sudah lewat hari !')
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
      !                 ?APH:NIP{PROP:DISABLE}=true
                       ?APH:Kontrak{PROP:DISABLE}=TRUE
      !                 ?APH:NoNota{PROP:DISABLE}=true
      !                 ?Button10{PROP:DISABLE}=true
                       ?Button11{PROP:DISABLE}=true
      !                 ?CallLookup:3{PROP:DISABLE}=false
                    end
                END
            ELSE
                APH:Nomor_mr = 99999999
            END
         end
         glo:nonota=loc:nomor
         display
      END
    OF ?Insert:5
      ThisWindow.Update
      if vl_sudah=0
      disable(?loc:nomor)
      !disable(?calllookup:3)
      disable(?APH:Kontrak)
      disable(?Button11)
      !disable(?Button20)
      disable(?JTra:NamaJawab)
      disable(?JTra:AlamatJawab)
      display
      end
      
      !glo:jumobat=0
      set(BRW4::View:Browse)
      loop
         next(BRW4::View:Browse)
         if errorcode() then break.
         glo:jumobat+=1
      end
      !message(glo:jumobat)
    OF ?APH:NomorEPresribing
      IF APH:NomorEPresribing OR ?APH:NomorEPresribing{Prop:Req}
        APE3:N0_tran = APH:NomorEPresribing
        IF Access:APEPREH.TryFetch(APE3:by_transaksi)
          IF SELF.Run(2,SelectRecord) = RequestCompleted
            APH:NomorEPresribing = APE3:N0_tran
          ELSE
            SELECT(?APH:NomorEPresribing)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
      !message(APH:NomorEPresribing)
      !apepred{prop:sql}='select * from dba.apepred where N0_tran='&APH:NomorEPresribing
      !loop
      !   if access:apepred.next()<>level:benign then break.
      !   !message('ada')
      !   APD:N0_tran        =APH:N0_tran
      !   APD:Kode_brg       =APE4:Kode_brg
      !   APD:Jumlah         =APE4:Jumlah
      !   APD:Camp           =APE4:Camp
      !   APD:Diskon         =0
      !   APD:Jum1           =0
      !   APD:Jum2           =0
      !
      !   GBAR:Kode_brg      =APE4:Kode_brg
      !   access:gbarang.fetch(GBAR:KeyKodeBrg)
      !
      !   GSGD:Kode_brg      =APE4:Kode_brg
      !   access:gstockgdg.fetch(GSGD:KeyKodeBrg)
      !
      !   GSTO:Kode_Apotik = GL_entryapotik
      !   GSTO:Kode_Barang = APE4:Kode_brg
      !   GET(GStokaptk,GSTO:KeyBarang)
      !   IF APE4:Jumlah > GSTO:Saldo
      !      MESSAGE(clip(GBAR:Nama_Brg)&' jumlah stok tinggal '&GSTO:Saldo)
      !      APD:Jumlah=0
      !      APD:Total = 0
      !   else
      !      if GBAR:StatusGen=1 or GBAR:StatusGen=3 then
      !          if GSGD:Harga_Beli > 0 AND GSGD:Harga_Beli < 501  then
      !            APD:Total = GSGD:Harga_Beli * APD:Jumlah * 3.5
      !          elsif GSGD:Harga_Beli > 500 AND GSGD:Harga_Beli < 1001  then
      !            APD:Total = GSGD:Harga_Beli * APD:Jumlah * 2
      !          elsif GSGD:Harga_Beli > 1000  then
      !            APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.5
      !          end
      !      else
      !          APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.35
      !      end
      !      APD:Harga_Dasar = GSGD:Harga_Beli
      !      access:apdtrans.insert()
      !   end
      !END
      !brw4.resetsort(1)
    OF ?CallLookup:3
      ThisWindow.Update
      !if vl_sudah=0
      !glo:mr=APH:Nomor_mr
      !display
      !globalrequest=selectrecord
      !if GLO:LEVEL>1 then
      !else
      !end
      !end
      !if vl_sudah=0
      !   !if JTra:Kontraktor='' then
      !   !   message('Bukan pasien kontraktor !!!')
      !   !   aph:nonota=''
      !   !else
      !      APH:NoNota=JTra:No_Nota
      !      loc:nomor=JTra:No_Nota
      !      APH:dokter=JTra:Kode_dokter
      !      status=JTra:Kode_Transaksi
      !      display
      !      !message(APH:NoNota&' '&JTra:No_Nota)
      !      JKon:KODE_KTR=JTra:Kontraktor
      !      access:jkontrak.fetch(JKon:KeyKodeKtr)
      !      APH:Kontrak=JTra:Kontraktor
      !      APH:Asal=JTra:Kode_poli
      !      if JTra:No_Nota<>'' then
      !      enable(?Insert:5)
      !      enable(?Browse:4)
      !      end
      !   !end
      !   !f APH:NoNota<>'' and APH:Kontrak<>'' then
      !   !  ?insert:5{prop:disable}=false
      !   !lse
      !   !  ?insert:5{prop:disable}=true
      !   !nd
      !   display
      !end
      !
      APE3:N0_tran = APH:NomorEPresribing
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        APH:NomorEPresribing = APE3:N0_tran
      END
      ThisWindow.Reset(1)
      !message(APH:NomorEPresribing)
      !apepred{prop:sql}='select * from dba.apepred where N0_tran='&APH:NomorEPresribing
      apepred{prop:sql}='select * from dba.apepred where n0_tran = '''&APH:NomorEPresribing&''''
      loop
         if errorcode() then
         message(error())
         break.
         if access:apepred.next()<>level:benign then break.
         !message('ada')
         APD:N0_tran        =APH:N0_tran
         APD:Kode_brg       =APE4:Kode_brg
         APD:Jumlah         =APE4:Jumlah
         APD:Camp           =APE4:Camp
         APD:Diskon         =0
         APD:Jum1           =0
         APD:Jum2           =0
      
         GBAR:Kode_brg      =APE4:Kode_brg
         access:gbarang.fetch(GBAR:KeyKodeBrg)
      
         GSGD:Kode_brg      =APE4:Kode_brg
         access:gstockgdg.fetch(GSGD:KeyKodeBrg)
      
         GSTO:Kode_Apotik = GL_entryapotik
         GSTO:Kode_Barang = APE4:Kode_brg
         GET(GStokaptk,GSTO:KeyBarang)
         IF APE4:Jumlah > GSTO:Saldo
            MESSAGE(clip(GBAR:Nama_Brg)&' jumlah stok tinggal '&GSTO:Saldo)
            APD:Jumlah=0
            APD:Total = 0
         else
      !      if GBAR:StatusGen=1 or GBAR:StatusGen=3 then
      !          if GSGD:Harga_Beli > 0 AND GSGD:Harga_Beli < 501  then
      !            APD:Total = GSGD:Harga_Beli * APD:Jumlah * 3.5
      !          elsif GSGD:Harga_Beli > 500 AND GSGD:Harga_Beli < 1001  then
      !            APD:Total = GSGD:Harga_Beli * APD:Jumlah * 2
      !          elsif GSGD:Harga_Beli > 1000  then
      !            APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.5
      !          end
      !      else
      !          APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.35
      !      end
              if status=2 then
                  !Update penambahan tuslah 1500 (3 Desember 2018)
                  !Update perubahan margin pasien umum menjadi 1.25 (31 Desember 2018)
                  !Update penambahan diskon dari gudang saat penjualan (31 Desember 2018)
                  APD:Total=((((GSGD:Harga_Beli-(GSGD:Discount/100*GSGD:Harga_Beli))*1.25)*1.1)*APD:Jumlah)+1500
                  APD:total_dtg=0
               elsif status=3 then
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
    OF ?APH:dokter
      IF APH:dokter OR ?APH:dokter{Prop:Req}
        JDok:Kode_Dokter = APH:dokter
        IF Access:JDokter.TryFetch(JDok:KeyKodeDokter)
          IF SELF.Run(3,SelectRecord) = RequestCompleted
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
      IF SELF.Run(3,SelectRecord) = RequestCompleted
        APH:dokter = JDok:Kode_Dokter
      END
      ThisWindow.Reset(1)
    OF ?APH:NoPaket
      IF APH:NoPaket OR ?APH:NoPaket{Prop:Req}
        APP2:No = APH:NoPaket
        IF Access:ApPaketH.TryFetch(APP2:PrimaryKey)
          IF SELF.Run(4,SelectRecord) = RequestCompleted
            APH:NoPaket = APP2:No
          ELSE
            SELECT(?APH:NoPaket)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      APP2:No = APH:NoPaket
      IF SELF.Run(4,SelectRecord) = RequestCompleted
        APH:NoPaket = APP2:No
      END
      ThisWindow.Reset(1)
      appaketd{prop:sql}='select * from dba.appaketd where No='&APH:NoPaket
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
      !      if GBAR:StatusGen=1 or GBAR:StatusGen=3 then
      !          if GSGD:Harga_Beli > 0 AND GSGD:Harga_Beli < 501  then
      !            APD:Total = GSGD:Harga_Beli * APD:Jumlah * 3.5
      !          elsif GSGD:Harga_Beli > 500 AND GSGD:Harga_Beli < 1001  then
      !            APD:Total = GSGD:Harga_Beli * APD:Jumlah * 2
      !          elsif GSGD:Harga_Beli > 1000  then
      !            APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.5
      !          end
      !      else
      !          APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.35
      !      end
              if status=2 then
                  !Update penambahan tuslah 1500 (3 Desember 2018)
                  !Update perubahan margin pasien umum menjadi 1.25 (31 Desember 2018)
                  APD:Total=(((GSGD:Harga_Beli*1.25)*1.1)*APD:Jumlah)+1500
                  APD:total_dtg=0
               elsif status=3 then
                  if sub(APD:Kode_brg,1,1)='B'
                      !Update penambahan tuslah 1500 (3 Desember 2018)
                      APD:Total=(((GSGD:Harga_Beli*1.215)*1.1)*APD:Jumlah)+1500
                      APD:total_dtg=APD:Total
                  else
                      !Update penambahan tuslah 1500 (3 Desember 2018)
                      !Update perubahan margin pasien kontraktor non bpjs menjadi 1.25 (13 Maret 2019)
                      APD:Total=(((GSGD:Harga_Beli*1.25)*1.1)*APD:Jumlah)+1500
                      APD:total_dtg=APD:Total
                  end
               end
            APD:Harga_Dasar = GSGD:Harga_Beli
            access:apdtrans.insert()
         end
      END
      brw4.resetsort(1)
    OF ?OK
      ThisWindow.Update
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?Cancel
      ThisWindow.Update
      do BATAL_D_DUA
      do BATAL_D_UTAMA
    OF ?discount
      ThisWindow.Reset(1)
    OF ?Button9
      ThisWindow.Update
      !if vl_sudah=0
      !   IF LOC::TOTAL <> 0
      !      !Pembulatan
      !      vl_hasil=0
      !      vl_real=APH:Biaya
      !      vl_seribu=round(APH:Biaya,1000)
      !      if vl_seribu<vl_real then
      !         vl_hasil=vl_seribu+500
      !      else
      !         vl_hasil=vl_seribu
      !      end
      !      APH:Biaya = vl_hasil
      !      IF discount <>0
      !         loc::copy_total = APH:Biaya + discount
      !         masuk_disc = 1
      !         ?discount{PROP:READONLY}=FALSE
      !      ELSE
      !         loc::copy_total = APH:Biaya
      !      END
      !!      message(vl_hasil&' '&APD:Total&' '&loc::copy_total&' '&LOC::TOTAL)
      !!      message(APD:Total + loc::copy_total - LOC::TOTAL)
      !      APD:Total = APD:Total + loc::copy_total - LOC::TOTAL
      !      PUT(APDTRANS)
      !      LOC::TOTAL = loc::copy_total
      !      DISPLAY
      !      BRW4.RESETSORT(1)
      !   END
      !end
      if vl_sudah=0
         IF LOC::TOTAL <> 0
             !vl_round = round(APH:Biaya)
             !Pembulatan
             vl_pembulatandtg=0
             vl_selisih=0
             vl_hasil=0
             vl_real=APH:Biaya
             vl_seribu=round(APH:Biaya,1000)
             !message(vl_seribu)
             if vl_seribu<vl_real then
                vl_selisih=vl_real-vl_seribu
                !message(vl_selisih)
                if vl_selisih>500 then
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
             
      !       SET( BRW4::View:Browse)
      !           LOOP
      !               NEXT(BRW4::View:Browse)
                     !IF APD:Camp = 0 AND APD:N0_tran = APH:N0_tran
      !                   message(vl_hasil&' '&APD:Total&' '&loc::copy_total&' '&LOC::TOTAL)
      !                   message(APD:Total + loc::copy_total - LOC::TOTAL)
                         vl_pembulatandtg=APD:Total
                         APD:Total = APD:Total + loc::copy_total - LOC::TOTAL
                         if vl_pembulatandtg=APD:total_dtg then
                              APD:total_dtg=APD:Total
                         end
                         PUT(APDTRANS)
      !                   BREAK
                     !END
      !               IF ERRORCODE() > 0  OR  APD:N0_tran <> APH:N0_tran
      !                   SET( BRW4::View:Browse)
      !                   LOOP
      !                       NEXT( BRW4::View:Browse )
      !                       IF APD:Kode_brg = '_Campur'
      !                           APD:Total = APD:Total + loc::copy_total - LOC::TOTAL
      !                           PUT(APDTRANS)
      !                           SET(APDTcam)
      !                           APD1:N0_tran = APH:N0_tran
      !                           APD1:Camp = APD:Camp
      !                           SET (APD1:by_tranno,APD1:by_tranno)
      !                           LOOP
      !                               NEXT( APDTcam )
      !                               IF APD1:Kode_brg = '_Biaya'
      !                                   APD1:Total = APD1:Total  + loc::copy_total - LOC::TOTAL
      !                                   PUT(APDTcam)
      !                                   BREAK
      !                               END
      !                           END
      !
      !                           BREAK
      !                       END
      !                   END
      !                   BREAK
      !               END
                     
      !           END
                 LOC::TOTAL = loc::copy_total
      !       DISPLAY
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
      select(?cancel)
      presskey( 13)
    OF EVENT:CloseWindow
      IF SELF.RESPONSE = 1 THEN
         !PrintTransRawatJalan
      END
    OF EVENT:Timer
      if vl_sudah=0 and glo:ktt=0
         IF LOC::TOTAL = 0
             ?OK{PROP:DISABLE}=1
         ELSE
             ?OK{PROP:DISABLE}=0
         END
      end
      
      APH:NomorEPresribing = glo:noepre
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
  APH:biaya_dtg = LOC::TOTAL_DTG
  APH:Harga_Dasar = GLO:HARGA_DASAR


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
  !
  !set(BRW4::View:Browse)
  !next(BRW4::View:Browse)
  !if not(errorcode()) then
  !   ?Button10{PROP:DISABLE}=true
  !   ?Button11{PROP:DISABLE}=true
  !   ?APH:Kontrak{PROP:DISABLE}=TRUE
  !   ?APH:NoNota{PROP:DISABLE}=true
  !   ?CallLookup:3{PROP:DISABLE}=true
  !else
  !   if status=3 then
  !      ?Button11{PROP:DISABLE}=false
  !      ?Button10{PROP:DISABLE}=true
  !      ?APH:Kontrak{PROP:DISABLE}=false
  !      ?APH:NoNota{PROP:DISABLE}=false
  !      ?CallLookup:3{PROP:DISABLE}=false
  !   elsif status=1 then
  !      ?Button11{PROP:DISABLE}=true
  !      ?Button10{PROP:DISABLE}=false
  !      ?APH:Kontrak{PROP:DISABLE}=TRUE
  !      ?APH:NoNota{PROP:DISABLE}=true
  !      ?CallLookup:3{PROP:DISABLE}=true
  !   else
  !      ?Button10{PROP:DISABLE}=true
  !      ?Button11{PROP:DISABLE}=true
  !      ?APH:Kontrak{PROP:DISABLE}=TRUE
  !      ?APH:NoNota{PROP:DISABLE}=true
  !      ?CallLookup:3{PROP:DISABLE}=true
  !   end
  !end
  !
  disable(?status)


BRW4.ResetFromView PROCEDURE

LOC::TOTAL:Sum       REAL                                  ! Sum variable for browse totals
discount:Sum         REAL                                  ! Sum variable for browse totals
GLO:HARGA_DASAR:Sum  REAL                                  ! Sum variable for browse totals
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
    GLO:HARGA_DASAR:Sum += APD:Harga_Dasar * APD:Jumlah
    IF (APD:ktt=0)
      LOC::TOTAL_DTG:Sum += APD:total_dtg
    END
  END
  LOC::TOTAL = LOC::TOTAL:Sum
  discount = discount:Sum
  GLO:HARGA_DASAR = GLO:HARGA_DASAR:Sum
  LOC::TOTAL_DTG = LOC::TOTAL_DTG:Sum
  PARENT.ResetFromView
  Relate:APDTRANS.SetQuickScan(0)
  SETCURSOR()


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

Trig_UpdateRawatJalanDetil PROCEDURE                       ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
tombol_ok            BYTE                                  !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
vl_sudah             BYTE                                  !
vl_diskon_pct        REAL                                  !
vl_total             REAL                                  !
vl_hna               REAL                                  !
History::APD:Record  LIKE(APD:RECORD),THREAD
QuickWindow          WINDOW('Tambah Data Transaksi'),AT(,,231,192),FONT('Times New Roman',10,COLOR:Black,FONT:regular),IMM,HLP('UpdateAPDTRANS'),SYSTEM,GRAY,RESIZE,MDI
                       SHEET,AT(4,4,223,149),USE(?CurrentTab),FONT(,,COLOR:Blue,),COLOR(0D9D900H)
                         TAB('Data'),USE(?Tab:1)
                           PROMPT('Kode Barang:'),AT(8,20),USE(?APD:Kode_brg:Prompt)
                           PROMPT('Nama Barang'),AT(8,35),USE(?Prompt4)
                           PROMPT('Jumlah:'),AT(8,84),USE(?APD:Jumlah:Prompt)
                           PROMPT('Harga :'),AT(8,98),USE(?APD:Total:Prompt)
                           ENTRY(@s10),AT(69,20,56,10),USE(APD:Kode_brg),DISABLE,COLOR(COLOR:White),MSG('Kode Barang'),TIP('Kode Barang')
                           BUTTON('&H'),AT(127,19,15,13),USE(?CallLookup),KEY(F2Key)
                           STRING(@s40),AT(69,35),USE(GBAR:Nama_Brg)
                           PROMPT('Nama Obat Racik:'),AT(8,48),USE(?APD:namaobatracik:Prompt)
                           ENTRY(@s40),AT(69,48,150,10),USE(APD:namaobatracik)
                           OPTION('Bahan untuk resep ke-'),AT(8,60,211,19),USE(APD:Camp),BOXED,TRN
                             RADIO('1'),AT(14,68),USE(?APD:Camp:Radio1),DISABLE,VALUE('1')
                             RADIO('2'),AT(40,68),USE(?APD:Camp:Radio2),DISABLE,VALUE('2')
                             RADIO('3'),AT(66,68),USE(?APD:Camp:Radio3),DISABLE,VALUE('3')
                             RADIO('4'),AT(92,68),USE(?APD:Camp:Radio4),DISABLE,VALUE('4')
                             RADIO('5'),AT(118,68),USE(?APD:Camp:Radio5),DISABLE,VALUE('5')
                             RADIO('Non Racik'),AT(141,68),USE(?APD:Camp:Radio6),DISABLE,VALUE('0')
                           END
                           ENTRY(@n10.2),AT(69,84,55,10),USE(APD:Jumlah),DECIMAL(14),MSG('Jumlah'),TIP('Jumlah')
                           CHECK('KTT'),AT(131,84),USE(APD:ktt),VALUE('1','0')
                           ENTRY(@n-15.2),AT(69,98,55,10),USE(APD:Total),DECIMAL(14),MSG('Harga Dasar'),TIP('Harga Dasar'),READONLY
                           ENTRY(@n-10.2),AT(34,178,25,10),USE(vl_diskon_pct),DISABLE,HIDE,RIGHT(2)
                           ENTRY(@n-15.2),AT(69,178,55,10),USE(APD:Diskon),DISABLE,HIDE,RIGHT(2)
                           PROMPT('Diskon:'),AT(8,178),USE(?APD:Diskon:Prompt),DISABLE,HIDE
                           PROMPT('%'),AT(61,178),USE(?APD:Diskon:Prompt:2),DISABLE,HIDE
                           PROMPT('Total:'),AT(8,112),USE(?APD:Total:Prompt:2)
                           ENTRY(@n-15.2),AT(69,111,55,10),USE(vl_total),SKIP,DECIMAL(14),FONT('Arial',10,,FONT:bold),MSG('Harga Dasar'),TIP('Harga Dasar'),READONLY
                           PROMPT('Biaya Ditanggung:'),AT(8,124),USE(?APD:total_dtg:Prompt)
                           ENTRY(@N-16.2),AT(69,124,55,10),USE(APD:total_dtg),DECIMAL(14)
                           PROMPT('Harga Dasar:'),AT(8,137),USE(?APD:Harga_Dasar:Prompt)
                           ENTRY(@n17.2),AT(69,137,55,10),USE(APD:Harga_Dasar),SKIP,DECIMAL(14),FONT('Arial',10,,FONT:bold),MSG('Harga Dasar'),TIP('Harga Dasar'),READONLY
                           BUTTON('&K (F5)'),AT(131,124,24,21),USE(?Button6),DISABLE,HIDE,LEFT,KEY(F5Key)
                           BUTTON('Obat &Campur (F4)'),AT(159,124,63,20),USE(?Button5),HIDE,FONT(,,,FONT:bold),KEY(F4Key)
                         END
                       END
                       PROMPT('N0 tran:'),AT(79,2),USE(?APD:N0_tran:Prompt)
                       ENTRY(@s15),AT(109,2,48,10),USE(APD:N0_tran),DISABLE,MSG('nomor transaksi'),TIP('nomor transaksi')
                       BUTTON('&OK [End]'),AT(50,156,63,24),USE(?OK),LEFT,KEY(EndKey),ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(125,156,63,24),USE(?Cancel),LEFT,ICON(ICON:Cross)
                       BUTTON('Help'),AT(157,1,45,14),USE(?Help),HIDE,STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
    CLEAR(ActionMessage)
  OF ChangeRecord
    CLEAR(ActionMessage)
  END
  if tombol_ok = 0 then
     ?OK{PROP:DISABLE}=TRUE
     ?APD:Total{PROP:READONLY}=TRUE
     vl_diskon_pct=(APD:Diskon*100)/APD:Total
     vl_total     =APD:Total-APD:Diskon
     display
  end
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_UpdateRawatJalanDetil')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APD:Kode_brg:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APD:Record,History::APD:Record)
  SELF.AddHistoryField(?APD:Kode_brg,2)
  SELF.AddHistoryField(?APD:namaobatracik,10)
  SELF.AddHistoryField(?APD:Camp,5)
  SELF.AddHistoryField(?APD:Jumlah,3)
  SELF.AddHistoryField(?APD:ktt,12)
  SELF.AddHistoryField(?APD:Total,4)
  SELF.AddHistoryField(?APD:Diskon,7)
  SELF.AddHistoryField(?APD:total_dtg,11)
  SELF.AddHistoryField(?APD:Harga_Dasar,6)
  SELF.AddHistoryField(?APD:N0_tran,1)
  SELF.AddUpdateFile(Access:APDTRANS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:APDTRANS.SetOpenRelated()
  Relate:APDTRANS.Open                                     ! File JKontrakObat used by this procedure, so make sure it's RelationManager is open
  Relate:APDTRANSDet.Open                                  ! File JKontrakObat used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket.Open                                     ! File JKontrakObat used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket1.Open                                    ! File JKontrakObat used by this procedure, so make sure it's RelationManager is open
  Relate:vstokfifo.Open                                    ! File JKontrakObat used by this procedure, so make sure it's RelationManager is open
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APOBKONT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
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
  INIMgr.Fetch('Trig_UpdateRawatJalanDetil',QuickWindow)   ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  if self.request=1 then
     if apd:camp=1 then
      glo:totalreseprajal1 += 1
     elsif apd:camp=2 then
      glo:totalreseprajal2 += 1
     elsif apd:camp=3 then
      glo:totalreseprajal3 += 1
     elsif apd:camp=4 then
      glo:totalreseprajal4 += 1
     elsif apd:camp=5 then
      glo:totalreseprajal5 += 1
     end
  end
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:APDTRANSDet.Close
    Relate:Apetiket.Close
    Relate:Apetiket1.Close
    Relate:vstokfifo.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_UpdateRawatJalanDetil',QuickWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


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
      if tombol_ok = 0 then
      GSTO:Kode_Apotik=GL_entryapotik
      GSTO:Kode_Barang=APD:Kode_brg
      GET(GStokAptk,GSTO:KeyBarang)
      IF ERRORCODE() > 0
          ?APD:Jumlah{PROP:DISABLE}=1
          MESSAGE('Barang tersebut tidak ada dalam Daftar Obat')
          CLEAR (APD:Kode_brg )
          CLEAR (GBAR:Nama_Brg)
          DISPLAY
          SELECT(?APD:Kode_brg)
      ELSE
          ?APD:Jumlah{PROP:DISABLE}=0
          APD:Jumlah=0
          APD:Harga_Dasar=0
          APD:Total=0
          APD:Camp=0
          APD:Diskon=0
          vl_total=0
          display
          SELECT(?APD:Jumlah)
      END
      end
    OF ?CallLookup
      if tombol_ok = 0 then
       ?APD:Jumlah{PROP:DISABLE}=0
       APD:Jumlah=0
       APD:Harga_Dasar=0
       APD:Total=0
       APD:Camp=0
       APD:Diskon=0
       vl_total=0
       
       globalrequest=selectrecord
       cari_brg_lokal4
       APD:Kode_brg=GBAR:Kode_brg
       display
      end
    OF ?APD:Jumlah
      IF tombol_ok = 0
         if APD:Kode_brg='' then
            ?OK{PROP:DISABLE}=1
            cycle
         else
            IF APD:Jumlah = 0
               ?OK{PROP:DISABLE}=1
            ELSE
               GBAR:Kode_brg      =APD:Kode_brg
               access:gbarang.fetch(GBAR:KeyKodeBrg)
      
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
      !         if GBAR:StatusGen=1 or GBAR:StatusGen=3 then
      !            if GSGD:Harga_Beli > 0 AND GSGD:Harga_Beli < 501  then
      !               APD:Total = GSGD:Harga_Beli * APD:Jumlah * 3.5
      !            elsif GSGD:Harga_Beli > 500 AND GSGD:Harga_Beli < 1001  then
      !               APD:Total = GSGD:Harga_Beli * APD:Jumlah * 2
      !            elsif GSGD:Harga_Beli > 1000  then
      !               APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.5
      !            end
      !         else
      !            APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.35
      !         end
               if status=2 then
                  !update penambahan tuslah 1500 (3 Desember 2018)
                  !Update perubahan margin pasien umum menjadi 1.25 (31 Desember 2018)
                  !Update penambahan diskon dari gudang saat penjualan (31 Desember 2018)
                  APD:Total=((((GSGD:Harga_Beli-(GSGD:Discount/100*GSGD:Harga_Beli))*1.25)*1.1)*APD:Jumlah)+glo:tuslah
                  APD:total_dtg=0
                  ?APD:total_dtg{PROP:disable}=1
               elsif status=3 then
                  if sub(APD:Kode_brg,1,1)='B'
                      !update penambahan tuslah 1500 (3 Desember 2018)
                      !Update penambahan diskon dari gudang saat penjualan (31 Desember 2018)
                      APD:Total=((((GSGD:Harga_Beli-(GSGD:Discount/100*GSGD:Harga_Beli))*1.215)*1.1)*APD:Jumlah)+glo:tuslah
                      APD:total_dtg=APD:Total
                      ?APD:total_dtg{PROP:disable}=1
                  else
                      !update penambahan tuslah 1500 (3 Desember 2018)
                      !Update penambahan diskon dari gudang saat penjualan (31 Desember 2018)
                      !Update perubahan margin pasien kontraktor non bpjs menjadi 1.25 (13 Maret 2019)
                      APD:Total=((((GSGD:Harga_Beli-(GSGD:Discount/100*GSGD:Harga_Beli))*1.25)*1.1)*APD:Jumlah)+glo:tuslah
                      APD:total_dtg=APD:Total
                  end
               end
               !Update penambahan diskon dari gudang saat penjualan (31 Desember 2018)
               APD:Harga_Dasar = GSGD:Harga_Beli-(GSGD:Discount/100*GSGD:Harga_Beli)
               DISPLAY
            END
      !      if APD:Camp<>0 then
      !        APD:Total=0
      !      end
            vl_diskon_pct=(APD:Diskon*100)/APD:Total
            vl_total     =APD:Total-APD:Diskon
            display
         end
      END
    OF ?Button6
      !if tombol_ok = 0 then
      !IF APD:Jumlah = 0
      !    ?OK{PROP:DISABLE}=1
      !ELSE
      !    ?OK{PROP:DISABLE}=0
      !    if GBAR:Kelompok=19 then
      !       APD:Total = GL_beaR + (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1.3)) * APD:Jumlah)
      !    else
      !          CASE  status
      !           OF 1
      !               APD:Total = APD:Jumlah * GSTO:Harga_Dasar * (1+(GL_PPN/100))
      !           OF 2
      !               if GBAR:Kelompok=22 then
      !                  APD:Total = GL_beaR + |
      !                           (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+( 10/ 100 ))) * APD:Jumlah)
      !               else
      !                  APD:Total = GL_beaR + |
      !                           (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+( GL_Um_kls1 / 100 ))) * APD:Jumlah)
      !               end
      !           OF 3
      !               JKon:KODE_KTR=APH:Kontrak
      !               access:jkontrak.fetch(JKon:KeyKodeKtr)
      !               if JKon:HargaObat>0 then
      !                  APD:Total = GL_beaR + |
      !                          (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) *JKon:HargaObat) * APD:Jumlah)
      !               else
      !                  APO:KODE_KTR = GLO::back_up
      !                  APO:Kode_brg = APD:Kode_brg
      !                  GET(APOBKONT,APO:by_kode_ktr)
      !                  IF ERRORCODE() then
      !                      APD:Total = GL_beaR + |
      !                           (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(GL_nt_kls2 / 100 ))) * APD:Jumlah)
      !                  ELSE
      !                      APD:Total = GL_beaR + |
      !                           (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+ (APO:PERS_TAMBAH / 100 ))) * APD:Jumlah)
      !                  end
      !               END
      !           END
      !    end
      !    DISPLAY
      !END
      !vl_diskon_pct=(APD:Diskon*100)/APD:Total
      !vl_total     =APD:Total-APD:Diskon
      !display
      !end
    OF ?Button5
      if tombol_ok = 0 then
      glo::campur = glo::campur+1
      glo::no_nota= APH:N0_tran
      end
    OF ?OK
      tombol_ok = 1
      !if apd:camp<>0 and sub(APD:Kode_brg,1,7)<>'_Campur' then
      !    APD:Total=0
      !    display
      !end
      if APD:Total=0 then
         message('harga tidak boleh 0, mohon cek kembali')
         cycle
      end
      if APD:Total=0 and sub(APD:Kode_brg,1,7)='_Campur' then
         message('Harga resep tidak boleh 0, mohon cek kembali')
         cycle
      end
      if APD:ktt=1 then
          glo:ktt=1
      end
      IF APD:Kode_brg = '_Campur1'
          glo:reseprajal1=1
      elsIF APD:Kode_brg = '_Campur2'
          glo:reseprajal2=1
      elsIF APD:Kode_brg = '_Campur3'
          glo:reseprajal3=1
      elsIF APD:Kode_brg = '_Campur4'
          glo:reseprajal4=1
      elsIF APD:Kode_brg = '_Campur5'
          glo:reseprajal5=1
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CallLookup
      ThisWindow.Update
      if tombol_ok = 0 then
      GSTO:Kode_Apotik=GL_entryapotik
      GSTO:Kode_Barang=GBAR:Kode_brg
      GET(GStokAptk,GSTO:KeyBarang)
      IF ERRORCODE() >0
          ?APD:Jumlah{PROP:DISABLE}=1
          MESSAGE('Barang tersebut tidak ada dalam Daftar Obat')
          CLEAR (APD:Kode_brg )
          CLEAR (GBAR:Nama_Brg)
          DISPLAY
          SELECT(?APD:Kode_brg)
      ELSE
          !untuk menentukan cara bayar pasen
          if status=3 then
             JKon:KODE_KTR=APH:Kontrak
             access:jkontrak.fetch(JKon:KeyKodeKtr)
             JKOM:Kode    =JKon:GROUP
             access:jkontrakmaster.fetch(JKOM:PrimaryKey)
             if JKOM:StatusTabelObat=0 then
                JKOO:KodeKontrak  =JKOM:Kode
                JKOO:Kode_brg     =GBAR:Kode_brg
                !message(JKOM:Kode&' '&GBAR:Kode_brg&' '&JKOO:KodeKontrak&' '&JKOO:Kode_brg)
                if access:jkontrakobat.fetch(JKOO:by_kode_ktr)=level:benign then
                   MESSAGE('Barang tersebut tidak ditanggung')
                   ?APD:Jumlah{PROP:DISABLE}=1
                   CLEAR (APD:Kode_brg )
                   CLEAR (GBAR:Nama_Brg)
                   DISPLAY
                   SELECT(?Button6)
                   cycle
                end
             elsif JKOM:StatusTabelObat=1 then
                JKOO:KodeKontrak  =JKOM:Kode
                JKOO:Kode_brg     =GBAR:Kode_brg
                if access:jkontrakobat.fetch(JKOO:by_kode_ktr)<>level:benign then
                   MESSAGE('Barang tersebut tidak ditanggung')
                   ?APD:Jumlah{PROP:DISABLE}=1
                   CLEAR (APD:Kode_brg )
                   CLEAR (GBAR:Nama_Brg)
                   DISPLAY
                   SELECT(?Button6)
                   cycle
                end
             end
          end
          APD:Jumlah=0
          APD:Harga_Dasar=0
          APD:Total=0
          APD:Camp=0
          APD:Diskon=0
          vl_total=0
          IF glo:reseprajal1=1
              ?APD:Camp:Radio1{PROP:DISABLE}=0
              ?APD:Camp:Radio6{PROP:DISABLE}=0
          END
          IF glo:reseprajal2=1
              ?APD:Camp:Radio2{PROP:DISABLE}=0
              ?APD:Camp:Radio6{PROP:DISABLE}=0
          END
          IF glo:reseprajal3=1
              ?APD:Camp:Radio3{PROP:DISABLE}=0
              ?APD:Camp:Radio6{PROP:DISABLE}=0
          END
          IF glo:reseprajal4=1
              ?APD:Camp:Radio4{PROP:DISABLE}=0
              ?APD:Camp:Radio6{PROP:DISABLE}=0
          END
          IF glo:reseprajal5=1
              ?APD:Camp:Radio5{PROP:DISABLE}=0
              ?APD:Camp:Radio6{PROP:DISABLE}=0
          END
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
              APD:Total=5000
              vl_total=5000
              if status=2 then
                  APD:total_dtg=0
                  ?APD:total_dtg{PROP:disable}=1
              elsif status=3 then
                  APD:total_dtg=APD:Total
              end
              ?APD:jumlah{PROP:disable}=1
              !?APD:total{PROP:READONLY}=0
              ?OK{PROP:DISABLE}=0
              SELECT(?APD:namaobatracik)
          else
              ?APD:Jumlah{PROP:DISABLE}=0
              IF glo:reseprajal1=1
                  SELECT(?APD:Camp:Radio1)
              ELSIF glo:reseprajal2=1
                  SELECT(?APD:Camp:Radio2)
              ELSIF glo:reseprajal3=1
                  SELECT(?APD:Camp:Radio3)
              ELSIF glo:reseprajal4=1
                  SELECT(?APD:Camp:Radio4)
              ELSIF glo:reseprajal5=1
                  SELECT(?APD:Camp:Radio5)
              ELSE
                  SELECT(?APD:Jumlah)
              END
          end
          display
      END
      end
    OF ?APD:Total
      if sub(APD:Kode_brg,1,7)='_Campur' then
          vl_total=APD:Jumlah*APD:Total
          ?vl_total{PROP:readonly}=1
          display
      end
    OF ?vl_diskon_pct
      if tombol_ok = 0 then
         if vl_diskon_pct>10 then
            vl_diskon_pct=0
            APD:Diskon=0
            vl_total  =APD:Total
            display
         else
      !      if vl_diskon_pct<=15 then
      !         WindowLoginManager
      !         if glo:loginmanagerok=1 then
                  APD:Diskon=round(APD:Total*(vl_diskon_pct/100),1)
                  vl_total  =APD:Total-APD:Diskon
                  display
      !         else
      !            vl_diskon_pct=0
      !            APD:Diskon=0
      !            vl_total  =APD:Total
      !            display
      !         end
      !      else
      !         vl_diskon_pct=0
      !         APD:Diskon=0
      !         vl_total  =APD:Total
      
      !         display
      !      end
      !   else
      !      APD:Diskon=round(APD:Total*(vl_diskon_pct/100),1)
      !      vl_total  =APD:Total-APD:Diskon
      !      display
         end
      end
    OF ?APD:Diskon
      if tombol_ok = 0 then
         vl_diskon_pct=(APD:Diskon*100)/APD:Total
         vl_total     =APD:Total-APD:Diskon
         display
      end
    OF ?APD:total_dtg
      if APD:total_dtg>APD:Total then
          message('Biaya ditanggung tidak boleh lebih besar daripada Total harga, mohon cek kembali')
          ?OK{prop:disable}=1
          cycle
      else
          ?OK{prop:disable}=0
      end
    OF ?Button5
      ThisWindow.Update
      START(Obat_campur, 25000)
      ThisWindow.Reset
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
            vl_diskon_pct=(APD:Diskon*100)/APD:Total
         else
            vl_diskon_pct=0
         end
         vl_total     =APD:Total-APD:Diskon
         display
      end
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

WindowLoginManager PROCEDURE                               ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
VL_Password          STRING(10)                            !
VL_TryLogin          BYTE                                  !
Showtime             ULONG                                 !
jum                  USHORT                                !
str1                 STRING(30)                            !
Loc:Password         STRING(20)                            !
Loc:I                ULONG                                 !
Loc:Huruf            STRING(20)                            !
Loc:J                ULONG                                 !
loc:ada              BYTE                                  !
loc:pas              STRING(20)                            !
vl_user              STRING(30)                            !
window               WINDOW('Pemeriksaan Password '),AT(,,204,88),FONT('Times New Roman',10,COLOR:Black,FONT:bold),CENTER,ALRT(EscKey),ALRT(AltF4),CENTERED,GRAY,DOUBLE
                       ENTRY(@s20),AT(70,15,88,10),USE(vl_user),UPR
                       ENTRY(@s20),AT(71,34,,10),USE(Loc:Password),PASSWORD
                       BUTTON('&OK'),AT(15,57,62,26),USE(?OkButton),LEFT,FONT('Times New Roman',10,,FONT:bold),ICON('SECUR05.ICO'),DEFAULT,REPEAT(3),DELAY(268)
                       BUTTON('&Batal'),AT(131,58,62,25),USE(?CancelButton),LEFT,FONT('Arial',9,,FONT:bold+FONT:italic),ICON(ICON:Hand)
                       PANEL,AT(1,4,202,47),USE(?Panel1),BEVEL(1)
                       IMAGE('MISC28.ICO'),AT(7,10,19,18),USE(?Image4)
                       IMAGE('RSI2.BMP'),AT(92,58,27,25),USE(?Image1)
                       IMAGE('SECUR08.ICO'),AT(170,33,21,16),USE(?Image2)
                       PROMPT('Pemakai:'),AT(32,17),USE(?VL_User:Prompt),FONT('Arial',10,,FONT:bold+FONT:italic)
                       IMAGE('SECUR02B.ICO'),AT(7,30),USE(?Image3)
                       PROMPT('Password:'),AT(32,36),USE(?VL_Password:Prompt),FONT('Arial',10,,FONT:bold+FONT:italic)
                       IMAGE('SMCROSS.ICO'),AT(170,32),USE(?Image6)
                       PANEL,AT(1,53,202,33),USE(?Panel2),BEVEL(1)
                       IMAGE('SECUR02A.ICO'),AT(7,30),USE(?Image5)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
  GlobalErrors.SetProcedureName('WindowLoginManager')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?vl_user
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:JPASSWRD.SetOpenRelated()
  Relate:JPASSWRD.Open                                     ! File JPASSWRD used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('WindowLoginManager',window)                ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:JPASSWRD.Close
  END
  IF SELF.Opened
    INIMgr.Update('WindowLoginManager',window)             ! Save window data to non-volatile store
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
    OF ?OkButton
      if Clip(Loc:Password)<>'' then
      Loc:Pas = Clip(Loc:Password)&Clip(Glo:Kunci1)
      !Loop Loc:I=1 to Len(Clip(Loc:Password))
      Loop Loc:I=1 to 10
          Loc:J = Val(Sub(Loc:Pas,Loc:I,1)) + Val(Sub(GLo:Kunci,Loc:I,1))
          !Loc:J = (26 - Loc:J % 26 ) + 96
          Loc:Huruf[Loc:I] = CHR(Loc:J)
      end
      If Glo:Flag > 3 then
         Beep
         Halt(0,'Batas Kesalahan 3X (Program DIPROTEK)....!, Hub : MIS/EDP')
      end
      JPSW:ID=Clip(Loc:Huruf)
      !Access:JPasswrd.Fetch(JPSW:KeyId)
      Set( JPSW:KeyId, JPSW:KeyId )
      If not errorcode() then
          !kemungkinan password sama tapi nama beda
          !Loc:Huruf = JPSW:ID
          Loc:ada=0
          Loop
              Next(JPasswrd)
              If Errorcode() Then Break.
              If JPSW:ID = Loc:Huruf Then
                  If Clip(JPSW:User_Id) = Clip(vl_user) then
                      If (Clip(JPSW:Bagian) = 'FARMASI' and JPSW:Level = 0) then
                         glo:loginmanagerok=1
                         Break
                      End
                  End
              Else
                  Break
              End
          End
          If Loc:ada = 1 Then
              Break
          Else
              Beep
              Message('Anda Tidak Diperbolehkan Mengakses Program ini..!, Hub:MIS/EDP','  Peringatan',Icon:Exclamation)
              Clear(loc:Huruf)
              Glo:Flag += 1
              cycle
          End
      else
          Beep
          Message('Password Tidak Ditemukan..!','  Peringatan',Icon:Exclamation)
          Select(?Loc:Password)
      End
      else
         break
         !Halt(0,'Anda masuk tanpa password !!! Hubungi : SIM ')
      end
    OF ?CancelButton
      Beep
      break
      !Halt(0,'Akses Program Dibatalkan...!')
    END
  ReturnValue = PARENT.TakeAccepted()
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
      case event()
      of event:alertkey
          if keycode() = EscKey
              Beep
              break
              !HALT(0,'Akses Program Dibatalkan !')
          elsif keycode() = AltF4
              Beep
              break
              !HALT(0,'Akses Program Dibatalkan !')
          end
      end
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

Cari_mr_pasien PROCEDURE                                   ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
nm_pasien            STRING(35)                            !
BRW1::View:Browse    VIEW(JPasien)
                       PROJECT(JPas:Nomor_mr)
                       PROJECT(JPas:Nama)
                       PROJECT(JPas:Umur)
                       PROJECT(JPas:Umur_Bln)
                       PROJECT(JPas:Alamat)
                       PROJECT(JPas:RT)
                       PROJECT(JPas:RW)
                       PROJECT(JPas:Jenis_kelamin)
                       PROJECT(JPas:Kelurahan)
                       PROJECT(JPas:Tanggal)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
JPas:Nomor_mr          LIKE(JPas:Nomor_mr)            !List box control field - type derived from field
JPas:Nama              LIKE(JPas:Nama)                !List box control field - type derived from field
JPas:Umur              LIKE(JPas:Umur)                !List box control field - type derived from field
JPas:Umur_Bln          LIKE(JPas:Umur_Bln)            !List box control field - type derived from field
JPas:Alamat            LIKE(JPas:Alamat)              !List box control field - type derived from field
JPas:RT                LIKE(JPas:RT)                  !List box control field - type derived from field
JPas:RW                LIKE(JPas:RW)                  !List box control field - type derived from field
JPas:Jenis_kelamin     LIKE(JPas:Jenis_kelamin)       !List box control field - type derived from field
JPas:Kelurahan         LIKE(JPas:Kelurahan)           !List box control field - type derived from field
JPas:Tanggal           LIKE(JPas:Tanggal)             !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Data Pasien'),AT(,,358,157),FONT('Times New Roman',8,COLOR:Black,),IMM,HLP('Cari_mr_pasien'),SYSTEM,GRAY,RESIZE,MDI
                       LIST,AT(8,21,339,104),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('80R(2)|FM~Nomor RM~C(0)@N010_@80L(2)|M~Nama~@s35@40R(2)|M~Umur Thn~C(0)@n3@36R(2' &|
   ')|M~Umur Bln~C(0)@n3@80L(2)|M~Alamat~@s35@16R(2)|M~RT~C(0)@N3@16R(2)|M~RW~C(0)@N' &|
   '3@56L(2)|M~Jenis kelamin~@s1@80L(2)|M~Kelurahan~@s20@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(171,0,45,14),USE(?Select:2),HIDE
                       SHEET,AT(4,4,350,150),USE(?CurrentTab)
                         TAB('Nomor RM (F2)'),USE(?Tab:2),KEY(F2Key)
                           PROMPT('Nomor MR :'),AT(11,133),USE(?JPas:Nomor_mr:Prompt)
                           ENTRY(@N010_),AT(61,130,199,17),USE(JPas:Nomor_mr),IMM,MSG('Nomor Medical record pasien'),TIP('Nomor KIUP')
                         END
                         TAB('Nama (F3)'),USE(?Tab:3),KEY(F3Key)
                           PROMPT('Cari Nama :'),AT(92,133),USE(?Prompt1),FONT('Times New Roman',10,,FONT:bold)
                           ENTRY(@s35),AT(149,130,199,17),USE(nm_pasien),FONT('Times New Roman',14,,)
                         END
                         TAB('tgl. kunjungan'),USE(?Tab:6)
                         END
                       END
                       BUTTON('Close'),AT(220,0,45,14),USE(?Close),HIDE
                       BUTTON('Help'),AT(295,0,45,14),USE(?Help),HIDE,STD(STD:Help)
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

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort1:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
BRW1::Sort0:StepClass StepLongClass                        ! Default Step Manager
BRW1::Sort1:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW1::Sort4:StepClass StepRealClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 5
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
  GlobalErrors.SetProcedureName('Cari_mr_pasien')
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
  Relate:JPasien.Open                                      ! File JPasien used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:JPasien,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon JPas:Nama for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,JPas:KeyNama)    ! Add the sort order for JPas:KeyNama for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?nm_pasien,JPas:Nama,,BRW1)     ! Initialize the browse locator using ?nm_pasien using key: JPas:KeyNama , JPas:Nama
  BRW1::Sort4:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon JPas:Tanggal for sort order 2
  BRW1.AddSortOrder(BRW1::Sort4:StepClass,JPas:KeyTanggal) ! Add the sort order for JPas:KeyTanggal for sort order 2
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort4:Locator.Init(,JPas:Tanggal,1,BRW1)           ! Initialize the browse locator using  using key: JPas:KeyTanggal , JPas:Tanggal
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive) ! Moveable thumb based upon JPas:Nomor_mr for sort order 3
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,JPas:KeyNomorMr) ! Add the sort order for JPas:KeyNomorMr for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(?JPas:Nomor_mr,JPas:Nomor_mr,,BRW1) ! Initialize the browse locator using ?JPas:Nomor_mr using key: JPas:KeyNomorMr , JPas:Nomor_mr
  BRW1.AddField(JPas:Nomor_mr,BRW1.Q.JPas:Nomor_mr)        ! Field JPas:Nomor_mr is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nama,BRW1.Q.JPas:Nama)                ! Field JPas:Nama is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Umur,BRW1.Q.JPas:Umur)                ! Field JPas:Umur is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Umur_Bln,BRW1.Q.JPas:Umur_Bln)        ! Field JPas:Umur_Bln is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Alamat,BRW1.Q.JPas:Alamat)            ! Field JPas:Alamat is a hot field or requires assignment from browse
  BRW1.AddField(JPas:RT,BRW1.Q.JPas:RT)                    ! Field JPas:RT is a hot field or requires assignment from browse
  BRW1.AddField(JPas:RW,BRW1.Q.JPas:RW)                    ! Field JPas:RW is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Jenis_kelamin,BRW1.Q.JPas:Jenis_kelamin) ! Field JPas:Jenis_kelamin is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Kelurahan,BRW1.Q.JPas:Kelurahan)      ! Field JPas:Kelurahan is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Tanggal,BRW1.Q.JPas:Tanggal)          ! Field JPas:Tanggal is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Cari_mr_pasien',QuickWindow)               ! Restore window settings from non-volatile store
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
    Relate:JPasien.Close
  END
  IF SELF.Opened
    INIMgr.Update('Cari_mr_pasien',QuickWindow)            ! Save window data to non-volatile store
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
  ELSIF CHOICE(?CurrentTab) = 5
    RETURN SELF.SetSort(2,Force)
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

Cari_no_urut PROCEDURE                                     ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
loc::nomor_rm        LONG                                  !
BRW1::View:Browse    VIEW(JKontrak)
                       PROJECT(JKon:KODE_KTR)
                       PROJECT(JKon:NAMA_KTR)
                       PROJECT(JKon:ALAMAT)
                       PROJECT(JKon:KOTA)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
JKon:KODE_KTR          LIKE(JKon:KODE_KTR)            !List box control field - type derived from field
JKon:NAMA_KTR          LIKE(JKon:NAMA_KTR)            !List box control field - type derived from field
JKon:ALAMAT            LIKE(JKon:ALAMAT)              !List box control field - type derived from field
JKon:KOTA              LIKE(JKon:KOTA)                !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Data Kontraktor '),AT(,,358,194),FONT('MS Sans Serif',8,,),IMM,HLP('Cari_no_urut'),SYSTEM,GRAY,RESIZE,MDI
                       LIST,AT(8,20,342,146),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('44L|M~KODE~@s10@113L|M~NAMA~@s50@400L|M~ALAMAT~@s100@80L|M~KOTA~@s20@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(305,166,45,14),USE(?Select:2),HIDE
                       SHEET,AT(4,4,350,186),USE(?CurrentTab)
                         TAB('Nama (F2)'),USE(?Tab:2),KEY(F2Key)
                           PROMPT('Nomor RM :'),AT(13,173),USE(?Prompt1)
                           ENTRY(@s100),AT(57,173,131,9),USE(JKon:NAMA_KTR),FONT('Times New Roman',14,,)
                         END
                         TAB('Kode (F3)'),USE(?Tab:4),KEY(F3Key)
                           PROMPT('KODE:'),AT(10,173),USE(?JKon:KODE_KTR:Prompt)
                           ENTRY(@s10),AT(36,173,131,9),USE(JKon:KODE_KTR)
                         END
                       END
                       BUTTON('Close'),AT(211,172,45,14),USE(?Close),HIDE
                       BUTTON('Help'),AT(261,172,45,14),USE(?Help),HIDE,STD(STD:Help)
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

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW1::Sort1:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('Cari_no_urut')
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
  Relate:JKontrak.Open                                     ! File JPasien used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:JKontrak,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon JKon:KODE_KTR for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,JKon:KeyKodeKtr) ! Add the sort order for JKon:KeyKodeKtr for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?JKon:KODE_KTR,JKon:KODE_KTR,,BRW1) ! Initialize the browse locator using ?JKon:KODE_KTR using key: JKon:KeyKodeKtr , JKon:KODE_KTR
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon JKon:NAMA_KTR for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,JKon:KeyNamaKtr) ! Add the sort order for JKon:KeyNamaKtr for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?JKon:NAMA_KTR,JKon:NAMA_KTR,,BRW1) ! Initialize the browse locator using ?JKon:NAMA_KTR using key: JKon:KeyNamaKtr , JKon:NAMA_KTR
  BRW1.AddField(JKon:KODE_KTR,BRW1.Q.JKon:KODE_KTR)        ! Field JKon:KODE_KTR is a hot field or requires assignment from browse
  BRW1.AddField(JKon:NAMA_KTR,BRW1.Q.JKon:NAMA_KTR)        ! Field JKon:NAMA_KTR is a hot field or requires assignment from browse
  BRW1.AddField(JKon:ALAMAT,BRW1.Q.JKon:ALAMAT)            ! Field JKon:ALAMAT is a hot field or requires assignment from browse
  BRW1.AddField(JKon:KOTA,BRW1.Q.JKon:KOTA)                ! Field JKon:KOTA is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Cari_no_urut',QuickWindow)                 ! Restore window settings from non-volatile store
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
    Relate:JKontrak.Close
  END
  IF SELF.Opened
    INIMgr.Update('Cari_no_urut',QuickWindow)              ! Save window data to non-volatile store
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
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

