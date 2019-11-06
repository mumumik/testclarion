

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N176.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N177.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N178.INC'),ONCE        !Req'd for module callout resolution
                     END


Trig_UpdateRawatInapDetilBpjs PROCEDURE                    ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
FilesOpened          BYTE                                  !
vl_hna               REAL                                  !
vl_total             REAL                                  !
loc::disk_pcs        REAL                                  !
History::APD:Record  LIKE(APD:RECORD),THREAD
QuickWindow          WINDOW('Update '),AT(,,207,182),FONT('Arial',8,,),IMM,HLP('UpdateAPDTRANS'),ALRT(EscKey),GRAY,MDI
                       PROMPT('No.Trans :'),AT(74,1),USE(?APD:N0_tran:Prompt)
                       ENTRY(@s15),AT(107,1,48,10),USE(APD:N0_tran),DISABLE,MSG('nomor transaksi'),TIP('nomor transaksi')
                       SHEET,AT(4,13,201,133),USE(?CurrentTab)
                         TAB('Data Transaksi'),USE(?Tab:1)
                           STRING('BARU'),AT(62,15),USE(?String2),TRN,FONT('Arial',10,,FONT:bold)
                           PROMPT('Kode Barang:'),AT(8,29),USE(?APD:Kode_brg:Prompt)
                           ENTRY(@s10),AT(65,29,48,10),USE(APD:Kode_brg),DISABLE,COLOR(COLOR:White),MSG('Kode Barang'),TIP('Kode Barang')
                           BUTTON('&H'),AT(117,28,13,13),USE(?Button6),KEY(F2Key)
                           PROMPT('Nama Barang'),AT(8,44),USE(?Prompt4)
                           STRING(@s40),AT(60,44),USE(GBAR:Nama_Brg)
                           PROMPT('Jumlah:'),AT(8,57),USE(?APD:Jumlah:Prompt)
                           ENTRY(@n15.2),AT(65,57,48,10),USE(APD:Jumlah),RIGHT(2),MSG('Jumlah'),TIP('Jumlah')
                           PROMPT('Harga :'),AT(8,75),USE(?APD:Total:Prompt)
                           ENTRY(@n-15.2),AT(65,75,48,10),USE(APD:Total),RIGHT(2),MSG('Harga Dasar'),TIP('Harga Dasar'),READONLY
                           OPTION('Racik'),AT(66,86,73,24),USE(APD:Camp),BOXED
                             RADIO('Ya'),AT(70,95),USE(?APD:Camp:Radio1),VALUE('1')
                             RADIO('Tidak'),AT(101,95),USE(?APD:Camp:Radio1:2),VALUE('0')
                           END
                           ENTRY(@n5.2),AT(33,170,22,10),USE(loc::disk_pcs),DISABLE,HIDE,RIGHT(2)
                           PROMPT('%'),AT(57,170),USE(?APD:Jumlah:Prompt:2),DISABLE,HIDE
                           ENTRY(@n-15.2),AT(65,170,48,10),USE(APD:Diskon),DISABLE,HIDE,RIGHT(2),READONLY
                           PROMPT('Diskon:'),AT(8,170),USE(?APD:Diskon:Prompt),DISABLE,HIDE
                           PROMPT('Total:'),AT(8,114),USE(?vl_total:Prompt)
                           ENTRY(@n-15.2),AT(65,114,48,10),USE(vl_total),RIGHT(2)
                           PROMPT('Harga Dasar:'),AT(8,129),USE(?APD:Harga_Dasar:Prompt)
                           ENTRY(@n11.2),AT(65,129,48,10),USE(APD:Harga_Dasar),DISABLE,DECIMAL(14),MSG('Harga Dasar'),TIP('Harga Dasar')
                           BUTTON('Obat &Campur (F4)'),AT(125,55,70,31),USE(?Button5),HIDE,LEFT,FONT(,,,FONT:bold),KEY(F4Key)
                         END
                       END
                       BUTTON('&OK [End]'),AT(36,150,61,24),USE(?OK),LEFT,KEY(EndKey),ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(111,150,61,24),USE(?Cancel),LEFT,KEY(EscKey),ICON(ICON:Cross)
                       BUTTON('Help'),AT(157,1,45,14),USE(?Help),HIDE,STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
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
    ActionMessage = 'Adding a APDTRANS Record'
  OF ChangeRecord
    ActionMessage = 'Changing a APDTRANS Record'
  END
  !message(APH:cara_bayar)
  ?OK{PROP:DISABLE}=TRUE
  ?APD:Total{PROP:READONLY}=TRUE
  !if APD:Diskon<>0 then
  !   loc::disk_pcs=APD:Diskon*100/APD:Total
  !end
  !vl_total  =APD:Total-APD:Diskon
  display
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_UpdateRawatInapDetilBpjs')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APD:N0_tran:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APD:Record,History::APD:Record)
  SELF.AddHistoryField(?APD:N0_tran,1)
  SELF.AddHistoryField(?APD:Kode_brg,2)
  SELF.AddHistoryField(?APD:Jumlah,3)
  SELF.AddHistoryField(?APD:Total,4)
  SELF.AddHistoryField(?APD:Camp,5)
  SELF.AddHistoryField(?APD:Diskon,7)
  SELF.AddHistoryField(?APD:Harga_Dasar,6)
  SELF.AddUpdateFile(Access:APDTRANS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:APDTRANS.SetOpenRelated()
  Relate:APDTRANS.Open                                     ! File APHTRANSBPJS used by this procedure, so make sure it's RelationManager is open
  Relate:APHTRANSBPJS.Open                                 ! File APHTRANSBPJS used by this procedure, so make sure it's RelationManager is open
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APOBKONT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITbrRwt.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
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
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_UpdateRawatInapDetilBpjs',QuickWindow) ! Restore window settings from non-volatile store
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
    Relate:APHTRANSBPJS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_UpdateRawatInapDetilBpjs',QuickWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
    APD:Diskon = 0
  PARENT.PrimeFields


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
      GSTO:Kode_Apotik=GL_entryapotik
      GSTO:Kode_Barang=APD:Kode_brg
      GET(GStokAptk,GSTO:KeyBarang)
      IF ERRORCODE()
          ?APD:Jumlah{PROP:DISABLE}=1
          MESSAGE('Barang tersebut tidak ada dalam Daftar Obat')
          CLEAR (APD:Kode_brg )
          CLEAR (GBAR:Nama_Brg)
          DISPLAY
          SELECT(?APD:Kode_brg)
      ELSE
          ?APD:Jumlah{PROP:DISABLE}=0
          SELECT(?APD:Jumlah)
      END
    OF ?Button5
      glo::campur = glo::campur+1
      start(Trig_BrowseCampurBpjs,25000,APD:N0_tran)
    OF ?OK
      if APD:Total=0 then
         message('harga nol !!! tidak bisa ditransaksikan !!!')
         cycle
      end
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button6
      ThisWindow.Update
      APD:Jumlah       =0
      APD:Total        =0
      APD:Camp         =0
      APD:Harga_Dasar  =0
      APD:Diskon       =0
      !APD:Jum1         =0
      APD:Jum2         =0
      loc::disk_pcs    =0
      vl_total         =0
      display
      
      globalrequest=selectrecord
      cari_brg_lokal4bpjs
      APD:Kode_brg=GBAR:Kode_brg
      display
      !message(GL_entryapotik&' '&GBAR:Kode_brg)
      GSTO:Kode_Apotik=GL_entryapotik
      GSTO:Kode_Barang=GBAR:Kode_brg
      GET(GStokAptk,GSTO:KeyBarang)
      IF ERRORCODE()
          ?APD:Jumlah{PROP:DISABLE}=1
          MESSAGE('Barang tersebut tidak ada dalam Daftar Obat')
          CLEAR (APD:Kode_brg )
          CLEAR (GBAR:Nama_Brg)
          DISPLAY
          SELECT(?Button6)
      ELSE
          !untuk menentukan cara bayar pasen
      !    if Glo:Rekap=3 then
      !       JKon:KODE_KTR=APH:Kontrak
      !       access:jkontrak.fetch(JKon:KeyKodeKtr)
      !       JKOM:Kode    =JKon:GROUP
      !       access:jkontrakmaster.fetch(JKOM:PrimaryKey)
      !       if JKOM:StatusTabelObat=0 then
      !          JKOO:KodeKontrak  =JKOM:Kode
      !          JKOO:Kode_brg     =GBAR:Kode_brg
      !          if access:jkontrakobat.fetch(JKOO:by_kode_ktr)=level:benign then
      !             MESSAGE('Barang tersebut tidak ditanggung')
      !             ?APD:Jumlah{PROP:DISABLE}=1
      !             CLEAR (APD:Kode_brg )
      !             CLEAR (GBAR:Nama_Brg)
      !             DISPLAY
      !             SELECT(?Button6)
      !             cycle
      !          end
      !       elsif JKOM:StatusTabelObat=1 then
      !          JKOO:KodeKontrak  =JKOM:Kode
      !          JKOO:Kode_brg     =GBAR:Kode_brg
      !          if access:jkontrakobat.fetch(JKOO:by_kode_ktr)<>level:benign then
      !             MESSAGE('Barang tersebut tidak ditanggung')
      !             ?APD:Jumlah{PROP:DISABLE}=1
      !             CLEAR (APD:Kode_brg )
      !             CLEAR (GBAR:Nama_Brg)
      !             DISPLAY
      !             SELECT(?Button6)
      !             cycle
      !          end
      !       end
      !    end
      END
      ?APD:Jumlah{PROP:DISABLE}=0
      SELECT(?APD:Jumlah)
      display
      !message(GBAR:Kelompok)
    OF ?APD:Jumlah
      !IF tombol_ok = 0
         if APD:Kode_brg='' then
            ?OK{PROP:DISABLE}=1
            cycle
         else
         if GSTO:Saldo=0 then
            message('STOK KOSONG !!!')
            APD:Jumlah       =0
            APD:Total        =0
            APD:Camp         =0
            APD:Harga_Dasar  =0
            APD:Diskon       =0
            !APD:Jum1         =0
            APD:Jum2         =0
            loc::disk_pcs    =0
            vl_total         =0
            display
         elsif GSTO:Saldo<APD:Jumlah then
            message('STOK TINGGAL '&format(GSTO:Saldo,@n6)&' !!!')
            APD:Jumlah       =0
            APD:Total        =0
            APD:Camp         =0
            APD:Harga_Dasar  =0
            APD:Diskon       =0
            !APD:Jum1         =0
            APD:Jum2         =0
            loc::disk_pcs    =0
            vl_total         =0
            display
         else
            IF APD:Jumlah = 0
               ?OK{PROP:DISABLE}=1
            ELSE
               GBAR:Kode_brg     =APD:Kode_brg
               access:gbarang.fetch(GBAR:KeyKodeBrg)
      
               GSGD:Kode_brg      =APD:Kode_brg
               access:gstockgdg.fetch(GSGD:KeyKodeBrg)
      
               GSTO:Kode_Apotik = GL_entryapotik
               GSTO:Kode_Barang = APD:Kode_brg
               GET(GStokaptk,GSTO:KeyBarang)
               IF APD:Jumlah > GSTO:Saldo
                  MESSAGE('JUMLAH di stok tinggal :'& GSTO:Saldo)
                  SELECT(?APD:Jumlah)
                  CYCLE
               END
               ?OK{PROP:DISABLE}=0
               if GBAR:Kelompok=28 then
                  if GBAR:StatusGen=1 or GBAR:StatusGen=3 then
                     if GSGD:Harga_Beli > 0 AND GSGD:Harga_Beli < 501  then
                        APD:Total = GSGD:Harga_Beli * APD:Jumlah * 3.5
                     elsif GSGD:Harga_Beli > 500 AND GSGD:Harga_Beli < 1001  then
                        APD:Total = GSGD:Harga_Beli * APD:Jumlah * 2
                     elsif GSGD:Harga_Beli > 1000  then
                        APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.5
                     end
                  else
                     APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.35
                  end
               else
               CASE  status
               OF 1
                  if GBAR:StatusGen=1 or GBAR:StatusGen=3 then
                     if GSGD:Harga_Beli > 0 AND GSGD:Harga_Beli < 501  then
                        APD:Total = GSGD:Harga_Beli * APD:Jumlah * 3.5
                     elsif GSGD:Harga_Beli > 500 AND GSGD:Harga_Beli < 1001  then
                        APD:Total = GSGD:Harga_Beli * APD:Jumlah * 2
                     elsif GSGD:Harga_Beli > 1000  then
                        APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.5
                     end
                  else
                     APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.35
                  end
               of 3
                  JKon:KODE_KTR=APH:Kontrak
                  access:jkontrak.fetch(JKon:KeyKodeKtr)
                  JKOM:Kode=JKon:GROUP
                  if GBAR:StatusGen=1 or GBAR:StatusGen=3 then
                     if GSGD:Harga_Beli > 0 AND GSGD:Harga_Beli < 501  then
                        APD:Total = GSGD:Harga_Beli * APD:Jumlah * 3.5
                     elsif GSGD:Harga_Beli > 500 AND GSGD:Harga_Beli < 1001  then
                        APD:Total = GSGD:Harga_Beli * APD:Jumlah * 2
                     elsif GSGD:Harga_Beli > 1000  then
                        APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.5
                     end
                  else
                     APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.35
                  end
               else
                  if GBAR:StatusGen=1 or GBAR:StatusGen=3 then
                     if GSGD:Harga_Beli > 0 AND GSGD:Harga_Beli < 501  then
                        APD:Total = GSGD:Harga_Beli * APD:Jumlah * 3.5
                     elsif GSGD:Harga_Beli > 500 AND GSGD:Harga_Beli < 1001  then
                        APD:Total = GSGD:Harga_Beli * APD:Jumlah * 2
                     elsif GSGD:Harga_Beli > 1000  then
                        APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.5
                     end
                  else
                     APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.35
                  end
               end
               end
               APD:Harga_Dasar = GSGD:Harga_Beli
               DISPLAY
            END
            loc::disk_pcs=(APD:Diskon*100)/APD:Total
            vl_total     =APD:Total-APD:Diskon
            display
         end
         END
    OF ?loc::disk_pcs
      if loc::disk_pcs<>0 then
      !   if loc::disk_pcs>10 then
      !      APD:Diskon=0
      !      loc::disk_pcs=0
      !      display
      !   else
            APD:Diskon=APD:Total*(loc::disk_pcs/100)
            display
      !   end
      end
      vl_total  =APD:Total-APD:Diskon
      display
    OF ?APD:Diskon
      if APD:Diskon<>0 then
         loc::disk_pcs=APD:Diskon*100/APD:Total
      end
      vl_total     =APD:Total-APD:Diskon
      display
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
      APD:Jum1=glo:jumobat
      if self.request=2 then
         if APD:Diskon<>0 then
            loc::disk_pcs=APD:Diskon*100/APD:Total
         else
            loc::disk_pcs=0
         end
         vl_total     =APD:Total-APD:Diskon
      end
      !message(status)
      display
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

