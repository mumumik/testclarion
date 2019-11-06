

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N055.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N035.INC'),ONCE        !Req'd for module callout resolution
                     END


ProsesOpnameByTanggal PROCEDURE                            ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
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
  GlobalErrors.SetProcedureName('ProsesOpnameByTanggal')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  loc:tahun=year(vg_tanggalopname)
  loc:bulan=month(vg_tanggalopname)
  display
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File ApStokopSS used by this procedure, so make sure it's RelationManager is open
  Relate:ApStokop.Open                                     ! File ApStokopSS used by this procedure, so make sure it's RelationManager is open
  Relate:ApStokopSS.Open                                   ! File ApStokopSS used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql.Open                                      ! File ApStokopSS used by this procedure, so make sure it's RelationManager is open
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ASaldoAwal.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APKStok.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GBarang.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesOpnameByTanggal',ProgressWindow)     ! Restore window settings from non-volatile store
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
    Relate:ApStokopSS.Close
    Relate:FileSql.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesOpnameByTanggal',ProgressWindow)  ! Save window data to non-volatile store
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
  
  !Stok Opname
  Apso1:Kode_Apotik        =glo::kode_apotik
  Apso1:Kode_Barang        =GSTO:Kode_Barang
  Apso1:Tanggal            =vg_tanggalopname
  if access:apstokopss.fetch(Apso1:kdapotik_brg)<>level:benign then
     Apso1:Kode_Apotik        =glo::kode_apotik
     Apso1:Kode_Barang        =GSTO:Kode_Barang
     Apso1:Tanggal            =vg_tanggalopname
     Apso1:Stkomputer         =round(vl_saldo_akhir,.00001)
     Apso1:StHitung           =round(vl_saldo_akhir,.00001)
     Apso1:Harga              =round(vl_saldo_akhir_rp,.00001)
     Apso1:Nilaistok          =round(vl_saldo_akhir*vl_saldo_akhir_rp,.00001)
     access:apstokopss.insert()
  end
  vl_no+=1
  display
  RETURN ReturnValue

BrowseDataOpnameSetiapSaat PROCEDURE                       ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(ApStokopSS)
                       PROJECT(Apso1:Kode_Barang)
                       PROJECT(Apso1:Tanggal)
                       PROJECT(Apso1:Stkomputer)
                       PROJECT(Apso1:StHitung)
                       PROJECT(Apso1:Kode_Apotik)
                       JOIN(GBAR:KeyKodeBrg,Apso1:Kode_Barang)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Status)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Apso1:Kode_Barang      LIKE(Apso1:Kode_Barang)        !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
Apso1:Tanggal          LIKE(Apso1:Tanggal)            !List box control field - type derived from field
Apso1:Stkomputer       LIKE(Apso1:Stkomputer)         !List box control field - type derived from field
Apso1:StHitung         LIKE(Apso1:StHitung)           !List box control field - type derived from field
Apso1:Kode_Apotik      LIKE(Apso1:Kode_Apotik)        !List box control field - type derived from field
GBAR:Status            LIKE(GBAR:Status)              !List box control field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Data Stok Opname Per Tanggal'),AT(,,420,254),FONT('Arial',8,,),CENTER,IMM,HLP('BrowseDataOpnameSetiapSaat'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,399,206),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('40L(2)|M~Kode Barang~@s10@160L(2)|M~Nama Obat~@s40@40L(2)|M~Tanggal~@d06@43D(2)|' &|
   'M~Stkomputer~L@n10.2@49D(18)|M~StHitung~C(0)@n10.2@47D(18)|M~Kode Apotik~C(0)@s5' &|
   '@12L(2)|M~Status~@n3@'),FROM(Queue:Browse:1)
                       PROMPT('Kode Barang:'),AT(9,238),USE(?Apso1:Kode_Barang:Prompt)
                       BUTTON('Proses'),AT(173,236,45,14),USE(?Button2)
                       SHEET,AT(4,4,409,228),USE(?CurrentTab)
                         TAB('Kode apotik + barang+tahun+bulan'),USE(?Tab:2)
                         END
                         TAB('Tab 2'),USE(?Tab2)
                         END
                       END
                       BUTTON('&Selesai'),AT(304,236,45,14),USE(?Close)
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
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('BrowseDataOpnameSetiapSaat')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  WindowTanggalOpname()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  BIND('vg_tanggalopname',vg_tanggalopname)                ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:ApStokopSS.Open                                   ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Relate:GBarang.Open                                      ! File GBarang used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:ApStokopSS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,Apso1:keykdap_bln_thn)                ! Add the sort order for Apso1:keykdap_bln_thn for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,Apso1:Kode_Apotik,,BRW1)       ! Initialize the browse locator using  using key: Apso1:keykdap_bln_thn , Apso1:Kode_Apotik
  BRW1.AddSortOrder(,Apso1:keykode_barang)                 ! Add the sort order for Apso1:keykode_barang for sort order 2
  BRW1.AddSortOrder(,Apso1:keykode_barang)                 ! Add the sort order for Apso1:keykode_barang for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,Apso1:Kode_Barang,,BRW1)       ! Initialize the browse locator using  using key: Apso1:keykode_barang , Apso1:Kode_Barang
  BRW1.SetFilter('(gbar:status=1 and apso1:kode_apotik=GL_entryapotik and apso1:tanggal=vg_tanggalopname)') ! Apply filter expression to browse
  BRW1.AddField(Apso1:Kode_Barang,BRW1.Q.Apso1:Kode_Barang) ! Field Apso1:Kode_Barang is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Nama_Brg,BRW1.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW1.AddField(Apso1:Tanggal,BRW1.Q.Apso1:Tanggal)        ! Field Apso1:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(Apso1:Stkomputer,BRW1.Q.Apso1:Stkomputer)  ! Field Apso1:Stkomputer is a hot field or requires assignment from browse
  BRW1.AddField(Apso1:StHitung,BRW1.Q.Apso1:StHitung)      ! Field Apso1:StHitung is a hot field or requires assignment from browse
  BRW1.AddField(Apso1:Kode_Apotik,BRW1.Q.Apso1:Kode_Apotik) ! Field Apso1:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Status,BRW1.Q.GBAR:Status)            ! Field GBAR:Status is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Kode_brg,BRW1.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseDataOpnameSetiapSaat',QuickWindow)   ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ApStokopSS.Close
    Relate:GBarang.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseDataOpnameSetiapSaat',QuickWindow) ! Save window data to non-volatile store
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
    OF ?Button2
      ThisWindow.Update
      START(ProsesOpnameByTanggal, 25000)
      ThisWindow.Reset
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

WindowTanggalOpname PROCEDURE                              ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
Window               WINDOW('Tanggal'),AT(,,169,92),FONT('MS Sans Serif',8,COLOR:Black,FONT:regular),CENTER,GRAY,DOUBLE
                       PANEL,AT(3,5,161,62),USE(?Panel1)
                       PROMPT('Tanggal :'),AT(25,29),USE(?VG_TANGGAL1:Prompt)
                       ENTRY(@d06),AT(63,29,60,10),USE(vg_tanggalopname),REQ
                       BUTTON('OK'),AT(23,71,123,14),USE(?OkButton),DEFAULT
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
  GlobalErrors.SetProcedureName('WindowTanggalOpname')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Panel1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('WindowTanggalOpname',Window)               ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('WindowTanggalOpname',Window)            ! Save window data to non-volatile store
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
      break
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

BrowseOpnamePerBulan PROCEDURE                             ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
vl_fisik             REAL                                  !
vl_komputer          REAL                                  !
vl_total_fisik       REAL                                  !
vl_total_komputer    REAL                                  !
vl_gtot_komputer     REAL                                  !
vl_gtot_fisik        REAL                                  !
vl_harga             REAL                                  !
BRW1::View:Browse    VIEW(ApStokop)
                       PROJECT(Apso:Kode_Barang)
                       PROJECT(Apso:Tahun)
                       PROJECT(Apso:Bulan)
                       PROJECT(Apso:Stkomputer)
                       PROJECT(Apso:StHitung)
                       PROJECT(Apso:Harga)
                       PROJECT(Apso:Kode_Apotik)
                       JOIN(GBAR:KeyKodeBrg,Apso:Kode_Barang)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Apso:Kode_Barang       LIKE(Apso:Kode_Barang)         !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
Apso:Tahun             LIKE(Apso:Tahun)               !List box control field - type derived from field
Apso:Bulan             LIKE(Apso:Bulan)               !List box control field - type derived from field
Apso:Stkomputer        LIKE(Apso:Stkomputer)          !List box control field - type derived from field
Apso:StHitung          LIKE(Apso:StHitung)            !List box control field - type derived from field
Apso:Harga             LIKE(Apso:Harga)               !List box control field - type derived from field
vl_total_komputer      LIKE(vl_total_komputer)        !List box control field - type derived from local data
vl_total_fisik         LIKE(vl_total_fisik)           !List box control field - type derived from local data
Apso:Kode_Apotik       LIKE(Apso:Kode_Apotik)         !Browse hot field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('STOK Opname'),AT(,,477,259),FONT('Arial',8,,),CENTER,IMM,HLP('BrowseStokOpnameBaru'),SYSTEM,GRAY,MDI
                       LIST,AT(6,2,469,236),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('47L(2)|M~Kode Barang~@s10@73L(2)|M~Nama Obat~@s40@24R(2)|M~Tahun~C(0)@n4@21R(2)|' &|
   'M~Bulan~C(0)@n3@52D(12)|M~Jml Komputer~C(0)@n-15.2@51D(10)|M~Jml Fisik~C(0)@n-15' &|
   '.2@40D(10)|M~Harga~C(0)@n-15.2@53D(10)|M~Total Komputer~C(0)@n-15.2@60D(10)|M~To' &|
   'tal Fisik~C(0)@n-15.2@'),FROM(Queue:Browse:1)
                       BUTTON('&Delete'),AT(321,210,45,14),USE(?Delete:2),DISABLE,HIDE
                       BUTTON('&Selesai'),AT(102,242,45,14),USE(?Close)
                       ENTRY(@n-15.2),AT(352,243,60,10),USE(vl_gtot_komputer),DECIMAL(14)
                       ENTRY(@n-15.2),AT(414,243,60,10),USE(vl_gtot_fisik),DECIMAL(14)
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
ResetFromAsk           PROCEDURE(*BYTE Request,*BYTE Response),DERIVED ! Method added to host embed code
ResetFromView          PROCEDURE(),DERIVED                 ! Method added to host embed code
SetQueueRecord         PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
  GlobalErrors.SetProcedureName('BrowseOpnamePerBulan')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  WindowTanggalSkr()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  BIND('glo:bulan',glo:bulan)                              ! Added by: BrowseBox(ABC)
  BIND('glo:tahun',glo:tahun)                              ! Added by: BrowseBox(ABC)
  BIND('vl_total_komputer',vl_total_komputer)              ! Added by: BrowseBox(ABC)
  BIND('vl_total_fisik',vl_total_fisik)                    ! Added by: BrowseBox(ABC)
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
  SELF.Open(QuickWindow)                                   ! Open window
  IF GLO:LEVEL > 0
     !?Button5{prop:disable}=1
     !?Insert:2{prop:hide}=1
  end
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,Apso:keykode_barang)                  ! Add the sort order for Apso:keykode_barang for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,Apso:Kode_Barang,,BRW1)        ! Initialize the browse locator using  using key: Apso:keykode_barang , Apso:Kode_Barang
  BRW1.SetFilter('(apso:kode_apotik=GL_entryapotik and apso:bulan=glo:bulan and apso:tahun=glo:tahun and apso:kode_barang<<>'''' and apso:kode_barang<<>''0{10}'')') ! Apply filter expression to browse
  BRW1.AddField(Apso:Kode_Barang,BRW1.Q.Apso:Kode_Barang)  ! Field Apso:Kode_Barang is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Nama_Brg,BRW1.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW1.AddField(Apso:Tahun,BRW1.Q.Apso:Tahun)              ! Field Apso:Tahun is a hot field or requires assignment from browse
  BRW1.AddField(Apso:Bulan,BRW1.Q.Apso:Bulan)              ! Field Apso:Bulan is a hot field or requires assignment from browse
  BRW1.AddField(Apso:Stkomputer,BRW1.Q.Apso:Stkomputer)    ! Field Apso:Stkomputer is a hot field or requires assignment from browse
  BRW1.AddField(Apso:StHitung,BRW1.Q.Apso:StHitung)        ! Field Apso:StHitung is a hot field or requires assignment from browse
  BRW1.AddField(Apso:Harga,BRW1.Q.Apso:Harga)              ! Field Apso:Harga is a hot field or requires assignment from browse
  BRW1.AddField(vl_total_komputer,BRW1.Q.vl_total_komputer) ! Field vl_total_komputer is a hot field or requires assignment from browse
  BRW1.AddField(vl_total_fisik,BRW1.Q.vl_total_fisik)      ! Field vl_total_fisik is a hot field or requires assignment from browse
  BRW1.AddField(Apso:Kode_Apotik,BRW1.Q.Apso:Kode_Apotik)  ! Field Apso:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Kode_brg,BRW1.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseOpnamePerBulan',QuickWindow)         ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
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
    INIMgr.Update('BrowseOpnamePerBulan',QuickWindow)      ! Save window data to non-volatile store
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


BRW1.ResetFromAsk PROCEDURE(*BYTE Request,*BYTE Response)

  CODE
  PARENT.ResetFromAsk(Request,Response)
  !if request=2 and response=1 then
  !   !Stok Apotik
  !   GSTO:Kode_Apotik=Apso:Kode_Apotik
  !   GSTO:Kode_Barang=Apso:Kode_Barang
  !   if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
  !      GSTO:Saldo=Apso:StHitung
  !      access:gstokaptk.update()
  !   end
  !
  !   !Kartu FIFO
  !   AFI:Kode_Barang  =Apso:Kode_Barang
  !   AFI:Mata_Uang    ='Rp'
  !   AFI:NoTransaksi  ='OPN'&sub(format(Apso:Tahun,@p####p),3,2)&format(Apso:Bulan,@p##p)
  !   AFI:Transaksi    =1
  !   AFI:Kode_Apotik  =Apso:Kode_Apotik
  !   if access:afifoin.fetch(AFI:KEY1)=level:benign then
  !      AFI:Jumlah    =Apso:StHitung
  !      access:afifoin.update()
  !   end
  !
  !   !Kartu Stok
  !   APK:Kode_Barang     =Apso:Kode_Barang
  !   APK:Tanggal         =date(Apso:Bulan,1,Apso:Tahun)
  !   APK:Transaksi       =1
  !   APK:NoTransaksi     ='OPN'&sub(format(Apso:tahun,@p####p),3,2)&format(Apso:bulan,@p##p)
  !   APK:Kode_Apotik     =Apso:Kode_Apotik
  !   if access:apkstok.fetch(APK:KEY1)=level:benign then
  !      APK:Debet            =Apso:StHitung
  !      access:apkstok.update()
  !   else
  !      message(error())
  !   end
  !end


BRW1.ResetFromView PROCEDURE

vl_gtot_fisik:Sum    REAL                                  ! Sum variable for browse totals
vl_gtot_komputer:Sum REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:ApStokop.SetQuickScan(1)
  SELF.Reset
  LOOP
    CASE SELF.Next()
    OF Level:Notify
      BREAK
    OF Level:Fatal
      SETCURSOR()
      RETURN
    END
    SELF.SetQueueRecord
    vl_gtot_fisik:Sum += vl_total_fisik
    vl_gtot_komputer:Sum += vl_total_komputer
  END
  vl_gtot_fisik = vl_gtot_fisik:Sum
  vl_gtot_komputer = vl_gtot_komputer:Sum
  PARENT.ResetFromView
  Relate:ApStokop.SetQuickScan(0)
  SETCURSOR()


BRW1.SetQueueRecord PROCEDURE

  CODE
  !vl_harga=0
  !ASA:Kode_Barang =Apso:Kode_Barang
  !ASA:Apotik      =Apso:Kode_Apotik
  !ASA:Bulan       =Apso:Bulan
  !ASA:Tahun       =Apso:Tahun
  !if access:asaldoawal.fetch(ASA:PrimaryKey)=level:benign then
  !   vl_harga=ASA:Harga
  !end
  !if vl_harga<=0 then
  !   vl_harga=Apso:Harga
  !end
  vl_harga=Apso:Harga
  vl_total_komputer=Apso:Stkomputer * vl_harga
  vl_total_fisik=Apso:StHitung * vl_harga
  display
  PARENT.SetQueueRecord
  


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

