

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N042.INC'),ONCE        !Local module procedure declarations
                     END


cari_instalasi PROCEDURE                                   ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
loc::kode_ins        STRING(20)                            !
loc::Nama_instalasi  STRING(30)                            !
BRW1::View:Browse    VIEW(TBinstli)
                       PROJECT(TBis:Kode_Instalasi)
                       PROJECT(TBis:Nama_instalasi)
                       PROJECT(TBis:Status)
                       PROJECT(TBis:Keterangan)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
TBis:Kode_Instalasi    LIKE(TBis:Kode_Instalasi)      !List box control field - type derived from field
TBis:Nama_instalasi    LIKE(TBis:Nama_instalasi)      !List box control field - type derived from field
TBis:Status            LIKE(TBis:Status)              !List box control field - type derived from field
TBis:Keterangan        LIKE(TBis:Keterangan)          !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Melihat Tabel Instalasi'),AT(,,213,180),FONT('Arial',8,,),IMM,HLP('cari_instalasi'),SYSTEM,GRAY,MDI
                       LIST,AT(8,25,191,121),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('60L(2)|M~Kode Instalasi~@s5@80L(2)|M~Nama instalasi~@s30@25L(2)|M~Status~@n3@80L' &|
   '(2)|M~Keterangan~@s20@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(124,0,45,14),USE(?Select:2),HIDE
                       SHEET,AT(4,4,202,172),USE(?CurrentTab),KEY(F2Key)
                         TAB('Kode Instalasi (F2)'),USE(?Tab:2)
                           STRING('Kode Instalasi :'),AT(99,157),USE(?String1)
                           ENTRY(@s5),AT(159,154,35,13),USE(loc::kode_ins),FONT('Times New Roman',10,,)
                         END
                         TAB('Nama Instalasi (F3)'),USE(?Tab:3),KEY(F3Key)
                           ENTRY(@s30),AT(86,153,112,13),USE(loc::Nama_instalasi),FONT('Times New Roman',10,,)
                           STRING('Nama Instalasi :'),AT(29,156),USE(?String2)
                         END
                       END
                       BUTTON('Close'),AT(159,0,45,14),USE(?Close),HIDE
                       BUTTON('Help'),AT(143,0,45,14),USE(?Help),HIDE,STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW1::Sort1:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('cari_instalasi')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GLO:INSDIGUNAKAN',GLO:INSDIGUNAKAN)                ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:TBinstli.Open                                     ! File TBinstli used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:TBinstli,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon TBis:Nama_instalasi for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,TBis:keynamains) ! Add the sort order for TBis:keynamains for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?loc::Nama_instalasi,TBis:Nama_instalasi,1,BRW1) ! Initialize the browse locator using ?loc::Nama_instalasi using key: TBis:keynamains , TBis:Nama_instalasi
  BRW1.SetFilter('(tbis:status<<>1 )')                     ! Apply filter expression to browse
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon TBis:Kode_Instalasi for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,TBis:keykodeins) ! Add the sort order for TBis:keykodeins for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?loc::kode_ins,TBis:Kode_Instalasi,1,BRW1) ! Initialize the browse locator using ?loc::kode_ins using key: TBis:keykodeins , TBis:Kode_Instalasi
  BRW1.SetFilter('(tbis:status<<>1 )')                     ! Apply filter expression to browse
  BRW1.AddField(TBis:Kode_Instalasi,BRW1.Q.TBis:Kode_Instalasi) ! Field TBis:Kode_Instalasi is a hot field or requires assignment from browse
  BRW1.AddField(TBis:Nama_instalasi,BRW1.Q.TBis:Nama_instalasi) ! Field TBis:Nama_instalasi is a hot field or requires assignment from browse
  BRW1.AddField(TBis:Status,BRW1.Q.TBis:Status)            ! Field TBis:Status is a hot field or requires assignment from browse
  BRW1.AddField(TBis:Keterangan,BRW1.Q.TBis:Keterangan)    ! Field TBis:Keterangan is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('cari_instalasi',QuickWindow)               ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:TBinstli.Close
  END
  IF SELF.Opened
    INIMgr.Update('cari_instalasi',QuickWindow)            ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
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

WindowTanggalInst PROCEDURE                                ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
Window               WINDOW('Tanggal'),AT(,,185,112),FONT('MS Sans Serif',8,,FONT:regular),CENTER,GRAY,DOUBLE,MDI
                       PANEL,AT(3,5,172,79),USE(?Panel1)
                       PROMPT('Dari Tanggal '),AT(25,17),USE(?VG_TANGGAL1:Prompt)
                       ENTRY(@D6-),AT(82,17,60,10),USE(VG_TANGGAL1)
                       PROMPT('Sampai Tanggal'),AT(25,37),USE(?VG_TANGGAL2:Prompt)
                       ENTRY(@d6-),AT(82,37,60,10),USE(VG_TANGGAL2)
                       PROMPT('Instalasi :'),AT(25,57),USE(?glo:instalasi:Prompt)
                       ENTRY(@s5),AT(82,57,28,10),USE(glo:instalasi)
                       BUTTON('...'),AT(113,56,12,12),USE(?CallLookup)
                       BUTTON('OK'),AT(31,90,123,14),USE(?OkButton),DEFAULT
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
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
  GlobalErrors.SetProcedureName('WindowTanggalInst')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Panel1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:TBinstli.Open                                     ! File TBinstli used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('WindowTanggalInst',Window)                 ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:TBinstli.Close
  END
  IF SELF.Opened
    INIMgr.Update('WindowTanggalInst',Window)              ! Save window data to non-volatile store
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
    cari_instalasi
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
    OF ?glo:instalasi
      IF glo:instalasi OR ?glo:instalasi{Prop:Req}
        TBis:Kode_Instalasi = glo:instalasi
        IF Access:TBinstli.TryFetch(TBis:keykodeins)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            glo:instalasi = TBis:Kode_Instalasi
          ELSE
            SELECT(?glo:instalasi)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      TBis:Kode_Instalasi = glo:instalasi
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        glo:instalasi = TBis:Kode_Instalasi
      END
      ThisWindow.Reset(1)
    OF ?OkButton
      ThisWindow.Update
      break
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

ProsesPrintSBBKRuangan PROCEDURE                           ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
vl_no                LONG                                  !
loc:bulan            SHORT                                 !
loc:tahun            LONG                                  !
Progress:Thermometer BYTE                                  !
loc::tanggal         DATE                                  !
loc::komentar        STRING(60)                            !
vl_ada               BYTE                                  !
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
Process:View         VIEW(GStockGdg)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,76),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                       PROMPT('No :'),AT(42,61),USE(?vl_no:Prompt)
                       ENTRY(@n-14),AT(62,61,38,10),USE(vl_no),RIGHT(1)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ProgressMgr          StepClass                             ! Progress Manager
view::file_sql view(filesql)
                 project(FIL:FString1,FIL:FReal1,FIL:FReal2)
               end

view::FReal1 view(filesql)
                 project(FIL:FReal1)
               end


view::jumlah view(filesql)
                project(FIL:FLong1,FIL:FReal1)
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
  GlobalErrors.SetProcedureName('ProsesPrintSBBKRuangan')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  !loc:tahun=glo:tahun
  !loc:bulan=glo:bulan-1
  !if loc:bulan=0 then
  !   loc:bulan=12
  !   loc:tahun=glo:tahun-1
  !end
  !display
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Relate:ApStokop.Open                                     ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql.Open                                      ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ASaldoAwal.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APKStok.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:AptoInDe.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:AptoInHe.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GBarang.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesPrintSBBKRuangan',ProgressWindow)    ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:GStockGdg, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(GStockGdg,'QUICKSCAN=on')
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
    INIMgr.Update('ProsesPrintSBBKRuangan',ProgressWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  Que::Print.gloq::total_harga   =0
  GBAR:Kode_brg=GSGD:Kode_brg
  access:gbarang.fetch(GBAR:KeyKodeBrg)
  Que::Print.gloq::Kode_brg       =GSGD:Kode_brg
  Que::Print.gloq::nama_brg       =GBAR:Nama_Brg
  open(view::jumlah)
  if errorcode() then message(error()).
  !message('select sum(jumlah) from dba.aptoinde where kode_brg='''&GSGD:Kode_brg&''' and n0_tran in (select n0_tran from dba.aptoinhe where tanggal>='''&format(VG_TANGGAL1,@d10)&''' and tanggal<<='''&format(VG_TANGGAL2,@d10)&''' and total_biaya>=0 and kd_ruang='''&clip(glo:instalasi)&''')')
  view::jumlah{prop:sql}='select sum(jumlah),sum(biaya) from dba.aptoinde where kode_brg='''&GSGD:Kode_brg&''' and n0_tran in (select n0_tran from dba.aptoinhe where tanggal>='''&format(VG_TANGGAL1,@d10)&''' and tanggal<<='''&format(VG_TANGGAL2,@d10)&''' and total_biaya>=0 and kd_ruang='''&clip(glo:instalasi)&''')'
  next(view::jumlah)
  if not(errorcode()) and FIL:FLong1<>0 then
    Que::Print.gloq::keluar         =FIL:FLong1
    Que::Print.gloq::total_harga   +=FIL:FReal1
    vl_ada=1
  else
    Que::Print.gloq::keluar         =0
  end
  close(view::jumlah)
  open(view::jumlah)
  view::jumlah{prop:sql}='select sum(jumlah),sum(biaya) from dba.aptoinde where kode_brg='''&GSGD:Kode_brg&''' and n0_tran in (select n0_tran from dba.aptoinhe where tanggal>='''&format(VG_TANGGAL1,@d10)&''' and tanggal<<='''&format(VG_TANGGAL2,@d10)&''' and total_biaya<<0 and kd_ruang='''&clip(glo:instalasi)&''')'
  next(view::jumlah)
  if not(errorcode()) and FIL:FLong1<>0 then
    Que::Print.gloq::Retur          =FIL:FLong1
    Que::Print.gloq::total_harga   -=FIL:FReal1
    vl_ada=1
  else
    Que::Print.gloq::Retur          =0
  end
  close(view::jumlah)
  Que::Print.gloq::total          =Que::Print.gloq::keluar-Que::Print.gloq::Retur
  Que::Print.gloq::harga          =Que::Print.gloq::total_harga/Que::Print.gloq::total
  !Que::Print.gloq::harga          =GSGD:Harga_Beli*1.1
  !Que::Print.gloq::total_harga    =Que::Print.gloq::total*(GSGD:Harga_Beli*1.1)
  if vl_ada=1 then
    add(Que::Print,+Que::Print.gloq::kode_brg)
  end
  vl_ada=0
  vl_no+=1
  display(vl_no)
  RETURN ReturnValue

