

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N058.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N004.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N006.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N012.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N044.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N049.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N103.INC'),ONCE        !Req'd for module callout resolution
                     END


Trig_UpdateAntarApotik PROCEDURE                           ! Generated from procedure template - Window

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
                           ENTRY(@s5),AT(92,27,40,10),USE(APTH:Kode_Apotik),DISABLE,FONT('Times New Roman',12,COLOR:Black,),MSG('Kode Apotik'),TIP('Kode Apotik')
                           BUTTON('&F (F2)'),AT(318,25,27,12),USE(?CallLookup),KEY(F2Key)
                           PROMPT('Sub Farmasi dituju :'),AT(202,27),USE(?APTH:ApotikKeluar:Prompt)
                           ENTRY(@s5),AT(269,26,40,10),USE(APTH:ApotikKeluar),DISABLE,FONT('Times New Roman',12,,),REQ
                           IMAGE('DYPLUS.ICO'),AT(149,34,16,20),USE(?Image1)
                           IMAGE('DYPLUS.ICO'),AT(163,34,16,20),USE(?Image1:2)
                           IMAGE('DYPLUS.ICO'),AT(176,34,16,20),USE(?Image1:3)
                           PROMPT('Tanggal :'),AT(251,4),USE(?APTH:Tanggal:Prompt:2)
                           STRING(@s30),AT(9,46),USE(GL_namaapotik),FONT('Times New Roman',10,COLOR:Black,)
                           STRING(@s30),AT(202,44,129,10),USE(loc::nama_apotik)
                         END
                       END
                       LIST,AT(4,71,351,75),USE(?Browse:2),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('44L(2)|M~Kode Brg~@s10@167L(2)|M~Nama Barang~C@s40@60R(2)|M~Jumlah~C(0)@n-15.2@5' &|
   '6R(1)|M~Biaya~C(0)@n-15.2@'),FROM(Queue:Browse:2)
                       PANEL,AT(4,186,159,26),USE(?Panel1)
                       PROMPT('N0 transaksi :'),AT(8,194),USE(?APTH:N0_tran:Prompt),FONT('Times New Roman',10,COLOR:Black,)
                       PROMPT('Total Biaya:'),AT(229,155),USE(?APTH:Total_Biaya:Prompt),FONT('Times New Roman',10,COLOR:Black,FONT:bold+FONT:italic)
                       ENTRY(@n-15.2),AT(283,153),USE(APTH:Total_Biaya),RIGHT(1),FONT('Times New Roman',10,,)
                       ENTRY(@s15),AT(59,191,99,16),USE(APTH:N0_tran),DISABLE,FONT('Times New Roman',12,,FONT:bold),MSG('nomor transaksi'),TIP('nomor transaksi')
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
         !NOMU:Urut =4
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
        !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
        NOM1:No_urut=4
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
           !NOMU:Urut =4
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
   !NOMU:Urut =4
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   !NOMU:Nomor=APTH:N0_tran
   !access:nomoruse.fetch(NOMU:PrimaryKey)
   !delete(nomoruse)

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
  GlobalErrors.SetProcedureName('Trig_UpdateAntarApotik')
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
  INIMgr.Fetch('Trig_UpdateAntarApotik',QuickWindow)       ! Restore window settings from non-volatile store
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
    INIMgr.Update('Trig_UpdateAntarApotik',QuickWindow)    ! Save window data to non-volatile store
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
      Cari_apotik
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

PrintBatalRawatJalan PROCEDURE                             ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
LOC::KOSONG          STRING(20)                            !
vl_jam               TIME                                  !
vl_catatan           STRING(20)                            !
vl_total             REAL                                  !
vl_totalhuruf        STRING(100)                           !
Process:View         VIEW(APDTRANS)
                       PROJECT(APD:Diskon)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:N0_tran)
                       PROJECT(APD:Total)
                       PROJECT(APD:ktt)
                       JOIN(APH:by_transaksi,APD:N0_tran)
                         PROJECT(APH:Asal)
                         PROJECT(APH:Biaya)
                         PROJECT(APH:N0_tran)
                         PROJECT(APH:Nomor_mr)
                         PROJECT(APH:Tanggal)
                         PROJECT(APH:Kontrak)
                         JOIN(JKon:KeyKodeKtr,APH:Kontrak)
                           PROJECT(JKon:NAMA_KTR)
                         END
                       END
                       JOIN(GBAR:KeyKodeBrg,APD:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(2,2,203,136),PAPER(PAPER:USER,8250,5550),PRE(RPT),FONT('Arial',10,COLOR:Black,),MM
break1                 BREAK(LOC::KOSONG)
                         HEADER,AT(0,0,,21)
                           STRING('Ins. Farmasi - BATAL R. Jalan -'),AT(2,0,45,5),USE(?String11),TRN,FONT('Times New Roman',8,,FONT:regular)
                           STRING(@s5),AT(47,0,9,4),USE(GL_entryapotik),TRN,FONT('Times New Roman',8,,FONT:regular)
                           STRING(@s35),AT(2,6,,5),USE(JPas:Nama),TRN,FONT('Times New Roman',8,,FONT:regular)
                           STRING('No. RM :'),AT(2,3),USE(?String20),TRN,FONT('Times New Roman',8,,FONT:regular)
                           STRING(@N010_),AT(14,3),USE(APH:Nomor_mr),TRN,FONT('Times New Roman',8,,FONT:regular)
                           STRING(@s10),AT(33,3,17,5),USE(APH:Asal),FONT('Times New Roman',8,,FONT:regular)
                           STRING(@D08),AT(2,12),USE(APH:Tanggal),TRN,FONT('Times New Roman',8,,FONT:regular)
                           BOX,AT(1,15,181,5),COLOR(COLOR:Black)
                           STRING('Kode Barang'),AT(2,15,17,4),TRN,FONT('Times New Roman',8,,)
                           STRING('Nama Barang'),AT(19,15,17,4),USE(?String10),TRN,FONT('Times New Roman',8,,)
                           STRING('Catatan'),AT(83,15),USE(?String32),TRN,FONT('Times New Roman',8,,,CHARSET:ANSI)
                           STRING('Jumlah'),AT(100,15,10,4),TRN,FONT('Times New Roman',8,,)
                           STRING('Total'),AT(117,15,9,4),TRN,FONT('Times New Roman',8,,)
                           STRING(@s15),AT(2,9,25,5),USE(APH:N0_tran),TRN,FONT('Times New Roman',8,,FONT:regular)
                           STRING('Diskon'),AT(138,15,9,4),USE(?String29),TRN,FONT('Times New Roman',8,,)
                         END
detail1                  DETAIL,AT(,,193,4),USE(?detail1)
                           STRING(@n10.2),AT(100,0,15,4),USE(APD:Jumlah),TRN,LEFT,FONT('Times New Roman',8,,)
                           STRING(@n-14.2),AT(116,0,19,4),USE(APD:Total),TRN,RIGHT,FONT('Times New Roman',8,,)
                           STRING(@n-15.2),AT(137,0,18,4),USE(APD:Diskon),TRN,RIGHT,FONT('Times New Roman',8,,FONT:regular)
                           STRING(@s10),AT(2,0,17,4),USE(APD:Kode_brg),TRN,FONT('Times New Roman',8,,)
                           STRING(@s40),AT(19,0,,4),USE(GBAR:Nama_Brg),TRN,FONT('Times New Roman',8,,)
                           STRING(@n3),AT(92,0),USE(APD:ktt),HIDE
                           STRING(@s5),AT(83,0),USE(vl_catatan),FONT('Times New Roman',8,,,CHARSET:ANSI)
                         END
                         FOOTER,AT(0,0,,29)
                           STRING(@n-14.2),AT(116,1,19,4),SUM,RESET(break1),USE(APD:Total,,?APD:Total:2),TRN,RIGHT,FONT('Times New Roman',8,,FONT:regular)
                           STRING('Petugas Apotik'),AT(143,13),USE(?String27),TRN,FONT('Times New Roman',8,,)
                           STRING('2. Akuntansi'),AT(2,4),USE(?String25),TRN,HIDE,FONT('Times New Roman',8,,)
                           STRING(@n-15.2),AT(137,1,18,4),SUM,RESET(break1),USE(APD:Diskon,,?APD:Diskon:2),TRN,RIGHT,FONT('Times New Roman',8,,FONT:regular)
                           STRING(@s10),AT(144,18,17,3),USE(Glo:USER_ID),TRN,CENTER,FONT('Times New Roman',8,,)
                           STRING(@s100),AT(123,24),USE(JKon:NAMA_KTR),FONT('Arial',8,,FONT:regular)
                           STRING('(.{26})'),AT(141,19),USE(?String28:3),TRN,FONT('Times New Roman',8,,)
                           STRING('3. Arsip'),AT(2,7),USE(?String26),TRN,HIDE,FONT('Times New Roman',8,,)
                           STRING('Total : Rp.'),AT(83,6,16,4),USE(?String17),TRN,FONT('Times New Roman',8,,)
                           STRING(@n-14.2),AT(116,6,20,4),USE(APH:Biaya),TRN,RIGHT,FONT('Times New Roman',8,,FONT:regular)
                           STRING('Terbilang : '),AT(83,10),USE(?String34),TRN,FONT('Times New Roman',7,,,CHARSET:ANSI)
                           STRING(@s100),AT(94,10),USE(vl_totalhuruf),TRN,FONT('Times New Roman',7,,,CHARSET:ANSI)
                           STRING('1. Ybs.'),AT(2,1),USE(?String24),TRN,HIDE,FONT('Times New Roman',8,,)
                           LINE,AT(1,0,181,0),USE(?Line9),COLOR(COLOR:Black)
                           LINE,AT(117,5,37,0),USE(?Line6),COLOR(COLOR:Black)
                         END
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Reset                  PROCEDURE(BYTE Force=0),DERIVED     ! Method added to host embed code
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Update                 PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ProgressMgr          StepStringClass                       ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer

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
  GlobalErrors.SetProcedureName('PrintBatalRawatJalan')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  vl_total=round(APH:Biaya,1)
  if vl_total<0 then
      vl_totalhuruf='MINUS '&clip(angkaketulisan(vl_total*-1))&' RUPIAH'
  else
      vl_totalhuruf=clip(angkaketulisan(vl_total))&' RUPIAH'
  end
  vl_jam = CLOCK()
  Relate:APDTRANS.Open                                     ! File JPasien used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintBatalRawatJalan',ProgressWindow)      ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:APDTRANS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, APD:N0_tran)
  ThisReport.AddSortOrder(APD:by_transaksi)
  ThisReport.AddRange(APD:N0_tran,glo::no_nota)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  Relate:APDTRANS.SetQuickScan(1,Propagate:OneMany)
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom=True
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
    INIMgr.Update('PrintBatalRawatJalan',ProgressWindow)   ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  APH:N0_tran = APD:N0_tran                                ! Assign linking field value
  Access:APHTRANS.Fetch(APH:by_transaksi)
  JKon:KODE_KTR = APH:Kontrak                              ! Assign linking field value
  Access:JKontrak.Fetch(JKon:KeyKodeKtr)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  vl_catatan=''
  if APD:ktt=1 then
     vl_catatan='KTT'
     APD:Total=0
  end
  RETURN ReturnValue


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APH:N0_tran = APD:N0_tran                                ! Assign linking field value
  Access:APHTRANS.Fetch(APH:by_transaksi)
  JKon:KODE_KTR = APH:Kontrak                              ! Assign linking field value
  Access:JKontrak.Fetch(JKon:KeyKodeKtr)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail1)
  RETURN ReturnValue

Trig_BrowseBatalRawatJalan PROCEDURE                       ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
VL_NOTA              STRING(10)                            !
loc:nota             STRING(20)                            !
vl_no_urut           SHORT                                 !
vl_nomor             STRING(15)                            !
loc::thread          BYTE                                  !
loc::simpan          STRING(15)                            !nomor transaksi
Nomor_mr_APH         LONG                                  !Nomor Medical record pasien
Biaya_APH            REAL                                  !Total Biaya Pembelian
Asal_APH             STRING(10)                            !Kode darimana resep berasal
Kode_brg             STRING(10),DIM(50)                    !Kode Barang
Jumlah               REAL,DIM(50)                          !Jumlah
J_potong             REAL,DIM(50)                          !Jumlah yang dipotong ke tabel obat
Total                REAL,DIM(50)                          !Total harga barang / item
Camp                 ULONG,DIM(50)                         !
Harga_Dasar          REAL,DIM(50)                          !Harga Dasar
Kode_brg_apd         STRING(10),DIM(50)                    !Kode Barang
Jumlah_apd           REAL,DIM(50)                          !Jumlah
Total_apd            REAL,DIM(50)                          !Total harga barang / item
Camp_apd             ULONG,DIM(50)                         !
Harga_Dasar_apd      REAL,DIM(50)                          !Harga Dasar
DISKON_APD           REAL,DIM(50)                          !
Alamat               STRING(35)                            !Alamat Pasien
Nama                 STRING(35)                            !Nama pasien
RT                   STRING(3)                             !RT pasien
RW                   STRING(3)                             !RW pasien
Kota                 STRING(20)                            !Kota pasien
putar                ULONG                                 !
FilesOpened          BYTE                                  !
Lunas                STRING(5)                             !
Poliklinik           STRING(1)                             !
LOC::No_transaksi    STRING(15)                            !nomor transaksi
loc::no_tran_lama    STRING(15)                            !nomor transaksi
vl_nip               STRING(7)                             !
vl_kontraktor        STRING(10)                            !
vl_cara_bayar        BYTE                                  !
vl_lama_baru         BYTE                                  !
vl_notransaksiasal   STRING(20)                            !
total_dtg_apd        REAL,DIM(50)                          !
ktt_apd              BYTE,DIM(50)                          !
total_retur          REAL                                  !
loc:total_dtg        REAL                                  !
loc:total            REAL                                  !
vl_pembulatandtg     REAL                                  !
vl_real              REAL                                  !
vl_hasil             REAL                                  !
vl_seribu            REAL                                  !
vl_selisih           REAL                                  !
vl_diskon_pct        REAL                                  !
BRW1::View:Browse    VIEW(APHTRANS)
                       PROJECT(APH:Nomor_mr)
                       PROJECT(APH:Tanggal)
                       PROJECT(APH:Biaya)
                       PROJECT(APH:N0_tran)
                       PROJECT(APH:NoNota)
                       PROJECT(APH:Kode_Apotik)
                       PROJECT(APH:Asal)
                       PROJECT(APH:User)
                       PROJECT(APH:Batal)
                       PROJECT(APH:NoTransaksiAsal)
                       JOIN(JPas:KeyNomorMr,APH:Nomor_mr)
                         PROJECT(JPas:Nama)
                         PROJECT(JPas:Nomor_mr)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APH:Nomor_mr           LIKE(APH:Nomor_mr)             !List box control field - type derived from field
JPas:Nama              LIKE(JPas:Nama)                !List box control field - type derived from field
APH:Tanggal            LIKE(APH:Tanggal)              !List box control field - type derived from field
APH:Biaya              LIKE(APH:Biaya)                !List box control field - type derived from field
APH:N0_tran            LIKE(APH:N0_tran)              !List box control field - type derived from field
APH:NoNota             LIKE(APH:NoNota)               !List box control field - type derived from field
APH:Kode_Apotik        LIKE(APH:Kode_Apotik)          !List box control field - type derived from field
APH:Asal               LIKE(APH:Asal)                 !List box control field - type derived from field
APH:User               LIKE(APH:User)                 !List box control field - type derived from field
APH:Batal              LIKE(APH:Batal)                !List box control field - type derived from field
APH:NoTransaksiAsal    LIKE(APH:NoTransaksiAsal)      !List box control field - type derived from field
JPas:Nomor_mr          LIKE(JPas:Nomor_mr)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW6::View:Browse    VIEW(APDTRANS)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Total)
                       PROJECT(APD:Diskon)
                       PROJECT(APD:Camp)
                       PROJECT(APD:Harga_Dasar)
                       PROJECT(APD:total_dtg)
                       PROJECT(APD:ktt)
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
APD:Harga_Dasar        LIKE(APD:Harga_Dasar)          !List box control field - type derived from field
APD:total_dtg          LIKE(APD:total_dtg)            !List box control field - type derived from field
APD:ktt                LIKE(APD:ktt)                  !List box control field - type derived from field
APD:N0_tran            LIKE(APD:N0_tran)              !Primary key field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Pengembalian Obat Per Transaksi Instalasi Farmasi- Rawat Jalan'),AT(,,457,234),FONT('Arial',8,,),CENTER,IMM,HLP('Tran_Poliklinik'),SYSTEM,GRAY,MDI
                       SHEET,AT(5,4,445,111),USE(?CurrentTab)
                         TAB('No. Transaksi [F3]'),USE(?Tab:3),KEY(F3Key)
                           ENTRY(@s15),AT(139,94,93,13),USE(APH:N0_tran),MSG('nomor transaksi'),TIP('nomor transaksi')
                           BUTTON('Cetak Detil'),AT(15,91,69,20),USE(?Button8),LEFT,ICON(ICON:Print)
                           PROMPT('N0 tran:'),AT(89,96),USE(?APH:N0_tran:Prompt)
                           BUTTON('Button 10'),AT(307,94,45,14),USE(?Button10),DISABLE,HIDE
                         END
                         TAB('No Billing'),USE(?Tab2)
                           PROMPT('No Billing:'),AT(13,96),USE(?APH:NoNota:Prompt)
                           ENTRY(@s20),AT(63,94,93,13),USE(loc:nota)
                         END
                       END
                       BUTTON('&Batalkan'),AT(368,91,78,20),USE(?Button9),LEFT,FONT('Times New Roman',10,,FONT:bold),ICON(ICON:Cut)
                       LIST,AT(10,20,435,66),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('49L|FM~Nomor RM~C@N010_@99L|FM~Nama~C@s35@51L|M~Tanggal~C@D8@54D(14)|M~Biaya~C(0' &|
   ')@N-16.2@64L|M~N 0 tran~C@s15@47L|M~No Nota~C@s10@25L|M~Kode Apotik~C@s5@44L|M~A' &|
   'sal~@s10@16L|M~User~@s4@12L|M~Batal~@n3@60L|M~No Transaksi Asal~@s15@'),FROM(Queue:Browse:1)
                       LIST,AT(10,119,435,87),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('52L|FM~Kode Barang~C@s10@147L|FM~Nama Obat~C@s40@68L|FM~Ket 2~C@s50@62D(14)|M~Ju' &|
   'mlah~C(0)@n-11.2@63D(14)|M~Total~C(0)@N-16.2@60D(14)|M~Diskon~C(0)@n15.2@60L~Cam' &|
   'p~C@n2@44D(14)~Harga Dasar~C@n11.2@64D(14)~total dtg~C@N-16.2@12L~ktt~C@n3@'),FROM(Queue:Browse)
                       BUTTON('T&ransaksi '),AT(375,0,59,15),USE(?Insert:3),DISABLE,HIDE,LEFT,FONT('Times New Roman',12,COLOR:Blue,FONT:regular)
                       BUTTON('&Select'),AT(279,1,45,14),USE(?Select:2),HIDE
                       BUTTON('&Change'),AT(229,1,45,14),USE(?Change:3),DISABLE,HIDE,DEFAULT
                       BUTTON('&Delete'),AT(179,1,45,14),USE(?Delete:3),DISABLE,HIDE
                       BUTTON('&Tutup'),AT(360,209,83,22),USE(?Close),LEFT,ICON(ICON:Cross)
                       BUTTON('Help'),AT(329,1,45,14),USE(?Help),HIDE,STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
Open                   PROCEDURE(),DERIVED                 ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort2:Locator  IncrementalLocatorClass               ! Conditional Locator - choice(?CurrentTab)=2
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW6                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
                     END

BRW6::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::EIPManager     BrowseEIPManager                      ! Browse EIP Manager for Browse using ?Browse:1
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
      !Silahkan diganti ---> 6=Transaksi Apotik Batal
      NOM:No_Urut=6
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 6=Transaksi Apotik Batal
         !NOMU:Urut =6
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
        !Silahkan diganti ---> 1=Transaksi Apotik Batal
        NOM1:No_urut=6
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 1=Transaksi Apotik Batal
           !NOMU:Urut =6
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
      !Silahkan diganti ---> 6=Transaksi Apotik Batal
      nomor_batal{prop:sql}='delete dba.nomor_batal where No=6'
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 6=Transaksi Apotik Batal
         NOM1:No_urut=6
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
   !APH:N0_tran=vl_nomor
   LOC::No_transaksi=vl_nomor
   display

Batal_Nomor Routine
   !Silahkan diganti ---> 6=Transaksi Apotik Batal
   NOM:No_Urut =6
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=APH:N0_tran
   NOM:Keterangan='Batal Trans Aptk'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 6=Transaksi Apotik Batal
   !NOMU:Urut =6
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   !NOMU:Nomor=APH:N0_tran
   !access:nomoruse.fetch(NOMU:PrimaryKey)
   !delete(nomoruse)

hapus_nomor_use routine
   NOMU:Urut    =6
   NOMU:Nomor   =LOC::No_transaksi
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
      !Silahkan diganti ---> 6=Transaksi Apotik Batal
      NOM:No_Urut=vl_no_urut
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 6=Transaksi Apotik Batal
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
        !Silahkan diganti ---> 1=Transaksi Apotik Batal
        NOM1:No_urut=vl_no_urut
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 1=Transaksi Apotik Batal
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
      !Silahkan diganti ---> 6=Transaksi Apotik Batal
      nomor_batal{prop:sql}='delete dba.nomor_batal where No='&vl_no_urut
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 6=Transaksi Apotik Batal
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
   !APH:N0_tran=vl_nomor
   LOC::No_transaksi=vl_nomor
   display

Batal_Nomor1 Routine
   !Silahkan diganti ---> 6=Transaksi Apotik Batal
   NOM:No_Urut =vl_no_urut
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=APH:N0_tran
   NOM:Keterangan='Batal Trans Aptk'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 6=Transaksi Apotik Batal
   NOMU:Urut =vl_no_urut
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOMU:Nomor=APH:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   delete(nomoruse)

hapus_nomor_use1 routine
   NOMU:Urut    =vl_no_urut
   NOMU:Nomor   =LOC::No_transaksi
   access:nomoruse.fetch(NOMU:PrimaryKey)
   if errorcode()=0 then
      delete(nomoruse)
   end

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
  Access:ISetupAp.Close()
  ! Untuk tambah 2 data di GBarang, yaitu _campur dan _ biaya ( untuk obat campur )
  GBAR:Kode_brg = '_Campur'
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  IF ERRORCODE()
      GBAR:Kode_brg = '_Campur'
      GBAR:Nama_Brg = 'Total Obat Campur'
      Access:GBarang.Insert()
  END
  GBAR:Kode_brg = '_Biaya'
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  IF ERRORCODE()
      GBAR:Kode_brg = '_Biaya'
      GBAR:Nama_Brg = 'Biaya Obat Campur'
      Access:GBarang.Insert()
  END
  ! Untuk transaksi rutine, jika ada discount
  GBAR:Kode_brg = '_Disc'
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  IF ERRORCODE()
      GBAR:Kode_brg = '_Disc'
      GBAR:Nama_Brg = 'Discount'
      Access:GBarang.Insert()
  END
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_BrowseBatalRawatJalan')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APH:N0_tran
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('VG_TANGGAL1',VG_TANGGAL1)                          ! Added by: BrowseBox(ABC)
  BIND('VG_TANGGAL2',VG_TANGGAL2)                          ! Added by: BrowseBox(ABC)
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  loc::thread=glo::mainthreadno
  POST(EVENT:Disable_RJalanN,,loc::thread)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  WindowTanggal()
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  case deformat(sub(clip(GL_entryapotik),3,2),@n2)
     of '01'
        vl_no_urut=31
     of '02'
        vl_no_urut=32
     of '04'
        vl_no_urut=33
     of '06'
        vl_no_urut=34
     of '07'
        vl_no_urut=35
     of '08'
        vl_no_urut=36
  END
  Relate:APDTRANS.Open                                     ! File JTransaksi used by this procedure, so make sure it's RelationManager is open
  Relate:Ano_pakai.Open                                    ! File JTransaksi used by this procedure, so make sure it's RelationManager is open
  Relate:IAP_SET.Open                                      ! File JTransaksi used by this procedure, so make sure it's RelationManager is open
  Relate:JDBILLING.Open                                    ! File JTransaksi used by this procedure, so make sure it's RelationManager is open
  Relate:JDDBILLING.Open                                   ! File JTransaksi used by this procedure, so make sure it's RelationManager is open
  Relate:JHBILLING.Open                                    ! File JTransaksi used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File JTransaksi used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_Batal.Open                                  ! File JTransaksi used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File JTransaksi used by this procedure, so make sure it's RelationManager is open
  Access:ApReLuar.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APDTcam.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JTransaksi.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:APHTRANS,SELF) ! Initialize the browse manager
  BRW6.Init(?List,Queue:Browse.ViewPosition,BRW6::View:Browse,Queue:Browse,Relate:APDTRANS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,APH:nonota_aphtras_key)               ! Add the sort order for APH:nonota_aphtras_key for sort order 1
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort2:Locator.Init(?loc:nota,APH:NoNota,1,BRW1)    ! Initialize the browse locator using ?loc:nota using key: APH:nonota_aphtras_key , APH:NoNota
  BRW1.SetFilter('(aph:tanggal>=VG_TANGGAL1 and aph:tanggal<<=VG_TANGGAL2 and (sub(APH:N0_tran,1,3)=''APJ'' or sub(APH:N0_tran,1,3)=''APB''))') ! Apply filter expression to browse
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon APH:N0_tran for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,APH:by_transaksi) ! Add the sort order for APH:by_transaksi for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?APH:N0_tran,APH:N0_tran,,BRW1) ! Initialize the browse locator using ?APH:N0_tran using key: APH:by_transaksi , APH:N0_tran
  BRW1.SetFilter('(aph:tanggal>=VG_TANGGAL1 and aph:tanggal<<=VG_TANGGAL2 and (sub(APH:N0_tran,1,3)=''APJ'' or sub(APH:N0_tran,1,3)=''APB'') and APH:Kode_Apotik=GL_entryapotik)') ! Apply filter expression to browse
  BRW1.AddField(APH:Nomor_mr,BRW1.Q.APH:Nomor_mr)          ! Field APH:Nomor_mr is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nama,BRW1.Q.JPas:Nama)                ! Field JPas:Nama is a hot field or requires assignment from browse
  BRW1.AddField(APH:Tanggal,BRW1.Q.APH:Tanggal)            ! Field APH:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(APH:Biaya,BRW1.Q.APH:Biaya)                ! Field APH:Biaya is a hot field or requires assignment from browse
  BRW1.AddField(APH:N0_tran,BRW1.Q.APH:N0_tran)            ! Field APH:N0_tran is a hot field or requires assignment from browse
  BRW1.AddField(APH:NoNota,BRW1.Q.APH:NoNota)              ! Field APH:NoNota is a hot field or requires assignment from browse
  BRW1.AddField(APH:Kode_Apotik,BRW1.Q.APH:Kode_Apotik)    ! Field APH:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(APH:Asal,BRW1.Q.APH:Asal)                  ! Field APH:Asal is a hot field or requires assignment from browse
  BRW1.AddField(APH:User,BRW1.Q.APH:User)                  ! Field APH:User is a hot field or requires assignment from browse
  BRW1.AddField(APH:Batal,BRW1.Q.APH:Batal)                ! Field APH:Batal is a hot field or requires assignment from browse
  BRW1.AddField(APH:NoTransaksiAsal,BRW1.Q.APH:NoTransaksiAsal) ! Field APH:NoTransaksiAsal is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nomor_mr,BRW1.Q.JPas:Nomor_mr)        ! Field JPas:Nomor_mr is a hot field or requires assignment from browse
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
  BRW6.AddField(APD:Harga_Dasar,BRW6.Q.APD:Harga_Dasar)    ! Field APD:Harga_Dasar is a hot field or requires assignment from browse
  BRW6.AddField(APD:total_dtg,BRW6.Q.APD:total_dtg)        ! Field APD:total_dtg is a hot field or requires assignment from browse
  BRW6.AddField(APD:ktt,BRW6.Q.APD:ktt)                    ! Field APD:ktt is a hot field or requires assignment from browse
  BRW6.AddField(APD:N0_tran,BRW6.Q.APD:N0_tran)            ! Field APD:N0_tran is a hot field or requires assignment from browse
  BRW6.AddField(GBAR:Kode_brg,BRW6.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_BrowseBatalRawatJalan',QuickWindow)   ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW6.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW6.ToolbarItem.HelpButton = ?Help
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:Ano_pakai.Close
    Relate:IAP_SET.Close
    Relate:JDBILLING.Close
    Relate:JDDBILLING.Close
    Relate:JHBILLING.Close
    Relate:NomorUse.Close
    Relate:Nomor_Batal.Close
    Relate:Nomor_SKR.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_BrowseBatalRawatJalan',QuickWindow) ! Save window data to non-volatile store
  END
  POST(EVENT:Enable_RJalanN,,loc::thread)
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
    OF ?Button8
      glo::no_nota=APH:N0_tran
      display
      PrintBatalRawatJalan()
    OF ?Button9
      aphtrans{prop:sql}='select * from dba.aphtrans where NoTransaksiAsal='''&APH:N0_tran&''''
      if access:aphtrans.next()=level:benign then
          message('Nomor Transaksi sudah pernah dilakukan Retur/Retur Per Obat, silahkan coba menggunakan menu Retur Penjualan Pasien Rawat Jalan Per Obat ')
          cycle
      elsif APH:Biaya <0 or APH:NoTransaksiAsal<>'' or sub(APH:N0_tran,1,3)= 'APB' then
          message('Tidak dapat dilanjutkan, karena transaksi tersebut merupakan transaksi retur')
          cycle
      else
      vl_notransaksiasal=APH:N0_tran
      !message(APH:NoNota)
      JHB:NOMOR=APH:NoNota
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
      
      NOM1:No_urut=6
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
      
      
      IF GL_entryapotik<>APH:Kode_Apotik then
         message('Apotik tidak sama dengan Apotik Transaksi ! Apotik Transaksinya = '&APH:Kode_Apotik&' !')
      else
      !   JDB:NOMOR                    =APH:NoNota
      !   JDB:NOTRAN_INTERNAL          =APH:N0_tran
      !   JDB:KODEJASA                 ='FAR.00001.00.00'
      !   JDB:Status_Batal_Produksi    =0
      !   if access:jdbilling.fetch(JDB:PK1)=level:benign then
      !      if upper(clip(vg_user))<>'ADI' then
      !         if JDB:STATUS_TUTUP=1 then
      !            message('Transaksi ini sudah ada pembayaran, silahkan hubungi Billing !!! ')
      !            cycle
      !         end
      !      end
      !   end
         JTra:No_Nota=APH:NoNota
         access:jtransaksi.fetch(JTra:KeyNoNota)
         if JTra:StatusBatal=1 then
            if upper(clip(vg_user))<>'ADI' then
               message('Anda tidak berhak membatalkan !!!')
               cycle
            end
         end
      
         JHB:NOMOR=APH:NoNota
         if access:jhbilling.fetch(JHB:KNOMOR)=level:benign then
      
            if JHB:TUTUP<>1 then
      
               CASE MESSAGE('Batalkan Transaksi nomor : '&APH:N0_tran&'?','PEMBATALAN TRANSAKSI',ICON:Question,BUTTON:Yes+BUTTON:No,BUTTON:No,1)
      
               OF BUTTON:No                            !    the window is System Modal
                 
               OF BUTTON:Yes
                   GLO:HARGA_DASAR_BATAL = 0
                   loc:total_dtg = 0
                   loc:total = 0
                   glo:tanggalbatal=today()
                   windowtanggalbatal
                   
                   GET(APHTRANS,APH:by_transaksi)
                   IF APH:Batal = 1
                       MESSAGE('DATA '&APH:N0_tran&' Sudah pernah dibatalkan')
                   ELSE
                       loc::no_tran_lama = APH:N0_tran
                       APH:Batal = 1
                       put(APHTRANS)
                       !Isi Nomor Baru
                       do Isi_Nomor
                       APR:N0_tran = loc::no_tran_lama
                       GET(ApReLuar,APR:by_transaksi)
                       IF NOT ERRORCODE()
                           Nama = APR:Nama
                           Alamat = APR:Alamat
                           RT = APR:RT
                           RW = APR:RW
                           Kota = APR:Kota
                           APR:N0_tran = LOC::No_transaksi
                           APR:Nama = Nama
                           APR:Alamat = Alamat
                           APR:RT = RT
                           APR:RW = RW
                           APR:Kota = Kota
                           ADD (ApReLuar)
                       END
                       I# = 1
                       apdtcam{prop:sql}='select * from dba.apdtcam where n0_tran='''&loc::no_tran_lama&''''
                       LOOP
                           IF Access:APDTCAM.next()<>level:benign THEN
                               I# = I# - 1
                               BREAK
                           END
                           Kode_brg[I#] = APD1:Kode_brg
                           Jumlah[I#] = - APD1:Jumlah
                           J_potong[I#] = - APD1:J_potong
                           !Total[I#] = - APD1:Total
                           Total[I#] = - APD1:Harga_Dasar
                           Camp[I#] = APD1:Camp
                           Harga_Dasar[I#] = APD1:Harga_Dasar
                           I# = I# + 1
                       END
                       IF I# > 0
                           LOOP S# = 1 TO I#
                                   APD1:N0_tran = LOC::No_transaksi
                                   APD1:Kode_brg = Kode_brg[S#]
                                   APD1:Jumlah = Jumlah[S#]
                                   APD1:J_potong = J_potong[S#]
                                   !APD1:Total = Total[S#]
                                   APD1:Total = Harga_Dasar[S#]
                                   APD1:Camp = Camp[S#]
                                   APD1:Harga_Dasar = Harga_Dasar[S#]
                                   ADD (APDTcam)
                           END
                       END
      
                       I# = 1
                       SET( BRW6::View:Browse)
                       LOOP
                           NEXT(BRW6::View:Browse)
                           IF ERRORCODE() THEN
                               I# = I# - 1
                               BREAK
                           END
                           if apd:camp=0 then
                              total_retur=APD:Harga_Dasar * APD:Jumlah
                              Kode_brg_apd[I#] = APD:Kode_brg
                              Jumlah_apd[I#] = APD:Jumlah
                              !Total_apd[I#] = - APD:Total
                              Total_apd[I#] = - total_retur
                              Camp_apd[I#] = APD:Camp
                              Harga_Dasar_apd[I#] = - APD:Harga_Dasar
                              DISKON_APD[I#]=-APD:Diskon
                              if APD:total_dtg>total_retur then
                                  total_dtg_apd[I#]= - total_retur
                              else
                                  total_dtg_apd[I#]= - APD:total_dtg
                              end
                              ktt_apd[I#]=APD:ktt
                              I# = I# + 1
                           end
                       END
      
                       LOOP S# = 1 TO I#
                           total_retur=Harga_Dasar_apd[S#] * Jumlah_apd[S#]
                           APD:N0_tran     =LOC::No_transaksi
                           APD:Kode_brg    =Kode_brg_apd[S#]
                           APD:Jumlah      =Jumlah_apd[S#]
                           APD:Total       =Total_apd[S#]
                           APD:Camp        =Camp_apd[S#]
                           APD:Harga_Dasar =Harga_Dasar_apd[S#]
                           APD:Diskon      =DISKON_APD[S#]
                           GLO:HARGA_DASAR_BATAL =  GLO:HARGA_DASAR_BATAL + total_retur
                           loc:total_dtg   = loc:total_dtg + total_dtg_apd[S#]
                           APD:ktt         =ktt_apd[S#]
                           APD:total_dtg   =total_dtg_apd[S#]
                           IF APD:Total <> 0
                              vl_pembulatandtg=0
                              vl_pembulatandtg=APD:Total
                              vl_selisih=0
                              vl_hasil=0
                              vl_real=APD:Total
                              vl_seribu=round(APD:Total,1000)
                              if vl_seribu<vl_real then
                                  vl_selisih=vl_real-vl_seribu
                                  if vl_selisih>500 then
                                      vl_selisih=500
                                      vl_hasil=vl_seribu+vl_selisih
                                  else
                                      vl_hasil=vl_seribu
                                  end
                              else
                                  vl_selisih=vl_seribu-vl_real
                                  if vl_selisih>400 then
                                      vl_hasil=vl_seribu-500
                                  else
                                      vl_hasil=vl_seribu
                                  end
                              end
                              APD:Total = vl_hasil
                              if vl_pembulatandtg=APD:total_dtg then
                                  APD:total_dtg=APD:Total
                              end
                           END
                           if ktt_apd[S#] = 0 then
                              loc:total = loc:total + APD:Total
                           end
                           ADD (APDTrans)
                       END
      
                       Nomor_mr_APH = APH:Nomor_mr
                       Biaya_APH = loc:total
                       Asal_APH =  APH:Asal
                       vl_nip=APH:NIP
                       vl_kontraktor=APH:Kontrak
                       vl_lama_baru=APH:LamaBaru
                       vl_cara_bayar=APH:cara_bayar
                       vl_nota      =APH:NoNota
                       !windownota
                       !vl_nota      =glo:nota
      
                       !message(Nomor_mr_APH&' '&clip(LOC::No_transaksi)&' '&Biaya_APH)
                       
                       APH:Nomor_mr           = Nomor_mr_APH
                       APH:Tanggal            = glo:tanggalbatal
                       APH:Biaya              = Biaya_APH
                       APH:N0_tran            = clip(LOC::No_transaksi)
                       APH:User               = Glo:USER_ID
                       APH:Bayar              = 1
                       APH:Ra_jal             = 1
                       APH:Asal               = Asal_APH
                       APH:cara_bayar         = vl_cara_bayar
                       APH:Kode_Apotik        = GL_entryapotik
                       APH:shift              = vg_shift_apotik
                       APH:Batal              = 0
                       APH:Diskon             = 0
                       APH:NIP                = vl_nip
                       APH:Kontrak            = vl_kontraktor
                       APH:LamaBaru           = vl_lama_baru
                       APH:dokter             = ''
                       APH:NoNota             = vl_nota
                       APH:Ruang              = ''
                       APH:NoPaket            = 0
                       APH:Racikan            = 0
                       APH:Jam                = clock()
                       APH:NomorEPresribing   = ''
                       APH:Resep              = 0
                       APH:NilaiKontrak       = 0
                       APH:NilaiTunai         = 0
                       APH:NilaiDitagih       = 0
                       APH:NomorReference     = ''
                       APH:NoTransaksiAsal    = vl_notransaksiasal
                       APH:Harga_Dasar        = GLO:HARGA_DASAR_BATAL
                       APH:biaya_dtg          = loc:total_dtg
                       if access:APHTRANS.insert()<>level:benign then message(error()).
      
                       !Update Billing
                       GLO:HARGA_DASAR_BATAL = - GLO:HARGA_DASAR_BATAL
      !                 JDB:NOMOR            =APH:NoNota
      !                 JDB:NOTRAN_INTERNAL  =APH:N0_tran
      !                 JDB:KODEJASA         ='FAR.00001.00.00'
      !                 JDB:TOTALBIAYA       =APH:Biaya
      !                 JDB:hppobat          = - GLO:HARGA_DASAR_BATAL
      !                 JDB:KETERANGAN       =''
      !                 JDB:JUMLAH           =1
      !!                 if GL_entryapotik='FM04' or GL_entryapotik='FM09' then
      !!                    JDB:KODE_BAGIAN      ='FARMASI'
      !!                 else
      !!                    JDB:KODE_BAGIAN      ='FARPD'
      !!                 end
      !                 JDB:KODE_BAGIAN      =APH:Kode_Apotik
      !
      !                    JDB:Validasi=1
      !                    JDB:UsrValidasi=Glo:USER_ID
      !                    JDB:JmValidasi=clock()
      !                    JDB:TglValidasi=glo:tanggalbatal
      !
      !                 if APH:cara_bayar<>3 then
      !                    JDB:DTG_JD           =0
      !                 else
      !                    if APH:Nomor_mr=99999999 then
      !                       JDB:DTG_JD           =0
      !                    else
      !                       JDB:DTG_JD           =APH:biaya_dtg
      !                    end
      !                 end
      !
      !
      !
      !!                 if APH:cara_bayar<>3 then
      !!                    JDB:Validasi=1
      !!                    JDB:UsrValidasi=Glo:User_id
      !!                    JDB:JmValidasi=clock()
      !!                    JDB:TglValidasi=JTra:Tanggal
      !!                 end
      !
      !                 !JDB:TglValidasi      =today()
      !                 !JDB:JmValidasi       =clock()
      !
      !                 JDB:KoreksiTarif     =0
      !                 JDB:STATUS_TUTUP     =0
      !                 JDB:StatusBatal      =0
      !                 JDB:STATUS_TUTUP     =0
      !                 JDB:StatusBatal      =0
      !                 JDB:JUMLAH_BYR       =0
      !                 JDB:SISA_BYR         =0
      !                 JDB:NO_PEMBAYARAN    =''
      !                 JDB:DISCOUNT         =0
      !                 JDB:BYRSELISIH       =0
      !                 JDB:JenisPembayaran  =APH:cara_bayar
      !                 JDB:ValidasiProduksi =1
      !                 access:jdbilling.insert()
      !                 JDDB:NOMOR           =APH:NoNota
      !                 JDDB:NOTRAN_INTERNAL =APH:N0_tran
      !                 JDDB:KODEJASA        ='FAR.00001.00.00'
      !                 JDDB:SUBKODEJASA     ='FAR.00001.04.00'
      !                 JDDB:KETERANGAN      =''
      !                 JDDB:JUMLAH          =1
      !                 JDDB:TOTALBIAYA      =APH:Biaya
      !                 JDDB:hppobat         = - GLO:HARGA_DASAR_BATAL
      !                 if APH:cara_bayar<>3 then
      !                    JDDB:DTG_JD           =0
      !                 else
      !                    if APH:Nomor_mr=99999999 then
      !                       JDDB:DTG_JD           =0
      !                    else
      !                       JDDB:DTG_JD           =APH:biaya_dtg
      !                    end
      !                 end
      !
      !                 access:jddbilling.insert()
                       !glo::no_nota=APH:N0_tran
      
      
      
                       ANOp:Nomor = LOC::No_transaksi
                       Get(Ano_pakai,ANOp:key_isi)
                       DELETE(ANo_Pakai)
                       message('Nomor transaksi pembatalan |'&LOC::No_transaksi)
                       glo::no_nota = LOC::No_transaksi
      !                 PrintBatalRawatJalan
                       do hapus_nomor_use
                   END
               END
            else
               message('Billing sudah ditutup !')
            end
         else
            message('No Billing tidak ada !')
         end
      end
      
      end
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button10
      ThisWindow.Update
      !aphtrans{prop:sql}='select * from dba.aphtrans where NoTransaksiAsal='''&APH:N0_tran&''''
      !if access:aphtrans.next()=level:benign then
      !    message('Nomor Transaksi sudah pernah dilakukan Retur/Retur Per Obat, silahkan coba menggunakan menu Retur Penjualan Pasien Rawat Jalan Per Obat ')
      !    cycle
      !elsif APH:Biaya <0 then
      !    message('Tidak dapat dilanjutkan, karena transaksi tersebut merupakan transaksi retur')
      !    cycle
      !else
      !vl_notransaksiasal=APH:N0_tran
      !!message(APH:NoNota)
      !JHB:NOMOR=APH:NoNota
      !if access:jhbilling.fetch(JHB:KNOMOR)=level:benign then
      !   !message(JHB:TUTUP)
      !   if JHB:TUTUP=1 then
      !      message('Nota sudah ditutup !!!')
      !      cycle
      !   end
      !else
      !   message('Nota tidak ada !!!')
      !   cycle
      !end
      !
      !NOM1:No_urut=6
      !access:nomor_skr.fetch(NOM1:PrimaryKey)
      !if not(errorcode()) then
      !   if sub(format(year(today()),@p####p),3,2)<format(sub(clip(NOM1:No_Trans),4,2),@n2) then
      !      message('Tanggal sistem lebih kecil dari tanggal penomoran, tidak bisa dilanjutkan !!!')
      !      cycle
      !   elsif month(today())<format(sub(clip(NOM1:No_Trans),6,2),@n2) and sub(format(year(today()),@p####p),3,2)=format(sub(clip(NOM1:No_Trans),4,2),@n2) then
      !      message('Tanggal sistem lebih kecil dari tanggal penomoran, tidak bisa dilanjutkan !!!')
      !      cycle
      !   end
      !end
      !
      !
      !IF GL_entryapotik<>APH:Kode_Apotik then
      !   message('Apotik tidak sama dengan Apotik Transaksi ! Apotik Transaksinya = '&APH:Kode_Apotik&' !')
      !else
      !!   JDB:NOMOR                    =APH:NoNota
      !!   JDB:NOTRAN_INTERNAL          =APH:N0_tran
      !!   JDB:KODEJASA                 ='FAR.00001.00.00'
      !!   JDB:Status_Batal_Produksi    =0
      !!   if access:jdbilling.fetch(JDB:PK1)=level:benign then
      !!      if upper(clip(vg_user))<>'ADI' then
      !!         if JDB:STATUS_TUTUP=1 then
      !!            message('Transaksi ini sudah ada pembayaran, silahkan hubungi Billing !!! ')
      !!            cycle
      !!         end
      !!      end
      !!   end
      !   JTra:No_Nota=APH:NoNota
      !   access:jtransaksi.fetch(JTra:KeyNoNota)
      !   if JTra:StatusBatal=1 then
      !      if upper(clip(vg_user))<>'ADI' then
      !         message('Anda tidak berhak membatalkan !!!')
      !         cycle
      !      end
      !   end
      !
      !   JHB:NOMOR=APH:NoNota
      !   if access:jhbilling.fetch(JHB:KNOMOR)=level:benign then
      !
      !      if JHB:TUTUP<>1 then
      !
      !         CASE MESSAGE('Batalkan Transaksi nomor : '&APH:N0_tran&'?','PEMBATALAN TRANSAKSI',ICON:Question,BUTTON:Yes+BUTTON:No,BUTTON:No,1)
      !
      !         OF BUTTON:No                            !    the window is System Modal
      !           
      !         OF BUTTON:Yes
      !             GLO:HARGA_DASAR_BATAL = 0
      !             loc:total_dtg = 0
      !             glo:tanggalbatal=today()
      !             windowtanggalbatal
      !             
      !             GET(APHTRANS,APH:by_transaksi)
      !             IF APH:Batal = 1
      !                 MESSAGE('DATA '&APH:N0_tran&' Sudah pernah dibatalkan')
      !             ELSE
      !                 loc::no_tran_lama = APH:N0_tran
      !                 APH:Batal = 1
      !                 put(APHTRANS)
      !                 !Isi Nomor Baru
      !                 do Isi_Nomor
      !                 APR:N0_tran = loc::no_tran_lama
      !                 GET(ApReLuar,APR:by_transaksi)
      !                 IF NOT ERRORCODE()
      !                     Nama = APR:Nama
      !                     Alamat = APR:Alamat
      !                     RT = APR:RT
      !                     RW = APR:RW
      !                     Kota = APR:Kota
      !                     APR:N0_tran = LOC::No_transaksi
      !                     APR:Nama = Nama
      !                     APR:Alamat = Alamat
      !                     APR:RT = RT
      !                     APR:RW = RW
      !                     APR:Kota = Kota
      !                     ADD (ApReLuar)
      !                 END
      !                 I# = 1
      !                 apdtcam{prop:sql}='select * from dba.apdtcam where n0_tran='''&loc::no_tran_lama&''''
      !                 LOOP
      !                     IF Access:APDTCAM.next()<>level:benign THEN
      !                         I# = I# - 1
      !                         BREAK
      !                     END
      !                     Kode_brg[I#] = APD1:Kode_brg
      !                     Jumlah[I#] = - APD1:Jumlah
      !                     J_potong[I#] = - APD1:J_potong
      !                     !Total[I#] = - APD1:Total
      !                     Total[I#] = - APD1:Harga_Dasar
      !                     Camp[I#] = APD1:Camp
      !                     Harga_Dasar[I#] = APD1:Harga_Dasar
      !                     I# = I# + 1
      !                 END
      !                 IF I# > 0
      !                     LOOP S# = 1 TO I#
      !                             APD1:N0_tran = LOC::No_transaksi
      !                             APD1:Kode_brg = Kode_brg[S#]
      !                             APD1:Jumlah = Jumlah[S#]
      !                             APD1:J_potong = J_potong[S#]
      !                             !APD1:Total = Total[S#]
      !                             APD1:Total = Harga_Dasar[S#]
      !                             APD1:Camp = Camp[S#]
      !                             APD1:Harga_Dasar = Harga_Dasar[S#]
      !                             ADD (APDTcam)
      !                     END
      !                 END
      !                 I# = 1
      !                 SET( BRW6::View:Browse)
      !                 LOOP
      !                     NEXT(BRW6::View:Browse)
      !                     IF ERRORCODE() THEN
      !                         I# = I# - 1
      !                         BREAK
      !                     END
      !                     if apd:camp=0 then
      !                        total_retur=APD:Harga_Dasar * APD:Jumlah
      !                        Kode_brg_apd[I#] = APD:Kode_brg
      !                        Jumlah_apd[I#] = APD:Jumlah
      !                        !Total_apd[I#] = - APD:Total
      !                        Total_apd[I#] = - total_retur
      !                        Camp_apd[i#] = APD:Camp
      !                        Harga_Dasar_apd[I#] = - APD:Harga_Dasar
      !                        DISKON_APD[I#]=-APD:Diskon
      !                        if APD:total_dtg>total_retur then
      !                            total_dtg_apd[I#]= - total_retur
      !                        else
      !                            total_dtg_apd[I#]= - APD:total_dtg
      !                        end
      !                        ktt_apd[I#]=APD:ktt
      !                        I# = I# + 1
      !                     end
      !                 END
      !
      !                 LOOP S# = 1 TO I#
      !                     APD:N0_tran     =LOC::No_transaksi
      !                     APD:Kode_brg    =Kode_brg_apd[S#]
      !                     APD:Jumlah      =Jumlah_apd[S#]
      !                     APD:Total       =Total_apd[S#]
      !                     APD:Camp        =Camp_apd[S#]
      !                     APD:Harga_Dasar =Harga_Dasar_apd[S#]
      !                     APD:Diskon      =DISKON_APD[S#]
      !                     GLO:HARGA_DASAR_BATAL =  GLO:HARGA_DASAR_BATAL + (APD:Harga_Dasar * APD:Jumlah)
      !                     loc:total_dtg   = loc:total_dtg + total_dtg_apd[S#]
      !                     APD:ktt         =ktt_apd[S#]
      !                     APD:total_dtg   =total_dtg_apd[S#]
      !                     ADD (APDTrans)
      !                 END
      !
      !                 Nomor_mr_APH = APH:Nomor_mr
      !                 Biaya_APH = - APH:Biaya
      !                 Asal_APH =  APH:Asal
      !                 vl_nip=APH:NIP
      !                 vl_kontraktor=APH:Kontrak
      !                 vl_lama_baru=APH:LamaBaru
      !                 vl_cara_bayar=APH:cara_bayar
      !                 vl_nota      =APH:NoNota
      !                 !windownota
      !                 !vl_nota      =glo:nota
      !
      !                 !message(Nomor_mr_APH&' '&clip(LOC::No_transaksi)&' '&Biaya_APH)
      !                 
      !                 APH:Nomor_mr           = Nomor_mr_APH
      !                 APH:Tanggal            = glo:tanggalbatal
      !                 !APH:Biaya              = Biaya_APH
      !                 APH:Biaya              = GLO:HARGA_DASAR_BATAL
      !                 APH:N0_tran            = clip(LOC::No_transaksi)
      !                 APH:User               = Glo:USER_ID
      !                 APH:Bayar              = 1
      !                 APH:Ra_jal             = 1
      !                 APH:Asal               = Asal_APH
      !                 APH:cara_bayar         = vl_cara_bayar
      !                 APH:Kode_Apotik        = GL_entryapotik
      !                 APH:shift              = vg_shift_apotik
      !                 APH:Batal              = 0
      !                 APH:Diskon             = 0
      !                 APH:NIP                = vl_nip
      !                 APH:Kontrak            = vl_kontraktor
      !                 APH:LamaBaru           = vl_lama_baru
      !                 APH:dokter             = ''
      !                 APH:NoNota             = vl_nota
      !                 APH:Ruang              = ''
      !                 APH:NoPaket            = 0
      !                 APH:Racikan            = 0
      !                 APH:Jam                = clock()
      !                 APH:NomorEPresribing   = ''
      !                 APH:Resep              = 0
      !                 APH:NilaiKontrak       = 0
      !                 APH:NilaiTunai         = 0
      !                 APH:NilaiDitagih       = 0
      !                 APH:NomorReference     = ''
      !                 APH:NoTransaksiAsal    = vl_notransaksiasal
      !                 APH:biaya_dtg          = loc:total_dtg
      !                 if access:APHTRANS.insert()<>level:benign then message(error()).
      !
      !                 !Update Billing
      !                 GLO:HARGA_DASAR_BATAL = - GLO:HARGA_DASAR_BATAL
      !                 JDB:NOMOR            =APH:NoNota
      !                 JDB:NOTRAN_INTERNAL  =APH:N0_tran
      !                 JDB:KODEJASA         ='FAR.00001.00.00'
      !                 JDB:TOTALBIAYA       =APH:Biaya
      !                 JDB:hppobat          = - GLO:HARGA_DASAR_BATAL
      !                 JDB:KETERANGAN       =''
      !                 JDB:JUMLAH           =1
      !!                 if GL_entryapotik='FM04' or GL_entryapotik='FM09' then
      !!                    JDB:KODE_BAGIAN      ='FARMASI'
      !!                 else
      !!                    JDB:KODE_BAGIAN      ='FARPD'
      !!                 end
      !                 JDB:KODE_BAGIAN      =APH:Kode_Apotik
      !
      !                    JDB:Validasi=1
      !                    JDB:UsrValidasi=Glo:USER_ID
      !                    JDB:JmValidasi=clock()
      !                    JDB:TglValidasi=glo:tanggalbatal
      !
      !                 if APH:cara_bayar<>3 then
      !                    JDB:DTG_JD           =0
      !                 else
      !                    if APH:Nomor_mr=99999999 then
      !                       JDB:DTG_JD           =0
      !                    else
      !                       JDB:DTG_JD           =APH:biaya_dtg
      !                    end
      !                 end
      !
      !
      !
      !!                 if APH:cara_bayar<>3 then
      !!                    JDB:Validasi=1
      !!                    JDB:UsrValidasi=Glo:User_id
      !!                    JDB:JmValidasi=clock()
      !!                    JDB:TglValidasi=JTra:Tanggal
      !!                 end
      !
      !                 !JDB:TglValidasi      =today()
      !                 !JDB:JmValidasi       =clock()
      !
      !                 JDB:KoreksiTarif     =0
      !                 JDB:STATUS_TUTUP     =0
      !                 JDB:StatusBatal      =0
      !                 JDB:STATUS_TUTUP     =0
      !                 JDB:StatusBatal      =0
      !                 JDB:JUMLAH_BYR       =0
      !                 JDB:SISA_BYR         =0
      !                 JDB:NO_PEMBAYARAN    =''
      !                 JDB:DISCOUNT         =0
      !                 JDB:BYRSELISIH       =0
      !                 JDB:JenisPembayaran  =APH:cara_bayar
      !                 JDB:ValidasiProduksi =1
      !                 access:jdbilling.insert()
      !                 JDDB:NOMOR           =APH:NoNota
      !                 JDDB:NOTRAN_INTERNAL =APH:N0_tran
      !                 JDDB:KODEJASA        ='FAR.00001.00.00'
      !                 JDDB:SUBKODEJASA     ='FAR.00001.04.00'
      !                 JDDB:KETERANGAN      =''
      !                 JDDB:JUMLAH          =1
      !                 JDDB:TOTALBIAYA      =APH:Biaya
      !                 JDDB:hppobat         = - GLO:HARGA_DASAR_BATAL
      !                 if APH:cara_bayar<>3 then
      !                    JDDB:DTG_JD           =0
      !                 else
      !                    if APH:Nomor_mr=99999999 then
      !                       JDDB:DTG_JD           =0
      !                    else
      !                       JDDB:DTG_JD           =APH:biaya_dtg
      !                    end
      !                 end
      !
      !                 access:jddbilling.insert()
      !                 !glo::no_nota=APH:N0_tran
      !
      !
      !
      !                 ANOp:Nomor = LOC::No_transaksi
      !                 Get(Ano_pakai,ANOp:key_isi)
      !                 DELETE(ANo_Pakai)
      !                 message('Nomor transaksi pembatalan |'&LOC::No_transaksi)
      !                 glo::no_nota = LOC::No_transaksi
      !!                 PrintBatalRawatJalan
      !                 do hapus_nomor_use
      !             END
      !         END
      !      else
      !         message('Billing sudah ditutup !')
      !      end
      !   else
      !      message('No Billing tidak ada !')
      !   end
      !end
      !
      !end
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
    OF ?APH:N0_tran
      select(?Browse:1)
    OF ?loc:nota
      select(?Browse:1)
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
  SELF.EIP &= BRW1::EIPManager                             ! Set the EIP manager
  SELF.AddEditControl(,2)
  SELF.DeleteAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Default+EIPAction:Remain+EIPAction:RetainColumn
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END


BRW1.Open PROCEDURE

  CODE
  IF GLO:LEVEL > 2
      ?Button9{PROP:DISABLE}=TRUE
  END
  PARENT.Open


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


BRW6.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

cetak_detail_batal_rj PROCEDURE                            ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
print_ajuan          STRING(10)                            !
print_ajuan2         LONG                                  !Nomor Medical record pasien
print_ajuan3         STRING(35)                            !Nama pasien
FilesOpened          BYTE                                  !
LOC::KOSONG          STRING(20)                            !
vl_jam               TIME                                  !
Process:View         VIEW(APDTRANS)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:N0_tran)
                       PROJECT(APD:Total)
                       JOIN(APH:by_transaksi,APD:N0_tran)
                         PROJECT(APH:Asal)
                         PROJECT(APH:Biaya)
                         PROJECT(APH:N0_tran)
                         PROJECT(APH:Tanggal)
                         PROJECT(APH:Kontrak)
                         JOIN(JKon:KeyKodeKtr,APH:Kontrak)
                           PROJECT(JKon:NAMA_KTR)
                         END
                       END
                       JOIN(GBAR:KeyKodeBrg,APD:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(490,1448,3500,18552),PAPER(PAPER:USER,8250,13000),PRE(RPT),FONT('Arial',10,COLOR:Black,),THOUS
                       HEADER,AT(500,260,3000,1188)
                         STRING('Ins. Farmasi -- BATAL Transaksi'),AT(31,10,1990,198),USE(?String11),TRN,FONT('Times New Roman',8,,)
                         STRING(@s10),AT(1260,177,792,188),USE(APH:Asal),TRN
                         STRING(@N010_),AT(552,177),USE(print_ajuan2),TRN,FONT('Times New Roman',8,,)
                         STRING('No. RM :'),AT(31,177),USE(?String20),TRN,FONT('Times New Roman',8,,)
                         STRING(@D06),AT(1031,510),USE(APH:Tanggal),TRN,FONT('Times New Roman',8,,)
                         STRING(@t04),AT(1656,510),USE(vl_jam),FONT('Arial',8,,FONT:regular)
                         BOX,AT(21,750,2219,427),COLOR(COLOR:Black)
                         LINE,AT(854,990,0,188),COLOR(COLOR:Black)
                         LINE,AT(1552,990,0,188),COLOR(COLOR:Black)
                         STRING('Nama Barang'),AT(52,771),USE(?String10),TRN,FONT('Times New Roman',8,,)
                         LINE,AT(10,969,2208,0),USE(?Line11),COLOR(COLOR:Black)
                         STRING('Jumlah'),AT(1021,990,417,167),TRN,FONT('Times New Roman',8,,)
                         STRING('Total'),AT(1760,990,354,167),TRN,FONT('Times New Roman',8,,)
                         STRING('Kode Barang'),AT(52,990,688,167),TRN,FONT('Times New Roman',8,,)
                         STRING(@s35),AT(31,354,2271,188),USE(print_ajuan3),FONT('Times New Roman',8,,FONT:regular)
                         STRING(@s15),AT(31,510),USE(APH:N0_tran),TRN,FONT('Times New Roman',8,,)
                       END
break1                 BREAK(LOC::KOSONG)
detail1                  DETAIL,AT(10,,7417,323),USE(?detail1)
                           STRING(@n10.2),AT(844,167,646,167),USE(APD:Jumlah),LEFT(14),FONT('Times New Roman',8,,)
                           STRING(@n11.2),AT(1563,167,708,167),USE(APD:Total),LEFT(14),FONT('Times New Roman',8,,)
                           STRING(@s10),AT(146,167,667,167),USE(APD:Kode_brg),FONT('Times New Roman',8,,)
                           STRING(@s40),AT(42,21,2521,146),USE(GBAR:Nama_Brg),FONT('Times New Roman',8,,)
                         END
                         FOOTER,AT(0,0,,927)
                           STRING('Petugas Apotik'),AT(1229,177),USE(?String27),TRN,FONT('Times New Roman',8,,)
                           STRING('2. Akuntansi'),AT(63,385),USE(?String25),TRN,FONT('Times New Roman',8,,)
                           STRING('(.{26})'),AT(1135,594),USE(?String28),TRN,FONT('Times New Roman',8,,)
                           STRING(@s100),AT(42,760,2083,146),USE(JKon:NAMA_KTR),FONT('Arial',8,,FONT:regular)
                           STRING('3. Arsip'),AT(63,510),USE(?String26),TRN,FONT('Times New Roman',8,,)
                           STRING(@s10),AT(1250,490),USE(Glo:USER_ID),CENTER,FONT('Times New Roman',8,,)
                           STRING('Total : Rp.'),AT(948,42),USE(?String17),TRN,FONT('Times New Roman',8,,)
                           STRING(@n-14),AT(1573,42),USE(APH:Biaya),TRN,FONT('Times New Roman',8,,)
                           STRING('1. Ybs'),AT(63,260),USE(?String24),TRN,FONT('Times New Roman',8,,)
                           LINE,AT(10,0,3000,0),USE(?Line9),COLOR(COLOR:Black)
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
Previewer            PrintPreviewClass                     ! Print Previewer

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
  GlobalErrors.SetProcedureName('cetak_detail_batal_rj')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  vl_jam = CLOCK()
  Relate:APDTRANS.Open                                     ! File APDTRANS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('cetak_detail_batal_rj',ProgressWindow)     ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:APDTRANS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, APD:N0_tran)
  ThisReport.AddSortOrder(APD:by_transaksi)
  ThisReport.AddRange(APD:N0_tran,glo::no_nota)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  Relate:APDTRANS.SetQuickScan(1,Propagate:OneMany)
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom=True
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
    INIMgr.Update('cetak_detail_batal_rj',ProgressWindow)  ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  APH:N0_tran = APD:N0_tran                                ! Assign linking field value
  Access:APHTRANS.Fetch(APH:by_transaksi)
  JKon:KODE_KTR = APH:Kontrak                              ! Assign linking field value
  Access:JKontrak.Fetch(JKon:KeyKodeKtr)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APH:N0_tran = APD:N0_tran                                ! Assign linking field value
  Access:APHTRANS.Fetch(APH:by_transaksi)
  JKon:KODE_KTR = APH:Kontrak                              ! Assign linking field value
  Access:JKontrak.Fetch(JKon:KeyKodeKtr)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail1)
  RETURN ReturnValue

WindowNota PROCEDURE                                       ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
Window               WINDOW('Nota'),AT(,,160,89),FONT('Arial',8,,FONT:regular),CENTER,GRAY,MDI
                       PROMPT('Nota :'),AT(19,29),USE(?glo:nota:Prompt)
                       ENTRY(@s10),AT(54,29,60,10),USE(glo:nota),DISABLE
                       BUTTON('...'),AT(117,27,12,12),USE(?CallLookup)
                       BUTTON('OK'),AT(65,60,57,14),USE(?OkButton),DEFAULT
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
  GlobalErrors.SetProcedureName('WindowNota')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?glo:nota:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:JTransaksi.SetOpenRelated()
  Relate:JTransaksi.Open                                   ! File JTransaksi used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('WindowNota',Window)                        ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:JTransaksi.Close
  END
  IF SELF.Opened
    INIMgr.Update('WindowNota',Window)                     ! Save window data to non-volatile store
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
    SelectJTransaksiMR
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?glo:nota
      IF glo:nota OR ?glo:nota{Prop:Req}
        JTra:Nomor_Mr = glo:nota
        IF Access:JTransaksi.TryFetch(JTra:KeyNomorMr)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            glo:nota = JTra:Nomor_Mr
          ELSE
            SELECT(?glo:nota)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      JTra:Nomor_Mr = glo:nota
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        glo:nota = JTra:Nomor_Mr
      END
      ThisWindow.Reset(1)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

