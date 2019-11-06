

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N048.INC'),ONCE        !Local module procedure declarations
                     END


UpdateISetupAp PROCEDURE                                   ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
History::ISET:Record LIKE(ISET:RECORD),THREAD
QuickWindow          WINDOW('Memperbaharui SET UP apotik'),AT(,,151,70),FONT('MS Sans Serif',8,,),IMM,HLP('UpdateISetupAp'),SYSTEM,GRAY,MDI
                       SHEET,AT(4,4,143,44),USE(?CurrentTab)
                         TAB('Umum'),USE(?Tab:1)
                           PROMPT('Deskripsi:'),AT(8,20),USE(?ISET:Deskripsi:Prompt)
                           ENTRY(@s10),AT(61,20,71,10),USE(ISET:Deskripsi),DISABLE
                           PROMPT('Nilai:'),AT(8,34),USE(?ISET:Nilai:Prompt)
                           ENTRY(@n6.2),AT(61,34,40,10),USE(ISET:Nilai)
                         END
                       END
                       BUTTON('&OK'),AT(49,52,45,14),USE(?OK),LEFT,ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(102,52,45,14),USE(?Cancel),LEFT,ICON(ICON:Cross)
                       BUTTON('Help'),AT(102,4,45,14),USE(?Help),HIDE,STD(STD:Help)
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
    GlobalErrors.Throw(Msg:InsertIllegal)
    RETURN
  OF ChangeRecord
    ActionMessage = 'Merubah Data Set Up'
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateISetupAp')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?ISET:Deskripsi:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(ISET:Record,History::ISET:Record)
  SELF.AddHistoryField(?ISET:Deskripsi,1)
  SELF.AddHistoryField(?ISET:Nilai,2)
  SELF.AddUpdateFile(Access:ISetupAp)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:ISetupAp.Open                                     ! File ISetupAp used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:ISetupAp
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.InsertAction = Insert:None                        ! Inserts not allowed
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateISetupAp',QuickWindow)               ! Restore window settings from non-volatile store
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
    Relate:ISetupAp.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateISetupAp',QuickWindow)            ! Save window data to non-volatile store
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

Atur_setup PROCEDURE                                       ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
savecount            LONG                                  !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(ISetupAp)
                       PROJECT(ISET:Deskripsi)
                       PROJECT(ISET:Nilai)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
ISET:Deskripsi         LIKE(ISET:Deskripsi)           !List box control field - type derived from field
ISET:Nilai             LIKE(ISET:Nilai)               !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Mengatur SET UP Instalasi Farmasi'),AT(,,208,170),FONT('Arial',8,,),IMM,HLP('Atur_setup'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,192,95),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('40L|M~Deskripsi~L(2)@s10@28L|M~Nilai~C@n6.2@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(8,151,45,14),USE(?Select:2),HIDE
                       BUTTON('&Tambah'),AT(57,130,45,14),USE(?Insert:3),DISABLE,HIDE
                       BUTTON('&Ubah'),AT(67,130,59,23),USE(?Change:3),DEFAULT
                       BUTTON('&Delete'),AT(61,151,45,14),USE(?Delete:3),DISABLE,HIDE
                       SHEET,AT(4,4,200,116),USE(?CurrentTab)
                         TAB('Set Up'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Keluar'),AT(143,130,59,23),USE(?Close),LEFT,ICON('EXIT5.ICO')
                       BUTTON('Help'),AT(159,152,45,14),USE(?Help),HIDE,STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Open                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
  GlobalErrors.SetProcedureName('Atur_setup')
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
  Relate:ISetupAp.Open                                     ! File ISetupAp used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:ISetupAp,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon ISET:Deskripsi for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,ISET:by_deskripsi) ! Add the sort order for ISET:by_deskripsi for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,ISET:Deskripsi,1,BRW1)         ! Initialize the browse locator using  using key: ISET:by_deskripsi , ISET:Deskripsi
  BRW1.AddField(ISET:Deskripsi,BRW1.Q.ISET:Deskripsi)      ! Field ISET:Deskripsi is a hot field or requires assignment from browse
  BRW1.AddField(ISET:Nilai,BRW1.Q.ISET:Nilai)              ! Field ISET:Nilai is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Atur_setup',QuickWindow)                   ! Restore window settings from non-volatile store
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
    Relate:ISetupAp.Close
  END
  IF SELF.Opened
    INIMgr.Update('Atur_setup',QuickWindow)                ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Open PROCEDURE

  CODE
  IF GLO:LEVEL > 1
      ?Change:3{PROP:DISABLE}=TRUE
  END
  PARENT.Open


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdateISetupAp
    ReturnValue = GlobalResponse
  END
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
    OF ?Browse:1
      IF RECORDS(ISetupAp) = 0 THEN
         LOCK(ISetupAp,1)            !Lock the iSetupap file, try 1 second
         IF ERRORCODE() = 32             !If someone else has it
              RETURN 0
         END
         ISET:Deskripsi='PPN'
         ISET:Nilai=10
         ADD(ISetUpAp)
         ISET:Deskripsi='Bea_R'
         ISET:Nilai=100
         ADD(ISetUpAp)
         ISET:Deskripsi='KLS_Vip'
         ISET:Nilai=30
         ADD(ISetUpAp)
         ISET:Deskripsi='KLS_1'
         ISET:Nilai=20
         ADD(ISetUpAp)
         ISET:Deskripsi='KLS_2'
         ISET:Nilai=15
         ADD(ISetUpAp)
         ISET:Deskripsi='KLS_3'
         ISET:Nilai=10
         ADD(ISetUpAp)
         ISET:Deskripsi='KLS_UC'
         ISET:Nilai=10
         ADD(ISetUpAp)
         ISET:Deskripsi='KLS_UN'
         ISET:Nilai=10
         ADD(ISetUpAp)
         UNLOCK( ISetupAp )
         BRW1.ResetSort(1)
      END
    END
  ReturnValue = PARENT.TakeSelected()
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
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

UpdateGApotik PROCEDURE                                    ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
History::GAPO:Record LIKE(GAPO:RECORD),THREAD
QuickWindow          WINDOW('Perubahan Tabel Sub-Instalasi Farmasi'),AT(,,193,121),FONT('Arial',8,,),IMM,HLP('UpdateGApotik'),SYSTEM,GRAY,MDI
                       SHEET,AT(4,4,185,84),USE(?CurrentTab)
                         TAB('Data'),USE(?Tab:1)
                           PROMPT('Kode Farmasi :'),AT(8,20),USE(?GAPO:Kode_Apotik:Prompt)
                           ENTRY(@s5),AT(61,20,40,10),USE(GAPO:Kode_Apotik),MSG('Kode Apotik'),TIP('Kode Apotik')
                           PROMPT('Nama Farmasi :'),AT(8,34),USE(?GAPO:Nama_Apotik:Prompt)
                           ENTRY(@s30),AT(61,34,124,10),USE(GAPO:Nama_Apotik),MSG('Nama Apotik'),TIP('Nama Apotik')
                           PROMPT('Keterangan 1:'),AT(8,48),USE(?GAPO:Keterangan:Prompt)
                           ENTRY(@s20),AT(61,48,84,10),USE(GAPO:Keterangan),MSG('Keterangan'),TIP('Keterangan')
                           PROMPT('Keterangan 2:'),AT(8,62),USE(?GAPO:Keterangan2:Prompt)
                           ENTRY(@s20),AT(61,62,40,10),USE(GAPO:Keterangan2)
                         END
                       END
                       BUTTON('&OK'),AT(75,91,53,26),USE(?OK),LEFT,ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(133,91,57,26),USE(?Cancel),LEFT,ICON(ICON:Cross)
                       BUTTON('Help'),AT(147,1,45,14),USE(?Help),HIDE,STD(STD:Help)
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
    ActionMessage = 'Adding a GApotik Record'
  OF ChangeRecord
    ActionMessage = 'Changing a GApotik Record'
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateGApotik')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GAPO:Kode_Apotik:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(GAPO:Record,History::GAPO:Record)
  SELF.AddHistoryField(?GAPO:Kode_Apotik,1)
  SELF.AddHistoryField(?GAPO:Nama_Apotik,2)
  SELF.AddHistoryField(?GAPO:Keterangan,3)
  SELF.AddHistoryField(?GAPO:Keterangan2,4)
  SELF.AddUpdateFile(Access:GApotik)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:GApotik.SetOpenRelated()
  Relate:GApotik.Open                                      ! File GApotik used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:GApotik
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
  INIMgr.Fetch('UpdateGApotik',QuickWindow)                ! Restore window settings from non-volatile store
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
    Relate:GApotik.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateGApotik',QuickWindow)             ! Save window data to non-volatile store
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

Lihat_apotik PROCEDURE                                     ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(GApotik)
                       PROJECT(GAPO:Kode_Apotik)
                       PROJECT(GAPO:Nama_Apotik)
                       PROJECT(GAPO:Keterangan)
                       PROJECT(GAPO:Keterangan2)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GAPO:Kode_Apotik       LIKE(GAPO:Kode_Apotik)         !List box control field - type derived from field
GAPO:Nama_Apotik       LIKE(GAPO:Nama_Apotik)         !List box control field - type derived from field
GAPO:Keterangan        LIKE(GAPO:Keterangan)          !List box control field - type derived from field
GAPO:Keterangan2       LIKE(GAPO:Keterangan2)         !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Tabel SubInstalasi Farmasi'),AT(,,311,170),FONT('Arial',8,,),IMM,HLP('Lihat_apotik'),SYSTEM,GRAY,MDI
                       LIST,AT(14,26,281,82),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('48L(2)|M~Kode Sub~@s5@80L(2)|M~Nama Sub Instalasi~@s30@80L(2)|M~Keterangan~@s20@' &|
   '80L(2)|M~Keterangan 2~@s20@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(191,2,45,14),USE(?Select:2),HIDE
                       BUTTON('&Tambah'),AT(74,142,45,23),USE(?Insert:3)
                       BUTTON('&Rubah'),AT(5,142,45,23),USE(?Change:3),DEFAULT
                       BUTTON('&Hapus'),AT(144,142,45,23),USE(?Delete:3)
                       SHEET,AT(3,5,305,130),USE(?CurrentTab)
                         TAB('Kode SubInstalasi (F2)'),USE(?Tab:2),KEY(F2Key)
                         END
                         TAB('Nama SubInstalasi (F3)'),USE(?Tab:3),KEY(F3Key)
                         END
                       END
                       BUTTON('&Keluar'),AT(241,142,57,23),USE(?Close),LEFT,ICON('EXIT5.ICO')
                       BUTTON('Help'),AT(241,1,45,14),USE(?Help),HIDE,STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Open                   PROCEDURE(),DERIVED                 ! Method added to host embed code
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
  GlobalErrors.SetProcedureName('Lihat_apotik')
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
  Relate:GApotik.SetOpenRelated()
  Relate:GApotik.Open                                      ! File GApotik used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GApotik,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon GAPO:Nama_Apotik for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,GAPO:KeyNama)    ! Add the sort order for GAPO:KeyNama for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,GAPO:Nama_Apotik,1,BRW1)       ! Initialize the browse locator using  using key: GAPO:KeyNama , GAPO:Nama_Apotik
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon GAPO:Kode_Apotik for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,GAPO:KeyNoApotik) ! Add the sort order for GAPO:KeyNoApotik for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,GAPO:Kode_Apotik,1,BRW1)       ! Initialize the browse locator using  using key: GAPO:KeyNoApotik , GAPO:Kode_Apotik
  BRW1.AddField(GAPO:Kode_Apotik,BRW1.Q.GAPO:Kode_Apotik)  ! Field GAPO:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GAPO:Nama_Apotik,BRW1.Q.GAPO:Nama_Apotik)  ! Field GAPO:Nama_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GAPO:Keterangan,BRW1.Q.GAPO:Keterangan)    ! Field GAPO:Keterangan is a hot field or requires assignment from browse
  BRW1.AddField(GAPO:Keterangan2,BRW1.Q.GAPO:Keterangan2)  ! Field GAPO:Keterangan2 is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Lihat_apotik',QuickWindow)                 ! Restore window settings from non-volatile store
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
    Relate:GApotik.Close
  END
  IF SELF.Opened
    INIMgr.Update('Lihat_apotik',QuickWindow)              ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Open PROCEDURE

  CODE
  IF GLO:LEVEL > 1
      ?Insert:3{PROP:DISABLE}=TRUE
      ?Change:3{PROP:DISABLE}=TRUE
      ?Delete:3{PROP:DISABLE}=TRUE
  END
  PARENT.Open


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdateGApotik
    ReturnValue = GlobalResponse
  END
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
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
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

printkartustok PROCEDURE (string vl_barang)                ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
vl_ket1              STRING(10)                            !
vl_no                LONG                                  !
FilesOpened          BYTE                                  !
loc::datel           DATE                                  !
loc::time            TIME                                  !
loc::total           LONG                                  !
loc::nama_apotik     STRING(30)                            !Nama Apotik
APA                  STRING(20)                            !
vl_harga_raja        REAL                                  !
vl_harga_ranap_3     REAL                                  !
vl_harga_ranap_12vip REAL                                  !
vl_saldo_akhir       REAL                                  !
vl_debet             REAL                                  !
vl_kredit            REAL                                  !
vl_ket               STRING(50)                            !
sav::printer         STRING(50)                            !
Process:View         VIEW(APKStok)
                       PROJECT(APK:Debet)
                       PROJECT(APK:Jam)
                       PROJECT(APK:Kredit)
                       PROJECT(APK:NoTransaksi)
                       PROJECT(APK:Status)
                       PROJECT(APK:Tanggal)
                       PROJECT(APK:Kode_Barang)
                       JOIN(GBAR:KeyKodeBrg,APK:Kode_Barang)
                         PROJECT(GBAR:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:No_Satuan)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(115,1760,7896,9042),PAPER(PAPER:A4),PRE(RPT),FONT('Arial',10,COLOR:Black,),THOUS
                       HEADER,AT(104,281,7896,1469)
                         STRING('KARTU STOK'),AT(42,21,979,219),LEFT,FONT(,,,FONT:bold)
                         STRING('Apotik'),AT(42,208,688,167),USE(?String14),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(':'),AT(896,208,135,167),USE(?String14:2),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(@s5),AT(1063,208,427,167),USE(GL_entryapotik)
                         BOX,AT(10,1125,7875,344),COLOR(COLOR:Black)
                         STRING('Nomor'),AT(1438,1219,521,167),USE(?String10:5),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('No.'),AT(83,1219,260,167),USE(?String10:2),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Jam'),AT(958,1219,490,167),USE(?String10:4),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Tanggal'),AT(333,1219,521,167),USE(?String10:3),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Keterangan'),AT(2406,1219,896,167),USE(?String10:6),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Kredit'),AT(6698,1219,438,167),USE(?String10:8),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Asal'),AT(5281,1229,396,167),USE(?String10:10),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Debet'),AT(6042,1219,438,167),USE(?String10:7),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Saldo'),AT(7427,1229,438,167),USE(?String10:9),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Kode Barang'),AT(42,406,844,167),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(':'),AT(896,406,135,167),USE(?String14:3),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(@s10),AT(1063,406,833,167),USE(GBAR:Kode_brg),FONT('Arial',10,,FONT:regular)
                         STRING('Nama Barang'),AT(42,615,896,167),USE(?String10),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(':'),AT(896,615,135,167),USE(?String14:4),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(@s40),AT(1052,615,2552,167),USE(GBAR:Nama_Brg),FONT('Arial',10,,FONT:regular)
                         STRING('Satuan'),AT(42,813),USE(?String19),TRN
                         STRING(':'),AT(896,813,135,167),USE(?String14:5),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(@s10),AT(1052,813,958,146),USE(GBAR:No_Satuan)
                       END
break1                 BREAK(APA)
detail1                  DETAIL,AT(,,,208),FONT('Arial',8,,FONT:regular)
                           STRING(@n-15.3),AT(5740,21,677,146),USE(APK:Debet),TRN,RIGHT
                           STRING(@n5),AT(-73,21,333,146),CNT,RESET(break1),USE(vl_no),RIGHT(1),FONT('Arial',8,COLOR:Black,FONT:regular)
                           STRING(@d06),AT(323,21,615,146),USE(APK:Tanggal)
                           STRING(@t04),AT(958,21,490,146),USE(APK:Jam)
                           STRING(@s15),AT(1427,21,927,146),USE(APK:NoTransaksi)
                           STRING(@n-15.3),AT(6438,21,677,146),USE(APK:Kredit),TRN,RIGHT
                           STRING(@n-15.3),AT(7125,21,677,146),USE(vl_saldo_akhir,,?vl_saldo_akhir:2),TRN,RIGHT(14)
                           STRING(@s50),AT(2396,21,2833,146),USE(vl_ket)
                           STRING(@s10),AT(5271,21,542,146),USE(vl_ket1)
                           LINE,AT(10,198,7875,0),COLOR(COLOR:Black)
                         END
                         FOOTER,AT(0,0,,271)
                           STRING('Total :'),AT(4052,10),USE(?String28),TRN
                           STRING(@n-15.3),AT(5740,31,677,146),SUM,RESET(break1),USE(APK:Debet,,?APK:Debet:2),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                           STRING(@n-15.3),AT(6438,31,677,146),SUM,RESET(break1),USE(APK:Kredit,,?APK:Kredit:2),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                           STRING(@n-15.3),AT(7125,31,677,146),USE(vl_saldo_akhir,,?vl_saldo_akhir:3),TRN,RIGHT(14),FONT('Arial',8,,FONT:regular)
                           LINE,AT(4031,219,3854,0),USE(?Line2),COLOR(COLOR:Black)
                         END
                       END
                       FOOTER,AT(302,10813,7417,219)
                         STRING('Page xxxxx of xxxxx'),AT(5938,10,1302,208),USE(?PageOfString),FONT('Times New Roman',8,,)
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
  GlobalErrors.SetProcedureName('printkartustok')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  sav::printer = PRINTER{PROPPRINT:Device}                             ! save windows default printer
  PRINTER{PROPPRINT:Device} = 'LX-300'
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  bind('vl_barang',vl_barang)
  Relate:APHTRANS.SetOpenRelated()
  Relate:APHTRANS.Open                                     ! File APHTRANS used by this procedure, so make sure it's RelationManager is open
  Access:GApotik.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('printkartustok',ProgressWindow)            ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisReport.Init(Process:View, Relate:APKStok, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  ThisReport.AppendOrder('apk:tanggal,APK:Jam')
  ThisReport.SetFilter('apk:Kode_barang=vl_barang and apk:kode_Apotik=GL_entryapotik and apk:status=0')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  Relate:APKStok.SetQuickScan(1,Propagate:OneMany)
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
  PRINTER{PROPPRINT:Device} = sav::printer
    Relate:APHTRANS.Close
  END
  IF SELF.Opened
    INIMgr.Update('printkartustok',ProgressWindow)         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = APK:Kode_Barang                          ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  GBAR:Kode_brg = APK:Kode_Barang                          ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  !if sub(APK:NoTransaksi,1,3)='API' then
     APH:N0_tran=APK:NoTransaksi
     access:aphtrans.fetch(APH:by_transaksi)
     JPas:Nomor_mr=APH:Nomor_mr
     access:jpasien.fetch(JPas:KeyNomorMr)
     vl_ket=clip(APK:Transaksi)&' '&clip(JPas:Nama)
     vl_ket1=clip(APH:Asal)
  !else
  !   vl_ket=clip(APK:Transaksi)
  !end
  
  vl_debet+=APK:Debet
  vl_kredit+=APK:Kredit
  vl_saldo_akhir=vl_debet-vl_kredit
  display
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail1)
  RETURN ReturnValue

