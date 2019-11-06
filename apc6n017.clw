

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N017.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N015.INC'),ONCE        !Req'd for module callout resolution
                     END


ProsesKartuFifoOutQue PROCEDURE                            ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
vl_ke                SHORT                                 !
vl_sub_total         REAL                                  !
vl_ada               BYTE                                  !
vl_i                 SHORT                                 !
Process:View         VIEW(AFIFOIN)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,77),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                       ENTRY(@n-7),AT(39,62,60,10),USE(vl_i),RIGHT(1)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ProgressMgr          StepClass                             ! Progress Manager

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
  GlobalErrors.SetProcedureName('ProsesKartuFifoOutQue')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: Process
  BIND('glo_kode_barang',glo_kode_barang)                  ! Added by: Process
  BIND('vg_tanggal1',vg_tanggal1)                          ! Added by: Process
  BIND('VG_TANGGAL2',VG_TANGGAL2)                          ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File APDTRANS used by this procedure, so make sure it's RelationManager is open
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APDTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesKartuFifoOutQue',ProgressWindow)     ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:AFIFOIN, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ThisProcess.AppendOrder('afi:tanggal,afi:jam')
  ThisProcess.SetFilter('afi:kode_Apotik=GL_entryapotik and afi:kode_barang=glo_kode_barang and afi:status=0 and afi:Tanggal<<vg_tanggal1')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(AFIFOIN,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AFIFOIN.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesKartuFifoOutQue',ProgressWindow)  ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  afifoout{prop:sql}='select * from dba.afifoout where kode_apotik='''&GL_entryapotik&''' and kode_barang='''&AFI:Kode_Barang&''' and NoTransaksi='''&AFI:NoTransaksi&''' order by tanggal,jam'
  afifoout{prop:sql}='select * from dba.afifoout where kode_apotik='''&GL_entryapotik&''' and kode_barang='''&AFI:Kode_Barang&''' and NoTransaksi='''&AFI:NoTransaksi&''' order by tanggal,jam'
  loop
     if access:afifoout.next()<>level:benign then break.
     if AFI2:Tanggal>=vg_tanggal1 and AFI2:Tanggal<=vg_tanggal2 then
        if vl_ada=0 then
           vl_ada=1
           Glo:QueFifo.Tanggal     =vg_tanggal1
           Glo:QueFifo.NomorIn     ='Saldo Awal'
           Glo:QueFifo.JumlahIn    =vg_kfifo_jumlah
           Glo:QueFifo.HargaIn     =vg_kfifo_total/vg_kfifo_jumlah
           Glo:QueFifo.TotalIn     =vg_kfifo_total
           Glo:QueFifo.NomorOut    =AFI2:NoTransKeluar
           Glo:QueFifo.JumlahOut   =AFI2:Jumlah
           Glo:QueFifo.HargaOut    =AFI:Harga
           Glo:QueFifo.TotalOut    =AFI:Harga*AFI2:Jumlah
           Glo:QueFifo.Tanggalout  =AFI2:Tanggal
           if sub(AFI2:NoTransKeluar,1,3)='API' or sub(AFI2:NoTransKeluar,1,3)='APJ' then
              APH:N0_tran=clip(AFI2:NoTransKeluar)
              access:aphtrans.fetch(APH:by_transaksi)
              if APH:Biaya>0 then
                 APD:N0_tran =clip(AFI2:NoTransKeluar)
                 APD:Kode_brg=clip(AFI2:Kode_Barang)
                 access:apdtrans.fetch(APD:notran_kode)
                 Glo:QueFifo.harga_jual=APD:Total/APD:Jumlah
              else
                 Glo:QueFifo.harga_jual=0
              end
           else
              Glo:QueFifo.harga_jual=0
           end
           add(Glo:QueFifo)
           clear(Glo:QueFifo)
        else
           vl_sub_total           +=AFI2:Jumlah
           Glo:QueFifo.Tanggal     =0
           Glo:QueFifo.NomorIn     =''
           Glo:QueFifo.JumlahIn    =0
           Glo:QueFifo.HargaIn     =0
           Glo:QueFifo.TotalIn     =0
           Glo:QueFifo.NomorOut    =AFI2:NoTransKeluar
           Glo:QueFifo.JumlahOut   =AFI2:Jumlah
           Glo:QueFifo.HargaOut    =AFI:Harga
           Glo:QueFifo.TotalOut    =AFI:Harga*AFI2:Jumlah
           Glo:QueFifo.Tanggalout  =AFI2:Tanggal
           if sub(AFI2:NoTransKeluar,1,3)='API' or sub(AFI2:NoTransKeluar,1,3)='APJ' then
              APH:N0_tran=clip(AFI2:NoTransKeluar)
              access:aphtrans.fetch(APH:by_transaksi)
              if APH:Biaya>0 then
                 APD:N0_tran =clip(AFI2:NoTransKeluar)
                 APD:Kode_brg=clip(AFI2:Kode_Barang)
                 access:apdtrans.fetch(APD:notran_kode)
                 Glo:QueFifo.harga_jual=APD:Total/APD:Jumlah
              else
                 Glo:QueFifo.harga_jual=0
              end
           else
              Glo:QueFifo.harga_jual=0
           end
           add(Glo:QueFifo)
           clear(Glo:QueFifo)
        end
     else
        vg_kfifo_jumlah-=AFI2:Jumlah
        vg_kfifo_total -=AFI2:Jumlah*AFI:Harga
        display
     end
  end
  ReturnValue = PARENT.TakeRecord()
  vl_i+=1
  display
  RETURN ReturnValue

ProsesKartuFIFOQue PROCEDURE                               ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
vl_ke                SHORT                                 !
vl_sub_total         REAL                                  !
vl_ada               BYTE                                  !
vl_i                 SHORT                                 !
Process:View         VIEW(AFIFOIN)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,77),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                       ENTRY(@n-7),AT(39,62,60,10),USE(vl_i),RIGHT(1)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ProgressMgr          StepClass                             ! Progress Manager

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
  GlobalErrors.SetProcedureName('ProsesKartuFIFOQue')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: Process
  BIND('glo_kode_barang',glo_kode_barang)                  ! Added by: Process
  BIND('vg_tanggal1',vg_tanggal1)                          ! Added by: Process
  BIND('vg_tanggal2',vg_tanggal2)                          ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File APDTRANS used by this procedure, so make sure it's RelationManager is open
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APDTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesKartuFIFOQue',ProgressWindow)        ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:AFIFOIN, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ThisProcess.AppendOrder('afi:tanggal,afi:jam')
  ThisProcess.SetFilter('afi:kode_Apotik=GL_entryapotik and afi:kode_barang=glo_kode_barang and afi:status=0 and afi:Tanggal>=vg_tanggal1 and afi:tanggal<<=vg_tanggal2')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(AFIFOIN,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AFIFOIN.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesKartuFIFOQue',ProgressWindow)     ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  vl_ada=0
  vl_ke=1
  afifoout{prop:sql}='select * from dba.afifoout where kode_apotik='''&GL_entryapotik&''' and kode_barang='''&AFI:Kode_Barang&''' and NoTransaksi='''&AFI:NoTransaksi&''' and tanggal>='''&format(vg_tanggal1,@D10)&''' and tanggal<<='''&format(vg_tanggal2,@D10)&''' order by tanggal,jam'
  afifoout{prop:sql}='select * from dba.afifoout where kode_apotik='''&GL_entryapotik&''' and kode_barang='''&AFI:Kode_Barang&''' and NoTransaksi='''&AFI:NoTransaksi&''' and tanggal>='''&format(vg_tanggal1,@D10)&''' and tanggal<<='''&format(vg_tanggal2,@D10)&''' order by tanggal,jam'
  loop
     if access:afifoout.next()<>level:benign then break.
     vl_ada=1
     if vl_ke=1 then
        vl_sub_total           +=AFI2:Jumlah
        Glo:QueFifo.Tanggal     =AFI:Tanggal
        Glo:QueFifo.NomorIn     =AFI:NoTransaksi
        Glo:QueFifo.JumlahIn    =AFI:Jumlah
        Glo:QueFifo.HargaIn     =AFI:Harga
        Glo:QueFifo.TotalIn     =AFI:Harga*AFI:Jumlah
        Glo:QueFifo.NomorOut    =AFI2:NoTransKeluar
        Glo:QueFifo.JumlahOut   =AFI2:Jumlah
        Glo:QueFifo.HargaOut    =AFI:Harga
        Glo:QueFifo.TotalOut    =AFI:Harga*AFI2:Jumlah
        Glo:QueFifo.Tanggalout  =AFI2:Tanggal
        if sub(AFI2:NoTransKeluar,1,3)='API' or sub(AFI2:NoTransKeluar,1,3)='APJ' then
           APH:N0_tran=clip(AFI2:NoTransKeluar)
           access:aphtrans.fetch(APH:by_transaksi)
           if APH:Biaya>0 then
              APD:N0_tran =clip(AFI2:NoTransKeluar)
              APD:Kode_brg=clip(AFI2:Kode_Barang)
              access:apdtrans.fetch(APD:notran_kode)
              Glo:QueFifo.harga_jual=APD:Total/APD:Jumlah
           else
              Glo:QueFifo.harga_jual=0
           end
        else
           Glo:QueFifo.harga_jual=0
        end
        add(Glo:QueFifo)
        clear(Glo:QueFifo)
     else
        vl_sub_total           +=AFI2:Jumlah
        Glo:QueFifo.Tanggal     =0
        Glo:QueFifo.NomorIn     =''
        Glo:QueFifo.JumlahIn    =0
        Glo:QueFifo.HargaIn     =0
        Glo:QueFifo.TotalIn     =0
        Glo:QueFifo.NomorOut    =AFI2:NoTransKeluar
        Glo:QueFifo.JumlahOut   =AFI2:Jumlah
        Glo:QueFifo.HargaOut    =AFI:Harga
        Glo:QueFifo.TotalOut    =AFI:Harga*AFI2:Jumlah
        Glo:QueFifo.Tanggalout  =AFI2:Tanggal
        if sub(AFI2:NoTransKeluar,1,3)='API' or sub(AFI2:NoTransKeluar,1,3)='APJ' then
           APH:N0_tran=clip(AFI2:NoTransKeluar)
           access:aphtrans.fetch(APH:by_transaksi)
           if APH:Biaya>0 then
              APD:N0_tran =clip(AFI2:NoTransKeluar)
              APD:Kode_brg=clip(AFI2:Kode_Barang)
              access:apdtrans.fetch(APD:notran_kode)
              Glo:QueFifo.harga_jual=APD:Total/APD:Jumlah
           else
              Glo:QueFifo.harga_jual=0
           end
        else
           Glo:QueFifo.harga_jual=0
        end
        add(Glo:QueFifo)
        clear(Glo:QueFifo)
     end
     vl_ke+=1
  end
  if vl_ada=0 then
     vl_sub_total           +=AFI2:Jumlah
     Glo:QueFifo.Tanggal     =AFI:Tanggal
     Glo:QueFifo.NomorIn     =AFI:NoTransaksi
     Glo:QueFifo.JumlahIn    =AFI:Jumlah
     Glo:QueFifo.HargaIn     =AFI:Harga
     Glo:QueFifo.TotalIn     =AFI:Harga*AFI:Jumlah
     Glo:QueFifo.NomorOut    =''
     Glo:QueFifo.JumlahOut   =0
     Glo:QueFifo.HargaOut    =0
     Glo:QueFifo.TotalOut    =0
     Glo:QueFifo.Tanggalout  =0
     Glo:QueFifo.harga_jual  =0
     add(Glo:QueFifo)
     clear(Glo:QueFifo)
  end
  ReturnValue = PARENT.TakeRecord()
  vl_i+=1
  display
  RETURN ReturnValue

WindowBlnThn PROCEDURE                                     ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
Window               WINDOW('Tahun - Bulan'),AT(,,185,84),FONT('Arial',8,,FONT:regular),CENTER,GRAY
                       ENTRY(@n-7),AT(72,18,60,10),USE(glo:bulan),RIGHT(1)
                       ENTRY(@n-14),AT(72,33,60,10),USE(glo:tahun),RIGHT(1)
                       BUTTON('OK'),AT(43,59,103,14),USE(?OkButton),DEFAULT
                       PROMPT('tahun:'),AT(22,33),USE(?glo:tahun:Prompt)
                       PROMPT('bulan:'),AT(22,18),USE(?glo:bulan:Prompt)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
  GlobalErrors.SetProcedureName('WindowBlnThn')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?glo:bulan
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Glo::kode_apotik = GL_entryapotik
  Relate:GApotik.SetOpenRelated()
  Relate:GApotik.Open                                      ! File GApotik used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('WindowBlnThn',Window)                      ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:GApotik.Close
  END
  IF SELF.Opened
    INIMgr.Update('WindowBlnThn',Window)                   ! Save window data to non-volatile store
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
    OF ?OkButton
      ThisWindow.Update
      break
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

PrintKartuFifo PROCEDURE (string vl_barang)                ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
vl_no                LONG                                  !
FilesOpened          BYTE                                  !
vl_hitung            SHORT(0)                              !
loc::datel           DATE                                  !
loc::time            TIME                                  !
loc::total           LONG                                  !
loc::nama_apotik     STRING(30)                            !Nama Apotik
APA                  STRING(20)                            !
vl_bulan             SHORT                                 !
vl_tahun             LONG                                  !
vl_harga_raja        REAL                                  !
vl_harga_ranap_3     REAL                                  !
vl_harga_ranap_12vip REAL                                  !
vl_saldo_akhir       REAL                                  !
vl_debet             REAL                                  !
vl_kredit            REAL                                  !
vl_tanggal           STRING(5000)                          !
vl_jam               STRING(5000)                          !
vl_nomor             STRING(5000)                          !
vl_harga             STRING(5000)                          !
vl_jumlah            STRING(5000)                          !
vl_avi_harga         REAL                                  !
vl_afi_total         REAL                                  !
vl_out_total         STRING(5000)                          !
vl_harga_opname      REAL                                  !
vl_sub_total         REAL                                  !
Process:View         VIEW(AFIFOIN)
                       PROJECT(AFI:Harga)
                       PROJECT(AFI:Jam)
                       PROJECT(AFI:Jumlah)
                       PROJECT(AFI:NoTransaksi)
                       PROJECT(AFI:Status)
                       PROJECT(AFI:Tanggal)
                       PROJECT(AFI:Kode_Barang)
                       JOIN(GBAR:KeyKodeBrg,AFI:Kode_Barang)
                         PROJECT(GBAR:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:No_Satuan)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(302,2042,7427,8760),PAPER(PAPER:A4),PRE(RPT),FONT('Arial',10,COLOR:Black,),THOUS
                       HEADER,AT(302,292,7427,1750)
                         STRING('KARTU STOK'),AT(42,21,979,219),LEFT,FONT(,,,FONT:bold)
                         STRING('Apotik'),AT(42,208,688,167),USE(?String14),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(':'),AT(896,208,135,167),USE(?String14:2),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(@s5),AT(1063,208,427,167),USE(GL_entryapotik)
                         BOX,AT(10,1510,7406,240),COLOR(COLOR:Black)
                         STRING('Nomor'),AT(1438,1542,521,167),USE(?String10:5),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('No.'),AT(73,1542,260,167),USE(?String10:2),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Jam'),AT(1021,1542,333,167),USE(?String10:4),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Tanggal'),AT(438,1542,521,167),USE(?String10:3),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Jumlah'),AT(2833,1542,438,167),USE(?String10:7),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Harga'),AT(3865,1542,438,167),USE(?String10:6),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Total'),AT(4969,1542,438,167),USE(?String10:8),TRN,FONT('Arial',10,,FONT:regular)
                         STRING('Kode Barang'),AT(42,406,844,167),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(':'),AT(896,406,135,167),USE(?String14:3),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(@s10),AT(1063,406,833,167),USE(GBAR:Kode_brg),FONT('Arial',10,,FONT:regular)
                         STRING('Nama Barang'),AT(42,615,896,167),USE(?String10),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(':'),AT(896,615,135,167),USE(?String14:4),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(@s40),AT(1052,615,2552,167),USE(GBAR:Nama_Brg),FONT('Arial',10,,FONT:regular)
                         STRING('Satuan'),AT(42,813),USE(?String19),TRN
                         STRING(':'),AT(896,813,135,167),USE(?String14:5),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(@s10),AT(1052,813,958,146),USE(GBAR:No_Satuan)
                         STRING('Bulan'),AT(42,1021),USE(?String19:2),TRN
                         STRING(':'),AT(896,1021,135,167),USE(?String14:6),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(@n02),AT(1052,1021),USE(glo:bulan),LEFT(1),FONT('Arial',10,,FONT:regular)
                         STRING('Tahun'),AT(42,1229,552,167),USE(?String19:3),TRN
                         STRING(':'),AT(896,1229,135,167),USE(?String14:7),TRN,FONT('Arial',10,,FONT:regular)
                         STRING(@p####p),AT(1052,1229,354,167),USE(glo:tahun),LEFT(1)
                       END
break1                 BREAK(APA)
detail1                  DETAIL,AT(,,,854),FONT('Arial',8,,FONT:regular)
                           STRING(@s15),AT(1438,21,990,146),USE(AFI:NoTransaksi)
                           STRING(@n10.2),AT(2760,21,615,146),USE(AFI:Jumlah),RIGHT
                           STRING(@n-15.2),AT(3500,21,844,146),USE(vl_avi_harga),RIGHT
                           STRING(@n-15.2),AT(4573,21,875,146),USE(vl_afi_total),RIGHT(2)
                           STRING(@t01),AT(1021,21,333,146),USE(AFI:Jam)
                           STRING(@n3),AT(42,21,240,146),CNT,RESET(break1),USE(vl_no),RIGHT(1),FONT('Arial',8,,FONT:regular)
                           STRING(@d17),AT(438,21,490,146),USE(AFI:Tanggal)
                           LINE,AT(10,198,7406,0),COLOR(COLOR:Black)
                           STRING('KELUAR :'),AT(417,229,667,167),USE(?String10:9),TRN,FONT('Arial',8,,FONT:regular)
                           TEXT,AT(4385,406,1063,135),USE(vl_out_total),BOXED,RIGHT,RESIZE
                           TEXT,AT(5490,406,990,135),USE(vl_harga),BOXED,RIGHT,RESIZE
                           LINE,AT(0,573,7406,0),USE(?Line2),COLOR(COLOR:Black)
                           STRING('Total Keluar :'),AT(1958,615,740,167),USE(?String10:11),TRN,FONT('Arial',8,,FONT:regular)
                           STRING(@n10.2),AT(2750,615,615,146),USE(vl_sub_total),RIGHT
                           LINE,AT(1948,802,1458,0),USE(?Line3),COLOR(COLOR:Black)
                           TEXT,AT(2583,406,781,135),USE(vl_jumlah,,?vl_jumlah:2),BOXED,RIGHT,RESIZE
                           STRING('Harga Keluar :'),AT(5750,229,740,167),USE(?String10:10),TRN,FONT('Arial',8,,FONT:regular)
                           TEXT,AT(1438,406,1115,135),USE(vl_nomor),BOXED,RESIZE
                           TEXT,AT(1010,406,406,135),USE(vl_jam),BOXED,RESIZE
                           TEXT,AT(417,406,583,135),USE(vl_tanggal),BOXED,RESIZE
                         END
                         FOOTER,AT(0,0,,302)
                         END
                       END
                       FOOTER,AT(302,10813,7417,219)
                         STRING('Page xxxxx of xxxxx'),AT(5938,10,1302,208),USE(?PageOfString),FONT('Times New Roman',8,,)
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
  GlobalErrors.SetProcedureName('PrintKartuFifo')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: Report
  BIND('glo:bulan',glo:bulan)                              ! Added by: Report
  BIND('glo:tahun',glo:tahun)                              ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  WindowBlnThn()
  bind('vl_barang',vl_barang)
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Access:GApotik.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintKartuFifo',ProgressWindow)            ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisReport.Init(Process:View, Relate:AFIFOIN, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  ThisReport.AppendOrder('afi:tanggal,afi:Jam')
  ThisReport.SetFilter('afi:Kode_barang=vl_barang and afi:kode_Apotik=GL_entryapotik and afi:status=0 and month(afi:tanggal)=glo:bulan and year(afi:tanggal)=glo:tahun')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  Relate:AFIFOIN.SetQuickScan(1,Propagate:OneMany)
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
    Relate:AFIFOIN.Close
  END
  IF SELF.Opened
    INIMgr.Update('PrintKartuFifo',ProgressWindow)         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = AFI:Kode_Barang                          ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  GBAR:Kode_brg = AFI:Kode_Barang                          ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  !vl_debet+=APK:Debet
  !vl_kredit+=APK:Kredit
  !vl_saldo_akhir=vl_debet-vl_kredit
  !displa
  vl_hitung+=1
  if vl_hitung=1
     IF sub(AFI:NoTransaksi,1,3)='OPN' then
        vl_harga_opname=AFI:Harga*1.1
     else
        GSTO:Kode_Apotik=AFI:Kode_Apotik
        GSTO:Kode_Barang=AFI:Kode_Barang
        access:gstokaptk.fetch(GSTO:KeyBarang)
        vl_harga_opname=GSTO:Harga_Dasar*1.1
     END
  else
     if not(sub(AFI:NoTransaksi,1,3)='API' or sub(AFI:NoTransaksi,1,3)='APR' or sub(AFI:NoTransaksi,1,3)='APJ' or sub(AFI:NoTransaksi,1,3)='APB') then
        vl_harga_opname=AFI:Harga*1.1
     end
  end
  
  if sub(AFI:NoTransaksi,1,3)='OPN' then
     vl_avi_harga=AFI:Harga*1.1
     vl_afi_total=AFI:Harga*1.1*AFI:Jumlah
  elsif sub(AFI:NoTransaksi,1,3)='API' or sub(AFI:NoTransaksi,1,3)='APR' or sub(AFI:NoTransaksi,1,3)='APJ' or sub(AFI:NoTransaksi,1,3)='APB' then
     vl_avi_harga=vl_harga_opname
     vl_afi_total=AFI:Jumlah*vl_harga_opname
  else
     vl_avi_harga=AFI:Harga*1.1
     vl_afi_total=AFI:Harga*1.1*AFI:Jumlah
  end
  vl_tanggal=''
  vl_jam=''
  vl_nomor=''
  vl_harga=''
  vl_jumlah=''
  vl_out_total=''
  vl_sub_total=0
  afifoout{prop:sql}='select * from dba.afifoout where kode_apotik='''&GL_entryapotik&''' and kode_barang='''&AFI:Kode_Barang&''' and NoTransaksi='''&AFI:NoTransaksi&''' order by tanggal,jam'
  afifoout{prop:sql}='select * from dba.afifoout where kode_apotik='''&GL_entryapotik&''' and kode_barang='''&AFI:Kode_Barang&''' and NoTransaksi='''&AFI:NoTransaksi&''' order by tanggal,jam'
  loop
     if access:afifoout.next()<>level:benign then break.
     vl_tanggal   =clip(vl_tanggal)&chr(10)&format(AFI2:Tanggal,@d06)
     vl_jam       =clip(vl_jam)&chr(10)&format(AFI2:jam,@t01)
     vl_nomor     =clip(vl_nomor)&chr(10)&clip(AFI2:NoTransKeluar)
     if sub(AFI:NoTransaksi,1,3)='API' or sub(AFI:NoTransaksi,1,3)='APR' or sub(AFI:NoTransaksi,1,3)='APJ' or sub(AFI:NoTransaksi,1,3)='APB' then
        vl_harga     =clip(vl_harga)&chr(10)&format(AFI2:Harga,@n15.2)
     else
        vl_harga     =clip(vl_harga)&chr(10)&format(AFI2:Harga*1.1,@n15.2)
     end
     vl_jumlah    =clip(vl_jumlah)&chr(10)&format(AFI2:jumlah,@n15.2)
     vl_out_total =clip(vl_out_total)&chr(10)&format(AFI2:jumlah*vl_avi_harga,@n15.2)
     vl_sub_total+=AFI2:Jumlah
  end
  display
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail1)
  RETURN ReturnValue

PrintKartuFifoPeriode PROCEDURE (string vl_barang)         ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
vl_ke                SHORT                                 !
vl_no                LONG                                  !
FilesOpened          BYTE                                  !
vl_hitung            SHORT(0)                              !
loc::datel           DATE                                  !
loc::time            TIME                                  !
loc::total           LONG                                  !
loc::nama_apotik     STRING(30)                            !Nama Apotik
APA                  STRING(20)                            !
vl_bulan             SHORT                                 !
vl_tahun             LONG                                  !
vl_harga_raja        REAL                                  !
vl_harga_ranap_3     REAL                                  !
vl_harga_ranap_12vip REAL                                  !
vl_saldo_akhir       REAL                                  !
vl_debet             REAL                                  !
vl_kredit            REAL                                  !
vl_tanggal           STRING(5000)                          !
vl_jam               STRING(5000)                          !
vl_nomor             STRING(5000)                          !
vl_harga             STRING(5000)                          !
vl_jumlah            STRING(5000)                          !
vl_avi_harga         REAL                                  !
vl_afi_total         REAL                                  !
vl_out_total         STRING(5000)                          !
vl_harga_opname      REAL                                  !
vl_sub_total         REAL                                  !
vl_saldo_awal_jum    REAL                                  !
vl_saldo_awal_harga  REAL                                  !
vl_saldo_awal_total  REAL                                  !
vl_saldo_akhir_jum   REAL                                  !
vl_saldo_akhir_harga REAL                                  !
vl_saldo_akhir_total REAL                                  !
vl_saldo_awal_rp     REAL                                  !
vl_saldo_akhir_rp    REAL                                  !
Process:View         VIEW(AFIFOIN)
                       PROJECT(AFI:Harga)
                       PROJECT(AFI:Jumlah)
                       PROJECT(AFI:NoTransaksi)
                       PROJECT(AFI:Status)
                       PROJECT(AFI:Tanggal)
                       PROJECT(AFI:Kode_Barang)
                       JOIN(GBAR:KeyKodeBrg,AFI:Kode_Barang)
                         PROJECT(GBAR:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:No_Satuan)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(83,1792,11365,8844),PAPER(PAPER:FANFOLD_US),PRE(RPT),FONT('Arial',10,,),THOUS
                       HEADER,AT(146,292,11354,1490),FONT('Arial',8,,FONT:regular)
                         STRING('KARTU STOK'),AT(42,21,1615,219),TRN,LEFT,FONT(,12,,FONT:bold)
                         STRING('Apotik'),AT(42,208,688,146),USE(?String14),TRN,FONT('Arial',8,,FONT:regular)
                         STRING(':'),AT(708,208,135,146),USE(?String14:2),TRN,FONT('Arial',8,,FONT:regular)
                         STRING(@s5),AT(823,208,427,146),USE(GL_entryapotik)
                         BOX,AT(21,1021,11063,458),COLOR(COLOR:Black)
                         STRING('Pemasukan'),AT(3854,1052,802,167),USE(?String10:4),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Pengeluaran'),AT(7000,1052,802,167),USE(?String10:12),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Saldo Akhir'),AT(9667,1052,802,167),USE(?String10:9),TRN,FONT('Arial',8,,FONT:regular)
                         LINE,AT(2885,1031,0,448),USE(?Line5:4),COLOR(COLOR:Black)
                         STRING('Saldo Awal'),AT(1583,1052,802,167),USE(?String10:20),TRN,FONT('Arial',8,,FONT:regular)
                         LINE,AT(9063,1031,0,448),USE(?Line5:3),COLOR(COLOR:Black)
                         LINE,AT(5708,1031,0,448),USE(?Line5:2),COLOR(COLOR:Black)
                         STRING('Nomor'),AT(2927,1281,521,167),USE(?String10:5),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('No.'),AT(73,1146,260,167),USE(?String10:2),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Tanggal'),AT(323,1146,448,167),USE(?String10:3),TRN,FONT('Arial',8,,FONT:regular)
                         LINE,AT(813,1250,10265,0),COLOR(COLOR:Black)
                         STRING('Jumlah'),AT(3792,1281,438,167),USE(?String10:7),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Harga'),AT(4385,1281,438,167),USE(?String10:6),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Total'),AT(5219,1281,438,167),USE(?String10:8),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Tanggal'),AT(5729,1281,521,167),USE(?String10:14),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Jumlah'),AT(7229,1281,438,167),USE(?String10:15),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Harga'),AT(7854,1281,438,167),USE(?String10:10),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Total'),AT(8563,1281,438,167),USE(?String10:13),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Jumlah'),AT(9167,1292,438,167),USE(?String10:18),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Harga'),AT(9833,1292,438,167),USE(?String10:19),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Total'),AT(10604,1292,438,167),USE(?String10:17),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Jumlah'),AT(896,1281,438,167),USE(?String10:21),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Harga'),AT(1563,1281,438,167),USE(?String10:22),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Total'),AT(2333,1281,438,167),USE(?String10:11),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Nomor'),AT(6365,1281,521,167),USE(?String10:16),TRN,FONT('Arial',8,,FONT:regular)
                         LINE,AT(813,1021,0,458),USE(?Line5),COLOR(COLOR:Black)
                         STRING('Obat/Alat'),AT(42,406,844,146),TRN,FONT('Arial',8,,FONT:regular)
                         STRING(':'),AT(708,406,135,146),USE(?String14:3),TRN,FONT('Arial',8,,FONT:regular)
                         STRING(@s10),AT(823,406,688,146),USE(GBAR:Kode_brg),FONT('Arial',8,,FONT:regular)
                         STRING(@s40),AT(1854,406,3750,146),USE(GBAR:Nama_Brg),FONT('Arial',8,,FONT:regular)
                         STRING('Satuan'),AT(42,604,354,146),USE(?String19),TRN
                         STRING(':'),AT(708,604,135,146),USE(?String14:5),TRN,FONT('Arial',8,,FONT:regular)
                         STRING(@s10),AT(823,604,958,146),USE(GBAR:No_Satuan)
                         STRING('Periode '),AT(42,792,406,146),USE(?String19:2),TRN
                         STRING(':'),AT(708,792,135,146),USE(?String14:6),TRN,FONT('Arial',8,,FONT:regular)
                         STRING(@D06),AT(823,792,615,146),USE(VG_TANGGAL1),RIGHT(1)
                         STRING('s.d.'),AT(1510,792,188,146),USE(?String19:3),TRN
                         STRING(@D06),AT(1708,792,615,146),USE(VG_TANGGAL1,,?VG_TANGGAL1:2),TRN,RIGHT(1)
                       END
break1                 BREAK(APA)
detail1                  DETAIL,AT(,,,156),USE(?detail1),FONT('Arial',8,,FONT:regular)
                           STRING(@s12),AT(2927,0,781,135),USE(AFI:NoTransaksi)
                           STRING(@n8.2),AT(3708,0,479,135),USE(AFI:Jumlah),TRN,RIGHT
                           STRING(@n-12.2),AT(4208,0,667,135),USE(vl_avi_harga),TRN,RIGHT
                           STRING(@n-15.2),AT(4813,0,875,135),USE(vl_afi_total),TRN,RIGHT(2)
                           STRING(@n3),AT(42,0,240,135),CNT,RESET(break1),USE(vl_no),RIGHT(1),FONT('Arial',8,COLOR:Black,FONT:regular)
                           STRING(@d17),AT(323,0,490,135),USE(AFI:Tanggal)
                           LINE,AT(10,146,11063,0),COLOR(COLOR:Black)
                           TEXT,AT(8375,0,750,115),USE(vl_out_total),BOXED,RIGHT,RESIZE
                           STRING(@n10.2),AT(9208,0,479,135),USE(vl_saldo_akhir_jum),TRN,RIGHT
                           STRING(@n12.2),AT(9719,0,667,135),USE(vl_saldo_akhir_harga),TRN,RIGHT
                           STRING(@n15.2),AT(10417,0,708,135),USE(vl_saldo_akhir_total),TRN,RIGHT(2)
                           STRING(@n10.2),AT(875,0,479,135),USE(vl_saldo_awal_jum),TRN,RIGHT
                           STRING(@n12.2),AT(1417,0,667,135),USE(vl_saldo_awal_harga),TRN,RIGHT
                           STRING(@n15.2),AT(2115,0,708,135),USE(vl_saldo_awal_total),TRN,RIGHT(2)
                           TEXT,AT(7750,0,615,115),USE(vl_harga),BOXED,RIGHT,RESIZE
                           TEXT,AT(7208,0,531,115),USE(vl_jumlah,,?vl_jumlah:2),BOXED,RIGHT,RESIZE
                           TEXT,AT(6354,0,844,115),USE(vl_nomor),BOXED,RESIZE
                           TEXT,AT(5750,0,583,115),USE(vl_tanggal),BOXED,RESIZE
                         END
                         FOOTER,AT(0,0,,302)
                         END
                       END
                       FOOTER,AT(94,10646,11385,188)
                         STRING('Page xxxxx of xxxxx'),AT(5938,10,1302,208),USE(?PageOfString),FONT('Times New Roman',8,COLOR:Black,)
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
  GlobalErrors.SetProcedureName('PrintKartuFifoPeriode')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: Report
  BIND('glo:bulan',glo:bulan)                              ! Added by: Report
  BIND('glo:tahun',glo:tahun)                              ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  WindowTanggal12()
  bind('vl_barang',vl_barang)
  vl_saldo_awal_jum=0
  vl_saldo_awal_harga=0
  vl_saldo_awal_total=0
  display
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Access:GApotik.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintKartuFifoPeriode',ProgressWindow)     ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisReport.Init(Process:View, Relate:AFIFOIN, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  ThisReport.AppendOrder('afi:tanggal,afi:jam')
  ThisReport.SetFilter('afi:Kode_barang=vl_barang and afi:kode_Apotik=GL_entryapotik and afi:status=0 ')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  Relate:AFIFOIN.SetQuickScan(1,Propagate:OneMany)
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
    Relate:AFIFOIN.Close
  END
  IF SELF.Opened
    INIMgr.Update('PrintKartuFifoPeriode',ProgressWindow)  ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = AFI:Kode_Barang                          ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  GBAR:Kode_brg = AFI:Kode_Barang                          ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  vl_hitung+=1
  if vl_hitung=1
     IF sub(AFI:NoTransaksi,1,3)='OPN' then
        vl_harga_opname=AFI:Harga
     END
  else
     vl_harga_opname=AFI:Harga
  end
  
  
  vl_avi_harga=AFI:Harga
  vl_afi_total=AFI:Harga*AFI:Jumlah
  
  vl_tanggal=''
  vl_jam=''
  vl_nomor=''
  vl_harga=''
  vl_jumlah=''
  vl_out_total=''
  vl_sub_total=0
  vl_ke=1
  afifoout{prop:sql}='select * from dba.afifoout where kode_apotik='''&GL_entryapotik&''' and kode_barang='''&AFI:Kode_Barang&''' and NoTransaksi='''&AFI:NoTransaksi&''' and tanggal>='''&format(vg_tanggal1,@d10)&''' and tanggal<<='''&format(vg_tanggal2,@d10)&''' order by tanggal,jam'
  afifoout{prop:sql}='select * from dba.afifoout where kode_apotik='''&GL_entryapotik&''' and kode_barang='''&AFI:Kode_Barang&''' and NoTransaksi='''&AFI:NoTransaksi&''' and tanggal>='''&format(vg_tanggal1,@d10)&''' and tanggal<<='''&format(vg_tanggal2,@d10)&''' order by tanggal,jam'
  loop
     if access:afifoout.next()<>level:benign then break.
     if vl_ke=1 then
        vl_tanggal   =format(AFI2:Tanggal,@d06)
        vl_nomor     =clip(AFI2:NoTransKeluar)
        vl_harga     =format(AFI2:Harga,@n12.2)
        vl_jumlah    =format(AFI2:jumlah,@n10.2)
        vl_out_total =format(AFI2:jumlah*vl_avi_harga,@n15.2)
        vl_sub_total+=AFI2:Jumlah
     else
        vl_tanggal   =clip(vl_tanggal)&chr(10)&format(AFI2:Tanggal,@d06)
        vl_nomor     =clip(vl_nomor)&chr(10)&clip(AFI2:NoTransKeluar)
        vl_harga     =clip(vl_harga)&chr(10)&format(AFI2:Harga,@n12.2)
        vl_jumlah    =clip(vl_jumlah)&chr(10)&format(AFI2:jumlah,@n10.2)
        vl_out_total =clip(vl_out_total)&chr(10)&format(AFI2:jumlah*vl_avi_harga,@n15.2)
        vl_sub_total+=AFI2:Jumlah
     end
     vl_ke+=1
  end
  display
  
  vl_saldo_akhir_jum  =vl_saldo_awal_jum+AFI:Jumlah-vl_sub_total
  vl_saldo_akhir_total=vl_saldo_awal_total+(AFI:Harga*AFI:Jumlah)-(vl_sub_total*AFI:Harga)
  if vl_saldo_akhir_jum=0 then
     vl_saldo_akhir_harga=0
  else
     vl_saldo_akhir_harga=vl_saldo_akhir_total/vl_saldo_akhir_jum
  end
  ReturnValue = PARENT.TakeRecord()
  IF afi:tanggal>=VG_TANGGAL1 and afi:tanggal<=VG_TANGGAL2
    PRINT(RPT:detail1)
  END
  vl_saldo_awal_jum   =vl_saldo_akhir_jum
  vl_saldo_awal_harga =vl_saldo_akhir_harga
  vl_saldo_awal_total =vl_saldo_akhir_total
  display
  
  RETURN ReturnValue

