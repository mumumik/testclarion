

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N023.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N018.INC'),ONCE        !Req'd for module callout resolution
                     END


SelectJRujuk PROCEDURE                                     ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(JRujuk)
                       PROJECT(JRUK:Rujukan)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
JRUK:Rujukan           LIKE(JRUK:Rujukan)             !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a JRujuk Record'),AT(,,158,188),FONT('Arial',8,,),IMM,HLP('SelectJRujuk'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,142,124),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('64L(2)|M~Rujukan~L(2)@s15@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(105,148,45,14),USE(?Select:2)
                       SHEET,AT(4,4,150,162),USE(?CurrentTab)
                         TAB('JRUK:KeyRujukan'),USE(?Tab:2)
                         END
                       END
                       BUTTON('Close'),AT(60,170,45,14),USE(?Close)
                       BUTTON('Help'),AT(109,170,45,14),USE(?Help),STD(STD:Help)
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
  GlobalErrors.SetProcedureName('SelectJRujuk')
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
  Relate:JRujuk.Open                                       ! File JRujuk used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:JRujuk,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,JRUK:KeyRujukan)                      ! Add the sort order for JRUK:KeyRujukan for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,JRUK:Rujukan,1,BRW1)           ! Initialize the browse locator using  using key: JRUK:KeyRujukan , JRUK:Rujukan
  BRW1.AddField(JRUK:Rujukan,BRW1.Q.JRUK:Rujukan)          ! Field JRUK:Rujukan is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectJRujuk',QuickWindow)                 ! Restore window settings from non-volatile store
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
    Relate:JRujuk.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectJRujuk',QuickWindow)              ! Save window data to non-volatile store
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

SelectJTbTransaksi PROCEDURE                               ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(JTbTransaksi)
                       PROJECT(JTbT:KODE_TRANS)
                       PROJECT(JTbT:Nama_Transaksi)
                       PROJECT(JTbT:Status)
                       PROJECT(JTbT:Keterangan)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
JTbT:KODE_TRANS        LIKE(JTbT:KODE_TRANS)          !List box control field - type derived from field
JTbT:Nama_Transaksi    LIKE(JTbT:Nama_Transaksi)      !List box control field - type derived from field
JTbT:Status            LIKE(JTbT:Status)              !List box control field - type derived from field
JTbT:Keterangan        LIKE(JTbT:Keterangan)          !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a JTbTransaksi Record'),AT(,,240,188),FONT('Arial',8,,),IMM,HLP('SelectJTbTransaksi'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,224,124),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('44R(2)|M~KODE TRANS~C(0)@n5@80L(2)|M~Nama Transaksi~L(2)@s30@28L(2)|M~Status~L(2' &|
   ')@s6@80L(2)|M~Keterangan~L(2)@s20@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(187,148,45,14),USE(?Select:2)
                       SHEET,AT(4,4,232,162),USE(?CurrentTab)
                         TAB('JTbT:KeyKodeTransaksi'),USE(?Tab:2)
                         END
                         TAB('JTbT:KeyNamaTransaksi'),USE(?Tab:3)
                         END
                       END
                       BUTTON('Close'),AT(142,170,45,14),USE(?Close)
                       BUTTON('Help'),AT(191,170,45,14),USE(?Help),STD(STD:Help)
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
  GlobalErrors.SetProcedureName('SelectJTbTransaksi')
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
  Relate:JTbTransaksi.Open                                 ! File JTbTransaksi used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:JTbTransaksi,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,JTbT:KeyNamaTransaksi)                ! Add the sort order for JTbT:KeyNamaTransaksi for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,JTbT:Nama_Transaksi,,BRW1)     ! Initialize the browse locator using  using key: JTbT:KeyNamaTransaksi , JTbT:Nama_Transaksi
  BRW1.AddSortOrder(,JTbT:KeyKodeTransaksi)                ! Add the sort order for JTbT:KeyKodeTransaksi for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,JTbT:KODE_TRANS,1,BRW1)        ! Initialize the browse locator using  using key: JTbT:KeyKodeTransaksi , JTbT:KODE_TRANS
  BRW1.AddField(JTbT:KODE_TRANS,BRW1.Q.JTbT:KODE_TRANS)    ! Field JTbT:KODE_TRANS is a hot field or requires assignment from browse
  BRW1.AddField(JTbT:Nama_Transaksi,BRW1.Q.JTbT:Nama_Transaksi) ! Field JTbT:Nama_Transaksi is a hot field or requires assignment from browse
  BRW1.AddField(JTbT:Status,BRW1.Q.JTbT:Status)            ! Field JTbT:Status is a hot field or requires assignment from browse
  BRW1.AddField(JTbT:Keterangan,BRW1.Q.JTbT:Keterangan)    ! Field JTbT:Keterangan is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectJTbTransaksi',QuickWindow)           ! Restore window settings from non-volatile store
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
    Relate:JTbTransaksi.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectJTbTransaksi',QuickWindow)        ! Save window data to non-volatile store
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

SelectJTindaka PROCEDURE                                   ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(JTindaka)
                       PROJECT(JTin:KodeTind)
                       PROJECT(JTin:NamaTind)
                       PROJECT(JTin:UPF)
                       PROJECT(JTin:Keterangan)
                       PROJECT(JTin:BiayaDasar)
                       PROJECT(JTin:Kelas1)
                       PROJECT(JTin:Kelas2)
                       PROJECT(JTin:Kelas3)
                       PROJECT(JTin:VIP)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
JTin:KodeTind          LIKE(JTin:KodeTind)            !List box control field - type derived from field
JTin:NamaTind          LIKE(JTin:NamaTind)            !List box control field - type derived from field
JTin:UPF               LIKE(JTin:UPF)                 !List box control field - type derived from field
JTin:Keterangan        LIKE(JTin:Keterangan)          !List box control field - type derived from field
JTin:BiayaDasar        LIKE(JTin:BiayaDasar)          !List box control field - type derived from field
JTin:Kelas1            LIKE(JTin:Kelas1)              !List box control field - type derived from field
JTin:Kelas2            LIKE(JTin:Kelas2)              !List box control field - type derived from field
JTin:Kelas3            LIKE(JTin:Kelas3)              !List box control field - type derived from field
JTin:VIP               LIKE(JTin:VIP)                 !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a JTindaka Record'),AT(,,358,188),FONT('Arial',8,,),IMM,HLP('SelectJTindaka'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,342,124),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('44L(2)|M~KODE_TIND~L(2)@s10@80L(2)|M~NAMA_TIND~L(2)@s35@44L(2)|M~UPF~L(2)@s10@80' &|
   'L(2)|M~Keterangan~L(2)@s30@60D(18)|M~DR_KELAS3~C(0)@n14.2@64D(24)|M~Kelas 1~C(0)' &|
   '@n15.2@64D(24)|M~Kelas 2~C(0)@n15.2@64D(24)|M~Kelas 3~C(0)@n15.2@64D(32)|M~VIP~C' &|
   '(0)@n15.2@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(305,148,45,14),USE(?Select:2)
                       SHEET,AT(4,4,350,162),USE(?CurrentTab)
                         TAB('JTin:KeyKodeTInd'),USE(?Tab:2)
                         END
                         TAB('JTin:KeyNamaTind'),USE(?Tab:3)
                         END
                         TAB('JTin:KeyUpf'),USE(?Tab:4)
                         END
                         TAB('JTin:KeyKet'),USE(?Tab:5)
                         END
                       END
                       BUTTON('Close'),AT(260,170,45,14),USE(?Close)
                       BUTTON('Help'),AT(309,170,45,14),USE(?Help),STD(STD:Help)
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
  GlobalErrors.SetProcedureName('SelectJTindaka')
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
  Relate:JTindaka.Open                                     ! File JTindaka used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:JTindaka,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,JTin:KeyNamaTind)                     ! Add the sort order for JTin:KeyNamaTind for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,JTin:NamaTind,,BRW1)           ! Initialize the browse locator using  using key: JTin:KeyNamaTind , JTin:NamaTind
  BRW1.AddSortOrder(,JTin:KeyUpf)                          ! Add the sort order for JTin:KeyUpf for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,JTin:UPF,,BRW1)                ! Initialize the browse locator using  using key: JTin:KeyUpf , JTin:UPF
  BRW1.AddSortOrder(,JTin:KeyKet)                          ! Add the sort order for JTin:KeyKet for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,JTin:Keterangan,,BRW1)         ! Initialize the browse locator using  using key: JTin:KeyKet , JTin:Keterangan
  BRW1.AddSortOrder(,JTin:KeyKodeTInd)                     ! Add the sort order for JTin:KeyKodeTInd for sort order 4
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort0:Locator.Init(,JTin:KodeTind,,BRW1)           ! Initialize the browse locator using  using key: JTin:KeyKodeTInd , JTin:KodeTind
  BRW1.AddField(JTin:KodeTind,BRW1.Q.JTin:KodeTind)        ! Field JTin:KodeTind is a hot field or requires assignment from browse
  BRW1.AddField(JTin:NamaTind,BRW1.Q.JTin:NamaTind)        ! Field JTin:NamaTind is a hot field or requires assignment from browse
  BRW1.AddField(JTin:UPF,BRW1.Q.JTin:UPF)                  ! Field JTin:UPF is a hot field or requires assignment from browse
  BRW1.AddField(JTin:Keterangan,BRW1.Q.JTin:Keterangan)    ! Field JTin:Keterangan is a hot field or requires assignment from browse
  BRW1.AddField(JTin:BiayaDasar,BRW1.Q.JTin:BiayaDasar)    ! Field JTin:BiayaDasar is a hot field or requires assignment from browse
  BRW1.AddField(JTin:Kelas1,BRW1.Q.JTin:Kelas1)            ! Field JTin:Kelas1 is a hot field or requires assignment from browse
  BRW1.AddField(JTin:Kelas2,BRW1.Q.JTin:Kelas2)            ! Field JTin:Kelas2 is a hot field or requires assignment from browse
  BRW1.AddField(JTin:Kelas3,BRW1.Q.JTin:Kelas3)            ! Field JTin:Kelas3 is a hot field or requires assignment from browse
  BRW1.AddField(JTin:VIP,BRW1.Q.JTin:VIP)                  ! Field JTin:VIP is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectJTindaka',QuickWindow)               ! Restore window settings from non-volatile store
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
    Relate:JTindaka.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectJTindaka',QuickWindow)            ! Save window data to non-volatile store
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
  ELSE
    RETURN SELF.SetSort(4,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

SelectSMPegawai PROCEDURE                                  ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(SMPegawai)
                       PROJECT(PEGA:Nik)
                       PROJECT(PEGA:Nama)
                       PROJECT(PEGA:GajiPokok)
                       PROJECT(PEGA:NPanggil)
                       PROJECT(PEGA:Photo)
                       PROJECT(PEGA:Status)
                       PROJECT(PEGA:T_Jabatan)
                       PROJECT(PEGA:T_Variabel)
                       PROJECT(PEGA:Jenis_Kelamin)
                       PROJECT(PEGA:Tgl_Masuk_kerja)
                       PROJECT(PEGA:Tgl_Lahir)
                       PROJECT(PEGA:NIK_Lama)
                       PROJECT(PEGA:RPend)
                       PROJECT(PEGA:Jabatan)
                       PROJECT(PEGA:Unit)
                       PROJECT(PEGA:No_Absen)
                       PROJECT(PEGA:Sub_Bagian)
                       PROJECT(PEGA:NIK_PALING_BARU)
                       PROJECT(PEGA:Profesi)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PEGA:Nik               LIKE(PEGA:Nik)                 !List box control field - type derived from field
PEGA:Nama              LIKE(PEGA:Nama)                !List box control field - type derived from field
PEGA:GajiPokok         LIKE(PEGA:GajiPokok)           !List box control field - type derived from field
PEGA:NPanggil          LIKE(PEGA:NPanggil)            !List box control field - type derived from field
PEGA:Photo             LIKE(PEGA:Photo)               !List box control field - type derived from field
PEGA:Status            LIKE(PEGA:Status)              !List box control field - type derived from field
PEGA:T_Jabatan         LIKE(PEGA:T_Jabatan)           !List box control field - type derived from field
PEGA:T_Variabel        LIKE(PEGA:T_Variabel)          !List box control field - type derived from field
PEGA:Jenis_Kelamin     LIKE(PEGA:Jenis_Kelamin)       !List box control field - type derived from field
PEGA:Tgl_Masuk_kerja   LIKE(PEGA:Tgl_Masuk_kerja)     !Browse key field - type derived from field
PEGA:Tgl_Lahir         LIKE(PEGA:Tgl_Lahir)           !Browse key field - type derived from field
PEGA:NIK_Lama          LIKE(PEGA:NIK_Lama)            !Browse key field - type derived from field
PEGA:RPend             LIKE(PEGA:RPend)               !Browse key field - type derived from field
PEGA:Jabatan           LIKE(PEGA:Jabatan)             !Browse key field - type derived from field
PEGA:Unit              LIKE(PEGA:Unit)                !Browse key field - type derived from field
PEGA:No_Absen          LIKE(PEGA:No_Absen)            !Browse key field - type derived from field
PEGA:Sub_Bagian        LIKE(PEGA:Sub_Bagian)          !Browse key field - type derived from field
PEGA:NIK_PALING_BARU   LIKE(PEGA:NIK_PALING_BARU)     !Browse key field - type derived from field
PEGA:Profesi           LIKE(PEGA:Profesi)             !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Select a SMPegawai Record'),AT(,,358,208),FONT('Arial',8,,),IMM,HLP('SelectSMPegawai'),SYSTEM,GRAY,MDI
                       LIST,AT(8,40,342,124),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('32L(2)|M~Nik~L(2)@s7@80L(2)|M~Nama~L(2)@s40@44D(12)|M~Gaji Pokok~C(0)@n10.2@80L(' &|
   '2)|M~NP anggil~L(2)@s20@80L(2)|M~Photo~L(2)@s120@28R(2)|M~Status~C(0)@n6@44D(10)' &|
   '|M~T Jabatan~C(0)@n10.2@44D(12)|M~T Variabel~C(0)@n10.2@56R(2)|M~Jenis Kelamin~C' &|
   '(0)@n3@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(305,168,45,14),USE(?Select:2)
                       SHEET,AT(4,4,350,182),USE(?CurrentTab)
                         TAB('PEGA:Pkey'),USE(?Tab:2)
                         END
                         TAB('PEGA:KeyTanggalMasuk'),USE(?Tab:3)
                         END
                         TAB('PEGA:KeyTglLahir'),USE(?Tab:4)
                         END
                         TAB('PEGA:KeyNikLama'),USE(?Tab:5)
                         END
                         TAB('PEGA:KeyRPend'),USE(?Tab:6)
                         END
                         TAB('PEGA:KeyJabatan'),USE(?Tab:7)
                         END
                         TAB('PEGA:KeyUnit'),USE(?Tab:8)
                         END
                         TAB('PEGA:KeyNama'),USE(?Tab:9)
                         END
                         TAB('PEGA:KeyAbsen'),USE(?Tab:10)
                         END
                         TAB('PEGA:KeySub_UnitPeg'),USE(?Tab:11)
                         END
                         TAB('PEGA:KeyNikPalingBaru'),USE(?Tab:12)
                         END
                         TAB('PEGA:Profesi_Pegawai_FK'),USE(?Tab:13)
                         END
                       END
                       BUTTON('Close'),AT(260,190,45,14),USE(?Close)
                       BUTTON('Help'),AT(309,190,45,14),USE(?Help),STD(STD:Help)
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
BRW1::Sort10:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 11
BRW1::Sort11:Locator StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 12
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
  GlobalErrors.SetProcedureName('SelectSMPegawai')
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
  Relate:SMPegawai.SetOpenRelated()
  Relate:SMPegawai.Open                                    ! File SMPegawai used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:SMPegawai,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,PEGA:KeyTanggalMasuk)                 ! Add the sort order for PEGA:KeyTanggalMasuk for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,PEGA:Tgl_Masuk_kerja,1,BRW1)   ! Initialize the browse locator using  using key: PEGA:KeyTanggalMasuk , PEGA:Tgl_Masuk_kerja
  BRW1.AddSortOrder(,PEGA:KeyTglLahir)                     ! Add the sort order for PEGA:KeyTglLahir for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,PEGA:Tgl_Lahir,1,BRW1)         ! Initialize the browse locator using  using key: PEGA:KeyTglLahir , PEGA:Tgl_Lahir
  BRW1.AddSortOrder(,PEGA:KeyNikLama)                      ! Add the sort order for PEGA:KeyNikLama for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,PEGA:NIK_Lama,,BRW1)           ! Initialize the browse locator using  using key: PEGA:KeyNikLama , PEGA:NIK_Lama
  BRW1.AddSortOrder(,PEGA:KeyRPend)                        ! Add the sort order for PEGA:KeyRPend for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,PEGA:RPend,,BRW1)              ! Initialize the browse locator using  using key: PEGA:KeyRPend , PEGA:RPend
  BRW1.AddSortOrder(,PEGA:KeyJabatan)                      ! Add the sort order for PEGA:KeyJabatan for sort order 5
  BRW1.AddLocator(BRW1::Sort5:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort5:Locator.Init(,PEGA:Jabatan,,BRW1)            ! Initialize the browse locator using  using key: PEGA:KeyJabatan , PEGA:Jabatan
  BRW1.AddSortOrder(,PEGA:KeyUnit)                         ! Add the sort order for PEGA:KeyUnit for sort order 6
  BRW1.AddLocator(BRW1::Sort6:Locator)                     ! Browse has a locator for sort order 6
  BRW1::Sort6:Locator.Init(,PEGA:Unit,,BRW1)               ! Initialize the browse locator using  using key: PEGA:KeyUnit , PEGA:Unit
  BRW1.AddSortOrder(,PEGA:KeyNama)                         ! Add the sort order for PEGA:KeyNama for sort order 7
  BRW1.AddLocator(BRW1::Sort7:Locator)                     ! Browse has a locator for sort order 7
  BRW1::Sort7:Locator.Init(,PEGA:Nama,,BRW1)               ! Initialize the browse locator using  using key: PEGA:KeyNama , PEGA:Nama
  BRW1.AddSortOrder(,PEGA:KeyAbsen)                        ! Add the sort order for PEGA:KeyAbsen for sort order 8
  BRW1.AddLocator(BRW1::Sort8:Locator)                     ! Browse has a locator for sort order 8
  BRW1::Sort8:Locator.Init(,PEGA:No_Absen,,BRW1)           ! Initialize the browse locator using  using key: PEGA:KeyAbsen , PEGA:No_Absen
  BRW1.AddSortOrder(,PEGA:KeySub_UnitPeg)                  ! Add the sort order for PEGA:KeySub_UnitPeg for sort order 9
  BRW1.AddLocator(BRW1::Sort9:Locator)                     ! Browse has a locator for sort order 9
  BRW1::Sort9:Locator.Init(,PEGA:Sub_Bagian,,BRW1)         ! Initialize the browse locator using  using key: PEGA:KeySub_UnitPeg , PEGA:Sub_Bagian
  BRW1.AddSortOrder(,PEGA:KeyNikPalingBaru)                ! Add the sort order for PEGA:KeyNikPalingBaru for sort order 10
  BRW1.AddLocator(BRW1::Sort10:Locator)                    ! Browse has a locator for sort order 10
  BRW1::Sort10:Locator.Init(,PEGA:NIK_PALING_BARU,1,BRW1)  ! Initialize the browse locator using  using key: PEGA:KeyNikPalingBaru , PEGA:NIK_PALING_BARU
  BRW1.AddSortOrder(,PEGA:Profesi_Pegawai_FK)              ! Add the sort order for PEGA:Profesi_Pegawai_FK for sort order 11
  BRW1.AddLocator(BRW1::Sort11:Locator)                    ! Browse has a locator for sort order 11
  BRW1::Sort11:Locator.Init(,PEGA:Profesi,1,BRW1)          ! Initialize the browse locator using  using key: PEGA:Profesi_Pegawai_FK , PEGA:Profesi
  BRW1.AddSortOrder(,PEGA:Pkey)                            ! Add the sort order for PEGA:Pkey for sort order 12
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 12
  BRW1::Sort0:Locator.Init(,PEGA:Nik,,BRW1)                ! Initialize the browse locator using  using key: PEGA:Pkey , PEGA:Nik
  BRW1.AddField(PEGA:Nik,BRW1.Q.PEGA:Nik)                  ! Field PEGA:Nik is a hot field or requires assignment from browse
  BRW1.AddField(PEGA:Nama,BRW1.Q.PEGA:Nama)                ! Field PEGA:Nama is a hot field or requires assignment from browse
  BRW1.AddField(PEGA:GajiPokok,BRW1.Q.PEGA:GajiPokok)      ! Field PEGA:GajiPokok is a hot field or requires assignment from browse
  BRW1.AddField(PEGA:NPanggil,BRW1.Q.PEGA:NPanggil)        ! Field PEGA:NPanggil is a hot field or requires assignment from browse
  BRW1.AddField(PEGA:Photo,BRW1.Q.PEGA:Photo)              ! Field PEGA:Photo is a hot field or requires assignment from browse
  BRW1.AddField(PEGA:Status,BRW1.Q.PEGA:Status)            ! Field PEGA:Status is a hot field or requires assignment from browse
  BRW1.AddField(PEGA:T_Jabatan,BRW1.Q.PEGA:T_Jabatan)      ! Field PEGA:T_Jabatan is a hot field or requires assignment from browse
  BRW1.AddField(PEGA:T_Variabel,BRW1.Q.PEGA:T_Variabel)    ! Field PEGA:T_Variabel is a hot field or requires assignment from browse
  BRW1.AddField(PEGA:Jenis_Kelamin,BRW1.Q.PEGA:Jenis_Kelamin) ! Field PEGA:Jenis_Kelamin is a hot field or requires assignment from browse
  BRW1.AddField(PEGA:Tgl_Masuk_kerja,BRW1.Q.PEGA:Tgl_Masuk_kerja) ! Field PEGA:Tgl_Masuk_kerja is a hot field or requires assignment from browse
  BRW1.AddField(PEGA:Tgl_Lahir,BRW1.Q.PEGA:Tgl_Lahir)      ! Field PEGA:Tgl_Lahir is a hot field or requires assignment from browse
  BRW1.AddField(PEGA:NIK_Lama,BRW1.Q.PEGA:NIK_Lama)        ! Field PEGA:NIK_Lama is a hot field or requires assignment from browse
  BRW1.AddField(PEGA:RPend,BRW1.Q.PEGA:RPend)              ! Field PEGA:RPend is a hot field or requires assignment from browse
  BRW1.AddField(PEGA:Jabatan,BRW1.Q.PEGA:Jabatan)          ! Field PEGA:Jabatan is a hot field or requires assignment from browse
  BRW1.AddField(PEGA:Unit,BRW1.Q.PEGA:Unit)                ! Field PEGA:Unit is a hot field or requires assignment from browse
  BRW1.AddField(PEGA:No_Absen,BRW1.Q.PEGA:No_Absen)        ! Field PEGA:No_Absen is a hot field or requires assignment from browse
  BRW1.AddField(PEGA:Sub_Bagian,BRW1.Q.PEGA:Sub_Bagian)    ! Field PEGA:Sub_Bagian is a hot field or requires assignment from browse
  BRW1.AddField(PEGA:NIK_PALING_BARU,BRW1.Q.PEGA:NIK_PALING_BARU) ! Field PEGA:NIK_PALING_BARU is a hot field or requires assignment from browse
  BRW1.AddField(PEGA:Profesi,BRW1.Q.PEGA:Profesi)          ! Field PEGA:Profesi is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectSMPegawai',QuickWindow)              ! Restore window settings from non-volatile store
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
    Relate:SMPegawai.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectSMPegawai',QuickWindow)           ! Save window data to non-volatile store
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
  ELSIF CHOICE(?CurrentTab) = 11
    RETURN SELF.SetSort(10,Force)
  ELSIF CHOICE(?CurrentTab) = 12
    RETURN SELF.SetSort(11,Force)
  ELSE
    RETURN SELF.SetSort(12,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

ProsesFIFOOUTBSBBK PROCEDURE                               ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
Process:View         VIEW(GDBSBBK)
                       PROJECT(GDBSB:Harga)
                       PROJECT(GDBSB:Jumlah_Sat)
                       PROJECT(GDBSB:NoBSBBK)
                       JOIN(GHBSB:KeyNoBSBBK,GDBSB:NoBSBBK)
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
  GlobalErrors.SetProcedureName('ProsesFIFOOUTBSBBK')
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
  Relate:AFIFOIN.Open                                      ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Relate:AFIFOOUTTemp.Open                                 ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesFIFOOUTBSBBK',ProgressWindow)        ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:GDBSBBK, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ThisProcess.SetFilter('GHBSB:Tanggal_BSBBK>=vg_tanggal1 and GHBSB:Tanggal_BSBBK<<=vg_tanggal2 and GHBSB:kode_apotik=glo:apotik and GDBSB:KodeBarang=glo_kode_barang')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(GDBSBBK,'QUICKSCAN=on')
  SEND(GHBSBBK,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AFIFOIN.Close
    Relate:AFIFOOUTTemp.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesFIFOOUTBSBBK',ProgressWindow)     ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  GHBSB:NoBSBBK = GDBSB:NoBSBBK                            ! Assign linking field value
  Access:GHBSBBK.Fetch(GHBSB:KeyNoBSBBK)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  GHBSB:NoBSBBK = GDBSB:NoBSBBK                            ! Assign linking field value
  Access:GHBSBBK.Fetch(GHBSB:KeyNoBSBBK)


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  GSTO:Kode_Apotik    =GHBSB:kode_apotik
  GSTO:Kode_Barang    =GDBSB:KodeBarang
  access:gstokaptk.fetch(GSTO:KeyBarang)
  AFI21:Kode_Barang     =GDBSB:KodeBarang
  AFI21:Mata_Uang       ='Rp'
  AFI21:NoTransaksi     =GDBSB:NoBSBBK
  AFI21:Transaksi       =1
  AFI21:NoTransKeluar   =GDBSB:NoBSBBK
  AFI21:Tanggal         =GHBSB:Tanggal_BSBBK
  AFI21:Harga           =round(GSTO:Harga_Dasar*1.1,.01)
  AFI21:Jumlah          =GDBSB:Jumlah_Sat
  AFI21:Tgl_Update      =GHBSB:Tanggal_BSBBK
  AFI21:Jam_Update      =clock()
  AFI21:Operator        ='ADI'
  AFI21:Jam             =clock()
  AFI21:Kode_Apotik     =GHBSB:kode_apotik
  access:afifoouttemp.insert()
  RETURN ReturnValue

