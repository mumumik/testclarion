

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N047.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N017.INC'),ONCE        !Req'd for module callout resolution
                     END


UpdateFIFOIN PROCEDURE                                     ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
History::AFI:Record  LIKE(AFI:RECORD),THREAD
QuickWindow          WINDOW('Update the AFIFOIN File'),AT(,,180,182),FONT('Arial',8,,),IMM,HLP('UpdateFIFOIN'),SYSTEM,GRAY,MDI
                       SHEET,AT(4,4,172,156),USE(?CurrentTab)
                         TAB('General'),USE(?Tab:1)
                           PROMPT('Kode Barang:'),AT(8,20),USE(?AFI:Kode_Barang:Prompt)
                           ENTRY(@s10),AT(68,20,44,10),USE(AFI:Kode_Barang),REQ
                           PROMPT('Mata Uang:'),AT(8,34),USE(?AFI:Mata_Uang:Prompt)
                           ENTRY(@s5),AT(68,34,40,10),USE(AFI:Mata_Uang),REQ
                           PROMPT('No Transaksi:'),AT(8,48),USE(?AFI:NoTransaksi:Prompt)
                           ENTRY(@s15),AT(68,48,64,10),USE(AFI:NoTransaksi),REQ
                           PROMPT('Transaksi:'),AT(8,62),USE(?AFI:Transaksi:Prompt)
                           ENTRY(@n3),AT(68,62,40,10),USE(AFI:Transaksi),REQ
                           PROMPT('Tanggal:'),AT(8,76),USE(?AFI:Tanggal:Prompt)
                           ENTRY(@d17),AT(68,76,104,10),USE(AFI:Tanggal)
                           PROMPT('Harga:'),AT(8,90),USE(?AFI:Harga:Prompt)
                           ENTRY(@n15.2),AT(68,90,84,10),USE(AFI:Harga)
                           PROMPT('Jumlah:'),AT(8,104),USE(?AFI:Jumlah:Prompt)
                           ENTRY(@n10.2),AT(68,104,44,10),USE(AFI:Jumlah)
                           PROMPT('Jumlah Keluar:'),AT(8,118),USE(?AFI:Jumlah_Keluar:Prompt)
                           ENTRY(@n10.2),AT(68,118,44,10),USE(AFI:Jumlah_Keluar)
                           PROMPT('Tgl Update:'),AT(8,132),USE(?AFI:Tgl_Update:Prompt)
                           ENTRY(@d17),AT(68,132,104,10),USE(AFI:Tgl_Update)
                           PROMPT('Jam Update:'),AT(8,146),USE(?AFI:Jam_Update:Prompt)
                           ENTRY(@t04),AT(68,146,104,10),USE(AFI:Jam_Update)
                         END
                         TAB('General (cont.)'),USE(?Tab:2)
                           PROMPT('Operator:'),AT(8,20),USE(?AFI:Operator:Prompt)
                           ENTRY(@s20),AT(68,20,84,10),USE(AFI:Operator)
                           PROMPT('Jam:'),AT(8,34),USE(?AFI:Jam:Prompt)
                           ENTRY(@t04),AT(68,34,104,10),USE(AFI:Jam)
                           PROMPT('Kode Apotik:'),AT(8,48),USE(?AFI:Kode_Apotik:Prompt)
                           ENTRY(@s5),AT(68,48,40,10),USE(AFI:Kode_Apotik),REQ
                           PROMPT('Status:'),AT(8,62),USE(?AFI:Status:Prompt)
                           ENTRY(@n3),AT(68,62,40,10),USE(AFI:Status)
                         END
                       END
                       BUTTON('OK'),AT(33,164,45,14),USE(?OK),DEFAULT
                       BUTTON('Cancel'),AT(82,164,45,14),USE(?Cancel)
                       BUTTON('Help'),AT(131,164,45,14),USE(?Help),STD(STD:Help)
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
  GlobalErrors.SetProcedureName('UpdateFIFOIN')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?AFI:Kode_Barang:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(AFI:Record,History::AFI:Record)
  SELF.AddHistoryField(?AFI:Kode_Barang,1)
  SELF.AddHistoryField(?AFI:Mata_Uang,2)
  SELF.AddHistoryField(?AFI:NoTransaksi,3)
  SELF.AddHistoryField(?AFI:Transaksi,4)
  SELF.AddHistoryField(?AFI:Tanggal,5)
  SELF.AddHistoryField(?AFI:Harga,6)
  SELF.AddHistoryField(?AFI:Jumlah,7)
  SELF.AddHistoryField(?AFI:Jumlah_Keluar,8)
  SELF.AddHistoryField(?AFI:Tgl_Update,9)
  SELF.AddHistoryField(?AFI:Jam_Update,10)
  SELF.AddHistoryField(?AFI:Operator,11)
  SELF.AddHistoryField(?AFI:Jam,12)
  SELF.AddHistoryField(?AFI:Kode_Apotik,13)
  SELF.AddHistoryField(?AFI:Status,14)
  SELF.AddUpdateFile(Access:AFIFOIN)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File AFIFOIN used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:AFIFOIN
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
  INIMgr.Fetch('UpdateFIFOIN',QuickWindow)                 ! Restore window settings from non-volatile store
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
    Relate:AFIFOIN.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateFIFOIN',QuickWindow)              ! Save window data to non-volatile store
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

BrowseKartuFIFOApotikAll PROCEDURE                         ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
vl_in                REAL                                  !
vl_out               REAL                                  !
vl_total             REAL                                  !
BRW1::View:Browse    VIEW(AFIFOIN)
                       PROJECT(AFI:Tanggal)
                       PROJECT(AFI:Jam)
                       PROJECT(AFI:NoTransaksi)
                       PROJECT(AFI:Harga)
                       PROJECT(AFI:Jumlah)
                       PROJECT(AFI:Jumlah_Keluar)
                       PROJECT(AFI:Kode_Barang)
                       PROJECT(AFI:Tgl_Update)
                       PROJECT(AFI:Transaksi)
                       PROJECT(AFI:Kode_Apotik)
                       PROJECT(AFI:Status)
                       PROJECT(AFI:Mata_Uang)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
AFI:Tanggal            LIKE(AFI:Tanggal)              !List box control field - type derived from field
AFI:Jam                LIKE(AFI:Jam)                  !List box control field - type derived from field
AFI:NoTransaksi        LIKE(AFI:NoTransaksi)          !List box control field - type derived from field
AFI:Harga              LIKE(AFI:Harga)                !List box control field - type derived from field
AFI:Jumlah             LIKE(AFI:Jumlah)               !List box control field - type derived from field
AFI:Jumlah_Keluar      LIKE(AFI:Jumlah_Keluar)        !List box control field - type derived from field
AFI:Kode_Barang        LIKE(AFI:Kode_Barang)          !List box control field - type derived from field
AFI:Tgl_Update         LIKE(AFI:Tgl_Update)           !List box control field - type derived from field
AFI:Transaksi          LIKE(AFI:Transaksi)            !List box control field - type derived from field
AFI:Kode_Apotik        LIKE(AFI:Kode_Apotik)          !List box control field - type derived from field
AFI:Status             LIKE(AFI:Status)               !List box control field - type derived from field
AFI:Mata_Uang          LIKE(AFI:Mata_Uang)            !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW4::View:Browse    VIEW(GBarang)
                       PROJECT(GBAR:Kode_brg)
                       PROJECT(GBAR:Nama_Brg)
                       PROJECT(GBAR:Jenis_Brg)
                       PROJECT(GBAR:No_Satuan)
                       PROJECT(GBAR:Dosis)
                       PROJECT(GBAR:Status)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Jenis_Brg         LIKE(GBAR:Jenis_Brg)           !List box control field - type derived from field
GBAR:No_Satuan         LIKE(GBAR:No_Satuan)           !List box control field - type derived from field
GBAR:Dosis             LIKE(GBAR:Dosis)               !List box control field - type derived from field
GBAR:Status            LIKE(GBAR:Status)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(AFIFOOUT)
                       PROJECT(AFI2:Tanggal)
                       PROJECT(AFI2:Jam)
                       PROJECT(AFI2:NoTransKeluar)
                       PROJECT(AFI2:Harga)
                       PROJECT(AFI2:Jumlah)
                       PROJECT(AFI2:Kode_Barang)
                       PROJECT(AFI2:Kode_Apotik)
                       PROJECT(AFI2:Transaksi)
                       PROJECT(AFI2:NoTransaksi)
                       PROJECT(AFI2:Mata_Uang)
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?List:2
AFI2:Tanggal           LIKE(AFI2:Tanggal)             !List box control field - type derived from field
AFI2:Jam               LIKE(AFI2:Jam)                 !List box control field - type derived from field
AFI2:NoTransKeluar     LIKE(AFI2:NoTransKeluar)       !List box control field - type derived from field
AFI2:Harga             LIKE(AFI2:Harga)               !List box control field - type derived from field
AFI2:Jumlah            LIKE(AFI2:Jumlah)              !List box control field - type derived from field
AFI2:Kode_Barang       LIKE(AFI2:Kode_Barang)         !List box control field - type derived from field
AFI2:Kode_Apotik       LIKE(AFI2:Kode_Apotik)         !List box control field - type derived from field
AFI2:Transaksi         LIKE(AFI2:Transaksi)           !List box control field - type derived from field
AFI2:NoTransaksi       LIKE(AFI2:NoTransaksi)         !List box control field - type derived from field
AFI2:Mata_Uang         LIKE(AFI2:Mata_Uang)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('KARTU PERSEDIAN - METODA FIFO'),AT(,,391,264),FONT('Arial',8,,),CENTER,IMM,HLP('BrowseKartuStok'),SYSTEM,GRAY,MDI
                       SHEET,AT(5,1,377,91),USE(?Sheet1)
                         TAB('Nama Barang (F2)'),USE(?Tab1),KEY(F2Key)
                           BUTTON('&Proses'),AT(127,75,45,14),USE(?Button1),DISABLE,HIDE
                           PROMPT('Nama Obat:'),AT(11,77),USE(?GBAR:Nama_Brg:Prompt)
                           ENTRY(@s40),AT(61,77,60,10),USE(GBAR:Nama_Brg),MSG('Nama Barang'),TIP('Nama Barang')
                         END
                         TAB('Kode Barang (F3)'),USE(?Tab2),KEY(F3Key)
                           PROMPT('Kode Barang:'),AT(9,77),USE(?GBAR:Kode_brg:Prompt)
                           ENTRY(@s10),AT(59,77,60,10),USE(GBAR:Kode_brg),MSG('Kode Barang'),TIP('Kode Barang')
                         END
                       END
                       LIST,AT(8,94,369,64),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('47R(2)|M~Tanggal~C(0)@d06@37R(2)|M~Jam~C(0)@t04@66L(2)|M~No Transaksi~@s15@44D(1' &|
   '8)|M~Harga~C(0)@n10.2@48D(16)|M~Jumlah~C(0)@n-11.2@56D(12)|M~Jumlah Keluar~C(0)@' &|
   'n-11.2@48L(2)|M~Kode Barang~@s10@80R(2)|M~Tgl Update~C(0)@d17@40R(2)|M~Transaksi' &|
   '~C(0)@n3@20R(2)|M~Kode Apotik~C(0)@s5@12R(2)|M~Status~C(0)@n3@20R(2)|M~Mata Uang' &|
   '~C(0)@s5@'),FROM(Queue:Browse:1)
                       BUTTON('&Tambah'),AT(60,160,42,12),USE(?Insert)
                       BUTTON('&Ubah'),AT(104,160,42,12),USE(?Change)
                       BUTTON('&Hapus'),AT(147,160,42,12),USE(?Delete)
                       ENTRY(@n-10.2),AT(258,161,52,10),USE(vl_out),DECIMAL(14)
                       PROMPT('Total :'),AT(312,161),USE(?vl_total:Prompt)
                       ENTRY(@n-12.2),AT(333,161,52,10),USE(vl_total),DECIMAL(14)
                       ENTRY(@n-10.2),AT(205,161,49,10),USE(vl_in),DECIMAL(14)
                       LIST,AT(8,175,369,71),USE(?List:2),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('49L|M~Tanggal~@d06@35L|M~Jam~@t04@64L|M~No Trans~@s15@46L|M~Harga~@n-15.2@57L|M~' &|
   'Jumlah~@n-15.2@40L|M~Kode Barang~@s10@45L|M~Kode Apotik~@s5@40L|M~Transaksi~@n3@' &|
   '51L|M~No Transaksi~@s15@20L|M~Mata Uang~@s5@'),FROM(Queue:Browse:2)
                       BUTTON('&1. Tambah'),AT(60,249,42,12),USE(?Insert:2)
                       BUTTON('&2. Ubah'),AT(104,249,42,12),USE(?Change:2)
                       BUTTON('&3. Hapus'),AT(147,249,42,12),USE(?Delete:2)
                       LIST,AT(10,19,369,54),USE(?List),IMM,MSG('Browsing Records'),FORMAT('40L|M~Kode Barang~@s10@160L|M~Nama Obat~@s40@20L|M~Jenis Brg~@s5@40L|M~Satuan~@s' &|
   '10@28L|M~Dosis~@n7@12L|M~Status~@n3@'),FROM(Queue:Browse)
                       BUTTON('&Selesai'),AT(205,248,45,14),USE(?Close)
                       BUTTON('&Print Kartu FIFO'),AT(275,248,77,14),USE(?Button3),LEFT,ICON(ICON:Print)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Reset                  PROCEDURE(BYTE Force=0),DERIVED     ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
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
BRW5                 CLASS(BrowseClass)                    ! Browse using ?List:2
Q                      &Queue:Browse:2                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
                     END

BRW5::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW5::EIPManager     BrowseEIPManager                      ! Browse EIP Manager for Browse using ?List:2
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
  GlobalErrors.SetProcedureName('BrowseKartuFIFOApotikAll')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Button1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('afi:kode_apotik',afi:kode_apotik)                  ! Added by: BrowseBox(ABC)
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  BIND('AFI:Tanggal',AFI:Tanggal)                          ! Added by: BrowseBox(ABC)
  BIND('AFI:Jam',AFI:Jam)                                  ! Added by: BrowseBox(ABC)
  BIND('AFI:NoTransaksi',AFI:NoTransaksi)                  ! Added by: BrowseBox(ABC)
  BIND('AFI:Harga',AFI:Harga)                              ! Added by: BrowseBox(ABC)
  BIND('AFI:Jumlah',AFI:Jumlah)                            ! Added by: BrowseBox(ABC)
  BIND('AFI:Jumlah_Keluar',AFI:Jumlah_Keluar)              ! Added by: BrowseBox(ABC)
  BIND('AFI:Kode_Barang',AFI:Kode_Barang)                  ! Added by: BrowseBox(ABC)
  BIND('AFI:Tgl_Update',AFI:Tgl_Update)                    ! Added by: BrowseBox(ABC)
  BIND('AFI:Transaksi',AFI:Transaksi)                      ! Added by: BrowseBox(ABC)
  BIND('AFI:Mata_Uang',AFI:Mata_Uang)                      ! Added by: BrowseBox(ABC)
  BIND('AFI2:Tanggal',AFI2:Tanggal)                        ! Added by: BrowseBox(ABC)
  BIND('AFI2:Jam',AFI2:Jam)                                ! Added by: BrowseBox(ABC)
  BIND('AFI2:NoTransKeluar',AFI2:NoTransKeluar)            ! Added by: BrowseBox(ABC)
  BIND('AFI2:Harga',AFI2:Harga)                            ! Added by: BrowseBox(ABC)
  BIND('AFI2:Jumlah',AFI2:Jumlah)                          ! Added by: BrowseBox(ABC)
  BIND('AFI2:Kode_Barang',AFI2:Kode_Barang)                ! Added by: BrowseBox(ABC)
  BIND('AFI2:Kode_Apotik',AFI2:Kode_Apotik)                ! Added by: BrowseBox(ABC)
  BIND('AFI2:Transaksi',AFI2:Transaksi)                    ! Added by: BrowseBox(ABC)
  BIND('AFI2:NoTransaksi',AFI2:NoTransaksi)                ! Added by: BrowseBox(ABC)
  BIND('AFI2:Mata_Uang',AFI2:Mata_Uang)                    ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File GStockGdg used by this procedure, so make sure it's RelationManager is open
  Relate:ApStokop.Open                                     ! File GStockGdg used by this procedure, so make sure it's RelationManager is open
  Access:GBarang.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStockGdg.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:AFIFOIN,SELF) ! Initialize the browse manager
  BRW4.Init(?List,Queue:Browse.ViewPosition,BRW4::View:Browse,Queue:Browse,Relate:GBarang,SELF) ! Initialize the browse manager
  BRW5.Init(?List:2,Queue:Browse:2.ViewPosition,BRW5::View:Browse,Queue:Browse:2,Relate:AFIFOOUT,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  ?List:2{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,AFI:KeyBarangFIFOIN)                  ! Add the sort order for AFI:KeyBarangFIFOIN for sort order 1
  BRW1.AddRange(AFI:Kode_Barang,Relate:AFIFOIN,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,AFI:Kode_Barang,1,BRW1)        ! Initialize the browse locator using  using key: AFI:KeyBarangFIFOIN , AFI:Kode_Barang
  BRW1.AppendOrder('afi:tanggal,afi:jam,afi:notransaksi')  ! Append an additional sort order
  BRW1.SetFilter('(afi:kode_apotik=GL_entryapotik)')       ! Apply filter expression to browse
  BRW1.AddField(AFI:Tanggal,BRW1.Q.AFI:Tanggal)            ! Field AFI:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(AFI:Jam,BRW1.Q.AFI:Jam)                    ! Field AFI:Jam is a hot field or requires assignment from browse
  BRW1.AddField(AFI:NoTransaksi,BRW1.Q.AFI:NoTransaksi)    ! Field AFI:NoTransaksi is a hot field or requires assignment from browse
  BRW1.AddField(AFI:Harga,BRW1.Q.AFI:Harga)                ! Field AFI:Harga is a hot field or requires assignment from browse
  BRW1.AddField(AFI:Jumlah,BRW1.Q.AFI:Jumlah)              ! Field AFI:Jumlah is a hot field or requires assignment from browse
  BRW1.AddField(AFI:Jumlah_Keluar,BRW1.Q.AFI:Jumlah_Keluar) ! Field AFI:Jumlah_Keluar is a hot field or requires assignment from browse
  BRW1.AddField(AFI:Kode_Barang,BRW1.Q.AFI:Kode_Barang)    ! Field AFI:Kode_Barang is a hot field or requires assignment from browse
  BRW1.AddField(AFI:Tgl_Update,BRW1.Q.AFI:Tgl_Update)      ! Field AFI:Tgl_Update is a hot field or requires assignment from browse
  BRW1.AddField(AFI:Transaksi,BRW1.Q.AFI:Transaksi)        ! Field AFI:Transaksi is a hot field or requires assignment from browse
  BRW1.AddField(AFI:Kode_Apotik,BRW1.Q.AFI:Kode_Apotik)    ! Field AFI:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(AFI:Status,BRW1.Q.AFI:Status)              ! Field AFI:Status is a hot field or requires assignment from browse
  BRW1.AddField(AFI:Mata_Uang,BRW1.Q.AFI:Mata_Uang)        ! Field AFI:Mata_Uang is a hot field or requires assignment from browse
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
  BRW4.AddField(GBAR:Dosis,BRW4.Q.GBAR:Dosis)              ! Field GBAR:Dosis is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Status,BRW4.Q.GBAR:Status)            ! Field GBAR:Status is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse:2
  BRW5.AddSortOrder(,AFI2:KEY1)                            ! Add the sort order for AFI2:KEY1 for sort order 1
  BRW5.AddRange(AFI2:Kode_Apotik,Relate:AFIFOOUT,Relate:AFIFOIN) ! Add file relationship range limit for sort order 1
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort0:Locator.Init(,AFI2:NoTransKeluar,,BRW5)      ! Initialize the browse locator using  using key: AFI2:KEY1 , AFI2:NoTransKeluar
  BRW5.AppendOrder('afi2:tanggal,afi2:jam,afi2:notransaksi') ! Append an additional sort order
  BRW5.AddField(AFI2:Tanggal,BRW5.Q.AFI2:Tanggal)          ! Field AFI2:Tanggal is a hot field or requires assignment from browse
  BRW5.AddField(AFI2:Jam,BRW5.Q.AFI2:Jam)                  ! Field AFI2:Jam is a hot field or requires assignment from browse
  BRW5.AddField(AFI2:NoTransKeluar,BRW5.Q.AFI2:NoTransKeluar) ! Field AFI2:NoTransKeluar is a hot field or requires assignment from browse
  BRW5.AddField(AFI2:Harga,BRW5.Q.AFI2:Harga)              ! Field AFI2:Harga is a hot field or requires assignment from browse
  BRW5.AddField(AFI2:Jumlah,BRW5.Q.AFI2:Jumlah)            ! Field AFI2:Jumlah is a hot field or requires assignment from browse
  BRW5.AddField(AFI2:Kode_Barang,BRW5.Q.AFI2:Kode_Barang)  ! Field AFI2:Kode_Barang is a hot field or requires assignment from browse
  BRW5.AddField(AFI2:Kode_Apotik,BRW5.Q.AFI2:Kode_Apotik)  ! Field AFI2:Kode_Apotik is a hot field or requires assignment from browse
  BRW5.AddField(AFI2:Transaksi,BRW5.Q.AFI2:Transaksi)      ! Field AFI2:Transaksi is a hot field or requires assignment from browse
  BRW5.AddField(AFI2:NoTransaksi,BRW5.Q.AFI2:NoTransaksi)  ! Field AFI2:NoTransaksi is a hot field or requires assignment from browse
  BRW5.AddField(AFI2:Mata_Uang,BRW5.Q.AFI2:Mata_Uang)      ! Field AFI2:Mata_Uang is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseKartuFIFOApotikAll',QuickWindow)     ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW4.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
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
    INIMgr.Update('BrowseKartuFIFOApotikAll',QuickWindow)  ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  vl_total = vl_in - vl_out
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdateFIFOIN
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
    OF ?Insert:2
      if glo:level>0 then
         cycle
      end
    OF ?Change:2
      if glo:level>0 then
         cycle
      end
    OF ?Delete:2
      if glo:level>0 then
         cycle
      end
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button1
      ThisWindow.Update
      apstokop{prop:sql}='select * from dba.apstokop where bulan=10 and tahun=2002 and kode_apotik='''&GL_entryapotik&''''
      loop
         if access:apstokop.next()<>level:benign then break.
         GSTO:Kode_Barang=Apso:Kode_Barang
         GSTO:Kode_Apotik=GL_entryapotik
         access:gstokaptk.fetch(GSTO:KeyBarang)
         AFI:Kode_Barang  =Apso:Kode_Barang
         AFI:Mata_Uang    ='Rp'
         AFI:NoTransaksi  ='OPN0210'
         AFI:Transaksi    =1
         AFI:Tanggal      =today()
         AFI:Harga        =GSTO:Harga_Dasar
         AFI:Jumlah       =GSTO:Saldo
         AFI:Jumlah_Keluar=0
         AFI:Tgl_Update   =today()
         AFI:Jam_Update   =clock()
         AFI:Operator     ='ADI'
         AFI:Jam          =clock()
         AFI:Kode_Apotik  =GL_entryapotik
         AFI:Status       =0
         access:afifoin.insert()
      end
    OF ?Button3
      ThisWindow.Update
      start(PrintKartuFifo,25000,GBAR:Kode_brg)
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
      if glo:level>0 then
         hide(?button1)
         hide(?insert)
         hide(?change)
         hide(?delete)
         hide(?insert:2)
         hide(?change:2)
         hide(?delete:2)
      end
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  vl_total = vl_in - vl_out


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

vl_in:Sum            REAL                                  ! Sum variable for browse totals
vl_out:Sum           REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:AFIFOIN.SetQuickScan(1)
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
    vl_in:Sum += AFI:Jumlah
    vl_out:Sum += AFI:Jumlah_Keluar
  END
  vl_in = vl_in:Sum
  vl_out = vl_out:Sum
  PARENT.ResetFromView
  Relate:AFIFOIN.SetQuickScan(0)
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


BRW5.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW5.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  SELF.EIP &= BRW5::EIPManager                             ! Set the EIP manager
  SELF.DeleteAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Default+EIPAction:Remain+EIPAction:RetainColumn
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:2
    SELF.ChangeControl=?Change:2
    SELF.DeleteControl=?Delete:2
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

PrintInstalasi PROCEDURE                                   ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
Process:View         VIEW(TBinstli)
                       PROJECT(TBis:Jenis_ins)
                       PROJECT(TBis:Kode_Instalasi)
                       PROJECT(TBis:Nama_instalasi)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(1000,1490,7438,9281),PAPER(PAPER:LETTER),PRE(RPT),FONT('Arial',10,,),THOUS
                       HEADER,AT(979,938,7427,542)
                         STRING('Report the TBinstli File'),AT(0,21,6000,219),CENTER,FONT(,,COLOR:Black,FONT:bold)
                         BOX,AT(0,260,6000,281),COLOR(COLOR:Black),FILL(COLOR:Silver)
                         LINE,AT(2000,260,0,281),COLOR(COLOR:Black)
                         LINE,AT(4000,260,0,281),COLOR(COLOR:Black)
                         STRING('Kode Instalasi'),AT(52,313,1896,167),TRN
                         STRING('Nama instalasi'),AT(2052,313,1896,167),TRN
                         STRING('Jenis ins'),AT(4052,313,1896,167),TRN
                       END
detail                 DETAIL,AT(,,7177,281),USE(?detail)
                         LINE,AT(2000,0,0,281),COLOR(COLOR:Black)
                         LINE,AT(4000,0,0,281),COLOR(COLOR:Black)
                         STRING(@s5),AT(52,52,1896,167),USE(TBis:Kode_Instalasi)
                         STRING(@s30),AT(2052,52,1896,167),USE(TBis:Nama_instalasi)
                         STRING(@s5),AT(4052,52,1896,167),USE(TBis:Jenis_ins)
                         LINE,AT(52,281,5896,0),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(844,10771,7594,219)
                         STRING(@pPage <<<#p),AT(5250,31,698,135),PAGENO,USE(?PageCount),FONT('Arial',8,COLOR:Black,FONT:regular)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ProgressMgr          StepStringClass                       ! Progress Manager
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
  GlobalErrors.SetProcedureName('PrintInstalasi')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:TBinstli.Open                                     ! File TBinstli used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintInstalasi',ProgressWindow)            ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:TBinstli, ?Progress:PctText, Progress:Thermometer, ProgressMgr, TBis:Kode_Instalasi)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(TBis:keykodeins)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  Relate:TBinstli.SetQuickScan(1,Propagate:OneMany)
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
    Relate:TBinstli.Close
  END
  IF SELF.Opened
    INIMgr.Update('PrintInstalasi',ProgressWindow)         ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail)
  RETURN ReturnValue

Tabel_instalasi PROCEDURE                                  ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(TBinstli)
                       PROJECT(TBis:Kode_Instalasi)
                       PROJECT(TBis:Nama_instalasi)
                       PROJECT(TBis:Jenis_ins)
                       PROJECT(TBis:InstalasiNota)
                       PROJECT(TBis:Status)
                       PROJECT(TBis:Keterangan)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
TBis:Kode_Instalasi    LIKE(TBis:Kode_Instalasi)      !List box control field - type derived from field
TBis:Nama_instalasi    LIKE(TBis:Nama_instalasi)      !List box control field - type derived from field
TBis:Jenis_ins         LIKE(TBis:Jenis_ins)           !List box control field - type derived from field
TBis:InstalasiNota     LIKE(TBis:InstalasiNota)       !List box control field - type derived from field
TBis:Status            LIKE(TBis:Status)              !List box control field - type derived from field
TBis:Keterangan        LIKE(TBis:Keterangan)          !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Melihat Tabel Instalasi'),AT(,,360,188),FONT('Arial',8,,),IMM,HLP('Tabel_instalasi'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,347,124),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('27L(2)|M~Kode~@s5@120L(2)|M~Nama instalasi~@s30@25L(2)|M~Jenis~@s5@103L(2)|M~Ins' &|
   'talasi Nota~@s40@12L(2)|M~Status~@n3@80L(2)|M~Keterangan~@s20@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(57,148,45,14),USE(?Select:2),DISABLE,HIDE
                       BUTTON('&Tambah'),AT(106,148,45,14),USE(?Insert:3)
                       BUTTON('&Ubah'),AT(155,148,45,14),USE(?Change:3),DEFAULT
                       BUTTON('&Hapus'),AT(204,148,45,14),USE(?Delete:3)
                       BUTTON('Cetak'),AT(118,170,40,14),USE(?Button7)
                       SHEET,AT(4,4,354,162),USE(?CurrentTab)
                         TAB('Kode Instalasi'),USE(?Tab:2)
                         END
                         TAB('Nama Instalasi'),USE(?Tab:3)
                         END
                         TAB('Jenis Instalasi'),USE(?Tab:4)
                         END
                       END
                       BUTTON('&Keluar'),AT(159,170,45,14),USE(?Close)
                       BUTTON('Help'),AT(208,170,45,14),USE(?Help),DISABLE,HIDE,STD(STD:Help)
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
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW1::Sort1:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW1::Sort2:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 3
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
  GlobalErrors.SetProcedureName('Tabel_instalasi')
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
  Relate:ApObInst.SetOpenRelated()
  Relate:ApObInst.Open                                     ! File ApObInst used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:TBinstli,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon TBis:Nama_instalasi for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,TBis:keynamains) ! Add the sort order for TBis:keynamains for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,TBis:Nama_instalasi,1,BRW1)    ! Initialize the browse locator using  using key: TBis:keynamains , TBis:Nama_instalasi
  BRW1::Sort2:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon TBis:Jenis_ins for sort order 2
  BRW1.AddSortOrder(BRW1::Sort2:StepClass,TBis:key_ins_ins) ! Add the sort order for TBis:key_ins_ins for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,TBis:Jenis_ins,1,BRW1)         ! Initialize the browse locator using  using key: TBis:key_ins_ins , TBis:Jenis_ins
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon TBis:Kode_Instalasi for sort order 3
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,TBis:keykodeins) ! Add the sort order for TBis:keykodeins for sort order 3
  BRW1.AddField(TBis:Kode_Instalasi,BRW1.Q.TBis:Kode_Instalasi) ! Field TBis:Kode_Instalasi is a hot field or requires assignment from browse
  BRW1.AddField(TBis:Nama_instalasi,BRW1.Q.TBis:Nama_instalasi) ! Field TBis:Nama_instalasi is a hot field or requires assignment from browse
  BRW1.AddField(TBis:Jenis_ins,BRW1.Q.TBis:Jenis_ins)      ! Field TBis:Jenis_ins is a hot field or requires assignment from browse
  BRW1.AddField(TBis:InstalasiNota,BRW1.Q.TBis:InstalasiNota) ! Field TBis:InstalasiNota is a hot field or requires assignment from browse
  BRW1.AddField(TBis:Status,BRW1.Q.TBis:Status)            ! Field TBis:Status is a hot field or requires assignment from browse
  BRW1.AddField(TBis:Keterangan,BRW1.Q.TBis:Keterangan)    ! Field TBis:Keterangan is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Tabel_instalasi',QuickWindow)              ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
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
    Relate:ApObInst.Close
  END
  IF SELF.Opened
    INIMgr.Update('Tabel_instalasi',QuickWindow)           ! Save window data to non-volatile store
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
    UpdateTBinstli
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
    OF ?Button7
      ThisWindow.Update
      START(PrintInstalasi, 25000)
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
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

UpdateTBinstli PROCEDURE                                   ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
History::TBis:Record LIKE(TBis:RECORD),THREAD
QuickWindow          WINDOW('Penambahan Tabel Instalasi'),AT(,,205,152),FONT('Arial',8,,),IMM,HLP('UpdateTBinstli'),SYSTEM,GRAY,MDI
                       SHEET,AT(4,4,196,121),USE(?CurrentTab)
                         TAB('Data Umum'),USE(?Tab:1)
                           PROMPT('Kode Instalasi :'),AT(8,20),USE(?TBis:Kode_Instalasi:Prompt)
                           ENTRY(@s5),AT(72,20,40,10),USE(TBis:Kode_Instalasi),MSG('Kode Apotik'),TIP('Kode Apotik')
                           PROMPT('Nama instalasi :'),AT(8,34),USE(?TBis:Nama_instalasi:Prompt)
                           ENTRY(@s30),AT(72,34,124,10),USE(TBis:Nama_instalasi),MSG('Nama Apotik'),TIP('Nama Apotik')
                           PROMPT('Jenis instalasi :'),AT(8,48),USE(?TBis:Jenis_ins:Prompt)
                           ENTRY(@s5),AT(72,48,40,10),USE(TBis:Jenis_ins),MSG('Jenis Instalasi'),TIP('Jenis Instalasi')
                           PROMPT('Instalasi Nota:'),AT(8,63),USE(?TBis:InstalasiNota:Prompt)
                           ENTRY(@s40),AT(72,63,124,10),USE(TBis:InstalasiNota),DISABLE
                           OPTION('Status'),AT(71,77,114,22),USE(TBis:Status),BOXED
                             RADIO('Aktif'),AT(77,85),USE(?TBis:Status:Radio1),VALUE('0')
                             RADIO('Tidak Aktif'),AT(118,85),USE(?TBis:Status:Radio1:2),VALUE('1')
                           END
                           PROMPT('Keterangan:'),AT(8,103),USE(?TBis:Keterangan:Prompt)
                           ENTRY(@s20),AT(72,103,124,10),USE(TBis:Keterangan)
                         END
                       END
                       BUTTON('&OK'),AT(57,131,45,14),USE(?OK),DEFAULT
                       BUTTON('&Batal'),AT(106,131,45,14),USE(?Cancel)
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
    ActionMessage = 'Adding a TBinstli Record'
  OF ChangeRecord
    ActionMessage = 'Changing a TBinstli Record'
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateTBinstli')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?TBis:Kode_Instalasi:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(TBis:Record,History::TBis:Record)
  SELF.AddHistoryField(?TBis:Kode_Instalasi,1)
  SELF.AddHistoryField(?TBis:Nama_instalasi,2)
  SELF.AddHistoryField(?TBis:Jenis_ins,3)
  SELF.AddHistoryField(?TBis:InstalasiNota,4)
  SELF.AddHistoryField(?TBis:Status,5)
  SELF.AddHistoryField(?TBis:Keterangan,6)
  SELF.AddUpdateFile(Access:TBinstli)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:TBinstli.Open                                     ! File TBinstli used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:TBinstli
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
  INIMgr.Fetch('UpdateTBinstli',QuickWindow)               ! Restore window settings from non-volatile store
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
    Relate:TBinstli.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateTBinstli',QuickWindow)            ! Save window data to non-volatile store
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

