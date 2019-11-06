

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('APC6N211.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N004.INC'),ONCE        !Req'd for module callout resolution
                     END


printRincianObatRanapPerNoreg PROCEDURE                    ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
LOC::KOSONG          STRING(20)                            !
loc::nama            STRING(30)                            !
loc::alamat          STRING(30)                            !
vl_jam               TIME                                  !
vl_disk              REAL                                  !
vl_notran            STRING(20)                            !
vl_notran_detail     STRING(20)                            !
vl_kodebarang        STRING(20)                            !
vl_keterangan        STRING(10)                            !
loc:total            REAL                                  !
vl_catatan           STRING(5)                             !
vl_ktt               REAL                                  !
vl_total             REAL                                  !
vl_totalhuruf        STRING(100)                           !
Process:View         VIEW(APHTRANS)
                       PROJECT(APH:Asal)
                       PROJECT(APH:N0_tran)
                       PROJECT(APH:Nomor_mr)
                       PROJECT(APH:Tanggal)
                       PROJECT(APH:cara_bayar)
                       PROJECT(APH:dokter)
                       PROJECT(APH:Kontrak)
                       JOIN(JDok:KeyKodeDokter,APH:dokter)
                       END
                       JOIN(JKon:KeyKodeKtr,APH:Kontrak)
                       END
                       JOIN(APD:notran_kode,APH:N0_tran)
                         PROJECT(APD:Jumlah)
                         PROJECT(APD:Kode_brg)
                         PROJECT(APD:Total)
                         PROJECT(APD:ktt)
                         JOIN(GBAR:KeyKodeBrg,APD:Kode_brg)
                           PROJECT(GBAR:Nama_Brg)
                         END
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
                         HEADER,AT(0,0,,23),FONT('Times New Roman',8,,,CHARSET:ANSI)
                           STRING('RS. Sartika Asih - Apotik'),AT(2,0,45,4),USE(?String11),TRN,FONT('Times New Roman',8,,FONT:regular)
                           STRING(@s5),AT(37,0,9,4),USE(GL_entryapotik),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING('No. RM'),AT(2,3,12,4),USE(?String20),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING(@N010_),AT(15,3,17,4),USE(APH:Nomor_mr),FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING(@s10),AT(37,3,17,4),USE(APH:Asal),FONT('Times New Roman',8,,FONT:regular)
                           STRING(@n1),AT(46,0,5,4),USE(APH:cara_bayar)
                           STRING('Nama'),AT(2,9,12,4),USE(?String20:2),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING(@s30),AT(15,9,,4),USE(loc::nama),TRN,FONT('Times New Roman',8,,FONT:regular)
                           STRING('No. Bill'),AT(2,6,12,4),USE(?String20:6),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING(@s15),AT(15,6,25,3),USE(glo::no_nota)
                           STRING('Alamat'),AT(2,12,12,4),USE(?String20:3),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING(@s30),AT(15,12,,4),USE(loc::alamat),TRN,FONT('Times New Roman',8,,FONT:regular)
                           BOX,AT(1,18,189,5),COLOR(COLOR:Black)
                           STRING('No.Transaksi'),AT(2,18,20,4),USE(?String48),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('Tanggal'),AT(28,18,20,4),USE(?String48:2),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('Kode '),AT(48,18,14,4),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('Nama '),AT(65,18,17,4),USE(?String10),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('Jumlah'),AT(121,18,10,4),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('Total'),AT(139,18,9,4),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('Keterangan'),AT(154,18,16,4),USE(?String36),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('Catatan'),AT(172,18,16,4),USE(?String36:2),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         END
detail1                  DETAIL,AT(,,193,4),USE(?detail1)
                           STRING(@s15),AT(2,0,25,4),USE(APH:N0_tran,,?APH:N0_tran:2),FONT('Times New Roman',8,,,CHARSET:ANSI)
                           STRING(@D8),AT(28,0,19,3),USE(APH:Tanggal),FONT('Times New Roman',8,,,CHARSET:ANSI)
                           STRING(@n5.1),AT(121,0,,4),USE(APD:Jumlah),TRN,LEFT,FONT('Times New Roman',8,,)
                           STRING(@N-15.2),AT(129,0,,4),USE(APD:Total),TRN,RIGHT,FONT('Times New Roman',8,,)
                           STRING(@s10),AT(154,0),USE(vl_keterangan),LEFT,FONT('Times New Roman',8,,FONT:regular,CHARSET:ANSI)
                           STRING(@s5),AT(172,0),USE(vl_catatan),FONT('Times New Roman',8,,FONT:regular,CHARSET:ANSI)
                           STRING(@s10),AT(47,0,,4),USE(APD:Kode_brg),TRN,FONT('Times New Roman',8,,)
                           STRING(@s40),AT(65,0,,4),USE(GBAR:Nama_Brg),TRN,FONT('Times New Roman',8,,)
                           STRING(@n3),AT(182,0),USE(APD:ktt),HIDE
                         END
                         FOOTER,AT(0,0,,15),FONT('Times New Roman',8,,FONT:regular)
                           STRING('Petugas Apotik'),AT(1,0),USE(?String27),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING(@s10),AT(21,0,17,3),USE(Glo:USER_ID),TRN,CENTER,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('Sub Total : Rp.'),AT(95,0,18,4),USE(?String17:2),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('Total : Rp.'),AT(95,8,16,4),USE(?String17),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING(@N-15.2),AT(129,8,,4),USE(vl_total),TRN,RIGHT,FONT('Times New Roman',8,,)
                           STRING('Terbilang :'),AT(95,11,16,4),USE(?String17:4),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING(@s100),AT(109,11,,4),USE(vl_totalhuruf),TRN
                           STRING('-'),AT(154,5),USE(?String42),TRN
                           LINE,AT(114,8,39,0),USE(?Line2),COLOR(COLOR:Black)
                           LINE,AT(1,0,189,0),USE(?Line9),COLOR(COLOR:Black)
                           STRING(@n-15.2),AT(129,0,,4),SUM,RESET(break1),USE(APD:Total,,?APD:Total:2),TRN,RIGHT,FONT('Times New Roman',8,,)
                           STRING('KTT : Rp.'),AT(95,4,16,4),USE(?String17:3),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING(@N-15.2),AT(129,4,,4),USE(vl_ktt),TRN,RIGHT,FONT('Times New Roman',8,,)
                         END
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
  GlobalErrors.SetProcedureName('printRincianObatRanapPerNoreg')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Glo::no_mr',Glo::no_mr)                            ! Added by: Report
  BIND('glo:urut',glo:urut)                                ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  vl_notran=APH:N0_tran
  vl_ktt=0
  vl_total=0
  
  vl_jam = CLOCK()
  Relate:APHTRANS.SetOpenRelated()
  Relate:APHTRANS.Open                                     ! File JTransaksi used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ApReLuar.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JTransaksi.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('printRincianObatRanapPerNoreg',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:APHTRANS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, APH:N0_tran)
  ThisReport.AddSortOrder(APH:by_transaksi)
  ThisReport.SetFilter('APH:Nomor_mr=Glo::no_mr and APH:Urut=glo:urut')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  Relate:APHTRANS.SetQuickScan(1,Propagate:OneMany)
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
    Relate:APHTRANS.Close
  END
  IF SELF.Opened
    INIMgr.Update('printRincianObatRanapPerNoreg',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.OpenReport()
  JPas:Nomor_mr=APH:Nomor_mr
  if access:jpasien.fetch(JPas:KeyNomorMr)=level:benign then
      loc::nama=JPas:Nama
      loc::alamat=JPas:Alamat
  ELSE
      loc::nama=''
      loc::alamat=''
  END
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
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
  vl_keterangan = ''
  vl_catatan=''
      if APD:Diskon<>0 then
          vl_disk=(APD:Diskon/APD:Total)*100
      else
          vl_disk=0
      end
      loc:total=0
      if sub(APD:Kode_brg,1,7)='_Campur' then
          apdtrans{prop:sql}='select * from dba.apdtrans where n0_tran='''&APH:N0_tran&''' and camp='''&APD:Camp&''''
          loop
              if access:apdtrans.next()<>level:benign then break.
              loc:total += APD:Total
          end
          APD:total=loc:total
      end
      vl_total+=APD:total
      if APD:ktt=1 then
          vl_ktt+=APD:Total
          vl_catatan='KTT'
          vl_total-=APD:Total
      end
      if vl_total<0 then
          vl_totalhuruf='MINUS '&clip(angkaketulisan(vl_total*-1))&' RUPIAH'
      else
          vl_totalhuruf=clip(angkaketulisan(vl_total))&' RUPIAH'
      end
      if  APD:Total<0 then
          vl_keterangan='Retur'
      end
  display
  PRINT(RPT:detail1)
  RETURN ReturnValue

