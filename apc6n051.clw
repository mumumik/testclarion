

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N051.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N018.INC'),ONCE        !Req'd for module callout resolution
                     END


BrowseEtiket PROCEDURE                                     ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(Apetiket)
                       PROJECT(Ape:No)
                       PROJECT(Ape:Nama)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Ape:No                 LIKE(Ape:No)                   !List box control field - type derived from field
Ape:Nama               LIKE(Ape:Nama)                 !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Jumlah Obat'),AT(,,193,234),FONT('Arial',8,,),CENTER,IMM,HLP('BrowseEtiket'),SYSTEM,GRAY,MDI
                       LIST,AT(2,4,189,207),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('16R(2)|M~No~C(0)@n3@80L(2)|M~Nama~L(2)@s30@'),FROM(Queue:Browse:1)
                       BUTTON('&Tambah'),AT(2,215,45,14),USE(?Insert:2)
                       BUTTON('&Ubah'),AT(51,215,45,14),USE(?Change:2)
                       BUTTON('&Hapus'),AT(100,215,45,14),USE(?Delete:2)
                       BUTTON('&Selesai'),AT(148,215,45,14),USE(?Close)
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
  GlobalErrors.SetProcedureName('BrowseEtiket')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Ape:No',Ape:No)                                    ! Added by: BrowseBox(ABC)
  BIND('Ape:Nama',Ape:Nama)                                ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:Apetiket.Open                                     ! File Apetiket used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Apetiket,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,Ape:KEY1)                             ! Add the sort order for Ape:KEY1 for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,Ape:No,,BRW1)                  ! Initialize the browse locator using  using key: Ape:KEY1 , Ape:No
  BRW1.AddField(Ape:No,BRW1.Q.Ape:No)                      ! Field Ape:No is a hot field or requires assignment from browse
  BRW1.AddField(Ape:Nama,BRW1.Q.Ape:Nama)                  ! Field Ape:Nama is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseEtiket',QuickWindow)                 ! Restore window settings from non-volatile store
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
    Relate:Apetiket.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseEtiket',QuickWindow)              ! Save window data to non-volatile store
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

BrowseEtiket2 PROCEDURE                                    ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(Apetiket1)
                       PROJECT(Ape1:No)
                       PROJECT(Ape1:Nama)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Ape1:No                LIKE(Ape1:No)                  !List box control field - type derived from field
Ape1:Nama              LIKE(Ape1:Nama)                !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Waktu / Cara Pemberian Obat'),AT(,,230,251),FONT('Arial',8,,),CENTER,IMM,HLP('BrowseEtiket2'),SYSTEM,GRAY,MDI
                       LIST,AT(8,2,210,228),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('16R(2)|M~No~C(0)@n3@80L(2)|M~Nama~L(2)@s30@'),FROM(Queue:Browse:1)
                       BUTTON('&Tambah'),AT(14,234,45,14),USE(?Insert:2)
                       BUTTON('&Ubah'),AT(63,234,45,14),USE(?Change:2),DEFAULT
                       BUTTON('&Hapus'),AT(112,234,45,14),USE(?Delete:2)
                       BUTTON('&Selesai'),AT(173,234,45,14),USE(?Close)
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
SetAlerts              PROCEDURE(),DERIVED                 ! Method added to host embed code
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
  GlobalErrors.SetProcedureName('BrowseEtiket2')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Ape1:No',Ape1:No)                                  ! Added by: BrowseBox(ABC)
  BIND('Ape1:Nama',Ape1:Nama)                              ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:Apetiket1.Open                                    ! File Apetiket1 used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Apetiket1,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,Ape1:KEY1)                            ! Add the sort order for Ape1:KEY1 for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,Ape1:No,,BRW1)                 ! Initialize the browse locator using  using key: Ape1:KEY1 , Ape1:No
  BRW1.AddField(Ape1:No,BRW1.Q.Ape1:No)                    ! Field Ape1:No is a hot field or requires assignment from browse
  BRW1.AddField(Ape1:Nama,BRW1.Q.Ape1:Nama)                ! Field Ape1:Nama is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseEtiket2',QuickWindow)                ! Restore window settings from non-volatile store
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
    Relate:Apetiket1.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseEtiket2',QuickWindow)             ! Save window data to non-volatile store
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


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

UpdateGStokAptk PROCEDURE                                  ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
History::GSTO:Record LIKE(GSTO:RECORD),THREAD
QuickWindow          WINDOW('Update the GStokAptk File'),AT(,,195,136),FONT('Arial',8,,),CENTER,IMM,HLP('UpdateGStokAptk'),SYSTEM,GRAY,MDI
                       SHEET,AT(4,4,187,112),USE(?CurrentTab)
                         TAB('Stok Apotik'),USE(?Tab:1)
                           PROMPT('Kode Apotik:'),AT(8,20),USE(?GSTO:Kode_Apotik:Prompt)
                           ENTRY(@s5),AT(68,20,40,10),USE(GSTO:Kode_Apotik),MSG('Kode Apotik'),TIP('Kode Apotik')
                           BUTTON('...'),AT(112,19,12,12),USE(?CallLookup)
                           PROMPT('Nama Apotik:'),AT(8,33),USE(?GAPO:Nama_Apotik:Prompt)
                           ENTRY(@s30),AT(68,33,82,10),USE(GAPO:Nama_Apotik),MSG('Nama Apotik'),TIP('Nama Apotik')
                           PROMPT('Kode Barang:'),AT(8,46),USE(?GSTO:Kode_Barang:Prompt)
                           ENTRY(@s10),AT(68,46,44,10),USE(GSTO:Kode_Barang),MSG('Kode Barang'),TIP('Kode Barang')
                           BUTTON('...'),AT(117,45,12,12),USE(?CallLookup:2)
                           PROMPT('Nama Obat:'),AT(8,59),USE(?GBAR:Nama_Brg:Prompt)
                           ENTRY(@s40),AT(68,59,115,10),USE(GBAR:Nama_Brg),MSG('Nama Barang'),TIP('Nama Barang')
                           PROMPT('Saldo Minimal:'),AT(8,72),USE(?GSTO:Saldo_Minimal:Prompt)
                           ENTRY(@n16.2),AT(68,72,68,10),USE(GSTO:Saldo_Minimal),DECIMAL(14),MSG('Saldo Minimal'),TIP('Saldo Minimal')
                           PROMPT('Saldo:'),AT(8,85),USE(?GSTO:Saldo:Prompt)
                           ENTRY(@n16.2),AT(68,85,68,10),USE(GSTO:Saldo),DECIMAL(14),MSG('Saldo'),TIP('Saldo')
                           PROMPT('Harga Dasar:'),AT(8,98),USE(?GSTO:Harga_Dasar:Prompt)
                           ENTRY(@n11.`2),AT(68,98,48,10),USE(GSTO:Harga_Dasar),DECIMAL(14),MSG('Harga Dasar'),TIP('Harga Dasar')
                         END
                       END
                       BUTTON('&OK'),AT(51,119,45,14),USE(?OK),DEFAULT
                       BUTTON('&Batal'),AT(100,119,45,14),USE(?Cancel)
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
    GlobalErrors.Throw(Msg:InsertIllegal)
    RETURN
  OF ChangeRecord
    GlobalErrors.Throw(Msg:UpdateIllegal)
    RETURN
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateGStokAptk')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GSTO:Kode_Apotik:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(GSTO:Record,History::GSTO:Record)
  SELF.AddHistoryField(?GSTO:Kode_Apotik,1)
  SELF.AddHistoryField(?GSTO:Kode_Barang,2)
  SELF.AddHistoryField(?GSTO:Saldo_Minimal,3)
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
    SELF.InsertAction = Insert:None                        ! Inserts not allowed
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:None                        ! Changes not allowed
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateGStokAptk',QuickWindow)              ! Restore window settings from non-volatile store
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
    Relate:GStokAptk.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateGStokAptk',QuickWindow)           ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = GSTO:Kode_Barang                         ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  GAPO:Kode_Apotik = GSTO:Kode_Apotik                      ! Assign linking field value
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
      SelectApotik
      SelectBarang
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
    OF ?GSTO:Kode_Apotik
      IF GSTO:Kode_Apotik OR ?GSTO:Kode_Apotik{Prop:Req}
        GAPO:Kode_Apotik = GSTO:Kode_Apotik
        IF Access:GApotik.TryFetch(GAPO:KeyNoApotik)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            GSTO:Kode_Apotik = GAPO:Kode_Apotik
          ELSE
            SELECT(?GSTO:Kode_Apotik)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      GAPO:Kode_Apotik = GSTO:Kode_Apotik
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        GSTO:Kode_Apotik = GAPO:Kode_Apotik
      END
      ThisWindow.Reset(1)
    OF ?GSTO:Kode_Barang
      IF GSTO:Kode_Barang OR ?GSTO:Kode_Barang{Prop:Req}
        GBAR:Kode_brg = GSTO:Kode_Barang
        IF Access:GBarang.TryFetch(GBAR:KeyKodeBrg)
          IF SELF.Run(2,SelectRecord) = RequestCompleted
            GSTO:Kode_Barang = GBAR:Kode_brg
          ELSE
            SELECT(?GSTO:Kode_Barang)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup:2
      ThisWindow.Update
      GBAR:Kode_brg = GSTO:Kode_Barang
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        GSTO:Kode_Barang = GBAR:Kode_brg
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

Lihat_stok_tempat_lain PROCEDURE                           ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
loc_nama_brg         STRING(40)                            !Nama Barang
BRW1::View:Browse    VIEW(GStokAptk)
                       PROJECT(GSTO:Kode_Apotik)
                       PROJECT(GSTO:Saldo)
                       PROJECT(GSTO:Harga_Dasar)
                       PROJECT(GSTO:Kode_Barang)
                       JOIN(GAPO:KeyNoApotik,GSTO:Kode_Apotik)
                         PROJECT(GAPO:Nama_Apotik)
                         PROJECT(GAPO:Kode_Apotik)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GSTO:Kode_Apotik       LIKE(GSTO:Kode_Apotik)         !List box control field - type derived from field
GAPO:Nama_Apotik       LIKE(GAPO:Nama_Apotik)         !List box control field - type derived from field
GSTO:Saldo             LIKE(GSTO:Saldo)               !List box control field - type derived from field
GSTO:Harga_Dasar       LIKE(GSTO:Harga_Dasar)         !List box control field - type derived from field
GSTO:Kode_Barang       LIKE(GSTO:Kode_Barang)         !Primary key field - type derived from field
GAPO:Kode_Apotik       LIKE(GAPO:Kode_Apotik)         !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW7::View:Browse    VIEW(GBarang)
                       PROJECT(GBAR:Nama_Brg)
                       PROJECT(GBAR:Kode_brg)
                       PROJECT(GBAR:Status)
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?List:2
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !List box control field - type derived from field
GBAR:Status            LIKE(GBAR:Status)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Daftar Persediaan di Sub Farmasi '),AT(,,415,225),FONT('Arial',8,,),CENTER,IMM,HLP('BrowseStokApotik'),SYSTEM,GRAY,MDI
                       SHEET,AT(6,2,407,111),USE(?Sheet2)
                         TAB('Nama Barang [F3]'),USE(?Tab2)
                           STRING(@s40),AT(197,96,171,10),USE(loc_nama_brg)
                         END
                         TAB('Kode Barang [F3]'),USE(?Tab3)
                         END
                       END
                       LIST,AT(10,20,398,68),USE(?List:2),IMM,VSCROLL,FONT('Arial',8,,FONT:regular),MSG('Browsing Records'),FORMAT('169L|~Nama Barang~L(42)@s40@53L|M~Kode Barang~L(4)@s10@12L~Status~L(4)@n3@'),FROM(Queue:Browse:2)
                       LIST,AT(11,136,324,76),USE(?Browse:1),IMM,VSCROLL,FONT('Arial',8,COLOR:Black,FONT:regular),MSG('Browsing Records'),FORMAT('48L|M~Kode Apotik~@s5@120L|M~Nama Apotik~C@s30@65D(14)|M~Saldo~C(0)@n16.2@48D(14' &|
   ')|M~Harga Dasar~L(11)@n11.2@'),FROM(Queue:Browse:1)
                       BUTTON('&Tambah'),AT(232,0,45,14),USE(?Insert:2),DISABLE,HIDE
                       BUTTON('&Ubah'),AT(280,0,45,14),USE(?Change:2),DISABLE,HIDE,DEFAULT
                       BUTTON('&Hapus'),AT(328,0,45,14),USE(?Delete:2),DISABLE,HIDE
                       SHEET,AT(6,116,407,105),USE(?CurrentTab)
                         TAB('Daftar Barang'),USE(?Tab:2),FONT('Arial',8,COLOR:Black,)
                         END
                       END
                       BUTTON('&Selesai'),AT(347,186,61,26),USE(?Close),LEFT,ICON('CLOSE.ICO')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
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
BRW7                 CLASS(BrowseClass)                    ! Browse using ?List:2
Q                      &Queue:Browse:2                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW7::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW7::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?Sheet2)=2
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

ThisWindow.Ask PROCEDURE

  CODE
  GLO::back_up=GL_entryapotik
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Lihat_stok_tempat_lain')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?loc_nama_brg
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:GBarang.Open                                      ! File GBarang used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GStokAptk,SELF) ! Initialize the browse manager
  BRW7.Init(?List:2,Queue:Browse:2.ViewPosition,BRW7::View:Browse,Queue:Browse:2,Relate:GBarang,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List:2{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon GSTO:Kode_Apotik for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,GSTO:KeyBarang)  ! Add the sort order for GSTO:KeyBarang for sort order 1
  BRW1.AddRange(GSTO:Kode_Barang,Relate:GStokAptk,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,GSTO:Kode_Apotik,,BRW1)        ! Initialize the browse locator using  using key: GSTO:KeyBarang , GSTO:Kode_Apotik
  BRW1.AddField(GSTO:Kode_Apotik,BRW1.Q.GSTO:Kode_Apotik)  ! Field GSTO:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GAPO:Nama_Apotik,BRW1.Q.GAPO:Nama_Apotik)  ! Field GAPO:Nama_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GSTO:Saldo,BRW1.Q.GSTO:Saldo)              ! Field GSTO:Saldo is a hot field or requires assignment from browse
  BRW1.AddField(GSTO:Harga_Dasar,BRW1.Q.GSTO:Harga_Dasar)  ! Field GSTO:Harga_Dasar is a hot field or requires assignment from browse
  BRW1.AddField(GSTO:Kode_Barang,BRW1.Q.GSTO:Kode_Barang)  ! Field GSTO:Kode_Barang is a hot field or requires assignment from browse
  BRW1.AddField(GAPO:Kode_Apotik,BRW1.Q.GAPO:Kode_Apotik)  ! Field GAPO:Kode_Apotik is a hot field or requires assignment from browse
  BRW7.Q &= Queue:Browse:2
  BRW7.AddSortOrder(,GBAR:KeyKodeBrg)                      ! Add the sort order for GBAR:KeyKodeBrg for sort order 1
  BRW7.AddLocator(BRW7::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW7::Sort1:Locator.Init(,GBAR:Kode_brg,,BRW7)           ! Initialize the browse locator using  using key: GBAR:KeyKodeBrg , GBAR:Kode_brg
  BRW7.SetFilter('(gbar:status=1)')                        ! Apply filter expression to browse
  BRW7.AddSortOrder(,GBAR:KeyNama)                         ! Add the sort order for GBAR:KeyNama for sort order 2
  BRW7.AddLocator(BRW7::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW7::Sort0:Locator.Init(?loc_nama_brg,GBAR:Nama_Brg,,BRW7) ! Initialize the browse locator using ?loc_nama_brg using key: GBAR:KeyNama , GBAR:Nama_Brg
  BRW7.SetFilter('(gbar:status=1)')                        ! Apply filter expression to browse
  BRW7.AddField(GBAR:Nama_Brg,BRW7.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW7.AddField(GBAR:Kode_brg,BRW7.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  BRW7.AddField(GBAR:Status,BRW7.Q.GBAR:Status)            ! Field GBAR:Status is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Lihat_stok_tempat_lain',QuickWindow)       ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW7.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
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
    INIMgr.Update('Lihat_stok_tempat_lain',QuickWindow)    ! Save window data to non-volatile store
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
    UpdateGStokAptk
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


BRW7.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW7.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?Sheet2)=2
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

Cari_diGbarang PROCEDURE                                   ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
loc::kode_barang     STRING(20)                            !
Loc::nama_brg        STRING(40)                            !
BRW1::View:Browse    VIEW(GBarang)
                       PROJECT(GBAR:Kode_brg)
                       PROJECT(GBAR:Nama_Brg)
                       PROJECT(GBAR:Status)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Status            LIKE(GBAR:Status)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Melihat Tabel Barang Keseluruhan'),AT(,,264,169),FONT('Arial',8,,),IMM,HLP('Cari_diGbarang'),SYSTEM,GRAY
                       LIST,AT(9,22,248,106),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('48L(2)|M~Kode Barang~@s10@166L(2)|M~Nama Barang~@s40@12L(2)|M~Status~@n3@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(147,0,45,14),USE(?Select:2),HIDE
                       SHEET,AT(4,4,257,162),USE(?CurrentTab),FONT('Arial',8,,)
                         TAB('Nama Barang (F2)'),USE(?Tab:2),KEY(F2Key)
                           PROMPT('Nama Barang :'),AT(27,137),USE(?Prompt2)
                           ENTRY(@s40),AT(82,137,,10),USE(Loc::nama_brg)
                         END
                         TAB('Kode Barang (F3)'),USE(?Tab:3),KEY(F3Key),FONT('Arial',8,,)
                           PROMPT('Kode Barang :'),AT(119,137),USE(?Prompt1)
                           ENTRY(@s10),AT(173,137,,10),USE(loc::kode_barang)
                         END
                       END
                       BUTTON('Close'),AT(15,152,45,14),USE(?Close),HIDE
                       BUTTON('Help'),AT(89,150,45,14),USE(?Help),HIDE,STD(STD:Help)
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
  GlobalErrors.SetProcedureName('Cari_diGbarang')
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
  Relate:APDTRANS.SetOpenRelated()
  Relate:APDTRANS.Open                                     ! File APDTRANS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GBarang,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon GBAR:Kode_brg for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,GBAR:KeyKodeBrg) ! Add the sort order for GBAR:KeyKodeBrg for sort order 1
  BRW1.AddRange(GBAR:Kode_brg,Relate:GBarang,Relate:APDTRANS) ! Add file relationship range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?loc::kode_barang,GBAR:Kode_brg,,BRW1) ! Initialize the browse locator using ?loc::kode_barang using key: GBAR:KeyKodeBrg , GBAR:Kode_brg
  BRW1.SetFilter('(gbar:status=1)')                        ! Apply filter expression to browse
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon GBAR:Nama_Brg for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,GBAR:KeyNama)    ! Add the sort order for GBAR:KeyNama for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?Loc::nama_brg,GBAR:Nama_Brg,,BRW1) ! Initialize the browse locator using ?Loc::nama_brg using key: GBAR:KeyNama , GBAR:Nama_Brg
  BRW1.SetFilter('(gbar:status=1)')                        ! Apply filter expression to browse
  BRW1.AddField(GBAR:Kode_brg,BRW1.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Nama_Brg,BRW1.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Status,BRW1.Q.GBAR:Status)            ! Field GBAR:Status is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Cari_diGbarang',QuickWindow)               ! Restore window settings from non-volatile store
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
    Relate:APDTRANS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Cari_diGbarang',QuickWindow)            ! Save window data to non-volatile store
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

