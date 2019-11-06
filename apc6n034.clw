

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N034.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N030.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N033.INC'),ONCE        !Req'd for module callout resolution
                     END


BrowseNomorUse PROCEDURE                                   ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(NomorUse)
                       PROJECT(NOMU:Urut)
                       PROJECT(NOMU:Nomor)
                       PROJECT(NOMU:Keterangan)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
NOMU:Urut              LIKE(NOMU:Urut)                !List box control field - type derived from field
NOMU:Nomor             LIKE(NOMU:Nomor)               !List box control field - type derived from field
NOMU:Keterangan        LIKE(NOMU:Keterangan)          !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the NomorUse File'),AT(,,216,188),FONT('Arial',8,,),IMM,HLP('BrowseNomorUse'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,200,124),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('64R(2)|M~Urut~C(0)@n-14@64L(2)|M~Nomor~L(2)@s15@80L(2)|M~Keterangan~L(2)@s20@'),FROM(Queue:Browse:1)
                       BUTTON('&Insert'),AT(65,148,45,14),USE(?Insert:2)
                       BUTTON('&Change'),AT(114,148,45,14),USE(?Change:2),DEFAULT
                       BUTTON('&Delete'),AT(163,148,45,14),USE(?Delete:2)
                       SHEET,AT(4,4,208,162),USE(?CurrentTab)
                         TAB('NOMU:PrimaryKey'),USE(?Tab:2)
                         END
                         TAB('NOMU:Urut_NomorUse_FK'),USE(?Tab:3)
                         END
                       END
                       BUTTON('Close'),AT(118,170,45,14),USE(?Close)
                       BUTTON('Help'),AT(167,170,45,14),USE(?Help),STD(STD:Help)
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
  GlobalErrors.SetProcedureName('BrowseNomorUse')
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
  Relate:NomorUse.Open                                     ! File NomorUse used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:NomorUse,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,NOMU:Urut_NomorUse_FK)                ! Add the sort order for NOMU:Urut_NomorUse_FK for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,NOMU:Urut,1,BRW1)              ! Initialize the browse locator using  using key: NOMU:Urut_NomorUse_FK , NOMU:Urut
  BRW1.AddSortOrder(,NOMU:PrimaryKey)                      ! Add the sort order for NOMU:PrimaryKey for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,NOMU:Urut,1,BRW1)              ! Initialize the browse locator using  using key: NOMU:PrimaryKey , NOMU:Urut
  BRW1.AddField(NOMU:Urut,BRW1.Q.NOMU:Urut)                ! Field NOMU:Urut is a hot field or requires assignment from browse
  BRW1.AddField(NOMU:Nomor,BRW1.Q.NOMU:Nomor)              ! Field NOMU:Nomor is a hot field or requires assignment from browse
  BRW1.AddField(NOMU:Keterangan,BRW1.Q.NOMU:Keterangan)    ! Field NOMU:Keterangan is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseNomorUse',QuickWindow)               ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
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
    Relate:NomorUse.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseNomorUse',QuickWindow)            ! Save window data to non-volatile store
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
    UpdateNomorUse
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
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

UpdateASetApotik PROCEDURE                                 ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
History::ASE:Record  LIKE(ASE:RECORD),THREAD
QuickWindow          WINDOW('Update the ASetApotik File'),AT(,,151,56),FONT('Arial',8,,),IMM,HLP('UpdateASetApotik'),SYSTEM,GRAY,MDI
                       SHEET,AT(4,4,143,30),USE(?CurrentTab)
                         TAB('General'),USE(?Tab:1)
                           PROMPT('Kode Apotik:'),AT(8,20),USE(?ASE:KodeApotik:Prompt)
                           ENTRY(@s5),AT(61,20,40,10),USE(ASE:KodeApotik)
                         END
                       END
                       BUTTON('OK'),AT(4,38,45,14),USE(?OK),DEFAULT
                       BUTTON('Cancel'),AT(53,38,45,14),USE(?Cancel)
                       BUTTON('Help'),AT(102,38,45,14),USE(?Help),STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Adding a ASetApotik Record'
  OF ChangeRecord
    ActionMessage = 'Changing a ASetApotik Record'
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateASetApotik')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?ASE:KodeApotik:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(ASE:Record,History::ASE:Record)
  SELF.AddHistoryField(?ASE:KodeApotik,1)
  SELF.AddUpdateFile(Access:ASetApotik)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:ASetApotik.Open                                   ! File ASetApotik used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:ASetApotik
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
  INIMgr.Fetch('UpdateASetApotik',QuickWindow)             ! Restore window settings from non-volatile store
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
    Relate:ASetApotik.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateASetApotik',QuickWindow)          ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


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

BrowseSetApotik PROCEDURE                                  ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(ASetApotik)
                       PROJECT(ASE:KodeApotik)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
ASE:KodeApotik         LIKE(ASE:KodeApotik)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the ASetApotik File'),AT(,,159,188),FONT('Arial',8,,),IMM,HLP('BrowseSetApotik'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,143,124),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('48L(2)|M~Kode Apotik~L(2)@s5@'),FROM(Queue:Browse:1)
                       BUTTON('&Insert'),AT(8,148,45,14),USE(?Insert:2)
                       BUTTON('&Change'),AT(57,148,45,14),USE(?Change:2),DEFAULT
                       BUTTON('&Delete'),AT(106,148,45,14),USE(?Delete:2)
                       SHEET,AT(4,4,151,162),USE(?CurrentTab)
                         TAB('ASE:PK'),USE(?Tab:2)
                         END
                       END
                       BUTTON('Close'),AT(61,170,45,14),USE(?Close)
                       BUTTON('Help'),AT(110,170,45,14),USE(?Help),STD(STD:Help)
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
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
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
  GlobalErrors.SetProcedureName('BrowseSetApotik')
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
  Relate:ASetApotik.Open                                   ! File ASetApotik used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:ASetApotik,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon ASE:KodeApotik for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,ASE:PK)          ! Add the sort order for ASE:PK for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,ASE:KodeApotik,1,BRW1)         ! Initialize the browse locator using  using key: ASE:PK , ASE:KodeApotik
  BRW1.AddField(ASE:KodeApotik,BRW1.Q.ASE:KodeApotik)      ! Field ASE:KodeApotik is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseSetApotik',QuickWindow)              ! Restore window settings from non-volatile store
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
    Relate:ASetApotik.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseSetApotik',QuickWindow)           ! Save window data to non-volatile store
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
    UpdateASetApotik
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

about PROCEDURE                                            ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
vl_real              REAL                                  !
vl_hasil             REAL                                  !
vl_seribu            REAL                                  !
vl_selisih           REAL                                  !
window               WINDOW('Informasi'),AT(,,217,116),CENTER,GRAY
                       BOX,AT(0,1,217,40),USE(?Box1),COLOR(COLOR:White),FILL(COLOR:Blue)
                       STRING('Sistem Informasi Apotik'),AT(3,3,211,13),USE(?String1),CENTER,FONT('Times New Roman',16,COLOR:Yellow,FONT:bold),COLOR(COLOR:Blue)
                       STRING('Rumah Sakit Bhayangkara Sartika Asih'),AT(3,16,211,13),USE(?String2),CENTER,FONT('Times New Roman',14,COLOR:Yellow,FONT:bold),COLOR(COLOR:Blue)
                       BUTTON('&OK'),AT(83,85,52,14),USE(?Button1),FONT('Arial',12,COLOR:Black,FONT:bold+FONT:italic),STD(STD:Close)
                       STRING('Versi : 2019.03.14'),AT(79,70),USE(?String12:2),TRN,FONT(,,COLOR:White,),COLOR(COLOR:Olive)
                       BOX,AT(-2,41,219,75),USE(?Box2),COLOR(COLOR:Black),FILL(0804000H)
                       STRING('Dibuat Oleh : CV. GMM'),AT(72,54),USE(?String6),TRN,FONT(,,COLOR:Yellow,),COLOR(COLOR:Olive)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
  GlobalErrors.SetProcedureName('about')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Box1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.Open(window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('about',window)                             ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('about',window)                          ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue

ProsesSaldoAwalBulan PROCEDURE                             ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
vl_ada_opname        BYTE                                  !
vl_no                LONG                                  !
vl_ada               BYTE                                  !
Progress:Thermometer BYTE                                  !
loc::tanggal         DATE                                  !
loc::komentar        STRING(60)                            !
vl_harga_opname      REAL                                  !
vl_hitung            SHORT(0)                              !
vl_saldo_awal        REAL                                  !
vl_debet             REAL                                  !
vl_kredit            REAL                                  !
vl_saldo_akhir       REAL                                  !
vl_saldo_awal_rp     REAL                                  !
vl_saldo_akhir_rp    REAL                                  !
vl_debet_rp          REAL                                  !
vl_kredit_rp         REAL                                  !
vl_saldo_awal_total  REAL                                  !
vl_debet_total       REAL                                  !
vl_kredit_total      REAL                                  !
vl_saldo_akhir_total REAL                                  !
apasaja              STRING(20)                            !
loc:tahun            SHORT                                 !
loc:bulan            SHORT                                 !
Process:View         VIEW(GStokAptk)
                       PROJECT(GSTO:Harga_Dasar)
                       PROJECT(GSTO:Kode_Barang)
                       JOIN(GBAR:KeyKodeBrg,GSTO:Kode_Barang)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,74),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                       ENTRY(@n-14),AT(50,60,42,10),USE(vl_no),RIGHT(1)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Reset                  PROCEDURE(BYTE Force=0),DERIVED     ! Method added to host embed code
Update                 PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ProgressMgr          StepStringClass                       ! Progress Manager
view::file_sql view(filesql)
                 project(FIL:FString1,FIL:FReal1,FIL:FReal2)
               end

view::FReal1 view(filesql)
                 project(FIL:FReal1)
               end

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
  GlobalErrors.SetProcedureName('ProsesSaldoAwalBulan')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Glo::kode_apotik',Glo::kode_apotik)                ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  WindowBulanTahun()
  loc:bulan=glo:bulan-1
  if loc:bulan=0 then
     loc:bulan=12
     loc:tahun=glo:tahun-1
  else
     loc:tahun=glo:tahun
  end
  display
  
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File ApStokop used by this procedure, so make sure it's RelationManager is open
  Relate:ApStokop.Open                                     ! File ApStokop used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql.Open                                      ! File ApStokop used by this procedure, so make sure it's RelationManager is open
  Relate:Tbstawal.Open                                     ! File ApStokop used by this procedure, so make sure it's RelationManager is open
  Access:ASaldoAwal.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GApotik.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APKStok.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  vl_ada_opname       =0
  Apso:Kode_Apotik    =Glo::kode_apotik
  Apso:Tahun          =loc:tahun
  Apso:Bulan          =loc:bulan
  if access:apstokop.fetch(Apso:keykdap_bln_thn)=level:benign then
     vl_ada_opname       =1
  end
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesSaldoAwalBulan',ProgressWindow)      ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisProcess.Init(Process:View, Relate:GStokAptk, ?Progress:PctText, Progress:Thermometer, ProgressMgr, GSTO:Kode_Barang)
  ThisProcess.AddSortOrder(GSTO:KeyBarang)
  ThisProcess.SetFilter('GSTO:Kode_Apotik=Glo::kode_apotik')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(GStokAptk,'QUICKSCAN=on')
  SEND(GBarang,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AFIFOIN.Close
    Relate:ApStokop.Close
    Relate:FileSql.Close
    Relate:Tbstawal.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesSaldoAwalBulan',ProgressWindow)   ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = GSTO:Kode_Barang                         ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  GBAR:Kode_brg = GSTO:Kode_Barang                         ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  !vl_saldo_awal       =0
  !vl_debet            =0
  !vl_kredit           =0
  !vl_saldo_akhir      =0
  !vl_saldo_awal_total =0
  !vl_debet_total      =0
  !vl_kredit_total     =0
  !vl_saldo_akhir_total=0
  !vl_saldo_awal_rp    =0
  !vl_debet_rp         =0
  !vl_kredit_rp        =0
  !vl_saldo_akhir_rp   =0
  !vl_harga_opname     =0
  !vl_hitung           =0
  !vl_ada              =0
  !
  !Apso:Kode_Apotik    =GSTO:Kode_Apotik
  !Apso:Kode_Barang    =GSTO:Kode_Barang
  !Apso:Tahun          =loc:tahun
  !Apso:Bulan          =loc:bulan
  !if access:apstokop.fetch(Apso:kdapotik_brg)=level:benign then
  !   vl_ada=1
  !   vl_saldo_awal          =round(Apso:StHitung,.00001)
  !   vl_saldo_awal_rp       =round(Apso:Harga,.00001)
  !   vl_saldo_awal_total    =round(Apso:StHitung,.00001)*round(Apso:Harga,.00001)
  !
  !   vl_saldo_akhir         =round(Apso:StHitung,.00001)
  !   vl_saldo_akhir_total   =round(Apso:StHitung,.00001)*round(Apso:Harga,.00001)
  !end
  !
  !if vl_ada=0 then
  !   ASA:Kode_Barang     =GSTO:Kode_Barang
  !   ASA:Apotik          =GSTO:Kode_Apotik
  !   ASA:Bulan           =loc:bulan
  !   ASA:Tahun           =loc:tahun
  !   if access:asaldoawal.fetch(ASA:PrimaryKey)=level:benign then
  !      vl_saldo_awal          =round(ASA:Jumlah,.00001)
  !      vl_saldo_awal_rp       =round(ASA:Harga,.00001)
  !      vl_saldo_awal_total    =round(ASA:Total,.00001)
  !      vl_saldo_akhir         =round(ASA:Jumlah,.00001)
  !      vl_saldo_akhir_total   =round(ASA:Total,.00001)
  !   end
  !end
  !
  !afifoin{prop:sql}='select * from dba.afifoin where kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''' and month(tanggal)='&loc:bulan&' and year(tanggal)='&loc:tahun&' order by tanggal,jam'
  !afifoin{prop:sql}='select * from dba.afifoin where kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''' and month(tanggal)='&loc:bulan&' and year(tanggal)='&loc:tahun&' order by tanggal,jam'
  !loop
  !   if access:afifoin.next()<>level:benign then break.
  !   if sub(AFI:NoTransaksi,1,3)<>'OPN' then
  !      vl_debet             +=round(AFI:Jumlah,.00001)
  !      vl_debet_total       +=round(AFI:Jumlah,.00001)*round(AFI:Harga,.00001)
  !   end
  !end
  !
  !vl_debet_rp          =round(vl_debet_total/vl_debet,.00001)
  !vl_saldo_akhir      +=vl_debet
  !vl_saldo_akhir_total+=vl_debet_total
  !
  !open(view::file_sql)
  !view::file_sql{prop:sql}='select NoTransaksi,jumlah,harga from dba.afifoout where kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''' and month(tanggal)='&loc:bulan&' and year(tanggal)='&loc:tahun&' order by tanggal,jam'
  !view::file_sql{prop:sql}='select NoTransaksi,jumlah,harga from dba.afifoout where kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''' and month(tanggal)='&loc:bulan&' and year(tanggal)='&loc:tahun&' order by tanggal,jam'
  !loop
  !   next(view::file_sql)
  !   if errorcode()<>0 then break.
  !   AFI:Kode_Barang  =GSTO:Kode_Barang
  !   AFI:NoTransaksi  =clip(FIL:FString1)
  !   AFI:Kode_Apotik  =GSTO:Kode_Apotik
  !   if access:afifoin.fetch(AFI:BrgNoTransApotikKey)=level:benign then
  !      vl_kredit          +=round(FIL:FReal1,.00001)
  !      vl_kredit_total    +=round(FIL:FReal1,.00001)*round(AFI:Harga,.00001)
  !   end
  !end
  !close(view::file_sql)
  !
  !vl_kredit_rp         =round(vl_kredit_total/vl_kredit,.00001)
  !vl_saldo_akhir      -=vl_kredit
  !vl_saldo_akhir_total-=vl_kredit_total
  !
  !if vl_saldo_akhir_total=0 or vl_saldo_akhir=0 then
  !   vl_saldo_akhir_rp   =0
  !   vl_saldo_akhir_total=0
  !   vl_saldo_akhir      =0
  !else
  !   vl_saldo_akhir_rp   =round(vl_saldo_akhir_total/vl_saldo_akhir,.00001)
  !end
  !
  !ASA:Kode_Barang     =GBAR:Kode_brg
  !ASA:Apotik          =glo::kode_apotik
  !ASA:Bulan           =glo:bulan
  !ASA:Tahun           =glo:tahun
  !if access:asaldoawal.fetch(ASA:PrimaryKey)<>level:benign then
  !   ASA:Kode_Barang     =GBAR:Kode_brg
  !   ASA:Apotik          =Glo::kode_apotik
  !   ASA:Bulan           =glo:bulan
  !   ASA:Tahun           =glo:tahun
  !   ASA:Jumlah          =vl_saldo_akhir
  !   ASA:Harga           =vl_saldo_akhir_rp
  !   ASA:Total           =vl_saldo_akhir_total
  !   access:asaldoawal.insert()
  !end
  !
  !vl_no+=1
  !display
  vl_saldo_awal       =0
  vl_debet            =0
  vl_kredit           =0
  vl_saldo_akhir      =0
  vl_saldo_awal_total =0
  vl_debet_total      =0
  vl_kredit_total     =0
  vl_saldo_akhir_total=0
  vl_saldo_awal_rp    =0
  vl_debet_rp         =0
  vl_kredit_rp        =0
  vl_saldo_akhir_rp   =0
  vl_harga_opname     =0
  vl_hitung           =0
  vl_ada              =0
  
  if vl_ada_opname=1 then
     Apso:Kode_Apotik    =GSTO:Kode_Apotik
     Apso:Kode_Barang    =GSTO:Kode_Barang
     Apso:Tahun          =loc:tahun
     Apso:Bulan          =loc:bulan
     if access:apstokop.fetch(Apso:kdapotik_brg)=level:benign then
        vl_ada=1
        vl_saldo_awal          =round(Apso:StHitung,.00001)
        vl_saldo_awal_rp       =round(Apso:Harga,.00001)
        vl_saldo_awal_total    =round(Apso:StHitung,.00001)*round(Apso:Harga,.00001)
  
        vl_saldo_akhir         =round(Apso:StHitung,.00001)
        vl_saldo_akhir_total   =round(Apso:StHitung,.00001)*round(Apso:Harga,.00001)
     end
  else
     ASA:Kode_Barang     =GSTO:Kode_Barang
     ASA:Apotik          =GSTO:Kode_Apotik
     ASA:Bulan           =loc:bulan
     ASA:Tahun           =loc:tahun
     if access:asaldoawal.fetch(ASA:PrimaryKey)=level:benign then
        vl_saldo_awal          =round(ASA:Jumlah,.00001)
        vl_saldo_awal_rp       =round(ASA:Harga,.00001)
        vl_saldo_awal_total    =round(ASA:Total,.00001)
        vl_saldo_akhir         =round(ASA:Jumlah,.00001)
        vl_saldo_akhir_total   =round(ASA:Total,.00001)
     end
  end
  
  afifoin{prop:sql}='select * from dba.afifoin where kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''' and month(tanggal)='&loc:bulan&' and year(tanggal)='&loc:tahun&' order by tanggal,jam'
  afifoin{prop:sql}='select * from dba.afifoin where kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''' and month(tanggal)='&loc:bulan&' and year(tanggal)='&loc:tahun&' order by tanggal,jam'
  loop
     if access:afifoin.next()<>level:benign then break.
     if sub(AFI:NoTransaksi,1,3)<>'OPN' then
        vl_debet             +=round(AFI:Jumlah,.00001)
        vl_debet_total       +=round(AFI:Jumlah,.00001)*round(AFI:Harga,.00001)
     end
  end
  
  vl_debet_rp          =vl_debet_total/vl_debet
  vl_saldo_akhir       +=vl_debet
  vl_saldo_akhir_total +=vl_debet_total
  
  !vl_jum_rec=0
  afifoout{prop:sql}='select * from dba.afifoout where kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''' and month(tanggal)='&loc:bulan&' and year(tanggal)='&loc:tahun&' order by tanggal,jam'
  afifoout{prop:sql}='select * from dba.afifoout where kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''' and month(tanggal)='&loc:bulan&' and year(tanggal)='&loc:tahun&' order by tanggal,jam'
  loop
     next(afifoout)
     if errorcode()<>0 then break.
     AFI:Kode_Barang  =AFI2:Kode_Barang
     AFI:NoTransaksi  =AFI2:NoTransaksi
     AFI:Kode_Apotik  =AFI2:Kode_Apotik
     AFI:Transaksi    =AFI2:Transaksi
     AFI:Mata_Uang    ='Rp'
     if access:afifoin.fetch(AFI:KEY1)=level:benign then
   !     vl_jum_rec+=1
        vl_kredit          +=round(AFI2:Jumlah,.00001)
        vl_kredit_total    +=round(AFI2:Jumlah,.00001)*round(AFI:Harga,.00001)
     end
  end
  close(view::file_sql)
  
  vl_kredit_rp          =round(vl_kredit_total/vl_kredit,.00001)
  vl_saldo_akhir       -=vl_kredit
  vl_saldo_akhir_total -=vl_kredit_total
  vl_saldo_akhir_rp     =round(vl_saldo_akhir_total/vl_saldo_akhir,.00001)
  
  !if vl_saldo_akhir_total=0 or vl_saldo_akhir=0 then
  !   vl_saldo_akhir_rp   =0
  !   vl_saldo_akhir_total=0
  !   vl_saldo_akhir      =0
  !else
  !   vl_saldo_akhir_rp   =round(vl_saldo_akhir_total/vl_saldo_akhir,.00001)
  !end
  
  ASA:Kode_Barang     =GBAR:Kode_brg
  ASA:Apotik          =glo::kode_apotik
  ASA:Bulan           =glo:bulan
  ASA:Tahun           =glo:tahun
  if access:asaldoawal.fetch(ASA:PrimaryKey)<>level:benign then
     ASA:Kode_Barang     =GBAR:Kode_brg
     ASA:Apotik          =Glo::kode_apotik
     ASA:Bulan           =glo:bulan
     ASA:Tahun           =glo:tahun
     ASA:Jumlah          =vl_saldo_akhir
     ASA:Harga           =vl_saldo_akhir_rp
     ASA:Total           =vl_saldo_akhir_total
     access:asaldoawal.insert()
  end
  
  vl_no+=1
  display
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue

