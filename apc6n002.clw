

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N002.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N001.INC'),ONCE        !Req'd for module callout resolution
                     END


UpdateGHBPB PROCEDURE                                      ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
Str                  STRING(20)                            !
vl_nobatal           USHORT                                !
vl_nom               STRING(10)                            !
vl_thn               STRING(2)                             !
vl_bln               STRING(2)                             !
vl_nostr             STRING(10)                            !
vl_bil               STRING(8)                             !
vl_no                STRING(4)                             !
loc:i                BYTE                                  !
loc:ada              BYTE                                  !
vl_ada               BYTE                                  !
VL_NOMOR             STRING(10)                            !
BRW4::View:Browse    VIEW(GDBPB)
                       PROJECT(GDBPB:Kode_Brg)
                       PROJECT(GDBPB:Jumlah)
                       PROJECT(GDBPB:Qty_Accepted)
                       PROJECT(GDBPB:Keterangan)
                       PROJECT(GDBPB:NoBPB)
                       JOIN(GBAR:KeyKodeBrg,GDBPB:Kode_Brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Ket1)
                         PROJECT(GBAR:Ket2)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse:4       QUEUE                            !Queue declaration for browse/combo box using ?Browse:4
GDBPB:Kode_Brg         LIKE(GDBPB:Kode_Brg)           !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Ket1              LIKE(GBAR:Ket1)                !List box control field - type derived from field
GBAR:Ket2              LIKE(GBAR:Ket2)                !List box control field - type derived from field
GDBPB:Jumlah           LIKE(GDBPB:Jumlah)             !List box control field - type derived from field
GDBPB:Qty_Accepted     LIKE(GDBPB:Qty_Accepted)       !List box control field - type derived from field
GDBPB:Keterangan       LIKE(GDBPB:Keterangan)         !List box control field - type derived from field
GDBPB:NoBPB            LIKE(GDBPB:NoBPB)              !Primary key field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::GHBPB:Record LIKE(GHBPB:RECORD),THREAD
QuickWindow          WINDOW('Update Pemesanan'),AT(,,434,305),FONT('Arial',8,,),CENTER,IMM,HLP('UpdateGHBPB'),ALRT(EscKey),SYSTEM,GRAY,MDI
                       PROMPT('Nomor:'),AT(6,5),USE(?GHBPB:NoBPB:Prompt)
                       ENTRY(@s10),AT(55,5,55,10),USE(GHBPB:NoBPB),COLOR(COLOR:Silver),MSG('No BPB'),TIP('No BPB'),READONLY
                       PROMPT('Kode Apotik:'),AT(6,19),USE(?GHBPB:Kode_Apotik:Prompt)
                       ENTRY(@s5),AT(55,19,40,10),USE(GHBPB:Kode_Apotik),FONT(,,0800040H,),COLOR(COLOR:Silver),MSG('Kode Apotik'),TIP('Kode Apotik'),REQ,READONLY
                       BUTTON('...'),AT(99,18,12,12),USE(?CallLookup),DISABLE
                       PROMPT('Nama Apotik:'),AT(6,33),USE(?GAPO:Nama_Apotik:Prompt)
                       ENTRY(@s30),AT(55,33,127,10),USE(GAPO:Nama_Apotik),FONT(,,0800040H,),COLOR(COLOR:Silver),MSG('Nama Apotik'),TIP('Nama Apotik'),READONLY
                       PROMPT('Tanggal:'),AT(6,48),USE(?GHBPB:Tanggal:Prompt)
                       ENTRY(@D06),AT(55,48,57,10),USE(GHBPB:Tanggal),DISABLE,MSG('Tanggal'),TIP('Tanggal')
                       STRING('Status:'),AT(6,62),USE(?String1)
                       ENTRY(@s5),AT(55,62,57,10),USE(GHBPB:Status),FONT(,,COLOR:Yellow,),COLOR(COLOR:Navy),READONLY,MSG('Status')
                       PROMPT('No Master:'),AT(6,76),USE(?GHBPB:NoMaster:Prompt)
                       ENTRY(@s20),AT(55,76,57,10),USE(GHBPB:NoMaster),DISABLE
                       BUTTON('...'),AT(115,75,12,12),USE(?CallLookup:2)
                       PROMPT('User Input:'),AT(6,90),USE(?GHBPB:UserInput:Prompt)
                       ENTRY(@s20),AT(55,90,57,10),USE(GHBPB:UserInput),DISABLE
                       PROMPT('Jam Input:'),AT(6,104),USE(?GHBPB:JamInput:Prompt)
                       ENTRY(@t04),AT(55,104,57,10),USE(GHBPB:JamInput),DISABLE
                       LIST,AT(7,126,420,137),USE(?Browse:4),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('44L(2)|M~Kode Brg~@s10@97L(2)|M~Nama Obat~@s40@62L(2)|M~Kemasan~@s30@73L(2)|M~Ke' &|
   't~@s50@61R(2)|M~Jumlah~@n16.2@48R(2)|M~Jum Diterima~@n-12.2@80L(2)|M~Keterangan~' &|
   '@s20@'),FROM(Queue:Browse:4)
                       BUTTON('&Tambah'),AT(68,269,52,14),USE(?Insert:5),LEFT,ICON(ICON:New)
                       BUTTON('&Ubah'),AT(123,269,52,14),USE(?Change:5),LEFT,ICON(ICON:Open)
                       BUTTON('&Hapus'),AT(178,269,52,14),USE(?Delete:5),LEFT,ICON(ICON:Cut)
                       PANEL,AT(3,120,428,167),USE(?Panel1)
                       BUTTON('&OK'),AT(69,289,52,14),USE(?OK),LEFT,ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(123,289,52,14),USE(?Cancel),LEFT,ICON(ICON:Cross)
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
                     END

Toolbar              ToolbarClass
BRW4                 CLASS(BrowseClass)                    ! Browse using ?Browse:4
Q                      &Queue:Browse:4                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetFromAsk           PROCEDURE(*BYTE Request,*BYTE Response),DERIVED ! Method added to host embed code
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
!Proses Penomoran Otomatis Transaksi
Isi_Nomor Routine
   vl_nomor=''
   display
   loop
      logout(1,nomor_batal)
      if errorcode()=56 then
         cycle.
      !Silahkan diganti ---> 5=Transaksi Apotik Minta Brg Ke Gdg
      NOM:No_Urut=5
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 5=Transaksi Apotik Minta Brg Ke Gdg
         !NOMU:Urut =5
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
        !Silahkan diganti ---> 5=Transaksi Apotik Minta Brg Ke Gdg
        NOM1:No_urut=5
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 5=Transaksi Apotik Minta Brg Ke Gdg
           !NOMU:Urut =5
           !NOMU:Nomor=vl_nomor
           !add(nomoruse)
           !if errorcode()>0 then
           !   rollback
           !   cycle
           !end
           NOM1:No_Trans=sub(vl_nomor,1,6)&format(deformat(sub(vl_nomor,7,4),@n4)+1,@p####p)
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
   if format(sub(vl_nomor,5,2),@n2)<>month(today()) then
      !Silahkan diganti ---> 5=Transaksi Apotik Minta Brg Ke Gdg
      nomor_batal{prop:sql}='delete dba.nomor_batal where No=5'
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 5=Transaksi Apotik Minta Brg Ke Gdg
         NOM1:No_urut=5
         access:nomor_skr.fetch(NOM1:PrimaryKey)
         if not(errorcode()) then
            vl_nomor =NOM1:No_Trans
            NOM1:No_Trans=sub(vl_nomor,1,2)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'0002'
            access:nomor_skr.update()
            if errorcode()<>0 then
               rollback
               cycle
            else
               vl_nomor=sub(vl_nomor,1,2)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'0001'
               commit
            end
         end
         break
      end
   end
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   GHBPB:NoBPB=vl_nomor
   display

Batal_Nomor Routine
   !Silahkan diganti ---> 5=Transaksi Apotik Minta Brg Ke Gdg
   NOM:No_Urut =5
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=GHBPB:NoBPB
   NOM:Keterangan='Apt Minta Brg Gdg'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 5=Transaksi Apotik Minta Brg Ke Gdg
   !NOMU:Urut =5
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   !NOMU:Nomor=GHBPB:NoBPB
   !access:nomoruse.fetch(NOMU:PrimaryKey)
   !delete(nomoruse)

hapus_nomor_user routine
   NOMU:Urut    =5
   NOMU:Nomor   =GHBPB:NoBPB
   access:nomoruse.fetch(NOMU:PrimaryKey)
   if errorcode()=0 then
      delete(nomoruse)
   end

hapus_detil routine
   gdbpb{prop:sql}='delete dba.gdbpb where nobpb='''&GHBPB:NoBPB&''''

BATAL_D_UTAMA ROUTINE
    SET( BRW4::View:Browse)
    LOOP
        NEXT(BRW4::View:Browse)
        IF ERRORCODE() THEN BREAK.
        DELETE(BRW4::View:Browse)
    END

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Tambah data'
  OF ChangeRecord
    ActionMessage = 'Ubah data'
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateGHBPB')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GHBPB:NoBPB:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(GHBPB:Record,History::GHBPB:Record)
  SELF.AddHistoryField(?GHBPB:NoBPB,1)
  SELF.AddHistoryField(?GHBPB:Kode_Apotik,2)
  SELF.AddHistoryField(?GHBPB:Tanggal,3)
  SELF.AddHistoryField(?GHBPB:Status,4)
  SELF.AddHistoryField(?GHBPB:NoMaster,11)
  SELF.AddHistoryField(?GHBPB:UserInput,6)
  SELF.AddHistoryField(?GHBPB:JamInput,8)
  SELF.AddUpdateFile(Access:GHBPB)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:GDBPB.Open                                        ! File GDBPBMaster used by this procedure, so make sure it's RelationManager is open
  Relate:GDBPBMaster.Open                                  ! File GDBPBMaster used by this procedure, so make sure it's RelationManager is open
  Relate:GNOABPB.Open                                      ! File GDBPBMaster used by this procedure, so make sure it's RelationManager is open
  Relate:GNOBBPB.Open                                      ! File GDBPBMaster used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File GDBPBMaster used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_Batal.Open                                  ! File GDBPBMaster used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File GDBPBMaster used by this procedure, so make sure it's RelationManager is open
  Access:GHBPB.UseFile                                     ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:GHBPB
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
  !Jika Insert --> Buat No Transaksi
  If Self.Request = 1 Then
  !!   vl_ada=0
  !!   display
  !!   !Cari apakah ada nomor batal ?
  !!   set(gnobbpb)
  !!   loop
  !!      if access:gnobbpb.next()<>level:benign then break.
  !!      vl_ada=1
  !!      GHBPB:NoBPB=GNOBBPB:NoBPB
  !!      display
  !!      delete(gnobbpb)
  !!      break
  !!   end
  !!   !Jika Tidak Ada Nomor Batal
  !!   if vl_ada=0 then
  !!      GNOABPB:No=1
  !!      !access:gnoabpb.fetch(GNOABPB:KeyNo)
  !!      Set(GNOABPB:KeyNo, GNOABPB:KeyNo)
  !!      Loop
  !!        If access:gnoabpb.Next() <> level:benign Then Break.
  !!        GHBPB:NoBPB=GNOABPB:Nomor
  !!        display
  !!        GNOABPB:Nomor=sub(GNOABPB:Nomor,1,6)&format(deformat(sub(GNOABPB:Nomor,7,4),@n5)+1,@p####p)
  !!        access:gnoabpb.update()
  !!        Break
  !!      End
  !!   end
  
     !Tentukan Data Apotik dan Status Buka
     GHBPB:Status='Tutup'
     GHBPB:Kode_Apotik=GL_entryapotik
  end
  BRW4.Init(?Browse:4,Queue:Browse:4.ViewPosition,BRW4::View:Browse,Queue:Browse:4,Relate:GDBPB,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  if self.request=1 then
     do isi_nomor
  end
  ?Browse:4{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW4.Q &= Queue:Browse:4
  BRW4::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon GDBPB:Kode_Brg for sort order 1
  BRW4.AddSortOrder(BRW4::Sort0:StepClass,GDBPB:KeyBPBItem) ! Add the sort order for GDBPB:KeyBPBItem for sort order 1
  BRW4.AddRange(GDBPB:NoBPB,Relate:GDBPB,Relate:GHBPB)     ! Add file relationship range limit for sort order 1
  BRW4.AddField(GDBPB:Kode_Brg,BRW4.Q.GDBPB:Kode_Brg)      ! Field GDBPB:Kode_Brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Nama_Brg,BRW4.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Ket1,BRW4.Q.GBAR:Ket1)                ! Field GBAR:Ket1 is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Ket2,BRW4.Q.GBAR:Ket2)                ! Field GBAR:Ket2 is a hot field or requires assignment from browse
  BRW4.AddField(GDBPB:Jumlah,BRW4.Q.GDBPB:Jumlah)          ! Field GDBPB:Jumlah is a hot field or requires assignment from browse
  BRW4.AddField(GDBPB:Qty_Accepted,BRW4.Q.GDBPB:Qty_Accepted) ! Field GDBPB:Qty_Accepted is a hot field or requires assignment from browse
  BRW4.AddField(GDBPB:Keterangan,BRW4.Q.GDBPB:Keterangan)  ! Field GDBPB:Keterangan is a hot field or requires assignment from browse
  BRW4.AddField(GDBPB:NoBPB,BRW4.Q.GDBPB:NoBPB)            ! Field GDBPB:NoBPB is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Kode_brg,BRW4.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateGHBPB',QuickWindow)                  ! Restore window settings from non-volatile store
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
     do hapus_detil
  end
  if self.request=1 and self.response=1 then
     do hapus_nomor_user
  end
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:GDBPB.Close
    Relate:GDBPBMaster.Close
    Relate:GNOABPB.Close
    Relate:GNOBBPB.Close
    Relate:NomorUse.Close
    Relate:Nomor_Batal.Close
    Relate:Nomor_SKR.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateGHBPB',QuickWindow)               ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
    GHBPB:Tanggal = today()
    GHBPB:Verifikasi = 0
    GHBPB:UserInput = vg_user
    GHBPB:JamInput = clock()
  PARENT.PrimeFields


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  GHBPB1:NoBPB = GHBPB:NoMaster                            ! Assign linking field value
  Access:GHBPBMaster.Fetch(GHBPB1:KeyNoBPB)
  GAPO:Kode_Apotik = GHBPB:Kode_Apotik                     ! Assign linking field value
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
      selectapotik1
      SelectBPBMaster
      UpdateGDBPB
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CallLookup
      ThisWindow.Update
      GAPO:Kode_Apotik = GHBPB:Kode_Apotik
      IF SELF.Run(1,SelectRecord) = RequestCompleted       ! Call lookup procedure and verify RequestCompleted
        GHBPB:Kode_Apotik = GAPO:Kode_Apotik
      END
      ThisWindow.Reset(1)
    OF ?GHBPB:NoMaster
      IF GHBPB:NoMaster OR ?GHBPB:NoMaster{Prop:Req}
        GHBPB1:NoBPB = GHBPB:NoMaster
        IF Access:GHBPBMaster.TryFetch(GHBPB1:KeyNoBPB)
          IF SELF.Run(2,SelectRecord) = RequestCompleted
            GHBPB:NoMaster = GHBPB1:NoBPB
          ELSE
            SELECT(?GHBPB:NoMaster)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup:2
      ThisWindow.Update
      !
      
      GHBPB1:NoBPB = GHBPB:NoMaster
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        GHBPB:NoMaster = GHBPB1:NoBPB
      END
      ThisWindow.Reset(1)
      !message('select * from dba.gdbpbmaster where nobpb='''&GHBPB:NoMaster&'''')
      gdbpbmaster{prop:sql}='select * from dba.gdbpbmaster where nobpb='''&GHBPB:NoMaster&''''
      loop
         if access:gdbpbmaster.next()<>level:benign then break.
         !message('ada')
         GDBPB:NoBPB      =GHBPB:NoBPB
         GDBPB:Kode_Brg   =GDBPB1:Kode_Brg
         GDBPB:NoItem     =GDBPB1:NoItem
         GDBPB:Jumlah     =GDBPB1:Jumlah
         GDBPB:Keterangan =GDBPB1:Keterangan
         GDBPB:Qty_Accepted=0
         access:gdbpb.insert()
      end
      brw4.resetfromfile
      brw4.resetsort(1)
      
    OF ?OK
      ThisWindow.Update
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?Cancel
      ThisWindow.Update
      If Self.Request = InsertRecord Then
         GDBPB:NoBPB=vl_nomor
         set(GDBPB:KeyNoBPB, GDBPB:KeyNoBPB)
         Loop
             Next(GDBPB)
             if errorcode() Then Break.
             If Clip(GDBPB:NoBPB)=Clip(glo::no_nota) then
                delete(GDBPB)
             else
                 break
             end
         End
         Clear(Glo::No_Nota)
      END
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
    OF ?GHBPB:Kode_Apotik
      GAPO:Kode_Apotik = GHBPB:Kode_Apotik
      IF Access:GApotik.TryFetch(GAPO:KeyNoApotik)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          GHBPB:Kode_Apotik = GAPO:Kode_Apotik
        END
      END
      ThisWindow.Reset
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

SelectBPBMaster PROCEDURE                                  ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(GHBPBMaster)
                       PROJECT(GHBPB1:NoBPB)
                       PROJECT(GHBPB1:Keterangan)
                       PROJECT(GHBPB1:Kode_Apotik)
                       PROJECT(GHBPB1:Tanggal)
                       PROJECT(GHBPB1:Status)
                       PROJECT(GHBPB1:Verifikasi)
                       PROJECT(GHBPB1:UserInput)
                       PROJECT(GHBPB1:UserVal)
                       PROJECT(GHBPB1:JamInput)
                       PROJECT(GHBPB1:TanggalVal)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GHBPB1:NoBPB           LIKE(GHBPB1:NoBPB)             !List box control field - type derived from field
GHBPB1:Keterangan      LIKE(GHBPB1:Keterangan)        !List box control field - type derived from field
GHBPB1:Kode_Apotik     LIKE(GHBPB1:Kode_Apotik)       !List box control field - type derived from field
GHBPB1:Tanggal         LIKE(GHBPB1:Tanggal)           !List box control field - type derived from field
GHBPB1:Status          LIKE(GHBPB1:Status)            !List box control field - type derived from field
GHBPB1:Verifikasi      LIKE(GHBPB1:Verifikasi)        !List box control field - type derived from field
GHBPB1:UserInput       LIKE(GHBPB1:UserInput)         !List box control field - type derived from field
GHBPB1:UserVal         LIKE(GHBPB1:UserVal)           !List box control field - type derived from field
GHBPB1:JamInput        LIKE(GHBPB1:JamInput)          !List box control field - type derived from field
GHBPB1:TanggalVal      LIKE(GHBPB1:TanggalVal)        !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the GHBPBMaster File'),AT(,,358,188),FONT('Arial',8,,),IMM,HLP('SelectBPBMaster'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,342,124),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('44L(2)|M~Nomor~@s10@200L(2)|M~Keterangan~@s255@48L(2)|M~Kode Apotik~@s5@80R(2)|M' &|
   '~Tanggal~C(0)@D6@28L(2)|M~Status~@s5@44R(2)|M~Verifikasi~C(0)@n3@80L(2)|M~User I' &|
   'nput~@s20@80L(2)|M~User Val~@s20@80R(2)|M~Jam Input~C(0)@t04@80R(2)|M~Tanggal Va' &|
   'l~C(0)@d06@'),FROM(Queue:Browse:1)
                       BUTTON('&Pillih'),AT(305,148,45,14),USE(?Select:2)
                       SHEET,AT(4,4,350,162),USE(?CurrentTab)
                         TAB('No BPB'),USE(?Tab:2)
                           PROMPT('Nomor:'),AT(15,150),USE(?GHBPB1:NoBPB:Prompt)
                           ENTRY(@s10),AT(65,150,60,10),USE(GHBPB1:NoBPB),MSG('No BPB'),TIP('No BPB')
                         END
                       END
                       BUTTON('&Selesai'),AT(305,170,45,14),USE(?Close)
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
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
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
  GlobalErrors.SetProcedureName('SelectBPBMaster')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:GApotik.SetOpenRelated()
  Relate:GApotik.Open                                      ! File GApotik used by this procedure, so make sure it's RelationManager is open
  Relate:GHBPBMaster.Open                                  ! File GApotik used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GHBPBMaster,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,GHBPB1:KeyStatus)                     ! Add the sort order for GHBPB1:KeyStatus for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,GHBPB1:Status,1,BRW1)          ! Initialize the browse locator using  using key: GHBPB1:KeyStatus , GHBPB1:Status
  BRW1.AddSortOrder(,GHBPB1:KeyNoApotik)                   ! Add the sort order for GHBPB1:KeyNoApotik for sort order 2
  BRW1.AddSortOrder(,GHBPB1:KeyTanggal)                    ! Add the sort order for GHBPB1:KeyTanggal for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,GHBPB1:Tanggal,,BRW1)          ! Initialize the browse locator using  using key: GHBPB1:KeyTanggal , GHBPB1:Tanggal
  BRW1.AddSortOrder(,GHBPB1:KeyNoBPB)                      ! Add the sort order for GHBPB1:KeyNoBPB for sort order 4
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort0:Locator.Init(?GHBPB1:NoBPB,GHBPB1:NoBPB,,BRW1) ! Initialize the browse locator using ?GHBPB1:NoBPB using key: GHBPB1:KeyNoBPB , GHBPB1:NoBPB
  BRW1.SetFilter('(GHBPB1:Kode_Apotik=GL_entryapotik)')    ! Apply filter expression to browse
  BRW1.AddField(GHBPB1:NoBPB,BRW1.Q.GHBPB1:NoBPB)          ! Field GHBPB1:NoBPB is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB1:Keterangan,BRW1.Q.GHBPB1:Keterangan) ! Field GHBPB1:Keterangan is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB1:Kode_Apotik,BRW1.Q.GHBPB1:Kode_Apotik) ! Field GHBPB1:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB1:Tanggal,BRW1.Q.GHBPB1:Tanggal)      ! Field GHBPB1:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB1:Status,BRW1.Q.GHBPB1:Status)        ! Field GHBPB1:Status is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB1:Verifikasi,BRW1.Q.GHBPB1:Verifikasi) ! Field GHBPB1:Verifikasi is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB1:UserInput,BRW1.Q.GHBPB1:UserInput)  ! Field GHBPB1:UserInput is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB1:UserVal,BRW1.Q.GHBPB1:UserVal)      ! Field GHBPB1:UserVal is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB1:JamInput,BRW1.Q.GHBPB1:JamInput)    ! Field GHBPB1:JamInput is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB1:TanggalVal,BRW1.Q.GHBPB1:TanggalVal) ! Field GHBPB1:TanggalVal is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectBPBMaster',QuickWindow)              ! Restore window settings from non-volatile store
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
    Relate:GApotik.Close
    Relate:GHBPBMaster.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectBPBMaster',QuickWindow)           ! Save window data to non-volatile store
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
  ELSE
    RETURN SELF.SetSort(4,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

selectbarang1 PROCEDURE                                    ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(GBarang)
                       PROJECT(GBAR:Kode_brg)
                       PROJECT(GBAR:Nama_Brg)
                       PROJECT(GBAR:Kandungan)
                       PROJECT(GBAR:Ket1)
                       PROJECT(GBAR:Ket2)
                       PROJECT(GBAR:Jenis_Brg)
                       PROJECT(GBAR:No_Satuan)
                       PROJECT(GBAR:Status)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Kandungan         LIKE(GBAR:Kandungan)           !List box control field - type derived from field
GBAR:Ket1              LIKE(GBAR:Ket1)                !List box control field - type derived from field
GBAR:Ket2              LIKE(GBAR:Ket2)                !List box control field - type derived from field
GBAR:Jenis_Brg         LIKE(GBAR:Jenis_Brg)           !List box control field - type derived from field
GBAR:No_Satuan         LIKE(GBAR:No_Satuan)           !List box control field - type derived from field
GBAR:Status            LIKE(GBAR:Status)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(GStockGdg)
                       PROJECT(GSGD:Harga_Beli)
                       PROJECT(GSGD:Jumlah_Stok)
                       PROJECT(GSGD:Kode_brg)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
GSGD:Harga_Beli        LIKE(GSGD:Harga_Beli)          !List box control field - type derived from field
GSGD:Jumlah_Stok       LIKE(GSGD:Jumlah_Stok)         !List box control field - type derived from field
GSGD:Kode_brg          LIKE(GSGD:Kode_brg)            !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Daftar Barang'),AT(,,403,229),FONT('Arial',8,,),CENTER,IMM,HLP('SelectBarang'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,387,124),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('48L(2)|M~Kode Barang~@s10@80L(2)|M~Nama Obat~@s40@160L(2)|M~Kandungan~@s40@65L(2' &|
   ')|M~Kemasan~@s50@75L(2)|M~Keterangan~@s50@40L(2)|M~Jenis Brg~@s5@40L(2)|M~Satuan' &|
   '~C(0)@s10@12L(2)|M~Status~C(0)@n3@'),FROM(Queue:Browse:1)
                       LIST,AT(4,186,202,39),USE(?List),IMM,FONT('Arial',12,,FONT:bold),MSG('Browsing Records'),FORMAT('89R|M~Harga Beli~L@n16.`2@72L|M~Jumlah Stok~@n18.2@'),FROM(Queue:Browse)
                       STRING('Jumlah Stok Gudang :'),AT(4,168),USE(?String1),FONT('Arial',12,,FONT:bold)
                       BUTTON('&Pilih'),AT(136,148,45,14),USE(?Select:2)
                       SHEET,AT(4,4,396,162),USE(?CurrentTab)
                         TAB('Kode Barang'),USE(?Tab:2)
                           PROMPT('Kode Barang:'),AT(22,150),USE(?GBAR:Kode_brg:Prompt)
                           ENTRY(@s10),AT(72,148),USE(GBAR:Kode_brg),MSG('Kode Barang'),TIP('Kode Barang')
                         END
                         TAB('Nama Barang'),USE(?Tab2)
                           PROMPT('Nama Obat:'),AT(10,149),USE(?GBAR:Nama_Brg:Prompt)
                           ENTRY(@s40),AT(49,149,84,12),USE(GBAR:Nama_Brg),MSG('Nama Barang'),TIP('Nama Barang')
                         END
                         TAB('Kandungan'),USE(?Tab3)
                           ENTRY(@s40),AT(63,151,60,10),USE(GBAR:Kandungan)
                           PROMPT('Kandungan : '),AT(17,151),USE(?GBAR:Kandungan:Prompt)
                         END
                       END
                       BUTTON('&Selesai'),AT(191,148,45,14),USE(?Close)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Open                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  EntryLocatorClass                     ! Default Locator
BRW1::Sort1:Locator  EntryLocatorClass                     ! Conditional Locator - Choice(?CurrentTab)=2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - Choice(?CurrentTab)=3
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW5                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
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
  GlobalErrors.SetProcedureName('selectbarang1')
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
  Relate:GBarang.Open                                      ! File GStockGdg used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GBarang,SELF) ! Initialize the browse manager
  BRW5.Init(?List,Queue:Browse.ViewPosition,BRW5::View:Browse,Queue:Browse,Relate:GStockGdg,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,GBAR:KeyNama)                         ! Add the sort order for GBAR:KeyNama for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?GBAR:Nama_Brg,GBAR:Nama_Brg,,BRW1) ! Initialize the browse locator using ?GBAR:Nama_Brg using key: GBAR:KeyNama , GBAR:Nama_Brg
  BRW1.SetFilter('(gbar:status=1)')                        ! Apply filter expression to browse
  BRW1.AddSortOrder(,GBAR:KeyKodeKandungan)                ! Add the sort order for GBAR:KeyKodeKandungan for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,GBAR:Kandungan,1,BRW1)         ! Initialize the browse locator using  using key: GBAR:KeyKodeKandungan , GBAR:Kandungan
  BRW1.SetFilter('(gbar:status=1)')                        ! Apply filter expression to browse
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon GBAR:Kode_brg for sort order 3
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,GBAR:KeyKodeBrg) ! Add the sort order for GBAR:KeyKodeBrg for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(?GBAR:Kode_brg,GBAR:Kode_brg,,BRW1) ! Initialize the browse locator using ?GBAR:Kode_brg using key: GBAR:KeyKodeBrg , GBAR:Kode_brg
  BRW1.SetFilter('(gbar:status=1)')                        ! Apply filter expression to browse
  BRW1.AddField(GBAR:Kode_brg,BRW1.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Nama_Brg,BRW1.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Kandungan,BRW1.Q.GBAR:Kandungan)      ! Field GBAR:Kandungan is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Ket1,BRW1.Q.GBAR:Ket1)                ! Field GBAR:Ket1 is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Ket2,BRW1.Q.GBAR:Ket2)                ! Field GBAR:Ket2 is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Jenis_Brg,BRW1.Q.GBAR:Jenis_Brg)      ! Field GBAR:Jenis_Brg is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:No_Satuan,BRW1.Q.GBAR:No_Satuan)      ! Field GBAR:No_Satuan is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Status,BRW1.Q.GBAR:Status)            ! Field GBAR:Status is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse
  BRW5.AddSortOrder(,GSGD:KeyKodeBrg)                      ! Add the sort order for GSGD:KeyKodeBrg for sort order 1
  BRW5.AddRange(GSGD:Kode_brg,Relate:GStockGdg,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort0:Locator.Init(,GSGD:Kode_brg,1,BRW5)          ! Initialize the browse locator using  using key: GSGD:KeyKodeBrg , GSGD:Kode_brg
  BRW5.AddField(GSGD:Harga_Beli,BRW5.Q.GSGD:Harga_Beli)    ! Field GSGD:Harga_Beli is a hot field or requires assignment from browse
  BRW5.AddField(GSGD:Jumlah_Stok,BRW5.Q.GSGD:Jumlah_Stok)  ! Field GSGD:Jumlah_Stok is a hot field or requires assignment from browse
  BRW5.AddField(GSGD:Kode_brg,BRW5.Q.GSGD:Kode_brg)        ! Field GSGD:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('selectbarang1',QuickWindow)                ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
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
    Relate:GBarang.Close
  END
  IF SELF.Opened
    INIMgr.Update('selectbarang1',QuickWindow)             ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Open PROCEDURE

  CODE
  SELECT(?Tab2)
  PARENT.Open


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
  IF Choice(?CurrentTab)=2
    RETURN SELF.SetSort(1,Force)
  ELSIF Choice(?CurrentTab)=3
    RETURN SELF.SetSort(2,Force)
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW5.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

UpdateGDBPB PROCEDURE                                      ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
Loc:Item             SHORT                                 !
Loc:Ptr              LONG                                  !
loc:no               STRING(20)                            !
History::GDBPB:Record LIKE(GDBPB:RECORD),THREAD
QuickWindow          WINDOW('Memperbaharui Data Pemesanan Barang'),AT(,,219,110),FONT('Arial',8,,),CENTER,IMM,HLP('UpdateGDBPB'),SYSTEM,GRAY,MDI
                       PANEL,AT(4,4,211,81),USE(?Panel1)
                       PROMPT('No BPB:'),AT(11,9),USE(?GDBPB:NoBPB:Prompt)
                       ENTRY(@s10),AT(65,9,52,10),USE(GDBPB:NoBPB),FONT(,,0800040H,),COLOR(COLOR:Silver),MSG('No BPB'),TIP('No BPB'),READONLY
                       PROMPT('Kode Brg:'),AT(11,24),USE(?GDBPB:Kode_Brg:Prompt)
                       ENTRY(@s10),AT(65,24,44,10),USE(GDBPB:Kode_Brg),COLOR(COLOR:Silver),MSG('Kode Barang'),TIP('Kode Barang'),READONLY
                       BUTTON('F2'),AT(111,23,12,12),USE(?CallLookup),KEY(F2Key)
                       PROMPT('Nama Obat:'),AT(11,37),USE(?GBAR:Nama_Brg:Prompt)
                       ENTRY(@s40),AT(65,38,144,10),USE(GBAR:Nama_Brg),COLOR(COLOR:Silver),MSG('Nama Barang'),TIP('Nama Barang'),READONLY
                       PROMPT('Jumlah:'),AT(11,53),USE(?GDBPB:Jumlah:Prompt)
                       ENTRY(@n16.2),AT(65,53,68,10),USE(GDBPB:Jumlah),DECIMAL(14),MSG('Jumlah'),TIP('Jumlah')
                       PROMPT('Keterangan:'),AT(11,67),USE(?GDBPB:Keterangan:Prompt)
                       ENTRY(@s20),AT(65,67,84,10),USE(GDBPB:Keterangan),MSG('Keterangan'),TIP('Keterangan')
                       BUTTON('&OK'),AT(51,91,57,14),USE(?OK),LEFT,ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(111,91,60,14),USE(?Cancel),LEFT,ICON(ICON:Cross)
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
!BuatNoSelanjutnya ROUTINE
! 
! Loc:Item=1
! GDBPB:NoBPB=GHBPB:NoBPB
! Set(GDBPB:KeyNoBPB, GDBPB:KeyNoBPB)
! Loop
!    Next(GDBPB)
!    If Errorcode() Then Break.
!    If GDBPB:NoBPB=GHBPB:NoBPB Then
!       Loc:ITem = (Loc:Item + 1)
!    End
! End

ThisWindow.Ask PROCEDURE

  CODE
  !If Self.Request = InsertRecord Then
  !    Do BuatNoSelanjutnya
  !    loc:No=GDBPB:NoBPB
  !    Clear(GDBPB:RECORD)
  !    GDBPB:NoBPB=Loc:no
  !    GDBPB:NoItem=Loc:Item
  !End
  !Display
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Tambah data'
  OF ChangeRecord
    ActionMessage = 'Ubah data'
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateGDBPB')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Panel1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(GDBPB:Record,History::GDBPB:Record)
  SELF.AddHistoryField(?GDBPB:NoBPB,1)
  SELF.AddHistoryField(?GDBPB:Kode_Brg,2)
  SELF.AddHistoryField(?GDBPB:Jumlah,4)
  SELF.AddHistoryField(?GDBPB:Keterangan,5)
  SELF.AddUpdateFile(Access:GDBPB)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:GDBPB.Open                                        ! File GHBPB used by this procedure, so make sure it's RelationManager is open
  Access:GHBPB.UseFile                                     ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:GDBPB
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
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateGDBPB',QuickWindow)                  ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:GDBPB.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateGDBPB',QuickWindow)               ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = GDBPB:Kode_Brg                           ! Assign linking field value
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
    selectbarang1
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
    OF ?GDBPB:Kode_Brg
      IF GDBPB:Kode_Brg OR ?GDBPB:Kode_Brg{Prop:Req}
        GBAR:Kode_brg = GDBPB:Kode_Brg
        IF Access:GBarang.TryFetch(GBAR:KeyKodeBrg)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            GDBPB:Kode_Brg = GBAR:Kode_brg
          ELSE
            SELECT(?GDBPB:Kode_Brg)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      GBAR:Kode_brg = GDBPB:Kode_Brg
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        GDBPB:Kode_Brg = GBAR:Kode_brg
      END
      ThisWindow.Reset(1)
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

