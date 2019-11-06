

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N007.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N006.INC'),ONCE        !Req'd for module callout resolution
                     END


Obat_campur PROCEDURE                                      ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
Loc::total           LONG                                  !
Loc::biaya           LONG                                  !
loc::tot_general     LONG                                  !
BRW1::View:Browse    VIEW(APDTcam)
                       PROJECT(APD1:Kode_brg)
                       PROJECT(APD1:Jumlah)
                       PROJECT(APD1:Total)
                       PROJECT(APD1:N0_tran)
                       PROJECT(APD1:Camp)
                       JOIN(GBAR:KeyKodeBrg,APD1:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APD1:Kode_brg          LIKE(APD1:Kode_brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
APD1:Jumlah            LIKE(APD1:Jumlah)              !List box control field - type derived from field
APD1:Total             LIKE(APD1:Total)               !List box control field - type derived from field
APD1:N0_tran           LIKE(APD1:N0_tran)             !Primary key field - type derived from field
APD1:Camp              LIKE(APD1:Camp)                !Primary key field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Obat Campur'),AT(,,346,174),FONT('Arial',8,,),IMM,HLP('Obat_campur'),ALRT(EscKey),TIMER(100),SYSTEM,GRAY,MDI
                       OPTION('Jenis Resep'),AT(7,4,66,42),USE(Dtd_ndtd),BOXED,FONT('Arial',8,COLOR:Teal,)
                         RADIO('DTD'),AT(19,16),USE(?Option1:Radio1),FONT('Arial',8,COLOR:Black,FONT:bold)
                         RADIO('NON-DTD'),AT(19,33),USE(?Option1:Radio2),FONT('Arial',,COLOR:Black,FONT:bold)
                       END
                       BUTTON('&Select'),AT(175,4,45,14),USE(?Select:2),HIDE
                       BUTTON('&Tambah Obat (+)'),AT(6,122,77,18),USE(?Insert:3),FONT('Arial',8,COLOR:Black,FONT:bold),KEY(PlusKey)
                       BUTTON('&Rubah'),AT(290,5,45,14),USE(?Change:3),HIDE,DEFAULT
                       PROMPT('Jumlah Pembuatan :'),AT(113,24),USE(?Prompt4),FONT('Arial',9,COLOR:Black,FONT:bold+FONT:italic)
                       ENTRY(@n-5),AT(199,21,37,15),USE(GLO::jml_cmp),FONT('Times New Roman',14,COLOR:Black,)
                       BUTTON('&Hapus'),AT(293,23,45,14),USE(?Delete:3),HIDE
                       LIST,AT(6,52,326,63),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('48L|M~Kode Barang~@s10@160L|M~Nama Obat~C@s40@44R(1)|M~Jumlah~C(0)@n-14@48R(1)|M' &|
   '~Total~C(0)@n11.2@'),FROM(Queue:Browse:1)
                       PROMPT('Subtotal :'),AT(223,122),USE(?Prompt1),FONT('Arial',8,COLOR:Black,)
                       ENTRY(@n-14),AT(267,122,,10),USE(Loc::total),DISABLE
                       BUTTON('&Batal'),AT(99,122,45,30),USE(?Cancel),FONT('Arial',,,),ICON(ICON:Cross)
                       PROMPT('Biaya :'),AT(223,137),USE(?Prompt2),FONT('Arial',8,COLOR:Black,)
                       ENTRY(@n-14),AT(267,136,,10),USE(Loc::biaya)
                       BUTTON('&OK [End]'),AT(154,122,45,30),USE(?Close),FONT('Arial',8,COLOR:Black,),KEY(EndKey),ICON(ICON:Tick)
                       LINE,AT(331,150,-125,0),USE(?Line1),COLOR(COLOR:Black),LINEWIDTH(1)
                       ENTRY(@n-14),AT(267,155,,10),USE(loc::tot_general),DISABLE
                       PROMPT('Total'),AT(224,156),USE(?Prompt3),FONT('Arial',8,COLOR:Black,FONT:bold)
                       BUTTON('Help'),AT(227,3,45,14),USE(?Help),HIDE,STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
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

BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
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
BATAL_D_DUA ROUTINE                !Batal APDTcam
    SET( BRW1::View:Browse)
    LOOP
        NEXT( BRW1::View:Browse)
        IF ERRORCODE() THEN BREAK.
        DELETE( BRW1::View:Browse)
    END

Tulis_D_Dua ROUTINE  !UNTUK tulis data ke APDTrans
    SET( BRW1::View:Browse)
    LOOP
        NEXT( BRW1::View:Browse)
        IF ERRORCODE()
            APD:N0_tran = glo::no_nota
            APD:Kode_brg = '_Campur'
            APD:Jumlah = GLO::jml_cmp
            APD:Total = loc::tot_general
            APD:Camp = glo::campur
            Access:APDTRANS.Insert()
            BREAK
        END
        APD:N0_tran  = APD1:N0_tran
        APD:Kode_brg = APD1:Kode_brg
        APD:Jumlah   = APD1:J_potong
        APD:Total    = 0
        APD:Camp     = glo::campur
        APD:Harga_Dasar = APD1:Harga_Dasar
        Access:APDTRANS.Insert()
        ! Disini mulai menulis ke APDTrans
    END

ThisWindow.Ask PROCEDURE

  CODE
  ?Browse:1{PROP:DISABLE}=1
  ?Close{PROP:DISABLE}=1
  Dtd_ndtd = 1
  ?Insert:3{PROP:DISABLE}=1
  GLO::jml_cmp=0
  APD:N0_tran = glo::no_nota
  APD:Camp = glo::campur
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Obat_campur')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Option1:Radio1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo::campur',glo::campur)                          ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:APDTcam.Open                                      ! File APHTRANS used by this procedure, so make sure it's RelationManager is open
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:APDTcam,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon APD1:Kode_brg for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,APD1:by_tran_cam) ! Add the sort order for APD1:by_tran_cam for sort order 1
  BRW1.AddRange(APD1:N0_tran,glo::no_nota)                 ! Add single value range limit for sort order 1
  BRW1.SetFilter('(APD1:Camp=glo::campur)')                ! Apply filter expression to browse
  BRW1.AddField(APD1:Kode_brg,BRW1.Q.APD1:Kode_brg)        ! Field APD1:Kode_brg is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Nama_Brg,BRW1.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW1.AddField(APD1:Jumlah,BRW1.Q.APD1:Jumlah)            ! Field APD1:Jumlah is a hot field or requires assignment from browse
  BRW1.AddField(APD1:Total,BRW1.Q.APD1:Total)              ! Field APD1:Total is a hot field or requires assignment from browse
  BRW1.AddField(APD1:N0_tran,BRW1.Q.APD1:N0_tran)          ! Field APD1:N0_tran is a hot field or requires assignment from browse
  BRW1.AddField(APD1:Camp,BRW1.Q.APD1:Camp)                ! Field APD1:Camp is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Kode_brg,BRW1.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Obat_campur',QuickWindow)                  ! Restore window settings from non-volatile store
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
    Relate:APDTcam.Close
  END
  IF SELF.Opened
    INIMgr.Update('Obat_campur',QuickWindow)               ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  loc::tot_general = Loc::total + Loc::biaya
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdateAPDTcam
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
    OF ?GLO::jml_cmp
      IF GLO::jml_cmp <> 0
          ?Browse:1{PROP:DISABLE}=0
          ?Insert:3{PROP:DISABLE}=0
      ELSE
          MESSAGE( 'Jumlah Pembuatan Obat Campur HARUS DIISI' )
          SELECT (?GLO::jml_cmp)
          CYCLE
      END
    OF ?Cancel
      DO BATAL_D_DUA
      GLO::jml_cmp = GLO::jml_cmp -1
    OF ?Loc::biaya
      loc::tot_general = Loc::total + Loc::biaya
      DISPLAY
    OF ?Close
      DO Tulis_D_Dua
      APD1:N0_tran = glo::no_nota
      APD1:Kode_brg = '_Biaya'
      APD1:Total = Loc::biaya
      APD1:Camp = glo::campur
      Access:APDTcam.Insert()
      PRESSKEY(AltB)
    END
  ReturnValue = PARENT.TakeAccepted()
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
    OF EVENT:Timer
      IF Loc::total <> 0
          ?Close{PROP:DISABLE}=0
      ELSE
          ?Close{PROP:DISABLE}=1
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
  loc::tot_general = Loc::total + Loc::biaya


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


BRW1.ResetFromView PROCEDURE

Loc::total:Sum       REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:APDTcam.SetQuickScan(1)
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
    Loc::total:Sum += APD1:Total
  END
  Loc::total = Loc::total:Sum
  PARENT.ResetFromView
  Relate:APDTcam.SetQuickScan(0)
  SETCURSOR()


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

Trig_UpdateRawatJalanDetil2 PROCEDURE                      ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
tombol_ok            BYTE                                  !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
vl_sudah             BYTE                                  !
vl_diskon_pct        REAL                                  !
vl_total             REAL                                  !
vl_hna               REAL                                  !
History::APD:Record  LIKE(APD:RECORD),THREAD
QuickWindow          WINDOW('Tambah Data Transaksi'),AT(,,231,148),FONT('Arial',8,,FONT:regular),IMM,HLP('UpdateAPDTRANS'),SYSTEM,GRAY,MDI
                       SHEET,AT(4,4,223,106),USE(?CurrentTab)
                         TAB('Data'),USE(?Tab:1)
                           PROMPT('Kode Barang:'),AT(8,20),USE(?APD:Kode_brg:Prompt)
                           PROMPT('Nama Barang'),AT(8,35),USE(?Prompt4)
                           PROMPT('Jumlah:'),AT(8,48),USE(?APD:Jumlah:Prompt)
                           PROMPT('Harga :'),AT(8,63),USE(?APD:Total:Prompt)
                           ENTRY(@s10),AT(81,20,56,10),USE(APD:Kode_brg),DISABLE,COLOR(COLOR:White),MSG('Kode Barang'),TIP('Kode Barang')
                           BUTTON('&H'),AT(139,19,15,13),USE(?CallLookup),KEY(F2Key)
                           STRING(@s40),AT(81,35),USE(GBAR:Nama_Brg)
                           ENTRY(@n10.2),AT(81,48,55,10),USE(APD:Jumlah),DECIMAL(14),MSG('Jumlah'),TIP('Jumlah')
                           ENTRY(@n-15.2),AT(81,63,55,10),USE(APD:Total),DECIMAL(14),MSG('Harga Dasar'),TIP('Harga Dasar'),READONLY
                           ENTRY(@n-10.2),AT(41,78,25,10),USE(vl_diskon_pct),RIGHT(2)
                           ENTRY(@n-15.2),AT(81,78,55,10),USE(APD:Diskon),RIGHT(2)
                           PROMPT('Diskon:'),AT(8,78),USE(?APD:Diskon:Prompt)
                           PROMPT('%'),AT(70,78),USE(?APD:Diskon:Prompt:2)
                           PROMPT('Total:'),AT(8,93),USE(?APD:Total:Prompt:2)
                           ENTRY(@n-15.2),AT(81,93,55,10),USE(vl_total),RIGHT(1),MSG('Harga Dasar'),TIP('Harga Dasar'),READONLY
                           BUTTON('&K (F5)'),AT(147,59,24,31),USE(?Button6),DISABLE,HIDE,LEFT,KEY(F5Key)
                           BUTTON('Obat &Campur (F4)'),AT(174,59,48,31),USE(?Button5),HIDE,FONT(,,,FONT:bold),KEY(F4Key)
                         END
                       END
                       PROMPT('N0 tran:'),AT(79,2),USE(?APD:N0_tran:Prompt)
                       ENTRY(@s15),AT(109,2,48,10),USE(APD:N0_tran),DISABLE,MSG('nomor transaksi'),TIP('nomor transaksi')
                       BUTTON('&OK [End]'),AT(41,117,72,24),USE(?OK),LEFT,KEY(EndKey),ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(116,117,72,24),USE(?Cancel),LEFT,ICON(ICON:Cross)
                       BUTTON('Help'),AT(157,1,45,14),USE(?Help),HIDE,STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Reset                  PROCEDURE(BYTE Force=0),DERIVED     ! Method added to host embed code
Run                    PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
    CLEAR(ActionMessage)
  OF ChangeRecord
    CLEAR(ActionMessage)
  END
  if tombol_ok = 0 then
     ?OK{PROP:DISABLE}=TRUE
     ?APD:Total{PROP:READONLY}=TRUE
     vl_diskon_pct=(APD:Diskon*100)/APD:Total
     vl_total     =APD:Total-APD:Diskon
     display
  end
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_UpdateRawatJalanDetil2')
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
  SELF.AddHistoryField(?APD:Jumlah,3)
  SELF.AddHistoryField(?APD:Total,4)
  SELF.AddHistoryField(?APD:Diskon,7)
  SELF.AddHistoryField(?APD:N0_tran,1)
  SELF.AddUpdateFile(Access:APDTRANS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:APDTRANS.SetOpenRelated()
  Relate:APDTRANS.Open                                     ! File JKontrakObat used by this procedure, so make sure it's RelationManager is open
  Relate:APDTRANSDet.Open                                  ! File JKontrakObat used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket.Open                                     ! File JKontrakObat used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket1.Open                                    ! File JKontrakObat used by this procedure, so make sure it's RelationManager is open
  Relate:vstokfifo.Open                                    ! File JKontrakObat used by this procedure, so make sure it's RelationManager is open
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APOBKONT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKontrak.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStockGdg.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKontrakMaster.UseFile                            ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKontrakObat.UseFile                              ! File referenced in 'Other Files' so need to inform it's FileManager
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
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_UpdateRawatJalanDetil2',QuickWindow)  ! Restore window settings from non-volatile store
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
    Relate:APDTRANSDet.Close
    Relate:Apetiket.Close
    Relate:Apetiket1.Close
    Relate:vstokfifo.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_UpdateRawatJalanDetil2',QuickWindow) ! Save window data to non-volatile store
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
      if tombol_ok = 0 then
      GSTO:Kode_Apotik=GL_entryapotik
      GSTO:Kode_Barang=APD:Kode_brg
      GET(GStokAptk,GSTO:KeyBarang)
      IF ERRORCODE() > 0
          ?APD:Jumlah{PROP:DISABLE}=1
          MESSAGE('Barang tersebut tidak ada dalam Daftar Obat')
          CLEAR (APD:Kode_brg )
          CLEAR (GBAR:Nama_Brg)
          DISPLAY
          SELECT(?APD:Kode_brg)
      ELSE
          ?APD:Jumlah{PROP:DISABLE}=0
          APD:Jumlah=0
          APD:Harga_Dasar=0
          APD:Total=0
          APD:Camp=0
          APD:Diskon=0
          vl_total=0
          display
          SELECT(?APD:Jumlah)
      END
      end
    OF ?CallLookup
      if tombol_ok = 0 then
       ?APD:Jumlah{PROP:DISABLE}=0
       APD:Jumlah=0
       APD:Harga_Dasar=0
       APD:Total=0
       APD:Camp=0
       APD:Diskon=0
       vl_total=0
       
       globalrequest=selectrecord
       cari_brg_lokal4
       APD:Kode_brg=GBAR:Kode_brg
       display
      end
    OF ?APD:Jumlah
      IF tombol_ok = 0
         if APD:Kode_brg='' then
            message('Kode Barang Masih Kosong !!!')
            ?OK{PROP:DISABLE}=1
            cycle
         else
            IF APD:Jumlah = 0
               ?OK{PROP:DISABLE}=1
            ELSE
               GSTO:Kode_Apotik = GL_entryapotik
               GSTO:Kode_Barang = APD:Kode_brg
               GET(GStokaptk,GSTO:KeyBarang)
               
               IF APD:Jumlah > GSTO:Saldo
                  MESSAGE('JUMLAH di stok tinggal :'& GSTO:Saldo)
                  SELECT(?APD:Jumlah)
                  CYCLE
               END
               ?OK{PROP:DISABLE}=0
               if GBAR:Kelompok=19 then
                  APD:Total = GL_beaR + (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1.3)) * APD:Jumlah)
               else
                  CASE  status
                  OF 1
                     APD:Total = APD:Jumlah * GSTO:Harga_Dasar * (1+(GL_PPN/100))
                  of 3
                     JKon:KODE_KTR=APH:Kontrak
                     access:jkontrak.fetch(JKon:KeyKodeKtr)
                     if JKon:HargaObat>0 then
                        APD:Total = GL_beaR + |
                                (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) *JKon:HargaObat) * APD:Jumlah)
                     else
                        APO:KODE_KTR = GLO::back_up
                        APO:Kode_brg = APD:Kode_brg
                        GET(APOBKONT,APO:by_kode_ktr)
                        IF ERRORCODE() then
                            APD:Total = GL_beaR + |
                                 (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(GL_nt_kls2 / 100 ))) * APD:Jumlah)
                        ELSE
                            APD:Total = GL_beaR + |
                                 (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+ (APO:PERS_TAMBAH / 100 ))) * APD:Jumlah)
                        end
                     END
                  else
                     if GBAR:Kelompok=22 then
                        APD:Total = GL_beaR + |
                                 (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+( 10/ 100 ))) * APD:Jumlah)
                     else
                        APD:Total = GL_beaR + |
                                 (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+( GL_Um_kls1 / 100 ))) * APD:Jumlah)
                     end
                  END
               end
               !Awal Perbaikan Tgl 10/10/2005 Obat Onkologi
               if GBAR:Kelompok=20 then
                  GSGD:Kode_brg=APD:Kode_brg
                  access:gstockgdg.fetch(GSGD:KeyKodeBrg)
                  APD:Total = GL_beaR + ((GSTO:Harga_Dasar*(1-GSGD:Discount/100))*(1+GL_PPN/100)) * APD:Jumlah
               end
               !Akhir Perbaikan Tgl 10/10/2005 Obat Onkologi
      
               !Awal Perbaikan Tgl 20/10/2005 Obat Askes
               if sub(clip(APD:Kode_brg),1,3)='3.3' then
                  IF sub(clip(APD:Kode_brg),1,8)='3.3.EMBA'
                     !Resep Jadi
                     GSGD:Kode_brg=APD:Kode_brg
                     access:gstockgdg.fetch(GSGD:KeyKodeBrg)
                     APD:Total = GSTO:Harga_Dasar * APD:Jumlah
                  else
                     !Resep Jadi
                     GSGD:Kode_brg=APD:Kode_brg
                     access:gstockgdg.fetch(GSGD:KeyKodeBrg)
                     vl_hna=(GSTO:Harga_Dasar*(1-GSGD:Discount/100))*1.1
                     if vl_hna<50000 then
                        APD:Total = GL_beaR + vl_hna * APD:Jumlah * 1.2
      !               elsif vl_hna<100000 then
      !                   APD:Total = GL_beaR + vl_hna * APD:Jumlah * 1.15
                     else
                         APD:Total = GL_beaR + vl_hna * APD:Jumlah * 1.15
                     end
                     display
                  end
               end
               IF sub(clip(APD:Kode_brg),1,8)='3.1.EMBA'
                  !Resep Jadi
                  GSGD:Kode_brg=APD:Kode_brg
                  access:gstockgdg.fetch(GSGD:KeyKodeBrg)
                  APD:Total = GSTO:Harga_Dasar * APD:Jumlah
               end
               display
               !Akhir Perbaikan Tgl 20/10/2005 Obat Askes
      
               APD:Harga_Dasar = GSTO:Harga_Dasar
               DISPLAY
            END
            vl_diskon_pct=(APD:Diskon*100)/APD:Total
            vl_total     =APD:Total-APD:Diskon
            display
         end
      END
    OF ?Button6
      if tombol_ok = 0 then
      IF APD:Jumlah = 0
          ?OK{PROP:DISABLE}=1
      ELSE
          ?OK{PROP:DISABLE}=0
          if GBAR:Kelompok=19 then
             APD:Total = GL_beaR + (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1.3)) * APD:Jumlah)
          else
                CASE  status
                 OF 1
                     APD:Total = APD:Jumlah * GSTO:Harga_Dasar * (1+(GL_PPN/100))
                 OF 2
                     if GBAR:Kelompok=22 then
                        APD:Total = GL_beaR + |
                                 (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+( 10/ 100 ))) * APD:Jumlah)
                     else
                        APD:Total = GL_beaR + |
                                 (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+( GL_Um_kls1 / 100 ))) * APD:Jumlah)
                     end
                 OF 3
                     JKon:KODE_KTR=APH:Kontrak
                     access:jkontrak.fetch(JKon:KeyKodeKtr)
                     if JKon:HargaObat>0 then
                        APD:Total = GL_beaR + |
                                (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) *JKon:HargaObat) * APD:Jumlah)
                     else
                        APO:KODE_KTR = GLO::back_up
                        APO:Kode_brg = APD:Kode_brg
                        GET(APOBKONT,APO:by_kode_ktr)
                        IF ERRORCODE() then
                            APD:Total = GL_beaR + |
                                 (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(GL_nt_kls2 / 100 ))) * APD:Jumlah)
                        ELSE
                            APD:Total = GL_beaR + |
                                 (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+ (APO:PERS_TAMBAH / 100 ))) * APD:Jumlah)
                        end
                     END
                 END
          end
          DISPLAY
      END
      vl_diskon_pct=(APD:Diskon*100)/APD:Total
      vl_total     =APD:Total-APD:Diskon
      display
      end
    OF ?Button5
      if tombol_ok = 0 then
      glo::campur = glo::campur+1
      glo::no_nota= APH:N0_tran
      end
    OF ?OK
      tombol_ok = 1
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CallLookup
      ThisWindow.Update
      if tombol_ok = 0 then
      GSTO:Kode_Apotik=GL_entryapotik
      GSTO:Kode_Barang=GBAR:Kode_brg
      GET(GStokAptk,GSTO:KeyBarang)
      IF ERRORCODE() >0
          ?APD:Jumlah{PROP:DISABLE}=1
          MESSAGE('Barang tersebut tidak ada dalam Daftar Obat')
          CLEAR (APD:Kode_brg )
          CLEAR (GBAR:Nama_Brg)
          DISPLAY
          SELECT(?APD:Kode_brg)
      ELSE
          !untuk menentukan cara bayar pasen
          if status=3 then
             JKon:KODE_KTR=APH:Kontrak
             access:jkontrak.fetch(JKon:KeyKodeKtr)
             JKOM:Kode    =JKon:GROUP
             access:jkontrakmaster.fetch(JKOM:PrimaryKey)
             if JKOM:StatusTabelObat=0 then
                JKOO:KodeKontrak  =JKOM:Kode
                JKOO:Kode_brg     =GBAR:Kode_brg
                !message(JKOM:Kode&' '&GBAR:Kode_brg&' '&JKOO:KodeKontrak&' '&JKOO:Kode_brg)
                if access:jkontrakobat.fetch(JKOO:by_kode_ktr)=level:benign then
                   MESSAGE('Barang tersebut tidak ditanggung')
                   ?APD:Jumlah{PROP:DISABLE}=1
                   CLEAR (APD:Kode_brg )
                   CLEAR (GBAR:Nama_Brg)
                   DISPLAY
                   SELECT(?Button6)
                   cycle
                end
             elsif JKOM:StatusTabelObat=1 then
                JKOO:KodeKontrak  =JKOM:Kode
                JKOO:Kode_brg     =GBAR:Kode_brg
                if access:jkontrakobat.fetch(JKOO:by_kode_ktr)<>level:benign then
                   MESSAGE('Barang tersebut tidak ditanggung')
                   ?APD:Jumlah{PROP:DISABLE}=1
                   CLEAR (APD:Kode_brg )
                   CLEAR (GBAR:Nama_Brg)
                   DISPLAY
                   SELECT(?Button6)
                   cycle
                end
             end
          end
          ?APD:Jumlah{PROP:DISABLE}=0
          APD:Jumlah=0
          APD:Harga_Dasar=0
          APD:Total=0
          APD:Camp=0
          APD:Diskon=0
          vl_total=0
          display
          SELECT(?APD:Jumlah)
      END
      end
    OF ?vl_diskon_pct
      if tombol_ok = 0 then
      APD:Diskon=round(APD:Total*(vl_diskon_pct/100),1)
      vl_total  =APD:Total-APD:Diskon
      display
      end
    OF ?APD:Diskon
      if tombol_ok = 0 then
      vl_diskon_pct=(APD:Diskon*100)/APD:Total
      vl_total     =APD:Total-APD:Diskon
      display
      end
    OF ?Button5
      ThisWindow.Update
      START(Obat_campur, 25000)
      ThisWindow.Reset
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
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:OpenWindow
      if self.request=2 then
         if APD:Diskon<>0 then
            vl_diskon_pct=(APD:Diskon*100)/APD:Total
         else
            vl_diskon_pct=0
         end
         vl_total     =APD:Total-APD:Diskon
         display
      end
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

SelectJGroupKtr PROCEDURE                                  ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
loc::nm_grup         STRING(40)                            !Nama Grup
BRW1::View:Browse    VIEW(JGroupKtr)
                       PROJECT(GrK:KODE_GROUP)
                       PROJECT(GrK:NAMA_GROUP)
                       PROJECT(GrK:NO_GROUP)
                       PROJECT(GrK:KET)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GrK:KODE_GROUP         LIKE(GrK:KODE_GROUP)           !List box control field - type derived from field
GrK:NAMA_GROUP         LIKE(GrK:NAMA_GROUP)           !List box control field - type derived from field
GrK:NO_GROUP           LIKE(GrK:NO_GROUP)             !List box control field - type derived from field
GrK:KET                LIKE(GrK:KET)                  !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Melihat Tabel Group Kontraktor'),AT(,,248,170),FONT('Arial',8,,),IMM,HLP('SelectJGroupKtr'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,232,112),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('55R(2)|FM~Kode Group~C@n10@80L(2)|M~Nama Group~@s40@50R(2)|M~NO GROUP~C(0)@n5@80' &|
   'L(2)|M~KET~@s40@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(195,166,45,14),USE(?Select:2),HIDE
                       SHEET,AT(4,4,240,162),USE(?CurrentTab)
                         TAB('Kode Group [F2]'),USE(?Tab:2),KEY(F2Key),COLOR(0FFFF80H)
                         END
                         TAB('Nama Group [F3]'),USE(?Tab:3),KEY(F3Key)
                           PROMPT('Nama Group :'),AT(27,142),USE(?loc::nm_grup:Prompt)
                           ENTRY(@s40),AT(81,139,153,15),USE(loc::nm_grup),FONT('Times New Roman',10,COLOR:Black,),MSG('Nama Grup'),TIP('Nama Grup')
                         END
                       END
                       BUTTON('Close'),AT(115,0,45,14),USE(?Close),HIDE
                       BUTTON('Help'),AT(164,1,45,14),USE(?Help),HIDE,STD(STD:Help)
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

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort1:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort0:StepClass StepLongClass                        ! Default Step Manager
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
  GlobalErrors.SetProcedureName('SelectJGroupKtr')
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
  Relate:JGroupKtr.Open                                    ! File JGroupKtr used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:JGroupKtr,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon GrK:NAMA_GROUP for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,GrK:KeyNamaGroup) ! Add the sort order for GrK:KeyNamaGroup for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?loc::nm_grup,GrK:NAMA_GROUP,,BRW1) ! Initialize the browse locator using ?loc::nm_grup using key: GrK:KeyNamaGroup , GrK:NAMA_GROUP
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon GrK:KODE_GROUP for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,GrK:KeyKodeGroup) ! Add the sort order for GrK:KeyKodeGroup for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,GrK:KODE_GROUP,1,BRW1)         ! Initialize the browse locator using  using key: GrK:KeyKodeGroup , GrK:KODE_GROUP
  BRW1.AddField(GrK:KODE_GROUP,BRW1.Q.GrK:KODE_GROUP)      ! Field GrK:KODE_GROUP is a hot field or requires assignment from browse
  BRW1.AddField(GrK:NAMA_GROUP,BRW1.Q.GrK:NAMA_GROUP)      ! Field GrK:NAMA_GROUP is a hot field or requires assignment from browse
  BRW1.AddField(GrK:NO_GROUP,BRW1.Q.GrK:NO_GROUP)          ! Field GrK:NO_GROUP is a hot field or requires assignment from browse
  BRW1.AddField(GrK:KET,BRW1.Q.GrK:KET)                    ! Field GrK:KET is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectJGroupKtr',QuickWindow)              ! Restore window settings from non-volatile store
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
    Relate:JGroupKtr.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectJGroupKtr',QuickWindow)           ! Save window data to non-volatile store
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

SelectJKontrak PROCEDURE                                   ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
loc::nm_ktr          STRING(40)                            !Nama Kontraktor
BRW1::View:Browse    VIEW(JKontrak)
                       PROJECT(JKon:NAMA_KTR)
                       PROJECT(JKon:KODE_KTR)
                       PROJECT(JKon:ALAMAT)
                       PROJECT(JKon:KOTA)
                       PROJECT(JKon:TELPON)
                       PROJECT(JKon:GROUP)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
JKon:NAMA_KTR          LIKE(JKon:NAMA_KTR)            !List box control field - type derived from field
JKon:KODE_KTR          LIKE(JKon:KODE_KTR)            !List box control field - type derived from field
JKon:ALAMAT            LIKE(JKon:ALAMAT)              !List box control field - type derived from field
JKon:KOTA              LIKE(JKon:KOTA)                !List box control field - type derived from field
JKon:TELPON            LIKE(JKon:TELPON)              !List box control field - type derived from field
JKon:GROUP             LIKE(JKon:GROUP)               !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Melihat Tabel Kontraktor'),AT(,,358,187),FONT('Arial',8,,),IMM,HLP('SelectJKontrak'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,342,124),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('80L(2)|M~Nama Kontraktor~@s40@44L(2)|FM~Kode Ktr~@s10@80L(2)|M~Alamat~C@s40@80L(' &|
   '2)|M~Kota~C@s20@80L(2)|M~TELPON~@s20@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(247,0,45,14),USE(?Select:2),HIDE
                       SHEET,AT(4,4,350,178),USE(?CurrentTab)
                         TAB('Nama Kontraktor (F2)'),USE(?Tab:2),KEY(F2Key)
                           ENTRY(@s40),AT(170,156,165,15),USE(loc::nm_ktr),FONT('Times New Roman',10,COLOR:Black,),MSG('Nama Kontraktor'),TIP('Nama Kontraktor')
                           PROMPT('Nama Kontraktor :'),AT(108,159),USE(?loc::nm_ktr:Prompt)
                         END
                         TAB('Kode Kontraktor (F3)'),USE(?Tab:3),KEY(F3Key)
                         END
                         TAB('Grup Kontraktor'),USE(?Tab:4)
                           BUTTON('Pilih Grup Kontraktor'),AT(8,148,94,14),USE(?SelectJGroupKtr)
                         END
                       END
                       BUTTON('Close'),AT(289,0,45,14),USE(?Close),HIDE
                       BUTTON('Help'),AT(211,0,45,14),USE(?Help),HIDE,STD(STD:Help)
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
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW1::Sort1:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW1::Sort2:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 3
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
  GlobalErrors.SetProcedureName('SelectJKontrak')
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
  Relate:JGroupKtr.SetOpenRelated()
  Relate:JGroupKtr.Open                                    ! File JGroupKtr used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:JKontrak,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon JKon:NAMA_KTR for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,JKon:KeyNamaKtr) ! Add the sort order for JKon:KeyNamaKtr for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,JKon:NAMA_KTR,,BRW1)           ! Initialize the browse locator using  using key: JKon:KeyNamaKtr , JKon:NAMA_KTR
  BRW1::Sort2:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive) ! Moveable thumb based upon JKon:GROUP for sort order 2
  BRW1.AddSortOrder(BRW1::Sort2:StepClass,JKon:KeyGroup)   ! Add the sort order for JKon:KeyGroup for sort order 2
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon JKon:NAMA_KTR for sort order 3
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,JKon:KeyNamaKtr) ! Add the sort order for JKon:KeyNamaKtr for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(?loc::nm_ktr,JKon:NAMA_KTR,,BRW1) ! Initialize the browse locator using ?loc::nm_ktr using key: JKon:KeyNamaKtr , JKon:NAMA_KTR
  BRW1.AddField(JKon:NAMA_KTR,BRW1.Q.JKon:NAMA_KTR)        ! Field JKon:NAMA_KTR is a hot field or requires assignment from browse
  BRW1.AddField(JKon:KODE_KTR,BRW1.Q.JKon:KODE_KTR)        ! Field JKon:KODE_KTR is a hot field or requires assignment from browse
  BRW1.AddField(JKon:ALAMAT,BRW1.Q.JKon:ALAMAT)            ! Field JKon:ALAMAT is a hot field or requires assignment from browse
  BRW1.AddField(JKon:KOTA,BRW1.Q.JKon:KOTA)                ! Field JKon:KOTA is a hot field or requires assignment from browse
  BRW1.AddField(JKon:TELPON,BRW1.Q.JKon:TELPON)            ! Field JKon:TELPON is a hot field or requires assignment from browse
  BRW1.AddField(JKon:GROUP,BRW1.Q.JKon:GROUP)              ! Field JKon:GROUP is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectJKontrak',QuickWindow)               ! Restore window settings from non-volatile store
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
    Relate:JGroupKtr.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectJKontrak',QuickWindow)            ! Save window data to non-volatile store
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
    OF ?SelectJGroupKtr
      ThisWindow.Update
      GlobalRequest = SelectRecord
      SelectJGroupKtr
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

SelectJTransaksi PROCEDURE                                 ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
vl_tanggal           DATE                                  !
BRW1::View:Browse    VIEW(JTransaksi)
                       PROJECT(JTra:No_Nota)
                       PROJECT(JTra:Nomor_Mr)
                       PROJECT(JTra:Tanggal)
                       PROJECT(JTra:Baru_Lama)
                       PROJECT(JTra:Kode_poli)
                       PROJECT(JTra:Kode_dokter)
                       PROJECT(JTra:BiayaRSI)
                       PROJECT(JTra:BiayaDokter)
                       PROJECT(JTra:BiayaTotal)
                       PROJECT(JTra:Kode_Transaksi)
                       PROJECT(JTra:NIP)
                       PROJECT(JTra:Status)
                       PROJECT(JTra:Kontraktor)
                       PROJECT(JTra:LamaBaru)
                       PROJECT(JTra:Rujukan)
                       PROJECT(JTra:Selesai)
                       PROJECT(JTra:Cetak)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
JTra:No_Nota           LIKE(JTra:No_Nota)             !List box control field - type derived from field
JTra:Nomor_Mr          LIKE(JTra:Nomor_Mr)            !List box control field - type derived from field
JTra:Tanggal           LIKE(JTra:Tanggal)             !List box control field - type derived from field
JTra:Baru_Lama         LIKE(JTra:Baru_Lama)           !List box control field - type derived from field
JTra:Kode_poli         LIKE(JTra:Kode_poli)           !List box control field - type derived from field
JTra:Kode_dokter       LIKE(JTra:Kode_dokter)         !List box control field - type derived from field
JTra:BiayaRSI          LIKE(JTra:BiayaRSI)            !List box control field - type derived from field
JTra:BiayaDokter       LIKE(JTra:BiayaDokter)         !List box control field - type derived from field
JTra:BiayaTotal        LIKE(JTra:BiayaTotal)          !List box control field - type derived from field
JTra:Kode_Transaksi    LIKE(JTra:Kode_Transaksi)      !List box control field - type derived from field
JTra:NIP               LIKE(JTra:NIP)                 !List box control field - type derived from field
JTra:Status            LIKE(JTra:Status)              !List box control field - type derived from field
JTra:Kontraktor        LIKE(JTra:Kontraktor)          !List box control field - type derived from field
JTra:LamaBaru          LIKE(JTra:LamaBaru)            !List box control field - type derived from field
JTra:Rujukan           LIKE(JTra:Rujukan)             !Browse key field - type derived from field
JTra:Selesai           LIKE(JTra:Selesai)             !Browse key field - type derived from field
JTra:Cetak             LIKE(JTra:Cetak)               !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Pendaftaran Rawat Jalan'),AT(,,358,195),FONT('Arial',8,,),CENTER,IMM,HLP('BrowseJTransaksi'),SYSTEM,GRAY,MDI
                       LIST,AT(8,21,342,133),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('40R(2)|M~No Nota~C(0)@s10@51R(2)|M~Nomor Mr~C(0)@N010_@45R(2)|M~Tanggal~C(0)@D06' &|
   '@40L(2)|M~Baru Lama~@s1@44L(2)|M~Kode poli~@s10@48L(2)|M~Kode dokter~@s10@60D(18' &|
   ')|M~Biaya RSI~C(0)@n14.2@60D(12)|M~Biaya Dokter~C(0)@n14.2@60D(14)|M~Biaya Total' &|
   '~C(0)@n14.2@60R(2)|M~Kode Transaksi~C(0)@n1@28R(2)|M~NIP~C(0)@s7@4R(2)|M~Status~' &|
   'C(0)@s1@40R(2)|M~Kontraktor~C(0)@s10@12R(2)|M~Lama Baru~C(0)@n3@'),FROM(Queue:Browse:1)
                       BUTTON('&Pilih'),AT(305,158,45,14),USE(?Select:2)
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('Nomor MR (F2)'),USE(?Tab:2),KEY(F2Key)
                           PROMPT('&NOMOR MR:'),AT(9,159),USE(?JTra:Nomor_Mr:Prompt)
                           ENTRY(@N10),AT(59,159,60,10),USE(JTra:Nomor_Mr),RIGHT(1),MSG('Nomor KIUP'),TIP('Nomor KIUP')
                         END
                       END
                       BUTTON('&Selesai'),AT(305,180,45,14),USE(?Close)
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

BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
BRW1::Sort5:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 6
BRW1::Sort6:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 7
BRW1::Sort7:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 8
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
  GlobalErrors.SetProcedureName('SelectJTransaksi')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('vl_tanggal',vl_tanggal)                            ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  vl_tanggal=today()
  display
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:JDokter.Open                                      ! File JTindaka used by this procedure, so make sure it's RelationManager is open
  Relate:JPTmpKel.Open                                     ! File JTindaka used by this procedure, so make sure it's RelationManager is open
  Relate:JRujuk.Open                                       ! File JTindaka used by this procedure, so make sure it's RelationManager is open
  Relate:JTbTransaksi.Open                                 ! File JTindaka used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPoli.UseFile                                     ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JTBayar.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JTindaka.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:JTransaksi,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,JTra:KeyKodeDokter)                   ! Add the sort order for JTra:KeyKodeDokter for sort order 1
  BRW1.AddSortOrder(,JTra:KeyRujukan)                      ! Add the sort order for JTra:KeyRujukan for sort order 2
  BRW1.AddSortOrder(,JTra:KeyKodePoli)                     ! Add the sort order for JTra:KeyKodePoli for sort order 3
  BRW1.AddSortOrder(,JTra:KeyTanggal)                      ! Add the sort order for JTra:KeyTanggal for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,JTra:Tanggal,1,BRW1)           ! Initialize the browse locator using  using key: JTra:KeyTanggal , JTra:Tanggal
  BRW1.AddSortOrder(,JTra:KeyNoNota)                       ! Add the sort order for JTra:KeyNoNota for sort order 5
  BRW1.AddLocator(BRW1::Sort5:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort5:Locator.Init(,JTra:No_Nota,1,BRW1)           ! Initialize the browse locator using  using key: JTra:KeyNoNota , JTra:No_Nota
  BRW1.AddSortOrder(,JTra:KeySelesai)                      ! Add the sort order for JTra:KeySelesai for sort order 6
  BRW1.AddLocator(BRW1::Sort6:Locator)                     ! Browse has a locator for sort order 6
  BRW1::Sort6:Locator.Init(,JTra:Selesai,1,BRW1)           ! Initialize the browse locator using  using key: JTra:KeySelesai , JTra:Selesai
  BRW1.AddSortOrder(,JTra:KeyCetak)                        ! Add the sort order for JTra:KeyCetak for sort order 7
  BRW1.AddLocator(BRW1::Sort7:Locator)                     ! Browse has a locator for sort order 7
  BRW1::Sort7:Locator.Init(,JTra:Cetak,1,BRW1)             ! Initialize the browse locator using  using key: JTra:KeyCetak , JTra:Cetak
  BRW1.AddSortOrder(,JTra:KeyTransaksi)                    ! Add the sort order for JTra:KeyTransaksi for sort order 8
  BRW1.AddSortOrder(,JTra:descnota_jtransaksi_ik)          ! Add the sort order for JTra:descnota_jtransaksi_ik for sort order 9
  BRW1.SetFilter('(JTRA:Tanggal=vl_tanggal)')              ! Apply filter expression to browse
  BRW1.AddField(JTra:No_Nota,BRW1.Q.JTra:No_Nota)          ! Field JTra:No_Nota is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Nomor_Mr,BRW1.Q.JTra:Nomor_Mr)        ! Field JTra:Nomor_Mr is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Tanggal,BRW1.Q.JTra:Tanggal)          ! Field JTra:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Baru_Lama,BRW1.Q.JTra:Baru_Lama)      ! Field JTra:Baru_Lama is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Kode_poli,BRW1.Q.JTra:Kode_poli)      ! Field JTra:Kode_poli is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Kode_dokter,BRW1.Q.JTra:Kode_dokter)  ! Field JTra:Kode_dokter is a hot field or requires assignment from browse
  BRW1.AddField(JTra:BiayaRSI,BRW1.Q.JTra:BiayaRSI)        ! Field JTra:BiayaRSI is a hot field or requires assignment from browse
  BRW1.AddField(JTra:BiayaDokter,BRW1.Q.JTra:BiayaDokter)  ! Field JTra:BiayaDokter is a hot field or requires assignment from browse
  BRW1.AddField(JTra:BiayaTotal,BRW1.Q.JTra:BiayaTotal)    ! Field JTra:BiayaTotal is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Kode_Transaksi,BRW1.Q.JTra:Kode_Transaksi) ! Field JTra:Kode_Transaksi is a hot field or requires assignment from browse
  BRW1.AddField(JTra:NIP,BRW1.Q.JTra:NIP)                  ! Field JTra:NIP is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Status,BRW1.Q.JTra:Status)            ! Field JTra:Status is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Kontraktor,BRW1.Q.JTra:Kontraktor)    ! Field JTra:Kontraktor is a hot field or requires assignment from browse
  BRW1.AddField(JTra:LamaBaru,BRW1.Q.JTra:LamaBaru)        ! Field JTra:LamaBaru is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Rujukan,BRW1.Q.JTra:Rujukan)          ! Field JTra:Rujukan is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Selesai,BRW1.Q.JTra:Selesai)          ! Field JTra:Selesai is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Cetak,BRW1.Q.JTra:Cetak)              ! Field JTra:Cetak is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectJTransaksi',QuickWindow)             ! Restore window settings from non-volatile store
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
    Relate:JDokter.Close
    Relate:JPTmpKel.Close
    Relate:JRujuk.Close
    Relate:JTbTransaksi.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectJTransaksi',QuickWindow)          ! Save window data to non-volatile store
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
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSIF CHOICE(?CurrentTab) = 5
    RETURN SELF.SetSort(4,Force)
  ELSIF CHOICE(?CurrentTab) = 6
    RETURN SELF.SetSort(5,Force)
  ELSIF CHOICE(?CurrentTab) = 7
    RETURN SELF.SetSort(6,Force)
  ELSIF CHOICE(?CurrentTab) = 8
    RETURN SELF.SetSort(7,Force)
  ELSIF CHOICE(?CurrentTab) = 9
    RETURN SELF.SetSort(8,Force)
  ELSE
    RETURN SELF.SetSort(9,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

