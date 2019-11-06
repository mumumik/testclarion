

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('APC6N147.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N004.INC'),ONCE        !Req'd for module callout resolution
                     END


PrintReturRawatJalan1 PROCEDURE                            ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
LOC::KOSONG          STRING(20)                            !
vl_jam               TIME                                  !
vl_catatan           STRING(20)                            !
vl_total             REAL                                  !
vl_totalhuruf        STRING(100)                           !
Process:View         VIEW(APDTRANS)
                       PROJECT(APD:Diskon)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:N0_tran)
                       PROJECT(APD:Total)
                       PROJECT(APD:ktt)
                       JOIN(APH:by_transaksi,APD:N0_tran)
                         PROJECT(APH:Asal)
                         PROJECT(APH:Biaya)
                         PROJECT(APH:N0_tran)
                         PROJECT(APH:Nomor_mr)
                         PROJECT(APH:Tanggal)
                         PROJECT(APH:Kontrak)
                         JOIN(JKon:KeyKodeKtr,APH:Kontrak)
                           PROJECT(JKon:NAMA_KTR)
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

report               REPORT,AT(3,3,203,133),PAPER(PAPER:USER,8250,5550),PRE(RPT),FONT('Arial',10,,),MM
break1                 BREAK(LOC::KOSONG)
                         HEADER,AT(0,0,,21)
                           STRING('Ins. Farmasi RSSA - RETUR  -'),AT(3,0,45,5),USE(?String11),TRN,FONT('Times New Roman',8,,FONT:regular)
                           STRING(@s5),AT(42,0,9,4),USE(GL_entryapotik),TRN,FONT('Times New Roman',8,,FONT:regular)
                           STRING('No. RM :'),AT(3,3),USE(?String20),TRN,FONT('Times New Roman',8,,FONT:regular)
                           STRING(@N010_),AT(15,3),USE(APH:Nomor_mr),TRN,FONT('Times New Roman',8,,FONT:regular)
                           STRING('--'),AT(33,3),USE(?String30),TRN,FONT('Times New Roman',8,,)
                           STRING(@s10),AT(36,3,17,5),USE(APH:Asal),FONT('Times New Roman',8,,FONT:regular)
                           STRING(@s35),AT(3,6,,5),USE(JPas:Nama),TRN,FONT('Times New Roman',8,,FONT:regular)
                           STRING(@s15),AT(3,9,,5),USE(APH:N0_tran),TRN,FONT('Times New Roman',8,,FONT:regular)
                           STRING(@D06),AT(3,12),USE(APH:Tanggal),TRN,FONT('Times New Roman',8,,FONT:regular)
                           STRING(@t04),AT(19,12),USE(vl_jam),TRN,FONT('Arial',8,,FONT:regular)
                           BOX,AT(2,16,181,5),COLOR(COLOR:Black)
                           STRING('Kode Barang'),AT(2,16,17,4),TRN,FONT('Times New Roman',8,,)
                           STRING('Nama Barang'),AT(20,16,17,4),USE(?String10),TRN,FONT('Times New Roman',8,,)
                           STRING('Catatan'),AT(82,16,10,4),USE(?String34),TRN,FONT('Times New Roman',8,,)
                           STRING('Jumlah'),AT(97,16,10,4),TRN,FONT('Times New Roman',8,,)
                           STRING('Total'),AT(114,16,9,4),TRN,FONT('Times New Roman',8,,)
                           STRING('Diskon'),AT(135,16,9,4),USE(?String29),TRN,FONT('Times New Roman',8,,)
                         END
detail1                  DETAIL,AT(,,193,4),USE(?detail1)
                           STRING(@n10.2),AT(97,0,15,4),USE(APD:Jumlah),TRN,LEFT,FONT('Times New Roman',8,,)
                           STRING(@n-14.2),AT(113,0,19,4),USE(APD:Total),TRN,RIGHT,FONT('Times New Roman',8,,)
                           STRING(@n15.2),AT(133,0,20,4),USE(APD:Diskon),RIGHT(2),FONT('Arial',8,,FONT:regular)
                           STRING(@s10),AT(2,0,17,4),USE(APD:Kode_brg),TRN,FONT('Times New Roman',8,,)
                           STRING(@s40),AT(19,0,42,4),USE(GBAR:Nama_Brg),TRN,FONT('Times New Roman',8,,)
                           STRING(@n3),AT(91,0),USE(APD:ktt),HIDE
                           STRING(@s5),AT(82,0),USE(vl_catatan),FONT('Times New Roman',8,,,CHARSET:ANSI)
                         END
                         FOOTER,AT(0,0,,29)
                           STRING(@n-14.2),AT(113,1,19,4),SUM,RESET(break1),USE(APD:Total,,?APD:Total:2),TRN,RIGHT,FONT('Times New Roman',8,,FONT:regular)
                           STRING(@n15.2),AT(133,1,20,4),SUM,RESET(break1),USE(APD:Diskon,,?APD:Diskon:2),TRN,RIGHT(2),FONT('Arial',8,,FONT:regular)
                           STRING('Petugas Apotik'),AT(142,13),USE(?String27),TRN,FONT('Times New Roman',8,,)
                           STRING(@s100),AT(93,9,,4),USE(vl_totalhuruf),FONT('Times New Roman',7,,,CHARSET:ANSI)
                           STRING('2. Akuntansi'),AT(5,4),USE(?String25),TRN,HIDE,FONT('Times New Roman',8,,)
                           STRING(@s10),AT(142,18,17,3),USE(Glo:USER_ID),TRN,CENTER,FONT('Times New Roman',8,,)
                           STRING(@s100),AT(122,24,52,4),USE(JKon:NAMA_KTR),FONT('Arial',8,,FONT:regular)
                           STRING('(.{26})'),AT(140,20),USE(?String28:3),TRN,FONT('Times New Roman',8,,)
                           STRING('3. Arsip'),AT(5,7),USE(?String26),TRN,HIDE,FONT('Times New Roman',8,,)
                           STRING('Total : Rp.'),AT(82,6,16,4),USE(?String17),TRN,FONT('Times New Roman',8,,)
                           STRING(@n-14.2),AT(112,6,20,4),USE(APH:Biaya),TRN,RIGHT,FONT('Times New Roman',8,,FONT:regular)
                           STRING('Terbilang :'),AT(82,9,16,4),USE(?String17:4),TRN,FONT('Times New Roman',7,,)
                           STRING('1. Ybs.'),AT(5,1),USE(?String24),TRN,HIDE,FONT('Times New Roman',8,,)
                           LINE,AT(1,0,181,0),USE(?Line9),COLOR(COLOR:Black)
                           LINE,AT(113,5,37,0),USE(?Line6),COLOR(COLOR:Black)
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
  GlobalErrors.SetProcedureName('PrintReturRawatJalan1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('vl_catatan',vl_catatan)                            ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  vl_total=round(APH:Biaya,1)
  if vl_total<0 then
      vl_totalhuruf='MINUS '&clip(angkaketulisan(vl_total*-1))&' RUPIAH'
  else
      vl_totalhuruf=clip(angkaketulisan(vl_total))&' RUPIAH'
  end
  vl_jam = CLOCK()
  Relate:APDTRANS.Open                                     ! File JPasien used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintReturRawatJalan1',ProgressWindow)     ! Restore window settings from non-volatile store
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
    INIMgr.Update('PrintReturRawatJalan1',ProgressWindow)  ! Save window data to non-volatile store
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
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  vl_catatan=''
  if APD:ktt=1 then
      vl_catatan='KTT'
      APD:Total = 0
  end
  PRINT(RPT:detail1)
  RETURN ReturnValue

