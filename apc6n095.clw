

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N095.INC'),ONCE        !Local module procedure declarations
                     END


UpdateGDBatal PROCEDURE                                    ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
History::GDBTL:Record LIKE(GDBTL:RECORD),THREAD
QuickWindow          WINDOW('Update the GDBatal File'),AT(,,236,168),FONT('MS Sans Serif',8,COLOR:Black,),IMM,HLP('UpdateGDBatal'),SYSTEM,GRAY,RESIZE,MDI
                       SHEET,AT(4,4,228,142),USE(?CurrentTab)
                         TAB('General'),USE(?Tab:1)
                           PROMPT('No Batal:'),AT(8,20),USE(?GDBTL:NoBatal:Prompt)
                           ENTRY(@s10),AT(64,20,44,10),USE(GDBTL:NoBatal),MSG('No Batal'),TIP('No Batal')
                           PROMPT('Kode Barang:'),AT(8,34),USE(?GDBTL:KodeBarang:Prompt)
                           ENTRY(@s10),AT(64,34,44,10),USE(GDBTL:KodeBarang),MSG('Kode Barang'),TIP('Kode Barang')
                           PROMPT('Nama Barang:'),AT(8,48),USE(?GDBTL:NamaBarang:Prompt)
                           ENTRY(@s40),AT(64,48,164,10),USE(GDBTL:NamaBarang),MSG('Nama Barang'),TIP('Nama Barang')
                           PROMPT('Satuan:'),AT(8,62),USE(?GDBTL:Satuan:Prompt)
                           ENTRY(@s10),AT(64,62,44,10),USE(GDBTL:Satuan),MSG('Satuan'),TIP('Satuan')
                           PROMPT('Harga Satuan:'),AT(8,76),USE(?GDBTL:HargaSatuan:Prompt)
                           ENTRY(@n16.`2),AT(64,76,68,10),USE(GDBTL:HargaSatuan),DECIMAL(14),MSG('Harga Satuan'),TIP('Harga Satuan')
                           PROMPT('Kuantitas:'),AT(8,90),USE(?GDBTL:Kuantitas:Prompt)
                           ENTRY(@n16.2),AT(64,90,68,10),USE(GDBTL:Kuantitas),DECIMAL(14),MSG('Kuantitas'),TIP('Kuantitas')
                           PROMPT('Jumlah Harga:'),AT(8,104),USE(?GDBTL:JumlahHarga:Prompt)
                           ENTRY(@n18.`2),AT(64,104,76,10),USE(GDBTL:JumlahHarga),DECIMAL(14),MSG('Jumlah Harga'),TIP('Jumlah Harga')
                           PROMPT('Discount:'),AT(8,118),USE(?GDBTL:Discount:Prompt)
                           ENTRY(@n18.2),AT(64,118,76,10),USE(GDBTL:Discount),DECIMAL(12),MSG('Diskon'),TIP('Diskon')
                           PROMPT('Bonus Brg:'),AT(8,132),USE(?GDBTL:BonusBrg:Prompt)
                           ENTRY(@n10.2),AT(64,132,44,10),USE(GDBTL:BonusBrg),DECIMAL(14)
                         END
                         TAB('General (cont.)'),USE(?Tab:2)
                           OPTION('Jenis PP n'),AT(64,20,50,48),USE(GDBTL:Jenis_PPn),BOXED
                             RADIO('Include'),AT(68,30),USE(?GDBTL:Jenis_PPn:Radio1),VALUE('1')
                             RADIO('exclude'),AT(68,42),USE(?GDBTL:Jenis_PPn:Radio2),VALUE('2')
                             RADIO('Non'),AT(68,54),USE(?GDBTL:Jenis_PPn:Radio3),VALUE('3')
                           END
                           PROMPT('PP n:'),AT(8,72),USE(?GDBTL:PPn:Prompt)
                           ENTRY(@n10.2),AT(64,72,44,10),USE(GDBTL:PPn),DECIMAL(14)
                           OPTION('status disc'),AT(64,86,50,36),USE(GDBTL:status_disc),BOXED
                             RADIO('SebelumPPn'),AT(68,96),USE(?GDBTL:status_disc:Radio1),VALUE('1')
                             RADIO('SetelahPPn'),AT(68,108),USE(?GDBTL:status_disc:Radio2),VALUE('2')
                           END
                         END
                       END
                       BUTTON('OK'),AT(89,150,45,14),USE(?OK),DEFAULT
                       BUTTON('Cancel'),AT(138,150,45,14),USE(?Cancel)
                       BUTTON('Help'),AT(187,150,45,14),USE(?Help),STD(STD:Help)
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
    ActionMessage = 'Adding a GDBatal Record'
  OF ChangeRecord
    ActionMessage = 'Changing a GDBatal Record'
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateGDBatal')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GDBTL:NoBatal:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(GDBTL:Record,History::GDBTL:Record)
  SELF.AddHistoryField(?GDBTL:NoBatal,1)
  SELF.AddHistoryField(?GDBTL:KodeBarang,2)
  SELF.AddHistoryField(?GDBTL:NamaBarang,3)
  SELF.AddHistoryField(?GDBTL:Satuan,4)
  SELF.AddHistoryField(?GDBTL:HargaSatuan,5)
  SELF.AddHistoryField(?GDBTL:Kuantitas,6)
  SELF.AddHistoryField(?GDBTL:JumlahHarga,7)
  SELF.AddHistoryField(?GDBTL:Discount,8)
  SELF.AddHistoryField(?GDBTL:BonusBrg,9)
  SELF.AddHistoryField(?GDBTL:Jenis_PPn,10)
  SELF.AddHistoryField(?GDBTL:PPn,11)
  SELF.AddHistoryField(?GDBTL:status_disc,12)
  SELF.AddUpdateFile(Access:GDBatal)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:GDBatal.Open                                      ! File GDBatal used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:GDBatal
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
  INIMgr.Fetch('UpdateGDBatal',QuickWindow)                ! Restore window settings from non-volatile store
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
    Relate:GDBatal.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateGDBatal',QuickWindow)             ! Save window data to non-volatile store
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

