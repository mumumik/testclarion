

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N069.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N006.INC'),ONCE        !Req'd for module callout resolution
                     END


CetakKeSumedang PROCEDURE                                  ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
vl_apasaja           STRING(20)                            !
vl_ket               STRING(10)                            !
Process:View         VIEW(AptoInSmdD)
                       PROJECT(APTD1:Biaya)
                       PROJECT(APTD1:Diskon)
                       PROJECT(APTD1:Harga)
                       PROJECT(APTD1:Jumlah)
                       PROJECT(APTD1:Kode_Brg)
                       PROJECT(APTD1:N0_tran)
                       JOIN(GBAR:KeyKodeBrg,APTD1:Kode_Brg)
                         PROJECT(GBAR:Nama_Brg)
                       END
                       JOIN(APTI1:key_no_tran,APTD1:N0_tran)
                         PROJECT(APTI1:Jam)
                         PROJECT(APTI1:Kd_ruang)
                         PROJECT(APTI1:Kode_Apotik)
                         PROJECT(APTI1:Status)
                         PROJECT(APTI1:Tanggal)
                         PROJECT(APTI1:Total_Biaya)
                         PROJECT(APTI1:User)
                         JOIN(TBis:keykodeins,APTI1:Kd_ruang)
                           PROJECT(TBis:Nama_instalasi)
                         END
                         JOIN(GAPO:KeyNoApotik,APTI1:Kode_Apotik)
                           PROJECT(GAPO:Nama_Apotik)
                         END
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(260,1740,2823,8990),PAPER(PAPER:USER,8250,13000),PRE(RPT),FONT('Arial',10,,),THOUS
                       HEADER,AT(219,281,2885,1448),FONT('Arial',8,,FONT:regular)
                         STRING('Pengeluaran Ke Sumedang'),AT(42,21,6000,219),LEFT,FONT(,,,FONT:bold)
                         BOX,AT(31,1010,2667,427),COLOR(COLOR:Black)
                         STRING('Kode'),AT(1792,1052,531,167),USE(?String15:2),TRN
                         STRING('Nama'),AT(115,1052,531,167),USE(?String15:3),TRN
                         STRING('Jumlah'),AT(115,1240,531,167),USE(?String15:4),TRN
                         STRING('Harga'),AT(719,1240,531,167),USE(?String15:5),TRN,RIGHT
                         STRING('Total'),AT(1969,1240,531,167),USE(?String15:6),TRN,RIGHT
                         STRING('Diskon'),AT(1260,1240,500,167),USE(?String15:7),TRN,RIGHT
                         STRING('Nomor'),AT(31,240,531,167),TRN
                         STRING(@s15),AT(521,240,1156,167),USE(APTD1:N0_tran)
                         STRING(@s10),AT(1688,240,677,167),USE(vl_ket)
                         STRING('Ruang'),AT(42,615,531,167),TRN
                         STRING(@s5),AT(510,615,427,167),USE(APTI1:Kd_ruang)
                         STRING(@s30),AT(917,615),USE(TBis:Nama_instalasi)
                         STRING('Tanggal'),AT(31,802,531,167),USE(?String14),TRN
                         STRING(@D06),AT(521,802,615,167),USE(APTI1:Tanggal)
                         STRING('Jam'),AT(1188,802,323,167),USE(?String15),TRN
                         STRING(@t04),AT(1500,802,490,167),USE(APTI1:Jam)
                         STRING('Apotik'),AT(31,417,531,167),TRN
                         STRING(@s5),AT(510,417),USE(APTI1:Kode_Apotik)
                         STRING(@s30),AT(927,417),USE(GAPO:Nama_Apotik)
                       END
break1                 BREAK(vl_apasaja)
detail1                  DETAIL,AT(,,,354),FONT('Arial',8,,FONT:regular)
                           STRING(@s40),AT(83,21,1573,167),USE(GBAR:Nama_Brg)
                           STRING(@s10),AT(1771,21,802,167),USE(APTD1:Kode_Brg)
                           STRING(@n-7),AT(63,167),USE(APTD1:Jumlah),RIGHT(14)
                           STRING(@n-12),AT(1740,167),USE(APTD1:Biaya),RIGHT(14)
                           STRING(@n-8),AT(1219,167),USE(APTD1:Diskon),DECIMAL(14)
                           STRING(@n-12),AT(490,167),USE(APTD1:Harga),RIGHT(14)
                         END
                         FOOTER,AT(0,0,,677),FONT('Arial',8,,FONT:regular)
                           LINE,AT(31,10,2646,0),USE(?Line1),COLOR(COLOR:Black)
                           STRING('Total :'),AT(115,21,531,167),USE(?String23),TRN
                           STRING(@n-12),AT(1698,21),USE(APTI1:Total_Biaya),RIGHT(14)
                           STRING('1. Ybs'),AT(94,198,531,167),USE(?String23:2),TRN
                           STRING('Inst. Farmasi,'),AT(1563,177,750,167),USE(?String23:5),TRN
                           STRING('2. Akuntansi'),AT(94,344,750,167),USE(?String23:3),TRN
                           STRING(@s10),AT(1563,469),USE(APTI1:User),TRN,CENTER
                           STRING('3. Arsip'),AT(83,490,750,167),USE(?String23:4),TRN
                           STRING('(.{24})'),AT(1490,510,927,167),USE(?String23:6),TRN
                         END
                       END
                       FOOTER,AT(229,10844,7698,219)
                         STRING(@pPage <<<#p),AT(5250,31,698,135),PAGENO,USE(?PageCount),FONT('Arial',8,COLOR:Black,FONT:regular)
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
  GlobalErrors.SetProcedureName('CetakKeSumedang')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo:sumedang',glo:sumedang)                        ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AptoInSmdD.SetOpenRelated()
  Relate:AptoInSmdD.Open                                   ! File AptoInSmdD used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('CetakKeSumedang',ProgressWindow)           ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisReport.Init(Process:View, Relate:AptoInSmdD, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  ThisReport.SetFilter('APTD1:N0_tran=glo:sumedang')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report)
  ?Progress:UserString{Prop:Text}=''
  Relate:AptoInSmdD.SetQuickScan(1,Propagate:OneMany)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AptoInSmdD.Close
  END
  IF SELF.Opened
    INIMgr.Update('CetakKeSumedang',ProgressWindow)        ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = APTD1:Kode_Brg                           ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  APTI1:N0_tran = APTD1:N0_tran                            ! Assign linking field value
  Access:AptoInSmdH.Fetch(APTI1:key_no_tran)
  TBis:Kode_Instalasi = APTI1:Kd_ruang                     ! Assign linking field value
  Access:TBinstli.Fetch(TBis:keykodeins)
  GAPO:Kode_Apotik = APTI1:Kode_Apotik                     ! Assign linking field value
  Access:GApotik.Fetch(GAPO:KeyNoApotik)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  GBAR:Kode_brg = APTD1:Kode_Brg                           ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  APTI1:N0_tran = APTD1:N0_tran                            ! Assign linking field value
  Access:AptoInSmdH.Fetch(APTI1:key_no_tran)
  TBis:Kode_Instalasi = APTI1:Kd_ruang                     ! Assign linking field value
  Access:TBinstli.Fetch(TBis:keykodeins)
  GAPO:Kode_Apotik = APTI1:Kode_Apotik                     ! Assign linking field value
  Access:GApotik.Fetch(GAPO:KeyNoApotik)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  if APTI1:Status=1 then
     vl_ket='Retur'
  end
  display
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail1)
  RETURN ReturnValue

BrowseKeluarKeSumedang PROCEDURE                           ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(AptoInSmdH)
                       PROJECT(APTI1:N0_tran)
                       PROJECT(APTI1:Kode_Apotik)
                       PROJECT(APTI1:Kd_ruang)
                       PROJECT(APTI1:Tanggal)
                       PROJECT(APTI1:Jam)
                       PROJECT(APTI1:Total_Biaya)
                       PROJECT(APTI1:User)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APTI1:N0_tran          LIKE(APTI1:N0_tran)            !List box control field - type derived from field
APTI1:Kode_Apotik      LIKE(APTI1:Kode_Apotik)        !List box control field - type derived from field
APTI1:Kd_ruang         LIKE(APTI1:Kd_ruang)           !List box control field - type derived from field
APTI1:Tanggal          LIKE(APTI1:Tanggal)            !List box control field - type derived from field
APTI1:Jam              LIKE(APTI1:Jam)                !List box control field - type derived from field
APTI1:Total_Biaya      LIKE(APTI1:Total_Biaya)        !List box control field - type derived from field
APTI1:User             LIKE(APTI1:User)               !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(AptoInSmdD)
                       PROJECT(APTD1:Kode_Brg)
                       PROJECT(APTD1:Jumlah)
                       PROJECT(APTD1:Diskon)
                       PROJECT(APTD1:Pct)
                       PROJECT(APTD1:Biaya)
                       PROJECT(APTD1:N0_tran)
                       JOIN(GBAR:KeyKodeBrg,APTD1:Kode_Brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
APTD1:Kode_Brg         LIKE(APTD1:Kode_Brg)           !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
APTD1:Jumlah           LIKE(APTD1:Jumlah)             !List box control field - type derived from field
APTD1:Diskon           LIKE(APTD1:Diskon)             !List box control field - type derived from field
APTD1:Pct              LIKE(APTD1:Pct)                !List box control field - type derived from field
APTD1:Biaya            LIKE(APTD1:Biaya)              !List box control field - type derived from field
APTD1:N0_tran          LIKE(APTD1:N0_tran)            !Primary key field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Transaksi Ke Sumedang'),AT(,,358,260),FONT('MS Sans Serif',8,,),CENTER,IMM,HLP('BrowseKeluarKeSumedang'),SYSTEM,GRAY,RESIZE,MDI
                       LIST,AT(8,20,342,103),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('64L(2)|M~Nomor~@s15@48L(2)|M~Kode Apotik~@s5@36L(2)|M~Kd ruang~@s5@55R(2)|M~Tang' &|
   'gal~C(0)@D08@43R(2)|M~Jam~C(0)@t04@68R(12)|M~Total Biaya~C(0)@n-15.2@20L(2)|M~Us' &|
   'er~@s4@'),FROM(Queue:Browse:1)
                       BUTTON('&Tambah (F4)'),AT(207,127,45,14),USE(?Insert:2),KEY(F4Key)
                       BUTTON('&Ubah'),AT(256,127,45,14),USE(?Change:2),DISABLE,HIDE
                       BUTTON('&Hapus'),AT(305,127,45,14),USE(?Delete:2),DISABLE,HIDE
                       LIST,AT(8,147,342,94),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('49L|M~Kode Brg~@s10@160L|M~Nama Obat~@s40@40D|M~Jumlah~L@n10.2@60R|M~Diskon~L@n1' &|
   '5.2@60R|M~Pct~L@n15.2@40R|M~Biaya~L@n10.2@'),FROM(Queue:Browse)
                       BUTTON('&Print'),AT(129,127,45,14),USE(?Button5),LEFT,ICON(ICON:Print)
                       SHEET,AT(4,4,350,140),USE(?CurrentTab)
                         TAB('&Nomor (F2)'),USE(?Tab:2),KEY(F2Key)
                           PROMPT('Nomor:'),AT(7,128),USE(?APTI1:N0_tran:Prompt)
                           ENTRY(@s15),AT(57,128,60,10),USE(APTI1:N0_tran),MSG('nomor transaksi'),TIP('nomor transaksi')
                         END
                       END
                       BUTTON('&Selesai'),AT(207,245,45,14),USE(?Close)
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
ResetFromAsk           PROCEDURE(*BYTE Request,*BYTE Response),DERIVED ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW5                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
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
  GlobalErrors.SetProcedureName('BrowseKeluarKeSumedang')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:AptoInSmdD.SetOpenRelated()
  Relate:AptoInSmdD.Open                                   ! File TBinstli used by this procedure, so make sure it's RelationManager is open
  Relate:GApotik.SetOpenRelated()
  Relate:GApotik.Open                                      ! File TBinstli used by this procedure, so make sure it's RelationManager is open
  Access:TBinstli.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:AptoInSmdH,SELF) ! Initialize the browse manager
  BRW5.Init(?List,Queue:Browse.ViewPosition,BRW5::View:Browse,Queue:Browse,Relate:AptoInSmdD,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,APTI1:key_apotik)                     ! Add the sort order for APTI1:key_apotik for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,APTI1:Kode_Apotik,1,BRW1)      ! Initialize the browse locator using  using key: APTI1:key_apotik , APTI1:Kode_Apotik
  BRW1.AddSortOrder(,APTI1:key_tujuan)                     ! Add the sort order for APTI1:key_tujuan for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,APTI1:Kd_ruang,1,BRW1)         ! Initialize the browse locator using  using key: APTI1:key_tujuan , APTI1:Kd_ruang
  BRW1.AddSortOrder(,APTI1:key_tanggal)                    ! Add the sort order for APTI1:key_tanggal for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,APTI1:Tanggal,1,BRW1)          ! Initialize the browse locator using  using key: APTI1:key_tanggal , APTI1:Tanggal
  BRW1.AddSortOrder(,APTI1:key_no_tran)                    ! Add the sort order for APTI1:key_no_tran for sort order 4
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort0:Locator.Init(?APTI1:N0_tran,APTI1:N0_tran,1,BRW1) ! Initialize the browse locator using ?APTI1:N0_tran using key: APTI1:key_no_tran , APTI1:N0_tran
  BRW1.AddField(APTI1:N0_tran,BRW1.Q.APTI1:N0_tran)        ! Field APTI1:N0_tran is a hot field or requires assignment from browse
  BRW1.AddField(APTI1:Kode_Apotik,BRW1.Q.APTI1:Kode_Apotik) ! Field APTI1:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(APTI1:Kd_ruang,BRW1.Q.APTI1:Kd_ruang)      ! Field APTI1:Kd_ruang is a hot field or requires assignment from browse
  BRW1.AddField(APTI1:Tanggal,BRW1.Q.APTI1:Tanggal)        ! Field APTI1:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(APTI1:Jam,BRW1.Q.APTI1:Jam)                ! Field APTI1:Jam is a hot field or requires assignment from browse
  BRW1.AddField(APTI1:Total_Biaya,BRW1.Q.APTI1:Total_Biaya) ! Field APTI1:Total_Biaya is a hot field or requires assignment from browse
  BRW1.AddField(APTI1:User,BRW1.Q.APTI1:User)              ! Field APTI1:User is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse
  BRW5.AddSortOrder(,APTD1:key_no_nota)                    ! Add the sort order for APTD1:key_no_nota for sort order 1
  BRW5.AddRange(APTD1:N0_tran,Relate:AptoInSmdD,Relate:AptoInSmdH) ! Add file relationship range limit for sort order 1
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort0:Locator.Init(,APTD1:Kode_Brg,1,BRW5)         ! Initialize the browse locator using  using key: APTD1:key_no_nota , APTD1:Kode_Brg
  BRW5.AddField(APTD1:Kode_Brg,BRW5.Q.APTD1:Kode_Brg)      ! Field APTD1:Kode_Brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Nama_Brg,BRW5.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW5.AddField(APTD1:Jumlah,BRW5.Q.APTD1:Jumlah)          ! Field APTD1:Jumlah is a hot field or requires assignment from browse
  BRW5.AddField(APTD1:Diskon,BRW5.Q.APTD1:Diskon)          ! Field APTD1:Diskon is a hot field or requires assignment from browse
  BRW5.AddField(APTD1:Pct,BRW5.Q.APTD1:Pct)                ! Field APTD1:Pct is a hot field or requires assignment from browse
  BRW5.AddField(APTD1:Biaya,BRW5.Q.APTD1:Biaya)            ! Field APTD1:Biaya is a hot field or requires assignment from browse
  BRW5.AddField(APTD1:N0_tran,BRW5.Q.APTD1:N0_tran)        ! Field APTD1:N0_tran is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Kode_brg,BRW5.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseKeluarKeSumedang',QuickWindow)       ! Restore window settings from non-volatile store
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
    Relate:AptoInSmdD.Close
    Relate:GApotik.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseKeluarKeSumedang',QuickWindow)    ! Save window data to non-volatile store
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
    UpdateAptoInSmdH
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
    OF ?Button5
      glo:sumedang=APTI1:N0_tran
      display
      if APTI1:Total_Biaya>0 then
      CetakKeSumedang()
      else
      CetakReturDrSumedang()
      end
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


BRW1.ResetFromAsk PROCEDURE(*BYTE Request,*BYTE Response)

  CODE
  PARENT.ResetFromAsk(Request,Response)
  if request=1 and response=1 then
     glo:sumedang=APTI1:N0_tran
     if APTI1:Total_Biaya>0 then
  
  CetakKeSumedang()
  else
  CetakReturDrSumedang()
  end
  end


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSE
    RETURN SELF.SetSort(4,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW5.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

CetakReturDrSumedang PROCEDURE                             ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
vl_apasaja           STRING(20)                            !
vl_ket               STRING(10)                            !
Process:View         VIEW(AptoInSmdD)
                       PROJECT(APTD1:Biaya)
                       PROJECT(APTD1:Diskon)
                       PROJECT(APTD1:Harga)
                       PROJECT(APTD1:Jumlah)
                       PROJECT(APTD1:Kode_Brg)
                       PROJECT(APTD1:N0_tran)
                       JOIN(GBAR:KeyKodeBrg,APTD1:Kode_Brg)
                         PROJECT(GBAR:Nama_Brg)
                       END
                       JOIN(APTI1:key_no_tran,APTD1:N0_tran)
                         PROJECT(APTI1:Jam)
                         PROJECT(APTI1:Kd_ruang)
                         PROJECT(APTI1:Kode_Apotik)
                         PROJECT(APTI1:Status)
                         PROJECT(APTI1:Tanggal)
                         PROJECT(APTI1:Total_Biaya)
                         PROJECT(APTI1:User)
                         JOIN(TBis:keykodeins,APTI1:Kd_ruang)
                           PROJECT(TBis:Nama_instalasi)
                         END
                         JOIN(GAPO:KeyNoApotik,APTI1:Kode_Apotik)
                           PROJECT(GAPO:Nama_Apotik)
                         END
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(260,1740,2823,8990),PAPER(PAPER:USER,8250,13000),PRE(RPT),FONT('Arial',10,COLOR:Black,),THOUS
                       HEADER,AT(219,281,2885,1448),FONT('Arial',8,,FONT:regular)
                         STRING('RETUR dari Sumedang'),AT(42,21,6000,219),LEFT,FONT(,,,FONT:bold)
                         BOX,AT(31,1010,2667,427),COLOR(COLOR:Black)
                         STRING('Kode'),AT(1792,1052,531,167),USE(?String15:2),TRN
                         STRING('Nama'),AT(115,1052,531,167),USE(?String15:3),TRN
                         STRING('Jumlah'),AT(115,1240,531,167),USE(?String15:4),TRN
                         STRING('Harga'),AT(719,1240,531,167),USE(?String15:5),TRN,RIGHT
                         STRING('Total'),AT(1969,1240,531,167),USE(?String15:6),TRN,RIGHT
                         STRING('Diskon'),AT(1260,1240,500,167),USE(?String15:7),TRN,RIGHT
                         STRING('Nomor'),AT(31,240,531,167),TRN
                         STRING(@s15),AT(521,240,1156,167),USE(APTD1:N0_tran)
                         STRING(@s10),AT(1688,240,677,167),USE(vl_ket)
                         STRING('Ruang'),AT(42,615,531,167),TRN
                         STRING(@s5),AT(510,615,427,167),USE(APTI1:Kd_ruang)
                         STRING(@s30),AT(917,615),USE(TBis:Nama_instalasi)
                         STRING('Tanggal'),AT(31,802,531,167),USE(?String14),TRN
                         STRING(@D06),AT(521,802,615,167),USE(APTI1:Tanggal)
                         STRING('Jam'),AT(1188,802,323,167),USE(?String15),TRN
                         STRING(@t04),AT(1500,802,490,167),USE(APTI1:Jam)
                         STRING('Apotik'),AT(31,417,531,167),TRN
                         STRING(@s5),AT(510,417),USE(APTI1:Kode_Apotik)
                         STRING(@s30),AT(927,417),USE(GAPO:Nama_Apotik)
                       END
break1                 BREAK(vl_apasaja)
detail1                  DETAIL,AT(,,,354),FONT('Arial',8,,FONT:regular)
                           STRING(@s40),AT(83,21,1573,167),USE(GBAR:Nama_Brg)
                           STRING(@s10),AT(1771,21,802,167),USE(APTD1:Kode_Brg)
                           STRING(@n-7),AT(63,167),USE(APTD1:Jumlah),RIGHT(14)
                           STRING(@n-12),AT(1740,167),USE(APTD1:Biaya),RIGHT(14)
                           STRING(@n-8),AT(1219,167),USE(APTD1:Diskon),DECIMAL(14)
                           STRING(@n-12),AT(490,167),USE(APTD1:Harga),RIGHT(14)
                         END
                         FOOTER,AT(0,0,,677),FONT('Arial',8,,FONT:regular)
                           LINE,AT(31,10,2646,0),USE(?Line1),COLOR(COLOR:Black)
                           STRING('Total :'),AT(115,21,531,167),USE(?String23),TRN
                           STRING(@n-12),AT(1698,21),USE(APTI1:Total_Biaya),RIGHT(14)
                           STRING('1. Ybs'),AT(94,198,531,167),USE(?String23:2),TRN
                           STRING('Inst. Farmasi,'),AT(1563,177,750,167),USE(?String23:5),TRN
                           STRING('2. Akuntansi'),AT(94,344,750,167),USE(?String23:3),TRN
                           STRING(@s10),AT(1563,469),USE(APTI1:User),TRN,CENTER
                           STRING('3. Arsip'),AT(83,490,750,167),USE(?String23:4),TRN
                           STRING('(.{24})'),AT(1490,510,927,167),USE(?String23:6),TRN
                         END
                       END
                       FOOTER,AT(229,10844,7698,219)
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
  GlobalErrors.SetProcedureName('CetakReturDrSumedang')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo:sumedang',glo:sumedang)                        ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AptoInSmdD.SetOpenRelated()
  Relate:AptoInSmdD.Open                                   ! File AptoInSmdD used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('CetakReturDrSumedang',ProgressWindow)      ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisReport.Init(Process:View, Relate:AptoInSmdD, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  ThisReport.SetFilter('APTD1:N0_tran=glo:sumedang')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report)
  ?Progress:UserString{Prop:Text}=''
  Relate:AptoInSmdD.SetQuickScan(1,Propagate:OneMany)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AptoInSmdD.Close
  END
  IF SELF.Opened
    INIMgr.Update('CetakReturDrSumedang',ProgressWindow)   ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = APTD1:Kode_Brg                           ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  APTI1:N0_tran = APTD1:N0_tran                            ! Assign linking field value
  Access:AptoInSmdH.Fetch(APTI1:key_no_tran)
  TBis:Kode_Instalasi = APTI1:Kd_ruang                     ! Assign linking field value
  Access:TBinstli.Fetch(TBis:keykodeins)
  GAPO:Kode_Apotik = APTI1:Kode_Apotik                     ! Assign linking field value
  Access:GApotik.Fetch(GAPO:KeyNoApotik)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  GBAR:Kode_brg = APTD1:Kode_Brg                           ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  APTI1:N0_tran = APTD1:N0_tran                            ! Assign linking field value
  Access:AptoInSmdH.Fetch(APTI1:key_no_tran)
  TBis:Kode_Instalasi = APTI1:Kd_ruang                     ! Assign linking field value
  Access:TBinstli.Fetch(TBis:keykodeins)
  GAPO:Kode_Apotik = APTI1:Kode_Apotik                     ! Assign linking field value
  Access:GApotik.Fetch(GAPO:KeyNoApotik)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  if APTI1:Status=1 then
     vl_ket='Retur'
  end
  display
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail1)
  RETURN ReturnValue

UpdateAptoInSmdD PROCEDURE                                 ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
vl_sudah             BYTE(0)                               !
vl_status            BYTE                                  !
History::APTD1:Record LIKE(APTD1:RECORD),THREAD
QuickWindow          WINDOW('Update the AptoInSmdD File'),AT(,,252,150),FONT('MS Sans Serif',8,,),CENTER,IMM,HLP('UpdateAptoInSmdD'),SYSTEM,GRAY,RESIZE,MDI
                       ENTRY(@s15),AT(70,12,64,10),USE(APTD1:N0_tran),DISABLE,MSG('nomor transaksi'),TIP('nomor transaksi')
                       ENTRY(@s10),AT(70,26,64,10),USE(APTD1:Kode_Brg),READONLY
                       BUTTON('F2'),AT(136,25,12,12),USE(?CallLookup),KEY(F2Key)
                       ENTRY(@s40),AT(70,40,164,10),USE(GBAR:Nama_Brg),DISABLE,MSG('Nama Barang'),TIP('Nama Barang')
                       ENTRY(@n15.2),AT(70,55,64,10),USE(APTD1:Jumlah),RIGHT(2)
                       ENTRY(@n-15.2),AT(70,69,64,10),USE(APTD1:Harga),DISABLE,DECIMAL(14)
                       ENTRY(@n-15.2),AT(70,83,33,10),USE(APTD1:Diskon),RIGHT(2)
                       PROMPT('%'),AT(106,83),USE(?APTD1:Pct:Prompt:3)
                       ENTRY(@n-15.2),AT(70,97,33,10),USE(APTD1:Pct),RIGHT(2)
                       PROMPT('%'),AT(106,97),USE(?APTD1:Pct:Prompt:2)
                       ENTRY(@n-15.2),AT(70,111,64,10),USE(APTD1:Biaya),DISABLE,RIGHT(2)
                       BUTTON('&OK'),AT(77,129,45,14),USE(?OK),DEFAULT
                       BUTTON('&Batal'),AT(126,129,45,14),USE(?Cancel)
                       PROMPT('Nomor:'),AT(17,12),USE(?APTD1:N0_tran:Prompt)
                       PROMPT('Kode Brg:'),AT(17,26),USE(?APTD1:Kode_Brg:Prompt)
                       PROMPT('Harga:'),AT(17,69),USE(?APTD1:Harga:Prompt)
                       PROMPT('Jumlah:'),AT(17,55),USE(?APTD1:Jumlah:Prompt)
                       PROMPT('Diskon:'),AT(17,83),USE(?APTD1:Diskon:Prompt)
                       PROMPT('Keuntungan:'),AT(17,97),USE(?APTD1:Pct:Prompt)
                       PROMPT('Biaya:'),AT(17,111),USE(?APTD1:Biaya:Prompt)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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

view::sbbm view(filesql)
             project(FIL:FString1,FIL:FReal1)
           end
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

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Tambah Data'
  OF ChangeRecord
    ActionMessage = 'Ubah Data'
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateAptoInSmdD')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APTD1:N0_tran
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APTD1:Record,History::APTD1:Record)
  SELF.AddHistoryField(?APTD1:N0_tran,1)
  SELF.AddHistoryField(?APTD1:Kode_Brg,2)
  SELF.AddHistoryField(?APTD1:Jumlah,3)
  SELF.AddHistoryField(?APTD1:Harga,7)
  SELF.AddHistoryField(?APTD1:Diskon,4)
  SELF.AddHistoryField(?APTD1:Pct,5)
  SELF.AddHistoryField(?APTD1:Biaya,6)
  SELF.AddUpdateFile(Access:AptoInSmdD)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:AptoInSmdD.SetOpenRelated()
  Relate:AptoInSmdD.Open                                   ! File FileSql used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql.Open                                      ! File FileSql used by this procedure, so make sure it's RelationManager is open
  Relate:GDSBBM.Open                                       ! File FileSql used by this procedure, so make sure it's RelationManager is open
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GHSBBM.UseFile                                    ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:AptoInSmdD
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
  vl_status=glo:statusSMD
  display
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateAptoInSmdD',QuickWindow)             ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AptoInSmdD.Close
    Relate:FileSql.Close
    Relate:GDSBBM.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateAptoInSmdD',QuickWindow)          ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = APTD1:Kode_Brg                           ! Assign linking field value
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
    cari_brg_lokal4
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
    OF ?APTD1:Kode_Brg
      IF APTD1:Kode_Brg OR ?APTD1:Kode_Brg{Prop:Req}
        GBAR:Kode_brg = APTD1:Kode_Brg
        IF Access:GBarang.TryFetch(GBAR:KeyKodeBrg)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            APTD1:Kode_Brg = GBAR:Kode_brg
          ELSE
            SELECT(?APTD1:Kode_Brg)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      GBAR:Kode_brg = APTD1:Kode_Brg
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        APTD1:Kode_Brg = GBAR:Kode_brg
      END
      ThisWindow.Reset(1)
      if vl_sudah=0 then
         APTD1:Jumlah    =0
         APTD1:Diskon    =0
         APTD1:Pct       =0
         APTD1:Biaya     =0
         display
         GSTO:Kode_Apotik=GL_entryapotik
         GSTO:Kode_Barang=APTD1:Kode_Brg
         if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
            open(view::sbbm)
            !message('select a.KodeBarang,a.Discount from dba.gdsbbm a,dba.ghsbbm b where a.kodebarang='''&APTD1:Kode_Brg&''' and a.nosbbm=b.nosbbm order by b.tglsbbm desc')
            view::sbbm{prop:sql}='select a.KodeBarang,a.Discount from dba.gdsbbm a,dba.ghsbbm b where a.kodebarang='''&APTD1:Kode_Brg&''' and a.nosbbm=b.nosbbm order by b.tglsbbm desc'
            next(view::sbbm)
            !message(FIL:FString1,FIL:FReal1)
            APTD1:Harga   =GSTO:Harga_Dasar
            APTD1:Pct     =5
            APTD1:Diskon  =FIL:FReal1
            APTD1:Biaya   = round((APTD1:Jumlah*GSTO:Harga_Dasar-(APTD1:Jumlah*GSTO:Harga_Dasar)*(APTD1:Diskon/100))*1.1*(1+APTD1:Pct/100),1)
            display
         else
            message('barang tidak ada !!!')
            select(?calllookup)
         end
      end
    OF ?APTD1:Jumlah
      if vl_sudah=0
         GSTO:Kode_Apotik=GL_entryapotik
         GSTO:Kode_Barang=APTD1:Kode_Brg
         if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
            if GSTO:Saldo<APTD1:Jumlah and vl_status=0 then
               message('Stok Kurang !!!')
               select(?APTD1:Jumlah)
            else
               APTD1:Biaya   = round((APTD1:Jumlah*GSTO:Harga_Dasar-(APTD1:Jumlah*GSTO:Harga_Dasar)*(APTD1:Diskon/100))*1.1*(1+APTD1:Pct/100),1)
               !APTD1:Biaya   = round(APTD1:Jumlah*(GSTO:Harga_Dasar-APTD1:Diskon)*1.1*(1+APTD1:Pct/100),1)
               display
            end
         end
      end
    OF ?APTD1:Diskon
      if vl_sudah=0
      !APTD1:Biaya   = round(APTD1:Jumlah*(GSTO:Harga_Dasar-APTD1:Diskon)*1.1*(1+APTD1:Pct/100),1)
      APTD1:Biaya   = round((APTD1:Jumlah*GSTO:Harga_Dasar-(APTD1:Jumlah*GSTO:Harga_Dasar)*(APTD1:Diskon/100))*1.1*(1+APTD1:Pct/100),1)
      display
      end
    OF ?APTD1:Pct
      if vl_sudah=0
      !APTD1:Biaya   = round(APTD1:Jumlah*(GSTO:Harga_Dasar-APTD1:Diskon)*1.1*(1+APTD1:Pct/100),1)
      APTD1:Biaya   = round((APTD1:Jumlah*GSTO:Harga_Dasar-(APTD1:Jumlah*GSTO:Harga_Dasar)*(APTD1:Diskon/100))*1.1*(1+APTD1:Pct/100),1)
      display
      end
    OF ?OK
      ThisWindow.Update
      vl_sudah=1
      display
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

UpdateAptoInSmdH PROCEDURE                                 ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
vl_nomor             STRING(15)                            !
BRW2::View:Browse    VIEW(AptoInSmdD)
                       PROJECT(APTD1:Kode_Brg)
                       PROJECT(APTD1:Jumlah)
                       PROJECT(APTD1:Diskon)
                       PROJECT(APTD1:Pct)
                       PROJECT(APTD1:Biaya)
                       PROJECT(APTD1:N0_tran)
                       JOIN(GBAR:KeyKodeBrg,APTD1:Kode_Brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?Browse:2
APTD1:Kode_Brg         LIKE(APTD1:Kode_Brg)           !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
APTD1:Jumlah           LIKE(APTD1:Jumlah)             !List box control field - type derived from field
APTD1:Diskon           LIKE(APTD1:Diskon)             !List box control field - type derived from field
APTD1:Pct              LIKE(APTD1:Pct)                !List box control field - type derived from field
APTD1:Biaya            LIKE(APTD1:Biaya)              !List box control field - type derived from field
APTD1:N0_tran          LIKE(APTD1:N0_tran)            !Primary key field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::APTI1:Record LIKE(APTI1:RECORD),THREAD
QuickWindow          WINDOW('Update the AptoInSmdH File'),AT(,,376,236),FONT('MS Sans Serif',8,,),CENTER,IMM,HLP('UpdateAptoInSmdH'),SYSTEM,GRAY,RESIZE,MDI
                       PROMPT('Nomor:'),AT(14,8),USE(?APTI1:N0_tran:Prompt)
                       ENTRY(@s15),AT(67,8,90,10),USE(APTI1:N0_tran),DISABLE,MSG('nomor transaksi'),TIP('nomor transaksi')
                       PROMPT('Kode Apotik:'),AT(14,21),USE(?APTI1:Kode_Apotik:Prompt)
                       ENTRY(@s5),AT(67,21,40,10),USE(APTI1:Kode_Apotik),DISABLE,MSG('Kode Apotik'),TIP('Kode Apotik')
                       PROMPT('Kode Ruang:'),AT(14,34),USE(?APTI1:Kd_ruang:Prompt)
                       ENTRY(@s5),AT(67,34,40,10),USE(APTI1:Kd_ruang),DISABLE,MSG('Kode ruang yang dituju'),TIP('Kode ruang yang dituju')
                       PROMPT('Tanggal:'),AT(14,47),USE(?APTI1:Tanggal:Prompt)
                       ENTRY(@D06),AT(67,47,60,10),USE(APTI1:Tanggal),DISABLE
                       PROMPT('Jam:'),AT(132,47),USE(?APTI1:Jam:Prompt)
                       ENTRY(@t04),AT(151,47,60,10),USE(APTI1:Jam),DISABLE
                       OPTION('Status'),AT(67,58,93,19),USE(APTI1:Status),BOXED
                         RADIO('Retur'),AT(122,66),USE(?APTI1:Status:Radio2),VALUE('1')
                         RADIO('Keluar'),AT(77,66),USE(?APTI1:Status:Radio1),VALUE('0')
                       END
                       PROMPT('Total Biaya:'),AT(14,80),USE(?APTI1:Total_Biaya:Prompt)
                       ENTRY(@n-15.2),AT(67,80,90,10),USE(APTI1:Total_Biaya),DISABLE,RIGHT(14)
                       PROMPT('User:'),AT(14,93),USE(?APTI1:User:Prompt)
                       ENTRY(@s4),AT(67,93,90,10),USE(APTI1:User),MSG('Nama Yang menginput data ini'),TIP('Nama Yang menginput data ini'),UPR
                       LIST,AT(2,108,371,108),USE(?Browse:2),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('44L(2)|M~Kode Brg~@s10@106L(2)|M~Nama Obat~@s40@39R(2)|M~Jumlah~C(0)@n-10.2@57R(' &|
   '2)|M~Diskon~C(0)@n-15.2@56R(2)|M~Pct~C(0)@n-15.2@44R(2)|M~Biaya~C(0)@n-15.2@'),FROM(Queue:Browse:2)
                       BUTTON('&OK'),AT(241,220,45,14),USE(?OK),DEFAULT
                       BUTTON('&Batal'),AT(289,220,45,14),USE(?Cancel)
                       BUTTON('&Tambah '),AT(66,220,54,14),USE(?Insert:3),LEFT,KEY(PlusKey),ICON('INSERT.ICO')
                       BUTTON('&Ubah'),AT(123,220,54,14),USE(?Change:3)
                       BUTTON('&Hapus'),AT(180,220,54,14),USE(?Delete:3)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
Run                    PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW2                 CLASS(BrowseClass)                    ! Browse using ?Browse:2
Q                      &Queue:Browse:2                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetFromView          PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW2::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
!Proses Penomoran Otomatis Transaksi
Isi_Nomor Routine
   vl_nomor=''
   display
   loop
      logout(1,nomor_batal)
      if errorcode()=56 then
         cycle.
      !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
      NOM:No_Urut=21
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
         NOMU:Urut =21
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
        !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
        NOM1:No_urut=21
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
           NOMU:Urut =21
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
      !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
      nomor_batal{prop:sql}='delete dba.nomor_batal where No=21'
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 1=Transaksi Apotik ke pasien Rawat Inap
         NOM1:No_urut=21
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
   APTI1:N0_tran=vl_nomor
   display

Batal_Nomor Routine
   !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
   NOM:No_Urut =21
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=APTI1:N0_tran
   NOM:Keterangan='Trans Pendft. R. Jalan'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
   NOMU:Urut =21
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOMU:Nomor=APTI1:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   delete(nomoruse)

hapus_nomor_use routine
   !Silahkan Diganti
   NOMU:Urut    =21
   NOMU:Nomor   =APTI1:N0_tran
   if access:nomoruse.fetch(NOMU:PrimaryKey)=level:benign then
      delete(nomoruse)
   end

hapus_detil routine
   aptoinsmdd{prop:sql}='delete dba.aptoinsmdd where n0_tran='''&APTI1:N0_tran&''''

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Tambah Data'
  OF ChangeRecord
    GlobalErrors.Throw(Msg:UpdateIllegal)
    RETURN
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateAptoInSmdH')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APTI1:N0_tran:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APTI1:Record,History::APTI1:Record)
  SELF.AddHistoryField(?APTI1:N0_tran,1)
  SELF.AddHistoryField(?APTI1:Kode_Apotik,2)
  SELF.AddHistoryField(?APTI1:Kd_ruang,3)
  SELF.AddHistoryField(?APTI1:Tanggal,4)
  SELF.AddHistoryField(?APTI1:Jam,5)
  SELF.AddHistoryField(?APTI1:Status,8)
  SELF.AddHistoryField(?APTI1:Total_Biaya,6)
  SELF.AddHistoryField(?APTI1:User,7)
  SELF.AddUpdateFile(Access:AptoInSmdH)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:AptoInSmdD.SetOpenRelated()
  Relate:AptoInSmdD.Open                                   ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_Batal.Open                                  ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Access:AptoInSmdH.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:AptoInSmdH
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:None                        ! Changes not allowed
    SELF.CancelAction = Cancel:Cancel                      ! No confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  BRW2.Init(?Browse:2,Queue:Browse:2.ViewPosition,BRW2::View:Browse,Queue:Browse:2,Relate:AptoInSmdD,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  if self.request=1 then
     do isi_nomor
  end
  ?Browse:2{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW2.Q &= Queue:Browse:2
  BRW2.AddSortOrder(,APTD1:key_no_nota)                    ! Add the sort order for APTD1:key_no_nota for sort order 1
  BRW2.AddRange(APTD1:N0_tran,Relate:AptoInSmdD,Relate:AptoInSmdH) ! Add file relationship range limit for sort order 1
  BRW2.AddLocator(BRW2::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW2::Sort0:Locator.Init(,APTD1:Kode_Brg,1,BRW2)         ! Initialize the browse locator using  using key: APTD1:key_no_nota , APTD1:Kode_Brg
  BRW2.AddField(APTD1:Kode_Brg,BRW2.Q.APTD1:Kode_Brg)      ! Field APTD1:Kode_Brg is a hot field or requires assignment from browse
  BRW2.AddField(GBAR:Nama_Brg,BRW2.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW2.AddField(APTD1:Jumlah,BRW2.Q.APTD1:Jumlah)          ! Field APTD1:Jumlah is a hot field or requires assignment from browse
  BRW2.AddField(APTD1:Diskon,BRW2.Q.APTD1:Diskon)          ! Field APTD1:Diskon is a hot field or requires assignment from browse
  BRW2.AddField(APTD1:Pct,BRW2.Q.APTD1:Pct)                ! Field APTD1:Pct is a hot field or requires assignment from browse
  BRW2.AddField(APTD1:Biaya,BRW2.Q.APTD1:Biaya)            ! Field APTD1:Biaya is a hot field or requires assignment from browse
  BRW2.AddField(APTD1:N0_tran,BRW2.Q.APTD1:N0_tran)        ! Field APTD1:N0_tran is a hot field or requires assignment from browse
  BRW2.AddField(GBAR:Kode_brg,BRW2.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateAptoInSmdH',QuickWindow)             ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW2.AskProcedure = 1
  SELF.AddItem(ToolbarForm)
  BRW2.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  if self.response=1 then
     if self.request=3 then
        do batal_nomor
     elsif self.request=1 then
        do hapus_nomor_use
        
        display
     end
  else
     if self.request=1 then
        do batal_nomor
        do hapus_detil
     end
  end
  
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AptoInSmdD.Close
    Relate:NomorUse.Close
    Relate:Nomor_Batal.Close
    Relate:Nomor_SKR.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateAptoInSmdH',QuickWindow)          ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
    APTI1:Kode_Apotik = 'FM08'
    APTI1:Tanggal = today()
    APTI1:Jam = clock()
    APTI1:User = vg_user
    APTI1:Kd_ruang = 'SMD'
  PARENT.PrimeFields


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
    UpdateAptoInSmdD
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
    OF ?OK
      if APTI1:Status=1 then
         APTI1:Total_Biaya=APTI1:Total_Biaya*-1
         display
      end
    OF ?Insert:3
      glo:statusSMD=APTI1:Status
      display
    OF ?Change:3
      glo:statusSMD=APTI1:Status
      display
    OF ?Delete:3
      glo:statusSMD=APTI1:Status
      display
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
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


BRW2.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW2.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END


BRW2.ResetFromView PROCEDURE

APTI1:Total_Biaya:Sum REAL                                 ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:AptoInSmdD.SetQuickScan(1)
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
    APTI1:Total_Biaya:Sum += APTD1:Biaya
  END
  APTI1:Total_Biaya = APTI1:Total_Biaya:Sum
  PARENT.ResetFromView
  Relate:AptoInSmdD.SetQuickScan(0)
  SETCURSOR()


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

