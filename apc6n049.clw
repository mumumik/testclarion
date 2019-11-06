

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N049.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N048.INC'),ONCE        !Req'd for module callout resolution
                     END


BrowseKartuStokApotik PROCEDURE                            ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
vl_total             REAL                                  !
loc:total_debet      REAL                                  !
loc:total_kredit     REAL                                  !
BRW1::View:Browse    VIEW(APKStok)
                       PROJECT(APK:Tanggal)
                       PROJECT(APK:Jam)
                       PROJECT(APK:NoTransaksi)
                       PROJECT(APK:Transaksi)
                       PROJECT(APK:Debet)
                       PROJECT(APK:Kredit)
                       PROJECT(APK:Kode_Apotik)
                       PROJECT(APK:Kode_Barang)
                       PROJECT(APK:Status)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APK:Tanggal            LIKE(APK:Tanggal)              !List box control field - type derived from field
APK:Jam                LIKE(APK:Jam)                  !List box control field - type derived from field
APK:NoTransaksi        LIKE(APK:NoTransaksi)          !List box control field - type derived from field
APK:Transaksi          LIKE(APK:Transaksi)            !List box control field - type derived from field
APK:Debet              LIKE(APK:Debet)                !List box control field - type derived from field
APK:Kredit             LIKE(APK:Kredit)               !List box control field - type derived from field
APK:Kode_Apotik        LIKE(APK:Kode_Apotik)          !List box control field - type derived from field
APK:Kode_Barang        LIKE(APK:Kode_Barang)          !List box control field - type derived from field
APK:Status             LIKE(APK:Status)               !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW4::View:Browse    VIEW(GBarang)
                       PROJECT(GBAR:Kode_brg)
                       PROJECT(GBAR:Nama_Brg)
                       PROJECT(GBAR:Jenis_Brg)
                       PROJECT(GBAR:No_Satuan)
                       PROJECT(GBAR:Status)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Jenis_Brg         LIKE(GBAR:Jenis_Brg)           !List box control field - type derived from field
GBAR:No_Satuan         LIKE(GBAR:No_Satuan)           !List box control field - type derived from field
GBAR:Status            LIKE(GBAR:Status)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('KARTU STOK APOTIK'),AT(,,358,256),FONT('Arial',8,,),CENTER,IMM,HLP('BrowseFifoApotik'),SYSTEM,GRAY,MDI
                       SHEET,AT(1,2,356,106),USE(?Sheet1)
                         TAB('Nama Barang (F2)'),USE(?Tab1),KEY(F2Key)
                           PROMPT('Nama Obat:'),AT(5,93),USE(?GBAR:Nama_Brg:Prompt)
                           ENTRY(@s40),AT(55,93,60,10),USE(GBAR:Nama_Brg),MSG('Nama Barang'),TIP('Nama Barang')
                         END
                         TAB('Kode Barang (F3)'),USE(?Tab2),KEY(F3Key)
                           PROMPT('Kode Barang:'),AT(5,93),USE(?GBAR:Kode_brg:Prompt)
                           ENTRY(@s10),AT(55,93,60,10),USE(GBAR:Kode_brg),MSG('Kode Barang'),TIP('Kode Barang')
                         END
                       END
                       LIST,AT(3,18,351,71),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('40L|M~Kode Barang~@s10@160L|M~Nama Obat~@s40@20L|M~Jenis Brg~@s5@40L|M~Satuan~@s' &|
   '10@12L|M~Status~@n3@'),FROM(Queue:Browse)
                       LIST,AT(3,110,351,94),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('51R(2)|M~Tanggal~C(0)@d06@41R(2)|M~Jam~C(0)@t04@64L(2)|M~No Transaksi~@s15@85L(2' &|
   ')|M~Transaksi~@s50@49R(2)|M~Debet~C(0)@n-15.2@51R(2)|M~Kredit~C(0)@n-15.2@48L(2)' &|
   '|M~Kode Apotik~@s5@48L(2)|M~Kode Barang~@s10@12L(2)|M~Status~@n3@'),FROM(Queue:Browse:1)
                       PROMPT('Total Debet:'),AT(229,210),USE(?loc:total_debet:Prompt)
                       ENTRY(@n-15.2),AT(281,210,60,10),USE(loc:total_debet),DECIMAL(14)
                       BUTTON('&Print Kartu Stok All'),AT(5,237,73,14),USE(?Button8:2)
                       BUTTON('&Selesai'),AT(5,207,73,14),USE(?Close)
                       BUTTON('&Insert'),AT(87,210,42,12),USE(?Insert),HIDE
                       BUTTON('&Change'),AT(129,210,42,12),USE(?Change),DISABLE,HIDE
                       BUTTON('&Delete'),AT(171,210,42,12),USE(?Delete),DISABLE,HIDE
                       BUTTON('&Print Kartu Stok'),AT(5,222,73,14),USE(?Button8)
                       PROMPT('Total Kredit:'),AT(229,224),USE(?loc:total_kredit:Prompt)
                       ENTRY(@n-15.2),AT(281,224,60,10),USE(loc:total_kredit),DECIMAL(14)
                       BUTTON('&Print Kartu Stok  Old'),AT(113,143,73,14),USE(?aha),DISABLE,HIDE
                       PROMPT('Total Kredit :'),AT(229,238),USE(?vl_total:Prompt)
                       ENTRY(@n-15.2),AT(281,238,60,10),USE(vl_total),DECIMAL(14)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Reset                  PROCEDURE(BYTE Force=0),DERIVED     ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Update                 PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetFromView          PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW4                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW4::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW4::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - choice(?Sheet1)=2
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
  GlobalErrors.SetProcedureName('BrowseKartuStokApotik')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GBAR:Nama_Brg:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('APK:Kode_Apotik',APK:Kode_Apotik)                  ! Added by: BrowseBox(ABC)
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  BIND('APK:Tanggal',APK:Tanggal)                          ! Added by: BrowseBox(ABC)
  BIND('APK:Jam',APK:Jam)                                  ! Added by: BrowseBox(ABC)
  BIND('APK:NoTransaksi',APK:NoTransaksi)                  ! Added by: BrowseBox(ABC)
  BIND('APK:Transaksi',APK:Transaksi)                      ! Added by: BrowseBox(ABC)
  BIND('APK:Debet',APK:Debet)                              ! Added by: BrowseBox(ABC)
  BIND('APK:Kredit',APK:Kredit)                            ! Added by: BrowseBox(ABC)
  BIND('APK:Kode_Barang',APK:Kode_Barang)                  ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:APDTRANS.SetOpenRelated()
  Relate:APDTRANS.Open                                     ! File ApHProd used by this procedure, so make sure it's RelationManager is open
  Relate:ApStokop.Open                                     ! File ApHProd used by this procedure, so make sure it's RelationManager is open
  Access:GBarang.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APtoAPde.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:AptoApHe.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:AptoInDe.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:AptoInHe.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GHBSBBK.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GHSBBK.UseFile                                    ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GDBSBBK.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GDSBBK.UseFile                                    ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GHBPB.UseFile                                     ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ApDDProd.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ApDProd.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ApHProd.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:APKStok,SELF) ! Initialize the browse manager
  BRW4.Init(?List,Queue:Browse.ViewPosition,BRW4::View:Browse,Queue:Browse,Relate:GBarang,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,APK:BrgTanggalJamFKApKStok)           ! Add the sort order for APK:BrgTanggalJamFKApKStok for sort order 1
  BRW1.AddRange(APK:Kode_Barang,Relate:APKStok,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,APK:Tanggal,1,BRW1)            ! Initialize the browse locator using  using key: APK:BrgTanggalJamFKApKStok , APK:Tanggal
  BRW1.SetFilter('(APK:Kode_Apotik=GL_entryapotik and apk:status=0)') ! Apply filter expression to browse
  BRW1.AddField(APK:Tanggal,BRW1.Q.APK:Tanggal)            ! Field APK:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(APK:Jam,BRW1.Q.APK:Jam)                    ! Field APK:Jam is a hot field or requires assignment from browse
  BRW1.AddField(APK:NoTransaksi,BRW1.Q.APK:NoTransaksi)    ! Field APK:NoTransaksi is a hot field or requires assignment from browse
  BRW1.AddField(APK:Transaksi,BRW1.Q.APK:Transaksi)        ! Field APK:Transaksi is a hot field or requires assignment from browse
  BRW1.AddField(APK:Debet,BRW1.Q.APK:Debet)                ! Field APK:Debet is a hot field or requires assignment from browse
  BRW1.AddField(APK:Kredit,BRW1.Q.APK:Kredit)              ! Field APK:Kredit is a hot field or requires assignment from browse
  BRW1.AddField(APK:Kode_Apotik,BRW1.Q.APK:Kode_Apotik)    ! Field APK:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(APK:Kode_Barang,BRW1.Q.APK:Kode_Barang)    ! Field APK:Kode_Barang is a hot field or requires assignment from browse
  BRW1.AddField(APK:Status,BRW1.Q.APK:Status)              ! Field APK:Status is a hot field or requires assignment from browse
  BRW4.Q &= Queue:Browse
  BRW4.AddSortOrder(,GBAR:KeyKodeBrg)                      ! Add the sort order for GBAR:KeyKodeBrg for sort order 1
  BRW4.AddLocator(BRW4::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW4::Sort1:Locator.Init(?GBAR:Kode_brg,GBAR:Kode_brg,,BRW4) ! Initialize the browse locator using ?GBAR:Kode_brg using key: GBAR:KeyKodeBrg , GBAR:Kode_brg
  BRW4.SetFilter('(gbar:status=1)')                        ! Apply filter expression to browse
  BRW4.AddSortOrder(,GBAR:KeyNama)                         ! Add the sort order for GBAR:KeyNama for sort order 2
  BRW4.AddLocator(BRW4::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW4::Sort0:Locator.Init(?GBAR:Nama_Brg,GBAR:Nama_Brg,,BRW4) ! Initialize the browse locator using ?GBAR:Nama_Brg using key: GBAR:KeyNama , GBAR:Nama_Brg
  BRW4.SetFilter('(gbar:status=1)')                        ! Apply filter expression to browse
  BRW4.AddField(GBAR:Kode_brg,BRW4.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Nama_Brg,BRW4.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Jenis_Brg,BRW4.Q.GBAR:Jenis_Brg)      ! Field GBAR:Jenis_Brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:No_Satuan,BRW4.Q.GBAR:No_Satuan)      ! Field GBAR:No_Satuan is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Status,BRW4.Q.GBAR:Status)            ! Field GBAR:Status is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseKartuStokApotik',QuickWindow)        ! Restore window settings from non-volatile store
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
    Relate:APDTRANS.Close
    Relate:ApStokop.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseKartuStokApotik',QuickWindow)     ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  vl_total = loc:total_debet - loc:total_kredit
  PARENT.Reset(Force)


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
      if glo:level>0 then
         cycle
      end
    OF ?Change
      if glo:level>0 then
         cycle
      end
    OF ?Delete
      if glo:level>0 then
         cycle
      end
    OF ?Button8
      start(printkartustok,25000,GBAR:Kode_brg)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button8:2
      ThisWindow.Update
      start(printkartustokAll,25000,GBAR:Kode_brg)
    OF ?aha
      ThisWindow.Update
      start(printkartustokold,25000,GBAR:Kode_brg)
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
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:OpenWindow
      if glo:level=0 then
         unhide(?insert)
         unhide(?change)
         unhide(?delete)
         if upper(clip(vg_user))='ADI' then
            enable(?insert)
            enable(?change)
            enable(?delete)
         end
      end
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  vl_total = loc:total_debet - loc:total_kredit


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
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW1.ResetFromView PROCEDURE

loc:total_kredit:Sum REAL                                  ! Sum variable for browse totals
loc:total_debet:Sum  REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:APKStok.SetQuickScan(1)
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
    loc:total_kredit:Sum += APK:Kredit
    loc:total_debet:Sum += APK:Debet
  END
  loc:total_kredit = loc:total_kredit:Sum
  loc:total_debet = loc:total_debet:Sum
  PARENT.ResetFromView
  Relate:APKStok.SetQuickScan(0)
  SETCURSOR()


BRW4.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW4.ResetSort PROCEDURE(BYTE Force)

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

WindowTanggal PROCEDURE                                    ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
Window               WINDOW('Tanggal'),AT(,,185,92),FONT('MS Sans Serif',8,COLOR:Black,FONT:regular),CENTER,GRAY,DOUBLE
                       PANEL,AT(3,5,172,62),USE(?Panel1)
                       PROMPT('Dari Tanggal '),AT(25,17),USE(?VG_TANGGAL1:Prompt)
                       ENTRY(@D6-),AT(82,17,60,10),USE(VG_TANGGAL1)
                       PROMPT('Sampai Tanggal'),AT(25,37),USE(?VG_TANGGAL2:Prompt)
                       ENTRY(@d6-),AT(82,37,60,10),USE(VG_TANGGAL2)
                       BUTTON('OK'),AT(32,71,120,14),USE(?OkButton),DEFAULT
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
  GlobalErrors.SetProcedureName('WindowTanggal')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Panel1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('WindowTanggal',Window)                     ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('WindowTanggal',Window)                  ! Save window data to non-volatile store
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

PrintKartuStokAll PROCEDURE (string vl_barang)             ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
vl_no                LONG                                  !
FilesOpened          BYTE                                  !
loc::datel           DATE                                  !
loc::time            TIME                                  !
loc::total           LONG                                  !
loc::nama_apotik     STRING(30)                            !Nama Apotik
APA                  STRING(20)                            !
vl_harga_raja        REAL                                  !
vl_harga_ranap_3     REAL                                  !
vl_harga_ranap_12vip REAL                                  !
vl_saldo_akhir       REAL                                  !
vl_debet             REAL                                  !
vl_kredit            REAL                                  !
vl_ket               STRING(50)                            !
vl_debet1            REAL                                  !
vl_kredit1           REAL                                  !
vl_ket1              STRING(10)                            !
Process:View         VIEW(APKStok)
                       PROJECT(APK:Debet)
                       PROJECT(APK:Jam)
                       PROJECT(APK:Kredit)
                       PROJECT(APK:NoTransaksi)
                       PROJECT(APK:Status)
                       PROJECT(APK:Tanggal)
                       PROJECT(APK:Kode_Barang)
                       JOIN(GBAR:KeyKodeBrg,APK:Kode_Barang)
                         PROJECT(GBAR:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:No_Satuan)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(115,1760,7896,9042),PAPER(PAPER:A4),PRE(RPT),FONT('Arial',10,COLOR:Black,),THOUS
                       HEADER,AT(104,281,7896,1469)
                         STRING('KARTU STOK'),AT(42,21,979,219),LEFT,FONT(,,,FONT:bold)
                         STRING('Apotik'),AT(42,208,688,167),USE(?String14),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(':'),AT(896,208,135,167),USE(?String14:2),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(@s5),AT(1063,208,427,167),USE(GL_entryapotik)
                         BOX,AT(10,1125,7875,344),COLOR(COLOR:Black)
                         STRING('Nomor'),AT(1427,1219,521,167),USE(?String10:5),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('No.'),AT(83,1219,260,167),USE(?String10:2),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Jam'),AT(958,1219,490,167),USE(?String10:4),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Tanggal'),AT(333,1219,521,167),USE(?String10:3),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Keterangan'),AT(2385,1219,896,167),USE(?String10:6),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Kredit'),AT(6698,1219,438,167),USE(?String10:8),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Asal'),AT(5240,1219,448,167),USE(?String10:10),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Debet'),AT(5969,1219,438,167),USE(?String10:7),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Saldo'),AT(7427,1229,438,167),USE(?String10:9),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Kode Barang'),AT(42,406,844,167),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(':'),AT(896,406,135,167),USE(?String14:3),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(@s10),AT(1063,406,833,167),USE(GBAR:Kode_brg),FONT('Arial',10,,FONT:regular)
                         STRING('Nama Barang'),AT(42,615,896,167),USE(?String10),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(':'),AT(896,615,135,167),USE(?String14:4),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(@s40),AT(1052,615,2552,167),USE(GBAR:Nama_Brg),FONT('Arial',10,,FONT:regular)
                         STRING('Satuan'),AT(42,813),USE(?String19),TRN
                         STRING(':'),AT(896,813,135,167),USE(?String14:5),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(@s10),AT(1052,813,958,146),USE(GBAR:No_Satuan)
                       END
break1                 BREAK(APA)
detail1                  DETAIL,AT(,,,208),FONT('Arial',8,,FONT:regular)
                           STRING(@s10),AT(5229,21,521,146),USE(vl_ket1),TRN
                           STRING(@n-15.3),AT(5688,21,708,146),USE(vl_debet1),TRN,RIGHT
                           STRING(@n5),AT(-31,21,333,146),CNT,RESET(break1),USE(vl_no),RIGHT(1),FONT('Arial',8,,FONT:regular)
                           STRING(@d06),AT(323,21,615,146),USE(APK:Tanggal)
                           STRING(@t04),AT(958,21,490,146),USE(APK:Jam)
                           STRING(@s15),AT(1417,21,927,146),USE(APK:NoTransaksi)
                           STRING(@n-15.3),AT(6438,21,708,146),USE(vl_kredit1),TRN,RIGHT
                           STRING(@n-15.3),AT(7094,21,708,146),USE(vl_saldo_akhir,,?vl_saldo_akhir:2),TRN,RIGHT(14)
                           STRING(@s50),AT(2375,21,2823,146),USE(vl_ket)
                           LINE,AT(10,198,7875,0),COLOR(COLOR:Black)
                         END
                         FOOTER,AT(0,0,,271)
                           STRING('Total :'),AT(4052,10),USE(?String28),TRN
                           STRING(@n-15.3),AT(5688,31,708,146),SUM,RESET(break1),USE(vl_debet1,,?vl_debet1:2),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                           STRING(@n-15.3),AT(6438,31,708,146),SUM,RESET(break1),USE(vl_kredit1,,?vl_kredit1:2),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                           STRING(@n-15.3),AT(7094,31,708,146),USE(vl_saldo_akhir,,?vl_saldo_akhir:3),TRN,RIGHT(14),FONT('Arial',8,,FONT:regular)
                           LINE,AT(4031,219,3854,0),USE(?Line2),COLOR(COLOR:Black)
                         END
                       END
                       FOOTER,AT(302,10813,7417,219)
                         STRING('Page xxxxx of xxxxx'),AT(5938,10,1302,208),USE(?PageOfString),FONT('Times New Roman',8,,)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Reset                  PROCEDURE(BYTE Force=0),DERIVED     ! Method added to host embed code
Update                 PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Previewer            PrintPreviewClass                     ! Print Previewer

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
  GlobalErrors.SetProcedureName('PrintKartuStokAll')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: Report
  BIND('VG_TANGGAL1',VG_TANGGAL1)                          ! Added by: Report
  BIND('VG_TANGGAL2',VG_TANGGAL2)                          ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  WindowTanggal()
  bind('vl_barang',vl_barang)
  Relate:APHTRANS.SetOpenRelated()
  Relate:APHTRANS.Open                                     ! File APHTRANS used by this procedure, so make sure it's RelationManager is open
  Access:GApotik.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintKartuStokAll',ProgressWindow)         ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisReport.Init(Process:View, Relate:APKStok, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  ThisReport.AppendOrder('apk:tanggal,APK:Jam')
  ThisReport.SetFilter('apk:Kode_barang=vl_barang and apk:kode_Apotik=GL_entryapotik and apk:tanggal>=VG_TANGGAL1 and apk:tanggal<<=VG_TANGGAL2')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  Relate:APKStok.SetQuickScan(1,Propagate:OneMany)
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom=True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APHTRANS.Close
  END
  IF SELF.Opened
    INIMgr.Update('PrintKartuStokAll',ProgressWindow)      ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = APK:Kode_Barang                          ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  GBAR:Kode_brg = APK:Kode_Barang                          ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  if sub(APK:NoTransaksi,1,3)='API' then
     APH:N0_tran=APK:NoTransaksi
     access:aphtrans.fetch(APH:by_transaksi)
     JPas:Nomor_mr=APH:Nomor_mr
     access:jpasien.fetch(JPas:KeyNomorMr)
     vl_ket=clip(APK:Transaksi)&' '&clip(JPas:Nama)
     vl_ket1=clip(APH:Asal)
  else
     vl_ket=clip(APK:Transaksi)
     vl_ket1=''
  end
  
  if sub(APK:NoTransaksi,1,3)='OPN' then
     if vl_saldo_akhir>APK:Debet then
        vl_debet1=0
        vl_kredit1=vl_saldo_akhir-APK:Debet
     else
        vl_debet1=APK:Debet-vl_saldo_akhir
        vl_kredit1=0
     end
     vl_debet+=vl_Debet1
     vl_kredit+=vl_Kredit1
     vl_saldo_akhir=vl_debet-vl_kredit
  else
     vl_debet1=APK:Debet
     vl_kredit1=APK:Kredit
     vl_debet+=APK:Debet
     vl_kredit+=APK:Kredit
     vl_saldo_akhir=vl_debet-vl_kredit
  end
  display
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail1)
  RETURN ReturnValue

printkartustokold PROCEDURE (string vl_barang)             ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
vl_no                LONG                                  !
FilesOpened          BYTE                                  !
loc::datel           DATE                                  !
loc::time            TIME                                  !
loc::total           LONG                                  !
loc::nama_apotik     STRING(30)                            !Nama Apotik
APA                  STRING(20)                            !
vl_harga_raja        REAL                                  !
vl_harga_ranap_3     REAL                                  !
vl_harga_ranap_12vip REAL                                  !
vl_saldo_akhir       REAL                                  !
vl_debet             REAL                                  !
vl_kredit            REAL                                  !
Process:View         VIEW(APKStok)
                       PROJECT(APK:Debet)
                       PROJECT(APK:Jam)
                       PROJECT(APK:Kredit)
                       PROJECT(APK:NoTransaksi)
                       PROJECT(APK:Status)
                       PROJECT(APK:Tanggal)
                       PROJECT(APK:Transaksi)
                       PROJECT(APK:Kode_Barang)
                       JOIN(GBAR:KeyKodeBrg,APK:Kode_Barang)
                         PROJECT(GBAR:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:No_Satuan)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(302,1750,7427,9052),PAPER(PAPER:A4),PRE(RPT),FONT('Arial',10,COLOR:Black,),THOUS
                       HEADER,AT(302,281,7427,1469)
                         STRING('KARTU STOK'),AT(42,21,979,219),LEFT,FONT(,,,FONT:bold)
                         STRING('Apotik'),AT(42,208,688,167),USE(?String14),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(':'),AT(896,208,135,167),USE(?String14:2),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(@s5),AT(1063,208,427,167),USE(GL_entryapotik)
                         BOX,AT(10,1115,7406,354),COLOR(COLOR:Black)
                         STRING('Nomor'),AT(1667,1219,521,167),USE(?String10:5),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('No.'),AT(83,1219,260,167),USE(?String10:2),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Jam'),AT(1094,1219,490,167),USE(?String10:4),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Tanggal'),AT(458,1219,521,167),USE(?String10:3),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Keterangan'),AT(2688,1219,896,167),USE(?String10:6),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Kredit'),AT(6635,1219,438,167),USE(?String10:8),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Debet'),AT(5740,1219,438,167),USE(?String10:7),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Kode Barang'),AT(42,406,844,167),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(':'),AT(896,406,135,167),USE(?String14:3),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(@s10),AT(1063,406,833,167),USE(GBAR:Kode_brg),FONT('Arial',10,,FONT:regular)
                         STRING('Nama Barang'),AT(42,615,896,167),USE(?String10),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(':'),AT(896,615,135,167),USE(?String14:4),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(@s40),AT(1052,615,2552,167),USE(GBAR:Nama_Brg),FONT('Arial',10,,FONT:regular)
                         STRING('Satuan'),AT(42,813),USE(?String19),TRN
                         STRING(':'),AT(896,813,135,167),USE(?String14:5),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(@s10),AT(1052,813,958,146),USE(GBAR:No_Satuan)
                       END
break1                 BREAK(APA)
detail1                  DETAIL,AT(,,,208),FONT('Arial',8,,FONT:regular)
                           STRING(@n-15.3),AT(5417,21,875,146),USE(APK:Debet)
                           STRING(@n5),AT(0,21,333,146),CNT,RESET(break1),USE(vl_no),RIGHT(1),FONT('Arial',8,,FONT:regular)
                           STRING(@d06),AT(448,21,615,146),USE(APK:Tanggal)
                           STRING(@t04),AT(1094,21,490,146),USE(APK:Jam)
                           STRING(@s15),AT(1667,21,990,146),USE(APK:NoTransaksi)
                           STRING(@n-15.3),AT(6365,21,875,146),USE(APK:Kredit)
                           STRING(@s50),AT(2688,21,2427,146),USE(APK:Transaksi)
                           LINE,AT(10,198,7406,0),COLOR(COLOR:Black)
                         END
                         FOOTER,AT(0,0)
                           STRING('Total :'),AT(4740,10),USE(?String28),TRN
                           STRING(@n-15.3),AT(5417,31,875,146),SUM,RESET(break1),USE(APK:Debet,,?APK:Debet:2),TRN,FONT('Arial',8,,FONT:regular)
                           STRING(@n-15.3),AT(6344,31,875,146),SUM,RESET(break1),USE(APK:Kredit,,?APK:Kredit:2),TRN,FONT('Arial',8,,FONT:regular)
                           LINE,AT(4740,219,2552,0),USE(?Line2),COLOR(COLOR:Black)
                           STRING('Saldo :'),AT(4740,292),USE(?String28:2),TRN
                           STRING(@n-15.3),AT(5417,313,875,188),USE(vl_saldo_akhir),FONT('Arial',8,,FONT:regular)
                         END
                       END
                       FOOTER,AT(302,10813,7417,219)
                         STRING('Page xxxxx of xxxxx'),AT(5938,10,1302,208),USE(?PageOfString),FONT('Times New Roman',8,,)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Reset                  PROCEDURE(BYTE Force=0),DERIVED     ! Method added to host embed code
Update                 PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Previewer            PrintPreviewClass                     ! Print Previewer

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
  GlobalErrors.SetProcedureName('printkartustokold')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  bind('vl_barang',vl_barang)
  Relate:APKStok.Open                                      ! File GApotik used by this procedure, so make sure it's RelationManager is open
  Access:GApotik.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('printkartustokold',ProgressWindow)         ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisReport.Init(Process:View, Relate:APKStok, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  ThisReport.AppendOrder('apk:tanggal,APK:Jam')
  ThisReport.SetFilter('apk:Kode_barang=vl_barang and apk:kode_Apotik=GL_entryapotik and apk:status=1')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  Relate:APKStok.SetQuickScan(1,Propagate:OneMany)
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom=True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APKStok.Close
  END
  IF SELF.Opened
    INIMgr.Update('printkartustokold',ProgressWindow)      ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = APK:Kode_Barang                          ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  GBAR:Kode_brg = APK:Kode_Barang                          ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  vl_debet+=APK:Debet
  vl_kredit+=APK:Kredit
  vl_saldo_akhir=vl_debet-vl_kredit
  display
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail1)
  RETURN ReturnValue

UpdateKArtuStok PROCEDURE                                  ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
History::APK:Record  LIKE(APK:RECORD),THREAD
QuickWindow          WINDOW('Update the APKStok File'),AT(,,276,182),FONT('Arial',8,,),IMM,HLP('UpdateKArtuStok'),SYSTEM,GRAY,MDI
                       SHEET,AT(4,4,268,156),USE(?CurrentTab)
                         TAB('General'),USE(?Tab:1)
                           PROMPT('Kode Barang:'),AT(8,20),USE(?APK:Kode_Barang:Prompt)
                           ENTRY(@s10),AT(64,20,44,10),USE(APK:Kode_Barang),REQ
                           PROMPT('Tanggal:'),AT(8,34),USE(?APK:Tanggal:Prompt)
                           ENTRY(@d17),AT(64,34,104,10),USE(APK:Tanggal),REQ
                           PROMPT('Jam:'),AT(8,48),USE(?APK:Jam:Prompt)
                           ENTRY(@t7),AT(64,48,104,10),USE(APK:Jam)
                           PROMPT('Transaksi:'),AT(8,62),USE(?APK:Transaksi:Prompt)
                           ENTRY(@s50),AT(64,62,204,10),USE(APK:Transaksi),REQ
                           PROMPT('No Transaksi:'),AT(8,76),USE(?APK:NoTransaksi:Prompt)
                           ENTRY(@s15),AT(64,76,64,10),USE(APK:NoTransaksi),REQ
                           PROMPT('Debet:'),AT(8,90),USE(?APK:Debet:Prompt)
                           ENTRY(@n10.2),AT(64,90,44,10),USE(APK:Debet)
                           PROMPT('Kredit:'),AT(8,104),USE(?APK:Kredit:Prompt)
                           ENTRY(@n10.2),AT(64,104,44,10),USE(APK:Kredit)
                           PROMPT('Opname:'),AT(8,118),USE(?APK:Opname:Prompt)
                           ENTRY(@n10.2),AT(64,118,44,10),USE(APK:Opname)
                           PROMPT('Kode Apotik:'),AT(8,132),USE(?APK:Kode_Apotik:Prompt)
                           ENTRY(@s5),AT(64,132,40,10),USE(APK:Kode_Apotik),REQ
                           PROMPT('Status:'),AT(8,146),USE(?APK:Status:Prompt)
                           ENTRY(@n3),AT(64,146,40,10),USE(APK:Status)
                         END
                       END
                       BUTTON('OK'),AT(129,164,45,14),USE(?OK),DEFAULT
                       BUTTON('Cancel'),AT(178,164,45,14),USE(?Cancel)
                       BUTTON('Help'),AT(227,164,45,14),USE(?Help),STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
    ActionMessage = 'Record Will Be Added'
  OF ChangeRecord
    ActionMessage = 'Record Will Be Changed'
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateKArtuStok')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APK:Kode_Barang:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APK:Record,History::APK:Record)
  SELF.AddHistoryField(?APK:Kode_Barang,1)
  SELF.AddHistoryField(?APK:Tanggal,2)
  SELF.AddHistoryField(?APK:Jam,3)
  SELF.AddHistoryField(?APK:Transaksi,4)
  SELF.AddHistoryField(?APK:NoTransaksi,5)
  SELF.AddHistoryField(?APK:Debet,6)
  SELF.AddHistoryField(?APK:Kredit,7)
  SELF.AddHistoryField(?APK:Opname,8)
  SELF.AddHistoryField(?APK:Kode_Apotik,9)
  SELF.AddHistoryField(?APK:Status,10)
  SELF.AddUpdateFile(Access:APKStok)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:APKStok.Open                                      ! File APKStok used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:APKStok
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
  INIMgr.Fetch('UpdateKArtuStok',QuickWindow)              ! Restore window settings from non-volatile store
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
    Relate:APKStok.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateKArtuStok',QuickWindow)           ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

