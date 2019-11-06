

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('APC6N092.INC'),ONCE        !Local module procedure declarations
                     END


ProsesKonvertBarangMK PROCEDURE                            ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
vl_real1             REAL                                  !
vl_real2             REAL                                  !
vl_real3             REAL                                  !
vl_real4             REAL                                  !
vl_real5             REAL                                  !
Process:View         VIEW(MBarangMK)
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
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ProgressMgr          StepClass                             ! Progress Manager
view::count view(filesql)
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
  GlobalErrors.SetProcedureName('ProsesKonvertBarangMK')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:FileSql.Open                                      ! File FileSql used by this procedure, so make sure it's RelationManager is open
  Relate:GBarang.Open                                      ! File FileSql used by this procedure, so make sure it's RelationManager is open
  Relate:MBarangMK.Open                                    ! File FileSql used by this procedure, so make sure it's RelationManager is open
  Access:GStockGdg.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  open(view::count)
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesKonvertBarangMK',ProgressWindow)     ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:MBarangMK, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(MBarangMK,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:FileSql.Close
    Relate:GBarang.Close
    Relate:MBarangMK.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesKonvertBarangMK',ProgressWindow)  ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  GBAR:Kode_Asli      =clip(MBA:Kode)
  if access:gbarang.fetch(GBAR:KeyKodeAsliBrg)<>level:benign then
  
  view::count{prop:sql}='select count(*) from dba.vgbarangnew where substr(kode_brg,1,1)='''&sub(clip(MBA:Nama),1,1)&''''
  next(view::count)
  if not(errorcode()) then
     GBAR:Kode_brg       =upper(sub(clip(MBA:Nama),1,1))&format(FIL:FLong1+1,@p####p)
     GSGD:Kode_brg       =upper(sub(clip(MBA:Nama),1,1))&format(FIL:FLong1+1,@p####p)
     GSTO:Kode_Barang    =upper(sub(clip(MBA:Nama),1,1))&format(FIL:FLong1+1,@p####p)
  else
     GBAR:Kode_brg       =upper(sub(clip(MBA:Nama),1,1))&'0001'
     GSGD:Kode_brg       =upper(sub(clip(MBA:Nama),1,1))&'0001'
     GSTO:Kode_Barang    =upper(sub(clip(MBA:Nama),1,1))&'0001'
  end
  
  GBAR:Nama_Brg       =clip(MBA:Nama)
  GBAR:Jenis_Brg      =clip(MBA:JenisBarang)
  GBAR:No_Satuan      =clip(MBA:SatuanJual)
  GBAR:Dosis          =0
  GBAR:Stok_Total     =0
  GBAR:Kode_UPF       =''
  GBAR:Kode_Apotik    =''
  GBAR:Kelompok       =1
  GBAR:Status         =1
  GBAR:Kode_Asli      =clip(MBA:Kode)
  GBAR:KetSatuan      =''
  GBAR:KelBesar       ='1'
  GBAR:StatusGen      =deformat(clip(MBA:NamaGenerik),@n3)
  GBAR:Sediaan        =clip(MBA:Sediaan)
  GBAR:Farmakolog     =''
  GBAR:StatusBeli     =0
  GBAR:Pabrik         =''
  GBAR:Fungsi         =''
  GBAR:Ket1           =''
  GBAR:Ket2           =''
  GBAR:Kode_Principal =''
  GBAR:KodeBarcode    =''
  GBAR:Harga          =0
  GBAR:Golongan       =''
  GBAR:Kandungan      =''
  GBAR:SatuanBeli     =clip(MBA:SatuanBeli)
  GBAR:Konversi       =deformat(clip(MBA:Isi),@n3)
  access:gbarang.insert()
  
  
  GSGD:Harga_Beli     =format(clip(MBA:HargaJualPerPcs),@n12)
  GSGD:Eoq            =0
  GSGD:Jumlah_Stok    =0
  vl_real2=MBA:HargaJualPerPcs
  if deformat(clip(MBA:HargaJualPerPcs),@n12)=0 then
     GSGD:HargaSebelum   =0
  else
     GSGD:HargaSebelum   =deformat(clip(MBA:HargaJualPerPcs),@n12)
  end
  GSGD:SaldoAwalThn   =0
  vl_real3=MBA:StokMinimal
  if deformat(clip(MBA:StokMinimal),@n9)=0 then
     GSGD:stock_min      =0
  else
     GSGD:stock_min      =deformat(clip(MBA:StokMinimal),@n9)
  end
  GSGD:stock_max      =0
  GSGD:Discount       =0
  GSGD:Saldo_Maksimal =0
  GSGD:HargaJualUmum  =0
  GSGD:HargaJualFT    =0
  GSGD:HargaJualMCU   =0
  vl_real4=MBA:HargaSetelahPPN
  if deformat(clip(MBA:HargaSetelahPPN),@n12)=0 then
     GSGD:HargaTotal     =0
  else
     GSGD:HargaTotal     =deformat(clip(MBA:HargaSetelahPPN),@n12)
  end
  vl_real5=MBA:Isi
  if deformat(clip(MBA:Isi),@n9)=0 then
     GSGD:Konversi       =1
  else
     GSGD:Konversi       =deformat(clip(MBA:Isi),@n9)
  end
  GSGD:SatuanBeli     =clip(MBA:SatuanBeli)
  access:gstockgdg.insert()
  
  
  GSTO:Kode_Apotik    ='FM01'
  GSTO:Saldo_Minimal  =0
  GSTO:Saldo          =0
  GSTO:Harga_Dasar    =format(clip(MBA:HargaJualPerPcs),@n12)
  GSTO:Saldo_Maksimal =0
  access:gstokaptk.insert()
  end
  RETURN ReturnValue

