

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('APC6N119.INC'),ONCE        !Local module procedure declarations
                     END


PrintTransRawatJalan PROCEDURE                             ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
LOC::KOSONG          STRING(20)                            !
loc::nama            STRING(30)                            !
loc::alamat          STRING(30)                            !
vl_jam               TIME                                  !
vl_disk              REAL                                  !
Process:View         VIEW(APDTRANS)
                       PROJECT(APD:Diskon)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:N0_tran)
                       PROJECT(APD:Total)
                       JOIN(APH:by_transaksi,APD:N0_tran)
                         PROJECT(APH:Asal)
                         PROJECT(APH:Biaya)
                         PROJECT(APH:Jam)
                         PROJECT(APH:N0_tran)
                         PROJECT(APH:NoNota)
                         PROJECT(APH:Nomor_mr)
                         PROJECT(APH:Tanggal)
                         PROJECT(APH:cara_bayar)
                         PROJECT(APH:dokter)
                         PROJECT(APH:Kontrak)
                         JOIN(JDok:KeyKodeDokter,APH:dokter)
                           PROJECT(JDok:Nama_Dokter)
                         END
                         JOIN(JKon:KeyKodeKtr,APH:Kontrak)
                           PROJECT(JKon:NAMA_KTR)
                         END
                       END
                       JOIN(GBAR:KeyKodeBrg,APD:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(10,40,80,1997),PAPER(PAPER:USER,8250,20000),PRE(RPT),FONT('Arial',10,,),MM
                       HEADER,AT(10,7,80,33)
                         STRING('Ins. Farmasi - SBBK Rawat Jalan -'),AT(2,1,45,4),USE(?String11),TRN,FONT('Times New Roman',8,,FONT:regular)
                         STRING(@N010_),AT(15,4,17,4),USE(APH:Nomor_mr),TRN,FONT('Times New Roman',8,,FONT:regular)
                         STRING('--'),AT(32,4,2,4),USE(?String30),TRN,FONT('Times New Roman',8,,)
                         STRING(@s10),AT(36,4,17,4),USE(APH:Asal),TRN,FONT('Times New Roman',8,,FONT:regular)
                         STRING('No. RM :'),AT(2,4,12,4),USE(?String20),TRN,FONT('Times New Roman',8,,FONT:regular)
                         STRING(@D06),AT(27,15,15,4),USE(APH:Tanggal),TRN,FONT('Times New Roman',8,,FONT:regular)
                         STRING(@t04),AT(43,15,13,4),USE(APH:Jam),TRN,FONT('Arial',8,,FONT:regular)
                         STRING(@s30),AT(2,19,28,4),USE(JDok:Nama_Dokter),TRN,FONT('Times New Roman',8,,FONT:regular)
                         STRING(@s10),AT(32,19,17,4),USE(APH:NoNota),FONT('Times New Roman',8,,FONT:regular)
                         STRING(@n1),AT(51,19,5,4),USE(APH:cara_bayar)
                         BOX,AT(1,23,58,10),COLOR(COLOR:Black)
                         LINE,AT(1,28,58,0),USE(?Line11),COLOR(COLOR:Black)
                         LINE,AT(18,28,0,5),COLOR(COLOR:Black)
                         LINE,AT(18,23,0,5),USE(?Line5),COLOR(COLOR:Black)
                         LINE,AT(38,28,0,5),COLOR(COLOR:Black)
                         STRING('Diskon'),AT(40,28,9,4),USE(?String29),TRN,FONT('Times New Roman',8,,)
                         STRING('Nama Barang'),AT(19,23,17,4),USE(?String10),TRN,FONT('Times New Roman',8,,)
                         STRING(@s5),AT(47,1,9,4),USE(GL_entryapotik),TRN,FONT('Times New Roman',8,,FONT:regular)
                         STRING('Jumlah'),AT(2,28,10,4),TRN,FONT('Times New Roman',8,,)
                         STRING('Total'),AT(19,28,9,4),TRN,FONT('Times New Roman',8,,)
                         STRING('Kode Barang'),AT(2,23,17,4),TRN,FONT('Times New Roman',8,,)
                         STRING(@s15),AT(2,15,25,4),USE(APH:N0_tran),TRN,FONT('Times New Roman',8,,FONT:regular)
                         STRING(@s30),AT(2,8,57,4),USE(loc::nama),TRN,FONT('Times New Roman',8,,FONT:regular)
                         STRING(@s30),AT(2,11,49,4),USE(loc::alamat),TRN,FONT('Times New Roman',8,,FONT:regular)
                       END
break1                 BREAK(LOC::KOSONG)
detail1                  DETAIL,AT(,,116,8),USE(?detail1)
                           STRING(@n10.2),AT(2,3,15,4),USE(APD:Jumlah),TRN,LEFT,FONT('Times New Roman',8,,)
                           STRING(@n-14.2),AT(18,3,19,4),USE(APD:Total),TRN,RIGHT,FONT('Times New Roman',8,,)
                           STRING(@n-15.2),AT(38,3,17,4),USE(APD:Diskon),TRN,RIGHT(2),FONT('Times New Roman',8,,FONT:regular)
                           STRING(@n2),AT(53,3,6,4),USE(vl_disk),TRN,RIGHT(2),FONT('Times New Roman',8,,FONT:regular)
                           STRING('%'),AT(58,3,3,4),USE(?String20:2),TRN,FONT('Times New Roman',8,,FONT:regular)
                           STRING(@s10),AT(2,0,17,4),USE(APD:Kode_brg),TRN,FONT('Times New Roman',8,,)
                           STRING(@s40),AT(19,0,42,4),USE(GBAR:Nama_Brg),TRN,FONT('Times New Roman',8,,)
                         END
                         FOOTER,AT(0,0,,32)
                           STRING(@n-14.2),AT(18,1,19,4),SUM,RESET(break1),USE(APD:Total,,?APD:Total:2),TRN,RIGHT,FONT('Times New Roman',8,,FONT:regular)
                           STRING('-'),AT(38,1,1,4),USE(?String17:2),TRN,FONT('Times New Roman',8,,)
                           STRING(@n-15.2),AT(38,1,17,4),SUM,RESET(break1),USE(APD:Diskon,,?APD:Diskon:2),TRN,RIGHT(2),FONT('Times New Roman',8,,FONT:regular)
                           STRING('Petugas Apotik'),AT(21,11),USE(?String27),TRN,FONT('Times New Roman',8,,)
                           STRING('2. Akuntansi'),AT(1,4),USE(?String25),TRN,FONT('Times New Roman',8,,)
                           STRING(@s10),AT(22,19,17,3),USE(Glo:USER_ID),TRN,CENTER,FONT('Times New Roman',8,,)
                           STRING(@s100),AT(1,24,63,4),USE(JKon:NAMA_KTR),FONT(,8,,)
                           STRING('Harga barang sudah termasuk PPN'),AT(1,27),USE(?String38),TRN,FONT('Times New Roman',8,,FONT:regular)
                           STRING('(.{26})'),AT(19,20,23,4),USE(?String28:3),TRN,FONT('Times New Roman',8,,)
                           STRING('3. Arsip'),AT(1,7),USE(?String26),TRN,FONT('Times New Roman',8,,)
                           STRING('Total : Rp.'),AT(20,6,16,4),USE(?String17),TRN,FONT('Times New Roman',8,,)
                           STRING(@n-14.2),AT(35,6,20,4),USE(APH:Biaya),TRN,RIGHT(2),FONT('Times New Roman',8,,FONT:regular)
                           STRING('1. Ybs.'),AT(1,1),USE(?String24),TRN,FONT('Times New Roman',8,,)
                           LINE,AT(0,0,122,0),USE(?Line9),COLOR(COLOR:Black)
                           LINE,AT(20,5,37,0),USE(?Line6),COLOR(COLOR:Black)
                           STRING('='),AT(58,3,1,4),USE(?String17:3),TRN,FONT('Times New Roman',8,,)
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
  GlobalErrors.SetProcedureName('PrintTransRawatJalan')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  vl_jam = CLOCK()
  Relate:APDTRANS.Open                                     ! File JTransaksi used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ApReLuar.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JTransaksi.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintTransRawatJalan',ProgressWindow)      ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:APDTRANS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, APD:N0_tran)
  ThisReport.AddSortOrder(APD:by_transaksi)
  ThisReport.AddRange(APD:N0_tran,glo::no_nota)
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
  END
  IF SELF.Opened
    INIMgr.Update('PrintTransRawatJalan',ProgressWindow)   ! Save window data to non-volatile store
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
  JKon:KODE_KTR = APH:Kontrak                              ! Assign linking field value
  Access:JKontrak.Fetch(JKon:KeyKodeKtr)
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
  JKon:KODE_KTR = APH:Kontrak                              ! Assign linking field value
  Access:JKontrak.Fetch(JKon:KeyKodeKtr)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  !IF  APH:Nomor_mr = 99999999 or APH:Nomor_mr =0
  !    APR:N0_tran = APH:N0_tran
  !    GET(ApReLuar,APR:by_transaksi)
  !    IF NOT ERRORCODE()
  !       loc::nama=APR:Nama
  !       loc::alamat=APR:Alamat
  !    ELSE
  !       loc::nama=''
  !       loc::alamat=''
  !    END
  !ELSE
  !    JPas:Nomor_mr=APH:Nomor_mr
  !    get(jpasien,JPas:KeyNomorMr)
  !    IF NOT ERRORCODE()
  !       loc::nama=JPas:Nama
  !       loc::alamat=JPas:Alamat
  !    ELSE
  !       loc::nama=''
  !       loc::alamat=''
  !    END
  !END
  !
  IF  APH:Nomor_mr = 99999999
      JTra:No_Nota=APH:NoNota
      access:jtransaksi.fetch(JTra:KeyNoNota)
      loc::nama=JTra:NamaJawab
      loc::alamat=JTra:AlamatJawab
  !    APR:N0_tran = APH:N0_tran
  !    GET(ApReLuar,APR:by_transaksi)
  !    IF NOT ERRORCODE()
  !       loc::nama=APR:Nama
  !       loc::alamat=APR:Alamat
  !    ELSE
  !       loc::nama=''
  !       loc::alamat=''
  !    END
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
  if APD:Diskon<>0 then
     vl_disk=(APD:Diskon/APD:Total)*100
  else
     vl_disk=0
  end
  display
  PRINT(RPT:detail1)
  RETURN ReturnValue
