

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N181.INC'),ONCE        !Local module procedure declarations
                     END


cari_mr_pasien_inap_bpjs PROCEDURE                         ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
nm_pasien            STRING(35)                            !
BRW1::View:Browse    VIEW(JPasien)
                       PROJECT(JPas:Nomor_mr)
                       PROJECT(JPas:Nama)
                       PROJECT(JPas:Umur)
                       PROJECT(JPas:Umur_Bln)
                       PROJECT(JPas:Alamat)
                       PROJECT(JPas:RT)
                       PROJECT(JPas:RW)
                       PROJECT(JPas:Jenis_kelamin)
                       PROJECT(JPas:Kelurahan)
                       JOIN(RI_HR:PrimaryKey,JPas:Nomor_mr)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
JPas:Nomor_mr          LIKE(JPas:Nomor_mr)            !List box control field - type derived from field
JPas:Nama              LIKE(JPas:Nama)                !List box control field - type derived from field
JPas:Umur              LIKE(JPas:Umur)                !List box control field - type derived from field
JPas:Umur_Bln          LIKE(JPas:Umur_Bln)            !List box control field - type derived from field
JPas:Alamat            LIKE(JPas:Alamat)              !List box control field - type derived from field
JPas:RT                LIKE(JPas:RT)                  !List box control field - type derived from field
JPas:RW                LIKE(JPas:RW)                  !List box control field - type derived from field
JPas:Jenis_kelamin     LIKE(JPas:Jenis_kelamin)       !List box control field - type derived from field
JPas:Kelurahan         LIKE(JPas:Kelurahan)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Data Pasien'),AT(,,358,157),FONT('Arial',8,,),IMM,HLP('Cari_mr_pasien'),SYSTEM,GRAY,MDI
                       LIST,AT(8,21,339,104),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('80R(2)|FM~Nomor RM~C(0)@N010_@80L(2)|M~Nama~@s35@40R(2)|M~Umur Thn~C(0)@n3@36R(2' &|
   ')|M~Umur Bln~C(0)@n3@80L(2)|M~Alamat~@s35@16R(2)|M~RT~C(0)@N3@16R(2)|M~RW~C(0)@N' &|
   '3@56L(2)|M~Jenis kelamin~@s1@80L(2)|M~Kelurahan~@s20@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(171,0,45,14),USE(?Select:2),HIDE
                       SHEET,AT(4,4,350,150),USE(?CurrentTab)
                         TAB('Nomor RM (F2)'),USE(?Tab:2),KEY(F2Key)
                         END
                         TAB('Nama (F3)'),USE(?Tab:3),KEY(F3Key)
                           PROMPT('Cari Nama :'),AT(92,133),USE(?Prompt1),FONT('Times New Roman',10,COLOR:Black,FONT:bold)
                           ENTRY(@s35),AT(149,130,199,17),USE(nm_pasien),FONT('Times New Roman',14,COLOR:Black,)
                         END
                       END
                       BUTTON('Close'),AT(220,0,45,14),USE(?Close),HIDE
                       BUTTON('Help'),AT(295,0,45,14),USE(?Help),HIDE,STD(STD:Help)
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
BRW1::Sort1:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort0:StepClass StepLongClass                        ! Default Step Manager
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
  GlobalErrors.SetProcedureName('cari_mr_pasien_inap_bpjs')
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
  Relate:JPasien.Open                                      ! File JPasien used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:JPasien,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon JPas:Nama for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,JPas:KeyNama)    ! Add the sort order for JPas:KeyNama for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?nm_pasien,JPas:Nama,,BRW1)     ! Initialize the browse locator using ?nm_pasien using key: JPas:KeyNama , JPas:Nama
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive) ! Moveable thumb based upon JPas:Nomor_mr for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,JPas:KeyNomorMr) ! Add the sort order for JPas:KeyNomorMr for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,JPas:Nomor_mr,,BRW1)           ! Initialize the browse locator using  using key: JPas:KeyNomorMr , JPas:Nomor_mr
  BRW1.AddField(JPas:Nomor_mr,BRW1.Q.JPas:Nomor_mr)        ! Field JPas:Nomor_mr is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nama,BRW1.Q.JPas:Nama)                ! Field JPas:Nama is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Umur,BRW1.Q.JPas:Umur)                ! Field JPas:Umur is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Umur_Bln,BRW1.Q.JPas:Umur_Bln)        ! Field JPas:Umur_Bln is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Alamat,BRW1.Q.JPas:Alamat)            ! Field JPas:Alamat is a hot field or requires assignment from browse
  BRW1.AddField(JPas:RT,BRW1.Q.JPas:RT)                    ! Field JPas:RT is a hot field or requires assignment from browse
  BRW1.AddField(JPas:RW,BRW1.Q.JPas:RW)                    ! Field JPas:RW is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Jenis_kelamin,BRW1.Q.JPas:Jenis_kelamin) ! Field JPas:Jenis_kelamin is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Kelurahan,BRW1.Q.JPas:Kelurahan)      ! Field JPas:Kelurahan is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('cari_mr_pasien_inap_bpjs',QuickWindow)     ! Restore window settings from non-volatile store
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
    Relate:JPasien.Close
  END
  IF SELF.Opened
    INIMgr.Update('cari_mr_pasien_inap_bpjs',QuickWindow)  ! Save window data to non-volatile store
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

