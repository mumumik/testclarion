

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('APC6N190.INC'),ONCE        !Local module procedure declarations
                     END


ProsesObatRanap PROCEDURE                                  ! Generated from procedure template - Process

Progress:Thermometer BYTE                                  !
Process:View         VIEW(APDTRANS)
                       PROJECT(APD:Harga_Dasar)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:N0_tran)
                       PROJECT(APD:Total)
                       JOIN(GBAR:KeyKodeBrg,APD:Kode_brg)
                         PROJECT(GBAR:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                       END
                       JOIN(APH:by_transaksi,APD:N0_tran)
                         PROJECT(APH:N0_tran)
                         PROJECT(APH:Nomor_mr)
                         PROJECT(APH:Ra_jal)
                         PROJECT(APH:Urut)
                         JOIN(RI_HR:PrimaryKey,APH:Nomor_mr,APH:Urut)
                           PROJECT(RI_HR:Nomor_mr)
                           PROJECT(RI_HR:StatusTutup)
                           PROJECT(RI_HR:TglTutup)
                           PROJECT(RI_HR:nomortrans)
                           JOIN(JPas:KeyNomorMr,RI_HR:Nomor_mr)
                             PROJECT(JPas:Nama)
                             PROJECT(JPas:Nomor_mr)
                           END
                         END
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
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
  GlobalErrors.SetProcedureName('ProsesObatRanap')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('VG_TANGGAL1',VG_TANGGAL1)                          ! Added by: Process
  BIND('VG_TANGGAL2',VG_TANGGAL2)                          ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Free(QRinObat)
  Relate:APDTRANS.Open                                     ! File APDTRANS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesObatRanap',ProgressWindow)           ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisProcess.Init(Process:View, Relate:APDTRANS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, APD:N0_tran)
  ThisProcess.AddSortOrder(APD:notran_kode)
  ThisProcess.SetFilter('sub(APH:N0_tran,1,3)=''API'' and RI_HR:TglTutup>=VG_TANGGAL1 and RI_HR:TglTutup <<= VG_TANGGAL2 and RI_HR:StatusTutup = 1')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(APDTRANS,'QUICKSCAN=on')
  SEND(GBarang,'QUICKSCAN=on')
  SEND(APHTRANS,'QUICKSCAN=on')
  SEND(RI_HRInap,'QUICKSCAN=on')
  SEND(JPasien,'QUICKSCAN=on')
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
    INIMgr.Update('ProsesObatRanap',ProgressWindow)        ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  APH:N0_tran = APD:N0_tran                                ! Assign linking field value
  Access:APHTRANS.Fetch(APH:by_transaksi)
  RI_HR:Nomor_mr = APH:Nomor_mr                            ! Assign linking field value
  RI_HR:NoUrut = APH:Urut                                  ! Assign linking field value
  Access:RI_HRInap.Fetch(RI_HR:PrimaryKey)
  JPas:Nomor_mr = RI_HR:Nomor_mr                           ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  APH:N0_tran = APD:N0_tran                                ! Assign linking field value
  Access:APHTRANS.Fetch(APH:by_transaksi)
  RI_HR:Nomor_mr = APH:Nomor_mr                            ! Assign linking field value
  RI_HR:NoUrut = APH:Urut                                  ! Assign linking field value
  Access:RI_HRInap.Fetch(RI_HR:PrimaryKey)
  JPas:Nomor_mr = RI_HR:Nomor_mr                           ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  QRinObat_NoTran = RI_HR:nomortrans
  QRinObat_TransApotik = APD:N0_tran
  QRinObat_KodeBarang = APD:Kode_brg
  get(QRinObat,QRinObat_NoTran,QRinObat_TransApotik,QRinObat_KodeBarang)
  if not errorcode() then
  
  else
    ! message('RI_HR:nomortrans = '&RI_HR:nomortrans)
     QRinObat_NoTran = RI_HR:nomortrans
     !message('QRinObat_NoTran = '&QRinObat_NoTran)
     QRinObat_TransApotik = APD:N0_tran
     QRinObat_KodeBarang = APD:Kode_brg
     QRinObat_NoMR      = APH:Nomor_mr
     QRinObat_NamaPasien = JPas:Nama
     QRinObat_tglTutup   = RI_HR:TglTutup
     QRinObat_NamaBarang = GBAR:Nama_Brg
     QRinObat_HPP        = APD:Harga_Dasar * APD:Jumlah
     QRinObat_HargaJual  = APD:Total
     QRinObat_Fee        = APD:Total * 0.025
     QRinObat_Margin     = QRinObat_HargaJual - QRinObat_HPP
     add(QRinObat,QRinObat_NoTran,QRinObat_TransApotik,QRinObat_KodeBarang)
  end
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue

