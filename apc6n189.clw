

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('APC6N189.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N049.INC'),ONCE        !Req'd for module callout resolution
                     END


LaporanPenjualanPerPasienPerObatRajal PROCEDURE            ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
vl_break             STRING(20)                            !
vl_no                LONG                                  !
vl_harga_beli        REAL                                  !
vl_harga_jual        REAL                                  !
vl_hpp               REAL                                  !
vl_margin            REAL                                  !
Process:View         VIEW(JHBILLING)
                       PROJECT(JHB:NOMOR)
                       PROJECT(JHB:TUTUP)
                       PROJECT(JHB:TglTutup)
                       JOIN(APH:nonota_aphtras_key,JHB:NOMOR)
                         PROJECT(APH:N0_tran)
                         PROJECT(APH:Tanggal)
                         PROJECT(APH:Nomor_mr)
                         JOIN(JPas:KeyNomorMr,APH:Nomor_mr)
                           PROJECT(JPas:Nama)
                           PROJECT(JPas:Nomor_mr)
                         END
                         JOIN(APD:notran_kode,APH:N0_tran)
                           PROJECT(APD:Harga_Dasar)
                           PROJECT(APD:Jumlah)
                           PROJECT(APD:N0_tran)
                           PROJECT(APD:Total)
                           PROJECT(APD:Kode_brg)
                           JOIN(GBAR:KeyKodeBrg,APD:Kode_brg)
                             PROJECT(GBAR:Nama_Brg)
                           END
                         END
                       END
                     END
ReportPageNumber     LONG,AUTO
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(25,50,156,192),PAPER(PAPER:A4),PRE(RPT),FONT('Arial',10,,FONT:regular,CHARSET:ANSI),MM
                       HEADER,AT(25,25,156,18),USE(?Header)
                         STRING('Rumah Sakit Harapan Mulia'),AT(1,1),USE(?String26),TRN,FONT('Times New Roman',14,,,CHARSET:ANSI)
                         STRING('Laporan Breakdown HPP Farmasi'),AT(1,7),USE(?String1),TRN
                         LINE,AT(55,9,10,0),USE(?Line3),COLOR(COLOR:Black)
                         STRING('Rawat Jalan'),AT(67,7),USE(?String28),TRN
                         LINE,AT(86,9,3,0),USE(?Line4),COLOR(COLOR:Black)
                         STRING('Periode : '),AT(90,7),USE(?String29),TRN
                         STRING(@D6-),AT(107,7),USE(VG_TANGGAL1),RIGHT(1)
                         STRING('s/d'),AT(128,7),USE(?String32),TRN
                         STRING(@d6),AT(134,7),USE(VG_TANGGAL2),RIGHT(1)
                         STRING('No'),AT(1,13),USE(?String2),TRN,FONT('Times New Roman',10,,,CHARSET:ANSI)
                         STRING('No.Billing'),AT(12,13),USE(?String37),TRN,FONT('Times New Roman',10,,,CHARSET:ANSI)
                         STRING('Nomor MR'),AT(47,13),USE(?String3),TRN,FONT('Times New Roman',10,,,CHARSET:ANSI)
                         STRING('Nama Pasien'),AT(75,13),USE(?String4),TRN,FONT('Times New Roman',10,,,CHARSET:ANSI)
                       END
break1                 BREAK(JPas:Nomor_mr)
                         HEADER,AT(0,0,155,12)
                           STRING(@n-14),AT(1,0,5,4),USE(vl_no),RIGHT(1),FONT('Times New Roman',10,,,CHARSET:ANSI)
                           STRING(@s20),AT(12,0),USE(JHB:NOMOR),FONT('Times New Roman',10,,,CHARSET:ANSI)
                           STRING(@s35),AT(75,0),USE(JPas:Nama),FONT('Times New Roman',10,,,CHARSET:ANSI)
                           STRING('Tanggal'),AT(1,7),USE(?String5),TRN,FONT('Times New Roman',10,,,CHARSET:ANSI)
                           STRING('Nama Obat'),AT(24,7),USE(?String6),TRN,FONT('Times New Roman',10,,,CHARSET:ANSI)
                           STRING('HPP'),AT(85,7),USE(?String7),TRN,FONT('Times New Roman',10,,,CHARSET:ANSI)
                           STRING('Harga Jual'),AT(104,7),USE(?String8),TRN,FONT('Times New Roman',10,,,CHARSET:ANSI)
                           STRING('Fee'),AT(124,7),USE(?String9),TRN,FONT('Times New Roman',10,,,CHARSET:ANSI)
                           STRING('Margin'),AT(139,7),USE(?String10),TRN,FONT('Times New Roman',10,,,CHARSET:ANSI)
                           LINE,AT(0,6,155,0),USE(?Line1),COLOR(COLOR:Black)
                           STRING(@N010_),AT(47,0),USE(JPas:Nomor_mr),FONT('Times New Roman',10,,,CHARSET:ANSI)
                         END
detail1                  DETAIL,AT(,,155,5)
                           STRING(@s15),AT(25,2,5,4),USE(APD:N0_tran),HIDE
                           STRING(@s15),AT(99,0,8,7),USE(APH:N0_tran),HIDE
                           STRING(@D8),AT(0,0),USE(APH:Tanggal),FONT('Times New Roman',10,,,CHARSET:ANSI)
                           STRING(@s40),AT(23,0,60,5),USE(GBAR:Nama_Brg),FONT('Times New Roman',10,,,CHARSET:ANSI)
                           STRING(@N-14.2),AT(85,0,28,5),USE(vl_harga_beli),DECIMAL(14),FONT('Times New Roman',8,,,CHARSET:ANSI)
                           STRING(@N-14.2),AT(104,0,27,5),USE(vl_harga_jual),DECIMAL(14),FONT('Times New Roman',8,,,CHARSET:ANSI)
                           STRING(@N-14.2),AT(121,0,28,5),USE(vl_hpp),DECIMAL(14),FONT('Times New Roman',8,,,CHARSET:ANSI)
                           STRING(@n-11.2),AT(17,4,4,3),USE(APD:Jumlah),HIDE,DECIMAL(14)
                           STRING(@n11.2),AT(74,6),USE(APD:Harga_Dasar),HIDE,DECIMAL(14)
                           STRING(@N-14.2),AT(137,0,28,6),USE(vl_margin),DECIMAL(14),FONT('Times New Roman',8,,,CHARSET:ANSI)
                           STRING(@n-12.2),AT(101,0,3,3),USE(APD:Total),HIDE,RIGHT(1)
                         END
                         FOOTER,AT(0,0,155,8)
                           STRING('Total : '),AT(72,0),USE(?String39),TRN,FONT('Times New Roman',8,,FONT:bold,CHARSET:ANSI)
                           STRING(@N-14.2),AT(85,0,28,5),SUM,RESET(break1),USE(vl_harga_beli,,?vl_harga_beli:2),DECIMAL(14),FONT('Times New Roman',8,,FONT:bold,CHARSET:ANSI),TALLY(detail1)
                           STRING(@N-14.2),AT(104,0,28,5),SUM,RESET(break1),USE(vl_harga_jual,,?vl_harga_jual:2),DECIMAL(14),FONT('Times New Roman',8,,FONT:bold,CHARSET:ANSI),TALLY(detail1)
                           STRING(@N-14.2),AT(121,0,28,5),SUM,RESET(break1),USE(vl_hpp,,?vl_hpp:2),DECIMAL(14),FONT('Times New Roman',8,,FONT:bold,CHARSET:ANSI),TALLY(detail1)
                           STRING(@N-14.2),AT(137,0,28,5),SUM,RESET(break1),USE(vl_margin,,?vl_margin:2),DECIMAL(14),FONT('Times New Roman',8,,FONT:bold,CHARSET:ANSI),TALLY(detail1)
                           LINE,AT(0,6,156,0),USE(?Line2),COLOR(COLOR:Black)
                         END
                       END
                       FOOTER,AT(25,242,156,6),USE(?Footer)
                         STRING('Halaman'),AT(129,0),USE(?String15),TRN
                         STRING(@N3),AT(144,0),USE(ReportPageNumber)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
  WindowTanggal()
  GlobalErrors.SetProcedureName('LaporanPenjualanPerPasienPerObatRajal')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('VG_TANGGAL1',VG_TANGGAL1)                          ! Added by: Report
  BIND('VG_TANGGAL2',VG_TANGGAL2)                          ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:JHBILLING.Open                                    ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('LaporanPenjualanPerPasienPerObatRajal',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:JHBILLING, ?Progress:PctText, Progress:Thermometer, ProgressMgr, JHB:NOMOR)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(JHB:KNOMOR)
  ThisReport.SetFilter('(sub(APH:N0_tran,1,3)=''APJ'' or sub(APH:N0_tran,1,3)=''APB'') and JHB:TglTutup >= VG_TANGGAL1 and JHB:TglTutup <<= VG_TANGGAL2 and JHB:TUTUP = 1')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  Relate:JHBILLING.SetQuickScan(1,Propagate:OneMany)
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
    Relate:JHBILLING.Close
  END
  IF SELF.Opened
    INIMgr.Update('LaporanPenjualanPerPasienPerObatRajal',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    Report$?ReportPageNumber{PROP:PageNo}=True
  END
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  APH:NoNota = JHB:NOMOR                                   ! Assign linking field value
  Access:APHTRANS.Fetch(APH:nonota_aphtras_key)
  JPas:Nomor_mr = APH:Nomor_mr                             ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APH:NoNota = JHB:NOMOR                                   ! Assign linking field value
  Access:APHTRANS.Fetch(APH:nonota_aphtras_key)
  JPas:Nomor_mr = APH:Nomor_mr                             ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  vl_no += 1
  
  vl_harga_beli   =  APD:Harga_Dasar * APD:Jumlah
  vl_harga_jual   =  APD:Total
  vl_hpp          =  vl_harga_jual * 0.0025
  vl_margin       =  vl_harga_jual - vl_harga_beli
  PRINT(RPT:detail1)
  RETURN ReturnValue

