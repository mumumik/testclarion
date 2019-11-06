

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N071.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N010.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N051.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N062.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N121.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N146.INC'),ONCE        !Req'd for module callout resolution
                     END


BrowseResepElektronis PROCEDURE                            ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(TBTransResepDokterHeader)
                       PROJECT(TBT2:NoTrans)
                       PROJECT(TBT2:KodeReg)
                       PROJECT(TBT2:KodePasien)
                       PROJECT(TBT2:KodeDokter)
                       PROJECT(TBT2:Tanggal)
                       PROJECT(TBT2:Jam)
                       PROJECT(TBT2:Her)
                       PROJECT(TBT2:Status)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
TBT2:NoTrans           LIKE(TBT2:NoTrans)             !List box control field - type derived from field
TBT2:NoTrans_NormalFG  LONG                           !Normal forground color
TBT2:NoTrans_NormalBG  LONG                           !Normal background color
TBT2:NoTrans_SelectedFG LONG                          !Selected forground color
TBT2:NoTrans_SelectedBG LONG                          !Selected background color
TBT2:KodeReg           LIKE(TBT2:KodeReg)             !List box control field - type derived from field
TBT2:KodePasien        LIKE(TBT2:KodePasien)          !List box control field - type derived from field
TBT2:KodeDokter        LIKE(TBT2:KodeDokter)          !List box control field - type derived from field
TBT2:Tanggal           LIKE(TBT2:Tanggal)             !List box control field - type derived from field
TBT2:Jam               LIKE(TBT2:Jam)                 !List box control field - type derived from field
TBT2:Her               LIKE(TBT2:Her)                 !List box control field - type derived from field
TBT2:Status            LIKE(TBT2:Status)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW4::View:Browse    VIEW(TBTransResepDokterDetail)
                       PROJECT(TBT:ItemCode)
                       PROJECT(TBT:ItemName)
                       PROJECT(TBT:Nomor)
                       PROJECT(TBT:Isi)
                       PROJECT(TBT:Qty)
                       PROJECT(TBT:Unit)
                       PROJECT(TBT:Keterangan)
                       PROJECT(TBT:StatusResep)
                       PROJECT(TBT:NoTrans)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
TBT:ItemCode           LIKE(TBT:ItemCode)             !List box control field - type derived from field
TBT:ItemName           LIKE(TBT:ItemName)             !List box control field - type derived from field
TBT:Nomor              LIKE(TBT:Nomor)                !List box control field - type derived from field
TBT:Isi                LIKE(TBT:Isi)                  !List box control field - type derived from field
TBT:Qty                LIKE(TBT:Qty)                  !List box control field - type derived from field
TBT:Unit               LIKE(TBT:Unit)                 !List box control field - type derived from field
TBT:Keterangan         LIKE(TBT:Keterangan)           !List box control field - type derived from field
TBT:StatusResep        LIKE(TBT:StatusResep)          !List box control field - type derived from field
TBT:NoTrans            LIKE(TBT:NoTrans)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(TBTransResepObatCampur)
                       PROJECT(TBT3:NoTrans)
                       PROJECT(TBT3:ItemCode)
                       PROJECT(TBT3:ItemName)
                       PROJECT(TBT3:Qty)
                       PROJECT(TBT3:Unit)
                       PROJECT(TBT3:Nomor)
                       PROJECT(TBT3:ItemCode1)
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?List:2
TBT3:NoTrans           LIKE(TBT3:NoTrans)             !List box control field - type derived from field
TBT3:ItemCode          LIKE(TBT3:ItemCode)            !List box control field - type derived from field
TBT3:ItemName          LIKE(TBT3:ItemName)            !List box control field - type derived from field
TBT3:Qty               LIKE(TBT3:Qty)                 !List box control field - type derived from field
TBT3:Unit              LIKE(TBT3:Unit)                !List box control field - type derived from field
TBT3:Nomor             LIKE(TBT3:Nomor)               !List box control field - type derived from field
TBT3:ItemCode1         LIKE(TBT3:ItemCode1)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW6::View:Browse    VIEW(TBTransResepDokterEtiket)
                       PROJECT(TBT1:KodeEtiket)
                       PROJECT(TBT1:NamaEtiket)
                       PROJECT(TBT1:Pemakaian)
                       PROJECT(TBT1:ItemCode)
                       PROJECT(TBT1:NoTrans)
                     END
Queue:Browse:3       QUEUE                            !Queue declaration for browse/combo box using ?List:3
TBT1:KodeEtiket        LIKE(TBT1:KodeEtiket)          !List box control field - type derived from field
TBT1:NamaEtiket        LIKE(TBT1:NamaEtiket)          !List box control field - type derived from field
TBT1:Pemakaian         LIKE(TBT1:Pemakaian)           !List box control field - type derived from field
TBT1:ItemCode          LIKE(TBT1:ItemCode)            !List box control field - type derived from field
TBT1:NoTrans           LIKE(TBT1:NoTrans)             !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW7::View:Browse    VIEW(TBTransResepItter)
                       PROJECT(TBT4:NoTrans)
                       PROJECT(TBT4:ItemCode)
                       PROJECT(TBT4:Itter)
                     END
Queue:Browse:4       QUEUE                            !Queue declaration for browse/combo box using ?List:4
TBT4:NoTrans           LIKE(TBT4:NoTrans)             !List box control field - type derived from field
TBT4:ItemCode          LIKE(TBT4:ItemCode)            !List box control field - type derived from field
TBT4:Itter             LIKE(TBT4:Itter)               !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Resep Dokter'),AT(,,420,333),FONT('MS Sans Serif',8,,),CENTER,IMM,HLP('BrowseResepElektronis'),SYSTEM,GRAY,RESIZE,MDI
                       LIST,AT(8,20,406,90),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('80L(2)|M*~No Trans~@s20@64L(2)|M~Kode Reg~@s15@64L(2)|M~Kode Pasien~@s15@64L(2)|' &|
   'M~Kode Dokter~@s15@80R(2)|M~Tanggal~C(0)@d06@80R(2)|M~Jam~C(0)@t04@36R(2)|M~Her~' &|
   'C(0)@n-7@28R(2)|M~Status~C(0)@n3@'),FROM(Queue:Browse:1)
                       STRING('Item Resep'),AT(9,135),USE(?String1:2)
                       STRING('Obat Campur'),AT(211,135),USE(?String1:3)
                       LIST,AT(9,147,199,102),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('55L|M~Irem Code~@s20@100L|M~Item Name~@s100@60D|M~Nomor~L@n15.2@60D|M~Iso~L@s15@' &|
   '60D|M~Qty~L@n15.2@60D|M~Unit~L@s15@200D|M~Keterangan~L@s50@28R|M~Status Resep~L@' &|
   'n-7@80L|M~No Trans~@s20@'),FROM(Queue:Browse)
                       LIST,AT(211,147,199,102),USE(?List:2),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('80L|M~No Trans~@s20@60L|M~Item Code~@s15@400L|M~Item Name~@s100@60D|M~Qty~L@n15.' &|
   '2@40D|M~Unit~L@s10@60D|M~Nomor~L@n15.2@60D|M~Item Code 1~L@s15@'),FROM(Queue:Browse:2)
                       STRING('Etiket'),AT(9,252),USE(?String1)
                       STRING('Itter'),AT(211,252),USE(?String1:4)
                       LIST,AT(9,263,199,54),USE(?List:3),IMM,MSG('Browsing Records'),FORMAT('60L|M~Kode Etiket~@s15@200L|M~Nama Etiket~@s50@60D|M~Pemakaian~L@n15.2@60L|M~Ite' &|
   'm Code~@s15@80L~No Trans~@s20@'),FROM(Queue:Browse:3)
                       LIST,AT(211,263,199,54),USE(?List:4),IMM,MSG('Browsing Records'),FORMAT('80L|M~No Trans~@s20@60L|M~Item Code~@s15@56R|M~Itter~L@n-14@'),FROM(Queue:Browse:4)
                       SHEET,AT(4,4,415,127),USE(?CurrentTab)
                         TAB('&Nomor'),USE(?Tab:2)
                           PROMPT('No Trans:'),AT(9,115),USE(?TBT2:NoTrans:Prompt)
                           ENTRY(@s20),AT(59,115,60,10),USE(TBT2:NoTrans)
                         END
                         TAB('&Semua'),USE(?Tab2)
                           PROMPT('No Trans:'),AT(9,116),USE(?TBT2:NoTrans:Prompt:2)
                           ENTRY(@s20),AT(59,116,60,10),USE(TBT2:NoTrans,,?TBT2:NoTrans:2)
                         END
                       END
                       BUTTON('&Selesai'),AT(365,319,45,14),USE(?Close)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
SetQueueRecord         PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - choice(?currenttab)=2
BRW4                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
                     END

BRW4::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW5                 CLASS(BrowseClass)                    ! Browse using ?List:2
Q                      &Queue:Browse:2                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
                     END

BRW5::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW6                 CLASS(BrowseClass)                    ! Browse using ?List:3
Q                      &Queue:Browse:3                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
                     END

BRW6::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW7                 CLASS(BrowseClass)                    ! Browse using ?List:4
Q                      &Queue:Browse:4                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
                     END

BRW7::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
  GlobalErrors.SetProcedureName('BrowseResepElektronis')
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
  Relate:TBTransResepDokterDetail.Open                     ! File TBTransResepItter used by this procedure, so make sure it's RelationManager is open
  Relate:TBTransResepDokterEtiket.Open                     ! File TBTransResepItter used by this procedure, so make sure it's RelationManager is open
  Relate:TBTransResepDokterHeader.Open                     ! File TBTransResepItter used by this procedure, so make sure it's RelationManager is open
  Relate:TBTransResepItter.Open                            ! File TBTransResepItter used by this procedure, so make sure it's RelationManager is open
  Relate:TBTransResepObatCampur.Open                       ! File TBTransResepItter used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:TBTransResepDokterHeader,SELF) ! Initialize the browse manager
  BRW4.Init(?List,Queue:Browse.ViewPosition,BRW4::View:Browse,Queue:Browse,Relate:TBTransResepDokterDetail,SELF) ! Initialize the browse manager
  BRW5.Init(?List:2,Queue:Browse:2.ViewPosition,BRW5::View:Browse,Queue:Browse:2,Relate:TBTransResepObatCampur,SELF) ! Initialize the browse manager
  BRW6.Init(?List:3,Queue:Browse:3.ViewPosition,BRW6::View:Browse,Queue:Browse:3,Relate:TBTransResepDokterEtiket,SELF) ! Initialize the browse manager
  BRW7.Init(?List:4,Queue:Browse:4.ViewPosition,BRW7::View:Browse,Queue:Browse:4,Relate:TBTransResepItter,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  ?List:2{Prop:LineHeight} = 0
  ?List:3{Prop:LineHeight} = 0
  ?List:4{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,TBT2:PK)                              ! Add the sort order for TBT2:PK for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?TBT2:NoTrans:2,TBT2:NoTrans,1,BRW1) ! Initialize the browse locator using ?TBT2:NoTrans:2 using key: TBT2:PK , TBT2:NoTrans
  BRW1.AddSortOrder(,TBT2:PK)                              ! Add the sort order for TBT2:PK for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?TBT2:NoTrans,TBT2:NoTrans,1,BRW1) ! Initialize the browse locator using ?TBT2:NoTrans using key: TBT2:PK , TBT2:NoTrans
  BRW1.SetFilter('(tbt2:status=0)')                        ! Apply filter expression to browse
  BRW1.AddField(TBT2:NoTrans,BRW1.Q.TBT2:NoTrans)          ! Field TBT2:NoTrans is a hot field or requires assignment from browse
  BRW1.AddField(TBT2:KodeReg,BRW1.Q.TBT2:KodeReg)          ! Field TBT2:KodeReg is a hot field or requires assignment from browse
  BRW1.AddField(TBT2:KodePasien,BRW1.Q.TBT2:KodePasien)    ! Field TBT2:KodePasien is a hot field or requires assignment from browse
  BRW1.AddField(TBT2:KodeDokter,BRW1.Q.TBT2:KodeDokter)    ! Field TBT2:KodeDokter is a hot field or requires assignment from browse
  BRW1.AddField(TBT2:Tanggal,BRW1.Q.TBT2:Tanggal)          ! Field TBT2:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(TBT2:Jam,BRW1.Q.TBT2:Jam)                  ! Field TBT2:Jam is a hot field or requires assignment from browse
  BRW1.AddField(TBT2:Her,BRW1.Q.TBT2:Her)                  ! Field TBT2:Her is a hot field or requires assignment from browse
  BRW1.AddField(TBT2:Status,BRW1.Q.TBT2:Status)            ! Field TBT2:Status is a hot field or requires assignment from browse
  BRW4.Q &= Queue:Browse
  BRW4.AddSortOrder(,TBT:PK)                               ! Add the sort order for TBT:PK for sort order 1
  BRW4.AddRange(TBT:NoTrans,Relate:TBTransResepDokterDetail,Relate:TBTransResepDokterHeader) ! Add file relationship range limit for sort order 1
  BRW4.AddLocator(BRW4::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW4::Sort0:Locator.Init(,TBT:ItemCode,1,BRW4)           ! Initialize the browse locator using  using key: TBT:PK , TBT:ItemCode
  BRW4.AddField(TBT:ItemCode,BRW4.Q.TBT:ItemCode)          ! Field TBT:ItemCode is a hot field or requires assignment from browse
  BRW4.AddField(TBT:ItemName,BRW4.Q.TBT:ItemName)          ! Field TBT:ItemName is a hot field or requires assignment from browse
  BRW4.AddField(TBT:Nomor,BRW4.Q.TBT:Nomor)                ! Field TBT:Nomor is a hot field or requires assignment from browse
  BRW4.AddField(TBT:Isi,BRW4.Q.TBT:Isi)                    ! Field TBT:Isi is a hot field or requires assignment from browse
  BRW4.AddField(TBT:Qty,BRW4.Q.TBT:Qty)                    ! Field TBT:Qty is a hot field or requires assignment from browse
  BRW4.AddField(TBT:Unit,BRW4.Q.TBT:Unit)                  ! Field TBT:Unit is a hot field or requires assignment from browse
  BRW4.AddField(TBT:Keterangan,BRW4.Q.TBT:Keterangan)      ! Field TBT:Keterangan is a hot field or requires assignment from browse
  BRW4.AddField(TBT:StatusResep,BRW4.Q.TBT:StatusResep)    ! Field TBT:StatusResep is a hot field or requires assignment from browse
  BRW4.AddField(TBT:NoTrans,BRW4.Q.TBT:NoTrans)            ! Field TBT:NoTrans is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse:2
  BRW5.AddSortOrder(,TBT3:PK)                              ! Add the sort order for TBT3:PK for sort order 1
  BRW5.AddRange(TBT3:NoTrans,Relate:TBTransResepObatCampur,Relate:TBTransResepDokterHeader) ! Add file relationship range limit for sort order 1
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort0:Locator.Init(,TBT3:ItemCode,1,BRW5)          ! Initialize the browse locator using  using key: TBT3:PK , TBT3:ItemCode
  BRW5.AddField(TBT3:NoTrans,BRW5.Q.TBT3:NoTrans)          ! Field TBT3:NoTrans is a hot field or requires assignment from browse
  BRW5.AddField(TBT3:ItemCode,BRW5.Q.TBT3:ItemCode)        ! Field TBT3:ItemCode is a hot field or requires assignment from browse
  BRW5.AddField(TBT3:ItemName,BRW5.Q.TBT3:ItemName)        ! Field TBT3:ItemName is a hot field or requires assignment from browse
  BRW5.AddField(TBT3:Qty,BRW5.Q.TBT3:Qty)                  ! Field TBT3:Qty is a hot field or requires assignment from browse
  BRW5.AddField(TBT3:Unit,BRW5.Q.TBT3:Unit)                ! Field TBT3:Unit is a hot field or requires assignment from browse
  BRW5.AddField(TBT3:Nomor,BRW5.Q.TBT3:Nomor)              ! Field TBT3:Nomor is a hot field or requires assignment from browse
  BRW5.AddField(TBT3:ItemCode1,BRW5.Q.TBT3:ItemCode1)      ! Field TBT3:ItemCode1 is a hot field or requires assignment from browse
  BRW6.Q &= Queue:Browse:3
  BRW6.AddSortOrder(,TBT1:PK)                              ! Add the sort order for TBT1:PK for sort order 1
  BRW6.AddRange(TBT1:ItemCode,Relate:TBTransResepDokterEtiket,Relate:TBTransResepDokterDetail) ! Add file relationship range limit for sort order 1
  BRW6.AddLocator(BRW6::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW6::Sort0:Locator.Init(,TBT1:KodeEtiket,1,BRW6)        ! Initialize the browse locator using  using key: TBT1:PK , TBT1:KodeEtiket
  BRW6.AddField(TBT1:KodeEtiket,BRW6.Q.TBT1:KodeEtiket)    ! Field TBT1:KodeEtiket is a hot field or requires assignment from browse
  BRW6.AddField(TBT1:NamaEtiket,BRW6.Q.TBT1:NamaEtiket)    ! Field TBT1:NamaEtiket is a hot field or requires assignment from browse
  BRW6.AddField(TBT1:Pemakaian,BRW6.Q.TBT1:Pemakaian)      ! Field TBT1:Pemakaian is a hot field or requires assignment from browse
  BRW6.AddField(TBT1:ItemCode,BRW6.Q.TBT1:ItemCode)        ! Field TBT1:ItemCode is a hot field or requires assignment from browse
  BRW6.AddField(TBT1:NoTrans,BRW6.Q.TBT1:NoTrans)          ! Field TBT1:NoTrans is a hot field or requires assignment from browse
  BRW7.Q &= Queue:Browse:4
  BRW7.AddSortOrder(,TBT4:PK)                              ! Add the sort order for TBT4:PK for sort order 1
  BRW7.AddRange(TBT4:NoTrans,Relate:TBTransResepItter,Relate:TBTransResepDokterHeader) ! Add file relationship range limit for sort order 1
  BRW7.AddLocator(BRW7::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW7::Sort0:Locator.Init(,TBT4:ItemCode,1,BRW7)          ! Initialize the browse locator using  using key: TBT4:PK , TBT4:ItemCode
  BRW7.AddField(TBT4:NoTrans,BRW7.Q.TBT4:NoTrans)          ! Field TBT4:NoTrans is a hot field or requires assignment from browse
  BRW7.AddField(TBT4:ItemCode,BRW7.Q.TBT4:ItemCode)        ! Field TBT4:ItemCode is a hot field or requires assignment from browse
  BRW7.AddField(TBT4:Itter,BRW7.Q.TBT4:Itter)              ! Field TBT4:Itter is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseResepElektronis',QuickWindow)        ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW4.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW5.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW6.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW7.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:TBTransResepDokterDetail.Close
    Relate:TBTransResepDokterEtiket.Close
    Relate:TBTransResepDokterHeader.Close
    Relate:TBTransResepItter.Close
    Relate:TBTransResepObatCampur.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseResepElektronis',QuickWindow)     ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF choice(?currenttab)=2
    RETURN SELF.SetSort(1,Force)
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (TBT2:status=0)
    SELF.Q.TBT2:NoTrans_NormalFG = 65280                   ! Set conditional color values for TBT2:NoTrans
    SELF.Q.TBT2:NoTrans_NormalBG = 12632256
    SELF.Q.TBT2:NoTrans_SelectedFG = 65280
    SELF.Q.TBT2:NoTrans_SelectedBG = 8421504
  ELSIF (TBT2:status=1)
    SELF.Q.TBT2:NoTrans_NormalFG = 255                     ! Set conditional color values for TBT2:NoTrans
    SELF.Q.TBT2:NoTrans_NormalBG = 12632256
    SELF.Q.TBT2:NoTrans_SelectedFG = 255
    SELF.Q.TBT2:NoTrans_SelectedBG = 8421504
  ELSE
    SELF.Q.TBT2:NoTrans_NormalFG = -1                      ! Set color values for TBT2:NoTrans
    SELF.Q.TBT2:NoTrans_NormalBG = -1
    SELF.Q.TBT2:NoTrans_SelectedFG = -1
    SELF.Q.TBT2:NoTrans_SelectedBG = -1
  END


BRW4.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW5.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW6.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW7.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

Trig_WindowReturRawatInap PROCEDURE                        ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
loc_mr               BYTE                                  !
loc::thread          BYTE                                  !
loc::pers_disc       BYTE                                  !
loc::no_mr           LONG                                  !
loc::status          STRING(10)                            !
loc:mitra            STRING(20)                            !
window               WINDOW('Pengembalian obat-obatan dari Ruangan ke Farmasi'),AT(,,287,158),ICON('Vcrprior.ico'),GRAY,MDI,IMM
                       ENTRY(@n010_),AT(77,41),USE(loc::no_mr),RIGHT(1),FONT('Times New Roman',12,,)
                       BUTTON('&OK'),AT(227,16,50,21),USE(?OkButton),LEFT,ICON(ICON:Tick),DEFAULT
                       BUTTON('&Keluar'),AT(227,41,50,21),USE(?CancelButton),LEFT,ICON(ICON:Cross)
                       STRING('BARU'),AT(15,4,24,10),USE(?String13),FONT(,,COLOR:Yellow,)
                       PANEL,AT(15,16,203,47),USE(?Panel1)
                       STRING('Data Pasien Ruang Rawat'),AT(67,18,91,11),USE(?String1),TRN,FONT('Comic Sans MS',,COLOR:Purple,FONT:italic)
                       LINE,AT(16,32,200,0),USE(?Line1),COLOR(040FF00H),LINEWIDTH(2)
                       PROMPT('Nomor RM :'),AT(27,43),USE(?loc::no_mr:Prompt),TRN,FONT('Times New Roman',12,COLOR:Black,FONT:bold)
                       BUTTON('...'),AT(128,40,17,16),USE(?Button4),DISABLE,HIDE
                       GROUP('Resume Pasien'),AT(15,68,256,83),USE(?Group1),BOXED,TRN,FONT('Lucida Handwriting',12,0800040H,)
                         STRING('Nama :'),AT(49,82),USE(?String7),TRN,FONT('Tahoma',10,COLOR:Maroon,)
                         STRING(@s35),AT(110,82),USE(JPas:Nama),TRN,FONT('Times New Roman',,COLOR:Black,)
                         STRING('Alamat :'),AT(49,99),USE(?String9),TRN,FONT('Tahoma',10,COLOR:Maroon,)
                         STRING(@s35),AT(110,99),USE(JPas:Alamat),TRN,FONT('Times New Roman',,COLOR:Black,)
                         STRING('Ruang Rawat :'),AT(49,115),USE(?String11),TRN,FONT('Tahoma',10,COLOR:Maroon,)
                         STRING(@s20),AT(110,115),USE(ITbr:NAMA_RUANG),TRN,FONT('Times New Roman',,COLOR:Black,)
                         STRING('Status Pembayaran :'),AT(49,132),USE(?String2),TRN,FONT('Tahoma',10,COLOR:Maroon,)
                         STRING(@n1),AT(112,132),USE(RI_HR:Pembayaran),TRN,FONT('Times New Roman',,,)
                         STRING('['),AT(119,132),USE(?String4),TRN,FONT('Times New Roman',,COLOR:Black,)
                         STRING(@s10),AT(127,132),USE(loc::status),TRN,FONT('Times New Roman',,COLOR:Black,)
                         STRING(']'),AT(170,132),USE(?String5),TRN,FONT('Times New Roman',,COLOR:Black,)
                         STRING(@s20),AT(175,132),USE(loc:mitra)
                       END
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass

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
  loc::no_mr = 0
  CLEAR(loc::status)
  CLEAR(JPas:Nama)
  CLEAR(JPas:Alamat)
  CLEAR(ITbr:NAMA_RUANG)
  CLEAR(JPas:Jenis_Pasien)
  ?OkButton{PROP:DISABLE}=1
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_WindowReturRawatInap')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?loc::no_mr
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  loc::thread=glo::mainthreadno
  !POST(EVENT:Disable_ReturRInap,,loc::thread)
  
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:APDTRANS.SetOpenRelated()
  Relate:APDTRANS.Open                                     ! File JKontrak used by this procedure, so make sure it's RelationManager is open
  Relate:APkemtmp.Open                                     ! File JKontrak used by this procedure, so make sure it's RelationManager is open
  Access:IPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITbrRwt.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITbKelas.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:IDataKtr.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITrPasen.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:RI_HRInap.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:RI_PinRuang.UseFile                               ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKontrak.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Trig_WindowReturRawatInap',window)         ! Restore window settings from non-volatile store
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
    INIMgr.Update('Trig_WindowReturRawatInap',window)      ! Save window data to non-volatile store
  END
  !POST(EVENT:Enable_ReturRInap,,loc::thread)
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
    OF ?loc::no_mr
      JPas:Nomor_mr=loc::no_mr
      access:jpasien.fetch(JPas:KeyNomorMr)
      !IF JPas:Inap<>1 then
      !   message('Nomor RM Tidak Ada Dalam daftar Rawat Inap')
      !   ?OkButton{PROP:DISABLE}=1
      !   CLEAR (JPas:Nama)
      !   CLEAR (JPas:Alamat)
      !   CLEAR (ITbr:NAMA_RUANG)
      !   CLEAR (LOC::Status)
      !   CLEAR (JPas:Jenis_Pasien)
      !   DISPLAY
      !   SELECT(?loc::no_mr)
      !ELSE
         ri_hrinap{prop:sql}='select * from dba.ri_hrinap where nomor_mr='&loc::no_mr&' order by NoUrut desc'
         ri_hrinap{prop:sql}='select * from dba.ri_hrinap where nomor_mr='&loc::no_mr&' order by NoUrut desc'
         access:ri_hrinap.next()
         IF RI_HR:Pembayaran = 3
            IDtK:Nomor_mr = loc::no_mr
            GET(IDataKtr,IDtK:KeyNomorMr)
            LOC::Status = 'Kontraktor'
            JKon:KODE_KTR=RI_HR:Kontraktor
            access:jkontrak.fetch(JKon:KeyKodeKtr)
            loc:mitra =JKon:NAMA_KTR
            display
         ELSIF RI_HR:Pembayaran= 2
            LOC::Status = 'Tunai'
         ELSIF RI_HR:Pembayaran = 1
            LOC::Status = 'Pegawai'
         END
      
         if errorcode()=33 then
            message('Pasien Sudah Pulang !!! Hubungi Ruangan/Pendaftaran !!1')
         elsif RI_HR:statusbayar=1 then
            message('Pasien Sudah Dibuatkan Nota !!! Hubungi Keuangan !!!')
            ?OkButton{PROP:DISABLE}=1
            CLEAR (JPas:Nama)
            CLEAR (JPas:Alamat)
            CLEAR (ITbr:NAMA_RUANG)
            CLEAR (LOC::Status)
            CLEAR (JPas:Jenis_Pasien)
            DISPLAY
            SELECT(?loc::no_mr)
            cycle
         elsif RI_HR:StatusTutupFar=1 then
            message('Status Farmasi sudah ditutup !!!')
            ?OkButton{PROP:DISABLE}=1
            CLEAR (JPas:Nama)
            CLEAR (JPas:Alamat)
            CLEAR (ITbr:NAMA_RUANG)
            CLEAR (LOC::Status)
            CLEAR (JPas:Jenis_Pasien)
            DISPLAY
            SELECT(?loc::no_mr)
            cycle
        elsif RI_HR:no_nota<>'' then
            message('Nota sudah dibuat  !!!')
            ?OkButton{PROP:DISABLE}=1
            CLEAR (JPas:Nama)
            CLEAR (JPas:Alamat)
            CLEAR (ITbr:NAMA_RUANG)
            CLEAR (LOC::Status)
            CLEAR (JPas:Jenis_Pasien)
            DISPLAY
            SELECT(?loc::no_mr)
            cycle
         else
            ri_pinruang{prop:sql}='select * from dba.ri_pinruang where nomor_mr='&RI_HR:Nomor_mr&' and nourut='&RI_HR:NoUrut&' order by Tanggal_Masuk,Jam_Masuk desc'
            access:ri_pinruang.next()
            IF RI_PI:Status=1
               ?OkButton{PROP:DISABLE}=0
               ITbr:KODE_RUANG=RI_PI:Ruang
               GET(ITbrRwt,ITbr:KeyKodeRuang)
               APKT:Nomor_mr=loc::no_mr
               GET(APkemtmp,APKT:key_mr)
               IF ERRORCODE() = 0
                  message('Nomor RM Sedang dipakai Orang lain, Kerjakan Resep lainnya')
                  ?OkButton{PROP:DISABLE}=1
                  CLEAR (JPas:Nama)
                  CLEAR (JPas:Alamat)
                  CLEAR (ITbr:NAMA_RUANG)
                  CLEAR (LOC::Status)
                  CLEAR (JPas:Jenis_Pasien)
                  DISPLAY
                  SELECT(?loc::no_mr)
               ELSE
                  APHTRANS{PROP:SQL}='Select * from dba.aphtrans where nomor_mr='''&loc::no_mr&''' and tanggal>='''&format(RI_HR:Tanggal_Masuk,@d10)&''''
                  LOOP
                     IF Access:APHTRANS.Next()<>level:benign then break.
                     loc::pers_disc = 0
      
                     apdtrans{prop:sql}='select * from dba.apdtrans where n0_tran='''&APH:N0_tran&''''
                     LOOP
                        IF Access:APDTRANS.Next()<>level:benign then break.
                        IF APD:Kode_brg = '_Disc'
                           loc::pers_disc = APD:Total / (APD:Total+APH:Biaya)
                           BREAK
                        END
                     END
      
                     apdtrans{prop:sql}='select * from dba.apdtrans where n0_tran='''&APH:N0_tran&''''
                     LOOP
                        IF Access:APDTRANS.next()<>level:benign THEN BREAK.
                        IF APD:Jumlah <> 0 AND APD:Kode_brg <> '_Campur' AND APD:Kode_brg <> '_Disc'
                           APKT:Kode_brg = APD:Kode_brg
                           APKT:Nomor_mr = loc::no_mr
                           GET(APkemtmp,APKT:key_no_mr)
                           IF ERRORCODE()= 35
                              APKT:Nomor_mr   = loc::no_mr
                              APKT:Kode_brg   = APD:Kode_brg
                              if APH:Biaya>0 then
                                 APKT:Jumlah     = APD:Jumlah
                              else
                                 APKT:Jumlah     = -APD:Jumlah
                              end
                              APKT:Harga_Dasar = ( 1-loc::pers_disc ) * APD:Total / APD:Jumlah
                              APKT:Harga_Dasar_benar = APD:Harga_Dasar
                              Access:APkemtmp.Insert()
                           ELSE
                              if APH:Biaya>0 then
                                 APKT:Jumlah = APKT:Jumlah + APD:Jumlah
                              else
                                 APKT:Jumlah = APKT:Jumlah - APD:Jumlah
                              end
                              IF APH:Biaya >0
                                 IF APKT:Harga_Dasar > ( 1-loc::pers_disc ) * APD:Total / APD:Jumlah
                                    APKT:Harga_Dasar =  ( 1-loc::pers_disc ) * APD:Total / APD:Jumlah
                                 END
                                 IF APKT:Harga_Dasar_benar > APD:Harga_Dasar
                                    APKT:Harga_Dasar_benar =  APD:Harga_Dasar
                                 END
                              END
                              Access:APkemtmp.Update()
                           END
                        END
                     END
                  END
                  Glo::no_mr=loc::no_mr
               END
            end
         END
      !END
    OF ?OkButton
      glo::form_insert=1
      !UpdateReturRawatInap
      Trig_BrowseReturRawatInap
      CLEAR(loc::status)
      CLEAR(JPas:Nama)
      CLEAR(JPas:Alamat)
      CLEAR(ITbr:NAMA_RUANG)
      CLEAR(JPas:Jenis_Pasien)
      CLEAR(loc::no_mr)
      ?OkButton{PROP:DISABLE}=1
      DISPLAY
       POST(Event:CloseWindow)
    OF ?CancelButton
      glo::form_insert=0
      IF loc::no_mr <> 0
         apkemtmp{prop:sql}='delete from dba.apkemtmp where Nomor_mr='''&loc::no_mr&''''
      END
      POST(EVENT:CLOSEWINDOW)
    OF ?Button4
      globalrequest=selectrecord
      cari_mr_pasien_inap
      loc::no_mr=JPas:Nomor_mr
      display
      IF loc::no_mr=''
         message('Nomor RM Tidak Ada Dalam daftar Rawat Inap')
         ?OkButton{PROP:DISABLE}=1
         CLEAR (JPas:Nama)
         CLEAR (JPas:Alamat)
         CLEAR (ITbr:NAMA_RUANG)
         CLEAR (LOC::Status)
         CLEAR (JPas:Jenis_Pasien)
         DISPLAY
         SELECT(?loc::no_mr)
      ELSE
         IF JPas:Jenis_Pasien = 3
            IDtK:Nomor_mr = loc::no_mr
            GET(IDataKtr,IDtK:KeyNomorMr)
            LOC::Status = 'Kontraktor'
         ELSIF JPas:Jenis_Pasien= 2
            LOC::Status = 'Tunai'
         ELSIF JPas:Jenis_Pasien = 1
            LOC::Status = 'Pegawai'
         END
      
         ri_hrinap{prop:sql}='select * from dba.ri_hrinap where nomor_mr='&loc::no_mr&' and pulang=0'
         ri_hrinap{prop:sql}='select * from dba.ri_hrinap where nomor_mr='&loc::no_mr&' and pulang=0'
         access:ri_hrinap.next()
         if errorcode()=33 then
            message('Pasien Sudah Pulang !!! Hubungi Ruangan/Pendaftaran !!1')
         elsif RI_HR:statusbayar=1 then
            message('Pasien Sudah Dibuatkan Nota !!! Hubungi Keuangan !!1')
            ?OkButton{PROP:DISABLE}=1
            CLEAR (JPas:Nama)
            CLEAR (JPas:Alamat)
            CLEAR (ITbr:NAMA_RUANG)
            CLEAR (LOC::Status)
            CLEAR (JPas:Jenis_Pasien)
            DISPLAY
            SELECT(?loc::no_mr)
            cycle
         else
            ri_pinruang{prop:sql}='select * from dba.ri_pinruang where nomor_mr='&RI_HR:Nomor_mr&' and nourut='&RI_HR:NoUrut&' order by Tanggal_Masuk,Jam_Masuk desc'
            ri_pinruang{prop:sql}='select * from dba.ri_pinruang where nomor_mr='&RI_HR:Nomor_mr&' and nourut='&RI_HR:NoUrut&' order by Tanggal_Masuk,Jam_Masuk desc'
            access:ri_pinruang.next()
            message(RI_PI:Ruang)
            IF RI_PI:Status=1
               ?OkButton{PROP:DISABLE}=0
               ITbr:KODE_RUANG=RI_PI:Ruang
               GET(ITbrRwt,ITbr:KeyKodeRuang)
               APKT:Nomor_mr=loc::no_mr
               GET(APkemtmp,APKT:key_mr)
               IF ERRORCODE() = 0
                  message('Nomor RM Sedang dipakai Orang lain, Kerjakan Resep lainnya')
                  ?OkButton{PROP:DISABLE}=1
                  CLEAR (JPas:Nama)
                  CLEAR (JPas:Alamat)
                  CLEAR (ITbr:NAMA_RUANG)
                  CLEAR (LOC::Status)
                  CLEAR (JPas:Jenis_Pasien)
                  DISPLAY
                  SELECT(?loc::no_mr)
               ELSE
                  !message('Select * from dba.aphtrans where nomor_mr='''&loc::no_mr&''' and tanggal>='''&format(RI_HR:Tanggal_Masuk,@d10)&'''')
                  APHTRANS{PROP:SQL}='Select * from dba.aphtrans where nomor_mr='''&loc::no_mr&''' and tanggal>='''&format(RI_HR:Tanggal_Masuk,@d10)&''''
                  LOOP
                     IF Access:APHTRANS.Next()<>level:benign then break.
                     loc::pers_disc = 0
      
                     apdtrans{prop:sql}='select * from dba.apdtrans where n0_tran='''&APH:N0_tran&''''
                     apdtrans{prop:sql}='select * from dba.apdtrans where n0_tran='''&APH:N0_tran&''''
                     LOOP
                        IF Access:APDTRANS.Next()<>level:benign then break.
                        IF APD:Kode_brg = '_Disc'
                           loc::pers_disc = APD:Total / (APD:Total+APH:Biaya)
                           BREAK
                        END
                     END
      
                     apdtrans{prop:sql}='select * from dba.apdtrans where n0_tran='''&APH:N0_tran&''''
                     apdtrans{prop:sql}='select * from dba.apdtrans where n0_tran='''&APH:N0_tran&''''
                     LOOP
                        IF Access:APDTRANS.next()<>level:benign THEN BREAK.
                        IF APD:Jumlah <> 0 AND APD:Kode_brg <> '_Campur' AND APD:Kode_brg <> '_Disc'
                           APKT:Kode_brg = APD:Kode_brg
                           APKT:Nomor_mr = loc::no_mr
                           GET(APkemtmp,APKT:key_no_mr)
                           IF ERRORCODE()= 35
                              APKT:Nomor_mr   = loc::no_mr
                              APKT:Kode_brg   = APD:Kode_brg
                              if APH:Biaya>0 then
                                 APKT:Jumlah     = APD:Jumlah
                              else
                                 APKT:Jumlah     = -APD:Jumlah
                              end
                              APKT:Harga_Dasar= ( 1-loc::pers_disc ) * APD:Total / APD:Jumlah
                              APKT:Harga_Dasar_benar = APD:Harga_Dasar
                              Access:APkemtmp.Insert()
                           ELSE
                              if APH:Biaya>0 then
                                 APKT:Jumlah = APKT:Jumlah + APD:Jumlah
                              else
                                 APKT:Jumlah = APKT:Jumlah - APD:Jumlah
                              end
                              IF APH:Biaya >0
                                 IF APKT:Harga_Dasar > ( 1-loc::pers_disc ) * APD:Total / APD:Jumlah
                                    APKT:Harga_Dasar =  ( 1-loc::pers_disc ) * APD:Total / APD:Jumlah
                                 END
                                 IF APKT:Harga_Dasar_benar > APD:Harga_Dasar
                                    APKT:Harga_Dasar_benar =  APD:Harga_Dasar
                                 END
                              END
                              Access:APkemtmp.Update()
                           END
                        END
                     END
                  END
                  Glo::no_mr=loc::no_mr
               END
            end
         END
      END
      
      
      
    END
  ReturnValue = PARENT.TakeAccepted()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

Trig_BrowseReturRawatInap PROCEDURE                        ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
hapus                BYTE                                  !
FilesOpened          BYTE                                  !
Lunas                STRING(5)                             !
Poliklinik           STRING(1)                             !
loc::no_mr           LONG                                  !
BRW1::View:Browse    VIEW(APHTRANS)
                       PROJECT(APH:Nomor_mr)
                       PROJECT(APH:Tanggal)
                       PROJECT(APH:Biaya)
                       PROJECT(APH:N0_tran)
                       PROJECT(APH:Asal)
                       PROJECT(APH:User)
                       JOIN(JPas:KeyNomorMr,APH:Nomor_mr)
                         PROJECT(JPas:Nama)
                         PROJECT(JPas:Nomor_mr)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APH:Nomor_mr           LIKE(APH:Nomor_mr)             !List box control field - type derived from field
JPas:Nama              LIKE(JPas:Nama)                !List box control field - type derived from field
APH:Tanggal            LIKE(APH:Tanggal)              !List box control field - type derived from field
APH:Biaya              LIKE(APH:Biaya)                !List box control field - type derived from field
APH:N0_tran            LIKE(APH:N0_tran)              !List box control field - type derived from field
APH:N0_tran_NormalFG   LONG                           !Normal forground color
APH:N0_tran_NormalBG   LONG                           !Normal background color
APH:N0_tran_SelectedFG LONG                           !Selected forground color
APH:N0_tran_SelectedBG LONG                           !Selected background color
Lunas                  LIKE(Lunas)                    !List box control field - type derived from local data
Poliklinik             LIKE(Poliklinik)               !List box control field - type derived from local data
APH:Asal               LIKE(APH:Asal)                 !List box control field - type derived from field
APH:User               LIKE(APH:User)                 !List box control field - type derived from field
JPas:Nomor_mr          LIKE(JPas:Nomor_mr)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW6::View:Browse    VIEW(APDTRANS)
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
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
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
QuickWindow          WINDOW('Pengembalian Obat dari Ruang rawat Inap'),AT(,,457,233),FONT('Times New Roman',8,COLOR:Black,),CENTER,IMM,HLP('Tran_Poliklinik'),ALRT(EscKey),SYSTEM,GRAY,RESIZE,MDI
                       LIST,AT(8,20,435,57),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('48L|FM~Nomor RM~C@N010_@105L|FM~Nama~C@s35@58R(1)|M~Tanggal~C(0)@D8@64R(1)|M~Bia' &|
   'ya~C(0)@n-15.2@64L|M*~N 0 tran~C@s15@20L|M~Lunas~@s5@32L|M~Poliklinik~C@s1@44L|M' &|
   '~Asal~@s10@16L|M~User~@s4@'),FROM(Queue:Browse:1)
                       LIST,AT(5,127,443,79),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('43L|FM~Kode Barang~C@s10@160L|FM~Nama Obat~C@s40@63R(2)|M~Jumlah~C(0)@n-12.2@63R' &|
   '(2)|M~Total~C(0)@n-15.2@60R(2)|M~Diskon~C(0)@n-15.2@60L~Camp~C@n2@60L~N 0 tran~C' &|
   '@s15@'),FROM(Queue:Browse)
                       STRING('BARU'),AT(125,6,40,11),USE(?String1),TRN,FONT('Arial',10,COLOR:Yellow,FONT:bold)
                       BUTTON('T&ransaksi (F4)'),AT(371,82,73,26),USE(?Insert:3),LEFT,FONT('Times New Roman',8,080FF80H,FONT:bold),MSG('Transaksi Pengembalian Barang'),TIP('Transaksi Pengembalian Barang'),KEY(F4Key),ICON(ICON:Open)
                       BUTTON('Cetak &Nota'),AT(83,82,59,26),USE(?Print:2),HIDE,LEFT,FONT('Times New Roman',8,COLOR:Blue,FONT:bold),MSG('Mencetak Nota Pengembalian Uang'),TIP('Cetak Nota Transaksi'),ICON(ICON:Print1)
                       BUTTON('Cetak &Detail'),AT(10,82,59,26),USE(?Print),LEFT,FONT('Times New Roman',8,COLOR:Blue,FONT:bold),MSG('Mencetak Keseluruhan Pengembalian ( SBBM)'),TIP('Cetak SBBM'),ICON(ICON:Print)
                       BUTTON('&Select'),AT(228,43,45,14),USE(?Select:2),HIDE
                       BUTTON('&Change'),AT(178,43,45,14),USE(?Change:3),DISABLE,HIDE,DEFAULT
                       BUTTON('&Delete'),AT(128,43,45,14),USE(?Delete:3),DISABLE,HIDE
                       SHEET,AT(3,4,445,111),USE(?CurrentTab)
                         TAB('No. Nota [F2]'),USE(?Tab:2),KEY(F2Key)
                         END
                         TAB('Rekam Medik [F3]'),USE(?Tab:3),KEY(F3Key)
                         END
                       END
                       STRING('= Retur Obat'),AT(225,3),USE(?String2)
                       ELLIPSE,AT(282,1,19,13),USE(?Ellipse1:2),COLOR(0FF8000H),FILL(0FF8000H)
                       STRING('= KeluarObat'),AT(303,3),USE(?String2:2)
                       ELLIPSE,AT(204,1,19,13),USE(?Ellipse1),COLOR(COLOR:Red),FILL(COLOR:Red)
                       BUTTON('&Keluar'),AT(379,211,65,20),USE(?Close),LEFT,ICON('EXIT5.ICO')
                       BUTTON('Help'),AT(278,43,45,14),USE(?Help),HIDE,STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetFromAsk           PROCEDURE(*BYTE Request,*BYTE Response),DERIVED ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
SetQueueRecord         PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW1::Sort1:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW6                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
                     END

BRW6::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
  hapus=1
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_BrowseReturRawatInap')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo::no_mr',glo::no_mr)                            ! Added by: BrowseBox(ABC)
  BIND('Lunas',Lunas)                                      ! Added by: BrowseBox(ABC)
  BIND('Poliklinik',Poliklinik)                            ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:APDTRANS.Open                                     ! File RI_HRInap used by this procedure, so make sure it's RelationManager is open
  Relate:Aphtransadd.Open                                  ! File RI_HRInap used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:RI_HRInap.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:APHTRANS,SELF) ! Initialize the browse manager
  BRW6.Init(?List,Queue:Browse.ViewPosition,BRW6::View:Browse,Queue:Browse,Relate:APDTRANS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon APH:Nomor_mr for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,APH:by_medrec)   ! Add the sort order for APH:by_medrec for sort order 1
  BRW1.SetFilter('(APH:Nomor_mr = glo::no_mr)')            ! Apply filter expression to browse
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon APH:N0_tran for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,APH:by_transaksi) ! Add the sort order for APH:by_transaksi for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,APH:N0_tran,,BRW1)             ! Initialize the browse locator using  using key: APH:by_transaksi , APH:N0_tran
  BRW1.SetFilter('(APH:Nomor_mr = glo::no_mr)')            ! Apply filter expression to browse
  BRW1.AddField(APH:Nomor_mr,BRW1.Q.APH:Nomor_mr)          ! Field APH:Nomor_mr is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nama,BRW1.Q.JPas:Nama)                ! Field JPas:Nama is a hot field or requires assignment from browse
  BRW1.AddField(APH:Tanggal,BRW1.Q.APH:Tanggal)            ! Field APH:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(APH:Biaya,BRW1.Q.APH:Biaya)                ! Field APH:Biaya is a hot field or requires assignment from browse
  BRW1.AddField(APH:N0_tran,BRW1.Q.APH:N0_tran)            ! Field APH:N0_tran is a hot field or requires assignment from browse
  BRW1.AddField(Lunas,BRW1.Q.Lunas)                        ! Field Lunas is a hot field or requires assignment from browse
  BRW1.AddField(Poliklinik,BRW1.Q.Poliklinik)              ! Field Poliklinik is a hot field or requires assignment from browse
  BRW1.AddField(APH:Asal,BRW1.Q.APH:Asal)                  ! Field APH:Asal is a hot field or requires assignment from browse
  BRW1.AddField(APH:User,BRW1.Q.APH:User)                  ! Field APH:User is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nomor_mr,BRW1.Q.JPas:Nomor_mr)        ! Field JPas:Nomor_mr is a hot field or requires assignment from browse
  BRW6.Q &= Queue:Browse
  BRW6.AddSortOrder(,APD:notran_kode)                      ! Add the sort order for APD:notran_kode for sort order 1
  BRW6.AddRange(APD:N0_tran,Relate:APDTRANS,Relate:APHTRANS) ! Add file relationship range limit for sort order 1
  BRW6.AddLocator(BRW6::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW6::Sort0:Locator.Init(,APD:Kode_brg,,BRW6)            ! Initialize the browse locator using  using key: APD:notran_kode , APD:Kode_brg
  BRW6.AddField(APD:Kode_brg,BRW6.Q.APD:Kode_brg)          ! Field APD:Kode_brg is a hot field or requires assignment from browse
  BRW6.AddField(GBAR:Nama_Brg,BRW6.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW6.AddField(APD:Jumlah,BRW6.Q.APD:Jumlah)              ! Field APD:Jumlah is a hot field or requires assignment from browse
  BRW6.AddField(APD:Total,BRW6.Q.APD:Total)                ! Field APD:Total is a hot field or requires assignment from browse
  BRW6.AddField(APD:Diskon,BRW6.Q.APD:Diskon)              ! Field APD:Diskon is a hot field or requires assignment from browse
  BRW6.AddField(APD:Camp,BRW6.Q.APD:Camp)                  ! Field APD:Camp is a hot field or requires assignment from browse
  BRW6.AddField(APD:N0_tran,BRW6.Q.APD:N0_tran)            ! Field APD:N0_tran is a hot field or requires assignment from browse
  BRW6.AddField(GBAR:Kode_brg,BRW6.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_BrowseReturRawatInap',QuickWindow)    ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW6.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW6.ToolbarItem.HelpButton = ?Help
  BRW1.PrintProcedure = 2
  BRW1.PrintControl = ?Print
  BRW6.PrintProcedure = 3
  BRW6.PrintControl = ?Print:2
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:Aphtransadd.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_BrowseReturRawatInap',QuickWindow) ! Save window data to non-volatile store
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
      Trig_UpdateReturRawatInap
      PrintReturRawatInap1
      Cetak_nota_apotik12
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
    OF ?Insert:3
      hapus=0
    OF ?Close
      hapus=1
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Change:3
      ThisWindow.Update
      cycle
    OF ?Delete:3
      ThisWindow.Update
      cycle
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
      select(?close)
      presskey( 13)
    OF EVENT:CloseWindow
      if hapus=1
         apkemtmp{prop:sql}='delete from dba.apkemtmp where Nomor_mr='''&Glo::no_mr&''''
      end
    END
  ReturnValue = PARENT.TakeWindowEvent()
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


BRW1.ResetFromAsk PROCEDURE(*BYTE Request,*BYTE Response)

  CODE
  PARENT.ResetFromAsk(Request,Response)
  if request=1 and response=1 then
     RI_HR:Nomor_mr       =APH:Nomor_mr
     RI_HR:Status_Keluar  =0
     if access:ri_hrinap.fetch(RI_HR:KNomr_status)=level:benign then
        APH1:Nomor    =APH:N0_tran
        APH1:Ruangan  =RI_HR:LastRoom
        access:aphtransadd.insert()
     end
     glo::no_nota=APH:N0_tran
     Print_ReturRawatInap
  end


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


BRW1.SetQueueRecord PROCEDURE

  CODE
  IF (APH:Ra_jal = 1)
    Poliklinik = 'Y'
  ELSE
    Poliklinik = 'N'
  END
  IF (APH:Bayar = 1)
    Lunas = 'Lunas'
  ELSE
    Lunas = 'Belum'
  END
  PARENT.SetQueueRecord
  
  IF (aph:biaya<0)
    SELF.Q.APH:N0_tran_NormalFG = 255                      ! Set conditional color values for APH:N0_tran
    SELF.Q.APH:N0_tran_NormalBG = -1
    SELF.Q.APH:N0_tran_SelectedFG = 255
    SELF.Q.APH:N0_tran_SelectedBG = -1
  ELSIF (aph:biaya>=0)
    SELF.Q.APH:N0_tran_NormalFG = 16744448                 ! Set conditional color values for APH:N0_tran
    SELF.Q.APH:N0_tran_NormalBG = -1
    SELF.Q.APH:N0_tran_SelectedFG = 16744448
    SELF.Q.APH:N0_tran_SelectedBG = -1
  ELSE
    SELF.Q.APH:N0_tran_NormalFG = -1                       ! Set color values for APH:N0_tran
    SELF.Q.APH:N0_tran_NormalBG = -1
    SELF.Q.APH:N0_tran_SelectedFG = -1
    SELF.Q.APH:N0_tran_SelectedBG = -1
  END
  SELF.Q.Lunas = Lunas                                     !Assign formula result to display queue
  SELF.Q.Poliklinik = Poliklinik                           !Assign formula result to display queue


BRW6.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

Trig_UpdateReturRawatInapDetil PROCEDURE                   ! Generated from procedure template - Window

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
  GlobalErrors.SetProcedureName('Trig_UpdateReturRawatInapDetil')
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
  INIMgr.Fetch('Trig_UpdateReturRawatInapDetil',QuickWindow) ! Restore window settings from non-volatile store
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
    INIMgr.Update('Trig_UpdateReturRawatInapDetil',QuickWindow) ! Save window data to non-volatile store
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

Trig_UpdateReturRawatInap PROCEDURE                        ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
sudah_nomor          BYTE                                  !
Tahun_ini            LONG                                  !
putar                ULONG                                 !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
LOC::Status          STRING(10)                            !
vl_nomor             STRING(15)                            !
loc::total           REAL                                  !
loc::diskon          REAL                                  !
BRW4::View:Browse    VIEW(APDTRANS)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Total)
                       PROJECT(APD:Diskon)
                       PROJECT(APD:N0_tran)
                       PROJECT(APD:Camp)
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
APD:N0_tran            LIKE(APD:N0_tran)              !List box control field - type derived from field
APD:Camp               LIKE(APD:Camp)                 !Primary key field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::APH:Record  LIKE(APH:RECORD),THREAD
QuickWindow          WINDOW('Pengembalian obat Rawat Inap ke Farmasi'),AT(,,456,225),FONT('Times New Roman',8,,),CENTER,IMM,HLP('UpdateAPHTRANS'),ALRT(EscKey),TIMER(100),GRAY,RESIZE,MDI
                       ENTRY(@D8),AT(341,2,104,13),USE(APH:Tanggal),DISABLE,RIGHT(1),FONT('Times New Roman',12,,),MSG('Tanggal berobat pasen'),TIP('Tanggal berobat pasen')
                       SHEET,AT(8,5,440,93),USE(?CurrentTab)
                         TAB('Rawat Inap'),USE(?Tab:1),FONT('Times New Roman',10,COLOR:Black,)
                           STRING('BARU'),AT(62,6,28,10),USE(?String10),FONT('Arial',10,COLOR:Yellow,FONT:bold)
                           BOX,AT(13,25,207,26),USE(?Box1),ROUND,COLOR(040FF00H)
                           PROMPT('Ruang Rawat :'),AT(265,28),USE(?Prompt11),FONT('Times New Roman',12,COLOR:Navy,FONT:bold+FONT:italic+FONT:underline)
                           STRING(@s20),AT(341,31),USE(ITbr:NAMA_RUANG),FONT('Times New Roman',10,,)
                           BOX,AT(13,55,207,34),USE(?Box2),ROUND,COLOR(040FF00H)
                           PANEL,AT(251,21,187,40),USE(?Panel3),BEVEL(5,-5)
                           STRING('Nomor RM :'),AT(37,30),USE(?String6),FONT('Arial Black',12,COLOR:Purple,)
                           STRING(@N010_),AT(123,30),USE(JPas:Nomor_mr),FONT('Arial Black',12,,)
                           PROMPT('Nama  :'),AT(19,59),USE(?Prompt5),FONT(,,,FONT:bold)
                           STRING(@s35),AT(69,59,147,10),USE(JPas:Nama)
                           PROMPT('NIP:'),AT(252,64),USE(?APH:NIP:Prompt)
                           ENTRY(@s7),AT(271,64,39,11),USE(APH:NIP),DISABLE
                           PROMPT('Kontrak:'),AT(316,64),USE(?APH:Kontrak:Prompt)
                           ENTRY(@s10),AT(351,64,45,11),USE(APH:Kontrak),DISABLE
                           PROMPT('Status     :'),AT(267,43),USE(?Prompt12)
                           STRING(@n1),AT(306,43),USE(APH:cara_bayar)
                           STRING('['),AT(325,43),USE(?String3)
                           STRING(@s10),AT(336,43),USE(LOC::Status)
                           STRING(']'),AT(384,43),USE(?String5)
                           PROMPT('Alamat :'),AT(19,75),USE(?Prompt6),FONT(,,,FONT:bold)
                           STRING(@s35),AT(69,75,147,10),USE(JPas:Alamat)
                           OPTION('Lama Baru'),AT(343,76,94,19),USE(APH:LamaBaru),DISABLE,BOXED
                             RADIO('Lama'),AT(353,83),USE(?Option1:Radio1),VALUE('0')
                             RADIO('Baru'),AT(391,83),USE(?Option1:Radio2),VALUE('1')
                           END
                           PROMPT('Kode Apotik:'),AT(222,80),USE(?APH:Kode_Apotik:Prompt)
                           ENTRY(@s5),AT(271,80,39,11),USE(APH:Kode_Apotik),DISABLE,MSG('Kode Apotik'),TIP('Kode Apotik')
                         END
                       END
                       PROMPT('&TANGGAL:'),AT(287,5),USE(?APH:Tanggal:Prompt)
                       PROMPT('N0 tran:'),AT(9,204),USE(?APH:N0_tran:Prompt),FONT('Times New Roman',12,COLOR:Black,FONT:bold+FONT:italic+FONT:underline)
                       ENTRY(@s15),AT(49,203,95,13),USE(APH:N0_tran),DISABLE,FONT('Arial',12,COLOR:Black,FONT:bold),MSG('nomor transaksi'),TIP('nomor transaksi')
                       LINE,AT(280,206,163,0),USE(?Line1),COLOR(COLOR:Black),LINEWIDTH(2)
                       LIST,AT(8,103,440,68),USE(?Browse:4),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('55L|FM~Kode Barang~@s10@170L|M~Nama Obat~C@s40@65D(14)|M~Jumlah~C(0)@n10.2@77D(1' &|
   '4)|M~Total~C(0)@n-14.2@60R(14)|M~Diskon~C(0)@n-15.2@60D(14)|M~N 0 tran~C(0)@s15@'),FROM(Queue:Browse:4)
                       PROMPT('Total :'),AT(283,209),USE(?APH:Biaya:Prompt),FONT('Times New Roman',14,COLOR:Black,FONT:bold+FONT:italic)
                       ENTRY(@n-15.2),AT(335,209,97,14),USE(APH:Biaya),DISABLE,RIGHT(1),MSG('Total Biaya Pembelian'),TIP('Total Biaya Pembelian')
                       PANEL,AT(7,200,139,19),USE(?Panel2)
                       BUTTON('&OK [End]'),AT(205,185,45,34),USE(?OK),FONT('Times New Roman',10,COLOR:Black,),KEY(EndKey),ICON(ICON:Tick),DEFAULT
                       PROMPT('Diskon:'),AT(283,190),USE(?loc::diskon:Prompt)
                       ENTRY(@n-15.2),AT(335,190,95,13),USE(loc::diskon),DISABLE,DECIMAL(14)
                       BUTTON('&Batal'),AT(148,185,45,34),USE(?Cancel),FONT('Times New Roman',12,COLOR:Black,),ICON(ICON:Cross)
                       BUTTON('&Tambah Obat (+)'),AT(7,176,127,19),USE(?Insert:5),FONT('Times New Roman',10,,FONT:bold),KEY(PlusKey)
                       PROMPT('Sub Total:'),AT(283,174),USE(?loc::total:Prompt)
                       ENTRY(@n-15.2),AT(335,174,95,13),USE(loc::total),DISABLE,DECIMAL(14)
                       BUTTON('&Change'),AT(113,0,45,14),USE(?Change:5),HIDE
                       BUTTON('&Delete'),AT(165,0,45,14),USE(?Delete:5),HIDE
                       BUTTON('Help'),AT(225,0,45,14),USE(?Help),HIDE,STD(STD:Help)
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
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Update                 PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW4                 CLASS(BrowseClass)                    ! Browse using ?Browse:4
Q                      &Queue:Browse:4                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetFromView          PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW4::Sort0:StepClass StepStringClass                      ! Default Step Manager
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
BATAL_D_UTAMA ROUTINE
    SET( BRW4::View:Browse)
    LOOP
        NEXT( BRW4::View:Browse)
        IF ERRORCODE() > 0 THEN BREAK.
        DELETE( BRW4::View:Browse)
    END

!Proses Penomoran Otomatis Transaksi
Isi_Nomor Routine
   vl_nomor=''
   display
   loop
      logout(1,nomor_batal)
      if errorcode()=56 then
         cycle.
      !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
      NOM:No_Urut=1
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
         NOMU:Urut =1
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
        !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
        NOM1:No_urut=1
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
           NOMU:Urut =1
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
      !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
      nomor_batal{prop:sql}='delete dba.nomor_batal where No=1'
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 1=Transaksi Apotik ke pasien Rawat Inap
         NOM1:No_urut=1
         access:nomor_skr.fetch(NOM1:PrimaryKey)
         if not(errorcode()) then
            vl_nomor =NOM1:No_Trans
            NOM1:No_Trans=sub(vl_nomor,1,3)&sub(format(year(today()),@p####p),4,2)&format(month(today()),@p##p)&'00002'
            access:nomor_skr.update()
            if errorcode()<>0 then
               rollback
               cycle
            else
               vl_nomor=sub(vl_nomor,1,3)&sub(format(year(today()),@p####p),4,2)&format(month(today()),@p##p)&'00001'
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
   !Silahkan diganti ---> 1=Transaksi Apotik ke Ruangan
   NOM:No_Urut =1
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=APH:N0_tran
   NOM:Keterangan='Retur R. Inap'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 1=Transaksi Apotik ke Ruangan
   NOMU:Urut =1
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOMU:Nomor=APH:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   delete(nomoruse)

hapus_nomor_use routine
   NOMU:Urut    =1
   NOMU:Nomor   =APH:N0_tran
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
    GlobalErrors.Throw(Msg:UpdateIllegal)
    RETURN
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  ?OK{PROP:DISABLE}=TRUE
  sudah_nomor=0
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_UpdateReturRawatInap')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APH:Tanggal
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APH:Record,History::APH:Record)
  SELF.AddHistoryField(?APH:Tanggal,2)
  SELF.AddHistoryField(?APH:NIP,13)
  SELF.AddHistoryField(?APH:Kontrak,14)
  SELF.AddHistoryField(?APH:cara_bayar,9)
  SELF.AddHistoryField(?APH:LamaBaru,15)
  SELF.AddHistoryField(?APH:Kode_Apotik,10)
  SELF.AddHistoryField(?APH:N0_tran,4)
  SELF.AddHistoryField(?APH:Biaya,3)
  SELF.AddUpdateFile(Access:APHTRANS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:APDTRANS.Open                                     ! File Aphtransadd used by this procedure, so make sure it's RelationManager is open
  Relate:APkemtmp.Open                                     ! File Aphtransadd used by this procedure, so make sure it's RelationManager is open
  Relate:Ano_pakai.Open                                    ! File Aphtransadd used by this procedure, so make sure it's RelationManager is open
  Relate:Aphtransadd.Open                                  ! File Aphtransadd used by this procedure, so make sure it's RelationManager is open
  Relate:IAP_SET.Open                                      ! File Aphtransadd used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File Aphtransadd used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_Batal.Open                                  ! File Aphtransadd used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File Aphtransadd used by this procedure, so make sure it's RelationManager is open
  Relate:Tbstawal.Open                                     ! File Aphtransadd used by this procedure, so make sure it's RelationManager is open
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKelPeg.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITbrRwt.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:IPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITrPasen.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITbKelas.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:RI_HRInap.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:RI_PinRuang.UseFile                               ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:APHTRANS
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:None                        ! Changes not allowed
    SELF.CancelAction = Cancel:Cancel                      ! No confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  !!!MEDENNNNNNIIII
  JPas:Nomor_mr=Glo::no_mr
  GET(JPasien,JPas:KeyNomorMr)
  
  !message('select * from dba.ri_hrinap where nomor_mr='&Glo::no_mr&' order by NoUrut desc')
  ri_hrinap{prop:sql}='select * from dba.ri_hrinap where nomor_mr='&Glo::no_mr&' order by NoUrut desc'
  ri_hrinap{prop:sql}='select * from dba.ri_hrinap where nomor_mr='&Glo::no_mr&' order by NoUrut desc'
  access:ri_hrinap.next()
  
  IF RI_HR:Pembayaran= 3
      IDtK:Nomor_mr = Glo::no_mr
      GET(IDataKtr,IDtK:KeyNomorMr)
      LOC::Status = 'Kontraktor'
  ELSIF RI_HR:Pembayaran = 2
      LOC::Status = 'Tunai'
  ELSIF RI_HR:Pembayaran = 1
      LOC::Status = 'Pegawai'
  END
  
  
  !message('select * from dba.ri_pinruang where nomor_mr='&RI_HR:Nomor_mr&' and nourut='&RI_HR:NoUrut&' order by Tanggal_Masuk,Jam_Masuk desc')
  ri_pinruang{prop:sql}='select * from dba.ri_pinruang where nomor_mr='&RI_HR:Nomor_mr&' and nourut='&RI_HR:NoUrut&' order by Tanggal_Masuk desc,Jam_Masuk desc'
  ri_pinruang{prop:sql}='select * from dba.ri_pinruang where nomor_mr='&RI_HR:Nomor_mr&' and nourut='&RI_HR:NoUrut&' order by Tanggal_Masuk desc,Jam_Masuk desc'
  access:ri_pinruang.next()
     
  IF RI_PI:Status=1
     !message(RI_PI:Ruang)
     ?BROWSE:4{PROP:DISABLE}=0
     ?Insert:5{PROP:DISABLE}=0
     ITbr:KODE_RUANG=RI_PI:Ruang
     GET(ITbrRwt,ITbr:KeyKodeRuang)
     ITbk:KodeKelas=ITbr:KODEKelas
     GET(ITbKelas,ITbk:KeyKodeKelas)
     status = CLIP(ITbk:Kelas)
  end
  
  BRW4.Init(?Browse:4,Queue:Browse:4.ViewPosition,BRW4::View:Browse,Queue:Browse:4,Relate:APDTRANS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  APH:NIP=RI_HR:NIP
  APH:Kontrak=RI_HR:Kontraktor
  APH:LamaBaru=RI_HR:LamaBaru
  APH:cara_bayar=RI_HR:Pembayaran
  APH:Urut    =RI_HR:NoUrut
  display
  if self.request=1 then
     do isi_nomor
  end
  ?Browse:4{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW4.Q &= Queue:Browse:4
  BRW4::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon APD:Kode_brg for sort order 1
  BRW4.AddSortOrder(BRW4::Sort0:StepClass,APD:notran_kode) ! Add the sort order for APD:notran_kode for sort order 1
  BRW4.AddRange(APD:N0_tran,Relate:APDTRANS,Relate:APHTRANS) ! Add file relationship range limit for sort order 1
  BRW4.AddField(APD:Kode_brg,BRW4.Q.APD:Kode_brg)          ! Field APD:Kode_brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Nama_Brg,BRW4.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW4.AddField(APD:Jumlah,BRW4.Q.APD:Jumlah)              ! Field APD:Jumlah is a hot field or requires assignment from browse
  BRW4.AddField(APD:Total,BRW4.Q.APD:Total)                ! Field APD:Total is a hot field or requires assignment from browse
  BRW4.AddField(APD:Diskon,BRW4.Q.APD:Diskon)              ! Field APD:Diskon is a hot field or requires assignment from browse
  BRW4.AddField(APD:N0_tran,BRW4.Q.APD:N0_tran)            ! Field APD:N0_tran is a hot field or requires assignment from browse
  BRW4.AddField(APD:Camp,BRW4.Q.APD:Camp)                  ! Field APD:Camp is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Kode_brg,BRW4.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_UpdateReturRawatInap',QuickWindow)    ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW4.AskProcedure = 1
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
  BRW4.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW4.ToolbarItem.HelpButton = ?Help
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  if (self.request=1 and self.response=2) or (self.request=3 and self.response=1) then
     do batal_nomor
     DO BATAL_D_UTAMA
  end
  if self.request=1 and self.response=1 then
     do hapus_nomor_use
  end
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:APkemtmp.Close
    Relate:Ano_pakai.Close
    Relate:Aphtransadd.Close
    Relate:IAP_SET.Close
    Relate:NomorUse.Close
    Relate:Nomor_Batal.Close
    Relate:Nomor_SKR.Close
    Relate:Tbstawal.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_UpdateReturRawatInap',QuickWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
    APH:Tanggal = Today()
    APH:Kode_Apotik = GL_entryapotik
    APH:Jam = clock()
  PARENT.PrimeFields


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  PEGA:Nik = APH:NIP                                       ! Assign linking field value
  Access:SMPegawai.Fetch(PEGA:Pkey)
  JKon:KODE_KTR = APH:Kontrak                              ! Assign linking field value
  Access:JKontrak.Fetch(JKon:KeyKodeKtr)
  APH:Biaya = loc::total - loc::diskon
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
    Trig_UpdateReturRawatInapDetil
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
    OF ?OK
      glo::no_nota = APH:N0_tran
      
      ! *****UNTUK file ApHTrans******
      APH:User=Glo:USER_ID
      APH:Asal = RI_PI:Ruang
      APH:Bayar=0
      APH:Ra_jal=0
      !APH:cara_bayar=JPas:Jenis_Pasien
      APH:Kode_Apotik=GL_entryapotik
      APH:Nomor_mr=Glo::no_mr
      !APH:Biaya = APH:Biaya
      
      !*****untuk file ApDTrans
      !cek dulu bulannya ya, kalau sudah berubah, tulis dulu ke file awal bulan
      IF MONTH(glo::tgl_awal_kerja) = MONTH(TODAY())
      ELSE
          !Untuk file apHtrans
          APH:Tanggal = TODAY()
          Tahun_ini = YEAR(TODAY())
      
          !untuk file ApDTrans
          SET(APDTRANS)
          APD:N0_tran = APH:N0_tran
          SET(APD:by_transaksi,APD:by_transaksi)
          LOOP
              IF Access:APDTRANS.Next()<>level:benign OR APD:N0_tran <> APH:N0_tran THEN BREAK.
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
                          IF ERRORCODE() > 0
                          END
      
                      END
                      !end ngisi tbstawal
          END
      !!
      END
    OF ?Cancel
      !DO BATAL_D_UTAMA
      sudah_nomor = 0
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
  OF ?LOC::Status
    case JPas:Jenis_Pasien
    OF 1
        LOC::Status = 'PEGAWAI'
    OF 2
        LOC::Status = 'TUNAI'
    OF 3
        LOC::Status = 'KONTRAKTOR'
    END
  END
  ReturnValue = PARENT.TakeFieldEvent()
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
      apkemtmp{prop:sql}='delete from dba.apkemtmp where Nomor_mr='''&Glo::no_mr&''''
      IF SELF.RESPONSE = 1
         !Cetak_detail_kembali_obat
         !Print_ReturRawatInap
      END
    OF EVENT:Timer
      IF APH:Biaya = 0
          ?OK{PROP:DISABLE}=1
      ELSE
          ?OK{PROP:DISABLE}=0
      END
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APH:Biaya = loc::total - loc::diskon


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


BRW4.ResetFromView PROCEDURE

loc::total:Sum       REAL                                  ! Sum variable for browse totals
loc::diskon:Sum      REAL                                  ! Sum variable for browse totals
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
    loc::total:Sum += APD:Total
    loc::diskon:Sum += APD:Diskon
  END
  loc::total = loc::total:Sum
  loc::diskon = loc::diskon:Sum
  PARENT.ResetFromView
  Relate:APDTRANS.SetQuickScan(0)
  SETCURSOR()


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

