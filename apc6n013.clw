

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N013.INC'),ONCE        !Local module procedure declarations
                     END


UpdateGHBPBMaster PROCEDURE                                ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
vl_nomor             STRING(20)                            !
History::GHBPB1:Record LIKE(GHBPB1:RECORD),THREAD
QuickWindow          WINDOW('Update the GHBPBMaster File'),AT(,,285,133),FONT('Arial',8,,),CENTER,IMM,HLP('UpdateGHBPBMaster'),SYSTEM,GRAY,MDI
                       PROMPT('Nomor:'),AT(17,9),USE(?GHBPB1:NoBPB:Prompt)
                       ENTRY(@s10),AT(70,9,69,10),USE(GHBPB1:NoBPB),DISABLE,MSG('No BPB'),TIP('No BPB')
                       ENTRY(@s255),AT(70,23,205,10),USE(GHBPB1:Keterangan)
                       STRING('Keterangan :'),AT(17,24),USE(?String1)
                       PROMPT('Kode Apotik:'),AT(17,37),USE(?GHBPB1:Kode_Apotik:Prompt)
                       ENTRY(@s5),AT(70,36,40,10),USE(GHBPB1:Kode_Apotik),DISABLE,MSG('Kode Apotik'),TIP('Kode Apotik'),REQ
                       PROMPT('Tanggal:'),AT(17,52),USE(?GHBPB1:Tanggal:Prompt)
                       ENTRY(@D6),AT(70,50,69,10),USE(GHBPB1:Tanggal),DISABLE,MSG('Tanggal'),TIP('Tanggal')
                       OPTION('Status'),AT(70,64,50,36),USE(GHBPB1:Status),BOXED,MSG('Status'),TIP('Status')
                         RADIO('Tutup'),AT(74,72),USE(?GHBPB1:Status:Radio1)
                         RADIO('Buka'),AT(74,86),USE(?GHBPB1:Status:Radio2)
                       END
                       BUTTON('OK'),AT(46,110,45,14),USE(?OK),DEFAULT
                       BUTTON('&Batal'),AT(96,110,45,14),USE(?Cancel)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
Run                    PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
!Proses Penomoran Otomatis Transaksi
Isi_Nomor Routine
   vl_nomor=''
   display
   loop
      logout(1,nomor_batal)
      if errorcode()=56 then
         cycle.
      !Silahkan diganti ---> 64=Transaksi Apotik Minta Brg Ke Gdg
      NOM:No_Urut=64
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 64=Transaksi Apotik Minta Brg Ke Gdg
         NOMU:Urut =64
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
        !Silahkan diganti ---> 64=Transaksi Apotik Minta Brg Ke Gdg
        NOM1:No_urut=64
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 64=Transaksi Apotik Minta Brg Ke Gdg
           NOMU:Urut =64
           NOMU:Nomor=vl_nomor
           add(nomoruse)
           if errorcode()>0 then
              rollback
              cycle
           end
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
      !Silahkan diganti ---> 64=Transaksi Apotik Minta Brg Ke Gdg
      nomor_batal{prop:sql}='delete dba.nomor_batal where No=64'
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 64=Transaksi Apotik Minta Brg Ke Gdg
         NOM1:No_urut=64
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
   GHBPB1:NoBPB=vl_nomor
   display

Batal_Nomor Routine
   !Silahkan diganti ---> 64=Transaksi Apotik Minta Brg Ke Gdg
   NOM:No_Urut =64
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=GHBPB1:NoBPB
   NOM:Keterangan='Apt Minta Brg Gdg'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 64=Transaksi Apotik Minta Brg Ke Gdg
   NOMU:Urut =64
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOMU:Nomor=GHBPB1:NoBPB
   access:nomoruse.fetch(NOMU:PrimaryKey)
   delete(nomoruse)

hapus_nomor_user routine
   NOMU:Urut    =64
   NOMU:Nomor   =GHBPB1:NoBPB
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
    ActionMessage = 'Adding a GHBPBMaster Record'
  OF ChangeRecord
    ActionMessage = 'Changing a GHBPBMaster Record'
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateGHBPBMaster')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GHBPB1:NoBPB:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(GHBPB1:Record,History::GHBPB1:Record)
  SELF.AddHistoryField(?GHBPB1:NoBPB,1)
  SELF.AddHistoryField(?GHBPB1:Keterangan,11)
  SELF.AddHistoryField(?GHBPB1:Kode_Apotik,2)
  SELF.AddHistoryField(?GHBPB1:Tanggal,3)
  SELF.AddHistoryField(?GHBPB1:Status,4)
  SELF.AddUpdateFile(Access:GHBPBMaster)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:GHBPBMaster.Open                                  ! File NomorUse used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File NomorUse used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_Batal.Open                                  ! File NomorUse used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File NomorUse used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:GHBPBMaster
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
  if self.request=1 then
     do isi_nomor
  end
  
  
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateGHBPBMaster',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  if (self.request=1 and self.response=2) or (self.request=3 and self.response=1) then
     do batal_nomor
  !   do hapus_detil
  end
  if self.request=1 and self.response=1 then
     do hapus_nomor_user
  end
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:GHBPBMaster.Close
    Relate:NomorUse.Close
    Relate:Nomor_Batal.Close
    Relate:Nomor_SKR.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateGHBPBMaster',QuickWindow)         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
    GHBPB1:Kode_Apotik = GL_entryapotik
    GHBPB1:Tanggal = today()
  PARENT.PrimeFields


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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
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

BrowseBPBMaster PROCEDURE                                  ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(GHBPBMaster)
                       PROJECT(GHBPB1:NoBPB)
                       PROJECT(GHBPB1:Keterangan)
                       PROJECT(GHBPB1:Kode_Apotik)
                       PROJECT(GHBPB1:Tanggal)
                       PROJECT(GHBPB1:Status)
                       JOIN(GAPO:KeyNoApotik,GHBPB1:Kode_Apotik)
                         PROJECT(GAPO:Nama_Apotik)
                         PROJECT(GAPO:Kode_Apotik)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GHBPB1:NoBPB           LIKE(GHBPB1:NoBPB)             !List box control field - type derived from field
GHBPB1:Keterangan      LIKE(GHBPB1:Keterangan)        !List box control field - type derived from field
GHBPB1:Kode_Apotik     LIKE(GHBPB1:Kode_Apotik)       !List box control field - type derived from field
GAPO:Nama_Apotik       LIKE(GAPO:Nama_Apotik)         !List box control field - type derived from field
GHBPB1:Tanggal         LIKE(GHBPB1:Tanggal)           !List box control field - type derived from field
GHBPB1:Status          LIKE(GHBPB1:Status)            !List box control field - type derived from field
GAPO:Kode_Apotik       LIKE(GAPO:Kode_Apotik)         !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(GDBPBMaster)
                       PROJECT(GDBPB1:NoBPB)
                       PROJECT(GDBPB1:Kode_Brg)
                       PROJECT(GDBPB1:Jumlah)
                       PROJECT(GDBPB1:Keterangan)
                       JOIN(GBAR:KeyKodeBrg,GDBPB1:Kode_Brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
GDBPB1:NoBPB           LIKE(GDBPB1:NoBPB)             !List box control field - type derived from field
GDBPB1:Kode_Brg        LIKE(GDBPB1:Kode_Brg)          !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GDBPB1:Jumlah          LIKE(GDBPB1:Jumlah)            !List box control field - type derived from field
GDBPB1:Keterangan      LIKE(GDBPB1:Keterangan)        !List box control field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Master BPB'),AT(,,358,283),FONT('Arial',8,,),IMM,HLP('BrowseBPBMaster'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,342,119),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('44L(2)|M~Nomor~@s10@200L(2)|M~Keterangan~@s255@31L(2)|M~Kode~@s5@120L(2)|M~Nama ' &|
   'Instalasi~@s30@53R(2)|M~Tanggal~C(0)@D6@28L(2)|M~Status~@s5@'),FROM(Queue:Browse:1)
                       BUTTON('&Tambah'),AT(113,142,45,14),USE(?Insert:2)
                       BUTTON('&Ubah'),AT(162,142,45,14),USE(?Change:2),DEFAULT
                       BUTTON('&Hapus'),AT(211,142,45,14),USE(?Delete:2)
                       LIST,AT(8,162,342,100),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('40L|M~No BPB~@s10@40L|M~Kode Brg~@s10@160L|M~Nama Obat~@s40@64D|M~Jumlah~L@n16.2' &|
   '@80D|M~Keterangan~L@s20@'),FROM(Queue:Browse)
                       BUTTON('&1. Tambah'),AT(113,265,45,14),USE(?Insert)
                       BUTTON('&2. Ubah'),AT(162,265,45,14),USE(?Change)
                       BUTTON('&3. Hapus'),AT(211,265,45,14),USE(?Delete)
                       SHEET,AT(4,4,350,156),USE(?CurrentTab)
                         TAB('No BPB'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Selesai'),AT(305,266,45,14),USE(?Close)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
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
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW5                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
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
  GlobalErrors.SetProcedureName('BrowseBPBMaster')
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
  Relate:GDBPBMaster.Open                                  ! File GApotik used by this procedure, so make sure it's RelationManager is open
  Relate:GHBPBMaster.Open                                  ! File GApotik used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GHBPBMaster,SELF) ! Initialize the browse manager
  BRW5.Init(?List,Queue:Browse.ViewPosition,BRW5::View:Browse,Queue:Browse,Relate:GDBPBMaster,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
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
  BRW1::Sort0:Locator.Init(,GHBPB1:NoBPB,,BRW1)            ! Initialize the browse locator using  using key: GHBPB1:KeyNoBPB , GHBPB1:NoBPB
  BRW1.SetFilter('(GHBPB1:Kode_Apotik=GL_entryapotik)')    ! Apply filter expression to browse
  BRW1.AddField(GHBPB1:NoBPB,BRW1.Q.GHBPB1:NoBPB)          ! Field GHBPB1:NoBPB is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB1:Keterangan,BRW1.Q.GHBPB1:Keterangan) ! Field GHBPB1:Keterangan is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB1:Kode_Apotik,BRW1.Q.GHBPB1:Kode_Apotik) ! Field GHBPB1:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GAPO:Nama_Apotik,BRW1.Q.GAPO:Nama_Apotik)  ! Field GAPO:Nama_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB1:Tanggal,BRW1.Q.GHBPB1:Tanggal)      ! Field GHBPB1:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB1:Status,BRW1.Q.GHBPB1:Status)        ! Field GHBPB1:Status is a hot field or requires assignment from browse
  BRW1.AddField(GAPO:Kode_Apotik,BRW1.Q.GAPO:Kode_Apotik)  ! Field GAPO:Kode_Apotik is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse
  BRW5.AddSortOrder(,GDBPB1:KeyBPBItem)                    ! Add the sort order for GDBPB1:KeyBPBItem for sort order 1
  BRW5.AddRange(GDBPB1:NoBPB,Relate:GDBPBMaster,Relate:GHBPBMaster) ! Add file relationship range limit for sort order 1
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort0:Locator.Init(,GDBPB1:Kode_Brg,,BRW5)         ! Initialize the browse locator using  using key: GDBPB1:KeyBPBItem , GDBPB1:Kode_Brg
  BRW5.AddField(GDBPB1:NoBPB,BRW5.Q.GDBPB1:NoBPB)          ! Field GDBPB1:NoBPB is a hot field or requires assignment from browse
  BRW5.AddField(GDBPB1:Kode_Brg,BRW5.Q.GDBPB1:Kode_Brg)    ! Field GDBPB1:Kode_Brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Nama_Brg,BRW5.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW5.AddField(GDBPB1:Jumlah,BRW5.Q.GDBPB1:Jumlah)        ! Field GDBPB1:Jumlah is a hot field or requires assignment from browse
  BRW5.AddField(GDBPB1:Keterangan,BRW5.Q.GDBPB1:Keterangan) ! Field GDBPB1:Keterangan is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Kode_brg,BRW5.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseBPBMaster',QuickWindow)              ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW5.AskProcedure = 2
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
    Relate:GDBPBMaster.Close
    Relate:GHBPBMaster.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseBPBMaster',QuickWindow)           ! Save window data to non-volatile store
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
    EXECUTE Number
      UpdateGHBPBMaster
      UpdateGDBPBMaster
    END
    ReturnValue = GlobalResponse
  END
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


BRW5.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW5.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

SelectGBarang PROCEDURE                                    ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(GBarang)
                       PROJECT(GBAR:Kode_brg)
                       PROJECT(GBAR:Nama_Brg)
                       PROJECT(GBAR:Jenis_Brg)
                       PROJECT(GBAR:No_Satuan)
                       PROJECT(GBAR:Dosis)
                       PROJECT(GBAR:Stok_Total)
                       PROJECT(GBAR:Kode_UPF)
                       PROJECT(GBAR:Status)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Jenis_Brg         LIKE(GBAR:Jenis_Brg)           !List box control field - type derived from field
GBAR:No_Satuan         LIKE(GBAR:No_Satuan)           !List box control field - type derived from field
GBAR:Dosis             LIKE(GBAR:Dosis)               !List box control field - type derived from field
GBAR:Stok_Total        LIKE(GBAR:Stok_Total)          !List box control field - type derived from field
GBAR:Kode_UPF          LIKE(GBAR:Kode_UPF)            !List box control field - type derived from field
GBAR:Status            LIKE(GBAR:Status)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Daftar Obat'),AT(,,358,185),FONT('Arial',8,,),CENTER,IMM,HLP('SelectGBarang'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,342,124),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('48L(2)|M~Kode Barang~@s10@80L(2)|M~Nama Obat~@s40@40L(2)|M~Jenis Brg~@s5@44L(2)|' &|
   'M~Satuan~@s10@32R(2)|M~Dosis~C(0)@n7@76D(24)|M~Stok Total~C(0)@n18.2@44L(2)|M~Ko' &|
   'de UPF~@s10@12L(2)|M~Status~@n3@'),FROM(Queue:Browse:1)
                       BUTTON('&Pilih'),AT(305,148,45,14),USE(?Select:2)
                       SHEET,AT(4,4,350,162),USE(?CurrentTab)
                         TAB('Nama Barang (F2)'),USE(?Tab:2),KEY(F2Key)
                           PROMPT('Nama Obat:'),AT(9,150),USE(?GBAR:Nama_Brg:Prompt)
                           ENTRY(@s40),AT(59,150,60,10),USE(GBAR:Nama_Brg),MSG('Nama Barang'),TIP('Nama Barang')
                         END
                         TAB('Kode Barang (F3)'),USE(?Tab:3),KEY(F3Key)
                           PROMPT('Kode Barang:'),AT(7,150),USE(?GBAR:Kode_brg:Prompt)
                           ENTRY(@s10),AT(57,150,60,10),USE(GBAR:Kode_brg),MSG('Kode Barang'),TIP('Kode Barang')
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
BRW1::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('SelectGBarang')
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
  Relate:GBarang.Open                                      ! File GBarang used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GBarang,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,GBAR:KeyKodeBrg)                      ! Add the sort order for GBAR:KeyKodeBrg for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?GBAR:Kode_brg,GBAR:Kode_brg,,BRW1) ! Initialize the browse locator using ?GBAR:Kode_brg using key: GBAR:KeyKodeBrg , GBAR:Kode_brg
  BRW1.SetFilter('(gbar:status=1)')                        ! Apply filter expression to browse
  BRW1.AddSortOrder(,GBAR:KeyNama)                         ! Add the sort order for GBAR:KeyNama for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?GBAR:Nama_Brg,GBAR:Nama_Brg,,BRW1) ! Initialize the browse locator using ?GBAR:Nama_Brg using key: GBAR:KeyNama , GBAR:Nama_Brg
  BRW1.SetFilter('(gbar:status=1)')                        ! Apply filter expression to browse
  BRW1.AddField(GBAR:Kode_brg,BRW1.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Nama_Brg,BRW1.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Jenis_Brg,BRW1.Q.GBAR:Jenis_Brg)      ! Field GBAR:Jenis_Brg is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:No_Satuan,BRW1.Q.GBAR:No_Satuan)      ! Field GBAR:No_Satuan is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Dosis,BRW1.Q.GBAR:Dosis)              ! Field GBAR:Dosis is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Stok_Total,BRW1.Q.GBAR:Stok_Total)    ! Field GBAR:Stok_Total is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Kode_UPF,BRW1.Q.GBAR:Kode_UPF)        ! Field GBAR:Kode_UPF is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Status,BRW1.Q.GBAR:Status)            ! Field GBAR:Status is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectGBarang',QuickWindow)                ! Restore window settings from non-volatile store
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
    Relate:GBarang.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectGBarang',QuickWindow)             ! Save window data to non-volatile store
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

UpdateGDBPBMaster PROCEDURE                                ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
History::GDBPB1:Record LIKE(GDBPB1:RECORD),THREAD
QuickWindow          WINDOW('Update the GDBPBMaster File'),AT(,,245,126),FONT('Arial',8,,),IMM,HLP('UpdateGDBPBMaster'),SYSTEM,GRAY,MDI
                       PROMPT('No BPB:'),AT(12,10),USE(?GDBPB1:NoBPB:Prompt)
                       ENTRY(@s10),AT(68,10,62,10),USE(GDBPB1:NoBPB),DISABLE,MSG('No BPB'),TIP('No BPB')
                       PROMPT('Kode Brg:'),AT(12,24),USE(?GDBPB1:Kode_Brg:Prompt)
                       ENTRY(@s10),AT(68,24,62,10),USE(GDBPB1:Kode_Brg),DISABLE,MSG('Kode Barang'),TIP('Kode Barang')
                       BUTTON('...'),AT(132,23,12,12),USE(?CallLookup)
                       PROMPT('Nama Obat:'),AT(12,38),USE(?GBAR:Nama_Brg:Prompt)
                       ENTRY(@s40),AT(68,38,151,10),USE(GBAR:Nama_Brg),DISABLE,MSG('Nama Barang'),TIP('Nama Barang')
                       PROMPT('Jumlah:'),AT(12,52),USE(?GDBPB1:Jumlah:Prompt)
                       ENTRY(@n16.2),AT(68,52,68,10),USE(GDBPB1:Jumlah),DECIMAL(14),MSG('Jumlah'),TIP('Jumlah')
                       PROMPT('Keterangan:'),AT(12,66),USE(?GDBPB1:Keterangan:Prompt)
                       ENTRY(@s20),AT(68,66,112,10),USE(GDBPB1:Keterangan),MSG('Keterangan'),TIP('Keterangan')
                       BUTTON('OK'),AT(66,87,45,14),USE(?OK),DEFAULT
                       BUTTON('&Batal'),AT(115,87,45,14),USE(?Cancel)
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
    ActionMessage = 'Adding a GDBPBMaster Record'
  OF ChangeRecord
    ActionMessage = 'Changing a GDBPBMaster Record'
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateGDBPBMaster')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GDBPB1:NoBPB:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(GDBPB1:Record,History::GDBPB1:Record)
  SELF.AddHistoryField(?GDBPB1:NoBPB,1)
  SELF.AddHistoryField(?GDBPB1:Kode_Brg,2)
  SELF.AddHistoryField(?GDBPB1:Jumlah,4)
  SELF.AddHistoryField(?GDBPB1:Keterangan,5)
  SELF.AddUpdateFile(Access:GDBPBMaster)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:GDBPBMaster.Open                                  ! File GDBPBMaster used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:GDBPBMaster
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
  INIMgr.Fetch('UpdateGDBPBMaster',QuickWindow)            ! Restore window settings from non-volatile store
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
    Relate:GDBPBMaster.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateGDBPBMaster',QuickWindow)         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = GDBPB1:Kode_Brg                          ! Assign linking field value
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
    SelectGBarang
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
    OF ?GDBPB1:Kode_Brg
      IF GDBPB1:Kode_Brg OR ?GDBPB1:Kode_Brg{Prop:Req}
        GBAR:Kode_brg = GDBPB1:Kode_Brg
        IF Access:GBarang.TryFetch(GBAR:KeyKodeBrg)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            GDBPB1:Kode_Brg = GBAR:Kode_brg
          ELSE
            SELECT(?GDBPB1:Kode_Brg)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      GBAR:Kode_brg = GDBPB1:Kode_Brg
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        GDBPB1:Kode_Brg = GBAR:Kode_brg
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

SelectBarang PROCEDURE                                     ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(GBarang)
                       PROJECT(GBAR:Kode_brg)
                       PROJECT(GBAR:Nama_Brg)
                       PROJECT(GBAR:Ket1)
                       PROJECT(GBAR:Ket2)
                       PROJECT(GBAR:Jenis_Brg)
                       PROJECT(GBAR:No_Satuan)
                       PROJECT(GBAR:Status)
                       PROJECT(GBAR:FarNonFar)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Ket1              LIKE(GBAR:Ket1)                !List box control field - type derived from field
GBAR:Ket2              LIKE(GBAR:Ket2)                !List box control field - type derived from field
GBAR:Jenis_Brg         LIKE(GBAR:Jenis_Brg)           !List box control field - type derived from field
GBAR:No_Satuan         LIKE(GBAR:No_Satuan)           !List box control field - type derived from field
GBAR:Status            LIKE(GBAR:Status)              !List box control field - type derived from field
GBAR:FarNonFar         LIKE(GBAR:FarNonFar)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Daftar Barang'),AT(,,404,186),FONT('Arial',8,,),CENTER,IMM,HLP('SelectBarang'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,389,124),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('48L(2)|M~Kode Barang~@s10@80L(2)|M~Nama Obat~@s40@101L(2)|M~Kemasan~@s50@63L(2)|' &|
   'M~Keterangan~@s30@40L(2)|M~Jenis Brg~@s5@40R(2)|M~No Satuan~C(0)@n6@12R(2)|M~Sta' &|
   'tus~C(0)@n3@12R(2)|M~Far Non Far~C(0)@n3@'),FROM(Queue:Browse:1)
                       BUTTON('&Pilih'),AT(138,148,45,14),USE(?Select:2)
                       SHEET,AT(4,4,396,162),USE(?CurrentTab)
                         TAB('Nama Barang (F2)'),USE(?Tab:2),KEY(F2Key)
                           PROMPT('Nama Obat:'),AT(9,150),USE(?GBAR:Nama_Brg:Prompt)
                           ENTRY(@s40),AT(49,150,84,11),USE(GBAR:Nama_Brg),MSG('Nama Barang'),TIP('Nama Barang')
                         END
                         TAB('Kode Barang (F3)'),USE(?Tab2),KEY(F3Key)
                           PROMPT('Kode Barang:'),AT(13,150),USE(?GBAR:Kode_brg:Prompt)
                           ENTRY(@s10),AT(59,149,65,12),USE(GBAR:Kode_brg),MSG('Kode Barang'),TIP('Kode Barang')
                         END
                       END
                       BUTTON('&Selesai'),AT(138,170,45,14),USE(?Close)
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

BRW1::Sort0:Locator  EntryLocatorClass                     ! Default Locator
BRW1::Sort1:Locator  EntryLocatorClass                     ! Conditional Locator - Choice(?CurrentTab)=2
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
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
  GlobalErrors.SetProcedureName('SelectBarang')
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
  Relate:GBarang.Open                                      ! File GBarang used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GBarang,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,GBAR:KeyKodeBrg)                      ! Add the sort order for GBAR:KeyKodeBrg for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?GBAR:Kode_brg,GBAR:Kode_brg,,BRW1) ! Initialize the browse locator using ?GBAR:Kode_brg using key: GBAR:KeyKodeBrg , GBAR:Kode_brg
  BRW1.SetFilter('(gbar:status=1 and gbar:farnonfar=0)')   ! Apply filter expression to browse
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon GBAR:Nama_Brg for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,GBAR:KeyNama)    ! Add the sort order for GBAR:KeyNama for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?GBAR:Nama_Brg,GBAR:Nama_Brg,,BRW1) ! Initialize the browse locator using ?GBAR:Nama_Brg using key: GBAR:KeyNama , GBAR:Nama_Brg
  BRW1.SetFilter('(gbar:status=1 and gbar:farnonfar=0)')   ! Apply filter expression to browse
  BRW1.AddField(GBAR:Kode_brg,BRW1.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Nama_Brg,BRW1.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Ket1,BRW1.Q.GBAR:Ket1)                ! Field GBAR:Ket1 is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Ket2,BRW1.Q.GBAR:Ket2)                ! Field GBAR:Ket2 is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Jenis_Brg,BRW1.Q.GBAR:Jenis_Brg)      ! Field GBAR:Jenis_Brg is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:No_Satuan,BRW1.Q.GBAR:No_Satuan)      ! Field GBAR:No_Satuan is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Status,BRW1.Q.GBAR:Status)            ! Field GBAR:Status is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:FarNonFar,BRW1.Q.GBAR:FarNonFar)      ! Field GBAR:FarNonFar is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectBarang',QuickWindow)                 ! Restore window settings from non-volatile store
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
    Relate:GBarang.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectBarang',QuickWindow)              ! Save window data to non-volatile store
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
  IF Choice(?CurrentTab)=2
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

