

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N180.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N006.INC'),ONCE        !Req'd for module callout resolution
                     END


Trig_UpdateCampurBpjs PROCEDURE                            ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
tombol_ok            BYTE                                  !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
loc::hitung          BYTE                                  !
History::APD1:Record LIKE(APD1:RECORD),THREAD
QuickWindow          WINDOW('Merubah Data Obat Campur'),AT(,,325,165),FONT('Arial',8,,),IMM,HLP('UpdateAPDTcam'),SYSTEM,GRAY,MDI
                       PROMPT('No Transaksi :'),AT(77,4),USE(?APD1:N0_tran:Prompt)
                       ENTRY(@s15),AT(130,4,64,10),USE(APD1:N0_tran),DISABLE,MSG('nomor transaksi'),TIP('nomor transaksi')
                       PROMPT('No. Camp. :'),AT(205,4),USE(?APD1:Camp:Prompt),FONT('Times New Roman',10,COLOR:Black,)
                       ENTRY(@n2),AT(258,5,40,10),USE(APD1:Camp),DISABLE
                       SHEET,AT(7,16,315,117),USE(?CurrentTab)
                         TAB('Data Obat'),USE(?Tab:1)
                           PROMPT('Kode Barang:'),AT(11,40),USE(?APD1:Kode_brg:Prompt)
                           ENTRY(@s10),AT(65,37,65,13),USE(APD1:Kode_brg),FONT('Times New Roman',14,COLOR:Black,),MSG('Kode Barang'),TIP('Kode Barang')
                           BUTTON('&H'),AT(133,36,12,12),USE(?CallLookup),KEY(F2Key)
                           STRING(@s40),AT(157,39),USE(GBAR:Nama_Brg)
                           PROMPT('Jumlah:'),AT(11,60),USE(?APD1:Jumlah:Prompt)
                           ENTRY(@n-14.2),AT(65,60,65,13),USE(APD1:Jumlah),DECIMAL(14),FONT('Times New Roman',12,COLOR:Black,),MSG('Jumlah'),TIP('Jumlah')
                           IMAGE('YRPLUS.ICO'),AT(183,58,19,20),USE(?Image1)
                           IMAGE('YRPLUS.ICO'),AT(203,58),USE(?Image2)
                           GROUP('Nilai Konversi'),AT(233,60,75,49),USE(?Group1),BOXED,FONT('Times New Roman',10,COLOR:Black,)
                             STRING(@s10),AT(244,71),USE(APB:Sat_besar),LEFT(1)
                             STRING('='),AT(291,71),USE(?String5),FONT(,,,FONT:bold)
                             STRING(@n-14),AT(244,84,52,9),USE(APB:Nilai_konversi)
                             STRING(@s10),AT(244,95),USE(APB:Sat_kecil,,?APB:Sat_kecil:2)
                           END
                           STRING(@s10),AT(139,63),USE(APB:Sat_kecil),FONT('Times New Roman',10,COLOR:Black,)
                           BUTTON('Hitung (F4)'),AT(65,79,65,26),USE(?Button5),LEFT,FONT('Arial',8,,FONT:bold),KEY(F4Key),ICON(ICON:Exclamation)
                           PROMPT('Total:'),AT(11,111),USE(?APD1:Total:Prompt)
                           ENTRY(@n11.2),AT(65,111,65,13),USE(APD1:Total),DECIMAL(14),FONT('Times New Roman',10,COLOR:Black,),MSG('Harga Dasar'),TIP('Harga Dasar')
                         END
                       END
                       BUTTON('&OK [End]'),AT(203,138,83,22),USE(?OK),LEFT,FONT('Arial',10,,),KEY(EndKey),ICON(ICON:Save),DEFAULT
                       BUTTON('&Batal'),AT(100,139,83,22),USE(?Cancel),LEFT,FONT('Arial',10,,),KEY(EscKey),ICON(ICON:Cross)
                       BUTTON('Help'),AT(1,143,45,14),USE(?Help),STD(STD:Help)
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
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  ?APD1:Total{PROP:READONLY}=TRUE
  APD1:Jumlah{PROP:DISABLE}=1
  IF Dtd_ndtd = 2 THEN ?Button5{PROP:DISABLE}=1.
  ?OK{PROP:DISABLE}=1
  APD1:Camp    =glo::campur
  APD1:N0_tran =glo::nomor
  tombol_ok = 0
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_UpdateCampurBpjs')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APD1:N0_tran:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APD1:Record,History::APD1:Record)
  SELF.AddHistoryField(?APD1:N0_tran,1)
  SELF.AddHistoryField(?APD1:Camp,6)
  SELF.AddHistoryField(?APD1:Kode_brg,2)
  SELF.AddHistoryField(?APD1:Jumlah,3)
  SELF.AddHistoryField(?APD1:Total,5)
  SELF.AddUpdateFile(Access:APDTcam)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:APBRGCMP.Open                                     ! File APHTRANSBPJS used by this procedure, so make sure it's RelationManager is open
  Relate:APHTRANSBPJS.Open                                 ! File APHTRANSBPJS used by this procedure, so make sure it's RelationManager is open
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:APDTcam
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
  INIMgr.Fetch('Trig_UpdateCampurBpjs',QuickWindow)        ! Restore window settings from non-volatile store
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
    Relate:APHTRANSBPJS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_UpdateCampurBpjs',QuickWindow)     ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = APD1:Kode_brg                            ! Assign linking field value
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
    cari_brg_lokal4
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
    OF ?APD1:Kode_brg
      !cek tabel obat campur (apbrgcmp)
      APB:Kode_brg= APD1:Kode_brg
      GET(APBRGCMP,APB:by_kd_barang)
      IF ERRORCODE()
          MESSAGE( 'Barang Tidak Terdapat pada Tabel Obat Campur')
          SELECT (?APD1:Kode_brg)
          ?APD1:Jumlah{PROP:DISABLE}=1
          CYCLE
      END
      !cocokkan tabel gbarang
      GBAR:Kode_brg = APD1:Kode_brg
      Access:GBarang.Fetch(GBAR:KeyKodeBrg)
      !cek di tabel gstokaptk
      GSTO:Kode_Apotik = GL_entryapotik
      GSTO:Kode_Barang=APD1:Kode_brg
      GET(GStokAptk,GSTO:KeyBarang)
      IF ERRORCODE()
          ?APD1:Jumlah{PROP:DISABLE}=1
          MESSAGE('Barang tersebut tidak ada dalam Daftar Obat')
          CLEAR (APD1:Kode_brg )
          CLEAR (GBAR:Nama_Brg)
          DISPLAY
          SELECT(?APD1:Kode_brg)
      ELSE
          ?APD1:Jumlah{PROP:DISABLE}=0
          select(?APD1:Jumlah)
      END
    OF ?APD1:Jumlah
      if tombol_ok = 0
      loc::hitung = 0
      IF APD1:Jumlah = 0
          ?OK{PROP:DISABLE}=1
      ELSE
          IF self.request = changerecord
                  GSTO:Kode_Apotik = GL_entryapotik
                  GSTO:Kode_Barang = APD1:Kode_brg
                  GET(GStokaptk,GSTO:KeyBarang)
          END
          APD1:J_potong = ROUND ((APD1:Jumlah / APB:Nilai_konversi) + 0.4999,1)
          IF APD1:J_potong > GSTO:Saldo
              MESSAGE('Jumlah Stok yang ada : ' & GSTO:Saldo )
              SELECT (?APD1:Jumlah)
              CYCLE
          END
          ?OK{PROP:DISABLE}=0
          CASE Glo:Rekap   !Glo:Rekap = cara pembayaran pasen
              OF 3
                  ! UNTUK pasien kontraktor, cari dahulu persentasenya
                  APO:KODE_KTR = GLO::back_up
                  APO:Kode_brg = APD1:Kode_brg
                  GET(APOBKONT,APO:by_kode_ktr)
                  IF ERRORCODE()
                      !Perhitungan biasa
                      CASE clip(glo_kls_rawat)
                          OF '1'
                              APD1:Total = GL_beaR + |
                              (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(Glo::rwt1 / 100 ))) * APD1:J_potong)
                          OF '2'
                              APD1:Total = GL_beaR + |
                              (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+( Glo::rwt2 / 100 ))) * APD1:J_potong)
                          OF '3'
                              APD1:Total = GL_beaR + |
                              (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(Glo::rwt3 / 100 ))) * APD1:J_potong)
                          OF 'VIP'
                              APD1:Total = GL_beaR + |
                              (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(Glo::rwtvip / 100 ))) * APD1:J_potong)
                          ELSE
                              APD1:Total = GL_beaR + |
                              (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(Glo::rwt1 / 100 ))) * APD1:J_potong)
                      END
                  ELSE
                      !kekecualian berdasarkan tabel ApobKont
                      APD1:Total = GL_beaR + |
                      (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(APO:PERS_TAMBAH / 100 ))) * APD1:J_potong)
                  END
              OF 2
                  CASE clip(glo_kls_rawat)
                      OF '1'
                          APD1:Total = GL_beaR + |
                          (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(Glo::rwt1 / 100 ))) * APD1:J_potong)
                      OF '2'
                          APD1:Total = GL_beaR + |
                          (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(Glo::rwt2 / 100 ))) * APD1:J_potong)
                      OF '3'
                          APD1:Total = GL_beaR + |
                          (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(Glo::rwt3 / 100 ))) * APD1:J_potong)
                      OF 'VIP'
                          APD1:Total = GL_beaR + |
                          (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(Glo::rwtvip / 100 ))) * APD1:J_potong)
                  END
              OF 1
                  APD1:Total = GL_beaR + ( GSTO:Harga_Dasar * APD1:J_potong)
          END
          APD1:Harga_Dasar = GSTO:Harga_Dasar
          DISPLAY
      END
      END
    OF ?Button5
      IF loc::hitung = 0
          APD1:Jumlah = GLO::jml_cmp * APD1:Jumlah
          APD1:J_potong = ROUND ( (APD1:Jumlah / APB:Nilai_konversi)+0.4999,1)
          IF APD1:J_potong > GSTO:Saldo
              MESSAGE('Jumlah Stok yang ada : ' & GSTO:Saldo )
              SELECT (?APD1:Jumlah)
              CYCLE
          END
          ?OK{PROP:DISABLE}=0
          CASE Glo:Rekap  !untuk menentukan cara bayar pasen
            OF 3
              ! UNTUK pasien kontraktor, cari dahulu persentasenya
              APO:KODE_KTR = GLO::back_up
              APO:Kode_brg = APD1:Kode_brg
              GET(APOBKONT,APO:by_kode_ktr)
              IF ERRORCODE()
                  !Perhitungan biasa
                  CASE clip(glo_kls_rawat)
                    OF '1'
                      APD1:Total = GL_beaR + |
                      (( GSTO:Harga_Dasar + (Glo::rwt1 * GSTO:Harga_Dasar / 100 )) * APD1:J_potong)
                    OF '2'
                      APD1:Total = GL_beaR + |
                      (( GSTO:Harga_Dasar + (Glo::rwt2 * GSTO:Harga_Dasar / 100 )) * APD1:J_potong)
                    OF '3'
                      APD1:Total = GL_beaR + |
                      (( GSTO:Harga_Dasar + (Glo::rwt3 * GSTO:Harga_Dasar / 100 )) * APD1:J_potong)
                    OF 'VIP'
                      APD1:Total = GL_beaR + |
                      (( GSTO:Harga_Dasar + (Glo::rwtvip * GSTO:Harga_Dasar / 100 )) * APD1:J_potong)
                  END
              ELSE
                  !kekecualian berdasarkan tabel ApobKont
                  APD1:Total = GL_beaR + |
                  (( GSTO:Harga_Dasar + (APO:PERS_TAMBAH * GSTO:Harga_Dasar / 100 )) * APD1:J_potong)
              END
            OF 2
              CASE clip(glo_kls_rawat)
                  OF '1'
                      APD1:Total = GL_beaR + |
                      (( GSTO:Harga_Dasar + (Glo::rwt1 * GSTO:Harga_Dasar / 100 )) * APD1:J_potong)
                  OF '2'
                      APD1:Total = GL_beaR + |
                      (( GSTO:Harga_Dasar + (Glo::rwt2 * GSTO:Harga_Dasar / 100 )) * APD1:J_potong)
                  OF '3'
                      APD1:Total = GL_beaR + |
                      (( GSTO:Harga_Dasar + (Glo::rwt3 * GSTO:Harga_Dasar / 100 )) * APD1:J_potong)
                  OF 'VIP'
                      APD1:Total = GL_beaR + |
                      (( GSTO:Harga_Dasar + (Glo::rwtvip * GSTO:Harga_Dasar / 100 )) * APD1:J_potong)
              END
            OF 1
              APD1:Total = GL_beaR + ( GSTO:Harga_Dasar * APD1:J_potong)
          END
          DISPLAY
          loc::hitung = 1
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?APD1:Kode_brg
      IF APD1:Kode_brg OR ?APD1:Kode_brg{Prop:Req}
        GBAR:Kode_brg = APD1:Kode_brg
        IF Access:GBarang.TryFetch(GBAR:KeyKodeBrg)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            APD1:Kode_brg = GBAR:Kode_brg
          ELSE
            SELECT(?APD1:Kode_brg)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      GBAR:Kode_brg = APD1:Kode_brg
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        APD1:Kode_brg = GBAR:Kode_brg
      END
      ThisWindow.Reset(1)
      !cek di tabel obat campur (apbrgcmp)
      APB:Kode_brg= APD1:Kode_brg
      GET(APBRGCMP,APB:by_kd_barang)
      IF ERRORCODE()
          MESSAGE( 'Barang Tidak Terdapat pada Tabel Obat Campur')
          SELECT (?APD1:Kode_brg)
          ?APD1:Jumlah{PROP:DISABLE}=1
          CYCLE
      END
      !cek di tabel gstokaptk
      GSTO:Kode_Apotik = GL_entryapotik
      GSTO:Kode_Barang=APD1:Kode_brg
      GET(GStokAptk,GSTO:KeyBarang)
      IF ERRORCODE()
          ?APD1:Jumlah{PROP:DISABLE}=1
          MESSAGE('Barang tersebut tidak ada dalam Daftar Obat')
          CLEAR (APD1:Kode_brg )
          CLEAR (GBAR:Nama_Brg)
          DISPLAY
          SELECT(?APD1:Kode_brg)
      ELSE
          ?APD1:Jumlah{PROP:DISABLE}=0
      END
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

