

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N187.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N006.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N064.INC'),ONCE        !Req'd for module callout resolution
                     END


Trig_UpdateReturRanapPerTransNew PROCEDURE                 ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
vl_no_urut           SHORT                                 !
Tahun_ini            LONG                                  !
Loc::SavPoint        LONG                                  !
putar                ULONG                                 !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
loc::nama            STRING(20)                            !
loc::alamat          STRING(35)                            !
Loc::no_mr           LONG                                  !Nomor MR
Loc::status          STRING(10)                            !
vl_nomor             STRING(15)                            !
loc::total           REAL                                  !
loc::diskon          REAL                                  !
loc::no_tran_lama    STRING(20)                            !
LOC::TOTAL_DTG       REAL                                  !
BRW4::View:Browse    VIEW(APDTRANS)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:ktt)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Total)
                       PROJECT(APD:Diskon)
                       PROJECT(APD:N0_tran)
                       PROJECT(APD:Harga_Dasar)
                       PROJECT(APD:total_dtg)
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
APD:ktt                LIKE(APD:ktt)                  !List box control field - type derived from field
APD:Jumlah             LIKE(APD:Jumlah)               !List box control field - type derived from field
APD:Total              LIKE(APD:Total)                !List box control field - type derived from field
APD:Diskon             LIKE(APD:Diskon)               !List box control field - type derived from field
APD:N0_tran            LIKE(APD:N0_tran)              !List box control field - type derived from field
APD:Harga_Dasar        LIKE(APD:Harga_Dasar)          !List box control field - type derived from field
APD:total_dtg          LIKE(APD:total_dtg)            !List box control field - type derived from field
APD:Camp               LIKE(APD:Camp)                 !Primary key field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::APH:Record  LIKE(APH:RECORD),THREAD
QuickWindow          WINDOW('Pengembalian obat Rawat Inap ke Instalasi Farmasi'),AT(,,456,221),FONT('Times New Roman',8,COLOR:Black,),CENTER,IMM,HLP('UpdateAPHTRANS'),ALRT(EscKey),TIMER(100),GRAY,RESIZE,MDI
                       ENTRY(@D8),AT(341,2,104,13),USE(APH:Tanggal),DISABLE,RIGHT(1),FONT('Times New Roman',12,,),MSG('Tanggal berobat pasen'),TIP('Tanggal berobat pasen')
                       SHEET,AT(3,5,452,93),USE(?CurrentTab)
                         TAB('Rawat Jalan'),USE(?Tab:1),FONT('Times New Roman',10,,)
                           BOX,AT(11,28,217,21),USE(?Box1),ROUND,COLOR(COLOR:Green),LINEWIDTH(1)
                           STRING('Nomor RM :'),AT(25,31),USE(?String3),FONT('Arial Black',12,COLOR:Purple,)
                           STRING(@n010_),AT(119,33),USE(Loc::no_mr),FONT('Times New Roman',12,,)
                           PANEL,AT(234,26,77,42),USE(?Panel3)
                           STRING('STATUS'),AT(257,31),USE(?String1),FONT('Bookman Old Style',10,,FONT:bold+FONT:italic)
                           PROMPT('NIP:'),AT(321,30),USE(?APH:NIP:Prompt)
                           ENTRY(@s7),AT(359,28,53,13),USE(APH:NIP),DISABLE
                           BOX,AT(11,55,217,34),USE(?Box2),ROUND,COLOR(COLOR:Green),LINEWIDTH(2)
                           STRING('Nama :'),AT(22,61),USE(?String5),FONT(,,,FONT:bold)
                           LINE,AT(250,47,53,0),USE(?Line2),COLOR(COLOR:Black)
                           PROMPT('Kontrak:'),AT(321,47),USE(?APH:Kontrak:Prompt)
                           ENTRY(@s10),AT(359,45,53,13),USE(APH:Kontrak),DISABLE
                           STRING(@s35),AT(63,61,144,10),USE(loc::nama)
                           OPTION('Lama Baru'),AT(234,70,83,23),USE(APH:LamaBaru),DISABLE,BOXED
                             RADIO('Lama'),AT(240,79),USE(?Option1:Radio1),VALUE('0')
                             RADIO('Baru'),AT(278,79),USE(?Option1:Radio2),VALUE('1')
                           END
                           STRING(@s10),AT(257,55),USE(Loc::status),FONT('Times New Roman',,,)
                           STRING('Alamat :'),AT(22,73),USE(?String6),FONT(,,,FONT:bold)
                           STRING(@s35),AT(63,73,145,10),USE(loc::alamat)
                           PROMPT('No Nota:'),AT(321,78),USE(?APH:NoNota:Prompt)
                           ENTRY(@s10),AT(359,78,56,11),USE(APH:NoNota),DISABLE,REQ
                           BUTTON('F2'),AT(421,75,19,14),USE(?Button7),KEY(F2Key)
                         END
                       END
                       PROMPT('Kode Apotik:'),AT(161,4),USE(?APH:Kode_Apotik:Prompt)
                       ENTRY(@s5),AT(211,2,45,13),USE(APH:Kode_Apotik),DISABLE,MSG('Kode Apotik'),TIP('Kode Apotik')
                       PROMPT('&TANGGAL:'),AT(287,5),USE(?APH:Tanggal:Prompt)
                       PROMPT('No. Nota :'),AT(10,201),USE(?APH:N0_tran:Prompt),FONT('Times New Roman',12,,FONT:bold+FONT:italic+FONT:underline)
                       ENTRY(@s15),AT(58,201,81,13),USE(APH:N0_tran),DISABLE,MSG('nomor transaksi'),TIP('nomor transaksi')
                       LINE,AT(280,202,163,0),USE(?Line1),COLOR(COLOR:Black),LINEWIDTH(2)
                       LIST,AT(12,101,432,65),USE(?Browse:4),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('54L|FM~Kode Barang~@s10@102L|M~Nama Obat~C@s40@85L|M~Keterangan~C@s50@17L|M~KTT~' &|
   'C@n3@60R(2)|M~Jumlah~C(0)@n-15.2@66R(2)|M~Total~C(0)@n-15.2@60R(2)|M~Diskon~C(0)' &|
   '@n-15.2@60R(2)|M~N 0 tran~C(0)@s15@44D(2)|M~Harga Dasar~C(0)@n11.2@64D(2)|M~tota' &|
   'l dtg~C(0)@N-16.2@'),FROM(Queue:Browse:4)
                       PROMPT('Total:'),AT(285,170),USE(?loc::total:Prompt)
                       ENTRY(@n-15.2),AT(345,169,81,13),USE(loc::total),RIGHT(14)
                       PROMPT('Total :'),AT(285,205),USE(?APH:Biaya:Prompt),FONT('Times New Roman',14,,FONT:bold+FONT:italic)
                       ENTRY(@n-15.2),AT(345,205,81,14),USE(APH:Biaya),DISABLE,RIGHT(14),MSG('Total Biaya Pembelian'),TIP('Total Biaya Pembelian')
                       PANEL,AT(7,199,135,19),USE(?Panel2)
                       BUTTON('&OK [End]'),AT(214,183,45,33),USE(?OK),FONT('Times New Roman',10,,),KEY(EndKey),ICON(ICON:Tick),DEFAULT
                       PROMPT('Diskon:'),AT(285,187),USE(?loc::diskon:Prompt)
                       ENTRY(@n-15.2),AT(345,185,81,13),USE(loc::diskon),RIGHT(14)
                       BUTTON('&Batal'),AT(157,183,45,33),USE(?Cancel),FONT('Times New Roman',12,,),ICON(ICON:Cross)
                       BUTTON('&Tambah Obat (+)'),AT(7,176,127,19),USE(?Insert:5),HIDE,FONT('Times New Roman',10,,FONT:bold),KEY(PlusKey)
                       BUTTON('&Change'),AT(138,171,45,14),USE(?Change:5),HIDE
                       BUTTON('&Delete'),AT(190,171,45,14),USE(?Delete:5),HIDE
                       BUTTON('Help'),AT(250,171,45,14),USE(?Help),HIDE,STD(STD:Help)
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
BATAL_D_UTAMA ROUTINE
    apdtrans{prop:sql}='delete dba.apdtrans where n0_tran='''&APH:N0_tran&''''
    apdtrans{prop:sql}='delete dba.apdtrans where n0_tran='''&APH:N0_tran&''''
!    SET( BRW4::View:Browse)
!    LOOP
!        NEXT(BRW4::View:Browse)
!
!        IF ERRORCODE() > 0 THEN
!        BREAK.
!        DELETE(BRW4::View:Browse)
!    END

!Proses Penomoran Otomatis Transaksi
Isi_Nomor Routine
   vl_nomor=''
   display
   loop
      logout(1,nomor_batal)
      if errorcode()=56 then
         cycle.
      !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
      NOM:No_Urut=1
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
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
        !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
        NOM1:No_urut=1
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
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
      !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
      nomor_batal{prop:sql}='delete dba.nomor_batal where No=1'
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 3=Transaksi Apotik ke pasien Rawat Jalan
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
   glo:nobatal=vl_nomor
   display

Batal_Nomor Routine
   !Silahkan diganti ---> 3=Transaksi Apotik ke pasien Rawat Jalan
   NOM:No_Urut =1
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=APH:N0_tran
   NOM:Keterangan='Aptk R. Jalan'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 3=Transaksi Apotik ke pasien Rawat Jalan
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

hapus_nomor_use1 routine
   NOMU:Urut    =vl_no_urut
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
  ?OK{PROP:DISABLE}=TRUE
  
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_UpdateReturRanapPerTransNew')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APH:Tanggal
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  glo:ktt=0
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APH:Record,History::APH:Record)
  SELF.AddHistoryField(?APH:Tanggal,2)
  SELF.AddHistoryField(?APH:NIP,13)
  SELF.AddHistoryField(?APH:Kontrak,14)
  SELF.AddHistoryField(?APH:LamaBaru,15)
  SELF.AddHistoryField(?APH:NoNota,17)
  SELF.AddHistoryField(?APH:Kode_Apotik,10)
  SELF.AddHistoryField(?APH:N0_tran,4)
  SELF.AddHistoryField(?APH:Biaya,3)
  SELF.AddUpdateFile(Access:APHTRANS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  !Retur R. Jalan
  case deformat(sub(clip(GL_entryapotik),3,2),@n2)
     of '01'
        vl_no_urut=41
     of '02'
        vl_no_urut=42
     of '04'
        vl_no_urut=43
     of '06'
        vl_no_urut=44
     of '07'
        vl_no_urut=45
     of '08'
        vl_no_urut=46
  END
  Relate:APDTRANS.Open                                     ! File APDTRANS used by this procedure, so make sure it's RelationManager is open
  Relate:APpotkem.Open                                     ! File APDTRANS used by this procedure, so make sure it's RelationManager is open
  Relate:Ano_pakai.Open                                    ! File APDTRANS used by this procedure, so make sure it's RelationManager is open
  Relate:Apklutmp.Open                                     ! File APDTRANS used by this procedure, so make sure it's RelationManager is open
  Relate:IAP_SET.Open                                      ! File APDTRANS used by this procedure, so make sure it's RelationManager is open
  Relate:JHBILLING.Open                                    ! File APDTRANS used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File APDTRANS used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_Batal.Open                                  ! File APDTRANS used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File APDTRANS used by this procedure, so make sure it's RelationManager is open
  Relate:Tbstawal.Open                                     ! File APDTRANS used by this procedure, so make sure it's RelationManager is open
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKelPeg.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ApReLuar.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JTSBayar.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
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
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:None                        ! Changes not allowed
    SELF.CancelAction = Cancel:Cancel                      ! No confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  IF glo::campur = 3
      LOC::Status = 'Kontraktor'
  ELSIF glo::campur = 2
      LOC::Status = 'Tunai'
  ELSIF glo::campur = 1
      LOC::Status = 'Pegawai'
  END
  !IF Glo:lap = '1'
  !    APR:N0_tran = glo::no_nota
  !    GET(ApReLuar,APR:by_transaksi)
  !    loc::nama   = APR:Nama
  !    loc::Alamat = APR:Alamat
  !    loc::no_mr  = 0
  !    LOC::Status = 'Tunai'
  !ELSE
      JPas:Nomor_mr = Glo::no_mr
      GET(JPasien,JPas:KeyNomorMr)
      loc::nama   = JPas:Nama
      loc::Alamat = JPas:Alamat
      loc::no_mr  = JPas:Nomor_mr
  !END
  DISPLAY
  if self.request=1 then
     APH:Kontrak      =vg_kontraktor
     APH:cara_bayar   =glo::campur
     APH:NoNota       =glo:nota
  end
  display
  BRW4.Init(?Browse:4,Queue:Browse:4.ViewPosition,BRW4::View:Browse,Queue:Browse:4,Relate:APDTRANS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:4{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW4.Q &= Queue:Browse:4
  BRW4::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon APD:N0_tran for sort order 1
  BRW4.AddSortOrder(BRW4::Sort0:StepClass,APD:by_transaksi) ! Add the sort order for APD:by_transaksi for sort order 1
  BRW4.AddRange(APD:N0_tran,Relate:APDTRANS,Relate:APHTRANS) ! Add file relationship range limit for sort order 1
  BRW4.AppendOrder('apd:kode_brg')                         ! Append an additional sort order
  BRW4.AddField(APD:Kode_brg,BRW4.Q.APD:Kode_brg)          ! Field APD:Kode_brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Nama_Brg,BRW4.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Ket2,BRW4.Q.GBAR:Ket2)                ! Field GBAR:Ket2 is a hot field or requires assignment from browse
  BRW4.AddField(APD:ktt,BRW4.Q.APD:ktt)                    ! Field APD:ktt is a hot field or requires assignment from browse
  BRW4.AddField(APD:Jumlah,BRW4.Q.APD:Jumlah)              ! Field APD:Jumlah is a hot field or requires assignment from browse
  BRW4.AddField(APD:Total,BRW4.Q.APD:Total)                ! Field APD:Total is a hot field or requires assignment from browse
  BRW4.AddField(APD:Diskon,BRW4.Q.APD:Diskon)              ! Field APD:Diskon is a hot field or requires assignment from browse
  BRW4.AddField(APD:N0_tran,BRW4.Q.APD:N0_tran)            ! Field APD:N0_tran is a hot field or requires assignment from browse
  BRW4.AddField(APD:Harga_Dasar,BRW4.Q.APD:Harga_Dasar)    ! Field APD:Harga_Dasar is a hot field or requires assignment from browse
  BRW4.AddField(APD:total_dtg,BRW4.Q.APD:total_dtg)        ! Field APD:total_dtg is a hot field or requires assignment from browse
  BRW4.AddField(APD:Camp,BRW4.Q.APD:Camp)                  ! Field APD:Camp is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Kode_brg,BRW4.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_UpdateReturRanapPerTransNew',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW4.AskProcedure = 1
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
  BRW4.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW4.ToolbarItem.HelpButton = ?Help
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  if (self.request=1 and self.response=2) or (self.request=3 and self.response=1) then
      DO BATAL_D_UTAMA
      do batal_nomor
  end
  if self.request=1 and self.response=1 then
     do hapus_nomor_use
  end
  glo:ktt=0
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:APpotkem.Close
    Relate:Ano_pakai.Close
    Relate:Apklutmp.Close
    Relate:IAP_SET.Close
    Relate:JHBILLING.Close
    Relate:NomorUse.Close
    Relate:Nomor_Batal.Close
    Relate:Nomor_SKR.Close
    Relate:Tbstawal.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_UpdateReturRanapPerTransNew',QuickWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
    APH:Tanggal = Today()
    APH:User = Glo:USER_ID
    APH:Kode_Apotik = GL_entryapotik
    APH:Jam = clock()
  PARENT.PrimeFields


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  APH:Biaya = loc::total - loc::diskon
  APH:Harga_Dasar = GLO:HARGA_DASAR_INAP_RETUR_PEROBAT
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
    Trig_UpdateReturRawatJalanDetil
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
    OF ?OK
      ! *****UNTUK file ApHTrans******
      APH:User=GL::Prefix
      APH:Bayar=0
      APH:Ra_jal=0
      APH:User=Glo:USER_ID
      APH:Urut=glo:urut
      !APH:cara_bayar=JTra:Kode_Transaksi
      APH:Kode_Apotik=GL_entryapotik
      APH:shift       =vg_shift_apotik
      !glo::no_nota = APH:N0_tran
      
      IF Glo:lap= '1'
          APH:Nomor_mr = 9999999999
      ELSE
          APH:Nomor_mr = JPas:Nomor_mr
      END
      !APH:Biaya = - APH:Biaya
      
      !*****untuk file ApDTrans
      !cek dulu bulannya ya, kalau sudah berubah, tulis dulu ke file awal bulan
      IF MONTH(glo::tgl_awal_kerja) = MONTH(TODAY())
      !!
      !!    SET(APDTRANS)
      !!    APD:N0_tran = APH:N0_tran
      !!    SET(APD:by_transaksi,APD:by_transaksi)
      !!    LOOP
      !!        IF Access:APDTRANS.Next() <> level:benign OR APD:N0_tran <> APH:N0_tran THEN BREAK.
      !!        GSTO:Kode_Barang = APD:Kode_brg
      !!        GSTO:Kode_Apotik = GL_entryapotik
      !!        GET(GStokAptk,GSTO:KeyBarang)
      !!        IF ERRORCODE()=0
      !!            GSTO:Saldo = GSTO:Saldo + APD:Jumlah
      !!            Access:GStokAptk.Update()
      !!        ELSE
      !!            GSTO:Kode_Apotik = GL_entryapotik
      !!            GSTO:Kode_Barang = APD:Kode_brg
      !!            GSTO:Saldo = APD:Jumlah
      !!            GSTO:Harga_Dasar = APD:Total/APD:Jumlah
      !!            Access:GStokAptk.Insert()
      !!        END
      !!
      !!        ! **** tulis ke appotkem ***
      !!        APP1:N0_tran = APH:N0_tran
      !!        APP1:Kode_brg = APD:Kode_brg
      !!        GET(APpotkem,APP1:key_nota_brg)
      !!        IF ERRORCODE() = 0
      !!            APP1:Jumlah = APP1:Jumlah + APD:Jumlah
      !!            Access:APpotkem.Update()
      !!        ELSE
      !!            APP1:N0_tran = APH:N0_tran
      !!            APP1:Kode_brg = APD:Kode_brg
      !!            APP1:Jumlah = APD:Jumlah
      !!            Access:APpotkem.Insert()
      !!        END
      !!        ! *** end appotkem ***
      !!
      !!        GBAR:Kode_brg = APD:Kode_brg
      !!        Access:GBarang.Fetch(GBAR:KeyKodeBrg)
      !!        IF ERRORCODE() = 0
      !!                    GBAR:Stok_Total = GBAR:Stok_Total+APD:Jumlah
      !!                    Access:GBarang.Update()
      !!        ELSE
      !!                    MESSAGE ('LAPORKAN PADA EDP, KODE '&APD:Kode_brg&' TIDAK ADA DALAM TABEL')
      !!        END
      !!        APD:Jumlah = - APD:Jumlah
      !!        APD:Total = - APD:Total
      !!        PUT(APDTRANS)
      !!    END
      ELSE
      !!
      !!    !Untuk file apHtrans
          APH:Tanggal = TODAY()
          Tahun_ini = YEAR(TODAY())
          APH:NoTransaksiAsal = glo::no_nota
          aphtrans{prop:sql}='update dba.aphtrans set batal=1 where n0_tran='''&APH:NoTransaksiAsal&''''
      
          !untuk file ApDTrans
      
          SET(APDTRANS)
          APD:N0_tran = APH:N0_tran
          SET(APD:by_transaksi,APD:by_transaksi)
          LOOP
              IF Access:APDTRANS.Next() <> level:benign OR APD:N0_tran <> APH:N0_tran THEN BREAK.
              GSTO:Kode_Barang = APD:Kode_brg
              GSTO:Kode_Apotik = GL_entryapotik
              GET(GStokAptk,GSTO:KeyBarang)
      !!        IF ERRORCODE() = 0
      !!
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
                  !end ngisi tbstawal
      !!
      !!            GSTO:Saldo = GSTO:Saldo + APD:Jumlah
      !!            Access:GStokAptk.Update()
      !!        ELSE
      !!            GSTO:Kode_Apotik = GL_entryapotik
      !!            GSTO:Kode_Barang = APD:Kode_brg
      !!            GSTO:Saldo = APD:Jumlah
      !!            GSTO:Harga_Dasar = APD:Total/APD:Jumlah
      !!            Access:GStokAptk.Insert()
      !!
      !!            !tulist stok= 0 ke Aawalbulan
      !!            TBS:Kode_Apotik = APTH:ApotikKeluar
      !!            TBS:Kode_Barang = APTO:Kode_Brg
      !!            TBS:Tahun = Tahun_ini
      !!            GET(Tbstawal,TBS:kdap_brg)
      !!            IF ERRORCODE() = 0
      !!                CASE MONTH(TODAY())
      !!                    OF 1
      !!                        IF TBS:Januari= 0
      !!                            TBS:Januari = 0
      !!                            PUT(Tbstawal)
      !!                        END
      !!                    
      !!                    OF 2
      !!                        IF TBS:Februari= 0
      !!                            TBS:Februari = 0
      !!                            PUT(Tbstawal)
      !!                        END
      !!                        
      !!                    OF 3
      !!                        IF TBS:Maret= 0
      !!                            TBS:Maret = 0
      !!                            PUT(Tbstawal)
      !!                        END
      !!                        
      !!                    OF 4
      !!                        IF TBS:April= 0
      !!                            TBS:April = 0
      !!                            PUT(Tbstawal)
      !!                        END
      !!                        
      !!                    OF 5
      !!                        IF TBS:Mei= 0
      !!                            TBS:Mei = 0
      !!                            PUT(Tbstawal)
      !!                        END
      !!                        
      !!                    OF 6
      !!                        IF TBS:Juni= 0
      !!                            TBS:Juni = 0
      !!                            PUT(Tbstawal)
      !!                        END
      !!                        
      !!                    OF 7
      !!                        IF TBS:Juli= 0
      !!                            TBS:Juli = 0
      !!                            PUT(Tbstawal)
      !!                        END
      !!                        
      !!                    OF 8
      !!                        IF TBS:Agustus= 0
      !!                            TBS:Agustus = 0
      !!                            PUT(Tbstawal)
      !!                        END
      !!                        
      !!                    OF 9
      !!                        IF TBS:September= 0
      !!                            TBS:September = 0
      !!                            PUT(Tbstawal)
      !!                        END
      !!                        
      !!                    OF 10
      !!                        IF TBS:Oktober= 0
      !!                            TBS:Oktober = 0
      !!                            PUT(Tbstawal)
      !!                        END
      !!                        
      !!                    OF 11
      !!                        IF TBS:November= 0
      !!                            TBS:November = 0
      !!                            PUT(Tbstawal)
      !!                        END
      !!                    OF 12
      !!                        IF TBS:Desember= 0
      !!                            TBS:Desember = 0
      !!                            PUT(Tbstawal)
      !!                        END
      !!                END
      !!
      !!            ELSE
      !!                CASE MONTH(TODAY())
      !!                    OF 1
      !!                        TBS:Januari = 0
      !!                    OF 2
      !!                        TBS:Februari = 0
      !!                    OF 3
      !!                        TBS:Maret = 0
      !!                    OF 4
      !!                        TBS:April = 0
      !!                    OF 5
      !!                        TBS:Mei = 0
      !!                    OF 6
      !!                        TBS:Juni = 0
      !!                    OF 7
      !!                        TBS:Juli = 0
      !!                    OF 8
      !!                        TBS:Agustus = 0
      !!                    OF 9
      !!                        TBS:September = 0
      !!                    OF 10
      !!                        TBS:Oktober = 0
      !!                    OF 11
      !!                        TBS:November = 0
      !!                    OF 12
      !!                        TBS:Desember = 0
      !!                END
      !!                TBS:Kode_Apotik = APTH:ApotikKeluar
      !!                TBS:Kode_Barang = GSTO:Kode_Barang
      !!                TBS:Tahun = Tahun_ini
      !!                ADD(Tbstawal)
      !!                IF ERRORCODE() > 0
      !!                END
      !!            END
      !!            ! End nulis stok 0 ke tbstawal
      !!
      !!        END
      !!
      !!        ! **** tulis ke appotkem ***
      !!        APP1:N0_tran = APH:N0_tran
      !!        APP1:Kode_brg = APD:Kode_brg
      !!        GET(APpotkem,APP1:key_nota_brg)
      !!        IF ERRORCODE() = 0
      !!            APP1:Jumlah = APP1:Jumlah + APD:Jumlah
      !!            Access:APpotkem.Update()
      !!        ELSE
      !!            APP1:N0_tran = APH:N0_tran
      !!            APP1:Kode_brg = APD:Kode_brg
      !!            APP1:Jumlah = APD:Jumlah
      !!            Access:APpotkem.Insert()
      !!        END
      !!        ! *** end appotkem ***
      !!
      !!        GBAR:Kode_brg = APD:Kode_brg
      !!        Access:GBarang.Fetch(GBAR:KeyKodeBrg)
      !!        IF ERRORCODE() = 0
      !!                    GBAR:Stok_Total = GBAR:Stok_Total+APD:Jumlah
      !!                    Access:GBarang.Update()
      !!        ELSE
      !!                    MESSAGE ('LAPORKAN PADA EDP, KODE '&APD:Kode_brg&' TIDAK ADA DALAM TABEL')
      !!        END
      !!        APD:Jumlah = - APD:Jumlah
      !!        APD:Total = - APD:Total
      !!        PUT(APDTRANS)
          END
      END
      !!!!ANOp:Nomor = APH:N0_tran
      !!!!Get(Ano_pakai,ANOp:key_isi)
      !!!!DELETE(ANo_Pakai)
      !!
      apklutmp{prop:sql}='delete from dba.apklutmp where N0_tran='''&glo::no_nota&''''
    OF ?Cancel
      IF SELF.REQUEST=1
         !DO BATAL_D_UTAMA
      END
      
      SET(APklutmp)
      APKL:N0_tran = glo::no_nota
      SET(APKL:key_nota,APKL:key_nota)
      LOOP
          IF Access:APklutmp.Next()<>LEVEL:BENIGN OR APKL:N0_tran <> glo::no_nota THEN BREAK.
          DELETE(APklutmp)
      END
      
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button7
      ThisWindow.Update
      globalrequest=selectrecord
      glo:mr=Loc::no_mr
      SelectJTransaksiMR
      JHB:NOMOR=JTra:No_Nota
      if access:jhbilling.fetch(JHB:KNOMOR)=level:benign then
      
         APH:NoNota=JTra:No_Nota
      
      else
         message('Nomor Billing tidak ada !')
      end
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
    CASE EVENT()
    OF EVENT:AlertKey
      select(?cancel)
      presskey( 13)
    OF EVENT:OpenWindow
      IF glo::form_insert = 0
          POST(EVENT:CLOSEWINDOW)
      END
    OF EVENT:Timer
      IF APH:Biaya = 0 and glo:ktt=0
          ?OK{PROP:DISABLE}=1
      ELSE
          ?OK{PROP:DISABLE}=0
      END
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:CloseWindow
      !if (self.request=1 and self.response=2) or (self.request=3 and self.response=1) then
      !    DO BATAL_D_UTAMA
      !    do batal_nomor
      !end
      !if self.request=1 and self.response=1 then
      !   do hapus_nomor_use
      !end
    OF EVENT:OpenWindow
      if self.request=1 then
          do Isi_Nomor
          !message(format(clip(vg_notrans),@s12))
      !    apdtrans{prop:sql}='select * from dba.apdtrans where n0_tran='''&format(clip(vg_notrans),@s12)&''' and camp=0'
      !    apdtrans{prop:sql}='select * from dba.apdtrans where n0_tran='''&format(clip(vg_notrans),@s12)&''' and camp=0'
          APD:N0_tran=vg_notrans
          APD:Camp=0
          set(APD:by_tran_cam,APD:by_tran_cam)
          loop
              next(apdtrans)
              if errorcode() or APD:N0_tran<>vg_notrans then break.
              !message('ada')
              !message(APD:total_dtg)
              APD:N0_tran        =APH:N0_tran
              APD:Kode_brg       =APD:Kode_brg
              APD:Jumlah         =APD:Jumlah
              APD:Camp           =APD:Camp
              APD:Diskon         =0
              APD:Jum1           =0
              APD:Jum2           =0
      !        GBAR:Kode_brg      =APD:Kode_brg
      !        access:gbarang.fetch(GBAR:KeyKodeBrg)
      !
      !        GSGD:Kode_brg      =APD:Kode_brg
      !        access:gstockgdg.fetch(GSGD:KeyKodeBrg)
      !
      !        GSTO:Kode_Apotik = vg_kodeapotik
      !        GSTO:Kode_Barang = APD:Kode_brg
      !        GET(GStokaptk,GSTO:KeyBarang)
      !        IF APD:Jumlah > GSTO:Saldo
      !            MESSAGE(clip(GBAR:Nama_Brg)&' jumlah stok tinggal '&GSTO:Saldo)
      !            APD:Jumlah=0
      !            APD:Total = 0
      !        else
      !            if GBAR:StatusGen=1 or GBAR:StatusGen=3 then
      !               if GSGD:Harga_Beli > 0 AND GSGD:Harga_Beli < 501  then
      !                  APD:Total = GSGD:Harga_Beli * APD:Jumlah * -1
      !               elsif GSGD:Harga_Beli > 500 AND GSGD:Harga_Beli < 1001  then
      !                  APD:Total = GSGD:Harga_Beli * APD:Jumlah * -1
      !               elsif GSGD:Harga_Beli > 1000  then
      !                  APD:Total = GSGD:Harga_Beli * APD:Jumlah * -1
      !               end
      !            else
      !               APD:Total = GSGD:Harga_Beli * APD:Jumlah * -1
      !            end
              APD:Harga_Dasar = APD:Harga_Dasar * -1
              APD:total_dtg   = APD:total_dtg * -1
              APD:ktt         = APD:ktt
              APD:Total       = APD:Harga_Dasar * APD:Jumlah
              if APD:ktt=1 then
                  glo:ktt=1
              end
              access:apdtrans.insert()
      !        end
          END
          brw4.resetsort(1)
      end
      
      
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APH:Biaya = loc::total - loc::diskon
  APH:Harga_Dasar = GLO:HARGA_DASAR_INAP_RETUR_PEROBAT
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


BRW4.ResetFromView PROCEDURE

loc::total:Sum       REAL                                  ! Sum variable for browse totals
loc::diskon:Sum      REAL                                  ! Sum variable for browse totals
GLO:HARGA_DASAR_INAP_RETUR_PEROBAT:Sum REAL                ! Sum variable for browse totals
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
      loc::total:Sum += APD:Total
    END
    IF (APD:ktt=0)
      loc::diskon:Sum += APD:Diskon
    END
    IF (APD:ktt=0)
      GLO:HARGA_DASAR_INAP_RETUR_PEROBAT:Sum += APD:Harga_Dasar * APD:Jumlah
    END
    IF (APD:ktt=0)
      LOC::TOTAL_DTG:Sum += APD:total_dtg
    END
  END
  loc::total = loc::total:Sum
  loc::diskon = loc::diskon:Sum
  GLO:HARGA_DASAR_INAP_RETUR_PEROBAT = GLO:HARGA_DASAR_INAP_RETUR_PEROBAT:Sum
  LOC::TOTAL_DTG = LOC::TOTAL_DTG:Sum
  PARENT.ResetFromView
  Relate:APDTRANS.SetQuickScan(0)
  SETCURSOR()


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

