

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('APC6N188.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N049.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N190.INC'),ONCE        !Req'd for module callout resolution
                     END


LaporanPenjualanPerPasienPerObatRanap PROCEDURE            ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
vl_break             STRING(20)                            !
vl_no                LONG                                  !
vl_harga_beli        REAL                                  !
vl_harga_jual        REAL                                  !
vl_hpp               REAL                                  !
vl_margin            REAL                                  !
vl_harga             REAL                                  !
Process:View         VIEW(queue)
                     END
ReportPageNumber     LONG,AUTO
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(25,50,156,192),PAPER(PAPER:A4),PRE(RPT),FONT('Arial',10,,FONT:regular,CHARSET:ANSI),MM
                       HEADER,AT(25,25,156,24),USE(?Header)
                         STRING('Rumah Sakit Harapan Mulia'),AT(1,1),USE(?String26),TRN,FONT('Times New Roman',14,,FONT:bold,CHARSET:ANSI)
                         STRING('Laporan Breakdown HPP Farmasi'),AT(1,11),USE(?String1),TRN,FONT('Times New Roman',10,,,CHARSET:ANSI)
                         LINE,AT(49,13,4,0),USE(?Line3),COLOR(COLOR:Black)
                         STRING('Rawat Inap'),AT(55,11),USE(?String28),TRN,FONT('Times New Roman',10,,,CHARSET:ANSI)
                         LINE,AT(73,13,3,0),USE(?Line4),COLOR(COLOR:Black)
                         STRING('Periode Tutup :'),AT(80,11),USE(?String29),TRN,FONT('Times New Roman',10,,,CHARSET:ANSI)
                         STRING(@D6-),AT(103,11),USE(VG_TANGGAL1),RIGHT(1),FONT('Times New Roman',10,,,CHARSET:ANSI)
                         STRING('s/d'),AT(126,11),USE(?String32),TRN
                         STRING(@d6),AT(134,11),USE(VG_TANGGAL2),RIGHT(1),FONT('Times New Roman',10,,,CHARSET:ANSI)
                         STRING('HPP'),AT(74,19),USE(?String7),TRN,FONT('Times New Roman',10,,,CHARSET:ANSI)
                         STRING('Nama Obat'),AT(3,19),USE(?String6),TRN,FONT('Times New Roman',10,,,CHARSET:ANSI)
                         STRING('Harga Jual'),AT(95,19),USE(?String8),TRN,FONT('Times New Roman',10,,,CHARSET:ANSI)
                         STRING('Fee'),AT(117,19),USE(?String9),TRN,FONT('Times New Roman',10,,,CHARSET:ANSI)
                         STRING('Margin'),AT(138,19),USE(?String10),TRN,FONT('Times New Roman',10,,,CHARSET:ANSI)
                       END
break1                 BREAK(QRinObat_NoTran)
                         HEADER,AT(0,0,155,14)
                           STRING('Nomor MR'),AT(3,0),USE(?String3),TRN,FONT('Times New Roman',10,,,CHARSET:ANSI)
                           STRING(@s20),AT(23,0),USE(QRinObat_NoMR),LEFT(1),FONT('Times New Roman',10,,,CHARSET:ANSI)
                           STRING('Tgl Tutup'),AT(3,9),USE(?String39),TRN,FONT('Times New Roman',10,,,CHARSET:ANSI)
                           STRING(@d6b),AT(23,9),USE(QRinObat_tglTutup),LEFT,FONT('Times New Roman',10,,,CHARSET:ANSI)
                           LINE,AT(0,14,154,0),USE(?Line5),COLOR(COLOR:Black)
                           STRING('Nama Pasien'),AT(3,4),USE(?String4),TRN,FONT('Times New Roman',10,,,CHARSET:ANSI)
                           STRING(@s50),AT(23,4),USE(QRinObat_NamaPasien),LEFT,FONT('Times New Roman',10,,,CHARSET:ANSI)
                         END
detail1                  DETAIL,AT(,,155,5)
                           STRING(@s50),AT(3,0),USE(QRinObat_NamaBarang),FONT('Times New Roman',10,,,CHARSET:ANSI)
                           STRING(@N-17.2),AT(74,0),USE(QRinObat_HPP),DECIMAL(14),FONT('Times New Roman',8,,,CHARSET:ANSI)
                           STRING(@N-17.2),AT(95,0),USE(QRinObat_HargaJual),DECIMAL(14),FONT('Times New Roman',8,,,CHARSET:ANSI)
                           STRING(@N-17.2),AT(117,0),USE(QRinObat_Fee),DECIMAL(14),FONT('Times New Roman',8,,,CHARSET:ANSI)
                           STRING(@N-17.2),AT(138,0),USE(QRinObat_Margin),DECIMAL(14),FONT('Times New Roman',8,,,CHARSET:ANSI)
                         END
                         FOOTER,AT(0,0,154,6)
                           STRING('Total : '),AT(58,0),USE(?String38),TRN,LEFT,FONT('Times New Roman',8,,FONT:bold,CHARSET:ANSI)
                           STRING(@N-17.2),AT(74,0),SUM,RESET(break1),USE(QRinObat_HPP,,?QRinObat_HPP:2),DECIMAL(14),FONT('Times New Roman',8,,FONT:bold,CHARSET:ANSI),TALLY(detail1)
                           STRING(@N-17.2),AT(95,0),SUM,RESET(break1),USE(QRinObat_HargaJual,,?QRinObat_HargaJual:2),DECIMAL(14),FONT('Times New Roman',8,,FONT:bold,CHARSET:ANSI),TALLY(detail1)
                           STRING(@N-17.2),AT(117,0),SUM,RESET(break1),USE(QRinObat_Fee,,?QRinObat_Fee:2),DECIMAL(14),FONT('Times New Roman',8,,FONT:bold,CHARSET:ANSI),TALLY(detail1)
                           STRING(@N-17.2),AT(138,0),SUM,RESET(break1),USE(QRinObat_Margin,,?QRinObat_Margin:2),DECIMAL(14),FONT('Times New Roman',8,,FONT:bold,CHARSET:ANSI),TALLY(detail1)
                           LINE,AT(0,5,156,0),USE(?Line2),COLOR(COLOR:Black)
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
Next                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
  GlobalErrors.SetProcedureName('LaporanPenjualanPerPasienPerObatRanap')
  WindowTanggal()
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
  ProsesObatRanap()
  Relate:queue.Open                                        ! File queue used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('LaporanPenjualanPerPasienPerObatRanap',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisReport.Init(Process:View, Relate:queue, ?Progress:PctText, Progress:Thermometer, RECORDS(QRinObat))
  ThisReport.AddSortOrder()
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{Prop:Text}=''
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
    Relate:queue.Close
  END
  IF SELF.Opened
    INIMgr.Update('LaporanPenjualanPerPasienPerObatRanap',ProgressWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Next PROCEDURE

ReturnValue          BYTE,AUTO

Progress BYTE,AUTO
  CODE
      ThisReport.RecordsProcessed+=1
      GET(QRinObat,ThisReport.RecordsProcessed)
      IF ERRORCODE() THEN
         ReturnValue = Level:Notify
      ELSE
         ReturnValue = Level:Benign
      END
      IF ReturnValue = Level:Notify
          IF ThisReport.RecordsProcessed>RECORDS(QRinObat)
             SELF.Response = RequestCompleted
             POST(Event:CloseWindow)
             RETURN Level:Notify
          ELSE
             SELF.Response = RequestCancelled
             POST(Event:CloseWindow)
             RETURN Level:Fatal
          END
      ELSE
         Progress = ThisReport.RecordsProcessed / ThisReport.RecordsToProcess*100
         IF Progress > 100 THEN Progress = 100.
         IF Progress <> Progress:Thermometer
           Progress:Thermometer = Progress
           DISPLAY()
         END
      END
      RETURN Level:Benign
  ReturnValue = PARENT.Next()
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    Report$?ReportPageNumber{PROP:PageNo}=True
  END
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  !vl_no += 1
  !
  !vl_harga_beli   =  APD:Harga_Dasar * APD:Jumlah
  !vl_harga_jual   =  APD:Total
  !if vl_harga_jual <0 then
  !    vl_harga_beli = vl_harga_beli * -1
  !end
  !vl_hpp          =  vl_harga_jual * 0.0025
  !vl_margin       =  vl_harga_jual - vl_harga_beli
  PRINT(RPT:detail1)
  RETURN ReturnValue

