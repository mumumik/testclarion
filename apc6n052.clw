

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N052.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N051.INC'),ONCE        !Req'd for module callout resolution
                     END


Rubah_stok_apotik PROCEDURE                                ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
loc::kd_brg          STRING(10)                            !Kode Barang
History::GSTO:Record LIKE(GSTO:RECORD),THREAD
QuickWindow          WINDOW('Merubah Data Barang'),AT(,,236,166),FONT('Arial',8,,),IMM,HLP('UpdateGStokAptk'),SYSTEM,GRAY,MDI
                       SHEET,AT(4,4,221,132),USE(?CurrentTab),FONT('Times New Roman',10,,FONT:regular)
                         TAB('Data Umum'),USE(?Tab:1),FONT('Arial',8,,)
                           STRING('Kode SubFarmasi :'),AT(10,22),USE(?String4)
                           STRING(@s5),AT(76,22),USE(GSTO:Kode_Apotik,,?GSTO:Kode_Apotik:2)
                           BUTTON('&H'),AT(150,36,12,10),USE(?CallLookup),FONT('Times New Roman',10,,),KEY(F2Key)
                           PROMPT('Kode Barang:'),AT(10,39),USE(?GSTO:Kode_Barang:Prompt)
                           ENTRY(@s10),AT(76,36,68,10),USE(GSTO:Kode_Barang),MSG('Kode Barang'),TIP('Kode Barang')
                           STRING(@s40),AT(76,52,112,8),USE(GBAR:Nama_Brg),FONT('Times New Roman',10,COLOR:Black,)
                           PROMPT('Stok Minimal :'),AT(10,69),USE(?GSTO:Saldo_Minimal:Prompt)
                           ENTRY(@n16.2),AT(76,69,68,10),USE(GSTO:Saldo_Minimal),DECIMAL(14),MSG('Saldo Minimal'),TIP('Saldo Minimal')
                           PROMPT('Saldo Maksimal:'),AT(10,84),USE(?GSTO:Saldo_Maksimal:Prompt)
                           ENTRY(@n16.2),AT(76,83,68,10),USE(GSTO:Saldo_Maksimal),DECIMAL(14)
                           PROMPT('Stok :'),AT(10,98),USE(?GSTO:Saldo:Prompt)
                           ENTRY(@n16.2),AT(76,98,68,10),USE(GSTO:Saldo),DECIMAL(14),MSG('Saldo'),TIP('Saldo')
                           PROMPT('Harga Dasar:'),AT(10,112),USE(?GSTO:Harga_Dasar:Prompt)
                           ENTRY(@n11.`2),AT(76,112,68,10),USE(GSTO:Harga_Dasar),DECIMAL(14),MSG('Harga Dasar'),TIP('Harga Dasar')
                         END
                       END
                       STRING(@s30),AT(72,3),USE(GAPO:Nama_Apotik),FONT('Times New Roman',12,COLOR:Black,)
                       BUTTON('&OK [End]'),AT(39,141,65,18),USE(?OK),LEFT,FONT('Arial',8,COLOR:Black,FONT:regular),KEY(EndKey),ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(107,141,53,18),USE(?Cancel),LEFT,FONT('Arial',8,COLOR:Black,),ICON('CANCEL.ICO')
                       BUTTON('Help'),AT(174,144,45,14),USE(?Help),HIDE,STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Reset                  PROCEDURE(BYTE Force=0),DERIVED     ! Method added to host embed code
Run                    PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
    ActionMessage = 'Adding a GStokAptk Record'
  OF ChangeRecord
    ActionMessage = 'Changing a GStokAptk Record'
  END
  GLO::back_up=GL_entryapotik
  GSTO:Kode_Apotik=GLO::back_up
  !?OK{PROP:DISABLE}=TRUE
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Rubah_stok_apotik')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?String4
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(GSTO:Record,History::GSTO:Record)
  SELF.AddHistoryField(?GSTO:Kode_Apotik:2,1)
  SELF.AddHistoryField(?GSTO:Kode_Barang,2)
  SELF.AddHistoryField(?GSTO:Saldo_Minimal,3)
  SELF.AddHistoryField(?GSTO:Saldo_Maksimal,6)
  SELF.AddHistoryField(?GSTO:Saldo,4)
  SELF.AddHistoryField(?GSTO:Harga_Dasar,5)
  SELF.AddUpdateFile(Access:GStokAptk)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:GStokAptk.Open                                    ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:GStokAptk
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
  if GLO:BAGIAN<>'SIM' then
  disable(?GSTO:Saldo)
  disable(?GSTO:Harga_Dasar)
  disable(?GSTO:Kode_Barang)
  disable(?CallLookup)
  end
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Rubah_stok_apotik',QuickWindow)            ! Restore window settings from non-volatile store
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
    Relate:GStokAptk.Close
  END
  IF SELF.Opened
    INIMgr.Update('Rubah_stok_apotik',QuickWindow)         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  GAPO:Kode_Apotik = GSTO:Kode_Apotik                      ! Assign linking field value
  Access:GApotik.Fetch(GAPO:KeyNoApotik)
  GBAR:Kode_brg = GSTO:Kode_Barang                         ! Assign linking field value
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CallLookup
      ThisWindow.Update
      GBAR:Kode_brg = GSTO:Kode_Barang
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        GSTO:Kode_Barang = GBAR:Kode_brg
      END
      ThisWindow.Reset(1)
    OF ?GSTO:Kode_Barang
      IF GSTO:Kode_Barang OR ?GSTO:Kode_Barang{Prop:Req}
        GBAR:Kode_brg = GSTO:Kode_Barang
        IF Access:GBarang.TryFetch(GBAR:KeyKodeBrg)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            GSTO:Kode_Barang = GBAR:Kode_brg
          ELSE
            SELECT(?GSTO:Kode_Barang)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
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
    OF EVENT:CloseWindow
      PRESSKEY(F3KEY)
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

tabel_stok_lokal PROCEDURE                                 ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
loc:nama_brg         STRING(40)                            !Nama Barang
loc:kode_brg         STRING(10)                            !Kode Barang
Loc:Jumlah           LONG                                  !
BRW1::View:Browse    VIEW(GStokAptk)
                       PROJECT(GSTO:Kode_Barang)
                       PROJECT(GSTO:Saldo)
                       PROJECT(GSTO:Harga_Dasar)
                       PROJECT(GSTO:Saldo_Minimal)
                       PROJECT(GSTO:Kode_Apotik)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GSTO:Kode_Barang       LIKE(GSTO:Kode_Barang)         !List box control field - type derived from field
GSTO:Saldo             LIKE(GSTO:Saldo)               !List box control field - type derived from field
GSTO:Harga_Dasar       LIKE(GSTO:Harga_Dasar)         !List box control field - type derived from field
GSTO:Saldo_Minimal     LIKE(GSTO:Saldo_Minimal)       !List box control field - type derived from field
GSTO:Kode_Apotik       LIKE(GSTO:Kode_Apotik)         !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(GBarang)
                       PROJECT(GBAR:Nama_Brg)
                       PROJECT(GBAR:Kode_brg)
                       PROJECT(GBAR:Ket2)
                       PROJECT(GBAR:No_Satuan)
                       PROJECT(GBAR:Jenis_Brg)
                       PROJECT(GBAR:Status)
                       PROJECT(GBAR:FarNonFar)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !List box control field - type derived from field
GBAR:Ket2              LIKE(GBAR:Ket2)                !List box control field - type derived from field
GBAR:No_Satuan         LIKE(GBAR:No_Satuan)           !List box control field - type derived from field
GBAR:Jenis_Brg         LIKE(GBAR:Jenis_Brg)           !List box control field - type derived from field
GBAR:Status            LIKE(GBAR:Status)              !List box control field - type derived from field
GBAR:FarNonFar         LIKE(GBAR:FarNonFar)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Tabel Barang setempat'),AT(,,350,208),FONT('Arial',8,,),IMM,HLP('tabel_stok_lokal'),SYSTEM,GRAY,MDI
                       SHEET,AT(2,1,345,111),USE(?Sheet2)
                         TAB('Nama Barang [F2]'),USE(?Tab2),KEY(F2Key),FONT('Arial',8,,FONT:regular)
                           ENTRY(@s40),AT(144,95,139,12),USE(loc:nama_brg),FONT('Times New Roman',10,COLOR:Black,)
                         END
                         TAB('Kode Barang [F3]'),USE(?Tab3),KEY(F3Key),FONT('Arial',8,,)
                           ENTRY(@s10),AT(144,95,139,12),USE(loc:kode_brg),FONT('Times New Roman',10,COLOR:Black,)
                         END
                         TAB('Kandungan'),USE(?Tab4)
                           ENTRY(@s50),AT(144,95,139,12),USE(GBAR:Ket2)
                         END
                       END
                       LIST,AT(6,18,336,73),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('137L|FM~Nama Obat~C@s40@48L(2)|M~Kode Barang~@s10@200L(2)|M~Kandungan~@s50@40L(2' &|
   ')|M~Satuan~@s10@27L(2)|~Jenis Brg~@s5@21L(2)|~Status~@n3@12L(2)|~Far Non Far~@n3' &|
   '@'),FROM(Queue:Browse)
                       LIST,AT(6,132,336,36),USE(?Browse:1),IMM,MSG('Browsing Records'),FORMAT('54L|M~Kode Barang~@s10@68D(14)|M~Saldo~@n-16.2@51D(14)|M~Harga Dasar~C(0)@n-11.2' &|
   '@68D(14)|M~Saldo Minimal~C(0)@n-16.2@'),FROM(Queue:Browse:1)
                       SHEET,AT(2,114,345,60),USE(?CurrentTab)
                         TAB('Stok di Sub Farmasi Setempat'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Selesai'),AT(262,179,57,23),USE(?Close),LEFT,ICON(ICON:Cross)
                       BUTTON('Help'),AT(14,189,45,14),USE(?Help),DISABLE,HIDE,STD(STD:Help)
                       GROUP,AT(69,176,189,30),USE(?Group1)
                         BUTTON('&Tambah [+]'),AT(77,179,53,23),USE(?Insert:2),KEY(PlusKey)
                         BUTTON('&Ubah'),AT(139,179,53,23),USE(?Change:2),DEFAULT
                         BUTTON('&Hapus'),AT(201,179,53,23),USE(?Delete:2)
                       END
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
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
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW5                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW5::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW5::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?Sheet2)=2
BRW5::Sort2:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?Sheet2)=3
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
  IF GLO:LEVEL > 1
      ?Group1{PROP:DISABLE}=TRUE
  ELSE
      ?Group1{PROP:DISABLE}=FALSE
  END
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('tabel_stok_lokal')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?loc:nama_brg
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:GBarang.Open                                      ! File GBarang used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GStokAptk,SELF) ! Initialize the browse manager
  BRW5.Init(?List,Queue:Browse.ViewPosition,BRW5::View:Browse,Queue:Browse,Relate:GBarang,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,GSTO:key_kd_brg)                      ! Add the sort order for GSTO:key_kd_brg for sort order 1
  BRW1.AddRange(GSTO:Kode_Barang,Relate:GStokAptk,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,GSTO:Kode_Barang,,BRW1)        ! Initialize the browse locator using  using key: GSTO:key_kd_brg , GSTO:Kode_Barang
  BRW1.SetFilter('(gsto:kode_apotik=GL_entryapotik)')      ! Apply filter expression to browse
  BRW1.AddField(GSTO:Kode_Barang,BRW1.Q.GSTO:Kode_Barang)  ! Field GSTO:Kode_Barang is a hot field or requires assignment from browse
  BRW1.AddField(GSTO:Saldo,BRW1.Q.GSTO:Saldo)              ! Field GSTO:Saldo is a hot field or requires assignment from browse
  BRW1.AddField(GSTO:Harga_Dasar,BRW1.Q.GSTO:Harga_Dasar)  ! Field GSTO:Harga_Dasar is a hot field or requires assignment from browse
  BRW1.AddField(GSTO:Saldo_Minimal,BRW1.Q.GSTO:Saldo_Minimal) ! Field GSTO:Saldo_Minimal is a hot field or requires assignment from browse
  BRW1.AddField(GSTO:Kode_Apotik,BRW1.Q.GSTO:Kode_Apotik)  ! Field GSTO:Kode_Apotik is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse
  BRW5.AddSortOrder(,GBAR:KeyKodeBrg)                      ! Add the sort order for GBAR:KeyKodeBrg for sort order 1
  BRW5.AddLocator(BRW5::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort1:Locator.Init(?loc:kode_brg,GBAR:Kode_brg,,BRW5) ! Initialize the browse locator using ?loc:kode_brg using key: GBAR:KeyKodeBrg , GBAR:Kode_brg
  BRW5.SetFilter('(gbar:status=1 and gbar:farnonfar=0)')   ! Apply filter expression to browse
  BRW5.AddSortOrder(,GBAR:keyNamaKandungan)                ! Add the sort order for GBAR:keyNamaKandungan for sort order 2
  BRW5.AddLocator(BRW5::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW5::Sort2:Locator.Init(?GBAR:Ket2,GBAR:Ket2,1,BRW5)    ! Initialize the browse locator using ?GBAR:Ket2 using key: GBAR:keyNamaKandungan , GBAR:Ket2
  BRW5.SetFilter('(gbar:status=1 and gbar:farnonfar=0)')   ! Apply filter expression to browse
  BRW5.AddSortOrder(,GBAR:KeyNama)                         ! Add the sort order for GBAR:KeyNama for sort order 3
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW5::Sort0:Locator.Init(?loc:nama_brg,GBAR:Nama_Brg,,BRW5) ! Initialize the browse locator using ?loc:nama_brg using key: GBAR:KeyNama , GBAR:Nama_Brg
  BRW5.SetFilter('(gbar:status=1 and gbar:farnonfar=0)')   ! Apply filter expression to browse
  BRW5.AddField(GBAR:Nama_Brg,BRW5.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Kode_brg,BRW5.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Ket2,BRW5.Q.GBAR:Ket2)                ! Field GBAR:Ket2 is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:No_Satuan,BRW5.Q.GBAR:No_Satuan)      ! Field GBAR:No_Satuan is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Jenis_Brg,BRW5.Q.GBAR:Jenis_Brg)      ! Field GBAR:Jenis_Brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Status,BRW5.Q.GBAR:Status)            ! Field GBAR:Status is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:FarNonFar,BRW5.Q.GBAR:FarNonFar)      ! Field GBAR:FarNonFar is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('tabel_stok_lokal',QuickWindow)             ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW5.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW5.ToolbarItem.HelpButton = ?Help
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:GBarang.Close
  END
  IF SELF.Opened
    INIMgr.Update('tabel_stok_lokal',QuickWindow)          ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  IF GLO:LEVEL > 1
    MESSAGE('ANDA TIDAK MEMPUNYAI HAK UNTUK FASILITAS INI')
    RETURN RequestCancelled
  END
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    Rubah_stok_apotik
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
    OF ?Insert:2
      if upper(clip(vg_USER))<>'ADI'
      cycle
      end
    OF ?Change:2
      !if vg_user<>'ADI' then
      !   cycle
      !end
    OF ?Delete:2
      cycle
    END
  ReturnValue = PARENT.TakeAccepted()
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

Loc:Jumlah:Sum       REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:GStokAptk.SetQuickScan(1)
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
    Loc:Jumlah:Sum += GSTO:Saldo
  END
  Loc:Jumlah = Loc:Jumlah:Sum
  PARENT.ResetFromView
  Relate:GStokAptk.SetQuickScan(0)
  SETCURSOR()


BRW5.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW5.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?Sheet2)=2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?Sheet2)=3
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

tambah_obat_cmp PROCEDURE                                  ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
History::APB:Record  LIKE(APB:RECORD),THREAD
QuickWindow          WINDOW('Merubah data Obat Campur'),AT(,,223,146),FONT('Arial',8,,),IMM,HLP('Merubah Obat Campur'),SYSTEM,GRAY,MDI
                       SHEET,AT(6,5,214,108),USE(?CurrentTab)
                         TAB('Data Umum'),USE(?Tab:1)
                           PROMPT('Kode Barang:'),AT(10,21),USE(?APB:Kode_brg:Prompt)
                           ENTRY(@s10),AT(73,21,44,10),USE(APB:Kode_brg),MSG('Kode Barang'),TIP('Kode Barang')
                           BUTTON('&H'),AT(122,21,12,12),USE(?CallLookup),KEY(F2Key)
                           STRING(@s40),AT(73,40),USE(GBAR:Nama_Brg)
                           STRING('Satuan Besar :'),AT(11,59),USE(?String2)
                           STRING(@s10),AT(73,59),USE(GBAR:No_Satuan)
                           PROMPT('Satuan Kecil :'),AT(10,78),USE(?APB:Sat_kecil:Prompt)
                           ENTRY(@s10),AT(73,78,44,10),USE(APB:Sat_kecil),MSG('Satuan kecil untuk setiap jenis barang'),TIP('Satuan kecil untuk setiap jenis barang')
                           BUTTON('&S'),AT(122,77,12,12),USE(?CallLookup:2)
                           PROMPT('Nilai konversi:'),AT(9,97),USE(?APB:Nilai_konversi:Prompt)
                           ENTRY(@n-14),AT(73,97,64,10),USE(APB:Nilai_konversi),RIGHT(1),MSG('Nilai konversi antara satuan besar dan kecil'),TIP('Nilai konversi antara satuan besar dan kecil'),REQ
                         END
                       END
                       BUTTON('&OK'),AT(105,118,50,21),USE(?OK),LEFT,ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(159,118,55,21),USE(?Cancel),LEFT,ICON(ICON:Cross)
                       BUTTON('Help'),AT(154,0,45,14),USE(?Help),HIDE,STD(STD:Help)
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
    ActionMessage = 'Menambah Data Obat Campur'
  OF ChangeRecord
    ActionMessage = 'Rubah Data Obat Campur'
  END
  QuickWindow{Prop:StatusText,2} = ActionMessage           ! Display status message in status bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('tambah_obat_cmp')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APB:Kode_brg:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APB:Record,History::APB:Record)
  SELF.AddHistoryField(?APB:Kode_brg,1)
  SELF.AddHistoryField(?APB:Sat_kecil,3)
  SELF.AddHistoryField(?APB:Nilai_konversi,4)
  SELF.AddUpdateFile(Access:APBRGCMP)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:APBRGCMP.SetOpenRelated()
  Relate:APBRGCMP.Open                                     ! File GSatuan used by this procedure, so make sure it's RelationManager is open
  Relate:GSatuan.Open                                      ! File GSatuan used by this procedure, so make sure it's RelationManager is open
  Access:GBarang.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:APBRGCMP
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
  INIMgr.Fetch('tambah_obat_cmp',QuickWindow)              ! Restore window settings from non-volatile store
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
    Relate:APBRGCMP.Close
    Relate:GSatuan.Close
  END
  IF SELF.Opened
    INIMgr.Update('tambah_obat_cmp',QuickWindow)           ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = APB:Kode_brg                             ! Assign linking field value
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
      Cari_diGbarang
      Pilih_Satuan
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
    OF ?OK
      APB:Sat_besar=GBAR:No_Satuan
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?APB:Kode_brg
      IF APB:Kode_brg OR ?APB:Kode_brg{Prop:Req}
        GBAR:Kode_brg = APB:Kode_brg
        IF Access:GBarang.TryFetch(GBAR:KeyKodeBrg)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            APB:Kode_brg = GBAR:Kode_brg
          ELSE
            SELECT(?APB:Kode_brg)
            CYCLE
          END
        END
      END
      ThisWindow.Reset(0)
    OF ?CallLookup
      ThisWindow.Update
      GBAR:Kode_brg = APB:Kode_brg
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        APB:Kode_brg = GBAR:Kode_brg
      END
      ThisWindow.Reset(1)
    OF ?APB:Sat_kecil
      IF APB:Sat_kecil OR ?APB:Sat_kecil{Prop:Req}
        GSAT:Nama_Satuan = APB:Sat_kecil
        IF Access:GSatuan.TryFetch(GSAT:Key_Nama_Satuan)
          IF SELF.Run(2,SelectRecord) = RequestCompleted
            APB:Sat_kecil = GSAT:Nama_Satuan
          ELSE
            SELECT(?APB:Sat_kecil)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup:2
      ThisWindow.Update
      GSAT:Nama_Satuan = APB:Sat_kecil
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        APB:Sat_kecil = GSAT:Nama_Satuan
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

Pilih_Satuan PROCEDURE                                     ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(GSatuan)
                       PROJECT(GSAT:No_Satuan)
                       PROJECT(GSAT:Nama_Satuan)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GSAT:No_Satuan         LIKE(GSAT:No_Satuan)           !List box control field - type derived from field
GSAT:Nama_Satuan       LIKE(GSAT:Nama_Satuan)         !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Daftar Satuan yang dipakai'),AT(,,158,170),FONT('Arial',8,,),IMM,HLP('Pilih_Satuan'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,142,142),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('40L(2)|M~No Satuan~L(2)@s5@48L(2)|M~Nama Satuan~L(2)@s10@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(105,166,45,14),USE(?Select:2),HIDE
                       SHEET,AT(4,4,150,162),USE(?CurrentTab)
                         TAB('Nama Satuan'),USE(?Tab:2)
                         END
                         TAB('No. Satuan'),USE(?Tab:3)
                         END
                       END
                       BUTTON('Close'),AT(60,152,45,14),USE(?Close),HIDE
                       BUTTON('Help'),AT(109,152,45,14),USE(?Help),HIDE,STD(STD:Help)
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
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('Pilih_Satuan')
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
  Relate:GSatuan.Open                                      ! File GSatuan used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GSatuan,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon GSAT:No_Satuan for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,GSAT:Key_No_Satuan) ! Add the sort order for GSAT:Key_No_Satuan for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,GSAT:No_Satuan,1,BRW1)         ! Initialize the browse locator using  using key: GSAT:Key_No_Satuan , GSAT:No_Satuan
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon GSAT:Nama_Satuan for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,GSAT:Key_Nama_Satuan) ! Add the sort order for GSAT:Key_Nama_Satuan for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,GSAT:Nama_Satuan,1,BRW1)       ! Initialize the browse locator using  using key: GSAT:Key_Nama_Satuan , GSAT:Nama_Satuan
  BRW1.AddField(GSAT:No_Satuan,BRW1.Q.GSAT:No_Satuan)      ! Field GSAT:No_Satuan is a hot field or requires assignment from browse
  BRW1.AddField(GSAT:Nama_Satuan,BRW1.Q.GSAT:Nama_Satuan)  ! Field GSAT:Nama_Satuan is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Pilih_Satuan',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
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
    Relate:GSatuan.Close
  END
  IF SELF.Opened
    INIMgr.Update('Pilih_Satuan',QuickWindow)              ! Save window data to non-volatile store
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

Tabel_brg_campur PROCEDURE                                 ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
loc_nama_brg         STRING(40)                            !Nama Barang
loc_kode_brg         STRING(10)                            !Kode Barang
BRW1::View:Browse    VIEW(APBRGCMP)
                       PROJECT(APB:Kode_brg)
                       PROJECT(APB:Sat_besar)
                       PROJECT(APB:Sat_kecil)
                       PROJECT(APB:Nilai_konversi)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APB:Kode_brg           LIKE(APB:Kode_brg)             !List box control field - type derived from field
APB:Sat_besar          LIKE(APB:Sat_besar)            !List box control field - type derived from field
APB:Sat_kecil          LIKE(APB:Sat_kecil)            !List box control field - type derived from field
APB:Nilai_konversi     LIKE(APB:Nilai_konversi)       !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(GBarang)
                       PROJECT(GBAR:Nama_Brg)
                       PROJECT(GBAR:Kode_brg)
                       PROJECT(GBAR:Dosis)
                       PROJECT(GBAR:Status)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !List box control field - type derived from field
GBAR:Dosis             LIKE(GBAR:Dosis)               !List box control field - type derived from field
GBAR:Status            LIKE(GBAR:Status)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Tabel Barang Campur'),AT(,,248,193),FONT('Arial',8,,),CENTER,IMM,HLP('Tabel_brg_campur'),SYSTEM,GRAY,MDI
                       BUTTON('&Tambah [+]'),AT(99,152,45,14),USE(?Insert:2),KEY(PlusKey)
                       BUTTON('&Ubah'),AT(148,152,45,14),USE(?Change:2),DEFAULT
                       BUTTON('&Hapus'),AT(197,152,45,14),USE(?Delete:2)
                       SHEET,AT(4,100,241,72),USE(?CurrentTab)
                         TAB('Daftar Barang Campur'),USE(?Tab:2),FONT('Arial',8,,)
                           LIST,AT(8,116,233,33),USE(?Browse:1),IMM,HSCROLL,MSG('Browsing Records'),FORMAT('48L(2)|M~Kode Barang~@s10@44L(2)|M~Satuan besar~@s10@44L(2)|M~Satuan kecil~@s10@' &|
   '64R(2)|M~Nilai konversi~C(0)@n-14@'),FROM(Queue:Browse:1)
                         END
                       END
                       BUTTON('&Selesai'),AT(183,174,59,18),USE(?Close),LEFT,ICON(ICON:Cross)
                       BUTTON('Help'),AT(155,0,45,14),USE(?Help),HIDE,STD(STD:Help)
                       LIST,AT(8,17,233,61),USE(?List),IMM,MSG('Browsing Records'),FORMAT('160L(2)|M~Nama Obat~C(0)@s40@53L(2)|M~Kode Barang~L(3)@s10@28L(2)~Dosis~@n7@12L(' &|
   '2)~Status~@n3@'),FROM(Queue:Browse)
                       SHEET,AT(4,1,241,97),USE(?Sheet2)
                         TAB('Nama Barang [F2]'),USE(?Tab2),KEY(F2Key),FONT('Arial',8,,)
                           STRING(@s40),AT(117,84,124,10),USE(loc_nama_brg),FONT('Times New Roman',10,COLOR:Black,)
                         END
                         TAB('Kode Barang [F3]'),USE(?Tab3),KEY(F3Key),FONT('Arial',8,,)
                           STRING(@s10),AT(196,84,43,10),USE(loc_kode_brg),FONT('Times New Roman',10,COLOR:Black,)
                         END
                       END
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
                     END

BRW5                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW5::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW5::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?Sheet2)=2
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
  GlobalErrors.SetProcedureName('Tabel_brg_campur')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Insert:2
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:APBRGCMP.SetOpenRelated()
  Relate:APBRGCMP.Open                                     ! File GBarang used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:APBRGCMP,SELF) ! Initialize the browse manager
  BRW5.Init(?List,Queue:Browse.ViewPosition,BRW5::View:Browse,Queue:Browse,Relate:GBarang,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,APB:by_kd_barang)                     ! Add the sort order for APB:by_kd_barang for sort order 1
  BRW1.AddRange(APB:Kode_brg,Relate:APBRGCMP,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW1.AddField(APB:Kode_brg,BRW1.Q.APB:Kode_brg)          ! Field APB:Kode_brg is a hot field or requires assignment from browse
  BRW1.AddField(APB:Sat_besar,BRW1.Q.APB:Sat_besar)        ! Field APB:Sat_besar is a hot field or requires assignment from browse
  BRW1.AddField(APB:Sat_kecil,BRW1.Q.APB:Sat_kecil)        ! Field APB:Sat_kecil is a hot field or requires assignment from browse
  BRW1.AddField(APB:Nilai_konversi,BRW1.Q.APB:Nilai_konversi) ! Field APB:Nilai_konversi is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse
  BRW5.AddSortOrder(,GBAR:KeyKodeBrg)                      ! Add the sort order for GBAR:KeyKodeBrg for sort order 1
  BRW5.AddLocator(BRW5::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort1:Locator.Init(,GBAR:Kode_brg,,BRW5)           ! Initialize the browse locator using  using key: GBAR:KeyKodeBrg , GBAR:Kode_brg
  BRW5.SetFilter('(gbar:status=1)')                        ! Apply filter expression to browse
  BRW5.AddSortOrder(,GBAR:KeyNama)                         ! Add the sort order for GBAR:KeyNama for sort order 2
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW5::Sort0:Locator.Init(?loc_nama_brg,GBAR:Nama_Brg,,BRW5) ! Initialize the browse locator using ?loc_nama_brg using key: GBAR:KeyNama , GBAR:Nama_Brg
  BRW5.SetFilter('(gbar:status=1)')                        ! Apply filter expression to browse
  BRW5.AddField(GBAR:Nama_Brg,BRW5.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Kode_brg,BRW5.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Dosis,BRW5.Q.GBAR:Dosis)              ! Field GBAR:Dosis is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Status,BRW5.Q.GBAR:Status)            ! Field GBAR:Status is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Tabel_brg_campur',QuickWindow)             ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW5.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW5.ToolbarItem.HelpButton = ?Help
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APBRGCMP.Close
  END
  IF SELF.Opened
    INIMgr.Update('Tabel_brg_campur',QuickWindow)          ! Save window data to non-volatile store
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
    tambah_obat_cmp
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


BRW5.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW5.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?Sheet2)=2
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

