

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N191.INC'),ONCE        !Local module procedure declarations
                     END


selectepre PROCEDURE                                       ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(APEPREH)
                       PROJECT(APE3:NoNota)
                       PROJECT(APE3:N0_tran)
                       PROJECT(APE3:Nomor_mr)
                       PROJECT(APE3:Tanggal)
                       PROJECT(APE3:Kode_Apotik)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APE3:NoNota            LIKE(APE3:NoNota)              !List box control field - type derived from field
APE3:N0_tran           LIKE(APE3:N0_tran)             !List box control field - type derived from field
APE3:Nomor_mr          LIKE(APE3:Nomor_mr)            !List box control field - type derived from field
APE3:Tanggal           LIKE(APE3:Tanggal)             !List box control field - type derived from field
APE3:Kode_Apotik       LIKE(APE3:Kode_Apotik)         !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW4::View:Browse    VIEW(APEPRED)
                       PROJECT(APE4:N0_tran)
                       PROJECT(APE4:Kode_brg)
                       PROJECT(APE4:Jumlah)
                       PROJECT(APE4:Total)
                       PROJECT(APE4:Harga_dasar)
                       PROJECT(APE4:Camp)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
APE4:N0_tran           LIKE(APE4:N0_tran)             !List box control field - type derived from field
APE4:Kode_brg          LIKE(APE4:Kode_brg)            !List box control field - type derived from field
APE4:Jumlah            LIKE(APE4:Jumlah)              !List box control field - type derived from field
APE4:Total             LIKE(APE4:Total)               !List box control field - type derived from field
APE4:Harga_dasar       LIKE(APE4:Harga_dasar)         !List box control field - type derived from field
APE4:Camp              LIKE(APE4:Camp)                !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Resep Dokter'),AT(,,420,275),FONT('MS Sans Serif',8,,),CENTER,IMM,HLP('BrowseResepElektronis'),SYSTEM,GRAY,RESIZE,MDI
                       LIST,AT(8,20,406,90),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('64L(2)|M~No Nota~@s16@80L(2)|M~N 0 tran~@s20@56R(2)|M~Nomor mr~L@n-14@40R(2)|M~T' &|
   'anggal~L@d17@40R(2)|M~Kode Apotik~L@s10@'),FROM(Queue:Browse:1)
                       STRING('Item Resep'),AT(9,135),USE(?String1:2)
                       LIST,AT(6,148,407,102),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('60L(2)|M~N 0 tran~@s15@40L(2)|M~Kode brg~@s10@40D(2)|M~Jumlah~L@n10.2@56R(2)|M~T' &|
   'otal~L@n-14@40D(2)|M~Harga dasar~L@n10.2@52D(2)|M~Camp~L@n13@'),FROM(Queue:Browse)
                       SHEET,AT(4,4,415,127),USE(?CurrentTab)
                         TAB('&Nomor'),USE(?Tab:2)
                         END
                         TAB('&Semua'),USE(?Tab2)
                         END
                       END
                       BUTTON('&Selesai'),AT(365,255,45,14),USE(?Close)
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
                     END

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
  GlobalErrors.SetProcedureName('selectepre')
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
  Relate:APEPRED.Open                                      ! File APEPRED used by this procedure, so make sure it's RelationManager is open
  Relate:APEPREH.Open                                      ! File APEPRED used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:APEPREH,SELF) ! Initialize the browse manager
  BRW4.Init(?List,Queue:Browse.ViewPosition,BRW4::View:Browse,Queue:Browse,Relate:APEPRED,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 1
  BRW1.AddField(APE3:NoNota,BRW1.Q.APE3:NoNota)            ! Field APE3:NoNota is a hot field or requires assignment from browse
  BRW1.AddField(APE3:N0_tran,BRW1.Q.APE3:N0_tran)          ! Field APE3:N0_tran is a hot field or requires assignment from browse
  BRW1.AddField(APE3:Nomor_mr,BRW1.Q.APE3:Nomor_mr)        ! Field APE3:Nomor_mr is a hot field or requires assignment from browse
  BRW1.AddField(APE3:Tanggal,BRW1.Q.APE3:Tanggal)          ! Field APE3:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(APE3:Kode_Apotik,BRW1.Q.APE3:Kode_Apotik)  ! Field APE3:Kode_Apotik is a hot field or requires assignment from browse
  BRW4.Q &= Queue:Browse
  BRW4.AddSortOrder(,APE4:notran_kode)                     ! Add the sort order for APE4:notran_kode for sort order 1
  BRW4.AddRange(APE4:N0_tran,Relate:APEPRED,Relate:APEPREH) ! Add file relationship range limit for sort order 1
  BRW4.AddLocator(BRW4::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW4::Sort0:Locator.Init(,APE4:Kode_brg,,BRW4)           ! Initialize the browse locator using  using key: APE4:notran_kode , APE4:Kode_brg
  BRW4.AddField(APE4:N0_tran,BRW4.Q.APE4:N0_tran)          ! Field APE4:N0_tran is a hot field or requires assignment from browse
  BRW4.AddField(APE4:Kode_brg,BRW4.Q.APE4:Kode_brg)        ! Field APE4:Kode_brg is a hot field or requires assignment from browse
  BRW4.AddField(APE4:Jumlah,BRW4.Q.APE4:Jumlah)            ! Field APE4:Jumlah is a hot field or requires assignment from browse
  BRW4.AddField(APE4:Total,BRW4.Q.APE4:Total)              ! Field APE4:Total is a hot field or requires assignment from browse
  BRW4.AddField(APE4:Harga_dasar,BRW4.Q.APE4:Harga_dasar)  ! Field APE4:Harga_dasar is a hot field or requires assignment from browse
  BRW4.AddField(APE4:Camp,BRW4.Q.APE4:Camp)                ! Field APE4:Camp is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('selectepre',QuickWindow)                   ! Restore window settings from non-volatile store
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
    Relate:APEPRED.Close
    Relate:APEPREH.Close
  END
  IF SELF.Opened
    INIMgr.Update('selectepre',QuickWindow)                ! Save window data to non-volatile store
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
    OF ?Close
      ThisWindow.Update
      glo:noepre = APE3:N0_tran
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
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

