

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N035.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N030.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N034.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N036.INC'),ONCE        !Req'd for module callout resolution
                     END


BrowseSaldoAwalBulan PROCEDURE                             ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
VL_TOTAL             REAL                                  !
vl_grand_total       REAL                                  !
BRW1::View:Browse    VIEW(ASaldoAwal)
                       PROJECT(ASA:Kode_Barang)
                       PROJECT(ASA:Apotik)
                       PROJECT(ASA:Bulan)
                       PROJECT(ASA:Tahun)
                       PROJECT(ASA:Jumlah)
                       PROJECT(ASA:Harga)
                       PROJECT(ASA:Total)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
ASA:Kode_Barang        LIKE(ASA:Kode_Barang)          !List box control field - type derived from field
ASA:Apotik             LIKE(ASA:Apotik)               !List box control field - type derived from field
ASA:Bulan              LIKE(ASA:Bulan)                !List box control field - type derived from field
ASA:Tahun              LIKE(ASA:Tahun)                !List box control field - type derived from field
ASA:Jumlah             LIKE(ASA:Jumlah)               !List box control field - type derived from field
ASA:Harga              LIKE(ASA:Harga)                !List box control field - type derived from field
ASA:Total              LIKE(ASA:Total)                !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW4::View:Browse    VIEW(GBarang)
                       PROJECT(GBAR:Kode_brg)
                       PROJECT(GBAR:Nama_Brg)
                       PROJECT(GBAR:No_Satuan)
                       PROJECT(GBAR:Status)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:No_Satuan         LIKE(GBAR:No_Satuan)           !List box control field - type derived from field
GBAR:Status            LIKE(GBAR:Status)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Saldo Awal Bulan'),AT(,,369,188),FONT('Arial',8,,),CENTER,IMM,HLP('BrowseSaldoAwalBulan'),SYSTEM,GRAY,MDI
                       SHEET,AT(1,3,365,88),USE(?Sheet1)
                         TAB('Kode Barang (F2)'),USE(?Tab1),KEY(F2Key)
                           PROMPT('&Cari Kode Barang:'),AT(7,75),USE(?GBAR:Kode_brg:Prompt)
                           ENTRY(@s10),AT(68,75,60,10),USE(GBAR:Kode_brg),MSG('Kode Barang'),TIP('Kode Barang')
                         END
                         TAB('Nama Barang (F3)'),USE(?Tab2),KEY(F3Key)
                           PROMPT('&Cari Nama Obat:'),AT(7,75),USE(?GBAR:Nama_Brg:Prompt)
                           ENTRY(@s40),AT(63,75,60,10),USE(GBAR:Nama_Brg),MSG('Nama Barang'),TIP('Nama Barang')
                         END
                       END
                       LIST,AT(5,20,357,50),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('52L|M~Kode Barang~@s10@173L|M~Nama Barang~@s40@40L|M~Satuan~@s10@12L|M~Status~@n' &|
   '3@'),FROM(Queue:Browse)
                       LIST,AT(5,95,357,76),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('48L(2)|M~Kode Barang~@s10@28L(2)|M~Apotik~@s5@36R(2)|M~Bulan~C(0)@n-7@36R(2)|M~T' &|
   'ahun~C(0)@n-7@62R(2)|M~Jumlah~C(0)@n-15.2@74L(2)|M~Harga~C(0)@n-15.5@60L(2)|M~To' &|
   'tal~C(0)@n-15.2@'),FROM(Queue:Browse:1)
                       BUTTON('&Proses Saldo Awal'),AT(29,173,75,14),USE(?Button2)
                       BUTTON('&Selesai'),AT(130,173,45,14),USE(?Close)
                       BUTTON('&Tambah'),AT(184,173,45,14),USE(?Insert)
                       BUTTON('&Ubah'),AT(230,173,45,14),USE(?Change)
                       BUTTON('&Hapus'),AT(276,173,45,14),USE(?Delete)
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
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW4                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW4::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW4::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - choice(?sheet1)=2
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
  GlobalErrors.SetProcedureName('BrowseSaldoAwalBulan')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GBAR:Kode_brg:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:ASaldoAwal.SetOpenRelated()
  Relate:ASaldoAwal.Open                                   ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Access:GBarang.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:ASaldoAwal,SELF) ! Initialize the browse manager
  BRW4.Init(?List,Queue:Browse.ViewPosition,BRW4::View:Browse,Queue:Browse,Relate:GBarang,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,ASA:PrimaryKey)                       ! Add the sort order for ASA:PrimaryKey for sort order 1
  BRW1.AddRange(ASA:Kode_Barang,Relate:ASaldoAwal,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,ASA:Apotik,1,BRW1)             ! Initialize the browse locator using  using key: ASA:PrimaryKey , ASA:Apotik
  BRW1.SetFilter('(asa:apotik=GL_entryapotik)')            ! Apply filter expression to browse
  BRW1.AddField(ASA:Kode_Barang,BRW1.Q.ASA:Kode_Barang)    ! Field ASA:Kode_Barang is a hot field or requires assignment from browse
  BRW1.AddField(ASA:Apotik,BRW1.Q.ASA:Apotik)              ! Field ASA:Apotik is a hot field or requires assignment from browse
  BRW1.AddField(ASA:Bulan,BRW1.Q.ASA:Bulan)                ! Field ASA:Bulan is a hot field or requires assignment from browse
  BRW1.AddField(ASA:Tahun,BRW1.Q.ASA:Tahun)                ! Field ASA:Tahun is a hot field or requires assignment from browse
  BRW1.AddField(ASA:Jumlah,BRW1.Q.ASA:Jumlah)              ! Field ASA:Jumlah is a hot field or requires assignment from browse
  BRW1.AddField(ASA:Harga,BRW1.Q.ASA:Harga)                ! Field ASA:Harga is a hot field or requires assignment from browse
  BRW1.AddField(ASA:Total,BRW1.Q.ASA:Total)                ! Field ASA:Total is a hot field or requires assignment from browse
  BRW4.Q &= Queue:Browse
  BRW4.AddSortOrder(,GBAR:KeyNama)                         ! Add the sort order for GBAR:KeyNama for sort order 1
  BRW4.AddLocator(BRW4::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW4::Sort1:Locator.Init(?GBAR:Nama_Brg,GBAR:Nama_Brg,,BRW4) ! Initialize the browse locator using ?GBAR:Nama_Brg using key: GBAR:KeyNama , GBAR:Nama_Brg
  BRW4.SetFilter('(gbar:status=1)')                        ! Apply filter expression to browse
  BRW4.AddSortOrder(,GBAR:KeyKodeBrg)                      ! Add the sort order for GBAR:KeyKodeBrg for sort order 2
  BRW4.AddLocator(BRW4::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW4::Sort0:Locator.Init(?GBAR:Kode_brg,GBAR:Kode_brg,,BRW4) ! Initialize the browse locator using ?GBAR:Kode_brg using key: GBAR:KeyKodeBrg , GBAR:Kode_brg
  BRW4.SetFilter('(gbar:status=1)')                        ! Apply filter expression to browse
  BRW4.AddField(GBAR:Kode_brg,BRW4.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Nama_Brg,BRW4.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:No_Satuan,BRW4.Q.GBAR:No_Satuan)      ! Field GBAR:No_Satuan is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Status,BRW4.Q.GBAR:Status)            ! Field GBAR:Status is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseSaldoAwalBulan',QuickWindow)         ! Restore window settings from non-volatile store
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
    Relate:ASaldoAwal.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseSaldoAwalBulan',QuickWindow)      ! Save window data to non-volatile store
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
    OF ?Button2
      ThisWindow.Update
      START(ProsesSaldoAwalBulan, 25000)
      ThisWindow.Reset
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
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  SELF.EIP &= BRW1::EIPManager                             ! Set the EIP manager
  SELF.AddEditControl(,1) ! ASA:Kode_Barang Disable
  SELF.AddEditControl(,2) ! ASA:Apotik Disable
  SELF.AddEditControl(,3) ! ASA:Bulan Disable
  SELF.AddEditControl(,4) ! ASA:Tahun Disable
  SELF.DeleteAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Default+EIPAction:Remain+EIPAction:RetainColumn
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW4.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW4.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF choice(?sheet1)=2
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

BrowseSaldoAwalPerBulan PROCEDURE                          ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
VL_TOTAL             REAL                                  !
vl_grand_total       REAL                                  !
vl_total_hitung      REAL                                  !
BRW1::View:Browse    VIEW(ASaldoAwal)
                       PROJECT(ASA:Kode_Barang)
                       PROJECT(ASA:Apotik)
                       PROJECT(ASA:Bulan)
                       PROJECT(ASA:Tahun)
                       PROJECT(ASA:Jumlah)
                       PROJECT(ASA:Harga)
                       PROJECT(ASA:Total)
                       JOIN(GBAR:KeyKodeBrg,ASA:Kode_Barang)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
ASA:Kode_Barang        LIKE(ASA:Kode_Barang)          !List box control field - type derived from field
ASA:Kode_Barang_NormalFG LONG                         !Normal forground color
ASA:Kode_Barang_NormalBG LONG                         !Normal background color
ASA:Kode_Barang_SelectedFG LONG                       !Selected forground color
ASA:Kode_Barang_SelectedBG LONG                       !Selected background color
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
ASA:Apotik             LIKE(ASA:Apotik)               !List box control field - type derived from field
ASA:Bulan              LIKE(ASA:Bulan)                !List box control field - type derived from field
ASA:Tahun              LIKE(ASA:Tahun)                !List box control field - type derived from field
ASA:Jumlah             LIKE(ASA:Jumlah)               !List box control field - type derived from field
ASA:Harga              LIKE(ASA:Harga)                !List box control field - type derived from field
ASA:Total              LIKE(ASA:Total)                !List box control field - type derived from field
VL_TOTAL               LIKE(VL_TOTAL)                 !List box control field - type derived from local data
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Saldo Awal Bulan'),AT(,,423,188),FONT('MS Sans Serif',8,COLOR:Black,),CENTER,IMM,HLP('BrowseSaldoAwalBulan'),SYSTEM,GRAY,RESIZE,MDI
                       LIST,AT(1,7,421,164),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('45L(2)|M*~Kode Barang~@s10@93L(2)|M~Nama Obat~@s40@23L(2)|M~Apotik~@s5@16R(2)|M~' &|
   'Bln~C(0)@n-7@25R(2)|M~Tahun~C(0)@n-7@32R(2)|M~Jumlah~C(0)@n-15@51L(2)|M~Harga~C(' &|
   '0)@n-15.2@51R(2)|M~Total~C(0)@n-15.2@60R(2)|M~VL TOTAL~C(0)@n-15.2@'),FROM(Queue:Browse:1)
                       BUTTON('&Query'),AT(33,174,45,14),USE(?Query)
                       BUTTON('&Selesai'),AT(103,174,45,14),USE(?Close)
                       PROMPT('Grand Total:'),AT(222,175),USE(?vl_grand_total:Prompt)
                       ENTRY(@n-15.2),AT(281,175,60,10),USE(vl_grand_total),DECIMAL(14)
                       ENTRY(@n-15.2),AT(343,175,77,10),USE(vl_total_hitung),DECIMAL(14)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
QBE4                 QueryFormClass                        ! QBE List Class. 
QBV4                 QueryFormVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetFromView          PROCEDURE(),DERIVED                 ! Method added to host embed code
SetQueueRecord         PROCEDURE(),DERIVED                 ! Method added to host embed code
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
  GlobalErrors.SetProcedureName('BrowseSaldoAwalPerBulan')
  WindowBulanTahun()
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  BIND('glo:bulan',glo:bulan)                              ! Added by: BrowseBox(ABC)
  BIND('glo:tahun',glo:tahun)                              ! Added by: BrowseBox(ABC)
  BIND('VL_TOTAL',VL_TOTAL)                                ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:ASaldoAwal.SetOpenRelated()
  Relate:ASaldoAwal.Open                                   ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Access:GBarang.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:ASaldoAwal,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  QBE4.Init(QBV4, INIMgr,'BrowseSaldoAwalPerBulan', GlobalErrors)
  QBE4.QkSupport = True
  QBE4.QkMenuIcon = 'QkQBE.ico'
  QBE4.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,ASA:PrimaryKey)                       ! Add the sort order for ASA:PrimaryKey for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,ASA:Kode_Barang,1,BRW1)        ! Initialize the browse locator using  using key: ASA:PrimaryKey , ASA:Kode_Barang
  BRW1.SetFilter('(asa:apotik=GL_entryapotik and asa:bulan=glo:bulan and asa:tahun=glo:tahun and asa:kode_barang<<>'''' and asa:kode_barang<<>''0{10}'')') ! Apply filter expression to browse
  BRW1.AddField(ASA:Kode_Barang,BRW1.Q.ASA:Kode_Barang)    ! Field ASA:Kode_Barang is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Nama_Brg,BRW1.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW1.AddField(ASA:Apotik,BRW1.Q.ASA:Apotik)              ! Field ASA:Apotik is a hot field or requires assignment from browse
  BRW1.AddField(ASA:Bulan,BRW1.Q.ASA:Bulan)                ! Field ASA:Bulan is a hot field or requires assignment from browse
  BRW1.AddField(ASA:Tahun,BRW1.Q.ASA:Tahun)                ! Field ASA:Tahun is a hot field or requires assignment from browse
  BRW1.AddField(ASA:Jumlah,BRW1.Q.ASA:Jumlah)              ! Field ASA:Jumlah is a hot field or requires assignment from browse
  BRW1.AddField(ASA:Harga,BRW1.Q.ASA:Harga)                ! Field ASA:Harga is a hot field or requires assignment from browse
  BRW1.AddField(ASA:Total,BRW1.Q.ASA:Total)                ! Field ASA:Total is a hot field or requires assignment from browse
  BRW1.AddField(VL_TOTAL,BRW1.Q.VL_TOTAL)                  ! Field VL_TOTAL is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Kode_brg,BRW1.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseSaldoAwalPerBulan',QuickWindow)      ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE4,1)
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ASaldoAwal.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseSaldoAwalPerBulan',QuickWindow)   ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW1.ResetFromView PROCEDURE

vl_grand_total:Sum   REAL                                  ! Sum variable for browse totals
vl_total_hitung:Sum  REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:ASaldoAwal.SetQuickScan(1)
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
    vl_grand_total:Sum += ASA:Total
    vl_total_hitung:Sum += VL_TOTAL
  END
  vl_grand_total = vl_grand_total:Sum
  vl_total_hitung = vl_total_hitung:Sum
  PARENT.ResetFromView
  Relate:ASaldoAwal.SetQuickScan(0)
  SETCURSOR()


BRW1.SetQueueRecord PROCEDURE

  CODE
  VL_TOTAL = ASA:Jumlah * ASA:Harga
  PARENT.SetQueueRecord
  
  IF (vl_total<>asa:total)
    SELF.Q.ASA:Kode_Barang_NormalFG = 255                  ! Set conditional color values for ASA:Kode_Barang
    SELF.Q.ASA:Kode_Barang_NormalBG = -1
    SELF.Q.ASA:Kode_Barang_SelectedFG = 255
    SELF.Q.ASA:Kode_Barang_SelectedBG = -1
  ELSE
    SELF.Q.ASA:Kode_Barang_NormalFG = -1                   ! Set color values for ASA:Kode_Barang
    SELF.Q.ASA:Kode_Barang_NormalBG = -1
    SELF.Q.ASA:Kode_Barang_SelectedFG = -1
    SELF.Q.ASA:Kode_Barang_SelectedBG = -1
  END
  SELF.Q.VL_TOTAL = VL_TOTAL                               !Assign formula result to display queue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

WindowTanggalSkr PROCEDURE                                 ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
Window               WINDOW('Tahun - Bulan'),AT(,,185,82),FONT('Arial',8,,FONT:regular),CENTER,GRAY
                       ENTRY(@n-7),AT(72,18,60,10),USE(glo:bulan),RIGHT(1)
                       ENTRY(@n-14),AT(72,33,60,10),USE(glo:tahun),RIGHT(1)
                       BUTTON('OK'),AT(43,58,103,14),USE(?OkButton),DEFAULT
                       PROMPT('tahun:'),AT(22,33),USE(?glo:tahun:Prompt)
                       PROMPT('bulan:'),AT(22,18),USE(?glo:bulan:Prompt)
                     END

ThisWindow           CLASS(WindowManager)
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('WindowTanggalSkr')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?glo:bulan
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Glo::kode_apotik = GL_entryapotik
  Relate:GApotik.SetOpenRelated()
  Relate:GApotik.Open                                      ! File GApotik used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('WindowTanggalSkr',Window)                  ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:GApotik.Close
  END
  IF SELF.Opened
    INIMgr.Update('WindowTanggalSkr',Window)               ! Save window data to non-volatile store
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
    OF ?OkButton
      ThisWindow.Update
      break
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

BrowseStokOpnameBaru PROCEDURE                             ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(ApStokop)
                       PROJECT(Apso:Kode_Apotik)
                       PROJECT(Apso:Kode_Barang)
                       PROJECT(Apso:Tahun)
                       PROJECT(Apso:Bulan)
                       PROJECT(Apso:Stkomputer)
                       PROJECT(Apso:StHitung)
                       PROJECT(Apso:Harga)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Apso:Kode_Apotik       LIKE(Apso:Kode_Apotik)         !List box control field - type derived from field
Apso:Kode_Barang       LIKE(Apso:Kode_Barang)         !List box control field - type derived from field
Apso:Tahun             LIKE(Apso:Tahun)               !List box control field - type derived from field
Apso:Bulan             LIKE(Apso:Bulan)               !List box control field - type derived from field
Apso:Stkomputer        LIKE(Apso:Stkomputer)          !List box control field - type derived from field
Apso:StHitung          LIKE(Apso:StHitung)            !List box control field - type derived from field
Apso:Harga             LIKE(Apso:Harga)               !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(GBarang)
                       PROJECT(GBAR:Kode_brg)
                       PROJECT(GBAR:Nama_Brg)
                       PROJECT(GBAR:No_Satuan)
                       PROJECT(GBAR:Status)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:No_Satuan         LIKE(GBAR:No_Satuan)           !List box control field - type derived from field
GBAR:Status            LIKE(GBAR:Status)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('STOK Opname '),AT(,,422,259),FONT('Arial',8,,),CENTER,IMM,HLP('BrowseStokOpnameBaru'),SYSTEM,GRAY,MDI
                       SHEET,AT(2,3,420,186),USE(?Sheet1)
                         TAB('Kode Barang (F2)'),USE(?Tab1),KEY(F2Key)
                           PROMPT('&Cari Kode Barang:'),AT(9,173),USE(?Apso:Kode_Barang:Prompt)
                           ENTRY(@s10),AT(72,173,60,10),USE(GBAR:Kode_brg),MSG('Kode Barang'),TIP('Kode Barang')
                         END
                         TAB('Nama Barang (F3)'),USE(?Tab2),KEY(F3Key)
                           PROMPT('&Cari Nama Barang:'),AT(6,173),USE(?GBAR:Nama_Brg:Prompt)
                           ENTRY(@s40),AT(68,173,60,10),USE(GBAR:Nama_Brg),MSG('Nama Barang'),TIP('Nama Barang')
                         END
                       END
                       LIST,AT(6,22,410,145),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('51L|M~Kode Barang~@s10@165L|M~Nama Barang~@s40@40L|M~Satuan~@s10@12L|M~Status~@n' &|
   '3@'),FROM(Queue:Browse)
                       LIST,AT(6,192,410,46),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('48L(2)|M~Kode Apotik~@s5@52L(2)|M~Kode Barang~@s10@34R(2)|M~Tahun~C(0)@n4@32R(2)' &|
   '|M~Bulan~C(0)@n3@46D(12)|M~Jml Komputer~C(0)@n-12.2@44D(10)|M~Jml Fisik~C(0)@n10' &|
   '.2@40R(2)|M~Harga~C(0)@n-17.2@'),FROM(Queue:Browse:1)
                       BUTTON('&Tambah'),AT(106,242,45,14),USE(?Insert:2)
                       BUTTON('&Ubah'),AT(154,242,45,14),USE(?Change:2),DEFAULT
                       BUTTON('&Delete'),AT(321,210,45,14),USE(?Delete:2),DISABLE,HIDE
                       BUTTON('&Proses Stok Opname'),AT(11,242,81,14),USE(?Button5)
                       BUTTON('&Selesai'),AT(202,242,45,14),USE(?Close)
                       BUTTON('&Proses Stok Opname'),AT(267,241,81,14),USE(?Button5:2),HIDE
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
ResetFromAsk           PROCEDURE(*BYTE Request,*BYTE Response),DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW5                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW5::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW5::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - choice(?sheet1)=2
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
  GlobalErrors.SetProcedureName('BrowseStokOpnameBaru')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  WindowTanggalSkr()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Apso:Kode_Barang:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  BIND('glo:bulan',glo:bulan)                              ! Added by: BrowseBox(ABC)
  BIND('glo:tahun',glo:tahun)                              ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File ASaldoAwal used by this procedure, so make sure it's RelationManager is open
  Relate:ApStokop.Open                                     ! File ASaldoAwal used by this procedure, so make sure it's RelationManager is open
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APKStok.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ASaldoAwal.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:ApStokop,SELF) ! Initialize the browse manager
  BRW5.Init(?List,Queue:Browse.ViewPosition,BRW5::View:Browse,Queue:Browse,Relate:GBarang,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Apso:Kode_Apotik = GL_entryapotik
  Apso:Bulan  =  glo:bulan
  Apso:Tahun  =  glo:tahun
  if access:ApStokOp.fetch(Apso:keykdap_bln_thn) = level:benign then
      disable(?Button5)
  end
  
  
  IF GLO:LEVEL > 0
     ?Button5{prop:disable}=1
     ?Insert:2{prop:hide}=1
  end
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,Apso:keykode_barang)                  ! Add the sort order for Apso:keykode_barang for sort order 1
  BRW1.AddRange(Apso:Kode_Barang,Relate:ApStokop,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,Apso:Kode_Barang,,BRW1)        ! Initialize the browse locator using  using key: Apso:keykode_barang , Apso:Kode_Barang
  BRW1.SetFilter('(apso:kode_apotik=GL_entryapotik and apso:bulan=glo:bulan and apso:tahun=glo:tahun)') ! Apply filter expression to browse
  BRW1.AddField(Apso:Kode_Apotik,BRW1.Q.Apso:Kode_Apotik)  ! Field Apso:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(Apso:Kode_Barang,BRW1.Q.Apso:Kode_Barang)  ! Field Apso:Kode_Barang is a hot field or requires assignment from browse
  BRW1.AddField(Apso:Tahun,BRW1.Q.Apso:Tahun)              ! Field Apso:Tahun is a hot field or requires assignment from browse
  BRW1.AddField(Apso:Bulan,BRW1.Q.Apso:Bulan)              ! Field Apso:Bulan is a hot field or requires assignment from browse
  BRW1.AddField(Apso:Stkomputer,BRW1.Q.Apso:Stkomputer)    ! Field Apso:Stkomputer is a hot field or requires assignment from browse
  BRW1.AddField(Apso:StHitung,BRW1.Q.Apso:StHitung)        ! Field Apso:StHitung is a hot field or requires assignment from browse
  BRW1.AddField(Apso:Harga,BRW1.Q.Apso:Harga)              ! Field Apso:Harga is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse
  BRW5.AddSortOrder(,GBAR:KeyNama)                         ! Add the sort order for GBAR:KeyNama for sort order 1
  BRW5.AddLocator(BRW5::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort1:Locator.Init(?GBAR:Nama_Brg,GBAR:Nama_Brg,,BRW5) ! Initialize the browse locator using ?GBAR:Nama_Brg using key: GBAR:KeyNama , GBAR:Nama_Brg
  BRW5.SetFilter('(gbar:status=1)')                        ! Apply filter expression to browse
  BRW5.AddSortOrder(,GBAR:KeyKodeBrg)                      ! Add the sort order for GBAR:KeyKodeBrg for sort order 2
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW5::Sort0:Locator.Init(?GBAR:Kode_brg,GBAR:Kode_brg,,BRW5) ! Initialize the browse locator using ?GBAR:Kode_brg using key: GBAR:KeyKodeBrg , GBAR:Kode_brg
  BRW5.SetFilter('(gbar:status=1)')                        ! Apply filter expression to browse
  BRW5.AddField(GBAR:Kode_brg,BRW5.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Nama_Brg,BRW5.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:No_Satuan,BRW5.Q.GBAR:No_Satuan)      ! Field GBAR:No_Satuan is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Status,BRW5.Q.GBAR:Status)            ! Field GBAR:Status is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseStokOpnameBaru',QuickWindow)         ! Restore window settings from non-volatile store
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
    Relate:AFIFOIN.Close
    Relate:ApStokop.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseStokOpnameBaru',QuickWindow)      ! Save window data to non-volatile store
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
      if GLO:LEVEL>0 then
         cycle
      end
    OF ?Delete:2
      ThisWindow.Update
      cycle
    OF ?Button5
      ThisWindow.Update
      ProsesStokOpname
      brw1.resetsort(1)
      disable(?Button5)
    OF ?Button5:2
      ThisWindow.Update
      ProsesStokOpnamePerbaikan
      brw1.resetsort(1)
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
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  SELF.EIP &= BRW1::EIPManager                             ! Set the EIP manager
  SELF.AddEditControl(,1) ! Apso:Kode_Apotik Disable
  SELF.AddEditControl(,2) ! Apso:Kode_Barang Disable
  SELF.AddEditControl(,3) ! Apso:Tahun Disable
  SELF.AddEditControl(,4) ! Apso:Bulan Disable
  SELF.AddEditControl(,5) ! Apso:Stkomputer Disable
  SELF.AddEditControl(,7) ! Apso:Harga Disable
  SELF.DeleteAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Default+EIPAction:Remain+EIPAction:RetainColumn
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:2
    SELF.ChangeControl=?Change:2
    SELF.DeleteControl=?Delete:2
  END


BRW1.ResetFromAsk PROCEDURE(*BYTE Request,*BYTE Response)

  CODE
  PARENT.ResetFromAsk(Request,Response)
  if response=1 then
     if request=2 THEN
        if Apso:Harga=0 and Apso:StHitung<>0 then
           GSTO:Kode_Barang =GBAR:Kode_brg
           GSTO:Kode_Apotik =GL_entryapotik
           IF access:gstokaptk.fetch(GSTO:KeyBarang)=LEVEL:BENIGN THEN
              Apso:Harga=GSTO:Harga_Dasar*1.1
              access:apstokop.update()
              BRW1.RESETSORT(1)
           END
        end
     end
  end
  
  if request=2 and response=1 then
     !Stok Apotik
     GSTO:Kode_Apotik=Apso:Kode_Apotik
     GSTO:Kode_Barang=Apso:Kode_Barang
     if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
        GSTO:Saldo=Apso:StHitung
        access:gstokaptk.update()
     end
  
     !Kartu FIFO
     AFI:Kode_Barang  =Apso:Kode_Barang
     AFI:Mata_Uang    ='Rp'
     AFI:NoTransaksi  ='OPN'&sub(format(Apso:Tahun,@p####p),3,2)&format(Apso:Bulan,@p##p)
     AFI:Transaksi    =1
     AFI:Kode_Apotik  =Apso:Kode_Apotik
     if access:afifoin.fetch(AFI:KEY1)=level:benign then
        AFI:Jumlah    =Apso:StHitung
        AFI:Harga     =Apso:Harga
        access:afifoin.update()
     else
        AFI:Kode_Barang     =Apso:Kode_Barang
        AFI:Mata_Uang       ='Rp'
        AFI:NoTransaksi     ='OPN'&sub(format(Apso:Tahun,@p####p),3,2)&format(Apso:Bulan,@p##p)
        AFI:Transaksi       =1
        AFI:Tanggal         =date(apso:bulan,1,apso:tahun)
        AFI:Harga           =Apso:Harga
        AFI:Jumlah          =Apso:StHitung
        AFI:Jumlah_Keluar   =0
        AFI:Tgl_Update      =date(apso:bulan,1,apso:tahun)
        AFI:Jam_Update      =100
        AFI:Operator        =vg_user
        AFI:Jam             =100
        AFI:Kode_Apotik     =Apso:Kode_Apotik
        AFI:Status          =0
        access:afifoin.insert()
     end
  
     !Kartu Stok
     APK:Kode_Barang     =Apso:Kode_Barang
     APK:Tanggal         =date(Apso:Bulan,1,Apso:Tahun)
     APK:Transaksi       ='Opname'
     APK:NoTransaksi     ='OPN'&sub(format(Apso:tahun,@p####p),3,2)&format(Apso:bulan,@p##p)
     APK:Kode_Apotik     =Apso:Kode_Apotik
     if access:apkstok.fetch(APK:KEY1)=level:benign then
        APK:Debet            =Apso:StHitung
        access:apkstok.update()
     else
        APK:Kode_Barang      =Apso:Kode_Barang
        APK:Tanggal          =date(apso:bulan,1,apso:tahun)
        APK:Jam              =100
        APK:Transaksi        ='Opname'
        APK:NoTransaksi      ='OPN'&sub(format(apso:tahun,@p####p),3,2)&format(apso:bulan,@p##p)
        APK:Debet            =Apso:StHitung
        APK:Kredit           =0
        APK:Opname           =Apso:StHitung
        APK:Kode_Apotik      =Apso:Kode_Apotik
        APK:Status           =0
        access:apkstok.insert()
     end
  end
  
  
  
        


BRW5.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW5.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF choice(?sheet1)=2
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

ProsesStokOpname PROCEDURE                                 ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
vl_ada               BYTE                                  !
vl_ada_opname        BYTE                                  !
vl_no                LONG                                  !
loc:bulan            SHORT                                 !
loc:tahun            LONG                                  !
Progress:Thermometer BYTE                                  !
loc::tanggal         DATE                                  !
loc::komentar        STRING(60)                            !
vl_harga_opname      REAL                                  !
vl_hitung            SHORT(0)                              !
vl_saldo_awal        REAL                                  !
vl_debet             REAL                                  !
vl_kredit            REAL                                  !
vl_saldo_akhir       REAL                                  !
vl_saldo_awal_rp     REAL                                  !
vl_saldo_akhir_rp    REAL                                  !
vl_debet_rp          REAL                                  !
vl_kredit_rp         REAL                                  !
vl_saldo_awal_total  REAL                                  !
vl_debet_total       REAL                                  !
vl_kredit_total      REAL                                  !
vl_saldo_akhir_total REAL                                  !
apasaja              STRING(20)                            !
Process:View         VIEW(GStokAptk)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,85),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                       PROMPT('NO:'),AT(18,66),USE(?vl_no:Prompt)
                       ENTRY(@n-14),AT(41,66,60,10),USE(vl_no),RIGHT(1)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ProgressMgr          StepStringClass                       ! Progress Manager
view::file_sql view(filesql)
                 project(FIL:FString1,FIL:FReal1,FIL:FReal2)
               end

view::FReal1 view(filesql)
                 project(FIL:FReal1)
               end


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
  GlobalErrors.SetProcedureName('ProsesStokOpname')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  loc:tahun=glo:tahun
  loc:bulan=glo:bulan-1
  if loc:bulan=0 then
     loc:bulan=12
     loc:tahun=glo:tahun-1
  end
  display
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Relate:ApStokop.Open                                     ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql.Open                                      ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ASaldoAwal.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APKStok.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GBarang.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  Apso:Kode_Apotik    =Glo::kode_apotik
  Apso:Tahun          =loc:tahun
  Apso:Bulan          =loc:bulan
  if access:apstokop.fetch(Apso:keykdap_bln_thn)=level:benign then
     vl_ada_opname       =1
  end
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesStokOpname',ProgressWindow)          ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisProcess.Init(Process:View, Relate:GStokAptk, ?Progress:PctText, Progress:Thermometer, ProgressMgr, GSTO:Kode_Barang)
  ThisProcess.AddSortOrder(GSTO:KeyBarang)
  ThisProcess.SetFilter('gsto:kode_apotik=GL_entryapotik')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(GStokAptk,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AFIFOIN.Close
    Relate:ApStokop.Close
    Relate:FileSql.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesStokOpname',ProgressWindow)       ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  vl_saldo_awal       =0
  vl_debet            =0
  vl_kredit           =0
  vl_saldo_akhir      =0
  vl_saldo_awal_total =0
  vl_debet_total      =0
  vl_kredit_total     =0
  vl_saldo_akhir_total=0
  vl_saldo_awal_rp    =0
  vl_debet_rp         =0
  vl_kredit_rp        =0
  vl_saldo_akhir_rp   =0
  vl_harga_opname     =0
  vl_hitung           =0
  vl_ada              =0
  
  if vl_ada_opname=1 then
     Apso:Kode_Apotik    =GSTO:Kode_Apotik
     Apso:Kode_Barang    =GSTO:Kode_Barang
     Apso:Tahun          =loc:tahun
     Apso:Bulan          =loc:bulan
     if access:apstokop.fetch(Apso:kdapotik_brg)=level:benign then
        vl_ada=1
        vl_saldo_awal          =round(Apso:StHitung,.00001)
        vl_saldo_awal_rp       =round(Apso:Harga,.00001)
        vl_saldo_awal_total    =round(Apso:StHitung,.00001)*round(Apso:Harga,.00001)
  
        vl_saldo_akhir         =round(Apso:StHitung,.00001)
        vl_saldo_akhir_total   =round(Apso:StHitung,.00001)*round(Apso:Harga,.00001)
     end
  else
     ASA:Kode_Barang     =GSTO:Kode_Barang
     ASA:Apotik          =GSTO:Kode_Apotik
     ASA:Bulan           =loc:BULAN
     ASA:Tahun           =loc:tahun
     if access:asaldoawal.fetch(ASA:PrimaryKey)=level:benign then
        vl_saldo_awal          =round(ASA:Jumlah,.00001)
        vl_saldo_awal_rp       =round(ASA:Harga,.00001)
        vl_saldo_awal_total    =round(ASA:Total,.00001)
        vl_saldo_akhir         =round(ASA:Jumlah,.00001)
        vl_saldo_akhir_total   =round(ASA:Total,.00001)
     end
  end
  
  afifoin{prop:sql}='select * from dba.afifoin where kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''' and month(tanggal)='&loc:bulan&' and year(tanggal)='&loc:tahun&' order by tanggal,jam'
  afifoin{prop:sql}='select * from dba.afifoin where kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''' and month(tanggal)='&loc:bulan&' and year(tanggal)='&loc:tahun&' order by tanggal,jam'
  loop
     if access:afifoin.next()<>level:benign then break.
     if sub(AFI:NoTransaksi,1,3)<>'OPN' then
        vl_debet             +=round(AFI:Jumlah,.00001)
        vl_debet_total       +=round(AFI:Jumlah,.00001)*round(AFI:Harga,.00001)
     end
  end
  
  vl_debet_rp          =vl_debet_total/vl_debet
  vl_saldo_akhir       +=vl_debet
  vl_saldo_akhir_total +=vl_debet_total
  
  afifoout{prop:sql}='select * from dba.afifoout where kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''' and month(tanggal)='&loc:bulan&' and year(tanggal)='&loc:tahun&' order by tanggal,jam'
  afifoout{prop:sql}='select * from dba.afifoout where kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''' and month(tanggal)='&loc:bulan&' and year(tanggal)='&loc:tahun&' order by tanggal,jam'
  loop
     next(afifoout)
     if errorcode()<>0 then break.
     AFI:Kode_Barang  =AFI2:Kode_Barang
     AFI:NoTransaksi  =AFI2:NoTransaksi
     AFI:Kode_Apotik  =AFI2:Kode_Apotik
     AFI:Transaksi    =AFI2:Transaksi
     AFI:Mata_Uang    ='Rp'
     if access:afifoin.fetch(AFI:KEY1)=level:benign then
        vl_kredit          +=round(AFI2:Jumlah,.00001)
        vl_kredit_total    +=round(AFI2:Jumlah,.00001)*round(AFI:Harga,.00001)
     end
  end
  
  vl_kredit_rp          =vl_kredit_total/vl_kredit
  vl_saldo_akhir       -=vl_kredit
  vl_saldo_akhir_total -=vl_kredit_total
  vl_saldo_akhir_rp     =vl_saldo_akhir_total/vl_saldo_akhir
  
  afifoin{prop:sql}='update dba.afifoin set status=1 where status=0 and kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''''
  afifoout{prop:sql}='update dba.afifoout set status=1 where status=0 and kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''''
  apkstok{prop:sql}='update dba.apkstok set status=1 where status=0 and kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''''
  
  !Fifo In
  AFI:Kode_Barang     =gsto:kode_barang
  AFI:Mata_Uang       ='Rp'
  AFI:NoTransaksi     ='OPN'&sub(format(glo:tahun,@p####p),3,2)&format(glo:bulan,@p##p)
  AFI:Transaksi       =1
  AFI:Kode_Apotik     =GSTO:Kode_Apotik
  if access:afifoin.fetch(AFI:KEY1)<>level:benign then
     AFI:Kode_Barang     =gsto:kode_barang
     AFI:Mata_Uang       ='Rp'
     AFI:NoTransaksi     ='OPN'&sub(format(glo:tahun,@p####p),3,2)&format(glo:bulan,@p##p)
     AFI:Transaksi       =1
     AFI:Tanggal         =date(glo:bulan,1,glo:tahun)
     AFI:Harga           =round(vl_saldo_akhir_rp,.00001)
     AFI:Jumlah          =round(vl_saldo_akhir,.00001)
     AFI:Jumlah_Keluar   =0
     AFI:Tgl_Update      =date(glo:bulan,1,glo:tahun)
     AFI:Jam_Update      =100
     AFI:Operator        =vg_user
     AFI:Jam             =100
     AFI:Kode_Apotik     =GSTO:Kode_Apotik
     AFI:Status          =0
     access:afifoin.insert()
  end
  
  !Kartu Stok
  APK:Kode_Barang     =GSTO:Kode_Barang
  APK:Tanggal         =date(glo:bulan,1,glo:tahun)
  APK:Transaksi       ='Opname'
  APK:NoTransaksi     ='OPN'&sub(format(glo:tahun,@p####p),3,2)&format(glo:bulan,@p##p)
  APK:Kode_Apotik     =GSTO:Kode_Apotik
  if access:apkstok.fetch(APK:KEY1)<>level:benign then
     APK:Kode_Barang      =GSTO:Kode_Barang
     APK:Tanggal          =date(glo:bulan,1,glo:tahun)
     APK:Jam              =100
     APK:Transaksi        ='Opname'
     APK:NoTransaksi      ='OPN'&sub(format(glo:tahun,@p####p),3,2)&format(glo:bulan,@p##p)
     APK:Debet            =round(vl_saldo_akhir,.00001)
     APK:Kredit           =0
     APK:Opname           =round(vl_saldo_akhir,.00001)
     APK:Kode_Apotik      =GSTO:Kode_Apotik
     APK:Status           =0
     access:apkstok.insert()
  end
  
  !Saldo Awal
  ASA:Kode_Barang     =GSTO:Kode_Barang
  ASA:Apotik          =glo::kode_apotik
  ASA:Bulan           =glo:bulan
  ASA:Tahun           =glo:tahun
  if access:asaldoawal.fetch(ASA:PrimaryKey)<>level:benign then
     ASA:Kode_Barang     =GSTO:Kode_Barang
     ASA:Apotik          =Glo::kode_apotik
     ASA:Bulan           =glo:bulan
     ASA:Tahun           =glo:tahun
     ASA:Jumlah          =round(vl_saldo_akhir,.00001)
     ASA:Harga           =round(vl_saldo_akhir_rp,.00001)
     ASA:Total           =round(vl_saldo_akhir*vl_saldo_akhir_rp,.00001)
     access:asaldoawal.insert()
  end
  
  !Stok Opname
  Apso:Kode_Apotik        =glo::kode_apotik
  Apso:Kode_Barang        =GSTO:Kode_Barang
  Apso:Tahun              =glo:tahun
  Apso:Bulan              =glo:bulan
  if access:apstokop.fetch(Apso:kdapotik_brg)<>level:benign then
     Apso:Kode_Apotik        =glo::kode_apotik
     Apso:Kode_Barang        =GSTO:Kode_Barang
     Apso:Tahun              =glo:tahun
     Apso:Bulan              =glo:bulan
     Apso:Stkomputer         =round(vl_saldo_akhir,.00001)
     Apso:StHitung           =round(vl_saldo_akhir,.00001)
     Apso:Harga              =round(vl_saldo_akhir_rp,.00001)
     Apso:Nilaistok          =round(vl_saldo_akhir*vl_saldo_akhir_rp,.00001)
     access:apstokop.insert()
  end
  vl_no+=1
  display
  
  RETURN ReturnValue

