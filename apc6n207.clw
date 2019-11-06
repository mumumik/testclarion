

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N207.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N006.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N007.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N060.INC'),ONCE        !Req'd for module callout resolution
                     END


Trig_UpdateRawatInapDetil2 PROCEDURE                       ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
tombol_ok            BYTE                                  !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
vl_sudah             BYTE                                  !
vl_diskon_pct        REAL                                  !
vl_total             REAL                                  !
vl_hna               REAL                                  !
History::APD:Record  LIKE(APD:RECORD),THREAD
QuickWindow          WINDOW('Tambah Data Transaksi'),AT(,,231,182),FONT('Times New Roman',10,COLOR:Black,FONT:regular),IMM,HLP('UpdateAPDTRANS'),SYSTEM,GRAY,RESIZE,MDI
                       SHEET,AT(4,4,223,147),USE(?CurrentTab),FONT(,,COLOR:Black,),COLOR(COLOR:Silver)
                         TAB('Data'),USE(?Tab:1)
                           PROMPT('Kode Barang:'),AT(8,20),USE(?APD:Kode_brg:Prompt)
                           PROMPT('Nama Barang'),AT(8,35),USE(?Prompt4)
                           PROMPT('Jumlah:'),AT(8,84),USE(?APD:Jumlah:Prompt)
                           PROMPT('Harga :'),AT(8,98),USE(?APD:Total:Prompt)
                           ENTRY(@s10),AT(69,20,56,10),USE(APD:Kode_brg),DISABLE,COLOR(COLOR:White),MSG('Kode Barang'),TIP('Kode Barang')
                           BUTTON('&H'),AT(127,19,15,13),USE(?CallLookup),KEY(F2Key),DROPID('1')
                           STRING(@s40),AT(69,35),USE(GBAR:Nama_Brg)
                           PROMPT('Nama Obat Racik:'),AT(8,48),USE(?APD:namaobatracik:Prompt)
                           ENTRY(@s40),AT(69,48,150,10),USE(APD:namaobatracik),DROPID('2')
                           OPTION('Bahan untuk resep ke-'),AT(8,58,212,20),USE(APD:Camp),BOXED,TRN
                             RADIO('1'),AT(14,66),USE(?APD:Camp:Radio1),DISABLE,VALUE('1'),DROPID('3')
                             RADIO('2'),AT(40,66),USE(?APD:Camp:Radio2),DISABLE,VALUE('2'),DROPID('3')
                             RADIO('3'),AT(66,66),USE(?APD:Camp:Radio3),DISABLE,VALUE('3'),DROPID('3')
                             RADIO('4'),AT(92,66),USE(?APD:Camp:Radio4),DISABLE,VALUE('4'),DROPID('3')
                             RADIO('5'),AT(118,66),USE(?APD:Camp:Radio5),DISABLE,VALUE('5'),DROPID('3')
                             RADIO('Non Racik'),AT(142,66),USE(?APD:Camp:Radio6),DISABLE,VALUE('0'),DROPID('3')
                           END
                           ENTRY(@n10.2),AT(69,84,55,10),USE(APD:Jumlah),DECIMAL(14),FONT('Times New Roman',,,,CHARSET:ANSI),MSG('Jumlah'),TIP('Jumlah'),DROPID('4')
                           CHECK('KTT'),AT(133,84),USE(APD:ktt),VALUE('1','0'),DROPID('5')
                           ENTRY(@n-15.2),AT(69,98,55,10),USE(APD:Total),DECIMAL(14),FONT('Times New Roman',,,,CHARSET:ANSI),MSG('Harga Dasar'),TIP('Harga Dasar'),READONLY,DROPID('6')
                           ENTRY(@n-10.2),AT(34,162,25,10),USE(vl_diskon_pct),DISABLE,HIDE,RIGHT(2)
                           ENTRY(@n-15.2),AT(69,162,55,10),USE(APD:Diskon),DISABLE,HIDE,RIGHT(2)
                           PROMPT('Diskon:'),AT(8,162),USE(?APD:Diskon:Prompt),DISABLE,HIDE
                           PROMPT('%'),AT(61,162),USE(?APD:Diskon:Prompt:2),DISABLE,HIDE
                           PROMPT('Total:'),AT(8,112),USE(?APD:Total:Prompt:2)
                           ENTRY(@n-15.2),AT(69,111,55,10),USE(vl_total),SKIP,DECIMAL(14),FONT('Times New Roman',10,,FONT:bold),MSG('Harga Dasar'),TIP('Harga Dasar'),READONLY
                           PROMPT('Biaya Ditanggung:'),AT(8,125),USE(?APD:total_dtg:Prompt)
                           ENTRY(@N-16.2),AT(69,124,55,10),USE(APD:total_dtg),DECIMAL(14),DROPID('7')
                           PROMPT('Harga Dasar:'),AT(8,137),USE(?APD:Harga_Dasar:Prompt)
                           ENTRY(@n17.2),AT(69,137,55,10),USE(APD:Harga_Dasar),SKIP,DECIMAL(14),FONT('Times New Roman',10,,FONT:bold),MSG('Harga Dasar'),TIP('Harga Dasar'),READONLY
                           BUTTON('&K (F5)'),AT(131,122,24,21),USE(?Button6),DISABLE,HIDE,LEFT,KEY(F5Key)
                           BUTTON('Obat &Campur (F4)'),AT(159,122,63,21),USE(?Button5),HIDE,FONT(,,,FONT:bold),KEY(F4Key)
                         END
                       END
                       PROMPT('N0 tran:'),AT(79,2),USE(?APD:N0_tran:Prompt)
                       ENTRY(@s15),AT(109,2,48,10),USE(APD:N0_tran),DISABLE,MSG('nomor transaksi'),TIP('nomor transaksi')
                       BUTTON('&OK [End]'),AT(50,155,63,24),USE(?OK),LEFT,KEY(EndKey),ICON(ICON:Tick),DEFAULT,DROPID('8')
                       BUTTON('&Batal'),AT(125,155,63,24),USE(?Cancel),LEFT,ICON(ICON:Cross)
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
  GlobalErrors.SetProcedureName('Trig_UpdateRawatInapDetil2')
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
  SELF.AddHistoryField(?APD:namaobatracik,10)
  SELF.AddHistoryField(?APD:Camp,5)
  SELF.AddHistoryField(?APD:Jumlah,3)
  SELF.AddHistoryField(?APD:ktt,12)
  SELF.AddHistoryField(?APD:Total,4)
  SELF.AddHistoryField(?APD:Diskon,7)
  SELF.AddHistoryField(?APD:total_dtg,11)
  SELF.AddHistoryField(?APD:Harga_Dasar,6)
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
  INIMgr.Fetch('Trig_UpdateRawatInapDetil2',QuickWindow)   ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  if self.request=1 then
     if apd:camp=1 then
      glo:totalresepranap1 += 1
     elsif apd:camp=2 then
      glo:totalresepranap2 += 1
     elsif apd:camp=3 then
      glo:totalresepranap3 += 1
     elsif apd:camp=4 then
      glo:totalresepranap4 += 1
     elsif apd:camp=5 then
      glo:totalresepranap5 += 1
     end
  end
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:APDTRANSDet.Close
    Relate:Apetiket.Close
    Relate:Apetiket1.Close
    Relate:vstokfifo.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_UpdateRawatInapDetil2',QuickWindow) ! Save window data to non-volatile store
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
            ?OK{PROP:DISABLE}=1
            cycle
         else
            IF APD:Jumlah = 0
               ?OK{PROP:DISABLE}=1
            ELSE
               GBAR:Kode_brg      =APD:Kode_brg
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
      !         if GBAR:StatusGen=1 or GBAR:StatusGen=3 then
      !            if GSGD:Harga_Beli > 0 AND GSGD:Harga_Beli < 501  then
      !               APD:Total = GSGD:Harga_Beli * APD:Jumlah * 3.5
      !            elsif GSGD:Harga_Beli > 500 AND GSGD:Harga_Beli < 1001  then
      !               APD:Total = GSGD:Harga_Beli * APD:Jumlah * 2
      !            elsif GSGD:Harga_Beli > 1000  then
      !               APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.5
      !            end
      !         else
      !            APD:Total = GSGD:Harga_Beli * APD:Jumlah * 1.35
      !         end
               if glo:rekap=2 then
                  !Update penambahan tuslah 1500 (3 Desember 2018)
                  !Update perubahan margin pasien umum menjadi 1.25 (31 Desember 2018)
                  !Update penambahan diskon dari gudang saat penjualan (31 Desember 2018)
                  APD:Total=((((GSGD:Harga_Beli-(GSGD:Discount/100*GSGD:Harga_Beli))*1.25)*1.1)*APD:Jumlah)+1500
                  APD:total_dtg=0
                  ?APD:total_dtg{PROP:disable}=1
               elsif glo:rekap=3 then
                  if sub(APD:Kode_brg,1,1)='B'
                      !Update penambahan tuslah 1500 (3 Desember 2018)
                      !Update penambahan diskon dari gudang saat penjualan (31 Desember 2018)
                      APD:Total=((((GSGD:Harga_Beli-(GSGD:Discount/100*GSGD:Harga_Beli))*1.215)*1.1)*APD:Jumlah)+1500
                      APD:total_dtg=APD:Total
                      ?APD:total_dtg{PROP:disable}=1
                  else
                      !Update penambahan tuslah 1500 (3 Desember 2018)
                      !Update penambahan diskon dari gudang saat penjualan (31 Desember 2018)
                      !Update perubahan margin pasien kontraktor non bpjs menjadi 1.25 (13 Maret 2019)
                      APD:Total=((((GSGD:Harga_Beli-(GSGD:Discount/100*GSGD:Harga_Beli))*1.25)*1.1)*APD:Jumlah)+1500
                      APD:total_dtg=APD:Total
                  end
               end
               !Update penambahan diskon dari gudang saat penjualan (31 Desember 2018)
               APD:Harga_Dasar = GSGD:Harga_Beli-(GSGD:Discount/100*GSGD:Harga_Beli)
               DISPLAY
            END
      !      if APD:Camp<>0 then
      !        APD:Total=0
      !      end
            vl_diskon_pct=(APD:Diskon*100)/APD:Total
            vl_total     =APD:Total-APD:Diskon
            display
         end
      END
    OF ?Button6
      !if tombol_ok = 0 then
      !IF APD:Jumlah = 0
      !    ?OK{PROP:DISABLE}=1
      !ELSE
      !    ?OK{PROP:DISABLE}=0
      !    if GBAR:Kelompok=19 then
      !       APD:Total = GL_beaR + (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1.3)) * APD:Jumlah)
      !    else
      !          CASE  status
      !           OF 1
      !               APD:Total = APD:Jumlah * GSTO:Harga_Dasar * (1+(GL_PPN/100))
      !           OF 2
      !               if GBAR:Kelompok=22 then
      !                  APD:Total = GL_beaR + |
      !                           (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+( 10/ 100 ))) * APD:Jumlah)
      !               else
      !                  APD:Total = GL_beaR + |
      !                           (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+( GL_Um_kls1 / 100 ))) * APD:Jumlah)
      !               end
      !           OF 3
      !               JKon:KODE_KTR=APH:Kontrak
      !               access:jkontrak.fetch(JKon:KeyKodeKtr)
      !               if JKon:HargaObat>0 then
      !                  APD:Total = GL_beaR + |
      !                          (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) *JKon:HargaObat) * APD:Jumlah)
      !               else
      !                  APO:KODE_KTR = GLO::back_up
      !                  APO:Kode_brg = APD:Kode_brg
      !                  GET(APOBKONT,APO:by_kode_ktr)
      !                  IF ERRORCODE() then
      !                      APD:Total = GL_beaR + |
      !                           (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(GL_nt_kls2 / 100 ))) * APD:Jumlah)
      !                  ELSE
      !                      APD:Total = GL_beaR + |
      !                           (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+ (APO:PERS_TAMBAH / 100 ))) * APD:Jumlah)
      !                  end
      !               END
      !           END
      !    end
      !    DISPLAY
      !END
      !vl_diskon_pct=(APD:Diskon*100)/APD:Total
      !vl_total     =APD:Total-APD:Diskon
      !display
      !end
    OF ?Button5
      if tombol_ok = 0 then
      glo::campur = glo::campur+1
      glo::no_nota= APH:N0_tran
      end
    OF ?OK
      tombol_ok = 1
      !if apd:camp<>0 and sub(APD:Kode_brg,1,7)<>'_Campur' then
      !    APD:Total=0
      !    display
      !end
      if APD:Total=0 then
         message('harga tidak boleh 0, mohon cek kembali')
         cycle
      end
      if APD:Total=0 and sub(APD:Kode_brg,1,7)='_Campur' then
         message('Harga resep tidak boleh 0, mohon cek kembali')
         cycle
      end
      if APD:ktt=1 then
          glo:ktt=1
      end
      IF APD:Kode_brg = '_Campur1'
          glo:resepranap1=1
      elsIF APD:Kode_brg = '_Campur2'
          glo:resepranap2=1
      elsIF APD:Kode_brg = '_Campur3'
          glo:resepranap3=1
      elsIF APD:Kode_brg = '_Campur4'
          glo:resepranap4=1
      elsIF APD:Kode_brg = '_Campur5'
          glo:resepranap5=1
      END
      
      
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
          APD:Jumlah=0
          APD:Harga_Dasar=0
          APD:Total=0
          APD:Camp=0
          APD:Diskon=0
          vl_total=0
          IF glo:resepranap1=1
              ?APD:Camp:Radio1{PROP:DISABLE}=0
              ?APD:Camp:Radio6{PROP:DISABLE}=0
          END
          IF glo:resepranap2=1
              ?APD:Camp:Radio2{PROP:DISABLE}=0
              ?APD:Camp:Radio6{PROP:DISABLE}=0
          END
          IF glo:resepranap3=1
              ?APD:Camp:Radio3{PROP:DISABLE}=0
              ?APD:Camp:Radio6{PROP:DISABLE}=0
          END
          IF glo:resepranap4=1
              ?APD:Camp:Radio4{PROP:DISABLE}=0
              ?APD:Camp:Radio6{PROP:DISABLE}=0
          END
          IF glo:resepranap5=1
              ?APD:Camp:Radio5{PROP:DISABLE}=0
              ?APD:Camp:Radio6{PROP:DISABLE}=0
          END
          if sub(APD:Kode_brg,1,7)='_Campur' then
              ?APD:namaobatracik{PROP:DISABLE}=0
              IF APD:Kode_brg = '_Campur1'
                  APD:Camp=1
              elsIF APD:Kode_brg = '_Campur2'
                  APD:Camp=2
              elsIF APD:Kode_brg = '_Campur3'
                  APD:Camp=3
              elsIF APD:Kode_brg = '_Campur4'
                  APD:Camp=4
              elsIF APD:Kode_brg = '_Campur5'
                  APD:Camp=5
              END
              APD:Jumlah=1
              APD:Total=5000
              vl_total=5000
              if status=2 then
                  APD:total_dtg=0
                  ?APD:total_dtg{PROP:disable}=1
              elsif status=3 then
                  APD:total_dtg=APD:Total
              end
              ?APD:jumlah{PROP:disable}=1
              !?APD:total{PROP:READONLY}=0
              ?OK{PROP:DISABLE}=0
              SELECT(?APD:namaobatracik)
          else
              ?APD:Jumlah{PROP:DISABLE}=0
              if glo:resepranap1=1 then
                  SELECT(?APD:Camp:Radio1)
              elsif glo:resepranap2=1 then
                  SELECT(?APD:Camp:Radio2)
              elsif glo:resepranap3=1 then
                  SELECT(?APD:Camp:Radio3)
              elsif glo:resepranap4=1 then
                  SELECT(?APD:Camp:Radio4)
              elsif glo:resepranap5=1 then
                  SELECT(?APD:Camp:Radio5)
              else
                  SELECT(?APD:Jumlah)
              end
          end
          
          display
      END
      end
    OF ?APD:Camp:Radio1
      SELECT(?APD:Jumlah)
    OF ?APD:Camp:Radio2
      SELECT(?APD:Jumlah)
    OF ?APD:Camp:Radio3
      SELECT(?APD:Jumlah)
    OF ?APD:Camp:Radio4
      SELECT(?APD:Jumlah)
    OF ?APD:Camp:Radio5
      SELECT(?APD:Jumlah)
    OF ?APD:Camp:Radio6
      SELECT(?APD:Jumlah)
    OF ?APD:Total
      if sub(APD:Kode_brg,1,7)='_Campur' then
          vl_total=APD:Jumlah*APD:Total
          ?vl_total{PROP:readonly}=1
          display
      end
    OF ?vl_diskon_pct
      if tombol_ok = 0 then
         if vl_diskon_pct>10 then
            vl_diskon_pct=0
            APD:Diskon=0
            vl_total  =APD:Total
            display
         else
      !      if vl_diskon_pct<=15 then
      !         WindowLoginManager
      !         if glo:loginmanagerok=1 then
                  APD:Diskon=round(APD:Total*(vl_diskon_pct/100),1)
                  vl_total  =APD:Total-APD:Diskon
                  display
      !         else
      !            vl_diskon_pct=0
      !            APD:Diskon=0
      !            vl_total  =APD:Total
      !            display
      !         end
      !      else
      !         vl_diskon_pct=0
      !         APD:Diskon=0
      !         vl_total  =APD:Total
      
      !         display
      !      end
      !   else
      !      APD:Diskon=round(APD:Total*(vl_diskon_pct/100),1)
      !      vl_total  =APD:Total-APD:Diskon
      !      display
         end
      end
    OF ?APD:Diskon
      if tombol_ok = 0 then
         vl_diskon_pct=(APD:Diskon*100)/APD:Total
         vl_total     =APD:Total-APD:Diskon
         display
      end
    OF ?APD:total_dtg
      if APD:total_dtg>APD:Total then
          message('Biaya ditanggung tidak boleh lebih besar daripada Total harga, mohon cek kembali')
          ?OK{prop:disable}=1
          cycle
      else
          ?OK{prop:disable}=0
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
      APD:Jum1=glo:jumobat
      APD:Camp=0
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

