

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N036.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N035.INC'),ONCE        !Req'd for module callout resolution
                     END


ProsesStokOpnamePerbaikan PROCEDURE                        ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
vl_stok_terkini      REAL                                  !
vl_ada               BYTE                                  !
vl_ada_opname        BYTE                                  !
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
ProgressWindow       WINDOW('Progress...'),AT(,,142,85),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
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
  GlobalErrors.SetProcedureName('ProsesStokOpnamePerbaikan')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
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
  Apso:Kode_Apotik    =Glo::kode_apotik
  Apso:Tahun          =loc:tahun
  Apso:Bulan          =loc:bulan
  if access:apstokop.fetch(Apso:keykdap_bln_thn)=level:benign then
     vl_ada_opname       =1
  end
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesStokOpnamePerbaikan',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisProcess.Init(Process:View, Relate:GStokAptk, ?Progress:PctText, Progress:Thermometer, ProgressMgr, GSTO:Kode_Barang)
  ThisProcess.AddSortOrder(GSTO:KeyBarang)
  ThisProcess.SetFilter('gsto:kode_apotik=GL_entryapotik')
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
    INIMgr.Update('ProsesStokOpnamePerbaikan',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  vl_stok_terkini     =0
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
     Apso:Tahun          =loc:tahun
     Apso:Bulan          =loc:bulan
     if access:apstokop.fetch(Apso:kdapotik_brg)=level:benign then
        vl_ada=1
        vl_saldo_awal          =round(Apso:StHitung,.00001)
        vl_saldo_awal_rp       =round(Apso:Harga,.00001)
        vl_saldo_awal_total    =round(Apso:StHitung,.00001)*round(Apso:Harga,.00001)
  
        vl_saldo_akhir         =round(Apso:StHitung,.00001)
        vl_saldo_akhir_total   =round(Apso:StHitung,.00001)*round(Apso:Harga,.00001)
     end
  else
     ASA:Kode_Barang     =GSTO:Kode_Barang
     ASA:Apotik          =GSTO:Kode_Apotik
     ASA:Bulan           =loc:BULAN
     ASA:Tahun           =loc:tahun
     if access:asaldoawal.fetch(ASA:PrimaryKey)=level:benign then
        vl_saldo_awal          =round(ASA:Jumlah,.00001)
        vl_saldo_awal_rp       =round(ASA:Harga,.00001)
        vl_saldo_awal_total    =round(ASA:Total,.00001)
        vl_saldo_akhir         =round(ASA:Jumlah,.00001)
        vl_saldo_akhir_total   =round(ASA:Total,.00001)
     end
  end
  
  afifoin{prop:sql}='select * from dba.afifoin where kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''' and month(tanggal)='&loc:bulan&' and year(tanggal)='&loc:tahun&' order by tanggal,jam'
  afifoin{prop:sql}='select * from dba.afifoin where kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''' and month(tanggal)='&loc:bulan&' and year(tanggal)='&loc:tahun&' order by tanggal,jam'
  loop
     if access:afifoin.next()<>level:benign then break.
     if sub(AFI:NoTransaksi,1,3)<>'OPN' then
        vl_debet             +=round(AFI:Jumlah,.00001)
        vl_debet_total       +=round(AFI:Jumlah,.00001)*round(AFI:Harga,.00001)
     end
  end
  
  vl_debet_rp          =vl_debet_total/vl_debet
  vl_saldo_akhir       +=vl_debet
  vl_saldo_akhir_total +=vl_debet_total
  
  afifoout{prop:sql}='select * from dba.afifoout where kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''' and month(tanggal)='&loc:bulan&' and year(tanggal)='&loc:tahun&' order by tanggal,jam'
  afifoout{prop:sql}='select * from dba.afifoout where kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''' and month(tanggal)='&loc:bulan&' and year(tanggal)='&loc:tahun&' order by tanggal,jam'
  loop
     next(afifoout)
     if errorcode()<>0 then break.
     AFI:Kode_Barang  =AFI2:Kode_Barang
     AFI:NoTransaksi  =AFI2:NoTransaksi
     AFI:Kode_Apotik  =AFI2:Kode_Apotik
     AFI:Transaksi    =AFI2:Transaksi
     AFI:Mata_Uang    ='Rp'
     if access:afifoin.fetch(AFI:KEY1)=level:benign then
        vl_kredit          +=round(AFI2:Jumlah,.00001)
        vl_kredit_total    +=round(AFI2:Jumlah,.00001)*round(AFI:Harga,.00001)
     end
  end
  
  vl_kredit_rp          =vl_kredit_total/vl_kredit
  vl_saldo_akhir       -=vl_kredit
  vl_saldo_akhir_total -=vl_kredit_total
  vl_saldo_akhir_rp     =vl_saldo_akhir_total/vl_saldo_akhir
  
  !afifoin{prop:sql}='update dba.afifoin set status=1 where status=0 and kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''''
  !afifoout{prop:sql}='update dba.afifoout set status=1 where status=0 and kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''''
  !apkstok{prop:sql}='update dba.apkstok set status=1 where status=0 and kode_barang='''&GSTO:Kode_Barang&''' and kode_apotik='''&GSTO:Kode_Apotik&''''
  
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
     Apso:Stkomputer         =round(vl_saldo_akhir,.00001)
     Apso:StHitung           =round(vl_saldo_akhir,.00001)
     Apso:Harga              =round(vl_saldo_akhir_rp,.00001)
     Apso:Nilaistok          =round(vl_saldo_akhir*vl_saldo_akhir_rp,.00001)
     access:apstokop.insert()
  else
     if Apso:Stkomputer<>Apso:StHitung then
        vl_stok_terkini         =Apso:StHitung
        Apso:Stkomputer         =round(vl_saldo_akhir,.00001)
        access:apstokop.update()
     else
        vl_stok_terkini         =round(vl_saldo_akhir,.00001)
        Apso:Stkomputer         =round(vl_saldo_akhir,.00001)
        Apso:StHitung           =round(vl_saldo_akhir,.00001)
        Apso:Harga              =round(vl_saldo_akhir_rp,.00001)
        Apso:Nilaistok          =round(vl_saldo_akhir*vl_saldo_akhir_rp,.00001)
        access:apstokop.update()
     end
  end
  
  !Fifo In
  AFI:Kode_Barang     =gsto:kode_barang
  AFI:Mata_Uang       ='Rp'
  AFI:NoTransaksi     ='OPN'&sub(format(glo:tahun,@p####p),3,2)&format(glo:bulan,@p##p)
  AFI:Transaksi       =1
  AFI:Kode_Apotik     =GSTO:Kode_Apotik
  if access:afifoin.fetch(AFI:KEY1)<>level:benign then
     AFI:Kode_Barang     =gsto:kode_barang
     AFI:Mata_Uang       ='Rp'
     AFI:NoTransaksi     ='OPN'&sub(format(glo:tahun,@p####p),3,2)&format(glo:bulan,@p##p)
     AFI:Transaksi       =1
     AFI:Tanggal         =date(glo:bulan,1,glo:tahun)
     AFI:Harga           =round(vl_saldo_akhir_rp,.00001)
     AFI:Jumlah          =round(vl_saldo_akhir,.00001)
     AFI:Jumlah_Keluar   =0
     AFI:Tgl_Update      =date(glo:bulan,1,glo:tahun)
     AFI:Jam_Update      =100
     AFI:Operator        =vg_user
     AFI:Jam             =100
     AFI:Kode_Apotik     =GSTO:Kode_Apotik
     AFI:Status          =0
     access:afifoin.insert()
  else
     AFI:Jumlah          =vl_stok_terkini
     access:afifoin.update()
  end
  
  !Kartu Stok
  APK:Kode_Barang     =GSTO:Kode_Barang
  APK:Tanggal         =date(glo:bulan,1,glo:tahun)
  APK:Transaksi       ='Opname'
  APK:NoTransaksi     ='OPN'&sub(format(glo:tahun,@p####p),3,2)&format(glo:bulan,@p##p)
  APK:Kode_Apotik     =GSTO:Kode_Apotik
  if access:apkstok.fetch(APK:KEY1)<>level:benign then
     APK:Kode_Barang      =GSTO:Kode_Barang
     APK:Tanggal          =date(glo:bulan,1,glo:tahun)
     APK:Jam              =100
     APK:Transaksi        ='Opname'
     APK:NoTransaksi      ='OPN'&sub(format(glo:tahun,@p####p),3,2)&format(glo:bulan,@p##p)
     APK:Debet            =round(vl_saldo_akhir,.00001)
     APK:Kredit           =0
     APK:Opname           =round(vl_saldo_akhir,.00001)
     APK:Kode_Apotik      =GSTO:Kode_Apotik
     APK:Status           =0
     access:apkstok.insert()
  else
     APK:Debet            =vl_stok_terkini
     APK:Opname           =vl_stok_terkini
     access:apkstok.update()
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
     ASA:Jumlah          =round(vl_saldo_akhir,.00001)
     ASA:Harga           =round(vl_saldo_akhir_rp,.00001)
     ASA:Total           =round(vl_saldo_akhir*vl_saldo_akhir_rp,.00001)
     access:asaldoawal.insert()
  else
     ASA:Jumlah          =vl_stok_terkini
     ASA:Harga           =round(vl_saldo_akhir_rp,.00001)
     ASA:Total           =round(vl_stok_terkini*vl_saldo_akhir_rp,.00001)
     access:asaldoawal.update()
  end
  
  vl_no+=1
  display
  
  RETURN ReturnValue

WindowPassGlobal PROCEDURE                                 ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
vl_pass_global       STRING(20)                            !
Window               WINDOW('Tahun - Bulan'),AT(,,185,83),FONT('Arial',8,,FONT:regular),CENTER,GRAY
                       ENTRY(@s20),AT(72,23,60,10),USE(vl_pass_global),RIGHT(1),PASSWORD
                       BUTTON('OK'),AT(43,51,103,14),USE(?OkButton),DEFAULT
                       PROMPT('Password:'),AT(22,23),USE(?glo:tahun:Prompt)
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
  GlobalErrors.SetProcedureName('WindowPassGlobal')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?vl_pass_global
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Glo::kode_apotik = GL_entryapotik
  Relate:GApotik.SetOpenRelated()
  Relate:GApotik.Open                                      ! File JPASSWRD used by this procedure, so make sure it's RelationManager is open
  Relate:JPASSWRD.SetOpenRelated()
  Relate:JPASSWRD.Open                                     ! File JPASSWRD used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('WindowPassGlobal',Window)                  ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:GApotik.Close
    Relate:JPASSWRD.Close
  END
  IF SELF.Opened
    INIMgr.Update('WindowPassGlobal',Window)               ! Save window data to non-volatile store
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
      if upper(clip(vl_pass_global))='OPNAME' then
         start(BrowseStokOpnameBaru,25000)
      else
         message('Password Salah !!!')
      end
      break
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

BrowseSOBaruKomplit PROCEDURE                              ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
vl_total             REAL                                  !
BRW1::View:Browse    VIEW(ApStokop)
                       PROJECT(Apso:Kode_Apotik)
                       PROJECT(Apso:Kode_Barang)
                       PROJECT(Apso:Tahun)
                       PROJECT(Apso:Bulan)
                       PROJECT(Apso:Stkomputer)
                       PROJECT(Apso:StHitung)
                       PROJECT(Apso:Harga)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Apso:Kode_Apotik       LIKE(Apso:Kode_Apotik)         !List box control field - type derived from field
Apso:Kode_Barang       LIKE(Apso:Kode_Barang)         !List box control field - type derived from field
Apso:Tahun             LIKE(Apso:Tahun)               !List box control field - type derived from field
Apso:Bulan             LIKE(Apso:Bulan)               !List box control field - type derived from field
Apso:Stkomputer        LIKE(Apso:Stkomputer)          !List box control field - type derived from field
Apso:StHitung          LIKE(Apso:StHitung)            !List box control field - type derived from field
Apso:Harga             LIKE(Apso:Harga)               !List box control field - type derived from field
vl_total               LIKE(vl_total)                 !List box control field - type derived from local data
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(GBarang)
                       PROJECT(GBAR:Kode_brg)
                       PROJECT(GBAR:Nama_Brg)
                       PROJECT(GBAR:No_Satuan)
                       PROJECT(GBAR:Status)
                       JOIN(GSGD:KeyKodeBrg,GBAR:Kode_brg)
                         PROJECT(GSGD:Harga_Beli)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:No_Satuan         LIKE(GBAR:No_Satuan)           !List box control field - type derived from field
GSGD:Harga_Beli        LIKE(GSGD:Harga_Beli)          !List box control field - type derived from field
GBAR:Status            LIKE(GBAR:Status)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('STOK Opname'),AT(,,422,259),FONT('Arial',8,,),CENTER,IMM,HLP('BrowseStokOpnameBaru'),SYSTEM,GRAY,MDI
                       SHEET,AT(2,3,420,186),USE(?Sheet1)
                         TAB('Kode Barang (F2)'),USE(?Tab1),KEY(F2Key)
                           PROMPT('&Cari Kode Barang:'),AT(9,173),USE(?Apso:Kode_Barang:Prompt)
                           ENTRY(@s10),AT(72,173,60,10),USE(GBAR:Kode_brg),MSG('Kode Barang'),TIP('Kode Barang')
                         END
                         TAB('Nama Barang (F3)'),USE(?Tab2),KEY(F3Key)
                           PROMPT('&Cari Nama Barang:'),AT(6,173),USE(?GBAR:Nama_Brg:Prompt)
                           ENTRY(@s40),AT(68,173,60,10),USE(GBAR:Nama_Brg),MSG('Nama Barang'),TIP('Nama Barang')
                         END
                       END
                       LIST,AT(6,22,410,145),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('51L|M~Kode Barang~@s10@165L|M~Nama Barang~@s40@40L|M~Satuan~@s10@64L|M~Harga Bel' &|
   'i~@n16.`2@12L|M~Status~@n3@'),FROM(Queue:Browse)
                       LIST,AT(6,192,410,46),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('48L(2)|M~Kode Apotik~@s5@52L(2)|M~Kode Barang~@s10@28R(2)|M~Tahun~C(0)@n4@29R(2)' &|
   '|M~Bulan~C(0)@n3@45D(12)|M~Jml Komputer~C(0)@n10.2@44D(10)|M~Jml Fisik~C(0)@n10.' &|
   '2@73R(10)|M~Harga~C(0)@n15.5@60R(10)|M~Total~C(0)@n-15.2@'),FROM(Queue:Browse:1)
                       BUTTON('&Tambah'),AT(106,242,45,14),USE(?Insert:2)
                       BUTTON('&Ubah'),AT(154,242,45,14),USE(?Change:2),DEFAULT
                       BUTTON('&Delete'),AT(321,210,45,14),USE(?Delete:2),DISABLE,HIDE
                       BUTTON('&Selesai'),AT(202,242,45,14),USE(?Close)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
SetQueueRecord         PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW5                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW5::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW5::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - choice(?sheet1)=2
BRW1::EIPManager     BrowseEIPManager                      ! Browse EIP Manager for Browse using ?Browse:1
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
  GlobalErrors.SetProcedureName('BrowseSOBaruKomplit')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  WindowTanggalSkr()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Apso:Kode_Barang:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  BIND('glo:bulan',glo:bulan)                              ! Added by: BrowseBox(ABC)
  BIND('glo:tahun',glo:tahun)                              ! Added by: BrowseBox(ABC)
  BIND('vl_total',vl_total)                                ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File ASaldoAwal used by this procedure, so make sure it's RelationManager is open
  Relate:ApStokop.Open                                     ! File ASaldoAwal used by this procedure, so make sure it's RelationManager is open
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APKStok.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ASaldoAwal.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:ApStokop,SELF) ! Initialize the browse manager
  BRW5.Init(?List,Queue:Browse.ViewPosition,BRW5::View:Browse,Queue:Browse,Relate:GBarang,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  IF GLO:LEVEL > 0
     !?Button5{prop:disable}=1
     ?Insert:2{prop:hide}=1
  end
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,Apso:keykode_barang)                  ! Add the sort order for Apso:keykode_barang for sort order 1
  BRW1.AddRange(Apso:Kode_Barang,Relate:ApStokop,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,Apso:Kode_Barang,,BRW1)        ! Initialize the browse locator using  using key: Apso:keykode_barang , Apso:Kode_Barang
  BRW1.SetFilter('(apso:kode_apotik=GL_entryapotik and apso:bulan=glo:bulan and apso:tahun=glo:tahun)') ! Apply filter expression to browse
  BRW1.AddField(Apso:Kode_Apotik,BRW1.Q.Apso:Kode_Apotik)  ! Field Apso:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(Apso:Kode_Barang,BRW1.Q.Apso:Kode_Barang)  ! Field Apso:Kode_Barang is a hot field or requires assignment from browse
  BRW1.AddField(Apso:Tahun,BRW1.Q.Apso:Tahun)              ! Field Apso:Tahun is a hot field or requires assignment from browse
  BRW1.AddField(Apso:Bulan,BRW1.Q.Apso:Bulan)              ! Field Apso:Bulan is a hot field or requires assignment from browse
  BRW1.AddField(Apso:Stkomputer,BRW1.Q.Apso:Stkomputer)    ! Field Apso:Stkomputer is a hot field or requires assignment from browse
  BRW1.AddField(Apso:StHitung,BRW1.Q.Apso:StHitung)        ! Field Apso:StHitung is a hot field or requires assignment from browse
  BRW1.AddField(Apso:Harga,BRW1.Q.Apso:Harga)              ! Field Apso:Harga is a hot field or requires assignment from browse
  BRW1.AddField(vl_total,BRW1.Q.vl_total)                  ! Field vl_total is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse
  BRW5.AddSortOrder(,GBAR:KeyNama)                         ! Add the sort order for GBAR:KeyNama for sort order 1
  BRW5.AddLocator(BRW5::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort1:Locator.Init(?GBAR:Nama_Brg,GBAR:Nama_Brg,,BRW5) ! Initialize the browse locator using ?GBAR:Nama_Brg using key: GBAR:KeyNama , GBAR:Nama_Brg
  BRW5.SetFilter('(gbar:status=1)')                        ! Apply filter expression to browse
  BRW5.AddSortOrder(,GBAR:KeyKodeBrg)                      ! Add the sort order for GBAR:KeyKodeBrg for sort order 2
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW5::Sort0:Locator.Init(?GBAR:Kode_brg,GBAR:Kode_brg,,BRW5) ! Initialize the browse locator using ?GBAR:Kode_brg using key: GBAR:KeyKodeBrg , GBAR:Kode_brg
  BRW5.SetFilter('(gbar:status=1)')                        ! Apply filter expression to browse
  BRW5.AddField(GBAR:Kode_brg,BRW5.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Nama_Brg,BRW5.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:No_Satuan,BRW5.Q.GBAR:No_Satuan)      ! Field GBAR:No_Satuan is a hot field or requires assignment from browse
  BRW5.AddField(GSGD:Harga_Beli,BRW5.Q.GSGD:Harga_Beli)    ! Field GSGD:Harga_Beli is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Status,BRW5.Q.GBAR:Status)            ! Field GBAR:Status is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseSOBaruKomplit',QuickWindow)          ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
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
    Relate:AFIFOIN.Close
    Relate:ApStokop.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseSOBaruKomplit',QuickWindow)       ! Save window data to non-volatile store
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
    OF ?Insert:2
      ThisWindow.Update
      if GLO:LEVEL>0 then
         cycle
      end
    OF ?Delete:2
      ThisWindow.Update
      cycle
    END
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
  SELF.EIP &= BRW1::EIPManager                             ! Set the EIP manager
  SELF.AddEditControl(,8)
  SELF.DeleteAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Default+EIPAction:Remain+EIPAction:RetainColumn
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:2
    SELF.ChangeControl=?Change:2
    SELF.DeleteControl=?Delete:2
  END


BRW1.SetQueueRecord PROCEDURE

  CODE
  vl_total = Apso:StHitung * Apso:Harga
  PARENT.SetQueueRecord
  
  SELF.Q.vl_total = vl_total                               !Assign formula result to display queue


BRW5.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW5.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF choice(?sheet1)=2
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

PrintDaftarHargaObat PROCEDURE                             ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
vl_no                LONG                                  !
FilesOpened          BYTE                                  !
loc::datel           DATE                                  !
loc::time            TIME                                  !
loc::total           LONG                                  !
loc::nama_apotik     STRING(30)                            !Nama Apotik
APA                  STRING(20)                            !
vl_harga_raja        REAL                                  !
vl_harga_ranap_3     REAL                                  !
vl_harga_ranap_12vip REAL                                  !
Process:View         VIEW(GStockGdg)
                       PROJECT(GSGD:Harga_Beli)
                       PROJECT(GSGD:Kode_brg)
                       JOIN(GBAR:KeyKodeBrg,GSGD:Kode_brg)
                         PROJECT(GBAR:Kode_brg)
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

report               REPORT,AT(302,1042,7427,9771),PAPER(PAPER:A4),PRE(RPT),FONT('Arial',10,COLOR:Black,),THOUS
                       HEADER,AT(302,281,7427,771)
                         STRING('DAFTAR HARGA OBAT & ALAT '),AT(42,21,3073,219),LEFT,FONT(,,,FONT:bold)
                         LINE,AT(4635,500,2760,0),USE(?Line7),COLOR(COLOR:Black)
                         BOX,AT(0,292,7406,479),COLOR(COLOR:Black)
                         LINE,AT(3719,292,0,479),USE(?Line6),COLOR(COLOR:Black)
                         LINE,AT(417,302,0,479),USE(?Line5),COLOR(COLOR:Black)
                         LINE,AT(1167,302,0,479),COLOR(COLOR:Black)
                         LINE,AT(4625,302,0,479),USE(?Line6:2),COLOR(COLOR:Black)
                         STRING('Kode Barang'),AT(458,313,698,167),TRN,FONT('Times New Roman',8,,)
                         STRING('Satuan'),AT(3958,313,385,167),TRN,CENTER,FONT('Times New Roman',8,,)
                         STRING('Harga'),AT(5406,313,667,167),TRN,FONT('Times New Roman',8,,)
                         STRING('Rawat Jln.'),AT(4688,531,750,188),USE(?String13),TRN,CENTER,FONT('Times New Roman',8,,)
                         STRING('Ranap Kls 3'),AT(5583,531,719,188),USE(?String13:2),TRN,CENTER,FONT('Times New Roman',8,,)
                         STRING('Ranap Kls Vip,1,2'),AT(6448,531,927,188),USE(?String13:3),TRN,FONT('Times New Roman',8,,)
                         STRING('No.'),AT(83,313,250,167),USE(?String19),TRN,CENTER,FONT('Times New Roman',8,,)
                         STRING('Nama Barang'),AT(1198,313),USE(?String10),TRN,FONT('Times New Roman',8,,)
                       END
break1                 BREAK(APA)
detail1                  DETAIL,AT(,,,208),FONT('Arial',8,,FONT:regular)
                           STRING(@s10),AT(458,21,708,146),USE(GBAR:Kode_brg),FONT('Arial',8,,FONT:regular)
                           STRING(@s40),AT(1198,21,2552,146),USE(GBAR:Nama_Brg),FONT('Arial',8,,FONT:regular)
                           STRING(@n-12.2),AT(6531,21,719,146),USE(vl_harga_ranap_12vip),RIGHT(90)
                           STRING(@n5),AT(42,21,333,146),CNT,RESET(break1),USE(vl_no),RIGHT(1),FONT('Arial',8,,FONT:regular)
                           STRING(@s10),AT(3865,21,677,146),USE(GBAR:No_Satuan)
                           STRING(@n-12.2),AT(4688,21,750,146),USE(vl_harga_raja),RIGHT(90),FONT('Times New Roman',8,,)
                           STRING(@n-12.2),AT(5583,21,719,146),USE(vl_harga_ranap_3),RIGHT(90)
                           LINE,AT(10,198,7406,0),COLOR(COLOR:Black)
                         END
                       END
                       FOOTER,AT(302,10813,7417,219)
                         STRING('Page xxxxx of xxxxx'),AT(4531,0,1302,208),USE(?PageOfString),FONT('Times New Roman',8,,)
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
  GlobalErrors.SetProcedureName('PrintDaftarHargaObat')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:GApotik.SetOpenRelated()
  Relate:GApotik.Open                                      ! File GApotik used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintDaftarHargaObat',ProgressWindow)      ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:GStockGdg, ?Progress:PctText, Progress:Thermometer, ProgressMgr, GSGD:Kode_brg)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(GSGD:KeyKodeBrg)
  ThisReport.SetFilter('GBAR:Kode_brg<<>'''' and sub(GBAR:Kode_brg,1,5)<<>''3.2.X''')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  Relate:GStockGdg.SetQuickScan(1,Propagate:OneMany)
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
    Relate:GApotik.Close
  END
  IF SELF.Opened
    INIMgr.Update('PrintDaftarHargaObat',ProgressWindow)   ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = GSGD:Kode_brg                            ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  GBAR:Kode_brg = GSGD:Kode_brg                            ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  vl_harga_raja = (GSGD:Harga_Beli) + (GSGD:Harga_Beli) * 0.2
  vl_harga_ranap_3 = (GSGD:Harga_Beli) + (GSGD:Harga_Beli) * 0.25
  vl_harga_ranap_12vip = (GSGD:Harga_Beli) + (GSGD:Harga_Beli) * 0.3
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail1)
  RETURN ReturnValue

PrintDaftarHargaObat1 PROCEDURE                            ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
vl_ppn               REAL                                  !
vl_no                LONG                                  !
FilesOpened          BYTE                                  !
loc::datel           DATE                                  !
loc::time            TIME                                  !
loc::total           LONG                                  !
loc::nama_apotik     STRING(30)                            !Nama Apotik
APA                  STRING(20)                            !
vl_harga_raja        REAL                                  !
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
Process:View         VIEW(GStockGdg)
                       PROJECT(GSGD:Harga_Beli)
                       PROJECT(GSGD:Kode_brg)
                       JOIN(GBAR:KeyKodeBrg,GSGD:Kode_brg)
                         PROJECT(GBAR:Kode_brg)
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

report               REPORT,AT(146,1021,7854,9656),PAPER(PAPER:A4),PRE(RPT),FONT('Arial',10,COLOR:Black,),THOUS
                       HEADER,AT(135,250,7854,771)
                         STRING('DAFTAR HARGA OBAT & ALAT '),AT(42,21,3073,219),LEFT,FONT(,,,FONT:bold)
                         LINE,AT(4031,510,3813,0),USE(?Line7),COLOR(COLOR:Black)
                         BOX,AT(10,292,7844,479),COLOR(COLOR:Black)
                         LINE,AT(3375,292,0,479),USE(?Line6),COLOR(COLOR:Black)
                         LINE,AT(406,302,0,479),USE(?Line5),COLOR(COLOR:Black)
                         LINE,AT(1125,302,0,479),COLOR(COLOR:Black)
                         LINE,AT(4031,302,0,479),USE(?Line6:2),COLOR(COLOR:Black)
                         STRING('Kode Barang'),AT(427,313,698,167),TRN,FONT('Times New Roman',8,,)
                         STRING('Satuan'),AT(3396,313,385,167),TRN,CENTER,FONT('Times New Roman',8,,)
                         STRING('Harga'),AT(5406,313,667,167),TRN,FONT('Times New Roman',8,,)
                         STRING('RJ Cash'),AT(4083,542,563,188),USE(?String13),TRN,CENTER,FONT('Times New Roman',8,,)
                         STRING('RJ Nota'),AT(4677,542,563,188),USE(?String13:4),TRN,CENTER,FONT('Times New Roman',8,,)
                         STRING('RI Kls. 3'),AT(5302,542,563,188),USE(?String13:2),TRN,CENTER,FONT('Times New Roman',8,,)
                         STRING('RI Kls 2'),AT(6000,542,469,188),USE(?String13:3),TRN,FONT('Times New Roman',8,,)
                         STRING('RI Kls 1'),AT(6625,542,469,188),USE(?String13:5),TRN,FONT('Times New Roman',8,,)
                         STRING('RI VIP'),AT(7281,542,365,188),USE(?String13:6),TRN,FONT('Times New Roman',8,,)
                         STRING('No.'),AT(83,313,250,167),USE(?String19),TRN,CENTER,FONT('Times New Roman',8,,)
                         STRING('Nama Barang'),AT(1198,313),USE(?String10),TRN,FONT('Times New Roman',8,,)
                       END
break1                 BREAK(APA)
detail1                  DETAIL,AT(,,,188),FONT('Arial',8,,FONT:regular)
                           STRING(@s10),AT(458,10,625,146),USE(GBAR:Kode_brg),FONT('Arial',8,,FONT:regular)
                           STRING(@s40),AT(1115,10,2219,146),USE(GBAR:Nama_Brg),FONT('Arial',8,,FONT:regular)
                           STRING(@n10),AT(5938,10,635,146),USE(vl_harga_ranap2),RIGHT(90)
                           STRING(@n10),AT(6552,10,635,146),USE(vl_harga_ranap1),TRN,RIGHT(90)
                           STRING(@n-10),AT(7167,10,635,146),USE(vl_harga_ranap_12vip,,?vl_harga_ranap_12vip:3),TRN,RIGHT(90)
                           STRING(@n5),AT(42,10,333,146),CNT,RESET(break1),USE(vl_no),RIGHT(1),FONT('Arial',8,,FONT:regular)
                           STRING(@s10),AT(3375,10,677,146),USE(GBAR:No_Satuan)
                           STRING(@n-10),AT(4052,10,635,146),USE(vl_harga_raja),RIGHT(90),FONT('Times New Roman',8,,)
                           STRING(@n10),AT(4656,10,635,146),USE(vl_harga_raja_Nota),TRN,RIGHT(90),FONT('Times New Roman',8,,)
                           STRING(@n-10),AT(5292,10,635,146),USE(vl_harga_ranap_3),RIGHT(90)
                           LINE,AT(10,177,7833,0),COLOR(COLOR:Black)
                         END
                       END
                       FOOTER,AT(146,10677,7833,219)
                         STRING('Page xxxxx of xxxxx'),AT(4531,21,1302,208),USE(?PageOfString),TRN,FONT('Times New Roman',8,,)
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
  GlobalErrors.SetProcedureName('PrintDaftarHargaObat1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
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
  INIMgr.Fetch('PrintDaftarHargaObat1',ProgressWindow)     ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:GStockGdg, ?Progress:PctText, Progress:Thermometer, ProgressMgr, GSGD:Kode_brg)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(GSGD:KeyKodeBrg)
  ThisReport.SetFilter('GBAR:Kode_brg<<>'''' and sub(GBAR:Kode_brg,1,5)<<>''3.2.X''')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  Relate:GStockGdg.SetQuickScan(1,Propagate:OneMany)
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
    Relate:GApotik.Close
    Relate:ISetupAp.Close
  END
  IF SELF.Opened
    INIMgr.Update('PrintDaftarHargaObat1',ProgressWindow)  ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = GSGD:Kode_brg                            ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  GBAR:Kode_brg = GSGD:Kode_brg                            ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  vl_harga_raja=((GSGD:Harga_Beli)+(GSGD:Harga_Beli*vl_ppn/100)) + ((GSGD:Harga_Beli)+(GSGD:Harga_Beli*vl_ppn/100)) * vl_cash/100
  vl_harga_raja_nota=((GSGD:Harga_Beli)+(GSGD:Harga_Beli*vl_ppn/100)) + ((GSGD:Harga_Beli)+(GSGD:Harga_Beli*vl_ppn/100)) * vl_nota/100
  vl_harga_ranap1=((GSGD:Harga_Beli)+(GSGD:Harga_Beli*vl_ppn/100)) + ((GSGD:Harga_Beli)+(GSGD:Harga_Beli*vl_ppn/100)) * vl_kls1/100
  vl_harga_ranap2=((GSGD:Harga_Beli)+(GSGD:Harga_Beli*vl_ppn/100)) + ((GSGD:Harga_Beli)+(GSGD:Harga_Beli*vl_ppn/100)) * vl_kls2/100
  vl_harga_ranap_3=((GSGD:Harga_Beli)+(GSGD:Harga_Beli*vl_ppn/100)) + ((GSGD:Harga_Beli)+(GSGD:Harga_Beli*vl_ppn/100)) * vl_kls3/100
  vl_harga_ranap_12vip=((GSGD:Harga_Beli)+(GSGD:Harga_Beli*vl_ppn/100)) + ((GSGD:Harga_Beli)+(GSGD:Harga_Beli*vl_ppn/100)) * vl_vip/100
  display
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail1)
  RETURN ReturnValue

