

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N072.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N044.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N073.INC'),ONCE        !Req'd for module callout resolution
                     END


UpdateRI_HRInap PROCEDURE                                  ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
History::RI_HR:Record LIKE(RI_HR:RECORD),THREAD
QuickWindow          WINDOW('Rawat Inap'),AT(,,127,81),FONT('MS Sans Serif',8,,),CENTER,IMM,HLP('UpdateRI_HRInap'),SYSTEM,GRAY,RESIZE,MDI
                       OPTION('Status Transaksi'),AT(15,14,99,30),USE(RI_HR:StatusTutupFar),BOXED
                         RADIO('Tutup'),AT(24,28),USE(?RI_HR:StatusTutupFar:Radio1),VALUE('1')
                         RADIO('Buka'),AT(69,28),USE(?RI_HR:StatusTutupFar:Radio2),VALUE('0')
                       END
                       BUTTON('&OK'),AT(16,54,45,14),USE(?OK),DEFAULT
                       BUTTON('&Batal'),AT(65,54,45,14),USE(?Cancel)
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
    GlobalErrors.Throw(Msg:InsertIllegal)
    RETURN
  OF ChangeRecord
    ActionMessage = 'Ubah'
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateRI_HRInap')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?RI_HR:StatusTutupFar:Radio1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(RI_HR:Record,History::RI_HR:Record)
  SELF.AddHistoryField(?RI_HR:StatusTutupFar,78)
  SELF.AddUpdateFile(Access:RI_HRInap)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:RI_HRInap.Open                                    ! File RI_HRInap used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:RI_HRInap
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.InsertAction = Insert:None                        ! Inserts not allowed
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateRI_HRInap',QuickWindow)              ! Restore window settings from non-volatile store
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
    Relate:RI_HRInap.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateRI_HRInap',QuickWindow)           ! Save window data to non-volatile store
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

BrowseTutupTransaksi PROCEDURE                             ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(RI_HRInap)
                       PROJECT(RI_HR:Nomor_mr)
                       PROJECT(RI_HR:NoUrut)
                       PROJECT(RI_HR:StatusTutupFar)
                       PROJECT(RI_HR:No_Nota)
                       PROJECT(RI_HR:Tanggal_Masuk)
                       PROJECT(RI_HR:Tanggal_Keluar)
                       PROJECT(RI_HR:User)
                       PROJECT(RI_HR:Pulang)
                       JOIN(JPas:KeyNomorMr,RI_HR:Nomor_mr)
                         PROJECT(JPas:Nama)
                         PROJECT(JPas:Nomor_mr)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
RI_HR:Nomor_mr         LIKE(RI_HR:Nomor_mr)           !List box control field - type derived from field
RI_HR:NoUrut           LIKE(RI_HR:NoUrut)             !List box control field - type derived from field
RI_HR:StatusTutupFar   LIKE(RI_HR:StatusTutupFar)     !List box control field - type derived from field
JPas:Nama              LIKE(JPas:Nama)                !List box control field - type derived from field
RI_HR:No_Nota          LIKE(RI_HR:No_Nota)            !List box control field - type derived from field
RI_HR:Tanggal_Masuk    LIKE(RI_HR:Tanggal_Masuk)      !List box control field - type derived from field
RI_HR:Tanggal_Keluar   LIKE(RI_HR:Tanggal_Keluar)     !List box control field - type derived from field
RI_HR:User             LIKE(RI_HR:User)               !List box control field - type derived from field
RI_HR:Pulang           LIKE(RI_HR:Pulang)             !List box control field - type derived from field
JPas:Nomor_mr          LIKE(JPas:Nomor_mr)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Pasien Rawat Inap'),AT(,,358,254),FONT('MS Sans Serif',8,,),CENTER,IMM,HLP('BrowseTutupTransaksi'),SYSTEM,GRAY,RESIZE,MDI
                       LIST,AT(8,20,342,193),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('53R(2)|M~Nomor mr~C(0)@n010_@31R(2)|M~No Urut~C(0)@n-7@27L(2)|M~Status Tutup Far' &|
   '~@n3@140R(2)|M~Nama~C(0)@s35@44L(2)|M~No Nota~@s10@59R(2)|M~Tanggal Masuk~C(0)@D' &|
   '06@80R(2)|M~Tanggal Keluar~C(0)@D06@80L(2)|M~User~@s20@12L(2)|M~Pulang~@n3@'),FROM(Queue:Browse:1)
                       BUTTON('&Tambah'),AT(145,236,45,14),USE(?Insert),DISABLE,HIDE
                       BUTTON('&Ubah'),AT(192,236,45,14),USE(?Change),DEFAULT
                       BUTTON('&Hapus'),AT(239,236,45,14),USE(?Delete),DISABLE,HIDE
                       SHEET,AT(4,4,350,230),USE(?CurrentTab)
                         TAB('&MR'),USE(?Tab:2)
                           PROMPT('Nomor mr:'),AT(7,219),USE(?RI_HR:Nomor_mr:Prompt)
                           ENTRY(@n010_),AT(57,219,60,10),USE(RI_HR:Nomor_mr),RIGHT(1)
                         END
                       END
                       BUTTON('&Selesai'),AT(296,236,45,14),USE(?Close)
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
  GlobalErrors.SetProcedureName('BrowseTutupTransaksi')
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
  Relate:JPasien.Open                                      ! File JPasien used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:RI_HRInap,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,RI_HR:PrimaryKey)                     ! Add the sort order for RI_HR:PrimaryKey for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(?RI_HR:Nomor_mr,RI_HR:Nomor_mr,1,BRW1) ! Initialize the browse locator using ?RI_HR:Nomor_mr using key: RI_HR:PrimaryKey , RI_HR:Nomor_mr
  BRW1.SetFilter('(ri_hr:no_nota='''')')                   ! Apply filter expression to browse
  BRW1.AddField(RI_HR:Nomor_mr,BRW1.Q.RI_HR:Nomor_mr)      ! Field RI_HR:Nomor_mr is a hot field or requires assignment from browse
  BRW1.AddField(RI_HR:NoUrut,BRW1.Q.RI_HR:NoUrut)          ! Field RI_HR:NoUrut is a hot field or requires assignment from browse
  BRW1.AddField(RI_HR:StatusTutupFar,BRW1.Q.RI_HR:StatusTutupFar) ! Field RI_HR:StatusTutupFar is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nama,BRW1.Q.JPas:Nama)                ! Field JPas:Nama is a hot field or requires assignment from browse
  BRW1.AddField(RI_HR:No_Nota,BRW1.Q.RI_HR:No_Nota)        ! Field RI_HR:No_Nota is a hot field or requires assignment from browse
  BRW1.AddField(RI_HR:Tanggal_Masuk,BRW1.Q.RI_HR:Tanggal_Masuk) ! Field RI_HR:Tanggal_Masuk is a hot field or requires assignment from browse
  BRW1.AddField(RI_HR:Tanggal_Keluar,BRW1.Q.RI_HR:Tanggal_Keluar) ! Field RI_HR:Tanggal_Keluar is a hot field or requires assignment from browse
  BRW1.AddField(RI_HR:User,BRW1.Q.RI_HR:User)              ! Field RI_HR:User is a hot field or requires assignment from browse
  BRW1.AddField(RI_HR:Pulang,BRW1.Q.RI_HR:Pulang)          ! Field RI_HR:Pulang is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nomor_mr,BRW1.Q.JPas:Nomor_mr)        ! Field JPas:Nomor_mr is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseTutupTransaksi',QuickWindow)         ! Restore window settings from non-volatile store
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
    Relate:JPasien.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseTutupTransaksi',QuickWindow)      ! Save window data to non-volatile store
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
    UpdateRI_HRInap
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
    OF ?Delete
      cycle
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Insert
      ThisWindow.Update
      cycle
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
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

LoginBox PROCEDURE                                         ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
VL_Password          STRING(10)                            !
VL_TryLogin          BYTE                                  !
Showtime             ULONG                                 !
jum                  USHORT                                !
str1                 STRING(30)                            !
Loc:Password         STRING(20)                            !
Loc:I                ULONG                                 !
Loc:Huruf            STRING(20)                            !
Loc:J                ULONG                                 !
loc:ada              BYTE                                  !
loc:pas              STRING(20)                            !
window               WINDOW('Pemeriksaan Password '),AT(,,204,88),FONT('Times New Roman',10,,FONT:bold),CENTER,ALRT(EscKey),ALRT(AltF4),CENTERED,GRAY,DOUBLE
                       ENTRY(@s20),AT(70,15,88,10),USE(VG_USER),UPR
                       ENTRY(@s20),AT(71,34,,10),USE(Loc:Password),PASSWORD
                       BUTTON('&OK'),AT(15,57,62,26),USE(?OkButton),LEFT,FONT('Times New Roman',10,COLOR:Black,FONT:bold),ICON('SECUR05.ICO'),DEFAULT,REPEAT(3),DELAY(268)
                       BUTTON('&Batal'),AT(131,58,62,25),USE(?CancelButton),LEFT,FONT('Arial',9,COLOR:Black,FONT:bold+FONT:italic),ICON(ICON:Hand)
                       PANEL,AT(1,4,202,47),USE(?Panel1),BEVEL(1)
                       IMAGE('MISC28.ICO'),AT(7,10,19,18),USE(?Image4)
                       IMAGE('RSI2.BMP'),AT(92,58,27,25),USE(?Image1)
                       IMAGE('SECUR08.ICO'),AT(170,33,21,16),USE(?Image2)
                       PROMPT('Pemakai:'),AT(32,17),USE(?VL_User:Prompt),FONT('Arial',10,COLOR:Black,FONT:bold+FONT:italic)
                       IMAGE('SECUR02B.ICO'),AT(7,30),USE(?Image3)
                       PROMPT('Password:'),AT(32,36),USE(?VL_Password:Prompt),FONT('Arial',10,COLOR:Black,FONT:bold+FONT:italic)
                       IMAGE('SMCROSS.ICO'),AT(170,32),USE(?Image6)
                       PANEL,AT(1,53,202,33),USE(?Panel2),BEVEL(1)
                       IMAGE('SECUR02A.ICO'),AT(7,30),USE(?Image5)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
  GlobalErrors.SetProcedureName('LoginBox')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?VG_USER
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:JPASSWRD.SetOpenRelated()
  Relate:JPASSWRD.Open                                     ! File JPASSWRD used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('LoginBox',window)                          ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:JPASSWRD.Close
  END
  IF SELF.Opened
    INIMgr.Update('LoginBox',window)                       ! Save window data to non-volatile store
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
    CASE ACCEPTED()
    OF ?OkButton
      if Clip(Loc:Password)<>'' then
      Loc:Pas = Clip(Loc:Password)&Clip(Glo:Kunci1)
      !Loop Loc:I=1 to Len(Clip(Loc:Password))
      Loop Loc:I=1 to 10
          Loc:J = Val(Sub(Loc:Pas,Loc:I,1)) + Val(Sub(GLo:Kunci,Loc:I,1))
          !Loc:J = (26 - Loc:J % 26 ) + 96
          Loc:Huruf[Loc:I] = CHR(Loc:J)
      end
      If Glo:Flag > 3 then
         Beep
         Halt(0,'Batas Kesalahan 3X (Program DIPROTEK)....!, Hub : MIS/EDP')
      end
      JPSW:ID=Clip(Loc:Huruf)
      !Access:JPasswrd.Fetch(JPSW:KeyId)
      Set( JPSW:KeyId, JPSW:KeyId )
      If not errorcode() then
          !kemungkinan password sama tapi nama beda
          !Loc:Huruf = JPSW:ID
          Loc:ada=0
          Loop
              Next(JPasswrd)
              If Errorcode() Then Break.
              If JPSW:ID = Loc:Huruf Then
                  If Clip(JPSW:User_Id) = Clip(VG_USER) then
                      If Clip(JPSW:Bagian) = 'FARMASI' or Clip(JPSW:Bagian) = 'POLI' or Clip(JPSW:Bagian) = 'INV' or JPSW:Level = 0 or JPSW:Level = 1      then
                         Glo:Level = JPSW:Level
                         Glo:Akses = JPSW:Akses
                         Glo:Bagian = JPSW:Bagian
                         Glo:Jam = CLock()
                         Loc:ada=1
                         Glo:USER_ID = JPSW:Prefix
                         Break
                      End
                  End
              Else
                  Break
              End
          End
          If Loc:ada = 1 Then
              Break
          Else
              Beep
              Message('Anda Tidak Diperbolehkan Mengakses Program ini..!, Hub:MIS/EDP','  Peringatan',Icon:Exclamation)
              Clear(loc:Huruf)
              Glo:Flag += 1
              cycle
          End
      else
          Beep
          Message('Password Tidak Ditemukan..!','  Peringatan',Icon:Exclamation)
          Select(?Loc:Password)
      End
      else
         Halt(0,'Anda masuk tanpa password !!! Hubungi : SIM ')
      end
    OF ?CancelButton
      Beep
      Halt(0,'Akses Program Dibatalkan...!')
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
      case event()
      of event:alertkey
          if keycode() = EscKey
              Beep
              HALT(0,'Akses Program Dibatalkan !')
          elsif keycode() = AltF4
              Beep
              HALT(0,'Akses Program Dibatalkan !')
          end
      end
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

EntryApotik PROCEDURE                                      ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
I                    BYTE                                  !
ST_simpan1           BYTE                                  !
St_simpan2           BYTE                                  !
putar                BYTE                                  !
window               WINDOW('Pendaftaran Layanan Apotik'),AT(,,185,92),FONT('Times New Roman',10,COLOR:Black,),CENTER,GRAY
                       PROMPT('Kode Apotik :'),AT(41,32),USE(?GL_entryapotik:Prompt)
                       ENTRY(@s5),AT(95,30),USE(GL_entryapotik),MSG('kode apotik'),TIP('kode apotik')
                       STRING('Masukkan Kode  Apotik'),AT(43,9,101,10),USE(?String1)
                       BUTTON('&H'),AT(131,30,12,12),USE(?CallLookup),FONT('Times New Roman',10,,),KEY(F2Key)
                       STRING(@s30),AT(39,47),USE(GAPO:Nama_Apotik),FONT(,,,FONT:bold)
                       BUTTON('&OK'),AT(103,67,35,20),USE(?OkButton),DEFAULT
                       PANEL,AT(16,24,160,41),USE(?Panel1)
                       BUTTON('&Batal'),AT(145,67,35,20),USE(?CancelButton)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
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
  GlobalErrors.SetProcedureName('EntryApotik')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GL_entryapotik:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AAwalBln.Open                                     ! File AAwalBln used by this procedure, so make sure it's RelationManager is open
  Relate:GApotik.SetOpenRelated()
  Relate:GApotik.Open                                      ! File AAwalBln used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('EntryApotik',window)                       ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAwalBln.Close
    Relate:GApotik.Close
  END
  IF SELF.Opened
    INIMgr.Update('EntryApotik',window)                    ! Save window data to non-volatile store
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
    Cari_apotik
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
    OF ?OkButton
      if clip(GL_entryapotik) = '' then
          message('Isi sub Farmasi....!')
          cycle
      end
      GL_entryapotik = UPPER(GL_entryapotik)
      GAPO:Kode_Apotik=GL_entryapotik
      GET(GApotik,GAPO:KeyNoApotik)
      if errorCode() > 0  Then
        HALT
      end
      GL_namaapotik=GAPO:Nama_Apotik
      
      !AAWL:Kode_apotik= GL_entryapotik
      !AAWL:Bulan      = MONTH(TODAY())
      !GET(AAwalBln,AAWL:key_bln_aptk)
      !IF ERRORCODE()
      !   IsiAwalBulan
      !ELSE
      !   putar = 1
      !   IF AAWL:status <> 1
      !      St_simpan1 = AAWL:status
      !      LOOP
      !         LOOP I= 1 TO 500.
      !         AAWL:Kode_apotik= GL_entryapotik
      !         AAWL:Bulan      = MONTH(TODAY())
      !         GET(AAwalBln,AAWL:key_bln_aptk)
      !         St_simpan2 = AAWL:status
      !         IF St_simpan2 = 1
      !            BREAK
      !         ELSE
      !            IF St_simpan1 = St_simpan2
      !               if putar < 5
      !                  putar = putar + 1
      !                  cycle
      !               else
      !                  IsiAwalBulan()
      !                  BREAK
      !               end
      !            ELSE
      !               MESSAGE('User lain Sedang Proses Awal Bulan, Coba 5 Menit Lagi')
      !               HALT
      !            END
      !         END
      !      END
      !   END
      !END
      BREAK
    OF ?CancelButton
      HALT
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?GL_entryapotik
      IF GL_entryapotik OR ?GL_entryapotik{Prop:Req}
        GAPO:Kode_Apotik = GL_entryapotik
        IF Access:GApotik.TryFetch(GAPO:KeyNoApotik)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            GL_entryapotik = GAPO:Kode_Apotik
          ELSE
            SELECT(?GL_entryapotik)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      GAPO:Kode_Apotik = GL_entryapotik
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        GL_entryapotik = GAPO:Kode_Apotik
      END
      ThisWindow.Reset(1)
      GLO:INSDIGUNAKAN=GAPO:Keterangan
      !message(GLO:INSDIGUNAKAN&' '&GAPO:Keterangan)
      display
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

Proses_isi_awal_bln PROCEDURE                              ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
TULIS                BYTE                                  !
Progress:Thermometer BYTE                                  !
vl_no                LONG                                  !
loc_nomor_proses     BYTE                                  !
Process:View         VIEW(GStokAptk)
                     END
ProgressWindow       WINDOW('Hitung Awal Bulan'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER,FONT(,,COLOR:Black,FONT:bold)
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       ENTRY(@n-14),AT(42,43,60,15),USE(vl_no),RIGHT(1)
                       BUTTON('Cancel'),AT(9,43,50,15),USE(?Progress:Cancel),DISABLE,HIDE
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Open                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ProgressMgr          StepStringClass                       ! Progress Manager

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
  GlobalErrors.SetProcedureName('Proses_isi_awal_bln')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('gl_entryapotik',gl_entryapotik)                    ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  vl_no = 0
  TULIS = 1
  Relate:AAwalBln.Open                                     ! File AAwalBln used by this procedure, so make sure it's RelationManager is open
  Relate:GStokAptk.Open                                    ! File AAwalBln used by this procedure, so make sure it's RelationManager is open
  Relate:Tbstawal.Open                                     ! File AAwalBln used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Proses_isi_awal_bln',ProgressWindow)       ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisProcess.Init(Process:View, Relate:GStokAptk, ?Progress:PctText, Progress:Thermometer, ProgressMgr, GSTO:Kode_Barang)
  ThisProcess.AddSortOrder(GSTO:KeyBarang)
  ThisProcess.SetFilter('GSTO:Kode_Apotik=gl_entryapotik')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}='JANGAN DIMATIKAN'
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
    Relate:AAwalBln.Close
    Relate:GStokAptk.Close
    Relate:Tbstawal.Close
  END
  IF SELF.Opened
    INIMgr.Update('Proses_isi_awal_bln',ProgressWindow)    ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Open PROCEDURE

  CODE
  AAWL:Bulan = MONTH(TODAY())
  AAWL:Kode_apotik = GL_entryapotik
  AAWL:status = 2
  GET(AAwalBln,AAWL:Key_bln_aptk)
  IF ERRORCODE() = 35
      AAWL:Bulan = MONTH(TODAY())
      AAWL:Kode_apotik = GL_entryapotik
      AAWL:status = 2
      ADD(AAwalBln)
      IF ERRORCODE() > 0
          MESSAGE ('Pemakai lain sedang proses Awal Bulan')
          HALT
      END
  ELSE
      PUT(AAwalBln)
  END
  PARENT.Open


ThisProcess.Kill PROCEDURE

  CODE
  !AAWL:Bulan = MONTH(TODAY())
  !AAWL:Kode_apotik = GL_entryapotik
  !GET(AAwalBln,AAWL:Key_bln_aptk)
  AAWL:status = 1
  PUT(AAwalBln)
  PARENT.Kill


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
    vl_no=vl_no+1
    tulis= tulis + 1
    if tulis=20
      tulis = 1
    end
    IF tulis = 1
      AAWL:status = AAWL:status +1
      IF AAWL:status = 100
          AAWL:status = 2
      END
      PUT(AAwalBln)
    END
    display
  
    TBS:Kode_Apotik = GSTO:Kode_Apotik
    TBS:Kode_Barang = GSTO:Kode_Barang
    TBS:Tahun = YEAR(TODAY())
    GET(Tbstawal,TBS:kdap_brg)
    IF ERRORCODE() = 35
        TBS:Kode_Apotik = GSTO:Kode_Apotik
        TBS:Kode_Barang = GSTO:Kode_Barang
        TBS:Tahun = YEAR(TODAY())
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
        ADD(Tbstawal)
    ELSE
        CASE MONTH(TODAY())
            OF 1
                IF TBS:Januari= 0 OR NULL(TBS:Januari)
                    TBS:Januari = GSTO:Saldo
                END
            OF 2
                IF TBS:Februari= 0 OR NULL(TBS:Februari)
                    TBS:Februari = GSTO:Saldo
                END
            OF 3
                IF TBS:Maret= 0 OR NULL(TBS:Maret)
                    TBS:Maret = GSTO:Saldo
                END
            OF 4
                IF TBS:April= 0 OR NULL(TBS:April)
                    TBS:April = GSTO:Saldo
                END
                
            OF 5
                IF TBS:Mei= 0  OR NULL(TBS:Mei)
                    TBS:Mei = GSTO:Saldo
                END
            OF 6
                IF TBS:Juni= 0 OR NULL(TBS:Juni)
                    TBS:Juni = GSTO:Saldo
                END
            OF 7
                IF TBS:Juli= 0 OR NULL(TBS:Juli)
                    TBS:Juli = GSTO:Saldo
                END
            OF 8
                IF TBS:Agustus= 0  OR NULL(TBS:Agustus)
                    TBS:Agustus = GSTO:Saldo
                END
            OF 9
                IF TBS:September= 0 OR NULL(TBS:September)
                    TBS:September = GSTO:Saldo
                END
            OF 10
                IF TBS:Oktober= 0 OR NULL(TBS:Oktober)
                    TBS:Oktober = GSTO:Saldo
                END
            OF 11
                IF TBS:November= 0 OR NULL(TBS:November)
                    TBS:November = GSTO:Saldo
                END
            OF 12
                IF TBS:Desember= 0  OR NULL(TBS:Desember)
                    TBS:Desember = GSTO:Saldo
                END
        END
        PUT(Tbstawal)
    END
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue

