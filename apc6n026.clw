

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('APC6N026.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N018.INC'),ONCE        !Req'd for module callout resolution
                     END


ProsesFIFOINRJual1 PROCEDURE                               ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
Process:View         VIEW(APDTRANS)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:N0_tran)
                       JOIN(APH:by_transaksi,APD:N0_tran)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
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
  GlobalErrors.SetProcedureName('ProsesFIFOINRJual1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  WindowTanggal12Apotik()
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('vg_tanggal1',vg_tanggal1)                          ! Added by: Process
  BIND('vg_tanggal2',vg_tanggal2)                          ! Added by: Process
  BIND('glo:apotik',glo:apotik)                            ! Added by: Process
  BIND('glo_kode_barang',glo_kode_barang)                  ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesFIFOINRJual1',ProgressWindow)        ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:APDTRANS, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ThisProcess.SetFilter('aph:Tanggal>=vg_tanggal1 and aph:Tanggal<<=vg_tanggal2 and aph:kode_apotik=glo:apotik and aph:biaya<<=0')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(APDTRANS,'QUICKSCAN=on')
  SEND(APHTRANS,'QUICKSCAN=on')
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
    INIMgr.Update('ProsesFIFOINRJual1',ProgressWindow)     ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  APH:N0_tran = APD:N0_tran                                ! Assign linking field value
  Access:APHTRANS.Fetch(APH:by_transaksi)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APH:N0_tran = APD:N0_tran                                ! Assign linking field value
  Access:APHTRANS.Fetch(APH:by_transaksi)


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  GSTO:Kode_Apotik    =APH:Kode_Apotik
  GSTO:Kode_Barang    =APD:Kode_brg
  access:gstokaptk.fetch(GSTO:KeyBarang)
  AFI:Kode_Barang     =APD:Kode_brg
  AFI:Mata_Uang       ='Rp'
  AFI:NoTransaksi     =APD:N0_tran
  AFI:Transaksi       =1
  AFI:Tanggal         =APH:Tanggal
  AFI:Harga           =round(GSTO:Harga_Dasar*1.1,.01)
  AFI:Jumlah          =APD:Jumlah
  AFI:Jumlah_Keluar   =0
  AFI:Tgl_Update      =APH:Tanggal
  AFI:Jam_Update      =clock()
  AFI:Operator        ='ADI'
  AFI:Jam             =clock()
  AFI:Kode_Apotik     =APH:Kode_Apotik
  AFI:Status          =0
  access:afifoin.insert()
  RETURN ReturnValue

ProsesFIFOINKeInstalasi1 PROCEDURE                         ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
Process:View         VIEW(AptoInDe)
                       PROJECT(APTD:Biaya)
                       PROJECT(APTD:Jumlah)
                       PROJECT(APTD:N0_tran)
                       JOIN(APTI:key_no_tran,APTD:N0_tran)
                         PROJECT(APTI:Kode_Apotik)
                         PROJECT(APTI:Tanggal)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
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
  GlobalErrors.SetProcedureName('ProsesFIFOINKeInstalasi1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  WindowTanggal12Apotik()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('vg_tanggal1',vg_tanggal1)                          ! Added by: Process
  BIND('vg_tanggal2',vg_tanggal2)                          ! Added by: Process
  BIND('glo:apotik',glo:apotik)                            ! Added by: Process
  BIND('glo_kode_barang',glo_kode_barang)                  ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesFIFOINKeInstalasi1',ProgressWindow)  ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:AptoInDe, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ThisProcess.SetFilter('apti:Tanggal>=vg_tanggal1 and apti:Tanggal<<=vg_tanggal2 and apti:kode_apotik=glo:apotik and apti:total_biaya<<0')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(AptoInDe,'QUICKSCAN=on')
  SEND(AptoInHe,'QUICKSCAN=on')
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
    INIMgr.Update('ProsesFIFOINKeInstalasi1',ProgressWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  APTI:N0_tran = APTD:N0_tran                              ! Assign linking field value
  Access:AptoInHe.Fetch(APTI:key_no_tran)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APTI:N0_tran = APTD:N0_tran                              ! Assign linking field value
  Access:AptoInHe.Fetch(APTI:key_no_tran)


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  GSTO:Kode_Apotik    =APTI:Kode_Apotik
  GSTO:Kode_Barang    =APTD:Kode_Brg
  access:gstokaptk.fetch(GSTO:KeyBarang)
  AFI:Kode_Barang     =APTD:Kode_Brg
  AFI:Mata_Uang       ='Rp'
  AFI:NoTransaksi     =APTD:N0_tran
  AFI:Transaksi       =1
  AFI:Tanggal         =APTI:Tanggal
  AFI:Harga           =round(GSTO:Harga_Dasar*1.1,.01)
  AFI:Jumlah          =APTD:Jumlah
  AFI:Jumlah_Keluar   =0
  AFI:Tgl_Update      =APTI:Tanggal
  AFI:Jam_Update      =clock()
  AFI:Operator        ='ADI'
  AFI:Jam             =clock()
  AFI:Kode_Apotik     =APTI:Kode_Apotik
  AFI:Status          =0
  access:afifoin.insert()
  RETURN ReturnValue

ProsesProduksiPlus1 PROCEDURE                              ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
Process:View         VIEW(ApDProd)
                       PROJECT(APDP:Biaya)
                       PROJECT(APDP:Jumlah)
                       PROJECT(APDP:N0_tran)
                       JOIN(APHP:key_no_tran,APDP:N0_tran)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
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
  GlobalErrors.SetProcedureName('ProsesProduksiPlus1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  WindowTanggal12Apotik()
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('vg_tanggal1',vg_tanggal1)                          ! Added by: Process
  BIND('vg_tanggal2',vg_tanggal2)                          ! Added by: Process
  BIND('glo:apotik',glo:apotik)                            ! Added by: Process
  BIND('glo_kode_barang',glo_kode_barang)                  ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesProduksiPlus1',ProgressWindow)       ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:ApDProd, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ThisProcess.SetFilter('aphp:Tanggal>=vg_tanggal1 and aphp:Tanggal<<=vg_tanggal2 and aphp:kode_apotik=glo:apotik')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(ApDProd,'QUICKSCAN=on')
  SEND(ApHProd,'QUICKSCAN=on')
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
    INIMgr.Update('ProsesProduksiPlus1',ProgressWindow)    ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  APHP:N0_tran = APDP:N0_tran                              ! Assign linking field value
  Access:ApHProd.Fetch(APHP:key_no_tran)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APHP:N0_tran = APDP:N0_tran                              ! Assign linking field value
  Access:ApHProd.Fetch(APHP:key_no_tran)


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  GSTO:Kode_Apotik    =APHP:Kode_Apotik
  GSTO:Kode_Barang    =APDP:Kode_Brg
  access:gstokaptk.fetch(GSTO:KeyBarang)
  AFI:Kode_Barang     =APDP:Kode_Brg
  AFI:Mata_Uang       ='Rp'
  AFI:NoTransaksi     =APDP:N0_tran
  AFI:Transaksi       =1
  AFI:Tanggal         =APHP:Tanggal
  AFI:Harga           =round(GSTO:Harga_Dasar*1.1,.01)
  AFI:Jumlah          =APDP:Jumlah
  AFI:Jumlah_Keluar   =0
  AFI:Tgl_Update      =APHP:Tanggal
  AFI:Jam_Update      =clock()
  AFI:Operator        ='ADI'
  AFI:Jam             =clock()
  AFI:Kode_Apotik     =APHP:Kode_Apotik
  AFI:Status          =0
  access:afifoin.insert()
  RETURN ReturnValue

ProsesKoreksiPlus1 PROCEDURE                               ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
Process:View         VIEW(AAdjust)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
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
  GlobalErrors.SetProcedureName('ProsesKoreksiPlus1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  WindowTanggal12Apotik()
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('vg_tanggal1',vg_tanggal1)                          ! Added by: Process
  BIND('vg_tanggal2',vg_tanggal2)                          ! Added by: Process
  BIND('glo:apotik',glo:apotik)                            ! Added by: Process
  BIND('glo_kode_barang',glo_kode_barang)                  ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AAdjust.Open                                      ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesKoreksiPlus1',ProgressWindow)        ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:AAdjust, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ThisProcess.SetFilter('aad:Tanggal>=vg_tanggal1 and aad:Tanggal<<=vg_tanggal2 and aad:kode_apotik=glo:apotik and aad:status=1')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(AAdjust,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAdjust.Close
    Relate:AFIFOIN.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesKoreksiPlus1',ProgressWindow)     ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GSTO:Kode_Apotik    =AAD:Kode_Apotik
  GSTO:Kode_Barang    =AAD:Kode_Barang
  access:gstokaptk.fetch(GSTO:KeyBarang)
  AFI:Kode_Barang     =AAD:Kode_Barang
  AFI:Mata_Uang       ='Rp'
  AFI:NoTransaksi     =AAD:Nomor
  AFI:Transaksi       =1
  AFI:Tanggal         =AAD:Tanggal
  AFI:Harga           =round(GSTO:Harga_Dasar*1.1,.01)
  AFI:Jumlah          =AAD:Jumlah
  AFI:Jumlah_Keluar   =0
  AFI:Tgl_Update      =AAD:Tanggal
  AFI:Jam_Update      =clock()
  AFI:Operator        ='ADI'
  AFI:Jam             =clock()
  AFI:Kode_Apotik     =AAD:Kode_Apotik
  AFI:Status          =0
  access:afifoin.insert()
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue

ProsesDariApotikLain1 PROCEDURE                            ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
Process:View         VIEW(APtoAPde)
                       PROJECT(APTO:Biaya)
                       PROJECT(APTO:Jumlah)
                       PROJECT(APTO:N0_tran)
                       JOIN(APTH:key_notran,APTO:N0_tran)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
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
  GlobalErrors.SetProcedureName('ProsesDariApotikLain1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  WindowTanggal12Apotik()
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('vg_tanggal1',vg_tanggal1)                          ! Added by: Process
  BIND('vg_tanggal2',vg_tanggal2)                          ! Added by: Process
  BIND('glo:apotik',glo:apotik)                            ! Added by: Process
  BIND('glo_kode_barang',glo_kode_barang)                  ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesDariApotikLain1',ProgressWindow)     ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:APtoAPde, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ThisProcess.SetFilter('apth:Tanggal>=vg_tanggal1 and apth:Tanggal<<=vg_tanggal2 and apth:apotikkeluar=glo:apotik')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(APtoAPde,'QUICKSCAN=on')
  SEND(AptoApHe,'QUICKSCAN=on')
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
    INIMgr.Update('ProsesDariApotikLain1',ProgressWindow)  ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  APTH:N0_tran = APTO:N0_tran                              ! Assign linking field value
  Access:AptoApHe.Fetch(APTH:key_notran)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APTH:N0_tran = APTO:N0_tran                              ! Assign linking field value
  Access:AptoApHe.Fetch(APTH:key_notran)


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  GSTO:Kode_Apotik    =apth:apotikkeluar
  GSTO:Kode_Barang    =APTO:Kode_Brg
  access:gstokaptk.fetch(GSTO:KeyBarang)
  AFI:Kode_Barang     =APTO:Kode_Brg
  AFI:Mata_Uang       ='Rp'
  AFI:NoTransaksi     =APTO:N0_tran
  AFI:Transaksi       =1
  AFI:Tanggal         =APTH:Tanggal
  AFI:Harga           =round(GSTO:Harga_Dasar*1.1,.01)
  AFI:Jumlah          =APTO:Jumlah
  AFI:Jumlah_Keluar   =0
  AFI:Tgl_Update      =APTH:Tanggal
  AFI:Jam_Update      =clock()
  AFI:Operator        ='ADI'
  AFI:Jam             =clock()
  AFI:Kode_Apotik     =APTH:ApotikKeluar
  AFI:Status          =0
  access:afifoin.insert()
  RETURN ReturnValue

