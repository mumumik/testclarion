

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N029.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N018.INC'),ONCE        !Req'd for module callout resolution
                     END


ProsesKeApotikLain1 PROCEDURE                              ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
Process:View         VIEW(APtoAPde)
                       PROJECT(APTO:Biaya)
                       PROJECT(APTO:Jumlah)
                       PROJECT(APTO:N0_tran)
                       JOIN(APTH:key_notran,APTO:N0_tran)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
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
  GlobalErrors.SetProcedureName('ProsesKeApotikLain1')
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
  Relate:AFIFOOUTTemp.Open                                 ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesKeApotikLain1',ProgressWindow)       ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:APtoAPde, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ThisProcess.SetFilter('apth:Tanggal>=vg_tanggal1 and apth:Tanggal<<=vg_tanggal2 and apth:kode_apotik=glo:apotik')
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
    Relate:AFIFOOUTTemp.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesKeApotikLain1',ProgressWindow)    ! Save window data to non-volatile store
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
  GSTO:Kode_Apotik    =APTH:Kode_Apotik
  GSTO:Kode_Barang    =APTO:Kode_Brg
  access:gstokaptk.fetch(GSTO:KeyBarang)
  AFI21:Kode_Barang     =APTO:Kode_Brg
  AFI21:Mata_Uang       ='Rp'
  AFI21:NoTransaksi     =APTO:N0_tran
  AFI21:Transaksi       =1
  AFI21:NoTransKeluar   =APTO:N0_tran
  AFI21:Tanggal         =APTH:Tanggal
  AFI21:Harga           =round(GSTO:Harga_Dasar*1.1,.01)
  AFI21:Jumlah          =APTO:Jumlah
  AFI21:Tgl_Update      =APTH:Tanggal
  AFI21:Jam_Update      =clock()
  AFI21:Operator        ='ADI'
  AFI21:Jam             =clock()
  AFI21:Kode_Apotik     =APTH:Kode_Apotik
  access:afifoouttemp.insert()
  RETURN ReturnValue

ProsesKeSumedang1 PROCEDURE                                ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
Process:View         VIEW(AptoInSmdD)
                       PROJECT(APTD1:Biaya)
                       PROJECT(APTD1:Harga)
                       PROJECT(APTD1:Jumlah)
                       PROJECT(APTD1:N0_tran)
                       JOIN(APTI1:key_no_tran,APTD1:N0_tran)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
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
  GlobalErrors.SetProcedureName('ProsesKeSumedang1')
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
  Relate:AFIFOIN.Open                                      ! File AFIFOOUTTemp used by this procedure, so make sure it's RelationManager is open
  Relate:AFIFOOUTTemp.Open                                 ! File AFIFOOUTTemp used by this procedure, so make sure it's RelationManager is open
  Relate:AptoInSmdD.SetOpenRelated()
  Relate:AptoInSmdD.Open                                   ! File AFIFOOUTTemp used by this procedure, so make sure it's RelationManager is open
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesKeSumedang1',ProgressWindow)         ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:AptoInSmdD, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ThisProcess.SetFilter('apti1:Tanggal>=vg_tanggal1 and apti1:Tanggal<<=vg_tanggal2 and apti1:kode_apotik=glo:apotik and apti1:total_biaya>=0')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(AptoInSmdD,'QUICKSCAN=on')
  SEND(AptoInSmdH,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AFIFOIN.Close
    Relate:AFIFOOUTTemp.Close
    Relate:AptoInSmdD.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesKeSumedang1',ProgressWindow)      ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  APTI1:N0_tran = APTD1:N0_tran                            ! Assign linking field value
  Access:AptoInSmdH.Fetch(APTI1:key_no_tran)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APTI1:N0_tran = APTD1:N0_tran                            ! Assign linking field value
  Access:AptoInSmdH.Fetch(APTI1:key_no_tran)


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  AFI21:Kode_Barang     =APTD1:Kode_Brg
  AFI21:Mata_Uang       ='Rp'
  AFI21:NoTransaksi     =APTI1:N0_tran
  AFI21:Transaksi       =1
  AFI21:NoTransKeluar   =APTI1:N0_tran
  AFI21:Tanggal         =APTI1:Tanggal
  AFI21:Harga           =round(APTD1:Harga*1.1,.01)
  AFI21:Jumlah          =APTD1:Jumlah
  AFI21:Tgl_Update      =APTI1:Tanggal
  AFI21:Jam_Update      =APTI1:Jam
  AFI21:Operator        ='ADI'
  AFI21:Jam             =APTI1:Jam
  AFI21:Kode_Apotik     =APTI1:Kode_Apotik
  access:afifoouttemp.insert()
  RETURN ReturnValue

ProsesDrOutTempKeFIFOUT1 PROCEDURE                         ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
vl_jumlah            REAL                                  !
Progress:Thermometer BYTE                                  !
Process:View         VIEW(AFIFOOUTTemp)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
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
  GlobalErrors.SetProcedureName('ProsesDrOutTempKeFIFOUT1')
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
  Relate:AFIFOIN.Open                                      ! File AFIFOOUT used by this procedure, so make sure it's RelationManager is open
  Relate:AFIFOOUTTemp.Open                                 ! File AFIFOOUT used by this procedure, so make sure it's RelationManager is open
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesDrOutTempKeFIFOUT1',ProgressWindow)  ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisProcess.Init(Process:View, Relate:AFIFOOUTTemp, ?Progress:PctText, Progress:Thermometer, ProgressMgr, AFI21:Kode_Barang)
  ThisProcess.CaseSensitiveValue = FALSE
  ThisProcess.AddSortOrder(AFI21:urut1_afifoouttemp_key)
  ThisProcess.SetFilter('AFI21:tanggal>=vg_tanggal1 and AFI21:tanggal<<=vg_tanggal2 and AFI21:kode_apotik=glo:apotik')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(AFIFOOUTTemp,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AFIFOIN.Close
    Relate:AFIFOOUTTemp.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesDrOutTempKeFIFOUT1',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  vl_jumlah=AFI21:Jumlah
  afifoin{prop:sql}='select * from dba.afifoin where status=0 and kode_barang='''&AFI21:Kode_Barang&''' and kode_apotik='''&AFI21:Kode_Apotik&''' and jumlah>jumlah_keluar order by tanggal asc, jam asc'
  loop
     if access:afifoin.next()<>level:benign then break.
     if (AFI:Jumlah-AFI:Jumlah_Keluar)>vl_jumlah then
        AFI:Jumlah_Keluar+=vl_jumlah
        access:afifoin.update()
        AFI2:Kode_Barang      =AFI:Kode_Barang
        AFI2:Mata_Uang        =AFI:Mata_Uang
        AFI2:NoTransaksi      =AFI:NoTransaksi
        AFI2:Transaksi        =AFI:Transaksi
        AFI2:NoTransKeluar    =AFI21:NoTransKeluar
        AFI2:Tanggal          =AFI21:Tanggal
        AFI2:Harga            =AFI21:Harga
        AFI2:Jumlah           =vl_jumlah
        AFI2:Tgl_Update       =AFI21:Tgl_Update
        AFI2:Jam_Update       =AFI21:Jam_Update
        AFI2:Operator         =AFI21:Operator
        AFI2:Jam              =AFI21:Jam
        AFI2:Kode_Apotik      =AFI21:Kode_Apotik
        access:afifoout.insert()
        vl_jumlah=0
        break
     else
        vl_jumlah     -=(AFI:Jumlah-AFI:Jumlah_Keluar)
        AFI2:Kode_Barang      =AFI:Kode_Barang
        AFI2:Mata_Uang        =AFI:Mata_Uang
        AFI2:NoTransaksi      =AFI:NoTransaksi
        AFI2:Transaksi        =AFI:Transaksi
        AFI2:NoTransKeluar    =AFI21:NoTransKeluar
        AFI2:Tanggal          =AFI21:Tanggal
        AFI2:Harga            =AFI21:Harga
        AFI2:Jumlah           =(AFI:Jumlah-AFI:Jumlah_Keluar)
        AFI2:Tgl_Update       =AFI21:Tgl_Update
        AFI2:Jam_Update       =AFI21:Jam_Update
        AFI2:Operator         =AFI21:Operator
        AFI2:Jam              =AFI21:Jam
        AFI2:Kode_Apotik      =AFI21:Kode_Apotik
        access:afifoout.insert()
        AFI:Jumlah_Keluar=AFI:Jumlah
        access:afifoin.update()
        display
     end
  end
  if vl_jumlah>0 then
     message(AFI21:Kode_Barang)
  end
  RETURN ReturnValue

WindowTanggal12Apotik2 PROCEDURE                           ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
Window               WINDOW('Tanggal'),AT(,,221,105),FONT('MS Sans Serif',8,COLOR:Black,FONT:regular),CENTER,GRAY,DOUBLE,MDI
                       PANEL,AT(3,5,187,71),USE(?Panel1)
                       PROMPT('Dari Tanggal '),AT(25,17),USE(?VG_TANGGAL1:Prompt)
                       ENTRY(@D6-),AT(82,17,60,10),USE(VG_TANGGAL1)
                       PROMPT('Sampai Tanggal'),AT(25,37),USE(?VG_TANGGAL2:Prompt)
                       ENTRY(@d6-),AT(82,37,60,10),USE(VG_TANGGAL2)
                       PROMPT('Apotik :'),AT(25,54),USE(?glo:apotik:Prompt)
                       ENTRY(@s5),AT(82,54,60,10),USE(glo:apotik)
                       BUTTON('...'),AT(147,52,13,14),USE(?Button2)
                       BUTTON('OK'),AT(37,84,123,14),USE(?OkButton),DEFAULT
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
  GlobalErrors.SetProcedureName('WindowTanggal12Apotik2')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Panel1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:GApotik.SetOpenRelated()
  Relate:GApotik.Open                                      ! File GApotik used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('WindowTanggal12Apotik2',Window)            ! Restore window settings from non-volatile store
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
    INIMgr.Update('WindowTanggal12Apotik2',Window)         ! Save window data to non-volatile store
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
    OF ?Button2
      ThisWindow.Update
      globalrequest=selectrecord
      selectapotik
      glo:apotik=GAPO:Kode_Apotik
      display
    OF ?OkButton
      ThisWindow.Update
      break
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

WindowTransaksiFarKeBill PROCEDURE                         ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
loc:nomor            STRING(20)                            !
loc:nomortrans       STRING(20)                            !
loc:jumlah           REAL                                  !
loc:tanggal          DATE                                  !
loc:kodejasa         STRING(20)                            !
loc:subkodejasa      STRING(20)                            !
loc:bagian           STRING(20)                            !
loc:satuan           SHORT                                 !
Window               WINDOW('Caption'),AT(,,216,187),FONT('Arial',8,,FONT:regular),GRAY
                       PROMPT('Nomor Bill:'),AT(16,13),USE(?loc:nomor:Prompt)
                       ENTRY(@s20),AT(71,13,60,10),USE(loc:nomor)
                       PROMPT('Nomor Apotik:'),AT(16,31),USE(?loc:nomortrans:Prompt)
                       ENTRY(@s20),AT(71,31,60,10),USE(loc:nomortrans)
                       PROMPT('Harga:'),AT(16,48),USE(?loc:jumlah:Prompt)
                       ENTRY(@n-15.2),AT(71,48,60,10),USE(loc:jumlah)
                       PROMPT('Jumlah:'),AT(16,64),USE(?loc:satuan:Prompt)
                       ENTRY(@n-7),AT(71,64,60,10),USE(loc:satuan),RIGHT(1)
                       PROMPT('Tanggal:'),AT(16,80),USE(?loc:tanggal:Prompt)
                       ENTRY(@d17),AT(71,80,60,10),USE(loc:tanggal)
                       PROMPT('Kode Jasa:'),AT(16,97),USE(?loc:kodejasa:Prompt)
                       ENTRY(@s20),AT(71,97,60,10),USE(loc:kodejasa)
                       PROMPT('Sub Kode Jasa:'),AT(16,113),USE(?loc:subkodejasa:Prompt)
                       ENTRY(@s20),AT(71,113,60,10),USE(loc:subkodejasa)
                       PROMPT('Kode Bagian:'),AT(16,131),USE(?loc:bagian:Prompt)
                       ENTRY(@s20),AT(71,131,60,10),USE(loc:bagian)
                       BUTTON('insert jdbilling & jddbilling'),AT(15,164,125,14),USE(?OkButton),DEFAULT
                       BUTTON('Selesai'),AT(151,164,36,14),USE(?CancelButton)
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
  GlobalErrors.SetProcedureName('WindowTransaksiFarKeBill')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?loc:nomor:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:JDBILLING.Open                                    ! File JDDBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:JDDBILLING.Open                                   ! File JDDBILLING used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  loc:kodejasa='FAR.00001.00.00'
  loc:subkodejasa='FAR.00001.04.00'
  loc:bagian='FARPD'
  loc:satuan=1
  display
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('WindowTransaksiFarKeBill',Window)          ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:JDBILLING.Close
    Relate:JDDBILLING.Close
  END
  IF SELF.Opened
    INIMgr.Update('WindowTransaksiFarKeBill',Window)       ! Save window data to non-volatile store
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
      !message('insert DBA.JDBILLING(nomor,notran_internal,kodejasa,totalbiaya,jumlah,kode_bagian,tgltransaksi,validasiproduksi,tglvalidasiproduksi) values('''&clip(loc:nomor)&''','''&clip(loc:nomortrans)&''',''FAR.00001.00.00'','&loc:jumlah&',1,''FARPD'','''&format(loc:tanggal,@d10)&''',1,'''&format(loc:tanggal,@d10)&''')')
      !message(jddbilling{prop:sql}='insert DBA.JDDBILLING(nomor,notran_internal,kodejasa,subkodejasa,totalbiaya,jumlah) values('''&clip(loc:nomor)&''','''&clip(loc:nomortrans)&''',''FAR.00001.00.00'',''FAR.00001.04.00'','&loc:jumlah&',1)')
      jdbilling{prop:sql}='insert DBA.JDBILLING(nomor,notran_internal,kodejasa,totalbiaya,jumlah,kode_bagian,tgltransaksi,validasiproduksi,tglvalidasiproduksi) values('''&clip(loc:nomor)&''','''&clip(loc:nomortrans)&''','''&clip(loc:kodejasa)&''','&loc:jumlah&','&loc:satuan&','''&clip(loc:bagian)&''','''&format(loc:tanggal,@d10)&''',1,'''&format(loc:tanggal,@d10)&''')'
      access:jdbilling.next()
      jddbilling{prop:sql}='insert DBA.JDDBILLING(nomor,notran_internal,kodejasa,subkodejasa,totalbiaya,jumlah) values('''&clip(loc:nomor)&''','''&clip(loc:nomortrans)&''','''&clip(loc:kodejasa)&''','''&clip(loc:subkodejasa)&''','&loc:jumlah&','&loc:satuan&')'
      access:jddbilling.next()
    OF ?CancelButton
      ThisWindow.Update
      break
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

