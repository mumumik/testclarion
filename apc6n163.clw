

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('APC6N163.INC'),ONCE        !Local module procedure declarations
                     END


ProsesIsiStokFIFOKartuSTOK PROCEDURE                       ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
Process:View         VIEW(GBarang)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ProgressMgr          StepClass                             ! Progress Manager

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
  GlobalErrors.SetProcedureName('ProsesIsiStokFIFOKartuSTOK')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File APKStok used by this procedure, so make sure it's RelationManager is open
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStockGdg.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APKStok.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesIsiStokFIFOKartuSTOK',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:GBarang, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(GBarang,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AFIFOIN.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesIsiStokFIFOKartuSTOK',ProgressWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  GSTO:Kode_Barang=GBAR:Kode_brg
  GSTO:Kode_Apotik=GL_entryapotik
  if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
     GSTO:Kode_Barang    =GBAR:Kode_brg
     GSTO:Kode_Apotik    =GL_entryapotik
     if access:gstokaptk.fetch(GSTO:KeyBarang)<>level:benign then
        GSTO:Kode_Barang     =GBAR:Kode_brg
        GSTO:Kode_Apotik     =GL_entryapotik
        GSTO:Saldo_Minimal   =0
        GSTO:Saldo           =1000
        GSTO:Harga_Dasar     =GSGD:Harga_Beli
        GSTO:Saldo_Maksimal  =0
        access:gstokaptk.insert()
     else
        GSTO:Saldo           =GSTO:Saldo+1000
        access:gstokaptk.update()
     end
  
     AFI:Kode_Barang          =GBAR:Kode_brg
     AFI:Mata_Uang            ='Rp'
     AFI:NoTransaksi          ='OPPertama'
     AFI:Transaksi            =1
     AFI:Tanggal              =today()
     AFI:Harga                =GSGD:Harga_Beli
     AFI:Jumlah               =1000
     AFI:Jumlah_Keluar        =0
     AFI:Tgl_Update           =today()
     AFI:Jam_Update           =clock()
     AFI:Operator             =vg_user
     AFI:Jam                  =clock()
     AFI:Kode_Apotik          ='FM01'
     AFI:Status               =0
     AFI:ExpireDate           =date(1,1,2020)
     access:afifoin.insert()
  
     APK:Kode_Barang          =GBAR:Kode_brg
     APK:Tanggal              =today()
     APK:Jam                  =clock()
     APK:Transaksi            =1
     APK:NoTransaksi          ='OPPertama'
     APK:Debet                =1000
     APK:Kredit               =0
     APK:Opname               =0
     APK:Kode_Apotik          ='FM01'
     APK:Status               =0
     access:apkstok.insert()
  end
  
  RETURN ReturnValue

