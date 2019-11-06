

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N018.INC'),ONCE        !Local module procedure declarations
                     END


UpdateJPASSWRD PROCEDURE                                   ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
Loc:Password         STRING(10)                            !
Loc:I                USHORT                                !
Loc:J                USHORT                                !
Loc:Huruf            STRING(10)                            !
Loc:Pas              STRING(10)                            !
History::JPSW:Record LIKE(JPSW:RECORD),THREAD
QuickWindow          WINDOW('Update User'),AT(,,222,130),FONT('Arial',8,,),CENTER,IMM,HLP('UpdateJPASSWRD'),SYSTEM,GRAY,MDI
                       GROUP('Group 1'),AT(3,2,215,112),USE(?Group1),BOXED,BEVEL(1,2)
                         PROMPT('NAMA :'),AT(25,15),USE(?JPSW:USER_ID:Prompt)
                         ENTRY(@s20),AT(73,12,101,13),USE(JPSW:USER_ID),MSG('Nama User'),TIP('Nama User'),UPR
                         PROMPT('PASSWORD :'),AT(25,30),USE(?Loc:Password:Prompt)
                         ENTRY(@s10),AT(73,28,85,13),USE(Loc:Password),PASSWORD
                         PROMPT('BAGIAN:'),AT(25,45),USE(?JPSW:BAGIAN:Prompt)
                         ENTRY(@s20),AT(73,44,84,13),USE(JPSW:BAGIAN),MSG('Pekerjaan Bagian'),TIP('Pekerjaan Bagian'),UPR
                         PROMPT('AKSES:'),AT(25,61),USE(?JPSW:AKSES:Prompt)
                         ENTRY(@s20),AT(73,60,84,13),USE(JPSW:AKSES),MSG('Hak Akses User'),TIP('Hak Akses User'),UPR
                         PROMPT('LEVEL:'),AT(25,78),USE(?JPSW:LEVEL:Prompt)
                         ENTRY(@n3),AT(73,76,40,13),USE(JPSW:LEVEL),RIGHT(1),UPR
                         PROMPT('PREFIK :'),AT(25,93),USE(?JPSW:Prefix:Prompt)
                         ENTRY(@s4),AT(73,92,40,13),USE(JPSW:Prefix),MSG('Huruf prefix user yang ditulis di transaksi'),TIP('Huruf prefix user yang ditulis di transaksi'),REQ,UPR
                       END
                       BUTTON('&Simpan'),AT(43,115,63,14),USE(?OK),LEFT,FONT(,,COLOR:Black,FONT:bold),ICON(ICON:Save),DEFAULT
                       BUTTON('E&xit'),AT(110,115,63,14),USE(?Cancel),LEFT,FONT(,,COLOR:Black,FONT:bold),ICON(ICON:Cross)
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
    ActionMessage = 'Menambah user baru'
  OF ChangeRecord
    ActionMessage = 'Mengubah user'
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateJPASSWRD')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?JPSW:USER_ID:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(JPSW:Record,History::JPSW:Record)
  SELF.AddHistoryField(?JPSW:USER_ID,1)
  SELF.AddHistoryField(?JPSW:BAGIAN,3)
  SELF.AddHistoryField(?JPSW:AKSES,4)
  SELF.AddHistoryField(?JPSW:LEVEL,5)
  SELF.AddHistoryField(?JPSW:Prefix,6)
  SELF.AddUpdateFile(Access:JPASSWRD)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:JPASSWRD.SetOpenRelated()
  Relate:JPASSWRD.Open                                     ! File JPASSWRD used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:JPASSWRD
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
  INIMgr.Fetch('UpdateJPASSWRD',QuickWindow)               ! Restore window settings from non-volatile store
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
    Relate:JPASSWRD.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateJPASSWRD',QuickWindow)            ! Save window data to non-volatile store
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
    OF ?Loc:Password
      Loc:Pas = Clip(Loc:Password)&Clip(Glo:Kunci1)
      Loop Loc:I=1 to 10
          !Len(Clip(Loc:Password))
          Loc:J = Val(Sub(Loc:Pas,Loc:I,1)) + Val(Sub(GLo:Kunci,Loc:I,1))
          !Loc:J = (26 - Loc:J % 26 ) + 96
          Loc:Huruf[Loc:I] = CHR(Loc:J)
      end
      JPSW:ID=Clip(Loc:Huruf)
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

BrowseUser PROCEDURE                                       ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
loc:i                LONG                                  !
BRW1::View:Browse    VIEW(JPASSWRD)
                       PROJECT(JPSW:USER_ID)
                       PROJECT(JPSW:ID)
                       PROJECT(JPSW:BAGIAN)
                       PROJECT(JPSW:AKSES)
                       PROJECT(JPSW:LEVEL)
                       PROJECT(JPSW:Prefix)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
JPSW:USER_ID           LIKE(JPSW:USER_ID)             !List box control field - type derived from field
JPSW:ID                LIKE(JPSW:ID)                  !List box control field - type derived from field
JPSW:BAGIAN            LIKE(JPSW:BAGIAN)              !List box control field - type derived from field
JPSW:AKSES             LIKE(JPSW:AKSES)               !List box control field - type derived from field
JPSW:LEVEL             LIKE(JPSW:LEVEL)               !List box control field - type derived from field
JPSW:Prefix            LIKE(JPSW:Prefix)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Daftar User'),AT(,,335,145),FONT('Arial',8,,),CENTER,IMM,HLP('BrowseUSer'),MSG('Daftar User'),CENTERED,SYSTEM,GRAY,MDI
                       LIST,AT(22,32,287,74),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('80L|M~USER_ID~L(2)@s20@44L|M~ID~L(2)@s10@80L|M~BAGIAN~L(2)@s20@80L|M~AKSES~L(2)@' &|
   's20@24R(1)|M~LEVEL~C(0)@n3@28L|M~Prefix~L(2)@s4@'),FROM(Queue:Browse:1)
                       GROUP,AT(7,4,319,137),USE(?Group1),BOXED,BEVEL(-3,-2)
                         SHEET,AT(15,14,301,97),USE(?CurrentTab)
                           TAB('User'),USE(?Tab:2)
                           END
                           TAB('Password'),USE(?Tab:3)
                           END
                         END
                         BUTTON('&Tambah'),AT(59,119,45,14),USE(?Insert:3),FONT(,,COLOR:Black,FONT:bold),TIP('Menambah user baru')
                         BUTTON('&Ubah'),AT(107,119,45,14),USE(?Change:3),FONT(,,COLOR:Black,FONT:bold),TIP('Mengubah nama user '),DEFAULT
                         BUTTON('&Hapus'),AT(157,119,45,14),USE(?Delete:3),FONT(,,COLOR:Black,FONT:bold),TIP('Menghapus user ')
                         BUTTON('E&xit'),AT(205,119,45,14),USE(?Close),FONT(,,COLOR:Black,FONT:bold),TIP('Keluar dari formulir ini')
                       END
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
  GlobalErrors.SetProcedureName('BrowseUser')
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
  Relate:JPASSWRD.SetOpenRelated()
  Relate:JPASSWRD.Open                                     ! File JPASSWRD used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:JPASSWRD,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon JPSW:ID for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,JPSW:KeyId)      ! Add the sort order for JPSW:KeyId for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,JPSW:ID,1,BRW1)                ! Initialize the browse locator using  using key: JPSW:KeyId , JPSW:ID
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon JPSW:USER_ID for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,JPSW:KeyUSerId)  ! Add the sort order for JPSW:KeyUSerId for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,JPSW:USER_ID,1,BRW1)           ! Initialize the browse locator using  using key: JPSW:KeyUSerId , JPSW:USER_ID
  BRW1.AddField(JPSW:USER_ID,BRW1.Q.JPSW:USER_ID)          ! Field JPSW:USER_ID is a hot field or requires assignment from browse
  BRW1.AddField(JPSW:ID,BRW1.Q.JPSW:ID)                    ! Field JPSW:ID is a hot field or requires assignment from browse
  BRW1.AddField(JPSW:BAGIAN,BRW1.Q.JPSW:BAGIAN)            ! Field JPSW:BAGIAN is a hot field or requires assignment from browse
  BRW1.AddField(JPSW:AKSES,BRW1.Q.JPSW:AKSES)              ! Field JPSW:AKSES is a hot field or requires assignment from browse
  BRW1.AddField(JPSW:LEVEL,BRW1.Q.JPSW:LEVEL)              ! Field JPSW:LEVEL is a hot field or requires assignment from browse
  BRW1.AddField(JPSW:Prefix,BRW1.Q.JPSW:Prefix)            ! Field JPSW:Prefix is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseUser',QuickWindow)                   ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
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
    INIMgr.Update('BrowseUser',QuickWindow)                ! Save window data to non-volatile store
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
    UpdateJPASSWRD
    ReturnValue = GlobalResponse
  END
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
    OF EVENT:OpenWindow
      If Not(Glo:Level = 0 AND (Clip(Glo:Bagian) = 'EDP' OR Clip(Glo:Akses) = 'ALL')) Then
              ?Group1{Prop:Hide} = True
              ?BROWSE:1{Prop:Hide} = True
              Beep
              Beep
              Display
              !Message('Hubungi MIS/EDP...!','Peringatan',Icon:Exclamation)
              presskey(27)
      Else
          display
      End
    END
  ReturnValue = PARENT.TakeWindowEvent()
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

SelectApotik PROCEDURE                                     ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(GApotik)
                       PROJECT(GAPO:Kode_Apotik)
                       PROJECT(GAPO:Nama_Apotik)
                       PROJECT(GAPO:Keterangan)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GAPO:Kode_Apotik       LIKE(GAPO:Kode_Apotik)         !List box control field - type derived from field
GAPO:Nama_Apotik       LIKE(GAPO:Nama_Apotik)         !List box control field - type derived from field
GAPO:Keterangan        LIKE(GAPO:Keterangan)          !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Daftar Apotik'),AT(,,216,188),FONT('Arial',8,,),CENTER,IMM,HLP('SelectApotik'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,200,124),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('48L(2)|M~Kode Apotik~L(2)@s5@80L(2)|M~Nama Apotik~L(2)@s30@80L(2)|M~Keterangan~L' &|
   '(2)@s20@'),FROM(Queue:Browse:1)
                       BUTTON('&Pilih'),AT(88,147,45,14),USE(?Select:2)
                       SHEET,AT(4,4,208,162),USE(?CurrentTab)
                         TAB('No Apotik'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Selesai'),AT(88,170,45,14),USE(?Close)
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
  GlobalErrors.SetProcedureName('SelectApotik')
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
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon GAPO:Kode_Apotik for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,GAPO:KeyNoApotik) ! Add the sort order for GAPO:KeyNoApotik for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,GAPO:Kode_Apotik,1,BRW1)       ! Initialize the browse locator using  using key: GAPO:KeyNoApotik , GAPO:Kode_Apotik
  BRW1.AddField(GAPO:Kode_Apotik,BRW1.Q.GAPO:Kode_Apotik)  ! Field GAPO:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GAPO:Nama_Apotik,BRW1.Q.GAPO:Nama_Apotik)  ! Field GAPO:Nama_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GAPO:Keterangan,BRW1.Q.GAPO:Keterangan)    ! Field GAPO:Keterangan is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectApotik',QuickWindow)                 ! Restore window settings from non-volatile store
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
  END
  IF SELF.Opened
    INIMgr.Update('SelectApotik',QuickWindow)              ! Save window data to non-volatile store
  END
  glo:apotik = GAPO:Kode_Apotik
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

WindowTanggal12Apotik PROCEDURE                            ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
Window               WINDOW('Tanggal'),AT(,,221,105),FONT('Arial',8,,FONT:regular),CENTER,GRAY,MDI
                       PANEL,AT(3,5,187,71),USE(?Panel1)
                       PROMPT('Dari Tanggal '),AT(25,17),USE(?VG_TANGGAL1:Prompt)
                       ENTRY(@D6-),AT(82,17,60,10),USE(VG_TANGGAL1)
                       PROMPT('Sampai Tanggal'),AT(25,37),USE(?VG_TANGGAL2:Prompt)
                       ENTRY(@d6-),AT(82,37,60,10),USE(VG_TANGGAL2)
                       PROMPT('Apotik :'),AT(25,54),USE(?glo:apotik:Prompt)
                       ENTRY(@s5),AT(82,54,60,10),USE(glo:apotik)
                       BUTTON('...'),AT(147,52,13,14),USE(?Button2)
                       BUTTON('OK'),AT(37,84,123,14),USE(?OkButton),DEFAULT
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
  GlobalErrors.SetProcedureName('WindowTanggal12Apotik')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Panel1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:GApotik.SetOpenRelated()
  Relate:GApotik.Open                                      ! File GApotik used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('WindowTanggal12Apotik',Window)             ! Restore window settings from non-volatile store
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
    INIMgr.Update('WindowTanggal12Apotik',Window)          ! Save window data to non-volatile store
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button2
      ThisWindow.Update
      globalrequest=selectrecord
      selectapotik
      glo:apotik=GAPO:Kode_Apotik
      display
    OF ?OkButton
      ThisWindow.Update
      break
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

ProsesFIFOINSBBK PROCEDURE                                 ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
Process:View         VIEW(GDSBBK)
                       PROJECT(GDSB:Harga)
                       PROJECT(GDSB:Jumlah_Sat)
                       PROJECT(GDSB:NoSBBK)
                       JOIN(GHSB:KeyNoSBBK,GDSB:NoSBBK)
                         PROJECT(GHSB:Tanggal_SBBK)
                         PROJECT(GHSB:NoBPB)
                         JOIN(GHBPB:KeyNoBPB,GHSB:NoBPB)
                         END
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
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

ProgressMgr          StepClass                             ! Progress Manager

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
  GlobalErrors.SetProcedureName('ProsesFIFOINSBBK')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  WindowTanggal12Apotik()
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('vg_tanggal1',vg_tanggal1)                          ! Added by: Process
  BIND('vg_tanggal2',vg_tanggal2)                          ! Added by: Process
  BIND('glo:apotik',glo:apotik)                            ! Added by: Process
  BIND('glo_kode_barang',glo_kode_barang)                  ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File AFIFOOUT used by this procedure, so make sure it's RelationManager is open
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesFIFOINSBBK',ProgressWindow)          ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:GDSBBK, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ThisProcess.SetFilter('GHSB:Tanggal_SBBK>=vg_tanggal1 and GHSB:Tanggal_SBBK<<=vg_tanggal2 and GHBPB:kode_apotik=glo:apotik and GDSB:KodeBarang=glo_kode_barang')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(GDSBBK,'QUICKSCAN=on')
  SEND(GHSBBK,'QUICKSCAN=on')
  SEND(GHBPB,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AFIFOIN.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesFIFOINSBBK',ProgressWindow)       ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  GHSB:NoSBBK = GDSB:NoSBBK                                ! Assign linking field value
  Access:GHSBBK.Fetch(GHSB:KeyNoSBBK)
  GHBPB:NoBPB = GHSB:NoBPB                                 ! Assign linking field value
  Access:GHBPB.Fetch(GHBPB:KeyNoBPB)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  GHSB:NoSBBK = GDSB:NoSBBK                                ! Assign linking field value
  Access:GHSBBK.Fetch(GHSB:KeyNoSBBK)
  GHBPB:NoBPB = GHSB:NoBPB                                 ! Assign linking field value
  Access:GHBPB.Fetch(GHBPB:KeyNoBPB)


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  AFI:Kode_Barang     =GDSB:KodeBarang
  AFI:Mata_Uang       ='Rp'
  AFI:NoTransaksi     =GDSB:NoSBBK
  AFI:Transaksi       =1
  AFI:Tanggal         =GHSB:Tanggal_SBBK
  AFI:Harga           =round(GDSB:Harga*1.1,.01)
  AFI:Jumlah          =GDSB:Jumlah_Sat
  AFI:Jumlah_Keluar   =0
  AFI:Tgl_Update      =GHSB:Tanggal_SBBK
  AFI:Jam_Update      =clock()
  AFI:Operator        ='ADI'
  AFI:Jam             =clock()
  AFI:Kode_Apotik     =GHBPB:Kode_Apotik
  AFI:Status          =0
  access:afifoin.insert()
  RETURN ReturnValue

