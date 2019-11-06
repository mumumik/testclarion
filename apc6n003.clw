

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N003.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N004.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N117.INC'),ONCE        !Req'd for module callout resolution
                     END


BrowseInputOrderVer PROCEDURE                              ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
str                  STRING(20)                            !
vl_nomor             STRING(10)                            !
loc::thread          BYTE                                  !
BRW1::View:Browse    VIEW(GHBPB)
                       PROJECT(GHBPB:NoBPB)
                       PROJECT(GHBPB:Kode_Apotik)
                       PROJECT(GHBPB:Tanggal)
                       PROJECT(GHBPB:Status)
                       PROJECT(GHBPB:UserVal)
                       PROJECT(GHBPB:JamVal)
                       PROJECT(GHBPB:UserInput)
                       PROJECT(GHBPB:Verifikasi)
                       JOIN(GAPO:KeyNoApotik,GHBPB:Kode_Apotik)
                         PROJECT(GAPO:Nama_Apotik)
                         PROJECT(GAPO:Kode_Apotik)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GHBPB:NoBPB            LIKE(GHBPB:NoBPB)              !List box control field - type derived from field
GHBPB:NoBPB_NormalFG   LONG                           !Normal forground color
GHBPB:NoBPB_NormalBG   LONG                           !Normal background color
GHBPB:NoBPB_SelectedFG LONG                           !Selected forground color
GHBPB:NoBPB_SelectedBG LONG                           !Selected background color
GHBPB:Kode_Apotik      LIKE(GHBPB:Kode_Apotik)        !List box control field - type derived from field
GAPO:Nama_Apotik       LIKE(GAPO:Nama_Apotik)         !List box control field - type derived from field
GHBPB:Tanggal          LIKE(GHBPB:Tanggal)            !List box control field - type derived from field
GHBPB:Status           LIKE(GHBPB:Status)             !List box control field - type derived from field
GHBPB:UserVal          LIKE(GHBPB:UserVal)            !List box control field - type derived from field
GHBPB:JamVal           LIKE(GHBPB:JamVal)             !List box control field - type derived from field
GHBPB:UserInput        LIKE(GHBPB:UserInput)          !List box control field - type derived from field
GHBPB:Verifikasi       LIKE(GHBPB:Verifikasi)         !List box control field - type derived from field
GAPO:Kode_Apotik       LIKE(GAPO:Kode_Apotik)         !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(GDBPB)
                       PROJECT(GDBPB:Kode_Brg)
                       PROJECT(GDBPB:Jumlah)
                       PROJECT(GDBPB:Qty_Accepted)
                       PROJECT(GDBPB:Keterangan)
                       PROJECT(GDBPB:NoBPB)
                       JOIN(GBAR:KeyKodeBrg,GDBPB:Kode_Brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Ket1)
                         PROJECT(GBAR:No_Satuan)
                         PROJECT(GBAR:Ket2)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
GDBPB:Kode_Brg         LIKE(GDBPB:Kode_Brg)           !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Ket1              LIKE(GBAR:Ket1)                !List box control field - type derived from field
GBAR:No_Satuan         LIKE(GBAR:No_Satuan)           !List box control field - type derived from field
GDBPB:Jumlah           LIKE(GDBPB:Jumlah)             !List box control field - type derived from field
GDBPB:Qty_Accepted     LIKE(GDBPB:Qty_Accepted)       !List box control field - type derived from field
GBAR:Ket2              LIKE(GBAR:Ket2)                !List box control field - type derived from field
GDBPB:Keterangan       LIKE(GDBPB:Keterangan)         !List box control field - type derived from field
GDBPB:NoBPB            LIKE(GDBPB:NoBPB)              !Primary key field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('BPB '),AT(,,463,258),FONT('Arial',8,,),CENTER,IMM,HLP('BrowseInputOrder'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,447,68),USE(?Browse:1),IMM,HVSCROLL,FONT('Arial',10,COLOR:White,FONT:regular),COLOR(COLOR:Navy,COLOR:Yellow,0808040H),MSG('Browsing Records'),FORMAT('46L(2)|_M*~Nomor~@s10@46L(2)|_M~Kode Apotik~@s5@125L(2)|_M~Nama SubFarmasi~@s30@' &|
   '49R(2)|_M~Tanggal~C(0)@D6@28L(2)|_M~Status~@s5@66L(2)|_M~User Val~@s20@39L(2)|_M' &|
   '~Jam Val~@t04@80L(2)|_M~User Input~@s20@12L(2)|_M~Verifikasi~@n3@'),FROM(Queue:Browse:1)
                       BUTTON('&Tambah (+)'),AT(99,92,67,16),USE(?Insert:2),DISABLE,HIDE,LEFT,KEY(PlusKey),ICON(ICON:New)
                       BUTTON('&Ubah'),AT(170,93,67,14),USE(?Change:2),LEFT,ICON(ICON:Open),DEFAULT
                       BUTTON('&Hapus'),AT(241,93,67,14),USE(?Delete:2),DISABLE,HIDE,LEFT,ICON(ICON:Cut)
                       PANEL,AT(4,114,456,124),USE(?Panel1)
                       LIST,AT(8,118,447,115),USE(?List),IMM,HVSCROLL,FONT('Arial',10,COLOR:White,FONT:regular),COLOR(COLOR:Navy,COLOR:Yellow,0808040H),MSG('Browsing Records'),FORMAT('45L(1)|_M~Kode Brg~C@s10@129L(1)|_M~Nama Obat~C@s40@67L(1)|_M~Kemasan~C@s20@43L(' &|
   '1)|_M~Satuan~C@s10@45D(14)|_M~Jumlah~C(1)@n16.2@47R(1)|_M~Diterima~@n-12.2@77L(1' &|
   ')|_M~Ket~C@s50@80D(14)|_M~Keterangan~C(1)@s20@'),FROM(Queue:Browse)
                       SHEET,AT(4,5,456,107),USE(?CurrentTab)
                         TAB('Terurut berdasar No BPB'),USE(?Tab:2)
                           PROMPT('Nomor:'),AT(17,94),USE(?GHBPB:NoBPB:Prompt)
                           ENTRY(@s10),AT(46,94),USE(GHBPB:NoBPB),MSG('No BPB'),TIP('No BPB')
                         END
                         TAB('Semua BPB'),USE(?Tab2)
                         END
                       END
                       BUTTON('&Selesai'),AT(99,241,67,14),USE(?Close),LEFT,ICON(ICON:Tick)
                       BUTTON('&Print'),AT(170,241,67,14),USE(?Button5),LEFT,FONT('Arial',9,COLOR:Black,FONT:bold+FONT:italic),ICON(ICON:Print1)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Ask                    PROCEDURE(BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetFromAsk           PROCEDURE(*BYTE Request,*BYTE Response),DERIVED ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
SetQueueRecord         PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW1::Sort0:Locator  EntryLocatorClass                     ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - choice(?CurrentTab)=2
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW5                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetFromAsk           PROCEDURE(*BYTE Request,*BYTE Response),DERIVED ! Method added to host embed code
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
  GlobalErrors.SetProcedureName('BrowseInputOrderVer')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  loc::thread=glo::mainthreadno
  !POST(EVENT:Disable_BPBV,,loc::thread)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:GApotik.SetOpenRelated()
  Relate:GApotik.Open                                      ! File GNOBBPB used by this procedure, so make sure it's RelationManager is open
  Relate:GNOABPB.Open                                      ! File GNOBBPB used by this procedure, so make sure it's RelationManager is open
  Relate:GNOBBPB.Open                                      ! File GNOBBPB used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  !set(GNOABPB)
  !loop
  !   access:gnoabpb.next()
  !   break
  !end
  !   If Records(GNOABPB) = 0 Then
  !    GNOABPB:No = 1
  !    GNOABPB:Nomor='BP'&format(month(today()),@P##P)&sub(format(year(today()),@P####P),3,2)&'0001'
  !    access:gnoabpb.Insert()
  !   End
  !
  !if month(today())<>format(sub(GNOABPB:Nomor,3,2),@n2) then
  !   GNOABPB:Nomor='BP'&format(month(today()),@P##P)&sub(format(year(today()),@P####P),3,2)&'0001'
  !   access:gnoabpb.update()
  !   set(GNOBBPB)
  !   loop
  !      if access:gnobbpb.next()<>level:benign then break.
  !      delete(gnobbpb)
  !   end
  !end
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GHBPB,SELF) ! Initialize the browse manager
  BRW5.Init(?List,Queue:Browse.ViewPosition,BRW5::View:Browse,Queue:Browse,Relate:GDBPB,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,GHBPB:KeyNoBPB)                       ! Add the sort order for GHBPB:KeyNoBPB for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,GHBPB:NoBPB,,BRW1)             ! Initialize the browse locator using  using key: GHBPB:KeyNoBPB , GHBPB:NoBPB
  BRW1.SetFilter('(GHBPB:Kode_Apotik=GL_entryapotik )')    ! Apply filter expression to browse
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon GHBPB:NoBPB for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,GHBPB:KeyNoBPB)  ! Add the sort order for GHBPB:KeyNoBPB for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?GHBPB:NoBPB,GHBPB:NoBPB,,BRW1) ! Initialize the browse locator using ?GHBPB:NoBPB using key: GHBPB:KeyNoBPB , GHBPB:NoBPB
  BRW1.SetFilter('(GHBPB:Kode_Apotik=GL_entryapotik and GHBPB:Status=''Tutup'')') ! Apply filter expression to browse
  BRW1.AddField(GHBPB:NoBPB,BRW1.Q.GHBPB:NoBPB)            ! Field GHBPB:NoBPB is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB:Kode_Apotik,BRW1.Q.GHBPB:Kode_Apotik) ! Field GHBPB:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GAPO:Nama_Apotik,BRW1.Q.GAPO:Nama_Apotik)  ! Field GAPO:Nama_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB:Tanggal,BRW1.Q.GHBPB:Tanggal)        ! Field GHBPB:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB:Status,BRW1.Q.GHBPB:Status)          ! Field GHBPB:Status is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB:UserVal,BRW1.Q.GHBPB:UserVal)        ! Field GHBPB:UserVal is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB:JamVal,BRW1.Q.GHBPB:JamVal)          ! Field GHBPB:JamVal is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB:UserInput,BRW1.Q.GHBPB:UserInput)    ! Field GHBPB:UserInput is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB:Verifikasi,BRW1.Q.GHBPB:Verifikasi)  ! Field GHBPB:Verifikasi is a hot field or requires assignment from browse
  BRW1.AddField(GAPO:Kode_Apotik,BRW1.Q.GAPO:Kode_Apotik)  ! Field GAPO:Kode_Apotik is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse
  BRW5.AddSortOrder(,GDBPB:KeyBPBItem)                     ! Add the sort order for GDBPB:KeyBPBItem for sort order 1
  BRW5.AddRange(GDBPB:NoBPB,Relate:GDBPB,Relate:GHBPB)     ! Add file relationship range limit for sort order 1
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort0:Locator.Init(,GDBPB:Kode_Brg,,BRW5)          ! Initialize the browse locator using  using key: GDBPB:KeyBPBItem , GDBPB:Kode_Brg
  BRW5.AddField(GDBPB:Kode_Brg,BRW5.Q.GDBPB:Kode_Brg)      ! Field GDBPB:Kode_Brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Nama_Brg,BRW5.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Ket1,BRW5.Q.GBAR:Ket1)                ! Field GBAR:Ket1 is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:No_Satuan,BRW5.Q.GBAR:No_Satuan)      ! Field GBAR:No_Satuan is a hot field or requires assignment from browse
  BRW5.AddField(GDBPB:Jumlah,BRW5.Q.GDBPB:Jumlah)          ! Field GDBPB:Jumlah is a hot field or requires assignment from browse
  BRW5.AddField(GDBPB:Qty_Accepted,BRW5.Q.GDBPB:Qty_Accepted) ! Field GDBPB:Qty_Accepted is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Ket2,BRW5.Q.GBAR:Ket2)                ! Field GBAR:Ket2 is a hot field or requires assignment from browse
  BRW5.AddField(GDBPB:Keterangan,BRW5.Q.GDBPB:Keterangan)  ! Field GDBPB:Keterangan is a hot field or requires assignment from browse
  BRW5.AddField(GDBPB:NoBPB,BRW5.Q.GDBPB:NoBPB)            ! Field GDBPB:NoBPB is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Kode_brg,BRW5.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseInputOrderVer',QuickWindow)          ! Restore window settings from non-volatile store
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
    Relate:GApotik.Close
    Relate:GNOABPB.Close
    Relate:GNOBBPB.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseInputOrderVer',QuickWindow)       ! Save window data to non-volatile store
  END
  !POST(EVENT:Enable_BPBV,,loc::thread)
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
    UpdateBPBVer
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
      vg_bpb=GHBPB:NoBPB
      display
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Change:2
      ThisWindow.Update
      !brw5.resetsort(1)
      !cycle
    OF ?Delete:2
      ThisWindow.Update
      cycle
    OF ?Button5
      ThisWindow.Update
      START(PrintBPB1, 25000)
      ThisWindow.Reset
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
    OF EVENT:Timer
      brw1.ResetSort(1)
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Ask PROCEDURE(BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  !if request=3 then
  !   vl_nomor=GHBPB:NoBPB
  !   display
  !end
  ReturnValue = PARENT.Ask(Request)
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
  !if request=3 and response=1 then
  !   GNOBBPB:NoBPB=vl_nomor
  !   access:gnobbpb.insert()
  !end
  brw1.resetsort(1)
  brw5.resetsort(1)


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF choice(?CurrentTab)=2
    RETURN SELF.SetSort(1,Force)
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (ghbpb:verifikasi=1)
    SELF.Q.GHBPB:NoBPB_NormalFG = 255                      ! Set conditional color values for GHBPB:NoBPB
    SELF.Q.GHBPB:NoBPB_NormalBG = -1
    SELF.Q.GHBPB:NoBPB_SelectedFG = 255
    SELF.Q.GHBPB:NoBPB_SelectedBG = -1
  ELSE
    SELF.Q.GHBPB:NoBPB_NormalFG = -1                       ! Set color values for GHBPB:NoBPB
    SELF.Q.GHBPB:NoBPB_NormalBG = -1
    SELF.Q.GHBPB:NoBPB_SelectedFG = -1
    SELF.Q.GHBPB:NoBPB_SelectedBG = -1
  END


BRW5.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW5.ResetFromAsk PROCEDURE(*BYTE Request,*BYTE Response)

  CODE
  PARENT.ResetFromAsk(Request,Response)
  brw1.resetsort(1)
  brw5.resetsort(1)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

UpdateBPBVer PROCEDURE                                     ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
Str                  STRING(20)                            !
vl_nobatal           USHORT                                !
vl_nom               STRING(10)                            !
vl_thn               STRING(2)                             !
vl_bln               STRING(2)                             !
vl_nostr             STRING(10)                            !
vl_bil               STRING(8)                             !
vl_no                STRING(4)                             !
loc:i                BYTE                                  !
loc:ada              BYTE                                  !
vl_ada               BYTE                                  !
VL_NOMOR             STRING(10)                            !
History::GHBPB:Record LIKE(GHBPB:RECORD),THREAD
QuickWindow          WINDOW('Update Pemesanan'),AT(,,220,200),FONT('Arial',8,,),CENTER,IMM,HLP('UpdateGHBPB'),ALRT(EscKey),SYSTEM,GRAY,MDI
                       PROMPT('Nomor:'),AT(6,5),USE(?GHBPB:NoBPB:Prompt)
                       ENTRY(@s10),AT(55,5,55,10),USE(GHBPB:NoBPB),COLOR(COLOR:Silver),MSG('No BPB'),TIP('No BPB'),READONLY
                       PROMPT('Kode Apotik:'),AT(6,19),USE(?GHBPB:Kode_Apotik:Prompt)
                       ENTRY(@s5),AT(55,19,40,10),USE(GHBPB:Kode_Apotik),FONT(,,0800040H,),COLOR(COLOR:Silver),MSG('Kode Apotik'),TIP('Kode Apotik'),READONLY
                       PROMPT('Nama Apotik:'),AT(6,33),USE(?GAPO:Nama_Apotik:Prompt)
                       ENTRY(@s30),AT(55,33,127,10),USE(GAPO:Nama_Apotik),FONT(,,0800040H,),COLOR(COLOR:Silver),MSG('Nama Apotik'),TIP('Nama Apotik'),READONLY
                       PROMPT('Tanggal:'),AT(6,48),USE(?GHBPB:Tanggal:Prompt)
                       ENTRY(@D06),AT(55,48,57,10),USE(GHBPB:Tanggal),DISABLE,MSG('Tanggal'),TIP('Tanggal')
                       STRING('Status:'),AT(6,62),USE(?String1)
                       ENTRY(@s5),AT(55,62,57,10),USE(GHBPB:Status),FONT(,,COLOR:Yellow,),COLOR(COLOR:Navy),READONLY,MSG('Status')
                       OPTION('Verifikasi'),AT(55,80,92,30),USE(GHBPB:Verifikasi),BOXED
                         RADIO('Belum'),AT(61,93),USE(?GHBPB:Verifikasi:Radio1),VALUE('0')
                         RADIO('Sudah'),AT(99,93),USE(?GHBPB:Verifikasi:Radio2),VALUE('1')
                       END
                       PROMPT('User Val:'),AT(6,114),USE(?GHBPB:UserVal:Prompt)
                       ENTRY(@s20),AT(55,114,57,10),USE(GHBPB:UserVal),DISABLE
                       PROMPT('Tanggal Val:'),AT(6,130),USE(?GHBPB:TanggalVal:Prompt)
                       ENTRY(@d06),AT(55,130,57,10),USE(GHBPB:TanggalVal),DISABLE
                       PROMPT('Jam Val:'),AT(6,145),USE(?GHBPB:JamVal:Prompt)
                       ENTRY(@t04),AT(55,145,57,10),USE(GHBPB:JamVal),DISABLE
                       BUTTON('&OK'),AT(56,180,52,14),USE(?OK),LEFT,ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(110,180,52,14),USE(?Cancel),LEFT,ICON(ICON:Cross)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
Reset                  PROCEDURE(BYTE Force=0),DERIVED     ! Method added to host embed code
Run                    PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
!Proses Penomoran Otomatis Transaksi
Isi_Nomor Routine
   vl_nomor=''
   display
   loop
      logout(1,nomor_batal)
      if errorcode()=56 then
         cycle.
      !Silahkan diganti ---> 5=Transaksi Apotik Minta Brg Ke Gdg
      NOM:No_Urut=5
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 5=Transaksi Apotik Minta Brg Ke Gdg
         NOMU:Urut =5
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
        !Silahkan diganti ---> 5=Transaksi Apotik Minta Brg Ke Gdg
        NOM1:No_urut=5
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 5=Transaksi Apotik Minta Brg Ke Gdg
           NOMU:Urut =5
           NOMU:Nomor=vl_nomor
           add(nomoruse)
           if errorcode()>0 then
              rollback
              cycle
           end
           NOM1:No_Trans=sub(vl_nomor,1,6)&format(deformat(sub(vl_nomor,7,4),@n4)+1,@p####p)
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
   if format(sub(vl_nomor,5,2),@n2)<>month(today()) then
      !Silahkan diganti ---> 5=Transaksi Apotik Minta Brg Ke Gdg
      nomor_batal{prop:sql}='delete dba.nomor_batal where No=5'
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 5=Transaksi Apotik Minta Brg Ke Gdg
         NOM1:No_urut=5
         access:nomor_skr.fetch(NOM1:PrimaryKey)
         if not(errorcode()) then
            vl_nomor =NOM1:No_Trans
            NOM1:No_Trans=sub(vl_nomor,1,2)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'0002'
            access:nomor_skr.update()
            if errorcode()<>0 then
               rollback
               cycle
            else
               vl_nomor=sub(vl_nomor,1,2)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'0001'
               commit
            end
         end
         break
      end
   end
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   GHBPB:NoBPB=vl_nomor
   display

Batal_Nomor Routine
   !Silahkan diganti ---> 5=Transaksi Apotik Minta Brg Ke Gdg
   NOM:No_Urut =5
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=GHBPB:NoBPB
   NOM:Keterangan='Apt Minta Brg Gdg'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 5=Transaksi Apotik Minta Brg Ke Gdg
   NOMU:Urut =5
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOMU:Nomor=GHBPB:NoBPB
   access:nomoruse.fetch(NOMU:PrimaryKey)
   delete(nomoruse)

hapus_nomor_user routine
   NOMU:Urut    =5
   NOMU:Nomor   =GHBPB:NoBPB
   access:nomoruse.fetch(NOMU:PrimaryKey)
   if errorcode()=0 then
      delete(nomoruse)
   end

hapus_detil routine
   gdbpb{prop:sql}='delete dba.gdbpb where nobpb='''&GHBPB:NoBPB&''''

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Tambah data'
  OF ChangeRecord
    ActionMessage = 'Ubah data'
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateBPBVer')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GHBPB:NoBPB:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(GHBPB:Record,History::GHBPB:Record)
  SELF.AddHistoryField(?GHBPB:NoBPB,1)
  SELF.AddHistoryField(?GHBPB:Kode_Apotik,2)
  SELF.AddHistoryField(?GHBPB:Tanggal,3)
  SELF.AddHistoryField(?GHBPB:Status,4)
  SELF.AddHistoryField(?GHBPB:Verifikasi,5)
  SELF.AddHistoryField(?GHBPB:UserVal,7)
  SELF.AddHistoryField(?GHBPB:TanggalVal,9)
  SELF.AddHistoryField(?GHBPB:JamVal,10)
  SELF.AddUpdateFile(Access:GHBPB)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:GHBPB.Open                                        ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:GNOABPB.Open                                      ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:GNOBBPB.Open                                      ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_Batal.Open                                  ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:GHBPB
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
  !Jika Insert --> Buat No Transaksi
  If Self.Request = 1 Then
  !!   vl_ada=0
  !!   display
  !!   !Cari apakah ada nomor batal ?
  !!   set(gnobbpb)
  !!   loop
  !!      if access:gnobbpb.next()<>level:benign then break.
  !!      vl_ada=1
  !!      GHBPB:NoBPB=GNOBBPB:NoBPB
  !!      display
  !!      delete(gnobbpb)
  !!      break
  !!   end
  !!   !Jika Tidak Ada Nomor Batal
  !!   if vl_ada=0 then
  !!      GNOABPB:No=1
  !!      !access:gnoabpb.fetch(GNOABPB:KeyNo)
  !!      Set(GNOABPB:KeyNo, GNOABPB:KeyNo)
  !!      Loop
  !!        If access:gnoabpb.Next() <> level:benign Then Break.
  !!        GHBPB:NoBPB=GNOABPB:Nomor
  !!        display
  !!        GNOABPB:Nomor=sub(GNOABPB:Nomor,1,6)&format(deformat(sub(GNOABPB:Nomor,7,4),@n5)+1,@p####p)
  !!        access:gnoabpb.update()
  !!        Break
  !!      End
  !!   end
  
     !Tentukan Data Apotik dan Status Buka
     GHBPB:Status='Tutup'
     GHBPB:Kode_Apotik=GL_entryapotik
  end
  SELF.Open(QuickWindow)                                   ! Open window
  if self.request=1 then
     do isi_nomor
  end
  
  
  if GHBPB:Verifikasi=1 then
     disable(?GHBPB:Verifikasi)
  else
     GHBPB:UserVal=vg_user
     GHBPB:TanggalVal=today()
     GHBPB:JamVal=clock()
  end
  display
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateBPBVer',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  if (self.request=1 and self.response=2) or (self.request=3 and self.response=1) then
     do batal_nomor
     do hapus_detil
  end
  if self.request=1 and self.response=1 then
     do hapus_nomor_user
  end
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:GHBPB.Close
    Relate:GNOABPB.Close
    Relate:GNOBBPB.Close
    Relate:NomorUse.Close
    Relate:Nomor_Batal.Close
    Relate:Nomor_SKR.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateBPBVer',QuickWindow)              ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
    GHBPB:Tanggal = today()
    GHBPB:Verifikasi = 0
  PARENT.PrimeFields


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  GAPO:Kode_Apotik = GHBPB:Kode_Apotik                     ! Assign linking field value
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
    OF ?OK
      ThisWindow.Update
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?Cancel
      ThisWindow.Update
      If Self.Request = InsertRecord Then
         GDBPB:NoBPB=vl_nomor
         set(GDBPB:KeyNoBPB, GDBPB:KeyNoBPB)
         Loop
             Next(GDBPB)
             if errorcode() Then Break.
             If Clip(GDBPB:NoBPB)=Clip(glo::no_nota) then
                delete(GDBPB)
             else
                 break
             end
         End
         Clear(Glo::No_Nota)
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

WindowNomorKwitansi PROCEDURE                              ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
Window               WINDOW('Nomor Kwitansi '),AT(,,296,109),FONT('Arial',8,,FONT:regular),CENTER,GRAY
                       PROMPT('Nomor Kwitansi :'),AT(8,18),USE(?glo:nomorkwitansi:Prompt)
                       ENTRY(@s20),AT(96,18,122,10),USE(glo:nomorkwitansi)
                       PROMPT('Keterangan Kwitansi:'),AT(8,36),USE(?glo:keterangankwitansi:Prompt)
                       ENTRY(@s50),AT(96,36,173,10),USE(glo:keterangankwitansi)
                       PROMPT('Nama Pasien 99.999.999:'),AT(8,54),USE(?glo:nama:Prompt)
                       ENTRY(@s30),AT(96,54,122,10),USE(glo:nama),LEFT
                       BUTTON('OK'),AT(95,80,103,14),USE(?OkButton),DEFAULT
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
  GlobalErrors.SetProcedureName('WindowNomorKwitansi')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?glo:nomorkwitansi:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Glo::kode_apotik = GL_entryapotik
  Relate:GApotik.SetOpenRelated()
  Relate:GApotik.Open                                      ! File GApotik used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('WindowNomorKwitansi',Window)               ! Restore window settings from non-volatile store
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
    INIMgr.Update('WindowNomorKwitansi',Window)            ! Save window data to non-volatile store
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

PrintKwitansiRajal PROCEDURE                               ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
vl_total             REAL                                  !
vl_totalhuruf        STRING(100)                           !
vl_tanggal           STRING(30)                            !
FilesOpened          BYTE                                  !
vl_ket               STRING(250)                           !
vl_nama              STRING(50)                            !
Process:View         VIEW(APHTRANS)
                       PROJECT(APH:Biaya)
                       PROJECT(APH:N0_tran)
                       PROJECT(APH:Nomor_mr)
                       JOIN(JPas:KeyNomorMr,APH:Nomor_mr)
                         PROJECT(JPas:Nama)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(229,1677,7500,3365),PAPER(PAPER:USER,8250,5555),PRE(RPT),FONT('Arial',10,,),THOUS
                       HEADER,AT(229,167,7500,1510)
                         LINE,AT(21,1219,7448,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING('KWITANSI'),AT(3396,1271),USE(?String2:12),TRN
                         LINE,AT(21,1500,7448,0),USE(?Line1:3),COLOR(COLOR:Black)
                       END
detail1                DETAIL,AT(,,,3010)
                         STRING('Nomor :'),AT(281,125),USE(?String2),TRN
                         STRING(@s15),AT(1615,125),USE(APH:N0_tran)
                         STRING(':'),AT(1500,125),USE(?String2:8),TRN
                         STRING(@s35),AT(3417,115),USE(JPas:Nama),HIDE
                         STRING('/'),AT(2458,354),USE(?String2:13),TRN
                         STRING(@s50),AT(2563,354,3698,208),USE(vl_nama),TRN,LEFT
                         STRING(@N010_),AT(1615,354),USE(APH:Nomor_mr)
                         STRING(':'),AT(1500,354),USE(?String2:9),TRN
                         STRING('Telah terima dari'),AT(281,354),USE(?String2:2),TRN
                         STRING('Uang sejumlah'),AT(281,583),USE(?String2:3),TRN
                         STRING(':'),AT(1500,583),USE(?String2:10),TRN
                         TEXT,AT(1604,604,5573,406),USE(vl_totalhuruf),BOXED
                         STRING('Untuk pembayaran'),AT(281,1063),USE(?String2:4),TRN
                         BOX,AT(531,1906,1146,250),USE(?Box1),COLOR(COLOR:Black)
                         STRING(':'),AT(1500,1063),USE(?String2:11),TRN
                         STRING(@s50),AT(1604,1063,4229,208),USE(glo:keterangankwitansi)
                         TEXT,AT(1604,1271,5573,583),USE(vl_ket),BOXED,RESIZE
                         STRING('Rp. '),AT(281,1927),USE(?String2:5),TRN
                         STRING(@n12),AT(583,1927),USE(vl_total),TRN,DECIMAL(14)
                         STRING('Cimahi,'),AT(4583,1927),USE(?String2:6),TRN
                         STRING(@s30),AT(5198,1927),USE(vl_tanggal)
                         STRING('Kwitansi ini sah bila ada tanda tangan petugas & cap RS Bhayangkara Sartika Asih'),AT(302,2781,3823,167),USE(?String19),TRN,FONT(,7,,)
                         STRING(''),AT(563,2698),USE(?String19:2),TRN
                         STRING('( {37})'),AT(4573,2740),USE(?String2:7),TRN
                         LINE,AT(21,2969,7448,0),USE(?Line1:2),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(229,5052,7510,313)
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
  GlobalErrors.SetProcedureName('PrintKwitansiRajal')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  WindowNomorKwitansi()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  glo:printerset = PRINTER{PROPPRINT:Device}                  ! save windows default printer
  PRINTER{PROPPRINT:Device} = glo:printerkwitansi       ! set new default printer
  
  BIND('glo:nomor',glo:nomor)                              ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:APDTRANS.SetOpenRelated()
  Relate:APDTRANS.Open                                     ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Access:GBarang.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  case month(today())
     of 1
         vl_tanggal=format(day(today()),@n2)&' Januari '&format(year(today()),@p####p)
     of 2
         vl_tanggal=format(day(today()),@n2)&' Februari '&format(year(today()),@p####p)
     of 3
         vl_tanggal=format(day(today()),@n2)&' Maret '&format(year(today()),@p####p)
     of 4
         vl_tanggal=format(day(today()),@n2)&' April '&format(year(today()),@p####p)
     of 5
         vl_tanggal=format(day(today()),@n2)&' Mei '&format(year(today()),@p####p)
     of 6
         vl_tanggal=format(day(today()),@n2)&' Juni '&format(year(today()),@p####p)
     of 7
         vl_tanggal=format(day(today()),@n2)&' Juli '&format(year(today()),@p####p)
     of 8
         vl_tanggal=format(day(today()),@n2)&' Agustus '&format(year(today()),@p####p)
     of 9
         vl_tanggal=format(day(today()),@n2)&' September '&format(year(today()),@p####p)
     of 10
         vl_tanggal=format(day(today()),@n2)&' Oktober '&format(year(today()),@p####p)
     of 11
         vl_tanggal=format(day(today()),@n2)&' November '&format(year(today()),@p####p)
     of 12
         vl_tanggal=format(day(today()),@n2)&' Desember '&format(year(today()),@p####p)
  end
  display
  
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintKwitansiRajal',ProgressWindow)        ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:APHTRANS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, APH:N0_tran)
  ThisReport.AddSortOrder(APH:by_transaksi)
  ThisReport.SetFilter('APH:N0_tran=glo:nomor')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  Relate:APHTRANS.SetQuickScan(1,Propagate:OneMany)
  SELF.SkipPreview = False
  SELF.Zoom = 100
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom=True
  Previewer.Maximize=True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  PRINTER{PROPPRINT:Device} = glo:printerset
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
  END
  IF SELF.Opened
    INIMgr.Update('PrintKwitansiRajal',ProgressWindow)     ! Save window data to non-volatile store
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
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  JPas:Nomor_mr = APH:Nomor_mr                             ! Assign linking field value
  Access:JPasien.Fetch(JPas:KeyNomorMr)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  !message(APH:Nomor_mr&' '&glo:nama&' '&JPas:Nama)
  if APH:Nomor_mr=99999999 then
     vl_nama=glo:nama
  else
     vl_nama=JPas:Nama
  end
  display
  
  vl_total=round(APH:Biaya,1)
  vl_totalhuruf=clip(angkaketulisan(vl_total))&' RUPIAH'
  display
  apdtrans{prop:sql}='select * from dba.apdtrans where n0_tran='''&APH:N0_tran&''' and (APD:camp=0 or (apd:camp<>0 and sub(APD:kode_brg,1,7)=''_Campur''))'
  loop
     if access:apdtrans.next()<>level:benign then break.
     GBAR:Kode_brg=APD:Kode_brg
     access:gbarang.fetch(GBAR:KeyKodeBrg)
     if clip(vl_ket)='' then
        vl_ket=clip(GBAR:Nama_Brg)&'='&format(APD:Jumlah,@n3)
     else
        vl_ket=clip(vl_ket)&', '&clip(GBAR:Nama_Brg)&'='&format(APD:Jumlah,@n3)
     end
  end
  display
  PRINT(RPT:detail1)
  RETURN ReturnValue

Balik                PROCEDURE  (String SA)                ! Declare Procedure
SB String(18)
i  Short
  CODE
!Proc Balik
!Balik Function(String SA),String(18)
!Balik Function(String SA)
      i = 1
      loop until i > len(Clip(sa))
          sb[i] =sa[len(sa)-i+1]
          i = i+1
    end
    
  Return (Clip(SB))
!End of Proc Balik

