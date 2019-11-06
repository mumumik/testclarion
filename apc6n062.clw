

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N062.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N051.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N121.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N146.INC'),ONCE        !Req'd for module callout resolution
                     END


Trig_BrowseReturRawatInap1 PROCEDURE                       ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
hapus                BYTE                                  !
FilesOpened          BYTE                                  !
Lunas                STRING(5)                             !
Poliklinik           STRING(1)                             !
loc::no_mr           LONG                                  !
BRW1::View:Browse    VIEW(APHTRANS)
                       PROJECT(APH:Nomor_mr)
                       PROJECT(APH:Tanggal)
                       PROJECT(APH:Biaya)
                       PROJECT(APH:N0_tran)
                       PROJECT(APH:Asal)
                       PROJECT(APH:User)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APH:Nomor_mr           LIKE(APH:Nomor_mr)             !List box control field - type derived from field
APH:Tanggal            LIKE(APH:Tanggal)              !List box control field - type derived from field
APH:Biaya              LIKE(APH:Biaya)                !List box control field - type derived from field
APH:N0_tran            LIKE(APH:N0_tran)              !List box control field - type derived from field
APH:N0_tran_NormalFG   LONG                           !Normal forground color
APH:N0_tran_NormalBG   LONG                           !Normal background color
APH:N0_tran_SelectedFG LONG                           !Selected forground color
APH:N0_tran_SelectedBG LONG                           !Selected background color
Lunas                  LIKE(Lunas)                    !List box control field - type derived from local data
Poliklinik             LIKE(Poliklinik)               !List box control field - type derived from local data
APH:Asal               LIKE(APH:Asal)                 !List box control field - type derived from field
APH:User               LIKE(APH:User)                 !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW6::View:Browse    VIEW(APDTRANS)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Total)
                       PROJECT(APD:Diskon)
                       PROJECT(APD:Camp)
                       PROJECT(APD:N0_tran)
                       JOIN(GBAR:KeyKodeBrg,APD:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Ket2)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
APD:Kode_brg           LIKE(APD:Kode_brg)             !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Ket2              LIKE(GBAR:Ket2)                !List box control field - type derived from field
APD:Jumlah             LIKE(APD:Jumlah)               !List box control field - type derived from field
APD:Total              LIKE(APD:Total)                !List box control field - type derived from field
APD:Diskon             LIKE(APD:Diskon)               !List box control field - type derived from field
APD:Camp               LIKE(APD:Camp)                 !List box control field - type derived from field
APD:N0_tran            LIKE(APD:N0_tran)              !List box control field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Pengembalian Obat dari Ruang rawat Inap'),AT(,,457,233),FONT('Times New Roman',8,COLOR:Black,),CENTER,IMM,HLP('Tran_Poliklinik'),ALRT(EscKey),SYSTEM,GRAY,RESIZE,MDI
                       LIST,AT(8,20,435,57),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('58L|FM~Nomor RM~C@N010_@58R(1)|M~Tanggal~C(0)@D8@64R(1)|M~Biaya~C(0)@n-15.2@64L|' &|
   'M*~N 0 tran~C@s15@20L|M~Lunas~@s5@32L|M~Poliklinik~C@s1@44L|M~Asal~@s10@16L|M~Us' &|
   'er~@s4@'),FROM(Queue:Browse:1)
                       LIST,AT(5,127,443,79),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('43L|FM~Kode Barang~C@s10@115L|FM~Nama Obat~C@s40@88L|FM~Keterangan~C@s50@63R(2)|' &|
   'M~Jumlah~C(0)@n-12.2@63R(2)|M~Total~C(0)@n-15.2@60R(2)|M~Diskon~C(0)@n-15.2@60L~' &|
   'Camp~C@n2@60L~N 0 tran~C@s15@'),FROM(Queue:Browse)
                       STRING('BARU'),AT(125,6,40,11),USE(?String1),TRN,FONT('Arial',10,COLOR:Yellow,FONT:bold)
                       BUTTON('T&ransaksi (F4)'),AT(371,82,73,26),USE(?Insert:3),LEFT,FONT('Times New Roman',8,080FF80H,FONT:bold),MSG('Transaksi Pengembalian Barang'),TIP('Transaksi Pengembalian Barang'),KEY(F4Key),ICON(ICON:Open)
                       BUTTON('Cetak &Nota'),AT(83,82,59,26),USE(?Print:2),HIDE,LEFT,FONT('Times New Roman',8,COLOR:Blue,FONT:bold),MSG('Mencetak Nota Pengembalian Uang'),TIP('Cetak Nota Transaksi'),ICON(ICON:Print1)
                       BUTTON('Cetak &Detail'),AT(10,82,59,26),USE(?Print),LEFT,FONT('Times New Roman',8,COLOR:Blue,FONT:bold),MSG('Mencetak Keseluruhan Pengembalian ( SBBM)'),TIP('Cetak SBBM'),ICON(ICON:Print)
                       BUTTON('&Select'),AT(228,43,45,14),USE(?Select:2),HIDE
                       BUTTON('&Change'),AT(178,43,45,14),USE(?Change:3),DISABLE,HIDE,DEFAULT
                       BUTTON('&Delete'),AT(128,43,45,14),USE(?Delete:3),DISABLE,HIDE
                       SHEET,AT(3,4,445,111),USE(?CurrentTab)
                         TAB('No. Nota [F2]'),USE(?Tab:2),KEY(F2Key)
                         END
                         TAB('Rekam Medik [F3]'),USE(?Tab:3),KEY(F3Key)
                         END
                       END
                       STRING('= Retur Obat'),AT(225,3),USE(?String2)
                       ELLIPSE,AT(282,1,19,13),USE(?Ellipse1:2),COLOR(0FF8000H),FILL(0FF8000H)
                       STRING('= KeluarObat'),AT(303,3),USE(?String2:2)
                       ELLIPSE,AT(204,1,19,13),USE(?Ellipse1),COLOR(COLOR:Red),FILL(COLOR:Red)
                       BUTTON('&Keluar'),AT(379,211,65,20),USE(?Close),LEFT,ICON('EXIT5.ICO')
                       BUTTON('Help'),AT(278,43,45,14),USE(?Help),HIDE,STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetFromAsk           PROCEDURE(*BYTE Request,*BYTE Response),DERIVED ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
SetQueueRecord         PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW1::Sort1:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
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

ThisWindow.Ask PROCEDURE

  CODE
  hapus=1
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_BrowseReturRawatInap1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo::no_mr',glo::no_mr)                            ! Added by: BrowseBox(ABC)
  BIND('Lunas',Lunas)                                      ! Added by: BrowseBox(ABC)
  BIND('Poliklinik',Poliklinik)                            ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:APDTRANS.Open                                     ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Aphtransadd.Open                                  ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:RI_HRInap.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:APHTRANS,SELF) ! Initialize the browse manager
  BRW6.Init(?List,Queue:Browse.ViewPosition,BRW6::View:Browse,Queue:Browse,Relate:APDTRANS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon APH:Nomor_mr for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,APH:by_medrec)   ! Add the sort order for APH:by_medrec for sort order 1
  BRW1.SetFilter('(APH:Nomor_mr = glo::no_mr)')            ! Apply filter expression to browse
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon APH:N0_tran for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,APH:by_transaksi) ! Add the sort order for APH:by_transaksi for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,APH:N0_tran,,BRW1)             ! Initialize the browse locator using  using key: APH:by_transaksi , APH:N0_tran
  BRW1.SetFilter('(APH:Nomor_mr = glo::no_mr)')            ! Apply filter expression to browse
  BRW1.AddField(APH:Nomor_mr,BRW1.Q.APH:Nomor_mr)          ! Field APH:Nomor_mr is a hot field or requires assignment from browse
  BRW1.AddField(APH:Tanggal,BRW1.Q.APH:Tanggal)            ! Field APH:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(APH:Biaya,BRW1.Q.APH:Biaya)                ! Field APH:Biaya is a hot field or requires assignment from browse
  BRW1.AddField(APH:N0_tran,BRW1.Q.APH:N0_tran)            ! Field APH:N0_tran is a hot field or requires assignment from browse
  BRW1.AddField(Lunas,BRW1.Q.Lunas)                        ! Field Lunas is a hot field or requires assignment from browse
  BRW1.AddField(Poliklinik,BRW1.Q.Poliklinik)              ! Field Poliklinik is a hot field or requires assignment from browse
  BRW1.AddField(APH:Asal,BRW1.Q.APH:Asal)                  ! Field APH:Asal is a hot field or requires assignment from browse
  BRW1.AddField(APH:User,BRW1.Q.APH:User)                  ! Field APH:User is a hot field or requires assignment from browse
  BRW6.Q &= Queue:Browse
  BRW6.AddSortOrder(,APD:notran_kode)                      ! Add the sort order for APD:notran_kode for sort order 1
  BRW6.AddRange(APD:N0_tran,Relate:APDTRANS,Relate:APHTRANS) ! Add file relationship range limit for sort order 1
  BRW6.AddLocator(BRW6::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW6::Sort0:Locator.Init(,APD:Kode_brg,,BRW6)            ! Initialize the browse locator using  using key: APD:notran_kode , APD:Kode_brg
  BRW6.AddField(APD:Kode_brg,BRW6.Q.APD:Kode_brg)          ! Field APD:Kode_brg is a hot field or requires assignment from browse
  BRW6.AddField(GBAR:Nama_Brg,BRW6.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW6.AddField(GBAR:Ket2,BRW6.Q.GBAR:Ket2)                ! Field GBAR:Ket2 is a hot field or requires assignment from browse
  BRW6.AddField(APD:Jumlah,BRW6.Q.APD:Jumlah)              ! Field APD:Jumlah is a hot field or requires assignment from browse
  BRW6.AddField(APD:Total,BRW6.Q.APD:Total)                ! Field APD:Total is a hot field or requires assignment from browse
  BRW6.AddField(APD:Diskon,BRW6.Q.APD:Diskon)              ! Field APD:Diskon is a hot field or requires assignment from browse
  BRW6.AddField(APD:Camp,BRW6.Q.APD:Camp)                  ! Field APD:Camp is a hot field or requires assignment from browse
  BRW6.AddField(APD:N0_tran,BRW6.Q.APD:N0_tran)            ! Field APD:N0_tran is a hot field or requires assignment from browse
  BRW6.AddField(GBAR:Kode_brg,BRW6.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_BrowseReturRawatInap1',QuickWindow)   ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW6.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW6.ToolbarItem.HelpButton = ?Help
  BRW1.PrintProcedure = 2
  BRW1.PrintControl = ?Print
  BRW6.PrintProcedure = 3
  BRW6.PrintControl = ?Print:2
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:Aphtransadd.Close
    Relate:Nomor_SKR.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_BrowseReturRawatInap1',QuickWindow) ! Save window data to non-volatile store
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
    EXECUTE Number
      Trig_UpdateReturRawatInap1
      PrintReturRawatInap1
      Cetak_nota_apotik12
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
      NOM1:No_urut=1
      access:nomor_skr.fetch(NOM1:PrimaryKey)
      if not(errorcode()) then
         if sub(format(year(today()),@p####p),3,2)<format(sub(clip(NOM1:No_Trans),4,2),@n2) then
            message('Tanggal sistem lebih kecil dari tanggal penomoran, tidak bisa dilanjutkan !!!')
            cycle
         elsif month(today())<format(sub(clip(NOM1:No_Trans),6,2),@n2) and sub(format(year(today()),@p####p),3,2)=format(sub(clip(NOM1:No_Trans),4,2),@n2) then
            message('Tanggal sistem lebih kecil dari tanggal penomoran, tidak bisa dilanjutkan !!!')
            cycle
         end
      end
      
      
      hapus=0
    OF ?Close
      hapus=1
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
      select(?close)
      presskey( 13)
    OF EVENT:CloseWindow
      if hapus=1
         apkemtmp{prop:sql}='delete from dba.apkemtmp where Nomor_mr='''&Glo::no_mr&''''
      end
    END
  ReturnValue = PARENT.TakeWindowEvent()
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


BRW1.ResetFromAsk PROCEDURE(*BYTE Request,*BYTE Response)

  CODE
  PARENT.ResetFromAsk(Request,Response)
  if request=1 and response=1 then
     RI_HR:Nomor_mr       =APH:Nomor_mr
     RI_HR:Status_Keluar  =0
     if access:ri_hrinap.fetch(RI_HR:KNomr_status)=level:benign then
        APH1:Nomor    =APH:N0_tran
        APH1:Ruangan  =RI_HR:LastRoom
        access:aphtransadd.insert()
     end
     glo::no_nota=APH:N0_tran
     Print_ReturRawatInap
  end


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


BRW1.SetQueueRecord PROCEDURE

  CODE
  IF (APH:Ra_jal = 1)
    Poliklinik = 'Y'
  ELSE
    Poliklinik = 'N'
  END
  IF (APH:Bayar = 1)
    Lunas = 'Lunas'
  ELSE
    Lunas = 'Belum'
  END
  PARENT.SetQueueRecord
  
  IF (aph:biaya<0)
    SELF.Q.APH:N0_tran_NormalFG = 255                      ! Set conditional color values for APH:N0_tran
    SELF.Q.APH:N0_tran_NormalBG = -1
    SELF.Q.APH:N0_tran_SelectedFG = 255
    SELF.Q.APH:N0_tran_SelectedBG = -1
  ELSIF (aph:biaya>=0)
    SELF.Q.APH:N0_tran_NormalFG = 16744448                 ! Set conditional color values for APH:N0_tran
    SELF.Q.APH:N0_tran_NormalBG = -1
    SELF.Q.APH:N0_tran_SelectedFG = 16744448
    SELF.Q.APH:N0_tran_SelectedBG = -1
  ELSE
    SELF.Q.APH:N0_tran_NormalFG = -1                       ! Set color values for APH:N0_tran
    SELF.Q.APH:N0_tran_NormalBG = -1
    SELF.Q.APH:N0_tran_SelectedFG = -1
    SELF.Q.APH:N0_tran_SelectedBG = -1
  END
  SELF.Q.Lunas = Lunas                                     !Assign formula result to display queue
  SELF.Q.Poliklinik = Poliklinik                           !Assign formula result to display queue


BRW6.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

Cetak_nota_apotik12 PROCEDURE                              ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
FilesOpened          BYTE                                  !
Process:View         VIEW(APHTRANS)
                       PROJECT(APH:Asal)
                       PROJECT(APH:Biaya)
                       PROJECT(APH:Kode_Apotik)
                       PROJECT(APH:N0_tran)
                       PROJECT(APH:Nomor_mr)
                       PROJECT(APH:Tanggal)
                       PROJECT(APH:User)
                       JOIN(JPas:KeyNomorMr,APH:Nomor_mr)
                         PROJECT(JPas:Nama)
                       END
                       JOIN(GAPO:KeyNoApotik,APH:Kode_Apotik)
                         PROJECT(GAPO:Nama_Apotik)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(500,104,6000,5844),PAPER(PAPER:USER,4000,12000),PRE(RPT),FONT('Times New Roman',10,COLOR:Black,),THOUS
detail1                DETAIL,AT(10,10,3167,2063),USE(?detail1)
                         STRING('Ins. Farmasi RSI -- SBBM dari ruangan'),AT(73,31),USE(?String21),TRN,FONT('Times New Roman',8,,)
                         STRING(@s5),AT(1958,177,438,167),USE(APH:Kode_Apotik),LEFT,FONT('Times New Roman',8,,FONT:italic)
                         STRING('Pengembalian Obat Rawat Inap'),AT(63,177,1583,177),LEFT,FONT('Times New Roman',8,,)
                         BOX,AT(63,594,2385,271),USE(?Box1),COLOR(COLOR:Black)
                         LINE,AT(52,365,2656,0),USE(?Line2),COLOR(COLOR:Black),LINEWIDTH(2)
                         STRING('No. RM :'),AT(63,406,500,167),TRN,FONT('Times New Roman',8,,)
                         STRING(@N010_),AT(563,417,771,167),USE(APH:Nomor_mr),FONT('Times New Roman',8,,)
                         STRING(@s10),AT(1573,406),USE(APH:Asal),FONT('Times New Roman',8,,)
                         STRING(@s35),AT(104,635,2250,188),USE(JPas:Nama),FONT('Times New Roman',8,,)
                         STRING(@n-14),AT(1510,875,865,177),USE(APH:Biaya),RIGHT(1),FONT('Times New Roman',8,,)
                         STRING('Pengurangan Biaya  :  Rp.'),AT(63,885,1323,167),TRN,FONT('Times New Roman',8,,)
                         STRING(@s15),AT(948,1042,1188,167),USE(APH:N0_tran),FONT('Times New Roman',8,,)
                         STRING('No. Transaksi  :'),AT(63,1042,854,167),TRN,FONT('Times New Roman',8,,)
                         STRING('Bandung, '),AT(1167,1365),USE(?String16),TRN,FONT('Times New Roman',8,,)
                         STRING(@D8),AT(1719,1375,750,167),USE(APH:Tanggal),RIGHT(1),FONT('Times New Roman',8,,)
                         STRING(@s30),AT(615,1208,1979,188),USE(GAPO:Nama_Apotik),FONT('Times New Roman',8,,)
                         STRING('Penanggung Jawab'),AT(1448,1531,1010,167),TRN,FONT('Times New Roman',8,,)
                         STRING(@s4),AT(1698,1781,469,167),USE(APH:User),FONT('Times New Roman',8,,)
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
  GlobalErrors.SetProcedureName('Cetak_nota_apotik12')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:APHTRANS.Open                                     ! File APHTRANS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Cetak_nota_apotik12',ProgressWindow)       ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:APHTRANS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, APH:N0_tran)
  ThisReport.AddSortOrder(APH:by_transaksi)
  ThisReport.AddRange(APH:N0_tran,APH:N0_tran)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  Relate:APHTRANS.SetQuickScan(1,Propagate:OneMany)
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
    Relate:APHTRANS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Cetak_nota_apotik12',ProgressWindow)    ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  JPas:Nomor_mr = APH:Nomor_mr                             ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
  GAPO:Kode_Apotik = APH:Kode_Apotik                       ! Assign linking field value
  Access:GApotik.Fetch(GAPO:KeyNoApotik)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  JPas:Nomor_mr = APH:Nomor_mr                             ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)
  GAPO:Kode_Apotik = APH:Kode_Apotik                       ! Assign linking field value
  Access:GApotik.Fetch(GAPO:KeyNoApotik)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail1)
  RETURN ReturnValue

Trig_UpdateReturRawatInapDetil1 PROCEDURE                  ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
loc::total           REAL                                  !
loc::diskon_pct      REAL                                  !
VIEW::stok_apotik VIEW(GStokAptk)
    Project (GSTO:Kode_Apotik)
    end
History::APD:Record  LIKE(APD:RECORD),THREAD
QuickWindow          WINDOW('Tambah Data Transaksi'),AT(,,207,154),FONT('MS Sans Serif',10,COLOR:Black,),IMM,HLP('UpdateAPDTRANS'),SYSTEM,GRAY,RESIZE,MDI
                       SHEET,AT(4,4,201,116),USE(?CurrentTab),COLOR(0D1C130H)
                         TAB('Data'),USE(?Tab:1)
                           STRING('BARU'),AT(32,5),USE(?String2),TRN,FONT(,,COLOR:Yellow,FONT:bold)
                           PROMPT('N0 tran:'),AT(84,2),USE(?APD:N0_tran:Prompt),TRN
                           ENTRY(@s15),AT(111,2,48,10),USE(APD:N0_tran),MSG('nomor transaksi'),TIP('nomor transaksi'),READONLY
                           PROMPT('Kode Barang:'),AT(8,20),USE(?APD:Kode_brg:Prompt)
                           ENTRY(@s10),AT(60,20,48,10),USE(APD:Kode_brg),SKIP,MSG('Kode Barang'),TIP('Kode Barang'),READONLY
                           BUTTON('&K'),AT(110,19,12,12),USE(?CallLookup),KEY(F2Key)
                           PROMPT('Nama Barang'),AT(8,35),USE(?Prompt4)
                           STRING(@s40),AT(60,35),USE(GBAR:Nama_Brg)
                           PROMPT('Jumlah:'),AT(8,48),USE(?APD:Jumlah:Prompt)
                           ENTRY(@n15.2),AT(61,48,48,10),USE(APD:Jumlah),RIGHT,MSG('Jumlah'),TIP('Jumlah')
                           PROMPT('Harga :'),AT(8,64),USE(?APD:Total:Prompt)
                           ENTRY(@n-15.2),AT(61,64,48,10),USE(APD:Total),RIGHT,MSG('Harga Dasar'),TIP('Harga Dasar'),READONLY
                           PROMPT('Diskon:'),AT(8,80),USE(?APD:Diskon:Prompt)
                           PROMPT('%'),AT(54,80),USE(?loc::diskon_pct:Prompt)
                           ENTRY(@n-10.2),AT(33,80,20,10),USE(loc::diskon_pct),RIGHT(2)
                           ENTRY(@n-15.2),AT(61,80,48,10),USE(APD:Diskon),RIGHT
                           PROMPT('Total:'),AT(8,96),USE(?loc::total:Prompt)
                           ENTRY(@n-15.2),AT(61,96,48,10),USE(loc::total),RIGHT,READONLY
                         END
                       END
                       BUTTON('&OK [End]'),AT(36,127,59,24),USE(?OK),LEFT,KEY(EndKey),ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(116,127,59,24),USE(?Cancel),LEFT,ICON(ICON:Cross)
                       BUTTON('Help'),AT(157,1,45,14),USE(?Help),HIDE,STD(STD:Help)
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

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Adding a APDTRANS Record'
  OF ChangeRecord
    ActionMessage = 'Changing a APDTRANS Record'
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  ?OK{PROP:DISABLE}=TRUE
  ?APD:Total{PROP:READONLY}=TRUE
  if APD:Diskon<>0 then
     loc::diskon_pct=(APD:Diskon*100)/APD:Total
  end
  loc::total=APD:Total-APD:Diskon
  DISPLAY
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_UpdateReturRawatInapDetil1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?String2
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APD:Record,History::APD:Record)
  SELF.AddHistoryField(?APD:N0_tran,1)
  SELF.AddHistoryField(?APD:Kode_brg,2)
  SELF.AddHistoryField(?APD:Jumlah,3)
  SELF.AddHistoryField(?APD:Total,4)
  SELF.AddHistoryField(?APD:Diskon,7)
  SELF.AddUpdateFile(Access:APDTRANS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:APDTRANS.Open                                     ! File APkemtmp used by this procedure, so make sure it's RelationManager is open
  Relate:APkemtmp.Open                                     ! File APkemtmp used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:APDTRANS
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_UpdateReturRawatInapDetil1',QuickWindow) ! Restore window settings from non-volatile store
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
    Relate:APDTRANS.Close
    Relate:APkemtmp.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_UpdateReturRawatInapDetil1',QuickWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
    APD:Diskon = 0
  PARENT.PrimeFields


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = APD:Kode_brg                             ! Assign linking field value
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
    Cari_diGbarang
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
    OF ?APD:Kode_brg
      APKT:Kode_brg=APD:Kode_brg
      APKT:Nomor_mr=Glo::no_mr
      GET(APkemtmp,APKT:key_no_mr)
      IF ERRORCODE() = 35
          MESSAGE('Barang tidak ada Dalam daftar Pengeluaran')
          ?APD:Jumlah{PROP:DISABLE}=1
          CLEAR (APD:Kode_brg )
          CLEAR (GBAR:Nama_Brg)
          DISPLAY
          SELECT(?APD:Kode_brg)
      ELSE
          ?APD:Jumlah{PROP:DISABLE}=0
      END
    OF ?APD:Jumlah
      IF APD:Jumlah = 0
          ?OK{PROP:DISABLE}=1
      ELSE
          !message(APD:Jumlah&' '&(APKT:Jumlah*-1)&' '&APKT:Jumlah)
          IF APD:Jumlah >(APKT:Jumlah)
              !message(APD:Jumlah&' aaa '&(APKT:Jumlah))
              MESSAGE ('Jumlah Pengembalian maximum : '&APKT:Jumlah )
              ?OK{PROP:DISABLE}=1
          ELSE
              ?OK{PROP:DISABLE}=0
          END
      END
      APD:Harga_Dasar = abs(APKT:Harga_Dasar_benar)*-1
      APD:Total       = abs(APKT:Harga_Dasar)*APD:Jumlah*-1
      if APD:Diskon<>0 then
         loc::diskon_pct=(APD:Diskon*100)/APD:Total
         loc::total     =APD:Total-APD:Diskon
      else
         loc::total     =APD:Total
      end
      DISPLAY
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?APD:Kode_brg
      IF APD:Kode_brg OR ?APD:Kode_brg{Prop:Req}
        GBAR:Kode_brg = APD:Kode_brg
        IF Access:GBarang.TryFetch(GBAR:KeyKodeBrg)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            APD:Kode_brg = GBAR:Kode_brg
          ELSE
            SELECT(?APD:Kode_brg)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      GBAR:Kode_brg = APD:Kode_brg
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        APD:Kode_brg = GBAR:Kode_brg
      END
      ThisWindow.Reset(1)
      display
      APKT:Kode_brg=GBAR:Kode_brg
      APKT:Nomor_mr=Glo::no_mr
      GET(APkemtmp,APKT:key_no_mr)
      IF ERRORCODE() = 35
          MESSAGE('Barang tidak ada Dalam daftar Pengeluaran')
          ?APD:Jumlah{PROP:DISABLE}=1
          CLEAR (APD:Kode_brg )
          CLEAR (GBAR:Nama_Brg)
          DISPLAY
          SELECT(?APD:Kode_brg)
      ELSE
          ?APD:Jumlah{PROP:DISABLE}=0
      END
    OF ?loc::diskon_pct
      if loc::diskon_pct<>0 then
         APD:Diskon=(APD:Total*loc::diskon_pct)/100
         loc::total=APD:Total-APD:Diskon
      else
         loc::total=APD:Total
      end
      DISPLAY
    OF ?APD:Diskon
      if APD:Diskon<>0 then
         loc::diskon_pct=(APD:Diskon*100)/APD:Total
         loc::total=APD:Total-APD:Diskon
      else
         loc::total=APD:Total
      end
      DISPLAY
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

Trig_UpdateReturRawatInap1 PROCEDURE                       ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
sudah_nomor          BYTE                                  !
Tahun_ini            LONG                                  !
putar                ULONG                                 !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
LOC::Status          STRING(10)                            !
vl_nomor             STRING(15)                            !
loc::total           REAL                                  !
loc::diskon          REAL                                  !
BRW4::View:Browse    VIEW(APDTRANS)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Total)
                       PROJECT(APD:Diskon)
                       PROJECT(APD:N0_tran)
                       PROJECT(APD:Camp)
                       JOIN(GBAR:KeyKodeBrg,APD:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Ket2)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse:4       QUEUE                            !Queue declaration for browse/combo box using ?Browse:4
APD:Kode_brg           LIKE(APD:Kode_brg)             !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Ket2              LIKE(GBAR:Ket2)                !List box control field - type derived from field
APD:Jumlah             LIKE(APD:Jumlah)               !List box control field - type derived from field
APD:Total              LIKE(APD:Total)                !List box control field - type derived from field
APD:Diskon             LIKE(APD:Diskon)               !List box control field - type derived from field
APD:N0_tran            LIKE(APD:N0_tran)              !List box control field - type derived from field
APD:Camp               LIKE(APD:Camp)                 !Primary key field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::APH:Record  LIKE(APH:RECORD),THREAD
QuickWindow          WINDOW('Pengembalian obat Rawat Inap ke Farmasi'),AT(,,456,225),FONT('Times New Roman',8,COLOR:Black,),CENTER,IMM,HLP('UpdateAPHTRANS'),ALRT(EscKey),TIMER(100),GRAY,RESIZE,MDI
                       ENTRY(@D8),AT(341,2,104,13),USE(APH:Tanggal),DISABLE,RIGHT(1),FONT('Times New Roman',12,,),MSG('Tanggal berobat pasen'),TIP('Tanggal berobat pasen')
                       SHEET,AT(8,5,440,93),USE(?CurrentTab)
                         TAB('Rawat Inap'),USE(?Tab:1),FONT('Times New Roman',10,,)
                           STRING('BARU'),AT(62,6,28,10),USE(?String10),FONT('Arial',10,COLOR:Yellow,FONT:bold)
                           BOX,AT(13,25,207,26),USE(?Box1),ROUND,COLOR(040FF00H)
                           PROMPT('Ruang Rawat :'),AT(227,28,67,10),USE(?Prompt11),FONT('Times New Roman',12,COLOR:Navy,FONT:bold+FONT:italic+FONT:underline)
                           STRING(@s20),AT(302,30,71,10),USE(ITbr:NAMA_RUANG),FONT('Times New Roman',10,,)
                           BOX,AT(13,55,207,34),USE(?Box2),ROUND,COLOR(040FF00H)
                           STRING('Nomor RM :'),AT(37,30),USE(?String6),FONT('Arial Black',12,COLOR:Purple,)
                           STRING(@N010_),AT(123,30),USE(JPas:Nomor_mr),FONT('Arial Black',12,,)
                           PROMPT('Nama  :'),AT(19,59),USE(?Prompt5),FONT(,,,FONT:bold)
                           STRING(@s35),AT(69,59,147,10),USE(JPas:Nama)
                           PROMPT('NIP:'),AT(252,64),USE(?APH:NIP:Prompt)
                           ENTRY(@s7),AT(271,64,39,11),USE(APH:NIP),DISABLE
                           PROMPT('Kontrak:'),AT(316,64),USE(?APH:Kontrak:Prompt)
                           ENTRY(@s10),AT(351,64,45,11),USE(APH:Kontrak),DISABLE
                           PROMPT('Status     :'),AT(229,43),USE(?Prompt12)
                           STRING(@n1),AT(268,43),USE(APH:cara_bayar)
                           STRING('['),AT(287,43),USE(?String3)
                           STRING(@s10),AT(298,43),USE(LOC::Status)
                           STRING(']'),AT(346,43),USE(?String5)
                           PROMPT('Alamat :'),AT(19,75),USE(?Prompt6),FONT(,,,FONT:bold)
                           STRING(@s35),AT(69,75,147,10),USE(JPas:Alamat)
                           OPTION('Lama Baru'),AT(343,76,94,19),USE(APH:LamaBaru),DISABLE,BOXED
                             RADIO('Lama'),AT(353,83),USE(?Option1:Radio1),VALUE('0')
                             RADIO('Baru'),AT(391,83),USE(?Option1:Radio2),VALUE('1')
                           END
                           PROMPT('Kode Apotik:'),AT(222,80),USE(?APH:Kode_Apotik:Prompt)
                           ENTRY(@s5),AT(271,80,39,11),USE(APH:Kode_Apotik),DISABLE,MSG('Kode Apotik'),TIP('Kode Apotik')
                         END
                       END
                       PROMPT('&TANGGAL:'),AT(287,5),USE(?APH:Tanggal:Prompt)
                       PROMPT('N0 tran:'),AT(9,204),USE(?APH:N0_tran:Prompt),FONT('Times New Roman',12,,FONT:bold+FONT:italic+FONT:underline)
                       ENTRY(@s15),AT(49,203,95,13),USE(APH:N0_tran),DISABLE,FONT('Arial',12,,FONT:bold),MSG('nomor transaksi'),TIP('nomor transaksi')
                       LINE,AT(280,206,163,0),USE(?Line1),COLOR(COLOR:Black),LINEWIDTH(2)
                       LIST,AT(8,103,440,68),USE(?Browse:4),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('55L|FM~Kode Barang~@s10@133L|M~Nama Obat~C@s40@101L|M~Keterangan~C@s50@65D(14)|M' &|
   '~Jumlah~C(0)@n10.2@77D(14)|M~Total~C(0)@n-14.2@60R(14)|M~Diskon~C(0)@n-15.2@60D(' &|
   '14)|M~N 0 tran~C(0)@s15@'),FROM(Queue:Browse:4)
                       PROMPT('Total :'),AT(283,209),USE(?APH:Biaya:Prompt),FONT('Times New Roman',14,,FONT:bold+FONT:italic)
                       ENTRY(@n-15.2),AT(335,209,97,14),USE(APH:Biaya),DISABLE,RIGHT(1),MSG('Total Biaya Pembelian'),TIP('Total Biaya Pembelian')
                       PANEL,AT(7,200,139,19),USE(?Panel2)
                       BUTTON('&OK [End]'),AT(205,185,45,34),USE(?OK),FONT('Times New Roman',10,,),KEY(EndKey),ICON(ICON:Tick),DEFAULT
                       PROMPT('Diskon:'),AT(283,190),USE(?loc::diskon:Prompt)
                       ENTRY(@n-15.2),AT(335,190,95,13),USE(loc::diskon),DISABLE,DECIMAL(14)
                       BUTTON('&Batal'),AT(148,185,45,34),USE(?Cancel),FONT('Times New Roman',12,,),ICON(ICON:Cross)
                       BUTTON('&Tambah Obat (+)'),AT(7,176,127,19),USE(?Insert:5),FONT('Times New Roman',10,,FONT:bold),KEY(PlusKey)
                       PROMPT('Sub Total:'),AT(283,174),USE(?loc::total:Prompt)
                       ENTRY(@n-15.2),AT(335,174,95,13),USE(loc::total),DISABLE,DECIMAL(14)
                       BUTTON('&Change'),AT(113,0,45,14),USE(?Change:5),HIDE
                       BUTTON('&Delete'),AT(165,0,45,14),USE(?Delete:5),HIDE
                       BUTTON('Help'),AT(225,0,45,14),USE(?Help),HIDE,STD(STD:Help)
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
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Update                 PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW4                 CLASS(BrowseClass)                    ! Browse using ?Browse:4
Q                      &Queue:Browse:4                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetFromView          PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW4::Sort0:StepClass StepStringClass                      ! Default Step Manager
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
BATAL_D_UTAMA ROUTINE
    SET( BRW4::View:Browse)
    LOOP
        NEXT( BRW4::View:Browse)
        IF ERRORCODE() > 0 THEN BREAK.
        DELETE( BRW4::View:Browse)
    END

!Proses Penomoran Otomatis Transaksi
Isi_Nomor Routine
   vl_nomor=''
   display
   loop
      logout(1,nomor_batal)
      if errorcode()=56 then
         cycle.
      !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
      NOM:No_Urut=1
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
         NOMU:Urut =1
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
        NOM1:No_urut=1
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
           NOMU:Urut =1
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
      nomor_batal{prop:sql}='delete dba.nomor_batal where No=1'
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 1=Transaksi Apotik ke pasien Rawat Inap
         NOM1:No_urut=1
         access:nomor_skr.fetch(NOM1:PrimaryKey)
         if not(errorcode()) then
            vl_nomor =NOM1:No_Trans
            NOM1:No_Trans=sub(vl_nomor,1,3)&sub(format(year(today()),@p####p),4,2)&format(month(today()),@p##p)&'00002'
            access:nomor_skr.update()
            if errorcode()<>0 then
               rollback
               cycle
            else
               vl_nomor=sub(vl_nomor,1,3)&sub(format(year(today()),@p####p),4,2)&format(month(today()),@p##p)&'00001'
               commit
            end
         end
         break
      end
   end
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   APH:N0_tran=vl_nomor
   display

Batal_Nomor Routine
   !Silahkan diganti ---> 1=Transaksi Apotik ke Ruangan
   NOM:No_Urut =1
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=APH:N0_tran
   NOM:Keterangan='Retur R. Inap'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 1=Transaksi Apotik ke Ruangan
   NOMU:Urut =1
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOMU:Nomor=APH:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   delete(nomoruse)

hapus_nomor_use routine
   NOMU:Urut    =1
   NOMU:Nomor   =APH:N0_tran
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
  ?OK{PROP:DISABLE}=TRUE
  sudah_nomor=0
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_UpdateReturRawatInap1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APH:Tanggal
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APH:Record,History::APH:Record)
  SELF.AddHistoryField(?APH:Tanggal,2)
  SELF.AddHistoryField(?APH:NIP,13)
  SELF.AddHistoryField(?APH:Kontrak,14)
  SELF.AddHistoryField(?APH:cara_bayar,9)
  SELF.AddHistoryField(?APH:LamaBaru,15)
  SELF.AddHistoryField(?APH:Kode_Apotik,10)
  SELF.AddHistoryField(?APH:N0_tran,4)
  SELF.AddHistoryField(?APH:Biaya,3)
  SELF.AddUpdateFile(Access:APHTRANS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:APDTRANS.Open                                     ! File Aphtransadd used by this procedure, so make sure it's RelationManager is open
  Relate:APkemtmp.Open                                     ! File Aphtransadd used by this procedure, so make sure it's RelationManager is open
  Relate:Ano_pakai.Open                                    ! File Aphtransadd used by this procedure, so make sure it's RelationManager is open
  Relate:Aphtransadd.Open                                  ! File Aphtransadd used by this procedure, so make sure it's RelationManager is open
  Relate:IAP_SET.Open                                      ! File Aphtransadd used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File Aphtransadd used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_Batal.Open                                  ! File Aphtransadd used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File Aphtransadd used by this procedure, so make sure it's RelationManager is open
  Relate:Tbstawal.Open                                     ! File Aphtransadd used by this procedure, so make sure it's RelationManager is open
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKelPeg.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITbrRwt.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:IPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITrPasen.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITbKelas.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:RI_HRInap.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:RI_PinRuang.UseFile                               ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:APHTRANS
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
  !!!MEDENNNNNNIIII
  JPas:Nomor_mr=Glo::no_mr
  GET(JPasien,JPas:KeyNomorMr)
  
  !message('select * from dba.ri_hrinap where nomor_mr='&Glo::no_mr&' order by NoUrut desc')
  ri_hrinap{prop:sql}='select * from dba.ri_hrinap where nomor_mr='&Glo::no_mr&' order by NoUrut desc'
  ri_hrinap{prop:sql}='select * from dba.ri_hrinap where nomor_mr='&Glo::no_mr&' order by NoUrut desc'
  access:ri_hrinap.next()
  
  IF RI_HR:Pembayaran= 3
      IDtK:Nomor_mr = Glo::no_mr
      GET(IDataKtr,IDtK:KeyNomorMr)
      LOC::Status = 'Kontraktor'
  ELSIF RI_HR:Pembayaran = 2
      LOC::Status = 'Tunai'
  ELSIF RI_HR:Pembayaran = 1
      LOC::Status = 'Pegawai'
  END
  
  
  !message('select * from dba.ri_pinruang where nomor_mr='&RI_HR:Nomor_mr&' and nourut='&RI_HR:NoUrut&' order by Tanggal_Masuk,Jam_Masuk desc')
  ri_pinruang{prop:sql}='select * from dba.ri_pinruang where nomor_mr='&RI_HR:Nomor_mr&' and nourut='&RI_HR:NoUrut&' order by Tanggal_Masuk desc,Jam_Masuk desc'
  ri_pinruang{prop:sql}='select * from dba.ri_pinruang where nomor_mr='&RI_HR:Nomor_mr&' and nourut='&RI_HR:NoUrut&' order by Tanggal_Masuk desc,Jam_Masuk desc'
  access:ri_pinruang.next()
     
  IF RI_PI:Status=1
     !message(RI_PI:Ruang)
     ?BROWSE:4{PROP:DISABLE}=0
     ?Insert:5{PROP:DISABLE}=0
     ITbr:KODE_RUANG=RI_PI:Ruang
     GET(ITbrRwt,ITbr:KeyKodeRuang)
     ITbk:KodeKelas=ITbr:KODEKelas
     GET(ITbKelas,ITbk:KeyKodeKelas)
     status = CLIP(ITbk:Kelas)
  end
  
  BRW4.Init(?Browse:4,Queue:Browse:4.ViewPosition,BRW4::View:Browse,Queue:Browse:4,Relate:APDTRANS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  APH:NIP=RI_HR:NIP
  APH:Kontrak=RI_HR:Kontraktor
  APH:LamaBaru=RI_HR:LamaBaru
  APH:cara_bayar=RI_HR:Pembayaran
  APH:Urut    =RI_HR:NoUrut
  display
  if self.request=1 then
     do isi_nomor
  end
  ?Browse:4{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW4.Q &= Queue:Browse:4
  BRW4::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon APD:Kode_brg for sort order 1
  BRW4.AddSortOrder(BRW4::Sort0:StepClass,APD:notran_kode) ! Add the sort order for APD:notran_kode for sort order 1
  BRW4.AddRange(APD:N0_tran,Relate:APDTRANS,Relate:APHTRANS) ! Add file relationship range limit for sort order 1
  BRW4.AddField(APD:Kode_brg,BRW4.Q.APD:Kode_brg)          ! Field APD:Kode_brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Nama_Brg,BRW4.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Ket2,BRW4.Q.GBAR:Ket2)                ! Field GBAR:Ket2 is a hot field or requires assignment from browse
  BRW4.AddField(APD:Jumlah,BRW4.Q.APD:Jumlah)              ! Field APD:Jumlah is a hot field or requires assignment from browse
  BRW4.AddField(APD:Total,BRW4.Q.APD:Total)                ! Field APD:Total is a hot field or requires assignment from browse
  BRW4.AddField(APD:Diskon,BRW4.Q.APD:Diskon)              ! Field APD:Diskon is a hot field or requires assignment from browse
  BRW4.AddField(APD:N0_tran,BRW4.Q.APD:N0_tran)            ! Field APD:N0_tran is a hot field or requires assignment from browse
  BRW4.AddField(APD:Camp,BRW4.Q.APD:Camp)                  ! Field APD:Camp is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Kode_brg,BRW4.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_UpdateReturRawatInap1',QuickWindow)   ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW4.AskProcedure = 1
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
  BRW4.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW4.ToolbarItem.HelpButton = ?Help
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  if (self.request=1 and self.response=2) or (self.request=3 and self.response=1) then
     do batal_nomor
     DO BATAL_D_UTAMA
  end
  if self.request=1 and self.response=1 then
     do hapus_nomor_use
  end
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:APkemtmp.Close
    Relate:Ano_pakai.Close
    Relate:Aphtransadd.Close
    Relate:IAP_SET.Close
    Relate:NomorUse.Close
    Relate:Nomor_Batal.Close
    Relate:Nomor_SKR.Close
    Relate:Tbstawal.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_UpdateReturRawatInap1',QuickWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
    APH:Tanggal = Today()
    APH:Kode_Apotik = GL_entryapotik
    APH:Jam = clock()
  PARENT.PrimeFields


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  PEGA:Nik = APH:NIP                                       ! Assign linking field value
  Access:SMPegawai.Fetch(PEGA:Pkey)
  JKon:KODE_KTR = APH:Kontrak                              ! Assign linking field value
  Access:JKontrak.Fetch(JKon:KeyKodeKtr)
  APH:Biaya = loc::total - loc::diskon
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
    Trig_UpdateReturRawatInapDetil1
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
      ri_hrinap{prop:sql}='select * from dba.ri_hrinap where nomor_mr='&JPas:Nomor_mr&' order by NoUrut desc'
      ri_hrinap{prop:sql}='select * from dba.ri_hrinap where nomor_mr='&JPas:Nomor_mr&' order by NoUrut desc'
      if access:ri_hrinap.next()=level:benign then
         if RI_HR:No_Nota<>'' or RI_HR:statusbayar=1 then
            message('Nota sudah tutup, transaksikan tidak dapat diteruskan !!!')
            cycle
         end
      end
      
      glo::no_nota = APH:N0_tran
      
      ! *****UNTUK file ApHTrans******
      APH:User=Glo:USER_ID
      APH:Asal = RI_PI:Ruang
      APH:Bayar=0
      APH:Ra_jal=0
      !APH:cara_bayar=JPas:Jenis_Pasien
      APH:Kode_Apotik=GL_entryapotik
      APH:Nomor_mr=Glo::no_mr
      !APH:Biaya = APH:Biaya
      
      !*****untuk file ApDTrans
      !cek dulu bulannya ya, kalau sudah berubah, tulis dulu ke file awal bulan
      IF MONTH(glo::tgl_awal_kerja) = MONTH(TODAY())
      ELSE
          !Untuk file apHtrans
          APH:Tanggal = TODAY()
          Tahun_ini = YEAR(TODAY())
      
          !untuk file ApDTrans
          SET(APDTRANS)
          APD:N0_tran = APH:N0_tran
          SET(APD:by_transaksi,APD:by_transaksi)
          LOOP
              IF Access:APDTRANS.Next()<>level:benign OR APD:N0_tran <> APH:N0_tran THEN BREAK.
              GSTO:Kode_Barang = APD:Kode_brg
              GSTO:Kode_Apotik = GL_entryapotik
              GET(GStokAptk,GSTO:KeyBarang)
                      !disini isi dulu tbstawal
                      TBS:Kode_Apotik = GL_entryapotik
                      TBS:Kode_Barang = APD:Kode_brg
                      TBS:Tahun = Tahun_ini
                      GET(Tbstawal,TBS:kdap_brg)
                      IF ERRORCODE() = 0
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
                      !end ngisi tbstawal
          END
      !!
      END
    OF ?Cancel
      !DO BATAL_D_UTAMA
      sudah_nomor = 0
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


ThisWindow.TakeFieldEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all field specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  CASE FIELD()
  OF ?LOC::Status
    case JPas:Jenis_Pasien
    OF 1
        LOC::Status = 'PEGAWAI'
    OF 2
        LOC::Status = 'TUNAI'
    OF 3
        LOC::Status = 'KONTRAKTOR'
    END
  END
  ReturnValue = PARENT.TakeFieldEvent()
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
      apkemtmp{prop:sql}='delete from dba.apkemtmp where Nomor_mr='''&Glo::no_mr&''''
      IF SELF.RESPONSE = 1
         !Cetak_detail_kembali_obat
         !Print_ReturRawatInap
      END
    OF EVENT:Timer
      IF APH:Biaya = 0
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


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APH:Biaya = loc::total - loc::diskon


BRW4.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW4.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:5
    SELF.ChangeControl=?Change:5
    SELF.DeleteControl=?Delete:5
  END


BRW4.ResetFromView PROCEDURE

loc::total:Sum       REAL                                  ! Sum variable for browse totals
loc::diskon:Sum      REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:APDTRANS.SetQuickScan(1)
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
    loc::total:Sum += APD:Total
    loc::diskon:Sum += APD:Diskon
  END
  loc::total = loc::total:Sum
  loc::diskon = loc::diskon:Sum
  PARENT.ResetFromView
  Relate:APDTRANS.SetQuickScan(0)
  SETCURSOR()


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

