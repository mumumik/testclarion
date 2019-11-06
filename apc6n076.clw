

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N076.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N005.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N006.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N007.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N008.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N051.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N060.INC'),ONCE        !Req'd for module callout resolution
                     END


SelectJTBayar PROCEDURE                                    ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(JTBayar)
                       PROJECT(JTBA:Nomor_Mr)
                       PROJECT(JTBA:NoNota)
                       PROJECT(JTBA:Pengirim)
                       PROJECT(JTBA:Kode)
                       PROJECT(JTBA:Dokter)
                       PROJECT(JTBA:NoBukti)
                       PROJECT(JTBA:BiayaRSI)
                       PROJECT(JTBA:BiayaDokter)
                       PROJECT(JTBA:Biaya)
                       PROJECT(JTBA:Tanggal)
                       PROJECT(JTBA:Tempat)
                       PROJECT(JTBA:Transaksi)
                       PROJECT(JTBA:Lantai)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
JTBA:Nomor_Mr          LIKE(JTBA:Nomor_Mr)            !List box control field - type derived from field
JTBA:NoNota            LIKE(JTBA:NoNota)              !List box control field - type derived from field
JTBA:Pengirim          LIKE(JTBA:Pengirim)            !List box control field - type derived from field
JTBA:Kode              LIKE(JTBA:Kode)                !List box control field - type derived from field
JTBA:Dokter            LIKE(JTBA:Dokter)              !List box control field - type derived from field
JTBA:NoBukti           LIKE(JTBA:NoBukti)             !List box control field - type derived from field
JTBA:BiayaRSI          LIKE(JTBA:BiayaRSI)            !List box control field - type derived from field
JTBA:BiayaDokter       LIKE(JTBA:BiayaDokter)         !List box control field - type derived from field
JTBA:Biaya             LIKE(JTBA:Biaya)               !List box control field - type derived from field
JTBA:Tanggal           LIKE(JTBA:Tanggal)             !Browse key field - type derived from field
JTBA:Tempat            LIKE(JTBA:Tempat)              !Browse key field - type derived from field
JTBA:Transaksi         LIKE(JTBA:Transaksi)           !Browse key field - type derived from field
JTBA:Lantai            LIKE(JTBA:Lantai)              !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a JTBayar Record'),AT(,,358,198),FONT('MS Sans Serif',8,COLOR:Black,),IMM,HLP('SelectJTBayar'),SYSTEM,GRAY,RESIZE,MDI
                       LIST,AT(8,30,342,124),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('44R(2)|M~Nomor Mr~C(0)@N10@44L(2)|M~No Nota~L(2)@s10@44L(2)|M~Pengirim~L(2)@s10@' &|
   '44L(2)|M~Kode~L(2)@s10@44L(2)|M~Dokter~L(2)@s10@44L(2)|M~No Bukti~L(2)@s10@60D(1' &|
   '8)|M~Biaya RSI~C(0)@n14.2@60D(12)|M~Biaya Dokter~C(0)@n14.2@60D(26)|M~Biaya~C(0)' &|
   '@n14.2@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(305,158,45,14),USE(?Select:2)
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('JTBA:KeyNomorMr'),USE(?Tab:2)
                         END
                         TAB('JTBA:KeyNoBukti'),USE(?Tab:3)
                         END
                         TAB('JTBA:KeyKlinik'),USE(?Tab:4)
                         END
                         TAB('JTBA:KeyDokter'),USE(?Tab:5)
                         END
                         TAB('JTBA:KeyTanggal'),USE(?Tab:6)
                         END
                         TAB('JTBA:KeyNoNota'),USE(?Tab:7)
                         END
                         TAB('JTBA:KeyTempat'),USE(?Tab:8)
                         END
                         TAB('JTBA:KeyTransaksi'),USE(?Tab:9)
                         END
                         TAB('JTBA:KeyKodeDokter'),USE(?Tab:10)
                         END
                         TAB('JTBA:KeyLantai'),USE(?Tab:11)
                         END
                       END
                       BUTTON('Close'),AT(260,180,45,14),USE(?Close)
                       BUTTON('Help'),AT(309,180,45,14),USE(?Help),STD(STD:Help)
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
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
BRW1::Sort5:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 6
BRW1::Sort6:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 7
BRW1::Sort7:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 8
BRW1::Sort8:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 9
BRW1::Sort9:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 10
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
  GlobalErrors.SetProcedureName('SelectJTBayar')
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
  Relate:JTBayar.Open                                      ! File JTBayar used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:JTBayar,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,JTBA:KeyNoBukti)                      ! Add the sort order for JTBA:KeyNoBukti for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,JTBA:NoBukti,,BRW1)            ! Initialize the browse locator using  using key: JTBA:KeyNoBukti , JTBA:NoBukti
  BRW1.AddSortOrder(,JTBA:KeyKlinik)                       ! Add the sort order for JTBA:KeyKlinik for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,JTBA:Kode,1,BRW1)              ! Initialize the browse locator using  using key: JTBA:KeyKlinik , JTBA:Kode
  BRW1.AddSortOrder(,JTBA:KeyDokter)                       ! Add the sort order for JTBA:KeyDokter for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,JTBA:Dokter,1,BRW1)            ! Initialize the browse locator using  using key: JTBA:KeyDokter , JTBA:Dokter
  BRW1.AddSortOrder(,JTBA:KeyTanggal)                      ! Add the sort order for JTBA:KeyTanggal for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,JTBA:Tanggal,1,BRW1)           ! Initialize the browse locator using  using key: JTBA:KeyTanggal , JTBA:Tanggal
  BRW1.AddSortOrder(,JTBA:KeyNoNota)                       ! Add the sort order for JTBA:KeyNoNota for sort order 5
  BRW1.AddLocator(BRW1::Sort5:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort5:Locator.Init(,JTBA:NoNota,,BRW1)             ! Initialize the browse locator using  using key: JTBA:KeyNoNota , JTBA:NoNota
  BRW1.AddSortOrder(,JTBA:KeyTempat)                       ! Add the sort order for JTBA:KeyTempat for sort order 6
  BRW1.AddLocator(BRW1::Sort6:Locator)                     ! Browse has a locator for sort order 6
  BRW1::Sort6:Locator.Init(,JTBA:Tempat,1,BRW1)            ! Initialize the browse locator using  using key: JTBA:KeyTempat , JTBA:Tempat
  BRW1.AddSortOrder(,JTBA:KeyTransaksi)                    ! Add the sort order for JTBA:KeyTransaksi for sort order 7
  BRW1.AddLocator(BRW1::Sort7:Locator)                     ! Browse has a locator for sort order 7
  BRW1::Sort7:Locator.Init(,JTBA:Transaksi,1,BRW1)         ! Initialize the browse locator using  using key: JTBA:KeyTransaksi , JTBA:Transaksi
  BRW1.AddSortOrder(,JTBA:KeyKodeDokter)                   ! Add the sort order for JTBA:KeyKodeDokter for sort order 8
  BRW1.AddLocator(BRW1::Sort8:Locator)                     ! Browse has a locator for sort order 8
  BRW1::Sort8:Locator.Init(,JTBA:Dokter,1,BRW1)            ! Initialize the browse locator using  using key: JTBA:KeyKodeDokter , JTBA:Dokter
  BRW1.AddSortOrder(,JTBA:KeyLantai)                       ! Add the sort order for JTBA:KeyLantai for sort order 9
  BRW1.AddLocator(BRW1::Sort9:Locator)                     ! Browse has a locator for sort order 9
  BRW1::Sort9:Locator.Init(,JTBA:Lantai,1,BRW1)            ! Initialize the browse locator using  using key: JTBA:KeyLantai , JTBA:Lantai
  BRW1.AddSortOrder(,JTBA:KeyNomorMr)                      ! Add the sort order for JTBA:KeyNomorMr for sort order 10
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 10
  BRW1::Sort0:Locator.Init(,JTBA:Nomor_Mr,1,BRW1)          ! Initialize the browse locator using  using key: JTBA:KeyNomorMr , JTBA:Nomor_Mr
  BRW1.AddField(JTBA:Nomor_Mr,BRW1.Q.JTBA:Nomor_Mr)        ! Field JTBA:Nomor_Mr is a hot field or requires assignment from browse
  BRW1.AddField(JTBA:NoNota,BRW1.Q.JTBA:NoNota)            ! Field JTBA:NoNota is a hot field or requires assignment from browse
  BRW1.AddField(JTBA:Pengirim,BRW1.Q.JTBA:Pengirim)        ! Field JTBA:Pengirim is a hot field or requires assignment from browse
  BRW1.AddField(JTBA:Kode,BRW1.Q.JTBA:Kode)                ! Field JTBA:Kode is a hot field or requires assignment from browse
  BRW1.AddField(JTBA:Dokter,BRW1.Q.JTBA:Dokter)            ! Field JTBA:Dokter is a hot field or requires assignment from browse
  BRW1.AddField(JTBA:NoBukti,BRW1.Q.JTBA:NoBukti)          ! Field JTBA:NoBukti is a hot field or requires assignment from browse
  BRW1.AddField(JTBA:BiayaRSI,BRW1.Q.JTBA:BiayaRSI)        ! Field JTBA:BiayaRSI is a hot field or requires assignment from browse
  BRW1.AddField(JTBA:BiayaDokter,BRW1.Q.JTBA:BiayaDokter)  ! Field JTBA:BiayaDokter is a hot field or requires assignment from browse
  BRW1.AddField(JTBA:Biaya,BRW1.Q.JTBA:Biaya)              ! Field JTBA:Biaya is a hot field or requires assignment from browse
  BRW1.AddField(JTBA:Tanggal,BRW1.Q.JTBA:Tanggal)          ! Field JTBA:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(JTBA:Tempat,BRW1.Q.JTBA:Tempat)            ! Field JTBA:Tempat is a hot field or requires assignment from browse
  BRW1.AddField(JTBA:Transaksi,BRW1.Q.JTBA:Transaksi)      ! Field JTBA:Transaksi is a hot field or requires assignment from browse
  BRW1.AddField(JTBA:Lantai,BRW1.Q.JTBA:Lantai)            ! Field JTBA:Lantai is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectJTBayar',QuickWindow)                ! Restore window settings from non-volatile store
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
    Relate:JTBayar.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectJTBayar',QuickWindow)             ! Save window data to non-volatile store
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
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSIF CHOICE(?CurrentTab) = 5
    RETURN SELF.SetSort(4,Force)
  ELSIF CHOICE(?CurrentTab) = 6
    RETURN SELF.SetSort(5,Force)
  ELSIF CHOICE(?CurrentTab) = 7
    RETURN SELF.SetSort(6,Force)
  ELSIF CHOICE(?CurrentTab) = 8
    RETURN SELF.SetSort(7,Force)
  ELSIF CHOICE(?CurrentTab) = 9
    RETURN SELF.SetSort(8,Force)
  ELSIF CHOICE(?CurrentTab) = 10
    RETURN SELF.SetSort(9,Force)
  ELSE
    RETURN SELF.SetSort(10,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

Trgi_UpdateReturRawatInapDetil1 PROCEDURE                  ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
loc::total           REAL                                  !
loc::diskon_pct      REAL                                  !
VIEW::stok_apotik VIEW(GStokAptk)
    Project (GSTO:Kode_Apotik)
    end
History::APD:Record  LIKE(APD:RECORD),THREAD
QuickWindow          WINDOW('Tambah Data Transaksi'),AT(,,207,154),FONT('MS Sans Serif',10,COLOR:Black,),IMM,HLP('UpdateAPDTRANS'),SYSTEM,GRAY,RESIZE,MDI
                       SHEET,AT(4,4,201,116),USE(?CurrentTab),COLOR(0D1C130H)
                         TAB('Data'),USE(?Tab:1)
                           STRING('BARU'),AT(32,5),USE(?String2),TRN,FONT(,,COLOR:Yellow,FONT:bold)
                           PROMPT('N0 tran:'),AT(84,2),USE(?APD:N0_tran:Prompt),TRN
                           ENTRY(@s15),AT(111,2,48,10),USE(APD:N0_tran),MSG('nomor transaksi'),TIP('nomor transaksi'),READONLY
                           PROMPT('Kode Barang:'),AT(8,20),USE(?APD:Kode_brg:Prompt)
                           ENTRY(@s10),AT(60,20,44,10),USE(APD:Kode_brg),SKIP,MSG('Kode Barang'),TIP('Kode Barang'),READONLY
                           BUTTON('&K'),AT(110,19,12,12),USE(?CallLookup),KEY(F2Key)
                           PROMPT('Nama Barang'),AT(8,35),USE(?Prompt4)
                           STRING(@s40),AT(60,35),USE(GBAR:Nama_Brg)
                           PROMPT('Jumlah:'),AT(8,48),USE(?APD:Jumlah:Prompt)
                           ENTRY(@n15.2),AT(61,48,48,10),USE(APD:Jumlah),RIGHT,MSG('Jumlah'),TIP('Jumlah')
                           PROMPT('Harga :'),AT(8,64),USE(?APD:Total:Prompt)
                           ENTRY(@n-15.2),AT(61,64,48,10),USE(APD:Total),RIGHT,MSG('Harga Dasar'),TIP('Harga Dasar'),READONLY
                           PROMPT('Diskon:'),AT(8,80),USE(?APD:Diskon:Prompt)
                           PROMPT('%'),AT(54,80),USE(?loc::diskon_pct:Prompt)
                           ENTRY(@n-10.2),AT(33,80,20,10),USE(loc::diskon_pct),RIGHT(2)
                           ENTRY(@n-15.2),AT(61,80,48,10),USE(APD:Diskon),RIGHT
                           PROMPT('Total:'),AT(8,96),USE(?loc::total:Prompt)
                           ENTRY(@n-15.2),AT(61,96,48,10),USE(loc::total),RIGHT,READONLY
                         END
                       END
                       BUTTON('&OK [End]'),AT(36,127,59,24),USE(?OK),LEFT,KEY(EndKey),ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(116,127,59,24),USE(?Cancel),LEFT,ICON(ICON:Cross)
                       BUTTON('Help'),AT(157,1,45,14),USE(?Help),HIDE,STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
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
    ActionMessage = 'Adding a APDTRANS Record'
  OF ChangeRecord
    ActionMessage = 'Changing a APDTRANS Record'
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  ?OK{PROP:DISABLE}=TRUE
  ?APD:Total{PROP:READONLY}=TRUE
  if APD:Diskon<>0 then
     loc::diskon_pct=(APD:Diskon*100)/APD:Total
  end
  loc::total=APD:Total-APD:Diskon
  DISPLAY
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trgi_UpdateReturRawatInapDetil1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?String2
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APD:Record,History::APD:Record)
  SELF.AddHistoryField(?APD:N0_tran,1)
  SELF.AddHistoryField(?APD:Kode_brg,2)
  SELF.AddHistoryField(?APD:Jumlah,3)
  SELF.AddHistoryField(?APD:Total,4)
  SELF.AddHistoryField(?APD:Diskon,7)
  SELF.AddUpdateFile(Access:APDTRANS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:APDTRANS.Open                                     ! File APkemtmp used by this procedure, so make sure it's RelationManager is open
  Relate:APkemtmp.Open                                     ! File APkemtmp used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:APDTRANS
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
  INIMgr.Fetch('Trgi_UpdateReturRawatInapDetil1',QuickWindow) ! Restore window settings from non-volatile store
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
    Relate:APDTRANS.Close
    Relate:APkemtmp.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trgi_UpdateReturRawatInapDetil1',QuickWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
    APD:Diskon = 0
  PARENT.PrimeFields


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
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
    CASE ACCEPTED()
    OF ?APD:Kode_brg
      APKT:Kode_brg=APD:Kode_brg
      APKT:Nomor_mr=Glo::no_mr
      GET(APkemtmp,APKT:key_no_mr)
      IF ERRORCODE() = 35
          MESSAGE('Barang tidak ada Dalam daftar Pengeluaran')
          ?APD:Jumlah{PROP:DISABLE}=1
          CLEAR (APD:Kode_brg )
          CLEAR (GBAR:Nama_Brg)
          DISPLAY
          SELECT(?APD:Kode_brg)
      ELSE
          ?APD:Jumlah{PROP:DISABLE}=0
      END
    OF ?APD:Jumlah
      IF APD:Jumlah = 0
          ?OK{PROP:DISABLE}=1
      ELSE
          !message(APD:Jumlah&' '&(APKT:Jumlah*-1)&' '&APKT:Jumlah)
          IF APD:Jumlah >(APKT:Jumlah)
              !message(APD:Jumlah&' aaa '&(APKT:Jumlah))
              MESSAGE ('Jumlah Pengembalian maximum : '&APKT:Jumlah )
              ?OK{PROP:DISABLE}=1
          ELSE
              ?OK{PROP:DISABLE}=0
          END
      END
      APD:Harga_Dasar = abs(APKT:Harga_Dasar_benar)*-1
      APD:Total       = abs(APKT:Harga_Dasar)*APD:Jumlah*-1
      if APD:Diskon<>0 then
         loc::diskon_pct=(APD:Diskon*100)/APD:Total
         loc::total     =APD:Total-APD:Diskon
      else
         loc::total     =APD:Total
      end
      DISPLAY
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?APD:Kode_brg
      IF APD:Kode_brg OR ?APD:Kode_brg{Prop:Req}
        GBAR:Kode_brg = APD:Kode_brg
        IF Access:GBarang.TryFetch(GBAR:KeyKodeBrg)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            APD:Kode_brg = GBAR:Kode_brg
          ELSE
            SELECT(?APD:Kode_brg)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      GBAR:Kode_brg = APD:Kode_brg
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        APD:Kode_brg = GBAR:Kode_brg
      END
      ThisWindow.Reset(1)
      display
      APKT:Kode_brg=GBAR:Kode_brg
      APKT:Nomor_mr=Glo::no_mr
      GET(APkemtmp,APKT:key_no_mr)
      IF ERRORCODE() = 35
          MESSAGE('Barang tidak ada Dalam daftar Pengeluaran')
          ?APD:Jumlah{PROP:DISABLE}=1
          CLEAR (APD:Kode_brg )
          CLEAR (GBAR:Nama_Brg)
          DISPLAY
          SELECT(?APD:Kode_brg)
      ELSE
          ?APD:Jumlah{PROP:DISABLE}=0
      END
    OF ?loc::diskon_pct
      if loc::diskon_pct<>0 then
         APD:Diskon=(APD:Total*loc::diskon_pct)/100
         loc::total=APD:Total-APD:Diskon
      else
         loc::total=APD:Total
      end
      DISPLAY
    OF ?APD:Diskon
      if APD:Diskon<>0 then
         loc::diskon_pct=(APD:Diskon*100)/APD:Total
         loc::total=APD:Total-APD:Diskon
      else
         loc::total=APD:Total
      end
      DISPLAY
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

Trig_UpdateRawatJalanNew PROCEDURE                         ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
vl_round             REAL                                  !
vl_no_urut           LONG                                  !
vl_sudah             BYTE                                  !
vl_nomor             STRING(15)                            !
masuk_disc           BYTE                                  !
sudah_nomor          BYTE                                  !
Loc::delete          BYTE                                  !
Tahun_ini            LONG                                  !
loc::copy_total      LONG                                  !Total Biaya Pembelian
loc::camp            BYTE                                  !
Loc::SavPoint        LONG                                  !
putar                ULONG                                 !
CEK_RUN              BYTE                                  !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
discount             LONG                                  !
pers_disc            LONG                                  !
LOC::TOTAL           LONG                                  !
Hitung_campur        BYTE                                  !
loc::nama            STRING(20)                            !
loc::alamat          STRING(35)                            !
loc::RT              BYTE                                  !
loc::rw              BYTE                                  !
loc::kota            STRING(20)                            !
vl_real              REAL                                  !
vl_hasil             REAL                                  !
vl_seribu            REAL                                  !
vl_selisih           REAL                                  !
loc:tgl              DATE                                  !
loc:temth2           USHORT                                !
loc:bl2              USHORT                                !
loc:bls2             STRING(20)                            !
loc:th22             STRING(20)                            !
loc:th32             STRING(20)                            !
loc:nums2            STRING(20)                            !
loc:nomor            STRING(20)                            !
BRW4::View:Browse    VIEW(APDTRANS)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Total)
                       PROJECT(APD:Diskon)
                       PROJECT(APD:Camp)
                       PROJECT(APD:N0_tran)
                       JOIN(GBAR:KeyKodeBrg,APD:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse:4       QUEUE                            !Queue declaration for browse/combo box using ?Browse:4
APD:Kode_brg           LIKE(APD:Kode_brg)             !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
APD:Jumlah             LIKE(APD:Jumlah)               !List box control field - type derived from field
APD:Total              LIKE(APD:Total)                !List box control field - type derived from field
APD:Diskon             LIKE(APD:Diskon)               !List box control field - type derived from field
APD:Camp               LIKE(APD:Camp)                 !List box control field - type derived from field
APD:N0_tran            LIKE(APD:N0_tran)              !List box control field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::APH:Record  LIKE(APH:RECORD),THREAD
QuickWindow          WINDOW('Transaksi Instalasi Farmasi - Rawat Jalan'),AT(,,456,256),FONT('Times New Roman',8,COLOR:Black,),CENTER,IMM,HLP('UpdateAPHTRANS'),ALRT(EscKey),TIMER(100),GRAY,RESIZE,MDI
                       BUTTON('&Tambah Obat (+)'),AT(5,193,139,19),USE(?Insert:5),FONT('Times New Roman',10,,FONT:bold),KEY(PlusKey)
                       SHEET,AT(2,5,452,112),USE(?CurrentTab)
                         TAB('Poliklinik (F5)'),USE(?Tab:1),KEY(F5Key),FONT('Times New Roman',10,,)
                           ENTRY(@s20),AT(139,23,58,16),USE(loc:nomor)
                           ENTRY(@N10),AT(221,23,73,16),USE(APH:Nomor_mr),IMM,FONT('Times New Roman',16,,FONT:bold),MSG('Nomor Medical record pasien'),TIP('Nomor KIUP')
                           PROMPT('RM :'),AT(199,25),USE(?APH:Nomor_mr:Prompt),FONT('Times New Roman',10,,FONT:bold)
                           OPTION('Status Pembayaran'),AT(6,19,95,49),USE(status),BOXED,FONT('Times New Roman',12,COLOR:Navy,)
                             RADIO('&Gratis / Pegawai'),AT(8,30),USE(?Option1:Radio1),FONT('Times New Roman',10,COLOR:Green,FONT:bold),VALUE('1')
                             RADIO('&Tunai'),AT(8,42),USE(?Option1:Radio3),FONT('Times New Roman',10,COLOR:Black,),VALUE('2')
                             RADIO('&KONTRAKTOR'),AT(8,52,91,13),USE(?Option1:Radio2),FONT('Times New Roman',12,COLOR:Red,FONT:bold),VALUE('3')
                           END
                           ENTRY(@s10),AT(324,23,49,16),USE(APH:Asal),FONT('Times New Roman',14,,),MSG('Kode Poliklinik'),TIP('Kode Poliklinik')
                           BUTTON('&P (F3)'),AT(374,22,26,16),USE(?CallLookup),KEY(F3Key)
                           PROMPT('Nama  :'),AT(112,43),USE(?Prompt5)
                           ENTRY(@s35),AT(142,43,93,10),USE(JPas:Nama),DISABLE,FONT(,,,FONT:bold),HLP('Nama mendahului gelar'),MSG('Nama pasien'),REQ,CAP
                           ENTRY(@s35),AT(239,42,97,10),USE(loc::nama,,?loc::nama:2)
                           PROMPT('Alamat :'),AT(109,57),USE(?Prompt6)
                           ENTRY(@s35),AT(142,57,93,10),USE(JPas:Alamat),DISABLE,HLP('contoh : Kopo Jl'),MSG('Alamat Pasien'),CAP
                           ENTRY(@s35),AT(239,57,97,10),USE(loc::alamat,,?loc::alamat:2)
                           PROMPT('Kota :'),AT(341,57),USE(?APH:NoNota:Prompt:2)
                           PROMPT('NIP:'),AT(8,72),USE(?APH:NIP:Prompt)
                           ENTRY(@s7),AT(24,72,45,10),USE(APH:NIP),DISABLE
                           BUTTON('F4'),AT(73,72,19,10),USE(?Button10),DISABLE
                           ENTRY(@s40),AT(24,85,112,10),USE(PEGA:Nama),DISABLE
                           PROMPT('Kontraktor:'),AT(141,72),USE(?APH:Kontraktor:Prompt)
                           ENTRY(@s10),AT(185,72,55,10),USE(APH:Kontrak),DISABLE
                           BUTTON('F5'),AT(243,72,19,10),USE(?Button11),DISABLE
                           ENTRY(@s100),AT(264,72,132,10),USE(JKon:NAMA_KTR),DISABLE
                           BUTTON('F7'),AT(403,71,19,10),USE(?CallLookup:3),KEY(F7Key)
                           ENTRY(@s10),AT(191,26,12,10),USE(APH:NoNota),DISABLE,HIDE,REQ
                           ENTRY(@s20),AT(367,57,69,10),USE(loc::kota,,?loc::kota:2)
                           PROMPT('Dokter:'),AT(141,85),USE(?APH:dokter:Prompt)
                           ENTRY(@s5),AT(185,85,55,10),USE(APH:dokter),DISABLE
                           BUTTON('F7'),AT(243,85,19,10),USE(?CallLookup:2),KEY(F7Key)
                           ENTRY(@s30),AT(264,85,132,10),USE(JDok:Nama_Dokter),DISABLE,MSG('Nama Dokter'),TIP('Nama Dokter'),UPR
                           PROMPT('Pembeli Lgs:'),AT(15,102),USE(?JTra:NamaJawab:Prompt)
                           ENTRY(@s40),AT(65,102,87,10),USE(JTra:NamaJawab)
                           PROMPT('Alamat :'),AT(159,102),USE(?JTra:AlamatJawab:Prompt)
                           ENTRY(@s50),AT(194,102,110,10),USE(JTra:AlamatJawab)
                           PROMPT('No. Bill:'),AT(101,24),USE(?loc:nomor:Prompt),FONT('Times New Roman',12,,FONT:bold)
                           STRING(@s25),AT(402,26,47,10),USE(JPol:NAMA_POLI)
                           PROMPT('Asal:'),AT(293,23),USE(?APH:Asal:Prompt),FONT('Times New Roman',14,,)
                           BUTTON('F2'),AT(319,97,26,16),USE(?Button12),DISABLE,HIDE,KEY(F2Key)
                         END
                       END
                       PROMPT('Kode Apotik:'),AT(187,3,46,10),USE(?APH:Kode_Apotik:Prompt)
                       ENTRY(@s5),AT(237,3,39,10),USE(APH:Kode_Apotik),DISABLE,MSG('Kode Apotik'),TIP('Kode Apotik')
                       PROMPT('&TANGGAL:'),AT(284,3,37,10),USE(?APH:Tanggal:Prompt)
                       PROMPT('N0 tran:'),AT(7,217),USE(?APH:N0_tran:Prompt),FONT('Times New Roman',12,,FONT:bold+FONT:italic+FONT:underline)
                       ENTRY(@s15),AT(46,217,95,13),USE(APH:N0_tran),DISABLE,FONT('Arial',12,,FONT:bold),MSG('nomor transaksi'),TIP('nomor transaksi')
                       LINE,AT(279,233,163,0),USE(?Line1),COLOR(COLOR:Black),LINEWIDTH(2)
                       LIST,AT(7,120,440,69),USE(?Browse:4),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('47L(2)|FM~Kode Barang~L(0)@s10@163L(2)|M~Nama Obat~C(0)@s40@52R(2)|M~Jumlah~C(0)' &|
   '@n-12.2@53R(2)|M~Total~C(0)@n-13.2@60R(2)|M~Diskon~C(0)@n-15.2@27L|M~Camp~C@n2@6' &|
   '3L(2)|FM~N 0 tran~L(0)@s15@'),FROM(Queue:Browse:4)
                       PROMPT('Total :'),AT(285,240),USE(?APH:Biaya:Prompt),FONT('Times New Roman',14,,FONT:bold+FONT:italic)
                       ENTRY(@n-15.2),AT(345,239,97,14),USE(APH:Biaya),DISABLE,RIGHT(1),MSG('Total Biaya Pembelian'),TIP('Total Biaya Pembelian')
                       PANEL,AT(5,214,139,19),USE(?Panel2)
                       BUTTON('&OK (End)'),AT(205,193,45,35),USE(?OK),FONT('Times New Roman',10,,),KEY(EndKey),ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(153,193,45,35),USE(?Cancel),FONT('Times New Roman',12,,),ICON(ICON:Cross)
                       BUTTON('Pembulatan [-]'),AT(148,237,102,18),USE(?Button9),FONT('Times New Roman',10,,FONT:regular),KEY(MinusKey)
                       PROMPT('Sub Total'),AT(285,194),USE(?Prompt10),FONT('Times New Roman',12,,)
                       ENTRY(@n-15.2),AT(345,212,97,14),USE(discount),DISABLE
                       PROMPT('Diskon :'),AT(285,212),USE(?Prompt8),FONT('Times New Roman',12,,)
                       BUTTON('&Edit [Ctrl]'),AT(5,237,139,18),USE(?Change:5),FONT(,,COLOR:Blue,FONT:bold),KEY(529)
                       BUTTON('&Delete'),AT(403,0,45,14),USE(?Delete:5),HIDE
                       ENTRY(@n-15.2),AT(345,194,97,14),USE(LOC::TOTAL),DISABLE
                       ENTRY(@D8),AT(326,3,70,10),USE(APH:Tanggal),DISABLE,RIGHT(1),FONT('Times New Roman',12,,),MSG('Tanggal berobat pasen'),TIP('Tanggal berobat pasen')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
Reset                  PROCEDURE(BYTE Force=0),DERIVED     ! Method added to host embed code
Run                    PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Update                 PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW4                 CLASS(BrowseClass)                    ! Browse using ?Browse:4
Q                      &Queue:Browse:4                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetFromAsk           PROCEDURE(*BYTE Request,*BYTE Response),DERIVED ! Method added to host embed code
ResetFromView          PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW4::Sort0:StepClass StepStringClass                      ! Default Step Manager
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False) ! Method added to host embed code
                     END

view::jtrans view(filesql2)
                project(FIL1:Byte1,FIL1:Byte2,FIL1:String1,FIL1:String2,FIL1:String3,FIL1:String4,FIL1:String5)
             end
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
BATAL_D_UTAMA ROUTINE
    SET( BRW4::View:Browse)
    LOOP
        NEXT(BRW4::View:Browse)
        IF ERRORCODE() THEN BREAK.
        DELETE(BRW4::View:Browse)
    END

BATAL_D_DUA ROUTINE
    SET(APDTcam)
    APD1:N0_tran=glo::no_nota
    SET(APD1:by_tranno,APD1:by_tranno)
    LOOP
        IF Access:APDTcam.Next()<>Level:Benign OR APD1:N0_tran <> glo::no_nota THEN BREAK.
        DELETE( APDTcam)
    END

BATAL_Transaksi ROUTINE
    SET(APDTcam)
    APD1:N0_tran=glo::no_nota
    APD1:Camp=APD:Camp
    SET(APD1:by_tran_cam,APD1:by_tran_cam)
    LOOP
        IF Access:APDTcam.Next()<>Level:Benign OR APD1:Camp<>APD:Camp THEN BREAK.
        DELETE( APDTcam)
    END


!Proses Penomoran Otomatis Transaksi
Isi_Nomor Routine
   vl_nomor=''
   display
   loop
      logout(1,nomor_batal)
      if errorcode()=56 then
         cycle.
      !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
      NOM:No_Urut=3
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
         NOMU:Urut =3
         NOMU:Nomor=vl_nomor
         add(nomoruse)
         if errorcode()>0 then
            vl_nomor=''
            rollback
            cycle
         end
         delete(nomor_batal)
         commit
         if errorcode()>0 then
            vl_nomor=''
            display
            cycle
         end
      else
         vl_nomor=''
         display
         rollback
      end
      break
   end
   if vl_nomor='' then
      loop
        logout(1,nomor_skr,nomoruse)
        if errorcode()=56 then cycle.
        !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
        NOM1:No_urut=3
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
           NOMU:Urut =3
           NOMU:Nomor=vl_nomor
           add(nomoruse)
           if errorcode()>0 then
              rollback
              cycle
           end
           NOM1:No_Trans=sub(vl_nomor,1,7)&format(deformat(sub(vl_nomor,8,5),@n5)+1,@p#####p)
           put(nomor_skr)
           if errorcode()=90 then
              rollback
              cycle
           elsif errorcode()>0 then
              rollback
              cycle
           else
              commit
           end
        else
           rollback
           cycle
        end
        break
      end
   end
   if format(sub(vl_nomor,6,2),@n2)<>month(today()) then
      !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
      nomor_batal{prop:sql}='delete dba.nomor_batal where No=3'
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 3=Transaksi Apotik ke pasien Rawat Jalan
         NOM1:No_urut=3
         access:nomor_skr.fetch(NOM1:PrimaryKey)
         if not(errorcode()) then
            vl_nomor =NOM1:No_Trans
            NOM1:No_Trans=sub(vl_nomor,1,3)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'00002'
            access:nomor_skr.update()
            if errorcode()<>0 then
               rollback
               cycle
            else
               vl_nomor=sub(vl_nomor,1,3)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'00001'
               commit
            end
         end
         break
      end
   end
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   APH:N0_tran=vl_nomor
   display

Batal_Nomor Routine
   !Silahkan diganti ---> 3=Transaksi Apotik ke pasien Rawat Jalan
   NOM:No_Urut =3
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=APH:N0_tran
   NOM:Keterangan='Aptk R. Jalan'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 3=Transaksi Apotik ke pasien Rawat Jalan
   NOMU:Urut =3
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOMU:Nomor=APH:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   delete(nomoruse)

Hapus_Nomor_Use Routine
   NOMU:Urut =3
   NOMU:Nomor=APH:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   if errorcode()=0 then
      delete(nomoruse)
   end

!Proses Penomoran Otomatis Transaksi
Isi_Nomor1 Routine
   vl_nomor=''
   display
   loop
      logout(1,nomor_batal)
      if errorcode()=56 then
         cycle.
      !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
      NOM:No_Urut=vl_no_urut
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
         NOMU:Urut =vl_no_urut
         NOMU:Nomor=vl_nomor
         add(nomoruse)
         if errorcode()>0 then
            vl_nomor=''
            rollback
            cycle
         end
         delete(nomor_batal)
         commit
         if errorcode()>0 then
            vl_nomor=''
            display
            cycle
         end
      else
         vl_nomor=''
         display
         rollback
      end
      break
   end
   if vl_nomor='' then
      loop
        logout(1,nomor_skr,nomoruse)
        if errorcode()=56 then cycle.
        !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
        NOM1:No_urut=vl_no_urut
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
           NOMU:Urut =vl_no_urut
           NOMU:Nomor=vl_nomor
           add(nomoruse)
           if errorcode()>0 then
              rollback
              cycle
           end
           NOM1:No_Trans=sub(vl_nomor,1,8)&format(deformat(sub(vl_nomor,9,4),@n4)+1,@p####p)
           put(nomor_skr)
           if errorcode()=90 then
              rollback
              cycle
           elsif errorcode()>0 then
              rollback
              cycle
           else
              commit
           end
        else
           rollback
           cycle
        end
        break
      end
   end
   if format(sub(vl_nomor,7,2),@n2)<>month(today()) then
      !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
      nomor_batal{prop:sql}='delete dba.nomor_batal where No='&vl_no_urut
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 3=Transaksi Apotik ke pasien Rawat Jalan
         NOM1:No_urut=vl_no_urut
         access:nomor_skr.fetch(NOM1:PrimaryKey)
         if not(errorcode()) then
            vl_nomor =NOM1:No_Trans
            NOM1:No_Trans=sub(vl_nomor,1,4)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'0002'
            access:nomor_skr.update()
            if errorcode()<>0 then
               rollback
               cycle
            else
               vl_nomor=sub(vl_nomor,1,4)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'0001'
               commit
            end
         end
         break
      end
   end
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   APH:N0_tran=vl_nomor
   display

Batal_Nomor1 Routine
   !Silahkan diganti ---> 3=Transaksi Apotik ke pasien Rawat Jalan
   NOM:No_Urut =vl_no_urut
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=APH:N0_tran
   NOM:Keterangan='Aptk R. Jalan'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 3=Transaksi Apotik ke pasien Rawat Jalan
   NOMU:Urut =vl_no_urut
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOMU:Nomor=APH:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   delete(nomoruse)

Hapus_Nomor_Use1 Routine
   NOMU:Urut =vl_no_urut
   NOMU:Nomor=APH:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   if errorcode()=0 then
      delete(nomoruse)
   end

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    CLEAR(ActionMessage)
  OF ChangeRecord
    ActionMessage = 'Changing a APHTRANS Record'
  END
  status=2
  CLEAR(JPas:Nama)
  CLEAR(JPas:Alamat)
  CLEAR(JPol:Nama_poli)
  CLEAR(loc::nama)
  CLEAR(loc::alamat)
  CLEAR(loc::RT)
  CLEAR(loc::rw)
  CLEAR(loc::kota)
  CEK_RUN=0
  ?OK{PROP:DISABLE}=TRUE
  discount=0
  pers_disc=0
  ?BROWSE:4{PROP:DISABLE}=TRUE
  ?Insert:5{PROP:DISABLE}=TRUE
  Hitung_campur = 0
  sudah_nomor = 0
  masuk_disc = 0
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_UpdateRawatJalanNew')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Insert:5
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APH:Record,History::APH:Record)
  SELF.AddHistoryField(?APH:Nomor_mr,1)
  SELF.AddHistoryField(?APH:Asal,8)
  SELF.AddHistoryField(?APH:NIP,13)
  SELF.AddHistoryField(?APH:Kontrak,14)
  SELF.AddHistoryField(?APH:NoNota,17)
  SELF.AddHistoryField(?APH:dokter,16)
  SELF.AddHistoryField(?APH:Kode_Apotik,10)
  SELF.AddHistoryField(?APH:N0_tran,4)
  SELF.AddHistoryField(?APH:Biaya,3)
  SELF.AddHistoryField(?APH:Tanggal,2)
  SELF.AddUpdateFile(Access:APHTRANS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  case deformat(sub(clip(GL_entryapotik),3,2),@n2)
     of '01'
        vl_no_urut=22
     of '02'
        vl_no_urut=23
     of '04'
        vl_no_urut=24
     of '06'
        vl_no_urut=25
     of '07'
        vl_no_urut=26
     of '08'
        vl_no_urut=27
  END
  Relate:APDTRANS.Open                                     ! File FileSql2 used by this procedure, so make sure it's RelationManager is open
  Relate:APDTRANSDet.Open                                  ! File FileSql2 used by this procedure, so make sure it's RelationManager is open
  Relate:Ano_pakai.Open                                    ! File FileSql2 used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket.Open                                     ! File FileSql2 used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql.Open                                      ! File FileSql2 used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql2.Open                                     ! File FileSql2 used by this procedure, so make sure it's RelationManager is open
  Relate:IAP_SET.Open                                      ! File FileSql2 used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File FileSql2 used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_Batal.Open                                  ! File FileSql2 used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File FileSql2 used by this procedure, so make sure it's RelationManager is open
  Relate:SMPegawai.SetOpenRelated()
  Relate:SMPegawai.Open                                    ! File FileSql2 used by this procedure, so make sure it's RelationManager is open
  Relate:Tbstawal.Open                                     ! File FileSql2 used by this procedure, so make sure it's RelationManager is open
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPoli.UseFile                                     ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKelPeg.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APDTcam.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ApReLuar.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JTransaksi.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:APHTRANS
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
  BRW4.Init(?Browse:4,Queue:Browse:4.ViewPosition,BRW4::View:Browse,Queue:Browse:4,Relate:APDTRANS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  if self.request=1 then
     do isi_nomor
  end
  open(view::jtrans)
  ?Browse:4{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW4.Q &= Queue:Browse:4
  BRW4::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon APD:N0_tran for sort order 1
  BRW4.AddSortOrder(BRW4::Sort0:StepClass,APD:notran_kode) ! Add the sort order for APD:notran_kode for sort order 1
  BRW4.AddRange(APD:N0_tran,Relate:APDTRANS,Relate:APHTRANS) ! Add file relationship range limit for sort order 1
  BRW4.AddField(APD:Kode_brg,BRW4.Q.APD:Kode_brg)          ! Field APD:Kode_brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Nama_Brg,BRW4.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW4.AddField(APD:Jumlah,BRW4.Q.APD:Jumlah)              ! Field APD:Jumlah is a hot field or requires assignment from browse
  BRW4.AddField(APD:Total,BRW4.Q.APD:Total)                ! Field APD:Total is a hot field or requires assignment from browse
  BRW4.AddField(APD:Diskon,BRW4.Q.APD:Diskon)              ! Field APD:Diskon is a hot field or requires assignment from browse
  BRW4.AddField(APD:Camp,BRW4.Q.APD:Camp)                  ! Field APD:Camp is a hot field or requires assignment from browse
  BRW4.AddField(APD:N0_tran,BRW4.Q.APD:N0_tran)            ! Field APD:N0_tran is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Kode_brg,BRW4.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_UpdateRawatJalanNew',QuickWindow)     ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW4.AskProcedure = 3
  SELF.AddItem(ToolbarForm)
  BRW4.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  if (self.request=1 and self.response=2) or (self.request=3 and self.response=1) then
     do batal_nomor
     DO BATAL_D_DUA
     DO BATAL_D_UTAMA
  end
  if self.request=1 and self.response=1 then
     do hapus_nomor_use
  end
  close(view::jtrans)
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:APDTRANSDet.Close
    Relate:Ano_pakai.Close
    Relate:Apetiket.Close
    Relate:FileSql.Close
    Relate:FileSql2.Close
    Relate:IAP_SET.Close
    Relate:NomorUse.Close
    Relate:Nomor_Batal.Close
    Relate:Nomor_SKR.Close
    Relate:SMPegawai.Close
    Relate:Tbstawal.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_UpdateRawatJalanNew',QuickWindow)  ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
    APH:Tanggal = Today()
    APH:Kode_Apotik = GL_entryapotik
    APH:Jam = clock()
    APH:User = glo:user_id
  PARENT.PrimeFields


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  JTra:No_Nota = APH:NoNota                                ! Assign linking field value
  Access:JTransaksi.Fetch(JTra:KeyNoNota)
  JDok:Kode_Dokter = APH:dokter                            ! Assign linking field value
  Access:JDokter.Fetch(JDok:KeyKodeDokter)
  JKon:KODE_KTR = APH:Kontrak                              ! Assign linking field value
  Access:JKontrak.Fetch(JKon:KeyKodeKtr)
  PEGA:Nik = APH:NIP                                       ! Assign linking field value
  Access:SMPegawai.Fetch(PEGA:Pkey)
  APH:Biaya = (LOC::TOTAL - discount)
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
      Cari_nama_poli
      SelectDokter
      Trig_UpdateRawatJalanDetil
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
    OF ?APH:Nomor_mr
      if vl_sudah=0
         IF CLIP(loc::nama) = ''
             JPas:Nomor_mr=APH:Nomor_mr
             GET( JPasien,JPas:KeyNomorMr)
             IF ERRORCODE() = 35 THEN
                 MESSAGE('Nomor RM Tidak Ada Dalam daftar')
                 JKon:KODE_KTR    =''
                 access:jkontrak.fetch(JKon:KeyKodeKtr)
                 PEGA:Nik         =''
                 access:smpegawai.fetch(PEGA:Pkey)
                 JDok:Kode_Dokter=''
                 access:jdokter.fetch(JDok:KeyKodeDokter)
                 APH:dokter       =''
                 APH:Asal         =''
                 APH:NIP          =''
                 APH:Kontrak      =''
                 APH:NoNota       =''
                 !APH:Nomor_mr     = 99999999
                 APH:cara_bayar   =2
                 status           =2
                 ?BROWSE:4{PROP:DISABLE}=1
                 ?Insert:5{PROP:DISABLE}=TRUE
                 ?APH:NIP{PROP:DISABLE}=true
                 ?APH:Kontrak{PROP:DISABLE}=TRUE
                 ?Button11{PROP:DISABLE}=TRUE
                 ?Button10{PROP:DISABLE}=true
                 ?APH:NoNota{PROP:DISABLE}=true
                 ?CallLookup:3{PROP:DISABLE}=false
                 CLEAR (JPas:Nama)
                 CLEAR (JPas:Alamat)
                 DISPLAY
                 SELECT(?APH:Nomor_mr)
             ELSE
                 ?BROWSE:4{PROP:DISABLE}=0
                 ?Insert:5{PROP:DISABLE}=0
                 glo::campur=0
                 !message('select kode_transaksi,lamabaru,kode_dokter,kontraktor,kode_poli,no_nota,nip from dba.jtransaksi where statusBatal<<>1 and nomor_mr='&aph:nomor_mr&' and tanggal='''&format(today(),@d10)&''' order by no_nota')
                 !(statusBatal<<>1 or statusBatal is null) and 
                 view::jtrans{prop:sql}='select kode_transaksi,lamabaru,kode_dokter,kontraktor,kode_poli,no_nota,nip from dba.jtransaksi where (statusBatal<<>1 or statusBatal is null) and nomor_mr='&aph:nomor_mr&' and tanggal='''&format(today(),@d10)&''' order by no_nota'
                 !if errorcode() then message(error()).
                 next(view::jtrans)
                 if not errorcode() then
                    JPas:Nomor_mr=aph:nomor_mr
                    access:jpasien.fetch(JPas:KeyNomorMr)
                    JDok:Kode_Dokter=FIL1:String1
                    access:jdokter.fetch(JDok:KeyKodeDokter)
                    APH:Asal     =FIL1:String3
                    APH:dokter   =FIL1:String1
                    !message(JTra:Kode_Transaksi)
                    !message(FIL1:Byte1&' '&FIL1:String2)
                    if FIL1:Byte1=3 then
                       JKon:KODE_KTR=FIL1:String2
                       access:jkontrak.fetch(JKon:KeyKodeKtr)
                       !message(JKon:NAMA_KTR)
                       APH:Kontrak =FIL1:String2
                       APH:NIP      =''
                       PEGA:Nik         =''
                       APH:NoNota    =FIL1:String4
                       access:smpegawai.fetch(PEGA:Pkey)
                       ?Button11{PROP:DISABLE}=false
                       ?Button10{PROP:DISABLE}=true
                       ?APH:NIP{PROP:DISABLE}=true
                       ?APH:Kontrak{PROP:DISABLE}=false
                       ?APH:NoNota{PROP:DISABLE}=false
                       ?CallLookup:3{PROP:DISABLE}=false
                    elsif FIL1:Byte1=1 then
                       JKon:KODE_KTR =''
                       access:jkontrak.fetch(JKon:KeyKodeKtr)
                       APH:Kontrak   =''
                       APH:NoNota    =''
                       PEGA:Nik      =FIL1:String5
                       access:smpegawai.fetch(PEGA:Pkey)
                       APH:NIP       =FIL1:String5
                       ?Button11{PROP:DISABLE}=true
                       ?Button10{PROP:DISABLE}=false
                       !?APH:NIP{PROP:DISABLE}=false
                       ?APH:Kontrak{PROP:DISABLE}=TRUE
                       ?APH:NoNota{PROP:DISABLE}=true
                       ?CallLookup:3{PROP:DISABLE}=false
                    else
                       JKon:KODE_KTR =''
                       access:jkontrak.fetch(JKon:KeyKodeKtr)
                       PEGA:Nik      =''
                       access:smpegawai.fetch(PEGA:Pkey)
                       APH:NIP       =''
                       APH:Kontrak   =''
                       APH:NoNota    =''
                       ?Button10{PROP:DISABLE}=true
                       ?Button11{PROP:DISABLE}=true
                       ?APH:NIP{PROP:DISABLE}=true
                       ?APH:Kontrak{PROP:DISABLE}=TRUE
                       ?APH:NoNota{PROP:DISABLE}=true
                       ?CallLookup:3{PROP:DISABLE}=false
                    end
                    APH:LamaBaru  =FIL1:Byte2
                    APH:cara_bayar=FIL1:Byte1
                    status=FIL1:Byte1
                    display
                 else
                    !message(JTra:Kode_Transaksi&' '&errorcode())
                    JKon:KODE_KTR    =''
                    access:jkontrak.fetch(JKon:KeyKodeKtr)
                    PEGA:Nik         =''
                    access:smpegawai.fetch(PEGA:Pkey)
                    JDok:Kode_Dokter=''
                    access:jdokter.fetch(JDok:KeyKodeDokter)
                    APH:dokter       =''
                    APH:Asal         =''
                    APH:NIP          =''
                    APH:Kontrak      =''
                    APH:NoNota       =''
                    APH:cara_bayar   =2
                    status=2
                    ?APH:NIP{PROP:DISABLE}=true
                    ?APH:Kontrak{PROP:DISABLE}=TRUE
                    ?APH:NoNota{PROP:DISABLE}=true
                    ?Button10{PROP:DISABLE}=true
                    ?Button11{PROP:DISABLE}=true
                    ?CallLookup:3{PROP:DISABLE}=false
                 end
             END
         ELSE
             APH:Nomor_mr = 99999999
         END
      end
      display
      !if vl_sudah=0
      !IF CLIP(loc::nama) = ''
      !    JPas:Nomor_mr=APH:Nomor_mr
      !    GET( JPasien,JPas:KeyNomorMr)
      !    IF ERRORCODE() = 35 THEN
      !        MESSAGE('Nomor RM Tidak Ada Dalam daftar')
      !        JKon:KODE_KTR    =''
      !        access:jkontrak.fetch(JKon:KeyKodeKtr)
      !        PEGA:Nik         =''
      !        access:smpegawai.fetch(PEGA:Pkey)
      !        JDok:Kode_Dokter=''
      !        access:jdokter.fetch(JDok:KeyKodeDokter)
      !        APH:dokter       =''
      !        APH:Asal         =''
      !        APH:NIP          =''
      !        APH:Kontrak      =''
      !        APH:NoNota       =''
      !        !APH:Nomor_mr     = 99999999
      !        APH:cara_bayar   =2
      !        status           =2
      !        ?BROWSE:4{PROP:DISABLE}=1
      !        ?Insert:5{PROP:DISABLE}=TRUE
      !        ?APH:NIP{PROP:DISABLE}=true
      !        ?APH:Kontrak{PROP:DISABLE}=TRUE
      !        ?Button11{PROP:DISABLE}=TRUE
      !        ?Button10{PROP:DISABLE}=true
      !        ?APH:NoNota{PROP:DISABLE}=true
      !
      !        CLEAR (JPas:Nama)
      !        CLEAR (JPas:Alamat)
      !        DISPLAY
      !        SELECT(?APH:Nomor_mr)
      !    ELSE
      !        ?BROWSE:4{PROP:DISABLE}=0
      !        ?Insert:5{PROP:DISABLE}=0
      !        glo::campur=0
      !        jtransaksi{prop:sql}='select * from dba.jtransaksi where nomor_mr='&aph:nomor_mr&' and tanggal='''&format(today(),@d10)&''' order by no_nota'
      !        jtransaksi{prop:sql}='select * from dba.jtransaksi where nomor_mr='&aph:nomor_mr&' and tanggal='''&format(today(),@d10)&''' order by no_nota'
      !        next(jtransaksi)
      !        if not errorcode() then
      !           JPas:Nomor_mr=aph:nomor_mr
      !           access:jpasien.fetch(JPas:KeyNomorMr)
      !           JDok:Kode_Dokter=JTra:Kode_dokter
      !           access:jdokter.fetch(JDok:KeyKodeDokter)
      !           APH:Asal     =JTra:Kode_poli
      !           APH:dokter   =JTra:Kode_dokter
      !           !message(JTra:Kode_Transaksi)
      !           if JTra:Kode_Transaksi=3 then
      !              JKon:KODE_KTR=JTra:Kontraktor
      !              access:jkontrak.fetch(JKon:KeyKodeKtr)
      !              APH:Kontrak =JTra:Kontraktor
      !              APH:NoNota  =JTra:No_Nota
      !              APH:NIP      =''
      !              PEGA:Nik         =''
      !              access:smpegawai.fetch(PEGA:Pkey)
      !              ?Button11{PROP:DISABLE}=false
      !              ?Button10{PROP:DISABLE}=true
      !              ?APH:NIP{PROP:DISABLE}=true
      !              ?APH:Kontrak{PROP:DISABLE}=false
      !              ?APH:NoNota{PROP:DISABLE}=false
      !           elsif JTra:Kode_Transaksi=1 then
      !              JKon:KODE_KTR =''
      !              access:jkontrak.fetch(JKon:KeyKodeKtr)
      !              APH:Kontrak   =''
      !              APH:NoNota    =JTra:No_Nota
      !              PEGA:Nik      =JTra:NIP
      !              access:smpegawai.fetch(PEGA:Pkey)
      !              APH:NIP       =JTra:NIP
      !              ?Button11{PROP:DISABLE}=true
      !              ?Button10{PROP:DISABLE}=true
      !              ?APH:NIP{PROP:DISABLE}=false
      !              ?APH:Kontrak{PROP:DISABLE}=TRUE
      !              ?APH:NoNota{PROP:DISABLE}=true
      !           else
      !              JKon:KODE_KTR =''
      !              access:jkontrak.fetch(JKon:KeyKodeKtr)
      !              PEGA:Nik      =''
      !              access:smpegawai.fetch(PEGA:Pkey)
      !              APH:Asal      =''
      !              APH:NIP       =''
      !              APH:Kontrak   =''
      !              APH:NoNota    =JTra:No_Nota
      !              ?Button10{PROP:DISABLE}=false
      !              ?Button11{PROP:DISABLE}=true
      !              ?APH:NIP{PROP:DISABLE}=true
      !              ?APH:Kontrak{PROP:DISABLE}=TRUE
      !              ?APH:NoNota{PROP:DISABLE}=true
      !           end
      !           APH:LamaBaru  =JTra:LamaBaru
      !           APH:cara_bayar=JTra:Kode_Transaksi
      !           status=JTra:Kode_Transaksi
      !           display
      !        else
      !           !message(JTra:Kode_Transaksi&' '&errorcode())
      !           JKon:KODE_KTR    =''
      !           access:jkontrak.fetch(JKon:KeyKodeKtr)
      !           PEGA:Nik         =''
      !           access:smpegawai.fetch(PEGA:Pkey)
      !           JDok:Kode_Dokter=''
      !           access:jdokter.fetch(JDok:KeyKodeDokter)
      !           APH:dokter       =''
      !           APH:Asal         =''
      !           APH:NIP          =''
      !           APH:Kontrak      =''
      !           APH:NoNota       =''
      !           APH:cara_bayar   =2
      !           status=2
      !           ?APH:NIP{PROP:DISABLE}=true
      !           ?APH:Kontrak{PROP:DISABLE}=TRUE
      !           ?APH:NoNota{PROP:DISABLE}=true
      !        end
      !    END
      !ELSE
      !    APH:Nomor_mr = 99999999
      !END
      !end
      !display
    OF ?status
      if vl_sudah=0
      IF CEK_RUN = 0
        CASE status
        OF 1
           JKon:KODE_KTR=''
           access:jkontrak.fetch(JKon:KeyKodeKtr)
           APH:Kontrak=''
           !APH:NoNota=''
           ?APH:Kontrak{PROP:DISABLE}=TRUE
           ?Button11{PROP:DISABLE}=TRUE
           ?Button10{PROP:DISABLE}=false
           ?APH:NoNota{PROP:DISABLE}=false
           ?CallLookup:3{PROP:DISABLE}=false
           ?Insert:5{PROP:DISABLE}=false
           display
           !select(?Button10)
        of 2
           JKon:KODE_KTR=''
           access:jkontrak.fetch(JKon:KeyKodeKtr)
           APH:Kontrak=''
           PEGA:Nik=''
           access:smpegawai.fetch(PEGA:Pkey)
           APH:NIP=''
           !APH:NoNota=''
           ?APH:Kontrak{PROP:DISABLE}=TRUE
           ?Button11{PROP:DISABLE}=TRUE
           ?APH:NIP{PROP:DISABLE}=TRUE
           ?Button10{PROP:DISABLE}=true
           ?APH:NoNota{PROP:DISABLE}=false
           ?CallLookup:3{PROP:DISABLE}=false
           ?Insert:5{PROP:DISABLE}=false
           display
        OF 3
           PEGA:Nik=''
           access:smpegawai.fetch(PEGA:Pkey)
           APH:NIP=''
           ?APH:NIP{PROP:DISABLE}=TRUE
           ?APH:Kontrak{PROP:DISABLE}=false
           ?Button11{PROP:DISABLE}=false
           ?Button10{PROP:DISABLE}=true
           ?APH:NoNota{PROP:DISABLE}=false
           ?CallLookup:3{PROP:DISABLE}=false
           ?Insert:5{PROP:DISABLE}=false
           display
           !select(?Button11)
        end
        APH:cara_bayar=status
      end
      end
    OF ?OK
      if APH:NoNota='' then
         message('No nota harus terisi !!!')
         cycle
      end
      !if vl_sudah=0
      sudah_nomor = 0
      glo::no_nota = APH:N0_tran
      !memperbaharui file Aphtrans, apdtrans, gstokaptk, apreluar
      CEK_RUN=1
      APH:User=GL::Prefix
      ! *****UNTUK file ApHTrans******
      APH:Bayar=0
      APH:Ra_jal=1
      APH:cara_bayar=status
      APH:Kode_Apotik=GL_entryapotik
      APH:User = Glo:USER_ID
      
      !untuk file ApReLuar
      IF CLIP(loc::nama) <> ''
          APR:Nama = loc::nama
          APR:Alamat = loc::alamat
          APR:RT     = loc::RT
          APR:RW     = loc::rw
          APR:Kota   = loc::kota
          APR:N0_tran = APH:N0_tran
          Access:ApReLuar.Insert()
      END
      
      !untuk file ApDTrans
      !IF discount <> 0
      !    APD:N0_tran = APH:N0_tran
      !    APD:Kode_brg = '_Disc'
      !    APD:Total = - discount
      !    APD:Jumlah = pers_disc
      !    Access:APDTRANS.Insert()
      !END
      
      !cek dulu bulannya ya, kalau sudah berubah, tulis dulu ke file awal bulan
      IF MONTH(glo::tgl_awal_kerja) <> mONTH(TODAY())
         APH:Tanggal = TODAY()
         Tahun_ini = YEAR(TODAY())
         Loc::delete=0
         SET(APDTRANS)
         APD:N0_tran = APH:N0_tran
         SET(APD:by_transaksi,APD:by_transaksi)
         LOOP
            IF Access:APDTRANS.Next()<>Level:Benign OR APD:N0_tran <> APH:N0_tran THEN BREAK.
            GSTO:Kode_Barang = APD:Kode_brg
            GSTO:Kode_Apotik = GL_entryapotik
            GET(GStokAptk,GSTO:KeyBarang)
      
            !disini isi dulu tbstawal
            TBS:Kode_Apotik = GL_entryapotik
            TBS:Kode_Barang = APD:Kode_brg
            TBS:Tahun = Tahun_ini
            GET(Tbstawal,TBS:kdap_brg)
            IF ERRORCODE() = 0
                CASE MONTH(TODAY())
                    OF 1
                        IF TBS:Januari= 0
                            TBS:Januari = GSTO:Saldo
                            PUT(Tbstawal)
                        END
                    OF 2
                        IF TBS:Februari= 0
                            TBS:Februari = GSTO:Saldo
                            PUT(Tbstawal)
                        END
                    OF 3
                        IF TBS:Maret= 0
                            TBS:Maret = GSTO:Saldo
                            PUT(Tbstawal)
                        END
                    OF 4
                        IF TBS:April= 0
                            TBS:April = GSTO:Saldo
                            PUT(Tbstawal)
                        END
                    OF 5
                        IF TBS:Mei= 0
                            TBS:Mei = GSTO:Saldo
                            PUT(Tbstawal)
                        END
                    OF 6
                        IF TBS:Juni= 0
                            TBS:Juni = GSTO:Saldo
                            PUT(Tbstawal)
                        END
                    OF 7
                        IF TBS:Juli= 0
                            TBS:Juli = GSTO:Saldo
                            PUT(Tbstawal)
                        END
                    OF 8
                        IF TBS:Agustus= 0
                            TBS:Agustus = GSTO:Saldo
                            PUT(Tbstawal)
                        END
                    OF 9
                        IF TBS:September= 0
                            TBS:September = GSTO:Saldo
                            PUT(Tbstawal)
                        END
                        
                    OF 10
                        IF TBS:Oktober= 0
                            TBS:Oktober = GSTO:Saldo
                            PUT(Tbstawal)
                        END
                
                    OF 11
                        IF TBS:November= 0
                            TBS:November = GSTO:Saldo
                            PUT(Tbstawal)
                        END
                    OF 12
                        IF TBS:Desember= 0
                            TBS:Desember = GSTO:Saldo
                            PUT(Tbstawal)
                        END
                END
      
            ELSE
                CASE MONTH(TODAY())
                        OF 1
                            TBS:Januari = GSTO:Saldo
                        OF 2
                            TBS:Februari = GSTO:Saldo
                        OF 3
                            TBS:Maret = GSTO:Saldo
                        OF 4
                            TBS:April = GSTO:Saldo
                        OF 5
                            TBS:Mei = GSTO:Saldo
                        OF 6
                            TBS:Juni = GSTO:Saldo
                        OF 7
                            TBS:Juli = GSTO:Saldo
                        OF 8
                            TBS:Agustus = GSTO:Saldo
                        OF 9
                            TBS:September = GSTO:Saldo
                        OF 10
                            TBS:Oktober = GSTO:Saldo
                        OF 11
                            TBS:November = GSTO:Saldo
                        OF 12
                            TBS:Desember = GSTO:Saldo
                END
                TBS:Kode_Apotik = GL_entryapotik
                TBS:Kode_Barang = GSTO:Kode_Barang
                TBS:Tahun = Tahun_ini
                ADD(Tbstawal)
            END
         END
      END
      !end
      vl_sudah=1
    OF ?Cancel
      !if vl_sudah=0
      !    DO BATAL_D_DUA
      !    DO BATAL_D_UTAMA
      !end
    OF ?discount
      if vl_sudah=0
      IF DISCOUNT > 0 AND masuk_disc = 0
          masuk_disc = 1
      END
      end
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?loc:nomor
      if vl_sudah=0
           
      !if loc:nomor<>'' then
      if loc:tgl=0 then
         loc:tgl=today()
      end
      !khusus untuk nomor pake jjjjjjjjj
      if loc:nomor<>'' then
         if numeric(loc:nomor)=1 then
            loc:temth2=year(loc:tgl)
            loc:bl2=month(loc:tgl)
            loc:bls2=format(loc:bl2,@p##p)
            loc:th22=sub(loc:temth2,3,2)
            loc:th32=format(loc:th22,@p##p)
            loc:nums2=format(loc:nomor,@p#####p)
            loc:nomor=clip('J')&''&clip(loc:th32)&''&clip(loc:bls2)&''&clip(loc:nums2)
         end
        APH:NoNota=loc:nomor
        JTra:No_Nota=loc:nomor
        GET(jtRANSAKSI,JTra:KeyNoNota)
        IF NOT ERRORCODE() THEN
           IF CLIP(loc::nama) = ''
               APH:Nomor_mr=JTra:Nomor_Mr
               JPas:Nomor_mr=APH:Nomor_mr
               GET( JPasien,JPas:KeyNomorMr)
               IF ERRORCODE() = 35 THEN
                   MESSAGE('Nomor RM Tidak Ada Dalam daftar')
                   JKon:KODE_KTR    =''
                   access:jkontrak.fetch(JKon:KeyKodeKtr)
                   PEGA:Nik         =''
                   access:smpegawai.fetch(PEGA:Pkey)
                   JDok:Kode_Dokter=''
                   access:jdokter.fetch(JDok:KeyKodeDokter)
                   APH:dokter       =''
                   APH:Asal         =''
                   APH:NIP          =''
                   APH:Kontrak      =''
                   APH:NoNota       =''
                   !APH:Nomor_mr     = 99999999
                   APH:cara_bayar   =2
                   status           =2
                   ?BROWSE:4{PROP:DISABLE}=1
                   ?Insert:5{PROP:DISABLE}=TRUE
                   ?APH:NIP{PROP:DISABLE}=true
                   ?APH:Kontrak{PROP:DISABLE}=TRUE
                   ?Button11{PROP:DISABLE}=TRUE
                   ?Button10{PROP:DISABLE}=true
                   ?APH:NoNota{PROP:DISABLE}=true
                   ?CallLookup:3{PROP:DISABLE}=false
                   CLEAR (JPas:Nama)
                   CLEAR (JPas:Alamat)
                   DISPLAY
                   SELECT(?APH:Nomor_mr)
               ELSE
                   ?BROWSE:4{PROP:DISABLE}=0
                   ?Insert:5{PROP:DISABLE}=0
                   glo::campur=0
                   !message('select kode_transaksi,lamabaru,kode_dokter,kontraktor,kode_poli,no_nota,nip from dba.jtransaksi where statusBatal<<>1 and nomor_mr='&aph:nomor_mr&' and tanggal='''&format(today(),@d10)&''' order by no_nota')
                   !(statusBatal<<>1 or statusBatal is null) and 
                   view::jtrans{prop:sql}='select kode_transaksi,lamabaru,kode_dokter,kontraktor,kode_poli,no_nota,nip from dba.jtransaksi where (statusBatal<<>1 or statusBatal is null) and nomor_mr='&aph:nomor_mr&' and tanggal='''&format(today(),@d10)&''' order by no_nota'
                   !if errorcode() then message(error()).
                   next(view::jtrans)
                   if not errorcode() then
                      JPas:Nomor_mr=aph:nomor_mr
                      access:jpasien.fetch(JPas:KeyNomorMr)
                      JDok:Kode_Dokter=FIL1:String1
                      access:jdokter.fetch(JDok:KeyKodeDokter)
                      APH:Asal     =FIL1:String3
                      APH:dokter   =FIL1:String1
                      !message(JTra:Kode_Transaksi)
                      !message(FIL1:Byte1&' '&FIL1:String2)
                      if FIL1:Byte1=3 then
                         JKon:KODE_KTR=FIL1:String2
                         access:jkontrak.fetch(JKon:KeyKodeKtr)
                         !message(JKon:NAMA_KTR)
                         APH:Kontrak =FIL1:String2
                         APH:NIP      =''
                         PEGA:Nik         =''
                         !APH:NoNota    =FIL1:String4
                         access:smpegawai.fetch(PEGA:Pkey)
                         ?Button11{PROP:DISABLE}=false
                         ?Button10{PROP:DISABLE}=true
                         ?APH:NIP{PROP:DISABLE}=true
                         ?APH:Kontrak{PROP:DISABLE}=false
                         ?APH:NoNota{PROP:DISABLE}=false
                         ?CallLookup:3{PROP:DISABLE}=false
                      elsif FIL1:Byte1=1 then
                         JKon:KODE_KTR =''
                         access:jkontrak.fetch(JKon:KeyKodeKtr)
                         APH:Kontrak   =''
                         !APH:NoNota    =''
                         PEGA:Nik      =FIL1:String5
                         access:smpegawai.fetch(PEGA:Pkey)
                         APH:NIP       =FIL1:String5
                         ?Button11{PROP:DISABLE}=true
                         ?Button10{PROP:DISABLE}=false
                         !?APH:NIP{PROP:DISABLE}=false
                         ?APH:Kontrak{PROP:DISABLE}=TRUE
                         ?APH:NoNota{PROP:DISABLE}=true
                         ?CallLookup:3{PROP:DISABLE}=false
                      else
                         JKon:KODE_KTR =''
                         access:jkontrak.fetch(JKon:KeyKodeKtr)
                         PEGA:Nik      =''
                         access:smpegawai.fetch(PEGA:Pkey)
                         APH:NIP       =''
                         APH:Kontrak   =''
                         !APH:NoNota    =''
                         ?Button10{PROP:DISABLE}=true
                         ?Button11{PROP:DISABLE}=true
                         ?APH:NIP{PROP:DISABLE}=true
                         ?APH:Kontrak{PROP:DISABLE}=TRUE
                         ?APH:NoNota{PROP:DISABLE}=true
                         ?CallLookup:3{PROP:DISABLE}=false
                      end
                      APH:LamaBaru  =FIL1:Byte2
                      APH:cara_bayar=FIL1:Byte1
                      status=FIL1:Byte1
                      display
                   else
                      !message(JTra:Kode_Transaksi&' '&errorcode())
                      JKon:KODE_KTR    =''
                      access:jkontrak.fetch(JKon:KeyKodeKtr)
                      PEGA:Nik         =''
                      access:smpegawai.fetch(PEGA:Pkey)
                      JDok:Kode_Dokter=''
                      access:jdokter.fetch(JDok:KeyKodeDokter)
                      APH:dokter       =''
                      APH:Asal         =''
                      APH:NIP          =''
                      APH:Kontrak      =''
                      !APH:NoNota       =''
                      APH:cara_bayar   =2
                      status=2
                      ?APH:NIP{PROP:DISABLE}=true
                      ?APH:Kontrak{PROP:DISABLE}=TRUE
                      ?APH:NoNota{PROP:DISABLE}=true
                      ?Button10{PROP:DISABLE}=true
                      ?Button11{PROP:DISABLE}=true
                      ?CallLookup:3{PROP:DISABLE}=false
                   end
               END
           ELSE
               APH:Nomor_mr = 99999999
           END
           display
        end
      END
      DISPLAY
      end
    OF ?CallLookup
      ThisWindow.Update
      JPol:POLIKLINIK = APH:Asal
      IF SELF.Run(1,SelectRecord) = RequestCompleted       ! Call lookup procedure and verify RequestCompleted
        APH:Asal = JPol:POLIKLINIK
      END
      ThisWindow.Reset(1)
    OF ?Button10
      ThisWindow.Update
      if vl_sudah=0
         globalrequest=selectrecord
         selectpegawai
         APH:NIP=PEGA:Nik
         display
         if status=1 then
         !aph:nip<>'' then
            enable(?ok)
         else
            disable(?ok)
         end
      
         if APH:NIP<>'' then
            ?insert:5{prop:disable}=false
         else
            ?insert:5{prop:disable}=true
         end
      end
    OF ?APH:Kontrak
      if vl_sudah=0
         JKon:KODE_KTR=APH:Kontrak
         access:jkontrak.fetch(JKon:KeyKodeKtr)
         if APH:NoNota<>'' and APH:Kontrak<>'' then
            ?insert:5{prop:disable}=false
         else
            ?insert:5{prop:disable}=true
         end
         display
      end
    OF ?Button11
      ThisWindow.Update
      if vl_sudah=0
         globalrequest=selectrecord
         selectjkontrak
         APH:Kontrak=JKon:KODE_KTR
         if APH:NoNota<>'' and APH:Kontrak<>'' then
            ?insert:5{prop:disable}=false
         else
            ?insert:5{prop:disable}=true
         end
         display
         if status=3 then
         !and APH:Kontraktor<>'' then
            enable(?ok)
         else
            disable(?ok)
         end
      end
      display
    OF ?CallLookup:3
      ThisWindow.Update
      glo:mr=APH:Nomor_mr
      display
      globalrequest=selectrecord
      if GLO:LEVEL>1 then
      SelectJTransaksiMR()
      else
      SelectJTransaksiMRPengatur()
      end
      if vl_sudah=0
         !if JTra:Kontraktor='' then
         !   message('Bukan pasien kontraktor !!!')
         !   aph:nonota=''
         !else
            APH:NoNota=JTra:No_Nota
            display
            JKon:KODE_KTR=JTra:Kontraktor
            access:jkontrak.fetch(JKon:KeyKodeKtr)
            APH:Kontrak=JTra:Kontraktor
            if JTra:No_Nota<>'' then
            enable(?Insert:5)
            enable(?Browse:4)
            end
         !end
         !f APH:NoNota<>'' and APH:Kontrak<>'' then
         !  ?insert:5{prop:disable}=false
         !lse
         !  ?insert:5{prop:disable}=true
         !nd
         display
      end
      
    OF ?APH:NoNota
      !if vl_sudah=0
      !   JTra:No_Nota=aph:nonota
      !   if access:jtransaksi.fetch(JTra:KeyNoNota)=level:benign then
      !      if JTra:Kontraktor='' then
      !         message('Bukan pasien kontraktor !!!')
      !         aph:nonota=''
      !      else
      !         JKon:KODE_KTR=JTra:Kontraktor
      !         access:jkontrak.fetch(JKon:KeyKodeKtr)
      !         APH:Kontrak=JTra:Kontraktor
      !      end
      !   else
      !      message('Tidak ada nomor transaksi seperti di atas !!!')
      !      aph:nonota=''
      !   end
      !   if APH:NoNota<>'' and APH:Kontrak<>'' then
      !      ?insert:5{prop:disable}=false
      !   else
      !      ?insert:5{prop:disable}=true
      !   end
      !   display
      !end
      !
    OF ?APH:dokter
      IF APH:dokter OR ?APH:dokter{Prop:Req}
        JDok:Kode_Dokter = APH:dokter
        IF Access:JDokter.TryFetch(JDok:KeyKodeDokter)
          IF SELF.Run(2,SelectRecord) = RequestCompleted
            APH:dokter = JDok:Kode_Dokter
          ELSE
            SELECT(?APH:dokter)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup:2
      ThisWindow.Update
      JDok:Kode_Dokter = APH:dokter
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        APH:dokter = JDok:Kode_Dokter
      END
      ThisWindow.Reset(1)
    OF ?Button12
      ThisWindow.Update
      if vl_sudah=0
         globalrequest=selectrecord
         selectjtransaksi
         if JTra:Kontraktor<>'' then
            JKon:KODE_KTR=JTra:Kontraktor
            access:jkontrak.fetch(JKon:KeyKodeKtr)
            JPas:Nomor_mr=JTra:Nomor_Mr
            access:jpasien.fetch(JPas:KeyNomorMr)
            APH:dokter=JTra:Kode_dokter
            access:jdokter.fetch(JDok:KeyKodeDokter)
            APH:NoNota=JTra:No_Nota
            APH:Nomor_mr=JTra:Nomor_Mr
            APH:NIP      =JTra:NIP
            APH:Kontrak =JTra:Kontraktor
            if APH:Kontrak<>'' then
               APH:NoNota  =JTra:No_Nota
            else
               APH:NoNota  =''
            end
            display
            APH:LamaBaru =JTra:LamaBaru
            APH:cara_bayar=JTra:Kode_Transaksi
         else
            JKon:KODE_KTR =''
            access:jkontrak.fetch(JKon:KeyKodeKtr)
            APH:Asal      =''
            APH:NIP       =''
            APH:Kontrak   =''
            APH:NoNota    =''
            APH:LamaBaru  =JTra:LamaBaru
            APH:cara_bayar=JTra:Kode_Transaksi
            APH:dokter    =JTra:Kode_dokter
            access:jdokter.fetch(JDok:KeyKodeDokter)
            APH:NoNota    =JTra:No_Nota
            display
         end
         status=JTra:Kode_Transaksi
         if status=0 then
            status=2
         end
         ?BROWSE:4{PROP:DISABLE}=0
         ?Insert:5{PROP:DISABLE}=0
         glo::campur=0
         APH:Asal=JTra:Kode_poli
         display
      end
    OF ?OK
      ThisWindow.Update
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?Button9
      ThisWindow.Update
      if vl_sudah=0
         IF LOC::TOTAL <> 0
             !vl_round = round(APH:Biaya)
             !Pembulatan
             vl_hasil=0
             vl_real=APH:Biaya
             vl_seribu=round(APH:Biaya,1000)
             !message(vl_seribu)
             if vl_seribu<vl_real then
                vl_selisih=vl_real-vl_seribu
                !message(vl_selisih)
                if vl_selisih>100 then
                   vl_selisih=500
                   vl_hasil=vl_seribu+vl_selisih
                else
                   vl_hasil=vl_seribu
                end
             else
                vl_selisih=vl_seribu-vl_real
                !message(vl_selisih)
                if vl_selisih>400 then
                   vl_hasil=vl_seribu-500
                else
                   vl_hasil=vl_seribu
                end
             end
             !selesai
             !APH:Biaya = ROUND( ((APH:Biaya /100) + 0.4999) , 1 ) *100
             APH:Biaya = vl_hasil
             IF discount <>0
                 loc::copy_total = APH:Biaya + discount
                 masuk_disc = 1
                 ?discount{PROP:READONLY}=FALSE
             ELSE
                 loc::copy_total = APH:Biaya
             END
             SET( BRW4::View:Browse)
                 LOOP
                     NEXT(BRW4::View:Browse)
                     IF APD:Camp = 0 AND APD:N0_tran = APH:N0_tran
                         APD:Total = APD:Total + loc::copy_total - LOC::TOTAL
                         PUT(APDTRANS)
                         BREAK
                     END
                     IF ERRORCODE() > 0  OR  APD:N0_tran <> APH:N0_tran
                         SET( BRW4::View:Browse)
                         LOOP
                             NEXT( BRW4::View:Browse )
                             IF APD:Kode_brg = '_Campur'
                                 APD:Total = APD:Total + loc::copy_total - LOC::TOTAL
                                 PUT(APDTRANS)
                                 SET(APDTcam)
                                 APD1:N0_tran = APH:N0_tran
                                 APD1:Camp = APD:Camp
                                 SET (APD1:by_tranno,APD1:by_tranno)
                                 LOOP
                                     NEXT( APDTcam )
                                     IF APD1:Kode_brg = '_Biaya'
                                         APD1:Total = APD1:Total  + loc::copy_total - LOC::TOTAL
                                         PUT(APDTcam)
                                         BREAK
                                     END
                                 END
      
                                 BREAK
                             END
                         END
                         BREAK
                     END
                     
                 END
                 LOC::TOTAL = loc::copy_total
             DISPLAY
             BRW4.RESETSORT(1)
            
         END
      end
    OF ?discount
      ThisWindow.Reset(1)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
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
  ReturnValue = PARENT.TakeSelected()
    CASE FIELD()
    OF ?APH:Asal
      JPol:POLIKLINIK = APH:Asal
      IF Access:JPoli.TryFetch(JPol:BY_POLI)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          APH:Asal = JPol:POLIKLINIK
        END
      END
      ThisWindow.Reset
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
    OF EVENT:AlertKey
      select(?cancel)
      presskey( 13)
    OF EVENT:CloseWindow
      IF SELF.RESPONSE = 1 THEN
         !PrintTransRawatJalan
      END
    OF EVENT:Timer
      if vl_sudah=0
         IF LOC::TOTAL = 0
             ?OK{PROP:DISABLE}=1
         ELSE
             ?OK{PROP:DISABLE}=0
         END
      end
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APH:Biaya = (LOC::TOTAL - discount)


BRW4.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW4.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:5
    SELF.ChangeControl=?Change:5
    SELF.DeleteControl=?Delete:5
  END


BRW4.ResetFromAsk PROCEDURE(*BYTE Request,*BYTE Response)

  CODE
  PARENT.ResetFromAsk(Request,Response)
  brw4.resetsort(1)
  set(BRW4::View:Browse)
  next(BRW4::View:Browse)
  if not(errorcode()) then
     ?Button10{PROP:DISABLE}=true
     ?Button11{PROP:DISABLE}=true
     ?APH:Kontrak{PROP:DISABLE}=TRUE
     ?APH:NoNota{PROP:DISABLE}=true
     ?CallLookup:3{PROP:DISABLE}=true
  else
     if status=3 then
        ?Button11{PROP:DISABLE}=false
        ?Button10{PROP:DISABLE}=true
        ?APH:Kontrak{PROP:DISABLE}=false
        ?APH:NoNota{PROP:DISABLE}=false
        ?CallLookup:3{PROP:DISABLE}=false
     elsif status=1 then
        ?Button11{PROP:DISABLE}=true
        ?Button10{PROP:DISABLE}=false
        ?APH:Kontrak{PROP:DISABLE}=TRUE
        ?APH:NoNota{PROP:DISABLE}=true
        ?CallLookup:3{PROP:DISABLE}=true
     else
        ?Button10{PROP:DISABLE}=true
        ?Button11{PROP:DISABLE}=true
        ?APH:Kontrak{PROP:DISABLE}=TRUE
        ?APH:NoNota{PROP:DISABLE}=true
        ?CallLookup:3{PROP:DISABLE}=true
     end
  end
  
  disable(?status)


BRW4.ResetFromView PROCEDURE

LOC::TOTAL:Sum       REAL                                  ! Sum variable for browse totals
discount:Sum         REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:APDTRANS.SetQuickScan(1)
  SELF.Reset
  LOOP
    CASE SELF.Next()
    OF Level:Notify
      BREAK
    OF Level:Fatal
      SETCURSOR()
      RETURN
    END
    SELF.SetQueueRecord
    LOC::TOTAL:Sum += APD:Total
    discount:Sum += APD:Diskon
  END
  LOC::TOTAL = LOC::TOTAL:Sum
  discount = discount:Sum
  PARENT.ResetFromView
  Relate:APDTRANS.SetQuickScan(0)
  SETCURSOR()


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

Trig_updaterawatjalan230809 PROCEDURE                      ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
vl_round             REAL                                  !
vl_no_urut           LONG                                  !
vl_sudah             BYTE                                  !
vl_nomor             STRING(15)                            !
masuk_disc           BYTE                                  !
sudah_nomor          BYTE                                  !
Loc::delete          BYTE                                  !
Tahun_ini            LONG                                  !
loc::copy_total      LONG                                  !Total Biaya Pembelian
loc::camp            BYTE                                  !
Loc::SavPoint        LONG                                  !
putar                ULONG                                 !
CEK_RUN              BYTE                                  !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
discount             LONG                                  !
pers_disc            LONG                                  !
LOC::TOTAL           LONG                                  !
Hitung_campur        BYTE                                  !
loc::nama            STRING(20)                            !
loc::alamat          STRING(35)                            !
loc::RT              BYTE                                  !
loc::rw              BYTE                                  !
loc::kota            STRING(20)                            !
vl_real              REAL                                  !
vl_hasil             REAL                                  !
vl_seribu            REAL                                  !
vl_selisih           REAL                                  !
vl_diskon_pct        REAL                                  !
vl_total             REAL                                  !
vl_hna               REAL                                  !
BRW4::View:Browse    VIEW(APDTRANS)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Total)
                       PROJECT(APD:Diskon)
                       PROJECT(APD:Camp)
                       PROJECT(APD:N0_tran)
                       JOIN(GBAR:KeyKodeBrg,APD:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse:4       QUEUE                            !Queue declaration for browse/combo box using ?Browse:4
APD:Kode_brg           LIKE(APD:Kode_brg)             !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
APD:Jumlah             LIKE(APD:Jumlah)               !List box control field - type derived from field
APD:Total              LIKE(APD:Total)                !List box control field - type derived from field
APD:Diskon             LIKE(APD:Diskon)               !List box control field - type derived from field
APD:Camp               LIKE(APD:Camp)                 !List box control field - type derived from field
APD:N0_tran            LIKE(APD:N0_tran)              !List box control field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::APH:Record  LIKE(APH:RECORD),THREAD
QuickWindow          WINDOW('Transaksi Instalasi Farmasi - Rawat Jalan'),AT(,,456,256),FONT('Times New Roman',8,COLOR:Black,),CENTER,IMM,HLP('UpdateAPHTRANS'),ALRT(EscKey),TIMER(100),GRAY,RESIZE,MDI
                       BUTTON('&Tambah Obat (+)'),AT(5,193,139,19),USE(?Insert:5),FONT('Times New Roman',10,,FONT:bold),KEY(PlusKey)
                       SHEET,AT(2,5,452,112),USE(?CurrentTab)
                         TAB('Poliklinik (F5)'),USE(?Tab:1),KEY(F5Key),FONT('Times New Roman',10,,)
                           ENTRY(@N10),AT(142,23,81,16),USE(APH:Nomor_mr),IMM,FONT('Times New Roman',16,,FONT:bold),MSG('Nomor Medical record pasien'),TIP('Nomor KIUP')
                           PROMPT('RM :'),AT(120,25),USE(?APH:Nomor_mr:Prompt),FONT('Times New Roman',10,,FONT:bold)
                           OPTION('Status Pembayaran'),AT(6,19,99,49),USE(status),BOXED,FONT('Times New Roman',12,COLOR:Navy,)
                             RADIO('&Gratis / Pegawai'),AT(12,30),USE(?Option1:Radio1),FONT('Times New Roman',10,COLOR:Green,FONT:bold),VALUE('1')
                             RADIO('&Tunai'),AT(12,42),USE(?Option1:Radio3),FONT('Times New Roman',10,COLOR:Black,),VALUE('2')
                             RADIO('&KONTRAKTOR'),AT(12,52,91,13),USE(?Option1:Radio2),FONT('Times New Roman',12,COLOR:Red,FONT:bold),VALUE('3')
                           END
                           ENTRY(@s10),AT(287,23,62,16),USE(APH:Asal),FONT('Times New Roman',14,,),MSG('Kode Poliklinik'),TIP('Kode Poliklinik')
                           BUTTON('&P (F3)'),AT(350,22,26,16),USE(?CallLookup),KEY(F3Key)
                           PROMPT('Nama  :'),AT(112,43),USE(?Prompt5)
                           ENTRY(@s35),AT(142,43,93,10),USE(JPas:Nama),DISABLE,FONT(,,,FONT:bold),HLP('Nama mendahului gelar'),MSG('Nama pasien'),REQ,CAP
                           ENTRY(@s35),AT(239,42,97,10),USE(loc::nama,,?loc::nama:2)
                           PROMPT('Alamat :'),AT(109,57),USE(?Prompt6)
                           ENTRY(@s35),AT(142,57,93,10),USE(JPas:Alamat),DISABLE,HLP('contoh : Kopo Jl'),MSG('Alamat Pasien'),CAP
                           ENTRY(@s35),AT(239,57,97,10),USE(loc::alamat,,?loc::alamat:2)
                           PROMPT('Kota :'),AT(341,57),USE(?APH:NoNota:Prompt:2)
                           PROMPT('NIP:'),AT(8,72),USE(?APH:NIP:Prompt)
                           ENTRY(@s7),AT(24,72,45,10),USE(APH:NIP),DISABLE
                           BUTTON('F4'),AT(73,72,19,10),USE(?Button10),DISABLE
                           PROMPT('No. Resep :'),AT(72,72),USE(?APH:NomorEPresribing:Prompt)
                           ENTRY(@s20),AT(115,72,53,10),USE(APH:NomorEPresribing),DISABLE
                           BUTTON('F9'),AT(171,72,19,10),USE(?Button13)
                           ENTRY(@s40),AT(24,85,112,10),USE(PEGA:Nama),DISABLE
                           PROMPT('Kontraktor:'),AT(196,72),USE(?APH:Kontraktor:Prompt)
                           ENTRY(@s10),AT(240,72,55,10),USE(APH:Kontrak),DISABLE
                           BUTTON('F5'),AT(298,72,19,10),USE(?Button11),DISABLE
                           ENTRY(@s100),AT(319,72,132,10),USE(JKon:NAMA_KTR),DISABLE
                           PROMPT('Nota:'),AT(341,42),USE(?APH:NoNota:Prompt)
                           ENTRY(@s10),AT(367,42,69,10),USE(APH:NoNota),REQ
                           BUTTON('F8'),AT(438,42,13,10),USE(?calllookup:3),KEY(F8Key)
                           ENTRY(@s20),AT(367,57,69,10),USE(loc::kota,,?loc::kota:2)
                           PROMPT('Dokter:'),AT(196,85),USE(?APH:dokter:Prompt)
                           ENTRY(@s5),AT(240,85,55,10),USE(APH:dokter),DISABLE
                           BUTTON('F7'),AT(298,85,19,10),USE(?CallLookup:2),KEY(F7Key)
                           ENTRY(@s30),AT(319,85,132,10),USE(JDok:Nama_Dokter),DISABLE,MSG('Nama Dokter'),TIP('Nama Dokter'),UPR
                           PROMPT('Pembeli Lgs:'),AT(15,102),USE(?JTra:NamaJawab:Prompt)
                           ENTRY(@s40),AT(65,102,87,10),USE(JTra:NamaJawab)
                           PROMPT('Alamat :'),AT(159,102),USE(?JTra:AlamatJawab:Prompt)
                           ENTRY(@s50),AT(194,102,110,10),USE(JTra:AlamatJawab)
                           STRING(@s25),AT(377,26,66,10),USE(JPol:NAMA_POLI)
                           PROMPT('Asal:'),AT(256,23),USE(?APH:Asal:Prompt),FONT('Times New Roman',16,,)
                           BUTTON('F2'),AT(225,22,26,16),USE(?Button12),HIDE,KEY(F2Key)
                         END
                       END
                       PROMPT('Kode Apotik:'),AT(187,3,46,10),USE(?APH:Kode_Apotik:Prompt)
                       ENTRY(@s5),AT(237,3,39,10),USE(APH:Kode_Apotik),DISABLE,MSG('Kode Apotik'),TIP('Kode Apotik')
                       PROMPT('&TANGGAL:'),AT(284,3,37,10),USE(?APH:Tanggal:Prompt)
                       PROMPT('N0 tran:'),AT(7,217),USE(?APH:N0_tran:Prompt),FONT('Times New Roman',12,,FONT:bold+FONT:italic+FONT:underline)
                       ENTRY(@s15),AT(46,217,95,13),USE(APH:N0_tran),DISABLE,FONT('Arial',12,,FONT:bold),MSG('nomor transaksi'),TIP('nomor transaksi')
                       LINE,AT(279,233,163,0),USE(?Line1),COLOR(COLOR:Black),LINEWIDTH(2)
                       LIST,AT(7,120,440,69),USE(?Browse:4),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('47L(2)|FM~Kode Barang~L(0)@s10@163L(2)|M~Nama Obat~C(0)@s40@52R(2)|M~Jumlah~C(0)' &|
   '@n-12.2@53R(2)|M~Total~C(0)@n-13.2@60R(2)|M~Diskon~C(0)@n-15.2@27L|M~Camp~C@n2@6' &|
   '3L(2)|FM~N 0 tran~L(0)@s15@'),FROM(Queue:Browse:4)
                       PROMPT('Total :'),AT(285,240),USE(?APH:Biaya:Prompt),FONT('Times New Roman',14,,FONT:bold+FONT:italic)
                       ENTRY(@n-15.2),AT(345,239,97,14),USE(APH:Biaya),DISABLE,RIGHT(1),MSG('Total Biaya Pembelian'),TIP('Total Biaya Pembelian')
                       PANEL,AT(5,214,139,19),USE(?Panel2)
                       BUTTON('&OK (End)'),AT(205,193,45,35),USE(?OK),FONT('Times New Roman',10,,),KEY(EndKey),ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(153,193,45,35),USE(?Cancel),FONT('Times New Roman',12,,),ICON(ICON:Cross)
                       BUTTON('Pembulatan [-]'),AT(148,237,102,18),USE(?Button9),FONT('Times New Roman',10,,FONT:regular),KEY(MinusKey)
                       PROMPT('Sub Total'),AT(285,194),USE(?Prompt10),FONT('Times New Roman',12,,)
                       ENTRY(@n-15.2),AT(345,212,97,14),USE(discount),DISABLE
                       PROMPT('Diskon :'),AT(285,212),USE(?Prompt8),FONT('Times New Roman',12,,)
                       BUTTON('&Edit [Ctrl]'),AT(5,237,139,18),USE(?Change:5),FONT(,,COLOR:Blue,FONT:bold),KEY(529)
                       BUTTON('&Delete'),AT(403,0,45,14),USE(?Delete:5),HIDE
                       ENTRY(@n-15.2),AT(345,194,97,14),USE(LOC::TOTAL),DISABLE
                       ENTRY(@D8),AT(326,3,70,10),USE(APH:Tanggal),DISABLE,RIGHT(1),FONT('Times New Roman',12,,),MSG('Tanggal berobat pasen'),TIP('Tanggal berobat pasen')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
Reset                  PROCEDURE(BYTE Force=0),DERIVED     ! Method added to host embed code
Run                    PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Update                 PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW4                 CLASS(BrowseClass)                    ! Browse using ?Browse:4
Q                      &Queue:Browse:4                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetFromAsk           PROCEDURE(*BYTE Request,*BYTE Response),DERIVED ! Method added to host embed code
ResetFromView          PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW4::Sort0:StepClass StepStringClass                      ! Default Step Manager
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False) ! Method added to host embed code
                     END

view::jtrans view(filesql2)
                project(FIL1:Byte1,FIL1:Byte2,FIL1:String1,FIL1:String2,FIL1:String3,FIL1:String4,FIL1:String5)
             end
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
BATAL_D_UTAMA ROUTINE
    SET( BRW4::View:Browse)
    LOOP
        NEXT(BRW4::View:Browse)
        IF ERRORCODE() THEN BREAK.
        DELETE(BRW4::View:Browse)
    END

BATAL_D_DUA ROUTINE
    SET(APDTcam)
    APD1:N0_tran=glo::no_nota
    SET(APD1:by_tranno,APD1:by_tranno)
    LOOP
        IF Access:APDTcam.Next()<>Level:Benign OR APD1:N0_tran <> glo::no_nota THEN BREAK.
        DELETE( APDTcam)
    END

BATAL_Transaksi ROUTINE
    SET(APDTcam)
    APD1:N0_tran=glo::no_nota
    APD1:Camp=APD:Camp
    SET(APD1:by_tran_cam,APD1:by_tran_cam)
    LOOP
        IF Access:APDTcam.Next()<>Level:Benign OR APD1:Camp<>APD:Camp THEN BREAK.
        DELETE( APDTcam)
    END


!Proses Penomoran Otomatis Transaksi
Isi_Nomor Routine
   vl_nomor=''
   display
   loop
      logout(1,nomor_batal)
      if errorcode()=56 then
         cycle.
      !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
      NOM:No_Urut=3
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
         NOMU:Urut =3
         NOMU:Nomor=vl_nomor
         add(nomoruse)
         if errorcode()>0 then
            vl_nomor=''
            rollback
            cycle
         end
         delete(nomor_batal)
         commit
         if errorcode()>0 then
            vl_nomor=''
            display
            cycle
         end
      else
         vl_nomor=''
         display
         rollback
      end
      break
   end
   if vl_nomor='' then
      loop
        logout(1,nomor_skr,nomoruse)
        if errorcode()=56 then cycle.
        !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
        NOM1:No_urut=3
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
           NOMU:Urut =3
           NOMU:Nomor=vl_nomor
           add(nomoruse)
           if errorcode()>0 then
              rollback
              cycle
           end
           NOM1:No_Trans=sub(vl_nomor,1,7)&format(deformat(sub(vl_nomor,8,5),@n5)+1,@p#####p)
           put(nomor_skr)
           if errorcode()=90 then
              rollback
              cycle
           elsif errorcode()>0 then
              rollback
              cycle
           else
              commit
           end
        else
           rollback
           cycle
        end
        break
      end
   end
   if format(sub(vl_nomor,6,2),@n2)<>month(today()) then
      !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
      nomor_batal{prop:sql}='delete dba.nomor_batal where No=3'
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 3=Transaksi Apotik ke pasien Rawat Jalan
         NOM1:No_urut=3
         access:nomor_skr.fetch(NOM1:PrimaryKey)
         if not(errorcode()) then
            vl_nomor =NOM1:No_Trans
            NOM1:No_Trans=sub(vl_nomor,1,3)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'00002'
            access:nomor_skr.update()
            if errorcode()<>0 then
               rollback
               cycle
            else
               vl_nomor=sub(vl_nomor,1,3)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'00001'
               commit
            end
         end
         break
      end
   end
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   APH:N0_tran=vl_nomor
   display

Batal_Nomor Routine
   !Silahkan diganti ---> 3=Transaksi Apotik ke pasien Rawat Jalan
   NOM:No_Urut =3
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=APH:N0_tran
   NOM:Keterangan='Aptk R. Jalan'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 3=Transaksi Apotik ke pasien Rawat Jalan
   NOMU:Urut =3
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOMU:Nomor=APH:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   delete(nomoruse)

Hapus_Nomor_Use Routine
   NOMU:Urut =3
   NOMU:Nomor=APH:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   if errorcode()=0 then
      delete(nomoruse)
   end

!Proses Penomoran Otomatis Transaksi
Isi_Nomor1 Routine
   vl_nomor=''
   display
   loop
      logout(1,nomor_batal)
      if errorcode()=56 then
         cycle.
      !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
      NOM:No_Urut=vl_no_urut
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
         NOMU:Urut =vl_no_urut
         NOMU:Nomor=vl_nomor
         add(nomoruse)
         if errorcode()>0 then
            vl_nomor=''
            rollback
            cycle
         end
         delete(nomor_batal)
         commit
         if errorcode()>0 then
            vl_nomor=''
            display
            cycle
         end
      else
         vl_nomor=''
         display
         rollback
      end
      break
   end
   if vl_nomor='' then
      loop
        logout(1,nomor_skr,nomoruse)
        if errorcode()=56 then cycle.
        !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
        NOM1:No_urut=vl_no_urut
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
           NOMU:Urut =vl_no_urut
           NOMU:Nomor=vl_nomor
           add(nomoruse)
           if errorcode()>0 then
              rollback
              cycle
           end
           NOM1:No_Trans=sub(vl_nomor,1,8)&format(deformat(sub(vl_nomor,9,4),@n4)+1,@p####p)
           put(nomor_skr)
           if errorcode()=90 then
              rollback
              cycle
           elsif errorcode()>0 then
              rollback
              cycle
           else
              commit
           end
        else
           rollback
           cycle
        end
        break
      end
   end
   if format(sub(vl_nomor,7,2),@n2)<>month(today()) then
      !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
      nomor_batal{prop:sql}='delete dba.nomor_batal where No='&vl_no_urut
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 3=Transaksi Apotik ke pasien Rawat Jalan
         NOM1:No_urut=vl_no_urut
         access:nomor_skr.fetch(NOM1:PrimaryKey)
         if not(errorcode()) then
            vl_nomor =NOM1:No_Trans
            NOM1:No_Trans=sub(vl_nomor,1,4)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'0002'
            access:nomor_skr.update()
            if errorcode()<>0 then
               rollback
               cycle
            else
               vl_nomor=sub(vl_nomor,1,4)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'0001'
               commit
            end
         end
         break
      end
   end
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   APH:N0_tran=vl_nomor
   display

Batal_Nomor1 Routine
   !Silahkan diganti ---> 3=Transaksi Apotik ke pasien Rawat Jalan
   NOM:No_Urut =vl_no_urut
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=APH:N0_tran
   NOM:Keterangan='Aptk R. Jalan'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 3=Transaksi Apotik ke pasien Rawat Jalan
   NOMU:Urut =vl_no_urut
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOMU:Nomor=APH:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   delete(nomoruse)

Hapus_Nomor_Use1 Routine
   NOMU:Urut =vl_no_urut
   NOMU:Nomor=APH:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   if errorcode()=0 then
      delete(nomoruse)
   end

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    CLEAR(ActionMessage)
  OF ChangeRecord
    ActionMessage = 'Changing a APHTRANS Record'
  END
  status=2
  CLEAR(JPas:Nama)
  CLEAR(JPas:Alamat)
  CLEAR(JPol:Nama_poli)
  CLEAR(loc::nama)
  CLEAR(loc::alamat)
  CLEAR(loc::RT)
  CLEAR(loc::rw)
  CLEAR(loc::kota)
  CEK_RUN=0
  ?OK{PROP:DISABLE}=TRUE
  discount=0
  pers_disc=0
  ?BROWSE:4{PROP:DISABLE}=TRUE
  ?Insert:5{PROP:DISABLE}=TRUE
  Hitung_campur = 0
  sudah_nomor = 0
  masuk_disc = 0
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_updaterawatjalan230809')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Insert:5
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  APH:Nomor_mr = 99999999
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APH:Record,History::APH:Record)
  SELF.AddHistoryField(?APH:Nomor_mr,1)
  SELF.AddHistoryField(?APH:Asal,8)
  SELF.AddHistoryField(?APH:NIP,13)
  SELF.AddHistoryField(?APH:NomorEPresribing,23)
  SELF.AddHistoryField(?APH:Kontrak,14)
  SELF.AddHistoryField(?APH:NoNota,17)
  SELF.AddHistoryField(?APH:dokter,16)
  SELF.AddHistoryField(?APH:Kode_Apotik,10)
  SELF.AddHistoryField(?APH:N0_tran,4)
  SELF.AddHistoryField(?APH:Biaya,3)
  SELF.AddHistoryField(?APH:Tanggal,2)
  SELF.AddUpdateFile(Access:APHTRANS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  case deformat(sub(clip(GL_entryapotik),3,2),@n2)
     of '01'
        vl_no_urut=22
     of '02'
        vl_no_urut=23
     of '04'
        vl_no_urut=24
     of '06'
        vl_no_urut=25
     of '07'
        vl_no_urut=26
     of '08'
        vl_no_urut=27
  END
  Relate:APDTRANS.Open                                     ! File TBTransResepObatCampur used by this procedure, so make sure it's RelationManager is open
  Relate:APDTRANSDet.Open                                  ! File TBTransResepObatCampur used by this procedure, so make sure it's RelationManager is open
  Relate:Ano_pakai.Open                                    ! File TBTransResepObatCampur used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket.Open                                     ! File TBTransResepObatCampur used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql.Open                                      ! File TBTransResepObatCampur used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql2.Open                                     ! File TBTransResepObatCampur used by this procedure, so make sure it's RelationManager is open
  Relate:IAP_SET.Open                                      ! File TBTransResepObatCampur used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File TBTransResepObatCampur used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_Batal.Open                                  ! File TBTransResepObatCampur used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File TBTransResepObatCampur used by this procedure, so make sure it's RelationManager is open
  Relate:SMPegawai.SetOpenRelated()
  Relate:SMPegawai.Open                                    ! File TBTransResepObatCampur used by this procedure, so make sure it's RelationManager is open
  Relate:TBTransResepDokterDetail.Open                     ! File TBTransResepObatCampur used by this procedure, so make sure it's RelationManager is open
  Relate:TBTransResepDokterEtiket.Open                     ! File TBTransResepObatCampur used by this procedure, so make sure it's RelationManager is open
  Relate:TBTransResepDokterHeader.Open                     ! File TBTransResepObatCampur used by this procedure, so make sure it's RelationManager is open
  Relate:TBTransResepObatCampur.Open                       ! File TBTransResepObatCampur used by this procedure, so make sure it's RelationManager is open
  Relate:Tbstawal.Open                                     ! File TBTransResepObatCampur used by this procedure, so make sure it's RelationManager is open
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPoli.UseFile                                     ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKelPeg.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APDTcam.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ApReLuar.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JTransaksi.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:APHTRANS
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
  BRW4.Init(?Browse:4,Queue:Browse:4.ViewPosition,BRW4::View:Browse,Queue:Browse:4,Relate:APDTRANS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  if self.request=1 then
     do isi_nomor
  end
  open(view::jtrans)
  ?Browse:4{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW4.Q &= Queue:Browse:4
  BRW4::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon APD:N0_tran for sort order 1
  BRW4.AddSortOrder(BRW4::Sort0:StepClass,APD:notran_kode) ! Add the sort order for APD:notran_kode for sort order 1
  BRW4.AddRange(APD:N0_tran,Relate:APDTRANS,Relate:APHTRANS) ! Add file relationship range limit for sort order 1
  BRW4.AddField(APD:Kode_brg,BRW4.Q.APD:Kode_brg)          ! Field APD:Kode_brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Nama_Brg,BRW4.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW4.AddField(APD:Jumlah,BRW4.Q.APD:Jumlah)              ! Field APD:Jumlah is a hot field or requires assignment from browse
  BRW4.AddField(APD:Total,BRW4.Q.APD:Total)                ! Field APD:Total is a hot field or requires assignment from browse
  BRW4.AddField(APD:Diskon,BRW4.Q.APD:Diskon)              ! Field APD:Diskon is a hot field or requires assignment from browse
  BRW4.AddField(APD:Camp,BRW4.Q.APD:Camp)                  ! Field APD:Camp is a hot field or requires assignment from browse
  BRW4.AddField(APD:N0_tran,BRW4.Q.APD:N0_tran)            ! Field APD:N0_tran is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Kode_brg,BRW4.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_updaterawatjalan230809',QuickWindow)  ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW4.AskProcedure = 3
  SELF.AddItem(ToolbarForm)
  BRW4.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  if (self.request=1 and self.response=2) or (self.request=3 and self.response=1) then
     do batal_nomor
     DO BATAL_D_DUA
     DO BATAL_D_UTAMA
  end
  if self.request=1 and self.response=1 then
     do hapus_nomor_use
  end
  close(view::jtrans)
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:APDTRANSDet.Close
    Relate:Ano_pakai.Close
    Relate:Apetiket.Close
    Relate:FileSql.Close
    Relate:FileSql2.Close
    Relate:IAP_SET.Close
    Relate:NomorUse.Close
    Relate:Nomor_Batal.Close
    Relate:Nomor_SKR.Close
    Relate:SMPegawai.Close
    Relate:TBTransResepDokterDetail.Close
    Relate:TBTransResepDokterEtiket.Close
    Relate:TBTransResepDokterHeader.Close
    Relate:TBTransResepObatCampur.Close
    Relate:Tbstawal.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_updaterawatjalan230809',QuickWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
    APH:Tanggal = Today()
    APH:Kode_Apotik = GL_entryapotik
    APH:Jam = clock()
    APH:User = glo:user_id
  PARENT.PrimeFields


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  JTra:No_Nota = APH:NoNota                                ! Assign linking field value
  Access:JTransaksi.Fetch(JTra:KeyNoNota)
  JDok:Kode_Dokter = APH:dokter                            ! Assign linking field value
  Access:JDokter.Fetch(JDok:KeyKodeDokter)
  JKon:KODE_KTR = APH:Kontrak                              ! Assign linking field value
  Access:JKontrak.Fetch(JKon:KeyKodeKtr)
  PEGA:Nik = APH:NIP                                       ! Assign linking field value
  Access:SMPegawai.Fetch(PEGA:Pkey)
  APH:Biaya = (LOC::TOTAL - discount)
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
      Cari_nama_poli
      SelectDokter
      Trig_UpdateRawatJalanDetil
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
    OF ?APH:Nomor_mr
      if vl_sudah=0
         IF CLIP(loc::nama) = ''
             JPas:Nomor_mr=APH:Nomor_mr
             GET( JPasien,JPas:KeyNomorMr)
             IF ERRORCODE() = 35 THEN
                 MESSAGE('Nomor RM Tidak Ada Dalam daftar')
                 JKon:KODE_KTR    =''
                 access:jkontrak.fetch(JKon:KeyKodeKtr)
                 PEGA:Nik         =''
                 access:smpegawai.fetch(PEGA:Pkey)
                 JDok:Kode_Dokter=''
                 access:jdokter.fetch(JDok:KeyKodeDokter)
                 APH:dokter       =''
                 APH:Asal         =''
                 APH:NIP          =''
                 APH:Kontrak      =''
                 APH:NoNota       =''
                 !APH:Nomor_mr     = 99999999
                 APH:cara_bayar   =2
                 status           =2
                 ?BROWSE:4{PROP:DISABLE}=1
                 ?Insert:5{PROP:DISABLE}=TRUE
                 ?APH:NIP{PROP:DISABLE}=true
                 ?APH:Kontrak{PROP:DISABLE}=TRUE
                 ?Button11{PROP:DISABLE}=TRUE
                 ?Button10{PROP:DISABLE}=true
                 ?APH:NoNota{PROP:DISABLE}=true
                 ?CallLookup:3{PROP:DISABLE}=false
                 CLEAR (JPas:Nama)
                 CLEAR (JPas:Alamat)
                 DISPLAY
                 SELECT(?APH:Nomor_mr)
             ELSE
                 ?BROWSE:4{PROP:DISABLE}=0
                 ?Insert:5{PROP:DISABLE}=0
                 glo::campur=0
                 !message('select kode_transaksi,lamabaru,kode_dokter,kontraktor,kode_poli,no_nota,nip from dba.jtransaksi where statusBatal<<>1 and nomor_mr='&aph:nomor_mr&' and tanggal='''&format(today(),@d10)&''' order by no_nota')
                 !(statusBatal<<>1 or statusBatal is null) and 
                 view::jtrans{prop:sql}='select kode_transaksi,lamabaru,kode_dokter,kontraktor,kode_poli,no_nota,nip from dba.jtransaksi where (statusBatal<<>1 or statusBatal is null) and nomor_mr='&aph:nomor_mr&' and tanggal='''&format(today(),@d10)&''' order by no_nota'
                 !if errorcode() then message(error()).
                 next(view::jtrans)
                 if not errorcode() then
                    JPas:Nomor_mr=aph:nomor_mr
                    access:jpasien.fetch(JPas:KeyNomorMr)
                    JDok:Kode_Dokter=FIL1:String1
                    access:jdokter.fetch(JDok:KeyKodeDokter)
                    APH:Asal     =FIL1:String3
                    APH:dokter   =FIL1:String1
                    !message(JTra:Kode_Transaksi)
                    !message(FIL1:Byte1&' '&FIL1:String2)
                    if FIL1:Byte1=3 then
                       JKon:KODE_KTR=FIL1:String2
                       access:jkontrak.fetch(JKon:KeyKodeKtr)
                       !message(JKon:NAMA_KTR)
                       APH:Kontrak =FIL1:String2
                       APH:NIP      =''
                       PEGA:Nik         =''
                       APH:NoNota    =FIL1:String4
                       access:smpegawai.fetch(PEGA:Pkey)
                       ?Button11{PROP:DISABLE}=false
                       ?Button10{PROP:DISABLE}=true
                       ?APH:NIP{PROP:DISABLE}=true
                       ?APH:Kontrak{PROP:DISABLE}=false
                       ?APH:NoNota{PROP:DISABLE}=false
                       ?CallLookup:3{PROP:DISABLE}=false
                    elsif FIL1:Byte1=1 then
                       JKon:KODE_KTR =''
                       access:jkontrak.fetch(JKon:KeyKodeKtr)
                       APH:Kontrak   =''
                       APH:NoNota    =''
                       PEGA:Nik      =FIL1:String5
                       access:smpegawai.fetch(PEGA:Pkey)
                       APH:NIP       =FIL1:String5
                       ?Button11{PROP:DISABLE}=true
                       ?Button10{PROP:DISABLE}=false
                       !?APH:NIP{PROP:DISABLE}=false
                       ?APH:Kontrak{PROP:DISABLE}=TRUE
                       ?APH:NoNota{PROP:DISABLE}=true
                       ?CallLookup:3{PROP:DISABLE}=false
                    else
                       JKon:KODE_KTR =''
                       access:jkontrak.fetch(JKon:KeyKodeKtr)
                       PEGA:Nik      =''
                       access:smpegawai.fetch(PEGA:Pkey)
                       APH:NIP       =''
                       APH:Kontrak   =''
                       APH:NoNota    =''
                       ?Button10{PROP:DISABLE}=true
                       ?Button11{PROP:DISABLE}=true
                       ?APH:NIP{PROP:DISABLE}=true
                       ?APH:Kontrak{PROP:DISABLE}=TRUE
                       ?APH:NoNota{PROP:DISABLE}=true
                       ?CallLookup:3{PROP:DISABLE}=false
                    end
                    APH:LamaBaru  =FIL1:Byte2
                    APH:cara_bayar=FIL1:Byte1
                    status=FIL1:Byte1
                    display
                 else
                    !message(JTra:Kode_Transaksi&' '&errorcode())
                    JKon:KODE_KTR    =''
                    access:jkontrak.fetch(JKon:KeyKodeKtr)
                    PEGA:Nik         =''
                    access:smpegawai.fetch(PEGA:Pkey)
                    JDok:Kode_Dokter=''
                    access:jdokter.fetch(JDok:KeyKodeDokter)
                    APH:dokter       =''
                    APH:Asal         =''
                    APH:NIP          =''
                    APH:Kontrak      =''
                    APH:NoNota       =''
                    APH:cara_bayar   =2
                    status=2
                    ?APH:NIP{PROP:DISABLE}=true
                    ?APH:Kontrak{PROP:DISABLE}=TRUE
                    ?APH:NoNota{PROP:DISABLE}=true
                    ?Button10{PROP:DISABLE}=true
                    ?Button11{PROP:DISABLE}=true
                    ?CallLookup:3{PROP:DISABLE}=false
                 end
             END
         ELSE
             APH:Nomor_mr = 99999999
         END
      end
      display
      !if vl_sudah=0
      !IF CLIP(loc::nama) = ''
      !    JPas:Nomor_mr=APH:Nomor_mr
      !    GET( JPasien,JPas:KeyNomorMr)
      !    IF ERRORCODE() = 35 THEN
      !        MESSAGE('Nomor RM Tidak Ada Dalam daftar')
      !        JKon:KODE_KTR    =''
      !        access:jkontrak.fetch(JKon:KeyKodeKtr)
      !        PEGA:Nik         =''
      !        access:smpegawai.fetch(PEGA:Pkey)
      !        JDok:Kode_Dokter=''
      !        access:jdokter.fetch(JDok:KeyKodeDokter)
      !        APH:dokter       =''
      !        APH:Asal         =''
      !        APH:NIP          =''
      !        APH:Kontrak      =''
      !        APH:NoNota       =''
      !        !APH:Nomor_mr     = 99999999
      !        APH:cara_bayar   =2
      !        status           =2
      !        ?BROWSE:4{PROP:DISABLE}=1
      !        ?Insert:5{PROP:DISABLE}=TRUE
      !        ?APH:NIP{PROP:DISABLE}=true
      !        ?APH:Kontrak{PROP:DISABLE}=TRUE
      !        ?Button11{PROP:DISABLE}=TRUE
      !        ?Button10{PROP:DISABLE}=true
      !        ?APH:NoNota{PROP:DISABLE}=true
      !
      !        CLEAR (JPas:Nama)
      !        CLEAR (JPas:Alamat)
      !        DISPLAY
      !        SELECT(?APH:Nomor_mr)
      !    ELSE
      !        ?BROWSE:4{PROP:DISABLE}=0
      !        ?Insert:5{PROP:DISABLE}=0
      !        glo::campur=0
      !        jtransaksi{prop:sql}='select * from dba.jtransaksi where nomor_mr='&aph:nomor_mr&' and tanggal='''&format(today(),@d10)&''' order by no_nota'
      !        jtransaksi{prop:sql}='select * from dba.jtransaksi where nomor_mr='&aph:nomor_mr&' and tanggal='''&format(today(),@d10)&''' order by no_nota'
      !        next(jtransaksi)
      !        if not errorcode() then
      !           JPas:Nomor_mr=aph:nomor_mr
      !           access:jpasien.fetch(JPas:KeyNomorMr)
      !           JDok:Kode_Dokter=JTra:Kode_dokter
      !           access:jdokter.fetch(JDok:KeyKodeDokter)
      !           APH:Asal     =JTra:Kode_poli
      !           APH:dokter   =JTra:Kode_dokter
      !           !message(JTra:Kode_Transaksi)
      !           if JTra:Kode_Transaksi=3 then
      !              JKon:KODE_KTR=JTra:Kontraktor
      !              access:jkontrak.fetch(JKon:KeyKodeKtr)
      !              APH:Kontrak =JTra:Kontraktor
      !              APH:NoNota  =JTra:No_Nota
      !              APH:NIP      =''
      !              PEGA:Nik         =''
      !              access:smpegawai.fetch(PEGA:Pkey)
      !              ?Button11{PROP:DISABLE}=false
      !              ?Button10{PROP:DISABLE}=true
      !              ?APH:NIP{PROP:DISABLE}=true
      !              ?APH:Kontrak{PROP:DISABLE}=false
      !              ?APH:NoNota{PROP:DISABLE}=false
      !           elsif JTra:Kode_Transaksi=1 then
      !              JKon:KODE_KTR =''
      !              access:jkontrak.fetch(JKon:KeyKodeKtr)
      !              APH:Kontrak   =''
      !              APH:NoNota    =JTra:No_Nota
      !              PEGA:Nik      =JTra:NIP
      !              access:smpegawai.fetch(PEGA:Pkey)
      !              APH:NIP       =JTra:NIP
      !              ?Button11{PROP:DISABLE}=true
      !              ?Button10{PROP:DISABLE}=true
      !              ?APH:NIP{PROP:DISABLE}=false
      !              ?APH:Kontrak{PROP:DISABLE}=TRUE
      !              ?APH:NoNota{PROP:DISABLE}=true
      !           else
      !              JKon:KODE_KTR =''
      !              access:jkontrak.fetch(JKon:KeyKodeKtr)
      !              PEGA:Nik      =''
      !              access:smpegawai.fetch(PEGA:Pkey)
      !              APH:Asal      =''
      !              APH:NIP       =''
      !              APH:Kontrak   =''
      !              APH:NoNota    =JTra:No_Nota
      !              ?Button10{PROP:DISABLE}=false
      !              ?Button11{PROP:DISABLE}=true
      !              ?APH:NIP{PROP:DISABLE}=true
      !              ?APH:Kontrak{PROP:DISABLE}=TRUE
      !              ?APH:NoNota{PROP:DISABLE}=true
      !           end
      !           APH:LamaBaru  =JTra:LamaBaru
      !           APH:cara_bayar=JTra:Kode_Transaksi
      !           status=JTra:Kode_Transaksi
      !           display
      !        else
      !           !message(JTra:Kode_Transaksi&' '&errorcode())
      !           JKon:KODE_KTR    =''
      !           access:jkontrak.fetch(JKon:KeyKodeKtr)
      !           PEGA:Nik         =''
      !           access:smpegawai.fetch(PEGA:Pkey)
      !           JDok:Kode_Dokter=''
      !           access:jdokter.fetch(JDok:KeyKodeDokter)
      !           APH:dokter       =''
      !           APH:Asal         =''
      !           APH:NIP          =''
      !           APH:Kontrak      =''
      !           APH:NoNota       =''
      !           APH:cara_bayar   =2
      !           status=2
      !           ?APH:NIP{PROP:DISABLE}=true
      !           ?APH:Kontrak{PROP:DISABLE}=TRUE
      !           ?APH:NoNota{PROP:DISABLE}=true
      !        end
      !    END
      !ELSE
      !    APH:Nomor_mr = 99999999
      !END
      !end
      !display
    OF ?status
      if vl_sudah=0
      IF CEK_RUN = 0
        CASE status
        OF 1
           JKon:KODE_KTR=''
           access:jkontrak.fetch(JKon:KeyKodeKtr)
           APH:Kontrak=''
           !APH:NoNota=''
           ?APH:Kontrak{PROP:DISABLE}=TRUE
           ?Button11{PROP:DISABLE}=TRUE
           ?Button10{PROP:DISABLE}=false
           ?APH:NoNota{PROP:DISABLE}=false
           ?CallLookup:3{PROP:DISABLE}=false
           ?Insert:5{PROP:DISABLE}=false
           display
           !select(?Button10)
        of 2
           JKon:KODE_KTR=''
           access:jkontrak.fetch(JKon:KeyKodeKtr)
           APH:Kontrak=''
           PEGA:Nik=''
           access:smpegawai.fetch(PEGA:Pkey)
           APH:NIP=''
           !APH:NoNota=''
           ?APH:Kontrak{PROP:DISABLE}=TRUE
           ?Button11{PROP:DISABLE}=TRUE
           ?APH:NIP{PROP:DISABLE}=TRUE
           ?Button10{PROP:DISABLE}=true
           ?APH:NoNota{PROP:DISABLE}=false
           ?CallLookup:3{PROP:DISABLE}=false
           ?Insert:5{PROP:DISABLE}=false
           display
        OF 3
           PEGA:Nik=''
           access:smpegawai.fetch(PEGA:Pkey)
           APH:NIP=''
           ?APH:NIP{PROP:DISABLE}=TRUE
           ?APH:Kontrak{PROP:DISABLE}=false
           ?Button11{PROP:DISABLE}=false
           ?Button10{PROP:DISABLE}=true
           ?APH:NoNota{PROP:DISABLE}=false
           ?CallLookup:3{PROP:DISABLE}=false
           ?Insert:5{PROP:DISABLE}=false
           display
           !select(?Button11)
        end
        APH:cara_bayar=status
      end
      end
    OF ?OK
      if APH:NoNota='' then
         message('No nota harus terisi !!!')
         cycle
      end
      !if vl_sudah=0
      sudah_nomor = 0
      glo::no_nota = APH:N0_tran
      !memperbaharui file Aphtrans, apdtrans, gstokaptk, apreluar
      CEK_RUN=1
      APH:User=GL::Prefix
      ! *****UNTUK file ApHTrans******
      APH:Bayar=0
      APH:Ra_jal=1
      APH:cara_bayar=status
      APH:Kode_Apotik=GL_entryapotik
      APH:User = Glo:USER_ID
      
      !untuk file ApReLuar
      IF CLIP(loc::nama) <> ''
          APR:Nama = loc::nama
          APR:Alamat = loc::alamat
          APR:RT     = loc::RT
          APR:RW     = loc::rw
          APR:Kota   = loc::kota
          APR:N0_tran = APH:N0_tran
          Access:ApReLuar.Insert()
      END
      
      !untuk file ApDTrans
      !IF discount <> 0
      !    APD:N0_tran = APH:N0_tran
      !    APD:Kode_brg = '_Disc'
      !    APD:Total = - discount
      !    APD:Jumlah = pers_disc
      !    Access:APDTRANS.Insert()
      !END
      
      !cek dulu bulannya ya, kalau sudah berubah, tulis dulu ke file awal bulan
      IF MONTH(glo::tgl_awal_kerja) <> mONTH(TODAY())
         APH:Tanggal = TODAY()
         Tahun_ini = YEAR(TODAY())
         Loc::delete=0
         SET(APDTRANS)
         APD:N0_tran = APH:N0_tran
         SET(APD:by_transaksi,APD:by_transaksi)
         LOOP
            IF Access:APDTRANS.Next()<>Level:Benign OR APD:N0_tran <> APH:N0_tran THEN BREAK.
            GSTO:Kode_Barang = APD:Kode_brg
            GSTO:Kode_Apotik = GL_entryapotik
            GET(GStokAptk,GSTO:KeyBarang)
      
            !disini isi dulu tbstawal
            TBS:Kode_Apotik = GL_entryapotik
            TBS:Kode_Barang = APD:Kode_brg
            TBS:Tahun = Tahun_ini
            GET(Tbstawal,TBS:kdap_brg)
            IF ERRORCODE() = 0
                CASE MONTH(TODAY())
                    OF 1
                        IF TBS:Januari= 0
                            TBS:Januari = GSTO:Saldo
                            PUT(Tbstawal)
                        END
                    OF 2
                        IF TBS:Februari= 0
                            TBS:Februari = GSTO:Saldo
                            PUT(Tbstawal)
                        END
                    OF 3
                        IF TBS:Maret= 0
                            TBS:Maret = GSTO:Saldo
                            PUT(Tbstawal)
                        END
                    OF 4
                        IF TBS:April= 0
                            TBS:April = GSTO:Saldo
                            PUT(Tbstawal)
                        END
                    OF 5
                        IF TBS:Mei= 0
                            TBS:Mei = GSTO:Saldo
                            PUT(Tbstawal)
                        END
                    OF 6
                        IF TBS:Juni= 0
                            TBS:Juni = GSTO:Saldo
                            PUT(Tbstawal)
                        END
                    OF 7
                        IF TBS:Juli= 0
                            TBS:Juli = GSTO:Saldo
                            PUT(Tbstawal)
                        END
                    OF 8
                        IF TBS:Agustus= 0
                            TBS:Agustus = GSTO:Saldo
                            PUT(Tbstawal)
                        END
                    OF 9
                        IF TBS:September= 0
                            TBS:September = GSTO:Saldo
                            PUT(Tbstawal)
                        END
                        
                    OF 10
                        IF TBS:Oktober= 0
                            TBS:Oktober = GSTO:Saldo
                            PUT(Tbstawal)
                        END
                
                    OF 11
                        IF TBS:November= 0
                            TBS:November = GSTO:Saldo
                            PUT(Tbstawal)
                        END
                    OF 12
                        IF TBS:Desember= 0
                            TBS:Desember = GSTO:Saldo
                            PUT(Tbstawal)
                        END
                END
      
            ELSE
                CASE MONTH(TODAY())
                        OF 1
                            TBS:Januari = GSTO:Saldo
                        OF 2
                            TBS:Februari = GSTO:Saldo
                        OF 3
                            TBS:Maret = GSTO:Saldo
                        OF 4
                            TBS:April = GSTO:Saldo
                        OF 5
                            TBS:Mei = GSTO:Saldo
                        OF 6
                            TBS:Juni = GSTO:Saldo
                        OF 7
                            TBS:Juli = GSTO:Saldo
                        OF 8
                            TBS:Agustus = GSTO:Saldo
                        OF 9
                            TBS:September = GSTO:Saldo
                        OF 10
                            TBS:Oktober = GSTO:Saldo
                        OF 11
                            TBS:November = GSTO:Saldo
                        OF 12
                            TBS:Desember = GSTO:Saldo
                END
                TBS:Kode_Apotik = GL_entryapotik
                TBS:Kode_Barang = GSTO:Kode_Barang
                TBS:Tahun = Tahun_ini
                ADD(Tbstawal)
            END
         END
      END
      !end
      vl_sudah=1
    OF ?Cancel
      !if vl_sudah=0
      !    DO BATAL_D_DUA
      !    DO BATAL_D_UTAMA
      !end
    OF ?discount
      if vl_sudah=0
      IF DISCOUNT > 0 AND masuk_disc = 0
          masuk_disc = 1
      END
      end
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CallLookup
      ThisWindow.Update
      JPol:POLIKLINIK = APH:Asal
      IF SELF.Run(1,SelectRecord) = RequestCompleted       ! Call lookup procedure and verify RequestCompleted
        APH:Asal = JPol:POLIKLINIK
      END
      ThisWindow.Reset(1)
    OF ?Button10
      ThisWindow.Update
      if vl_sudah=0
         globalrequest=selectrecord
         selectpegawai
         APH:NIP=PEGA:Nik
         display
         if status=1 then
         !aph:nip<>'' then
            enable(?ok)
         else
            disable(?ok)
         end
      
         if APH:NIP<>'' then
            ?insert:5{prop:disable}=false
         else
            ?insert:5{prop:disable}=true
         end
      end
    OF ?Button13
      ThisWindow.Update
      glo:mrstring=APH:Nomor_mr
      !message(glo:mrstring)
      globalrequest=selectrecord
      SelectResepHeader
      APH:NomorEPresribing=TBT2:NoTrans
      tbtransresepdokterdetail{prop:sql}='select * from dba.tbtransresepdokterdetail where notrans='''&TBT2:NoTrans&''''
      loop
         if access:tbtransresepdokterdetail.next()<>level:benign then break.
         !message(APH:N0_tran&' '&TBT:ItemCode&' '&TBT:Qty)
      
         APD:N0_tran      =APH:N0_tran
         APD:Kode_brg     =TBT:ItemCode
         APD:Jumlah       =TBT:Qty
         display
      
         !HITUNG HARGA
         GSTO:Kode_Apotik = GL_entryapotik
         GSTO:Kode_Barang = APD:Kode_brg
         GET(GStokaptk,GSTO:KeyBarang)
         !message(APD:Jumlah&' '&GSTO:Saldo)
      
         IF APD:Jumlah <= GSTO:Saldo and APD:Jumlah<>0 then
            GBAR:Kode_brg =APD:Kode_brg
            access:gbarang.fetch(GBAR:KeyKodeBrg)
      
            !?OK{PROP:DISABLE}=0
            if GBAR:Kelompok=19 then
               APD:Total = GL_beaR + (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1.3)) * APD:Jumlah)
            else
               CASE  status
               OF 1
                  APD:Total = APD:Jumlah * GSTO:Harga_Dasar * (1+(GL_PPN/100))
               OF 2
                  if GBAR:Kelompok=22 then
                     APD:Total = GL_beaR + |
                               (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+( 10/ 100 ))) * APD:Jumlah)
                  else
                     APD:Total = GL_beaR + |
                               (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+( GL_Um_kls1 / 100 ))) * APD:Jumlah)
                  end
               OF 3
                  JKon:KODE_KTR=APH:Kontrak
                  access:jkontrak.fetch(JKon:KeyKodeKtr)
                  if JKon:HargaObat>0 then
                     APD:Total = GL_beaR + |
                              (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) *JKon:HargaObat) * APD:Jumlah)
                  else
                     APO:KODE_KTR = GLO::back_up
                     APO:Kode_brg = APD:Kode_brg
                     GET(APOBKONT,APO:by_kode_ktr)
                     IF ERRORCODE() then
                        APD:Total = GL_beaR + |
                               (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(GL_nt_kls2 / 100 ))) * APD:Jumlah)
                     ELSE
                        APD:Total = GL_beaR + |
                               (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+ (APO:PERS_TAMBAH / 100 ))) * APD:Jumlah)
                     end
                  END
               END
            end
            !Awal Perbaikan Tgl 10/10/2005 Obat Onkologi
            if GBAR:Kelompok=20 then
               GSGD:Kode_brg=APD:Kode_brg
               access:gstockgdg.fetch(GSGD:KeyKodeBrg)
               APD:Total = GL_beaR + ((GSTO:Harga_Dasar*(1-GSGD:Discount/100))*(1+GL_PPN/100)) * APD:Jumlah
            end
            !Akhir Perbaikan Tgl 10/10/2005 Obat Onkologi
      
            !Awal Perbaikan Tgl 20/10/2005 Obat Askes
            if sub(clip(APD:Kode_brg),1,3)='3.3' then
               IF sub(clip(APD:Kode_brg),1,8)='3.3.EMBA'
                  !Resep Jadi
                  GSGD:Kode_brg=APD:Kode_brg
                  access:gstockgdg.fetch(GSGD:KeyKodeBrg)
                  APD:Total = GSTO:Harga_Dasar * APD:Jumlah
               else
                  !Resep Jadi
                  GSGD:Kode_brg=APD:Kode_brg
                  access:gstockgdg.fetch(GSGD:KeyKodeBrg)
                  vl_hna=(GSTO:Harga_Dasar*(1-GSGD:Discount/100))*1.1
                  if vl_hna<50000 then
                     APD:Total = GL_beaR + vl_hna * APD:Jumlah * 1.2
                  elsif vl_hna<100000 then
                     APD:Total = GL_beaR + vl_hna * APD:Jumlah * 1.15
                  else
                     APD:Total = GL_beaR + vl_hna * APD:Jumlah * 1.1
                  end
                  display
               end
            end
            !Akhir Perbaikan Tgl 20/10/2005 Obat Askes
      
            APD:Harga_Dasar = GSTO:Harga_Dasar
            vl_diskon_pct=(APD:Diskon*100)/APD:Total
            vl_total     =APD:Total-APD:Diskon
            display
            !SELESAI HITUNG HARGA
      
            access:apdtrans.insert()
         end
         brw4.resetsort(1)
      end
      display
      
      
    OF ?APH:Kontrak
      if vl_sudah=0
         JKon:KODE_KTR=APH:Kontrak
         access:jkontrak.fetch(JKon:KeyKodeKtr)
         if APH:NoNota<>'' and APH:Kontrak<>'' then
            ?insert:5{prop:disable}=false
         else
            ?insert:5{prop:disable}=true
         end
         display
      end
    OF ?Button11
      ThisWindow.Update
      if vl_sudah=0
         globalrequest=selectrecord
         selectjkontrak
         APH:Kontrak=JKon:KODE_KTR
         if APH:NoNota<>'' and APH:Kontrak<>'' then
            ?insert:5{prop:disable}=false
         else
            ?insert:5{prop:disable}=true
         end
         display
         if status=3 then
         !and APH:Kontraktor<>'' then
            enable(?ok)
         else
            disable(?ok)
         end
      end
      display
    OF ?APH:NoNota
      if vl_sudah=0
         JTra:No_Nota=aph:nonota
         if access:jtransaksi.fetch(JTra:KeyNoNota)=level:benign then
            if JTra:Kontraktor='' then
               message('Bukan pasien kontraktor !!!')
               aph:nonota=''
            else
               JKon:KODE_KTR=JTra:Kontraktor
               access:jkontrak.fetch(JKon:KeyKodeKtr)
               APH:Kontrak=JTra:Kontraktor
            end
         else
            message('Tidak ada nomor transaksi seperti di atas !!!')
            aph:nonota=''
         end
         if APH:NoNota<>'' and APH:Kontrak<>'' then
            ?insert:5{prop:disable}=false
         else
            ?insert:5{prop:disable}=true
         end
         display
      end
      
    OF ?calllookup:3
      ThisWindow.Update
      glo:mr=APH:Nomor_mr
      display
      globalrequest=selectrecord
      if GLO:LEVEL>1 then
      SelectJTransaksiMR()
      else
      SelectJTransaksiMRPengatur()
      end
      if vl_sudah=0
         !if JTra:Kontraktor='' then
         !   message('Bukan pasien kontraktor !!!')
         !   aph:nonota=''
         !else
            APH:NoNota=JTra:No_Nota
            display
            JKon:KODE_KTR=JTra:Kontraktor
            access:jkontrak.fetch(JKon:KeyKodeKtr)
            APH:Kontrak=JTra:Kontraktor
            if JTra:No_Nota<>'' then
            enable(?Insert:5)
            enable(?Browse:4)
            end
         !end
         !f APH:NoNota<>'' and APH:Kontrak<>'' then
         !  ?insert:5{prop:disable}=false
         !lse
         !  ?insert:5{prop:disable}=true
         !nd
         display
      end
      
    OF ?APH:dokter
      IF APH:dokter OR ?APH:dokter{Prop:Req}
        JDok:Kode_Dokter = APH:dokter
        IF Access:JDokter.TryFetch(JDok:KeyKodeDokter)
          IF SELF.Run(2,SelectRecord) = RequestCompleted
            APH:dokter = JDok:Kode_Dokter
          ELSE
            SELECT(?APH:dokter)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup:2
      ThisWindow.Update
      JDok:Kode_Dokter = APH:dokter
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        APH:dokter = JDok:Kode_Dokter
      END
      ThisWindow.Reset(1)
    OF ?Button12
      ThisWindow.Update
      if vl_sudah=0
         globalrequest=selectrecord
         selectjtransaksi
         if JTra:Kontraktor<>'' then
            JKon:KODE_KTR=JTra:Kontraktor
            access:jkontrak.fetch(JKon:KeyKodeKtr)
            JPas:Nomor_mr=JTra:Nomor_Mr
            access:jpasien.fetch(JPas:KeyNomorMr)
            APH:dokter=JTra:Kode_dokter
            access:jdokter.fetch(JDok:KeyKodeDokter)
            APH:NoNota=JTra:No_Nota
            APH:Nomor_mr=JTra:Nomor_Mr
            APH:NIP      =JTra:NIP
            APH:Kontrak =JTra:Kontraktor
            if APH:Kontrak<>'' then
               APH:NoNota  =JTra:No_Nota
            else
               APH:NoNota  =''
            end
            display
            APH:LamaBaru =JTra:LamaBaru
            APH:cara_bayar=JTra:Kode_Transaksi
         else
            JKon:KODE_KTR =''
            access:jkontrak.fetch(JKon:KeyKodeKtr)
            APH:Asal      =''
            APH:NIP       =''
            APH:Kontrak   =''
            APH:NoNota    =''
            APH:LamaBaru  =JTra:LamaBaru
            APH:cara_bayar=JTra:Kode_Transaksi
            APH:dokter    =JTra:Kode_dokter
            access:jdokter.fetch(JDok:KeyKodeDokter)
            APH:NoNota    =JTra:No_Nota
            display
         end
         status=JTra:Kode_Transaksi
         if status=0 then
            status=2
         end
         ?BROWSE:4{PROP:DISABLE}=0
         ?Insert:5{PROP:DISABLE}=0
         glo::campur=0
         APH:Asal=JTra:Kode_poli
         display
      end
    OF ?OK
      ThisWindow.Update
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?Button9
      ThisWindow.Update
      if vl_sudah=0
         IF LOC::TOTAL <> 0
             !vl_round = round(APH:Biaya)
             !Pembulatan
             vl_hasil=0
             vl_real=APH:Biaya
             vl_seribu=round(APH:Biaya,1000)
             !message(vl_seribu)
             if vl_seribu<vl_real then
                vl_selisih=vl_real-vl_seribu
                !message(vl_selisih)
                if vl_selisih>100 then
                   vl_selisih=500
                   vl_hasil=vl_seribu+vl_selisih
                else
                   vl_hasil=vl_seribu
                end
             else
                vl_selisih=vl_seribu-vl_real
                !message(vl_selisih)
                if vl_selisih>400 then
                   vl_hasil=vl_seribu-500
                else
                   vl_hasil=vl_seribu
                end
             end
             !selesai
             !APH:Biaya = ROUND( ((APH:Biaya /100) + 0.4999) , 1 ) *100
             APH:Biaya = vl_hasil
             IF discount <>0
                 loc::copy_total = APH:Biaya + discount
                 masuk_disc = 1
                 ?discount{PROP:READONLY}=FALSE
             ELSE
                 loc::copy_total = APH:Biaya
             END
             SET( BRW4::View:Browse)
                 LOOP
                     NEXT(BRW4::View:Browse)
                     IF APD:Camp = 0 AND APD:N0_tran = APH:N0_tran
                         APD:Total = APD:Total + loc::copy_total - LOC::TOTAL
                         PUT(APDTRANS)
                         BREAK
                     END
                     IF ERRORCODE() > 0  OR  APD:N0_tran <> APH:N0_tran
                         SET( BRW4::View:Browse)
                         LOOP
                             NEXT( BRW4::View:Browse )
                             IF APD:Kode_brg = '_Campur'
                                 APD:Total = APD:Total + loc::copy_total - LOC::TOTAL
                                 PUT(APDTRANS)
                                 SET(APDTcam)
                                 APD1:N0_tran = APH:N0_tran
                                 APD1:Camp = APD:Camp
                                 SET (APD1:by_tranno,APD1:by_tranno)
                                 LOOP
                                     NEXT( APDTcam )
                                     IF APD1:Kode_brg = '_Biaya'
                                         APD1:Total = APD1:Total  + loc::copy_total - LOC::TOTAL
                                         PUT(APDTcam)
                                         BREAK
                                     END
                                 END
      
                                 BREAK
                             END
                         END
                         BREAK
                     END
                     
                 END
                 LOC::TOTAL = loc::copy_total
             DISPLAY
             BRW4.RESETSORT(1)
            
         END
      end
    OF ?discount
      ThisWindow.Reset(1)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
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
  ReturnValue = PARENT.TakeSelected()
    CASE FIELD()
    OF ?APH:Asal
      JPol:POLIKLINIK = APH:Asal
      IF Access:JPoli.TryFetch(JPol:BY_POLI)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          APH:Asal = JPol:POLIKLINIK
        END
      END
      ThisWindow.Reset
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
    OF EVENT:AlertKey
      select(?cancel)
      presskey( 13)
    OF EVENT:CloseWindow
      IF SELF.RESPONSE = 1 THEN
         !PrintTransRawatJalan
      END
    OF EVENT:Timer
      if vl_sudah=0
         IF LOC::TOTAL = 0
             ?OK{PROP:DISABLE}=1
         ELSE
             ?OK{PROP:DISABLE}=0
         END
      end
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APH:Biaya = (LOC::TOTAL - discount)


BRW4.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW4.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:5
    SELF.ChangeControl=?Change:5
    SELF.DeleteControl=?Delete:5
  END


BRW4.ResetFromAsk PROCEDURE(*BYTE Request,*BYTE Response)

  CODE
  PARENT.ResetFromAsk(Request,Response)
  brw4.resetsort(1)
  set(BRW4::View:Browse)
  next(BRW4::View:Browse)
  if not(errorcode()) then
     ?Button10{PROP:DISABLE}=true
     ?Button11{PROP:DISABLE}=true
     ?APH:Kontrak{PROP:DISABLE}=TRUE
     ?APH:NoNota{PROP:DISABLE}=true
     ?CallLookup:3{PROP:DISABLE}=true
  else
     if status=3 then
        ?Button11{PROP:DISABLE}=false
        ?Button10{PROP:DISABLE}=true
        ?APH:Kontrak{PROP:DISABLE}=false
        ?APH:NoNota{PROP:DISABLE}=false
        ?CallLookup:3{PROP:DISABLE}=false
     elsif status=1 then
        ?Button11{PROP:DISABLE}=true
        ?Button10{PROP:DISABLE}=false
        ?APH:Kontrak{PROP:DISABLE}=TRUE
        ?APH:NoNota{PROP:DISABLE}=true
        ?CallLookup:3{PROP:DISABLE}=true
     else
        ?Button10{PROP:DISABLE}=true
        ?Button11{PROP:DISABLE}=true
        ?APH:Kontrak{PROP:DISABLE}=TRUE
        ?APH:NoNota{PROP:DISABLE}=true
        ?CallLookup:3{PROP:DISABLE}=true
     end
  end
  
  disable(?status)


BRW4.ResetFromView PROCEDURE

LOC::TOTAL:Sum       REAL                                  ! Sum variable for browse totals
discount:Sum         REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:APDTRANS.SetQuickScan(1)
  SELF.Reset
  LOOP
    CASE SELF.Next()
    OF Level:Notify
      BREAK
    OF Level:Fatal
      SETCURSOR()
      RETURN
    END
    SELF.SetQueueRecord
    LOC::TOTAL:Sum += APD:Total
    discount:Sum += APD:Diskon
  END
  LOC::TOTAL = LOC::TOTAL:Sum
  discount = discount:Sum
  PARENT.ResetFromView
  Relate:APDTRANS.SetQuickScan(0)
  SETCURSOR()


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

