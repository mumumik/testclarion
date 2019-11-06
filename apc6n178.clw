

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N178.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N180.INC'),ONCE        !Req'd for module callout resolution
                     END


Trig_browseCampurBpjs PROCEDURE (loc::nomor_param)         ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
Loc::total           LONG                                  !
Loc::biaya           LONG                                  !
loc::tot_general     LONG                                  !
loc::nomor           STRING(15)                            !
BRW1::View:Browse    VIEW(APDTcam)
                       PROJECT(APD1:Kode_brg)
                       PROJECT(APD1:Jumlah)
                       PROJECT(APD1:Total)
                       PROJECT(APD1:N0_tran)
                       PROJECT(APD1:Camp)
                       JOIN(GBAR:KeyKodeBrg,APD1:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APD1:Kode_brg          LIKE(APD1:Kode_brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
APD1:Jumlah            LIKE(APD1:Jumlah)              !List box control field - type derived from field
APD1:Total             LIKE(APD1:Total)               !List box control field - type derived from field
APD1:N0_tran           LIKE(APD1:N0_tran)             !Primary key field - type derived from field
APD1:Camp              LIKE(APD1:Camp)                !Primary key field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Obat Campur'),AT(,,346,174),FONT('Arial',8,,),IMM,HLP('Obat_campur'),ALRT(EscKey),TIMER(100),SYSTEM,GRAY,MDI
                       OPTION('Jenis Resep'),AT(7,4,66,42),USE(Dtd_ndtd),BOXED,FONT(,,COLOR:Teal,)
                         RADIO('DTD'),AT(19,16),USE(?Option1:Radio1),FONT('Times New Roman',,COLOR:Black,FONT:bold)
                         RADIO('NON-DTD'),AT(19,33),USE(?Option1:Radio2),FONT('Times New Roman',,COLOR:Black,FONT:bold)
                       END
                       BUTTON('&Select'),AT(175,4,45,14),USE(?Select:2),HIDE
                       BUTTON('&Tambah Obat (+)'),AT(6,122,77,18),USE(?Insert:3),FONT('Arial',9,,FONT:bold),KEY(PlusKey)
                       BUTTON('&Rubah'),AT(290,5,45,14),USE(?Change:3),HIDE,DEFAULT
                       PROMPT('Jumlah Pembuatan :'),AT(105,24),USE(?Prompt4),FONT('Arial',9,,FONT:bold+FONT:italic)
                       ENTRY(@n-5),AT(199,21,37,15),USE(GLO::jml_cmp),FONT('Times New Roman',14,COLOR:Black,)
                       BUTTON('&Hapus'),AT(293,23,45,14),USE(?Delete:3),HIDE
                       LIST,AT(6,52,326,63),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('48L(2)|M~Kode Barang~@s10@160L(2)|M~Nama Barang~C@s40@44D(16)|M~Jumlah~C(0)@n10.' &|
   '2@48D(20)|M~Total~C(0)@n11.2@'),FROM(Queue:Browse:1)
                       PROMPT('Subtotal :'),AT(223,122),USE(?Prompt1),FONT('Times New Roman',10,COLOR:Black,)
                       ENTRY(@n-14),AT(267,122,,10),USE(Loc::total),DISABLE
                       BUTTON('&Batal'),AT(99,122,45,31),USE(?Cancel),ICON(ICON:Cross)
                       PROMPT('Biaya :'),AT(223,137),USE(?Prompt2),FONT('Times New Roman',10,COLOR:Black,)
                       ENTRY(@n-14),AT(267,136,,10),USE(Loc::biaya)
                       BUTTON('&OK [End]'),AT(154,122,45,31),USE(?Close),FONT('Arial',8,COLOR:Black,),KEY(EndKey),ICON(ICON:Tick)
                       LINE,AT(331,150,-125,0),USE(?Line1),COLOR(COLOR:Black),LINEWIDTH(1)
                       ENTRY(@n-14),AT(267,155,,10),USE(loc::tot_general),DISABLE
                       PROMPT('Total'),AT(224,156),USE(?Prompt3),FONT('Times New Roman',10,COLOR:Black,FONT:bold)
                       BUTTON('Help'),AT(227,3,45,14),USE(?Help),HIDE,STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Reset                  PROCEDURE(BYTE Force=0),DERIVED     ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Update                 PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetFromView          PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
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
BATAL_D_DUA ROUTINE                !Batal APDTcam
    SET( BRW1::View:Browse)
    LOOP
        NEXT( BRW1::View:Browse)
        IF ERRORCODE() THEN BREAK.
        DELETE( BRW1::View:Browse)
    END

Tulis_D_Dua ROUTINE  !UNTUK tulis data ke APDTrans
    SET( BRW1::View:Browse)
    LOOP
        NEXT( BRW1::View:Browse)
        IF ERRORCODE()
            APD:N0_tran = APH:N0_tran
            APD:Kode_brg = '_Campur'
            APD:Jumlah = GLO::jml_cmp
            APD:Total = loc::tot_general
            APD:Camp = glo::campur
            Access:APDTRANS.Insert()
            BREAK
        END
        APD:N0_tran = APD1:N0_tran
        APD:Kode_brg = APD1:Kode_brg
        APD:Jumlah = APD1:J_potong
        APD:Total = 0
        APD:Camp = glo::campur
        APD:Harga_Dasar = APD1:Harga_Dasar
        Access:APDTRANS.Insert()
        ! Disini mulai menulis ke APDTrans
    END

ThisWindow.Ask PROCEDURE

  CODE
  ?Browse:1{PROP:DISABLE}=1
  ?Close{PROP:DISABLE}=1
  Dtd_ndtd = 1
  ?Insert:3{PROP:DISABLE}=1
  GLO::jml_cmp=0
  APD:N0_tran = glo::no_nota
  APD:Camp = glo::campur
  loc::nomor=loc::nomor_param
  display
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_browseCampurBpjs')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Option1:Radio1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo::campur',glo::campur)                          ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:APDTcam.Open                                      ! File APHTRANSBPJS used by this procedure, so make sure it's RelationManager is open
  Relate:APHTRANSBPJS.Open                                 ! File APHTRANSBPJS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:APDTcam,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon APD1:Kode_brg for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,APD1:by_tran_cam) ! Add the sort order for APD1:by_tran_cam for sort order 1
  BRW1.AddRange(APD1:N0_tran,loc::nomor)                   ! Add single value range limit for sort order 1
  BRW1.SetFilter('(APD1:Camp=glo::campur)')                ! Apply filter expression to browse
  BRW1.AddField(APD1:Kode_brg,BRW1.Q.APD1:Kode_brg)        ! Field APD1:Kode_brg is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Nama_Brg,BRW1.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW1.AddField(APD1:Jumlah,BRW1.Q.APD1:Jumlah)            ! Field APD1:Jumlah is a hot field or requires assignment from browse
  BRW1.AddField(APD1:Total,BRW1.Q.APD1:Total)              ! Field APD1:Total is a hot field or requires assignment from browse
  BRW1.AddField(APD1:N0_tran,BRW1.Q.APD1:N0_tran)          ! Field APD1:N0_tran is a hot field or requires assignment from browse
  BRW1.AddField(APD1:Camp,BRW1.Q.APD1:Camp)                ! Field APD1:Camp is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Kode_brg,BRW1.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_browseCampurBpjs',QuickWindow)        ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
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
    Relate:APDTcam.Close
    Relate:APHTRANSBPJS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_browseCampurBpjs',QuickWindow)     ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  loc::tot_general = Loc::total + Loc::biaya
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    Trig_UpdateCampurBpjs
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
      glo::nomor=loc::nomor
      display
    OF ?GLO::jml_cmp
      IF GLO::jml_cmp <> 0
          ?Browse:1{PROP:DISABLE}=0
          ?Insert:3{PROP:DISABLE}=0
      ELSE
          MESSAGE( 'Jumlah Pembuatan Obat Campur HARUS DIISI' )
          SELECT (?GLO::jml_cmp)
          CYCLE
      END
    OF ?Cancel
      DO BATAL_D_DUA
      GLO::jml_cmp = GLO::jml_cmp -1
    OF ?Loc::biaya
      loc::tot_general = Loc::total + Loc::biaya
      DISPLAY
    OF ?Close
      DO Tulis_D_Dua
      APD1:N0_tran  = APD:N0_tran
      APD1:Kode_brg = '_Biaya'
      APD1:Total    = Loc::biaya
      APD1:Camp     = glo::campur
      Access:APDTcam.Insert()
      PRESSKEY(AltB)
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
      select(?cancel)
      presskey( 13)
    OF EVENT:Timer
      IF Loc::total <> 0
          ?Close{PROP:DISABLE}=0
      ELSE
          ?Close{PROP:DISABLE}=1
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
  loc::tot_general = Loc::total + Loc::biaya


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


BRW1.ResetFromView PROCEDURE

Loc::total:Sum       REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:APDTcam.SetQuickScan(1)
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
    Loc::total:Sum += APD1:Total
  END
  Loc::total = Loc::total:Sum
  PARENT.ResetFromView
  Relate:APDTcam.SetQuickScan(0)
  SETCURSOR()


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

