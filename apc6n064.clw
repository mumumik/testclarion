

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N064.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N006.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N045.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N065.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N195.INC'),ONCE        !Req'd for module callout resolution
                     END


Cetak_nota_apotik121 PROCEDURE                             ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
Process:View         VIEW(APHTRANS)
                       PROJECT(APH:Biaya)
                       PROJECT(APH:Kode_Apotik)
                       PROJECT(APH:N0_tran)
                       PROJECT(APH:Nomor_mr)
                       PROJECT(APH:Tanggal)
                       PROJECT(APH:User)
                       JOIN(JPas:KeyNomorMr,APH:Nomor_mr)
                         PROJECT(JPas:Nama)
                       END
                       JOIN(GAPO:KeyNoApotik,APH:Kode_Apotik)
                         PROJECT(GAPO:Nama_Apotik)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(500,104,6000,5844),PAPER(PAPER:USER,4000,12000),PRE(RPT),FONT('Times New Roman',10,COLOR:Black,),THOUS
detail1                DETAIL,AT(10,,3167,2115),USE(?detail1)
                         STRING('Ins. Farmasi RSSA--SBBM Rawat Jalan'),AT(73,31),USE(?String21),TRN,FONT('Times New Roman',8,,)
                         STRING(@s5),AT(1844,208,583,167),USE(APH:Kode_Apotik),FONT('Times New Roman',8,,FONT:italic)
                         STRING('Pengembalian Obat Rawat Jalan'),AT(73,198,1625,177),LEFT,FONT('Times New Roman',8,,)
                         LINE,AT(52,396,2656,0),USE(?Line2),COLOR(COLOR:Black),LINEWIDTH(2)
                         STRING('No. RM :'),AT(73,458,563,167),TRN,FONT(,8,,)
                         STRING(@N010_),AT(677,458,781,167),USE(APH:Nomor_mr),FONT('Times New Roman',8,,)
                         STRING(@s35),AT(94,677,2271,188),USE(JPas:Nama),TRN,FONT('Times New Roman',8,,)
                         BOX,AT(63,625,2323,281),USE(?Box1),COLOR(COLOR:Black)
                         STRING(@n14),AT(1229,969,833,177),USE(APH:Biaya),TRN,RIGHT(1),FONT('Times New Roman',8,,)
                         STRING('Total Pembayaran : Rp.'),AT(63,958,1219,167),TRN,FONT('Times New Roman',8,,)
                         STRING(@s15),AT(938,1135,1188,167),USE(APH:N0_tran),TRN,FONT('Times New Roman',8,,)
                         STRING('No. Transaksi  :'),AT(63,1125,854,167),TRN,FONT('Times New Roman',8,,)
                         STRING('Bandung, '),AT(1135,1458),USE(?String16),TRN,FONT('Times New Roman',8,,)
                         STRING(@D8),AT(1594,1479,729,167),USE(APH:Tanggal),RIGHT(1),FONT('Times New Roman',8,,)
                         STRING(@s30),AT(469,1302,1958,188),USE(GAPO:Nama_Apotik),TRN,FONT('Times New Roman',8,,)
                         STRING('Penanggung Jawab'),AT(1406,1615,948,167),TRN,FONT('Times New Roman',8,,)
                         STRING(@s4),AT(1635,1938,469,167),USE(APH:User),FONT('Times New Roman',8,,)
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
  GlobalErrors.SetProcedureName('Cetak_nota_apotik121')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:APHTRANS.Open                                     ! File APHTRANS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Cetak_nota_apotik121',ProgressWindow)      ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:APHTRANS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, APH:N0_tran)
  ThisReport.AddSortOrder(APH:by_transaksi)
  ThisReport.AddRange(APH:N0_tran,APH:N0_tran)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report)
  ?Progress:UserString{Prop:Text}=''
  Relate:APHTRANS.SetQuickScan(1,Propagate:OneMany)
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
    INIMgr.Update('Cetak_nota_apotik121',ProgressWindow)   ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  JPas:Nomor_mr = APH:Nomor_mr                             ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
  GAPO:Kode_Apotik = APH:Kode_Apotik                       ! Assign linking field value
  Access:GApotik.Fetch(GAPO:KeyNoApotik)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  JPas:Nomor_mr = APH:Nomor_mr                             ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
  GAPO:Kode_Apotik = APH:Kode_Apotik                       ! Assign linking field value
  Access:GApotik.Fetch(GAPO:KeyNoApotik)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail1)
  RETURN ReturnValue

Trig_UpdateReturRawatJalanDetil PROCEDURE                  ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
vl_sudah             BYTE(0)                               !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
loc::total           REAL                                  !
loc::diskon_pct      REAL                                  !
vl_notrandetail      STRING(20)                            !
vl_jumlah_sisa       REAL                                  !
VIEW::stok_apotik VIEW(GStokAptk)
    Project (GSTO:Kode_Apotik)
    end

view::filesql view(filesql)
               project(FIL:FString1,FIL:FReal1)
             end


History::APD:Record  LIKE(APD:RECORD),THREAD
QuickWindow          WINDOW('Tambah Data Transaksi'),AT(,,207,141),FONT('MS Sans Serif',10,COLOR:Black,),IMM,HLP('UpdateAPDTRANS'),SYSTEM,GRAY,RESIZE,MDI
                       SHEET,AT(4,4,201,109),USE(?CurrentTab),COLOR(06AB328H)
                         TAB('Data'),USE(?Tab:1)
                           PROMPT('Kode Barang:'),AT(8,20),USE(?APD:Kode_brg:Prompt)
                           ENTRY(@s10),AT(64,20,44,10),USE(APD:Kode_brg),MSG('Kode Barang'),TIP('Kode Barang')
                           BUTTON('&K'),AT(111,19,12,12),USE(?CallLookup),KEY(F2Key)
                           PROMPT('Nama Barang'),AT(8,36),USE(?Prompt4)
                           STRING(@s40),AT(64,36),USE(GBAR:Nama_Brg)
                           PROMPT('Jumlah:'),AT(8,49),USE(?APD:Jumlah:Prompt)
                           ENTRY(@n15.2),AT(64,49,48,10),USE(APD:Jumlah),RIGHT(2),MSG('Jumlah'),TIP('Jumlah')
                           CHECK('KTT'),AT(117,50),USE(APD:ktt),DISABLE,VALUE('1','0')
                           PROMPT('Harga :'),AT(8,64),USE(?APD:Total:Prompt)
                           ENTRY(@n-15.2),AT(64,64,48,10),USE(APD:Total),RIGHT(2),MSG('Harga Dasar'),TIP('Harga Dasar'),READONLY
                           PROMPT('Diskon:'),AT(151,56),USE(?APD:Diskon:Prompt),HIDE
                           PROMPT('%'),AT(142,67),USE(?loc::diskon_pct:Prompt),HIDE
                           ENTRY(@n-10.2),AT(176,56,21,10),USE(loc::diskon_pct),DISABLE,HIDE,DECIMAL(14)
                           ENTRY(@n-15.2),AT(150,67,48,10),USE(APD:Diskon),DISABLE,HIDE,RIGHT(2)
                           PROMPT('Biaya Ditanggung:'),AT(8,80),USE(?APD:total_dtg:Prompt)
                           ENTRY(@N-16.2),AT(64,79,48,10),USE(APD:total_dtg),DISABLE,DECIMAL(14)
                           PROMPT('Total:'),AT(8,95),USE(?loc::total:Prompt)
                           ENTRY(@n-15.2),AT(64,95,48,10),USE(loc::total),RIGHT(2),READONLY
                         END
                       END
                       PROMPT('N0 tran:'),AT(66,2),USE(?APD:N0_tran:Prompt)
                       ENTRY(@s15),AT(93,2,48,10),USE(APD:N0_tran),MSG('nomor transaksi'),TIP('nomor transaksi'),READONLY
                       BUTTON('OK [End]'),AT(36,116,59,24),USE(?OK),LEFT,KEY(EndKey),ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(116,116,59,24),USE(?Cancel),LEFT,ICON(ICON:Cross)
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
  GlobalErrors.SetProcedureName('Trig_UpdateReturRawatJalanDetil')
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
  INIMgr.Fetch('Trig_UpdateReturRawatJalanDetil',QuickWindow) ! Restore window settings from non-volatile store
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
    INIMgr.Update('Trig_UpdateReturRawatJalanDetil',QuickWindow) ! Save window data to non-volatile store
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
      !if vl_sudah=0 then
      !   APKL:Kode_brg=APD:Kode_brg
      !   APKL:N0_tran=glo::no_nota
      !   GET(APklutmp,APKL:key_nota_brg)
      !   IF ERRORCODE() = 35
      !       MESSAGE('Barang tidak ada Dalam daftar Pengeluaran')
      !       ?APD:Jumlah{PROP:DISABLE}=1
      !       CLEAR (APD:Kode_brg )
      !       CLEAR (GBAR:Nama_Brg)
      !       DISPLAY
      !       SELECT(?APD:Kode_brg)
      !   ELSE
      !       ?APD:Jumlah{PROP:DISABLE}=0
      !       APD:Jumlah=0
      !       APD:Total=0
      !       APD:Harga_Dasar=0
      !       APD:Diskon=0
      !       loc::total=0
      !       loc::diskon_pct=0
      !       display
      !   END
      !end
    OF ?APD:Jumlah
      if vl_sudah=0 then
         IF APD:Jumlah = 0
             ?OK{PROP:DISABLE}=1
         ELSE
             vl_jumlah_sisa = APD4:Jumlah
             !vl_total_ditanggung = APD4:total_dtg
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
             APD:ktt=APD4:ktt
             loc::total=0
             loc::diskon_pct=0
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

Trig_UpdateReturRawatJalan PROCEDURE                       ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
vl_no_urut           SHORT                                 !
Tahun_ini            LONG                                  !
Loc::SavPoint        LONG                                  !
putar                ULONG                                 !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
loc::nama            STRING(20)                            !
loc::alamat          STRING(35)                            !
Loc::no_mr           LONG                                  !Nomor MR
Loc::status          STRING(10)                            !
vl_nomor             STRING(15)                            !
loc::total           REAL                                  !
loc::diskon          REAL                                  !
loc:total_dtg        REAL                                  !
vl_pembulatandtg     REAL                                  !
vl_real              REAL                                  !
vl_hasil             REAL                                  !
vl_seribu            REAL                                  !
vl_selisih           REAL                                  !
vl_diskon_pct        REAL                                  !
vl_total             REAL                                  !
vl_hna               REAL                                  !
loc::copy_total      REAL                                  !
BRW4::View:Browse    VIEW(APDTRANS)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Total)
                       PROJECT(APD:Diskon)
                       PROJECT(APD:N0_tran)
                       PROJECT(APD:Harga_Dasar)
                       PROJECT(APD:total_dtg)
                       PROJECT(APD:ktt)
                       PROJECT(APD:Camp)
                       JOIN(GBAR:KeyKodeBrg,APD:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Ket2)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse:4       QUEUE                            !Queue declaration for browse/combo box using ?Browse:4
APD:Kode_brg           LIKE(APD:Kode_brg)             !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Ket2              LIKE(GBAR:Ket2)                !List box control field - type derived from field
APD:Jumlah             LIKE(APD:Jumlah)               !List box control field - type derived from field
APD:Total              LIKE(APD:Total)                !List box control field - type derived from field
APD:Diskon             LIKE(APD:Diskon)               !List box control field - type derived from field
APD:N0_tran            LIKE(APD:N0_tran)              !List box control field - type derived from field
APD:Harga_Dasar        LIKE(APD:Harga_Dasar)          !List box control field - type derived from field
APD:total_dtg          LIKE(APD:total_dtg)            !List box control field - type derived from field
APD:ktt                LIKE(APD:ktt)                  !List box control field - type derived from field
APD:Camp               LIKE(APD:Camp)                 !Primary key field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::APH:Record  LIKE(APH:RECORD),THREAD
QuickWindow          WINDOW('Pengembalian obat Rawat Jalan ke Instalasi Farmasi'),AT(,,456,221),FONT('Times New Roman',8,,),CENTER,IMM,HLP('UpdateAPHTRANS'),ALRT(EscKey),TIMER(100),GRAY,RESIZE,MDI
                       ENTRY(@D8),AT(341,2,104,13),USE(APH:Tanggal),DISABLE,RIGHT(1),FONT('Times New Roman',12,,),MSG('Tanggal berobat pasen'),TIP('Tanggal berobat pasen')
                       SHEET,AT(3,5,452,93),USE(?CurrentTab)
                         TAB('Rawat Jalan'),USE(?Tab:1),FONT('Times New Roman',10,COLOR:Black,)
                           BOX,AT(11,28,217,21),USE(?Box1),ROUND,COLOR(COLOR:Green),LINEWIDTH(1)
                           STRING('Nomor RM :'),AT(25,31),USE(?String3),FONT('Arial Black',12,COLOR:Purple,)
                           STRING(@n010_),AT(119,33),USE(Loc::no_mr),FONT('Times New Roman',12,,)
                           PANEL,AT(234,26,77,42),USE(?Panel3)
                           STRING('STATUS'),AT(257,31),USE(?String1),FONT('Bookman Old Style',10,,FONT:bold+FONT:italic)
                           PROMPT('NIP:'),AT(321,30),USE(?APH:NIP:Prompt)
                           ENTRY(@s7),AT(359,28,53,13),USE(APH:NIP),DISABLE
                           BOX,AT(11,55,217,34),USE(?Box2),ROUND,COLOR(COLOR:Green),LINEWIDTH(2)
                           STRING('Nama :'),AT(22,61),USE(?String5),FONT(,,,FONT:bold)
                           LINE,AT(250,47,53,0),USE(?Line2),COLOR(COLOR:Black)
                           PROMPT('Kontrak:'),AT(321,47),USE(?APH:Kontrak:Prompt)
                           ENTRY(@s10),AT(359,45,53,13),USE(APH:Kontrak),DISABLE
                           STRING(@s35),AT(63,61,144,10),USE(loc::nama)
                           OPTION('Lama Baru'),AT(234,70,83,23),USE(APH:LamaBaru),DISABLE,BOXED
                             RADIO('Lama'),AT(240,79),USE(?Option1:Radio1),VALUE('0')
                             RADIO('Baru'),AT(278,79),USE(?Option1:Radio2),VALUE('1')
                           END
                           STRING(@s10),AT(257,55),USE(Loc::status),FONT('Times New Roman',,,)
                           STRING('Alamat :'),AT(22,73),USE(?String6),FONT(,,,FONT:bold)
                           STRING(@s35),AT(63,73,145,10),USE(loc::alamat)
                           PROMPT('No Nota:'),AT(321,78),USE(?APH:NoNota:Prompt)
                           ENTRY(@s10),AT(359,78,56,11),USE(APH:NoNota),DISABLE,REQ
                           BUTTON('F2'),AT(421,75,19,14),USE(?Button7),KEY(F2Key)
                         END
                       END
                       PROMPT('Kode Apotik:'),AT(161,4),USE(?APH:Kode_Apotik:Prompt)
                       ENTRY(@s5),AT(211,2,45,13),USE(APH:Kode_Apotik),DISABLE,MSG('Kode Apotik'),TIP('Kode Apotik')
                       PROMPT('&TANGGAL:'),AT(287,5),USE(?APH:Tanggal:Prompt)
                       PROMPT('No. Nota :'),AT(10,201),USE(?APH:N0_tran:Prompt),FONT('Times New Roman',12,COLOR:Black,FONT:bold+FONT:italic+FONT:underline)
                       ENTRY(@s15),AT(58,201,81,13),USE(APH:N0_tran),DISABLE,FONT('Times New Roman',12,,,CHARSET:ANSI),MSG('nomor transaksi'),TIP('nomor transaksi')
                       BUTTON('Pembulatan'),AT(158,205,102,14),USE(?Button8)
                       LINE,AT(280,202,163,0),USE(?Line1),COLOR(COLOR:Black),LINEWIDTH(2)
                       LIST,AT(12,101,432,65),USE(?Browse:4),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('54L|FM~Kode Barang~@s10@102L|M~Nama Obat~C@s40@85L|M~Keterangan~C@s50@60R(2)|M~J' &|
   'umlah~C(0)@n-15.2@66R(2)|M~Total~C(0)@n-15.2@60R(2)|M~Diskon~C(0)@n-15.2@60R(2)|' &|
   'M~N 0 tran~C(0)@s15@44D(2)|M~Harga Dasar~C(0)@N-20@64D(2)|M~total dtg~C(0)@N-16.' &|
   '2@12D(2)|M~ktt~C(0)@n3@'),FROM(Queue:Browse:4)
                       PROMPT('Total:'),AT(285,170),USE(?loc::total:Prompt)
                       ENTRY(@n-15.2),AT(345,169,81,13),USE(loc::total),RIGHT(14)
                       PROMPT('Total :'),AT(285,205),USE(?APH:Biaya:Prompt),FONT('Times New Roman',14,COLOR:Black,FONT:bold+FONT:italic)
                       ENTRY(@n-15.2),AT(345,205,81,14),USE(APH:Biaya),DISABLE,RIGHT(14),MSG('Total Biaya Pembelian'),TIP('Total Biaya Pembelian')
                       ENTRY(@N-15.2),AT(436,170,20,13),USE(GLO:HARGA_DASAR_RETUR),HIDE,RIGHT(1)
                       PANEL,AT(7,199,135,19),USE(?Panel2)
                       BUTTON('&OK [End]'),AT(214,169,45,33),USE(?OK),FONT('Times New Roman',10,COLOR:Black,),KEY(EndKey),ICON(ICON:Tick),DEFAULT
                       PROMPT('Diskon:'),AT(285,187),USE(?loc::diskon:Prompt)
                       ENTRY(@n-15.2),AT(345,185,81,13),USE(loc::diskon),RIGHT(14)
                       BUTTON('&Batal'),AT(157,169,45,33),USE(?Cancel),FONT('Times New Roman',12,COLOR:Black,),ICON(ICON:Cross)
                       BUTTON('&Tambah Obat (+)'),AT(7,176,127,19),USE(?Insert:5),FONT('Times New Roman',10,,FONT:bold),KEY(PlusKey)
                       BUTTON('&Change'),AT(138,130,45,14),USE(?Change:5),HIDE
                       BUTTON('&Delete'),AT(190,130,45,14),USE(?Delete:5),HIDE
                       BUTTON('Help'),AT(250,130,45,14),USE(?Help),HIDE,STD(STD:Help)
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
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Update                 PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW4                 CLASS(BrowseClass)                    ! Browse using ?Browse:4
Q                      &Queue:Browse:4                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetFromView          PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW4::Sort0:StepClass StepStringClass                      ! Default Step Manager
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
BATAL_D_UTAMA ROUTINE
    apdtrans{prop:sql}='delete dba.apdtrans where n0_tran='''&APH:N0_tran&''''
    apdtrans{prop:sql}='delete dba.apdtrans where n0_tran='''&APH:N0_tran&''''
!    SET( BRW4::View:Browse)
!    LOOP
!        NEXT(BRW4::View:Browse)
!
!        IF ERRORCODE() > 0 THEN
!        BREAK.
!        DELETE(BRW4::View:Browse)
!    END

!Proses Penomoran Otomatis Transaksi
Isi_Nomor Routine
   flush(BRW4::View:Browse)
   vl_nomor=''
   display
   loop
      logout(1,nomor_batal)
      if errorcode()=56 then
         cycle.
      !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
      NOM:No_Urut=3
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
         !NOMU:Urut =3
         !NOMU:Nomor=vl_nomor
         !add(nomoruse)
         !if errorcode()>0 then
         !   vl_nomor=''
         !   rollback
         !   cycle
         !end
         delete(nomor_batal)
         commit
         if errorcode()>0 then
            vl_nomor=''
            display
            cycle
         end
      else
         vl_nomor=''
         display
         rollback
      end
      break
   end
   if vl_nomor='' then
      loop
        logout(1,nomor_skr,nomoruse)
        if errorcode()=56 then cycle.
        !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
        NOM1:No_urut=3
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
           !NOMU:Urut =3
           !NOMU:Nomor=vl_nomor
           !add(nomoruse)
           !if errorcode()>0 then
           !   rollback
           !   cycle
           !end
           NOM1:No_Trans=sub(vl_nomor,1,7)&format(deformat(sub(vl_nomor,8,5),@n5)+1,@p#####p)
           put(nomor_skr)
           if errorcode()=90 then
              rollback
              cycle
           elsif errorcode()>0 then
              rollback
              cycle
           else
              commit
           end
        else
           rollback
           cycle
        end
        break
      end
   end
   if format(sub(vl_nomor,6,2),@n2)<>month(today()) then
      !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
      nomor_batal{prop:sql}='delete dba.nomor_batal where No=3'
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 3=Transaksi Apotik ke pasien Rawat Jalan
         NOM1:No_urut=3
         access:nomor_skr.fetch(NOM1:PrimaryKey)
         if not(errorcode()) then
            vl_nomor =NOM1:No_Trans
            NOM1:No_Trans=sub(vl_nomor,1,3)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'00002'
            access:nomor_skr.update()
            if errorcode()<>0 then
               rollback
               cycle
            else
               vl_nomor=sub(vl_nomor,1,3)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'00001'
               commit
            end
         end
         break
      end
   end
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   APH:N0_tran=vl_nomor
   glo:nobatal=vl_nomor
   display

Batal_Nomor Routine
   !Silahkan diganti ---> 3=Transaksi Apotik ke pasien Rawat Jalan
   NOM:No_Urut =3
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=APH:N0_tran
   NOM:Keterangan='Aptk R. Jalan'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 3=Transaksi Apotik ke pasien Rawat Jalan
   !NOMU:Urut =3
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   !NOMU:Nomor=APH:N0_tran
   !access:nomoruse.fetch(NOMU:PrimaryKey)
   !delete(nomoruse)

hapus_nomor_use routine
   NOMU:Urut    =3
   NOMU:Nomor   =APH:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   if errorcode()=0 then
      delete(nomoruse)
   end

!Isi_Nomor1 Routine
!   vl_nomor=''
!   display
!   loop
!      logout(1,nomor_batal)
!      if errorcode()=56 then
!         cycle.
!      !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
!      NOM:No_Urut=vl_no_urut
!      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
!      if not(errorcode()) then
!         vl_nomor=clip(NOM:No_Trans)
!         display
!         !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
!         NOMU:Urut =vl_no_urut
!         NOMU:Nomor=vl_nomor
!         add(nomoruse)
!         if errorcode()>0 then
!            vl_nomor=''
!            rollback
!            cycle
!         end
!         delete(nomor_batal)
!         commit
!         if errorcode()>0 then
!            vl_nomor=''
!            display
!            cycle
!         end
!      else
!         vl_nomor=''
!         display
!         rollback
!      end
!      break
!   end
!   if vl_nomor='' then
!      loop
!        logout(1,nomor_skr,nomoruse)
!        if errorcode()=56 then cycle.
!        !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
!        NOM1:No_urut=vl_no_urut
!        access:nomor_skr.fetch(NOM1:PrimaryKey)
!        if not(errorcode()) then
!           vl_nomor=NOM1:No_Trans
!           !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
!           NOMU:Urut =vl_no_urut
!           NOMU:Nomor=vl_nomor
!           add(nomoruse)
!           if errorcode()>0 then
!              rollback
!              cycle
!           end
!           NOM1:No_Trans=sub(vl_nomor,1,8)&format(deformat(sub(vl_nomor,9,4),@n4)+1,@p####p)
!           put(nomor_skr)
!           if errorcode()=90 then
!              rollback
!              cycle
!           elsif errorcode()>0 then
!              rollback
!              cycle
!           else
!              commit
!           end
!        else
!           rollback
!           cycle
!        end
!        break
!      end
!   end
!   if format(sub(vl_nomor,7,2),@n2)<>month(today()) then
!      !Silahkan diganti ---> 3=Transaksi Apotik ke Pasien Rawat Jalan
!      nomor_batal{prop:sql}='delete dba.nomor_batal where No='&vl_no_urut
!      loop
!         logout(1,nomor_skr)
!         if errorcode()<>0 then cycle.
!         !Silahkan diganti ---> 3=Transaksi Apotik ke pasien Rawat Jalan
!         NOM1:No_urut=vl_no_urut
!         access:nomor_skr.fetch(NOM1:PrimaryKey)
!         if not(errorcode()) then
!            vl_nomor =NOM1:No_Trans
!            NOM1:No_Trans=sub(vl_nomor,1,4)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'0002'
!            access:nomor_skr.update()
!            if errorcode()<>0 then
!               rollback
!               cycle
!            else
!               vl_nomor=sub(vl_nomor,1,4)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'0001'
!               commit
!            end
!         end
!         break
!      end
!   end
!   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
!   APH:N0_tran=vl_nomor
!   display
!
!Batal_Nomor1 Routine
!   !Silahkan diganti ---> 3=Transaksi Apotik ke pasien Rawat Jalan
!   NOM:No_Urut =vl_no_urut
!   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
!   NOM:No_Trans=APH:N0_tran
!   NOM:Keterangan='Aptk R. Jalan'
!   access:nomor_batal.insert()
!   !Silahkan diganti ---> 3=Transaksi Apotik ke pasien Rawat Jalan
!   NOMU:Urut =vl_no_urut
!   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
!   NOMU:Nomor=APH:N0_tran
!   access:nomoruse.fetch(NOMU:PrimaryKey)
!   delete(nomoruse)
!
!hapus_nomor_use1 routine
!   NOMU:Urut    =vl_no_urut
!   NOMU:Nomor   =APH:N0_tran
!   access:nomoruse.fetch(NOMU:PrimaryKey)
!   if errorcode()=0 then
!      delete(nomoruse)
!   end

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    CLEAR(ActionMessage)
  OF ChangeRecord
    GlobalErrors.Throw(Msg:UpdateIllegal)
    RETURN
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  ?OK{PROP:DISABLE}=TRUE
  
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_UpdateReturRawatJalan')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APH:Tanggal
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  GLO:HARGA_DASAR_RETUR = 0
  glo:ktt=0
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APH:Record,History::APH:Record)
  SELF.AddHistoryField(?APH:Tanggal,2)
  SELF.AddHistoryField(?APH:NIP,13)
  SELF.AddHistoryField(?APH:Kontrak,14)
  SELF.AddHistoryField(?APH:LamaBaru,15)
  SELF.AddHistoryField(?APH:NoNota,17)
  SELF.AddHistoryField(?APH:Kode_Apotik,10)
  SELF.AddHistoryField(?APH:N0_tran,4)
  SELF.AddHistoryField(?APH:Biaya,3)
  SELF.AddUpdateFile(Access:APHTRANS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  !Retur R. Jalan
  case deformat(sub(clip(GL_entryapotik),3,2),@n2)
     of '01'
        vl_no_urut=41
     of '02'
        vl_no_urut=42
     of '04'
        vl_no_urut=43
     of '06'
        vl_no_urut=44
     of '07'
        vl_no_urut=45
     of '08'
        vl_no_urut=46
  END
  Relate:APDTRANS.Open                                     ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:APpotkem.Open                                     ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:Ano_pakai.Open                                    ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:Apklutmp.Open                                     ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:IAP_SET.Open                                      ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:JHBILLING.Open                                    ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_Batal.Open                                  ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:Tbstawal.Open                                     ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKelPeg.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ApReLuar.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JTSBayar.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JTransaksi.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:APHTRANS
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:None                        ! Changes not allowed
    SELF.CancelAction = Cancel:Cancel                      ! No confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  IF glo::campur = 3
      LOC::Status = 'Kontraktor'
  ELSIF glo::campur = 2
      LOC::Status = 'Tunai'
  ELSIF glo::campur = 1
      LOC::Status = 'Pegawai'
  END
  !IF Glo:lap = '1'
  !    APR:N0_tran = glo::no_nota
  !    GET(ApReLuar,APR:by_transaksi)
  !    loc::nama   = APR:Nama
  !    loc::Alamat = APR:Alamat
  !    loc::no_mr  = 0
  !    LOC::Status = 'Tunai'
  !ELSE
      JPas:Nomor_mr = Glo::no_mr
      GET(JPasien,JPas:KeyNomorMr)
      loc::nama   = JPas:Nama
      loc::Alamat = JPas:Alamat
      loc::no_mr  = JPas:Nomor_mr
  !END
  DISPLAY
  if self.request=1 then
     APH:Kontrak      =vg_kontraktor
     APH:cara_bayar   =glo::campur
  end
  display
  BRW4.Init(?Browse:4,Queue:Browse:4.ViewPosition,BRW4::View:Browse,Queue:Browse:4,Relate:APDTRANS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:4{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW4.Q &= Queue:Browse:4
  BRW4::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon APD:N0_tran for sort order 1
  BRW4.AddSortOrder(BRW4::Sort0:StepClass,APD:by_transaksi) ! Add the sort order for APD:by_transaksi for sort order 1
  BRW4.AddRange(APD:N0_tran,Relate:APDTRANS,Relate:APHTRANS) ! Add file relationship range limit for sort order 1
  BRW4.AppendOrder('apd:kode_brg')                         ! Append an additional sort order
  BRW4.AddField(APD:Kode_brg,BRW4.Q.APD:Kode_brg)          ! Field APD:Kode_brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Nama_Brg,BRW4.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Ket2,BRW4.Q.GBAR:Ket2)                ! Field GBAR:Ket2 is a hot field or requires assignment from browse
  BRW4.AddField(APD:Jumlah,BRW4.Q.APD:Jumlah)              ! Field APD:Jumlah is a hot field or requires assignment from browse
  BRW4.AddField(APD:Total,BRW4.Q.APD:Total)                ! Field APD:Total is a hot field or requires assignment from browse
  BRW4.AddField(APD:Diskon,BRW4.Q.APD:Diskon)              ! Field APD:Diskon is a hot field or requires assignment from browse
  BRW4.AddField(APD:N0_tran,BRW4.Q.APD:N0_tran)            ! Field APD:N0_tran is a hot field or requires assignment from browse
  BRW4.AddField(APD:Harga_Dasar,BRW4.Q.APD:Harga_Dasar)    ! Field APD:Harga_Dasar is a hot field or requires assignment from browse
  BRW4.AddField(APD:total_dtg,BRW4.Q.APD:total_dtg)        ! Field APD:total_dtg is a hot field or requires assignment from browse
  BRW4.AddField(APD:ktt,BRW4.Q.APD:ktt)                    ! Field APD:ktt is a hot field or requires assignment from browse
  BRW4.AddField(APD:Camp,BRW4.Q.APD:Camp)                  ! Field APD:Camp is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Kode_brg,BRW4.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_UpdateReturRawatJalan',QuickWindow)   ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW4.AskProcedure = 1
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
  BRW4.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW4.ToolbarItem.HelpButton = ?Help
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  if (self.request=1 and self.response=2) or (self.request=3 and self.response=1) then
     do batal_nomor
     DO BATAL_D_UTAMA
     apklutmp{prop:sql}='delete dba.apklutmp where n0_tran='''&glo::no_nota&''''
     apklutmp{prop:sql}='delete dba.apklutmp where n0_tran='''&glo::no_nota&''''
  !   SET(APklutmp)
  !    APKL:N0_tran = glo::no_nota
  !    SET(APKL:key_nota,APKL:key_nota)
  !    LOOP
  !        IF Access:APklutmp.Next()<>LEVEL:BENIGN OR APKL:N0_tran <> glo::no_nota THEN BREAK.
  !        DELETE(APklutmp)
  !    END
  end
  if self.request=1 and self.response=1 then
     do hapus_nomor_use
  end
  glo:ktt=0
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:APpotkem.Close
    Relate:Ano_pakai.Close
    Relate:Apklutmp.Close
    Relate:IAP_SET.Close
    Relate:JHBILLING.Close
    Relate:NomorUse.Close
    Relate:Nomor_Batal.Close
    Relate:Nomor_SKR.Close
    Relate:Tbstawal.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_UpdateReturRawatJalan',QuickWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
    APH:Tanggal = Today()
    APH:User = Glo:USER_ID
    APH:Kode_Apotik = GL_entryapotik
    APH:Jam = clock()
  PARENT.PrimeFields


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  APH:Biaya = loc::total - loc::diskon
  APH:Harga_Dasar = GLO:HARGA_DASAR_RETUR
  APH:biaya_dtg = loc:total_dtg
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
    Trig_UpdateReturRawatJalanDetil
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
      ! *****UNTUK file ApHTrans******
      APH:User=GL::Prefix
      APH:Bayar=1
      APH:Ra_jal=1
      APH:User=Glo:USER_ID
      !APH:cara_bayar=JTra:Kode_Transaksi
      APH:Kode_Apotik=GL_entryapotik
      APH:shift      =vg_shift_apotik
      !glo::no_nota = APH:N0_tran
      
      IF Glo:lap= '1'
          APH:Nomor_mr = 9999999999
      ELSE
          APH:Nomor_mr = JPas:Nomor_mr
      END
      !APH:Biaya = - APH:Biaya
      
      !*****untuk file ApDTrans
      !cek dulu bulannya ya, kalau sudah berubah, tulis dulu ke file awal bulan
      IF MONTH(glo::tgl_awal_kerja) = MONTH(TODAY())
      !!
      !!    SET(APDTRANS)
      !!    APD:N0_tran = APH:N0_tran
      !!    SET(APD:by_transaksi,APD:by_transaksi)
      !!    LOOP
      !!        IF Access:APDTRANS.Next() <> level:benign OR APD:N0_tran <> APH:N0_tran THEN BREAK.
      !!        GSTO:Kode_Barang = APD:Kode_brg
      !!        GSTO:Kode_Apotik = GL_entryapotik
      !!        GET(GStokAptk,GSTO:KeyBarang)
      !!        IF ERRORCODE()=0
      !!            GSTO:Saldo = GSTO:Saldo + APD:Jumlah
      !!            Access:GStokAptk.Update()
      !!        ELSE
      !!            GSTO:Kode_Apotik = GL_entryapotik
      !!            GSTO:Kode_Barang = APD:Kode_brg
      !!            GSTO:Saldo = APD:Jumlah
      !!            GSTO:Harga_Dasar = APD:Total/APD:Jumlah
      !!            Access:GStokAptk.Insert()
      !!        END
      !!
      !!        ! **** tulis ke appotkem ***
      !!        APP1:N0_tran = APH:N0_tran
      !!        APP1:Kode_brg = APD:Kode_brg
      !!        GET(APpotkem,APP1:key_nota_brg)
      !!        IF ERRORCODE() = 0
      !!            APP1:Jumlah = APP1:Jumlah + APD:Jumlah
      !!            Access:APpotkem.Update()
      !!        ELSE
      !!            APP1:N0_tran = APH:N0_tran
      !!            APP1:Kode_brg = APD:Kode_brg
      !!            APP1:Jumlah = APD:Jumlah
      !!            Access:APpotkem.Insert()
      !!        END
      !!        ! *** end appotkem ***
      !!
      !!        GBAR:Kode_brg = APD:Kode_brg
      !!        Access:GBarang.Fetch(GBAR:KeyKodeBrg)
      !!        IF ERRORCODE() = 0
      !!                    GBAR:Stok_Total = GBAR:Stok_Total+APD:Jumlah
      !!                    Access:GBarang.Update()
      !!        ELSE
      !!                    MESSAGE ('LAPORKAN PADA EDP, KODE '&APD:Kode_brg&' TIDAK ADA DALAM TABEL')
      !!        END
      !!        APD:Jumlah = - APD:Jumlah
      !!        APD:Total = - APD:Total
      !!        PUT(APDTRANS)
      !!    END
      ELSE
      !!
      !!    !Untuk file apHtrans
          APH:Tanggal = TODAY()
          APH:NoTransaksiAsal = glo::no_nota
          Tahun_ini = YEAR(TODAY())
      
          !untuk file ApDTrans
      
          SET(APDTRANS)
          APD:N0_tran = APH:N0_tran
          SET(APD:by_transaksi,APD:by_transaksi)
          LOOP
              IF Access:APDTRANS.Next() <> level:benign OR APD:N0_tran <> APH:N0_tran THEN BREAK.
              GSTO:Kode_Barang = APD:Kode_brg
              GSTO:Kode_Apotik = GL_entryapotik
              GET(GStokAptk,GSTO:KeyBarang)
      !!        IF ERRORCODE() = 0
      !!
                  !disini isi dulu tbstawal
                  TBS:Kode_Apotik = GL_entryapotik
                  TBS:Kode_Barang = APD:Kode_brg
                  TBS:Tahun = Tahun_ini
                  GET(Tbstawal,TBS:kdap_brg)
                  IF ERRORCODE() = 0
                      CASE MONTH(TODAY())
                          OF 1
                              IF TBS:Januari= 0
                                  TBS:Januari = GSTO:Saldo
                                  PUT(Tbstawal)
                              END
                          OF 2
                              IF TBS:Februari= 0
                                  TBS:Februari = GSTO:Saldo
                                  PUT(Tbstawal)
                              END
                          OF 3
                              IF TBS:Maret= 0
                                  TBS:Maret = GSTO:Saldo
                                  PUT(Tbstawal)
                              END
                          OF 4
                              IF TBS:April= 0
                                  TBS:April = GSTO:Saldo
                                  PUT(Tbstawal)
                              END
                          OF 5
                              IF TBS:Mei= 0
                                  TBS:Mei = GSTO:Saldo
                                  PUT(Tbstawal)
                              END
                          OF 6
                              IF TBS:Juni= 0
                                  TBS:Juni = GSTO:Saldo
                                  PUT(Tbstawal)
                              END
                          OF 7
                              IF TBS:Juli= 0
                                  TBS:Juli = GSTO:Saldo
                                  PUT(Tbstawal)
                              END
                          OF 8
                              IF TBS:Agustus= 0
                                  TBS:Agustus = GSTO:Saldo
                                  PUT(Tbstawal)
                              END
                          OF 9
                              IF TBS:September= 0
                                  TBS:September = GSTO:Saldo
                                  PUT(Tbstawal)
                              END
                              
                          OF 10
                              IF TBS:Oktober= 0
                                  TBS:Oktober = GSTO:Saldo
                                  PUT(Tbstawal)
                              END
                      
                          OF 11
                              IF TBS:November= 0
                                  TBS:November = GSTO:Saldo
                                  PUT(Tbstawal)
                              END
                          OF 12
                              IF TBS:Desember= 0
                                  TBS:Desember = GSTO:Saldo
                                  PUT(Tbstawal)
                              END
                      END
      
                  ELSE
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
                      TBS:Kode_Apotik = GL_entryapotik
                      TBS:Kode_Barang = GSTO:Kode_Barang
                      TBS:Tahun = Tahun_ini
                      ADD(Tbstawal)
                      IF ERRORCODE() > 0
                      END
      
                  END
                  !end ngisi tbstawal
      !!
      !!            GSTO:Saldo = GSTO:Saldo + APD:Jumlah
      !!            Access:GStokAptk.Update()
      !!        ELSE
      !!            GSTO:Kode_Apotik = GL_entryapotik
      !!            GSTO:Kode_Barang = APD:Kode_brg
      !!            GSTO:Saldo = APD:Jumlah
      !!            GSTO:Harga_Dasar = APD:Total/APD:Jumlah
      !!            Access:GStokAptk.Insert()
      !!
      !!            !tulist stok= 0 ke Aawalbulan
      !!            TBS:Kode_Apotik = APTH:ApotikKeluar
      !!            TBS:Kode_Barang = APTO:Kode_Brg
      !!            TBS:Tahun = Tahun_ini
      !!            GET(Tbstawal,TBS:kdap_brg)
      !!            IF ERRORCODE() = 0
      !!                CASE MONTH(TODAY())
      !!                    OF 1
      !!                        IF TBS:Januari= 0
      !!                            TBS:Januari = 0
      !!                            PUT(Tbstawal)
      !!                        END
      !!                    
      !!                    OF 2
      !!                        IF TBS:Februari= 0
      !!                            TBS:Februari = 0
      !!                            PUT(Tbstawal)
      !!                        END
      !!                        
      !!                    OF 3
      !!                        IF TBS:Maret= 0
      !!                            TBS:Maret = 0
      !!                            PUT(Tbstawal)
      !!                        END
      !!                        
      !!                    OF 4
      !!                        IF TBS:April= 0
      !!                            TBS:April = 0
      !!                            PUT(Tbstawal)
      !!                        END
      !!                        
      !!                    OF 5
      !!                        IF TBS:Mei= 0
      !!                            TBS:Mei = 0
      !!                            PUT(Tbstawal)
      !!                        END
      !!                        
      !!                    OF 6
      !!                        IF TBS:Juni= 0
      !!                            TBS:Juni = 0
      !!                            PUT(Tbstawal)
      !!                        END
      !!                        
      !!                    OF 7
      !!                        IF TBS:Juli= 0
      !!                            TBS:Juli = 0
      !!                            PUT(Tbstawal)
      !!                        END
      !!                        
      !!                    OF 8
      !!                        IF TBS:Agustus= 0
      !!                            TBS:Agustus = 0
      !!                            PUT(Tbstawal)
      !!                        END
      !!                        
      !!                    OF 9
      !!                        IF TBS:September= 0
      !!                            TBS:September = 0
      !!                            PUT(Tbstawal)
      !!                        END
      !!                        
      !!                    OF 10
      !!                        IF TBS:Oktober= 0
      !!                            TBS:Oktober = 0
      !!                            PUT(Tbstawal)
      !!                        END
      !!                        
      !!                    OF 11
      !!                        IF TBS:November= 0
      !!                            TBS:November = 0
      !!                            PUT(Tbstawal)
      !!                        END
      !!                    OF 12
      !!                        IF TBS:Desember= 0
      !!                            TBS:Desember = 0
      !!                            PUT(Tbstawal)
      !!                        END
      !!                END
      !!
      !!            ELSE
      !!                CASE MONTH(TODAY())
      !!                    OF 1
      !!                        TBS:Januari = 0
      !!                    OF 2
      !!                        TBS:Februari = 0
      !!                    OF 3
      !!                        TBS:Maret = 0
      !!                    OF 4
      !!                        TBS:April = 0
      !!                    OF 5
      !!                        TBS:Mei = 0
      !!                    OF 6
      !!                        TBS:Juni = 0
      !!                    OF 7
      !!                        TBS:Juli = 0
      !!                    OF 8
      !!                        TBS:Agustus = 0
      !!                    OF 9
      !!                        TBS:September = 0
      !!                    OF 10
      !!                        TBS:Oktober = 0
      !!                    OF 11
      !!                        TBS:November = 0
      !!                    OF 12
      !!                        TBS:Desember = 0
      !!                END
      !!                TBS:Kode_Apotik = APTH:ApotikKeluar
      !!                TBS:Kode_Barang = GSTO:Kode_Barang
      !!                TBS:Tahun = Tahun_ini
      !!                ADD(Tbstawal)
      !!                IF ERRORCODE() > 0
      !!                END
      !!            END
      !!            ! End nulis stok 0 ke tbstawal
      !!
      !!        END
      !!
      !!        ! **** tulis ke appotkem ***
      !!        APP1:N0_tran = APH:N0_tran
      !!        APP1:Kode_brg = APD:Kode_brg
      !!        GET(APpotkem,APP1:key_nota_brg)
      !!        IF ERRORCODE() = 0
      !!            APP1:Jumlah = APP1:Jumlah + APD:Jumlah
      !!            Access:APpotkem.Update()
      !!        ELSE
      !!            APP1:N0_tran = APH:N0_tran
      !!            APP1:Kode_brg = APD:Kode_brg
      !!            APP1:Jumlah = APD:Jumlah
      !!            Access:APpotkem.Insert()
      !!        END
      !!        ! *** end appotkem ***
      !!
      !!        GBAR:Kode_brg = APD:Kode_brg
      !!        Access:GBarang.Fetch(GBAR:KeyKodeBrg)
      !!        IF ERRORCODE() = 0
      !!                    GBAR:Stok_Total = GBAR:Stok_Total+APD:Jumlah
      !!                    Access:GBarang.Update()
      !!        ELSE
      !!                    MESSAGE ('LAPORKAN PADA EDP, KODE '&APD:Kode_brg&' TIDAK ADA DALAM TABEL')
      !!        END
      !!        APD:Jumlah = - APD:Jumlah
      !!        APD:Total = - APD:Total
      !!        PUT(APDTRANS)
          END
      END
      !!!!ANOp:Nomor = APH:N0_tran
      !!!!Get(Ano_pakai,ANOp:key_isi)
      !!!!DELETE(ANo_Pakai)
      !!
      !apklutmp{prop:sql}='delete from dba.apklutmp where N0_tran='''&glo::no_nota&''''
    OF ?Cancel
      !IF SELF.REQUEST=1
         !DO BATAL_D_UTAMA
      !END
      
      !SET(APklutmp)
      !APKL:N0_tran = glo::no_nota
      !SET(APKL:key_nota,APKL:key_nota)
      !LOOP
      !    IF Access:APklutmp.Next()<>LEVEL:BENIGN OR APKL:N0_tran <> glo::no_nota THEN BREAK.
      !    DELETE(APklutmp)
      !END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button7
      ThisWindow.Update
      globalrequest=selectrecord
      glo:mr=Loc::no_mr
      SelectJTransaksiMR
      JHB:NOMOR=JTra:No_Nota
      if access:jhbilling.fetch(JHB:KNOMOR)=level:benign then
      
         APH:NoNota=JTra:No_Nota
      
      else
         message('Nomor Billing tidak ada !')
      end
      display
    OF ?Button8
      ThisWindow.Update
      !if vl_sudah=0
         IF LOC::TOTAL <> 0
             !vl_round = round(APH:Biaya)
             !Pembulatan
             vl_pembulatandtg=0
             vl_selisih=0
             vl_hasil=0
             vl_real=APH:Biaya
             vl_seribu=round(APH:Biaya,1000)
             !message(vl_seribu)
             if vl_seribu<vl_real then
                vl_selisih=vl_real-vl_seribu
                !message(vl_selisih)
                if vl_selisih>500 then
                   vl_selisih=500
                   vl_hasil=vl_seribu+vl_selisih
                else
                   vl_hasil=vl_seribu
                end
             else
                vl_selisih=vl_seribu-vl_real
                !message(vl_selisih)
                if vl_selisih>400 then
                   vl_hasil=vl_seribu-500
                else
                   vl_hasil=vl_seribu
                end
             end
             
             !selesai
             !APH:Biaya = ROUND( ((APH:Biaya /100) + 0.4999) , 1 ) *100
             APH:Biaya = vl_hasil
             !IF discount <>0
                 !loc::copy_total = APH:Biaya + discount
                 !masuk_disc = 1
                 !?discount{PROP:READONLY}=FALSE
             !ELSE
                 loc::copy_total = APH:Biaya
             !END
             
      !       SET( BRW4::View:Browse)
      !           LOOP
      !               NEXT(BRW4::View:Browse)
                     !IF APD:Camp = 0 AND APD:N0_tran = APH:N0_tran
      !                   message(vl_hasil&' '&APD:Total&' '&loc::copy_total&' '&LOC::TOTAL)
      !                   message(APD:Total + loc::copy_total - LOC::TOTAL)
                         vl_pembulatandtg=APD:Total
                         APD:Total = APD:Total + loc::copy_total - LOC::TOTAL
                         if vl_pembulatandtg=APD:total_dtg then
                              APD:total_dtg=APD:Total
                         end
                         PUT(APDTRANS)
      !                   BREAK
                     !END
      !               IF ERRORCODE() > 0  OR  APD:N0_tran <> APH:N0_tran
      !                   SET( BRW4::View:Browse)
      !                   LOOP
      !                       NEXT( BRW4::View:Browse )
      !                       IF APD:Kode_brg = '_Campur'
      !                           APD:Total = APD:Total + loc::copy_total - LOC::TOTAL
      !                           PUT(APDTRANS)
      !                           SET(APDTcam)
      !                           APD1:N0_tran = APH:N0_tran
      !                           APD1:Camp = APD:Camp
      !                           SET (APD1:by_tranno,APD1:by_tranno)
      !                           LOOP
      !                               NEXT( APDTcam )
      !                               IF APD1:Kode_brg = '_Biaya'
      !                                   APD1:Total = APD1:Total  + loc::copy_total - LOC::TOTAL
      !                                   PUT(APDTcam)
      !                                   BREAK
      !                               END
      !                           END
      !
      !                           BREAK
      !                       END
      !                   END
      !                   BREAK
      !               END
                     
      !           END
                 LOC::TOTAL = loc::copy_total
      !       DISPLAY
             BRW4.RESETSORT(1)
            
         END
      !end
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
    OF EVENT:AlertKey
      !select(?cancel)
      !presskey( 13)
    OF EVENT:OpenWindow
      !IF glo::form_insert = 0
      !    POST(EVENT:CLOSEWINDOW)
      !END
    OF EVENT:Timer
      IF APH:Biaya = 0 and glo:ktt=0
          ?OK{PROP:DISABLE}=1
      ELSE
          ?OK{PROP:DISABLE}=0
      END
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:OpenWindow
      APH:NIP          =gl:nik
      APH:Kontrak      =gl:kontrak
      APH:NoNota       =gl:nota
      APH:cara_bayar   =gl:cara_bayar
      jtransaksi{prop:sql}='select * from dba.jtransaksi where No_Nota='''&gl:nota&''''
      jtransaksi{prop:sql}='select * from dba.jtransaksi where No_Nota='''&gl:nota&''''
      if access:jtransaksi.next()=level:benign then
         APH:Asal         =JTra:Kode_poli
         APH:LamaBaru     =JTra:LamaBaru
         APH:NoNota       =JTra:No_Nota
      end
      display
      
      !jtransaksi{prop:sql}='select * from dba.jtransaksi where nomor_mr='&Loc::no_mr&' order by Tanggal'
      !jtransaksi{prop:sql}='select * from dba.jtransaksi where nomor_mr='&Loc::no_mr&' order by Tanggal'
      !loop
      !   if access:jtransaksi.next()<>level:benign then break.
      !   APH:Asal         =JTra:Kode_poli
      !   APH:NIP          =JTra:NIP
      !   APH:Kontrak      =JTra:Kontraktor
      !   APH:LamaBaru     =JTra:LamaBaru
      !   APH:cara_bayar   =JTra:Kode_Transaksi
      !   APH:NoNota       =JTra:No_Nota
      !   display
      !end
      if self.request=1 then
         do Isi_Nomor
      end
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APH:Biaya = loc::total - loc::diskon
  APH:Harga_Dasar = GLO:HARGA_DASAR_RETUR
  APH:biaya_dtg = loc:total_dtg


BRW4.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW4.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:5
    SELF.ChangeControl=?Change:5
    SELF.DeleteControl=?Delete:5
  END


BRW4.ResetFromView PROCEDURE

loc::total:Sum       REAL                                  ! Sum variable for browse totals
loc::diskon:Sum      REAL                                  ! Sum variable for browse totals
GLO:HARGA_DASAR_RETUR:Sum REAL                             ! Sum variable for browse totals
loc:total_dtg:Sum    REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:APDTRANS.SetQuickScan(1)
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
    IF (APD:ktt=0)
      loc::total:Sum += APD:Total
    END
    IF (APD:ktt=0)
      loc::diskon:Sum += APD:Diskon
    END
    IF (APD:ktt=0)
      GLO:HARGA_DASAR_RETUR:Sum += APD:Harga_Dasar * APD:Jumlah
    END
    IF (APD:ktt=0)
      loc:total_dtg:Sum += APD:total_dtg
    END
  END
  loc::total = loc::total:Sum
  loc::diskon = loc::diskon:Sum
  GLO:HARGA_DASAR_RETUR = GLO:HARGA_DASAR_RETUR:Sum
  loc:total_dtg = loc:total_dtg:Sum
  PARENT.ResetFromView
  Relate:APDTRANS.SetQuickScan(0)
  SETCURSOR()


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

Trig_BrowseKeluarRuangan PROCEDURE                         ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
loc::thread          BYTE                                  !
BRW1::View:Browse    VIEW(AptoInHe)
                       PROJECT(APTI:Kode_Apotik)
                       PROJECT(APTI:Tanggal)
                       PROJECT(APTI:Kd_ruang)
                       PROJECT(APTI:Total_Biaya)
                       PROJECT(APTI:N0_tran)
                       PROJECT(APTI:User)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APTI:Kode_Apotik       LIKE(APTI:Kode_Apotik)         !List box control field - type derived from field
APTI:Tanggal           LIKE(APTI:Tanggal)             !List box control field - type derived from field
APTI:Kd_ruang          LIKE(APTI:Kd_ruang)            !List box control field - type derived from field
APTI:Total_Biaya       LIKE(APTI:Total_Biaya)         !List box control field - type derived from field
APTI:N0_tran           LIKE(APTI:N0_tran)             !List box control field - type derived from field
APTI:N0_tran_NormalFG  LONG                           !Normal forground color
APTI:N0_tran_NormalBG  LONG                           !Normal background color
APTI:N0_tran_SelectedFG LONG                          !Selected forground color
APTI:N0_tran_SelectedBG LONG                          !Selected background color
APTI:User              LIKE(APTI:User)                !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW6::View:Browse    VIEW(AptoInDe)
                       PROJECT(APTD:Kode_Brg)
                       PROJECT(APTD:Jumlah)
                       PROJECT(APTD:Biaya)
                       PROJECT(APTD:N0_tran)
                       JOIN(GBAR:KeyKodeBrg,APTD:Kode_Brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Ket1)
                         PROJECT(GBAR:Ket2)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
APTD:Kode_Brg          LIKE(APTD:Kode_Brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Ket1              LIKE(GBAR:Ket1)                !List box control field - type derived from field
GBAR:Ket2              LIKE(GBAR:Ket2)                !List box control field - type derived from field
APTD:Jumlah            LIKE(APTD:Jumlah)              !List box control field - type derived from field
APTD:Biaya             LIKE(APTD:Biaya)               !List box control field - type derived from field
APTD:N0_tran           LIKE(APTD:N0_tran)             !Primary key field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Transaksi Instalasi Farmasi ke Instalasi Lain'),AT(0,0,335,196),FONT('MS Sans Serif',10,COLOR:Black,),IMM,HLP('Tran_Ruang'),SYSTEM,GRAY,RESIZE,MDI
                       LIST,AT(8,20,317,60),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('43L(2)|FM~SubFarmasi~C(0)@s5@50R(2)|M~Tanggal~C(0)@D06@41L(2)|M~Inst. Tujuan~C(0' &|
   ')@s5@55R(2)|M~Total Biaya~C(0)@n-15.2@65L(2)|M*~No. Transaksi~@s15@20L(2)|M~User' &|
   '~@s4@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(166,41,45,14),USE(?Select:2),HIDE
                       BUTTON('T&ransaksi (F4)'),AT(270,84,58,20),USE(?Insert:3),LEFT,KEY(F4Key),ICON('INSERT.ICO')
                       ELLIPSE,AT(180,1,12,12),USE(?Ellipse1),COLOR(COLOR:Red),FILL(COLOR:Red)
                       ELLIPSE,AT(249,1,12,12),USE(?Ellipse1:2),COLOR(0FF8000H),FILL(0FF8000H)
                       LIST,AT(6,109,324,67),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('47L(2)|FM~Kode Barang~C(0)@s10@94L(2)|M~Nama Barang~C(0)@s40@66L(2)|M~Kemasan~C(' &|
   '0)@s50@57L(2)|M~Keterangan~C(0)@s50@57R(1)|M~Jumlah~C(0)@n-14.2@56R(2)M~Biaya~L@' &|
   'n-14.2@'),FROM(Queue:Browse)
                       STRING('= Obat Masuk'),AT(195,3),USE(?String1),TRN
                       STRING('= Obat Keluar'),AT(263,3),USE(?String1:2),TRN
                       BUTTON('&Change'),AT(246,41,45,14),USE(?Change:3),HIDE,DEFAULT
                       BUTTON('&Delete'),AT(198,51,45,14),USE(?Delete:3),HIDE
                       SHEET,AT(4,4,327,103),USE(?CurrentTab),COLOR(0BAA738H)
                         TAB('Nomor Transaksi'),USE(?Tab:2)
                           BUTTON('&Cetak Transaksi'),AT(131,86,81,14),USE(?Button8),LEFT,ICON(ICON:Print)
                           BUTTON('&Query'),AT(216,86,45,14),USE(?Query)
                           PROMPT('N0 tran:'),AT(11,89),USE(?APTI:N0_tran:Prompt)
                           ENTRY(@s15),AT(61,89,60,10),USE(APTI:N0_tran),MSG('nomor transaksi'),TIP('nomor transaksi')
                         END
                         TAB('Kode subFarmasi'),USE(?Tab:3),COLOR(027922DH)
                           BUTTON('Pilih Sub Farmasi'),AT(164,87,62,14),USE(?SelectGApotik),FONT('Times New Roman',,,)
                         END
                         TAB('Kode Tujuan'),USE(?Tab:4),COLOR(0D3892EH)
                         END
                       END
                       BUTTON('&Keluar'),AT(270,178,58,17),USE(?Close),LEFT,ICON('Exit.ico')
                       BUTTON('Help'),AT(121,40,45,14),USE(?Help),HIDE,STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
QBE7                 QueryFormClass                        ! QBE List Class. 
QBV7                 QueryFormVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetFromAsk           PROCEDURE(*BYTE Request,*BYTE Response),DERIVED ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
SetQueueRecord         PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW1::Sort1:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW1::Sort2:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 3
BRW6                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
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
  GlobalErrors.SetProcedureName('Trig_BrowseKeluarRuangan')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  loc::thread=glo::mainthreadno
  !POST(EVENT:Disable_Ruangan,,loc::thread)
  
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:AptoInDe.Open                                     ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Access:GApotik.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:AptoInHe,SELF) ! Initialize the browse manager
  BRW6.Init(?List,Queue:Browse.ViewPosition,BRW6::View:Browse,Queue:Browse,Relate:AptoInDe,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  QBE7.Init(QBV7, INIMgr,'Trig_BrowseKeluarRuangan', GlobalErrors)
  QBE7.QkSupport = True
  QBE7.QkMenuIcon = 'QkQBE.ico'
  QBE7.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon APTI:Kode_Apotik for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,APTI:key_apotik) ! Add the sort order for APTI:key_apotik for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,APTI:Kode_Apotik,1,BRW1)       ! Initialize the browse locator using  using key: APTI:key_apotik , APTI:Kode_Apotik
  BRW1.SetFilter('(apti:kode_apotik=GL_entryapotik)')      ! Apply filter expression to browse
  BRW1::Sort2:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon APTI:Kd_ruang for sort order 2
  BRW1.AddSortOrder(BRW1::Sort2:StepClass,APTI:key_tujuan) ! Add the sort order for APTI:key_tujuan for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,APTI:Kd_ruang,1,BRW1)          ! Initialize the browse locator using  using key: APTI:key_tujuan , APTI:Kd_ruang
  BRW1.SetFilter('(apti:kode_apotik=GL_entryapotik)')      ! Apply filter expression to browse
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon APTI:N0_tran for sort order 3
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,APTI:key_no_tran) ! Add the sort order for APTI:key_no_tran for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(?APTI:N0_tran,APTI:N0_tran,1,BRW1) ! Initialize the browse locator using ?APTI:N0_tran using key: APTI:key_no_tran , APTI:N0_tran
  BRW1.SetFilter('(apti:kode_apotik=GL_entryapotik)')      ! Apply filter expression to browse
  BRW1.AddField(APTI:Kode_Apotik,BRW1.Q.APTI:Kode_Apotik)  ! Field APTI:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(APTI:Tanggal,BRW1.Q.APTI:Tanggal)          ! Field APTI:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(APTI:Kd_ruang,BRW1.Q.APTI:Kd_ruang)        ! Field APTI:Kd_ruang is a hot field or requires assignment from browse
  BRW1.AddField(APTI:Total_Biaya,BRW1.Q.APTI:Total_Biaya)  ! Field APTI:Total_Biaya is a hot field or requires assignment from browse
  BRW1.AddField(APTI:N0_tran,BRW1.Q.APTI:N0_tran)          ! Field APTI:N0_tran is a hot field or requires assignment from browse
  BRW1.AddField(APTI:User,BRW1.Q.APTI:User)                ! Field APTI:User is a hot field or requires assignment from browse
  BRW6.Q &= Queue:Browse
  BRW6.AddSortOrder(,APTD:key_no_nota)                     ! Add the sort order for APTD:key_no_nota for sort order 1
  BRW6.AddRange(APTD:N0_tran,Relate:AptoInDe,Relate:AptoInHe) ! Add file relationship range limit for sort order 1
  BRW6.AddLocator(BRW6::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW6::Sort0:Locator.Init(,APTD:Kode_Brg,1,BRW6)          ! Initialize the browse locator using  using key: APTD:key_no_nota , APTD:Kode_Brg
  BRW6.AddField(APTD:Kode_Brg,BRW6.Q.APTD:Kode_Brg)        ! Field APTD:Kode_Brg is a hot field or requires assignment from browse
  BRW6.AddField(GBAR:Nama_Brg,BRW6.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW6.AddField(GBAR:Ket1,BRW6.Q.GBAR:Ket1)                ! Field GBAR:Ket1 is a hot field or requires assignment from browse
  BRW6.AddField(GBAR:Ket2,BRW6.Q.GBAR:Ket2)                ! Field GBAR:Ket2 is a hot field or requires assignment from browse
  BRW6.AddField(APTD:Jumlah,BRW6.Q.APTD:Jumlah)            ! Field APTD:Jumlah is a hot field or requires assignment from browse
  BRW6.AddField(APTD:Biaya,BRW6.Q.APTD:Biaya)              ! Field APTD:Biaya is a hot field or requires assignment from browse
  BRW6.AddField(APTD:N0_tran,BRW6.Q.APTD:N0_tran)          ! Field APTD:N0_tran is a hot field or requires assignment from browse
  BRW6.AddField(GBAR:Kode_brg,BRW6.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_BrowseKeluarRuangan',QuickWindow)     ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE7,1)
  BRW1.AskProcedure = 1
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
    Relate:AptoInDe.Close
    Relate:Nomor_SKR.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_BrowseKeluarRuangan',QuickWindow)  ! Save window data to non-volatile store
  END
  !POST(EVENT:Enable_Ruangan,,loc::thread)
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
    Trig_UpdateAptoInHe1
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
    OF ?Insert:3
      NOM1:No_urut=2
      access:nomor_skr.fetch(NOM1:PrimaryKey)
      if not(errorcode()) then
         if sub(format(year(today()),@p####p),3,2)<format(sub(clip(NOM1:No_Trans),4,2),@n2) then
            message('Tanggal sistem lebih kecil dari tanggal penomoran, tidak bisa dilanjutkan !!!')
            cycle
         elsif month(today())<format(sub(clip(NOM1:No_Trans),6,2),@n2) and sub(format(year(today()),@p####p),3,2)=format(sub(clip(NOM1:No_Trans),4,2),@n2) then
            message('Tanggal sistem lebih kecil dari tanggal penomoran, tidak bisa dilanjutkan !!!')
            cycle
         end
      end
    OF ?Button8
      glo:no_trans_ruang=APTI:N0_tran
      display
      IF APTI:Total_Biaya>=0 THEN
         start(cetak_tran_ruang1,25000)
      ELSE
         start(cetak_tran_ruang1_Retur,25000)
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Change:3
      ThisWindow.Update
      cycle
    OF ?Delete:3
      ThisWindow.Update
      cycle
    OF ?SelectGApotik
      ThisWindow.Update
      GlobalRequest = SelectRecord
      SelectGApotik
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


BRW1.ResetFromAsk PROCEDURE(*BYTE Request,*BYTE Response)

  CODE
  PARENT.ResetFromAsk(Request,Response)
  glo:no_trans_ruang=APTI:N0_tran
  if GL_entryapotik='FM11' or GL_entryapotik='FM12' then
  else
     IF request=1 and RESPONSE = 1 then
        IF APTI:Total_Biaya>=0 THEN
           start(Cetak_tran_ruang1,25000)
        ELSE
           start(Cetak_tran_ruang1_Retur,25000)
        END
     END
  end


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


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (apti:total_biaya<0)
    SELF.Q.APTI:N0_tran_NormalFG = 255                     ! Set conditional color values for APTI:N0_tran
    SELF.Q.APTI:N0_tran_NormalBG = -1
    SELF.Q.APTI:N0_tran_SelectedFG = 255
    SELF.Q.APTI:N0_tran_SelectedBG = -1
  ELSIF (apti:total_biaya>=0)
    SELF.Q.APTI:N0_tran_NormalFG = 16744448                ! Set conditional color values for APTI:N0_tran
    SELF.Q.APTI:N0_tran_NormalBG = -1
    SELF.Q.APTI:N0_tran_SelectedFG = 16744448
    SELF.Q.APTI:N0_tran_SelectedBG = -1
  ELSE
    SELF.Q.APTI:N0_tran_NormalFG = -1                      ! Set color values for APTI:N0_tran
    SELF.Q.APTI:N0_tran_NormalBG = -1
    SELF.Q.APTI:N0_tran_SelectedFG = -1
    SELF.Q.APTI:N0_tran_SelectedBG = -1
  END


BRW6.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

