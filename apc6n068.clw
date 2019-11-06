

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('APC6N068.INC'),ONCE        !Local module procedure declarations
                     END


PrintEtiketRanap PROCEDURE                                 ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
LOC::KOSONG          STRING(20)                            !
loc::nama            STRING(30)                            !
loc::alamat          STRING(30)                            !
vl_jam               TIME                                  !
vl_kali              STRING(1)                             !
vl_hari              STRING(10)                            !
vl_keterangan        STRING(50)                            !
vl_jumlah            REAL                                  !
Process:View         VIEW(APDTRANS)
                       PROJECT(APD:Camp)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:N0_tran)
                       JOIN(APH:by_transaksi,APD:N0_tran)
                         PROJECT(APH:Asal)
                         PROJECT(APH:Kode_Apotik)
                         PROJECT(APH:Nomor_mr)
                         PROJECT(APH:Tanggal)
                         PROJECT(APH:dokter)
                         JOIN(JDok:KeyKodeDokter,APH:dokter)
                         END
                         JOIN(JPas:KeyNomorMr,APH:Nomor_mr)
                           PROJECT(JPas:Nama)
                           PROJECT(JPas:TanggalLahir)
                         END
                       END
                       JOIN(GBAR:KeyKodeBrg,APD:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(4,0,65,36),PAPER(PAPER:USER,2800,1500),PRE(RPT),FONT('Arial',10,COLOR:Black,),MM
break1                 BREAK(APD:Kode_brg)
detail1                  DETAIL,AT(,,65,34),USE(?detail1),FONT('Times New Roman',9,,)
                           STRING('Instalasi Farmasi RS Bhayangkara Sartika Asih'),AT(1,0,63,4),USE(?String11:2),TRN,CENTER,FONT('Times New Roman',9,,FONT:regular)
                           STRING('Jl. Moch Toha 369 Bandung Telp. 5229544'),AT(1,4,63,4),USE(?String11:3),TRN,CENTER,FONT('Times New Roman',9,,FONT:regular)
                           STRING(@s15),AT(2,9,25,4),USE(APD:N0_tran),TRN,FONT('Times New Roman',8,,)
                           STRING(@s35),AT(2,18,41,4),USE(JPas:Nama),LEFT,FONT('Times New Roman',9,,FONT:regular)
                           STRING('(T.L {19})'),AT(41,18,21,4),USE(?String15),TRN,FONT('Times New Roman',9,,FONT:regular)
                           STRING(@D06),AT(48,18,16,4),USE(JPas:TanggalLahir),TRN,FONT('Times New Roman',9,,FONT:regular)
                           LINE,AT(1,13,63,0),USE(?Line2:2),COLOR(COLOR:Black)
                           STRING(@N010_),AT(8,14,18,4),USE(APH:Nomor_mr),TRN,RIGHT
                           STRING(@s20),AT(27,14,33,4),USE(ITbr:NAMA_RUANG)
                           STRING(@s10),AT(46,14,17,4),USE(APH:Asal),HIDE,LEFT
                           STRING(@s5),AT(31,9,9,4),USE(APH:Kode_Apotik),TRN,FONT('Times New Roman',8,,)
                           STRING(@D06),AT(47,9,16,4),USE(APH:Tanggal),TRN,FONT('Times New Roman',8,,)
                           LINE,AT(1,8,63,0),USE(?Line2),COLOR(COLOR:Black)
                           STRING(@s40),AT(2,30,50,4),USE(GBAR:Nama_Brg),FONT('Times New Roman',8,,)
                           STRING(@n6B),AT(53,30,10,4),USE(vl_jumlah),RIGHT(2),FONT('Times New Roman',8,,)
                           STRING(@s50),AT(2,22,62,4),USE(vl_keterangan),TRN,CENTER,FONT('Times New Roman',10,,FONT:regular)
                           STRING(@s30),AT(2,26,59,4),USE(Ape1:Nama),CENTER,FONT('Times New Roman',10,,)
                         END
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

ProgressMgr          StepStringClass                       ! Progress Manager
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
  GlobalErrors.SetProcedureName('PrintEtiketRanap')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo::nomor',glo::nomor)                            ! Added by: Report
  BIND('glo_kode_barang',glo_kode_barang)                  ! Added by: Report
  BIND('glo::no_nota',glo::no_nota)                        ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:APDTRANS.Open                                     ! File ITbrRwt used by this procedure, so make sure it's RelationManager is open
  Relate:APDTRANSDet.Open                                  ! File ITbrRwt used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket.Open                                     ! File ITbrRwt used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket1.Open                                    ! File ITbrRwt used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ApReLuar.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITbrRwt.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintEtiketRanap',ProgressWindow)          ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:APDTRANS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, APD:N0_tran)
  ThisReport.AddSortOrder(APD:by_transaksi)
  ThisReport.SetFilter('APD:N0_tran=glo::nomor ')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  Relate:APDTRANS.SetQuickScan(1,Propagate:OneMany)
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
    Relate:APDTRANS.Close
    Relate:APDTRANSDet.Close
    Relate:Apetiket.Close
    Relate:Apetiket1.Close
  END
  IF SELF.Opened
    INIMgr.Update('PrintEtiketRanap',ProgressWindow)       ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  APH:N0_tran = APD:N0_tran                                ! Assign linking field value
  Access:APHTRANS.Fetch(APH:by_transaksi)
  JDok:Kode_Dokter = APH:dokter                            ! Assign linking field value
  Access:JDokter.Fetch(JDok:KeyKodeDokter)
  JPas:Nomor_mr = APH:Nomor_mr                             ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APH:N0_tran = APD:N0_tran                                ! Assign linking field value
  Access:APHTRANS.Fetch(APH:by_transaksi)
  JDok:Kode_Dokter = APH:dokter                            ! Assign linking field value
  Access:JDokter.Fetch(JDok:KeyKodeDokter)
  JPas:Nomor_mr = APH:Nomor_mr                             ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  APD2:N0_tran    =APD:N0_tran
  APD2:Kode_brg   =APD:Kode_brg
  APD2:Camp       =APD:Camp
  get(apdtransdet,APD2:KEY1)
  Ape:No=APD2:Keterangan
  access:apetiket.fetch(Ape:KEY1)
  Ape1:No=APD2:Keterangan2
  access:apetiket1.fetch(Ape1:KEY1)
  vl_kali=''
  vl_hari=''
  vl_keterangan=''
  if APD2:Jumlah1<>'' or APD2:Jumlah2<>'' then
     vl_kali='X'
     vl_hari='Sehari :'
     vl_keterangan='Sehari : '&clip(APD2:Jumlah1)&' X '&clip(APD2:Jumlah2)&' '&clip(Ape:Nama)
  end
  if upper(clip(GBAR:Nama_Brg))='OBAT CAMPUR' then
     vl_jumlah=0
  else
     vl_jumlah=APD:Jumlah
  end
  display
  ReturnValue = PARENT.TakeRecord()
  IF  APH:Nomor_mr = 99999999
      APR:N0_tran = APH:N0_tran
      GET(ApReLuar,APR:by_transaksi)
      IF NOT ERRORCODE()
         loc::nama=APR:Nama
         loc::alamat=APR:Alamat
      ELSE
         loc::nama=''
         loc::alamat=''
      END
  ELSE
      JPas:Nomor_mr=APH:Nomor_mr
      get(jpasien,JPas:KeyNomorMr)
      IF NOT ERRORCODE()
         loc::nama=JPas:Nama
         loc::alamat=JPas:Alamat
      ELSE
         loc::nama=''
         loc::alamat=''
      END
  END
  ITbr:KODE_RUANG=APH:Asal
  access:itbrrwt.fetch(ITbr:KeyKodeRuang)
  PRINT(RPT:detail1)
  RETURN ReturnValue

PrintEtiketRanap1struk PROCEDURE                           ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
LOC::KOSONG          STRING(20)                            !
loc::nama            STRING(30)                            !
loc::alamat          STRING(30)                            !
vl_jam               TIME                                  !
vl_kali              STRING(1)                             !
vl_hari              STRING(10)                            !
vl_keterangan        STRING(50)                            !
vl_jumlah            REAL                                  !
Process:View         VIEW(APDTRANS)
                       PROJECT(APD:Camp)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:N0_tran)
                       JOIN(APH:by_transaksi,APD:N0_tran)
                         PROJECT(APH:Asal)
                         PROJECT(APH:Kode_Apotik)
                         PROJECT(APH:Nomor_mr)
                         PROJECT(APH:Tanggal)
                         PROJECT(APH:dokter)
                         JOIN(JDok:KeyKodeDokter,APH:dokter)
                         END
                         JOIN(JPas:KeyNomorMr,APH:Nomor_mr)
                           PROJECT(JPas:Nama)
                           PROJECT(JPas:TanggalLahir)
                         END
                       END
                       JOIN(GBAR:KeyKodeBrg,APD:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(4,35,65,235),PAPER(PAPER:USER,2800,1500),PRE(RPT),FONT('Arial',10,COLOR:Black,),MM
                       HEADER,AT(4,2,65,33),FONT('Times New Roman',10,,FONT:regular)
                         STRING('Instalasi Farmasi RS Bhayangkara Sartika Asih'),AT(1,1,63,4),USE(?String11:2),TRN,CENTER,FONT('Times New Roman',9,COLOR:Black,FONT:regular)
                         STRING('Jl. Moch Toha 369 Bandung Telp. 5229544'),AT(1,5,63,4),USE(?String11:3),TRN,CENTER,FONT('Times New Roman',9,COLOR:Black,FONT:regular)
                         LINE,AT(1,9,63,0),USE(?Line2),COLOR(COLOR:Black)
                         STRING(@s15),AT(2,10,25,4),USE(APD:N0_tran),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         STRING(@s5),AT(31,10,9,4),USE(APH:Kode_Apotik),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         STRING(@D06),AT(47,10,16,4),USE(APH:Tanggal),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         LINE,AT(1,14,63,0),USE(?Line2:2),COLOR(COLOR:Black)
                         STRING(@N010_),AT(3,16,23,4),USE(APH:Nomor_mr),TRN,RIGHT
                         STRING(@s20),AT(29,16),USE(ITbr:NAMA_RUANG)
                         STRING(@s10),AT(33,19,17,4),USE(APH:Asal),HIDE,LEFT
                         STRING('(T.L {21})'),AT(41,20,23,4),USE(?String15),TRN,FONT('Times New Roman',9,,FONT:regular)
                         STRING(@D06),AT(48,20,16,4),USE(JPas:TanggalLahir),TRN,FONT('Times New Roman',9,,FONT:regular)
                         STRING(@s35),AT(2,20,41,4),USE(JPas:Nama),TRN,LEFT,FONT('Times New Roman',9,,FONT:regular)
                         STRING(@s50),AT(2,24,62,4),USE(vl_keterangan),TRN,CENTER,FONT('Times New Roman',10,COLOR:Black,FONT:regular)
                         STRING(@s30),AT(2,28,59,4),USE(Ape1:Nama),CENTER,FONT('Times New Roman',10,COLOR:Black,)
                       END
break1                 BREAK(APD:Kode_brg)
detail1                  DETAIL,AT(,,65,5),USE(?detail1),FONT('Times New Roman',9,,)
                           STRING(@s40),AT(2,0,50,4),USE(GBAR:Nama_Brg),FONT('Times New Roman',8,,)
                           STRING(@n6B),AT(53,0,10,4),USE(vl_jumlah),RIGHT(2),FONT('Times New Roman',8,,)
                         END
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

ProgressMgr          StepStringClass                       ! Progress Manager
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
  GlobalErrors.SetProcedureName('PrintEtiketRanap1struk')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo::nomor',glo::nomor)                            ! Added by: Report
  BIND('glo_kode_barang',glo_kode_barang)                  ! Added by: Report
  BIND('glo::no_nota',glo::no_nota)                        ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:APDTRANS.Open                                     ! File ITbrRwt used by this procedure, so make sure it's RelationManager is open
  Relate:APDTRANSDet.Open                                  ! File ITbrRwt used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket.Open                                     ! File ITbrRwt used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket1.Open                                    ! File ITbrRwt used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ApReLuar.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITbrRwt.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintEtiketRanap1struk',ProgressWindow)    ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:APDTRANS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, APD:N0_tran)
  ThisReport.AddSortOrder(APD:by_transaksi)
  ThisReport.SetFilter('APD:N0_tran=glo::nomor ')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  Relate:APDTRANS.SetQuickScan(1,Propagate:OneMany)
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
    Relate:APDTRANS.Close
    Relate:APDTRANSDet.Close
    Relate:Apetiket.Close
    Relate:Apetiket1.Close
  END
  IF SELF.Opened
    INIMgr.Update('PrintEtiketRanap1struk',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  APH:N0_tran = APD:N0_tran                                ! Assign linking field value
  Access:APHTRANS.Fetch(APH:by_transaksi)
  JDok:Kode_Dokter = APH:dokter                            ! Assign linking field value
  Access:JDokter.Fetch(JDok:KeyKodeDokter)
  JPas:Nomor_mr = APH:Nomor_mr                             ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APH:N0_tran = APD:N0_tran                                ! Assign linking field value
  Access:APHTRANS.Fetch(APH:by_transaksi)
  JDok:Kode_Dokter = APH:dokter                            ! Assign linking field value
  Access:JDokter.Fetch(JDok:KeyKodeDokter)
  JPas:Nomor_mr = APH:Nomor_mr                             ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  APD2:N0_tran    =APD:N0_tran
  APD2:Kode_brg   =APD:Kode_brg
  APD2:Camp       =APD:Camp
  get(apdtransdet,APD2:KEY1)
  Ape:No=APD2:Keterangan
  access:apetiket.fetch(Ape:KEY1)
  Ape1:No=APD2:Keterangan2
  access:apetiket1.fetch(Ape1:KEY1)
  vl_kali=''
  vl_hari=''
  vl_keterangan=''
  if APD2:Jumlah1<>'' or APD2:Jumlah2<>'' then
     vl_kali='X'
     vl_hari='Sehari :'
     vl_keterangan='Sehari : '&clip(APD2:Jumlah1)&' X '&clip(APD2:Jumlah2)&' '&clip(Ape:Nama)
  end
  if upper(clip(GBAR:Nama_Brg))='OBAT CAMPUR' then
     vl_jumlah=0
  else
     vl_jumlah=APD:Jumlah
  end
  display
  ReturnValue = PARENT.TakeRecord()
  IF  APH:Nomor_mr = 99999999
      APR:N0_tran = APH:N0_tran
      GET(ApReLuar,APR:by_transaksi)
      IF NOT ERRORCODE()
         loc::nama=APR:Nama
         loc::alamat=APR:Alamat
      ELSE
         loc::nama=''
         loc::alamat=''
      END
  ELSE
      JPas:Nomor_mr=APH:Nomor_mr
      get(jpasien,JPas:KeyNomorMr)
      IF NOT ERRORCODE()
         loc::nama=JPas:Nama
         loc::alamat=JPas:Alamat
      ELSE
         loc::nama=''
         loc::alamat=''
      END
  END
  ITbr:KODE_RUANG=APH:Asal
  access:itbrrwt.fetch(ITbr:KeyKodeRuang)
  PRINT(RPT:detail1)
  RETURN ReturnValue

PrintEtiketRanapItem PROCEDURE                             ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
LOC::KOSONG          STRING(20)                            !
loc::nama            STRING(30)                            !
loc::alamat          STRING(30)                            !
vl_jam               TIME                                  !
vl_kali              STRING(1)                             !
vl_hari              STRING(10)                            !
vl_keterangan        STRING(50)                            !
vl_jumlah            REAL                                  !
Process:View         VIEW(APDTRANS)
                       PROJECT(APD:Camp)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:N0_tran)
                       JOIN(APH:by_transaksi,APD:N0_tran)
                         PROJECT(APH:Asal)
                         PROJECT(APH:Kode_Apotik)
                         PROJECT(APH:Nomor_mr)
                         PROJECT(APH:Tanggal)
                         PROJECT(APH:dokter)
                         JOIN(JDok:KeyKodeDokter,APH:dokter)
                         END
                         JOIN(JPas:KeyNomorMr,APH:Nomor_mr)
                           PROJECT(JPas:Nama)
                           PROJECT(JPas:TanggalLahir)
                         END
                       END
                       JOIN(GBAR:KeyKodeBrg,APD:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(4,0,65,36),PAPER(PAPER:USER,2800,1500),PRE(RPT),FONT('Arial',10,,),MM
break1                 BREAK(APD:Kode_brg)
detail1                  DETAIL,AT(,,65,34),USE(?detail1),FONT('Times New Roman',9,COLOR:Black,)
                           STRING('Instalasi Farmasi RS Bhayangkara Sartika Asih'),AT(1,0,63,4),USE(?String11:2),TRN,CENTER,FONT('Times New Roman',9,,FONT:regular)
                           STRING('Jl. Moch Toha 369 Bandung Telp. 5229544'),AT(1,4,63,4),USE(?String11:3),TRN,CENTER,FONT('Times New Roman',9,,FONT:regular)
                           STRING(@s15),AT(2,9,25,4),USE(APD:N0_tran),TRN,FONT('Times New Roman',8,,)
                           STRING(@s35),AT(2,18,39,4),USE(JPas:Nama),TRN,LEFT,FONT('Times New Roman',9,,FONT:regular)
                           STRING('(T.L {21})'),AT(41,18,22,4),USE(?String15),TRN,FONT('Times New Roman',9,,FONT:regular)
                           STRING(@D06),AT(48,18,16,4),USE(JPas:TanggalLahir),TRN,FONT('Times New Roman',9,,FONT:regular)
                           LINE,AT(1,13,63,0),USE(?Line2:2),COLOR(COLOR:Black)
                           STRING(@N010_),AT(3,14,18,4),USE(APH:Nomor_mr),TRN,RIGHT
                           STRING(@s10),AT(47,26,17,4),USE(APH:Asal),HIDE,LEFT
                           STRING(@s20),AT(29,14,33,4),USE(ITbr:NAMA_RUANG),RIGHT
                           STRING(@s5),AT(31,9,9,4),USE(APH:Kode_Apotik),TRN,FONT('Times New Roman',8,,)
                           STRING(@D06),AT(47,9,16,4),USE(APH:Tanggal),TRN,FONT('Times New Roman',8,,)
                           LINE,AT(1,8,63,0),USE(?Line2),COLOR(COLOR:Black)
                           STRING(@s40),AT(2,30,50,4),USE(GBAR:Nama_Brg),FONT('Times New Roman',8,,)
                           STRING(@n5),AT(53,30,10,4),USE(vl_jumlah),RIGHT(2),FONT('Times New Roman',8,,)
                           STRING(@s50),AT(2,22,62,4),USE(vl_keterangan),TRN,CENTER,FONT('Times New Roman',10,,FONT:regular)
                           STRING(@s30),AT(2,26,59,4),USE(Ape1:Nama),CENTER,FONT('Times New Roman',10,,)
                         END
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

ProgressMgr          StepStringClass                       ! Progress Manager
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
  GlobalErrors.SetProcedureName('PrintEtiketRanapItem')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo::nomor',glo::nomor)                            ! Added by: Report
  BIND('glo_kode_barang',glo_kode_barang)                  ! Added by: Report
  BIND('glo::no_nota',glo::no_nota)                        ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:APDTRANS.Open                                     ! File ITbKelas used by this procedure, so make sure it's RelationManager is open
  Relate:APDTRANSDet.Open                                  ! File ITbKelas used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket.Open                                     ! File ITbKelas used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket1.Open                                    ! File ITbKelas used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ApReLuar.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITbrRwt.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITbKelas.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintEtiketRanapItem',ProgressWindow)      ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:APDTRANS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, APD:N0_tran)
  ThisReport.AddSortOrder(APD:by_transaksi)
  ThisReport.SetFilter('APD:N0_tran=glo::nomor and APD:Kode_brg=glo_kode_barang')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  Relate:APDTRANS.SetQuickScan(1,Propagate:OneMany)
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
    Relate:APDTRANS.Close
    Relate:APDTRANSDet.Close
    Relate:Apetiket.Close
    Relate:Apetiket1.Close
  END
  IF SELF.Opened
    INIMgr.Update('PrintEtiketRanapItem',ProgressWindow)   ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  APH:N0_tran = APD:N0_tran                                ! Assign linking field value
  Access:APHTRANS.Fetch(APH:by_transaksi)
  JDok:Kode_Dokter = APH:dokter                            ! Assign linking field value
  Access:JDokter.Fetch(JDok:KeyKodeDokter)
  JPas:Nomor_mr = APH:Nomor_mr                             ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APH:N0_tran = APD:N0_tran                                ! Assign linking field value
  Access:APHTRANS.Fetch(APH:by_transaksi)
  JDok:Kode_Dokter = APH:dokter                            ! Assign linking field value
  Access:JDokter.Fetch(JDok:KeyKodeDokter)
  JPas:Nomor_mr = APH:Nomor_mr                             ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  !message(APD:N0_tran&' '&APD:Kode_brg&' '&APD:Camp)
  APD2:N0_tran    =APD:N0_tran
  APD2:Kode_brg   =APD:Kode_brg
  APD2:Camp       =APD:Camp
  get(apdtransdet,APD2:KEY1)
  if not errorcode() then
     !message(APD2:N0_tran&' '&APD2:Kode_brg&' '&APD2:Camp)
     Ape:No=APD2:Keterangan
     access:apetiket.fetch(Ape:KEY1)
     Ape1:No=APD2:Keterangan2
     access:apetiket1.fetch(Ape1:KEY1)
  else
     !message(error())
  end
  if APD2:Jumlah1='' or APD2:Jumlah2='' then
     vl_kali=''
     vl_hari=''
     vl_keterangan=''
  else
     vl_kali='X'
     vl_hari='Sehari :'
     vl_keterangan='Sehari : '&clip(APD2:Jumlah1)&' X '&clip(APD2:Jumlah2)&' '&clip(Ape:Nama)
  end
  if upper(clip(GBAR:Nama_Brg))='OBAT CAMPUR' then
     vl_jumlah=0
  else
     vl_jumlah=APD:Jumlah
  end
  display
  ReturnValue = PARENT.TakeRecord()
  IF  APH:Nomor_mr = 99999999
      APR:N0_tran = APH:N0_tran
      GET(ApReLuar,APR:by_transaksi)
      IF NOT ERRORCODE()
         loc::nama=APR:Nama
         loc::alamat=APR:Alamat
      ELSE
         loc::nama=''
         loc::alamat=''
      END
  ELSE
      JPas:Nomor_mr=APH:Nomor_mr
      get(jpasien,JPas:KeyNomorMr)
      IF NOT ERRORCODE()
         loc::nama=JPas:Nama
         loc::alamat=JPas:Alamat
      ELSE
         loc::nama=''
         loc::alamat=''
      END
  END
  ITbr:KODE_RUANG=APH:Asal
  access:itbrrwt.fetch(ITbr:KeyKodeRuang)
  !message(ITbr:KODE_RUANG&' '&APH:Asal)
  
  PRINT(RPT:detail1)
  RETURN ReturnValue

PrintEtiketRanapItemZebra PROCEDURE                        ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
sav::printer         STRING(100)                           !
FilesOpened          BYTE                                  !
LOC::KOSONG          STRING(20)                            !
loc::nama            STRING(30)                            !
loc::alamat          STRING(30)                            !
vl_jam               TIME                                  !
vl_kali              STRING(1)                             !
vl_hari              STRING(10)                            !
vl_keterangan        STRING(50)                            !
vl_jumlah            REAL                                  !
Process:View         VIEW(APDTRANS)
                       PROJECT(APD:Camp)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:N0_tran)
                       JOIN(APH:by_transaksi,APD:N0_tran)
                         PROJECT(APH:Asal)
                         PROJECT(APH:Kode_Apotik)
                         PROJECT(APH:Nomor_mr)
                         PROJECT(APH:Tanggal)
                         PROJECT(APH:dokter)
                         JOIN(JDok:KeyKodeDokter,APH:dokter)
                         END
                         JOIN(JPas:KeyNomorMr,APH:Nomor_mr)
                           PROJECT(JPas:Nama)
                           PROJECT(JPas:TanggalLahir)
                         END
                       END
                       JOIN(GBAR:KeyKodeBrg,APD:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(4,3,80,34),PAPER(PAPER:USER,2800,1500),PRE(RPT),FONT('Arial',10,,),MM
break1                 BREAK(APD:Kode_brg)
detail1                  DETAIL,AT(,,79,34),USE(?detail1),FONT('Times New Roman',9,,)
                           STRING('Instalasi Farmasi RS Bhayangkara Sartika Asih'),AT(18,0),USE(?String12:5),TRN,CENTER,FONT(,8,,,CHARSET:ANSI)
                           STRING('Jl. Moch Toha 369 Bandung Telp. 5229544'),AT(18,3),USE(?String12:6),TRN,CENTER,FONT(,8,,,CHARSET:ANSI)
                           STRING(@s15),AT(18,7,25,4),USE(APD:N0_tran),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING(@s35),AT(17,14,59,4),USE(JPas:Nama),CENTER,FONT('Times New Roman',10,,FONT:regular)
                           LINE,AT(16,11,63,0),USE(?Line2:2),HIDE,COLOR(COLOR:Black)
                           STRING(@N010_),AT(17,10,18,4),USE(APH:Nomor_mr),TRN,RIGHT
                           STRING(@s20),AT(44,10,32,5),USE(ITbr:NAMA_RUANG),TRN
                           STRING(@s10),AT(63,14,17,4),USE(APH:Asal),HIDE,LEFT
                           STRING(@s5),AT(47,7,9,4),USE(APH:Kode_Apotik),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING(@D06),AT(63,7,16,4),USE(APH:Tanggal),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           LINE,AT(16,7,63,0),USE(?Line2),HIDE,COLOR(COLOR:Black)
                           STRING(@s40),AT(17,27,50,4),USE(GBAR:Nama_Brg),TRN,FONT('Times New Roman',8,,)
                           STRING(@n5),AT(68,27,10,4),USE(vl_jumlah),TRN,RIGHT(2),FONT('Times New Roman',8,,)
                           STRING('Expire Date :'),AT(18,30),USE(?String12),TRN
                           STRING(@s50),AT(17,21,62,4),USE(vl_keterangan),TRN,CENTER,FONT('Times New Roman',10,,FONT:regular)
                           STRING(')'),AT(63,16,2,4),USE(?String12:4),TRN
                           STRING('('),AT(27,17,2,4),USE(?String12:3),TRN
                           STRING('Tanggal Lahir:'),AT(29,17,18,4),USE(?String12:2),TRN
                           STRING(@D06),AT(48,17,16,4),USE(JPas:TanggalLahir),TRN
                           STRING(@s30),AT(17,24,59,4),USE(Ape1:Nama),TRN,CENTER,FONT('Times New Roman',10,,)
                         END
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

ProgressMgr          StepStringClass                       ! Progress Manager
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
  GlobalErrors.SetProcedureName('PrintEtiketRanapItemZebra')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  sav::printer=printer{propprint:device}
  printer{propprint:device}=getini('apotik','printeretiket',,'immanuel.ini')
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo::nomor',glo::nomor)                            ! Added by: Report
  BIND('glo_kode_barang',glo_kode_barang)                  ! Added by: Report
  BIND('glo::no_nota',glo::no_nota)                        ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:APDTRANS.Open                                     ! File ITbrRwt used by this procedure, so make sure it's RelationManager is open
  Relate:APDTRANSDet.Open                                  ! File ITbrRwt used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket.Open                                     ! File ITbrRwt used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket1.Open                                    ! File ITbrRwt used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ApReLuar.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITbrRwt.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintEtiketRanapItemZebra',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:APDTRANS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, APD:N0_tran)
  ThisReport.AddSortOrder(APD:by_transaksi)
  ThisReport.SetFilter('APD:N0_tran=glo::nomor and APD:Kode_brg=glo_kode_barang')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  Relate:APDTRANS.SetQuickScan(1,Propagate:OneMany)
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom=True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  printer{propprint:device}=sav::printer
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:APDTRANSDet.Close
    Relate:Apetiket.Close
    Relate:Apetiket1.Close
  END
  IF SELF.Opened
    INIMgr.Update('PrintEtiketRanapItemZebra',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  APH:N0_tran = APD:N0_tran                                ! Assign linking field value
  Access:APHTRANS.Fetch(APH:by_transaksi)
  JDok:Kode_Dokter = APH:dokter                            ! Assign linking field value
  Access:JDokter.Fetch(JDok:KeyKodeDokter)
  JPas:Nomor_mr = APH:Nomor_mr                             ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APH:N0_tran = APD:N0_tran                                ! Assign linking field value
  Access:APHTRANS.Fetch(APH:by_transaksi)
  JDok:Kode_Dokter = APH:dokter                            ! Assign linking field value
  Access:JDokter.Fetch(JDok:KeyKodeDokter)
  JPas:Nomor_mr = APH:Nomor_mr                             ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  !message(APD:N0_tran&' '&APD:Kode_brg&' '&APD:Camp)
  APD2:N0_tran    =APD:N0_tran
  APD2:Kode_brg   =APD:Kode_brg
  APD2:Camp       =APD:Camp
  get(apdtransdet,APD2:KEY1)
  if not errorcode() then
     !message(APD2:N0_tran&' '&APD2:Kode_brg&' '&APD2:Camp)
     Ape:No=APD2:Keterangan
     access:apetiket.fetch(Ape:KEY1)
     Ape1:No=APD2:Keterangan2
     access:apetiket1.fetch(Ape1:KEY1)
  else
     !message(error())
  end
  if APD2:Jumlah1='' or APD2:Jumlah2='' then
     vl_kali=''
     vl_hari=''
     vl_keterangan=''
  else
     vl_kali='X'
     vl_hari='Sehari :'
     vl_keterangan='Sehari : '&clip(APD2:Jumlah1)&' X '&clip(APD2:Jumlah2)&' '&clip(Ape:Nama)
  end
  if upper(clip(GBAR:Nama_Brg))='OBAT CAMPUR' then
     vl_jumlah=0
  else
     vl_jumlah=APD:Jumlah
  end
  display
  ReturnValue = PARENT.TakeRecord()
  IF  APH:Nomor_mr = 99999999
      APR:N0_tran = APH:N0_tran
      GET(ApReLuar,APR:by_transaksi)
      IF NOT ERRORCODE()
         loc::nama=APR:Nama
         loc::alamat=APR:Alamat
      ELSE
         loc::nama=''
         loc::alamat=''
      END
  ELSE
      JPas:Nomor_mr=APH:Nomor_mr
      get(jpasien,JPas:KeyNomorMr)
      IF NOT ERRORCODE()
         loc::nama=JPas:Nama
         loc::alamat=JPas:Alamat
      ELSE
         loc::nama=''
         loc::alamat=''
      END
  END
  ITbr:KODE_RUANG=APH:Asal
  access:itbrrwt.fetch(ITbr:KeyKodeRuang)
  
  !message(APD:N0_tran&' '&APD:Kode_brg&' '&APD:Camp)
  
  PRINT(RPT:detail1)
  RETURN ReturnValue

PrintEtiketRanapZebra PROCEDURE                            ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
vl_ket2              STRING(50)                            !
sav::printer         STRING(100)                           !
FilesOpened          BYTE                                  !
LOC::KOSONG          STRING(20)                            !
loc::nama            STRING(30)                            !
loc::alamat          STRING(30)                            !
vl_jam               TIME                                  !
vl_kali              STRING(1)                             !
vl_hari              STRING(10)                            !
vl_keterangan        STRING(50)                            !
vl_jumlah            REAL                                  !
vl_mbuh              STRING(20)                            !
Process:View         VIEW(APDTRANS)
                       PROJECT(APD:Camp)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:N0_tran)
                       JOIN(APH:by_transaksi,APD:N0_tran)
                         PROJECT(APH:Asal)
                         PROJECT(APH:Kode_Apotik)
                         PROJECT(APH:Nomor_mr)
                         PROJECT(APH:Ruang)
                         PROJECT(APH:Tanggal)
                         PROJECT(APH:dokter)
                         JOIN(JDok:KeyKodeDokter,APH:dokter)
                         END
                         JOIN(JPas:KeyNomorMr,APH:Nomor_mr)
                           PROJECT(JPas:Nama)
                           PROJECT(JPas:TanggalLahir)
                         END
                       END
                       JOIN(GBAR:KeyKodeBrg,APD:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(4,2,82,35),PAPER(PAPER:USER,2800,1500),PRE(RPT),FONT('Arial',10,,),MM
break1                 BREAK(vl_mbuh)
detail1                  DETAIL,AT(,,84,35),USE(?detail1),FONT('Times New Roman',9,COLOR:Black,)
                           STRING('Instalasi Farmasi RS Bhayangkara Sartika Asih'),AT(17,0),USE(?String12:3),TRN,CENTER,FONT(,8,,,CHARSET:ANSI)
                           STRING('Jl. Moch Toha 369 Bandung Telp. 5229544'),AT(17,3),USE(?String12:4),TRN,CENTER,FONT(,8,,,CHARSET:ANSI)
                           STRING(@s15),AT(17,7,25,4),USE(APD:N0_tran),TRN,FONT('Times New Roman',8,,)
                           STRING(@s35),AT(17,14,59,4),USE(JPas:Nama),CENTER,FONT('Times New Roman',10,,FONT:regular)
                           LINE,AT(16,12,63,0),USE(?Line2:2),HIDE,COLOR(COLOR:Black)
                           STRING(@N010_),AT(23,11,18,4),USE(APH:Nomor_mr),TRN,LEFT
                           STRING(@s20),AT(43,11,33,4),USE(ITbr:NAMA_RUANG),TRN
                           STRING(@s10),AT(60,14,17,4),USE(APH:Asal),TRN,HIDE,LEFT
                           STRING('('),AT(26,17),USE(?String15),TRN
                           STRING('Tanggal Lahir:'),AT(28,17,17,4),USE(?String12:2),TRN
                           STRING(@D06),AT(46,17,16,4),USE(JPas:TanggalLahir),TRN
                           STRING(@s5),AT(46,7,9,4),USE(APH:Kode_Apotik),TRN,FONT('Times New Roman',8,,)
                           STRING(@D06),AT(62,7,16,4),USE(APH:Tanggal),TRN,LEFT,FONT('Times New Roman',8,,)
                           LINE,AT(16,7,63,0),USE(?Line2),HIDE,COLOR(COLOR:Black)
                           STRING(@s40),AT(17,28,50,4),USE(GBAR:Nama_Brg),TRN,LEFT,FONT('Times New Roman',8,,)
                           STRING(@n-10),AT(69,28,10,4),USE(APD:Jumlah),TRN,RIGHT(2),FONT('Times New Roman',8,,)
                           STRING('Expire Date :'),AT(17,31),USE(?String12),TRN
                           STRING(@s50),AT(17,20,59,4),USE(vl_keterangan),TRN,CENTER,FONT('Times New Roman',10,,FONT:regular)
                           STRING(')'),AT(62,17),USE(?String15:2),TRN
                           STRING(@s30),AT(17,24,59,4),USE(vl_ket2),TRN,CENTER,FONT('Times New Roman',10,,)
                         END
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

ProgressMgr          StepStringClass                       ! Progress Manager
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
  GlobalErrors.SetProcedureName('PrintEtiketRanapZebra')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  sav::printer=printer{propprint:device}
  printer{propprint:device}=getini('apotik','printeretiket',,'immanuel.ini')
  
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo::nomor',glo::nomor)                            ! Added by: Report
  BIND('glo_kode_barang',glo_kode_barang)                  ! Added by: Report
  BIND('glo::no_nota',glo::no_nota)                        ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:APDTRANS.Open                                     ! File ITbrRwt used by this procedure, so make sure it's RelationManager is open
  Relate:APDTRANSDet.Open                                  ! File ITbrRwt used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket.Open                                     ! File ITbrRwt used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket1.Open                                    ! File ITbrRwt used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ApReLuar.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITbrRwt.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintEtiketRanapZebra',ProgressWindow)     ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:APDTRANS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, APD:N0_tran)
  ThisReport.AddSortOrder(APD:by_transaksi)
  ThisReport.SetFilter('APD:N0_tran=glo::nomor ')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  Relate:APDTRANS.SetQuickScan(1,Propagate:OneMany)
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom=True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  printer{propprint:device}=sav::printer
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:APDTRANSDet.Close
    Relate:Apetiket.Close
    Relate:Apetiket1.Close
  END
  IF SELF.Opened
    INIMgr.Update('PrintEtiketRanapZebra',ProgressWindow)  ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  APH:N0_tran = APD:N0_tran                                ! Assign linking field value
  Access:APHTRANS.Fetch(APH:by_transaksi)
  JDok:Kode_Dokter = APH:dokter                            ! Assign linking field value
  Access:JDokter.Fetch(JDok:KeyKodeDokter)
  JPas:Nomor_mr = APH:Nomor_mr                             ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APH:N0_tran = APD:N0_tran                                ! Assign linking field value
  Access:APHTRANS.Fetch(APH:by_transaksi)
  JDok:Kode_Dokter = APH:dokter                            ! Assign linking field value
  Access:JDokter.Fetch(JDok:KeyKodeDokter)
  JPas:Nomor_mr = APH:Nomor_mr                             ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  vl_kali=''
  vl_hari=''
  vl_keterangan=''
  vl_ket2=''
  vl_jumlah=0
  APD2:N0_tran    =APD:N0_tran
  APD2:Kode_brg   =APD:Kode_brg
  APD2:Camp       =APD:Camp
  get(apdtransdet,APD2:KEY1)
  if not(errorcode()) then
     Ape:No=APD2:Keterangan
     access:apetiket.fetch(Ape:KEY1)
     Ape1:No=APD2:Keterangan2
     access:apetiket1.fetch(Ape1:KEY1)
     if APD2:Jumlah1<>'' or APD2:Jumlah2<>'' then
        vl_kali='X'
        vl_hari='Sehari :'
        vl_keterangan='Sehari : '&clip(APD2:Jumlah1)&' X '&clip(APD2:Jumlah2)&' '&clip(Ape:Nama)
     end
     if upper(clip(GBAR:Nama_Brg))='OBAT CAMPUR' then
        vl_jumlah=0
     else
        vl_jumlah=APD:Jumlah
     end
     vl_ket2=Ape1:Nama
     display
  end
  ReturnValue = PARENT.TakeRecord()
  IF  APH:Nomor_mr = 99999999
      APR:N0_tran = APH:N0_tran
      GET(ApReLuar,APR:by_transaksi)
      IF NOT ERRORCODE()
         loc::nama=APR:Nama
         loc::alamat=APR:Alamat
      ELSE
         loc::nama=''
         loc::alamat=''
      END
  ELSE
      JPas:Nomor_mr=APH:Nomor_mr
      get(jpasien,JPas:KeyNomorMr)
      IF NOT ERRORCODE()
         loc::nama=JPas:Nama
         loc::alamat=JPas:Alamat
      ELSE
         loc::nama=''
         loc::alamat=''
      END
  END
  ITbr:KODE_RUANG=APH:Asal
  access:itbrrwt.fetch(ITbr:KeyKodeRuang)
  
  PRINT(RPT:detail1)
  RETURN ReturnValue

