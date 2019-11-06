

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('APC6N210.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N004.INC'),ONCE        !Req'd for module callout resolution
                     END


PrintTransRawatJalanA5KTT PROCEDURE                        ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
LOC::KOSONG          STRING(20)                            !
loc::nama            STRING(30)                            !
loc::alamat          STRING(30)                            !
vl_jam               TIME                                  !
vl_disk              REAL                                  !
vl_keterangan        STRING(10)                            !
vl_notran            STRING(20)                            !
vl_notran_detail     STRING(20)                            !
vl_kodebarang        STRING(20)                            !
loc:total            REAL                                  !
vl_catatan           STRING(20)                            !
vl_ktt               REAL                                  !
vl_total             REAL                                  !
vl_total2            LONG                                  !
vl_totalhuruf        STRING(100)                           !
Process:View         VIEW(APDTRANS)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:N0_tran)
                       PROJECT(APD:Total)
                       PROJECT(APD:ktt)
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

report               REPORT,AT(3,1,203,135),PAPER(PAPER:USER,8250,5550),PRE(RPT),FONT('Arial',10,,),MM
break1                 BREAK(LOC::KOSONG)
                         HEADER,AT(0,0,,23)
                           STRING('RS. Sartika Asih - Apotik'),AT(3,0,45,4),USE(?String11),TRN,FONT('Times New Roman',8,,FONT:regular)
                           STRING(@s5),AT(38,0,9,4),USE(GL_entryapotik),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING('No. RM'),AT(3,3,12,4),USE(?String20),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING(@N010_),AT(16,3,17,4),USE(APH:Nomor_mr),FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING(@s10),AT(38,3,,4),USE(APH:Asal),FONT('Times New Roman',8,,FONT:regular)
                           STRING(@n1),AT(60,3,5,4),USE(APH:cara_bayar),FONT('Times New Roman',8,,,CHARSET:ANSI)
                           STRING('No. Trans'),AT(3,6,12,4),USE(?String20:4),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING(@s15),AT(16,6,,4),USE(APH:N0_tran),FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING('Nama'),AT(47,6,12,4),USE(?String20:2),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING(@s30),AT(60,6,,4),USE(loc::nama),TRN,FONT('Times New Roman',8,,FONT:regular)
                           STRING('No. Bill'),AT(3,9,12,4),USE(?String20:6),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING(@s10),AT(16,9,,4),USE(APH:NoNota),FONT('Times New Roman',8,,FONT:regular,CHARSET:ANSI)
                           STRING('Alamat'),AT(47,9,12,4),USE(?String20:3),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING(@s30),AT(60,9,,4),USE(loc::alamat),TRN,FONT('Times New Roman',8,,FONT:regular)
                           STRING('Tanggal'),AT(3,12,12,4),USE(?String20:8),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING(@D06),AT(16,12,15,4),USE(APH:Tanggal),FONT('Times New Roman',8,,FONT:regular)
                           STRING('Dokter'),AT(47,12,12,4),USE(?String20:5),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING(@s30),AT(60,12,33,4),USE(JDok:Nama_Dokter),FONT('Times New Roman',8,,FONT:regular)
                           STRING('Jam'),AT(3,15,12,4),USE(?String20:9),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING(@t04),AT(16,15,13,4),USE(APH:Jam),FONT('Times New Roman',8,,FONT:regular)
                           STRING('Penjamin'),AT(47,15,12,4),USE(?String20:7),TRN,FONT('Times New Roman',8,COLOR:Black,FONT:regular)
                           STRING(@s100),AT(60,15),USE(JKon:NAMA_KTR,,?JKon:NAMA_KTR:2),FONT('Times New Roman',8,,,CHARSET:ANSI)
                           BOX,AT(2,18,189,5),COLOR(COLOR:Black)
                           STRING('Kode '),AT(3,18,14,4),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('Nama '),AT(22,18,17,4),USE(?String10),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('Jumlah'),AT(95,18,10,4),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('Total'),AT(118,18,9,4),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('Keterangan'),AT(153,18,16,4),USE(?String36),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('Catatan'),AT(173,18,16,4),USE(?String36:2),TRN,FONT('Times New Roman',8,COLOR:Black,)
                         END
detail1                  DETAIL,AT(,,193,4),USE(?detail1)
                           STRING(@n5.1),AT(95,0,9,4),USE(APD:Jumlah),TRN,LEFT,FONT('Times New Roman',8,,)
                           STRING(@n-15.2),AT(108,0,,4),USE(APD:Total),TRN,RIGHT,FONT('Times New Roman',8,,)
                           STRING(@s10),AT(153,0),USE(vl_keterangan),FONT('Times New Roman',8,,FONT:regular,CHARSET:ANSI)
                           STRING(@s5),AT(173,0),USE(vl_catatan),FONT('Times New Roman',8,,FONT:regular,CHARSET:ANSI)
                           STRING(@n3),AT(182,0),USE(APD:ktt),HIDE
                           STRING(@s10),AT(3,0,,4),USE(APD:Kode_brg),TRN,FONT('Times New Roman',8,,)
                           STRING(@s40),AT(22,0,,4),USE(GBAR:Nama_Brg),TRN,FONT('Times New Roman',8,,)
                         END
                         FOOTER,AT(0,0,,14),FONT('Times New Roman',8,,FONT:regular)
                           STRING('Petugas Apotik'),AT(1,0),USE(?String27),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING(@s10),AT(22,0,17,3),USE(Glo:USER_ID),TRN,CENTER,FONT('Times New Roman',8,COLOR:Black,)
                           STRING('Sub Total : Rp.'),AT(70,0,18,4),USE(?String17),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           LINE,AT(1,0,189,0),USE(?Line9),COLOR(COLOR:Black)
                           STRING(@n-15.2),AT(108,0,,4),SUM,RESET(break1),USE(APD:Total,,?APD:Total:2),TRN,RIGHT,FONT('Times New Roman',8,,)
                           STRING('KTT: Rp.'),AT(70,3,16,4),USE(?String17:3),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING(@N-15.2),AT(108,3,,4),USE(vl_ktt),TRN,RIGHT,FONT('Times New Roman',8,,)
                           STRING('-'),AT(134,3),USE(?String42),TRN
                           STRING('Total : Rp.'),AT(70,7,16,4),USE(?String17:2),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING(@N-15.2),AT(108,7,,4),USE(vl_total),TRN,RIGHT,FONT('Times New Roman',8,,)
                           STRING('Terbilang :'),AT(70,10,16,4),USE(?String17:4),TRN,FONT('Times New Roman',8,COLOR:Black,)
                           STRING(@s100),AT(84,10),USE(vl_totalhuruf),TRN,FONT('Times New Roman',8,,,CHARSET:ANSI)
                           LINE,AT(88,7,45,0),USE(?Line2),COLOR(COLOR:Black)
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
  GlobalErrors.SetProcedureName('PrintTransRawatJalanA5KTT')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  vl_notran=APH:N0_tran
  vl_ktt=0
  vl_total=0
  !vl_total2=round(APH:Biaya,1)
  
  vl_jam = CLOCK()
  Relate:APDTRANS.Open                                     ! File JTransaksi used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ApReLuar.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JTransaksi.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintTransRawatJalanA5KTT',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:APDTRANS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, APD:N0_tran)
  ThisReport.AddSortOrder(APD:by_transaksi)
  ThisReport.AddRange(APD:N0_tran,Relate:APDTRANS,Relate:APHTRANS)
  ThisReport.SetFilter('APD:camp=0 or (apd:camp<<>0 and sub(APD:kode_brg,1,7)=''_Campur'')')
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
    INIMgr.Update('PrintTransRawatJalanA5KTT',ProgressWindow) ! Save window data to non-volatile store
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
  vl_keterangan = ''
  vl_catatan=''
  if APH:N0_tran=vl_notran then
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
      !APD:total=0
      vl_ktt+=APD:total
      vl_catatan='KTT'
      vl_total-=APD:total
  end
  if vl_total<0 then
      vl_totalhuruf='MINUS '&clip(angkaketulisan(vl_total*-1))&' RUPIAH'
  else
      vl_totalhuruf=clip(angkaketulisan(vl_total))&' RUPIAH'
  end
  print(RPT:detail1)
  end
  
  !aphtrans{prop:sql}='select * from dba.aphtrans where NoTransaksiAsal='''&vl_notran&''''
  !loop
  !    if access:aphtrans.next()<>level:benign then break.
  !    vl_notran_detail = APH:N0_tran
  !    vl_kodebarang = APD:Kode_brg
  !    apdtrans{prop:sql}='select * from dba.apdtrans where n0_tran='''&vl_notran_detail&''' and kode_brg='''&vl_kodebarang&''''
  !    loop
  !        if access:apdtrans.next()<>level:benign then break.
  !            vl_keterangan = 'Retur'
  !            vl_total+=APD:total
  !            if APD:ktt=1 then
  !                vl_ktt+=APD:total
  !                vl_total-=APD:total
  !            end
  !            Print(RPT:detail1)
  !    end
  !end
  
  aphtrans{prop:sql}='select * from dba.aphtrans where NoTransaksiAsal='''&vl_notran&''''
  loop
      if access:aphtrans.next()<>level:benign then break.
      vl_notran_detail = APH:N0_tran
      vl_kodebarang = APD:Kode_brg
      APD:N0_tran=vl_notran_detail
      APD:Kode_brg=vl_kodebarang
      set(APD:by_tran_kdbrg,APD:by_tran_kdbrg)
      loop
          next(apdtrans)
          if errorcode() or APD:N0_tran<>vl_notran_detail or APD:Kode_brg<>vl_kodebarang then break.
              vl_keterangan = 'Retur'
              vl_total+=APD:total
              if APD:ktt=1 then
                  vl_ktt+=APD:total
                  vl_total-=APD:total
              end
              if vl_total<0 then
                  vl_totalhuruf='MINUS '&clip(angkaketulisan(vl_total*-1))&' RUPIAH'
              else
                  vl_totalhuruf=clip(angkaketulisan(vl_total))&' RUPIAH'
              end
              Print(RPT:detail1)
      end
  end
  display
  
  IF ?detail1=1
    PRINT(RPT:detail1)
  END
  RETURN ReturnValue

