

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N056.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N030.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N055.INC'),ONCE        !Req'd for module callout resolution
                     END


ProsesMutasFM04MeiJuni PROCEDURE                           ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
vl_ada_opname        BYTE                                  !
vl_no                LONG                                  !
vl_ada               BYTE                                  !
Progress:Thermometer BYTE                                  !
loc::tanggal         DATE                                  !
loc::komentar        STRING(60)                            !
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
loc:tahun            SHORT                                 !
loc:bulan            SHORT                                 !
Process:View         VIEW(GStokAptk)
                       PROJECT(GSTO:Harga_Dasar)
                       PROJECT(GSTO:Kode_Barang)
                       JOIN(GBAR:KeyKodeBrg,GSTO:Kode_Barang)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,74),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                       ENTRY(@n-14),AT(50,60,42,10),USE(vl_no),RIGHT(1)
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
  GlobalErrors.SetProcedureName('ProsesMutasFM04MeiJuni')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Glo::kode_apotik',Glo::kode_apotik)                ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  WindowBulanTahun()
  loc:bulan=glo:bulan-1
  if loc:bulan=0 then
     loc:bulan=12
     loc:tahun=glo:tahun-1
  else
     loc:tahun=glo:tahun
  end
  display
  
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File ApStokop used by this procedure, so make sure it's RelationManager is open
  Relate:ApStokop.Open                                     ! File ApStokop used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql.Open                                      ! File ApStokop used by this procedure, so make sure it's RelationManager is open
  Relate:Tbstawal.Open                                     ! File ApStokop used by this procedure, so make sure it's RelationManager is open
  Access:ASaldoAwal.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GApotik.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APKStok.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesMutasFM04MeiJuni',ProgressWindow)    ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisProcess.Init(Process:View, Relate:GStokAptk, ?Progress:PctText, Progress:Thermometer, ProgressMgr, GSTO:Kode_Barang)
  ThisProcess.AddSortOrder(GSTO:KeyBarang)
  ThisProcess.SetFilter('GSTO:Kode_Apotik=Glo::kode_apotik and gsto:kode_barang<<>'''' and gsto:kode_barang<<>''0{10}''')
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
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AFIFOIN.Close
    Relate:ApStokop.Close
    Relate:FileSql.Close
    Relate:Tbstawal.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesMutasFM04MeiJuni',ProgressWindow) ! Save window data to non-volatile store
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


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

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
  
  Apso:Kode_Apotik    =GSTO:Kode_Apotik
  Apso:Kode_Barang    =GSTO:Kode_Barang
  Apso:Tahun          =loc:tahun
  Apso:Bulan          =loc:bulan
  if access:apstokop.fetch(Apso:kdapotik_brg)=level:benign then
     vl_ada=1
     vl_saldo_awal          =Apso:StHitung
     vl_saldo_awal_rp       =Apso:Harga
     vl_saldo_awal_total    =Apso:StHitung*Apso:Harga
  
     vl_saldo_akhir         =Apso:StHitung
     vl_saldo_akhir_total   =Apso:StHitung*Apso:Harga
  end
  
  if vl_ada=0 then
     ASA:Kode_Barang     =GSTO:Kode_Barang
     ASA:Apotik          =GSTO:Kode_Apotik
     ASA:Bulan           =loc:bulan
     ASA:Tahun           =loc:tahun
     if access:asaldoawal.fetch(ASA:PrimaryKey)=level:benign then
        vl_saldo_awal          =ASA:Jumlah
        vl_saldo_awal_rp       =ASA:Harga
        vl_saldo_awal_total    =ASA:Total
        vl_saldo_akhir         =ASA:Jumlah
        vl_saldo_akhir_total   =ASA:Total
     end
  end
  
  if vl_saldo_awal=0 then
     vl_saldo_awal_rp       =0
     vl_saldo_awal_total    =0
  end
  
  apkstok{prop:sql}='select * from dba.apkstok where kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''' and month(tanggal)='&loc:bulan&' and year(tanggal)='&loc:tahun&' order by tanggal,jam'
  apkstok{prop:sql}='select * from dba.apkstok where kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''' and month(tanggal)='&loc:bulan&' and year(tanggal)='&loc:tahun&' order by tanggal,jam'
  loop
     if access:apkstok.next()<>level:benign then break.
     if sub(APK:NoTransaksi,1,3)<>'OPN' then
        !Jika Debet
        vl_debet             +=APK:Debet
        vl_debet_total       +=APK:Debet*GSTO:Harga_Dasar*1.1
  
        vl_saldo_akhir       +=APK:Debet
        vl_saldo_akhir_total +=APK:Debet*GSTO:Harga_Dasar*1.1
  
        !Jika Kredit
        vl_kredit            +=APK:Kredit
        vl_kredit_total      +=APK:Kredit*GSTO:Harga_Dasar*1.1
  
        vl_saldo_akhir       -=APK:Kredit
        vl_saldo_akhir_total -=APK:Kredit*GSTO:Harga_Dasar*1.1
     end
  end
  
  vl_debet_rp         =vl_debet_total/vl_debet
  vl_kredit_rp        =vl_kredit_total/vl_kredit
  vl_saldo_akhir_rp   =vl_saldo_akhir_total/vl_saldo_akhir
  display
  
  
  ASA:Kode_Barang     =GBAR:Kode_brg
  ASA:Apotik          =glo::kode_apotik
  ASA:Bulan           =glo:bulan
  ASA:Tahun           =glo:tahun
  if access:asaldoawal.fetch(ASA:PrimaryKey)<>level:benign then
     if vl_saldo_akhir=0 then
        ASA:Kode_Barang     =GBAR:Kode_brg
        ASA:Apotik          =Glo::kode_apotik
        ASA:Bulan           =glo:bulan
        ASA:Tahun           =glo:tahun
        ASA:Jumlah          =0
        ASA:Harga           =0
        ASA:Total           =0
        access:asaldoawal.insert()
     else
        ASA:Kode_Barang     =GBAR:Kode_brg
        ASA:Apotik          =Glo::kode_apotik
        ASA:Bulan           =glo:bulan
        ASA:Tahun           =glo:tahun
        ASA:Jumlah          =vl_saldo_akhir
        ASA:Harga           =vl_saldo_akhir_rp
        ASA:Total           =vl_saldo_akhir*vl_saldo_akhir_rp
        access:asaldoawal.insert()
     end
  end
  
  vl_no+=1
  display
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue

ProsesOpnameFM04Juli2003 PROCEDURE                         ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
vl_ada               BYTE                                  !
vl_no                LONG                                  !
loc:bulan            SHORT                                 !
loc:tahun            LONG                                  !
Progress:Thermometer BYTE                                  !
loc::tanggal         DATE                                  !
loc::komentar        STRING(60)                            !
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
Process:View         VIEW(GStokAptk)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,85),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                       PROMPT('NO:'),AT(18,66),USE(?vl_no:Prompt)
                       ENTRY(@n-14),AT(41,66,60,10),USE(vl_no),RIGHT(1)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ProgressMgr          StepStringClass                       ! Progress Manager
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
  GlobalErrors.SetProcedureName('ProsesOpnameFM04Juli2003')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  WindowBulanTahun()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  loc:tahun=glo:tahun
  loc:bulan=glo:bulan-1
  if loc:bulan=0 then
     loc:bulan=12
     loc:tahun=glo:tahun-1
  end
  display
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Relate:ApStokop.Open                                     ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql.Open                                      ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ASaldoAwal.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APKStok.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GBarang.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesOpnameFM04Juli2003',ProgressWindow)  ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisProcess.Init(Process:View, Relate:GStokAptk, ?Progress:PctText, Progress:Thermometer, ProgressMgr, GSTO:Kode_Barang)
  ThisProcess.AddSortOrder(GSTO:KeyBarang)
  ThisProcess.SetFilter('gsto:kode_apotik=GL_entryapotik and gsto:kode_barang<<>'''' and gsto:kode_barang<<>''0{10}''')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(GStokAptk,'QUICKSCAN=on')
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
  END
  IF SELF.Opened
    INIMgr.Update('ProsesOpnameFM04Juli2003',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
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
  
  
  
  Apso:Kode_Apotik    =GSTO:Kode_Apotik
  Apso:Kode_Barang    =GSTO:Kode_Barang
  Apso:Tahun          =loc:tahun
  Apso:Bulan          =loc:bulan
  if access:apstokop.fetch(Apso:kdapotik_brg)=level:benign then
     vl_ada=1
     vl_saldo_awal          =Apso:StHitung
     vl_saldo_awal_rp       =Apso:Harga
     vl_saldo_awal_total    =Apso:StHitung*Apso:Harga
  
     vl_saldo_akhir         =Apso:StHitung
     vl_saldo_akhir_total   =Apso:StHitung*Apso:Harga
  end
  
  if vl_ada=0 then
     ASA:Kode_Barang     =GSTO:Kode_Barang
     ASA:Apotik          =GSTO:Kode_Apotik
     ASA:Bulan           =loc:bulan
     ASA:Tahun           =loc:tahun
     if access:asaldoawal.fetch(ASA:PrimaryKey)=level:benign then
        vl_saldo_awal          =ASA:Jumlah
        vl_saldo_awal_rp       =ASA:Harga
        vl_saldo_awal_total    =ASA:Total
        vl_saldo_akhir         =ASA:Jumlah
        vl_saldo_akhir_total   =ASA:Total
     end
  end
  
  if vl_saldo_awal=0 then
     vl_saldo_awal_rp       =0
     vl_saldo_awal_total    =0
  end
  
  apkstok{prop:sql}='select * from dba.apkstok where kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''' and month(tanggal)='&loc:bulan&' and year(tanggal)='&loc:tahun&' order by tanggal,jam'
  apkstok{prop:sql}='select * from dba.apkstok where kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''' and month(tanggal)='&loc:bulan&' and year(tanggal)='&loc:tahun&' order by tanggal,jam'
  loop
     if access:apkstok.next()<>level:benign then break.
     if sub(APK:NoTransaksi,1,3)<>'OPN' then
        !Jika Debet
        vl_debet             +=APK:Debet
        vl_debet_total       +=APK:Debet*GSTO:Harga_Dasar*1.1
  
        vl_saldo_akhir       +=APK:Debet
        vl_saldo_akhir_total +=APK:Debet*GSTO:Harga_Dasar*1.1
  
        !Jika Kredit
        vl_kredit            +=APK:Kredit
        vl_kredit_total      +=APK:Kredit*GSTO:Harga_Dasar*1.1
  
        vl_saldo_akhir       -=APK:Kredit
        vl_saldo_akhir_total -=APK:Kredit*GSTO:Harga_Dasar*1.1
     end
  end
  
  vl_kredit_rp    =vl_kredit_total/vl_kredit
  if vl_saldo_akhir_total<>0 and vl_saldo_akhir<>0 then
     vl_saldo_akhir_rp   =vl_saldo_akhir_total/vl_saldo_akhir
  else
     vl_saldo_akhir_total=0
     vl_saldo_akhir      =0
     vl_saldo_akhir_rp   =GSTO:Harga_Dasar*1.1
  end
  display
  
  afifoin{prop:sql}='update dba.afifoin set status=1 where status=0 and kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''''
  afifoout{prop:sql}='update dba.afifoout set status=1 where status=0 and kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''''
  apkstok{prop:sql}='update dba.apkstok set status=1 where status=0 and kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''''
  
  !Fifo In
  AFI:Kode_Barang     =gsto:kode_barang
  AFI:Mata_Uang       ='Rp'
  AFI:NoTransaksi     ='OPN'&sub(format(glo:tahun,@p####p),3,2)&format(glo:bulan,@p##p)
  AFI:Transaksi       =1
  AFI:Kode_Apotik     =GSTO:Kode_Apotik
  if access:afifoin.fetch(AFI:KEY1)<>level:benign then
     !if vl_saldo_akhir>0 then
        AFI:Kode_Barang     =gsto:kode_barang
        AFI:Mata_Uang       ='Rp'
        AFI:NoTransaksi     ='OPN'&sub(format(glo:tahun,@p####p),3,2)&format(glo:bulan,@p##p)
        AFI:Transaksi       =1
        AFI:Tanggal         =date(glo:bulan,1,glo:tahun)
        AFI:Harga           =vl_saldo_akhir_rp
        AFI:Jumlah          =vl_saldo_akhir
        AFI:Jumlah_Keluar   =0
        AFI:Tgl_Update      =date(glo:bulan,1,glo:tahun)
        AFI:Jam_Update      =100
        AFI:Operator        =vg_user
        AFI:Jam             =100
        AFI:Kode_Apotik     =GSTO:Kode_Apotik
        AFI:Status          =0
        access:afifoin.insert()
     !end
  end
  
  !Kartu Stok
  APK:Kode_Barang     =GSTO:Kode_Barang
  APK:Tanggal         =date(glo:bulan,1,glo:tahun)
  APK:Transaksi       ='Opname'
  APK:NoTransaksi     ='OPN'&sub(format(glo:tahun,@p####p),3,2)&format(glo:bulan,@p##p)
  APK:Kode_Apotik     =GSTO:Kode_Apotik
  if access:apkstok.fetch(APK:KEY1)<>level:benign then
     !if vl_saldo_akhir>0 then
        APK:Kode_Barang      =GSTO:Kode_Barang
        APK:Tanggal          =date(glo:bulan,1,glo:tahun)
        APK:Jam              =100
        APK:Transaksi        ='Opname'
        APK:NoTransaksi      ='OPN'&sub(format(glo:tahun,@p####p),3,2)&format(glo:bulan,@p##p)
        APK:Debet            =vl_saldo_akhir
        APK:Kredit           =0
        APK:Opname           =vl_saldo_akhir
        APK:Kode_Apotik      =GSTO:Kode_Apotik
        APK:Status           =0
        access:apkstok.insert()
     !end
  end
  
  !Saldo Awal
  ASA:Kode_Barang     =GSTO:Kode_Barang
  ASA:Apotik          =glo::kode_apotik
  ASA:Bulan           =glo:bulan
  ASA:Tahun           =glo:tahun
  if access:asaldoawal.fetch(ASA:PrimaryKey)<>level:benign then
     ASA:Kode_Barang     =GSTO:Kode_Barang
     ASA:Apotik          =Glo::kode_apotik
     ASA:Bulan           =glo:bulan
     ASA:Tahun           =glo:tahun
     ASA:Jumlah          =vl_saldo_akhir
     ASA:Harga           =vl_saldo_akhir_rp
     ASA:Total           =vl_saldo_akhir*vl_saldo_akhir_rp
     access:asaldoawal.insert()
  end
  
  !Stok Opname
  Apso:Kode_Apotik        =glo::kode_apotik
  Apso:Kode_Barang        =GSTO:Kode_Barang
  Apso:Tahun              =glo:tahun
  Apso:Bulan              =glo:bulan
  if access:apstokop.fetch(Apso:kdapotik_brg)<>level:benign then
     Apso:Kode_Apotik        =glo::kode_apotik
     Apso:Kode_Barang        =GSTO:Kode_Barang
     Apso:Tahun              =glo:tahun
     Apso:Bulan              =glo:bulan
     Apso:Stkomputer         =vl_saldo_akhir
     Apso:StHitung           =vl_saldo_akhir
     Apso:Harga              =vl_saldo_akhir_rp
     Apso:Nilaistok          =vl_saldo_akhir*vl_saldo_akhir_rp
     access:apstokop.insert()
  end
  vl_no+=1
  display
  RETURN ReturnValue

BrowseOpnameSetiapSaat PROCEDURE                           ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
vl_tanggal           DATE                                  !
BRW1::View:Browse    VIEW(AAdjust)
                       PROJECT(AAD:Nomor)
                       PROJECT(AAD:Kode_Barang)
                       PROJECT(AAD:Jumlah)
                       PROJECT(AAD:Tanggal)
                       PROJECT(AAD:Jam)
                       PROJECT(AAD:Keterangan)
                       PROJECT(AAD:Operator)
                       PROJECT(AAD:Status)
                       PROJECT(AAD:Kode_Apotik)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
AAD:Nomor              LIKE(AAD:Nomor)                !List box control field - type derived from field
AAD:Kode_Barang        LIKE(AAD:Kode_Barang)          !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Ket2              LIKE(GBAR:Ket2)                !List box control field - type derived from field
AAD:Jumlah             LIKE(AAD:Jumlah)               !List box control field - type derived from field
AAD:Tanggal            LIKE(AAD:Tanggal)              !List box control field - type derived from field
AAD:Jam                LIKE(AAD:Jam)                  !List box control field - type derived from field
AAD:Keterangan         LIKE(AAD:Keterangan)           !List box control field - type derived from field
AAD:Operator           LIKE(AAD:Operator)             !List box control field - type derived from field
AAD:Status             LIKE(AAD:Status)               !List box control field - type derived from field
AAD:Kode_Apotik        LIKE(AAD:Kode_Apotik)          !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(GBarang)
                       PROJECT(GBAR:Kode_brg)
                       PROJECT(GBAR:Nama_Brg)
                       PROJECT(GBAR:No_Satuan)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:No_Satuan         LIKE(GBAR:No_Satuan)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Opname Setiap Saat'),AT(,,415,252),FONT('MS Sans Serif',8,,),CENTER,IMM,HLP('BrowseAdjust'),SYSTEM,GRAY,RESIZE,MDI
                       SHEET,AT(4,2,408,137),USE(?Sheet1)
                         TAB('Nama [F2]'),USE(?Tab1),KEY(F2Key)
                           PROMPT('Nama Obat:'),AT(9,123),USE(?GBAR:Nama_Brg:Prompt)
                           ENTRY(@s40),AT(59,123,60,10),USE(GBAR:Nama_Brg),MSG('Nama Barang'),TIP('Nama Barang')
                         END
                         TAB('Kode [F3]'),USE(?Tab2),KEY(F3Key)
                           PROMPT('Kode Barang:'),AT(8,122),USE(?GBAR:Kode_brg:Prompt)
                           ENTRY(@s10),AT(58,122,60,10),USE(GBAR:Kode_brg),MSG('Kode Barang'),TIP('Kode Barang')
                         END
                       END
                       LIST,AT(8,18,399,100),USE(?List),IMM,MSG('Browsing Records'),FORMAT('51L|M~Kode Barang~@s10@163L|M~Nama Obat~@s40@40L|M~Satuan~@s10@'),FROM(Queue:Browse)
                       LIST,AT(5,144,405,87),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('69L(2)|M~Nomor~@s15@48L(2)|M~Kode Barang~@s10@95L(2)|M~Nama Obat~@s40@67L(2)|M~K' &|
   'eterangan~@s50@44D(16)|M~Jumlah~C(0)@n10.2@49R(2)|M~Tanggal~C(0)@d06@34R(2)|M~Ja' &|
   'm~C(0)@t4@80L(2)|M~Keterangan~@s30@44L(2)|M~Operator~@s10@28R(2)|M~Status~C(0)@n' &|
   '3@48L(2)|M~Kode Apotik~@s5@'),FROM(Queue:Browse:1)
                       BUTTON('&Tambah (+)'),AT(217,236,45,14),USE(?Insert:2),KEY(PlusKey),DEFAULT
                       BUTTON('&Ubah'),AT(265,236,45,14),USE(?Change:2),DISABLE,HIDE
                       BUTTON('&Hapus (Del)'),AT(315,236,45,14),USE(?Delete:2),DISABLE,HIDE,KEY(DeleteKey)
                       BUTTON('&Selesai'),AT(365,236,45,14),USE(?Close)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW5                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW5::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW5::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?Sheet1) = 2
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False) ! Method added to host embed code
                     END


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
  GlobalErrors.SetProcedureName('BrowseOpnameSetiapSaat')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GBAR:Nama_Brg:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  BIND('vl_tanggal',vl_tanggal)                            ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  WindowTanggalOpname()
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:AAdjust.Open                                      ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:GBarang.Open                                      ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_Batal.Open                                  ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  vl_tanggal=vg_tanggalopname
  display
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:AAdjust,SELF) ! Initialize the browse manager
  BRW5.Init(?List,Queue:Browse.ViewPosition,BRW5::View:Browse,Queue:Browse,Relate:GBarang,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,AAD:GBarang_GAdjusment_Key)           ! Add the sort order for AAD:GBarang_GAdjusment_Key for sort order 1
  BRW1.AddRange(AAD:Kode_Barang,Relate:AAdjust,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,AAD:Kode_Barang,,BRW1)         ! Initialize the browse locator using  using key: AAD:GBarang_GAdjusment_Key , AAD:Kode_Barang
  BRW1.AppendOrder('aad:nomor')                            ! Append an additional sort order
  BRW1.SetFilter('(AAD:Kode_Apotik=GL_entryapotik and aad:tanggal=vl_tanggal)') ! Apply filter expression to browse
  BRW1.AddField(AAD:Nomor,BRW1.Q.AAD:Nomor)                ! Field AAD:Nomor is a hot field or requires assignment from browse
  BRW1.AddField(AAD:Kode_Barang,BRW1.Q.AAD:Kode_Barang)    ! Field AAD:Kode_Barang is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Nama_Brg,BRW1.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Ket2,BRW1.Q.GBAR:Ket2)                ! Field GBAR:Ket2 is a hot field or requires assignment from browse
  BRW1.AddField(AAD:Jumlah,BRW1.Q.AAD:Jumlah)              ! Field AAD:Jumlah is a hot field or requires assignment from browse
  BRW1.AddField(AAD:Tanggal,BRW1.Q.AAD:Tanggal)            ! Field AAD:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(AAD:Jam,BRW1.Q.AAD:Jam)                    ! Field AAD:Jam is a hot field or requires assignment from browse
  BRW1.AddField(AAD:Keterangan,BRW1.Q.AAD:Keterangan)      ! Field AAD:Keterangan is a hot field or requires assignment from browse
  BRW1.AddField(AAD:Operator,BRW1.Q.AAD:Operator)          ! Field AAD:Operator is a hot field or requires assignment from browse
  BRW1.AddField(AAD:Status,BRW1.Q.AAD:Status)              ! Field AAD:Status is a hot field or requires assignment from browse
  BRW1.AddField(AAD:Kode_Apotik,BRW1.Q.AAD:Kode_Apotik)    ! Field AAD:Kode_Apotik is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse
  BRW5.AddSortOrder(,GBAR:KeyKodeBrg)                      ! Add the sort order for GBAR:KeyKodeBrg for sort order 1
  BRW5.AddLocator(BRW5::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort1:Locator.Init(?GBAR:Kode_brg,GBAR:Kode_brg,,BRW5) ! Initialize the browse locator using ?GBAR:Kode_brg using key: GBAR:KeyKodeBrg , GBAR:Kode_brg
  BRW5.AddSortOrder(,GBAR:KeyNama)                         ! Add the sort order for GBAR:KeyNama for sort order 2
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW5::Sort0:Locator.Init(?GBAR:Nama_Brg,GBAR:Nama_Brg,,BRW5) ! Initialize the browse locator using ?GBAR:Nama_Brg using key: GBAR:KeyNama , GBAR:Nama_Brg
  BRW5.AppendOrder('gbar:kode_brg')                        ! Append an additional sort order
  BRW5.AddField(GBAR:Kode_brg,BRW5.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Nama_Brg,BRW5.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:No_Satuan,BRW5.Q.GBAR:No_Satuan)      ! Field GBAR:No_Satuan is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseOpnameSetiapSaat',QuickWindow)       ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW5.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAdjust.Close
    Relate:GBarang.Close
    Relate:NomorUse.Close
    Relate:Nomor_Batal.Close
    Relate:Nomor_SKR.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseOpnameSetiapSaat',QuickWindow)    ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdateOpnameSetiapSaat
    ReturnValue = GlobalResponse
  END
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
    CASE ACCEPTED()
    OF ?Insert:2
      !if GLO:LEVEL>1 then
      !   message('Anda tidak diijinkan untuk mengoreksi data !!!')
      !   cycle
      !end
      set(BRW1::View:Browse)
      next(BRW1::View:Browse)
      if not(errorcode()) then
         message('Tidak bisa lakukan opname lagi !')
         cycle
      end
    OF ?Change:2
      cycle
    OF ?Delete:2
      cycle
    END
  ReturnValue = PARENT.TakeAccepted()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:2
    SELF.ChangeControl=?Change:2
    SELF.DeleteControl=?Delete:2
  END


BRW5.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW5.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?Sheet1) = 2
    RETURN SELF.SetSort(1,Force)
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

UpdateOpnameSetiapSaat PROCEDURE                           ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
vl_nomor             STRING(15)                            !
History::AAD:Record  LIKE(AAD:RECORD),THREAD
QuickWindow          WINDOW('Update the AAdjust File'),AT(,,208,239),FONT('MS Sans Serif',8,COLOR:Black,),CENTER,IMM,HLP('UpdateAAdjust'),SYSTEM,GRAY,RESIZE,MDI
                       ENTRY(@s15),AT(67,5,68,10),USE(AAD:Nomor),DISABLE
                       ENTRY(@s10),AT(67,18,44,10),USE(AAD:Kode_Barang),DISABLE
                       BUTTON('F2'),AT(113,17,12,12),USE(?CallLookup),DISABLE,KEY(F2Key)
                       OPTION('Status'),AT(67,30,77,36),USE(AAD:Status),DISABLE,BOXED
                         RADIO('Tambah Stok'),AT(71,41),USE(?AAD:Status:Radio1),VALUE('1')
                         RADIO('Kurang Stok'),AT(71,52),USE(?AAD:Status:Radio2),VALUE('2')
                       END
                       ENTRY(@n-15.2),AT(67,70,67,10),USE(AAD:QtyStok),DISABLE,DECIMAL(14)
                       ENTRY(@n-15.2),AT(67,83,67,10),USE(AAD:QtyFisik),DECIMAL(14)
                       PROMPT('Nomor:'),AT(13,5),USE(?AAD:Nomor:Prompt)
                       PROMPT('Kode Barang:'),AT(13,18),USE(?AAD:Kode_Barang:Prompt)
                       PROMPT('Selisih:'),AT(13,97),USE(?AAD:Jumlah:Prompt)
                       ENTRY(@n-12.2),AT(67,97,67,10),USE(AAD:Jumlah),DISABLE,DECIMAL(14)
                       PROMPT('Tanggal:'),AT(13,112),USE(?AAD:Tanggal:Prompt)
                       ENTRY(@d06),AT(67,112,67,10),USE(AAD:Tanggal),DISABLE
                       PROMPT('Jam:'),AT(13,126),USE(?AAD:Jam:Prompt)
                       ENTRY(@t4),AT(67,126,67,10),USE(AAD:Jam),DISABLE
                       PROMPT('Keterangan:'),AT(13,139),USE(?AAD:Keterangan:Prompt)
                       ENTRY(@s30),AT(67,139,124,10),USE(AAD:Keterangan),DISABLE
                       PROMPT('Operator:'),AT(13,153),USE(?AAD:Operator:Prompt)
                       ENTRY(@s10),AT(67,153,67,10),USE(AAD:Operator),DISABLE
                       PROMPT('Qty Stok:'),AT(13,70),USE(?AAD:QtyStok:Prompt)
                       PROMPT('Qty Fisik:'),AT(13,83),USE(?AAD:QtyFisik:Prompt)
                       PROMPT('Harga:'),AT(13,167),USE(?AAD:Harga:Prompt)
                       ENTRY(@n-15.2),AT(67,167,67,10),USE(AAD:Harga),DISABLE,DECIMAL(14)
                       PROMPT('Kode Apotik:'),AT(13,181),USE(?AAD:Kode_Apotik:Prompt)
                       ENTRY(@s5),AT(67,181,40,10),USE(AAD:Kode_Apotik),DISABLE
                       PROMPT('Verifikasi:'),AT(13,196),USE(?AAD:verifikasi:Prompt)
                       ENTRY(@n3),AT(67,195,67,10),USE(AAD:verifikasi),DISABLE
                       BUTTON('&Selesai'),AT(60,213,45,14),USE(?OK),DISABLE,DEFAULT
                       BUTTON('&Batal'),AT(108,213,45,14),USE(?Cancel)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
Reset                  PROCEDURE(BYTE Force=0),DERIVED     ! Method added to host embed code
Run                    PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False) ! Method added to host embed code
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It's called after the window open
!|
!---------------------------------------------------------------------------
Isi_Nomor Routine
   vl_nomor=''
   display
   loop
      logout(1,nomor_batal)
      if errorcode()=56 then
         cycle.
      !Silahkan diganti ---> 2=Transaksi Apotik ke Ruangan
      NOM:No_Urut=65
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 2=Transaksi Apotik ke Ruangan
         NOMU:Urut =65
         NOMU:Nomor=vl_nomor
         add(nomoruse)
         if errorcode()>0 then
            vl_nomor=''
            rollback
            cycle
         end
         delete(nomor_batal)
         commit
         if errorcode()>0 then
            vl_nomor=''
            display
            cycle
         end
      else
         vl_nomor=''
         display
         rollback
      end
      break
   end
   if vl_nomor='' then
      loop
        logout(1,nomor_skr,nomoruse)
        if errorcode()=56 then cycle.
        !Silahkan diganti ---> 2=Transaksi Apotik ke Ruangan
        NOM1:No_urut=65
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 2=Transaksi Apotik ke Ruangan
           NOMU:Urut =65
           NOMU:Nomor=vl_nomor
           add(nomoruse)
           if errorcode()>0 then
              rollback
              cycle
           end
           NOM1:No_Trans=sub(vl_nomor,1,7)&format(deformat(sub(vl_nomor,8,5),@n5)+1,@p#####p)
           put(nomor_skr)
           if errorcode()=90 then
              rollback
              cycle
           elsif errorcode()>0 then
              rollback
              cycle
           else
              commit
           end
        else
           rollback
           cycle
        end
        break
      end
   end
   if format(sub(vl_nomor,6,2),@n2)<>month(today()) then
      !Silahkan diganti ---> 2=Transaksi Apotik ke Ruangan
      nomor_batal{prop:sql}='delete dba.nomor_batal where No=65'
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 2=Transaksi Apotik ke Ruangan
         NOM1:No_urut=65
         access:nomor_skr.fetch(NOM1:PrimaryKey)
         if not(errorcode()) then
            vl_nomor =NOM1:No_Trans
            NOM1:No_Trans=sub(vl_nomor,1,3)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'00002'
            access:nomor_skr.update()
            if errorcode()<>0 then
               rollback
               cycle
            else
               vl_nomor=sub(vl_nomor,1,3)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'00001'
               commit
            end
         end
         break
      end
   end
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   AAD:Nomor=vl_nomor
   display

Batal_Nomor Routine
   !Silahkan diganti ---> 2=Transaksi Apotik ke Ruangan
   NOM:No_Urut =65
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=AAD:Nomor
   NOM:Keterangan='Opname Setiap Saat'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 2=Transaksi Apotik ke Ruangan
   NOMU:Urut =65
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOMU:Nomor=AAD:Nomor
   access:nomoruse.fetch(NOMU:PrimaryKey)
   delete(nomoruse)

hapus_nomor_use routine
   NOMU:Urut    =65
   NOMU:Nomor   =AAD:Nomor
   access:nomoruse.fetch(NOMU:PrimaryKey)
   if errorcode()=0 then
      delete(nomoruse)
   end

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Tambah Transaksi'
  OF ChangeRecord
    ActionMessage = 'Ubah Transaksi '
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateOpnameSetiapSaat')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?AAD:Nomor
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(AAD:Record,History::AAD:Record)
  SELF.AddHistoryField(?AAD:Nomor,1)
  SELF.AddHistoryField(?AAD:Kode_Barang,2)
  SELF.AddHistoryField(?AAD:Status,8)
  SELF.AddHistoryField(?AAD:QtyStok,11)
  SELF.AddHistoryField(?AAD:QtyFisik,12)
  SELF.AddHistoryField(?AAD:Jumlah,3)
  SELF.AddHistoryField(?AAD:Tanggal,4)
  SELF.AddHistoryField(?AAD:Jam,5)
  SELF.AddHistoryField(?AAD:Keterangan,6)
  SELF.AddHistoryField(?AAD:Operator,7)
  SELF.AddHistoryField(?AAD:Harga,10)
  SELF.AddHistoryField(?AAD:Kode_Apotik,9)
  SELF.AddHistoryField(?AAD:verifikasi,13)
  SELF.AddUpdateFile(Access:AAdjust)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:AAdjust.Open                                      ! File ApStokopSS used by this procedure, so make sure it's RelationManager is open
  Relate:ApStokopSS.Open                                   ! File ApStokopSS used by this procedure, so make sure it's RelationManager is open
  Relate:GStokAptk.Open                                    ! File ApStokopSS used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File ApStokopSS used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_Batal.Open                                  ! File ApStokopSS used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File ApStokopSS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:AAdjust
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel                      ! No confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  if self.request=1 then
     do isi_nomor
  end
  SELF.Open(QuickWindow)                                   ! Open window
  if self.request=1 then
     !message(AAD:Kode_Apotik&' '&AAD:Kode_Barang&' '&vg_tanggal1)
  
     Apso1:Kode_Apotik    =AAD:Kode_Apotik
     Apso1:Kode_Barang    =AAD:Kode_Barang
     Apso1:Tanggal        =vg_tanggalopname
     if access:apstokopss.fetch(Apso1:kdapotik_brg)=level:benign then
        AAD:QtyStok  =Apso1:Stkomputer
        AAD:QtyFisik =Apso1:StHitung
     else
        AAD:QtyStok  =0
        AAD:QtyFisik =0
     end
     AAD:verifikasi = 1
  end
  display
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateOpnameSetiapSaat',QuickWindow)       ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  !message(AAD:Kode_Barang&' '&GL_entryapotik)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  if self.request=1 and self.response=1 then
     do hapus_nomor_use
  elsif (self.request=1 and self.response=2) or (self.request=3 and self.response=1) then
     do batal_nomor
  end
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAdjust.Close
    Relate:ApStokopSS.Close
    Relate:GStokAptk.Close
    Relate:NomorUse.Close
    Relate:Nomor_Batal.Close
    Relate:Nomor_SKR.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateOpnameSetiapSaat',QuickWindow)    ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
    AAD:Status = 1
    AAD:Tanggal = today()
    AAD:Jam = clock()
    AAD:Keterangan = 'Opname'
    AAD:Operator = vg_user
    AAD:Kode_Apotik = GL_entryapotik
  PARENT.PrimeFields


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = AAD:Kode_Barang                          ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    SelectBarang
    ReturnValue = GlobalResponse
  END
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
    OF ?AAD:Kode_Barang
      if AAD:Status=2 then
         GSTO:Kode_Apotik    =GL_entryapotik
         GSTO:Kode_Barang    =AAD:Kode_Barang
         if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
            if GSTO:Saldo<AAD:Jumlah then
               message('Barang tidak mencukupi !!!')
               disable(?ok)
               select(?aad:jumlah)
            else
               enable(?ok)
            end
         else
            message('Barang tidak ada !!!')
            disable(?ok)
            select(?aad:jumlah)
         end
         GSTO:Kode_Apotik=GL_entryapotik
         GSTO:Kode_Barang=AAD:Kode_Barang
         if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
            AAD:Harga=GSTO:Harga_Dasar
            display
         end
      
      else
         GSTO:Kode_Apotik=GL_entryapotik
         GSTO:Kode_Barang=AAD:Kode_Barang
         if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
            AAD:Harga=GSTO:Harga_Dasar
            display
         end
         enable(?ok)
      end
      IF AAD:Kode_Barang OR ?AAD:Kode_Barang{Prop:Req}
        GBAR:Kode_brg = AAD:Kode_Barang
        IF Access:GBarang.TryFetch(GBAR:KeyKodeBrg)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            AAD:Kode_Barang = GBAR:Kode_brg
          ELSE
            SELECT(?AAD:Kode_Barang)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      GBAR:Kode_brg = AAD:Kode_Barang
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        AAD:Kode_Barang = GBAR:Kode_brg
      END
      ThisWindow.Reset(1)
      if AAD:Status=2 then
         GSTO:Kode_Apotik    =GL_entryapotik
         GSTO:Kode_Barang    =AAD:Kode_Barang
         if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
            if GSTO:Saldo<AAD:Jumlah then
               message('Barang tidak mencukupi !!!')
               disable(?ok)
               select(?aad:jumlah)
            else
               enable(?ok)
            end
         else
            message('Barang tidak ada !!!')
            disable(?ok)
            select(?aad:jumlah)
         end
            GSTO:Kode_Apotik=GL_entryapotik
         GSTO:Kode_Barang=AAD:Kode_Barang
         if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
            AAD:Harga=GSTO:Harga_Dasar
            display
         end
      
      else
            GSTO:Kode_Apotik=GL_entryapotik
         GSTO:Kode_Barang=AAD:Kode_Barang
         if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
            AAD:Harga=GSTO:Harga_Dasar
            display
         end
      
         enable(?ok)
      end
    OF ?AAD:Status
      if AAD:Status=2 then
         GSTO:Kode_Apotik    =GL_entryapotik
         GSTO:Kode_Barang    =AAD:Kode_Barang
         if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
            if GSTO:Saldo<AAD:Jumlah then
               message('Barang tidak mencukupi !!!')
               disable(?ok)
               select(?aad:jumlah)
            else
               enable(?ok)
            end
         else
            message('Barang tidak ada !!!')
            disable(?ok)
            select(?aad:jumlah)
         end
            GSTO:Kode_Apotik=GL_entryapotik
         GSTO:Kode_Barang=AAD:Kode_Barang
         if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
            AAD:Harga=GSTO:Harga_Dasar
            display
         end
      
      else
            GSTO:Kode_Apotik=GL_entryapotik
         GSTO:Kode_Barang=AAD:Kode_Barang
         if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
            AAD:Harga=GSTO:Harga_Dasar
            display
         end
      
         enable(?ok)
      end
    OF ?AAD:QtyFisik
      if AAD:QtyFisik<0 then
         message('Tidak boleh minus !')
         cycle
      else
      if AAD:QtyFisik>=AAD:QtyStok then
         AAD:Status=1
         AAD:Jumlah=AAD:QtyFisik-AAD:QtyStok
      else
         AAD:Status=2
         AAD:Jumlah=AAD:QtyStok-AAD:QtyFisik
      end
      end
      enable(?OK)
      select(?OK)
      display
    OF ?AAD:Jumlah
      if AAD:Status=2 then
         GSTO:Kode_Apotik    =GL_entryapotik
         GSTO:Kode_Barang    =AAD:Kode_Barang
         if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
            !message(GSTO:Saldo&' '&AAD:Jumlah)
            if GSTO:Saldo<AAD:Jumlah then
               message('Barang tidak mencukupi !!!')
               disable(?ok)
               select(?aad:jumlah)
            else
               enable(?ok)
            end
         else
            message('Barang tidak ada !!!')
            disable(?ok)
            select(?aad:jumlah)
         end
         GSTO:Kode_Apotik=GL_entryapotik
         GSTO:Kode_Barang=AAD:Kode_Barang
         if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
            AAD:Harga=GSTO:Harga_Dasar
            display
         end
      
      else
         GSTO:Kode_Apotik=GL_entryapotik
         GSTO:Kode_Barang=AAD:Kode_Barang
         if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
            AAD:Harga=GSTO:Harga_Dasar
            display
         end
      
         enable(?ok)
      end
      
      
    OF ?OK
      ThisWindow.Update
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

ProsesSesuaikanHargaTelkom PROCEDURE                       ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
Process:View         VIEW(APHTRANS)
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
  GlobalErrors.SetProcedureName('ProsesSesuaikanHargaTelkom')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo:mr',glo:mr)                                    ! Added by: Process
  BIND('glo:urut',glo:urut)                                ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:APDTRANS.SetOpenRelated()
  Relate:APDTRANS.Open                                     ! File JKontrak used by this procedure, so make sure it's RelationManager is open
  Relate:APDTRANSBackup.Open                               ! File JKontrak used by this procedure, so make sure it's RelationManager is open
  Relate:APHTRANSBackup.Open                               ! File JKontrak used by this procedure, so make sure it's RelationManager is open
  Access:JKontrakMaster.UseFile                            ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKontrak.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesSesuaikanHargaTelkom',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:APHTRANS, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ThisProcess.SetFilter('APH:Nomor_mr=glo:mr and aph:urut=glo:urut')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(APHTRANS,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:APDTRANSBackup.Close
    Relate:APHTRANSBackup.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesSesuaikanHargaTelkom',ProgressWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  APH2:N0_tran    =APH:N0_tran
  if access:aphtransbackup.fetch(APH2:by_transaksi)=level:benign then
     message('Sudah pernah diproses, hubungi SIMRS !')
     !break
  else
     APH2:record=APH:record
     access:aphtransbackup.insert()
  
     JKon:KODE_KTR=vg_kontraktor
     access:jkontrak.fetch(JKon:KeyKodeKtr)
     !message(JKon:HargaObat&' '&'select * from dba.apdtrans where n0_tran='''&clip(APH:N0_tran)&'''')
     if JKon:HargaObat>0 then
        apdtrans{prop:sql}='select * from dba.apdtrans where n0_tran='''&clip(APH:N0_tran)&''''
        apdtrans{prop:sql}='select * from dba.apdtrans where n0_tran='''&clip(APH:N0_tran)&''''
        loop
           if access:apdtrans.next()<>level:benign then break.
           APD3:record=APD:record
           access:apdtransbackup.insert()
           APD:Total = GL_beaR + (APD:Harga_Dasar*(1.1)*JKon:HargaObat*APD:Jumlah)
           access:apdtrans.update()
        end
     end
  end
  RETURN ReturnValue

