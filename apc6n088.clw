

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N088.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N150.INC'),ONCE        !Req'd for module callout resolution
                     END


UpdateGstokAptkNew PROCEDURE                               ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
loc::kd_brg          STRING(10)                            !Kode Barang
History::GSTO:Record LIKE(GSTO:RECORD),THREAD
QuickWindow          WINDOW('Merubah Data Barang'),AT(,,236,166),FONT('Arial',8,,),IMM,HLP('UpdateGStokAptk'),SYSTEM,GRAY,MDI
                       SHEET,AT(4,4,221,132),USE(?CurrentTab),FONT('Times New Roman',10,,FONT:regular)
                         TAB('Data Umum'),USE(?Tab:1),FONT('Arial',8,,)
                           STRING('Kode SubFarmasi :'),AT(8,23),USE(?String4)
                           STRING(@s5),AT(68,23),USE(GSTO:Kode_Apotik,,?GSTO:Kode_Apotik:2)
                           BUTTON('&H'),AT(142,37,12,10),USE(?CallLookup),FONT('Times New Roman',10,COLOR:Black,),KEY(F2Key)
                           PROMPT('Kode Barang:'),AT(8,37),USE(?GSTO:Kode_Barang:Prompt)
                           ENTRY(@s10),AT(68,37,68,10),USE(GSTO:Kode_Barang),MSG('Kode Barang'),TIP('Kode Barang')
                           STRING(@s40),AT(68,53,112,8),USE(GBAR:Nama_Brg),FONT('Times New Roman',10,COLOR:Black,)
                           PROMPT('Stok Minimal :'),AT(8,67),USE(?GSTO:Saldo_Minimal:Prompt)
                           ENTRY(@n16.2),AT(68,67,68,10),USE(GSTO:Saldo_Minimal),DECIMAL(14),MSG('Saldo Minimal'),TIP('Saldo Minimal')
                           PROMPT('Saldo Maksimal:'),AT(8,81),USE(?GSTO:Saldo_Maksimal:Prompt)
                           ENTRY(@n16.2),AT(68,81,68,10),USE(GSTO:Saldo_Maksimal),DECIMAL(14)
                           PROMPT('Stok :'),AT(8,96),USE(?GSTO:Saldo:Prompt)
                           ENTRY(@n16.2),AT(68,96,68,10),USE(GSTO:Saldo),DECIMAL(14),MSG('Saldo'),TIP('Saldo')
                           PROMPT('Harga Dasar:'),AT(8,110),USE(?GSTO:Harga_Dasar:Prompt)
                           ENTRY(@n11.`2),AT(68,110,68,10),USE(GSTO:Harga_Dasar),DECIMAL(14),MSG('Harga Dasar'),TIP('Harga Dasar')
                         END
                       END
                       STRING(@s30),AT(72,4),USE(GAPO:Nama_Apotik),FONT('Arial',10,COLOR:Black,)
                       BUTTON('&OK [End]'),AT(42,144,57,14),USE(?OK),LEFT,FONT('Arial',8,COLOR:Black,FONT:regular),KEY(EndKey),ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(107,144,51,14),USE(?Cancel),LEFT,FONT('Arial',8,COLOR:Black,),ICON('CANCEL.ICO')
                       BUTTON('Help'),AT(174,144,45,14),USE(?Help),HIDE,STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Reset                  PROCEDURE(BYTE Force=0),DERIVED     ! Method added to host embed code
Run                    PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
    ActionMessage = 'Adding a GStokAptk Record'
  OF ChangeRecord
    ActionMessage = 'Changing a GStokAptk Record'
  END
  !GLO::back_up=GL_entryapotik
  !GSTO:Kode_Apotik=GLO::back_up
  !!?OK{PROP:DISABLE}=TRUE
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateGstokAptkNew')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?String4
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(GSTO:Record,History::GSTO:Record)
  SELF.AddHistoryField(?GSTO:Kode_Apotik:2,1)
  SELF.AddHistoryField(?GSTO:Kode_Barang,2)
  SELF.AddHistoryField(?GSTO:Saldo_Minimal,3)
  SELF.AddHistoryField(?GSTO:Saldo_Maksimal,6)
  SELF.AddHistoryField(?GSTO:Saldo,4)
  SELF.AddHistoryField(?GSTO:Harga_Dasar,5)
  SELF.AddUpdateFile(Access:GStokAptk)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:GStokAptk.Open                                    ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:GStokAptk
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
  if GLO:BAGIAN<>'SIM' then
  disable(?GSTO:Saldo)
  disable(?GSTO:Harga_Dasar)
  disable(?GSTO:Kode_Barang)
  disable(?CallLookup)
  end
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateGstokAptkNew',QuickWindow)           ! Restore window settings from non-volatile store
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
    Relate:GStokAptk.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateGstokAptkNew',QuickWindow)        ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  GAPO:Kode_Apotik = GSTO:Kode_Apotik                      ! Assign linking field value
  Access:GApotik.Fetch(GAPO:KeyNoApotik)
  GBAR:Kode_brg = GSTO:Kode_Barang                         ! Assign linking field value
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
    Cari_diGbarang1
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
      GBAR:Kode_brg = GSTO:Kode_Barang
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        GSTO:Kode_Barang = GBAR:Kode_brg
      END
      ThisWindow.Reset(1)
    OF ?GSTO:Kode_Barang
      IF GSTO:Kode_Barang OR ?GSTO:Kode_Barang{Prop:Req}
        GBAR:Kode_brg = GSTO:Kode_Barang
        IF Access:GBarang.TryFetch(GBAR:KeyKodeBrg)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            GSTO:Kode_Barang = GBAR:Kode_brg
          ELSE
            SELECT(?GSTO:Kode_Barang)
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
    OF EVENT:CloseWindow
      !PRESSKEY(F3KEY)
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

