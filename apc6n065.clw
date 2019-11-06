

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N065.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N006.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N042.INC'),ONCE        !Req'd for module callout resolution
                     END


Trig_UpdateAptoInHe1 PROCEDURE                             ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
sudah_nomor          BYTE                                  !
Tahun_ini            LONG                                  !
Ada_difile           BYTE                                  !
putar                BYTE                                  !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
loc::nm_instalasi    STRING(30)                            !
vl_nomor             STRING(15)                            !
vl_ok                BYTE                                  !
BRW2::View:Browse    VIEW(AptoInDe)
                       PROJECT(APTD:Kode_Brg)
                       PROJECT(APTD:Jumlah)
                       PROJECT(APTD:Biaya)
                       PROJECT(APTD:N0_tran)
                       JOIN(GBAR:KeyKodeBrg,APTD:Kode_Brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Ket1)
                         PROJECT(GBAR:Ket2)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?Browse:2
APTD:Kode_Brg          LIKE(APTD:Kode_Brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Ket1              LIKE(GBAR:Ket1)                !List box control field - type derived from field
GBAR:Ket2              LIKE(GBAR:Ket2)                !List box control field - type derived from field
APTD:Jumlah            LIKE(APTD:Jumlah)              !List box control field - type derived from field
APTD:Biaya             LIKE(APTD:Biaya)               !List box control field - type derived from field
APTD:N0_tran           LIKE(APTD:N0_tran)             !Primary key field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::APTI:Record LIKE(APTI:RECORD),THREAD
QuickWindow          WINDOW('Transaksi Farmasi ke Instalasi Lain'),AT(,,418,252),FONT('MS Sans Serif',8,COLOR:Black,),IMM,HLP('UpdateAptoInHe'),ALRT(EscKey),TIMER(100),SYSTEM,GRAY,RESIZE,MDI
                       SHEET,AT(4,5,331,105),USE(?CurrentTab)
                         TAB('Data Umum'),USE(?Tab:1)
                           OPTION,AT(14,21,309,20),USE(glo:keluar_masuk_inst),BOXED
                             RADIO('Keluar Dari &Farmasi'),AT(47,28),USE(?Option1:Radio1),VALUE('1')
                             RADIO('Kembali Dari &Instalasi'),AT(206,28,83,9),USE(?Option1:Radio2),VALUE('0')
                           END
                           PROMPT('Nomor DKB:'),AT(13,51),USE(?APTI:nomordkb:Prompt)
                           ENTRY(@s20),AT(85,51,53,10),USE(APTI:nomordkb),DISABLE
                           BUTTON('...'),AT(141,49,12,12),USE(?CallLookup:2)
                           PROMPT('Kode Farmasi :'),AT(12,68),USE(?APTI:Kode_Apotik:Prompt),FONT(,,,FONT:bold)
                           ENTRY(@s5),AT(85,68,40,10),USE(APTI:Kode_Apotik),DISABLE,MSG('Kode Apotik'),TIP('Kode Apotik')
                           STRING(@s30),AT(136,69),USE(GL_namaapotik),FONT('Times New Roman',10,,)
                           PROMPT('Kode Instalasi :'),AT(12,84),USE(?APTI:Kd_ruang:Prompt),FONT(,,,FONT:bold)
                           ENTRY(@s5),AT(85,84,40,10),USE(APTI:Kd_ruang),DISABLE,MSG('Kode ruang yang dituju'),TIP('Kode ruang yang dituju'),REQ
                           BUTTON('&H'),AT(133,83,12,12),USE(?CallLookup),KEY(F2Key)
                           STRING(@s30),AT(154,84),USE(loc::nm_instalasi),FONT('Times New Roman',10,,FONT:regular)
                         END
                       END
                       PROMPT('Tanggal:'),AT(189,4),USE(?APTI:Tanggal:Prompt)
                       ENTRY(@D06),AT(222,4,104,10),USE(APTI:Tanggal),DISABLE,RIGHT(1)
                       ENTRY(@s15),AT(46,190,84,17),USE(APTI:N0_tran),DISABLE,FONT('Arial',12,,FONT:bold),MSG('nomor transaksi'),TIP('nomor transaksi')
                       BUTTON('&OK [End]'),AT(139,216,68,23),USE(?OK),LEFT,KEY(EndKey),ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(217,216,68,23),USE(?Cancel),LEFT,ICON(ICON:Cross)
                       BUTTON('Help'),AT(61,0,31,14),USE(?Help),HIDE,STD(STD:Help)
                       BUTTON('T&ransaksi (+)'),AT(139,188,72,23),USE(?Insert:3),LEFT,FONT('Times New Roman',10,,),KEY(PlusKey),ICON('INSERT.ICO')
                       LINE,AT(220,186,116,0),USE(?Line1),COLOR(COLOR:Black),LINEWIDTH(2)
                       BUTTON('&Edit [Ctrl]'),AT(4,216,130,23),USE(?Change:3),FONT(,,,FONT:bold),KEY(529)
                       BUTTON('&Delete'),AT(115,2,45,14),USE(?Delete:3),HIDE
                       LIST,AT(5,115,408,66),USE(?Browse:2),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('44L(2)|M~Kode Brg~@s10@128L(2)|M~Nama Barang~@s40@67L(2)|M~Kemasan~@s50@86L(2)|M' &|
   '~Keterangan~@s50@60R(2)|M~Jumlah~C(0)@n-15.2@64R(2)|M~Biaya~C(0)@n-15.2@'),FROM(Queue:Browse:2)
                       PANEL,AT(4,188,130,23),USE(?Panel1)
                       PROMPT('NO. Trans :'),AT(7,193),USE(?APTI:N0_tran:Prompt)
                       PROMPT('Total Biaya:'),AT(222,195),USE(?APTI:Total_Biaya:Prompt)
                       ENTRY(@n-15.2),AT(272,194),USE(APTI:Total_Biaya),RIGHT(1)
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
                     END

Toolbar              ToolbarClass
BRW2                 CLASS(BrowseClass)                    ! Browse using ?Browse:2
Q                      &Queue:Browse:2                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetFromView          PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW2::Sort0:StepClass StepStringClass                      ! Default Step Manager
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
BATAL_aptoin ROUTINE
    SET( BRW2::View:Browse)
    LOOP
        NEXT( BRW2::View:Browse)
        IF ERRORCODE() THEN BREAK.
        DELETE( BRW2::View:Browse)
    END

!Proses Penomoran Otomatis Transaksi
Isi_Nomor Routine
   vl_nomor=''
   display
   loop
      logout(1,nomor_batal)
      if errorcode()=56 then
         cycle.
      !Silahkan diganti ---> 2=Transaksi Apotik ke Ruangan
      NOM:No_Urut=2
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 2=Transaksi Apotik ke Ruangan
         NOMU:Urut =2
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
        !Silahkan diganti ---> 2=Transaksi Apotik ke Ruangan
        NOM1:No_urut=2
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 2=Transaksi Apotik ke Ruangan
           NOMU:Urut =2
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
      !Silahkan diganti ---> 2=Transaksi Apotik ke Ruangan
      nomor_batal{prop:sql}='delete dba.nomor_batal where No=2'
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 2=Transaksi Apotik ke Ruangan
         NOM1:No_urut=2
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
   APTI:N0_tran=vl_nomor
   display

Batal_Nomor Routine
   !Silahkan diganti ---> 2=Transaksi Apotik ke Ruangan
   NOM:No_Urut =2
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=APTI:N0_tran
   NOM:Keterangan='Aptk ke Ruangan'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 2=Transaksi Apotik ke Ruangan
   NOMU:Urut =2
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOMU:Nomor=APTI:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   delete(nomoruse)

hapus_nomor_user routine
   NOMU:Urut    =2
   NOMU:Nomor   =APTI:N0_tran
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
    ActionMessage = 'Adding a AptoInHe Record'
  OF ChangeRecord
    ActionMessage = 'Changing a AptoInHe Record'
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  ?OK{PROP:DISABLE}=TRUE
  ?BROWSE:2{PROP:DISABLE}=TRUE
  ?Insert:3{PROP:DISABLE}=TRUE
  CLEAR(loc::nm_instalasi)
  CLEAR(TBis:Kode_Instalasi)
  glo:keluar_masuk_inst = 1   !---untuk tentukan keluar atau kembali barang-----
  sudah_nomor=0
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_UpdateAptoInHe1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Option1:Radio1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APTI:Record,History::APTI:Record)
  SELF.AddHistoryField(?APTI:nomordkb,7)
  SELF.AddHistoryField(?APTI:Kode_Apotik,1)
  SELF.AddHistoryField(?APTI:Kd_ruang,6)
  SELF.AddHistoryField(?APTI:Tanggal,2)
  SELF.AddHistoryField(?APTI:N0_tran,3)
  SELF.AddHistoryField(?APTI:Total_Biaya,5)
  SELF.AddUpdateFile(Access:AptoInHe)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Ano_pakai.Open                                    ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Relate:ApObInst.SetOpenRelated()
  Relate:ApObInst.Open                                     ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Relate:IAP_SET.Open                                      ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Relate:INDDKB.Open                                       ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_Batal.Open                                  ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Relate:Tbstawal.Open                                     ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Access:AptoInHe.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GBarang.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:AptoInHe
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
  BRW2.Init(?Browse:2,Queue:Browse:2.ViewPosition,BRW2::View:Browse,Queue:Browse:2,Relate:AptoInDe,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  if self.request=1 then
     do Isi_Nomor
  end
  vl_ok=0
  ?Browse:2{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW2.Q &= Queue:Browse:2
  BRW2::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon APTD:Kode_Brg for sort order 1
  BRW2.AddSortOrder(BRW2::Sort0:StepClass,APTD:key_no_nota) ! Add the sort order for APTD:key_no_nota for sort order 1
  BRW2.AddRange(APTD:N0_tran,Relate:AptoInDe,Relate:AptoInHe) ! Add file relationship range limit for sort order 1
  BRW2.AddField(APTD:Kode_Brg,BRW2.Q.APTD:Kode_Brg)        ! Field APTD:Kode_Brg is a hot field or requires assignment from browse
  BRW2.AddField(GBAR:Nama_Brg,BRW2.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW2.AddField(GBAR:Ket1,BRW2.Q.GBAR:Ket1)                ! Field GBAR:Ket1 is a hot field or requires assignment from browse
  BRW2.AddField(GBAR:Ket2,BRW2.Q.GBAR:Ket2)                ! Field GBAR:Ket2 is a hot field or requires assignment from browse
  BRW2.AddField(APTD:Jumlah,BRW2.Q.APTD:Jumlah)            ! Field APTD:Jumlah is a hot field or requires assignment from browse
  BRW2.AddField(APTD:Biaya,BRW2.Q.APTD:Biaya)              ! Field APTD:Biaya is a hot field or requires assignment from browse
  BRW2.AddField(APTD:N0_tran,BRW2.Q.APTD:N0_tran)          ! Field APTD:N0_tran is a hot field or requires assignment from browse
  BRW2.AddField(GBAR:Kode_brg,BRW2.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_UpdateAptoInHe1',QuickWindow)         ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW2.AskProcedure = 3
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
  BRW2.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW2.ToolbarItem.HelpButton = ?Help
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  if self.request=1 then
     if self.response=2 then
        INH:Nomor=APTI:nomordkb
        if access:inhdkb.fetch(INH:PK)=level:benign then
           INH:Ambil=0
           access:inhdkb.update()
        end
  
        do Batal_Nomor
        DO BATAL_aptoin
     elsif self.response=1 then
        do hapus_nomor_user
     end
  elsif self.request=3 then
     if self.response=1 then
        do Batal_Nomor
     end
  end
  
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Ano_pakai.Close
    Relate:ApObInst.Close
    Relate:IAP_SET.Close
    Relate:INDDKB.Close
    Relate:NomorUse.Close
    Relate:Nomor_Batal.Close
    Relate:Nomor_SKR.Close
    Relate:Tbstawal.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_UpdateAptoInHe1',QuickWindow)      ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
    APTI:Tanggal = TODAY()
    APTI:Kode_Apotik = GL_entryapotik
    APTI:User = GL::prefix
    APTI:User = glo:user_id
  PARENT.PrimeFields


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  INH:Nomor = APTI:nomordkb                                ! Assign linking field value
  Access:INHDKB.Fetch(INH:PK)
  TBis:Kode_Instalasi = APTI:Kd_ruang                      ! Assign linking field value
  Access:TBinstli.Fetch(TBis:keykodeins)
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
      SelectDKBInstalasi
      cari_instalasi
      UpdateAptoInDe
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
    OF ?APTI:Kd_ruang
      TBis:Kode_Instalasi=APTI:Kd_ruang
      GET(TBinstli, TBis:keykodeins)
      IF ERRORCODE() > 0
          MESSAGE('Kode Instalasi Tidak Ada Dalam daftar')
          ?BROWSE:2{PROP:DISABLE}=1
          ?Insert:3{PROP:DISABLE}=TRUE
          SELECT(?APTI:Kd_ruang)
      ELSE
          ?BROWSE:2{PROP:DISABLE}=0
          ?Insert:3{PROP:DISABLE}=0
          loc::nm_instalasi=TBis:Nama_instalasi
      END
    OF ?CallLookup
      ?BROWSE:2{PROP:DISABLE}=0
      ?Insert:3{PROP:DISABLE}=0
      loc::nm_instalasi=TBis:Nama_instalasi
      display
    OF ?OK
      vl_ok=1
      glo::no_nota = APTI:N0_tran
      
      ! *****UNTUK file ApTOinHe******
      APTI:User=Glo:USER_ID
      APTI:Kode_Apotik = GL_entryapotik
      
      !cek dulu bulannya ya, kalau sudah berubah, tulis dulu ke file awal bulan
      IF glo:keluar_masuk_inst = 1
      
      ELSE
         APTI:Total_Biaya = - APTI:Total_Biaya
      END
      
      sudah_nomor=0
      display
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?glo:keluar_masuk_inst
      if vl_ok=0 then
      if glo:keluar_masuk_inst=0 then
         enable(?CallLookup)
         disable(APTI:nomordkb)
         disable(?CallLookup:2)
         APTI:nomordkb=''
         APTI:Kd_ruang=''
         SET( BRW2::View:Browse)
         LOOP
              NEXT( BRW2::View:Browse)
              IF ERRORCODE() THEN BREAK.
              DELETE( BRW2::View:Browse)
         END
         SET( BRW2::View:Browse)
         LOOP
              NEXT( BRW2::View:Browse)
              IF ERRORCODE() THEN BREAK.
              DELETE( BRW2::View:Browse)
         END
      
         BRW2.resetsort(1)
      else
         enable(?CallLookup)
         enable(APTI:nomordkb)
         enable(?CallLookup:2)
         APTI:nomordkb=''
         APTI:Kd_ruang=''
         SET( BRW2::View:Browse)
         LOOP
              NEXT( BRW2::View:Browse)
              IF ERRORCODE() THEN BREAK.
              DELETE( BRW2::View:Browse)
         END
         SET( BRW2::View:Browse)
         LOOP
              NEXT( BRW2::View:Browse)
              IF ERRORCODE() THEN BREAK.
              DELETE( BRW2::View:Browse)
         END
      
         BRW2.resetsort(1)
      end
      display
      end
    OF ?APTI:nomordkb
      IF APTI:nomordkb OR ?APTI:nomordkb{Prop:Req}
        INH:Nomor = APTI:nomordkb
        IF Access:INHDKB.TryFetch(INH:PK)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            APTI:nomordkb = INH:Nomor
          ELSE
            SELECT(?APTI:nomordkb)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup:2
      ThisWindow.Update
      INH:Nomor = APTI:nomordkb
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        APTI:nomordkb = INH:Nomor
      END
      ThisWindow.Reset(1)
      !
      APTI:Kd_ruang=INH:Instalasi
      display
      inddkb{prop:sql}='select * from dba.inddkb where nomor='''&APTI:nomordkb&''''
      loop
         if access:inddkb.next()<>level:benign then break.
         GBAR:Kode_brg=IND:KodeBarang
         access:gbarang.fetch(GBAR:KeyKodeBrg)
      
         GSTO:Kode_Apotik = APTI:Kode_Apotik
         GSTO:Kode_Barang = IND:KodeBarang
         GET(GStokaptk,GSTO:KeyBarang)
         if not(errorcode()) then
            !message(IND:Jumlah&' '&GSTO:Saldo)
            IF IND:Jumlah <= GSTO:Saldo
               APTD:Kode_Brg =IND:KodeBarang
               APTD:N0_tran  =APTI:N0_tran
               APTD:Jumlah   =IND:Jumlah
               APTD:Biaya = IND:Jumlah * GSTO:Harga_Dasar*1.1
               if GBAR:Kelompok=23 then
                  APTD:Biaya = APTD:Jumlah * (GSTO:Harga_Dasar*1.1*1.25 + 7000)
               end
               access:aptoinde.insert()
            else
               APTD:Kode_Brg =IND:KodeBarang
               APTD:N0_tran  =APTI:N0_tran
               APTD:Jumlah   =GSTO:Saldo
               APTD:Biaya = (GSTO:Saldo)* GSTO:Harga_Dasar*1.1
               if GBAR:Kelompok=23 then
                  APTD:Biaya = (GSTO:Saldo) * (GSTO:Harga_Dasar*1.1*1.25 + 7000)
               end
               access:aptoinde.insert()
            end
         else
            APTD:Kode_Brg =IND:KodeBarang
            APTD:N0_tran  =APTI:N0_tran
            APTD:Jumlah   =0
            APTD:Biaya    = 0
            access:aptoinde.insert()
         end
      end
      
      INH:Nomor=APTI:nomordkb
      if access:inhdkb.fetch(INH:PK)=level:benign then
         INH:Ambil=1
         access:inhdkb.update()
      end
      
      brw2.resetfromfile
      brw2.resetsort(1)
      
      disable(?CallLookup)
    OF ?APTI:Kd_ruang
      IF APTI:Kd_ruang OR ?APTI:Kd_ruang{Prop:Req}
        TBis:Kode_Instalasi = APTI:Kd_ruang
        IF Access:TBinstli.TryFetch(TBis:keykodeins)
          IF SELF.Run(2,SelectRecord) = RequestCompleted
            APTI:Kd_ruang = TBis:Kode_Instalasi
          ELSE
            SELECT(?APTI:Kd_ruang)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      TBis:Kode_Instalasi = APTI:Kd_ruang
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        APTI:Kd_ruang = TBis:Kode_Instalasi
      END
      ThisWindow.Reset(1)
    OF ?OK
      ThisWindow.Update
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?Insert:3
      ThisWindow.Update
      disable(?glo:keluar_masuk_inst)
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
      !IF SELF.RESPONSE = 1
      !   IF APTI:Total_Biaya>=0 THEN
      !      start(Cetak_tran_ruang_1,25000)
      !   ELSE
      !      start(Cetak_tran_ruang_1_Retur,25000)
      !   END
      !END
    OF EVENT:Timer
      IF APTI:Total_Biaya = 0
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


BRW2.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW2.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END


BRW2.ResetFromView PROCEDURE

APTI:Total_Biaya:Sum REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:AptoInDe.SetQuickScan(1)
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
    APTI:Total_Biaya:Sum += APTD:Biaya
  END
  APTI:Total_Biaya = APTI:Total_Biaya:Sum
  PARENT.ResetFromView
  Relate:AptoInDe.SetQuickScan(0)
  SETCURSOR()


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

SelectDKBInstalasi PROCEDURE                               ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(INHDKB)
                       PROJECT(INH:Nomor)
                       PROJECT(INH:Tanggal)
                       PROJECT(INH:Jam)
                       PROJECT(INH:Operator)
                       PROJECT(INH:Validasi)
                       PROJECT(INH:TanggalValidasi)
                       PROJECT(INH:JamValidasi)
                       PROJECT(INH:UserValidasi)
                       PROJECT(INH:Instalasi)
                       PROJECT(INH:Ambil)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
INH:Nomor              LIKE(INH:Nomor)                !List box control field - type derived from field
INH:Tanggal            LIKE(INH:Tanggal)              !List box control field - type derived from field
INH:Jam                LIKE(INH:Jam)                  !List box control field - type derived from field
INH:Operator           LIKE(INH:Operator)             !List box control field - type derived from field
INH:Validasi           LIKE(INH:Validasi)             !List box control field - type derived from field
INH:TanggalValidasi    LIKE(INH:TanggalValidasi)      !List box control field - type derived from field
INH:JamValidasi        LIKE(INH:JamValidasi)          !List box control field - type derived from field
INH:UserValidasi       LIKE(INH:UserValidasi)         !List box control field - type derived from field
INH:Instalasi          LIKE(INH:Instalasi)            !List box control field - type derived from field
INH:Ambil              LIKE(INH:Ambil)                !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('DKB Online ...'),AT(,,358,254),FONT('MS Sans Serif',8,,),IMM,HLP('SelectDKBInstalasi'),SYSTEM,GRAY,RESIZE,MDI
                       LIST,AT(8,20,342,192),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('52L(2)|M~Nomor~@s12@80R(2)|M~Tanggal~C(0)@d06@80R(2)|M~Jam~C(0)@t04@80L(2)|M~Ope' &|
   'rator~@s20@36R(2)|M~Validasi~C(0)@n3@80R(2)|M~Tanggal Validasi~C(0)@d06@80R(2)|M' &|
   '~Jam Validasi~C(0)@t04@80L(2)|M~User Validasi~@s20@40L(2)|M~Instalasi~@s5@12L(2)' &|
   '|M~Ambil~@n3@'),FROM(Queue:Browse:1)
                       BUTTON('&Pilih'),AT(305,217,45,14),USE(?Select:2)
                       SHEET,AT(4,4,350,230),USE(?CurrentTab)
                         TAB('Nomor'),USE(?Tab:2)
                           PROMPT('Nomor:'),AT(8,218),USE(?INH:Nomor:Prompt)
                           ENTRY(@s12),AT(58,218,60,10),USE(INH:Nomor)
                         END
                       END
                       BUTTON('&Selesai'),AT(305,239,45,14),USE(?Close)
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
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('SelectDKBInstalasi')
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
  Relate:INHDKB.Open                                       ! File INHDKB used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:INHDKB,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,INH:ins_inhdkb_fk)                    ! Add the sort order for INH:ins_inhdkb_fk for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,INH:Instalasi,1,BRW1)          ! Initialize the browse locator using  using key: INH:ins_inhdkb_fk , INH:Instalasi
  BRW1.AddSortOrder(,INH:PK)                               ! Add the sort order for INH:PK for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?INH:Nomor,INH:Nomor,1,BRW1)    ! Initialize the browse locator using ?INH:Nomor using key: INH:PK , INH:Nomor
  BRW1.SetFilter('(inh:validasi=1 and inh:ambil<<>1)')     ! Apply filter expression to browse
  BRW1.AddField(INH:Nomor,BRW1.Q.INH:Nomor)                ! Field INH:Nomor is a hot field or requires assignment from browse
  BRW1.AddField(INH:Tanggal,BRW1.Q.INH:Tanggal)            ! Field INH:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(INH:Jam,BRW1.Q.INH:Jam)                    ! Field INH:Jam is a hot field or requires assignment from browse
  BRW1.AddField(INH:Operator,BRW1.Q.INH:Operator)          ! Field INH:Operator is a hot field or requires assignment from browse
  BRW1.AddField(INH:Validasi,BRW1.Q.INH:Validasi)          ! Field INH:Validasi is a hot field or requires assignment from browse
  BRW1.AddField(INH:TanggalValidasi,BRW1.Q.INH:TanggalValidasi) ! Field INH:TanggalValidasi is a hot field or requires assignment from browse
  BRW1.AddField(INH:JamValidasi,BRW1.Q.INH:JamValidasi)    ! Field INH:JamValidasi is a hot field or requires assignment from browse
  BRW1.AddField(INH:UserValidasi,BRW1.Q.INH:UserValidasi)  ! Field INH:UserValidasi is a hot field or requires assignment from browse
  BRW1.AddField(INH:Instalasi,BRW1.Q.INH:Instalasi)        ! Field INH:Instalasi is a hot field or requires assignment from browse
  BRW1.AddField(INH:Ambil,BRW1.Q.INH:Ambil)                ! Field INH:Ambil is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectDKBInstalasi',QuickWindow)           ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:INHDKB.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectDKBInstalasi',QuickWindow)        ! Save window data to non-volatile store
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

UpdateAptoInDe PROCEDURE                                   ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
History::APTD:Record LIKE(APTD:RECORD),THREAD
QuickWindow          WINDOW('Merubah data Obat'),AT(,,218,123),FONT('Times New Roman',10,COLOR:Black,),IMM,HLP('UpdateAptoInDe'),SYSTEM,GRAY,RESIZE,MDI
                       SHEET,AT(4,4,203,84),USE(?CurrentTab),COLOR(0C6C124H)
                         TAB('Data Detail'),USE(?Tab:1)
                           PROMPT('Kode Barang:'),AT(8,22),USE(?APTD:Kode_Brg:Prompt)
                           ENTRY(@s10),AT(59,22,44,10),USE(APTD:Kode_Brg)
                           BUTTON('&H'),AT(110,21,12,12),USE(?CallLookup),KEY(F2Key)
                           STRING(@s40),AT(60,39,140,10),USE(GBAR:Nama_Brg)
                           PROMPT('No. Transaksi :'),AT(59,4),USE(?APTD:N0_tran:Prompt)
                           ENTRY(@s15),AT(113,4,64,10),USE(APTD:N0_tran),MSG('nomor transaksi'),TIP('nomor transaksi')
                           PROMPT('Jumlah:'),AT(8,55),USE(?APTD:Jumlah:Prompt)
                           ENTRY(@n15.2),AT(60,55,64,10),USE(APTD:Jumlah),RIGHT(2)
                           PROMPT('Biaya:'),AT(9,73),USE(?APTD:Biaya:Prompt)
                           ENTRY(@n-15.2),AT(60,73,64,10),USE(APTD:Biaya),RIGHT(2)
                         END
                       END
                       BUTTON('&OK [End]'),AT(79,96,58,19),USE(?OK),LEFT,KEY(EndKey),ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(149,96,58,19),USE(?Cancel),LEFT,ICON(ICON:Cross)
                       BUTTON('Help'),AT(4,93,45,14),USE(?Help),HIDE,STD(STD:Help)
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
    ActionMessage = 'Adding a AptoInDe Record'
  OF ChangeRecord
    ActionMessage = 'Changing a AptoInDe Record'
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  ?OK{PROP:DISABLE}=TRUE
  ?APTD:Biaya{PROP:READONLY}=TRUE
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateAptoInDe')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APTD:Kode_Brg:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APTD:Record,History::APTD:Record)
  SELF.AddHistoryField(?APTD:Kode_Brg,1)
  SELF.AddHistoryField(?APTD:N0_tran,2)
  SELF.AddHistoryField(?APTD:Jumlah,3)
  SELF.AddHistoryField(?APTD:Biaya,4)
  SELF.AddUpdateFile(Access:AptoInDe)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:ApObInst.Open                                     ! File AptoInHe used by this procedure, so make sure it's RelationManager is open
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:AptoInHe.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:AptoInDe
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
  INIMgr.Fetch('UpdateAptoInDe',QuickWindow)               ! Restore window settings from non-volatile store
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
    Relate:ApObInst.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateAptoInDe',QuickWindow)            ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = APTD:Kode_Brg                            ! Assign linking field value
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
    OF ?APTD:Kode_Brg
      IF  glo:keluar_masuk_inst = 1
          GSTO:Kode_Barang=APTD:Kode_Brg
          GSTO:Kode_Apotik=GL_entryapotik
          GET(GStokAptk,GSTO:KeyBarang)
      ELSE
          APOB:Kode_brg       = APTD:Kode_Brg
          APOB:Kode_Instalasi = APTI:Kd_ruang
          GET(ApObInst,APOB:keykd_barang)
      END
      IF ERRORCODE()
          ?APTD:Jumlah{PROP:DISABLE}=1
          MESSAGE('Barang tersebut tidak ada dalam Daftar Obat')
          CLEAR (APTD:Kode_Brg)
          CLEAR (GBAR:Nama_Brg)
          DISPLAY
          SELECT(?APTD:Kode_Brg)
      ELSE
          ?APTD:Jumlah{PROP:DISABLE}=0
          select(?APTD:Jumlah)
      END
      !message(GBAR:Kelompok)
    OF ?APTD:Jumlah
      IF APTD:Jumlah = 0
          ?OK{PROP:DISABLE}=1
      ELSE
          IF self.request = changerecord
                  GSTO:Kode_Apotik = GL_entryapotik
                  GSTO:Kode_Barang = APTD:Kode_Brg
                  GET(GStokaptk,GSTO:KeyBarang)
          END
          !
          !message(APTD:Jumlah&' -- '&GSTO:Saldo&' == '&APOB:Saldo)
          IF glo:keluar_masuk_inst = 1 AND APTD:Jumlah > GSTO:Saldo
              MESSAGE('JUMLAH di stok tinggal :'& GSTO:Saldo)
              SELECT(?APTD:Jumlah)
              CYCLE
          ELSIF glo:keluar_masuk_inst = 0 AND APTD:Jumlah > APOB:Saldo
              MESSAGE('JUMLAH di stok tinggal :'& APOB:Saldo)
              SELECT(?APTD:Jumlah)
              CYCLE
          END
          ?OK{PROP:DISABLE}=0
          !message(GBAR:Kelompok)
          ! ini harus dicek lagi
          IF  glo:keluar_masuk_inst = 1
             APTD:Biaya = APTD:Jumlah * GSTO:Harga_Dasar*1.1
             if GBAR:Kelompok=23 then
                APTD:Biaya = APTD:Jumlah * (GSTO:Harga_Dasar*1.1*1.25 + 7000)
             end
          ELSE
             APTD:Biaya = APTD:Jumlah * APOB:Harga_Dasar*1.1
             if GBAR:Kelompok=23 then
                APTD:Biaya = APTD:Jumlah * (APOB:Harga_Dasar*1.1*1.25 + 7000)
             end
          end
          DISPLAY
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?APTD:Kode_Brg
      IF APTD:Kode_Brg OR ?APTD:Kode_Brg{Prop:Req}
        GBAR:Kode_brg = APTD:Kode_Brg
        IF Access:GBarang.TryFetch(GBAR:KeyKodeBrg)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            APTD:Kode_Brg = GBAR:Kode_brg
          ELSE
            SELECT(?APTD:Kode_Brg)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      GBAR:Kode_brg = APTD:Kode_Brg
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        APTD:Kode_Brg = GBAR:Kode_brg
      END
      ThisWindow.Reset(1)
      IF glo:keluar_masuk_inst = 1
          GSTO:Kode_Barang=APTD:Kode_Brg
          GSTO:Kode_Apotik=GL_entryapotik
          GET(GStokAptk,GSTO:KeyBarang)
      ELSE
          APOB:Kode_brg = APTD:Kode_Brg
          APOB:Kode_Instalasi = APTI:Kd_ruang
          GET(ApObInst,APOB:keykd_barang)
      END
      IF ERRORCODE()
          ?APTD:Jumlah{PROP:DISABLE}=1
          MESSAGE('Barang tersebut tidak ada dalam Daftar Obat')
          CLEAR (APTD:Kode_Brg)
          CLEAR (GBAR:Nama_Brg)
          DISPLAY
          SELECT(?APTD:Kode_Brg)
      ELSE
          ?APTD:Jumlah{PROP:DISABLE}=0
          select(?APTD:Jumlah)
      END
      !IF  glo:keluar_masuk_inst = 1
      !   APTD:Biaya = APTD:Jumlah * GSTO:Harga_Dasar*1.1
      !ELSE
      !   APTD:Biaya = APTD:Jumlah * APOB:Harga_Dasar*1.1
      !end
      IF glo:keluar_masuk_inst = 1
         APTD:Biaya = APTD:Jumlah * GSTO:Harga_Dasar*1.1
         if GBAR:Kelompok=23 then
            APTD:Biaya = APTD:Jumlah * (GSTO:Harga_Dasar*1.1*1.25 + 7000)
         end
      ELSE
         APTD:Biaya = APTD:Jumlah * APOB:Harga_Dasar*1.1
         if GBAR:Kelompok=23 then
            APTD:Biaya = APTD:Jumlah * (APOB:Harga_Dasar*1.1*1.25 + 7000)
         end
      end
      DISPLAY
      !message(GBAR:Kelompok)
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

cetak_tran_ruang1 PROCEDURE                                ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
loc::kosong          STRING(20)                            !
loc::nama_ruang      STRING(30)                            !Nama instalasi :
vl_nama_apotik       STRING(20)                            !
vl_jam               TIME                                  !
vl_harga_dsr         REAL                                  !
Process:View         VIEW(AptoInDe)
                       PROJECT(APTD:Biaya)
                       PROJECT(APTD:Jumlah)
                       PROJECT(APTD:Kode_Brg)
                       PROJECT(APTD:N0_tran)
                       JOIN(GBAR:KeyKodeBrg,APTD:Kode_Brg)
                         PROJECT(GBAR:Nama_Brg)
                       END
                       JOIN(APTI:key_no_tran,APTD:N0_tran)
                         PROJECT(APTI:Kd_ruang)
                         PROJECT(APTI:Kode_Apotik)
                         PROJECT(APTI:N0_tran)
                         PROJECT(APTI:Tanggal)
                         PROJECT(APTI:Total_Biaya)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(167,2083,3198,8000),PAPER(PAPER:USER,8250,13000),PRE(RPT),THOUS
                       HEADER,AT(156,1000,3177,1083)
                         STRING('Ins. Farmasi RSI--SBBK ke Instalasi'),AT(188,21,2260,198),USE(?String2),TRN,FONT('Times New Roman',10,,)
                         STRING(@s15),AT(188,510,979,188),USE(APTI:N0_tran),TRN,FONT('Times New Roman',8,,)
                         STRING(@D08),AT(1188,510),USE(APTI:Tanggal),TRN,RIGHT(1),FONT('Times New Roman',8,,)
                         STRING(@s5),AT(573,333),USE(APTI:Kd_ruang),TRN,FONT('Times New Roman',8,,)
                         STRING('/'),AT(938,333),USE(?String12),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         STRING(@s30),AT(1000,333,1938,188),USE(loc::nama_ruang),TRN,FONT('Times New Roman',8,,)
                         STRING(@t04),AT(2021,510),USE(vl_jam),TRN,FONT('Arial',8,,FONT:regular)
                         BOX,AT(167,677,2521,406),USE(?Box1),COLOR(COLOR:Black)
                         STRING('Total'),AT(1573,885),USE(?String31),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         LINE,AT(1875,885,0,190),USE(?Line3:2),COLOR(COLOR:Black)
                         STRING('Hrg+Ppn+20%'),AT(1896,885),USE(?String31:2),TRN,FONT('Times New Roman',8,,)
                         LINE,AT(156,875,2521,0),USE(?Line11),COLOR(COLOR:Black)
                         LINE,AT(844,885,0,190),USE(?Line3:8),COLOR(COLOR:Black)
                         LINE,AT(1208,885,0,190),USE(?Line3:6),COLOR(COLOR:Black)
                         STRING('Kode Brg'),AT(240,885),USE(?String28),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         STRING('Jumlah'),AT(865,885),USE(?String30),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         STRING('Nama Barang'),AT(198,719),USE(?String29),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         STRING(@s5),AT(188,188),USE(APTI:Kode_Apotik),TRN,FONT('Times New Roman',8,,)
                         STRING('/'),AT(604,188),USE(?String11),TRN,FONT('Times New Roman',8,,)
                         STRING(@s30),AT(781,188,1958,188),USE(vl_nama_apotik),TRN,FONT('Times New Roman',8,,)
                         STRING('Tujuan: '),AT(188,333),USE(?String10),TRN,FONT('Times New Roman',8,,)
                       END
break1                 BREAK(loc::kosong)
detail1                  DETAIL,AT(10,,4865,354)
                           STRING(@n6),AT(844,177),USE(APTD:Jumlah),TRN,LEFT(1),FONT('Times New Roman',8,,)
                           STRING(@s40),AT(177,21,2521,188),USE(GBAR:Nama_Brg),TRN,FONT('Times New Roman',8,,)
                           STRING(@s10),AT(177,177,646,188),USE(APTD:Kode_Brg),TRN,FONT('Times New Roman',8,,)
                           STRING(@n-12),AT(1198,177),USE(APTD:Biaya),TRN,LEFT(1),FONT('Times New Roman',8,,)
                           STRING(@n-12),AT(1854,177,708,188),USE(vl_harga_dsr),RIGHT(14),FONT('Times New Roman',8,,FONT:regular)
                         END
                         FOOTER,AT(10,0,7656,896)
                           STRING('1. Ybs'),AT(198,198),USE(?String15),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('Total : Rp.'),AT(406,31),USE(?String18),TRN,FONT('Times New Roman',8,,)
                           STRING(@n-14),AT(1073,31,802,188),USE(APTI:Total_Biaya),TRN,LEFT(1),FONT('Times New Roman',8,,)
                           STRING('2. Akuntansi'),AT(188,333),USE(?String16),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('Petugas Farmasi'),AT(1677,219),USE(?String20),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('3. Arsip'),AT(188,490),USE(?String17),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING(@s10),AT(1729,573),USE(Glo:USER_ID),CENTER,FONT('Times New Roman',8,COLOR:Black,)
                           LINE,AT(10,10,2900,0),USE(?Line4),COLOR(COLOR:Black)
                           STRING('(.{28})'),AT(1573,625),USE(?String22),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         END
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
  GlobalErrors.SetProcedureName('cetak_tran_ruang1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  vl_jam = CLOCK()
  Relate:AptoInDe.Open                                     ! File GApotik used by this procedure, so make sure it's RelationManager is open
  Access:TBinstli.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GApotik.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('cetak_tran_ruang1',ProgressWindow)         ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:AptoInDe, ?Progress:PctText, Progress:Thermometer, ProgressMgr, APTD:Kode_Brg)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(APTD:key_no_nota)
  ThisReport.AddRange(APTD:N0_tran,glo:no_trans_ruang)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report)
  ?Progress:UserString{Prop:Text}=''
  Relate:AptoInDe.SetQuickScan(1,Propagate:OneMany)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AptoInDe.Close
  END
  IF SELF.Opened
    INIMgr.Update('cetak_tran_ruang1',ProgressWindow)      ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = APTD:Kode_Brg                            ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  APTI:N0_tran = APTD:N0_tran                              ! Assign linking field value
  Access:AptoInHe.Fetch(APTI:key_no_tran)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  GBAR:Kode_brg = APTD:Kode_Brg                            ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  APTI:N0_tran = APTD:N0_tran                              ! Assign linking field value
  Access:AptoInHe.Fetch(APTI:key_no_tran)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  vl_harga_dsr = (APTD:Biaya / APTD:Jumlah) + (APTD:Biaya / APTD:Jumlah) * 0.2
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail1)
  RETURN ReturnValue

cetak_tran_ruang1_retur PROCEDURE                          ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
loc::kosong          STRING(20)                            !
loc::nama_ruang      STRING(30)                            !Nama instalasi :
vl_nama_apotik       STRING(20)                            !
vl_jam               TIME                                  !
Process:View         VIEW(AptoInDe)
                       PROJECT(APTD:Biaya)
                       PROJECT(APTD:Jumlah)
                       PROJECT(APTD:Kode_Brg)
                       PROJECT(APTD:N0_tran)
                       JOIN(GBAR:KeyKodeBrg,APTD:Kode_Brg)
                         PROJECT(GBAR:Nama_Brg)
                       END
                       JOIN(APTI:key_no_tran,APTD:N0_tran)
                         PROJECT(APTI:Kd_ruang)
                         PROJECT(APTI:Kode_Apotik)
                         PROJECT(APTI:N0_tran)
                         PROJECT(APTI:Tanggal)
                         PROJECT(APTI:Total_Biaya)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(167,2083,3198,8000),PAPER(PAPER:USER,8250,13000),PRE(RPT),THOUS
                       HEADER,AT(156,1000,3177,1083)
                         STRING('Ins. Farmasi RSI-- RETUR dari Instalasi'),AT(188,21,2198,198),USE(?String2),TRN,FONT('Times New Roman',10,,)
                         STRING(@s15),AT(188,510,979,188),USE(APTI:N0_tran),FONT('Times New Roman',8,,)
                         STRING(@D08),AT(1188,510),USE(APTI:Tanggal),RIGHT(1),FONT('Times New Roman',8,COLOR:Black,)
                         STRING(@t04),AT(2010,510),USE(vl_jam),TRN,FONT('Arial',8,,FONT:regular)
                         STRING(@s5),AT(510,333),USE(APTI:Kd_ruang),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         STRING('/'),AT(917,333),USE(?String12),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         STRING(@s30),AT(1000,333,1938,188),USE(loc::nama_ruang),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         BOX,AT(156,698,2625,385),USE(?Box1),COLOR(COLOR:Black)
                         STRING('Total'),AT(1792,885),USE(?String31),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         LINE,AT(156,875,2621,0),USE(?Line11),COLOR(COLOR:Black)
                         LINE,AT(938,885,0,190),USE(?Line3:8),COLOR(COLOR:Black)
                         LINE,AT(1708,885,0,190),USE(?Line3:6),COLOR(COLOR:Black)
                         STRING('Kode Brg'),AT(240,885),USE(?String28),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         STRING('Jumlah'),AT(1135,885),USE(?String30),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         STRING('Nama Barang'),AT(198,719),USE(?String29),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         STRING(@s5),AT(188,188),USE(APTI:Kode_Apotik),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         STRING('/'),AT(604,188),USE(?String11),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         STRING(@s20),AT(781,188,1958,188),USE(vl_nama_apotik),TRN,FONT('Times New Roman',8,,)
                         STRING('Asal:'),AT(188,333,281,188),USE(?String10),TRN,FONT('Times New Roman',8,,)
                       END
break1                 BREAK(loc::kosong)
detail1                  DETAIL,AT(10,,4865,354)
                           STRING(@n-14),AT(969,177),USE(APTD:Jumlah),TRN,LEFT(1),FONT('Times New Roman',8,COLOR:Black,)
                           STRING(@s40),AT(177,21,2521,188),USE(GBAR:Nama_Brg),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING(@s10),AT(240,177,646,188),USE(APTD:Kode_Brg),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING(@n-14),AT(1833,177),USE(APTD:Biaya),TRN,LEFT(1),FONT('Times New Roman',8,COLOR:Black,)
                         END
                         FOOTER,AT(10,10,7656,896)
                           STRING('1. Ybs'),AT(198,104),USE(?String15),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('Total : Rp.'),AT(1208,31),USE(?String18),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING(@n-14),AT(1875,31,802,188),USE(APTI:Total_Biaya),TRN,LEFT(1),FONT('Times New Roman',8,COLOR:Black,)
                           STRING('2. Akuntansi'),AT(188,240),USE(?String16),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('Petugas Farmasi'),AT(1677,219),USE(?String20),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('3. Arsip'),AT(188,396),USE(?String17),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING(@s10),AT(1729,573),USE(Glo:USER_ID),CENTER,FONT('Times New Roman',8,COLOR:Black,)
                           LINE,AT(10,10,2900,0),USE(?Line4),COLOR(COLOR:Black)
                           STRING('(.{28})'),AT(1573,625),USE(?String22),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         END
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
  GlobalErrors.SetProcedureName('cetak_tran_ruang1_retur')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  vl_jam = CLOCK()
  Relate:AptoInDe.Open                                     ! File GApotik used by this procedure, so make sure it's RelationManager is open
  Access:TBinstli.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GApotik.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('cetak_tran_ruang1_retur',ProgressWindow)   ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:AptoInDe, ?Progress:PctText, Progress:Thermometer, ProgressMgr, APTD:Kode_Brg)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(APTD:key_no_nota)
  ThisReport.AddRange(APTD:N0_tran,glo:no_trans_ruang)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report)
  ?Progress:UserString{Prop:Text}=''
  Relate:AptoInDe.SetQuickScan(1,Propagate:OneMany)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AptoInDe.Close
  END
  IF SELF.Opened
    INIMgr.Update('cetak_tran_ruang1_retur',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = APTD:Kode_Brg                            ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  APTI:N0_tran = APTD:N0_tran                              ! Assign linking field value
  Access:AptoInHe.Fetch(APTI:key_no_tran)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  GBAR:Kode_brg = APTD:Kode_Brg                            ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  APTI:N0_tran = APTD:N0_tran                              ! Assign linking field value
  Access:AptoInHe.Fetch(APTI:key_no_tran)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail1)
  RETURN ReturnValue

