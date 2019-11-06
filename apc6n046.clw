

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N046.INC'),ONCE        !Local module procedure declarations
                     END


selectbarangalias PROCEDURE                                ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(GBarangA)
                       PROJECT(GBA2:Kode_brg)
                       PROJECT(GBA2:Nama_Brg)
                       PROJECT(GBA2:Jenis_Brg)
                       PROJECT(GBA2:No_Satuan)
                       PROJECT(GBA2:Dosis)
                       PROJECT(GBA2:Stok_Total)
                       PROJECT(GBA2:Kode_UPF)
                       PROJECT(GBA2:Kode_Apotik)
                       PROJECT(GBA2:Kelompok)
                       PROJECT(GBA2:Status)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GBA2:Kode_brg          LIKE(GBA2:Kode_brg)            !List box control field - type derived from field
GBA2:Nama_Brg          LIKE(GBA2:Nama_Brg)            !List box control field - type derived from field
GBA2:Jenis_Brg         LIKE(GBA2:Jenis_Brg)           !List box control field - type derived from field
GBA2:No_Satuan         LIKE(GBA2:No_Satuan)           !List box control field - type derived from field
GBA2:Dosis             LIKE(GBA2:Dosis)               !List box control field - type derived from field
GBA2:Stok_Total        LIKE(GBA2:Stok_Total)          !List box control field - type derived from field
GBA2:Kode_UPF          LIKE(GBA2:Kode_UPF)            !List box control field - type derived from field
GBA2:Kode_Apotik       LIKE(GBA2:Kode_Apotik)         !List box control field - type derived from field
GBA2:Kelompok          LIKE(GBA2:Kelompok)            !List box control field - type derived from field
GBA2:Status            LIKE(GBA2:Status)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the GBarangA File'),AT(,,358,188),FONT('Arial',8,,),IMM,HLP('selectbarangalias'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,342,124),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('48L(2)|M~Kode Barang~@s10@80L(2)|M~Nama Obat~@s40@40L(2)|M~Jenis Brg~@s5@44L(2)|' &|
   'M~Satuan~@s10@32R(2)|M~Dosis~C(0)@n7@76D(24)|M~Stok Total~C(0)@n18.2@44L(2)|M~Ko' &|
   'de UPF~@s10@48L(2)|M~Kode Apotik~@s5@36R(2)|M~Kelompok~C(0)@n6@12R(2)|M~Status~C' &|
   '(0)@n3@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(305,148,45,14),USE(?Select:2)
                       SHEET,AT(4,4,350,162),USE(?CurrentTab)
                         TAB('Kode Barang'),USE(?Tab:2)
                         END
                         TAB('Nama Barang'),USE(?Tab:3)
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
  GlobalErrors.SetProcedureName('selectbarangalias')
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
  Relate:GBarangA.Open                                     ! File GBarangA used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GBarangA,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,GBA2:KeyNama)                         ! Add the sort order for GBA2:KeyNama for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,GBA2:Nama_Brg,,BRW1)           ! Initialize the browse locator using  using key: GBA2:KeyNama , GBA2:Nama_Brg
  BRW1.SetFilter('(gbar:status=1)')                        ! Apply filter expression to browse
  BRW1.AddSortOrder(,GBA2:KeyKodeBrg)                      ! Add the sort order for GBA2:KeyKodeBrg for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,GBA2:Kode_brg,,BRW1)           ! Initialize the browse locator using  using key: GBA2:KeyKodeBrg , GBA2:Kode_brg
  BRW1.SetFilter('(gbar:status=1)')                        ! Apply filter expression to browse
  BRW1.AddField(GBA2:Kode_brg,BRW1.Q.GBA2:Kode_brg)        ! Field GBA2:Kode_brg is a hot field or requires assignment from browse
  BRW1.AddField(GBA2:Nama_Brg,BRW1.Q.GBA2:Nama_Brg)        ! Field GBA2:Nama_Brg is a hot field or requires assignment from browse
  BRW1.AddField(GBA2:Jenis_Brg,BRW1.Q.GBA2:Jenis_Brg)      ! Field GBA2:Jenis_Brg is a hot field or requires assignment from browse
  BRW1.AddField(GBA2:No_Satuan,BRW1.Q.GBA2:No_Satuan)      ! Field GBA2:No_Satuan is a hot field or requires assignment from browse
  BRW1.AddField(GBA2:Dosis,BRW1.Q.GBA2:Dosis)              ! Field GBA2:Dosis is a hot field or requires assignment from browse
  BRW1.AddField(GBA2:Stok_Total,BRW1.Q.GBA2:Stok_Total)    ! Field GBA2:Stok_Total is a hot field or requires assignment from browse
  BRW1.AddField(GBA2:Kode_UPF,BRW1.Q.GBA2:Kode_UPF)        ! Field GBA2:Kode_UPF is a hot field or requires assignment from browse
  BRW1.AddField(GBA2:Kode_Apotik,BRW1.Q.GBA2:Kode_Apotik)  ! Field GBA2:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GBA2:Kelompok,BRW1.Q.GBA2:Kelompok)        ! Field GBA2:Kelompok is a hot field or requires assignment from browse
  BRW1.AddField(GBA2:Status,BRW1.Q.GBA2:Status)            ! Field GBA2:Status is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('selectbarangalias',QuickWindow)            ! Restore window settings from non-volatile store
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
    Relate:GBarangA.Close
  END
  IF SELF.Opened
    INIMgr.Update('selectbarangalias',QuickWindow)         ! Save window data to non-volatile store
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

UpdateBarangAlias PROCEDURE                                ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
History::GBAR1:Record LIKE(GBAR1:RECORD),THREAD
QuickWindow          WINDOW('Update the GBarangAlias File'),AT(,,159,65),FONT('Arial',8,,),IMM,HLP('UpdateBarangAlias'),SYSTEM,GRAY,MDI
                       PROMPT('Kode Barang:'),AT(9,9),USE(?GBAR1:Kode_brg:Prompt)
                       ENTRY(@s10),AT(63,9,69,10),USE(GBAR1:Kode_brg),MSG('Kode Barang'),TIP('Kode Barang')
                       PROMPT('Nama Obat:'),AT(9,24),USE(?GBAR1:KodeAlias:Prompt)
                       ENTRY(@s10),AT(63,24,69,10),USE(GBAR1:KodeAlias),MSG('Nama Barang'),TIP('Nama Barang')
                       BUTTON('...'),AT(135,23,12,12),USE(?CallLookup)
                       BUTTON('&OK'),AT(9,41,45,14),USE(?OK),DEFAULT
                       BUTTON('&Batal'),AT(67,41,45,14),USE(?Cancel)
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
    ActionMessage = 'Tambah Data'
  OF ChangeRecord
    ActionMessage = 'Ubah Data'
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateBarangAlias')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GBAR1:Kode_brg:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(GBAR1:Record,History::GBAR1:Record)
  SELF.AddHistoryField(?GBAR1:Kode_brg,1)
  SELF.AddHistoryField(?GBAR1:KodeAlias,2)
  SELF.AddUpdateFile(Access:GBarangAlias)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:GBarangAlias.Open                                 ! File GBarangAlias used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:GBarangAlias
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
  INIMgr.Fetch('UpdateBarangAlias',QuickWindow)            ! Restore window settings from non-volatile store
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
    Relate:GBarangAlias.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateBarangAlias',QuickWindow)         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  GBA2:Kode_brg = GBAR1:KodeAlias                          ! Assign linking field value
  Access:GBarangA.Fetch(GBA2:KeyKodeBrg)
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
    selectbarangalias
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
    OF ?GBAR1:KodeAlias
      IF GBAR1:KodeAlias OR ?GBAR1:KodeAlias{Prop:Req}
        GBA2:Kode_brg = GBAR1:KodeAlias
        IF Access:GBarangA.TryFetch(GBA2:KeyKodeBrg)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            GBAR1:KodeAlias = GBA2:Kode_brg
          ELSE
            SELECT(?GBAR1:KodeAlias)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      GBA2:Kode_brg = GBAR1:KodeAlias
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        GBAR1:KodeAlias = GBA2:Kode_brg
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

BrowseAliasKodeBarang PROCEDURE                            ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(GBarang)
                       PROJECT(GBAR:Kode_brg)
                       PROJECT(GBAR:Nama_Brg)
                       PROJECT(GBAR:Jenis_Brg)
                       PROJECT(GBAR:No_Satuan)
                       PROJECT(GBAR:Status)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Jenis_Brg         LIKE(GBAR:Jenis_Brg)           !List box control field - type derived from field
GBAR:No_Satuan         LIKE(GBAR:No_Satuan)           !List box control field - type derived from field
GBAR:Status            LIKE(GBAR:Status)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(GBarangAlias)
                       PROJECT(GBAR1:Kode_brg)
                       PROJECT(GBAR1:KodeAlias)
                       JOIN(GBA2:KeyKodeBrg,GBAR1:KodeAlias)
                         PROJECT(GBA2:Nama_Brg)
                         PROJECT(GBA2:Kode_brg)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
GBAR1:Kode_brg         LIKE(GBAR1:Kode_brg)           !List box control field - type derived from field
GBAR1:KodeAlias        LIKE(GBAR1:KodeAlias)          !List box control field - type derived from field
GBA2:Nama_Brg          LIKE(GBA2:Nama_Brg)            !List box control field - type derived from field
GBA2:Kode_brg          LIKE(GBA2:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Daftar Barang'),AT(,,421,256),FONT('Arial',8,,),CENTER,IMM,HLP('SelectBarang'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,403,100),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('48L(2)|M~Kode Barang~@s10@80L(2)|M~Nama Obat~@s40@40L(2)|M~Jenis Brg~@s5@40R(2)|' &|
   'M~No Satuan~C(0)@n6@12R(2)|M~Status~C(0)@n3@'),FROM(Queue:Browse:1)
                       LIST,AT(8,145,403,86),USE(?List),IMM,VSCROLL,MSG('Browsing Records'),FORMAT('40L|M~Kode Barang~@s10@40L|M~Nama Obat~@s10@160L|M~Nama Obat~@s40@'),FROM(Queue:Browse)
                       BUTTON('&Tambah'),AT(105,238,42,12),USE(?Insert)
                       BUTTON('&Ubah'),AT(147,238,42,12),USE(?Change)
                       BUTTON('&Hapus'),AT(189,238,42,12),USE(?Delete)
                       SHEET,AT(4,4,411,137),USE(?CurrentTab)
                         TAB('Nama Barang (F2)'),USE(?Tab:2),KEY(F2Key)
                           PROMPT('Nama Obat:'),AT(9,125),USE(?GBAR:Nama_Brg:Prompt)
                           ENTRY(@s40),AT(49,125,84,11),USE(GBAR:Nama_Brg),MSG('Nama Barang'),TIP('Nama Barang')
                         END
                         TAB('Kode Barang (F3)'),USE(?Tab2),KEY(F3Key)
                           PROMPT('Kode Barang:'),AT(13,125),USE(?GBAR:Kode_brg:Prompt)
                           ENTRY(@s10),AT(59,124,65,12),USE(GBAR:Kode_brg),MSG('Kode Barang'),TIP('Kode Barang')
                         END
                       END
                       BUTTON('&Selesai'),AT(356,238,45,14),USE(?Close)
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
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  EntryLocatorClass                     ! Default Locator
BRW1::Sort1:Locator  EntryLocatorClass                     ! Conditional Locator - Choice(?CurrentTab)=2
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
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
  GlobalErrors.SetProcedureName('BrowseAliasKodeBarang')
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
  Relate:GBarang.Open                                      ! File GBarangAlias used by this procedure, so make sure it's RelationManager is open
  Relate:GBarangAlias.Open                                 ! File GBarangAlias used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GBarang,SELF) ! Initialize the browse manager
  BRW5.Init(?List,Queue:Browse.ViewPosition,BRW5::View:Browse,Queue:Browse,Relate:GBarangAlias,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,GBAR:KeyKodeBrg)                      ! Add the sort order for GBAR:KeyKodeBrg for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?GBAR:Kode_brg,GBAR:Kode_brg,,BRW1) ! Initialize the browse locator using ?GBAR:Kode_brg using key: GBAR:KeyKodeBrg , GBAR:Kode_brg
  BRW1.SetFilter('(gbar:status<<>2)')                      ! Apply filter expression to browse
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon GBAR:Nama_Brg for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,GBAR:KeyNama)    ! Add the sort order for GBAR:KeyNama for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?GBAR:Nama_Brg,GBAR:Nama_Brg,,BRW1) ! Initialize the browse locator using ?GBAR:Nama_Brg using key: GBAR:KeyNama , GBAR:Nama_Brg
  BRW1.SetFilter('(gbar:status<<>2)')                      ! Apply filter expression to browse
  BRW1.AddField(GBAR:Kode_brg,BRW1.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Nama_Brg,BRW1.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Jenis_Brg,BRW1.Q.GBAR:Jenis_Brg)      ! Field GBAR:Jenis_Brg is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:No_Satuan,BRW1.Q.GBAR:No_Satuan)      ! Field GBAR:No_Satuan is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Status,BRW1.Q.GBAR:Status)            ! Field GBAR:Status is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse
  BRW5.AddSortOrder(,GBAR1:KeyKodeBrg)                     ! Add the sort order for GBAR1:KeyKodeBrg for sort order 1
  BRW5.AddRange(GBAR1:Kode_brg,Relate:GBarangAlias,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort0:Locator.Init(,GBAR1:KodeAlias,,BRW5)         ! Initialize the browse locator using  using key: GBAR1:KeyKodeBrg , GBAR1:KodeAlias
  BRW5.AddField(GBAR1:Kode_brg,BRW5.Q.GBAR1:Kode_brg)      ! Field GBAR1:Kode_brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR1:KodeAlias,BRW5.Q.GBAR1:KodeAlias)    ! Field GBAR1:KodeAlias is a hot field or requires assignment from browse
  BRW5.AddField(GBA2:Nama_Brg,BRW5.Q.GBA2:Nama_Brg)        ! Field GBA2:Nama_Brg is a hot field or requires assignment from browse
  BRW5.AddField(GBA2:Kode_brg,BRW5.Q.GBA2:Kode_brg)        ! Field GBA2:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseAliasKodeBarang',QuickWindow)        ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW5.AskProcedure = 1
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
    Relate:GBarangAlias.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseAliasKodeBarang',QuickWindow)     ! Save window data to non-volatile store
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
    UpdateBarangAlias
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


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

BrowsePasienRanap PROCEDURE                                ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(JPasien)
                       PROJECT(JPas:Nomor_mr)
                       PROJECT(JPas:Nama)
                       PROJECT(JPas:TanggalLahir)
                       PROJECT(JPas:Jenis_kelamin)
                       PROJECT(JPas:Alamat)
                       PROJECT(JPas:RT)
                       PROJECT(JPas:RW)
                       PROJECT(JPas:Inap)
                       JOIN(RI_HR:PrimaryKey,JPas:Nomor_mr)
                         PROJECT(RI_HR:LastRoom)
                         PROJECT(RI_HR:Tanggal_Masuk)
                         PROJECT(RI_HR:Pulang)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
JPas:Nomor_mr          LIKE(JPas:Nomor_mr)            !List box control field - type derived from field
JPas:Nama              LIKE(JPas:Nama)                !List box control field - type derived from field
RI_HR:LastRoom         LIKE(RI_HR:LastRoom)           !List box control field - type derived from field
JPas:TanggalLahir      LIKE(JPas:TanggalLahir)        !List box control field - type derived from field
RI_HR:Tanggal_Masuk    LIKE(RI_HR:Tanggal_Masuk)      !List box control field - type derived from field
JPas:Jenis_kelamin     LIKE(JPas:Jenis_kelamin)       !List box control field - type derived from field
JPas:Alamat            LIKE(JPas:Alamat)              !List box control field - type derived from field
JPas:RT                LIKE(JPas:RT)                  !List box control field - type derived from field
JPas:RW                LIKE(JPas:RW)                  !List box control field - type derived from field
JPas:Inap              LIKE(JPas:Inap)                !List box control field - type derived from field
RI_HR:Pulang           LIKE(RI_HR:Pulang)             !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Pasien Rawat Inap'),AT(,,420,236),FONT('Arial',8,,),CENTER,IMM,HLP('BrowsePasienRanap'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,408,191),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('50R(2)|M~Nomor MR~C(0)@N010_@87L(2)|M~Nama~@s35@40L(2)|M~Ruangan~@s10@50R(2)|M~T' &|
   'anggal Lahir~C(0)@D06@52R(2)|M~Tanggal Masuk~C(0)@D06@49L(2)|M~Jenis kelamin~@s1' &|
   '@94L(2)|M~Alamat~@s35@16R(2)|M~RT~C(0)@N3@16R(2)|M~RW~C(0)@N3@12R(2)|M~Inap~C(0)' &|
   '@n3@12R(2)|M~Pulang~C(0)@n3@'),FROM(Queue:Browse:1)
                       SHEET,AT(4,4,415,228),USE(?CurrentTab)
                         TAB('Nomor RM (F2)'),USE(?Tab:2),KEY(F2Key)
                           PROMPT('Nomor MR :'),AT(10,217),USE(?JPas:Nomor_mr:Prompt)
                           ENTRY(@N010_),AT(60,217,60,10),USE(JPas:Nomor_mr),IMM,MSG('Nomor Medical record pasien'),TIP('Nomor KIUP')
                         END
                       END
                       BUTTON('&Selesai'),AT(365,215,45,14),USE(?Close)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
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
  GlobalErrors.SetProcedureName('BrowsePasienRanap')
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
  BRW1.AddSortOrder(,JPas:KeyNomorMr)                      ! Add the sort order for JPas:KeyNomorMr for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(?JPas:Nomor_mr,JPas:Nomor_mr,,BRW1) ! Initialize the browse locator using ?JPas:Nomor_mr using key: JPas:KeyNomorMr , JPas:Nomor_mr
  BRW1.SetFilter('(jpas:inap=1 and ri_hr:pulang=0)')       ! Apply filter expression to browse
  BRW1.AddField(JPas:Nomor_mr,BRW1.Q.JPas:Nomor_mr)        ! Field JPas:Nomor_mr is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nama,BRW1.Q.JPas:Nama)                ! Field JPas:Nama is a hot field or requires assignment from browse
  BRW1.AddField(RI_HR:LastRoom,BRW1.Q.RI_HR:LastRoom)      ! Field RI_HR:LastRoom is a hot field or requires assignment from browse
  BRW1.AddField(JPas:TanggalLahir,BRW1.Q.JPas:TanggalLahir) ! Field JPas:TanggalLahir is a hot field or requires assignment from browse
  BRW1.AddField(RI_HR:Tanggal_Masuk,BRW1.Q.RI_HR:Tanggal_Masuk) ! Field RI_HR:Tanggal_Masuk is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Jenis_kelamin,BRW1.Q.JPas:Jenis_kelamin) ! Field JPas:Jenis_kelamin is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Alamat,BRW1.Q.JPas:Alamat)            ! Field JPas:Alamat is a hot field or requires assignment from browse
  BRW1.AddField(JPas:RT,BRW1.Q.JPas:RT)                    ! Field JPas:RT is a hot field or requires assignment from browse
  BRW1.AddField(JPas:RW,BRW1.Q.JPas:RW)                    ! Field JPas:RW is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Inap,BRW1.Q.JPas:Inap)                ! Field JPas:Inap is a hot field or requires assignment from browse
  BRW1.AddField(RI_HR:Pulang,BRW1.Q.RI_HR:Pulang)          ! Field RI_HR:Pulang is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowsePasienRanap',QuickWindow)            ! Restore window settings from non-volatile store
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
    Relate:JPasien.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowsePasienRanap',QuickWindow)         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

BrowseEmbalase PROCEDURE                                   ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(ApEmbalase)
                       PROJECT(APE2:No)
                       PROJECT(APE2:Keterangan)
                       PROJECT(APE2:Rupiah)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APE2:No                LIKE(APE2:No)                  !List box control field - type derived from field
APE2:Keterangan        LIKE(APE2:Keterangan)          !List box control field - type derived from field
APE2:Rupiah            LIKE(APE2:Rupiah)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Embalase'),AT(,,240,237),FONT('Arial',8,,),CENTER,IMM,HLP('BrowseEmbalase'),SYSTEM,GRAY,MDI
                       LIST,AT(8,6,223,210),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('36R(2)|M~No~C(0)@n-7@80L(2)|M~Keterangan~L(2)@s30@44D(16)|M~Rupiah~C(0)@n10.2@'),FROM(Queue:Browse:1)
                       BUTTON('&Tambah'),AT(17,220,45,14),USE(?Insert:2)
                       BUTTON('&Ubah'),AT(66,220,45,14),USE(?Change:2),DEFAULT
                       BUTTON('&Hapus'),AT(114,220,45,14),USE(?Delete:2)
                       BUTTON('&Selesai'),AT(181,220,45,14),USE(?Close)
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
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowseEmbalase')
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
  Relate:ApEmbalase.Open                                   ! File ApEmbalase used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:ApEmbalase,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,APE2:PrimaryKey)                      ! Add the sort order for APE2:PrimaryKey for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,APE2:No,1,BRW1)                ! Initialize the browse locator using  using key: APE2:PrimaryKey , APE2:No
  BRW1.AddField(APE2:No,BRW1.Q.APE2:No)                    ! Field APE2:No is a hot field or requires assignment from browse
  BRW1.AddField(APE2:Keterangan,BRW1.Q.APE2:Keterangan)    ! Field APE2:Keterangan is a hot field or requires assignment from browse
  BRW1.AddField(APE2:Rupiah,BRW1.Q.APE2:Rupiah)            ! Field APE2:Rupiah is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseEmbalase',QuickWindow)               ! Restore window settings from non-volatile store
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
    Relate:ApEmbalase.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseEmbalase',QuickWindow)            ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  SELF.EIP &= BRW1::EIPManager                             ! Set the EIP manager
  SELF.DeleteAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Default+EIPAction:Remain+EIPAction:RetainColumn
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:2
    SELF.ChangeControl=?Change:2
    SELF.DeleteControl=?Delete:2
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

