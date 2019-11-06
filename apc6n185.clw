

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('APC6N185.INC'),ONCE        !Local module procedure declarations
                     END


PrintDaftarHargaObat2 PROCEDURE                            ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
vl_ppn               REAL                                  !
vl_no                LONG                                  !
FilesOpened          BYTE                                  !
loc::datel           DATE                                  !
loc::time            TIME                                  !
loc::total           LONG                                  !
loc::nama_apotik     STRING(30)                            !Nama Apotik
APA                  STRING(20)                            !
vl_harga_raja        LONG                                  !
vl_harga_ranap_3     REAL                                  !
vl_harga_ranap_12vip REAL                                  !
vl_harga_raja_Nota   REAL                                  !
vl_harga_ranap1      REAL                                  !
vl_harga_ranap2      REAL                                  !
vl_cash              REAL                                  !
vl_nota              REAL                                  !
vl_kls1              REAL                                  !
vl_kls2              REAL                                  !
vl_kls3              REAL                                  !
vl_vip               REAL                                  !
Q:Barang             QUEUE,PRE()                           !
vl_nomor             LONG                                  !
vl_kodebarang        STRING(20)                            !
vl_namabarang        STRING(50)                            !
vl_satuan            STRING(20)                            !
vl_hargajual         LONG                                  !
vl_hargajualmitra    LONG                                  !
                     END                                   !
vl_harga_mitra       LONG                                  !
Process:View         VIEW(GBarang)
                       PROJECT(GBAR:FarNonFar)
                       PROJECT(GBAR:Kode_brg)
                       PROJECT(GBAR:Nama_Brg)
                       PROJECT(GBAR:No_Satuan)
                       JOIN(GSGD:KeyKodeBrg,GBAR:Kode_brg)
                         PROJECT(GSGD:Harga_Beli)
                       END
                     END
ReportPageNumber     LONG,AUTO
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(146,927,7854,9750),PAPER(PAPER:A4),PRE(RPT),FONT('Arial',10,COLOR:Black,),THOUS
                       HEADER,AT(135,250,7854,667)
                         STRING('DAFTAR HARGA OBAT & ALAT '),AT(42,21,3073,219),LEFT,FONT(,,,FONT:bold)
                         BOX,AT(10,292,7844,365),COLOR(COLOR:Black)
                         LINE,AT(3375,292,0,354),USE(?Line6),COLOR(COLOR:Black)
                         LINE,AT(406,302,0,354),USE(?Line5),COLOR(COLOR:Black)
                         LINE,AT(1125,302,0,354),COLOR(COLOR:Black)
                         LINE,AT(4031,292,0,354),USE(?Line6:2),COLOR(COLOR:Black)
                         STRING('Kode Barang'),AT(427,313,698,167),TRN,FONT('Times New Roman',8,,)
                         STRING('Satuan'),AT(3396,313,385,167),TRN,CENTER,FONT('Times New Roman',8,,)
                         STRING('Harga Jual'),AT(5656,323,667,167),TRN,FONT('Times New Roman',8,,)
                         STRING('Tunai / BPJS'),AT(4438,479,667,167),USE(?String15),TRN,FONT('Times New Roman',8,,)
                         STRING('Mitra'),AT(6552,479,667,167),USE(?String16),TRN,FONT('Times New Roman',8,,)
                         STRING('No.'),AT(83,313,250,167),USE(?String19),TRN,CENTER,FONT('Times New Roman',8,,)
                         STRING('Nama Barang'),AT(1198,313),USE(?String10),TRN,FONT('Times New Roman',8,,)
                       END
break1                 BREAK(APA)
detail1                  DETAIL,AT(,,7833,188),FONT('Arial',8,,FONT:regular)
                           STRING(@s10),AT(458,10,625,146),USE(GBAR:Kode_brg),FONT('Arial',8,,FONT:regular)
                           STRING(@s40),AT(1115,10,2219,146),USE(GBAR:Nama_Brg),FONT('Arial',8,,FONT:regular)
                           STRING(@n5),AT(42,10,333,146),CNT,RESET(break1),USE(vl_no),RIGHT(1),FONT('Arial',8,,FONT:regular)
                           STRING(@s10),AT(3375,10,677,146),USE(GBAR:No_Satuan)
                           STRING(@N-16),AT(4427,0),USE(vl_harga_raja),LEFT(90),FONT('Times New Roman',8,,)
                           STRING(@N16),AT(6542,0),USE(vl_harga_mitra),LEFT(1)
                           STRING(@n3),AT(3906,10),USE(GBAR:FarNonFar),HIDE
                           LINE,AT(10,177,7833,0),COLOR(COLOR:Black)
                         END
                       END
                       FOOTER,AT(146,10677,7833,219)
                         STRING(@N3),AT(6271,10),USE(ReportPageNumber)
                         STRING('Halaman'),AT(5688,10),USE(?String13),TRN,FONT(,10,,,CHARSET:ANSI)
                       END
                     END
EXLClass           EasyExcelA
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
  GlobalErrors.SetProcedureName('PrintDaftarHargaObat2')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  free(Q:Barang)
  vl_nomor = 0
  Relate:GApotik.SetOpenRelated()
  Relate:GApotik.Open                                      ! File ISetupAp used by this procedure, so make sure it's RelationManager is open
  Relate:ISetupAp.Open                                     ! File ISetupAp used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  ! untuk mengambil data setup persentase
  Iset:deskripsi = 'KLS_UC'
  Get(IsetupAp,Iset:by_deskripsi)
  vl_cash = Iset:Nilai
  !message(Iset:Nilai)
  Iset:deskripsi = 'KLS_UN'
  Get(IsetupAp,Iset:by_deskripsi)
  vl_nota = Iset:Nilai
  !message(Iset:Nilai)
  Iset:deskripsi = 'KLS_1'
  Get(IsetupAp,Iset:by_deskripsi)
  vl_kls1 = Iset:Nilai
  !message(Iset:Nilai)
  Iset:deskripsi = 'KLS_2'
  Get(IsetupAp,Iset:by_deskripsi)
  vl_kls2 = Iset:Nilai
  !message(Iset:Nilai)
  Iset:deskripsi = 'KLS_3'
  Get(IsetupAp,Iset:by_deskripsi)
  vl_kls3 = Iset:Nilai
  !message(Iset:Nilai)
  Iset:deskripsi = 'KLS_Vip'
  Get(IsetupAp,Iset:by_deskripsi)
  vl_vip = Iset:Nilai
  !message(Iset:Nilai)
  Iset:deskripsi = 'PPN'
  Get(IsetupAp,Iset:by_deskripsi)
  vl_PPN = Iset:Nilai
  !message(Iset:Nilai)
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintDaftarHargaObat2',ProgressWindow)     ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:GBarang, ?Progress:PctText, Progress:Thermometer, ProgressMgr, GBAR:Nama_Brg)
  ThisReport.AddSortOrder(GBAR:KeyNama)
  ThisReport.AppendOrder('+GBAR:Nama_Brg')
  ThisReport.SetFilter('GBAR:Kode_brg<<>'''' AND GBAR:FarNonFar=0')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  Relate:GBarang.SetQuickScan(1,Propagate:OneMany)
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom=True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  case message('Apa anda ingin Laporan ini di Export ke Excel?','Editor',ICON:question,Button:yes+button:no,button:no,1)
  of button:yes
  EXLClass.Init(true,true,false)
  EXLClass.AddWorkbook
  EXLClass.Write(1,1,'Daftar Harga Obat & Alat',false,true)
  EXLClass.WriteRow(2,1,'No, Kode Barang, Nama Barang, Satuan, Harga Jual Tunai/ BPJS, Harga Jual Mitra',',',false)
  EXLClass.SetFont(,,-1,FONT:Regular)
  EXLClass.WriteQueue(3,1,Q:Barang,1,,false)
  EXLClass.AutoFit
  EXLClass.DrawTable(BoxMode:Box)
  EXLClass.Quit
  EXLClass.Kill
  end
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:GApotik.Close
    Relate:ISetupAp.Close
  END
  IF SELF.Opened
    INIMgr.Update('PrintDaftarHargaObat2',ProgressWindow)  ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    report$?ReportPageNumber{PROP:PageNo}=True
  END
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  GSGD:Kode_brg = GBAR:Kode_brg                            ! Assign linking field value
  Access:GStockGdg.Fetch(GSGD:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  GSGD:Kode_brg = GBAR:Kode_brg                            ! Assign linking field value
  Access:GStockGdg.Fetch(GSGD:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  !vl_harga_raja=((GSGD:Harga_Beli)+(GSGD:Harga_Beli*vl_ppn/100)) + ((GSGD:Harga_Beli)+(GSGD:Harga_Beli*vl_ppn/100)) * vl_cash/100
  !vl_harga_raja_nota=((GSGD:Harga_Beli)+(GSGD:Harga_Beli*vl_ppn/100)) + ((GSGD:Harga_Beli)+(GSGD:Harga_Beli*vl_ppn/100)) * vl_nota/100
  !vl_harga_ranap1=((GSGD:Harga_Beli)+(GSGD:Harga_Beli*vl_ppn/100)) + ((GSGD:Harga_Beli)+(GSGD:Harga_Beli*vl_ppn/100)) * vl_kls1/100
  !vl_harga_ranap2=((GSGD:Harga_Beli)+(GSGD:Harga_Beli*vl_ppn/100)) + ((GSGD:Harga_Beli)+(GSGD:Harga_Beli*vl_ppn/100)) * vl_kls2/100
  !vl_harga_ranap_3=((GSGD:Harga_Beli)+(GSGD:Harga_Beli*vl_ppn/100)) + ((GSGD:Harga_Beli)+(GSGD:Harga_Beli*vl_ppn/100)) * vl_kls3/100
  !vl_harga_ranap_12vip=((GSGD:Harga_Beli)+(GSGD:Harga_Beli*vl_ppn/100)) + ((GSGD:Harga_Beli)+(GSGD:Harga_Beli*vl_ppn/100)) * vl_vip/100
  
  vl_harga_raja   = ((GSGD:Harga_Beli*1.215)*1.1)
  vl_harga_mitra  = ((GSGD:Harga_Beli*1.315)*1.1)
  display
  
  Q:Barang.vl_nomor          += 1
  Q:Barang.vl_kodebarang      =  GBAR:Kode_brg
  Q:Barang.vl_namabarang      =  GBAR:Nama_Brg
  Q:Barang.vl_satuan          =  GBAR:No_Satuan
  Q:Barang.vl_hargajual       =  vl_harga_raja
  Q:Barang.vl_hargajualmitra  =  vl_harga_mitra
  add(Q:Barang)
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail1)
  RETURN ReturnValue

