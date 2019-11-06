

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N030.INC'),ONCE        !Local module procedure declarations
                     END


WindowBulanTahun PROCEDURE                                 ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
Window               WINDOW('Tahun - Bulan'),AT(,,185,99),FONT('Arial',8,,FONT:regular),CENTER,GRAY
                       ENTRY(@n-7),AT(72,18,60,10),USE(glo:bulan),RIGHT(1)
                       ENTRY(@n-14),AT(72,33,60,10),USE(glo:tahun),RIGHT(1)
                       PROMPT('Kode apotik:'),AT(21,49),USE(?Glo::kode_apotik:Prompt)
                       ENTRY(@s5),AT(72,49,31,10),USE(Glo::kode_apotik),DISABLE,MSG('Kode apotik'),TIP('Kode apotik'),UPR
                       BUTTON('OK'),AT(43,73,103,14),USE(?OkButton),DEFAULT
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
  GlobalErrors.SetProcedureName('WindowBulanTahun')
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
  INIMgr.Fetch('WindowBulanTahun',Window)                  ! Restore window settings from non-volatile store
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
    INIMgr.Update('WindowBulanTahun',Window)               ! Save window data to non-volatile store
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

ProsesInsertStokOpnameKeKartuStok PROCEDURE                ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
Process:View         VIEW(GStokOp)
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
  GlobalErrors.SetProcedureName('ProsesInsertStokOpnameKeKartuStok')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  WindowBulanTahun()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo:bulan',glo:bulan)                              ! Added by: Process
  BIND('glo:tahun',glo:tahun)                              ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:GKStok.Open                                       ! File GKStok used by this procedure, so make sure it's RelationManager is open
  Relate:GStokOp.Open                                      ! File GKStok used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesInsertStokOpnameKeKartuStok',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:GStokOp, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ThisProcess.SetFilter('GST2:Bulan=glo:bulan and GST2:Tahun=glo:tahun')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(GStokOp,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:GKStok.Close
    Relate:GStokOp.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesInsertStokOpnameKeKartuStok',ProgressWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  GKS:Kode_Barang =GST2:Kode_Barang
  GKS:Tanggal     =date(GST2:Bulan,1,GST2:Tahun)
  GKS:Transaksi   ='Opname'
  GKS:NoTransaksi ='OPN1303'
  if access:gkstok.fetch(GKS:PrimaryKey)<>level:benign then
     GKS:Kode_Barang =GST2:Kode_Barang
     GKS:Tanggal     =date(GST2:Bulan,1,GST2:Tahun)
     GKS:Jam         =100
     GKS:Transaksi   ='Opname'
     GKS:NoTransaksi ='OPN1303'
     GKS:Debet       =GST2:STHitung
     GKS:Kredit      =0
     GKS:Opname      =GST2:STHitung
     GKS:Status      =0
     access:gkstok.insert()
  end
  RETURN ReturnValue

PrintFIFOHrgNolJumTdk PROCEDURE                            ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
vl_tanggal           DATE                                  !
vl_no                SHORT                                 !
Process:View         VIEW(AFIFOIN)
                       PROJECT(AFI:Harga)
                       PROJECT(AFI:Jumlah)
                       PROJECT(AFI:Kode_Apotik)
                       PROJECT(AFI:Kode_Barang)
                       PROJECT(AFI:NoTransaksi)
                       PROJECT(AFI:Tanggal)
                       JOIN(GBAR:KeyKodeBrg,AFI:Kode_Barang)
                         PROJECT(GBAR:Nama_Brg)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(469,417,7271,10573),PRE(RPT),FONT('Arial',10,COLOR:Black,),THOUS
                       HEADER,AT(458,63,7281,333)
                       END
detail                 DETAIL,AT(21,10,7240,240),USE(?detail)
                         STRING(@s10),AT(521,21,854,167),USE(AFI:Kode_Barang)
                         STRING(@d17),AT(3667,21,583,167),USE(AFI:Tanggal)
                         STRING(@n-15.2),AT(4354,21,1083,167),USE(AFI:Harga),RIGHT
                         STRING(@n-15.2),AT(5500,21,1104,167),USE(AFI:Jumlah),RIGHT
                         STRING(@s5),AT(6750,21,427,167),USE(AFI:Kode_Apotik)
                         STRING(@n3),AT(42,21,302,167),CNT,USE(vl_no),RIGHT(1)
                         STRING(@s40),AT(1281,21,2323,167),USE(GBAR:Nama_Brg)
                       END
                       FOOTER,AT(479,11010,7240,219)
                         STRING(@pPage <<<#p),AT(5250,30,700,135),PAGENO,USE(?PageCount),FONT('Arial',8,,FONT:regular)
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
  GlobalErrors.SetProcedureName('PrintFIFOHrgNolJumTdk')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('vl_tanggal',vl_tanggal)                            ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  vl_tanggal=date(1,1,2005)
  display
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File AFIFOIN used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintFIFOHrgNolJumTdk',ProgressWindow)     ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisReport.Init(Process:View, Relate:AFIFOIN, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  ThisReport.SetFilter('sub(AFI:NoTransaksi,1,3)=''OPN'' and AFI:tanggal=vl_tanggal and afi:jumlah<<>0 and afi:harga=0')
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
    INIMgr.Update('PrintFIFOHrgNolJumTdk',ProgressWindow)  ! Save window data to non-volatile store
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
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail)
  RETURN ReturnValue

ProsesFIFONolNull PROCEDURE                                ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
vl_no                LONG                                  !
Process:View         VIEW(FileSql)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,77),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                       ENTRY(@n-14),AT(40,61,60,10),USE(vl_no),RIGHT(1)
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
  GlobalErrors.SetProcedureName('ProsesFIFONolNull')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File GStockGdg used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql.Open                                      ! File GStockGdg used by this procedure, so make sure it's RelationManager is open
  Access:GHSBBK.UseFile                                    ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GDSBBK.UseFile                                    ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:FIFOIN.UseFile                                    ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:FIFOOUT.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GBarang.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStockGdg.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesFIFONolNull',ProgressWindow)         ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:FileSql, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(FileSql,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AFIFOIN.Close
    Relate:FileSql.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesFIFONolNull',ProgressWindow)      ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  afifoin{prop:sql}='select * from dba.afifoin where (harga=0 or harga is null) and tanggal>=''2003-10-01'''
  loop
     if access:afifoin.next()<>level:benign then break.
     if sub(AFI:NoTransaksi,1,2)='GK' then
        fifoout{prop:sql}='select * from dba.fifoout where Kode_Barang='''&AFI:Kode_Barang&''' and Mata_Uang=''Rp'' and NoTransKeluar='''&clip(AFI:NoTransaksi)&''''
        if access:fifoout.next()=level:benign then
           FIF:Kode_Barang   =FIF2:Kode_Barang
           FIF:Mata_Uang     ='Rp'
           FIF:NoTransaksi   =FIF2:NoTransaksi
           FIF:Transaksi     =FIF2:Transaksi
           if access:fifoin.fetch(FIF:KEY1)=level:benign then
              AFI:Harga=FIF:Harga
              access:afifoin.update()
           end
        end
     else
        GSGD:Kode_brg=AFI:Kode_Barang
        if access:gstockgdg.fetch(GSGD:KeyKodeBrg)=level:benign then
           AFI:Harga=GSGD:Harga_Beli*1.1
           access:afifoin.update()
        end
     end
     vl_no+=1
     display
  end
  
  RETURN ReturnValue

