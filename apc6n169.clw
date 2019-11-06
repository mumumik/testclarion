

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('APC6N169.INC'),ONCE        !Local module procedure declarations
                     END


Cetak_nota_apotik11bpjs PROCEDURE                          ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
vl_jam               TIME                                  !
Process:View         VIEW(APHTRANSBPJS)
                       PROJECT(APHB:Biaya)
                       PROJECT(APHB:N0_tran)
                       PROJECT(APHB:Nomor_mr)
                       PROJECT(APHB:Tanggal)
                       PROJECT(APHB:User)
                       PROJECT(APHB:Kode_Apotik)
                       JOIN(GAPO:KeyNoApotik,APHB:Kode_Apotik)
                         PROJECT(GAPO:Nama_Apotik)
                       END
                       JOIN(JPas:KeyNomorMr,APHB:Nomor_mr)
                         PROJECT(JPas:Nama)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(10,3,150,146),PAPER(PAPER:USER,4000,3500),PRE(RPT),FONT('Times New Roman',10,COLOR:Black,),MM
detail1                DETAIL,AT(,,66,46),USE(?detail1)
                         STRING('Ins. Farmasi'),AT(1,1),USE(?String21),TRN,FONT('Times New Roman',8,,)
                         STRING(@D06),AT(30,1),USE(APHB:Tanggal)
                         STRING('Transaksi obat Rawat Inap'),AT(1,5,41,4),LEFT,FONT('Times New Roman',8,,)
                         BOX,AT(1,13,60,6),USE(?Box1),COLOR(COLOR:Black)
                         STRING('Nomor RM      :'),AT(1,9,25,4),TRN,FONT('Times New Roman',8,,)
                         STRING(@N010_),AT(23,9,20,4),USE(APHB:Nomor_mr)
                         STRING(@s35),AT(3,14,56,4),USE(JPas:Nama),FONT('Times New Roman',8,,)
                         STRING('Total Penagihan  :  Rp.'),AT(1,20,30,4),TRN,FONT('Times New Roman',8,,)
                         STRING(@n-14),AT(30,20,35,4),USE(APHB:Biaya),DECIMAL(14)
                         STRING('No. Transaksi  :'),AT(1,24,23,4),TRN,FONT('Times New Roman',10,,)
                         STRING(@t04),AT(49,1),USE(vl_jam),FONT('Arial',8,,FONT:regular)
                         STRING(@s30),AT(16,28,49,5),USE(GAPO:Nama_Apotik),FONT('Times New Roman',8,,)
                         STRING(@s15),AT(27,24,25,4),USE(APHB:N0_tran)
                         STRING('Penanggung Jawab'),AT(37,32,24,4),TRN,FONT('Times New Roman',8,,)
                         STRING(@s4),AT(43,40),USE(APHB:User)
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
  GlobalErrors.SetProcedureName('Cetak_nota_apotik11bpjs')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  vl_jam = CLOCK()
  Relate:APHTRANSBPJS.Open                                 ! File APHTRANSBPJS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Cetak_nota_apotik11bpjs',ProgressWindow)   ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:APHTRANSBPJS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, APHB:N0_tran)
  ThisReport.AddSortOrder(APHB:by_transaksi)
  ThisReport.AddRange(APHB:N0_tran,APHB:N0_tran)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report)
  ?Progress:UserString{Prop:Text}=''
  Relate:APHTRANSBPJS.SetQuickScan(1,Propagate:OneMany)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APHTRANSBPJS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Cetak_nota_apotik11bpjs',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  GAPO:Kode_Apotik = APHB:Kode_Apotik                      ! Assign linking field value
  Access:GApotik.Fetch(GAPO:KeyNoApotik)
  JPas:Nomor_mr = APHB:Nomor_mr                            ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  GAPO:Kode_Apotik = APHB:Kode_Apotik                      ! Assign linking field value
  Access:GApotik.Fetch(GAPO:KeyNoApotik)
  JPas:Nomor_mr = APHB:Nomor_mr                            ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail1)
  RETURN ReturnValue

