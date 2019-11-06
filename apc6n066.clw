

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N066.INC'),ONCE        !Local module procedure declarations
                     END


PrintDKBOnline PROCEDURE                                   ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
vl_jumlah            REAL                                  !
vl_selisih           REAL                                  !
Process:View         VIEW(INDDKB)
                       PROJECT(IND:Jumlah)
                       PROJECT(IND:KodeBarang)
                       PROJECT(IND:Nomor)
                       JOIN(INH:PK,IND:Nomor)
                         PROJECT(INH:Nomor)
                         PROJECT(INH:Tanggal)
                         PROJECT(INH:Instalasi)
                         JOIN(TBis:keykodeins,INH:Instalasi)
                           PROJECT(TBis:Nama_instalasi)
                         END
                       END
                       JOIN(GBAR:KeyKodeBrg,IND:KodeBarang)
                         PROJECT(GBAR:Nama_Brg)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(271,990,7719,10031),PRE(RPT),FONT('Arial',10,COLOR:Black,),THOUS
                       HEADER,AT(281,115,7698,865)
                         STRING('DKB ONLINE'),AT(52,0,1625,219),LEFT,FONT(,,,FONT:bold)
                         STRING('Nomor :'),AT(52,177,583,219),USE(?String13),TRN,LEFT,FONT(,,,FONT:bold)
                         STRING(@s12),AT(625,177),USE(INH:Nomor)
                         STRING('Tanggal :'),AT(52,375,688,219),USE(?String13:2),TRN,LEFT,FONT(,,,FONT:bold)
                         STRING(@d06),AT(781,375),USE(INH:Tanggal),TRN
                         STRING('Instalasi :'),AT(2656,375,688,219),USE(?String13:3),TRN,LEFT,FONT(,,,FONT:bold)
                         STRING(@s30),AT(3396,375,2250,219),USE(TBis:Nama_instalasi),TRN
                         BOX,AT(0,583,7667,281),COLOR(COLOR:Black),FILL(COLOR:Silver)
                         STRING('Nama'),AT(781,635,896,167),TRN
                         STRING('Kode '),AT(63,635,542,167),TRN
                         STRING('Permintaan'),AT(2698,635,708,167),TRN
                         STRING('Dipenuhi'),AT(3854,635,896,167),TRN
                         STRING('Selisih'),AT(4854,635,896,167),TRN
                       END
detail1                DETAIL,AT(,,,208),FONT('Arial',8,,FONT:regular)
                         STRING(@n10.2),AT(3781,0),USE(vl_jumlah),RIGHT(14)
                         STRING(@s10),AT(52,10),USE(IND:KodeBarang)
                         STRING(@s40),AT(792,10,1781,177),USE(GBAR:Nama_Brg)
                         STRING(@n-15.2),AT(2635,10,802,177),USE(IND:Jumlah),RIGHT(14)
                         STRING(@n-10.2),AT(4698,10),USE(vl_selisih),RIGHT(14)
                       END
                       FOOTER,AT(260,11021,7719,219)
                         LINE,AT(21,10,7635,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING(@pPage <<<#p),AT(5250,31,698,135),PAGENO,USE(?PageCount),FONT('Arial',8,,FONT:regular)
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
  GlobalErrors.SetProcedureName('PrintDKBOnline')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo:nomorkwitansi',glo:nomorkwitansi)              ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AptoInDe.Open                                     ! File AptoInHe used by this procedure, so make sure it's RelationManager is open
  Relate:INDDKB.Open                                       ! File AptoInHe used by this procedure, so make sure it's RelationManager is open
  Access:AptoInHe.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintDKBOnline',ProgressWindow)            ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisReport.Init(Process:View, Relate:INDDKB, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  ThisReport.SetFilter('INH:Nomor=glo:nomorkwitansi')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  Relate:INDDKB.SetQuickScan(1,Propagate:OneMany)
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
    Relate:AptoInDe.Close
    Relate:INDDKB.Close
  END
  IF SELF.Opened
    INIMgr.Update('PrintDKBOnline',ProgressWindow)         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  INH:Nomor = IND:Nomor                                    ! Assign linking field value
  Access:INHDKB.Fetch(INH:PK)
  TBis:Kode_Instalasi = INH:Instalasi                      ! Assign linking field value
  Access:TBinstli.Fetch(TBis:keykodeins)
  GBAR:Kode_brg = IND:KodeBarang                           ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  INH:Nomor = IND:Nomor                                    ! Assign linking field value
  Access:INHDKB.Fetch(INH:PK)
  TBis:Kode_Instalasi = INH:Instalasi                      ! Assign linking field value
  Access:TBinstli.Fetch(TBis:keykodeins)
  GBAR:Kode_brg = IND:KodeBarang                           ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  APTI:nomordkb=INH:Nomor
  if access:aptoinhe.fetch(APTI:nodkb_aptoinhe_fk)=level:benign then
     APTD:N0_tran =APTI:N0_tran
     APTD:Kode_Brg=IND:KodeBarang
     if access:aptoinde.fetch(APTD:key_no_nota)=level:benign then
        vl_jumlah     =APTD:Jumlah
        vl_selisih    =IND:Jumlah-APTD:Jumlah
     else
        vl_jumlah     =0
        vl_selisih    =IND:Jumlah
     end
  else
     vl_jumlah     =0
     vl_selisih    =IND:Jumlah
  end
  display
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail1)
  RETURN ReturnValue

BrowseDKBInstalasi PROCEDURE                               ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
vl_jumlah            REAL                                  !
vl_selisih           REAL                                  !
BRW1::View:Browse    VIEW(INHDKB)
                       PROJECT(INH:Nomor)
                       PROJECT(INH:Instalasi)
                       PROJECT(INH:Tanggal)
                       PROJECT(INH:Jam)
                       PROJECT(INH:Operator)
                       PROJECT(INH:TanggalValidasi)
                       PROJECT(INH:JamValidasi)
                       PROJECT(INH:UserValidasi)
                       PROJECT(INH:Validasi)
                       PROJECT(INH:Ambil)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
INH:Nomor              LIKE(INH:Nomor)                !List box control field - type derived from field
INH:Nomor_NormalFG     LONG                           !Normal forground color
INH:Nomor_NormalBG     LONG                           !Normal background color
INH:Nomor_SelectedFG   LONG                           !Selected forground color
INH:Nomor_SelectedBG   LONG                           !Selected background color
INH:Instalasi          LIKE(INH:Instalasi)            !List box control field - type derived from field
INH:Tanggal            LIKE(INH:Tanggal)              !List box control field - type derived from field
INH:Jam                LIKE(INH:Jam)                  !List box control field - type derived from field
INH:Operator           LIKE(INH:Operator)             !List box control field - type derived from field
INH:TanggalValidasi    LIKE(INH:TanggalValidasi)      !List box control field - type derived from field
INH:JamValidasi        LIKE(INH:JamValidasi)          !List box control field - type derived from field
INH:UserValidasi       LIKE(INH:UserValidasi)         !List box control field - type derived from field
INH:Validasi           LIKE(INH:Validasi)             !List box control field - type derived from field
INH:Ambil              LIKE(INH:Ambil)                !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(INDDKB)
                       PROJECT(IND:Nomor)
                       PROJECT(IND:Jumlah)
                       PROJECT(IND:Harga)
                       PROJECT(IND:Total)
                       PROJECT(IND:Keterangan)
                       PROJECT(IND:KodeBarang)
                       JOIN(GBAR:KeyKodeBrg,IND:KodeBarang)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
IND:Nomor              LIKE(IND:Nomor)                !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
IND:Jumlah             LIKE(IND:Jumlah)               !List box control field - type derived from field
IND:Harga              LIKE(IND:Harga)                !List box control field - type derived from field
IND:Total              LIKE(IND:Total)                !List box control field - type derived from field
vl_jumlah              LIKE(vl_jumlah)                !List box control field - type derived from local data
vl_selisih             LIKE(vl_selisih)               !List box control field - type derived from local data
IND:Keterangan         LIKE(IND:Keterangan)           !List box control field - type derived from field
IND:KodeBarang         LIKE(IND:KodeBarang)           !Primary key field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('DKB Online ...'),AT(,,419,276),FONT('MS Sans Serif',8,COLOR:Black,),IMM,HLP('SelectDKBInstalasi'),SYSTEM,GRAY,RESIZE,MDI
                       LIST,AT(8,20,405,103),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('52L(2)|M*~Nomor~@s12@40L(2)|M~Instalasi~@s5@52R(2)|M~Tanggal~C(0)@d06@41R(2)|M~J' &|
   'am~C(0)@t04@43L(2)|M~Operator~@s20@58R(2)|M~Tanggal Validasi~C(0)@d06@45R(2)|M~J' &|
   'am Validasi~C(0)@t04@52L(2)|M~User Validasi~@s20@34R(2)|M~Validasi~C(0)@n3@12L(2' &|
   ')|M~Ambil~@n3@'),FROM(Queue:Browse:1)
                       LIST,AT(8,147,405,110),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('48L|M~Nomor~@s12@131L|M~Nama Obat~@s40@41R|M~Jumlah~L@n-15.2@47R|M~Harga~L@n-15.' &|
   '2@49R|M~Total~L@n-15.2@37R|M~Terpenuhi~L@n10.2@38R|M~Selisih~L@n-10.2@200D|M~Ket' &|
   'erangan~L@s50@'),FROM(Queue:Browse)
                       BUTTON('Cetak Tidak Terpenuhi'),AT(236,127,79,14),USE(?Button4)
                       BUTTON('Cetak All'),AT(174,127,56,14),USE(?Button2)
                       SHEET,AT(4,4,414,140),USE(?CurrentTab)
                         TAB('Nomor (Belum Ditransaksikan)'),USE(?Tab:2)
                           PROMPT('Nomor:'),AT(9,128),USE(?INH:Nomor:Prompt)
                           ENTRY(@s12),AT(59,128,60,10),USE(INH:Nomor)
                         END
                         TAB('Sudah Ditransaksikan'),USE(?Tab2)
                           BUTTON('&Query'),AT(11,127,45,14),USE(?Query)
                         END
                         TAB('&All'),USE(?Tab3)
                         END
                       END
                       BUTTON('&Selesai'),AT(305,261,45,14),USE(?Close)
                       BUTTON('Cetak Terpenuhi'),AT(318,127,79,14),USE(?Button4:2)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
QBE2                 QueryFormClass                        ! QBE List Class. 
QBV2                 QueryFormVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
SetQueueRecord         PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW5                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
SetQueueRecord         PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW5::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
  GlobalErrors.SetProcedureName('BrowseDKBInstalasi')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('vl_jumlah',vl_jumlah)                              ! Added by: BrowseBox(ABC)
  BIND('vl_selisih',vl_selisih)                            ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:AptoInDe.Open                                     ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Relate:INDDKB.Open                                       ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Relate:INHDKB.Open                                       ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Access:AptoInHe.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:INHDKB,SELF) ! Initialize the browse manager
  BRW5.Init(?List,Queue:Browse.ViewPosition,BRW5::View:Browse,Queue:Browse,Relate:INDDKB,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  QBE2.Init(QBV2, INIMgr,'BrowseDKBInstalasi', GlobalErrors)
  QBE2.QkSupport = True
  QBE2.QkMenuIcon = 'QkQBE.ico'
  QBE2.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,INH:PK)                               ! Add the sort order for INH:PK for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,INH:Nomor,1,BRW1)              ! Initialize the browse locator using  using key: INH:PK , INH:Nomor
  BRW1.SetFilter('(inh:validasi=1 and inh:ambil=1)')       ! Apply filter expression to browse
  BRW1.AddSortOrder(,INH:PK)                               ! Add the sort order for INH:PK for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,INH:Nomor,1,BRW1)              ! Initialize the browse locator using  using key: INH:PK , INH:Nomor
  BRW1.SetFilter('(inh:validasi=1)')                       ! Apply filter expression to browse
  BRW1.AddSortOrder(,INH:PK)                               ! Add the sort order for INH:PK for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(?INH:Nomor,INH:Nomor,1,BRW1)    ! Initialize the browse locator using ?INH:Nomor using key: INH:PK , INH:Nomor
  BRW1.SetFilter('(inh:validasi=1 and inh:ambil<<>1)')     ! Apply filter expression to browse
  BRW1.AddField(INH:Nomor,BRW1.Q.INH:Nomor)                ! Field INH:Nomor is a hot field or requires assignment from browse
  BRW1.AddField(INH:Instalasi,BRW1.Q.INH:Instalasi)        ! Field INH:Instalasi is a hot field or requires assignment from browse
  BRW1.AddField(INH:Tanggal,BRW1.Q.INH:Tanggal)            ! Field INH:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(INH:Jam,BRW1.Q.INH:Jam)                    ! Field INH:Jam is a hot field or requires assignment from browse
  BRW1.AddField(INH:Operator,BRW1.Q.INH:Operator)          ! Field INH:Operator is a hot field or requires assignment from browse
  BRW1.AddField(INH:TanggalValidasi,BRW1.Q.INH:TanggalValidasi) ! Field INH:TanggalValidasi is a hot field or requires assignment from browse
  BRW1.AddField(INH:JamValidasi,BRW1.Q.INH:JamValidasi)    ! Field INH:JamValidasi is a hot field or requires assignment from browse
  BRW1.AddField(INH:UserValidasi,BRW1.Q.INH:UserValidasi)  ! Field INH:UserValidasi is a hot field or requires assignment from browse
  BRW1.AddField(INH:Validasi,BRW1.Q.INH:Validasi)          ! Field INH:Validasi is a hot field or requires assignment from browse
  BRW1.AddField(INH:Ambil,BRW1.Q.INH:Ambil)                ! Field INH:Ambil is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse
  BRW5.AddSortOrder(,IND:PK)                               ! Add the sort order for IND:PK for sort order 1
  BRW5.AddRange(IND:Nomor,Relate:INDDKB,Relate:INHDKB)     ! Add file relationship range limit for sort order 1
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort0:Locator.Init(,IND:KodeBarang,1,BRW5)         ! Initialize the browse locator using  using key: IND:PK , IND:KodeBarang
  BRW5.AddField(IND:Nomor,BRW5.Q.IND:Nomor)                ! Field IND:Nomor is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Nama_Brg,BRW5.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW5.AddField(IND:Jumlah,BRW5.Q.IND:Jumlah)              ! Field IND:Jumlah is a hot field or requires assignment from browse
  BRW5.AddField(IND:Harga,BRW5.Q.IND:Harga)                ! Field IND:Harga is a hot field or requires assignment from browse
  BRW5.AddField(IND:Total,BRW5.Q.IND:Total)                ! Field IND:Total is a hot field or requires assignment from browse
  BRW5.AddField(vl_jumlah,BRW5.Q.vl_jumlah)                ! Field vl_jumlah is a hot field or requires assignment from browse
  BRW5.AddField(vl_selisih,BRW5.Q.vl_selisih)              ! Field vl_selisih is a hot field or requires assignment from browse
  BRW5.AddField(IND:Keterangan,BRW5.Q.IND:Keterangan)      ! Field IND:Keterangan is a hot field or requires assignment from browse
  BRW5.AddField(IND:KodeBarang,BRW5.Q.IND:KodeBarang)      ! Field IND:KodeBarang is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Kode_brg,BRW5.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseDKBInstalasi',QuickWindow)           ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.QueryControl = ?Query
  BRW1.UpdateQuery(QBE2,1)
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
    Relate:AptoInDe.Close
    Relate:INDDKB.Close
    Relate:INHDKB.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseDKBInstalasi',QuickWindow)        ! Save window data to non-volatile store
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
    CASE ACCEPTED()
    OF ?Button4
      glo:nomorkwitansi=INH:Nomor
      display
    OF ?Button2
      glo:nomorkwitansi=INH:Nomor
      display
    OF ?Button4:2
      glo:nomorkwitansi=INH:Nomor
      display
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button4
      ThisWindow.Update
      START(PrintCetakDBKTidakTerpenuhi, 25000)
      ThisWindow.Reset
    OF ?Button2
      ThisWindow.Update
      START(PrintDKBOnline, 25000)
      ThisWindow.Reset
    OF ?Button4:2
      ThisWindow.Update
      START(PrintCetakDBKTerpenuhi, 25000)
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


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (inh:ambil=1)
    SELF.Q.INH:Nomor_NormalFG = 255                        ! Set conditional color values for INH:Nomor
    SELF.Q.INH:Nomor_NormalBG = -1
    SELF.Q.INH:Nomor_SelectedFG = 255
    SELF.Q.INH:Nomor_SelectedBG = -1
  ELSE
    SELF.Q.INH:Nomor_NormalFG = -1                         ! Set color values for INH:Nomor
    SELF.Q.INH:Nomor_NormalBG = -1
    SELF.Q.INH:Nomor_SelectedFG = -1
    SELF.Q.INH:Nomor_SelectedBG = -1
  END


BRW5.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW5.SetQueueRecord PROCEDURE

  CODE
  APTI:nomordkb=INH:Nomor
  if access:aptoinhe.fetch(APTI:nodkb_aptoinhe_fk)=level:benign then
     APTD:N0_tran =APTI:N0_tran
     APTD:Kode_Brg=IND:KodeBarang
     if access:aptoinde.fetch(APTD:key_no_nota)=level:benign then
        vl_jumlah     =APTD:Jumlah
        vl_selisih    =IND:Jumlah-APTD:Jumlah
     else
        vl_jumlah     =0
        vl_selisih    =IND:Jumlah
     end
  else
     vl_jumlah     =0
     vl_selisih    =IND:Jumlah
  end
  display
  
  PARENT.SetQueueRecord


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

PrintCetakDBKTidakTerpenuhi PROCEDURE                      ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
vl_jumlah            REAL                                  !
vl_selisih           REAL                                  !
Process:View         VIEW(INDDKB)
                       PROJECT(IND:Jumlah)
                       PROJECT(IND:KodeBarang)
                       PROJECT(IND:Nomor)
                       JOIN(INH:PK,IND:Nomor)
                         PROJECT(INH:Nomor)
                         PROJECT(INH:Tanggal)
                         PROJECT(INH:Instalasi)
                         JOIN(TBis:keykodeins,INH:Instalasi)
                           PROJECT(TBis:Nama_instalasi)
                         END
                       END
                       JOIN(GBAR:KeyKodeBrg,IND:KodeBarang)
                         PROJECT(GBAR:Nama_Brg)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(271,990,7719,10031),PRE(RPT),FONT('Arial',10,COLOR:Black,),THOUS
                       HEADER,AT(281,115,7698,865)
                         STRING('DKB ONLINE'),AT(52,0,1625,219),LEFT,FONT(,,,FONT:bold)
                         STRING('Nomor :'),AT(52,177,583,219),USE(?String13),TRN,LEFT,FONT(,,,FONT:bold)
                         STRING(@s12),AT(625,177),USE(INH:Nomor)
                         STRING('Tanggal :'),AT(52,375,688,219),USE(?String13:2),TRN,LEFT,FONT(,,,FONT:bold)
                         STRING(@d06),AT(781,375),USE(INH:Tanggal),TRN
                         STRING('Instalasi :'),AT(2656,375,688,219),USE(?String13:3),TRN,LEFT,FONT(,,,FONT:bold)
                         STRING(@s30),AT(3396,375,2250,219),USE(TBis:Nama_instalasi),TRN
                         BOX,AT(0,583,7667,281),COLOR(COLOR:Black),FILL(COLOR:Silver)
                         STRING('Nama'),AT(781,635,896,167),TRN
                         STRING('Kode '),AT(63,635,542,167),TRN
                         STRING('Permintaan'),AT(2698,635,708,167),TRN
                         STRING('Dipenuhi'),AT(3854,635,896,167),TRN
                         STRING('Selisih'),AT(4854,635,896,167),TRN
                       END
detail1                DETAIL,AT(,,,208),USE(?detail1),FONT('Arial',8,,FONT:regular)
                         STRING(@n10.2),AT(3781,0),USE(vl_jumlah),RIGHT(14)
                         STRING(@s10),AT(52,10),USE(IND:KodeBarang)
                         STRING(@s40),AT(792,10,1781,177),USE(GBAR:Nama_Brg)
                         STRING(@n-15.2),AT(2635,10,802,177),USE(IND:Jumlah),RIGHT(14)
                         STRING(@n-10.2),AT(4698,10),USE(vl_selisih),RIGHT(14)
                       END
                       FOOTER,AT(260,11021,7719,219)
                         LINE,AT(21,10,7635,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING(@pPage <<<#p),AT(5250,31,698,135),PAGENO,USE(?PageCount),FONT('Arial',8,,FONT:regular)
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
  GlobalErrors.SetProcedureName('PrintCetakDBKTidakTerpenuhi')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo:nomorkwitansi',glo:nomorkwitansi)              ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AptoInDe.Open                                     ! File AptoInHe used by this procedure, so make sure it's RelationManager is open
  Relate:INDDKB.Open                                       ! File AptoInHe used by this procedure, so make sure it's RelationManager is open
  Access:AptoInHe.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintCetakDBKTidakTerpenuhi',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisReport.Init(Process:View, Relate:INDDKB, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  ThisReport.SetFilter('INH:Nomor=glo:nomorkwitansi')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  Relate:INDDKB.SetQuickScan(1,Propagate:OneMany)
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
    Relate:AptoInDe.Close
    Relate:INDDKB.Close
  END
  IF SELF.Opened
    INIMgr.Update('PrintCetakDBKTidakTerpenuhi',ProgressWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  INH:Nomor = IND:Nomor                                    ! Assign linking field value
  Access:INHDKB.Fetch(INH:PK)
  TBis:Kode_Instalasi = INH:Instalasi                      ! Assign linking field value
  Access:TBinstli.Fetch(TBis:keykodeins)
  GBAR:Kode_brg = IND:KodeBarang                           ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  INH:Nomor = IND:Nomor                                    ! Assign linking field value
  Access:INHDKB.Fetch(INH:PK)
  TBis:Kode_Instalasi = INH:Instalasi                      ! Assign linking field value
  Access:TBinstli.Fetch(TBis:keykodeins)
  GBAR:Kode_brg = IND:KodeBarang                           ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  APTI:nomordkb=INH:Nomor
  if access:aptoinhe.fetch(APTI:nodkb_aptoinhe_fk)=level:benign then
     APTD:N0_tran =APTI:N0_tran
     APTD:Kode_Brg=IND:KodeBarang
     if access:aptoinde.fetch(APTD:key_no_nota)=level:benign then
        vl_jumlah     =APTD:Jumlah
        vl_selisih    =IND:Jumlah-APTD:Jumlah
     else
        vl_jumlah     =0
        vl_selisih    =IND:Jumlah
     end
  else
     vl_jumlah     =0
     vl_selisih    =IND:Jumlah
  end
  display
  ReturnValue = PARENT.TakeRecord()
  IF vl_selisih<>0
    PRINT(RPT:detail1)
  END
  RETURN ReturnValue

PrintCetakDBKTerpenuhi PROCEDURE                           ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
vl_jumlah            REAL                                  !
vl_selisih           REAL                                  !
Process:View         VIEW(INDDKB)
                       PROJECT(IND:Jumlah)
                       PROJECT(IND:KodeBarang)
                       PROJECT(IND:Nomor)
                       JOIN(INH:PK,IND:Nomor)
                         PROJECT(INH:Nomor)
                         PROJECT(INH:Tanggal)
                         PROJECT(INH:Instalasi)
                         JOIN(TBis:keykodeins,INH:Instalasi)
                           PROJECT(TBis:Nama_instalasi)
                         END
                       END
                       JOIN(GBAR:KeyKodeBrg,IND:KodeBarang)
                         PROJECT(GBAR:Nama_Brg)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(271,990,7719,10031),PRE(RPT),FONT('Arial',10,COLOR:Black,),THOUS
                       HEADER,AT(281,115,7698,865)
                         STRING('DKB ONLINE'),AT(52,0,1625,219),LEFT,FONT(,,,FONT:bold)
                         STRING('Nomor :'),AT(52,177,583,219),USE(?String13),TRN,LEFT,FONT(,,,FONT:bold)
                         STRING(@s12),AT(625,177),USE(INH:Nomor)
                         STRING('Tanggal :'),AT(52,375,688,219),USE(?String13:2),TRN,LEFT,FONT(,,,FONT:bold)
                         STRING(@d06),AT(781,375),USE(INH:Tanggal),TRN
                         STRING('Instalasi :'),AT(2656,375,688,219),USE(?String13:3),TRN,LEFT,FONT(,,,FONT:bold)
                         STRING(@s30),AT(3396,375,2250,219),USE(TBis:Nama_instalasi),TRN
                         BOX,AT(0,583,7667,281),COLOR(COLOR:Black),FILL(COLOR:Silver)
                         STRING('Nama'),AT(781,635,896,167),TRN
                         STRING('Kode '),AT(63,635,542,167),TRN
                         STRING('Permintaan'),AT(2698,635,708,167),TRN
                         STRING('Dipenuhi'),AT(3854,635,896,167),TRN
                         STRING('Selisih'),AT(4854,635,896,167),TRN
                       END
detail1                DETAIL,AT(,,,208),USE(?detail1),FONT('Arial',8,,FONT:regular)
                         STRING(@n10.2),AT(3781,0),USE(vl_jumlah),RIGHT(14)
                         STRING(@s10),AT(52,10),USE(IND:KodeBarang)
                         STRING(@s40),AT(792,10,1781,177),USE(GBAR:Nama_Brg)
                         STRING(@n-15.2),AT(2635,10,802,177),USE(IND:Jumlah),RIGHT(14)
                         STRING(@n-10.2),AT(4698,10),USE(vl_selisih),RIGHT(14)
                       END
                       FOOTER,AT(260,11021,7719,219)
                         LINE,AT(21,10,7635,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING(@pPage <<<#p),AT(5250,31,698,135),PAGENO,USE(?PageCount),FONT('Arial',8,,FONT:regular)
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
  GlobalErrors.SetProcedureName('PrintCetakDBKTerpenuhi')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo:nomorkwitansi',glo:nomorkwitansi)              ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AptoInDe.Open                                     ! File AptoInHe used by this procedure, so make sure it's RelationManager is open
  Relate:INDDKB.Open                                       ! File AptoInHe used by this procedure, so make sure it's RelationManager is open
  Access:AptoInHe.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintCetakDBKTerpenuhi',ProgressWindow)    ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisReport.Init(Process:View, Relate:INDDKB, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  ThisReport.SetFilter('INH:Nomor=glo:nomorkwitansi')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  Relate:INDDKB.SetQuickScan(1,Propagate:OneMany)
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
    Relate:AptoInDe.Close
    Relate:INDDKB.Close
  END
  IF SELF.Opened
    INIMgr.Update('PrintCetakDBKTerpenuhi',ProgressWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  INH:Nomor = IND:Nomor                                    ! Assign linking field value
  Access:INHDKB.Fetch(INH:PK)
  TBis:Kode_Instalasi = INH:Instalasi                      ! Assign linking field value
  Access:TBinstli.Fetch(TBis:keykodeins)
  GBAR:Kode_brg = IND:KodeBarang                           ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  INH:Nomor = IND:Nomor                                    ! Assign linking field value
  Access:INHDKB.Fetch(INH:PK)
  TBis:Kode_Instalasi = INH:Instalasi                      ! Assign linking field value
  Access:TBinstli.Fetch(TBis:keykodeins)
  GBAR:Kode_brg = IND:KodeBarang                           ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  APTI:nomordkb=INH:Nomor
  if access:aptoinhe.fetch(APTI:nodkb_aptoinhe_fk)=level:benign then
     APTD:N0_tran =APTI:N0_tran
     APTD:Kode_Brg=IND:KodeBarang
     if access:aptoinde.fetch(APTD:key_no_nota)=level:benign then
        vl_jumlah     =APTD:Jumlah
        vl_selisih    =IND:Jumlah-APTD:Jumlah
     else
        vl_jumlah     =0
        vl_selisih    =IND:Jumlah
     end
  else
     vl_jumlah     =0
     vl_selisih    =IND:Jumlah
  end
  display
  ReturnValue = PARENT.TakeRecord()
  IF vl_selisih=0
    PRINT(RPT:detail1)
  END
  RETURN ReturnValue

SelectEtiket1 PROCEDURE                                    ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(Apetiket)
                       PROJECT(Ape:No)
                       PROJECT(Ape:Nama)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Ape:No                 LIKE(Ape:No)                   !List box control field - type derived from field
Ape:Nama               LIKE(Ape:Nama)                 !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Jumlah Takaran Pemakaian Obat'),AT(,,221,257),FONT('MS Sans Serif',8,,),IMM,HLP('SelectEtiket1'),SYSTEM,GRAY,RESIZE,MDI
                       ENTRY(@s30),AT(59,240,60,10),USE(Ape:Nama),REQ
                       LIST,AT(8,4,208,231),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('16R(2)|M~No~C(0)@n3@80L(2)|M~Nama~L(2)@s30@'),FROM(Queue:Browse:1)
                       PROMPT('Nama:'),AT(9,240),USE(?Ape:Nama:Prompt)
                       BUTTON('&Pilih'),AT(125,238,45,14),USE(?Select:2)
                       BUTTON('&Selesai'),AT(173,238,45,14),USE(?Close)
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
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
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
  GlobalErrors.SetProcedureName('SelectEtiket1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Ape:Nama
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('Ape:No',Ape:No)                                    ! Added by: BrowseBox(ABC)
  BIND('Ape:Nama',Ape:Nama)                                ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:Apetiket.Open                                     ! File Apetiket used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Apetiket,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,Ape:nama_etiket_key)                  ! Add the sort order for Ape:nama_etiket_key for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(?Ape:Nama,Ape:Nama,1,BRW1)      ! Initialize the browse locator using ?Ape:Nama using key: Ape:nama_etiket_key , Ape:Nama
  BRW1.AddField(Ape:No,BRW1.Q.Ape:No)                      ! Field Ape:No is a hot field or requires assignment from browse
  BRW1.AddField(Ape:Nama,BRW1.Q.Ape:Nama)                  ! Field Ape:Nama is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectEtiket1',QuickWindow)                ! Restore window settings from non-volatile store
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
    Relate:Apetiket.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectEtiket1',QuickWindow)             ! Save window data to non-volatile store
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

