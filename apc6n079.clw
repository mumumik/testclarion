

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N079.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N080.INC'),ONCE        !Req'd for module callout resolution
                     END


UpdateTBTransResepDokterHeader_RI PROCEDURE                ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
BRW2::View:Browse    VIEW(TBTransResepDokterHeader_RIHarian)
                       PROJECT(TBT211:NoTrans)
                       PROJECT(TBT211:Tanggal)
                       PROJECT(TBT211:Jam)
                       PROJECT(TBT211:Operator)
                       PROJECT(TBT211:Status)
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?Browse:2
TBT211:NoTrans         LIKE(TBT211:NoTrans)           !List box control field - type derived from field
TBT211:Tanggal         LIKE(TBT211:Tanggal)           !List box control field - type derived from field
TBT211:Jam             LIKE(TBT211:Jam)               !List box control field - type derived from field
TBT211:Operator        LIKE(TBT211:Operator)          !List box control field - type derived from field
TBT211:Status          LIKE(TBT211:Status)            !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::TBT21:Record LIKE(TBT21:RECORD),THREAD
QuickWindow          WINDOW('Update the TBTransResepDokterHeader_RI File'),AT(,,312,182),FONT('Arial',8,,),IMM,HLP('UpdateTBTransResepDokterHeader_RI'),SYSTEM,GRAY,MDI
                       SHEET,AT(4,4,304,156),USE(?CurrentTab)
                         TAB('General'),USE(?Tab:1)
                           PROMPT('No Trans:'),AT(8,20),USE(?TBT21:NoTrans:Prompt)
                           ENTRY(@s20),AT(100,20,84,10),USE(TBT21:NoTrans)
                           PROMPT('Kode Reg:'),AT(8,34),USE(?TBT21:KodeReg:Prompt)
                           ENTRY(@s15),AT(100,34,64,10),USE(TBT21:KodeReg)
                           PROMPT('Kode Pasien:'),AT(8,48),USE(?TBT21:KodePasien:Prompt)
                           ENTRY(@s15),AT(100,48,64,10),USE(TBT21:KodePasien)
                           PROMPT('Kode Dokter:'),AT(8,62),USE(?TBT21:KodeDokter:Prompt)
                           ENTRY(@s15),AT(100,62,64,10),USE(TBT21:KodeDokter)
                           PROMPT('Tanggal:'),AT(8,76),USE(?TBT21:Tanggal:Prompt)
                           ENTRY(@d06),AT(100,76,104,10),USE(TBT21:Tanggal)
                           PROMPT('Jam:'),AT(8,90),USE(?TBT21:Jam:Prompt)
                           ENTRY(@t04),AT(100,90,104,10),USE(TBT21:Jam)
                           PROMPT('Her:'),AT(8,104),USE(?TBT21:Her:Prompt)
                           ENTRY(@n-7),AT(100,104,40,10),USE(TBT21:Her),RIGHT(1)
                           PROMPT('Status:'),AT(8,118),USE(?TBT21:Status:Prompt)
                           ENTRY(@n3),AT(100,118,40,10),USE(TBT21:Status)
                           PROMPT('Umur Perkiraan:'),AT(8,132),USE(?TBT21:UmurPerkiraan:Prompt)
                           ENTRY(@n-14),AT(100,132,64,10),USE(TBT21:UmurPerkiraan),RIGHT(1)
                           PROMPT('Berat Badan:'),AT(8,146),USE(?TBT21:BeratBadan:Prompt)
                           ENTRY(@n-14),AT(100,146,64,10),USE(TBT21:BeratBadan),RIGHT(1)
                         END
                         TAB('General (cont.)'),USE(?Tab:2)
                           PROMPT('Alergi:'),AT(8,20),USE(?TBT21:Alergi:Prompt)
                           ENTRY(@s50),AT(100,20,204,10),USE(TBT21:Alergi)
                           PROMPT('Rencana Pasien Pulang:'),AT(8,34),USE(?TBT21:RencanaPasienPulang:Prompt)
                           ENTRY(@n3),AT(100,34,40,10),USE(TBT21:StatusObat)
                         END
                         TAB('TBTransResepDokterHeader_RIHarian'),USE(?Tab:3)
                           LIST,AT(8,20,296,118),USE(?Browse:2),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('80L(2)|M~No Trans~L(2)@s20@80R(2)|M~Tanggal~C(0)@d06@80R(2)|M~Jam~C(0)@t04@80L(2' &|
   ')|M~Operator~L(2)@s20@28R(2)|M~Status~C(0)@n3@'),FROM(Queue:Browse:2)
                           BUTTON('&Insert'),AT(161,142,45,14),USE(?Insert:3)
                           BUTTON('&Change'),AT(210,142,45,14),USE(?Change:3)
                           BUTTON('&Delete'),AT(259,142,45,14),USE(?Delete:3)
                         END
                       END
                       BUTTON('OK'),AT(165,164,45,14),USE(?OK),DEFAULT
                       BUTTON('Cancel'),AT(214,164,45,14),USE(?Cancel)
                       BUTTON('Help'),AT(263,164,45,14),USE(?Help),STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW2                 CLASS(BrowseClass)                    ! Browse using ?Browse:2
Q                      &Queue:Browse:2                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
                     END

BRW2::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
    ActionMessage = 'Adding a TBTransResepDokterHeader_RI Rec'
  OF ChangeRecord
    ActionMessage = 'Changing a TBTransResepDokterHeader_RI R'
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateTBTransResepDokterHeader_RI')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?TBT21:NoTrans:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(TBT21:Record,History::TBT21:Record)
  SELF.AddHistoryField(?TBT21:NoTrans,1)
  SELF.AddHistoryField(?TBT21:KodeReg,2)
  SELF.AddHistoryField(?TBT21:KodePasien,3)
  SELF.AddHistoryField(?TBT21:KodeDokter,4)
  SELF.AddHistoryField(?TBT21:Tanggal,5)
  SELF.AddHistoryField(?TBT21:Jam,6)
  SELF.AddHistoryField(?TBT21:Her,7)
  SELF.AddHistoryField(?TBT21:Status,8)
  SELF.AddHistoryField(?TBT21:UmurPerkiraan,9)
  SELF.AddHistoryField(?TBT21:BeratBadan,10)
  SELF.AddHistoryField(?TBT21:Alergi,11)
  SELF.AddHistoryField(?TBT21:StatusObat,12)
  SELF.AddUpdateFile(Access:TBTransResepDokterHeader_RI)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:TBTransResepDokterHeader_RI.Open                  ! File TBTransResepDokterHeader_RI used by this procedure, so make sure it's RelationManager is open
  Relate:TBTransResepDokterHeader_RIHarian.Open            ! File TBTransResepDokterHeader_RI used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:TBTransResepDokterHeader_RI
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
  BRW2.Init(?Browse:2,Queue:Browse:2.ViewPosition,BRW2::View:Browse,Queue:Browse:2,Relate:TBTransResepDokterHeader_RIHarian,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:2{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW2.Q &= Queue:Browse:2
  BRW2.AddSortOrder(,TBT211:PK)                            ! Add the sort order for TBT211:PK for sort order 1
  BRW2.AddRange(TBT211:NoTrans,Relate:TBTransResepDokterHeader_RIHarian,Relate:TBTransResepDokterHeader_RI) ! Add file relationship range limit for sort order 1
  BRW2.AddLocator(BRW2::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW2::Sort0:Locator.Init(,TBT211:Tanggal,1,BRW2)         ! Initialize the browse locator using  using key: TBT211:PK , TBT211:Tanggal
  BRW2.AddField(TBT211:NoTrans,BRW2.Q.TBT211:NoTrans)      ! Field TBT211:NoTrans is a hot field or requires assignment from browse
  BRW2.AddField(TBT211:Tanggal,BRW2.Q.TBT211:Tanggal)      ! Field TBT211:Tanggal is a hot field or requires assignment from browse
  BRW2.AddField(TBT211:Jam,BRW2.Q.TBT211:Jam)              ! Field TBT211:Jam is a hot field or requires assignment from browse
  BRW2.AddField(TBT211:Operator,BRW2.Q.TBT211:Operator)    ! Field TBT211:Operator is a hot field or requires assignment from browse
  BRW2.AddField(TBT211:Status,BRW2.Q.TBT211:Status)        ! Field TBT211:Status is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateTBTransResepDokterHeader_RI',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW2.AskProcedure = 1
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
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:TBTransResepDokterHeader_RI.Close
    Relate:TBTransResepDokterHeader_RIHarian.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateTBTransResepDokterHeader_RI',QuickWindow) ! Save window data to non-volatile store
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


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdateTBTransResepDokterHeader_RIHarian
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

