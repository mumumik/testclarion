

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('APC6N038.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N037.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N131.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N132.INC'),ONCE        !Req'd for module callout resolution
                     END


ProsesLapKoreksiPerApotikMinus PROCEDURE                   ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
vl_jum               REAL                                  !
vl_total             REAL                                  !
vl_count             LONG                                  !
Process:View         VIEW(GStokAptk)
                       PROJECT(GSTO:Kode_Barang)
                       JOIN(GBAR:KeyKodeBrg,GSTO:Kode_Barang)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:No_Satuan)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,81),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                       PROMPT('Jumlah :'),AT(29,62),USE(?vl_count:Prompt)
                       ENTRY(@n-14),AT(58,62,60,10),USE(vl_count),RIGHT(1)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Reset                  PROCEDURE(BYTE Force=0),DERIVED     ! Method added to host embed code
Update                 PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ProgressMgr          StepClass                             ! Progress Manager
view::filesql view(filesql)
                project(FIL:FReal1,FIL:FReal2)
              end

!que:print queue(que:p)

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
  GlobalErrors.SetProcedureName('ProsesLapKoreksiPerApotikMinus')
  WindowBulanTahunPenjualan()
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Glo::kode_apotik',Glo::kode_apotik)                ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AAdjust.Open                                      ! File AFIFOOUT used by this procedure, so make sure it's RelationManager is open
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File AFIFOOUT used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql.Open                                      ! File AFIFOOUT used by this procedure, so make sure it's RelationManager is open
  Access:APDTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  free(Que:P)
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesLapKoreksiPerApotikMinus',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:GStokAptk, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ThisProcess.SetFilter('GSTO:Kode_Apotik=Glo::kode_apotik')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(GStokAptk,'QUICKSCAN=on')
  SEND(GBarang,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  PrintLapKoreksiPerApotikMinus()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAdjust.Close
    Relate:AFIFOIN.Close
    Relate:FileSql.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesLapKoreksiPerApotikMinus',ProgressWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = GSTO:Kode_Barang                         ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  GBAR:Kode_brg = GSTO:Kode_Barang                         ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  vl_jum   =0
  vl_total =0
  
  open(view::filesql)
  view::filesql{prop:sql}='select jumlah,harga from dba.afifoout where kode_barang='''&GSTO:Kode_Barang&''' and substr(notranskeluar,1,3)=''APK'' and year(tanggal)='&glo:tahun&' and month(tanggal)='&glo:bulan&' and kode_apotik='''&GSTO:Kode_Apotik&''''
  loop
     next(view::filesql)
     if errorcode() then break.
     AFI:Kode_Barang  =GSTO:Kode_Barang
     AFI:Mata_Uang    ='Rp'
     AFI:NoTransaksi  =AFI2:NoTransaksi
     AFI:Transaksi    =1
     AFI:Kode_Apotik  =GSTO:Kode_Apotik
     access:afifoin.fetch(AFI:KEY1)
     vl_jum  +=FIL:FReal1
     vl_total+=FIL:FReal1*AFI:Harga
  end
  if vl_jum<>0 then
     Que:P.qp:kode_barang =GSTO:Kode_Barang
     Que:P.qp:nama_barang =GBAR:Nama_Brg
     Que:P.qp:jumlah      =vl_jum
     Que:P.qp:harga       =vl_total
     Que:P.qp:sat         =GBAR:No_Satuan
     add(Que:P)
     clear(Que:P)
  end
  close(view::filesql)
  vl_count+=1
  display
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue

ProsesLapPenjualanBarang PROCEDURE                         ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
vl_hna               REAL                                  !
Progress:Thermometer BYTE                                  !
vl_jum               REAL                                  !
vl_total             REAL                                  !
vl_count             LONG                                  !
Process:View         VIEW(GStokAptk)
                       PROJECT(GSTO:Kode_Barang)
                       JOIN(GBAR:KeyKodeBrg,GSTO:Kode_Barang)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:No_Satuan)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,81),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                       PROMPT('Jumlah :'),AT(29,62),USE(?vl_count:Prompt)
                       ENTRY(@n-14),AT(58,62,60,10),USE(vl_count),RIGHT(1)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Reset                  PROCEDURE(BYTE Force=0),DERIVED     ! Method added to host embed code
Update                 PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ProgressMgr          StepClass                             ! Progress Manager
view::filesql view(filesql)
                project(FIL:FLong1,FIL:FReal1,FIL:FReal2)
              end

!que:print queue(que:p)

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
  GlobalErrors.SetProcedureName('ProsesLapPenjualanBarang')
  WindowBulanTahunPenjualan()
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Glo::kode_apotik',Glo::kode_apotik)                ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:APDTRANS.Open                                     ! File FileSql used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql.Open                                      ! File FileSql used by this procedure, so make sure it's RelationManager is open
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  free(Que:P)
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesLapPenjualanBarang',ProgressWindow)  ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:GStokAptk, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ThisProcess.SetFilter('GSTO:Kode_Apotik=Glo::kode_apotik')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(GStokAptk,'QUICKSCAN=on')
  SEND(GBarang,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  printpenjualanperapotik
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:FileSql.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesLapPenjualanBarang',ProgressWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = GSTO:Kode_Barang                         ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  GBAR:Kode_brg = GSTO:Kode_Barang                         ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  vl_jum   =0
  vl_total =0
  
  open(view::filesql)
  view::filesql{prop:sql}='select sum(Jumlah),sum(total),sum(diskon) from dba.apdtrans where kode_brg='''&GSTO:Kode_Barang&''' and n0_tran in (select n0_tran from dba.aphtrans where year(tanggal)='&glo:tahun&' and month(tanggal)='&glo:bulan&' and kode_apotik='''&GSTO:Kode_Apotik&''' and biaya>0)'
  next(view::filesql)
  if not(errorcode()) then
     Que:P.qp:kode_barang =GSTO:Kode_Barang
     Que:P.qp:nama_barang =GBAR:Nama_Brg
     Que:P.qp:jumlah      =FIL:FLong1
     Que:P.qp:harga       =FIL:FReal1-FIL:FReal2
     Que:P.qp:sat         =GBAR:No_Satuan
     add(Que:P)
     clear(Que:P)
  end
  close(view::filesql)
  vl_count+=1
  display
  
  RETURN ReturnValue

