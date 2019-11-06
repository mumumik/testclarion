

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N078.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N079.INC'),ONCE        !Req'd for module callout resolution
                     END


BrowseOrderObatdariRuangan PROCEDURE                       ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(TBTransResepDokterHeader_RI)
                       PROJECT(TBT21:NoTrans)
                       PROJECT(TBT21:KodeReg)
                       PROJECT(TBT21:KodePasien)
                       PROJECT(TBT21:KodeDokter)
                       PROJECT(TBT21:Tanggal)
                       PROJECT(TBT21:Jam)
                       PROJECT(TBT21:Her)
                       PROJECT(TBT21:Status)
                       PROJECT(TBT21:UmurPerkiraan)
                       JOIN(JPas:KeyNomorMr,TBT21:KodePasien)
                         PROJECT(JPas:Nama)
                         PROJECT(JPas:Nomor_mr)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
TBT21:NoTrans          LIKE(TBT21:NoTrans)            !List box control field - type derived from field
TBT21:KodeReg          LIKE(TBT21:KodeReg)            !List box control field - type derived from field
TBT21:KodePasien       LIKE(TBT21:KodePasien)         !List box control field - type derived from field
JPas:Nama              LIKE(JPas:Nama)                !List box control field - type derived from field
TBT21:KodeDokter       LIKE(TBT21:KodeDokter)         !List box control field - type derived from field
TBT21:Tanggal          LIKE(TBT21:Tanggal)            !List box control field - type derived from field
TBT21:Jam              LIKE(TBT21:Jam)                !List box control field - type derived from field
TBT21:Her              LIKE(TBT21:Her)                !List box control field - type derived from field
TBT21:Status           LIKE(TBT21:Status)             !List box control field - type derived from field
TBT21:UmurPerkiraan    LIKE(TBT21:UmurPerkiraan)      !List box control field - type derived from field
JPas:Nomor_mr          LIKE(JPas:Nomor_mr)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the TBTransResepDokterHeader_RI File'),AT(,,358,350),FONT('Arial',8,,),IMM,HLP('BrowseOrderObatdariRuangan'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,342,286),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('80L(2)|M~No Trans~@s20@64L(2)|M~Kode Reg~@s15@64L(2)|M~Kode Pasien~@s15@140L(2)|' &|
   'M~Nama~@s35@64L(2)|M~Kode Dokter~@s15@80R(2)|M~Tanggal~C(0)@d06@80R(2)|M~Jam~C(0' &|
   ')@t04@36R(2)|M~Her~C(0)@n-7@28R(2)|M~Status~C(0)@n3@64R(2)|M~Umur Perkiraan~C(0)' &|
   '@n-14@'),FROM(Queue:Browse:1)
                       BUTTON('&Insert'),AT(207,313,45,14),USE(?Insert:2)
                       BUTTON('&Change'),AT(255,313,45,14),USE(?Change:2),DEFAULT
                       BUTTON('&Delete'),AT(305,313,45,14),USE(?Delete:2)
                       SHEET,AT(4,4,350,326),USE(?CurrentTab)
                         TAB('TBT21:PK'),USE(?Tab:2)
                         END
                       END
                       BUTTON('Close'),AT(308,335,45,14),USE(?Close)
                     END

ThisWindow           CLASS(WindowManager)
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
  GlobalErrors.SetProcedureName('BrowseOrderObatdariRuangan')
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
  Relate:TBTransResepDokterHeader_RI.Open                  ! File TBTransResepDokterHeader_RI used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:TBTransResepDokterHeader_RI,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,TBT21:PK)                             ! Add the sort order for TBT21:PK for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,TBT21:NoTrans,1,BRW1)          ! Initialize the browse locator using  using key: TBT21:PK , TBT21:NoTrans
  BRW1.SetFilter('(TBT21:status=0)')                       ! Apply filter expression to browse
  BRW1.AddField(TBT21:NoTrans,BRW1.Q.TBT21:NoTrans)        ! Field TBT21:NoTrans is a hot field or requires assignment from browse
  BRW1.AddField(TBT21:KodeReg,BRW1.Q.TBT21:KodeReg)        ! Field TBT21:KodeReg is a hot field or requires assignment from browse
  BRW1.AddField(TBT21:KodePasien,BRW1.Q.TBT21:KodePasien)  ! Field TBT21:KodePasien is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nama,BRW1.Q.JPas:Nama)                ! Field JPas:Nama is a hot field or requires assignment from browse
  BRW1.AddField(TBT21:KodeDokter,BRW1.Q.TBT21:KodeDokter)  ! Field TBT21:KodeDokter is a hot field or requires assignment from browse
  BRW1.AddField(TBT21:Tanggal,BRW1.Q.TBT21:Tanggal)        ! Field TBT21:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(TBT21:Jam,BRW1.Q.TBT21:Jam)                ! Field TBT21:Jam is a hot field or requires assignment from browse
  BRW1.AddField(TBT21:Her,BRW1.Q.TBT21:Her)                ! Field TBT21:Her is a hot field or requires assignment from browse
  BRW1.AddField(TBT21:Status,BRW1.Q.TBT21:Status)          ! Field TBT21:Status is a hot field or requires assignment from browse
  BRW1.AddField(TBT21:UmurPerkiraan,BRW1.Q.TBT21:UmurPerkiraan) ! Field TBT21:UmurPerkiraan is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nomor_mr,BRW1.Q.JPas:Nomor_mr)        ! Field JPas:Nomor_mr is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseOrderObatdariRuangan',QuickWindow)   ! Restore window settings from non-volatile store
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
    Relate:TBTransResepDokterHeader_RI.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseOrderObatdariRuangan',QuickWindow) ! Save window data to non-volatile store
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
    UpdateTBTransResepDokterHeader_RI
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

