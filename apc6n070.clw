

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N070.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N008.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N015.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N018.INC'),ONCE        !Req'd for module callout resolution
                     END


UpdateApNotaObat PROCEDURE                                 ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
History::APN1:Record LIKE(APN1:RECORD),THREAD
QuickWindow          WINDOW('Update the ApNotaObat File'),AT(,,140,74),FONT('MS Sans Serif',8,,),CENTER,IMM,HLP('UpdateApNotaObat'),SYSTEM,GRAY,RESIZE,MDI
                       PROMPT('Nomor:'),AT(13,12),USE(?APN1:Nomor:Prompt)
                       ENTRY(@s15),AT(46,12,64,10),USE(APN1:Nomor),REQ,UPR
                       BUTTON('F2'),AT(114,11,15,12),USE(?Button3),KEY(F2Key)
                       PROMPT('NIP:'),AT(13,27),USE(?APN1:NIP:Prompt)
                       ENTRY(@s7),AT(46,27,64,10),USE(APN1:NIP),REQ,UPR
                       BUTTON('F3'),AT(114,26,15,12),USE(?CallLookup),KEY(F3Key)
                       BUTTON('&OK'),AT(19,49,45,14),USE(?OK),DEFAULT
                       BUTTON('&Batal'),AT(69,49,45,14),USE(?Cancel)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
    ActionMessage = 'Tambah Data'
  OF ChangeRecord
    ActionMessage = 'Ubah Data'
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateApNotaObat')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APN1:Nomor:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APN1:Record,History::APN1:Record)
  SELF.AddHistoryField(?APN1:Nomor,1)
  SELF.AddHistoryField(?APN1:NIP,2)
  SELF.AddUpdateFile(Access:ApNotaObat)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:APHTRANS.Open                                     ! File SMPegawai used by this procedure, so make sure it's RelationManager is open
  Relate:ApNotaObat.Open                                   ! File SMPegawai used by this procedure, so make sure it's RelationManager is open
  Relate:SMPegawai.SetOpenRelated()
  Relate:SMPegawai.Open                                    ! File SMPegawai used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:ApNotaObat
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel                      ! No confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateApNotaObat',QuickWindow)             ! Restore window settings from non-volatile store
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
    Relate:APHTRANS.Close
    Relate:ApNotaObat.Close
    Relate:SMPegawai.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateApNotaObat',QuickWindow)          ! Save window data to non-volatile store
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


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    SelectPegawai
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
    OF ?Button3
      globalrequest=selectrecord
      SelectAPHTRANS()
      APN1:Nomor  =APH:N0_tran
      APN1:NIP    =APH:NIP
      display
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?APN1:Nomor
      APH:N0_tran=APN1:Nomor
      if access:aphtrans.fetch(APH:by_transaksi)<>level:benign then
         message('No. Transaksi Tidak Ada !!!')
         APN1:Nomor=''
         display
         cycle
      !else
      !   PEGA:Nik=APH:NIP
      !   if access:smpegawai.fetch(PEGA:Pkey)<>level:benign then
      !      message('Pasien bukan Peg. RSI !!!')
      !      APN1:Nomor=''
      !      display
      !      cycle
      !   else
      !      APN1:NIP=PEGA:Nik
      !      display
      !   end
      end
    OF ?APN1:NIP
      IF APN1:NIP OR ?APN1:NIP{Prop:Req}
        PEGA:Nik = APN1:NIP
        IF Access:SMPegawai.TryFetch(PEGA:Pkey)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            APN1:NIP = PEGA:Nik
          ELSE
            SELECT(?APN1:NIP)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      PEGA:Nik = APN1:NIP
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        APN1:NIP = PEGA:Nik
      END
      ThisWindow.Reset(1)
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

SelectAPHTRANS PROCEDURE                                   ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
vl_tanggal           DATE                                  !
BRW1::View:Browse    VIEW(APHTRANS)
                       PROJECT(APH:N0_tran)
                       PROJECT(APH:Nomor_mr)
                       PROJECT(APH:Tanggal)
                       PROJECT(APH:Biaya)
                       PROJECT(APH:NIP)
                       PROJECT(APH:Kode_Apotik)
                       PROJECT(APH:cara_bayar)
                       JOIN(PEGA:Pkey,APH:NIP)
                         PROJECT(PEGA:Nama)
                         PROJECT(PEGA:Nik)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APH:N0_tran            LIKE(APH:N0_tran)              !List box control field - type derived from field
APH:Nomor_mr           LIKE(APH:Nomor_mr)             !List box control field - type derived from field
APH:Tanggal            LIKE(APH:Tanggal)              !List box control field - type derived from field
APH:Biaya              LIKE(APH:Biaya)                !List box control field - type derived from field
APH:NIP                LIKE(APH:NIP)                  !List box control field - type derived from field
PEGA:Nama              LIKE(PEGA:Nama)                !List box control field - type derived from field
APH:Kode_Apotik        LIKE(APH:Kode_Apotik)          !List box control field - type derived from field
APH:cara_bayar         LIKE(APH:cara_bayar)           !List box control field - type derived from field
PEGA:Nik               LIKE(PEGA:Nik)                 !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Transaksi Penjualan Apotik'),AT(,,404,198),FONT('MS Sans Serif',8,,),CENTER,IMM,HLP('SelectAPHTRANS'),SYSTEM,GRAY,RESIZE,MDI
                       ENTRY(@s15),AT(76,180,60,10),USE(APH:N0_tran),MSG('nomor transaksi'),TIP('nomor transaksi')
                       LIST,AT(8,7,392,166),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('64L(2)|M~Nomor~@s15@51R(2)|M~Nomor RM~C(0)@N010_@49R(2)|M~Tanggal~C(0)@D8@58R(2)' &|
   '|M~Biaya~C(0)@n-15.2@33L(2)|M~NIP~C(0)@s7@160L(2)|M~Nama~@s40@20L(18)|M~Kode Apo' &|
   'tik~C(0)@s5@4L(18)|M~cara bayar~C(0)@n1@'),FROM(Queue:Browse:1)
                       BUTTON('&Pilih'),AT(253,180,45,14),USE(?Select:2)
                       BUTTON('&Selesai'),AT(305,180,45,14),USE(?Close)
                       PROMPT('Nomor Transaksi :'),AT(14,180),USE(?APH:N0_tran:Prompt)
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
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
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
  GlobalErrors.SetProcedureName('SelectAPHTRANS')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APH:N0_tran
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Glo::kode_apotik',Glo::kode_apotik)                ! Added by: BrowseBox(ABC)
  BIND('vl_tanggal',vl_tanggal)                            ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  vl_tanggal = TODAY()
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:APHTRANS.Open                                     ! File APHTRANS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:APHTRANS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,APH:by_transaksi)                     ! Add the sort order for APH:by_transaksi for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(?APH:N0_tran,APH:N0_tran,,BRW1) ! Initialize the browse locator using ?APH:N0_tran using key: APH:by_transaksi , APH:N0_tran
  BRW1.SetFilter('(aph:kode_apotik=Glo::kode_apotik and aph:cara_bayar=1 and aph:biaya>0)') ! Apply filter expression to browse
  BRW1.AddField(APH:N0_tran,BRW1.Q.APH:N0_tran)            ! Field APH:N0_tran is a hot field or requires assignment from browse
  BRW1.AddField(APH:Nomor_mr,BRW1.Q.APH:Nomor_mr)          ! Field APH:Nomor_mr is a hot field or requires assignment from browse
  BRW1.AddField(APH:Tanggal,BRW1.Q.APH:Tanggal)            ! Field APH:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(APH:Biaya,BRW1.Q.APH:Biaya)                ! Field APH:Biaya is a hot field or requires assignment from browse
  BRW1.AddField(APH:NIP,BRW1.Q.APH:NIP)                    ! Field APH:NIP is a hot field or requires assignment from browse
  BRW1.AddField(PEGA:Nama,BRW1.Q.PEGA:Nama)                ! Field PEGA:Nama is a hot field or requires assignment from browse
  BRW1.AddField(APH:Kode_Apotik,BRW1.Q.APH:Kode_Apotik)    ! Field APH:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(APH:cara_bayar,BRW1.Q.APH:cara_bayar)      ! Field APH:cara_bayar is a hot field or requires assignment from browse
  BRW1.AddField(PEGA:Nik,BRW1.Q.PEGA:Nik)                  ! Field PEGA:Nik is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectAPHTRANS',QuickWindow)               ! Restore window settings from non-volatile store
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
    Relate:APHTRANS.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectAPHTRANS',QuickWindow)            ! Save window data to non-volatile store
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

BrowseNotaObatPegawai PROCEDURE                            ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
vl_total             REAL                                  !
vl_grand_total       REAL                                  !
BRW1::View:Browse    VIEW(ApNotaObat)
                       PROJECT(APN1:Nomor)
                       PROJECT(APN1:NIP)
                       JOIN(PEGA:Pkey,APN1:NIP)
                         PROJECT(PEGA:Nama)
                         PROJECT(PEGA:Nik)
                       END
                       JOIN(APH:by_transaksi,APN1:Nomor)
                         PROJECT(APH:Tanggal)
                         PROJECT(APH:Biaya)
                         PROJECT(APH:Kode_Apotik)
                         PROJECT(APH:N0_tran)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APN1:Nomor             LIKE(APN1:Nomor)               !List box control field - type derived from field
APN1:NIP               LIKE(APN1:NIP)                 !List box control field - type derived from field
PEGA:Nama              LIKE(PEGA:Nama)                !List box control field - type derived from field
APH:Tanggal            LIKE(APH:Tanggal)              !List box control field - type derived from field
APH:Biaya              LIKE(APH:Biaya)                !List box control field - type derived from field
APH:Kode_Apotik        LIKE(APH:Kode_Apotik)          !List box control field - type derived from field
PEGA:Nik               LIKE(PEGA:Nik)                 !Related join file key field - type derived from field
APH:N0_tran            LIKE(APH:N0_tran)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(APDTRANS)
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
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
APD:Kode_brg           LIKE(APD:Kode_brg)             !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
APD:Jumlah             LIKE(APD:Jumlah)               !List box control field - type derived from field
APD:Total              LIKE(APD:Total)                !List box control field - type derived from field
APD:Diskon             LIKE(APD:Diskon)               !List box control field - type derived from field
vl_total               LIKE(vl_total)                 !List box control field - type derived from local data
APD:N0_tran            LIKE(APD:N0_tran)              !List box control field - type derived from field
APD:Camp               LIKE(APD:Camp)                 !Primary key field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Nota Obat'),AT(,,417,257),FONT('MS Sans Serif',8,,),CENTER,IMM,HLP('BrowseNotaObatPegawai'),SYSTEM,GRAY,RESIZE,MDI
                       LIST,AT(8,20,397,90),USE(?Browse:1),IMM,VSCROLL,MSG('Browsing Records'),FORMAT('67L(2)|M~Nomor~@s15@34L(2)|M~NIP~@s7@165L(2)|M~Nama~@s40@53L(2)|M~Tanggal~@D06@6' &|
   '5R(2)|M~Biaya~L@n-15.2@46L(2)|M~Kode Apotik~@s5@'),FROM(Queue:Browse:1)
                       BUTTON('&Tambah'),AT(83,113,45,14),USE(?Insert:2)
                       BUTTON('&Ubah'),AT(131,113,45,14),USE(?Change:2)
                       BUTTON('&Hapus'),AT(181,113,45,14),USE(?Delete:2)
                       SHEET,AT(4,4,405,127),USE(?CurrentTab)
                         TAB('Nomor (F2)'),USE(?Tab:2)
                           PROMPT('Grand Total:'),AT(281,115),USE(?vl_grand_total:Prompt)
                           ENTRY(@n-15.2),AT(331,115,60,10),USE(vl_grand_total),DECIMAL(14)
                         END
                         TAB('NIP (F3)'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Selesai'),AT(230,113,45,14),USE(?Close)
                       LIST,AT(6,135,405,100),USE(?List),IMM,VSCROLL,MSG('Browsing Records'),FORMAT('42L|M~Kode Obat~@s10@142L|M~Nama Barang~@s40@34R|M~Jumlah~L@n-10@55R|M~Total~L@n' &|
   '-15.2@53R|M~Diskon~L@n-15.2@54R|M~Total Bersih~L@n-15.2@64R|M~Nomor~L@s15@'),FROM(Queue:Browse)
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
ResetFromView          PROCEDURE(),DERIVED                 ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW5                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
SetQueueRecord         PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW5::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
  GlobalErrors.SetProcedureName('BrowseNotaObatPegawai')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Glo::kode_apotik',Glo::kode_apotik)                ! Added by: BrowseBox(ABC)
  BIND('vl_total',vl_total)                                ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:APDTRANS.Open                                     ! File SMPegawai used by this procedure, so make sure it's RelationManager is open
  Relate:ApNotaObat.Open                                   ! File SMPegawai used by this procedure, so make sure it's RelationManager is open
  Relate:SMPegawai.SetOpenRelated()
  Relate:SMPegawai.Open                                    ! File SMPegawai used by this procedure, so make sure it's RelationManager is open
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:ApNotaObat,SELF) ! Initialize the browse manager
  BRW5.Init(?List,Queue:Browse.ViewPosition,BRW5::View:Browse,Queue:Browse,Relate:APDTRANS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,APN1:Pegawai_APNotaObat_FK)           ! Add the sort order for APN1:Pegawai_APNotaObat_FK for sort order 1
  BRW1.SetFilter('(aph:kode_apotik=Glo::kode_apotik)')     ! Apply filter expression to browse
  BRW1.AddSortOrder(,APN1:PrimaryKey)                      ! Add the sort order for APN1:PrimaryKey for sort order 2
  BRW1.SetFilter('(aph:kode_apotik=Glo::kode_apotik)')     ! Apply filter expression to browse
  BRW1.AddField(APN1:Nomor,BRW1.Q.APN1:Nomor)              ! Field APN1:Nomor is a hot field or requires assignment from browse
  BRW1.AddField(APN1:NIP,BRW1.Q.APN1:NIP)                  ! Field APN1:NIP is a hot field or requires assignment from browse
  BRW1.AddField(PEGA:Nama,BRW1.Q.PEGA:Nama)                ! Field PEGA:Nama is a hot field or requires assignment from browse
  BRW1.AddField(APH:Tanggal,BRW1.Q.APH:Tanggal)            ! Field APH:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(APH:Biaya,BRW1.Q.APH:Biaya)                ! Field APH:Biaya is a hot field or requires assignment from browse
  BRW1.AddField(APH:Kode_Apotik,BRW1.Q.APH:Kode_Apotik)    ! Field APH:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(PEGA:Nik,BRW1.Q.PEGA:Nik)                  ! Field PEGA:Nik is a hot field or requires assignment from browse
  BRW1.AddField(APH:N0_tran,BRW1.Q.APH:N0_tran)            ! Field APH:N0_tran is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse
  BRW5.AddSortOrder(,APD:notran_kode)                      ! Add the sort order for APD:notran_kode for sort order 1
  BRW5.AddRange(APD:N0_tran,Relate:APDTRANS,Relate:APHTRANS) ! Add file relationship range limit for sort order 1
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort0:Locator.Init(,APD:Kode_brg,,BRW5)            ! Initialize the browse locator using  using key: APD:notran_kode , APD:Kode_brg
  BRW5.SetFilter('(APD:N0_tran<<>'''')')                   ! Apply filter expression to browse
  BRW5.AddField(APD:Kode_brg,BRW5.Q.APD:Kode_brg)          ! Field APD:Kode_brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Nama_Brg,BRW5.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW5.AddField(APD:Jumlah,BRW5.Q.APD:Jumlah)              ! Field APD:Jumlah is a hot field or requires assignment from browse
  BRW5.AddField(APD:Total,BRW5.Q.APD:Total)                ! Field APD:Total is a hot field or requires assignment from browse
  BRW5.AddField(APD:Diskon,BRW5.Q.APD:Diskon)              ! Field APD:Diskon is a hot field or requires assignment from browse
  BRW5.AddField(vl_total,BRW5.Q.vl_total)                  ! Field vl_total is a hot field or requires assignment from browse
  BRW5.AddField(APD:N0_tran,BRW5.Q.APD:N0_tran)            ! Field APD:N0_tran is a hot field or requires assignment from browse
  BRW5.AddField(APD:Camp,BRW5.Q.APD:Camp)                  ! Field APD:Camp is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Kode_brg,BRW5.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseNotaObatPegawai',QuickWindow)        ! Restore window settings from non-volatile store
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
    Relate:APDTRANS.Close
    Relate:ApNotaObat.Close
    Relate:SMPegawai.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseNotaObatPegawai',QuickWindow)     ! Save window data to non-volatile store
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
    UpdateApNotaObat
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
    OF ?Change:2
      ThisWindow.Update
      if upper(clip(VG_USER))<>'ADI' then
         if APH:Tanggal<today() then
            message('tanggal transaksi bukan hari ini ! data tidak bisa diubah !')
            cycle
         end                   
      end
    OF ?Delete:2
      ThisWindow.Update
      if upper(clip(VG_USER))<>'ADI' then
         if APH:Tanggal<today() then
            message('tanggal transaksi bukan hari ini ! data tidak bisa diubah !')
            cycle
         end                   
      end
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


BRW1.ResetFromView PROCEDURE

vl_grand_total:Sum   REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:ApNotaObat.SetQuickScan(1)
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
    vl_grand_total:Sum += APH:Biaya
  END
  vl_grand_total = vl_grand_total:Sum
  PARENT.ResetFromView
  Relate:ApNotaObat.SetQuickScan(0)
  SETCURSOR()


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


BRW5.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW5.SetQueueRecord PROCEDURE

  CODE
  vl_total = APD:Total - APD:Diskon
  PARENT.SetQueueRecord
  
  SELF.Q.vl_total = vl_total                               !Assign formula result to display queue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

BrowseApNotaManual PROCEDURE                               ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(ApNotaManual)
                       PROJECT(APN:Kode_Apotik)
                       PROJECT(APN:Tanggal)
                       PROJECT(APN:Status)
                       PROJECT(APN:Jenis_Pasien)
                       PROJECT(APN:Jumlah_R)
                       PROJECT(APN:Jumlah_Lbr)
                       PROJECT(APN:Jumlah_Rupiah)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APN:Kode_Apotik        LIKE(APN:Kode_Apotik)          !List box control field - type derived from field
APN:Tanggal            LIKE(APN:Tanggal)              !List box control field - type derived from field
APN:Status             LIKE(APN:Status)               !List box control field - type derived from field
APN:Jenis_Pasien       LIKE(APN:Jenis_Pasien)         !List box control field - type derived from field
APN:Jumlah_R           LIKE(APN:Jumlah_R)             !List box control field - type derived from field
APN:Jumlah_Lbr         LIKE(APN:Jumlah_Lbr)           !List box control field - type derived from field
APN:Jumlah_Rupiah      LIKE(APN:Jumlah_Rupiah)        !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Nota Manual'),AT(,,358,260),FONT('MS Sans Serif',8,,),CENTER,IMM,HLP('BrowseApNotaManual'),SYSTEM,GRAY,RESIZE,MDI
                       LIST,AT(8,20,342,215),USE(?Browse:1),IMM,HVSCROLL,FONT(,8,COLOR:Navy,FONT:regular),MSG('Browsing Records'),FORMAT('48L(2)|M~Kode Apotik~@s5@80R(2)|M~Tanggal~C(0)@d06@28R(2)|M~Status~C(0)@n3@52R(2' &|
   ')|M~Jenis Pasien~C(0)@n3@64R(2)|M~Jumlah R~C(0)@n-14@64R(2)|M~Jumlah Lbr~C(0)@n-' &|
   '14@64D(12)|M~Jumlah Rupiah~C(0)@n15.2@'),FROM(Queue:Browse:1)
                       BUTTON('&Tambah'),AT(38,239,45,14),USE(?Insert:2)
                       BUTTON('&Ubah'),AT(86,239,45,14),USE(?Change:2),DEFAULT
                       BUTTON('&Hapus'),AT(136,239,45,14),USE(?Delete:2)
                       SHEET,AT(4,4,350,253),USE(?CurrentTab)
                         TAB('&Kode'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Selesai'),AT(244,239,45,14),USE(?Close)
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
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
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
  GlobalErrors.SetProcedureName('BrowseApNotaManual')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  WindowTanggal12()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('VG_TANGGAL1',VG_TANGGAL1)                          ! Added by: BrowseBox(ABC)
  BIND('VG_TANGGAL2',VG_TANGGAL2)                          ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:ApNotaManual.Open                                 ! File GApotik used by this procedure, so make sure it's RelationManager is open
  Relate:GApotik.SetOpenRelated()
  Relate:GApotik.Open                                      ! File GApotik used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:ApNotaManual,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon APN:Kode_Apotik for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,APN:Apotik_ApNotaManual_FK) ! Add the sort order for APN:Apotik_ApNotaManual_FK for sort order 1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon APN:Kode_Apotik for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,APN:PrimaryKey)  ! Add the sort order for APN:PrimaryKey for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,APN:Kode_Apotik,1,BRW1)        ! Initialize the browse locator using  using key: APN:PrimaryKey , APN:Kode_Apotik
  BRW1.SetFilter('(apn:tanggal>=VG_TANGGAL1 and apn:tanggal<<=VG_TANGGAL2)') ! Apply filter expression to browse
  BRW1.AddField(APN:Kode_Apotik,BRW1.Q.APN:Kode_Apotik)    ! Field APN:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(APN:Tanggal,BRW1.Q.APN:Tanggal)            ! Field APN:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(APN:Status,BRW1.Q.APN:Status)              ! Field APN:Status is a hot field or requires assignment from browse
  BRW1.AddField(APN:Jenis_Pasien,BRW1.Q.APN:Jenis_Pasien)  ! Field APN:Jenis_Pasien is a hot field or requires assignment from browse
  BRW1.AddField(APN:Jumlah_R,BRW1.Q.APN:Jumlah_R)          ! Field APN:Jumlah_R is a hot field or requires assignment from browse
  BRW1.AddField(APN:Jumlah_Lbr,BRW1.Q.APN:Jumlah_Lbr)      ! Field APN:Jumlah_Lbr is a hot field or requires assignment from browse
  BRW1.AddField(APN:Jumlah_Rupiah,BRW1.Q.APN:Jumlah_Rupiah) ! Field APN:Jumlah_Rupiah is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseApNotaManual',QuickWindow)           ! Restore window settings from non-volatile store
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
    Relate:ApNotaManual.Close
    Relate:GApotik.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseApNotaManual',QuickWindow)        ! Save window data to non-volatile store
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
    UpdateApNotaManual
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

UpdateApNotaManual PROCEDURE                               ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
History::APN:Record  LIKE(APN:RECORD),THREAD
QuickWindow          WINDOW('Update the ApNotaManual File'),AT(,,180,227),FONT('MS Sans Serif',8,,),CENTER,IMM,HLP('UpdateApNotaManual'),SYSTEM,GRAY,RESIZE,MDI
                       SHEET,AT(4,4,172,195),USE(?CurrentTab)
                         TAB('General'),USE(?Tab:1)
                           PROMPT('Kode Apotik:'),AT(8,20),USE(?APN:Kode_Apotik:Prompt)
                           ENTRY(@s5),AT(68,20,40,10),USE(APN:Kode_Apotik)
                           BUTTON('F2'),AT(109,19,12,12),USE(?CallLookup),KEY(F2Key)
                           PROMPT('Tanggal:'),AT(8,34),USE(?APN:Tanggal:Prompt)
                           ENTRY(@d06),AT(68,34,104,10),USE(APN:Tanggal)
                           OPTION('Status'),AT(68,48,50,48),USE(APN:Status),BOXED
                             RADIO('Pagi'),AT(72,58),USE(?APN:Status:Radio1),VALUE('1')
                             RADIO('Sore'),AT(72,70),USE(?APN:Status:Radio2),VALUE('2')
                             RADIO('Malam'),AT(72,82),USE(?APN:Status:Radio3),VALUE('3')
                           END
                           OPTION('Jenis Pasien'),AT(68,100,50,48),USE(APN:Jenis_Pasien),BOXED
                             RADIO('Pegawai'),AT(72,110),USE(?APN:Jenis_Pasien:Radio1),VALUE('1')
                             RADIO('Umum'),AT(72,122),USE(?APN:Jenis_Pasien:Radio2),VALUE('2')
                             RADIO('Kontraktor'),AT(72,134),USE(?APN:Jenis_Pasien:Radio3),VALUE('3')
                           END
                           PROMPT('Jumlah R:'),AT(8,152),USE(?APN:Jumlah_R:Prompt)
                           ENTRY(@n-14),AT(68,152,64,10),USE(APN:Jumlah_R),RIGHT(1)
                           PROMPT('Jumlah Lbr:'),AT(7,166),USE(?APN:Jumlah_Lbr:Prompt)
                           ENTRY(@n-14),AT(67,166,64,10),USE(APN:Jumlah_Lbr),RIGHT(1)
                           PROMPT('Jumlah Rupiah:'),AT(7,180),USE(?APN:Jumlah_Rupiah:Prompt)
                           ENTRY(@n15.2),AT(67,180,64,10),USE(APN:Jumlah_Rupiah),DECIMAL(14)
                         END
                       END
                       BUTTON('&OK'),AT(40,206,45,14),USE(?OK),DEFAULT
                       BUTTON('&Batal'),AT(88,206,45,14),USE(?Cancel)
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
    ActionMessage = 'Tambah Data'
  OF ChangeRecord
    ActionMessage = 'Ubah Data'
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateApNotaManual')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APN:Kode_Apotik:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APN:Record,History::APN:Record)
  SELF.AddHistoryField(?APN:Kode_Apotik,1)
  SELF.AddHistoryField(?APN:Tanggal,2)
  SELF.AddHistoryField(?APN:Status,3)
  SELF.AddHistoryField(?APN:Jenis_Pasien,4)
  SELF.AddHistoryField(?APN:Jumlah_R,5)
  SELF.AddHistoryField(?APN:Jumlah_Lbr,6)
  SELF.AddHistoryField(?APN:Jumlah_Rupiah,7)
  SELF.AddUpdateFile(Access:ApNotaManual)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:ApNotaManual.Open                                 ! File ApNotaManual used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:ApNotaManual
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
  INIMgr.Fetch('UpdateApNotaManual',QuickWindow)           ! Restore window settings from non-volatile store
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
    Relate:ApNotaManual.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateApNotaManual',QuickWindow)        ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
    APN:Tanggal = today()
    APN:Status = 1
    APN:Jenis_Pasien = 1
  PARENT.PrimeFields


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  GAPO:Kode_Apotik = APN:Kode_Apotik                       ! Assign linking field value
  Access:GApotik.Fetch(GAPO:KeyNoApotik)
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
    SelectApotik
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
    OF ?APN:Kode_Apotik
      IF APN:Kode_Apotik OR ?APN:Kode_Apotik{Prop:Req}
        GAPO:Kode_Apotik = APN:Kode_Apotik
        IF Access:GApotik.TryFetch(GAPO:KeyNoApotik)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            APN:Kode_Apotik = GAPO:Kode_Apotik
          ELSE
            SELECT(?APN:Kode_Apotik)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      GAPO:Kode_Apotik = APN:Kode_Apotik
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        APN:Kode_Apotik = GAPO:Kode_Apotik
      END
      ThisWindow.Reset(1)
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

