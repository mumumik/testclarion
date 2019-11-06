

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N050.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N048.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N049.INC'),ONCE        !Req'd for module callout resolution
                     END


BrowseKartuStokApotikAll PROCEDURE                         ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
vl_total             REAL                                  !
loc:total_debet      REAL                                  !
loc:total_kredit     REAL                                  !
BRW1::View:Browse    VIEW(APKStok)
                       PROJECT(APK:Kode_Barang)
                       PROJECT(APK:Tanggal)
                       PROJECT(APK:Jam)
                       PROJECT(APK:Transaksi)
                       PROJECT(APK:NoTransaksi)
                       PROJECT(APK:Debet)
                       PROJECT(APK:Kredit)
                       PROJECT(APK:Opname)
                       PROJECT(APK:Kode_Apotik)
                       PROJECT(APK:Status)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APK:Kode_Barang        LIKE(APK:Kode_Barang)          !List box control field - type derived from field
APK:Tanggal            LIKE(APK:Tanggal)              !List box control field - type derived from field
APK:Jam                LIKE(APK:Jam)                  !List box control field - type derived from field
APK:Transaksi          LIKE(APK:Transaksi)            !List box control field - type derived from field
APK:NoTransaksi        LIKE(APK:NoTransaksi)          !List box control field - type derived from field
APK:Debet              LIKE(APK:Debet)                !List box control field - type derived from field
APK:Kredit             LIKE(APK:Kredit)               !List box control field - type derived from field
APK:Opname             LIKE(APK:Opname)               !List box control field - type derived from field
APK:Kode_Apotik        LIKE(APK:Kode_Apotik)          !List box control field - type derived from field
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
BRW6::View:Browse    VIEW(GStokAptk)
                       PROJECT(GSTO:Saldo)
                       PROJECT(GSTO:Harga_Dasar)
                       PROJECT(GSTO:Kode_Barang)
                       PROJECT(GSTO:Kode_Apotik)
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?List:2
GSTO:Saldo             LIKE(GSTO:Saldo)               !List box control field - type derived from field
GSTO:Harga_Dasar       LIKE(GSTO:Harga_Dasar)         !List box control field - type derived from field
GSTO:Kode_Barang       LIKE(GSTO:Kode_Barang)         !List box control field - type derived from field
GSTO:Kode_Apotik       LIKE(GSTO:Kode_Apotik)         !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('KARTU STOK APOTIK'),AT(,,358,253),FONT('Arial',8,,),CENTER,IMM,HLP('BrowseFifoApotik'),SYSTEM,GRAY,MDI
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
                       LIST,AT(3,110,351,94),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('48L(2)|M~Kode Barang~@s10@51R(2)|M~Tanggal~C(0)@d06@41R(2)|M~Jam~C(0)@t04@85L(2)' &|
   '|M~Transaksi~@s50@64L(2)|M~No Transaksi~@s15@49R(2)|M~Debet~C(0)@n-15.2@51R(2)|M' &|
   '~Kredit~C(0)@n-15.2@40L(2)|M~Opname~@n10.2@48L(2)|M~Kode Apotik~@s5@12L(2)|M~Sta' &|
   'tus~@n3@'),FROM(Queue:Browse:1)
                       BUTTON('&Insert'),AT(64,206,42,12),USE(?Insert)
                       BUTTON('&Change'),AT(106,206,42,12),USE(?Change)
                       BUTTON('&Delete'),AT(148,206,42,12),USE(?Delete)
                       PROMPT('Total Debet:'),AT(229,210),USE(?loc:total_debet:Prompt)
                       ENTRY(@n-15.2),AT(281,210,60,10),USE(loc:total_debet),DECIMAL(14)
                       LIST,AT(139,220,65,30),USE(?List:2),IMM,FONT('Arial',9,COLOR:Navy,FONT:bold),MSG('Browsing Records'),FORMAT('64R|M~Saldo~L@n-16.2@44D|M~Harga Dasar~L@n11.2@40L|M~Kode Barang~@s10@20L|M~Kode' &|
   ' Apotik~@s5@'),FROM(Queue:Browse:2)
                       BUTTON('&Selesai'),AT(5,221,42,14),USE(?Close)
                       BUTTON('&Print Kartu Stok'),AT(51,221,73,14),USE(?Button8)
                       PROMPT('Total Kredit:'),AT(229,224),USE(?loc:total_kredit:Prompt)
                       ENTRY(@n-15.2),AT(281,224,60,10),USE(loc:total_kredit),DECIMAL(14)
                       BUTTON('&Print Kartu Stok  Old'),AT(52,237,73,14),USE(?aha)
                       PROMPT('Total Kredit :'),AT(229,238),USE(?vl_total:Prompt)
                       ENTRY(@n-15.2),AT(281,238,60,10),USE(vl_total),DECIMAL(14)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Reset                  PROCEDURE(BYTE Force=0),DERIVED     ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
BRW6                 CLASS(BrowseClass)                    ! Browse using ?List:2
Q                      &Queue:Browse:2                !Reference to browse queue
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowseKartuStokApotikAll')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GBAR:Nama_Brg:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('APK:Kode_Apotik',APK:Kode_Apotik)                  ! Added by: BrowseBox(ABC)
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  BIND('APK:Kode_Barang',APK:Kode_Barang)                  ! Added by: BrowseBox(ABC)
  BIND('APK:Tanggal',APK:Tanggal)                          ! Added by: BrowseBox(ABC)
  BIND('APK:Jam',APK:Jam)                                  ! Added by: BrowseBox(ABC)
  BIND('APK:Transaksi',APK:Transaksi)                      ! Added by: BrowseBox(ABC)
  BIND('APK:NoTransaksi',APK:NoTransaksi)                  ! Added by: BrowseBox(ABC)
  BIND('APK:Debet',APK:Debet)                              ! Added by: BrowseBox(ABC)
  BIND('APK:Kredit',APK:Kredit)                            ! Added by: BrowseBox(ABC)
  BIND('APK:Opname',APK:Opname)                            ! Added by: BrowseBox(ABC)
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
  BRW6.Init(?List:2,Queue:Browse:2.ViewPosition,BRW6::View:Browse,Queue:Browse:2,Relate:GStokAptk,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  ?List:2{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,APK:BrgTanggalJamFKApKStok)           ! Add the sort order for APK:BrgTanggalJamFKApKStok for sort order 1
  BRW1.AddRange(APK:Kode_Barang,Relate:APKStok,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,APK:Tanggal,1,BRW1)            ! Initialize the browse locator using  using key: APK:BrgTanggalJamFKApKStok , APK:Tanggal
  BRW1.SetFilter('(APK:Kode_Apotik=GL_entryapotik)')       ! Apply filter expression to browse
  BRW1.AddField(APK:Kode_Barang,BRW1.Q.APK:Kode_Barang)    ! Field APK:Kode_Barang is a hot field or requires assignment from browse
  BRW1.AddField(APK:Tanggal,BRW1.Q.APK:Tanggal)            ! Field APK:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(APK:Jam,BRW1.Q.APK:Jam)                    ! Field APK:Jam is a hot field or requires assignment from browse
  BRW1.AddField(APK:Transaksi,BRW1.Q.APK:Transaksi)        ! Field APK:Transaksi is a hot field or requires assignment from browse
  BRW1.AddField(APK:NoTransaksi,BRW1.Q.APK:NoTransaksi)    ! Field APK:NoTransaksi is a hot field or requires assignment from browse
  BRW1.AddField(APK:Debet,BRW1.Q.APK:Debet)                ! Field APK:Debet is a hot field or requires assignment from browse
  BRW1.AddField(APK:Kredit,BRW1.Q.APK:Kredit)              ! Field APK:Kredit is a hot field or requires assignment from browse
  BRW1.AddField(APK:Opname,BRW1.Q.APK:Opname)              ! Field APK:Opname is a hot field or requires assignment from browse
  BRW1.AddField(APK:Kode_Apotik,BRW1.Q.APK:Kode_Apotik)    ! Field APK:Kode_Apotik is a hot field or requires assignment from browse
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
  BRW6.Q &= Queue:Browse:2
  BRW6.AddSortOrder(,GSTO:KeyBarang)                       ! Add the sort order for GSTO:KeyBarang for sort order 1
  BRW6.AddRange(GSTO:Kode_Barang,Relate:GStokAptk,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW6.AddLocator(BRW6::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW6::Sort0:Locator.Init(,GSTO:Kode_Apotik,,BRW6)        ! Initialize the browse locator using  using key: GSTO:KeyBarang , GSTO:Kode_Apotik
  BRW6.SetFilter('(gsto:kode_apotik=GL_entryapotik)')      ! Apply filter expression to browse
  BRW6.AddField(GSTO:Saldo,BRW6.Q.GSTO:Saldo)              ! Field GSTO:Saldo is a hot field or requires assignment from browse
  BRW6.AddField(GSTO:Harga_Dasar,BRW6.Q.GSTO:Harga_Dasar)  ! Field GSTO:Harga_Dasar is a hot field or requires assignment from browse
  BRW6.AddField(GSTO:Kode_Barang,BRW6.Q.GSTO:Kode_Barang)  ! Field GSTO:Kode_Barang is a hot field or requires assignment from browse
  BRW6.AddField(GSTO:Kode_Apotik,BRW6.Q.GSTO:Kode_Apotik)  ! Field GSTO:Kode_Apotik is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseKartuStokApotikAll',QuickWindow)     ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW4.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW6.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
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
    INIMgr.Update('BrowseKartuStokApotikAll',QuickWindow)  ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  vl_total = loc:total_debet - loc:total_kredit
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdateKArtuStok
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
    OF ?Button8
      start(printkartustok,25000,GBAR:Kode_brg)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?aha
      ThisWindow.Update
      start(printkartustokold,25000,GBAR:Kode_brg)
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


BRW6.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

ProsesKesalahanOpname PROCEDURE                            ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
Process:View         VIEW(ASaldoAwal)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
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
  GlobalErrors.SetProcedureName('ProsesKesalahanOpname')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: Process
  BIND('glo:bulan',glo:bulan)                              ! Added by: Process
  BIND('glo:tahun',glo:tahun)                              ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:ASaldoAwal.Open                                   ! File ApStokop used by this procedure, so make sure it's RelationManager is open
  Relate:ApStokop.Open                                     ! File ApStokop used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesKesalahanOpname',ProgressWindow)     ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:ASaldoAwal, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ThisProcess.SetFilter('asa:apotik=GL_entryapotik and asa:bulan=glo:bulan and asa:tahun=glo:tahun')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(ASaldoAwal,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ASaldoAwal.Close
    Relate:ApStokop.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesKesalahanOpname',ProgressWindow)  ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  Apso:Kode_Apotik=ASA:Apotik
  Apso:Kode_Barang=ASA:Kode_Barang
  Apso:Tahun      =ASA:Tahun
  Apso:Bulan      =ASA:Bulan
  if access:apstokop.fetch(Apso:kdapotik_brg)=level:benign then
     Apso:Stkomputer=ASA:Jumlah
     Apso:Harga     =ASA:Harga
     !Apso:Nilaistok =ASA:Total
     access:apstokop.update()
  end
  RETURN ReturnValue

WindowKonvert PROCEDURE                                    ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
vl_pil               BYTE                                  !
Window               WINDOW('Caption'),AT(,,311,111),FONT('Arial',8,,FONT:regular),CENTER,GRAY
                       OPTION('Pilihan'),AT(37,4,87,36),USE(vl_pil),BOXED
                         RADIO('Gudang'),AT(45,15),USE(?vl_pil:Radio1),VALUE('1')
                         RADIO('Apotik'),AT(45,26),USE(?vl_pil:Radio2),VALUE('2')
                       END
                       PROMPT('Bulan:'),AT(26,49),USE(?glo:bulan:Prompt)
                       ENTRY(@n-7),AT(76,49,60,10),USE(glo:bulan),RIGHT(1)
                       PROMPT('Tahun:'),AT(25,65),USE(?glo:tahun:Prompt)
                       ENTRY(@n-14),AT(75,65,60,10),USE(glo:tahun),RIGHT(1)
                       BUTTON('&OK'),AT(47,82,45,14),USE(?OkButton),DEFAULT
                       BUTTON('&Keluar'),AT(100,82,45,14),USE(?CancelButton)
                       BUTTON('Proses Revisi Kesalahan Opname'),AT(181,25,121,14),USE(?Button5)
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
  GlobalErrors.SetProcedureName('WindowKonvert')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?vl_pil:Radio1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('WindowKonvert',Window)                     ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('WindowKonvert',Window)                  ! Save window data to non-volatile store
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
      if vl_pil=1 then
         prosesgudangfifo
      else
         prosesapotikfifo
      end
    OF ?CancelButton
      ThisWindow.Update
      break
    OF ?Button5
      ThisWindow.Update
      START(ProsesKesalahanOpname, 25000)
      ThisWindow.Reset
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

ProsesApotikFIFO PROCEDURE                                 ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
vl_harga             REAL                                  !
Process:View         VIEW(GStockGdg)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
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
view::file_sql view(filesql)
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
  GlobalErrors.SetProcedureName('ProsesApotikFIFO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File AFIFOOUT used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql.Open                                      ! File AFIFOOUT used by this procedure, so make sure it's RelationManager is open
  Access:FIFOIN.UseFile                                    ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:FIFOOUT.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesApotikFIFO',ProgressWindow)          ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:GStockGdg, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(GStockGdg,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AFIFOIN.Close
    Relate:FileSql.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesApotikFIFO',ProgressWindow)       ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  vl_harga=GSGD:Harga_Beli*1.1
  !message('update dba.fifoin set harga='&vl_harga&' where kode_barang='''&GSGD:Kode_brg&''' and month(tanggal)=1 and year(tanggal)=2003 and harga is null')
  open(view::file_sql)
  view::file_sql{prop:sql}='update dba.afifoin set harga='&vl_harga&' where kode_barang='''&GSGD:Kode_brg&''' and month(tanggal)='&glo:bulan&' and year(tanggal)='&glo:tahun&' and (harga=0 or harga is null)'
  !if errorcode() then message(error()).
  close(view::file_sql)
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue

ProsesGudangFIFO PROCEDURE                                 ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
vl_harga             REAL                                  !
Process:View         VIEW(GStockGdg)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
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
view::file_sql view(filesql)
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
  GlobalErrors.SetProcedureName('ProsesGudangFIFO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:FIFOIN.Open                                       ! File FileSql used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql.Open                                      ! File FileSql used by this procedure, so make sure it's RelationManager is open
  Access:FIFOOUT.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesGudangFIFO',ProgressWindow)          ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:GStockGdg, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(GStockGdg,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:FIFOIN.Close
    Relate:FileSql.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesGudangFIFO',ProgressWindow)       ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  vl_harga=GSGD:Harga_Beli*1.1
  !message('update dba.fifoin set harga='&vl_harga&' where kode_barang='''&GSGD:Kode_brg&''' and month(tanggal)=1 and year(tanggal)=2003 and harga is null')
  open(view::file_sql)
  view::file_sql{prop:sql}='update dba.fifoin set harga='&vl_harga&' where kode_barang='''&GSGD:Kode_brg&''' and month(tanggal)='&glo:bulan&' and year(tanggal)='&glo:tahun&' and (harga=0 or harga is null)'
  !if errorcode() then message(error()).
  close(view::file_sql)
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue

