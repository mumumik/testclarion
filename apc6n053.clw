

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABEIP.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N053.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N007.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N051.INC'),ONCE        !Req'd for module callout resolution
                     END


tb_obat_kontraktor PROCEDURE                               ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
loc::kode_ktr        STRING(10)                            !
loc:nama_brg         STRING(40)                            !Nama Barang
BRW1::View:Browse    VIEW(APOBKONT)
                       PROJECT(APO:Kode_brg)
                       PROJECT(APO:PERS_TAMBAH)
                       PROJECT(APO:KODE_KTR)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APO:Kode_brg           LIKE(APO:Kode_brg)             !List box control field - type derived from field
APO:PERS_TAMBAH        LIKE(APO:PERS_TAMBAH)          !List box control field - type derived from field
APO:KODE_KTR           LIKE(APO:KODE_KTR)             !Primary key field - type derived from field
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
QuickWindow          WINDOW('Data Khusus Obat Kontraktor'),AT(,,389,217),FONT('Arial',8,,),CENTER,IMM,HLP('Tabel_Obat_kontraktor'),SYSTEM,GRAY,MDI
                       PROMPT('Kode Kontraktor :'),AT(27,11),USE(?Prompt1),FONT('Times New Roman',,COLOR:Black,FONT:bold)
                       ENTRY(@s10),AT(98,10,60,10),USE(loc::kode_ktr)
                       BUTTON('&K'),AT(166,9,12,12),USE(?CallLookup),KEY(F2Key)
                       STRING(@s40),AT(191,11,166,10),USE(JKon:NAMA_KTR),CENTER
                       LIST,AT(220,58,163,36),USE(?Browse:1),IMM,MSG('Browsing Records'),FORMAT('48L(2)|M~Kode Barang~@s10@48R(2)|M~Persen~C(0)@n3@'),FROM(Queue:Browse:1)
                       SHEET,AT(13,36,193,172),USE(?Sheet2)
                         TAB('Nama Barang (F2)'),USE(?Tab2),KEY(F2Key)
                           STRING(@s40),AT(33,193,167,10),USE(loc:nama_brg)
                         END
                         TAB('Kode Barang (F3)'),USE(?Tab3),KEY(F3Key)
                         END
                       END
                       LIST,AT(19,55,179,132),USE(?List:2),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('121L(2)|M~Nama Barang~C@s40@40L(2)~Kode Barang~@s10@12L(2)~Status~@n3@'),FROM(Queue:Browse:2)
                       BUTTON('&Select'),AT(260,203,45,14),USE(?Select:2),HIDE
                       BUTTON('&Tambah [+]'),AT(226,121,45,22),USE(?Insert:3),KEY(PlusKey)
                       BUTTON('&Ubah'),AT(279,121,45,22),USE(?Change:3),DEFAULT
                       BUTTON('&Hapus'),AT(332,121,45,22),USE(?Delete:3)
                       SHEET,AT(216,30,172,145),USE(?CurrentTab)
                         TAB('Kontraktor'),USE(?Tab:2)
                         END
                       END
                       BOX,AT(7,30,205,184),USE(?Box1),COLOR(COLOR:Black)
                       BUTTON('&Keluar'),AT(329,189,55,20),USE(?Close),LEFT,ICON('EXIT5.ICO')
                       BUTTON('Help'),AT(225,203,45,14),USE(?Help),HIDE,STD(STD:Help)
                       PANEL,AT(4,4,383,22),USE(?Panel1)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepClass                            ! Default Step Manager
BRW7                 CLASS(BrowseClass)                    ! Browse using ?List:2
Q                      &Queue:Browse:2                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW7::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW7::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?Sheet2) = 2
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
  GlobalErrors.SetProcedureName('tb_obat_kontraktor')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Prompt1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('loc::kode_ktr',loc::kode_ktr)                      ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:APOBKONT.SetOpenRelated()
  Relate:APOBKONT.Open                                     ! File JKontrak used by this procedure, so make sure it's RelationManager is open
  Access:JKontrak.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:APOBKONT,SELF) ! Initialize the browse manager
  BRW7.Init(?List:2,Queue:Browse:2.ViewPosition,BRW7::View:Browse,Queue:Browse:2,Relate:GBarang,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List:2{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,APO:by_kode_brg)                      ! Add the sort order for APO:by_kode_brg for sort order 1
  BRW1.AddRange(APO:Kode_brg,Relate:APOBKONT,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,APO:Kode_brg,1,BRW1)           ! Initialize the browse locator using  using key: APO:by_kode_brg , APO:Kode_brg
  BRW1.SetFilter('(APO:KODE_KTR=loc::kode_ktr)')           ! Apply filter expression to browse
  BRW1.AddField(APO:Kode_brg,BRW1.Q.APO:Kode_brg)          ! Field APO:Kode_brg is a hot field or requires assignment from browse
  BRW1.AddField(APO:PERS_TAMBAH,BRW1.Q.APO:PERS_TAMBAH)    ! Field APO:PERS_TAMBAH is a hot field or requires assignment from browse
  BRW1.AddField(APO:KODE_KTR,BRW1.Q.APO:KODE_KTR)          ! Field APO:KODE_KTR is a hot field or requires assignment from browse
  BRW7.Q &= Queue:Browse:2
  BRW7.AddSortOrder(,GBAR:KeyKodeBrg)                      ! Add the sort order for GBAR:KeyKodeBrg for sort order 1
  BRW7.AddLocator(BRW7::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW7::Sort1:Locator.Init(,GBAR:Kode_brg,,BRW7)           ! Initialize the browse locator using  using key: GBAR:KeyKodeBrg , GBAR:Kode_brg
  BRW7.SetFilter('(gbar:status=1)')                        ! Apply filter expression to browse
  BRW7.AddSortOrder(,GBAR:KeyNama)                         ! Add the sort order for GBAR:KeyNama for sort order 2
  BRW7.AddLocator(BRW7::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW7::Sort0:Locator.Init(?loc:nama_brg,GBAR:Nama_Brg,,BRW7) ! Initialize the browse locator using ?loc:nama_brg using key: GBAR:KeyNama , GBAR:Nama_Brg
  BRW7.SetFilter('(gbar:status=1)')                        ! Apply filter expression to browse
  BRW7.AddField(GBAR:Nama_Brg,BRW7.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW7.AddField(GBAR:Kode_brg,BRW7.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  BRW7.AddField(GBAR:Status,BRW7.Q.GBAR:Status)            ! Field GBAR:Status is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('tb_obat_kontraktor',QuickWindow)           ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 2
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW7.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW7.ToolbarItem.HelpButton = ?Help
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APOBKONT.Close
  END
  IF SELF.Opened
    INIMgr.Update('tb_obat_kontraktor',QuickWindow)        ! Save window data to non-volatile store
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
      SelectJKontrak
      Rubah_obat_kontraktor
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
    CASE ACCEPTED()
    OF ?loc::kode_ktr
      GLO::back_up=loc::kode_Ktr
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?loc::kode_ktr
      IF loc::kode_ktr OR ?loc::kode_ktr{Prop:Req}
        JKon:KODE_KTR = loc::kode_ktr
        IF Access:JKontrak.TryFetch(JKon:KeyKodeKtr)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            loc::kode_ktr = JKon:KODE_KTR
          ELSE
            SELECT(?loc::kode_ktr)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      GLO::back_up=loc::kode_Ktr
      JKon:KODE_KTR = loc::kode_ktr
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        loc::kode_ktr = JKon:KODE_KTR
      END
      ThisWindow.Reset(1)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeFieldEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all field specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  CASE FIELD()
  OF ?Sheet2
    CASE EVENT()                                                  
    OF EVENT:TabChanging
      SELECT(?List:2)
    END
  END
  ReturnValue = PARENT.TakeFieldEvent()
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


BRW7.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW7.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?Sheet2) = 2
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

Rubah_obat_kontraktor PROCEDURE                            ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
History::APO:Record  LIKE(APO:RECORD),THREAD
QuickWindow          WINDOW('Merubah Data Obat Kontraktor'),AT(,,221,132),FONT('Arial',8,,),IMM,HLP('UpdateAPOBKONT'),SYSTEM,GRAY,MDI
                       SHEET,AT(4,4,214,100),USE(?CurrentTab)
                         TAB('Umum'),USE(?Tab:1)
                           PROMPT('Kode Kontraktor :'),AT(8,20),USE(?APO:KODE_KTR:Prompt)
                           ENTRY(@s10),AT(67,20,57,10),USE(APO:KODE_KTR),DISABLE
                           STRING(@s40),AT(67,36,143,10),USE(JKon:NAMA_KTR)
                           PROMPT('Kode Barang:'),AT(8,53),USE(?APO:Kode_brg:Prompt)
                           ENTRY(@s10),AT(67,53,44,10),USE(APO:Kode_brg),MSG('Kode Barang'),TIP('Kode Barang')
                           BUTTON('&?'),AT(117,51,12,12),USE(?CallLookup)
                           STRING(@s40),AT(67,69,141,10),USE(GBAR:Nama_Brg)
                           PROMPT('Penambahan :'),AT(8,88),FONT('Times New Roman',10,COLOR:Black,)
                           ENTRY(@n3),AT(67,88,40,10),USE(APO:PERS_TAMBAH),MSG('PERSEN PENAMBAHAN'),TIP('PERSEN PENAMBAHAN')
                           STRING('%'),AT(111,88),USE(?String1),FONT('Times New Roman',10,COLOR:Black,FONT:bold)
                         END
                       END
                       BUTTON('OK'),AT(62,110,51,18),USE(?OK),LEFT,ICON(ICON:Tick),DEFAULT
                       BUTTON('Batal'),AT(139,110,51,18),USE(?Cancel),LEFT,ICON(ICON:Cross)
                       BUTTON('Help'),AT(130,1,45,14),USE(?Help),HIDE,STD(STD:Help)
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
    ActionMessage = 'Adding a APOBKONT Record'
  OF ChangeRecord
    ActionMessage = 'Changing a APOBKONT Record'
  END
  GLO::back_up=JKon:KODE_KTR
  APO:KODE_KTR=GLO::back_up
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Rubah_obat_kontraktor')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APO:KODE_KTR:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APO:Record,History::APO:Record)
  SELF.AddHistoryField(?APO:KODE_KTR,1)
  SELF.AddHistoryField(?APO:Kode_brg,2)
  SELF.AddHistoryField(?APO:PERS_TAMBAH,3)
  SELF.AddUpdateFile(Access:APOBKONT)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:APOBKONT.SetOpenRelated()
  Relate:APOBKONT.Open                                     ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Access:JKontrak.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GBarang.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:APOBKONT
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.DeleteAction = Delete:Auto                        ! Automatic deletions
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Rubah_obat_kontraktor',QuickWindow)        ! Restore window settings from non-volatile store
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
    Relate:APOBKONT.Close
  END
  IF SELF.Opened
    INIMgr.Update('Rubah_obat_kontraktor',QuickWindow)     ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  JKon:KODE_KTR = APO:KODE_KTR                             ! Assign linking field value
  Access:JKontrak.Fetch(JKon:KeyKodeKtr)
  GBAR:Kode_brg = APO:Kode_brg                             ! Assign linking field value
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
    Cari_diGbarang
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
    OF ?APO:Kode_brg
      IF APO:Kode_brg OR ?APO:Kode_brg{Prop:Req}
        GBAR:Kode_brg = APO:Kode_brg
        IF Access:GBarang.TryFetch(GBAR:KeyKodeBrg)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            APO:Kode_brg = GBAR:Kode_brg
          ELSE
            SELECT(?APO:Kode_brg)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      GBAR:Kode_brg = APO:Kode_brg
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        APO:Kode_brg = GBAR:Kode_brg
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

BrowseObatPerKelompok PROCEDURE                            ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(GBarKel)
                       PROJECT(GBA1:Kode)
                       PROJECT(GBA1:Nama)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GBA1:Kode              LIKE(GBA1:Kode)                !List box control field - type derived from field
GBA1:Nama              LIKE(GBA1:Nama)                !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW4::View:Browse    VIEW(GBarang)
                       PROJECT(GBAR:Kode_brg)
                       PROJECT(GBAR:Nama_Brg)
                       PROJECT(GBAR:Kode_Apotik)
                       PROJECT(GBAR:Kelompok)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Kode_Apotik       LIKE(GBAR:Kode_Apotik)         !List box control field - type derived from field
GBAR:Kelompok          LIKE(GBAR:Kelompok)            !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Barang Per Kelompok'),AT(,,419,251),FONT('Arial',8,,),CENTER,IMM,HLP('BrowseObatPerKelompok'),SYSTEM,GRAY,MDI
                       LIST,AT(8,6,142,225),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('64R(2)|M~Kode~C(0)@n-14@80L(2)|M~Nama~L(2)@s40@'),FROM(Queue:Browse:1)
                       LIST,AT(153,6,262,225),USE(?List),IMM,MSG('Browsing Records'),FORMAT('40L|M~Kode Barang~@s10@160L|M~Nama Obat~@s40@20L|M~Kode Apotik~@s5@'),FROM(Queue:Browse)
                       BUTTON('&Selesai'),AT(365,235,45,14),USE(?Close)
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

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW4                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
                     END

BRW4::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
  GlobalErrors.SetProcedureName('BrowseObatPerKelompok')
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
  Relate:GBarKel.SetOpenRelated()
  Relate:GBarKel.Open                                      ! File GBarang used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GBarKel,SELF) ! Initialize the browse manager
  BRW4.Init(?List,Queue:Browse.ViewPosition,BRW4::View:Browse,Queue:Browse,Relate:GBarang,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,GBA1:PK)                              ! Add the sort order for GBA1:PK for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,GBA1:Kode,,BRW1)               ! Initialize the browse locator using  using key: GBA1:PK , GBA1:Kode
  BRW1.AddField(GBA1:Kode,BRW1.Q.GBA1:Kode)                ! Field GBA1:Kode is a hot field or requires assignment from browse
  BRW1.AddField(GBA1:Nama,BRW1.Q.GBA1:Nama)                ! Field GBA1:Nama is a hot field or requires assignment from browse
  BRW4.Q &= Queue:Browse
  BRW4.AddSortOrder(,GBAR:KeyKodeKelompok)                 ! Add the sort order for GBAR:KeyKodeKelompok for sort order 1
  BRW4.AddRange(GBAR:Kelompok,Relate:GBarang,Relate:GBarKel) ! Add file relationship range limit for sort order 1
  BRW4.AddLocator(BRW4::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW4::Sort0:Locator.Init(,GBAR:Kelompok,1,BRW4)          ! Initialize the browse locator using  using key: GBAR:KeyKodeKelompok , GBAR:Kelompok
  BRW4.AddField(GBAR:Kode_brg,BRW4.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Nama_Brg,BRW4.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Kode_Apotik,BRW4.Q.GBAR:Kode_Apotik)  ! Field GBAR:Kode_Apotik is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Kelompok,BRW4.Q.GBAR:Kelompok)        ! Field GBAR:Kelompok is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseObatPerKelompok',QuickWindow)        ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW4.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:GBarKel.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseObatPerKelompok',QuickWindow)     ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW4.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

BrowsePaketObat PROCEDURE                                  ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
vl_request           BYTE                                  !
BRW1::View:Browse    VIEW(ApPaketH)
                       PROJECT(APP2:No)
                       PROJECT(APP2:Keterangan)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APP2:No                LIKE(APP2:No)                  !List box control field - type derived from field
APP2:Keterangan        LIKE(APP2:Keterangan)          !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(ApPaketD)
                       PROJECT(APP21:No)
                       PROJECT(APP21:Kode_Barang)
                       PROJECT(APP21:Jumlah)
                       PROJECT(APP21:Jenis)
                       JOIN(GBAR:KeyKodeBrg,APP21:Kode_Barang)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
APP21:No               LIKE(APP21:No)                 !List box control field - type derived from field
APP21:Kode_Barang      LIKE(APP21:Kode_Barang)        !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
APP21:Jumlah           LIKE(APP21:Jumlah)             !List box control field - type derived from field
APP21:Jenis            LIKE(APP21:Jenis)              !List box control field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Paket'),AT(,,402,279),FONT('Arial',8,,),CENTER,IMM,HLP('BrowsePaketObat'),SYSTEM,GRAY,MDI
                       LIST,AT(3,5,395,124),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('64R(2)|M~No~C(0)@n-14@80L(2)|M~Keterangan~@s30@'),FROM(Queue:Browse:1)
                       BUTTON('&Tambah'),AT(70,133,45,14),USE(?Insert:2)
                       BUTTON('&Ubah'),AT(119,133,45,14),USE(?Change:2),DEFAULT
                       BUTTON('&Hapus'),AT(168,133,45,14),USE(?Delete:2)
                       LIST,AT(3,151,395,108),USE(?List),IMM,MSG('Browsing Records'),FORMAT('56R|M~No~L@n-14@45R|M~Kode Barang~L@s10@160L|M~Nama Obat~@s40@40D|M~Jumlah~L@n10' &|
   '@12L|M~Jenis~@n3@'),FROM(Queue:Browse)
                       BUTTON('&1. Tambah'),AT(70,263,45,14),USE(?Insert)
                       BUTTON('&2. Ubah'),AT(119,263,45,14),USE(?Change)
                       BUTTON('&3. Hapus'),AT(168,263,45,14),USE(?Delete)
                       BUTTON('&Selesai'),AT(351,263,45,14),USE(?Close)
                       STRING('Jenis : (1) Campur (0) Non Campur'),AT(238,267),USE(?String1)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
SetAlerts              PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW5                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
                     END

BRW5::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::EIPManager     BrowseEIPManager                      ! Browse EIP Manager for Browse using ?Browse:1
BRW5::EIPManager     BrowseEIPManager                      ! Browse EIP Manager for Browse using ?List
EditInPlace::APP21:Kode_Barang CLASS(EditEntryClass)       ! Edit-in-place class for field APP21:Kode_Barang
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED ! Method added to host embed code
TakeEvent              PROCEDURE(UNSIGNED Event),BYTE,DERIVED ! Method added to host embed code
                     END

EditInPlace::APP21:Harga CLASS(EditEntryClass)             ! Edit-in-place class for field APP21:Jenis
Init                   PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar),DERIVED ! Method added to host embed code
                     END

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
  GlobalErrors.SetProcedureName('BrowsePaketObat')
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
  Relate:ApPaketD.SetOpenRelated()
  Relate:ApPaketD.Open                                     ! File GStockGdg used by this procedure, so make sure it's RelationManager is open
  Relate:GStockGdg.Open                                    ! File GStockGdg used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:ApPaketH,SELF) ! Initialize the browse manager
  BRW5.Init(?List,Queue:Browse.ViewPosition,BRW5::View:Browse,Queue:Browse,Relate:ApPaketD,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,APP2:PrimaryKey)                      ! Add the sort order for APP2:PrimaryKey for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,APP2:No,1,BRW1)                ! Initialize the browse locator using  using key: APP2:PrimaryKey , APP2:No
  BRW1.AddField(APP2:No,BRW1.Q.APP2:No)                    ! Field APP2:No is a hot field or requires assignment from browse
  BRW1.AddField(APP2:Keterangan,BRW1.Q.APP2:Keterangan)    ! Field APP2:Keterangan is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse
  BRW5.AddSortOrder(,APP21:PrimaryKey)                     ! Add the sort order for APP21:PrimaryKey for sort order 1
  BRW5.AddRange(APP21:No,Relate:ApPaketD,Relate:ApPaketH)  ! Add file relationship range limit for sort order 1
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort0:Locator.Init(,APP21:Kode_Barang,1,BRW5)      ! Initialize the browse locator using  using key: APP21:PrimaryKey , APP21:Kode_Barang
  BRW5.AddField(APP21:No,BRW5.Q.APP21:No)                  ! Field APP21:No is a hot field or requires assignment from browse
  BRW5.AddField(APP21:Kode_Barang,BRW5.Q.APP21:Kode_Barang) ! Field APP21:Kode_Barang is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Nama_Brg,BRW5.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW5.AddField(APP21:Jumlah,BRW5.Q.APP21:Jumlah)          ! Field APP21:Jumlah is a hot field or requires assignment from browse
  BRW5.AddField(APP21:Jenis,BRW5.Q.APP21:Jenis)            ! Field APP21:Jenis is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Kode_brg,BRW5.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowsePaketObat',QuickWindow)              ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
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
    Relate:ApPaketD.Close
    Relate:GStockGdg.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowsePaketObat',QuickWindow)           ! Save window data to non-volatile store
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
    CASE ACCEPTED()
    OF ?Insert
      vl_request=1
      display
    OF ?Change
      vl_request=0
      display
    OF ?Delete
      vl_request=0
      display
    END
  ReturnValue = PARENT.TakeAccepted()
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
  SELF.EIP &= BRW1::EIPManager                             ! Set the EIP manager
  SELF.AddEditControl(,1) ! APP2:No Disable
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


BRW5.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW5.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  SELF.EIP &= BRW5::EIPManager                             ! Set the EIP manager
  SELF.AddEditControl(,1) ! APP21:No Disable
  SELF.AddEditControl(EditInPlace::APP21:Kode_Barang,2)
  SELF.AddEditControl(,3) ! GBAR:Nama_Brg Disable
  SELF.AddEditControl(EditInPlace::APP21:Harga,5)
  SELF.DeleteAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Default+EIPAction:Remain+EIPAction:RetainColumn
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


EditInPlace::APP21:Kode_Barang.Init PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)

feq long(0)
  CODE
  !edit in place init after parent call
  !Create Calllookup control on browse to replace entry control on edit-in-place.
  SELF.Feq = CREATE(0,CREATE:Entry)
  ASSERT(~ERRORCODE())
  SELF.Feq{PROP:Text}   = ListBox{PROPLIST:Picture,FieldNumber}
  SELF.Feq{PROP:Use}    = UseVar
  SELF.Feq{PROP:IMM}    = 1
  SELF.Feq{PROP:Tip}    = 'Klik dua kali untuk lihat tabel buyer order'
  SELF.Feq{PROP:Alrt,1} = TabKey
  SELF.Feq{PROP:Alrt,2} = ShiftTab
  SELF.Feq{PROP:Alrt,3} = EnterKey
  SELF.Feq{PROP:Alrt,4} = EscKey
  SELF.Feq{PROP:Alrt,5} = F10Key
  SELF.Feq{PROP:Alrt,6} = mouseleft2
  RETURN   !Return before default PARENT.Init code executes.
  PARENT.Init(FieldNumber,ListBox,UseVar)


EditInPlace::APP21:Kode_Barang.TakeEvent PROCEDURE(UNSIGNED Event)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeEvent(Event)
  CASE EVENT()
    OF EVENT:AlertKey
        case keycode()
        of F10Key orof mouseleft2
            ThisWindow.Update
            GlobalRequest  = SelectRecord
            SelectBarang
            ThisWindow.Response = GlobalResponse
            IF ThisWindow.Response = RequestCompleted
               APP21:Kode_Barang=GBAR:Kode_brg
               display         
               SELF.Feq{PROP:ScreenText} = format(GBAR:Kode_brg,@s10)
               update(SELF.Feq{PROP:Use})
            END
            ThisWindow.Request = ThisWindow.OriginalRequest
       !     presskey(tabkey)
        end
    END
  RETURN ReturnValue


EditInPlace::APP21:Harga.Init PROCEDURE(UNSIGNED FieldNumber,UNSIGNED ListBox,*? UseVar)

feq long(0)
  CODE
  PARENT.Init(FieldNumber,ListBox,UseVar)
  !edit in place init after parent call
  !Create Calllookup control on browse to replace entry control on edit-in-place.
  SELF.Feq = CREATE(0,CREATE:Entry)
  ASSERT(~ERRORCODE())
  SELF.Feq{PROP:Text}   = ListBox{PROPLIST:Picture,FieldNumber}
  SELF.Feq{PROP:Use}    = UseVar
  SELF.Feq{PROP:IMM}    = 1
  SELF.Feq{PROP:Tip}    = 'Klik dua kali untuk lihat tabel buyer order'
  SELF.Feq{PROP:Alrt,1} = TabKey
  SELF.Feq{PROP:Alrt,2} = ShiftTab
  SELF.Feq{PROP:Alrt,3} = EnterKey
  SELF.Feq{PROP:Alrt,4} = EscKey
  SELF.Feq{PROP:Alrt,5} = F10Key
  SELF.Feq{PROP:Alrt,6} = mouseleft2
  RETURN   !Return before default PARENT.Init code executes.


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

Lihat_Rubah_Satuan_Brg PROCEDURE                           ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(GSatuan)
                       PROJECT(GSAT:No_Satuan)
                       PROJECT(GSAT:Nama_Satuan)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GSAT:No_Satuan         LIKE(GSAT:No_Satuan)           !List box control field - type derived from field
GSAT:Nama_Satuan       LIKE(GSAT:Nama_Satuan)         !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Satuan Barang'),AT(,,182,183),FONT('Arial',8,,),CENTER,IMM,HLP('BrowseSatuan'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,165,124),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('32L(2)|M~Satuan~@s5@40L(2)|M~Nama Satuan~@s10@'),FROM(Queue:Browse:1)
                       BUTTON('&Tambah'),AT(8,150,60,14),USE(?Insert:3),LEFT,FONT('Arial',8,COLOR:Black,FONT:bold+FONT:italic),TIP('Klik Disini Untuk Menambah Data Satuan'),ICON('INSERT.ICO')
                       BUTTON('&Ubah'),AT(72,150,47,14),USE(?Change:3),LEFT,FONT('Arial',8,COLOR:Black,FONT:bold+FONT:italic),TIP('Klik Disini Untuk Merubah Data Satuan'),ICON('CHANGEPG.ICO'),DEFAULT
                       BUTTON('&Hapus'),AT(123,150,53,14),USE(?Delete:3),LEFT,FONT('Arial',8,COLOR:Black,FONT:bold+FONT:italic),TIP('Klik Disini Untuk Menghapus Data Satuan'),ICON('DELETE.ICO')
                       SHEET,AT(4,4,176,162),USE(?CurrentTab)
                         TAB('Satuan'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Keluar'),AT(124,167,55,14),USE(?Close),LEFT,FONT('Arial',8,,FONT:bold+FONT:italic),TIP('Klik Disini Untuk KeluarDari Menu Satuan'),ICON('EXIT5.ICO')
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
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - Choice(?CurrentTab)=2
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
  GlobalErrors.SetProcedureName('Lihat_Rubah_Satuan_Brg')
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
  Relate:GSatuan.Open                                      ! File GSatuan used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GSatuan,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,GSAT:Key_Nama_Satuan)                 ! Add the sort order for GSAT:Key_Nama_Satuan for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,GSAT:Nama_Satuan,1,BRW1)       ! Initialize the browse locator using  using key: GSAT:Key_Nama_Satuan , GSAT:Nama_Satuan
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon GSAT:No_Satuan for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,GSAT:Key_No_Satuan) ! Add the sort order for GSAT:Key_No_Satuan for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,GSAT:No_Satuan,1,BRW1)         ! Initialize the browse locator using  using key: GSAT:Key_No_Satuan , GSAT:No_Satuan
  BRW1.AddField(GSAT:No_Satuan,BRW1.Q.GSAT:No_Satuan)      ! Field GSAT:No_Satuan is a hot field or requires assignment from browse
  BRW1.AddField(GSAT:Nama_Satuan,BRW1.Q.GSAT:Nama_Satuan)  ! Field GSAT:Nama_Satuan is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Lihat_Rubah_Satuan_Brg',QuickWindow)       ! Restore window settings from non-volatile store
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
    Relate:GSatuan.Close
  END
  IF SELF.Opened
    INIMgr.Update('Lihat_Rubah_Satuan_Brg',QuickWindow)    ! Save window data to non-volatile store
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
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END


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

