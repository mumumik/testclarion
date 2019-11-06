

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('APC6N165.INC'),ONCE        !Local module procedure declarations
                     END


ProsesBarangTertinggal PROCEDURE                           ! Generated from procedure template - Process

Progress:Thermometer BYTE                                  !
vl_jum1              LONG                                  !
Process:View         VIEW(HM_BARANGNEW)
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

view::kode view(filesql)
            project(FIL:FString1)
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
  GlobalErrors.SetProcedureName('ProsesBarangTertinggal')
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
  Relate:HM_BARANGNEW.Open                                 ! File FileSql used by this procedure, so make sure it's RelationManager is open
  Relate:VGBarangNew.Open                                  ! File FileSql used by this procedure, so make sure it's RelationManager is open
  Access:GStockGdg.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  open(view::jum)
  open(view::kode)
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesBarangTertinggal',ProgressWindow)    ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:HM_BARANGNEW, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(HM_BARANGNEW,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  close(view::jum)
  close(view::kode)
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:FileSql.Close
    Relate:GBarang.Close
    Relate:HM_BARANGNEW.Close
    Relate:VGBarangNew.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesBarangTertinggal',ProgressWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
     GBAR:Ket1=clip(HM_:KODEBARANG)
     if access:gbarang.fetch(GBAR:Ket1_gbarang_fk)<>level:benign then
           view::kode{prop:sql}='select kode_brg from dba.vgbarangnew where substr(kode_Brg,1,1)='''&sub(clip(HM_:NAMABARANG),1,1)&''' and farnonfar=0 order by kode_brg desc'
           view::kode{prop:sql}='select kode_brg from dba.vgbarangnew where substr(kode_Brg,1,1)='''&sub(clip(HM_:NAMABARANG),1,1)&''' and farnonfar=0 order by kode_brg desc'
           next(view::kode)
           if not(errorcode()) then
              vl_jum1=Deformat(sub(clip(FIL:FString1),2,5),@n5)+1
           else
              vl_jum1=1
           end
  
           GBAR:Kode_brg       =sub(clip(HM_:NAMABARANG),1,1)&format(vl_jum1,@P#####P)
           if access:gbarang.fetch(GBAR:KeyKodeBrg)<>level:benign then
              GBAR:Kode_brg       =sub(clip(HM_:NAMABARANG),1,1)&format(vl_jum1,@P#####P)
              GBAR:Nama_Brg       =clip(HM_:NAMABARANG)
              GBAR:Jenis_Brg      =''
              GBAR:No_Satuan      =HM_:SATUANJUAL
              GBAR:Dosis          =0
              GBAR:Stok_Total     =0
              GBAR:Kode_UPF       =''
              GBAR:Kode_Apotik    =''
              GBAR:Kelompok       =0
              GBAR:Status         =1
              GBAR:Kode_Asli      =''
              GBAR:KetSatuan      =''
              GBAR:KelBesar       =''
                 case HM_:KDGRPROFIT
                 of '01'
                    GBAR:StatusGen=0
                 of '02'
                    GBAR:StatusGen=1
                 of '03'
                    GBAR:StatusGen=2
                 of '05'
                    GBAR:StatusGen=3
                 of 'A1'
                    GBAR:StatusGen=4
                 of 'A2'
                    GBAR:StatusGen=5
                 else
                    GBAR:StatusGen=6
                 end
              
              GBAR:Sediaan        =''
              GBAR:Farmakolog     =''
              GBAR:StatusBeli     =0
              GBAR:Pabrik         =''
              GBAR:Fungsi         =''
              GBAR:Ket1           =HM_:KODEBARANG
              GBAR:Ket2           =''
              GBAR:Kode_Principal =''
              GBAR:KodeBarcode    =''
              GBAR:Harga          =0
              GBAR:Golongan       =''
              GBAR:Kandungan      =''
              GBAR:SatuanBeli     =HM_:KODESM
              GBAR:Konversi       =HM_:SAT_INDEKS
              access:gbarang.insert()
           else
              message(sub(clip(HM_:NAMABARANG),1,1)&format(vl_jum1,@P#####P))
           end
                                
           GSGD:Kode_brg       =sub(clip(HM_:NAMABARANG),1,1)&format(vl_jum1,@P#####P)
           if access:gstockgdg.fetch(GSGD:KeyKodeBrg)<>level:benign then
              GSGD:Kode_brg       =sub(clip(HM_:NAMABARANG),1,1)&format(vl_jum1,@P#####P)
              GSGD:Harga_Beli     =HM_:HARGABELI*1.1
              GSGD:Eoq            =0
              GSGD:Jumlah_Stok    =0
              GSGD:HargaSebelum   =HM_:HARGABELI
              GSGD:SaldoAwalThn   =0
              GSGD:stock_min      =0
              GSGD:stock_max      =0
              GSGD:Discount       =0
              GSGD:Saldo_Maksimal =0
              GSGD:HargaJualUmum  =0
              GSGD:HargaJualFT    =0
              GSGD:HargaJualMCU   =0
              GSGD:HargaTotal     =HM_:HARGABELI*HM_:SAT_INDEKS
              GSGD:Konversi       =HM_:SAT_INDEKS
              GSGD:SatuanBeli     =HM_:KODESM
              access:gstockgdg.insert()
  
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
  
           GSTO:Kode_Apotik    ='FM01'
           GSTO:Kode_Barang    =sub(clip(HM_:NAMABARANG),1,1)&format(vl_jum1,@P#####P)
           if access:gstokaptk.fetch(GSTO:KeyBarang)<>level:benign then
              GSTO:Kode_Apotik    ='FM01'
              GSTO:Kode_Barang    =sub(clip(HM_:NAMABARANG),1,1)&format(vl_jum1,@P#####P)
              GSTO:Saldo          =1000
              GSTO:Harga_Dasar    =HM_:HARGABELI*1.1
              GSTO:Saldo_Maksimal =0
              access:gstokaptk.insert()
           end
  
           
     end
  RETURN ReturnValue

