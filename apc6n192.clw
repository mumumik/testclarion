

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N192.INC'),ONCE        !Local module procedure declarations
                     END


selectepre2 PROCEDURE                                      ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
vl_request           BYTE                                  !
BRW1::View:Browse    VIEW(APEPREH)
                       PROJECT(APE3:N0_tran)
                       PROJECT(APE3:NoNota)
                       PROJECT(APE3:Nomor_mr)
                       PROJECT(APE3:Tanggal)
                       PROJECT(APE3:Dokter)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APE3:N0_tran           LIKE(APE3:N0_tran)             !List box control field - type derived from field
APE3:NoNota            LIKE(APE3:NoNota)              !List box control field - type derived from field
APE3:Nomor_mr          LIKE(APE3:Nomor_mr)            !List box control field - type derived from field
APE3:Tanggal           LIKE(APE3:Tanggal)             !List box control field - type derived from field
APE3:Dokter            LIKE(APE3:Dokter)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('E Prescribing'),AT(,,402,262),FONT('Arial',8,,),CENTER,IMM,HLP('BrowsePaketObat'),SYSTEM,GRAY,MDI
                       LIST,AT(3,5,395,222),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('80L(2)|M~N 0 tran~@s20@64L(2)|M~No Nota~@s16@56R(2)|M~Nomor mr~L@n-14@40R(2)|M~T' &|
   'anggal~L@d17@20R(2)|M~Dokter~L@s5@'),FROM(Queue:Browse:1)
                       PROMPT('No Tran:'),AT(3,232),USE(?APP2:Keterangan:Prompt)
                       BUTTON('&Tambah'),AT(23,246,45,14),USE(?Insert:2),DISABLE,HIDE
                       BUTTON('&Ubah'),AT(72,246,45,14),USE(?Change:2),DISABLE,HIDE,DEFAULT
                       BUTTON('&Hapus'),AT(121,246,45,14),USE(?Delete:2),DISABLE,HIDE
                       BUTTON('&Pilih'),AT(215,246,45,14),USE(?Select)
                       BUTTON('&Selesai'),AT(351,246,45,14),USE(?Close)
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

BRW1::Sort0:Locator  FilterLocatorClass                    ! Default Locator
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
  GlobalErrors.SetProcedureName('selectepre2')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo:nonota',glo:nonota)                            ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:APEPREH.Open                                      ! File GStockGdg used by this procedure, so make sure it's RelationManager is open
  Relate:GStockGdg.Open                                    ! File GStockGdg used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:APEPREH,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,APE3:by_transaksi)                    ! Add the sort order for APE3:by_transaksi for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,APE3:N0_tran,,BRW1)            ! Initialize the browse locator using  using key: APE3:by_transaksi , APE3:N0_tran
  BRW1::Sort0:Locator.FloatRight = 1
  BRW1.SetFilter('(APE3:NoNota = glo:nonota)')             ! Apply filter expression to browse
  BRW1.AddField(APE3:N0_tran,BRW1.Q.APE3:N0_tran)          ! Field APE3:N0_tran is a hot field or requires assignment from browse
  BRW1.AddField(APE3:NoNota,BRW1.Q.APE3:NoNota)            ! Field APE3:NoNota is a hot field or requires assignment from browse
  BRW1.AddField(APE3:Nomor_mr,BRW1.Q.APE3:Nomor_mr)        ! Field APE3:Nomor_mr is a hot field or requires assignment from browse
  BRW1.AddField(APE3:Tanggal,BRW1.Q.APE3:Tanggal)          ! Field APE3:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(APE3:Dokter,BRW1.Q.APE3:Dokter)            ! Field APE3:Dokter is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('selectepre2',QuickWindow)                  ! Restore window settings from non-volatile store
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
    Relate:APEPREH.Close
    Relate:GStockGdg.Close
  END
  IF SELF.Opened
    INIMgr.Update('selectepre2',QuickWindow)               ! Save window data to non-volatile store
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Insert:2
      ThisWindow.Update
      cycle
    OF ?Change:2
      ThisWindow.Update
      cycle
    OF ?Delete:2
      ThisWindow.Update
      cycle
    END
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
  SELF.SelectControl = ?Select
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

