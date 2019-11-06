

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N044.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N006.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N012.INC'),ONCE        !Req'd for module callout resolution
                     END


cetak_tran_antar_sub PROCEDURE                             ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
loc::kosong          STRING(20)                            !
vl_jam               TIME                                  !
Process:View         VIEW(APtoAPde)
                       PROJECT(APTO:Biaya)
                       PROJECT(APTO:Jumlah)
                       PROJECT(APTO:Kode_Brg)
                       PROJECT(APTO:N0_tran)
                       JOIN(GBAR:KeyKodeBrg,APTO:Kode_Brg)
                         PROJECT(GBAR:Nama_Brg)
                       END
                       JOIN(APTH:key_notran,APTO:N0_tran)
                         PROJECT(APTH:ApotikKeluar)
                         PROJECT(APTH:Kode_Apotik)
                         PROJECT(APTH:N0_tran)
                         PROJECT(APTH:Tanggal)
                         PROJECT(APTH:Total_Biaya)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(510,1375,2302,11354),PAPER(PAPER:USER,8350,13000),PRE(RPT),THOUS
                       HEADER,AT(500,271,2302,1094)
                         STRING(@D06),AT(990,500),USE(APTH:Tanggal),RIGHT(1),FONT('Arial',8,COLOR:Black,)
                         STRING(@t04),AT(1646,500),USE(vl_jam),FONT('Arial',8,,FONT:regular)
                         BOX,AT(10,719,2146,365),USE(?Box1),COLOR(COLOR:Black)
                         STRING('Nama Barang'),AT(63,740),USE(?String8),TRN,FONT('Arial',8,COLOR:Black,)
                         STRING('Kode'),AT(115,917),USE(?String9),TRN,FONT('Arial',8,COLOR:Black,)
                         STRING('Jumlah'),AT(1010,917),USE(?String10),TRN,FONT('Arial',8,COLOR:Black,)
                         STRING('Total'),AT(1740,917),USE(?String11),TRN,FONT('Arial',8,COLOR:Black,)
                         LINE,AT(813,885,0,190),USE(?Line2:3),COLOR(COLOR:Black)
                         LINE,AT(1594,885,0,190),USE(?Line2),COLOR(COLOR:Black)
                         LINE,AT(10,885,2135,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING(@s15),AT(21,500),USE(APTH:N0_tran),FONT('Arial',8,COLOR:Black,)
                         STRING(@s5),AT(1094,323),USE(APTH:ApotikKeluar),FONT('Arial',8,COLOR:Black,)
                         STRING('Ins. Farmasi -- SBBK antar sub'),AT(31,0),USE(?String1),TRN,FONT('Arial',8,,)
                         STRING('Sub Farmasi asal   :'),AT(21,156),USE(?String2),TRN,FONT('Arial',8,COLOR:Black,)
                         STRING(@s5),AT(1094,156),USE(APTH:Kode_Apotik),FONT('Arial',8,COLOR:Black,)
                         STRING('Sub Farmasi dituju :'),AT(21,323),USE(?String4),TRN,FONT('Arial',8,COLOR:Black,)
                       END
break1                 BREAK(loc::kosong)
detail1                  DETAIL,AT(,,,333)
                           STRING(@s40),AT(21,0,2625,188),USE(GBAR:Nama_Brg),FONT('Arial',8,COLOR:Black,)
                           STRING(@n-14),AT(1583,156,854,188),USE(APTO:Biaya),LEFT(1),FONT('Arial',8,,)
                           STRING(@n14),AT(771,156),USE(APTO:Jumlah),LEFT(1),FONT('Arial',8,COLOR:Black,)
                           STRING(@s10),AT(52,156),USE(APTO:Kode_Brg),FONT('Arial',8,COLOR:Black,)
                         END
                         FOOTER,AT(0,0,,1000)
                           STRING(@n-14),AT(1583,31,854,188),USE(APTH:Total_Biaya),LEFT(1),FONT('Arial',8,,)
                           STRING('1. Arsip'),AT(31,177),USE(?String18),TRN,FONT('Arial',8,COLOR:Black,)
                           STRING('Petugas'),AT(1313,177),USE(?String21),TRN,FONT('Arial',8,COLOR:Black,)
                           STRING('2. Sub Asal'),AT(31,313),USE(?String19),TRN,FONT('Arial',8,COLOR:Black,)
                           STRING(@s10),AT(1219,531),USE(Glo:USER_ID),CENTER,FONT('Arial',8,,)
                           STRING('3. Sub dituju'),AT(31,458),USE(?String20),TRN,FONT('Arial',8,COLOR:Black,)
                           STRING('(.{22})'),AT(1156,625),USE(?String23),TRN,FONT('Arial',8,COLOR:Black,)
                           LINE,AT(10,0,2500,0),USE(?Line4),COLOR(COLOR:Black)
                           STRING('Total Harga :'),AT(938,31),USE(?String17),TRN,FONT('Arial',8,COLOR:Black,)
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
  GlobalErrors.SetProcedureName('cetak_tran_antar_sub')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  vl_jam = CLOCK()
  Relate:APtoAPde.Open                                     ! File APtoAPde used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('cetak_tran_antar_sub',ProgressWindow)      ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:APtoAPde, ?Progress:PctText, Progress:Thermometer, ProgressMgr, APTO:N0_tran)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(APTO:key_no_nota)
  ThisReport.AddRange(APTO:N0_tran,Relate:APtoAPde,Relate:AptoApHe)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report)
  ?Progress:UserString{Prop:Text}=''
  Relate:APtoAPde.SetQuickScan(1,Propagate:OneMany)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APtoAPde.Close
  END
  IF SELF.Opened
    INIMgr.Update('cetak_tran_antar_sub',ProgressWindow)   ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = APTO:Kode_Brg                            ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  APTH:N0_tran = APTO:N0_tran                              ! Assign linking field value
  Access:AptoApHe.Fetch(APTH:key_notran)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  GBAR:Kode_brg = APTO:Kode_Brg                            ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  APTH:N0_tran = APTO:N0_tran                              ! Assign linking field value
  Access:AptoApHe.Fetch(APTH:key_notran)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail1)
  RETURN ReturnValue

BrowseAntarApotik1 PROCEDURE                               ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
loc::kode_sub        STRING(5)                             !
loc::kode_tran       STRING(15)                            !nomor transaksi
loc::thread          BYTE                                  !
BRW1::View:Browse    VIEW(AptoApHe)
                       PROJECT(APTH:N0_tran)
                       PROJECT(APTH:Tanggal)
                       PROJECT(APTH:Kode_Apotik)
                       PROJECT(APTH:ApotikKeluar)
                       PROJECT(APTH:Total_Biaya)
                       PROJECT(APTH:User)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APTH:N0_tran           LIKE(APTH:N0_tran)             !List box control field - type derived from field
APTH:Tanggal           LIKE(APTH:Tanggal)             !List box control field - type derived from field
APTH:Kode_Apotik       LIKE(APTH:Kode_Apotik)         !List box control field - type derived from field
APTH:ApotikKeluar      LIKE(APTH:ApotikKeluar)        !List box control field - type derived from field
APTH:Total_Biaya       LIKE(APTH:Total_Biaya)         !List box control field - type derived from field
APTH:User              LIKE(APTH:User)                !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW6::View:Browse    VIEW(APtoAPde)
                       PROJECT(APTO:Kode_Brg)
                       PROJECT(APTO:Jumlah)
                       PROJECT(APTO:Biaya)
                       PROJECT(APTO:N0_tran)
                       JOIN(GBAR:KeyKodeBrg,APTO:Kode_Brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
APTO:Kode_Brg          LIKE(APTO:Kode_Brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
APTO:Jumlah            LIKE(APTO:Jumlah)              !List box control field - type derived from field
APTO:Biaya             LIKE(APTO:Biaya)               !List box control field - type derived from field
APTO:N0_tran           LIKE(APTO:N0_tran)             !List box control field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Transaksi antar SubInstalasi Farmasi'),AT(,,312,186),FONT('Arial',8,,),CENTER,IMM,HLP('Transaksi_antar_sub'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,244,54),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('64L(2)|FM~No. Transaksi~C@s15@49C|M~Tanggal~@D06@34L(2)|M~Sub Asal~C(0)@s5@41L(2' &|
   ')|M~Sub Dituju~C(0)@s5@56R(1)|M~Total Biaya~L(2)@n-15.2@16R(1)|M~User~L(2)@s4@'),FROM(Queue:Browse:1)
                       BUTTON('&Transaksi (F4)'),AT(264,16,45,37),USE(?Insert:3),ICON(ICON:Application)
                       STRING('Detail Alat-alat yang dikeluarkan'),AT(8,100),USE(?String1),FONT(,,COLOR:Black,FONT:bold+FONT:italic+FONT:underline)
                       LIST,AT(8,111,302,70),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('45L(1)|FM~Kode Barang~C(0)@s10@153L(1)|M~Nama Barang~C(0)@s40@50R(1)|M~Jumlah~L(' &|
   '2)@n-14.2@49R(2)|M~Biaya~L@n-15.2@60R(2)|M~N 0 tran~L@s15@'),FROM(Queue:Browse)
                       BUTTON('&Select'),AT(133,0,45,14),USE(?Select:2),HIDE
                       BUTTON('&Change'),AT(165,0,45,14),USE(?Change:3),HIDE,DEFAULT
                       BUTTON('&Delete'),AT(183,0,45,14),USE(?Delete:3),HIDE
                       SHEET,AT(4,2,254,97),USE(?CurrentTab)
                         TAB('Kode Sub Farmasi [F2]'),USE(?Tab:2),KEY(F2Key)
                           PROMPT('Kode Sub-Instalasi :'),AT(130,81),USE(?Prompt1)
                           ENTRY(@s5),AT(196,81,,10),USE(loc::kode_sub),FONT('Times New Roman',12,COLOR:Black,)
                         END
                         TAB('No. Transaksi [F3]'),USE(?Tab:3),KEY(F3Key)
                           ENTRY(@s15),AT(191,82,60,10),USE(loc::kode_tran),FONT('Times New Roman',10,COLOR:Black,)
                         END
                       END
                       BUTTON('&Keluar'),AT(264,64,45,37),USE(?Close),ICON(ICON:Cross)
                       BUTTON('Cetak &Detail'),AT(12,76,52,21),USE(?Print),LEFT,FONT('Times New Roman',10,COLOR:Black,),ICON(ICON:Print)
                       BUTTON('Help'),AT(212,0,45,14),USE(?Help),HIDE,STD(STD:Help)
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
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  EntryLocatorClass                     ! Default Locator
BRW1::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW1::Sort1:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW6                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
                     END

BRW6::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
  GlobalErrors.SetProcedureName('BrowseAntarApotik1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  loc::thread=glo::mainthreadno
  !POST(EVENT:Disable_AntarApotik,,loc::thread)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:APtoAPde.Open                                     ! File GApotik used by this procedure, so make sure it's RelationManager is open
  Access:GApotik.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:AptoApHe,SELF) ! Initialize the browse manager
  BRW6.Init(?List,Queue:Browse.ViewPosition,BRW6::View:Browse,Queue:Browse,Relate:APtoAPde,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon APTH:N0_tran for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,APTH:key_notran) ! Add the sort order for APTH:key_notran for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?loc::kode_tran,APTH:N0_tran,1,BRW1) ! Initialize the browse locator using ?loc::kode_tran using key: APTH:key_notran , APTH:N0_tran
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon APTH:Kode_Apotik for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,APTH:key_kode_ap) ! Add the sort order for APTH:key_kode_ap for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?loc::kode_sub,APTH:Kode_Apotik,1,BRW1) ! Initialize the browse locator using ?loc::kode_sub using key: APTH:key_kode_ap , APTH:Kode_Apotik
  BRW1.AddField(APTH:N0_tran,BRW1.Q.APTH:N0_tran)          ! Field APTH:N0_tran is a hot field or requires assignment from browse
  BRW1.AddField(APTH:Tanggal,BRW1.Q.APTH:Tanggal)          ! Field APTH:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(APTH:Kode_Apotik,BRW1.Q.APTH:Kode_Apotik)  ! Field APTH:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(APTH:ApotikKeluar,BRW1.Q.APTH:ApotikKeluar) ! Field APTH:ApotikKeluar is a hot field or requires assignment from browse
  BRW1.AddField(APTH:Total_Biaya,BRW1.Q.APTH:Total_Biaya)  ! Field APTH:Total_Biaya is a hot field or requires assignment from browse
  BRW1.AddField(APTH:User,BRW1.Q.APTH:User)                ! Field APTH:User is a hot field or requires assignment from browse
  BRW6.Q &= Queue:Browse
  BRW6.AddSortOrder(,APTO:key_no_nota)                     ! Add the sort order for APTO:key_no_nota for sort order 1
  BRW6.AddRange(APTO:N0_tran,Relate:APtoAPde,Relate:AptoApHe) ! Add file relationship range limit for sort order 1
  BRW6.AddLocator(BRW6::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW6::Sort0:Locator.Init(,APTO:Kode_Brg,1,BRW6)          ! Initialize the browse locator using  using key: APTO:key_no_nota , APTO:Kode_Brg
  BRW6.AddField(APTO:Kode_Brg,BRW6.Q.APTO:Kode_Brg)        ! Field APTO:Kode_Brg is a hot field or requires assignment from browse
  BRW6.AddField(GBAR:Nama_Brg,BRW6.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW6.AddField(APTO:Jumlah,BRW6.Q.APTO:Jumlah)            ! Field APTO:Jumlah is a hot field or requires assignment from browse
  BRW6.AddField(APTO:Biaya,BRW6.Q.APTO:Biaya)              ! Field APTO:Biaya is a hot field or requires assignment from browse
  BRW6.AddField(APTO:N0_tran,BRW6.Q.APTO:N0_tran)          ! Field APTO:N0_tran is a hot field or requires assignment from browse
  BRW6.AddField(GBAR:Kode_brg,BRW6.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseAntarApotik1',QuickWindow)           ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW6.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW6.ToolbarItem.HelpButton = ?Help
  BRW1.PrintProcedure = 2
  BRW1.PrintControl = ?Print
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APtoAPde.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseAntarApotik1',QuickWindow)        ! Save window data to non-volatile store
  END
  !POST(EVENT:Enable_AntarApotik,,loc::thread)
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
    EXECUTE Number
      Trig_UpdateAntarApotik1
      cetak_tran_antar_sub
    END
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
    OF ?Change:3
      ThisWindow.Update
      cycle
    OF ?Delete:3
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
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END


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


BRW6.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

Cari_apotik PROCEDURE                                      ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(GApotik)
                       PROJECT(GAPO:Kode_Apotik)
                       PROJECT(GAPO:Nama_Apotik)
                       PROJECT(GAPO:Keterangan)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GAPO:Kode_Apotik       LIKE(GAPO:Kode_Apotik)         !List box control field - type derived from field
GAPO:Nama_Apotik       LIKE(GAPO:Nama_Apotik)         !List box control field - type derived from field
GAPO:Keterangan        LIKE(GAPO:Keterangan)          !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Tabel Sub-Instalasi Farmasi'),AT(,,216,170),FONT('Arial',8,,),IMM,HLP('Cari_apotik'),SYSTEM,GRAY
                       LIST,AT(8,24,200,105),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('48L(2)|M~Kode Sub~@s5@80L(2)|M~Nama Sub-Farmasi~@s30@80L(2)|M~Keterangan~@s20@'),FROM(Queue:Browse:1)
                       SHEET,AT(4,4,208,135),USE(?CurrentTab)
                         TAB('Kode Sub-Farmasi (F2)'),USE(?Tab:2)
                           BUTTON('&Pilih'),AT(152,140,55,25),USE(?Select:2),LEFT,ICON(ICON:Tick)
                         END
                         TAB('Nama Sub_Farmasi (F3)'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Keluar'),AT(18,142,64,25),USE(?Close),HIDE,LEFT
                       BUTTON('Help'),AT(159,0,45,14),USE(?Help),HIDE,STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('Cari_apotik')
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
  Relate:GApotik.SetOpenRelated()
  Relate:GApotik.Open                                      ! File GApotik used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GApotik,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon GAPO:Nama_Apotik for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,GAPO:KeyNama)    ! Add the sort order for GAPO:KeyNama for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,GAPO:Nama_Apotik,1,BRW1)       ! Initialize the browse locator using  using key: GAPO:KeyNama , GAPO:Nama_Apotik
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon GAPO:Kode_Apotik for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,GAPO:KeyNoApotik) ! Add the sort order for GAPO:KeyNoApotik for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,GAPO:Kode_Apotik,1,BRW1)       ! Initialize the browse locator using  using key: GAPO:KeyNoApotik , GAPO:Kode_Apotik
  BRW1.AddField(GAPO:Kode_Apotik,BRW1.Q.GAPO:Kode_Apotik)  ! Field GAPO:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GAPO:Nama_Apotik,BRW1.Q.GAPO:Nama_Apotik)  ! Field GAPO:Nama_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GAPO:Keterangan,BRW1.Q.GAPO:Keterangan)    ! Field GAPO:Keterangan is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Cari_apotik',QuickWindow)                  ! Restore window settings from non-volatile store
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
    Relate:GApotik.Close
  END
  IF SELF.Opened
    INIMgr.Update('Cari_apotik',QuickWindow)               ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeSelected PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all Selected events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE FIELD()
    OF ?Browse:1
      IF RECORDS(GApotik) = 0 THEN
      !   LOCK(GApotik,1)            !Lock the iSetupap file, try 1 second
      !   IF ERRORCODE() = 32             !If someone else has it
      !        RETURN 0
      !   END
         GAPO:Kode_Apotik = 'FM01'
         GAPO:Nama_Apotik = 'Farmasi pusat'
         GAPO:Keterangan = 'Default Dari setup'
         ADD(GApotik)
      !   UNLOCK( GApotik )
      !   COMMIT
         BRW1.ResetSort(1)
      END
    END
  ReturnValue = PARENT.TakeSelected()
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

Trig_UpdateAntarApotik1 PROCEDURE                          ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
sudah_nomor          BYTE                                  !
vl_no_urut           SHORT                                 !
tahun_ini            USHORT                                !
loc::nilai           USHORT                                !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
putar                BYTE                                  !
loc::nama_apotik     STRING(30)                            !
vl_nomor             STRING(15)                            !
BRW2::View:Browse    VIEW(APtoAPde)
                       PROJECT(APTO:Kode_Brg)
                       PROJECT(APTO:Jumlah)
                       PROJECT(APTO:Biaya)
                       PROJECT(APTO:N0_tran)
                       JOIN(GBAR:KeyKodeBrg,APTO:Kode_Brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?Browse:2
APTO:Kode_Brg          LIKE(APTO:Kode_Brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
APTO:Jumlah            LIKE(APTO:Jumlah)              !List box control field - type derived from field
APTO:Biaya             LIKE(APTO:Biaya)               !List box control field - type derived from field
APTO:N0_tran           LIKE(APTO:N0_tran)             !Primary key field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::APTH:Record LIKE(APTH:RECORD),THREAD
QuickWindow          WINDOW('Transaksi antar Sub-Farmasi'),AT(,,359,220),FONT('Arial',8,,),CENTER,IMM,HLP('UpdateAptoApHe'),ALRT(EscKey),TIMER(100),SYSTEM,GRAY,MDI
                       SHEET,AT(4,4,351,60),USE(?CurrentTab)
                         TAB('Data Umum'),USE(?Tab:1)
                           PROMPT('Sub Farmasi Asal :'),AT(8,27),USE(?APTH:Kode_Apotik:Prompt),FONT('Times New Roman',12,COLOR:Black,)
                           ENTRY(@s5),AT(92,27,40,10),USE(APTH:Kode_Apotik),DISABLE,FONT('Times New Roman',12,,),MSG('Kode Apotik'),TIP('Kode Apotik')
                           BUTTON('&F (F2)'),AT(318,25,27,12),USE(?CallLookup),KEY(F2Key)
                           PROMPT('Sub Farmasi dituju :'),AT(202,27),USE(?APTH:ApotikKeluar:Prompt)
                           ENTRY(@s5),AT(269,26,40,10),USE(APTH:ApotikKeluar),FONT('Times New Roman',12,,),REQ
                           IMAGE('DYPLUS.ICO'),AT(149,34,16,20),USE(?Image1)
                           IMAGE('DYPLUS.ICO'),AT(163,34,16,20),USE(?Image1:2)
                           IMAGE('DYPLUS.ICO'),AT(176,34,16,20),USE(?Image1:3)
                           PROMPT('Tanggal :'),AT(251,4),USE(?APTH:Tanggal:Prompt:2)
                           STRING(@s30),AT(9,46),USE(GL_namaapotik),FONT('Times New Roman',10,COLOR:Black,)
                           STRING(@s30),AT(202,44,129,10),USE(loc::nama_apotik)
                         END
                       END
                       LIST,AT(4,71,351,75),USE(?Browse:2),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('44L(2)|M~Kode Brg~@s10@167L(2)|M~Nama Barang~C@s40@60R(2)|M~Jumlah~C(0)@n-15.2@5' &|
   '6R(1)|M~Biaya~C(0)@n-15.2@'),FROM(Queue:Browse:2)
                       PANEL,AT(4,186,159,26),USE(?Panel1)
                       PROMPT('N0 transaksi :'),AT(8,194),USE(?APTH:N0_tran:Prompt),FONT('Times New Roman',10,COLOR:Black,)
                       PROMPT('Total Biaya:'),AT(229,155),USE(?APTH:Total_Biaya:Prompt),FONT('Times New Roman',10,COLOR:Black,FONT:bold+FONT:italic)
                       ENTRY(@n-15.2),AT(283,153),USE(APTH:Total_Biaya),RIGHT(1),FONT('Times New Roman',10,COLOR:Black,)
                       ENTRY(@s15),AT(59,191,99,16),USE(APTH:N0_tran),DISABLE,FONT('Times New Roman',12,COLOR:Black,FONT:bold),MSG('nomor transaksi'),TIP('nomor transaksi')
                       BUTTON('&OK'),AT(225,186,52,27),USE(?OK),LEFT,ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(287,186,52,27),USE(?Cancel),LEFT,ICON('CANCEL.ICO')
                       BUTTON('Help'),AT(63,1,45,14),USE(?Help),HIDE,STD(STD:Help)
                       BUTTON('&Tambah Barang (F4)'),AT(4,154,106,27),USE(?Insert:3),LEFT,KEY(F4Key),ICON('INSERT.ICO')
                       BUTTON('&Edit [Ctrl]'),AT(116,153,106,27),USE(?Change:3),FONT(,,COLOR:Black,FONT:bold),KEY(529)
                       BUTTON('&Delete'),AT(93,2,45,14),USE(?Delete:3),HIDE
                       ENTRY(@D06),AT(301,2),USE(APTH:Tanggal,,?APTH:Tanggal:2),RIGHT(1)
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
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW2                 CLASS(BrowseClass)                    ! Browse using ?Browse:2
Q                      &Queue:Browse:2                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetFromView          PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW2::Sort0:StepClass StepStringClass                      ! Default Step Manager
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
BATAL_aptoap ROUTINE  !untuk aptoapde
    SET( BRW2::View:Browse)
    LOOP
        NEXT( BRW2::View:Browse)
        IF ERRORCODE() > 0 THEN BREAK.
        DELETE( BRW2::View:Browse)
    END

!Proses Penomoran Otomatis Transaksi
Isi_Nomor Routine
   vl_nomor=''
   display
   loop
      logout(1,nomor_batal)
      if errorcode()=56 then
         cycle.
      !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
      NOM:No_Urut=4
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
         !NOMU:Urut =4
         !NOMU:Nomor=vl_nomor
         !add(nomoruse)
         !if errorcode()>0 then
         !   vl_nomor=''
         !   rollback
         !   cycle
         !end
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
        !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
        NOM1:No_urut=4
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
           !NOMU:Urut =4
           !NOMU:Nomor=vl_nomor
           !add(nomoruse)
           !if errorcode()>0 then
           !   rollback
           !   cycle
           !end
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
      !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
      nomor_batal{prop:sql}='delete dba.nomor_batal where No=4'
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
         NOM1:No_urut=4
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
   APTH:N0_tran=vl_nomor
   display

Batal_Nomor Routine
   !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
   NOM:No_Urut =4
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=APTH:N0_tran
   NOM:Keterangan='Antar Aptk'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
   !NOMU:Urut =4
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   !NOMU:Nomor=APTH:N0_tran
   !access:nomoruse.fetch(NOMU:PrimaryKey)
   !delete(nomoruse)

hapus_nomor_use routine
   NOMU:Urut    =4
   NOMU:Nomor   =APTH:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   if errorcode()=0 then
      delete(nomoruse)
   end


!Proses Penomoran Otomatis Transaksi
Isi_Nomor1 Routine
   vl_nomor=''
   display
   loop
      logout(1,nomor_batal)
      if errorcode()=56 then
         cycle.
      !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
      NOM:No_Urut= vl_no_urut
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
         NOMU:Urut = vl_no_urut
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
        !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
        NOM1:No_urut= vl_no_urut
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
           NOMU:Urut = vl_no_urut
           NOMU:Nomor=vl_nomor
           add(nomoruse)
           if errorcode()>0 then
              rollback
              cycle
           end
           NOM1:No_Trans=sub(vl_nomor,1,8)&format(deformat(sub(vl_nomor,9,4),@n4)+1,@p####p)
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
   if format(sub(vl_nomor,7,2),@n2)<>month(today()) then
      !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
      nomor_batal{prop:sql}='delete dba.nomor_batal where No='&vl_no_urut
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
         NOM1:No_urut= vl_no_urut
         access:nomor_skr.fetch(NOM1:PrimaryKey)
         if not(errorcode()) then
            vl_nomor =NOM1:No_Trans
            NOM1:No_Trans=sub(vl_nomor,1,4)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'0002'
            access:nomor_skr.update()
            if errorcode()<>0 then
               rollback
               cycle
            else
               vl_nomor=sub(vl_nomor,1,4)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'0001'
               commit
            end
         end
         break
      end
   end
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   APTH:N0_tran=vl_nomor
   display

Batal_Nomor1 Routine
   !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
   NOM:No_Urut = vl_no_urut
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=APTH:N0_tran
   NOM:Keterangan='Antar Aptk'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 4=Transaksi Apotik ke Apotik
   NOMU:Urut = vl_no_urut
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOMU:Nomor=APTH:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   delete(nomoruse)

hapus_nomor_use1 routine
   NOMU:Urut    = vl_no_urut
   NOMU:Nomor   =APTH:N0_tran
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
    CLEAR(ActionMessage)
  OF ChangeRecord
    GlobalErrors.Throw(Msg:UpdateIllegal)
    RETURN
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  !APTH:Kode_Apotik=GL_entryapotik
  ?OK{PROP:DISABLE}=TRUE
  ?BROWSE:2{PROP:DISABLE}=TRUE
  ?Insert:3{PROP:DISABLE}=TRUE
  CLEAR(loc::nama_apotik)
  CLEAR(APTH:ApotikKeluar)
  sudah_nomor = 0
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_UpdateAntarApotik1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APTH:Kode_Apotik:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APTH:Record,History::APTH:Record)
  SELF.AddHistoryField(?APTH:Kode_Apotik,1)
  SELF.AddHistoryField(?APTH:ApotikKeluar,6)
  SELF.AddHistoryField(?APTH:Total_Biaya,5)
  SELF.AddHistoryField(?APTH:N0_tran,3)
  SELF.AddHistoryField(?APTH:Tanggal:2,2)
  SELF.AddUpdateFile(Access:AptoApHe)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  !Antar Apotik
  case deformat(sub(clip(GL_entryapotik),3,2),@n2)
     of '01'
        vl_no_urut=51
     of '02'
        vl_no_urut=52
     of '04'
        vl_no_urut=53
     of '06'
        vl_no_urut=54
     of '07'
        vl_no_urut=55
     of '08'
        vl_no_urut=56
  END
  Relate:APtoAPde.Open                                     ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Ano_pakai.Open                                    ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:IAP_SET.Open                                      ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_Batal.Open                                  ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Tbstawal.Open                                     ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Access:AptoApHe.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:AptoApHe
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
  BRW2.Init(?Browse:2,Queue:Browse:2.ViewPosition,BRW2::View:Browse,Queue:Browse:2,Relate:APtoAPde,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  if self.request=1 then
     do isi_nomor
  end
  ?Browse:2{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW2.Q &= Queue:Browse:2
  BRW2::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon APTO:Kode_Brg for sort order 1
  BRW2.AddSortOrder(BRW2::Sort0:StepClass,APTO:key_no_nota) ! Add the sort order for APTO:key_no_nota for sort order 1
  BRW2.AddRange(APTO:N0_tran,Relate:APtoAPde,Relate:AptoApHe) ! Add file relationship range limit for sort order 1
  BRW2.AddField(APTO:Kode_Brg,BRW2.Q.APTO:Kode_Brg)        ! Field APTO:Kode_Brg is a hot field or requires assignment from browse
  BRW2.AddField(GBAR:Nama_Brg,BRW2.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW2.AddField(APTO:Jumlah,BRW2.Q.APTO:Jumlah)            ! Field APTO:Jumlah is a hot field or requires assignment from browse
  BRW2.AddField(APTO:Biaya,BRW2.Q.APTO:Biaya)              ! Field APTO:Biaya is a hot field or requires assignment from browse
  BRW2.AddField(APTO:N0_tran,BRW2.Q.APTO:N0_tran)          ! Field APTO:N0_tran is a hot field or requires assignment from browse
  BRW2.AddField(GBAR:Kode_brg,BRW2.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_UpdateAntarApotik1',QuickWindow)      ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW2.AskProcedure = 2
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
  BRW2.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW2.ToolbarItem.HelpButton = ?Help
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  if (self.request=1 and self.response=2) or (self.request=3 and self.response=1) then
     do batal_nomor
     DO BATAL_aptoap
  end
  if self.request=1 and self.response=1 then
     do hapus_nomor_use
  end
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APtoAPde.Close
    Relate:Ano_pakai.Close
    Relate:IAP_SET.Close
    Relate:NomorUse.Close
    Relate:Nomor_Batal.Close
    Relate:Nomor_SKR.Close
    Relate:Tbstawal.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_UpdateAntarApotik1',QuickWindow)   ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
    APTH:Tanggal = TODAY()
    APTH:Kode_Apotik = 'FM07'
    APTH:User = vg_user
  PARENT.PrimeFields


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  GAPO:Kode_Apotik = APTH:Kode_Apotik                      ! Assign linking field value
  Access:GApotik.Fetch(GAPO:KeyNoApotik)
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
    EXECUTE Number
      Cari_apotik
      UpdateAPtoAPde1
    END
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
    OF ?APTH:ApotikKeluar
      IF APTH:ApotikKeluar = APTH:Kode_Apotik
          MESSAGE('Kode Apotik Tidak Boleh Sama dengan Apotik Asal')
          ?BROWSE:2{PROP:DISABLE}=1
          ?Insert:3{PROP:DISABLE}=TRUE
          CLEAR (GAPO:Nama_Apotik)
          DISPLAY
          SELECT(?APTH:ApotikKeluar)
          CYCLE
      END
      GAPO:Kode_Apotik=APTH:ApotikKeluar
      Access:GApotik.Fetch(GAPO:KeyNoApotik)
      IF ERRORCODE() > 0
          MESSAGE('Kode Apotik Tidak Ada Dalam daftar')
          ?BROWSE:2{PROP:DISABLE}=1
          ?Insert:3{PROP:DISABLE}=TRUE
          CLEAR (GAPO:Nama_Apotik)
          DISPLAY
          SELECT(?APTH:ApotikKeluar)
      ELSE
          ?BROWSE:2{PROP:DISABLE}=0
          ?Insert:3{PROP:DISABLE}=0
          loc::nama_apotik=GAPO:Nama_Apotik
          display                                               
      END
    OF ?OK
      ! ISI aptoaphe & aptoapde serta potong saldo gstoaptk
      ! *****UNTUK file ApTOApHe******
      sudah_nomor = 0
      APTH:User=GL::Prefix
      glo::no_nota = APTH:N0_tran
      
      !cek dulu bulannya ya, kalau sudah berubah, tulis dulu ke file awal bulan
      IF MONTH(glo::tgl_awal_kerja) = MONTH(TODAY())
      
      ELSE
      
          AptoApDe{prop:sql}='select * from dba.aptoapde where n0_tran='''&APTH:N0_tran&''''
          LOOP
              Next(APToApDe)
              IF ERRORCODE() > 0 THEN BREAK.
      !
              GSTO:Kode_Barang = APTO:Kode_Brg
              GSTO:Kode_Apotik = APTH:Kode_Apotik
              GET(GStokAptk,GSTO:KeyBarang)
      !
              ! CARI dan cek DULU DI FILE Tbstawal apakah sudah ada yang nulis
              TBS:Kode_Apotik = APTH:Kode_Apotik
              TBS:Kode_Barang = APTO:Kode_Brg
              TBS:Tahun = Tahun_ini
              GET(Tbstawal,TBS:kdap_brg)
              IF ERRORCODE()=0
                  LOOP
                      CASE MONTH(TODAY())
                          OF 1
                              IF TBS:Januari= 0
                                  TBS:Januari = GSTO:Saldo
                                  PUT(Tbstawal)
                              END
                              
                          OF 2
                              IF TBS:Februari= 0
                                  TBS:Februari = GSTO:Saldo
                                  PUT(Tbstawal)
                              END
                              
                          OF 3
                              IF TBS:Maret= 0
                                  TBS:Maret = GSTO:Saldo
                                  PUT(Tbstawal)
                              END
                              
                          OF 4
                              IF TBS:April= 0
                                  TBS:April = GSTO:Saldo
                                  PUT(Tbstawal)
                              END
                              
                          OF 5
                              IF TBS:Mei= 0
                                  TBS:Mei = GSTO:Saldo
                                  PUT(Tbstawal)
                              END
                              
                          OF 6
                              IF TBS:Juni= 0
                                  TBS:Juni = GSTO:Saldo
                                  PUT(Tbstawal)
                              END
                              
                          OF 7
                              IF TBS:Juli= 0
                                  TBS:Juli = GSTO:Saldo
                                  PUT(Tbstawal)
                              END
                              
                          OF 8
                              IF TBS:Agustus= 0
                                  TBS:Agustus = GSTO:Saldo
                                  PUT(Tbstawal)
                              END
                              
                          OF 9
                              IF TBS:September= 0
                                  TBS:September = GSTO:Saldo
                                  PUT(Tbstawal)
                              END
                              
                          OF 10
                              IF TBS:Oktober= 0
                                  TBS:Oktober = GSTO:Saldo
                                  PUT(Tbstawal)
                              END
                              
                          OF 11
                              IF TBS:November= 0
                                  TBS:November = GSTO:Saldo
                                  PUT(Tbstawal)
                              END
                          OF 12
                              IF TBS:Desember= 0
                                  TBS:Desember = GSTO:Saldo
                                  PUT(Tbstawal)
                              END
                      END
                      IF ERRORCODE() > 0 THEN  CYCLE.
                      BREAK
                  END
              ELSE
                  CASE MONTH(TODAY())
                          OF 1
                              TBS:Januari = GSTO:Saldo
                          OF 2
                              TBS:Februari = GSTO:Saldo
                          OF 3
                              TBS:Maret = GSTO:Saldo
                          OF 4
                              TBS:April = GSTO:Saldo
                          OF 5
                              TBS:Mei = GSTO:Saldo
                          OF 6
                              TBS:Juni = GSTO:Saldo
                          OF 7
                              TBS:Juli = GSTO:Saldo
                          OF 8
                              TBS:Agustus = GSTO:Saldo
                          OF 9
                              TBS:September = GSTO:Saldo
                          OF 10
                              TBS:Oktober = GSTO:Saldo
                          OF 11
                              TBS:November = GSTO:Saldo
                          OF 12
                              TBS:Desember = GSTO:Saldo
                  END
                  TBS:Kode_Apotik = GL_entryapotik
                  TBS:Kode_Barang = GSTO:Kode_Barang
                  TBS:Tahun = Tahun_ini
                  ADD(Tbstawal)
                  IF ERRORCODE() > 0
                  END
      
              END
          END
      END
    OF ?Cancel
      sudah_nomor = 0
          IF SELF.REQUEST=1
              
          END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?CallLookup
      ThisWindow.Update
      GAPO:Kode_Apotik = APTH:ApotikKeluar
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        APTH:ApotikKeluar = GAPO:Kode_Apotik
      END
      ThisWindow.Reset(1)
      IF APTH:ApotikKeluar = APTH:Kode_Apotik
          MESSAGE('Kode Apotik Tidak Boleh Sama dengan Apotik Asal')
          ?BROWSE:2{PROP:DISABLE}=1
          ?Insert:3{PROP:DISABLE}=TRUE
          CLEAR (GAPO:Nama_Apotik)
          DISPLAY
          SELECT(?APTH:ApotikKeluar)
          CYCLE
      END
      GAPO:Kode_Apotik = APTH:ApotikKeluar
      get(Gapotik,GAPO:KeyNoApotik)
      if errorcode() = 0
            loc::nama_apotik= GAPO:Nama_Apotik
      end
      ?BROWSE:2{PROP:DISABLE}=0
      ?Insert:3{PROP:DISABLE}=0
      
    OF ?APTH:ApotikKeluar
      IF APTH:ApotikKeluar OR ?APTH:ApotikKeluar{Prop:Req}
        GAPO:Kode_Apotik = APTH:ApotikKeluar
        IF Access:GApotik.TryFetch(GAPO:KeyNoApotik)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            APTH:ApotikKeluar = GAPO:Kode_Apotik
          ELSE
            SELECT(?APTH:ApotikKeluar)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
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


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE EVENT()
    OF EVENT:AlertKey
      select(?cancel)
      presskey( 13)
    OF EVENT:CloseWindow
      IF SELF.RESPONSE = 1 THEN
         glo::no_nota=APTH:N0_tran
         Cetak_tran_antar_sub_1
      END
    OF EVENT:Timer
      IF APTH:Total_Biaya = 0
          ?OK{PROP:DISABLE}=1
      ELSE
          ?OK{PROP:DISABLE}=0
      END
    END
  ReturnValue = PARENT.TakeWindowEvent()
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

APTH:Total_Biaya:Sum REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:APtoAPde.SetQuickScan(1)
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
    APTH:Total_Biaya:Sum += APTO:Biaya
  END
  APTH:Total_Biaya = APTH:Total_Biaya:Sum
  PARENT.ResetFromView
  Relate:APtoAPde.SetQuickScan(0)
  SETCURSOR()


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

UpdateAPtoAPde1 PROCEDURE                                  ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
History::APTO:Record LIKE(APTO:RECORD),THREAD
QuickWindow          WINDOW('Merubah Data Transaksi'),AT(,,261,158),FONT('Arial',8,,),CENTER,IMM,HLP('UpdateAPtoAPde'),SYSTEM,GRAY,MDI
                       PROMPT('No. transaksi :'),AT(139,6),USE(?APTO:N0_tran:Prompt)
                       ENTRY(@s15),AT(189,6,64,10),USE(APTO:N0_tran),MSG('nomor transaksi'),TIP('nomor transaksi'),READONLY
                       SHEET,AT(12,10,244,115),USE(?CurrentTab)
                         TAB('Data Umum'),USE(?Tab:1)
                           PROMPT('Kode Barang :'),AT(16,41),USE(?APTO:Kode_Brg:Prompt)
                           ENTRY(@s10),AT(81,39,44,12),USE(APTO:Kode_Brg)
                           BUTTON('&H'),AT(129,38,12,12),USE(?CallLookup),KEY(F2Key)
                           STRING(@s40),AT(81,61,166,10),USE(GBAR:Nama_Brg)
                           PROMPT('Jumlah:'),AT(16,83),USE(?APTO:Jumlah:Prompt)
                           ENTRY(@n15.2),AT(81,81,60,12),USE(APTO:Jumlah),RIGHT(1)
                           PROMPT('Biaya:'),AT(16,106),USE(?APTO:Biaya:Prompt)
                           ENTRY(@n-15.2),AT(81,104,60,12),USE(APTO:Biaya),RIGHT(2)
                         END
                       END
                       BUTTON('&OK'),AT(119,129,57,25),USE(?OK),LEFT,ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(191,129,57,25),USE(?Cancel),LEFT,KEY(EscKey),ICON('CANCEL.ICO')
                       BUTTON('Help'),AT(73,4,45,14),USE(?Help),STD(STD:Help)
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
    CLEAR(ActionMessage)
  OF ChangeRecord
    CLEAR(ActionMessage)
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  ?OK{PROP:DISABLE}=TRUE
  ?APTO:Biaya{PROP:READONLY}=TRUE
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateAPtoAPde1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APTO:N0_tran:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APTO:Record,History::APTO:Record)
  SELF.AddHistoryField(?APTO:N0_tran,2)
  SELF.AddHistoryField(?APTO:Kode_Brg,1)
  SELF.AddHistoryField(?APTO:Jumlah,3)
  SELF.AddHistoryField(?APTO:Biaya,4)
  SELF.AddUpdateFile(Access:APtoAPde)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:APtoAPde.Open                                     ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:APtoAPde
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.DeleteAction = Delete:Auto                        ! Automatic deletions
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel                      ! No confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateAPtoAPde1',QuickWindow)              ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APtoAPde.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateAPtoAPde1',QuickWindow)           ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = APTO:Kode_Brg                            ! Assign linking field value
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
    CASE ACCEPTED()
    OF ?APTO:Kode_Brg
      GSTO:Kode_Barang=APTO:Kode_Brg
      GSTO:Kode_Apotik='FM07'
      GET(GStokAptk,GSTO:KeyBarang)
      IF ERRORCODE() > 0
                  ?APTO:Jumlah{PROP:DISABLE}=1
                  MESSAGE('Barang tersebut tidak ada dalam Daftar Obat')
                  CLEAR (APTO:Kode_Brg)
                  CLEAR (GBAR:Nama_Brg)
                  DISPLAY
                  SELECT(?APTO:Kode_Brg)
      !            BREAK
      ELSE
          ?APTO:Jumlah{PROP:DISABLE}=0
          select(?APTO:Jumlah)
      END
    OF ?APTO:Jumlah
      IF APTO:Jumlah = 0
          ?OK{PROP:DISABLE}=1
      ELSE
          IF self.request = changerecord
                  GSTO:Kode_Apotik = 'FM07'
                  GSTO:Kode_Barang = APTO:Kode_Brg
                  GET(GStokaptk,GSTO:KeyBarang)
          END
      
          IF APTO:Jumlah > GSTO:Saldo
              MESSAGE('JUMLAH di stok tinggal :'& GSTO:Saldo)
              SELECT(?APTO:Jumlah)
              CYCLE
          END
          ?OK{PROP:DISABLE}=0
          APTO:Biaya = APTO:Jumlah * GSTO:Harga_Dasar
          DISPLAY
      END
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?APTO:Kode_Brg
      IF APTO:Kode_Brg OR ?APTO:Kode_Brg{Prop:Req}
        GBAR:Kode_brg = APTO:Kode_Brg
        IF Access:GBarang.TryFetch(GBAR:KeyKodeBrg)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            APTO:Kode_Brg = GBAR:Kode_brg
          ELSE
            SELECT(?APTO:Kode_Brg)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      GBAR:Kode_brg = APTO:Kode_Brg
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        APTO:Kode_Brg = GBAR:Kode_brg
      END
      ThisWindow.Reset(1)
      !message(APTO:Kode_Brg&' '&APTH:Kode_Apotik)
      GSTO:Kode_Barang=APTO:Kode_Brg
      GSTO:Kode_Apotik='FM07'
      GET(GStokAptk,GSTO:KeyBarang)
      IF ERRORCODE() > 0
                  ?APTO:Jumlah{PROP:DISABLE}=1
                  MESSAGE('Barang tersebut tidak ada dalam Daftar Obat')
                  CLEAR (APTO:Kode_Brg)
                  CLEAR (GBAR:Nama_Brg)
                  DISPLAY
                  SELECT(?APTO:Kode_Brg)
      !            BREAK
      ELSE
          ?APTO:Jumlah{PROP:DISABLE}=0
          select(?APTO:Jumlah)
      END
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

