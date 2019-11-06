

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N015.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N014.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N016.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N017.INC'),ONCE        !Req'd for module callout resolution
                     END


ProsesKartuFIFOInQue1 PROCEDURE                            ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
vl_ke                SHORT                                 !
vl_sub_total         REAL                                  !
vl_ada               BYTE                                  !
vl_i                 SHORT                                 !
vl_jumlah            REAL                                  !
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
  GlobalErrors.SetProcedureName('ProsesKartuFIFOInQue1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  free(Glo:QueFifo)
  vg_kfifo_jumlah=0
  vg_kfifo_total =0
  display
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
  INIMgr.Fetch('ProsesKartuFIFOInQue1',ProgressWindow)     ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:AFIFOIN, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ThisProcess.AppendOrder('afi:tanggal,afi:jam')
  ThisProcess.SetFilter('afi:kode_Apotik=GL_entryapotik and afi:kode_barang=glo_kode_barang and afi:status=0 and afi:Tanggal<<vg_tanggal1 ')
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
    INIMgr.Update('ProsesKartuFIFOInQue1',ProgressWindow)  ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  vl_jumlah=0
  afifoout{prop:sql}='select * from dba.afifoout where kode_apotik='''&GL_entryapotik&''' and kode_barang='''&AFI:Kode_Barang&''' and NoTransaksi='''&AFI:NoTransaksi&''' and tanggal<<'''&format(vg_tanggal1,@D10)&''' order by tanggal,jam'
  loop
     if access:afifoout.next()<>level:benign then break.
     vl_jumlah+=AFI2:Jumlah
  end
  vl_ada=0
  vl_ke=1
  afifoout{prop:sql}='select * from dba.afifoout where kode_apotik='''&GL_entryapotik&''' and kode_barang='''&AFI:Kode_Barang&''' and NoTransaksi='''&AFI:NoTransaksi&''' and tanggal>='''&format(vg_tanggal1,@D10)&''' and tanggal<<='''&format(vg_tanggal2,@D10)&''' order by tanggal,jam'
  loop
     if access:afifoout.next()<>level:benign then break.
     vl_ada=1
     if vl_ke=1 then
        vl_sub_total           +=AFI2:Jumlah
        Glo:QueFifo.Tanggal     =AFI:Tanggal
        Glo:QueFifo.NomorIn     ='SA = '&clip(AFI:NoTransaksi)
        Glo:QueFifo.JumlahIn    =AFI:Jumlah-vl_jumlah
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
  if vl_ada=0 and AFI:Jumlah_Keluar=0 then
     vl_sub_total           +=AFI2:Jumlah
     Glo:QueFifo.Tanggal     =AFI:Tanggal
     Glo:QueFifo.NomorIn     ='SA ='&clip(AFI:NoTransaksi)
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
  
  
  !vg_kfifo_jumlah+=AFI:Jumlah
  !vg_kfifo_total +=AFI:Jumlah*AFI:Harga
  !display
  ReturnValue = PARENT.TakeRecord()
  vl_i+=1
  display
  RETURN ReturnValue

ProsesKartuFIFOQue1 PROCEDURE                              ! Generated from procedure template - Process

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
  GlobalErrors.SetProcedureName('ProsesKartuFIFOQue1')
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
  INIMgr.Fetch('ProsesKartuFIFOQue1',ProgressWindow)       ! Restore window settings from non-volatile store
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
    INIMgr.Update('ProsesKartuFIFOQue1',ProgressWindow)    ! Save window data to non-volatile store
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

BrowseKartuFIFOApotik PROCEDURE                            ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
vl_in                REAL                                  !
vl_out               REAL                                  !
vl_total             REAL                                  !
BRW1::View:Browse    VIEW(AFIFOIN)
                       PROJECT(AFI:Tanggal)
                       PROJECT(AFI:Jam)
                       PROJECT(AFI:NoTransaksi)
                       PROJECT(AFI:Harga)
                       PROJECT(AFI:Jumlah)
                       PROJECT(AFI:Jumlah_Keluar)
                       PROJECT(AFI:Kode_Barang)
                       PROJECT(AFI:Tgl_Update)
                       PROJECT(AFI:Transaksi)
                       PROJECT(AFI:Kode_Apotik)
                       PROJECT(AFI:Status)
                       PROJECT(AFI:Mata_Uang)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
AFI:Tanggal            LIKE(AFI:Tanggal)              !List box control field - type derived from field
AFI:Jam                LIKE(AFI:Jam)                  !List box control field - type derived from field
AFI:NoTransaksi        LIKE(AFI:NoTransaksi)          !List box control field - type derived from field
AFI:Harga              LIKE(AFI:Harga)                !List box control field - type derived from field
AFI:Jumlah             LIKE(AFI:Jumlah)               !List box control field - type derived from field
AFI:Jumlah_Keluar      LIKE(AFI:Jumlah_Keluar)        !List box control field - type derived from field
AFI:Kode_Barang        LIKE(AFI:Kode_Barang)          !List box control field - type derived from field
AFI:Tgl_Update         LIKE(AFI:Tgl_Update)           !List box control field - type derived from field
AFI:Transaksi          LIKE(AFI:Transaksi)            !List box control field - type derived from field
AFI:Kode_Apotik        LIKE(AFI:Kode_Apotik)          !List box control field - type derived from field
AFI:Status             LIKE(AFI:Status)               !List box control field - type derived from field
AFI:Mata_Uang          LIKE(AFI:Mata_Uang)            !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW4::View:Browse    VIEW(GBarang)
                       PROJECT(GBAR:Kode_brg)
                       PROJECT(GBAR:Nama_Brg)
                       PROJECT(GBAR:Jenis_Brg)
                       PROJECT(GBAR:No_Satuan)
                       PROJECT(GBAR:Status)
                       PROJECT(GBAR:FarNonFar)
                       JOIN(GSTO:KeyBarang,GBAR:Kode_brg)
                         PROJECT(GSTO:Saldo)
                         PROJECT(GSTO:Kode_Apotik)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Jenis_Brg         LIKE(GBAR:Jenis_Brg)           !List box control field - type derived from field
GBAR:No_Satuan         LIKE(GBAR:No_Satuan)           !List box control field - type derived from field
GSTO:Saldo             LIKE(GSTO:Saldo)               !List box control field - type derived from field
GBAR:Status            LIKE(GBAR:Status)              !List box control field - type derived from field
GSTO:Kode_Apotik       LIKE(GSTO:Kode_Apotik)         !List box control field - type derived from field
GBAR:FarNonFar         LIKE(GBAR:FarNonFar)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(AFIFOOUT)
                       PROJECT(AFI2:Tanggal)
                       PROJECT(AFI2:Jam)
                       PROJECT(AFI2:NoTransKeluar)
                       PROJECT(AFI2:Harga)
                       PROJECT(AFI2:Jumlah)
                       PROJECT(AFI2:Kode_Barang)
                       PROJECT(AFI2:Kode_Apotik)
                       PROJECT(AFI2:Transaksi)
                       PROJECT(AFI2:NoTransaksi)
                       PROJECT(AFI2:Mata_Uang)
                       PROJECT(AFI2:Tgl_Update)
                       PROJECT(AFI2:Jam_Update)
                       PROJECT(AFI2:Operator)
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?List:2
AFI2:Tanggal           LIKE(AFI2:Tanggal)             !List box control field - type derived from field
AFI2:Jam               LIKE(AFI2:Jam)                 !List box control field - type derived from field
AFI2:NoTransKeluar     LIKE(AFI2:NoTransKeluar)       !List box control field - type derived from field
AFI2:Harga             LIKE(AFI2:Harga)               !List box control field - type derived from field
AFI2:Jumlah            LIKE(AFI2:Jumlah)              !List box control field - type derived from field
AFI2:Kode_Barang       LIKE(AFI2:Kode_Barang)         !List box control field - type derived from field
AFI2:Kode_Apotik       LIKE(AFI2:Kode_Apotik)         !List box control field - type derived from field
AFI2:Transaksi         LIKE(AFI2:Transaksi)           !List box control field - type derived from field
AFI2:NoTransaksi       LIKE(AFI2:NoTransaksi)         !List box control field - type derived from field
AFI2:Mata_Uang         LIKE(AFI2:Mata_Uang)           !List box control field - type derived from field
AFI2:Tgl_Update        LIKE(AFI2:Tgl_Update)          !List box control field - type derived from field
AFI2:Jam_Update        LIKE(AFI2:Jam_Update)          !List box control field - type derived from field
AFI2:Operator          LIKE(AFI2:Operator)            !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW8::View:Browse    VIEW(GStockGdg)
                       PROJECT(GSGD:Jumlah_Stok)
                       PROJECT(GSGD:Kode_brg)
                     END
Queue:Browse:3       QUEUE                            !Queue declaration for browse/combo box using ?List:3
GSGD:Jumlah_Stok       LIKE(GSGD:Jumlah_Stok)         !List box control field - type derived from field
GSGD:Kode_brg          LIKE(GSGD:Kode_brg)            !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('KARTU PERSEDIAN - METODA FIFO'),AT(,,415,264),FONT('Arial',8,,),CENTER,IMM,HLP('BrowseKartuStok'),SYSTEM,GRAY,MDI
                       SHEET,AT(5,1,343,91),USE(?Sheet1)
                         TAB('Nama Barang (F2)'),USE(?Tab1),KEY(F2Key)
                           BUTTON('&Proses'),AT(127,75,45,14),USE(?Button1),DISABLE,HIDE
                           PROMPT('Nama Obat:'),AT(11,77),USE(?GBAR:Nama_Brg:Prompt)
                           ENTRY(@s40),AT(61,77,60,10),USE(GBAR:Nama_Brg),MSG('Nama Barang'),TIP('Nama Barang')
                         END
                         TAB('Kode Barang (F3)'),USE(?Tab2),KEY(F3Key)
                           PROMPT('Kode Barang:'),AT(9,77),USE(?GBAR:Kode_brg:Prompt)
                           ENTRY(@s10),AT(59,77,60,10),USE(GBAR:Kode_brg),MSG('Kode Barang'),TIP('Kode Barang')
                         END
                       END
                       LIST,AT(9,93,395,64),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('47R(2)|M~Tanggal~C(0)@d06@37R(2)|M~Jam~C(0)@t04@66L(2)|M~No Transaksi~@s15@67D(1' &|
   '8)|M~Harga~C(0)@n15.2@48D(16)|M~Jumlah~C(0)@n-11.2@56D(12)|M~Jumlah Keluar~C(0)@' &|
   'n-11.2@48L(2)|M~Kode Barang~@s10@80R(2)|M~Tgl Update~C(0)@d17@40R(2)|M~Transaksi' &|
   '~C(0)@n3@20R(2)|M~Kode Apotik~C(0)@s5@12R(2)|M~Status~C(0)@n3@'),FROM(Queue:Browse:1)
                       BUTTON('&Tambah'),AT(12,160,42,12),USE(?Insert)
                       BUTTON('&Ubah'),AT(56,160,42,12),USE(?Change)
                       BUTTON('&Hapus'),AT(99,160,42,12),USE(?Delete)
                       ENTRY(@n-11.2),AT(258,161,52,10),USE(vl_out),DECIMAL(14)
                       PROMPT('Total :'),AT(312,161),USE(?vl_total:Prompt)
                       ENTRY(@n-12.2),AT(333,161,57,10),USE(vl_total),DECIMAL(14)
                       ENTRY(@n-11.2),AT(205,161,49,10),USE(vl_in),DECIMAL(14)
                       LIST,AT(9,175,395,71),USE(?List:2),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('49L|M~Tanggal~@d06@35L|M~Jam~@t04@64L|M~No Trans~@s15@46L|M~Harga~@n-15.2@57L|M~' &|
   'Jumlah~@n-15.2@40L|M~Kode Barang~@s10@45L|M~Kode Apotik~@s5@40L|M~Transaksi~@n3@' &|
   '51L|M~No Transaksi~@s15@20L|M~Mata Uang~@s5@32L|M~Tgl Update~@d17@20L|M~Jam Upda' &|
   'te~@t7@80L|M~Operator~@s20@'),FROM(Queue:Browse:2)
                       BUTTON('&1. Tambah'),AT(4,248,45,14),USE(?Insert:2)
                       BUTTON('&2. Ubah'),AT(50,248,45,14),USE(?Change:2)
                       BUTTON('&3. Hapus'),AT(95,248,45,14),USE(?Delete:2)
                       LIST,AT(9,19,337,54),USE(?List),IMM,VSCROLL,MSG('Browsing Records'),VCR,FORMAT('40L|M~Kode Barang~@s10@160L|M~Nama Obat~@s40@20L|M~Jenis Brg~@s5@40L|M~Satuan~@s' &|
   '10@64R|M~Saldo~L@n16.2@12L|M~Status~@n3@20L|M~Kode Apotik~@s5@12L|M~Far Non Far~' &|
   '@n3@'),FROM(Queue:Browse)
                       LIST,AT(351,19,51,54),USE(?List:3),IMM,MSG('Browsing Records'),FORMAT('55R|M~Stok Gudang~L@n18.2@40D|M~Kode Barang~L@s10@'),FROM(Queue:Browse:3)
                       BUTTON('&Selesai'),AT(141,248,45,14),USE(?Close)
                       BUTTON('&FIFO Model 1'),AT(189,248,71,14),USE(?Button3:2),LEFT,ICON(ICON:Print)
                       BUTTON('&FIFO Model 2'),AT(263,248,71,14),USE(?Button10),LEFT,ICON(ICON:Print)
                       BUTTON('&FIFO Model 3'),AT(337,248,71,14),USE(?Button10:2),LEFT,ICON(ICON:Print)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Reset                  PROCEDURE(BYTE Force=0),DERIVED     ! Method added to host embed code
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

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW4                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW4::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW4::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - choice(?Sheet1)=2
BRW5                 CLASS(BrowseClass)                    ! Browse using ?List:2
Q                      &Queue:Browse:2                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
                     END

BRW5::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW8                 CLASS(BrowseClass)                    ! Browse using ?List:3
Q                      &Queue:Browse:3                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
                     END

BRW8::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::EIPManager     BrowseEIPManager                      ! Browse EIP Manager for Browse using ?Browse:1
BRW5::EIPManager     BrowseEIPManager                      ! Browse EIP Manager for Browse using ?List:2
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
  GlobalErrors.SetProcedureName('BrowseKartuFIFOApotik')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Button1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('afi:kode_apotik',afi:kode_apotik)                  ! Added by: BrowseBox(ABC)
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  BIND('AFI:Tanggal',AFI:Tanggal)                          ! Added by: BrowseBox(ABC)
  BIND('AFI:Jam',AFI:Jam)                                  ! Added by: BrowseBox(ABC)
  BIND('AFI:NoTransaksi',AFI:NoTransaksi)                  ! Added by: BrowseBox(ABC)
  BIND('AFI:Harga',AFI:Harga)                              ! Added by: BrowseBox(ABC)
  BIND('AFI:Jumlah',AFI:Jumlah)                            ! Added by: BrowseBox(ABC)
  BIND('AFI:Jumlah_Keluar',AFI:Jumlah_Keluar)              ! Added by: BrowseBox(ABC)
  BIND('AFI:Kode_Barang',AFI:Kode_Barang)                  ! Added by: BrowseBox(ABC)
  BIND('AFI:Tgl_Update',AFI:Tgl_Update)                    ! Added by: BrowseBox(ABC)
  BIND('AFI:Transaksi',AFI:Transaksi)                      ! Added by: BrowseBox(ABC)
  BIND('AFI:Mata_Uang',AFI:Mata_Uang)                      ! Added by: BrowseBox(ABC)
  BIND('AFI2:Tanggal',AFI2:Tanggal)                        ! Added by: BrowseBox(ABC)
  BIND('AFI2:Jam',AFI2:Jam)                                ! Added by: BrowseBox(ABC)
  BIND('AFI2:NoTransKeluar',AFI2:NoTransKeluar)            ! Added by: BrowseBox(ABC)
  BIND('AFI2:Harga',AFI2:Harga)                            ! Added by: BrowseBox(ABC)
  BIND('AFI2:Jumlah',AFI2:Jumlah)                          ! Added by: BrowseBox(ABC)
  BIND('AFI2:Kode_Barang',AFI2:Kode_Barang)                ! Added by: BrowseBox(ABC)
  BIND('AFI2:Kode_Apotik',AFI2:Kode_Apotik)                ! Added by: BrowseBox(ABC)
  BIND('AFI2:Transaksi',AFI2:Transaksi)                    ! Added by: BrowseBox(ABC)
  BIND('AFI2:NoTransaksi',AFI2:NoTransaksi)                ! Added by: BrowseBox(ABC)
  BIND('AFI2:Mata_Uang',AFI2:Mata_Uang)                    ! Added by: BrowseBox(ABC)
  BIND('AFI2:Tgl_Update',AFI2:Tgl_Update)                  ! Added by: BrowseBox(ABC)
  BIND('AFI2:Jam_Update',AFI2:Jam_Update)                  ! Added by: BrowseBox(ABC)
  BIND('AFI2:Operator',AFI2:Operator)                      ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File GStockGdg used by this procedure, so make sure it's RelationManager is open
  Relate:ApStokop.Open                                     ! File GStockGdg used by this procedure, so make sure it's RelationManager is open
  Access:GBarang.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStockGdg.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:AFIFOIN,SELF) ! Initialize the browse manager
  BRW4.Init(?List,Queue:Browse.ViewPosition,BRW4::View:Browse,Queue:Browse,Relate:GBarang,SELF) ! Initialize the browse manager
  BRW5.Init(?List:2,Queue:Browse:2.ViewPosition,BRW5::View:Browse,Queue:Browse:2,Relate:AFIFOOUT,SELF) ! Initialize the browse manager
  BRW8.Init(?List:3,Queue:Browse:3.ViewPosition,BRW8::View:Browse,Queue:Browse:3,Relate:GStockGdg,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  ?List:2{Prop:LineHeight} = 0
  ?List:3{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,AFI:KeyBarangFIFOIN)                  ! Add the sort order for AFI:KeyBarangFIFOIN for sort order 1
  BRW1.AddRange(AFI:Kode_Barang,Relate:AFIFOIN,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,AFI:Kode_Barang,1,BRW1)        ! Initialize the browse locator using  using key: AFI:KeyBarangFIFOIN , AFI:Kode_Barang
  BRW1.AppendOrder('afi:tanggal,afi:jam,afi:notransaksi')  ! Append an additional sort order
  BRW1.SetFilter('(afi:kode_apotik=GL_entryapotik and afi:status=0)') ! Apply filter expression to browse
  BRW1.AddField(AFI:Tanggal,BRW1.Q.AFI:Tanggal)            ! Field AFI:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(AFI:Jam,BRW1.Q.AFI:Jam)                    ! Field AFI:Jam is a hot field or requires assignment from browse
  BRW1.AddField(AFI:NoTransaksi,BRW1.Q.AFI:NoTransaksi)    ! Field AFI:NoTransaksi is a hot field or requires assignment from browse
  BRW1.AddField(AFI:Harga,BRW1.Q.AFI:Harga)                ! Field AFI:Harga is a hot field or requires assignment from browse
  BRW1.AddField(AFI:Jumlah,BRW1.Q.AFI:Jumlah)              ! Field AFI:Jumlah is a hot field or requires assignment from browse
  BRW1.AddField(AFI:Jumlah_Keluar,BRW1.Q.AFI:Jumlah_Keluar) ! Field AFI:Jumlah_Keluar is a hot field or requires assignment from browse
  BRW1.AddField(AFI:Kode_Barang,BRW1.Q.AFI:Kode_Barang)    ! Field AFI:Kode_Barang is a hot field or requires assignment from browse
  BRW1.AddField(AFI:Tgl_Update,BRW1.Q.AFI:Tgl_Update)      ! Field AFI:Tgl_Update is a hot field or requires assignment from browse
  BRW1.AddField(AFI:Transaksi,BRW1.Q.AFI:Transaksi)        ! Field AFI:Transaksi is a hot field or requires assignment from browse
  BRW1.AddField(AFI:Kode_Apotik,BRW1.Q.AFI:Kode_Apotik)    ! Field AFI:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(AFI:Status,BRW1.Q.AFI:Status)              ! Field AFI:Status is a hot field or requires assignment from browse
  BRW1.AddField(AFI:Mata_Uang,BRW1.Q.AFI:Mata_Uang)        ! Field AFI:Mata_Uang is a hot field or requires assignment from browse
  BRW4.Q &= Queue:Browse
  BRW4.AddSortOrder(,GBAR:KeyKodeBrg)                      ! Add the sort order for GBAR:KeyKodeBrg for sort order 1
  BRW4.AddLocator(BRW4::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW4::Sort1:Locator.Init(?GBAR:Kode_brg,GBAR:Kode_brg,,BRW4) ! Initialize the browse locator using ?GBAR:Kode_brg using key: GBAR:KeyKodeBrg , GBAR:Kode_brg
  BRW4.SetFilter('(gbar:status=1 and gbar:farnonfar=0)')   ! Apply filter expression to browse
  BRW4.AddSortOrder(,GBAR:KeyNama)                         ! Add the sort order for GBAR:KeyNama for sort order 2
  BRW4.AddLocator(BRW4::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW4::Sort0:Locator.Init(?GBAR:Nama_Brg,GBAR:Nama_Brg,,BRW4) ! Initialize the browse locator using ?GBAR:Nama_Brg using key: GBAR:KeyNama , GBAR:Nama_Brg
  BRW4.SetFilter('(gbar:status=1 and gsto:kode_apotik=GL_entryapotik and gbar:farnonfar=0)') ! Apply filter expression to browse
  BRW4.AddField(GBAR:Kode_brg,BRW4.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Nama_Brg,BRW4.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Jenis_Brg,BRW4.Q.GBAR:Jenis_Brg)      ! Field GBAR:Jenis_Brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:No_Satuan,BRW4.Q.GBAR:No_Satuan)      ! Field GBAR:No_Satuan is a hot field or requires assignment from browse
  BRW4.AddField(GSTO:Saldo,BRW4.Q.GSTO:Saldo)              ! Field GSTO:Saldo is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Status,BRW4.Q.GBAR:Status)            ! Field GBAR:Status is a hot field or requires assignment from browse
  BRW4.AddField(GSTO:Kode_Apotik,BRW4.Q.GSTO:Kode_Apotik)  ! Field GSTO:Kode_Apotik is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:FarNonFar,BRW4.Q.GBAR:FarNonFar)      ! Field GBAR:FarNonFar is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse:2
  BRW5.AddSortOrder(,AFI2:KEY1)                            ! Add the sort order for AFI2:KEY1 for sort order 1
  BRW5.AddRange(AFI2:Kode_Apotik,Relate:AFIFOOUT,Relate:AFIFOIN) ! Add file relationship range limit for sort order 1
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort0:Locator.Init(,AFI2:NoTransKeluar,,BRW5)      ! Initialize the browse locator using  using key: AFI2:KEY1 , AFI2:NoTransKeluar
  BRW5.AppendOrder('afi2:tanggal,afi2:jam,afi2:notransaksi') ! Append an additional sort order
  BRW5.AddField(AFI2:Tanggal,BRW5.Q.AFI2:Tanggal)          ! Field AFI2:Tanggal is a hot field or requires assignment from browse
  BRW5.AddField(AFI2:Jam,BRW5.Q.AFI2:Jam)                  ! Field AFI2:Jam is a hot field or requires assignment from browse
  BRW5.AddField(AFI2:NoTransKeluar,BRW5.Q.AFI2:NoTransKeluar) ! Field AFI2:NoTransKeluar is a hot field or requires assignment from browse
  BRW5.AddField(AFI2:Harga,BRW5.Q.AFI2:Harga)              ! Field AFI2:Harga is a hot field or requires assignment from browse
  BRW5.AddField(AFI2:Jumlah,BRW5.Q.AFI2:Jumlah)            ! Field AFI2:Jumlah is a hot field or requires assignment from browse
  BRW5.AddField(AFI2:Kode_Barang,BRW5.Q.AFI2:Kode_Barang)  ! Field AFI2:Kode_Barang is a hot field or requires assignment from browse
  BRW5.AddField(AFI2:Kode_Apotik,BRW5.Q.AFI2:Kode_Apotik)  ! Field AFI2:Kode_Apotik is a hot field or requires assignment from browse
  BRW5.AddField(AFI2:Transaksi,BRW5.Q.AFI2:Transaksi)      ! Field AFI2:Transaksi is a hot field or requires assignment from browse
  BRW5.AddField(AFI2:NoTransaksi,BRW5.Q.AFI2:NoTransaksi)  ! Field AFI2:NoTransaksi is a hot field or requires assignment from browse
  BRW5.AddField(AFI2:Mata_Uang,BRW5.Q.AFI2:Mata_Uang)      ! Field AFI2:Mata_Uang is a hot field or requires assignment from browse
  BRW5.AddField(AFI2:Tgl_Update,BRW5.Q.AFI2:Tgl_Update)    ! Field AFI2:Tgl_Update is a hot field or requires assignment from browse
  BRW5.AddField(AFI2:Jam_Update,BRW5.Q.AFI2:Jam_Update)    ! Field AFI2:Jam_Update is a hot field or requires assignment from browse
  BRW5.AddField(AFI2:Operator,BRW5.Q.AFI2:Operator)        ! Field AFI2:Operator is a hot field or requires assignment from browse
  BRW8.Q &= Queue:Browse:3
  BRW8.AddSortOrder(,GSGD:KeyKodeBrg)                      ! Add the sort order for GSGD:KeyKodeBrg for sort order 1
  BRW8.AddRange(GSGD:Kode_brg,Relate:GStockGdg,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW8.AddLocator(BRW8::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW8::Sort0:Locator.Init(,GSGD:Kode_brg,1,BRW8)          ! Initialize the browse locator using  using key: GSGD:KeyKodeBrg , GSGD:Kode_brg
  BRW8.AddField(GSGD:Jumlah_Stok,BRW8.Q.GSGD:Jumlah_Stok)  ! Field GSGD:Jumlah_Stok is a hot field or requires assignment from browse
  BRW8.AddField(GSGD:Kode_brg,BRW8.Q.GSGD:Kode_brg)        ! Field GSGD:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseKartuFIFOApotik',QuickWindow)        ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW4.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW5.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW8.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AFIFOIN.Close
    Relate:ApStokop.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseKartuFIFOApotik',QuickWindow)     ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  vl_total = vl_in - vl_out
  PARENT.Reset(Force)


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
    OF ?Insert
      if glo:level>0 then
         cycle
      end
    OF ?Change
      if glo:level>0 then
         cycle
      end
    OF ?Delete
      if glo:level>0 then
         cycle
      end
    OF ?Insert:2
      if glo:level>0 then
         cycle
      end
    OF ?Change:2
      if glo:level>0 then
         cycle
      end
    OF ?Delete:2
      if glo:level>0 then
         cycle
      end
    OF ?Button3:2
      glo_kode_barang=afi:kode_barang
      display
    OF ?Button10
      glo_kode_barang=afi:kode_barang
      display
    OF ?Button10:2
      glo_kode_barang=afi:kode_barang
      display
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button1
      ThisWindow.Update
      apstokop{prop:sql}='select * from dba.apstokop where bulan=10 and tahun=2002 and kode_apotik='''&GL_entryapotik&''''
      loop
         if access:apstokop.next()<>level:benign then break.
         GSTO:Kode_Barang=Apso:Kode_Barang
         GSTO:Kode_Apotik=GL_entryapotik
         access:gstokaptk.fetch(GSTO:KeyBarang)
         AFI:Kode_Barang  =Apso:Kode_Barang
         AFI:Mata_Uang    ='Rp'
         AFI:NoTransaksi  ='OPN0210'
         AFI:Transaksi    =1
         AFI:Tanggal      =today()
         AFI:Harga        =GSTO:Harga_Dasar
         AFI:Jumlah       =GSTO:Saldo
         AFI:Jumlah_Keluar=0
         AFI:Tgl_Update   =today()
         AFI:Jam_Update   =clock()
         AFI:Operator     ='ADI'
         AFI:Jam          =clock()
         AFI:Kode_Apotik  =GL_entryapotik
         AFI:Status       =0
         access:afifoin.insert()
      end
    OF ?Button3:2
      ThisWindow.Update
      START(PrintKArtuFifoQue1, 25000)
      ThisWindow.Reset
    OF ?Button10
      ThisWindow.Update
      START(PrintKArtuFifoQue11, 25000)
      ThisWindow.Reset
    OF ?Button10:2
      ThisWindow.Update
      START(PrintFIFOModelSri, 25000)
      ThisWindow.Reset
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
      if clip(vg_user)<>'ADI' then
         hide(?button1)
         hide(?insert)
         hide(?change)
         hide(?delete)
         hide(?insert:2)
         hide(?change:2)
         hide(?delete:2)
      end
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  vl_total = vl_in - vl_out


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  SELF.EIP &= BRW1::EIPManager                             ! Set the EIP manager
  SELF.DeleteAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Default+EIPAction:Remain+EIPAction:RetainColumn
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW1.ResetFromView PROCEDURE

vl_in:Sum            REAL                                  ! Sum variable for browse totals
vl_out:Sum           REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:AFIFOIN.SetQuickScan(1)
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
    vl_in:Sum += AFI:Jumlah
    vl_out:Sum += AFI:Jumlah_Keluar
  END
  vl_in = vl_in:Sum
  vl_out = vl_out:Sum
  PARENT.ResetFromView
  Relate:AFIFOIN.SetQuickScan(0)
  SETCURSOR()


BRW4.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW4.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF choice(?Sheet1)=2
    RETURN SELF.SetSort(1,Force)
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW5.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW5.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  SELF.EIP &= BRW5::EIPManager                             ! Set the EIP manager
  SELF.DeleteAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Default+EIPAction:Remain+EIPAction:RetainColumn
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:2
    SELF.ChangeControl=?Change:2
    SELF.DeleteControl=?Delete:2
  END


BRW8.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

WindowTanggal12 PROCEDURE                                  ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
Window               WINDOW('Tanggal'),AT(,,185,92),FONT('Arial',8,,FONT:regular),CENTER,GRAY
                       PANEL,AT(3,5,172,62),USE(?Panel1)
                       PROMPT('Dari Tanggal '),AT(25,17),USE(?VG_TANGGAL1:Prompt)
                       ENTRY(@D6-),AT(82,17,60,10),USE(VG_TANGGAL1)
                       PROMPT('Sampai Tanggal'),AT(25,37),USE(?VG_TANGGAL2:Prompt)
                       ENTRY(@d6-),AT(82,37,60,10),USE(VG_TANGGAL2)
                       BUTTON('OK'),AT(32,71,123,14),USE(?OkButton),DEFAULT
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
  GlobalErrors.SetProcedureName('WindowTanggal12')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Panel1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('WindowTanggal12',Window)                   ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('WindowTanggal12',Window)                ! Save window data to non-volatile store
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

PrintFIFOModelSri PROCEDURE                                ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
vl_nama_ket          STRING(20)                            !
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
vl_total_jual        REAL                                  !
vl_tot_fifo          REAL                                  !
vl_tot_jual          REAL                                  !
vl_tot_sisa          REAL                                  !
vl_nomor_mr          LONG                                  !
Process:View         VIEW(FileSql)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(146,1781,11208,5885),PAPER(PAPER:A4),PRE(RPT),FONT('Arial',10,COLOR:Black,),LANDSCAPE,THOUS
                       HEADER,AT(156,292,11219,1490),FONT('Arial',8,,FONT:regular)
                         STRING('KARTU STOK'),AT(42,10,1615,219),TRN,LEFT,FONT(,12,,FONT:bold)
                         STRING('Apotik'),AT(42,208,625,146),USE(?String14),TRN,FONT('Arial',8,,FONT:regular)
                         STRING(':'),AT(708,208,135,146),USE(?String14:2),TRN,FONT('Arial',8,,FONT:regular)
                         STRING(@s5),AT(823,208,427,146),USE(GL_entryapotik)
                         STRING(@s30),AT(1250,208,1927,146),USE(GAPO:Nama_Apotik)
                         BOX,AT(21,1031,11000,458),COLOR(COLOR:Black)
                         STRING('Pemasukan'),AT(3583,1063,740,167),USE(?String10:4),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Pengeluaran'),AT(5396,1052,802,167),USE(?String10:12),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Saldo'),AT(9854,1052,802,167),USE(?String10:9),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Penyesuaian Harga'),AT(7948,1052,1135,167),USE(?String10:11),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Penjualan'),AT(6979,1052,635,167),USE(?String10:23),TRN,FONT('Arial',8,,FONT:regular)
                         LINE,AT(4802,1031,0,448),USE(?Line5:4),COLOR(COLOR:Black)
                         LINE,AT(9167,1031,0,448),USE(?Line5:3),COLOR(COLOR:Black)
                         LINE,AT(6635,1031,0,448),USE(?Line5:2),COLOR(COLOR:Black)
                         LINE,AT(7854,1031,0,448),USE(?Line5:5),COLOR(COLOR:Black)
                         STRING('Nomor'),AT(792,1146,521,167),USE(?String10:5),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('No.'),AT(73,1146,260,167),USE(?String10:2),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Tanggal'),AT(313,1146,448,167),USE(?String10:3),TRN,FONT('Arial',8,,FONT:regular)
                         LINE,AT(2969,1260,8050,0),COLOR(COLOR:Black)
                         STRING('Jumlah'),AT(3135,1281,438,167),USE(?String10:7),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Harga'),AT(3750,1281,344,167),USE(?String10:6),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Total'),AT(4500,1281,281,167),USE(?String10:8),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Jumlah'),AT(4875,1281,438,167),USE(?String10:15),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Harga'),AT(5448,1281,438,167),USE(?String10:10),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Total'),AT(6146,1281,438,167),USE(?String10:13),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Jumlah'),AT(9229,1292,438,167),USE(?String10:18),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Harga'),AT(9854,1292,438,167),USE(?String10:19),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Total'),AT(10510,1292,438,167),USE(?String10:17),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Harga'),AT(7979,1281,438,167),USE(?String10:21),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Total'),AT(8667,1281,438,167),USE(?String10:20),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Total'),AT(7385,1281,438,167),USE(?String10:25),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Harga'),AT(6698,1281,438,167),USE(?String10:24),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         LINE,AT(2969,1031,0,458),USE(?Line5),COLOR(COLOR:Black)
                         STRING('Kode'),AT(42,365,625,146),TRN,FONT('Arial',8,,FONT:regular)
                         STRING(':'),AT(708,365,135,146),USE(?String14:3),TRN,FONT('Arial',8,,FONT:regular)
                         STRING(@s40),AT(823,521,2083,146),USE(GBAR:Nama_Brg),TRN
                         STRING('Nama '),AT(42,521,625,146),USE(?String57),TRN,FONT('Arial',8,,FONT:regular)
                         STRING(':'),AT(708,531,135,146),USE(?String14:4),TRN,FONT('Arial',8,,FONT:regular)
                         STRING(@s10),AT(823,365,677,146),USE(GBAR:Kode_brg),TRN
                         STRING('Satuan'),AT(42,688,625,146),USE(?String19),TRN
                         STRING(':'),AT(708,688,135,146),USE(?String14:5),TRN,FONT('Arial',8,,FONT:regular)
                         STRING(@s10),AT(823,688,677,146),USE(GBAR:No_Satuan)
                         STRING('Periode '),AT(42,854,625,146),USE(?String19:2),TRN
                         STRING(':'),AT(708,854,135,146),USE(?String14:6),TRN,FONT('Arial',8,,FONT:regular)
                         STRING(@D06),AT(823,854,615,146),USE(VG_TANGGAL1),LEFT(1)
                         STRING('s.d.'),AT(1490,854,188,146),USE(?String19:3),TRN
                         STRING(@D06),AT(1688,854,615,146),USE(VG_TANGGAL2),TRN,RIGHT(1)
                       END
break1                 BREAK(APA)
detail1                  DETAIL,AT(,,,125),USE(?detail1),FONT('Arial',7,,FONT:regular)
                           STRING(@n12.2B),AT(3500,0,573,125),USE(HargaIn),TRN,RIGHT
                           STRING(@n15.2B),AT(4083,0,708,125),USE(TotalIn),TRN,RIGHT(2)
                           STRING(@n3),AT(73,0,135,125),CNT,RESET(break1),USE(vl_no),TRN,RIGHT(1),FONT('Arial',7,,FONT:regular)
                           STRING(@d06B),AT(281,0,510,125),USE(Tanggal),TRN
                           STRING(@n10.2),AT(9229,0,479,125),USE(vl_saldo_akhir_jum),TRN,RIGHT
                           STRING(@n12.2),AT(9729,0,573,125),USE(vl_saldo_akhir_harga),TRN,RIGHT
                           STRING(@n15.2),AT(10323,0,667,125),USE(vl_saldo_akhir_total),TRN,RIGHT(2)
                           LINE,AT(11021,-10,0,135),USE(?Line8:5),COLOR(COLOR:Black)
                           LINE,AT(31,-10,0,135),USE(?Line8:7),COLOR(COLOR:Black)
                           LINE,AT(2979,-10,0,135),USE(?Line8:6),COLOR(COLOR:Black)
                           LINE,AT(9177,-10,0,135),USE(?Line8:4),COLOR(COLOR:Black)
                           LINE,AT(7865,-10,0,135),USE(?Line8:3),COLOR(COLOR:Black)
                           LINE,AT(4813,-10,0,135),USE(?Line8),COLOR(COLOR:Black)
                           STRING(@n10.2B),AT(6656,0,510,125),USE(harga_jual),TRN,RIGHT(14)
                           STRING(@n15.2B),AT(7188,0,667,125),USE(vl_total_jual),TRN,RIGHT(14)
                           STRING(@n10.2B),AT(4844,0,490,125),USE(JumlahOut),TRN,RIGHT(14)
                           STRING(@n12.2B),AT(5313,0,583,125),USE(HargaOut),TRN,RIGHT
                           STRING(@n15.2B),AT(5896,0,729,125),USE(TotalOut),TRN,RIGHT(2)
                           LINE,AT(6646,-10,0,135),USE(?Line8:2),COLOR(COLOR:Black)
                           STRING(@s20B),AT(802,0,781,125),USE(NomorIn),TRN
                           STRING(@n7B),AT(1604,0,406,125),USE(nomormr),TRN,LEFT
                           STRING(@s20),AT(2063,0,875,156),USE(namapasien),TRN
                           STRING(@n10.2B),AT(3000,0,510,125),USE(JumlahIn),TRN,RIGHT(14)
                         END
                         FOOTER,AT(0,0,,302)
                           LINE,AT(21,0,11021,0),USE(?Line6),COLOR(COLOR:Black)
                           STRING(@n10.2),AT(3000,21,510,125),SUM,RESET(break1),USE(JumlahIn,,?JumlahIn:2),TRN,RIGHT(14),FONT('Arial',8,,FONT:regular)
                           STRING(@n10.2),AT(4823,21,510,125),SUM,RESET(break1),USE(JumlahOut,,?JumlahOut:2),TRN,RIGHT(14),FONT('Arial',8,,FONT:regular)
                           STRING('Total :'),AT(2667,21,302,125),USE(?String63),TRN,FONT('Arial',8,,FONT:regular)
                           STRING(@n15.2),AT(5688,21,958,125),SUM,RESET(break1),USE(TotalOut,,?TotalOut:2),TRN,RIGHT(2),FONT('Arial',8,,FONT:regular)
                           STRING(@n15.2),AT(6906,21,958,125),SUM,RESET(break1),USE(vl_total_jual,,?vl_total_jual:2),TRN,RIGHT(14),FONT('Arial',8,,FONT:regular)
                           LINE,AT(2615,208,5281,0),USE(?Line16),COLOR(COLOR:Black)
                         END
                       END
                       FOOTER,AT(104,7708,11385,188)
                         LINE,AT(63,0,11031,0),USE(?LineBawah),HIDE,COLOR(COLOR:Black)
                         STRING('Page xxxxx of xxxxx'),AT(5938,10,1302,208),USE(?PageOfString),FONT('Times New Roman',8,,)
                         STRING('Kartu Stok Instalasi Farmasi'),AT(188,10,1615,208),USE(?String60),TRN,FONT('Arial',8,,FONT:regular+FONT:italic)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Next                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
  GlobalErrors.SetProcedureName('PrintFIFOModelSri')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  WindowTanggal12()
  ProsesKartuFIFOInQue11()
  ProsesKartuFIFOOutQue11()
  ProsesKartuFIFOQue11()
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
  vl_saldo_awal_jum=0
  vl_saldo_awal_harga=0
  vl_saldo_awal_total=0
  display
  Relate:AFIFOOUT.SetOpenRelated()
  Relate:AFIFOOUT.Open                                     ! File JPasien used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql.Open                                      ! File JPasien used by this procedure, so make sure it's RelationManager is open
  Access:GApotik.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GBarang.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  GBAR:Kode_brg=glo_kode_barang
  access:gbarang.fetch(GBAR:KeyKodeBrg)
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintFIFOModelSri',ProgressWindow)         ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisReport.Init(Process:View, Relate:FileSql, ?Progress:PctText, Progress:Thermometer, RECORDS(Glo:QueFifo))
  ThisReport.AddSortOrder()
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
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
    Relate:AFIFOOUT.Close
    Relate:FileSql.Close
  END
  IF SELF.Opened
    INIMgr.Update('PrintFIFOModelSri',ProgressWindow)      ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Next PROCEDURE

ReturnValue          BYTE,AUTO

Progress BYTE,AUTO
  CODE
      ThisReport.RecordsProcessed+=1
      GET(Glo:QueFifo,ThisReport.RecordsProcessed)
      IF ERRORCODE() THEN
         ReturnValue = Level:Notify
      ELSE
         ReturnValue = Level:Benign
      END
      IF ReturnValue = Level:Notify
          IF ThisReport.RecordsProcessed>RECORDS(Glo:QueFifo)
             SELF.Response = RequestCompleted
             POST(Event:CloseWindow)
             RETURN Level:Notify
          ELSE
             SELF.Response = RequestCancelled
             POST(Event:CloseWindow)
             RETURN Level:Fatal
          END
      ELSE
         Progress = ThisReport.RecordsProcessed / ThisReport.RecordsToProcess*100
         IF Progress > 100 THEN Progress = 100.
         IF Progress <> Progress:Thermometer
           Progress:Thermometer = Progress
           DISPLAY()
         END
      END
      RETURN Level:Benign
  ReturnValue = PARENT.Next()
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  vl_total_jual = JumlahOut * harga_jual
  vl_saldo_akhir_jum  =vl_saldo_awal_jum+Glo:QueFifo.JumlahIn-Glo:QueFifo.JumlahOut
  vl_saldo_akhir_total=vl_saldo_awal_total+(Glo:QueFifo.JumlahIn*Glo:QueFifo.HargaIn)-(Glo:QueFifo.JumlahOut*Glo:QueFifo.HargaOut)
  if vl_saldo_akhir_jum=0 then
     vl_saldo_akhir_harga=0
  else
     vl_saldo_akhir_harga=vl_saldo_akhir_total/vl_saldo_akhir_jum
  end
  
  
  display
  ReturnValue = PARENT.TakeRecord()
  settarget(report)
  unhide(?LineBawah)
  settarget
  PRINT(RPT:detail1)
  vl_saldo_awal_jum   =vl_saldo_akhir_jum
  vl_saldo_awal_harga =vl_saldo_akhir_harga
  vl_saldo_awal_total =vl_saldo_akhir_total
  display
  RETURN ReturnValue

