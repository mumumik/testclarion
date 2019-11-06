

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('APC6N122.INC'),ONCE        !Local module procedure declarations
                     END


PrintReturRawatInap1CD PROCEDURE                           ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
LOC::KOSONG          STRING(20)                            !
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
                         PROJECT(APH:N0_tran)
                         PROJECT(APH:Nomor_mr)
                         PROJECT(APH:Tanggal)
                         PROJECT(APH:Kontrak)
                         JOIN(JPas:KeyNomorMr,APH:Nomor_mr)
                           PROJECT(JPas:Nama)
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

report               REPORT,AT(10,37,80,2000),PAPER(PAPER:USER,8250,30000),PRE(RPT),FONT('Arial',10,,),MM
                       HEADER,AT(10,7,80,28)
                         STRING('Ins. Farmasi - RETUR Rawat Inap -'),AT(2,1,47,5),USE(?String11),TRN,FONT('Times New Roman',8,,FONT:regular)
                         STRING(@N010_),AT(14,5),USE(APH:Nomor_mr),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                         STRING('--'),AT(32,5),USE(?String30),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         STRING(@s10),AT(36,5,17,5),USE(APH:Asal),FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                         STRING('No. RM :'),AT(2,5),USE(?String20),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                         STRING(@D06),AT(26,13),USE(APH:Tanggal),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                         STRING(@t04),AT(41,13),USE(vl_jam),TRN,FONT('Arial',8,COLOR:Black,FONT:regular)
                         BOX,AT(1,18,58,10),COLOR(COLOR:Black)
                         LINE,AT(1,23,58,0),USE(?Line11),COLOR(COLOR:Black)
                         LINE,AT(18,23,0,5),COLOR(COLOR:Black)
                         LINE,AT(18,18,0,5),USE(?Line5),COLOR(COLOR:Black)
                         LINE,AT(38,23,0,5),COLOR(COLOR:Black)
                         STRING('Diskon'),AT(40,23,9,4),USE(?String29),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         STRING('Nama Barang'),AT(19,18,17,4),USE(?String10),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         STRING(@s5),AT(51,1,9,4),USE(GL_entryapotik),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                         STRING('Jumlah'),AT(2,23,10,4),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         STRING('Total'),AT(19,23,9,4),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         STRING('Kode Barang'),AT(2,18,17,4),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         STRING(@s15),AT(2,13,25,5),USE(APH:N0_tran),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                         STRING(@s35),AT(2,9,57,5),USE(JPas:Nama),TRN,FONT('Times New Roman',8,,FONT:regular)
                       END
break1                 BREAK(LOC::KOSONG)
detail1                  DETAIL,AT(,,184,8),USE(?detail1)
                           STRING(@n10.2),AT(2,3,15,4),USE(APD:Jumlah),TRN,LEFT,FONT('Times New Roman',8,COLOR:Black,)
                           STRING(@n-14.2),AT(18,3,19,4),USE(APD:Total),TRN,RIGHT,FONT('Times New Roman',8,COLOR:Black,)
                           STRING(@n-12.2),AT(38,3,15,5),USE(APD:Diskon),RIGHT,FONT('Arial',8,,FONT:regular)
                           STRING(@n2),AT(54,3,5,5),USE(vl_disk),TRN,RIGHT(2),FONT('Times New Roman',8,,FONT:regular)
                           STRING('%'),AT(57,3),USE(?String20:2),TRN,FONT('Times New Roman',8,,FONT:regular)
                           STRING(@s10),AT(2,0,17,4),USE(APD:Kode_brg),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING(@s40),AT(19,0,42,4),USE(GBAR:Nama_Brg),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         END
                         FOOTER,AT(0,0,,29)
                           STRING(@n-14.2),AT(18,1,19,4),SUM,RESET(break1),USE(APD:Total,,?APD:Total:2),TRN,RIGHT,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING('-'),AT(37,1,1,4),USE(?String17:2),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING(@n-15.2),AT(38,1,15,4),SUM,RESET(break1),USE(APD:Diskon,,?APD:Diskon:2),TRN,RIGHT,FONT('Arial',8,COLOR:Black,FONT:regular)
                           STRING('Petugas Apotik'),AT(8,11),USE(?String27),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('Diterima Oleh,'),AT(32,11,19,5),USE(?String27:2),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('2. Akuntansi'),AT(1,4),USE(?String25),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('(.{26})'),AT(30,20),USE(?String28:2),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING(@s100),AT(1,24,52,4),USE(JKon:NAMA_KTR),FONT('Arial',8,COLOR:Black,FONT:regular)
                           STRING(@s10),AT(9,19,17,3),USE(Glo:USER_ID),TRN,CENTER,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('(.{26})'),AT(6,20),USE(?String28:3),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('3. Arsip'),AT(1,7),USE(?String26),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('Total : Rp.'),AT(19,6,16,4),USE(?String17),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING(@n-14.2),AT(33,6,20,4),USE(APH:Biaya),TRN,RIGHT,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING('1. Perawat'),AT(1,1),USE(?String24),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           LINE,AT(0,0,122,0),USE(?Line9),COLOR(COLOR:Black)
                           LINE,AT(18,5,37,0),USE(?Line6),COLOR(COLOR:Black)
                           STRING('='),AT(56,3,1,4),USE(?String17:3),TRN,FONT('Times New Roman',8,COLOR:Black,)
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
  GlobalErrors.SetProcedureName('PrintReturRawatInap1CD')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo:nomor',glo:nomor)                              ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  vl_jam = CLOCK()
  Relate:APDTRANS.Open                                     ! File JPasien used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintReturRawatInap1CD',ProgressWindow)    ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:APDTRANS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, APD:N0_tran)
  ThisReport.AddSortOrder(APD:by_transaksi)
  ThisReport.SetFilter('APD:N0_tran=glo:nomor')
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
    INIMgr.Update('PrintReturRawatInap1CD',ProgressWindow) ! Save window data to non-volatile store
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
  JPas:Nomor_mr = APH:Nomor_mr                             ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
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
  JPas:Nomor_mr = APH:Nomor_mr                             ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
  JKon:KODE_KTR = APH:Kontrak                              ! Assign linking field value
  Access:JKontrak.Fetch(JKon:KeyKodeKtr)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  if APD:Diskon<>0 then
     vl_disk=(APD:Diskon/APD:Total)*100
  else
     vl_disk=0
  end
  display
  PRINT(RPT:detail1)
  RETURN ReturnValue

