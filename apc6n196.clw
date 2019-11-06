

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N196.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N195.INC'),ONCE        !Req'd for module callout resolution
                     END


Trig_UpdateReturRawatInapPerMRDetil PROCEDURE              ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
vl_sudah             BYTE(0)                               !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
loc::total           REAL                                  !
loc::diskon_pct      REAL                                  !
vl_notrandetail      STRING(20)                            !
vl_jumlah_sisa       REAL                                  !
vl_total_ditanggung  REAL                                  !
VIEW::stok_apotik VIEW(GStokAptk)
    Project (GSTO:Kode_Apotik)
    end

view::filesql view(filesql)
               project(FIL:FString1,FIL:FReal1,FIL:FReal2)
             end

History::APD:Record  LIKE(APD:RECORD),THREAD
QuickWindow          WINDOW('Tambah Data Transaksi'),AT(,,207,147),FONT('MS Sans Serif',10,COLOR:Black,),IMM,HLP('UpdateAPDTRANS'),SYSTEM,GRAY,RESIZE,MDI
                       SHEET,AT(4,4,201,111),USE(?CurrentTab),COLOR(06AB328H)
                         TAB('Data'),USE(?Tab:1)
                           PROMPT('Kode Barang:'),AT(8,20),USE(?APD:Kode_brg:Prompt)
                           ENTRY(@s10),AT(64,20,44,10),USE(APD:Kode_brg),MSG('Kode Barang'),TIP('Kode Barang')
                           BUTTON('&K'),AT(111,19,12,12),USE(?CallLookup),KEY(F2Key)
                           PROMPT('Nama Barang'),AT(8,36),USE(?Prompt4)
                           STRING(@s40),AT(64,36),USE(GBAR:Nama_Brg)
                           PROMPT('Jumlah:'),AT(8,49),USE(?APD:Jumlah:Prompt)
                           ENTRY(@n15.2),AT(64,49,48,10),USE(APD:Jumlah),RIGHT(2),MSG('Jumlah'),TIP('Jumlah')
                           CHECK('KTT'),AT(118,49),USE(APD:ktt),DISABLE
                           PROMPT('Harga :'),AT(8,65),USE(?APD:Total:Prompt)
                           ENTRY(@n-15.2),AT(64,65,48,10),USE(APD:Total),RIGHT(2),MSG('Harga Dasar'),TIP('Harga Dasar'),READONLY
                           PROMPT('Diskon:'),AT(144,66),USE(?APD:Diskon:Prompt),HIDE
                           PROMPT('%'),AT(168,66),USE(?loc::diskon_pct:Prompt),HIDE
                           ENTRY(@n-10.2),AT(176,65,21,10),USE(loc::diskon_pct),DISABLE,HIDE,DECIMAL(14)
                           ENTRY(@n-15.2),AT(149,79,48,10),USE(APD:Diskon),DISABLE,HIDE,RIGHT(2)
                           PROMPT('Biaya Ditanggung:'),AT(8,81),USE(?APD:total_dtg:Prompt)
                           ENTRY(@N-16.2),AT(64,81,48,10),USE(APD:total_dtg),DISABLE,DECIMAL(14)
                           PROMPT('Total:'),AT(8,97),USE(?loc::total:Prompt)
                           ENTRY(@n-15.2),AT(64,97,48,10),USE(loc::total),RIGHT(2),READONLY
                         END
                       END
                       PROMPT('N0 tran:'),AT(66,2),USE(?APD:N0_tran:Prompt)
                       ENTRY(@s15),AT(93,2,48,10),USE(APD:N0_tran),MSG('nomor transaksi'),TIP('nomor transaksi'),READONLY
                       BUTTON('OK [End]'),AT(36,119,59,24),USE(?OK),LEFT,KEY(EndKey),ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(116,119,59,24),USE(?Cancel),LEFT,ICON(ICON:Cross)
                       BUTTON('Help'),AT(157,1,45,14),USE(?Help),HIDE,STD(STD:Help)
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
    ActionMessage = 'Adding a APDTRANS Record'
  OF ChangeRecord
    ActionMessage = 'Changing a APDTRANS Record'
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  ?OK{PROP:DISABLE}=TRUE
  ?APD:Total{PROP:READONLY}=TRUE
  if APD:Diskon<>0 then
     loc::diskon_pct=(APD:Diskon*100)/APD:Total
     loc::total     =APD:Total-APD:Diskon
     DISPLAY
  end
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_UpdateReturRawatInapPerMRDetil')
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
  SELF.AddHistoryField(?APD:ktt,12)
  SELF.AddHistoryField(?APD:Total,4)
  SELF.AddHistoryField(?APD:Diskon,7)
  SELF.AddHistoryField(?APD:total_dtg,11)
  SELF.AddHistoryField(?APD:N0_tran,1)
  SELF.AddUpdateFile(Access:APDTRANS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:APDTRANS.Open                                     ! File FileSql used by this procedure, so make sure it's RelationManager is open
  Relate:Apklutmp.Open                                     ! File FileSql used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql.Open                                      ! File FileSql used by this procedure, so make sure it's RelationManager is open
  Relate:VAPDTRANS.Open                                    ! File FileSql used by this procedure, so make sure it's RelationManager is open
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
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_UpdateReturRawatInapPerMRDetil',QuickWindow) ! Restore window settings from non-volatile store
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
    Relate:Apklutmp.Close
    Relate:FileSql.Close
    Relate:VAPDTRANS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_UpdateReturRawatInapPerMRDetil',QuickWindow) ! Save window data to non-volatile store
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
    Cari_diAPDTRANS
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
    OF ?APD:Kode_brg
      if vl_sudah=0 then
         APKL:Kode_brg=APD:Kode_brg
         APKL:N0_tran=glo::no_nota
         GET(APklutmp,APKL:key_nota_brg)
         IF ERRORCODE() = 35
             MESSAGE('Barang tidak ada Dalam daftar Pengeluaran')
             ?APD:Jumlah{PROP:DISABLE}=1
             CLEAR (APD:Kode_brg )
             CLEAR (GBAR:Nama_Brg)
             DISPLAY
             SELECT(?APD:Kode_brg)
         ELSE
             ?APD:Jumlah{PROP:DISABLE}=0
             APD:Jumlah=0
             APD:Total=0
             APD:Harga_Dasar=0
             APD:Diskon=0
             loc::total=0
             loc::diskon_pct=0
             display
         END
      end
    OF ?APD:Jumlah
      if vl_sudah=0 then
         IF APD:Jumlah = 0
             ?OK{PROP:DISABLE}=1
         ELSE
             vl_jumlah_sisa = APD4:Jumlah
             vl_total_ditanggung = APD4:total_dtg
             aphtrans{prop:sql}='select * from dba.aphtrans where NoTransaksiAsal='''&APD4:N0_tran&''''
             loop
                  if access:aphtrans.next()<>level:benign then break.
                  vl_notrandetail = APH:N0_tran
                  open(view::filesql)
                  view::filesql{prop:sql}='select kode_brg,jumlah,total_dtg from dba.apdtrans where n0_tran='''&vl_notrandetail&''' and kode_brg='''&APD:Kode_brg&''''
                  loop
                      next(view::filesql)
                      if errorcode() then break.
                      vl_jumlah_sisa -= FIL:FReal1
                  end
                  close(view::filesql)
             end
             IF APD:Jumlah >vl_jumlah_sisa
                 MESSAGE ('Jumlah Pengembalian maximum : '&vl_jumlah_sisa )
                 ?OK{PROP:DISABLE}=1
             ELSE
                 ?OK{PROP:DISABLE}=0
             END
         END
         !APD:Total       = abs(APD4:Harga_Dasar)*(APD:Jumlah/APD4:Jumlah)*-1
         !vl_total_ditanggung= vl_total_ditanggung*-1
         APD:Total       = abs(APD4:Harga_Dasar)*APD:Jumlah
         APD:Harga_Dasar = abs(APD4:Harga_Dasar)*-1
         loc::total      = APD:Total
         APD:total_dtg=(APD4:total_dtg/APD4:Jumlah)*APD:Jumlah
         if APD:total_dtg>APD:Total then
              APD:total_dtg=APD:Total
         end
         APD:total_dtg=APD:Total_dtg*-1
         APD:Total= APD:Total*-1
         DISPLAY
      end
    OF ?OK
      vl_sudah=1
      if APD:ktt=1 then
          glo:ktt=1
      end
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?APD:Kode_brg
      IF APD:Kode_brg OR ?APD:Kode_brg{Prop:Req}
        GBAR:Kode_brg = APD:Kode_brg
        IF Access:GBarang.TryFetch(GBAR:KeyKodeBrg)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            APD:Kode_brg = GBAR:Kode_brg
          ELSE
            SELECT(?APD:Kode_brg)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      GBAR:Kode_brg = APD:Kode_brg
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        APD:Kode_brg = GBAR:Kode_brg
      END
      ThisWindow.Reset(1)
      if vl_sudah=0 then
      !   message(glo::no_nota)
         APD4:N0_tran =glo::no_nota
         APD4:Kode_brg=APD:Kode_brg
         if access:vapdtrans.fetch(APD4:PK)<>level:benign then
      !   APKL:N0_tran = glo::no_nota
      !   APKL:Kode_brg= APD:Kode_brg
      !   GET(APklutmp,APKL:key_nota_brg)
      !   IF ERRORCODE() = 35
             MESSAGE('Barang tidak ada Dalam daftar Pengeluaran')
             ?APD:Jumlah{PROP:DISABLE}=1
             CLEAR (APD:Kode_brg )
             CLEAR (GBAR:Nama_Brg)
             DISPLAY
             SELECT(?APD:Kode_brg)
         ELSE
             ?APD:Jumlah{PROP:DISABLE}=0
             APD:Jumlah=0
             APD:Total=0
             APD:Harga_Dasar=0
             APD:Diskon=0
             loc::total=0
             loc::diskon_pct=0
             APD:ktt=APD4:ktt
             display
         END
      end
    OF ?loc::diskon_pct
      if vl_sudah=0 then
         if loc::diskon_pct<>0 then
            APD:Diskon=((APD:Total*loc::diskon_pct)/100)
            loc::total=APD:Total-APD:Diskon
            DISPLAY
         end
      end
    OF ?APD:Diskon
      if vl_sudah=0 then
         if APD:Diskon<>0 then
            loc::diskon_pct=(APD:Diskon*100)/APD:Total
            loc::total     =APD:Total-APD:Diskon
         end
         DISPLAY
      end
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

