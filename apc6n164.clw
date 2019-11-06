

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('APC6N164.INC'),ONCE        !Local module procedure declarations
                     END


ProsesBarangLog PROCEDURE                                  ! Generated from procedure template - Process

Progress:Thermometer BYTE                                  !
vl_jum1              LONG                                  !
Process:View         VIEW(HM_BRGLOGISTIK)
                     END
ProgressWindow       WINDOW('Process HM_BARANGNEW'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),FLAT,LEFT,MSG('Cancel Process'),TIP('Cancel Process'),ICON('WACANCEL.ICO')
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ProgressMgr          StepClass                             ! Progress Manager
view::jum view(filesql)
            project(FIL:FLong1)
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
  GlobalErrors.SetProcedureName('ProsesBarangLog')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:FileSql.Open                                      ! File HM_BARANGNEW used by this procedure, so make sure it's RelationManager is open
  Relate:GBarang.Open                                      ! File HM_BARANGNEW used by this procedure, so make sure it's RelationManager is open
  Relate:HM_BARANGNEW.Open                                 ! File HM_BARANGNEW used by this procedure, so make sure it's RelationManager is open
  Relate:HM_BRGLOGISTIK.Open                               ! File HM_BARANGNEW used by this procedure, so make sure it's RelationManager is open
  Relate:VGBarangNew.Open                                  ! File HM_BARANGNEW used by this procedure, so make sure it's RelationManager is open
  Access:GStockGdg.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  open(view::jum)
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesBarangLog',ProgressWindow)           ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:HM_BRGLOGISTIK, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(HM_BRGLOGISTIK,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  close(view::jum)
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:FileSql.Close
    Relate:GBarang.Close
    Relate:HM_BARANGNEW.Close
    Relate:HM_BRGLOGISTIK.Close
    Relate:VGBarangNew.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesBarangLog',ProgressWindow)        ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  !message('select count(*) from dba.vgbarangnew where substr(Nama_Brg,1,1)='''&sub(clip(HM_:NAMABARANG),1,1)&'''')
  view::jum{prop:sql}='select count(*) from dba.vgbarangnew where substr(Nama_Brg,1,1)='''&sub(clip(HM_2:Column2),1,1)&''' and farnonfar=1'
  view::jum{prop:sql}='select count(*) from dba.vgbarangnew where substr(Nama_Brg,1,1)='''&sub(clip(HM_2:Column2),1,1)&''' and farnonfar=1'
  next(view::jum)
  if not(errorcode()) then
     vl_jum1=FIL:FLong1+1
  else
     vl_jum1=1
  end
  
  if sub(clip(HM_2:Column1),1,1)<>'' then
  
     GBAR:Kode_brg       ='N'&sub(clip(HM_2:Column2),1,1)&format(vl_jum1,@P####P)
     if access:gbarang.fetch(GBAR:KeyKodeBrg)<>level:benign then
        GBAR:Kode_brg       ='N'&sub(clip(HM_2:Column2),1,1)&format(vl_jum1,@P####P)
        GBAR:Nama_Brg       =clip(HM_2:Column2)
        GBAR:Jenis_Brg      =''
        GBAR:No_Satuan      =clip(HM_2:Column4)
        GBAR:Dosis          =0
        GBAR:Stok_Total     =0
        GBAR:Kode_UPF       =''
        GBAR:Kode_Apotik    =''
        GBAR:Kelompok       =0
        GBAR:Status         =1
        GBAR:Kode_Asli      =''
        GBAR:KetSatuan      =''
        GBAR:KelBesar       =''
        GBAR:StatusGen=7
        GBAR:Sediaan        =''
        GBAR:Farmakolog     =''
        GBAR:StatusBeli     =0
        GBAR:Pabrik         =''
        GBAR:Fungsi         =''
        GBAR:Ket1           =clip(HM_2:Column1)
        GBAR:Ket2           =clip(HM_2:Column3)
        GBAR:Kode_Principal =''
        GBAR:KodeBarcode    =''
        GBAR:Harga          =0
        GBAR:Golongan       =''
        GBAR:Kandungan      =''
        GBAR:SatuanBeli     =clip(HM_2:Column4)
        GBAR:Konversi       =1
        GBAR:FarNonFar      =1
        access:gbarang.insert()
                             
        GSGD:Kode_brg       ='N'&sub(clip(HM_2:Column2),1,1)&format(vl_jum1,@P####P)
        if access:gstockgdg.fetch(GSGD:KeyKodeBrg)<>level:benign then
           GSGD:Kode_brg       ='N'&sub(clip(HM_2:Column2),1,1)&format(vl_jum1,@P####P)
           GSGD:Harga_Beli     =HM_2:Column8
           GSGD:Eoq            =0
           GSGD:Jumlah_Stok    =0
           GSGD:HargaSebelum   =HM_2:Column8
           GSGD:SaldoAwalThn   =0
           GSGD:stock_min      =0
           GSGD:stock_max      =0
           GSGD:Discount       =0
           GSGD:Saldo_Maksimal =0
           GSGD:HargaJualUmum  =0
           GSGD:HargaJualFT    =0
           GSGD:HargaJualMCU   =0
           GSGD:HargaTotal     =0
           GSGD:Konversi       =1
           GSGD:SatuanBeli     =1
           access:gstockgdg.insert()
        end
  
     end
  end
  RETURN ReturnValue

