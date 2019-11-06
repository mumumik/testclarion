

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('APC6N168.INC'),ONCE        !Local module procedure declarations
                     END


PrintTransRawatInapA5bpjs PROCEDURE                        ! Generated from procedure template - Report

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
                       JOIN(APHB:by_transaksi,APD:N0_tran)
                         PROJECT(APHB:Asal)
                         PROJECT(APHB:Jam)
                         PROJECT(APHB:N0_tran)
                         PROJECT(APHB:NoNota)
                         PROJECT(APHB:Nomor_mr)
                         PROJECT(APHB:Tanggal)
                         PROJECT(APHB:cara_bayar)
                         PROJECT(APHB:dokter)
                         PROJECT(APHB:Kontrak)
                         JOIN(JDok:KeyKodeDokter,APHB:dokter)
                           PROJECT(JDok:Nama_Dokter)
                         END
                         JOIN(JKon:KeyKodeKtr,APHB:Kontrak)
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

report               REPORT,AT(5,1,203,135),PAPER(PAPER:USER,8250,5550),PRE(RPT),FONT('Arial',10,,),MM
break1                 BREAK(LOC::KOSONG)
                         HEADER,AT(0,0,193,24),FONT('Times New Roman',8,,,CHARSET:ANSI)
                           STRING('RS. Sartika Asih - Apotik'),AT(2,0,45,4),USE(?String11),TRN,FONT('Times New Roman',8,,FONT:regular)
                           STRING(@s5),AT(40,0,9,4),USE(GL_entryapotik),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING('No. RM'),AT(2,3,12,4),USE(?String20),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING(@N010_),AT(15,3,17,4),USE(APHB:Nomor_mr)
                           STRING(@s10),AT(40,3,17,4),USE(APHB:Asal)
                           STRING(@n1),AT(59,3,3,4),USE(APHB:cara_bayar)
                           STRING('No. Trans'),AT(2,6,12,4),USE(?String20:4),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING(@s15),AT(15,6,,4),USE(APHB:N0_tran)
                           STRING('Nama'),AT(48,6,12,4),USE(?String20:2),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING(@s30),AT(61,6,,4),USE(loc::nama),TRN,FONT('Times New Roman',8,,FONT:regular)
                           STRING('No. Bill'),AT(2,9,12,4),USE(?String20:6),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING(@s10),AT(15,9,,4),USE(APHB:NoNota)
                           STRING('Alamat'),AT(48,9,12,4),USE(?String20:3),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING(@s30),AT(61,9,,4),USE(loc::alamat),TRN,FONT('Times New Roman',8,,FONT:regular)
                           STRING('Tanggal'),AT(2,12,12,4),USE(?String20:8),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING(@D06),AT(15,12,,4),USE(APHB:Tanggal)
                           STRING('Dokter'),AT(48,12,12,4),USE(?String20:5),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING(@s30),AT(61,12,,4),USE(JDok:Nama_Dokter),FONT('Times New Roman',8,,FONT:regular)
                           STRING('Jam'),AT(2,15,12,4),USE(?String20:9),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING(@t04),AT(15,15),USE(APHB:Jam)
                           STRING('Penjamin'),AT(48,15,12,4),USE(?String20:7),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING(@s100),AT(61,15),USE(JKon:NAMA_KTR,,?JKon:NAMA_KTR:2)
                           BOX,AT(1,19,189,5),COLOR(COLOR:Black)
                           STRING('Kode '),AT(2,19,14,4),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('Nama '),AT(22,19,17,4),USE(?String10),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('Jumlah'),AT(114,19,10,4),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('Total'),AT(137,19,9,4),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('Keterangan'),AT(158,19,16,4),USE(?String36),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         END
detail1                  DETAIL,AT(,,193,4),USE(?detail1),FONT('Times New Roman',8,,,CHARSET:ANSI)
                           STRING(@n5.1),AT(114,0,9,4),USE(APD:Jumlah),TRN,LEFT,FONT('Times New Roman',8,,)
                           STRING(@N-15.2),AT(128,0,,4),USE(APD:Total),TRN,RIGHT,FONT('Times New Roman',8,,)
                           STRING(@s10),AT(2,0,17,4),USE(APD:Kode_brg),TRN,FONT('Times New Roman',8,,)
                           STRING(@s40),AT(22,0,41,4),USE(GBAR:Nama_Brg),TRN,FONT('Times New Roman',8,,)
                         END
                         FOOTER,AT(0,0,,4),FONT('Times New Roman',8,,FONT:regular)
                           STRING('Petugas Apotik'),AT(1,0),USE(?String27),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING(@s10),AT(21,0,17,3),USE(Glo:USER_ID),TRN,CENTER,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('Total : Rp.'),AT(113,0,16,4),USE(?String17),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           LINE,AT(1,0,189,0),USE(?Line9),COLOR(COLOR:Black)
                           STRING(@n-15.2),AT(128,0,,4),SUM,RESET(break1),USE(APD:Total,,?APD:Total:2),TRN,RIGHT,FONT('Times New Roman',8,,)
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
  GlobalErrors.SetProcedureName('PrintTransRawatInapA5bpjs')
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
  INIMgr.Fetch('PrintTransRawatInapA5bpjs',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:APDTRANS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, APD:N0_tran)
  ThisReport.AddSortOrder(APD:by_transaksi)
  ThisReport.AddRange(APD:N0_tran,Relate:APDTRANS,Relate:APHTRANSBPJS)
  ThisReport.SetFilter('APD:total<<>0')
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
    INIMgr.Update('PrintTransRawatInapA5bpjs',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  APHB:N0_tran = APD:N0_tran                               ! Assign linking field value
  Access:APHTRANSBPJS.Fetch(APHB:by_transaksi)
  JDok:Kode_Dokter = APHB:dokter                           ! Assign linking field value
  Access:JDokter.Fetch(JDok:KeyKodeDokter)
  JKon:KODE_KTR = APHB:Kontrak                             ! Assign linking field value
  Access:JKontrak.Fetch(JKon:KeyKodeKtr)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APHB:N0_tran = APD:N0_tran                               ! Assign linking field value
  Access:APHTRANSBPJS.Fetch(APHB:by_transaksi)
  JDok:Kode_Dokter = APHB:dokter                           ! Assign linking field value
  Access:JDokter.Fetch(JDok:KeyKodeDokter)
  JKon:KODE_KTR = APHB:Kontrak                             ! Assign linking field value
  Access:JKontrak.Fetch(JKon:KeyKodeKtr)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  IF  APHB:Nomor_mr = 99999999
      JTra:No_Nota=APHB:NoNota
      access:jtransaksi.fetch(JTra:KeyNoNota)
      loc::nama=JTra:NamaJawab
      loc::alamat=JTra:AlamatJawab
  ELSE
      JPas:Nomor_mr=APHB:Nomor_mr
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

