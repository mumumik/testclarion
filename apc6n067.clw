

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N067.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N008.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N066.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N068.INC'),ONCE        !Req'd for module callout resolution
                     END


UpdateEtiketTrans PROCEDURE                                ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
tombol_ok            BYTE                                  !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
vl_total             REAL                                  !
vl_diskon_pct        REAL                                  !
vl_jumlah1           STRING(10)                            !
vl_jumlah2           STRING(10)                            !
vl_keterangan        BYTE                                  !
vl_keterangan2       BYTE                                  !
History::APD:Record  LIKE(APD:RECORD),THREAD
QuickWindow          WINDOW('Tambah Data Transaksi'),AT(,,231,131),FONT('Times New Roman',10,COLOR:Black,FONT:regular),IMM,HLP('UpdateAPDTRANS'),SYSTEM,GRAY,RESIZE,MDI
                       SHEET,AT(4,4,223,94),USE(?CurrentTab),FONT(,,COLOR:Blue,),COLOR(0D9D900H)
                         TAB('Data'),USE(?Tab:1)
                           PROMPT('Kode Barang:'),AT(8,20),USE(?APD:Kode_brg:Prompt)
                           PROMPT('Nama Barang'),AT(8,33),USE(?Prompt4)
                           ENTRY(@s10),AT(69,20,44,10),USE(APD:Kode_brg),DISABLE,MSG('Kode Barang'),TIP('Kode Barang')
                           STRING(@s40),AT(69,33),USE(GBAR:Nama_Brg)
                           PROMPT('Etiket:'),AT(8,45),USE(?APD:Jum1:Prompt)
                           ENTRY(@s10),AT(69,45,55,10),USE(vl_jumlah1),RIGHT(1)
                           PROMPT('X'),AT(126,45),USE(?APD:Jum2:Prompt)
                           ENTRY(@s10),AT(135,45,55,10),USE(vl_jumlah2),RIGHT(1)
                           PROMPT('Cara / Waktu :'),AT(8,75),USE(?APD2:Keterangan2:Prompt)
                           ENTRY(@n3),AT(69,60,25,10),USE(vl_keterangan)
                           BUTTON('F7'),AT(96,59,12,12),USE(?CallLookup:2),KEY(F7Key)
                           ENTRY(@n3),AT(69,75,25,10),USE(vl_keterangan2)
                           PROMPT('Jumlah Takaran:'),AT(8,60),USE(?APD2:Keterangan:Prompt)
                           BUTTON('F8'),AT(96,74,12,12),USE(?CallLookup:3),KEY(F8Key)
                           ENTRY(@s30),AT(110,75,103,10),USE(Ape1:Nama),DISABLE,REQ
                           ENTRY(@s30),AT(110,60,103,10),USE(Ape:Nama),DISABLE,REQ
                         END
                       END
                       BUTTON('&OK [End]'),AT(45,103,63,24),USE(?OK),LEFT,KEY(EndKey),ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(119,103,63,24),USE(?Cancel),LEFT,ICON(ICON:Cross)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
    CLEAR(ActionMessage)
  OF ChangeRecord
    CLEAR(ActionMessage)
  END
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateEtiketTrans')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APD:Kode_brg:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APD:Record,History::APD:Record)
  SELF.AddHistoryField(?APD:Kode_brg,2)
  SELF.AddUpdateFile(Access:APDTRANS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:APDTRANS.Open                                     ! File Apetiket1 used by this procedure, so make sure it's RelationManager is open
  Relate:APDTRANSDet.Open                                  ! File Apetiket1 used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket.Open                                     ! File Apetiket1 used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket1.Open                                    ! File Apetiket1 used by this procedure, so make sure it's RelationManager is open
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APOBKONT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:APDTRANS
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.DeleteAction = Delete:Auto                        ! Automatic deletions
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel                      ! No confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  if self.request=2 then
     APD2:N0_tran    =APD:N0_tran
     APD2:Kode_brg   =APD:Kode_brg
     access:apdtransdet.fetch(APD2:KEY1)
     Ape:No          =APD2:Keterangan
     access:apetiket.fetch(Ape:KEY1)
     Ape1:No          =APD2:Keterangan2
     access:apetiket1.fetch(Ape1:KEY1)
     vl_keterangan   =APD2:Keterangan
     vl_jumlah1      =APD2:Jumlah1
     vl_jumlah2      =APD2:Jumlah2
     if APD2:Keterangan2<>'' then
        vl_keterangan2  =APD2:Keterangan2
     else
        vl_keterangan2  ='0'
     end
     display
  end
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateEtiketTrans',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  if self.response=1 then
     APD2:N0_tran     =APD:N0_tran
     APD2:Kode_brg    =APD:Kode_brg
     if access:apdtransdet.fetch(APD2:KEY1)<>level:benign then
        APD2:N0_tran     =APD:N0_tran
        APD2:Kode_brg    =APD:Kode_brg
        APD2:Camp        =APD:Camp
        APD2:Keterangan  =vl_keterangan
        APD2:Jumlah1     =vl_jumlah1
        APD2:Jumlah2     =vl_jumlah2
        APD2:Keterangan2 =vl_keterangan2
        access:apdtransdet.insert()
     else
        APD2:Keterangan  =vl_keterangan
        APD2:Jumlah1     =vl_jumlah1
        APD2:Jumlah2     =vl_jumlah2
        APD2:Keterangan2 =vl_keterangan2
        access:apdtransdet.update()
     end
  end
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:APDTRANSDet.Close
    Relate:Apetiket.Close
    Relate:Apetiket1.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateEtiketTrans',QuickWindow)         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


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
    EXECUTE Number
      SelectEtiket1
      SelectEtiket2
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?vl_keterangan
      IF vl_keterangan OR ?vl_keterangan{Prop:Req}
        Ape:No = vl_keterangan
        IF Access:Apetiket.TryFetch(Ape:KEY1)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            vl_keterangan = Ape:No
          ELSE
            SELECT(?vl_keterangan)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup:2
      ThisWindow.Update
      Ape:No = vl_keterangan
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        vl_keterangan = Ape:No
      END
      ThisWindow.Reset(1)
    OF ?vl_keterangan2
      IF vl_keterangan2 OR ?vl_keterangan2{Prop:Req}
        Ape1:No = vl_keterangan2
        IF Access:Apetiket1.TryFetch(Ape1:KEY1)
          IF SELF.Run(2,SelectRecord) = RequestCompleted
            vl_keterangan2 = Ape1:No
          ELSE
            SELECT(?vl_keterangan2)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup:3
      ThisWindow.Update
      Ape1:No = vl_keterangan2
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        vl_keterangan2 = Ape1:No
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

SelectEtiket2 PROCEDURE                                    ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(Apetiket1)
                       PROJECT(Ape1:No)
                       PROJECT(Ape1:Nama)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Ape1:No                LIKE(Ape1:No)                  !List box control field - type derived from field
Ape1:Nama              LIKE(Ape1:Nama)                !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Waktu / Cara Pemberian Obat'),AT(,,221,260),FONT('MS Sans Serif',8,,),IMM,HLP('SelectEtiket1'),SYSTEM,GRAY,RESIZE,MDI
                       ENTRY(@s30),AT(59,247,60,10),USE(Ape1:Nama),REQ
                       LIST,AT(8,4,208,236),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('12L|M~No~@n3@120L|M~Nama~@s30@'),FROM(Queue:Browse:1)
                       PROMPT('Nama:'),AT(9,247),USE(?Ape:Nama:Prompt)
                       BUTTON('&Pilih'),AT(125,245,45,14),USE(?Select:2)
                       BUTTON('&Selesai'),AT(173,245,45,14),USE(?Close)
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
  GlobalErrors.SetProcedureName('SelectEtiket2')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Ape1:Nama
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Ape1:No',Ape1:No)                                  ! Added by: BrowseBox(ABC)
  BIND('Ape1:Nama',Ape1:Nama)                              ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:Apetiket1.Open                                    ! File Apetiket1 used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Apetiket1,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,Ape1:nama_etiket1_key)                ! Add the sort order for Ape1:nama_etiket1_key for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(?Ape1:Nama,Ape1:Nama,1,BRW1)    ! Initialize the browse locator using ?Ape1:Nama using key: Ape1:nama_etiket1_key , Ape1:Nama
  BRW1.AddField(Ape1:No,BRW1.Q.Ape1:No)                    ! Field Ape1:No is a hot field or requires assignment from browse
  BRW1.AddField(Ape1:Nama,BRW1.Q.Ape1:Nama)                ! Field Ape1:Nama is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectEtiket2',QuickWindow)                ! Restore window settings from non-volatile store
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
    Relate:Apetiket1.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectEtiket2',QuickWindow)             ! Save window data to non-volatile store
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

BrowseEtiketTrans PROCEDURE                                ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
loc::thread          BYTE                                  !
Lunas                STRING(5)                             !
Poliklinik           STRING(1)                             !
LOC::No_transaksi    STRING(15)                            !Nomor Transaksi
BRW1::View:Browse    VIEW(APHTRANS)
                       PROJECT(APH:Nomor_mr)
                       PROJECT(APH:Tanggal)
                       PROJECT(APH:Biaya)
                       PROJECT(APH:N0_tran)
                       PROJECT(APH:Kode_Apotik)
                       PROJECT(APH:Asal)
                       PROJECT(APH:User)
                       PROJECT(APH:cara_bayar)
                       PROJECT(APH:dokter)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APH:Nomor_mr           LIKE(APH:Nomor_mr)             !List box control field - type derived from field
APH:Tanggal            LIKE(APH:Tanggal)              !List box control field - type derived from field
APH:Biaya              LIKE(APH:Biaya)                !List box control field - type derived from field
APH:N0_tran            LIKE(APH:N0_tran)              !List box control field - type derived from field
APH:N0_tran_NormalFG   LONG                           !Normal forground color
APH:N0_tran_NormalBG   LONG                           !Normal background color
APH:N0_tran_SelectedFG LONG                           !Selected forground color
APH:N0_tran_SelectedBG LONG                           !Selected background color
APH:Kode_Apotik        LIKE(APH:Kode_Apotik)          !List box control field - type derived from field
APH:Asal               LIKE(APH:Asal)                 !List box control field - type derived from field
APH:User               LIKE(APH:User)                 !List box control field - type derived from field
APH:cara_bayar         LIKE(APH:cara_bayar)           !List box control field - type derived from field
APH:dokter             LIKE(APH:dokter)               !List box control field - type derived from field
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
QuickWindow          WINDOW('Etiket'),AT(,,457,234),FONT('Times New Roman',8,,),CENTER,IMM,HLP('Tran_Poliklinik'),SYSTEM,GRAY,RESIZE,MDI
                       ELLIPSE,AT(207,1,23,17),USE(?Ellipse1),COLOR(COLOR:Red),FILL(COLOR:Red)
                       ELLIPSE,AT(290,1,23,17),USE(?Ellipse1:2),COLOR(0FF8000H),FILL(0FF8000H)
                       STRING('= Retur Obat'),AT(235,5),USE(?String1)
                       BUTTON('T&ransaksi (Ins)'),AT(316,42,83,26),USE(?Insert:3),DISABLE,HIDE,LEFT,FONT('Times New Roman',12,COLOR:Blue,FONT:regular),KEY(InsertKey),ICON(ICON:Open)
                       LIST,AT(10,25,435,69),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('48L|FM~Nomor RM~C@N010_@47R(1)|M~Tanggal~C(0)@D06@51R(1)|M~Biaya~C(0)@n-14@64L|M' &|
   '*~No. Transaksi~C@s15@43L|M~Kode Apotik~@s5@44L|M~Asal~@s10@25L|M~User~@s4@38L|M' &|
   '~cara bayar~@n1@20L|M~dokter~@s5@'),FROM(Queue:Browse:1)
                       LIST,AT(5,117,443,89),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('52L|FM~Kode Barang~C@s10@160L|FM~Nama Obat~C@s40@71D(14)|M~Jumlah~C(0)@n-10.2@63' &|
   'D(14)|M~Total~C(0)@n-15.2@60R(2)|M~Diskon~C(0)@n-15.2@60L~Camp~C@n2@60L~N 0 tran' &|
   '~C@s15@'),FROM(Queue:Browse)
                       BUTTON('Cetak Etiket Semua Item ZEBRA'),AT(17,213,115,14),USE(?Button10:4)
                       BUTTON('&Insert'),AT(139,174,42,17),USE(?Insert),DISABLE,HIDE
                       BUTTON('&Ubah'),AT(309,211,42,17),USE(?Change),DEFAULT
                       BUTTON('&Delete'),AT(229,174,42,17),USE(?Delete),DISABLE,HIDE
                       BUTTON('&Select'),AT(271,41,45,14),USE(?Select:2),HIDE
                       BUTTON('&Change'),AT(221,41,45,14),USE(?Change:3),DISABLE,HIDE
                       BUTTON('&Delete'),AT(171,41,45,14),USE(?Delete:3),DISABLE,HIDE
                       SHEET,AT(5,8,445,107),USE(?CurrentTab)
                         TAB('No. Nota RM [F2]'),USE(?Tab:2),KEY(F2Key),FONT('Times New Roman',10,COLOR:Black,)
                           PROMPT('Nomor Transaksi :'),AT(13,98),USE(?LOC::No_transaksi:Prompt),FONT('Times New Roman',10,,)
                           ENTRY(@s15),AT(78,97,71,13),USE(LOC::No_transaksi),FONT('Times New Roman',10,,),MSG('Nomor Transaksi'),TIP('Nomor Transaksi')
                           BUTTON('Cetak Etiket Semua Item'),AT(258,97,89,14),USE(?Button10)
                           BUTTON('Cetak Etiket Per Item'),AT(350,97,89,14),USE(?Button10:2)
                           BUTTON('Cetak Semua 1 Printout'),AT(155,97,99,14),USE(?Button10:3)
                         END
                         TAB('Nomor RM [F3]'),USE(?Tab:3),KEY(F3Key),FONT('Times New Roman',10,COLOR:Black,)
                         END
                       END
                       STRING('= Keluar Obat'),AT(316,5),USE(?String1:2)
                       BUTTON('&Tutup'),AT(360,211,83,17),USE(?Close),LEFT,ICON(ICON:Cross)
                       BUTTON('Cetak Etiket Per Item ZEBRA'),AT(135,213,115,14),USE(?Button10:5)
                       BUTTON('Help'),AT(321,41,45,14),USE(?Help),HIDE,STD(STD:Help)
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
BRW1::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW1::Sort1:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW6                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
                     END

BRW6::Sort0:Locator  StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False) ! Method added to host embed code
                     END

view::sql view(filesql)
            project(FIL:FString1)
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

ThisWindow.Ask PROCEDURE

  CODE
  ! untuk mengambil data setup persentase
  SHARE(ISetupAp)
  IF ERRORCODE() OR RECORDS(ISetupAp) = 0 THEN
     MESSAGE ('Jalankan menu SET UP dahulu')
     POST(EVENT:CloseWindow)
  END
  Iset:deskripsi = 'Bea_R'
  Get(IsetupAp,Iset:by_deskripsi)
  GL_beaR = Iset:Nilai
  Iset:deskripsi = 'KLS_UC'
  Get(IsetupAp,Iset:by_deskripsi)
  GL_Um_kls1 = Iset:Nilai
  Iset:deskripsi = 'KLS_UN'
  Get(IsetupAp,Iset:by_deskripsi)
  GL_nt_kls2 = Iset:Nilai
  Iset:deskripsi = 'PPN'
  Get(IsetupAp,Iset:by_deskripsi)
  GL_PPN = Iset:Nilai
  Access:ISetupAp.Close()
  ! Untuk tambah 2 data di GBarang, yaitu _campur dan _ biaya ( untuk obat campur )
  GBAR:Kode_brg = '_Campur'
  IF Access:GBarang.Fetch(GBAR:KeyKodeBrg) <> level:benign THEN
      GBAR:Kode_brg = '_Campur'
      GBAR:Nama_Brg = 'Total Obat Campur'
      Access:GBarang.Insert()
  END
  GBAR:Kode_brg = '_Biaya'
  IF Access:GBarang.Fetch(GBAR:KeyKodeBrg) <> level:benign
      GBAR:Kode_brg = '_Biaya'
      GBAR:Nama_Brg = 'Biaya Obat Campur'
      Access:GBarang.Insert()
  END
  ! Untuk transaksi rutine, jika ada discount
  GBAR:Kode_brg = '_Disc'
  IF Access:GBarang.Fetch(GBAR:KeyKodeBrg) <> level:benign
      GBAR:Kode_brg = '_Disc'
      GBAR:Nama_Brg = 'Discount'
      Access:GBarang.Insert()
  END
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowseEtiketTrans')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Ellipse1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  loc::thread=glo::mainthreadno
  !POST(EVENT:Disable_RJalan,,loc::thread)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:APDTRANS.Open                                     ! File APDTRANSDet used by this procedure, so make sure it's RelationManager is open
  Relate:APDTRANSDet.Open                                  ! File APDTRANSDet used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket.Open                                     ! File APDTRANSDet used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket1.Open                                    ! File APDTRANSDet used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql.Open                                      ! File APDTRANSDet used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
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
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,APH:Nomor_mr,1,BRW1)           ! Initialize the browse locator using  using key: APH:by_medrec , APH:Nomor_mr
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon APH:N0_tran for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,APH:by_transaksi) ! Add the sort order for APH:by_transaksi for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?LOC::No_transaksi,APH:N0_tran,,BRW1) ! Initialize the browse locator using ?LOC::No_transaksi using key: APH:by_transaksi , APH:N0_tran
  BRW1.AddField(APH:Nomor_mr,BRW1.Q.APH:Nomor_mr)          ! Field APH:Nomor_mr is a hot field or requires assignment from browse
  BRW1.AddField(APH:Tanggal,BRW1.Q.APH:Tanggal)            ! Field APH:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(APH:Biaya,BRW1.Q.APH:Biaya)                ! Field APH:Biaya is a hot field or requires assignment from browse
  BRW1.AddField(APH:N0_tran,BRW1.Q.APH:N0_tran)            ! Field APH:N0_tran is a hot field or requires assignment from browse
  BRW1.AddField(APH:Kode_Apotik,BRW1.Q.APH:Kode_Apotik)    ! Field APH:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(APH:Asal,BRW1.Q.APH:Asal)                  ! Field APH:Asal is a hot field or requires assignment from browse
  BRW1.AddField(APH:User,BRW1.Q.APH:User)                  ! Field APH:User is a hot field or requires assignment from browse
  BRW1.AddField(APH:cara_bayar,BRW1.Q.APH:cara_bayar)      ! Field APH:cara_bayar is a hot field or requires assignment from browse
  BRW1.AddField(APH:dokter,BRW1.Q.APH:dokter)              ! Field APH:dokter is a hot field or requires assignment from browse
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
  INIMgr.Fetch('BrowseEtiketTrans',QuickWindow)            ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW6.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW6.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW6.ToolbarItem.HelpButton = ?Help
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:APDTRANSDet.Close
    Relate:Apetiket.Close
    Relate:Apetiket1.Close
    Relate:FileSql.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseEtiketTrans',QuickWindow)         ! Save window data to non-volatile store
  END
  !POST(EVENT:Enable_RJalan,,loc::thread)
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
    UpdateEtiketTrans
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
    OF ?Button10:4
      ThisWindow.Update
         glo::nomor=APD:N0_tran
         start(printetiketranapZEBRA,25000)
    OF ?Insert
      ThisWindow.Update
      cycle
    OF ?Delete
      ThisWindow.Update
      cycle
    OF ?Change:3
      ThisWindow.Update
      cycle
    OF ?Delete:3
      ThisWindow.Update
      cycle
    OF ?Button10
      ThisWindow.Update
      !if sub(clip(APH:N0_tran),1,3)='API' then
         glo::nomor=APD:N0_tran
         start(printetiketranap,25000)
      !else
      !   glo::nomor=APD:N0_tran
      !   start(printetiketrajal,25000)
      !end
    OF ?Button10:2
      ThisWindow.Update
      !if sub(clip(APH:N0_tran),1,3)='API' then
         glo::nomor=APD:N0_tran
         glo_kode_barang=APD:Kode_brg
         start(printetiketranapitem,25000)
      !else
      !   glo::nomor=APD:N0_tran
      !   glo_kode_barang=APD:Kode_brg
      !   start(printetiketrajalitem,25000)
      !end
    OF ?Button10:3
      ThisWindow.Update
      !if sub(clip(APH:N0_tran),1,3)='API' then
         glo::nomor=APD:N0_tran
         start(printetiketranap1struk,25000)
      !else
      !   glo::nomor=APD:N0_tran
      !   start(printetiketrajal1struk,25000)
      !end
    OF ?Button10:5
      ThisWindow.Update
         glo::nomor=APD:N0_tran
         glo_kode_barang=APD:Kode_brg
         start(printetiketranapitemZEBRA,25000)
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
    OF EVENT:CloseWindow
      close(view::sql)
    OF EVENT:OpenWindow
      open(view::sql)
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


BRW1.ResetFromAsk PROCEDURE(*BYTE Request,*BYTE Response)

  CODE
  PARENT.ResetFromAsk(Request,Response)
  !  if request=1 and response=1 then
  !     glo::no_nota=APH:N0_tran
  !     PrintTransRawatJalan
  !     view::sql{prop:sql}='select kode_brg from dba.apdtrans where n0_tran='''&APH:N0_tran&''''
  !     loop
  !        next(view::sql)
  !        if errorcode() then break.
  !        glo_kode_barang=FIL:FString1
  !        start(printetiketrajal,25000)
  !     end
  !  end


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
  IF (APH:Bayar = 1)
    Lunas = 'Lunas'
  ELSE
    Lunas = 'Belum'
  END
  IF (APH:Ra_jal = 1)
    Poliklinik = 'Y'
  ELSE
    Poliklinik = 'N'
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


BRW6.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW6.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

PrintEtiketRajal1struk PROCEDURE                           ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
LOC::KOSONG          STRING(20)                            !
loc::nama            STRING(30)                            !
loc::alamat          STRING(30)                            !
vl_jam               TIME                                  !
vl_kali              STRING(1)                             !
Process:View         VIEW(APDTRANS)
                       PROJECT(APD:Camp)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:N0_tran)
                       JOIN(APH:by_transaksi,APD:N0_tran)
                         PROJECT(APH:Kode_Apotik)
                         PROJECT(APH:Tanggal)
                         PROJECT(APH:dokter)
                         PROJECT(APH:Nomor_mr)
                         JOIN(JDok:KeyKodeDokter,APH:dokter)
                         END
                         JOIN(JPas:KeyNomorMr,APH:Nomor_mr)
                           PROJECT(JPas:Nama)
                           PROJECT(JPas:TanggalLahir)
                         END
                       END
                       JOIN(GBAR:KeyKodeBrg,APD:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(5,1,65,30),PAPER(PAPER:USER,2700,1300),PRE(RPT),FONT('Arial',10,COLOR:Black,),MM
break1                 BREAK(APD:Kode_brg)
detail1                  DETAIL,AT(,,66,30),USE(?detail1),FONT('Times New Roman',9,,)
                           STRING('Instalasi Farmasi RS Bhayangkara Sartika Asih'),AT(1,0,64,4),USE(?String11:2),TRN,CENTER,FONT('Times New Roman',9,,FONT:regular)
                           STRING('Jl. Moch Toha 369 Bandung Telp. 5229544'),AT(1,4,63,4),USE(?String11:3),TRN,CENTER,FONT('Times New Roman',9,,FONT:regular)
                           STRING(@s15),AT(4,9,25,4),USE(APD:N0_tran),TRN,FONT('Times New Roman',8,,)
                           STRING(@s35),AT(2,14,40,4),USE(JPas:Nama),TRN,LEFT,FONT('Times New Roman',9,,FONT:regular)
                           STRING('(T.L {21})'),AT(41,14,24,4),USE(?String16),TRN,FONT('Times New Roman',9,,FONT:regular)
                           STRING(@D06),AT(48,14),USE(JPas:TanggalLahir),TRN,LEFT,FONT('Times New Roman',9,,FONT:regular)
                           LINE,AT(1,13,63,0),USE(?Line2:2),COLOR(COLOR:Black)
                           STRING(@s5),AT(31,9,9,4),USE(APH:Kode_Apotik),TRN,FONT('Times New Roman',8,,)
                           STRING(@D06),AT(47,9,16,4),USE(APH:Tanggal),TRN,FONT('Times New Roman',8,,)
                           LINE,AT(1,8,63,0),USE(?Line2),COLOR(COLOR:Black)
                           STRING(@s40),AT(4,26,50,4),USE(GBAR:Nama_Brg),FONT('Times New Roman',8,,)
                           STRING(@n5),AT(53,26,10,4),USE(APD:Jumlah),RIGHT(2),FONT('Times New Roman',8,,)
                           STRING('Sehari:'),AT(5,18,11,4),USE(?String11:5),TRN,FONT('Times New Roman',10,,FONT:regular)
                           STRING(@s10),AT(16,18,12,4),USE(APD2:Jumlah1),RIGHT,FONT('Times New Roman',10,,)
                           STRING(@s1),AT(28,18,4,4),USE(vl_kali),TRN,FONT('Times New Roman',10,,FONT:regular)
                           STRING(@s10),AT(31,18,9,4),USE(APD2:Jumlah2),LEFT,FONT('Times New Roman',10,,)
                           STRING(@s30),AT(41,18,26,4),USE(Ape:Nama),FONT('Times New Roman',10,,)
                           STRING(@s30),AT(2,22,59,4),USE(Ape1:Nama),CENTER,FONT('Times New Roman',10,,)
                         END
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
  GlobalErrors.SetProcedureName('PrintEtiketRajal1struk')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo::nomor',glo::nomor)                            ! Added by: Report
  BIND('glo_kode_barang',glo_kode_barang)                  ! Added by: Report
  BIND('glo::no_nota',glo::no_nota)                        ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:APDTRANS.Open                                     ! File Apetiket1 used by this procedure, so make sure it's RelationManager is open
  Relate:APDTRANSDet.Open                                  ! File Apetiket1 used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket.Open                                     ! File Apetiket1 used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket1.Open                                    ! File Apetiket1 used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ApReLuar.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintEtiketRajal1struk',ProgressWindow)    ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:APDTRANS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, APD:N0_tran)
  ThisReport.AddSortOrder(APD:by_transaksi)
  ThisReport.SetFilter('APD:N0_tran=glo::nomor')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  Relate:APDTRANS.SetQuickScan(1,Propagate:OneMany)
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
    Relate:APDTRANS.Close
    Relate:APDTRANSDet.Close
    Relate:Apetiket.Close
    Relate:Apetiket1.Close
  END
  IF SELF.Opened
    INIMgr.Update('PrintEtiketRajal1struk',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  APH:N0_tran = APD:N0_tran                                ! Assign linking field value
  Access:APHTRANS.Fetch(APH:by_transaksi)
  JDok:Kode_Dokter = APH:dokter                            ! Assign linking field value
  Access:JDokter.Fetch(JDok:KeyKodeDokter)
  JPas:Nomor_mr = APH:Nomor_mr                             ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APH:N0_tran = APD:N0_tran                                ! Assign linking field value
  Access:APHTRANS.Fetch(APH:by_transaksi)
  JDok:Kode_Dokter = APH:dokter                            ! Assign linking field value
  Access:JDokter.Fetch(JDok:KeyKodeDokter)
  JPas:Nomor_mr = APH:Nomor_mr                             ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  !message(APD:N0_tran&' '&APD:Kode_brg&' '&APD:Camp)
  APD2:N0_tran    =APD:N0_tran
  APD2:Kode_brg   =APD:Kode_brg
  APD2:Camp       =APD:Camp
  get(apdtransdet,APD2:KEY1)
  if not errorcode() then
     !message(APD2:N0_tran&' '&APD2:Kode_brg&' '&APD2:Camp)
     Ape:No=APD2:Keterangan
     access:apetiket.fetch(Ape:KEY1)
     Ape1:No=APD2:Keterangan2
     access:apetiket1.fetch(Ape1:KEY1)
  else
     !message(error())
  end
  if APD2:Jumlah1='' or APD2:Jumlah2='' then
     vl_kali=''
  else
     vl_kali='X'
  end
  ReturnValue = PARENT.TakeRecord()
  IF  APH:Nomor_mr = 99999999
      APR:N0_tran = APH:N0_tran
      GET(ApReLuar,APR:by_transaksi)
      IF NOT ERRORCODE()
         loc::nama=APR:Nama
         loc::alamat=APR:Alamat
      ELSE
         loc::nama=''
         loc::alamat=''
      END
  ELSE
      JPas:Nomor_mr=APH:Nomor_mr
      get(jpasien,JPas:KeyNomorMr)
      IF NOT ERRORCODE()
         loc::nama=JPas:Nama
         loc::alamat=JPas:Alamat
      ELSE
         loc::nama=''
         loc::alamat=''
      END
  END
  
  !message(APD:N0_tran&' '&APD:Kode_brg&' '&APD:Camp)
  
  PRINT(RPT:detail1)
  RETURN ReturnValue

PrintEtiketRajalItem PROCEDURE                             ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
LOC::KOSONG          STRING(20)                            !
loc::nama            STRING(30)                            !
loc::alamat          STRING(30)                            !
vl_jam               TIME                                  !
vl_kali              STRING(1)                             !
Process:View         VIEW(APDTRANS)
                       PROJECT(APD:Camp)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:N0_tran)
                       JOIN(APH:by_transaksi,APD:N0_tran)
                         PROJECT(APH:Kode_Apotik)
                         PROJECT(APH:Tanggal)
                         PROJECT(APH:dokter)
                         PROJECT(APH:Nomor_mr)
                         JOIN(JDok:KeyKodeDokter,APH:dokter)
                         END
                         JOIN(JPas:KeyNomorMr,APH:Nomor_mr)
                           PROJECT(JPas:Nama)
                           PROJECT(JPas:TanggalLahir)
                         END
                       END
                       JOIN(GBAR:KeyKodeBrg,APD:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(5,1,65,30),PAPER(PAPER:USER,2700,1300),PRE(RPT),FONT('Arial',10,COLOR:Black,),MM
break1                 BREAK(APD:Kode_brg)
detail1                  DETAIL,AT(,,66,30),USE(?detail1),FONT('Times New Roman',9,,)
                           STRING('Instalasi Farmasi RS Bhayangkara Sartika Asih'),AT(1,0,63,4),USE(?String11:2),TRN,CENTER,FONT('Times New Roman',9,,FONT:regular)
                           STRING('Jl. Moch Toha 369 Bandung Telp. 5229544'),AT(1,4,63,4),USE(?String11:3),TRN,CENTER,FONT('Times New Roman',9,,FONT:regular)
                           STRING(@s15),AT(3,9,25,4),USE(APD:N0_tran),TRN,FONT('Times New Roman',8,,)
                           STRING(@s35),AT(2,14,41,4),USE(JPas:Nama),LEFT,FONT('Times New Roman',9,,FONT:regular)
                           STRING('(T.L {20})'),AT(41,14,23,4),USE(?String16),TRN
                           STRING(@D06),AT(48,14,16,4),USE(JPas:TanggalLahir),TRN,FONT('Times New Roman',9,,FONT:regular)
                           LINE,AT(1,13,63,0),USE(?Line2:2),COLOR(COLOR:Black)
                           STRING(@s5),AT(31,9,9,4),USE(APH:Kode_Apotik),TRN,FONT('Times New Roman',8,,)
                           STRING(@D06),AT(47,9,16,4),USE(APH:Tanggal),TRN,FONT('Times New Roman',8,,)
                           LINE,AT(1,8,63,0),USE(?Line2),COLOR(COLOR:Black)
                           STRING(@s40),AT(3,26,50,4),USE(GBAR:Nama_Brg),TRN,FONT('Times New Roman',8,,)
                           STRING(@n5),AT(53,26,10,4),USE(APD:Jumlah),TRN,RIGHT(2),FONT('Times New Roman',8,,)
                           STRING('Sehari:'),AT(5,18,11,4),USE(?String11:5),TRN,FONT('Times New Roman',10,,FONT:regular)
                           STRING(@s10),AT(16,18,12,4),USE(APD2:Jumlah1),TRN,RIGHT,FONT('Times New Roman',10,,)
                           STRING(@s1),AT(28,18,4,4),USE(vl_kali),TRN,FONT('Times New Roman',10,,FONT:regular)
                           STRING(@s10),AT(31,18,9,4),USE(APD2:Jumlah2),TRN,LEFT,FONT('Times New Roman',10,,)
                           STRING(@s30),AT(40,18,26,4),USE(Ape:Nama),TRN,FONT('Times New Roman',10,,)
                           STRING(@s30),AT(2,22,59,4),USE(Ape1:Nama),TRN,CENTER,FONT('Times New Roman',10,,)
                         END
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
  GlobalErrors.SetProcedureName('PrintEtiketRajalItem')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo::nomor',glo::nomor)                            ! Added by: Report
  BIND('glo_kode_barang',glo_kode_barang)                  ! Added by: Report
  BIND('glo::no_nota',glo::no_nota)                        ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:APDTRANS.Open                                     ! File Apetiket1 used by this procedure, so make sure it's RelationManager is open
  Relate:APDTRANSDet.Open                                  ! File Apetiket1 used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket.Open                                     ! File Apetiket1 used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket1.Open                                    ! File Apetiket1 used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ApReLuar.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintEtiketRajalItem',ProgressWindow)      ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:APDTRANS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, APD:N0_tran)
  ThisReport.AddSortOrder(APD:by_transaksi)
  ThisReport.SetFilter('APD:N0_tran=glo::nomor and APD:Kode_brg=glo_kode_barang')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  Relate:APDTRANS.SetQuickScan(1,Propagate:OneMany)
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
    Relate:APDTRANS.Close
    Relate:APDTRANSDet.Close
    Relate:Apetiket.Close
    Relate:Apetiket1.Close
  END
  IF SELF.Opened
    INIMgr.Update('PrintEtiketRajalItem',ProgressWindow)   ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  APH:N0_tran = APD:N0_tran                                ! Assign linking field value
  Access:APHTRANS.Fetch(APH:by_transaksi)
  JDok:Kode_Dokter = APH:dokter                            ! Assign linking field value
  Access:JDokter.Fetch(JDok:KeyKodeDokter)
  JPas:Nomor_mr = APH:Nomor_mr                             ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APH:N0_tran = APD:N0_tran                                ! Assign linking field value
  Access:APHTRANS.Fetch(APH:by_transaksi)
  JDok:Kode_Dokter = APH:dokter                            ! Assign linking field value
  Access:JDokter.Fetch(JDok:KeyKodeDokter)
  JPas:Nomor_mr = APH:Nomor_mr                             ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  !message(APD:N0_tran&' '&APD:Kode_brg&' '&APD:Camp)
  APD2:N0_tran    =APD:N0_tran
  APD2:Kode_brg   =APD:Kode_brg
  APD2:Camp       =APD:Camp
  get(apdtransdet,APD2:KEY1)
  if not errorcode() then
     !message(APD2:N0_tran&' '&APD2:Kode_brg&' '&APD2:Camp)
     Ape:No=APD2:Keterangan
     access:apetiket.fetch(Ape:KEY1)
     Ape1:No=APD2:Keterangan2
     access:apetiket1.fetch(Ape1:KEY1)
  else
     !message(error())
  end
  if APD2:Jumlah1='' or APD2:Jumlah2='' then
     vl_kali=''
  else
     vl_kali='X'
  end
  ReturnValue = PARENT.TakeRecord()
  IF  APH:Nomor_mr = 99999999
      APR:N0_tran = APH:N0_tran
      GET(ApReLuar,APR:by_transaksi)
      IF NOT ERRORCODE()
         loc::nama=APR:Nama
         loc::alamat=APR:Alamat
      ELSE
         loc::nama=''
         loc::alamat=''
      END
  ELSE
      JPas:Nomor_mr=APH:Nomor_mr
      get(jpasien,JPas:KeyNomorMr)
      IF NOT ERRORCODE()
         loc::nama=JPas:Nama
         loc::alamat=JPas:Alamat
      ELSE
         loc::nama=''
         loc::alamat=''
      END
  END
  
  !message(APD:N0_tran&' '&APD:Kode_brg&' '&APD:Camp)
  
  PRINT(RPT:detail1)
  RETURN ReturnValue

