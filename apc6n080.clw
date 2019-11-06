

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N080.INC'),ONCE        !Local module procedure declarations
                     END


UpdateTBTransResepDokterHeader_RIHarian PROCEDURE          ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
History::TBT211:Record LIKE(TBT211:RECORD),THREAD
QuickWindow          WINDOW('Update the TBTransResepDokterHeader_RIHarian File'),AT(,,173,112),FONT('Arial',8,,),IMM,HLP('UpdateTBTransResepDokterHeader_RIHarian'),SYSTEM,GRAY,MDI
                       SHEET,AT(4,4,165,86),USE(?CurrentTab)
                         TAB('General'),USE(?Tab:1)
                           PROMPT('No Trans:'),AT(8,20),USE(?TBT211:NoTrans:Prompt)
                           ENTRY(@s20),AT(61,20,84,10),USE(TBT211:NoTrans)
                           PROMPT('Tanggal:'),AT(8,34),USE(?TBT211:Tanggal:Prompt)
                           ENTRY(@d06),AT(61,34,104,10),USE(TBT211:Tanggal)
                           PROMPT('Jam:'),AT(8,48),USE(?TBT211:Jam:Prompt)
                           ENTRY(@t04),AT(61,48,104,10),USE(TBT211:Jam)
                           PROMPT('Operator:'),AT(8,62),USE(?TBT211:Operator:Prompt)
                           ENTRY(@s20),AT(61,62,84,10),USE(TBT211:Operator)
                           PROMPT('Status:'),AT(8,76),USE(?TBT211:Status:Prompt)
                           ENTRY(@n3),AT(61,76,40,10),USE(TBT211:Status)
                         END
                       END
                       BUTTON('OK'),AT(26,94,45,14),USE(?OK),DEFAULT
                       BUTTON('Cancel'),AT(75,94,45,14),USE(?Cancel)
                       BUTTON('Help'),AT(124,94,45,14),USE(?Help),STD(STD:Help)
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
    ActionMessage = 'Adding a TBTransResepDokterHeader_RIHari'
  OF ChangeRecord
    ActionMessage = 'Changing a TBTransResepDokterHeader_RIHa'
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateTBTransResepDokterHeader_RIHarian')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?TBT211:NoTrans:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(TBT211:Record,History::TBT211:Record)
  SELF.AddHistoryField(?TBT211:NoTrans,1)
  SELF.AddHistoryField(?TBT211:Tanggal,2)
  SELF.AddHistoryField(?TBT211:Jam,3)
  SELF.AddHistoryField(?TBT211:Operator,4)
  SELF.AddHistoryField(?TBT211:Status,5)
  SELF.AddUpdateFile(Access:TBTransResepDokterHeader_RIHarian)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:TBTransResepDokterHeader_RIHarian.Open            ! File TBTransResepDokterHeader_RIHarian used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:TBTransResepDokterHeader_RIHarian
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
  INIMgr.Fetch('UpdateTBTransResepDokterHeader_RIHarian',QuickWindow) ! Restore window settings from non-volatile store
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
    Relate:TBTransResepDokterHeader_RIHarian.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateTBTransResepDokterHeader_RIHarian',QuickWindow) ! Save window data to non-volatile store
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

