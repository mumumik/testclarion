

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N032.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N129.INC'),ONCE        !Req'd for module callout resolution
                     END


ProsesIsiData PROCEDURE                                    ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
Process:View         VIEW(ApLapBln)
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
  GlobalErrors.SetProcedureName('ProsesIsiData')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:ApInOutBln.Open                                   ! File ApInOutBln used by this procedure, so make sure it's RelationManager is open
  Relate:ApLapBln.Open                                     ! File ApInOutBln used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesIsiData',ProgressWindow)             ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:ApLapBln, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(ApLapBln,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ApInOutBln.Close
    Relate:ApLapBln.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesIsiData',ProgressWindow)          ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  APIN:Tahun      =glo:tahun
  APIN:Bulan      =glo:bulan
  APIN:Gudang     =GL_entryapotik
  APIN:Kode       =Alab:Kode
  if access:apinoutbln.fetch(APIN:PrimaryKey)=level:benign then
     APIN:Nama_Brg   =Alab:Nama_Brg
     APIN:Harga      =Alab:Harga
     APIN:Awal       =Alab:Stok_awal
     APIN:RpAwal     =Alab:SaldoAwal
     APIN:Masuk      =Alab:Stok_masuk
     APIN:RpMasuk    =Alab:Debet
     APIN:Keluar     =Alab:Stok_Keluar
     APIN:RpKeluar   =Alab:Kredit
     APIN:Akhir      =Alab:Stok_akhir
     APIN:RpAkhir    =Alab:SaldoAkhir
     access:apinoutbln.update()
  else
     APIN:Tahun      =glo:tahun
     APIN:Bulan      =glo:bulan
     APIN:Gudang     =GL_entryapotik
     APIN:Kode       =Alab:Kode
     APIN:Nama_Brg   =Alab:Nama_Brg
     APIN:Harga      =Alab:Harga
     APIN:Awal       =Alab:Stok_awal
     APIN:RpAwal     =Alab:SaldoAwal
     APIN:Masuk      =Alab:Stok_masuk
     APIN:RpMasuk    =Alab:Debet
     APIN:Keluar     =Alab:Stok_Keluar
     APIN:RpKeluar   =Alab:Kredit
     APIN:Akhir      =Alab:Stok_akhir
     APIN:RpAkhir    =Alab:SaldoAkhir
     access:apinoutbln.insert()
  end
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue

BrowseISO PROCEDURE                                        ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
vl_gudang            STRING(5)                             !
BRW1::View:Browse    VIEW(ApInOutBln)
                       PROJECT(APIN:Tahun)
                       PROJECT(APIN:Bulan)
                       PROJECT(APIN:Gudang)
                       PROJECT(APIN:Kode)
                       PROJECT(APIN:Nama_Brg)
                       PROJECT(APIN:Satuan)
                       PROJECT(APIN:Harga)
                       PROJECT(APIN:Awal)
                       PROJECT(APIN:RpAwal)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APIN:Tahun             LIKE(APIN:Tahun)               !List box control field - type derived from field
APIN:Bulan             LIKE(APIN:Bulan)               !List box control field - type derived from field
APIN:Gudang            LIKE(APIN:Gudang)              !List box control field - type derived from field
APIN:Kode              LIKE(APIN:Kode)                !List box control field - type derived from field
APIN:Nama_Brg          LIKE(APIN:Nama_Brg)            !List box control field - type derived from field
APIN:Satuan            LIKE(APIN:Satuan)              !List box control field - type derived from field
APIN:Harga             LIKE(APIN:Harga)               !List box control field - type derived from field
APIN:Awal              LIKE(APIN:Awal)                !List box control field - type derived from field
APIN:RpAwal            LIKE(APIN:RpAwal)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(GBarang)
                       PROJECT(GBAR:Kode_brg)
                       PROJECT(GBAR:Nama_Brg)
                       PROJECT(GBAR:Jenis_Brg)
                       PROJECT(GBAR:No_Satuan)
                       PROJECT(GBAR:Stok_Total)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Jenis_Brg         LIKE(GBAR:Jenis_Brg)           !List box control field - type derived from field
GBAR:No_Satuan         LIKE(GBAR:No_Satuan)           !List box control field - type derived from field
GBAR:Stok_Total        LIKE(GBAR:Stok_Total)          !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Narkoba'),AT(,,392,214),FONT('Arial',8,,),CENTER,IMM,HLP('BrowseISO'),SYSTEM,GRAY,MDI
                       SHEET,AT(3,4,385,116),USE(?Sheet1)
                         TAB('Kode'),USE(?Tab1)
                           PROMPT('Kode:'),AT(12,104),USE(?APIN:Kode:Prompt)
                           ENTRY(@s10),AT(62,104,60,10),USE(GBAR:Kode_brg),MSG('Kode Barang`'),TIP('Kode Barang`')
                         END
                         TAB('Nama'),USE(?Tab2)
                           PROMPT('Nama Obat:'),AT(11,104),USE(?APIN:Nama_Brg:Prompt)
                           ENTRY(@s40),AT(61,104,60,10),USE(GBAR:Nama_Brg),MSG('Nama Barang'),TIP('Nama Barang')
                         END
                       END
                       LIST,AT(9,21,374,78),USE(?List),IMM,MSG('Browsing Records'),FORMAT('40L|M~Kode Barang~@s10@160L|M~Nama Obat~@s40@20L|M~Jenis Brg~@s5@40L|M~Satuan~@s' &|
   '10@72D|M~Stok Total~L@n18.2@'),FROM(Queue:Browse)
                       LIST,AT(10,124,374,66),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('64R(2)|M~Tahun~C(0)@n-14@36R(2)|M~Bulan~C(0)@n-7@28L(2)|M~Gudang~@s5@44L(2)|M~Ko' &|
   'de~@s10@80L(2)|M~Nama Obat~@s40@44L(2)|M~Satuan~@s10@52D(22)|M~Harga~C(0)@n12.2@' &|
   '64R(2)|M~Awal~C(0)@n-14@64D(24)|M~Rp Awal~C(0)@n15.2@'),FROM(Queue:Browse:1)
                       BUTTON('Print &Laporan'),AT(87,196,77,14),USE(?Button6)
                       BUTTON('&Process'),AT(29,196,45,14),USE(?Button5)
                       BUTTON('&Tambah'),AT(167,196,45,14),USE(?Insert:2)
                       BUTTON('&Ubah'),AT(216,196,45,14),USE(?Change:2),DEFAULT
                       BUTTON('&hapus'),AT(265,196,45,14),USE(?Delete:2)
                       BUTTON('&Selesai'),AT(315,196,45,14),USE(?Close)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW5                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW5::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW5::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - choice(?Sheet1)=2
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
  GlobalErrors.SetProcedureName('BrowseISO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  WindowTahunBulan()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APIN:Kode:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo:tahun',glo:tahun)                              ! Added by: BrowseBox(ABC)
  BIND('glo:bulan',glo:bulan)                              ! Added by: BrowseBox(ABC)
  BIND('vl_gudang',vl_gudang)                              ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  vl_gudang=clip(Glo::kode_apotik)
  display
  Relate:ApInOutBln.Open                                   ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Relate:GBarang.Open                                      ! File GBarang used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:ApInOutBln,SELF) ! Initialize the browse manager
  BRW5.Init(?List,Queue:Browse.ViewPosition,BRW5::View:Browse,Queue:Browse,Relate:GBarang,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,APIN:Barang_Apinoutbln_fk)            ! Add the sort order for APIN:Barang_Apinoutbln_fk for sort order 1
  BRW1.AddRange(APIN:Kode,Relate:ApInOutBln,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,APIN:Kode,1,BRW1)              ! Initialize the browse locator using  using key: APIN:Barang_Apinoutbln_fk , APIN:Kode
  BRW1.SetFilter('(apin:tahun=glo:tahun and apin:bulan=glo:bulan and apin:gudang=vl_gudang)') ! Apply filter expression to browse
  BRW1.AddField(APIN:Tahun,BRW1.Q.APIN:Tahun)              ! Field APIN:Tahun is a hot field or requires assignment from browse
  BRW1.AddField(APIN:Bulan,BRW1.Q.APIN:Bulan)              ! Field APIN:Bulan is a hot field or requires assignment from browse
  BRW1.AddField(APIN:Gudang,BRW1.Q.APIN:Gudang)            ! Field APIN:Gudang is a hot field or requires assignment from browse
  BRW1.AddField(APIN:Kode,BRW1.Q.APIN:Kode)                ! Field APIN:Kode is a hot field or requires assignment from browse
  BRW1.AddField(APIN:Nama_Brg,BRW1.Q.APIN:Nama_Brg)        ! Field APIN:Nama_Brg is a hot field or requires assignment from browse
  BRW1.AddField(APIN:Satuan,BRW1.Q.APIN:Satuan)            ! Field APIN:Satuan is a hot field or requires assignment from browse
  BRW1.AddField(APIN:Harga,BRW1.Q.APIN:Harga)              ! Field APIN:Harga is a hot field or requires assignment from browse
  BRW1.AddField(APIN:Awal,BRW1.Q.APIN:Awal)                ! Field APIN:Awal is a hot field or requires assignment from browse
  BRW1.AddField(APIN:RpAwal,BRW1.Q.APIN:RpAwal)            ! Field APIN:RpAwal is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse
  BRW5.AddSortOrder(,GBAR:KeyNama)                         ! Add the sort order for GBAR:KeyNama for sort order 1
  BRW5.AddLocator(BRW5::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort1:Locator.Init(?GBAR:Nama_Brg,GBAR:Nama_Brg,,BRW5) ! Initialize the browse locator using ?GBAR:Nama_Brg using key: GBAR:KeyNama , GBAR:Nama_Brg
  BRW5.AddSortOrder(,GBAR:KeyKodeBrg)                      ! Add the sort order for GBAR:KeyKodeBrg for sort order 2
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW5::Sort0:Locator.Init(?GBAR:Kode_brg,GBAR:Kode_brg,,BRW5) ! Initialize the browse locator using ?GBAR:Kode_brg using key: GBAR:KeyKodeBrg , GBAR:Kode_brg
  BRW5.AddField(GBAR:Kode_brg,BRW5.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Nama_Brg,BRW5.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Jenis_Brg,BRW5.Q.GBAR:Jenis_Brg)      ! Field GBAR:Jenis_Brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:No_Satuan,BRW5.Q.GBAR:No_Satuan)      ! Field GBAR:No_Satuan is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Stok_Total,BRW5.Q.GBAR:Stok_Total)    ! Field GBAR:Stok_Total is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseISO',QuickWindow)                    ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
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
    Relate:ApInOutBln.Close
    Relate:GBarang.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseISO',QuickWindow)                 ! Save window data to non-volatile store
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
    UpdateApInOutBln
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
    OF ?Button6
      ThisWindow.Update
      START(PrintLaporanISO, 25000)
      ThisWindow.Reset
    OF ?Button5
      ThisWindow.Update
      START(ProsesIsiData, 25000)
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
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:2
    SELF.ChangeControl=?Change:2
    SELF.DeleteControl=?Delete:2
  END


BRW5.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW5.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF choice(?Sheet1)=2
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

WindowTahunBulan PROCEDURE                                 ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
Window               WINDOW('Tahun - Bulan'),AT(,,185,99),FONT('Arial',8,,FONT:regular),CENTER,GRAY
                       ENTRY(@n-7),AT(72,18,60,10),USE(glo:bulan),RIGHT(1)
                       ENTRY(@n-14),AT(72,33,60,10),USE(glo:tahun),RIGHT(1)
                       PROMPT('Kode apotik:'),AT(21,51),USE(?Glo::kode_apotik:Prompt)
                       ENTRY(@s5),AT(71,51,60,10),USE(Glo::kode_apotik),MSG('Kode apotik'),TIP('Kode apotik'),UPR
                       BUTTON('OK'),AT(43,78,103,14),USE(?OkButton),DEFAULT
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
  GlobalErrors.SetProcedureName('WindowTahunBulan')
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
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('WindowTahunBulan',Window)                  ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('WindowTahunBulan',Window)               ! Save window data to non-volatile store
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

UpdateApInOutBln PROCEDURE                                 ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
History::APIN:Record LIKE(APIN:RECORD),THREAD
QuickWindow          WINDOW('Update the ApInOutBln File'),AT(,,167,184),FONT('Arial',8,,),CENTER,IMM,HLP('UpdateApInOutBln'),SYSTEM,GRAY,MDI
                       PROMPT('Tahun:'),AT(11,8),USE(?APIN:Tahun:Prompt)
                       ENTRY(@n-14),AT(64,8,64,10),USE(APIN:Tahun),DISABLE,RIGHT(1)
                       PROMPT('Bulan:'),AT(11,22),USE(?APIN:Bulan:Prompt)
                       ENTRY(@n-7),AT(64,22,64,10),USE(APIN:Bulan),DISABLE,RIGHT(1)
                       PROMPT('Gudang:'),AT(11,36),USE(?APIN:Gudang:Prompt)
                       ENTRY(@s5),AT(64,36,64,10),USE(APIN:Gudang),DISABLE
                       PROMPT('Kode:'),AT(11,50),USE(?APIN:Kode:Prompt)
                       ENTRY(@s10),AT(64,50,64,10),USE(APIN:Kode),DISABLE,MSG('Kode Barang`'),TIP('Kode Barang`')
                       PROMPT('Harga:'),AT(11,64),USE(?APIN:Harga:Prompt)
                       ENTRY(@n12.2),AT(64,64,63,10),USE(APIN:Harga),DECIMAL(14)
                       PROMPT('Awal:'),AT(11,78),USE(?APIN:Awal:Prompt)
                       ENTRY(@n-14),AT(64,78,64,10),USE(APIN:Awal),RIGHT(1),MSG('Stok Awal'),TIP('Stok Awal')
                       PROMPT('Masuk:'),AT(11,92),USE(?APIN:Masuk:Prompt)
                       ENTRY(@n-14),AT(64,92,64,10),USE(APIN:Masuk),RIGHT(1)
                       PROMPT('Keluar:'),AT(11,107),USE(?APIN:Keluar:Prompt)
                       ENTRY(@n-14),AT(64,107,64,10),USE(APIN:Keluar),RIGHT(1)
                       PROMPT('Akhir:'),AT(11,122),USE(?APIN:Akhir:Prompt)
                       ENTRY(@n-14),AT(64,122,64,10),USE(APIN:Akhir),RIGHT(1)
                       OPTION('Laporan'),AT(39,134,112,27),USE(APIN:Satuan),BOXED
                         RADIO('Ya'),AT(58,146),USE(?APIN:Satuan:Radio1),VALUE('Ya')
                         RADIO('Tidak'),AT(95,146),USE(?APIN:Satuan:Radio2),VALUE('Tidak')
                       END
                       BUTTON('&OK'),AT(37,165,45,14),USE(?OK),DEFAULT
                       BUTTON('&Batal'),AT(87,165,45,14),USE(?Cancel)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
Run                    PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
    ActionMessage = 'Adding a ApInOutBln Record'
  OF ChangeRecord
    ActionMessage = 'Changing a ApInOutBln Record'
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateApInOutBln')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APIN:Tahun:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APIN:Record,History::APIN:Record)
  SELF.AddHistoryField(?APIN:Tahun,1)
  SELF.AddHistoryField(?APIN:Bulan,2)
  SELF.AddHistoryField(?APIN:Gudang,3)
  SELF.AddHistoryField(?APIN:Kode,4)
  SELF.AddHistoryField(?APIN:Harga,7)
  SELF.AddHistoryField(?APIN:Awal,8)
  SELF.AddHistoryField(?APIN:Masuk,10)
  SELF.AddHistoryField(?APIN:Keluar,12)
  SELF.AddHistoryField(?APIN:Akhir,14)
  SELF.AddHistoryField(?APIN:Satuan,6)
  SELF.AddUpdateFile(Access:ApInOutBln)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:ApInOutBln.Open                                   ! File ApInOutBln used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:ApInOutBln
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
  INIMgr.Fetch('UpdateApInOutBln',QuickWindow)             ! Restore window settings from non-volatile store
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
    Relate:ApInOutBln.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateApInOutBln',QuickWindow)          ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
    APIN:Tahun = glo:tahun
    APIN:Bulan = glo:bulan
    APIN:Gudang = GL_entryapotik
  PARENT.PrimeFields


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
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
    CASE FIELD()
    OF ?APIN:Akhir
      APIN:Akhir=APIN:Awal+APIN:Masuk-APIN:Keluar
      APIN:RpAkhir=APIN:RpAwal+APIN:Masuk-APIN:Keluar
      display
    END
  ReturnValue = PARENT.TakeSelected()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

