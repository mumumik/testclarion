

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N037.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N030.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N130.INC'),ONCE        !Req'd for module callout resolution
                     END


PrintHasilOpname PROCEDURE                                 ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
loc::no              ULONG                                 !
loc::komp            REAL                                  !Nilai stok
loc::kartu           REAL                                  !Stok Menurut Kartu
loc::selisih         REAL                                  !Selisih stok komputer dengan stok opname
loc::volrp           REAL                                  !Selisih stok komputer dengan stok opname
loc::vol             REAL                                  !Selisih stok komputer dengan stok opname
loc::tanggal         DATE                                  !
loc:vol_sel_kom      REAL                                  !
loc:fisik            REAL                                  !
vl_harga             REAL                                  !
Process:View         VIEW(ApStokop)
                       PROJECT(Apso:Bulan)
                       PROJECT(Apso:Harga)
                       PROJECT(Apso:Kode_Apotik)
                       PROJECT(Apso:Kode_Barang)
                       PROJECT(Apso:StHitung)
                       PROJECT(Apso:Stkomputer)
                       PROJECT(Apso:Tahun)
                       JOIN(GBAR:KeyKodeBrg,Apso:Kode_Barang)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:No_Satuan)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(1469,1365,12042,8469),PAPER(PAPER:FANFOLD_US),PRE(RPT),FONT('Arial',10,COLOR:Black,),THOUS
                       HEADER,AT(1479,333,12021,1021),FONT('Arial',10,,FONT:regular)
                         STRING('Stock Opname persediaan barang / obat'),AT(21,21,6000,219),TRN,LEFT,FONT('Rockwell Condensed',10,,FONT:bold)
                         STRING('Tanggal :'),AT(21,188),USE(?String22),TRN,FONT('Rockwell Condensed',10,,)
                         STRING(@d06),AT(438,188),USE(loc::tanggal),TRN,FONT('Rockwell Condensed',10,,)
                         STRING('Instalasi Farmasi :'),AT(21,354),USE(?String27),TRN,FONT('Rockwell Condensed',10,,)
                         STRING(@s30),AT(1615,354),USE(GAPO:Nama_Apotik),FONT('Rockwell Condensed',10,,FONT:bold)
                         STRING('/'),AT(1448,354),USE(?String28),TRN,FONT('Rockwell Condensed',10,,FONT:bold)
                         STRING(@s5),AT(1042,354),USE(GL_entryapotik),FONT('Rockwell Condensed',10,,FONT:bold)
                         BOX,AT(10,552,10708,469),COLOR(COLOR:Black)
                         LINE,AT(4521,552,0,469),COLOR(COLOR:Black)
                         LINE,AT(1010,552,0,469),COLOR(COLOR:Black)
                         LINE,AT(3156,552,0,469),COLOR(COLOR:Black)
                         LINE,AT(4521,781,1198,0),USE(?Line24),COLOR(COLOR:Black)
                         LINE,AT(3781,552,0,469),COLOR(COLOR:Black)
                         LINE,AT(5198,792,0,219),COLOR(COLOR:Black)
                         STRING('Fisik'),AT(7479,813,208,167),USE(?String34),TRN,FONT('Rockwell Condensed',10,,FONT:regular)
                         STRING('Rp.'),AT(10042,813,135,167),USE(?String36),TRN,FONT('Rockwell Condensed',10,,)
                         STRING('Volume'),AT(8667,813,302,167),USE(?String35),TRN,FONT('Rockwell Condensed',10,,FONT:regular)
                         LINE,AT(5833,552,0,469),COLOR(COLOR:Black)
                         STRING('Volume'),AT(5000,573),USE(?String30),TRN,FONT('Rockwell Condensed',10,,FONT:regular)
                         STRING('Nilai (RP.)'),AT(6740,573,958,198),USE(?String31),TRN,FONT('Rockwell Condensed',10,,FONT:regular)
                         LINE,AT(9469,781,0,240),COLOR(COLOR:Black)
                         LINE,AT(8198,552,0,469),USE(?Line25),COLOR(COLOR:Black)
                         STRING('Kd Barang'),AT(427,813,573,167),TRN,FONT('Rockwell Condensed',10,,FONT:regular)
                         LINE,AT(375,552,0,469),USE(?Line22),COLOR(COLOR:Black)
                         STRING('Nama Barang'),AT(1365,813,719,167),TRN,FONT('Rockwell Condensed',10,,)
                         STRING('Satuan'),AT(3313,813,365,167),TRN,FONT('Rockwell Condensed',10,,FONT:regular)
                         STRING('St. Komp'),AT(4656,813,396,167),TRN,FONT('Rockwell Condensed',10,,)
                         STRING('Fisik'),AT(5406,813,323,167),TRN,FONT('Rockwell Condensed',10,,FONT:regular)
                         STRING('Komputer'),AT(6198,813,396,167),USE(?String32),TRN,FONT('Rockwell Condensed',10,,FONT:regular)
                         LINE,AT(7000,792,0,219),USE(?Line26),COLOR(COLOR:Black)
                         STRING('Selisih +/- Fisik dgn Komputer'),AT(8875,594,1229,146),TRN,FONT('Rockwell Condensed',10,,FONT:regular)
                         STRING('Harga'),AT(3990,813,354,167),TRN,FONT('Rockwell Condensed',10,,)
                         LINE,AT(5708,781,5000,0),USE(?Line27),COLOR(COLOR:Black)
                         STRING('No.'),AT(73,813,260,167),USE(?String24),TRN,FONT('Rockwell Condensed',10,,FONT:regular)
                       END
detail                 DETAIL,AT(10,,13031,198),USE(?detail),FONT('Arial',8,,FONT:regular)
                         LINE,AT(21,188,10708,0),USE(?Line32),COLOR(COLOR:Black)
                         STRING(@s40),AT(1052,10,2083,135),USE(GBAR:Nama_Brg),TRN
                         STRING(@s10),AT(3188,10,573,135),USE(GBAR:No_Satuan),TRN
                         STRING(@s10),AT(406,10,583,135),USE(Apso:Kode_Barang),TRN
                         STRING(@n-17.2),AT(9677,10,875,135),USE(loc::selisih),RIGHT(1),FONT('Arial',8,,)
                         STRING(@n-15.2),AT(6021,10,917,135),USE(loc::komp),LEFT(1),FONT('Arial',8,,)
                         STRING(@n10),AT(4646,10,385,135),USE(Apso:Stkomputer),TRN,RIGHT(1),FONT('Arial',8,,)
                         STRING(@n10),AT(5302,10,427,135),USE(Apso:StHitung),RIGHT(1),FONT('Arial',8,,)
                         STRING(@n-10),AT(8594,10,521,135),USE(loc:vol_sel_kom),RIGHT(1),FONT('Arial',8,,)
                         STRING(@n15.2),AT(3802,10,740,135),USE(vl_harga),TRN,RIGHT(1),FONT('Arial',8,,)
                         STRING(@n-15.2),AT(7188,10,896,135),USE(loc:fisik),RIGHT(1),FONT('Arial',8,,)
                         STRING(@n5),AT(52,10,281,135),CNT,USE(loc::no),LEFT,FONT('Arial',8,,FONT:regular)
                       END
                       FOOTER,AT(1469,9854,12063,219)
                         STRING('Page xxxxx of xxxxx'),AT(42,10,1302,208),USE(?PageOfString),FONT('Times New Roman',8,,)
                         STRING('Total'),AT(5042,31,667,125),USE(?String44),TRN,FONT('Rockwell Condensed',10,,FONT:regular)
                         STRING(@n-17.2),AT(5854,31,1063,125),SUM,USE(loc::komp,,?loc::komp:2),TRN,RIGHT(1),FONT('Arial',8,,)
                         STRING(@n17.2),AT(7031,31,1031,125),SUM,USE(loc:fisik,,?loc:fisik:2),TRN,RIGHT(1),FONT('Arial',8,,)
                         STRING(@n-17.2),AT(9656,31,875,125),SUM,USE(loc::selisih,,?loc::selisih:2),RIGHT(1),FONT('Arial',8,,)
                         STRING(@n-10),AT(8573,31,521,125),SUM,USE(loc:vol_sel_kom,,?loc:vol_sel_kom:2),RIGHT(1),FONT('Arial',8,,)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Open                   PROCEDURE(),DERIVED                 ! Method added to host embed code
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
  GlobalErrors.SetProcedureName('PrintHasilOpname')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  WindowBulanTahun()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: Report
  BIND('glo:tahun',glo:tahun)                              ! Added by: Report
  BIND('glo:bulan',glo:bulan)                              ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  loc::tanggal=date(glo:bulan,1,glo:tahun)
  Relate:ASaldoAwal.SetOpenRelated()
  Relate:ASaldoAwal.Open                                   ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Relate:ApStokop.Open                                     ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Relate:Apcettmp.Open                                     ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Relate:GSatuan.Open                                      ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Access:GBarang.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GApotik.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintHasilOpname',ProgressWindow)          ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisReport.Init(Process:View, Relate:ApStokop, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  ThisReport.SetFilter('Apso:Kode_apotik=GL_entryapotik and apso:tahun=glo:tahun and apso:bulan=glo:bulan and Apso:Kode_Barang<<>'''' and Apso:Kode_Barang<<>''0{10}''')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  Relate:ApStokop.SetQuickScan(1,Propagate:OneMany)
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom=True
  Previewer.Maximize=True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ASaldoAwal.Close
    Relate:ApStokop.Close
    Relate:Apcettmp.Close
    Relate:GSatuan.Close
  END
  IF SELF.Opened
    INIMgr.Update('PrintHasilOpname',ProgressWindow)       ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Open PROCEDURE

  CODE
  PARENT.Open
  GAPO:Kode_Apotik = GL_entryapotik
  GET(GApotik,GAPO:KeyNoApotik)


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = Apso:Kode_Barang                         ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  GBAR:Kode_brg = Apso:Kode_Barang                         ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  vl_harga=0
  ASA:Kode_Barang =Apso:Kode_Barang
  ASA:Apotik      =Apso:Kode_Apotik
  ASA:Bulan       =Apso:Bulan
  ASA:Tahun       =Apso:Tahun
  if access:asaldoawal.fetch(ASA:PrimaryKey)=level:benign then
     vl_harga=ASA:Harga
  end
  if vl_harga=0 then
     vl_harga=Apso:Harga
  !   GSTO:Kode_Apotik=Apso:Kode_Apotik
  !   GSTO:Kode_Barang=Apso:Kode_Barang
  !   access:gstokaptk.fetch(GSTO:KeyBarang)
  !   vl_harga=GSTO:Harga_Dasar*1.1
  end
  loc::komp=Apso:Stkomputer * vl_harga
  loc:fisik=Apso:StHitung * vl_harga
  loc:vol_sel_kom=Apso:StHitung - Apso:Stkomputer
  loc::selisih=(Apso:StHitung * vl_harga) - (Apso:Stkomputer * vl_harga)
  display
  ReturnValue = PARENT.TakeRecord()
  IF Apso:StHitung<>0 or Apso:Stkomputer<>0
    PRINT(RPT:detail)
  END
  RETURN ReturnValue

CetakMutasiKartuFIFO PROCEDURE                             ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
vl_bulan             SHORT                                 !
vl_tahun             LONG                                  !
FilesOpened          BYTE                                  !
loc::tanggal         DATE                                  !
loc::komentar        STRING(60)                            !
vl_ada_opname        BYTE                                  !
vl_ada               BYTE(0)                               !
vl_harga_opname      REAL                                  !
vl_hitung            SHORT(0)                              !
vl_saldo_awal        REAL                                  !
vl_debet             REAL                                  !
vl_kredit            REAL                                  !
vl_saldo_akhir       REAL                                  !
vl_saldo_awal_rp     REAL                                  !
vl_saldo_akhir_rp    REAL                                  !
vl_debet_rp          REAL                                  !
vl_kredit_rp         REAL                                  !
vl_saldo_awal_total  REAL                                  !
vl_debet_total       REAL                                  !
vl_kredit_total      REAL                                  !
vl_saldo_akhir_total REAL                                  !
apasaja              STRING(20)                            !
vl_nomor             LONG                                  !
vl_no                LONG                                  !
Process:View         VIEW(GStokAptk)
                       PROJECT(GSTO:Harga_Dasar)
                       PROJECT(GSTO:Kode_Apotik)
                       PROJECT(GSTO:Kode_Barang)
                       JOIN(GBAR:KeyKodeBrg,GSTO:Kode_Barang)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:No_Satuan)
                       END
                     END
ProgressWindow       WINDOW('Penyusunan Data....'),AT(,,142,79),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                       PROMPT('NO :'),AT(37,61),USE(?vl_no:Prompt)
                       ENTRY(@n-14),AT(57,61,47,10),USE(vl_no),RIGHT(1)
                     END

report               REPORT,AT(656,1531,14083,8469),PAPER(PAPER:FANFOLD_US),PRE(RPT),FONT('Arial',10,COLOR:Black,),THOUS
                       HEADER,AT(656,688,14063,844)
                         STRING('Rekap Obat Instalasi Farmasi'),AT(146,10,1729,208),LEFT,FONT('Times New Roman',8,,FONT:bold)
                         STRING(@s60),AT(2375,10,3865,198),USE(loc::komentar),FONT('Times New Roman',8,,FONT:italic)
                         STRING(@s5),AT(1958,10,365,198),USE(GSTO:Kode_Apotik),FONT('Arial',8,,FONT:regular+FONT:italic)
                         STRING('Bulan'),AT(146,208),USE(?String28),TRN,FONT('Times New Roman',8,,)
                         STRING(@n02),AT(542,208),USE(glo:bulan),TRN,FONT('Times New Roman',8,,FONT:regular)
                         STRING('Tahun'),AT(833,208),USE(?String30),TRN,FONT('Times New Roman',8,,)
                         STRING(@n04),AT(1240,208),USE(glo:tahun),TRN,FONT('Times New Roman',8,,FONT:regular)
                         LINE,AT(3323,625,9479,0),USE(?Line15),COLOR(COLOR:Black)
                         BOX,AT(10,427,12802,417),COLOR(COLOR:Black)
                         LINE,AT(990,438,0,396),COLOR(COLOR:Black)
                         LINE,AT(3333,438,0,396),COLOR(COLOR:Black)
                         LINE,AT(3969,635,0,198),COLOR(COLOR:Black)
                         STRING('Kode'),AT(552,531,417,167),TRN,FONT('Times New Roman',8,,)
                         STRING('Nama Obat'),AT(1781,531,802,167),TRN,FONT('Times New Roman',8,,)
                         STRING('Sat.'),AT(3010,531,302,167),USE(?String34),TRN,FONT('Times New Roman',8,,)
                         STRING('No.'),AT(83,531,229,167),USE(?String48),TRN,FONT('Times New Roman',8,,)
                         STRING('Saldo Awal'),AT(3365,656,594,167),TRN,FONT('Times New Roman',8,,)
                         LINE,AT(9188,438,0,396),USE(?Line8:5),COLOR(COLOR:Black)
                         LINE,AT(11083,635,0,198),USE(?Line8:3),COLOR(COLOR:Black)
                         LINE,AT(11917,635,0,198),USE(?Line8:6),COLOR(COLOR:Black)
                         STRING('Qty'),AT(4458,448,302,167),USE(?String34:4),TRN,FONT('Times New Roman',8,,)
                         LINE,AT(7552,635,0,198),USE(?Line8:9),COLOR(COLOR:Black)
                         LINE,AT(2917,438,0,396),USE(?Line12),COLOR(COLOR:Black)
                         STRING('Masuk'),AT(4156,656,344,167),TRN,FONT('Times New Roman',8,,)
                         STRING('Keluar'),AT(4750,656,354,167),TRN,FONT('Times New Roman',8,,)
                         STRING('Harga'),AT(7198,448,656,167),USE(?String31:2),TRN,FONT('Times New Roman',8,,)
                         STRING('Saldo Akhir'),AT(12063,656,531,167),TRN,FONT('Times New Roman',8,,)
                         LINE,AT(10156,635,0,198),USE(?Line8:10),COLOR(COLOR:Black)
                         STRING('Saldo Awal'),AT(6021,656,635,167),USE(?String31:4),TRN,CENTER,FONT('Times New Roman',8,,)
                         STRING('Masuk'),AT(6833,656,625,167),USE(?String31:5),TRN,CENTER,FONT('Times New Roman',8,,)
                         STRING('Saldo Akhir'),AT(8479,656,625,167),USE(?String31:6),TRN,CENTER,FONT('Times New Roman',8,,)
                         STRING('Keluar'),AT(7635,656,625,167),USE(?String31:3),TRN,CENTER,FONT('Times New Roman',8,,)
                         STRING('Keluar'),AT(11250,656,573,167),USE(?String29:3),TRN,FONT('Times New Roman',8,,)
                         STRING('Masuk'),AT(10448,656,573,167),USE(?String29),TRN,FONT('Times New Roman',8,,)
                         STRING('Total Harga'),AT(10729,448,875,167),USE(?String31),TRN,FONT('Times New Roman',8,,)
                         LINE,AT(375,438,0,396),USE(?Line18),COLOR(COLOR:Black)
                         STRING('Saldo Awal'),AT(9438,656,656,167),USE(?String29:2),TRN,FONT('Times New Roman',8,,)
                         LINE,AT(8375,635,0,198),USE(?Line8:8),COLOR(COLOR:Black)
                         STRING('Akhir'),AT(5479,656,281,167),USE(?String27),TRN,FONT('Times New Roman',8,,)
                         LINE,AT(6750,635,0,198),USE(?Line8:7),COLOR(COLOR:Black)
                         LINE,AT(5292,635,0,198),USE(?Line8:4),COLOR(COLOR:Black)
                         LINE,AT(5969,438,0,396),USE(?Line8:2),COLOR(COLOR:Black)
                         LINE,AT(4635,635,0,198),USE(?Line8),COLOR(COLOR:Black)
                       END
break1                 BREAK(apasaja)
detail1                  DETAIL,AT(,,,198),USE(?detail1),FONT('Arial',8,,FONT:regular)
                           STRING(@s10),AT(385,10,677,146),USE(GSTO:Kode_Barang),TRN
                           STRING(@s40),AT(1021,10,1896,146),USE(GBAR:Nama_Brg)
                           STRING(@s10),AT(2938,10,385,146),USE(GBAR:No_Satuan)
                           STRING(@n-14.2),AT(5969,10,771,146),USE(vl_saldo_awal_rp),RIGHT(14)
                           STRING(@n-14.2),AT(6760,10,792,146),USE(vl_debet_rp),RIGHT(14)
                           STRING(@n-14.2),AT(7583,10,771,146),USE(vl_kredit_rp),RIGHT(14)
                           STRING(@n-14.2),AT(8396,10,781,146),USE(vl_saldo_akhir_rp),RIGHT
                           STRING(@n-12.2),AT(3354,10,615,146),USE(vl_saldo_awal),RIGHT(2)
                           STRING(@n-12.2),AT(4000,10,615,146),USE(vl_debet),RIGHT(2)
                           STRING(@n-12.2),AT(4625,10,656,146),USE(vl_kredit),RIGHT(14)
                           STRING(@n-12.2),AT(5302,10,646,146),USE(vl_saldo_akhir),RIGHT(2)
                           STRING(@n-16.2),AT(9198,10,917,146),USE(vl_saldo_awal_total),TRN,RIGHT(14)
                           STRING(@n-16.2),AT(10188,10,854,146),USE(vl_debet_total),TRN,RIGHT(14)
                           STRING(@n-16.2),AT(11073,10,854,146),USE(vl_kredit_total),TRN,RIGHT(14)
                           STRING(@n-16.2),AT(11948,10,896,146),USE(vl_saldo_akhir_total),TRN,RIGHT
                           STRING(@n5),AT(10,10,333,146),CNT,USE(vl_nomor),RIGHT(1)
                           LINE,AT(52,188,12760,0),COLOR(COLOR:Black)
                         END
                       END
                       FOOTER,AT(656,10010,14063,542),FONT('Arial',8,,FONT:regular)
                         STRING('TOTAL :'),AT(8656,42,417,146),USE(?String51),TRN
                         STRING(@n-17.2),AT(9083,42,1010,146),SUM,USE(vl_saldo_awal_total,,?vl_saldo_awal_total:2),TRN,RIGHT(14)
                         STRING(@n-17.2),AT(10094,42,927,146),SUM,RESET(break1),USE(vl_debet_total,,?vl_debet_total:2),TRN,RIGHT(14)
                         STRING(@n-17.2),AT(11010,42,896,146),SUM,RESET(break1),USE(vl_kredit_total,,?vl_kredit_total:2),TRN,RIGHT(14)
                         STRING(@n-17.2),AT(11927,42,896,146),SUM,USE(vl_saldo_akhir_total,,?vl_saldo_akhir_total:2),TRN,RIGHT
                         LINE,AT(8594,229,4240,0),USE(?Line17),COLOR(COLOR:Black)
                         STRING('Instalasi Farmasi, Rumah Sakit Mitra Kasih'),AT(52,292),USE(?String21),TRN,FONT('Times New Roman',8,,)
                         STRING('Page xxxxx of xxxxx'),AT(8125,281,1302,208),USE(?PageOfString),FONT('Times New Roman',8,COLOR:Black,)
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
view::file_sql view(filesql)
                 project(FIL:FString1,FIL:FReal1,FIL:FReal2)
               end

view::FReal1 view(filesql)
                 project(FIL:FReal1)
               end

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
  GlobalErrors.SetProcedureName('CetakMutasiKartuFIFO')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Glo::kode_apotik',Glo::kode_apotik)                ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  WindowBulanTahun()
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File ApStokop used by this procedure, so make sure it's RelationManager is open
  Relate:ApStokop.Open                                     ! File ApStokop used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql.Open                                      ! File ApStokop used by this procedure, so make sure it's RelationManager is open
  Relate:Tbstawal.Open                                     ! File ApStokop used by this procedure, so make sure it's RelationManager is open
  Access:GApotik.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APKStok.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ASaldoAwal.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  loc::tanggal=TODAY()
  !IF GL_Um_kls1 = 2
      GAPO:Kode_Apotik = Glo::kode_apotik
      GET(GApotik,GAPO:KeyNoApotik)
      loc::komentar = 'Sub Intalasi : '& GAPO:Nama_Apotik
  !ELSE
  !    CLEAR(loc::komentar)
  !END
  
  vl_ada_opname       =0
  
  Apso:Kode_Apotik    =Glo::kode_apotik
  Apso:Tahun          =glo:tahun
  Apso:Bulan          =glo:bulan
  if access:apstokop.fetch(Apso:keykdap_bln_thn)=level:benign then
     vl_ada_opname       =1
  end
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('CetakMutasiKartuFIFO',ProgressWindow)      ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:GStokAptk, ?Progress:PctText, Progress:Thermometer, ProgressMgr, GSTO:Kode_Barang)
  ThisReport.AddSortOrder(GSTO:KeyBarang)
  ThisReport.SetFilter('GSTO:Kode_Apotik=Glo::kode_apotik and gsto:kode_barang<<>'''' and gsto:kode_barang<<>''0{10}''')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}='Persiapan Cetak Laporan'
  Relate:GStokAptk.SetQuickScan(1,Propagate:OneMany)
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
    Relate:ApStokop.Close
    Relate:FileSql.Close
    Relate:Tbstawal.Close
  END
  IF SELF.Opened
    INIMgr.Update('CetakMutasiKartuFIFO',ProgressWindow)   ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = GSTO:Kode_Barang                         ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  GBAR:Kode_brg = GSTO:Kode_Barang                         ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  vl_saldo_awal       =0
  vl_debet            =0
  vl_kredit           =0
  vl_saldo_akhir      =0
  vl_saldo_awal_total =0
  vl_debet_total      =0
  vl_kredit_total     =0
  vl_saldo_akhir_total=0
  vl_saldo_awal_rp    =0
  vl_debet_rp         =0
  vl_kredit_rp        =0
  vl_saldo_akhir_rp   =0
  vl_harga_opname     =0
  vl_hitung           =0
  vl_ada              =0
  
  if vl_ada_opname=1 then
     Apso:Kode_Apotik    =GSTO:Kode_Apotik
     Apso:Kode_Barang    =GSTO:Kode_Barang
     Apso:Tahun          =glo:tahun
     Apso:Bulan          =glo:bulan
     if access:apstokop.fetch(Apso:kdapotik_brg)=level:benign then
        vl_ada=1
        vl_saldo_awal          =Apso:StHitung
        vl_saldo_awal_rp       =Apso:Harga
        vl_saldo_awal_total    =Apso:StHitung*Apso:Harga
  
        vl_saldo_akhir         =Apso:StHitung
        vl_saldo_akhir_total   =Apso:StHitung*Apso:Harga
     end
  else
     ASA:Kode_Barang     =GSTO:Kode_Barang
     ASA:Apotik          =GSTO:Kode_Apotik
     ASA:Bulan           =glo:bulan
     ASA:Tahun           =glo:tahun
     if access:asaldoawal.fetch(ASA:PrimaryKey)=level:benign then
        vl_saldo_awal          =ASA:Jumlah
        vl_saldo_awal_rp       =ASA:Harga
        vl_saldo_awal_total    =ASA:Total
        vl_saldo_akhir         =ASA:Jumlah
        vl_saldo_akhir_total   =ASA:Total
     end
  end
  
  afifoin{prop:sql}='select * from dba.afifoin where kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''' and month(tanggal)='&glo:bulan&' and year(tanggal)='&glo:tahun&' order by tanggal,jam'
  afifoin{prop:sql}='select * from dba.afifoin where kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''' and month(tanggal)='&glo:bulan&' and year(tanggal)='&glo:tahun&' order by tanggal,jam'
  loop
     if access:afifoin.next()<>level:benign then break.
     if sub(AFI:NoTransaksi,1,3)<>'OPN' then
        vl_debet             +=AFI:Jumlah
        vl_debet_total       +=AFI:Jumlah*AFI:Harga
  
        vl_saldo_akhir       +=AFI:Jumlah
        vl_saldo_akhir_total +=AFI:Jumlah*AFI:Harga
     end
  end
  
  vl_debet_rp         =vl_debet_total/vl_debet
  
  open(view::file_sql)
  view::file_sql{prop:sql}='select NoTransaksi,jumlah,harga from dba.afifoout where kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''' and month(tanggal)='&glo:bulan&' and year(tanggal)='&glo:tahun&' order by tanggal,jam'
  view::file_sql{prop:sql}='select NoTransaksi,jumlah,harga from dba.afifoout where kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''' and month(tanggal)='&glo:bulan&' and year(tanggal)='&glo:tahun&' order by tanggal,jam'
  loop
     next(view::file_sql)
     if errorcode()<>0 then break.
     AFI:Kode_Barang  =GSTO:Kode_Barang
     AFI:NoTransaksi  =clip(FIL:FString1)
     AFI:Kode_Apotik  =GSTO:Kode_Apotik
     access:afifoin.fetch(AFI:BrgNoTransApotikKey)
     vl_kredit          +=FIL:FReal1
     vl_kredit_total    +=FIL:FReal1*AFI:Harga
  
     vl_saldo_akhir       -=FIL:FReal1
     vl_saldo_akhir_total -=FIL:FReal1*AFI:Harga
  end
  close(view::file_sql)
  
  vl_kredit_rp    =vl_kredit_total/vl_kredit
  vl_saldo_akhir_rp   =vl_saldo_akhir_total/vl_saldo_akhir
  
  if vl_saldo_akhir=0 then
     vl_saldo_akhir_total   =0
  end
  
  vl_no+=1
  display
  
  
  ReturnValue = PARENT.TakeRecord()
  IF vl_saldo_awal<>0 or vl_debet<>0 or vl_kredit<>0
    PRINT(RPT:detail1)
  END
  RETURN ReturnValue

WindowBulanTahunPenjualan PROCEDURE                        ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
DisplayString        STRING(255)                           !
Window               WINDOW('Tahun - Bulan'),AT(,,185,105),FONT('MS Sans Serif',8,COLOR:Black,FONT:regular),CENTER,GRAY,DOUBLE
                       ENTRY(@n-7),AT(72,18,60,10),USE(glo:bulan),RIGHT(1)
                       ENTRY(@n-14),AT(72,33,60,10),USE(glo:tahun),RIGHT(1)
                       PROMPT('Kode apotik:'),AT(22,50),USE(?Glo::kode_apotik:Prompt)
                       ENTRY(@s5),AT(71,50,60,10),USE(Glo::kode_apotik),DISABLE,MSG('Kode apotik'),TIP('Kode apotik'),UPR
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
  GlobalErrors.SetProcedureName('WindowBulanTahunPenjualan')
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
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('WindowBulanTahunPenjualan',Window)         ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('WindowBulanTahunPenjualan',Window)      ! Save window data to non-volatile store
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

ProsesLapHargaPokokPenjualan PROCEDURE                     ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
vl_jum               REAL                                  !
vl_total             REAL                                  !
vl_count             LONG                                  !
Process:View         VIEW(GStokAptk)
                       PROJECT(GSTO:Kode_Barang)
                       JOIN(GBAR:KeyKodeBrg,GSTO:Kode_Barang)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:No_Satuan)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,81),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                       PROMPT('Jumlah :'),AT(29,62),USE(?vl_count:Prompt)
                       ENTRY(@n-14),AT(58,62,60,10),USE(vl_count),RIGHT(1)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Reset                  PROCEDURE(BYTE Force=0),DERIVED     ! Method added to host embed code
Update                 PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ProgressMgr          StepClass                             ! Progress Manager
view::filesql view(filesql)
                project(FIL:FReal1,FIL:FReal2)
              end

!que:print queue(que:p)

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
  GlobalErrors.SetProcedureName('ProsesLapHargaPokokPenjualan')
  WindowBulanTahunPenjualan()
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Glo::kode_apotik',Glo::kode_apotik)                ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AAdjust.Open                                      ! File AFIFOOUT used by this procedure, so make sure it's RelationManager is open
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File AFIFOOUT used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql.Open                                      ! File AFIFOOUT used by this procedure, so make sure it's RelationManager is open
  Access:APDTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  free(Que:P)
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesLapHargaPokokPenjualan',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:GStokAptk, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ThisProcess.SetFilter('GSTO:Kode_Apotik=Glo::kode_apotik')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(GStokAptk,'QUICKSCAN=on')
  SEND(GBarang,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  printlaphargapokokpenjualan
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAdjust.Close
    Relate:AFIFOIN.Close
    Relate:FileSql.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesLapHargaPokokPenjualan',ProgressWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = GSTO:Kode_Barang                         ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  GBAR:Kode_brg = GSTO:Kode_Barang                         ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  vl_jum   =0
  vl_total =0
  
  open(view::filesql)
  view::filesql{prop:sql}='select jumlah,harga from dba.afifoout where kode_barang='''&GSTO:Kode_Barang&''' and substr(notranskeluar,1,3)=''API'' and year(tanggal)='&glo:tahun&' and month(tanggal)='&glo:bulan&' and kode_apotik='''&GSTO:Kode_Apotik&''''
  loop
     next(view::filesql)
     if errorcode() then break.
     AFI:Kode_Barang  =GSTO:Kode_Barang
     AFI:Mata_Uang    ='Rp'
     AFI:NoTransaksi  =AFI2:NoTransaksi
     AFI:Transaksi    =1
     AFI:Kode_Apotik  =GSTO:Kode_Apotik
     access:afifoin.fetch(AFI:KEY1)
     vl_jum  +=FIL:FReal1
     vl_total+=FIL:FReal1*AFI:Harga
  end
  if vl_jum<>0 then
     Que:P.qp:kode_barang =GSTO:Kode_Barang
     Que:P.qp:nama_barang =GBAR:Nama_Brg
     Que:P.qp:jumlah      =vl_jum
     Que:P.qp:harga       =vl_total
     Que:P.qp:sat         =GBAR:No_Satuan
     add(Que:P)
     clear(Que:P)
  end
  close(view::filesql)
  vl_count+=1
  display
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue

