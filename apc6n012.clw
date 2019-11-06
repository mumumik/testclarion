

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N012.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N003.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N006.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N011.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N117.INC'),ONCE        !Req'd for module callout resolution
                     END


Trig_UpdateAntarApotik2 PROCEDURE                          ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
sudah_nomor          BYTE                                  !
vl_no_urut           SHORT                                 !
tahun_ini            USHORT                                !
loc::nilai           USHORT                                !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
putar                BYTE                                  !
loc::nama_apotik     STRING(30)                            !
vl_nomor             STRING(15)                            !
BRW2::View:Browse    VIEW(APtoAPde)
                       PROJECT(APTO:Kode_Brg)
                       PROJECT(APTO:Jumlah)
                       PROJECT(APTO:Biaya)
                       PROJECT(APTO:N0_tran)
                       JOIN(GBAR:KeyKodeBrg,APTO:Kode_Brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?Browse:2
APTO:Kode_Brg          LIKE(APTO:Kode_Brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
APTO:Jumlah            LIKE(APTO:Jumlah)              !List box control field - type derived from field
APTO:Biaya             LIKE(APTO:Biaya)               !List box control field - type derived from field
APTO:N0_tran           LIKE(APTO:N0_tran)             !Primary key field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::APTH:Record LIKE(APTH:RECORD),THREAD
QuickWindow          WINDOW('Transaksi antar Sub-Farmasi'),AT(,,359,220),FONT('Arial',8,,),CENTER,IMM,HLP('UpdateAptoApHe'),ALRT(EscKey),TIMER(100),SYSTEM,GRAY,MDI
                       SHEET,AT(4,4,351,60),USE(?CurrentTab)
                         TAB('Data Umum'),USE(?Tab:1)
                           PROMPT('Sub Farmasi Asal :'),AT(8,27),USE(?APTH:Kode_Apotik:Prompt),FONT('Times New Roman',12,COLOR:Black,)
                           ENTRY(@s5),AT(92,27,40,10),USE(APTH:Kode_Apotik),DISABLE,FONT('Times New Roman',12,,),MSG('Kode Apotik'),TIP('Kode Apotik')
                           BUTTON('&F (F2)'),AT(318,25,27,12),USE(?CallLookup),KEY(F2Key)
                           PROMPT('Sub Farmasi dituju :'),AT(202,27),USE(?APTH:ApotikKeluar:Prompt)
                           ENTRY(@s5),AT(269,26,40,10),USE(APTH:ApotikKeluar),DISABLE,FONT('Times New Roman',12,,),REQ
                           IMAGE('DYPLUS.ICO'),AT(145,34,16,20),USE(?Image1)
                           IMAGE('DYPLUS.ICO'),AT(161,34,16,20),USE(?Image1:2)
                           IMAGE('DYPLUS.ICO'),AT(176,34,16,20),USE(?Image1:3)
                           PROMPT('Tanggal :'),AT(251,4),USE(?APTH:Tanggal:Prompt:2)
                           STRING(@s30),AT(9,46),USE(GL_namaapotik),FONT('Times New Roman',10,COLOR:Black,)
                           STRING(@s30),AT(202,44,129,10),USE(loc::nama_apotik)
                         END
                       END
                       LIST,AT(4,71,351,75),USE(?Browse:2),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('44L(2)|M~Kode Brg~@s10@167L(2)|M~Nama Barang~C@s40@60R(2)|M~Jumlah~C(0)@n-15.2@5' &|
   '6R(1)|M~Biaya~C(0)@n-15.2@'),FROM(Queue:Browse:2)
                       PANEL,AT(4,186,159,26),USE(?Panel1)
                       PROMPT('No transaksi :'),AT(8,194),USE(?APTH:N0_tran:Prompt),FONT('Arial',8,,)
                       PROMPT('Total Biaya:'),AT(229,155),USE(?APTH:Total_Biaya:Prompt),FONT('Times New Roman',10,COLOR:Black,FONT:bold+FONT:italic)
                       ENTRY(@n-15.2),AT(283,153),USE(APTH:Total_Biaya),RIGHT(1),FONT('Times New Roman',10,COLOR:Black,)
                       ENTRY(@s15),AT(59,191,99,16),USE(APTH:N0_tran),DISABLE,FONT('Times New Roman',12,COLOR:Black,FONT:bold),MSG('nomor transaksi'),TIP('nomor transaksi')
                       BUTTON('&OK'),AT(225,186,52,27),USE(?OK),LEFT,ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(287,186,52,27),USE(?Cancel),LEFT,ICON('CANCEL.ICO')
                       BUTTON('Help'),AT(63,1,45,14),USE(?Help),HIDE,STD(STD:Help)
                       BUTTON('&Tambah Barang (F4)'),AT(4,154,106,27),USE(?Insert:3),LEFT,KEY(F4Key),ICON('INSERT.ICO')
                       BUTTON('&Edit [Ctrl]'),AT(116,153,106,27),USE(?Change:3),FONT(,,COLOR:Black,FONT:bold),KEY(529)
                       BUTTON('&Delete'),AT(93,2,45,14),USE(?Delete:3),HIDE
                       ENTRY(@D06),AT(301,2),USE(APTH:Tanggal,,?APTH:Tanggal:2),DISABLE,RIGHT(1)
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
TakeCloseEvent         PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
BATAL_aptoap ROUTINE  !untuk aptoapde
    SET( BRW2::View:Browse)
    LOOP
        NEXT( BRW2::View:Browse)
        IF ERRORCODE() > 0 THEN BREAK.
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
      !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
      NOM:No_Urut=4
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
         NOMU:Urut =4
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
        !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
        NOM1:No_urut=4
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
           NOMU:Urut =4
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
      !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
      nomor_batal{prop:sql}='delete dba.nomor_batal where No=4'
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
         NOM1:No_urut=4
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
   APTH:N0_tran=vl_nomor
   display

Batal_Nomor Routine
   !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
   NOM:No_Urut =4
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=APTH:N0_tran
   NOM:Keterangan='Antar Aptk'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
   NOMU:Urut =4
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOMU:Nomor=APTH:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   delete(nomoruse)

hapus_nomor_use routine
   NOMU:Urut    =4
   NOMU:Nomor   =APTH:N0_tran
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
      !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
      NOM:No_Urut= vl_no_urut
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
         NOMU:Urut = vl_no_urut
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
        !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
        NOM1:No_urut= vl_no_urut
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
           NOMU:Urut = vl_no_urut
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
      !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
      nomor_batal{prop:sql}='delete dba.nomor_batal where No='&vl_no_urut
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
         NOM1:No_urut= vl_no_urut
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
   APTH:N0_tran=vl_nomor
   display

Batal_Nomor1 Routine
   !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
   NOM:No_Urut = vl_no_urut
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=APTH:N0_tran
   NOM:Keterangan='Antar Aptk'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
   NOMU:Urut = vl_no_urut
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOMU:Nomor=APTH:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   delete(nomoruse)

hapus_nomor_use1 routine
   NOMU:Urut    = vl_no_urut
   NOMU:Nomor   =APTH:N0_tran
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
  APTH:Kode_Apotik=GL_entryapotik
  ?OK{PROP:DISABLE}=TRUE
  ?BROWSE:2{PROP:DISABLE}=TRUE
  ?Insert:3{PROP:DISABLE}=TRUE
  CLEAR(loc::nama_apotik)
  CLEAR(APTH:ApotikKeluar)
  sudah_nomor = 0
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_UpdateAntarApotik2')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APTH:Kode_Apotik:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APTH:Record,History::APTH:Record)
  SELF.AddHistoryField(?APTH:Kode_Apotik,1)
  SELF.AddHistoryField(?APTH:ApotikKeluar,6)
  SELF.AddHistoryField(?APTH:Total_Biaya,5)
  SELF.AddHistoryField(?APTH:N0_tran,3)
  SELF.AddHistoryField(?APTH:Tanggal:2,2)
  SELF.AddUpdateFile(Access:AptoApHe)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  !Antar Apotik
  case deformat(sub(clip(GL_entryapotik),3,2),@n2)
     of '01'
        vl_no_urut=51
     of '02'
        vl_no_urut=52
     of '04'
        vl_no_urut=53
     of '06'
        vl_no_urut=54
     of '07'
        vl_no_urut=55
     of '08'
        vl_no_urut=56
  END
  Relate:APtoAPde.Open                                     ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Ano_pakai.Open                                    ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:IAP_SET.Open                                      ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_Batal.Open                                  ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Tbstawal.Open                                     ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Access:AptoApHe.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:AptoApHe
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
  BRW2.Init(?Browse:2,Queue:Browse:2.ViewPosition,BRW2::View:Browse,Queue:Browse:2,Relate:APtoAPde,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  if self.request=1 then
     do isi_nomor
  end
  ?Browse:2{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW2.Q &= Queue:Browse:2
  BRW2::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon APTO:Kode_Brg for sort order 1
  BRW2.AddSortOrder(BRW2::Sort0:StepClass,APTO:key_no_nota) ! Add the sort order for APTO:key_no_nota for sort order 1
  BRW2.AddRange(APTO:N0_tran,Relate:APtoAPde,Relate:AptoApHe) ! Add file relationship range limit for sort order 1
  BRW2.AddField(APTO:Kode_Brg,BRW2.Q.APTO:Kode_Brg)        ! Field APTO:Kode_Brg is a hot field or requires assignment from browse
  BRW2.AddField(GBAR:Nama_Brg,BRW2.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW2.AddField(APTO:Jumlah,BRW2.Q.APTO:Jumlah)            ! Field APTO:Jumlah is a hot field or requires assignment from browse
  BRW2.AddField(APTO:Biaya,BRW2.Q.APTO:Biaya)              ! Field APTO:Biaya is a hot field or requires assignment from browse
  BRW2.AddField(APTO:N0_tran,BRW2.Q.APTO:N0_tran)          ! Field APTO:N0_tran is a hot field or requires assignment from browse
  BRW2.AddField(GBAR:Kode_brg,BRW2.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_UpdateAntarApotik2',QuickWindow)      ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW2.AskProcedure = 2
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
  if (self.request=1 and self.response=2) or (self.request=3 and self.response=1) then
     do batal_nomor
     DO BATAL_aptoap
  end
  if self.request=1 and self.response=1 then
     do hapus_nomor_use
  end
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APtoAPde.Close
    Relate:Ano_pakai.Close
    Relate:IAP_SET.Close
    Relate:NomorUse.Close
    Relate:Nomor_Batal.Close
    Relate:Nomor_SKR.Close
    Relate:Tbstawal.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_UpdateAntarApotik2',QuickWindow)   ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
    APTH:Tanggal = TODAY()
    APTH:User = glo:user_id
  PARENT.PrimeFields


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  GAPO:Kode_Apotik = APTH:Kode_Apotik                      ! Assign linking field value
  Access:GApotik.Fetch(GAPO:KeyNoApotik)
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
      Cari_apotikInst
      UpdateAPtoAPde
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
    OF ?APTH:ApotikKeluar
      IF APTH:ApotikKeluar = GL_entryapotik
          MESSAGE('Kode Apotik Tidak Boleh Sama dengan Apotik Asal')
          ?BROWSE:2{PROP:DISABLE}=1
          ?Insert:3{PROP:DISABLE}=TRUE
          CLEAR (GAPO:Nama_Apotik)
          DISPLAY
          SELECT(?APTH:ApotikKeluar)
          CYCLE
      END
      GAPO:Kode_Apotik=APTH:ApotikKeluar
      Access:GApotik.Fetch(GAPO:KeyNoApotik)
      IF ERRORCODE() > 0
          MESSAGE('Kode Apotik Tidak Ada Dalam daftar')
          ?BROWSE:2{PROP:DISABLE}=1
          ?Insert:3{PROP:DISABLE}=TRUE
          CLEAR (GAPO:Nama_Apotik)
          DISPLAY
          SELECT(?APTH:ApotikKeluar)
      ELSE
          ?BROWSE:2{PROP:DISABLE}=0
          ?Insert:3{PROP:DISABLE}=0
          loc::nama_apotik=GAPO:Nama_Apotik
          display                                               
      END
    OF ?OK
      ! ISI aptoaphe & aptoapde serta potong saldo gstoaptk
      ! *****UNTUK file ApTOApHe******
      sudah_nomor = 0
      APTH:User=Glo:USER_ID
      APTH:Kode_Apotik = GL_entryapotik
      glo::no_nota = APTH:N0_tran
      
      !cek dulu bulannya ya, kalau sudah berubah, tulis dulu ke file awal bulan
      IF MONTH(glo::tgl_awal_kerja) = MONTH(TODAY())
      
      !    AptoApDe{prop:sql}='select * from dba.aptoapde where n0_tran='''&APTH:N0_tran&''''
      !    LOOP
      !        NEXT(APtoApDe)
      !        IF ERRORCODE() > 0 THEN BREAK.
      !        LOOP
      !            GSTO:Kode_Barang = APTO:Kode_Brg
      !            GSTO:Kode_Apotik = GL_entryapotik
      !            GET(GStokAptk,GSTO:KeyBarang)
      !            IF GSTO:Saldo >= APTO:Jumlah
      !                GSTO:Saldo = GSTO:Saldo - APTO:Jumlah
      !                PUT(GstokAptk)
      !                IF ERRORCODE() > 0 THEN CYCLE.
      !
      !                !------TULIS KE gstokaptk untuk apotik dituju-------
      !                GSTO:Kode_Barang = APTO:Kode_Brg
      !                GSTO:Kode_Apotik = APTH:ApotikKeluar
      !
      !                LOOP                                       !Loop to avoid "deadly embrace"
      !                    GET(GStokAptk,GSTO:KeyBarang)
      !                    IF ERRORCODE() = 35
      !                        GSTO:Kode_Apotik = APTH:ApotikKeluar
      !                        GSTO:Kode_Barang = APTO:Kode_Brg
      !                        GSTO:Saldo = APTO:Jumlah
      !                        GSTO:Harga_Dasar = APTO:Biaya/APTO:Jumlah
      !                        ADD(GStokAptk)
      !                        IF ERRORCODE() > 0 THEN CYCLE.
      !                    ELSE
      !                        GSTO:Saldo = GSTO:Saldo + APTO:Jumlah
      !                        PUT(GSTOKAptk)
      !                        IF ERRORCODE() > 0 THEN CYCLE.
      !                    END
      !                    BREAK
      !                END
      !            ELSE
      !                MESSAGE( 'STOK '& APTO:Kode_Brg &' Tinggal '& GSTO:Saldo &'Pengeluaran Dibatalkan')
      !                APTH:Total_Biaya = APTH:Total_Biaya - APTO:Biaya
      !                APTO:Jumlah = 0
      !                APTO:Biaya = 0
      !                PUT(ApToApDe)
      !            END
      !            BREAK
      !        END
      !    END
      ELSE
      !    APTH:Tanggal = TODAY()
      !    Tahun_ini = YEAR(TODAY())
      
          AptoApDe{prop:sql}='select * from dba.aptoapde where n0_tran='''&APTH:N0_tran&''''
          LOOP
              Next(APToApDe)
              IF ERRORCODE() > 0 THEN BREAK.
      !
              GSTO:Kode_Barang = APTO:Kode_Brg
              GSTO:Kode_Apotik = GL_entryapotik
              GET(GStokAptk,GSTO:KeyBarang)
      !
              ! CARI dan cek DULU DI FILE Tbstawal apakah sudah ada yang nulis
              TBS:Kode_Apotik = GL_entryapotik
              TBS:Kode_Barang = APTO:Kode_Brg
              TBS:Tahun = Tahun_ini
              GET(Tbstawal,TBS:kdap_brg)
              IF ERRORCODE()=0
                  LOOP
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
                      IF ERRORCODE() > 0 THEN  CYCLE.
                      BREAK
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
      !        ! *****akhir nulis ke tbstawal*******
      !        !***mulai tulis ke gstokaptk
      !
      !
      !        GSTO:Kode_Barang = APTO:Kode_Brg
      !        GSTO:Kode_Apotik = GL_entryapotik
      !        LOOP
      !            GET(GStokAptk,GSTO:KeyBarang)
      !
      !            IF GSTO:Saldo >= APTO:Jumlah
      !                GSTO:Saldo = GSTO:Saldo - APTO:Jumlah
      !                PUT( GstokAptk)
      !                IF ERRORCODE() > 0 THEN CYCLE.
      !
      !                !------TULIS KE gstokaptk untuk apotik dituju-------
      !                GSTO:Kode_Barang = APTO:Kode_Brg
      !                GSTO:Kode_Apotik = APTH:ApotikKeluar
      !                LOOP                                       !Loop to avoid "deadly embrace"
      !                    GET(GStokAptk,GSTO:KeyBarang)
      !                    IF ERRORCODE() = 35
      !                        GSTO:Kode_Apotik = APTH:ApotikKeluar
      !                        GSTO:Kode_Barang = APTO:Kode_Brg
      !                        GSTO:Saldo = APTO:Jumlah
      !                        GSTO:Harga_Dasar = APTO:Biaya/APTO:Jumlah
      !                        PUT(GstokAptk)
      !                        IF ERRORCODE() > 0 THEN CYCLE.
      !
      !                        !tulist stok= 0 ke Aawalbulan
      !                        TBS:Kode_Apotik = APTH:ApotikKeluar
      !                        TBS:Kode_Barang = APTO:Kode_Brg
      !                        TBS:Tahun = Tahun_ini
      !                        GET(Tbstawal,TBS:kdap_brg)
      !                        IF ERRORCODE() = 0
      !                            CASE MONTH(TODAY())
      !                                OF 1
      !                                    IF TBS:Januari= 0
      !                                        TBS:Januari = 0
      !                                        PUT(Tbstawal)
      !                                    END
      !                                
      !                                OF 2
      !                                    IF TBS:Februari= 0
      !                                        TBS:Februari = 0
      !                                        PUT(Tbstawal)
      !                                    END
      !                                    
      !                                OF 3
      !                                    IF TBS:Maret= 0
      !                                        TBS:Maret = 0
      !                                        PUT(Tbstawal)
      !                                    END
      !                                    
      !                                OF 4
      !                                    IF TBS:April= 0
      !                                        TBS:April = 0
      !                                        PUT(Tbstawal)
      !                                    END
      !                                    
      !                                OF 5
      !                                    IF TBS:Mei= 0
      !                                        TBS:Mei = 0
      !                                        PUT(Tbstawal)
      !                                    END
      !                                    
      !                                OF 6
      !                                    IF TBS:Juni= 0
      !                                        TBS:Juni = 0
      !                                        PUT(Tbstawal)
      !                                    END
      !                                    
      !                                OF 7
      !                                    IF TBS:Juli= 0
      !                                        TBS:Juli = 0
      !                                        PUT(Tbstawal)
      !                                    END
      !                                    
      !                                OF 8
      !                                    IF TBS:Agustus= 0
      !                                        TBS:Agustus = 0
      !                                        PUT(Tbstawal)
      !                                    END
      !                                    
      !                                OF 9
      !                                    IF TBS:September= 0
      !                                        TBS:September = 0
      !                                        PUT(Tbstawal)
      !                                    END
      !                                    
      !                                OF 10
      !                                    IF TBS:Oktober= 0
      !                                        TBS:Oktober = 0
      !                                        PUT(Tbstawal)
      !                                    END
      !                                    
      !                                OF 11
      !                                    IF TBS:November= 0
      !                                        TBS:November = 0
      !                                        PUT(Tbstawal)
      !                                    END
      !                                OF 12
      !                                    IF TBS:Desember= 0
      !                                        TBS:Desember = 0
      !                                        PUT(Tbstawal)
      !                                    END
      !                            END
      !
      !                        ELSE
      !                            CASE MONTH(TODAY())
      !                                OF 1
      !                                    TBS:Januari = 0
      !                                OF 2
      !                                    TBS:Februari = 0
      !                                OF 3
      !                                    TBS:Maret = 0
      !                                OF 4
      !                                    TBS:April = 0
      !                                OF 5
      !                                    TBS:Mei = 0
      !                                OF 6
      !                                    TBS:Juni = 0
      !                                OF 7
      !                                    TBS:Juli = 0
      !                                OF 8
      !                                    TBS:Agustus = 0
      !                                OF 9
      !                                    TBS:September = 0
      !                                OF 10
      !                                    TBS:Oktober = 0
      !                                OF 11
      !                                    TBS:November = 0
      !                                OF 12
      !                                    TBS:Desember = 0
      !                            END
      !                            TBS:Kode_Apotik = APTH:ApotikKeluar
      !                            TBS:Kode_Barang = GSTO:Kode_Barang
      !                            TBS:Tahun = Tahun_ini
      !                            ADD(Tbstawal)
      !                            IF ERRORCODE() > 0
      !                            END
      !                        END
      !
      !                    ELSE
      !
      !                        ! tulis dulu stoknya ke tbstawal
      !                        TBS:Kode_Apotik = APTH:ApotikKeluar
      !                        TBS:Kode_Barang = APTO:Kode_Brg
      !                        TBS:Tahun = Tahun_ini
      !                        GET(Tbstawal,TBS:kdap_brg)
      !                        IF ERRORCODE() = 0
      !                            CASE MONTH(TODAY())
      !                                OF 1
      !                                    IF TBS:Januari= 0
      !                                        TBS:Januari = GSTO:Saldo
      !                                        PUT(Tbstawal)
      !                                    END
      !                                    
      !                                OF 2
      !                                    IF TBS:Februari= 0
      !                                        TBS:Februari = GSTO:Saldo
      !                                        PUT(Tbstawal)
      !                                    END
      !                                    
      !                                OF 3
      !                                    IF TBS:Maret= 0
      !                                        TBS:Maret = GSTO:Saldo
      !                                        PUT(Tbstawal)
      !                                    END
      !                                    
      !                                OF 4
      !                                    IF TBS:April= 0
      !                                        TBS:April = GSTO:Saldo
      !                                        PUT(Tbstawal)
      !                                    END
      !                                    
      !                                OF 5
      !                                    IF TBS:Mei= 0
      !                                        TBS:Mei = GSTO:Saldo
      !                                        PUT(Tbstawal)
      !                                    END
      !                                    
      !                                OF 6
      !                                    IF TBS:Juni= 0
      !                                        TBS:Juni = GSTO:Saldo
      !                                        PUT(Tbstawal)
      !                                    END
      !                                    
      !                                OF 7
      !                                    IF TBS:Juli= 0
      !                                        TBS:Juli = GSTO:Saldo
      !                                        PUT(Tbstawal)
      !                                    END
      !                                    
      !                                OF 8
      !                                    IF TBS:Agustus= 0
      !                                        TBS:Agustus = GSTO:Saldo
      !                                        PUT(Tbstawal)
      !                                    END
      !                                    
      !                                OF 9
      !                                    IF TBS:September= 0
      !                                        TBS:September = GSTO:Saldo
      !                                        PUT(Tbstawal)
      !                                    END
      !                                    
      !                                OF 10
      !                                    IF TBS:Oktober= 0
      !                                        TBS:Oktober = GSTO:Saldo
      !                                        PUT(Tbstawal)
      !                                    END
      !                                    
      !                                OF 11
      !                                    IF TBS:November= 0
      !                                        TBS:November = GSTO:Saldo
      !                                        PUT(Tbstawal)
      !                                    END
      !                                OF 12
      !                                    IF TBS:Desember= 0
      !                                        TBS:Desember = GSTO:Saldo
      !                                        PUT(Tbstawal)
      !                                    END
      !                            END
      !
      !                        ELSE
      !                            CASE MONTH(TODAY())
      !                                OF 1
      !                                    TBS:Januari = GSTO:Saldo
      !                                OF 2
      !                                    TBS:Februari = GSTO:Saldo
      !                                OF 3
      !                                    TBS:Maret = GSTO:Saldo
      !                                OF 4
      !                                    TBS:April = GSTO:Saldo
      !                                OF 5
      !                                    TBS:Mei = GSTO:Saldo
      !                                OF 6
      !                                    TBS:Juni = GSTO:Saldo
      !                                OF 7
      !                                    TBS:Juli = GSTO:Saldo
      !                                OF 8
      !                                    TBS:Agustus = GSTO:Saldo
      !                                OF 9
      !                                    TBS:September = GSTO:Saldo
      !                                OF 10
      !                                    TBS:Oktober = GSTO:Saldo
      !                                OF 11
      !                                    TBS:November = GSTO:Saldo
      !                                OF 12
      !                                    TBS:Desember = GSTO:Saldo
      !                            END
      !                            TBS:Kode_Apotik = APTH:ApotikKeluar
      !                            TBS:Kode_Barang = GSTO:Kode_Barang
      !                            TBS:Tahun = Tahun_ini
      !                            ADD(Tbstawal)
      !                            IF ERRORCODE() > 0
      !                            END
      !
      !                        END
      !
      !                        !akhir ngisi ke tbstawal
      !                        GSTO:Kode_Barang = APTO:Kode_Brg
      !                        GSTO:Kode_Apotik = APTH:ApotikKeluar
      !                        LOOP
      !                            GET(GStokAptk,GSTO:KeyBarang)
      !                            GSTO:Saldo = GSTO:Saldo + APTO:Jumlah
      !                            IF Access:GStokAptk.Update() <> Level:Benign THEN CYCLE.
      !                            BREAK
      !                        END
      !                    END
      !                    BREAK
      !                END
      !            ELSE
      !                MESSAGE( 'STOK '& APTO:Kode_Brg &' Tinggal '& GSTO:Saldo &'Pengeluaran Dibatalkan')
      !                APTH:Total_Biaya = APTH:Total_Biaya - APTO:Biaya
      !                APTO:Biaya = 0
      !                APTO:Jumlah = 0
      !                Access:ApToApDe.Update()
      !            END
      !            BREAK
      !        END
          END
      END
    OF ?Cancel
      sudah_nomor = 0
      !!IF SUB(APTH:N0_tran,1,1) = 'A' then    !nomor transaksi mulai dengan AP....
      !!    SET(IAPS:bypatokan)   !Beginning of file in keyed sequence
      !!    putar=0
      !!    LOOP WHILE NOT ERRORCODE()
      !!        IAPS:Patokan = 'BuApAp'& putar
      !!        GET(Iap_Set,IAPS:bypatokan)
      !!        putar = putar + 1
      !!    END
      !!    IAPS:Isi=APTH:N0_tran
      !!    ADD(IAP_SET)
          IF SELF.REQUEST=1
              !DO BATAL_aptoap
          END
      !!    ANOp:Nomor = APTH:N0_tran
      !!    Get(Ano_pakai,ANOp:key_isi)
      !!    DELETE(ANo_Pakai)
      !!END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CallLookup
      ThisWindow.Update
      GAPO:Kode_Apotik = APTH:ApotikKeluar
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        APTH:ApotikKeluar = GAPO:Kode_Apotik
      END
      ThisWindow.Reset(1)
      IF APTH:ApotikKeluar = GL_entryapotik
          MESSAGE('Kode Apotik Tidak Boleh Sama dengan Apotik Asal')
          APTH:ApotikKeluar=''
          ?BROWSE:2{PROP:DISABLE}=1
          ?Insert:3{PROP:DISABLE}=TRUE
          CLEAR (GAPO:Nama_Apotik)
          DISPLAY
          SELECT(?APTH:ApotikKeluar)
          CYCLE
      END
      GAPO:Kode_Apotik = APTH:ApotikKeluar
      get(Gapotik,GAPO:KeyNoApotik)
      if errorcode() = 0
            loc::nama_apotik= GAPO:Nama_Apotik
      end
      ?BROWSE:2{PROP:DISABLE}=0
      ?Insert:3{PROP:DISABLE}=0
      
    OF ?APTH:ApotikKeluar
      IF APTH:ApotikKeluar OR ?APTH:ApotikKeluar{Prop:Req}
        GAPO:Kode_Apotik = APTH:ApotikKeluar
        IF Access:GApotik.TryFetch(GAPO:KeyNoApotik)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            APTH:ApotikKeluar = GAPO:Kode_Apotik
          ELSE
            SELECT(?APTH:ApotikKeluar)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
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


ThisWindow.TakeCloseEvent PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  !IF SELF.RESPONSE = 1 THEN
  !!    Cetak_nota_apotik
  !!    CASE MESSAGE('Cetak Detail?','Detail Transaksi',ICON:Question,BUTTON:Yes+BUTTON:No,BUTTON:Yes,1)
  !!        OF BUTTON:Yes
  !           Cetak_tran_antar_sub_1
  !!    END
  !
  !END
  ReturnValue = PARENT.TakeCloseEvent()
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
    CASE FIELD()
    OF ?Browse:2
      !!IF SUB(APTH:N0_tran,1,1) <> 'A' then    !nomor transaksi mulai dengan AP....
      !!    loop
      !!
      !!        SET(IAPS:bypatokan)   !Beginning of file in keyed sequence
      !!        LOOP                  !Read all records through end of file
      !!            NEXT(IAP_SET)     !    read a record sequentially
      !!            IF ERRORCODE() > 0 THEN
      !!            Putar = 0
      !!            BREAK     !    break on end of file
      !!            END
      !!            IF SUB(IAPS:Patokan,1,6)='BuApAp' THEN
      !!              APTH:N0_tran = IAPS:Isi
      !!              DELETE(IAP_SET)
      !!              IF ERRORCODE() > 0 THEN CYCLE.
      !!              Putar=1
      !!              BREAK
      !!            END
      !!        END
      !!        IF Putar=0 THEN
      !!          LOOP
      !!            IAPS:Patokan='ApToAp'
      !!            GET(Iap_Set,IAPS:bypatokan)
      !!            IF ERRORCODE() > 0 THEN
      !!                IAPS:Patokan='ApToAp'
      !!                IAPS:Isi='AT'& SUB(FORMAT(YEAR( TODAY() ),@P####P),3,2) &'A0001'
      !!                APTH:N0_tran ='AT'& SUB(FORMAT(YEAR( TODAY() ),@P####P),3,2) &'A0000'
      !!                ADD(Iap_Set)
      !!                IF ERRORCODE() > 0 THEN
      !!                    CYCLE
      !!                ELSE
      !!                    BREAK
      !!                END
      !!            END
      !!            APTH:N0_tran = IAPS:Isi
      !!            IF SUB(FORMAT(YEAR( TODAY()),@P####P),3,2) <> SUB (IAPS:Isi,3,2) THEN
      !!               IAPS:ISI = 'AT' & SUB(FORMAT(YEAR( TODAY() ),@P####P),3,2)& 'A0000'
      !!            ELSE
      !!                IF FORMAT( DEFORMAT(SUB (IAPS:Isi,6,4)),@N04 ) = 9999 THEN
      !!                  IAPS:ISI = SUB(IAPS:ISI,1,4)|
      !!                       & CHR( VAL( SUB (IAPS:ISI,5,1))+1) & '0000'
      !!                ELSE
      !!                  IAPS:Isi = SUB(IAPS:ISI,1,5)|
      !!                  & FORMAT( DEFORMAT(SUB (IAPS:Isi,6,4))+1,@N04 )
      !!                END
      !!            END
      !!            PUT(IAP_SET)
      !!            BREAK
      !!          END
      !!        END
      !!
      !!        ANOp:Nomor = APTH:N0_tran
      !!        ADD(Ano_pakai)
      !!        IF ERRORCODE() > 0
      !!            CYCLE
      !!        ELSE
      !!            BREAK
      !!        END
      !!    END
      !!    sudah_nomor = 1
      !!END
    OF ?Insert:3
      !!IF SUB(APTH:N0_tran,1,1) <> 'A' then    !nomor transaksi mulai dengan AP....
      !!    loop
      !!        SET(IAPS:bypatokan)   !Beginning of file in keyed sequence
      !!        LOOP                  !Read all records through end of file
      !!            NEXT(IAP_SET)     !    read a record sequentially
      !!            IF ERRORCODE() > 0 THEN
      !!            Putar = 0
      !!            BREAK     !    break on end of file
      !!            END
      !!            IF SUB(IAPS:Patokan,1,6)='BuApAp' THEN
      !!              APTH:N0_tran = IAPS:Isi
      !!              DELETE(IAP_SET)
      !!              IF ERRORCODE() > 0 THEN CYCLE.
      !!              Putar=1
      !!              BREAK
      !!            END
      !!        END
      !!        IF Putar=0 THEN
      !!          LOOP
      !!            IAPS:Patokan='ApToAp'
      !!            GET(Iap_Set,IAPS:bypatokan)
      !!            IF ERRORCODE() > 0 THEN
      !!                IAPS:Patokan='ApToAp'
      !!                IAPS:Isi='AT'& SUB(FORMAT(YEAR( TODAY() ),@P####P),3,2) &'A0001'
      !!                APTH:N0_tran ='AT'& SUB(FORMAT(YEAR( TODAY() ),@P####P),3,2) &'A0000'
      !!                ADD(Iap_Set)
      !!                IF ERRORCODE() > 0 THEN
      !!                    CYCLE
      !!                ELSE
      !!                    BREAK
      !!                END
      !!            END
      !!            APTH:N0_tran = IAPS:Isi
      !!            IF SUB(FORMAT(YEAR( TODAY()),@P####P),3,2) <> SUB (IAPS:Isi,3,2) THEN
      !!               IAPS:ISI = 'AT' & SUB(FORMAT(YEAR( TODAY() ),@P####P),3,2)& 'A0000'
      !!            ELSE
      !!                IF FORMAT( DEFORMAT(SUB (IAPS:Isi,6,4)),@N04 ) = 9999 THEN
      !!                  IAPS:ISI = SUB(IAPS:ISI,1,4)|
      !!                       & CHR( VAL( SUB (IAPS:ISI,5,1))+1) & '0000'
      !!                ELSE
      !!                  IAPS:Isi = SUB(IAPS:ISI,1,5)|
      !!                  & FORMAT( DEFORMAT(SUB (IAPS:Isi,6,4))+1,@N04 )
      !!                END
      !!            END
      !!            PUT(IAP_SET)
      !!            BREAK
      !!          END
      !!        END
      !!
      !!        ANOp:Nomor = APTH:N0_tran
      !!        ADD(Ano_pakai)
      !!        IF ERRORCODE() > 0
      !!            CYCLE
      !!        ELSE
      !!            BREAK
      !!        END
      !!    END
      !!    sudah_nomor = 1
      !!END
      ?CallLookup{prop:disable}=1
    END
  ReturnValue = PARENT.TakeSelected()
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
      !!IF sudah_nomor = 1
      !!    IF SUB(APTH:N0_tran,1,1) = 'A' then    !nomor transaksi mulai dengan AP....
      !!        SET(IAPS:bypatokan)   !Beginning of file in keyed sequence
      !!        putar=0
      !!        LOOP WHILE NOT ERRORCODE()
      !!            IAPS:Patokan = 'BuApAp'& putar
      !!            GET(Iap_Set,IAPS:bypatokan)
      !!            putar = putar + 1
      !!        END
      !!        IAPS:Isi=APTH:N0_tran
      !!        ADD(IAP_SET)
      !        IF SELF.REQUEST=1
      !!        DO BATAL_aptoap
      !        END
      !!        ANOp:Nomor = APTH:N0_tran
      !!        Get(Ano_pakai,ANOp:key_isi)
      !!        DELETE(ANo_Pakai)
      !!    END
      !!END
      
      IF SELF.RESPONSE = 1 THEN
         glo::no_nota=APTH:N0_tran
         Cetak_tran_antar_sub_1
      END
    OF EVENT:Timer
      IF APTH:Total_Biaya = 0
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

APTH:Total_Biaya:Sum REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:APtoAPde.SetQuickScan(1)
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
    APTH:Total_Biaya:Sum += APTO:Biaya
  END
  APTH:Total_Biaya = APTH:Total_Biaya:Sum
  PARENT.ResetFromView
  Relate:APtoAPde.SetQuickScan(0)
  SETCURSOR()


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

UpdateAPtoAPde PROCEDURE                                   ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
History::APTO:Record LIKE(APTO:RECORD),THREAD
QuickWindow          WINDOW('Merubah Data Transaksi'),AT(,,261,158),FONT('Arial',8,,),CENTER,IMM,HLP('UpdateAPtoAPde'),SYSTEM,GRAY,MDI
                       PROMPT('No. transaksi :'),AT(136,6),USE(?APTO:N0_tran:Prompt)
                       ENTRY(@s15),AT(186,6,64,10),USE(APTO:N0_tran),MSG('nomor transaksi'),TIP('nomor transaksi'),READONLY
                       SHEET,AT(5,10,244,115),USE(?CurrentTab)
                         TAB('Data Umum'),USE(?Tab:1)
                           PROMPT('Kode Barang :'),AT(9,41),USE(?APTO:Kode_Brg:Prompt)
                           ENTRY(@s10),AT(75,39,44,12),USE(APTO:Kode_Brg)
                           BUTTON('&H'),AT(123,38,12,12),USE(?CallLookup),KEY(F2Key)
                           STRING(@s40),AT(75,61,166,10),USE(GBAR:Nama_Brg)
                           PROMPT('Jumlah:'),AT(9,83),USE(?APTO:Jumlah:Prompt)
                           ENTRY(@n15.2),AT(75,81,60,12),USE(APTO:Jumlah),RIGHT(1)
                           PROMPT('Biaya:'),AT(9,106),USE(?APTO:Biaya:Prompt)
                           ENTRY(@n-15.2),AT(75,104,60,12),USE(APTO:Biaya),RIGHT(2)
                         END
                       END
                       BUTTON('&OK'),AT(119,129,57,25),USE(?OK),LEFT,ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(191,129,57,25),USE(?Cancel),LEFT,KEY(EscKey),ICON('CANCEL.ICO')
                       BUTTON('Help'),AT(73,4,45,14),USE(?Help),STD(STD:Help)
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
  ?OK{PROP:DISABLE}=TRUE
  ?APTO:Biaya{PROP:READONLY}=TRUE
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateAPtoAPde')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APTO:N0_tran:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APTO:Record,History::APTO:Record)
  SELF.AddHistoryField(?APTO:N0_tran,2)
  SELF.AddHistoryField(?APTO:Kode_Brg,1)
  SELF.AddHistoryField(?APTO:Jumlah,3)
  SELF.AddHistoryField(?APTO:Biaya,4)
  SELF.AddUpdateFile(Access:APtoAPde)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:APtoAPde.Open                                     ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:APtoAPde
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
  INIMgr.Fetch('UpdateAPtoAPde',QuickWindow)               ! Restore window settings from non-volatile store
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
    Relate:APtoAPde.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateAPtoAPde',QuickWindow)            ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = APTO:Kode_Brg                            ! Assign linking field value
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
    OF ?APTO:Kode_Brg
      GSTO:Kode_Barang=APTO:Kode_Brg
      GSTO:Kode_Apotik=GL_entryapotik
      GET(GStokAptk,GSTO:KeyBarang)
      IF ERRORCODE() > 0
                  ?APTO:Jumlah{PROP:DISABLE}=1
                  MESSAGE('Barang tersebut tidak ada dalam Daftar Obat')
                  CLEAR (APTO:Kode_Brg)
                  CLEAR (GBAR:Nama_Brg)
                  DISPLAY
                  SELECT(?APTO:Kode_Brg)
      !            BREAK
      ELSE
          ?APTO:Jumlah{PROP:DISABLE}=0
          select(?APTO:Jumlah)
      END
    OF ?APTO:Jumlah
      IF APTO:Jumlah = 0
          ?OK{PROP:DISABLE}=1
      ELSE
          IF self.request = changerecord
                  GSTO:Kode_Apotik = GL_entryapotik
                  GSTO:Kode_Barang = APTO:Kode_Brg
                  GET(GStokaptk,GSTO:KeyBarang)
          END
      
          IF APTO:Jumlah > GSTO:Saldo
              MESSAGE('JUMLAH di stok tinggal :'& GSTO:Saldo)
              SELECT(?APTO:Jumlah)
              CYCLE
          END
          ?OK{PROP:DISABLE}=0
          APTO:Biaya = APTO:Jumlah * GSTO:Harga_Dasar
          DISPLAY
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?APTO:Kode_Brg
      IF APTO:Kode_Brg OR ?APTO:Kode_Brg{Prop:Req}
        GBAR:Kode_brg = APTO:Kode_Brg
        IF Access:GBarang.TryFetch(GBAR:KeyKodeBrg)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            APTO:Kode_Brg = GBAR:Kode_brg
          ELSE
            SELECT(?APTO:Kode_Brg)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      GBAR:Kode_brg = APTO:Kode_Brg
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        APTO:Kode_Brg = GBAR:Kode_brg
      END
      ThisWindow.Reset(1)
      GSTO:Kode_Barang=APTO:Kode_Brg
      GSTO:Kode_Apotik=GL_entryapotik
      GET(GStokAptk,GSTO:KeyBarang)
      IF ERRORCODE() > 0
                  ?APTO:Jumlah{PROP:DISABLE}=1
                  MESSAGE('Barang tersebut tidak ada dalam Daftar Obat')
                  CLEAR (APTO:Kode_Brg)
                  CLEAR (GBAR:Nama_Brg)
                  DISPLAY
                  SELECT(?APTO:Kode_Brg)
      !            BREAK
      ELSE
          ?APTO:Jumlah{PROP:DISABLE}=0
          select(?APTO:Jumlah)
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

cetak_tran_antar_sub_1 PROCEDURE                           ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
loc::kosong          STRING(20)                            !
vl_jam               TIME                                  !
Process:View         VIEW(APtoAPde)
                       PROJECT(APTO:Biaya)
                       PROJECT(APTO:Jumlah)
                       PROJECT(APTO:Kode_Brg)
                       PROJECT(APTO:N0_tran)
                       JOIN(GBAR:KeyKodeBrg,APTO:Kode_Brg)
                         PROJECT(GBAR:Nama_Brg)
                       END
                       JOIN(APTH:key_notran,APTO:N0_tran)
                         PROJECT(APTH:ApotikKeluar)
                         PROJECT(APTH:Kode_Apotik)
                         PROJECT(APTH:N0_tran)
                         PROJECT(APTH:Tanggal)
                         PROJECT(APTH:Total_Biaya)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(292,1365,2208,11281),PAPER(PAPER:USER,8350,13000),PRE(RPT),THOUS
                       HEADER,AT(302,260,2188,1094)
                         STRING(@D06),AT(1000,500),USE(APTH:Tanggal),RIGHT(1),FONT('Arial',8,COLOR:Black,)
                         STRING(@t04),AT(1646,500),USE(vl_jam),FONT('Arial',8,,FONT:regular)
                         BOX,AT(10,719,2146,365),USE(?Box1),COLOR(COLOR:Black)
                         STRING('Nama Barang'),AT(63,740),USE(?String8),TRN,FONT('Arial',8,COLOR:Black,)
                         STRING('Kode'),AT(115,917),USE(?String9),TRN,FONT('Arial',8,COLOR:Black,)
                         STRING('Jumlah'),AT(1010,917),USE(?String10),TRN,FONT('Arial',8,COLOR:Black,)
                         STRING('Total'),AT(1740,917),USE(?String11),TRN,FONT('Arial',8,COLOR:Black,)
                         LINE,AT(813,885,0,190),USE(?Line2:3),COLOR(COLOR:Black)
                         LINE,AT(1594,885,0,190),USE(?Line2),COLOR(COLOR:Black)
                         LINE,AT(10,885,2135,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING(@s15),AT(21,500),USE(APTH:N0_tran),FONT('Arial',8,COLOR:Black,)
                         STRING(@s5),AT(1094,323),USE(APTH:ApotikKeluar),FONT('Arial',8,COLOR:Black,)
                         STRING('Ins. Farmasi -- SBBK antar sub'),AT(31,0),USE(?String1),TRN,FONT('Arial',8,,)
                         STRING('Sub Farmasi asal   :'),AT(21,156),USE(?String2),TRN,FONT('Arial',8,COLOR:Black,)
                         STRING(@s5),AT(1094,156),USE(APTH:Kode_Apotik),FONT('Arial',8,COLOR:Black,)
                         STRING('Sub Farmasi dituju :'),AT(21,323),USE(?String4),TRN,FONT('Arial',8,COLOR:Black,)
                       END
break1                 BREAK(loc::kosong)
detail1                  DETAIL,AT(,,,333)
                           STRING(@s40),AT(21,0,2625,188),USE(GBAR:Nama_Brg),FONT('Arial',8,COLOR:Black,)
                           STRING(@n-14),AT(1604,156,854,188),USE(APTO:Biaya),LEFT(1),FONT('Arial',8,,)
                           STRING(@n14),AT(771,156),USE(APTO:Jumlah),LEFT(1),FONT('Arial',8,COLOR:Black,)
                           STRING(@s10),AT(52,156),USE(APTO:Kode_Brg),FONT('Arial',8,COLOR:Black,)
                         END
                         FOOTER,AT(0,0,,1000)
                           STRING(@n-14),AT(1604,31,854,188),USE(APTH:Total_Biaya),LEFT(1),FONT('Arial',8,,)
                           STRING('1. Arsip'),AT(31,177),USE(?String18),TRN,FONT('Arial',8,COLOR:Black,)
                           STRING('Petugas'),AT(1344,177),USE(?String21),TRN,FONT('Arial',8,COLOR:Black,)
                           STRING('2. Sub Asal'),AT(31,313),USE(?String19),TRN,FONT('Arial',8,COLOR:Black,)
                           STRING(@s10),AT(1250,531),USE(Glo:USER_ID),CENTER,FONT('Arial',8,,)
                           STRING('3. Sub dituju'),AT(31,458),USE(?String20),TRN,FONT('Arial',8,COLOR:Black,)
                           STRING('(.{22})'),AT(1188,625),USE(?String23),TRN,FONT('Arial',8,COLOR:Black,)
                           LINE,AT(10,0,2500,0),USE(?Line4),COLOR(COLOR:Black)
                           STRING('Total Harga :'),AT(938,31),USE(?String17),TRN,FONT('Arial',8,COLOR:Black,)
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
  GlobalErrors.SetProcedureName('cetak_tran_antar_sub_1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  vl_jam = CLOCK()
  Relate:APtoAPde.Open                                     ! File APtoAPde used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('cetak_tran_antar_sub_1',ProgressWindow)    ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:APtoAPde, ?Progress:PctText, Progress:Thermometer, ProgressMgr, APTO:Kode_Brg)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(APTO:key_no_nota)
  ThisReport.AddRange(APTO:N0_tran,glo::no_nota)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report)
  ?Progress:UserString{Prop:Text}=''
  Relate:APtoAPde.SetQuickScan(1,Propagate:OneMany)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APtoAPde.Close
  END
  IF SELF.Opened
    INIMgr.Update('cetak_tran_antar_sub_1',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = APTO:Kode_Brg                            ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  APTH:N0_tran = APTO:N0_tran                              ! Assign linking field value
  Access:AptoApHe.Fetch(APTH:key_notran)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  GBAR:Kode_brg = APTO:Kode_Brg                            ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  APTH:N0_tran = APTO:N0_tran                              ! Assign linking field value
  Access:AptoApHe.Fetch(APTH:key_notran)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail1)
  RETURN ReturnValue

BrowseInputOrderVerAll PROCEDURE                           ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
str                  STRING(20)                            !
vl_nomor             STRING(10)                            !
loc::thread          BYTE                                  !
BRW1::View:Browse    VIEW(GHBPB)
                       PROJECT(GHBPB:NoBPB)
                       PROJECT(GHBPB:Kode_Apotik)
                       PROJECT(GHBPB:Tanggal)
                       PROJECT(GHBPB:UserInput)
                       PROJECT(GHBPB:UserVal)
                       PROJECT(GHBPB:JamInput)
                       PROJECT(GHBPB:TanggalVal)
                       PROJECT(GHBPB:JamVal)
                       PROJECT(GHBPB:Status)
                       PROJECT(GHBPB:Verifikasi)
                       JOIN(GAPO:KeyNoApotik,GHBPB:Kode_Apotik)
                         PROJECT(GAPO:Nama_Apotik)
                         PROJECT(GAPO:Keterangan)
                         PROJECT(GAPO:Kode_Apotik)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GHBPB:NoBPB            LIKE(GHBPB:NoBPB)              !List box control field - type derived from field
GHBPB:NoBPB_NormalFG   LONG                           !Normal forground color
GHBPB:NoBPB_NormalBG   LONG                           !Normal background color
GHBPB:NoBPB_SelectedFG LONG                           !Selected forground color
GHBPB:NoBPB_SelectedBG LONG                           !Selected background color
GHBPB:Kode_Apotik      LIKE(GHBPB:Kode_Apotik)        !List box control field - type derived from field
GAPO:Nama_Apotik       LIKE(GAPO:Nama_Apotik)         !List box control field - type derived from field
GHBPB:Tanggal          LIKE(GHBPB:Tanggal)            !List box control field - type derived from field
GHBPB:UserInput        LIKE(GHBPB:UserInput)          !List box control field - type derived from field
GHBPB:UserVal          LIKE(GHBPB:UserVal)            !List box control field - type derived from field
GHBPB:JamInput         LIKE(GHBPB:JamInput)           !List box control field - type derived from field
GHBPB:TanggalVal       LIKE(GHBPB:TanggalVal)         !List box control field - type derived from field
GHBPB:JamVal           LIKE(GHBPB:JamVal)             !List box control field - type derived from field
GHBPB:Status           LIKE(GHBPB:Status)             !List box control field - type derived from field
GHBPB:Verifikasi       LIKE(GHBPB:Verifikasi)         !List box control field - type derived from field
GAPO:Keterangan        LIKE(GAPO:Keterangan)          !List box control field - type derived from field
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
                       LIST,AT(8,20,447,68),USE(?Browse:1),IMM,HVSCROLL,FONT('Arial',8,,FONT:regular),MSG('Browsing Records'),FORMAT('47L(2)|_M*~Nomor~@s10@44L(2)|_M~Kode Apotik~@s5@98L(2)|_M~Nama SubFarmasi~@s30@5' &|
   '0L(2)|_M~Tanggal~@D6@80L(2)|_M~User Input~@s20@80L(2)|_M~User Val~@s20@32L(2)|_M' &|
   '~Jam Input~@t04@45L(2)|_M~Tanggal Val~@d06@32L(2)|_M~Jam Val~@t04@28L(2)|_M~Stat' &|
   'us~@s5@37L(2)|_M~Verifikasi~@n3@80L(2)|_M~Keterangan~@s20@'),FROM(Queue:Browse:1)
                       BUTTON('&Tambah (+)'),AT(99,92,67,16),USE(?Insert:2),DISABLE,HIDE,LEFT,KEY(PlusKey),ICON(ICON:New)
                       BUTTON('&Ubah'),AT(170,93,67,14),USE(?Change:2),LEFT,ICON(ICON:Open),DEFAULT
                       BUTTON('&Hapus'),AT(241,93,67,14),USE(?Delete:2),DISABLE,HIDE,LEFT,ICON(ICON:Cut)
                       PANEL,AT(4,114,456,124),USE(?Panel1)
                       LIST,AT(8,118,447,115),USE(?List),IMM,HVSCROLL,FONT('Arial',8,,FONT:regular),MSG('Browsing Records'),FORMAT('45L(1)|_M~Kode Brg~C@s10@129L(1)|_M~Nama Obat~C@s40@67L(1)|_M~Kemasan~C@s20@43L(' &|
   '1)|_M~Satuan~C@s10@55D(14)|_M~Jumlah~C(1)@n16.2@47R(1)|_M~Diterima~@n-12.2@77L(1' &|
   ')|_M~Ket~C@s50@80D(14)|_M~Keterangan~C(1)@s20@'),FROM(Queue:Browse)
                       SHEET,AT(4,5,456,107),USE(?CurrentTab)
                         TAB('Terurut berdasar No BPB'),USE(?Tab:2),FONT('Arial',8,,)
                           PROMPT('Nomor:'),AT(17,94),USE(?GHBPB:NoBPB:Prompt)
                           ENTRY(@s10),AT(46,94),USE(GHBPB:NoBPB),MSG('No BPB'),TIP('No BPB')
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
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
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
SetQueueRecord         PROCEDURE(),DERIVED                 ! Method added to host embed code
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
  GlobalErrors.SetProcedureName('BrowseInputOrderVerAll')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo:akses',glo:akses)                              ! Added by: BrowseBox(ABC)
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  loc::thread=glo::mainthreadno
  !POST(EVENT:Disable_BPBV,,loc::thread)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:GApotik.SetOpenRelated()
  Relate:GApotik.Open                                      ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:GNOABPB.Open                                      ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:GNOBBPB.Open                                      ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
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
  BRW1.SetFilter('(GAPO:keterangan=glo:akses)')            ! Apply filter expression to browse
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon GHBPB:NoBPB for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,GHBPB:KeyNoBPB)  ! Add the sort order for GHBPB:KeyNoBPB for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?GHBPB:NoBPB,GHBPB:NoBPB,,BRW1) ! Initialize the browse locator using ?GHBPB:NoBPB using key: GHBPB:KeyNoBPB , GHBPB:NoBPB
  BRW1.SetFilter('(GAPO:keterangan=glo:akses and GHBPB:Status=''Tutup'')') ! Apply filter expression to browse
  BRW1.AddField(GHBPB:NoBPB,BRW1.Q.GHBPB:NoBPB)            ! Field GHBPB:NoBPB is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB:Kode_Apotik,BRW1.Q.GHBPB:Kode_Apotik) ! Field GHBPB:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GAPO:Nama_Apotik,BRW1.Q.GAPO:Nama_Apotik)  ! Field GAPO:Nama_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB:Tanggal,BRW1.Q.GHBPB:Tanggal)        ! Field GHBPB:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB:UserInput,BRW1.Q.GHBPB:UserInput)    ! Field GHBPB:UserInput is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB:UserVal,BRW1.Q.GHBPB:UserVal)        ! Field GHBPB:UserVal is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB:JamInput,BRW1.Q.GHBPB:JamInput)      ! Field GHBPB:JamInput is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB:TanggalVal,BRW1.Q.GHBPB:TanggalVal)  ! Field GHBPB:TanggalVal is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB:JamVal,BRW1.Q.GHBPB:JamVal)          ! Field GHBPB:JamVal is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB:Status,BRW1.Q.GHBPB:Status)          ! Field GHBPB:Status is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB:Verifikasi,BRW1.Q.GHBPB:Verifikasi)  ! Field GHBPB:Verifikasi is a hot field or requires assignment from browse
  BRW1.AddField(GAPO:Keterangan,BRW1.Q.GAPO:Keterangan)    ! Field GAPO:Keterangan is a hot field or requires assignment from browse
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
  INIMgr.Fetch('BrowseInputOrderVerAll',QuickWindow)       ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
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
    Relate:Nomor_SKR.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseInputOrderVerAll',QuickWindow)    ! Save window data to non-volatile store
  END
  !POST(EVENT:Enable_BPBV,,loc::thread)
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
    UpdateBPBVer
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
      START(PrintBPB1, 25000)
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


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (ghbpb:verifikasi=1)
    SELF.Q.GHBPB:NoBPB_NormalFG = 255                      ! Set conditional color values for GHBPB:NoBPB
    SELF.Q.GHBPB:NoBPB_NormalBG = -1
    SELF.Q.GHBPB:NoBPB_SelectedFG = 255
    SELF.Q.GHBPB:NoBPB_SelectedBG = -1
  ELSE
    SELF.Q.GHBPB:NoBPB_NormalFG = -1                       ! Set color values for GHBPB:NoBPB
    SELF.Q.GHBPB:NoBPB_NormalBG = -1
    SELF.Q.GHBPB:NoBPB_SelectedFG = -1
    SELF.Q.GHBPB:NoBPB_SelectedBG = -1
  END


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

GantiPassword PROCEDURE                                    ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
Loc:Id               STRING(10)                            !
Loc:Baru             STRING(10)                            !
Loc:I                USHORT                                !
Loc:J                USHORT                                !
Loc:Huruf            STRING(10)                            !
Loc:Baru1            STRING(20)                            !
Loc:Nama             STRING(20)                            !
Loc:Old              STRING(20)                            !
Loc:OldNama          STRING(20)                            !
Loc:Pas              STRING(10)                            !
Loc:Oke              BYTE                                  !
Loc:B                LONG                                  !
window               WINDOW('Ganti Password'),AT(,,172,64),FONT('Arial',8,,),CENTER,MSG('Mengganti Nama/Password'),ALRT(EscKey),GRAY,MODAL
                       GROUP,AT(6,4,161,55),USE(?Group1),BOXED,BEVEL(1,1)
                         PROMPT('&Nama Lama :'),AT(12,14),USE(?Loc:OldNama:Prompt)
                         ENTRY(@s20),AT(72,12,88,10),USE(Loc:OldNama),TIP('Isi Nama '),UPR
                         PROMPT('&Password Lama :'),AT(12,25,58,10),USE(?Loc:Id:Prompt)
                         ENTRY(@s10),AT(72,25,88,10),USE(Loc:Id),TIP('Isi Password lama'),PASSWORD
                         BUTTON('&OK'),AT(34,39,51,14),USE(?Button1),LEFT,TIP('Simpan data'),ICON(ICON:Tick)
                         BUTTON('E&xit'),AT(86,39,51,14),USE(?Close),LEFT,TIP('Keluar dari Formulir Ini'),ICON(ICON:Cross)
                       END
                       GROUP,AT(6,4,161,55),USE(?Group2),BOXED,HIDE,BEVEL(1,1)
                         PROMPT('&Nama Baru :'),AT(12,14,58,10),USE(?Loc:Nama:Prompt)
                         ENTRY(@s20),AT(71,11,88,10),USE(Loc:Nama),COLOR(COLOR:Silver),TIP('Isi Nama Yang Baru'),UPR,READONLY
                         PROMPT('&Password Baru :'),AT(12,24,58,10),USE(?Loc:Baru:Prompt)
                         ENTRY(@s10),AT(71,24,88,10),USE(Loc:Baru),TIP('Isi Password yang baru'),PASSWORD
                         BUTTON('&OK'),AT(34,38,51,14),USE(?Button3),LEFT,TIP('Simpan data'),ICON(ICON:Tick)
                         BUTTON('E&xit'),AT(86,38,51,14),USE(?Button4),LEFT,TIP('Keluar dari Formulir Ini'),ICON(ICON:Cross)
                       END
                       GROUP,AT(6,4,161,43),USE(?Group3),BOXED,HIDE,BEVEL(1,1)
                         PROMPT('Ulangi Password :'),AT(12,11,58,10),USE(?Loc:Baru1:Prompt)
                         ENTRY(@s20),AT(72,11,88,10),USE(Loc:Baru1),TIP('Ulangi isi passoword yang baru'),PASSWORD
                         BUTTON('&OK'),AT(34,25,51,14),USE(?Button5),LEFT,TIP('Simpan data'),ICON(ICON:Tick)
                         BUTTON('&Exit'),AT(86,25,51,14),USE(?Button6),LEFT,TIP('Keluar dari Formulir Ini'),ICON(ICON:Cross)
                       END
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
  GlobalErrors.SetProcedureName('GantiPassword')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Loc:OldNama:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:JPASSWRD.SetOpenRelated()
  Relate:JPASSWRD.Open                                     ! File JPASSWRD used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('GantiPassword',window)                     ! Restore window settings from non-volatile store
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
    INIMgr.Update('GantiPassword',window)                  ! Save window data to non-volatile store
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
    OF ?Button4
       POST(Event:CloseWindow)
    OF ?Button6
       POST(Event:CloseWindow)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button1
      ThisWindow.Update
      Clear(Loc:Pas)
      Loc:Pas = Clip(Loc:Id)&Clip(Glo:Kunci1)
      !Loop Loc:I=1 to Len(Clip(Loc:Password))
      Loop Loc:I=1 to 10
          Loc:J = Val(Sub(Loc:Pas,Loc:I,1)) + Val(Sub(GLo:Kunci,Loc:I,1))
          !Loc:J = (26 - Loc:J % 26 ) + 96
          Loc:Huruf[Loc:I] = CHR(Loc:J)
      end
      JPSW:ID=Clip(Loc:Huruf)
      Set(JPSW:KeyId, JPSW:KeyId)
      If not errorcode() then
          Loc:Oke = 0
          Loop
              Next(JPasswrd)
              IF Errorcode() Then Break.
              If JPSW:ID = Clip(Loc:Huruf) Then
                  If Clip(JPSW:User_Id) = Clip(Loc:OldNama) then
                      Beep
                      Beep
                      Beep
                      Loc:Oke = 1
                      Break
                  end
              Else
                  Loop Loc:B = 1 To 20 By 1
                      Beep
                  End
              End
          End
          If Loc:Oke = 0 Then
              Loop Loc:B = 1 To 20 By 1
                  Beep
              End
      
              Message('Nama/Password Tidak Ditemukan..!','  Peringatan',Icon:Exclamation)
              Clear(loc:Huruf)
              !Glo:Flag += 1
              Cycle
          Else
              !If Clip(Glo:User_Id) = Clip(Loc:OldNama) Then
                 Loc:Nama=JPSW:USER_ID
                 Loc:Old =JPSW:USER_ID
                 ?Group1{Prop:Hide} = True
                 ?Group2{Prop:Hide} = False
                 Display
              !Else
              !   Beep
              !   Message('Keluar Program Dan Ulangi Lagi..!')
              !   Cycle
              !End
          End
      Else
              Loop Loc:B = 1 To 20 By 1
                  Beep
              End
      
      
          Message('Password Tidak Ditemukan..!','  Peringatan',Icon:Exclamation)
          cycle
      End
    OF ?Button3
      ThisWindow.Update
      If Loc:Nama = '' Then
              Loop Loc:B = 1 To 20 By 1
                  Beep
              End
          Beep
          Message('Nama Tidak Boleh Kosong...!')
          Cycle
      End
      If Loc:Baru = '' Then
              Loop Loc:B = 1 To 20 By 1
                  Beep
              End
          Beep
          Message('Isi Password Baru Anda...!')
          Cycle
      Else
              Loop Loc:B = 1 To 20 By 1
                  Beep
              End
          Beep
          ?Group2{Prop:Hide} = True
          ?Group3{Prop:Hide} = False
          Display
      End
    OF ?Button5
      ThisWindow.Update
      If Loc:Baru1 = '' Then
              Loop Loc:B = 1 To 20 By 1
                  Beep
              End
          Beep
          Message('Ulangi Password Baru Anda...!')
          Cycle
      End
      If Loc:Baru <> Loc:Baru1 Then
              Loop Loc:B = 1 To 20 By 1
                  Beep
              End
          Beep
          Message('Password Tidak Sama, Coba Ulangi Lagi...!')
          Post(Event:Closewindow)
      Else
          Clear(Loc:Huruf)
          Clear(Loc:Pas)
          Loc:Pas = Clip(Loc:Baru)&Clip(Glo:Kunci1)
          !Loop Loc:I=1 to Len(Clip(Loc:Password))
          Loop Loc:I=1 to 10
              Loc:J = Val(Sub(Loc:Pas,Loc:I,1)) + Val(Sub(GLo:Kunci,Loc:I,1))
              !Loc:J = (26 - Loc:J % 26 ) + 96
              Loc:Huruf[Loc:I] = CHR(Loc:J)
          end
          JPSW:USER_ID = Loc:Nama
          JPSW:ID = Clip(Loc:Huruf)
               PUT(JPasswrd)
               Message('Nama/Password Sudah Diperbaharui..!')
          Post(Event:Closewindow)
      End
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
      case event()
      of event:alertkey
          if keycode() = EscKey
              !HALT(0,'Akses dibatalkan !')
              Loop Loc:B = 1 To 20 By 1
                  Beep
              End
              Break
          end
      end
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

