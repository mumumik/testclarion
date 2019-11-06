

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N011.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N012.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N125.INC'),ONCE        !Req'd for module callout resolution
                     END


Trig_BrowseAntarInstalasi PROCEDURE                        ! Generated from procedure template - Window

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
                         PROJECT(GBAR:Ket2)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
APTO:Kode_Brg          LIKE(APTO:Kode_Brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Ket2              LIKE(GBAR:Ket2)                !List box control field - type derived from field
APTO:Jumlah            LIKE(APTO:Jumlah)              !List box control field - type derived from field
APTO:Biaya             LIKE(APTO:Biaya)               !List box control field - type derived from field
APTO:N0_tran           LIKE(APTO:N0_tran)             !List box control field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Transaksi antar SubInstalasi Farmasi'),AT(,,312,186),FONT('Arial',8,,),CENTER,IMM,HLP('Transaksi_antar_sub'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,244,54),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('64L(2)|FM~No. Transaksi~C@s15@49C|M~Tanggal~@D06@34L(2)|M~Sub Asal~C(0)@s5@41L(2' &|
   ')|M~Sub Dituju~C(0)@s5@56R(1)|M~Total Biaya~L(2)@n-15.2@16R(1)|M~User~L(2)@s4@'),FROM(Queue:Browse:1)
                       BUTTON('&Transaksi (F4)'),AT(264,16,45,37),USE(?Insert:3),ICON(ICON:Application)
                       STRING('Detail Alat-alat yang dikeluarkan'),AT(8,100),USE(?String1),FONT(,,COLOR:Black,FONT:bold+FONT:italic+FONT:underline)
                       LIST,AT(8,111,302,70),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('45L(1)|FM~Kode Barang~C(0)@s10@115L(1)|M~Nama Barang~C(0)@s40@63L(1)|M~Keteranga' &|
   'n~C(0)@s50@50R(1)|M~Jumlah~L(2)@n-14.2@49R(2)|M~Biaya~L@n-15.2@60R(2)|M~N 0 tran' &|
   '~L@s15@'),FROM(Queue:Browse)
                       BUTTON('&Select'),AT(133,0,45,14),USE(?Select:2),HIDE
                       BUTTON('&Change'),AT(165,0,45,14),USE(?Change:3),HIDE,DEFAULT
                       BUTTON('&Delete'),AT(183,0,45,14),USE(?Delete:3),HIDE
                       SHEET,AT(4,2,254,97),USE(?CurrentTab)
                         TAB('Kode Sub Farmasi [F2]'),USE(?Tab:2),KEY(F2Key),COLOR(0FAEFC9H)
                           PROMPT('Kode Sub-Instalasi :'),AT(130,81),USE(?Prompt1)
                           ENTRY(@s5),AT(196,81,,10),USE(loc::kode_sub),FONT('Times New Roman',12,COLOR:Black,)
                         END
                         TAB('No. Transaksi [F3]'),USE(?Tab:3),KEY(F3Key)
                           ENTRY(@s15),AT(191,82,60,10),USE(loc::kode_tran),FONT('Times New Roman',10,COLOR:Black,)
                         END
                       END
                       BUTTON('&Keluar'),AT(264,64,45,37),USE(?Close),ICON(ICON:Cross)
                       BUTTON('Cetak &Detail'),AT(12,76,65,21),USE(?Print),LEFT,FONT('Arial',8,COLOR:Black,),ICON(ICON:Print)
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
  GlobalErrors.SetProcedureName('Trig_BrowseAntarInstalasi')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  loc::thread=glo::mainthreadno
  !POST(EVENT:Disable_AntarApotik,,loc::thread)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:APtoAPde.Open                                     ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
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
  BRW1.SetFilter('(apth:kode_apotik=GL_entryapotik)')      ! Apply filter expression to browse
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon APTH:Kode_Apotik for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,APTH:key_kode_ap) ! Add the sort order for APTH:key_kode_ap for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?loc::kode_sub,APTH:Kode_Apotik,1,BRW1) ! Initialize the browse locator using ?loc::kode_sub using key: APTH:key_kode_ap , APTH:Kode_Apotik
  BRW1.SetFilter('(apth:kode_apotik=GL_entryapotik)')      ! Apply filter expression to browse
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
  BRW6.AddField(GBAR:Ket2,BRW6.Q.GBAR:Ket2)                ! Field GBAR:Ket2 is a hot field or requires assignment from browse
  BRW6.AddField(APTO:Jumlah,BRW6.Q.APTO:Jumlah)            ! Field APTO:Jumlah is a hot field or requires assignment from browse
  BRW6.AddField(APTO:Biaya,BRW6.Q.APTO:Biaya)              ! Field APTO:Biaya is a hot field or requires assignment from browse
  BRW6.AddField(APTO:N0_tran,BRW6.Q.APTO:N0_tran)          ! Field APTO:N0_tran is a hot field or requires assignment from browse
  BRW6.AddField(GBAR:Kode_brg,BRW6.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_BrowseAntarInstalasi',QuickWindow)    ! Restore window settings from non-volatile store
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
    Relate:Nomor_SKR.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_BrowseAntarInstalasi',QuickWindow) ! Save window data to non-volatile store
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
      Trig_UpdateAntarApotik2
      cetak_tran_antar_sub1
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
    OF ?Insert:3
      NOM1:No_urut=4
      access:nomor_skr.fetch(NOM1:PrimaryKey)
      if not(errorcode()) then
         if sub(format(year(today()),@p####p),3,2)<format(sub(clip(NOM1:No_Trans),4,2),@n2) then
            message('Tahun sistem lebih kecil dari tahun penomoran, tidak bisa dilanjutkan !!!')
            cycle
         elsif month(today())<format(sub(clip(NOM1:No_Trans),6,2),@n2) and sub(format(year(today()),@p####p),3,2)=format(sub(clip(NOM1:No_Trans),4,2),@n2) then
            message('Tanggal sistem lebih kecil dari tanggal penomoran, tidak bisa dilanjutkan !!!')
            cycle
         end
      end
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

Cari_apotikInst PROCEDURE                                  ! Generated from procedure template - Window

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
  GlobalErrors.SetProcedureName('Cari_apotikInst')
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
  INIMgr.Fetch('Cari_apotikInst',QuickWindow)              ! Restore window settings from non-volatile store
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
    INIMgr.Update('Cari_apotikInst',QuickWindow)           ! Save window data to non-volatile store
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

