

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('APC6N016.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N015.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N017.INC'),ONCE        !Req'd for module callout resolution
                     END


ProsesKartuFIFOInQue11 PROCEDURE                           ! Generated from procedure template - Process

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
  GlobalErrors.SetProcedureName('ProsesKartuFIFOInQue11')
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
  Relate:AFIFOIN.Open                                      ! File JPasien used by this procedure, so make sure it's RelationManager is open
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APDTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesKartuFIFOInQue11',ProgressWindow)    ! Restore window settings from non-volatile store
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
    INIMgr.Update('ProsesKartuFIFOInQue11',ProgressWindow) ! Save window data to non-volatile store
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
        Glo:QueFifo.TotalIn     =AFI:Harga*(AFI:Jumlah-vl_jumlah)
        Glo:QueFifo.NomorOut    =0
        Glo:QueFifo.JumlahOut   =0
        Glo:QueFifo.HargaOut    =0
        Glo:QueFifo.TotalOut    =0
        Glo:QueFifo.Tanggalout  =0
        Glo:QueFifo.harga_jual  =0
        Glo:QueFifo.jumlahsaldo =vg_kfifo_jumlah+AFI:Jumlah-vl_jumlah
        Glo:QueFifo.hargasaldo  =AFI:Harga
        Glo:QueFifo.totalsaldo  =vg_kfifo_total+AFI:Harga*(AFI:Jumlah-vl_jumlah)
        if sub(AFI2:NoTransKeluar,1,3)='API' or sub(AFI2:NoTransKeluar,1,3)='APJ' then
           APH:N0_tran=clip(AFI2:NoTransKeluar)
           access:aphtrans.fetch(APH:by_transaksi)
           JPas:Nomor_mr=APH:Nomor_mr
           access:jpasien.fetch(JPas:KeyNomorMr)
           Glo:QueFifo.nomormr =JPas:Nomor_mr
           Glo:QueFifo.namapasien =JPas:Nama
        else
           Glo:QueFifo.nomormr =0
           Glo:QueFifo.namapasien =''
        end
  
        add(Glo:QueFifo)
        clear(Glo:QueFifo)
        vg_kfifo_jumlah   +=(AFI:Jumlah-vl_jumlah)
        vg_kfifo_total    +=AFI:Harga*(AFI:Jumlah-vl_jumlah)
     else
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
     Glo:QueFifo.jumlahsaldo =vg_kfifo_jumlah+AFI:Jumlah
     Glo:QueFifo.hargasaldo  =AFI:Harga
     Glo:QueFifo.totalsaldo  =vg_kfifo_total+(AFI:Harga*AFI:Jumlah)
     if sub(clip(AFI:NoTransaksi),1,3)='API' or sub(clip(AFI:NoTransaksi),1,3)='APJ' then
        APH:N0_tran=clip(AFI:NoTransaksi)
        access:aphtrans.fetch(APH:by_transaksi)
        JPas:Nomor_mr=APH:Nomor_mr
        access:jpasien.fetch(JPas:KeyNomorMr)
        Glo:QueFifo.nomormr =JPas:Nomor_mr
        Glo:QueFifo.namapasien =JPas:Nama
     else
        Glo:QueFifo.nomormr =0
        Glo:QueFifo.namapasien =''
     end
     add(Glo:QueFifo)
     clear(Glo:QueFifo)
     vg_kfifo_jumlah   +=AFI:Jumlah
     vg_kfifo_total    +=AFI:Harga*AFI:Jumlah
  end
  
  
  !vg_kfifo_jumlah+=AFI:Jumlah
  !vg_kfifo_total +=AFI:Jumlah*AFI:Harga
  !display
  ReturnValue = PARENT.TakeRecord()
  vl_i+=1
  display
  RETURN ReturnValue

ProsesKartuFIFOOutQue11 PROCEDURE                          ! Generated from procedure template - Process

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
  GlobalErrors.SetProcedureName('ProsesKartuFIFOOutQue11')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  !free(Glo:QueFifo)
  !vg_kfifo_jumlah=0
  !vg_kfifo_total =0
  !display
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
  Relate:AFIFOIN.Open                                      ! File JPasien used by this procedure, so make sure it's RelationManager is open
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APDTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesKartuFIFOOutQue11',ProgressWindow)   ! Restore window settings from non-volatile store
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
    INIMgr.Update('ProsesKartuFIFOOutQue11',ProgressWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  vl_jumlah=0
  afifoout{prop:sql}='select * from dba.afifoout where kode_apotik='''&GL_entryapotik&''' and kode_barang='''&AFI:Kode_Barang&''' and NoTransaksi='''&AFI:NoTransaksi&''' and tanggal<<'''&format(vg_tanggal1,@D10)&''' and transaksi='&AFI:Transaksi&' order by tanggal,jam'
  loop
     if access:afifoout.next()<>level:benign then break.
     vl_jumlah+=AFI2:Jumlah
  end
  vl_ada=0
  vl_ke=1
  afifoout{prop:sql}='select * from dba.afifoout where kode_apotik='''&GL_entryapotik&''' and kode_barang='''&AFI:Kode_Barang&''' and NoTransaksi='''&AFI:NoTransaksi&''' and tanggal>='''&format(vg_tanggal1,@D10)&''' and tanggal<<='''&format(vg_tanggal2,@D10)&''' and transaksi='&AFI:Transaksi&' order by tanggal,jam'
  loop
     if access:afifoout.next()<>level:benign then break.
     vl_ada=1
     if vl_ke=1 then
        vl_sub_total           +=AFI2:Jumlah
  
        Glo:QueFifo.Tanggal     =AFI2:Tanggal
        Glo:QueFifo.NomorIn     =AFI2:NoTransKeluar
        Glo:QueFifo.JumlahIn    =0
        Glo:QueFifo.HargaIn     =0
        Glo:QueFifo.TotalIn     =0
        Glo:QueFifo.NomorOut    =''
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
           JPas:Nomor_mr=APH:Nomor_mr
           access:jpasien.fetch(JPas:KeyNomorMr)
           Glo:QueFifo.nomormr =JPas:Nomor_mr
           Glo:QueFifo.namapasien =JPas:Nama
        else
           Glo:QueFifo.harga_jual=0
           Glo:QueFifo.nomormr =0
           Glo:QueFifo.namapasien =''
        end
        Glo:QueFifo.jumlahsaldo =vg_kfifo_jumlah-AFI2:Jumlah
        Glo:QueFifo.hargasaldo  =AFI:Harga
        Glo:QueFifo.totalsaldo  =vg_kfifo_total-(AFI:Harga*AFI2:Jumlah)
        add(Glo:QueFifo)
        clear(Glo:QueFifo)
        vg_kfifo_jumlah   -=AFI2:Jumlah
        vg_kfifo_total    -=AFI:Harga*AFI2:Jumlah
     else
        vl_sub_total           +=AFI2:Jumlah
        Glo:QueFifo.Tanggal     =AFI2:Tanggal
        Glo:QueFifo.NomorIn     =AFI2:NoTransKeluar
        Glo:QueFifo.JumlahIn    =0
        Glo:QueFifo.HargaIn     =0
        Glo:QueFifo.TotalIn     =0
        Glo:QueFifo.NomorOut    =''
        Glo:QueFifo.JumlahOut   =AFI2:Jumlah
        Glo:QueFifo.HargaOut    =AFI:Harga
        Glo:QueFifo.TotalOut    =AFI:Harga*AFI2:Jumlah
        Glo:QueFifo.Tanggalout  =0
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
        Glo:QueFifo.jumlahsaldo =vg_kfifo_jumlah-AFI2:Jumlah
        Glo:QueFifo.hargasaldo  =AFI:Harga
        Glo:QueFifo.totalsaldo  =vg_kfifo_total-(AFI:Harga*AFI2:Jumlah)
        add(Glo:QueFifo)
        clear(Glo:QueFifo)
        vg_kfifo_jumlah   -=AFI2:Jumlah
        vg_kfifo_total    -=AFI:Harga*AFI2:Jumlah
     end
     vl_ke+=1
  end
  !if vl_ada=0 and AFI:Jumlah_Keluar=0 then
  !   vl_sub_total           +=AFI2:Jumlah
  !   Glo:QueFifo.Tanggal     =AFI:Tanggal
  !   Glo:QueFifo.NomorIn     ='SA ='&clip(AFI:NoTransaksi)
  !   Glo:QueFifo.JumlahIn    =AFI:Jumlah
  !   Glo:QueFifo.HargaIn     =AFI:Harga
  !   Glo:QueFifo.TotalIn     =AFI:Harga*AFI:Jumlah
  !   Glo:QueFifo.NomorOut    =''
  !   Glo:QueFifo.JumlahOut   =0
  !   Glo:QueFifo.HargaOut    =0
  !   Glo:QueFifo.TotalOut    =0
  !   Glo:QueFifo.Tanggalout  =0
  !   Glo:QueFifo.harga_jual  =0
  !   Glo:QueFifo.jumlahsaldo =vg_kfifo_jumlah+AFI:Jumlah
  !   Glo:QueFifo.hargasaldo  =AFI:Harga
  !   Glo:QueFifo.totalsaldo  =vg_kfifo_total+(AFI:Harga*AFI:Jumlah)
  !   add(Glo:QueFifo)
  !   clear(Glo:QueFifo)
  !   vg_kfifo_jumlah   +=AFI:Jumlah
  !   vg_kfifo_total    +=AFI:Harga*AFI:Jumlah
  !end
  
  
  !vg_kfifo_jumlah+=AFI:Jumlah
  !vg_kfifo_total +=AFI:Jumlah*AFI:Harga
  !display
  ReturnValue = PARENT.TakeRecord()
  vl_i+=1
  display
  RETURN ReturnValue

ProsesKartuFIFOQue11 PROCEDURE                             ! Generated from procedure template - Process

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
  GlobalErrors.SetProcedureName('ProsesKartuFIFOQue11')
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
  Relate:AFIFOIN.Open                                      ! File JPasien used by this procedure, so make sure it's RelationManager is open
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APDTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesKartuFIFOQue11',ProgressWindow)      ! Restore window settings from non-volatile store
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
    INIMgr.Update('ProsesKartuFIFOQue11',ProgressWindow)   ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  vl_ada=0
  vl_ke=1
  afifoout{prop:sql}='select * from dba.afifoout where kode_apotik='''&GL_entryapotik&''' and kode_barang='''&AFI:Kode_Barang&''' and NoTransaksi='''&AFI:NoTransaksi&''' and transaksi='&AFI:Transaksi&' and tanggal>='''&format(vg_tanggal1,@D10)&''' and tanggal<<='''&format(vg_tanggal2,@D10)&''' order by tanggal,jam'
  afifoout{prop:sql}='select * from dba.afifoout where kode_apotik='''&GL_entryapotik&''' and kode_barang='''&AFI:Kode_Barang&''' and NoTransaksi='''&AFI:NoTransaksi&''' and transaksi='&AFI:Transaksi&' and tanggal>='''&format(vg_tanggal1,@D10)&''' and tanggal<<='''&format(vg_tanggal2,@D10)&''' order by tanggal,jam'
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
        Glo:QueFifo.NomorOut    =''
        Glo:QueFifo.JumlahOut   =0
        Glo:QueFifo.HargaOut    =0
        Glo:QueFifo.TotalOut    =0
        Glo:QueFifo.Tanggalout  =0
        Glo:QueFifo.harga_jual  =0
        Glo:QueFifo.jumlahsaldo =vg_kfifo_jumlah+AFI:Jumlah
        Glo:QueFifo.hargasaldo  =AFI:Harga
        Glo:QueFifo.totalsaldo  =vg_kfifo_total+(AFI:Harga*AFI:Jumlah)
        add(Glo:QueFifo)
        clear(Glo:QueFifo)
        vg_kfifo_jumlah   +=AFI:Jumlah
        vg_kfifo_total    +=AFI:Harga*AFI:Jumlah
  
        Glo:QueFifo.Tanggal     =AFI2:Tanggal
        Glo:QueFifo.NomorIn     =AFI2:NoTransKeluar
        Glo:QueFifo.JumlahIn    =0
        Glo:QueFifo.HargaIn     =0
        Glo:QueFifo.TotalIn     =0
        Glo:QueFifo.NomorOut    =''
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
           JPas:Nomor_mr=APH:Nomor_mr
           access:jpasien.fetch(JPas:KeyNomorMr)
           Glo:QueFifo.nomormr =JPas:Nomor_mr
             Glo:QueFifo.namapasien =JPas:Nama
        else
           Glo:QueFifo.harga_jual=0
           Glo:QueFifo.nomormr =0
             Glo:QueFifo.namapasien =''
        end
        Glo:QueFifo.jumlahsaldo =vg_kfifo_jumlah-AFI2:Jumlah
        Glo:QueFifo.hargasaldo  =AFI:Harga
        Glo:QueFifo.totalsaldo  =vg_kfifo_total+(AFI:Harga*AFI2:Jumlah)
        add(Glo:QueFifo)
        clear(Glo:QueFifo)
        vg_kfifo_jumlah   -=AFI2:Jumlah
        vg_kfifo_total    -=AFI:Harga*AFI2:Jumlah
     else
        vl_sub_total           +=AFI2:Jumlah
        Glo:QueFifo.Tanggal     =AFI2:Tanggal
        Glo:QueFifo.NomorIn     =AFI2:NoTransKeluar
        Glo:QueFifo.JumlahIn    =0
        Glo:QueFifo.HargaIn     =0
        Glo:QueFifo.TotalIn     =0
        Glo:QueFifo.NomorOut    =''
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
           JPas:Nomor_mr=APH:Nomor_mr
           access:jpasien.fetch(JPas:KeyNomorMr)
           Glo:QueFifo.nomormr =JPas:Nomor_mr
           Glo:QueFifo.namapasien =JPas:Nama
        else
           Glo:QueFifo.harga_jual=0
           Glo:QueFifo.nomormr =0
           Glo:QueFifo.namapasien =''
        end
        Glo:QueFifo.jumlahsaldo =vg_kfifo_jumlah-AFI2:Jumlah
        Glo:QueFifo.hargasaldo  =AFI:Harga
        Glo:QueFifo.totalsaldo  =vg_kfifo_total+(AFI:Harga*AFI2:Jumlah)
        add(Glo:QueFifo)
        clear(Glo:QueFifo)
        vg_kfifo_jumlah   -=AFI2:Jumlah
        vg_kfifo_total    -=AFI:Harga*AFI2:Jumlah
     end
     vl_ke+=1
  end
  if vl_ada=0 then
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
     Glo:QueFifo.jumlahsaldo =vg_kfifo_jumlah+AFI:Jumlah
     Glo:QueFifo.hargasaldo  =AFI:Harga
     Glo:QueFifo.totalsaldo  =vg_kfifo_total+(AFI:Harga*AFI:Jumlah)
     add(Glo:QueFifo)
     clear(Glo:QueFifo)
     vg_kfifo_jumlah   +=AFI:Jumlah
     vg_kfifo_total    +=AFI:Harga*AFI:Jumlah
  end
  ReturnValue = PARENT.TakeRecord()
  vl_i+=1
  display
  RETURN ReturnValue

PrintKArtuFifoQue1 PROCEDURE                               ! Generated from procedure template - Report

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
vl_total_jual        REAL                                  !
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
                         STRING('Saldo Awal/Pemasukan'),AT(1292,1052,1365,167),USE(?String10:4),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Pengeluaran'),AT(4792,1052,802,167),USE(?String10:12),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Saldo Akhir'),AT(9854,1052,802,167),USE(?String10:9),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Penyesuaian Harga'),AT(7948,1052,1135,167),USE(?String10:11),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Penjualan'),AT(6917,1052,635,167),USE(?String10:23),TRN,FONT('Arial',8,,FONT:regular)
                         LINE,AT(3313,1031,0,448),USE(?Line5:4),COLOR(COLOR:Black)
                         LINE,AT(9167,1031,0,448),USE(?Line5:3),COLOR(COLOR:Black)
                         LINE,AT(6531,1031,0,448),USE(?Line5:2),COLOR(COLOR:Black)
                         LINE,AT(7854,1031,0,448),USE(?Line5:5),COLOR(COLOR:Black)
                         STRING('Nomor'),AT(792,1281,521,167),USE(?String10:5),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('No.'),AT(73,1146,260,167),USE(?String10:2),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Tanggal'),AT(281,1146,448,167),USE(?String10:3),TRN,FONT('Arial',8,,FONT:regular)
                         LINE,AT(760,1260,10256,0),COLOR(COLOR:Black)
                         STRING('Jumlah'),AT(1646,1281,438,167),USE(?String10:7),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Harga'),AT(2260,1281,344,167),USE(?String10:6),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Total'),AT(3010,1281,281,167),USE(?String10:8),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Tanggal'),AT(3427,1281,417,167),USE(?String10:14),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Jumlah'),AT(4750,1281,438,167),USE(?String10:15),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Harga'),AT(5344,1281,438,167),USE(?String10:10),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Total'),AT(6042,1281,438,167),USE(?String10:13),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Jumlah'),AT(9229,1292,438,167),USE(?String10:18),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Harga'),AT(9854,1292,438,167),USE(?String10:19),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Total'),AT(10510,1292,438,167),USE(?String10:17),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Harga'),AT(7979,1281,438,167),USE(?String10:21),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Total'),AT(8667,1281,438,167),USE(?String10:20),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Total'),AT(7385,1281,438,167),USE(?String10:25),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Harga'),AT(6698,1281,438,167),USE(?String10:24),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Nomor'),AT(3906,1281,521,167),USE(?String10:16),TRN,FONT('Arial',8,,FONT:regular)
                         LINE,AT(760,1031,0,458),USE(?Line5),COLOR(COLOR:Black)
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
                           STRING(@n12.2B),AT(2010,0,573,125),USE(HargaIn),TRN,RIGHT
                           STRING(@n15.2B),AT(2594,0,708,125),USE(TotalIn),TRN,RIGHT(2)
                           STRING(@n3),AT(73,0,135,125),CNT,RESET(break1),USE(vl_no),TRN,RIGHT(1),FONT('Arial',7,,FONT:regular)
                           STRING(@d06B),AT(240,0,510,125),USE(Tanggal),TRN
                           STRING(@n10.2),AT(9229,0,479,125),USE(vl_saldo_akhir_jum),TRN,RIGHT
                           STRING(@n12.2),AT(9729,0,573,125),USE(vl_saldo_akhir_harga),TRN,RIGHT
                           STRING(@n15.2),AT(10323,0,667,125),USE(vl_saldo_akhir_total),TRN,RIGHT(2)
                           LINE,AT(11021,-10,0,135),USE(?Line8:5),COLOR(COLOR:Black)
                           LINE,AT(31,-10,0,135),USE(?Line8:7),COLOR(COLOR:Black)
                           LINE,AT(771,-10,0,135),USE(?Line8:6),COLOR(COLOR:Black)
                           LINE,AT(9177,-10,0,135),USE(?Line8:4),COLOR(COLOR:Black)
                           LINE,AT(7865,-10,0,135),USE(?Line8:3),COLOR(COLOR:Black)
                           LINE,AT(3323,-10,0,135),USE(?Line8),COLOR(COLOR:Black)
                           STRING(@n10.2B),AT(6615,0,552,125),USE(harga_jual),TRN,RIGHT(14)
                           STRING(@n15.2B),AT(7188,0,667,125),USE(vl_total_jual),TRN,RIGHT(14)
                           STRING(@d06B),AT(3365,0,521,125),USE(Tanggalout),TRN
                           STRING(@s20B),AT(3906,0,802,125),USE(NomorOut),TRN
                           STRING(@n10.2B),AT(4698,0,510,125),USE(JumlahOut),TRN,RIGHT(14)
                           STRING(@n12.2B),AT(5208,0,583,125),USE(HargaOut),TRN,RIGHT
                           STRING(@n15.2B),AT(5792,0,729,125),USE(TotalOut),TRN,RIGHT(2)
                           LINE,AT(6542,-10,0,135),USE(?Line8:2),COLOR(COLOR:Black)
                           STRING(@s20B),AT(813,0,708,125),USE(NomorIn),TRN
                           STRING(@n10.2B),AT(1510,0,510,125),USE(JumlahIn),TRN,RIGHT(14)
                         END
                         FOOTER,AT(0,0,,302)
                           LINE,AT(21,0,11021,0),USE(?Line6),COLOR(COLOR:Black)
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
  GlobalErrors.SetProcedureName('PrintKArtuFifoQue1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  WindowTanggal12()
  ProsesKartuFIFOInQue()
  ProsesKartuFifoOutQue()
  ProsesKartuFIFOQue()
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
  Relate:AFIFOOUT.Open                                     ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql.Open                                      ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Access:GApotik.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GBarang.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  GBAR:Kode_brg=glo_kode_barang
  access:gbarang.fetch(GBAR:KeyKodeBrg)
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintKArtuFifoQue1',ProgressWindow)        ! Restore window settings from non-volatile store
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
    INIMgr.Update('PrintKArtuFifoQue1',ProgressWindow)     ! Save window data to non-volatile store
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

ProsesKartuFIFOInQue PROCEDURE                             ! Generated from procedure template - Process

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
  GlobalErrors.SetProcedureName('ProsesKartuFIFOInQue')
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
  INIMgr.Fetch('ProsesKartuFIFOInQue',ProgressWindow)      ! Restore window settings from non-volatile store
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
    INIMgr.Update('ProsesKartuFIFOInQue',ProgressWindow)   ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  vg_kfifo_jumlah+=AFI:Jumlah
  vg_kfifo_total +=AFI:Jumlah*AFI:Harga
  display
  ReturnValue = PARENT.TakeRecord()
  vl_i+=1
  display
  RETURN ReturnValue

