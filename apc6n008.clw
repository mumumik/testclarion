

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N008.INC'),ONCE        !Local module procedure declarations
                     END


SelectPegawai PROCEDURE                                    ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(SMPegawai)
                       PROJECT(PEGA:Nik)
                       PROJECT(PEGA:Nama)
                       PROJECT(PEGA:Unit)
                       JOIN(RUNK:Pkey,PEGA:Unit)
                         PROJECT(RUNK:Nama)
                         PROJECT(RUNK:KodeUnker)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PEGA:Nik               LIKE(PEGA:Nik)                 !List box control field - type derived from field
PEGA:Nama              LIKE(PEGA:Nama)                !List box control field - type derived from field
RUNK:Nama              LIKE(RUNK:Nama)                !List box control field - type derived from field
RUNK:KodeUnker         LIKE(RUNK:KodeUnker)           !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Pegawai'),AT(,,358,208),FONT('Arial',8,,),CENTER,IMM,HLP('SelectPegawai'),SYSTEM,GRAY,MDI
                       LIST,AT(8,22,342,143),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('32L(2)|M~Nik~@s7@168L(2)|M~Nama~@s40@120L(2)|M~Bagian~@s30@'),FROM(Queue:Browse:1)
                       BUTTON('&Pilih'),AT(305,168,45,14),USE(?Select:2)
                       SHEET,AT(4,4,350,182),USE(?CurrentTab)
                         TAB('Nama (F2)'),USE(?Tab:2),KEY(F2Key)
                           PROMPT('Nama:'),AT(10,171),USE(?PEGA:Nama:Prompt)
                           ENTRY(@s40),AT(33,171,87,10),USE(PEGA:Nama)
                         END
                         TAB('NIP (F3)'),USE(?Tab:9),KEY(F3Key)
                           PROMPT('Nik:'),AT(9,170),USE(?PEGA:Nik:Prompt)
                           ENTRY(@s7),AT(59,170,60,10),USE(PEGA:Nik)
                         END
                       END
                       BUTTON('&Selesai'),AT(305,190,45,14),USE(?Close)
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
BRW1::Sort7:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('SelectPegawai')
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
  Relate:SMPegawai.SetOpenRelated()
  Relate:SMPegawai.Open                                    ! File SMRUnker used by this procedure, so make sure it's RelationManager is open
  Access:SMRUnker.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:SMPegawai,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,PEGA:Pkey)                            ! Add the sort order for PEGA:Pkey for sort order 1
  BRW1.AddLocator(BRW1::Sort7:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort7:Locator.Init(?PEGA:Nik,PEGA:Nik,,BRW1)       ! Initialize the browse locator using ?PEGA:Nik using key: PEGA:Pkey , PEGA:Nik
  BRW1.AddSortOrder(,PEGA:KeyNama)                         ! Add the sort order for PEGA:KeyNama for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?PEGA:Nama,PEGA:Nama,,BRW1)     ! Initialize the browse locator using ?PEGA:Nama using key: PEGA:KeyNama , PEGA:Nama
  BRW1.AddField(PEGA:Nik,BRW1.Q.PEGA:Nik)                  ! Field PEGA:Nik is a hot field or requires assignment from browse
  BRW1.AddField(PEGA:Nama,BRW1.Q.PEGA:Nama)                ! Field PEGA:Nama is a hot field or requires assignment from browse
  BRW1.AddField(RUNK:Nama,BRW1.Q.RUNK:Nama)                ! Field RUNK:Nama is a hot field or requires assignment from browse
  BRW1.AddField(RUNK:KodeUnker,BRW1.Q.RUNK:KodeUnker)      ! Field RUNK:KodeUnker is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectPegawai',QuickWindow)                ! Restore window settings from non-volatile store
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
    Relate:SMPegawai.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectPegawai',QuickWindow)             ! Save window data to non-volatile store
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

SelectResepHeader PROCEDURE                                ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(TBTransResepDokterHeader)
                       PROJECT(TBT2:NoTrans)
                       PROJECT(TBT2:KodeReg)
                       PROJECT(TBT2:KodePasien)
                       PROJECT(TBT2:KodeDokter)
                       PROJECT(TBT2:Tanggal)
                       PROJECT(TBT2:Jam)
                       PROJECT(TBT2:Her)
                       PROJECT(TBT2:Status)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
TBT2:NoTrans           LIKE(TBT2:NoTrans)             !List box control field - type derived from field
TBT2:KodeReg           LIKE(TBT2:KodeReg)             !List box control field - type derived from field
TBT2:KodePasien        LIKE(TBT2:KodePasien)          !List box control field - type derived from field
TBT2:KodeDokter        LIKE(TBT2:KodeDokter)          !List box control field - type derived from field
TBT2:Tanggal           LIKE(TBT2:Tanggal)             !List box control field - type derived from field
TBT2:Jam               LIKE(TBT2:Jam)                 !List box control field - type derived from field
TBT2:Her               LIKE(TBT2:Her)                 !List box control field - type derived from field
TBT2:Status            LIKE(TBT2:Status)              !List box control field - type derived from field
glo:nobillresep        LIKE(glo:nobillresep)          !Browse hot field - type derived from global data
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Resep Dokter'),AT(,,358,188),FONT('Arial',8,,),CENTER,IMM,HLP('SelectResepHeader'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,342,125),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('80L(2)|M~No Trans~@s20@64L(2)|M~Kode Reg~@s15@64L(2)|M~Kode Pasien~@s15@64L(2)|M' &|
   '~Kode Dokter~@s15@80R(2)|M~Tanggal~C(0)@d06@80R(2)|M~Jam~C(0)@t04@36R(2)|M~Her~C' &|
   '(0)@n-7@28R(2)|M~Status~C(0)@n3@'),FROM(Queue:Browse:1)
                       BUTTON('&Pilih'),AT(169,170,45,14),USE(?Select),DEFAULT
                       SHEET,AT(4,4,350,162),USE(?CurrentTab)
                         TAB('&Nomor (F2)'),USE(?Tab:2)
                           PROMPT('No Trans:'),AT(7,151),USE(?TBT2:NoTrans:Prompt)
                           ENTRY(@s20),AT(47,151,71,10),USE(TBT2:NoTrans)
                         END
                       END
                       BUTTON('&Selesai'),AT(260,170,45,14),USE(?Close)
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
  GlobalErrors.SetProcedureName('SelectResepHeader')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo:nobillresep',glo:nobillresep)                  ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:TBTransResepDokterHeader.Open                     ! File TBTransResepDokterHeader used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:TBTransResepDokterHeader,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,TBT2:PK)                              ! Add the sort order for TBT2:PK for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(?TBT2:NoTrans,TBT2:NoTrans,1,BRW1) ! Initialize the browse locator using ?TBT2:NoTrans using key: TBT2:PK , TBT2:NoTrans
  BRW1.SetFilter('(tbt2:kodereg=glo:nobillresep and tbt2:status=0)') ! Apply filter expression to browse
  BRW1.AddField(TBT2:NoTrans,BRW1.Q.TBT2:NoTrans)          ! Field TBT2:NoTrans is a hot field or requires assignment from browse
  BRW1.AddField(TBT2:KodeReg,BRW1.Q.TBT2:KodeReg)          ! Field TBT2:KodeReg is a hot field or requires assignment from browse
  BRW1.AddField(TBT2:KodePasien,BRW1.Q.TBT2:KodePasien)    ! Field TBT2:KodePasien is a hot field or requires assignment from browse
  BRW1.AddField(TBT2:KodeDokter,BRW1.Q.TBT2:KodeDokter)    ! Field TBT2:KodeDokter is a hot field or requires assignment from browse
  BRW1.AddField(TBT2:Tanggal,BRW1.Q.TBT2:Tanggal)          ! Field TBT2:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(TBT2:Jam,BRW1.Q.TBT2:Jam)                  ! Field TBT2:Jam is a hot field or requires assignment from browse
  BRW1.AddField(TBT2:Her,BRW1.Q.TBT2:Her)                  ! Field TBT2:Her is a hot field or requires assignment from browse
  BRW1.AddField(TBT2:Status,BRW1.Q.TBT2:Status)            ! Field TBT2:Status is a hot field or requires assignment from browse
  BRW1.AddField(glo:nobillresep,BRW1.Q.glo:nobillresep)    ! Field glo:nobillresep is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectResepHeader',QuickWindow)            ! Restore window settings from non-volatile store
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
    Relate:TBTransResepDokterHeader.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectResepHeader',QuickWindow)         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

PrintEtiketRajal PROCEDURE                                 ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
LOC::KOSONG          STRING(20)                            !
loc::nama            STRING(30)                            !
loc::alamat          STRING(30)                            !
vl_jam               TIME                                  !
vl_kali              STRING(1)                             !
Process:View         VIEW(APDTRANS)
                       PROJECT(APD:Camp)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:N0_tran)
                       JOIN(APH:by_transaksi,APD:N0_tran)
                         PROJECT(APH:Kode_Apotik)
                         PROJECT(APH:Tanggal)
                         PROJECT(APH:dokter)
                         PROJECT(APH:Nomor_mr)
                         JOIN(JDok:KeyKodeDokter,APH:dokter)
                         END
                         JOIN(JPas:KeyNomorMr,APH:Nomor_mr)
                           PROJECT(JPas:Nama)
                           PROJECT(JPas:TanggalLahir)
                         END
                       END
                       JOIN(GBAR:KeyKodeBrg,APD:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(4,1,65,30),PAPER(PAPER:USER,2800,1300),PRE(RPT),FONT('Arial',10,,),MM
break1                 BREAK(APD:Kode_brg)
detail1                  DETAIL,AT(,,66,30),USE(?detail1),FONT('Times New Roman',9,,)
                           STRING('Instalasi Farmasi RS Bhayangkara Sartika Asih'),AT(1,0,64,4),USE(?String11:2),TRN,CENTER,FONT('Times New Roman',9,,FONT:regular)
                           STRING('Jl. Moch Toha 369 Bandung Telp. 5229544'),AT(1,4,63,4),USE(?String11:3),TRN,HIDE,CENTER,FONT('Times New Roman',9,,FONT:regular)
                           STRING(@s15),AT(4,9,25,4),USE(APD:N0_tran),TRN,FONT('Times New Roman',8,,)
                           STRING(@s35),AT(2,14,41,4),USE(JPas:Nama),TRN,LEFT,FONT('Times New Roman',9,,FONT:regular)
                           STRING('(T.L {20})'),AT(43,14,27,4),USE(?String16),TRN,FONT('Times New Roman',9,,FONT:regular)
                           STRING(@D06),AT(49,14,16,4),USE(JPas:TanggalLahir),TRN,LEFT,FONT('Times New Roman',9,,FONT:regular)
                           LINE,AT(1,13,63,0),USE(?Line2:2),COLOR(COLOR:Black)
                           STRING(@s5),AT(31,9,9,4),USE(APH:Kode_Apotik),TRN,FONT('Times New Roman',8,,)
                           STRING(@D06),AT(47,9,16,4),USE(APH:Tanggal),TRN,FONT('Times New Roman',8,,)
                           LINE,AT(1,8,63,0),USE(?Line2),COLOR(COLOR:Black)
                           STRING(@s40),AT(4,26,50,4),USE(GBAR:Nama_Brg),FONT('Times New Roman',8,,)
                           STRING(@n5),AT(55,26,10,4),USE(APD:Jumlah),RIGHT(2),FONT('Times New Roman',8,,)
                           STRING('Sehari:'),AT(4,18,11,4),USE(?String11:5),TRN,FONT('Times New Roman',10,,FONT:regular)
                           STRING(@s10),AT(15,18,12,4),USE(APD2:Jumlah1),TRN,RIGHT,FONT('Times New Roman',10,,)
                           STRING(@s1),AT(28,18,4,4),USE(vl_kali),TRN,FONT('Times New Roman',10,,FONT:regular)
                           STRING(@s10),AT(30,18,9,4),USE(APD2:Jumlah2),LEFT,FONT('Times New Roman',10,,)
                           STRING(@s30),AT(41,18,26,4),USE(Ape:Nama),FONT('Times New Roman',10,,)
                           STRING(@s30),AT(2,22,59,4),USE(Ape1:Nama),CENTER,FONT('Times New Roman',10,,)
                         END
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
  GlobalErrors.SetProcedureName('PrintEtiketRajal')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo::nomor',glo::nomor)                            ! Added by: Report
  BIND('glo_kode_barang',glo_kode_barang)                  ! Added by: Report
  BIND('glo::no_nota',glo::no_nota)                        ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:APDTRANS.Open                                     ! File Apetiket1 used by this procedure, so make sure it's RelationManager is open
  Relate:APDTRANSDet.Open                                  ! File Apetiket1 used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket.Open                                     ! File Apetiket1 used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket1.Open                                    ! File Apetiket1 used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ApReLuar.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintEtiketRajal',ProgressWindow)          ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:APDTRANS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, APD:N0_tran)
  ThisReport.AddSortOrder(APD:by_transaksi)
  ThisReport.SetFilter('APD:N0_tran=glo::nomor')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  Relate:APDTRANS.SetQuickScan(1,Propagate:OneMany)
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
    Relate:APDTRANS.Close
    Relate:APDTRANSDet.Close
    Relate:Apetiket.Close
    Relate:Apetiket1.Close
  END
  IF SELF.Opened
    INIMgr.Update('PrintEtiketRajal',ProgressWindow)       ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  APH:N0_tran = APD:N0_tran                                ! Assign linking field value
  Access:APHTRANS.Fetch(APH:by_transaksi)
  JDok:Kode_Dokter = APH:dokter                            ! Assign linking field value
  Access:JDokter.Fetch(JDok:KeyKodeDokter)
  JPas:Nomor_mr = APH:Nomor_mr                             ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APH:N0_tran = APD:N0_tran                                ! Assign linking field value
  Access:APHTRANS.Fetch(APH:by_transaksi)
  JDok:Kode_Dokter = APH:dokter                            ! Assign linking field value
  Access:JDokter.Fetch(JDok:KeyKodeDokter)
  JPas:Nomor_mr = APH:Nomor_mr                             ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  !message(APD:N0_tran&' '&APD:Kode_brg&' '&APD:Camp)
  APD2:N0_tran    =APD:N0_tran
  APD2:Kode_brg   =APD:Kode_brg
  APD2:Camp       =APD:Camp
  get(apdtransdet,APD2:KEY1)
  if not errorcode() then
     !message(APD2:N0_tran&' '&APD2:Kode_brg&' '&APD2:Camp)
     Ape:No=APD2:Keterangan
     access:apetiket.fetch(Ape:KEY1)
     Ape1:No=APD2:Keterangan2
     access:apetiket1.fetch(Ape1:KEY1)
  else
     !message(error())
  end
  if APD2:Jumlah1='' or APD2:Jumlah2='' then
     vl_kali=''
  else
     vl_kali='X'
  end
  ReturnValue = PARENT.TakeRecord()
  IF  APH:Nomor_mr = 99999999
      APR:N0_tran = APH:N0_tran
      GET(ApReLuar,APR:by_transaksi)
      IF NOT ERRORCODE()
         loc::nama=APR:Nama
         loc::alamat=APR:Alamat
      ELSE
         loc::nama=''
         loc::alamat=''
      END
  ELSE
      JPas:Nomor_mr=APH:Nomor_mr
      get(jpasien,JPas:KeyNomorMr)
      IF NOT ERRORCODE()
         loc::nama=JPas:Nama
         loc::alamat=JPas:Alamat
      ELSE
         loc::nama=''
         loc::alamat=''
      END
  END
  
  !message(APD:N0_tran&' '&APD:Kode_brg&' '&APD:Camp)
  
  PRINT(RPT:detail1)
  RETURN ReturnValue

