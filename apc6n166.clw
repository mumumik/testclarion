

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('APC6N166.INC'),ONCE        !Local module procedure declarations
                     END


PrintTransReturRawatJalanPerObatA5 PROCEDURE               ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
LOC::KOSONG          STRING(20)                            !
loc::nama            STRING(30)                            !
loc::alamat          STRING(30)                            !
vl_jam               TIME                                  !
vl_disk              REAL                                  !
Process:View         VIEW(APDTRANS)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:N0_tran)
                       PROJECT(APD:Total)
                       JOIN(APH:by_transaksi,APD:N0_tran)
                         PROJECT(APH:Asal)
                         PROJECT(APH:Jam)
                         PROJECT(APH:N0_tran)
                         PROJECT(APH:NoNota)
                         PROJECT(APH:Nomor_mr)
                         PROJECT(APH:Tanggal)
                         PROJECT(APH:cara_bayar)
                         PROJECT(APH:Kontrak)
                         PROJECT(APH:dokter)
                         JOIN(JKon:KeyKodeKtr,APH:Kontrak)
                           PROJECT(JKon:NAMA_KTR)
                         END
                         JOIN(JDok:KeyKodeDokter,APH:dokter)
                           PROJECT(JDok:Nama_Dokter)
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

report               REPORT,AT(5,46,108,141),PAPER(PAPER:USER,4740,7890),PRE(RPT),FONT('Arial',10,,),MM
                       HEADER,AT(5,7,109,39),FONT('Times New Roman',8,,FONT:regular)
                         STRING('RS. Harapan Mulia - Apotik'),AT(2,1,45,4),USE(?String11),TRN,FONT('Times New Roman',8,,FONT:regular)
                         STRING(@N010_),AT(15,9,17,4),USE(APH:Nomor_mr),FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                         STRING(@s10),AT(37,9,17,4),USE(APH:Asal),FONT('Times New Roman',8,,FONT:regular)
                         STRING('Nama'),AT(2,13,12,4),USE(?String20:2),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                         STRING('No. RM'),AT(2,9,12,4),USE(?String20),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                         STRING(@D06),AT(77,21,15,4),USE(APH:Tanggal),FONT('Times New Roman',8,,FONT:regular)
                         STRING('Penjamin'),AT(2,25,12,4),USE(?String20:7),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                         STRING(@s100),AT(15,25),USE(JKon:NAMA_KTR,,?JKon:NAMA_KTR:2)
                         STRING('Jam'),AT(64,25,12,4),USE(?String20:9),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                         STRING(@t04),AT(77,25,13,4),USE(APH:Jam),FONT('Arial',8,,FONT:regular)
                         STRING('No. Bill'),AT(64,17,12,4),USE(?String20:6),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                         STRING('Dokter'),AT(2,21,12,4),USE(?String20:5),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                         STRING(@s30),AT(15,17,42,4),USE(loc::alamat),TRN,FONT('Times New Roman',8,,FONT:regular)
                         STRING(@s30),AT(15,21,33,4),USE(JDok:Nama_Dokter),FONT('Times New Roman',8,,FONT:regular)
                         STRING('Tanggal'),AT(64,21,12,4),USE(?String20:8),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                         STRING(@s10),AT(77,17,18,4),USE(APH:NoNota)
                         STRING(@n1),AT(57,13,5,4),USE(APH:cara_bayar)
                         STRING('No. Trans'),AT(64,13,12,4),USE(?String20:4),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                         BOX,AT(1,34,107,5),COLOR(COLOR:Black)
                         STRING('Nama '),AT(19,34,17,4),USE(?String10),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         STRING(@s5),AT(38,1,9,4),USE(GL_entryapotik),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                         STRING('Jumlah'),AT(59,34,10,4),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         STRING('Total'),AT(75,34,9,4),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         STRING('Keterangan'),AT(88,34,16,4),USE(?String36),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         STRING('Kode '),AT(2,34,14,4),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         STRING(@s15),AT(77,13,25,4),USE(APH:N0_tran),FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                         STRING(@s30),AT(15,13,48,4),USE(loc::nama),TRN,FONT('Times New Roman',8,,FONT:regular)
                         STRING('Alamat'),AT(2,17,12,4),USE(?String20:3),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                       END
break1                 BREAK(LOC::KOSONG)
detail1                  DETAIL,AT(,,108,4),USE(?detail1)
                           STRING(@n5.1),AT(60,0,9,4),USE(APD:Jumlah),TRN,LEFT,FONT('Times New Roman',8,,)
                           STRING(@n-14.2),AT(68,0,19,4),USE(APD:Total),TRN,RIGHT,FONT('Times New Roman',8,,)
                           STRING(@s10),AT(0,0,17,4),USE(APD:Kode_brg),TRN,FONT('Times New Roman',8,,)
                           STRING(@s40),AT(17,0,41,4),USE(GBAR:Nama_Brg),TRN,FONT('Times New Roman',8,,)
                         END
                         FOOTER,AT(0,0,,17),FONT('Times New Roman',8,,FONT:regular)
                           STRING('Petugas Apotik'),AT(64,5),USE(?String27),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING(@s10),AT(65,13,17,3),USE(Glo:USER_ID),TRN,CENTER,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('Total : Rp.'),AT(52,1,16,4),USE(?String17),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           LINE,AT(0,0,90,0),USE(?Line9),COLOR(COLOR:Black)
                           STRING(@n-15.2),AT(68,1,19,4),SUM,RESET(break1),USE(APD:Total,,?APD:Total:2),TRN,RIGHT,FONT('Times New Roman',8,,)
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
  GlobalErrors.SetProcedureName('PrintTransReturRawatJalanPerObatA5')
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
  INIMgr.Fetch('PrintTransReturRawatJalanPerObatA5',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:APDTRANS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, APD:N0_tran)
  ThisReport.AddSortOrder(APD:by_transaksi)
  ThisReport.AddRange(APD:N0_tran,Relate:APDTRANS,Relate:APHTRANS)
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
    INIMgr.Update('PrintTransReturRawatJalanPerObatA5',ProgressWindow) ! Save window data to non-volatile store
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
  JKon:KODE_KTR = APH:Kontrak                              ! Assign linking field value
  Access:JKontrak.Fetch(JKon:KeyKodeKtr)
  JDok:Kode_Dokter = APH:dokter                            ! Assign linking field value
  Access:JDokter.Fetch(JDok:KeyKodeDokter)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APH:N0_tran = APD:N0_tran                                ! Assign linking field value
  Access:APHTRANS.Fetch(APH:by_transaksi)
  JKon:KODE_KTR = APH:Kontrak                              ! Assign linking field value
  Access:JKontrak.Fetch(JKon:KeyKodeKtr)
  JDok:Kode_Dokter = APH:dokter                            ! Assign linking field value
  Access:JDokter.Fetch(JDok:KeyKodeDokter)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
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

