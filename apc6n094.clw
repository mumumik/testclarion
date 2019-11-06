

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N094.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N095.INC'),ONCE        !Req'd for module callout resolution
                     END


UpdateGStockGdg PROCEDURE                                  ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
BRW2::View:Browse    VIEW(GDBatal)
                       PROJECT(GDBTL:NoBatal)
                       PROJECT(GDBTL:KodeBarang)
                       PROJECT(GDBTL:NamaBarang)
                       PROJECT(GDBTL:Satuan)
                       PROJECT(GDBTL:HargaSatuan)
                       PROJECT(GDBTL:Kuantitas)
                       PROJECT(GDBTL:JumlahHarga)
                       PROJECT(GDBTL:Discount)
                       PROJECT(GDBTL:BonusBrg)
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?Browse:2
GDBTL:NoBatal          LIKE(GDBTL:NoBatal)            !List box control field - type derived from field
GDBTL:KodeBarang       LIKE(GDBTL:KodeBarang)         !List box control field - type derived from field
GDBTL:NamaBarang       LIKE(GDBTL:NamaBarang)         !List box control field - type derived from field
GDBTL:Satuan           LIKE(GDBTL:Satuan)             !List box control field - type derived from field
GDBTL:HargaSatuan      LIKE(GDBTL:HargaSatuan)        !List box control field - type derived from field
GDBTL:Kuantitas        LIKE(GDBTL:Kuantitas)          !List box control field - type derived from field
GDBTL:JumlahHarga      LIKE(GDBTL:JumlahHarga)        !List box control field - type derived from field
GDBTL:Discount         LIKE(GDBTL:Discount)           !List box control field - type derived from field
GDBTL:BonusBrg         LIKE(GDBTL:BonusBrg)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::GSGD:Record LIKE(GSGD:RECORD),THREAD
QuickWindow          WINDOW('Update the GStockGdg File'),AT(,,168,182),FONT('MS Sans Serif',8,COLOR:Black,),IMM,HLP('UpdateGStockGdg'),SYSTEM,GRAY,RESIZE,MDI
                       SHEET,AT(4,4,160,156),USE(?CurrentTab)
                         TAB('General'),USE(?Tab:1)
                           PROMPT('Kode Barang:'),AT(8,20),USE(?GSGD:Kode_brg:Prompt)
                           ENTRY(@s10),AT(76,20,44,10),USE(GSGD:Kode_brg),MSG('Kode Barang'),TIP('Kode Barang')
                           PROMPT('Harga Beli:'),AT(8,34),USE(?GSGD:Harga_Beli:Prompt)
                           ENTRY(@n16.`2),AT(76,34,68,10),USE(GSGD:Harga_Beli),RIGHT(1),MSG('Harga Beli'),TIP('Harga Beli')
                           PROMPT('Eoq:'),AT(8,48),USE(?GSGD:Eoq:Prompt)
                           ENTRY(@n15.2),AT(76,48,64,10),USE(GSGD:Eoq),DECIMAL(14),MSG('Eoq'),TIP('Eoq')
                           PROMPT('Jumlah Stok:'),AT(8,62),USE(?GSGD:Jumlah_Stok:Prompt)
                           ENTRY(@n18.2),AT(76,62,76,10),USE(GSGD:Jumlah_Stok),DECIMAL(14),MSG('Jumlah STok'),TIP('Jumlah STok')
                           PROMPT('Harga Sebelum:'),AT(8,76),USE(?GSGD:HargaSebelum:Prompt)
                           ENTRY(@n16.2),AT(76,76,68,10),USE(GSGD:HargaSebelum),DECIMAL(14)
                           PROMPT('Saldo Awal Thn:'),AT(8,90),USE(?GSGD:SaldoAwalThn:Prompt)
                           ENTRY(@n18.2),AT(76,90,76,10),USE(GSGD:SaldoAwalThn),DECIMAL(14),MSG('Saldo awal tahun'),TIP('Saldo awal tahun')
                           PROMPT('stock min:'),AT(8,104),USE(?GSGD:stock_min:Prompt)
                           ENTRY(@n10.2),AT(76,104,44,10),USE(GSGD:stock_min),DECIMAL(14)
                           PROMPT('stock max:'),AT(8,118),USE(?GSGD:stock_max:Prompt)
                           ENTRY(@n10.2),AT(76,118,44,10),USE(GSGD:stock_max),DECIMAL(14)
                           PROMPT('Discount:'),AT(8,132),USE(?GSGD:Discount:Prompt)
                           ENTRY(@n10.2),AT(76,132,44,10),USE(GSGD:Discount),DECIMAL(14)
                           PROMPT('Saldo Maksimal:'),AT(8,146),USE(?GSGD:Saldo_Maksimal:Prompt)
                           ENTRY(@n10.2),AT(76,146,44,10),USE(GSGD:Saldo_Maksimal),DECIMAL(14)
                         END
                         TAB('General (cont.)'),USE(?Tab:2)
                           PROMPT('Harga Jual Umum:'),AT(8,20),USE(?GSGD:HargaJualUmum:Prompt)
                           ENTRY(@n10.2),AT(76,20,44,10),USE(GSGD:HargaJualUmum),DECIMAL(14)
                           PROMPT('Harga Jual FT:'),AT(8,34),USE(?GSGD:HargaJualFT:Prompt)
                           ENTRY(@n10.2),AT(76,34,44,10),USE(GSGD:HargaJualFT),DECIMAL(14)
                           PROMPT('Harga MCU:'),AT(8,48),USE(?GSGD:HargaJualMCU:Prompt)
                           ENTRY(@n10.2),AT(76,48,44,10),USE(GSGD:HargaJualMCU),DECIMAL(14)
                           PROMPT('Harga Total:'),AT(8,62),USE(?GSGD:HargaTotal:Prompt)
                           ENTRY(@n10.2),AT(76,62,44,10),USE(GSGD:HargaTotal),DECIMAL(14),MSG('Harga Beli Kemasan'),TIP('Harga Beli Kemasan')
                           PROMPT('Konversi:'),AT(8,76),USE(?GSGD:Konversi:Prompt)
                           ENTRY(@n10.2),AT(76,76,44,10),USE(GSGD:Konversi),DECIMAL(14)
                           PROMPT('Satuan Beli:'),AT(8,90),USE(?GSGD:SatuanBeli:Prompt)
                           ENTRY(@s20),AT(76,90,84,10),USE(GSGD:SatuanBeli)
                         END
                         TAB('GDBatal'),USE(?Tab:3)
                           LIST,AT(8,20,152,118),USE(?Browse:2),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('44L(2)|M~No Batal~L(2)@s10@48L(2)|M~Kode Barang~L(2)@s10@80L(2)|M~Nama Barang~L(' &|
   '2)@s40@44L(2)|M~Satuan~L(2)@s10@68D(16)|M~Harga Satuan~C(0)@n16.`2@68D(22)|M~Kua' &|
   'ntitas~C(0)@n16.2@76D(20)|M~Jumlah Harga~C(0)@n18.`2@76D(28)|M~Discount~C(0)@n18' &|
   '.2@44D(10)|M~Bonus Brg~C(0)@n10.2@'),FROM(Queue:Browse:2)
                           BUTTON('&Insert'),AT(17,142,45,14),USE(?Insert:3)
                           BUTTON('&Change'),AT(66,142,45,14),USE(?Change:3)
                           BUTTON('&Delete'),AT(115,142,45,14),USE(?Delete:3)
                         END
                       END
                       BUTTON('OK'),AT(21,164,45,14),USE(?OK),DEFAULT
                       BUTTON('Cancel'),AT(70,164,45,14),USE(?Cancel)
                       BUTTON('Help'),AT(119,164,45,14),USE(?Help),STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW2                 CLASS(BrowseClass)                    ! Browse using ?Browse:2
Q                      &Queue:Browse:2                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
                     END

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
    ActionMessage = 'Adding a GStockGdg Record'
  OF ChangeRecord
    ActionMessage = 'Changing a GStockGdg Record'
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateGStockGdg')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GSGD:Kode_brg:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(GSGD:Record,History::GSGD:Record)
  SELF.AddHistoryField(?GSGD:Kode_brg,1)
  SELF.AddHistoryField(?GSGD:Harga_Beli,2)
  SELF.AddHistoryField(?GSGD:Eoq,3)
  SELF.AddHistoryField(?GSGD:Jumlah_Stok,4)
  SELF.AddHistoryField(?GSGD:HargaSebelum,5)
  SELF.AddHistoryField(?GSGD:SaldoAwalThn,6)
  SELF.AddHistoryField(?GSGD:stock_min,7)
  SELF.AddHistoryField(?GSGD:stock_max,8)
  SELF.AddHistoryField(?GSGD:Discount,9)
  SELF.AddHistoryField(?GSGD:Saldo_Maksimal,10)
  SELF.AddHistoryField(?GSGD:HargaJualUmum,11)
  SELF.AddHistoryField(?GSGD:HargaJualFT,12)
  SELF.AddHistoryField(?GSGD:HargaJualMCU,13)
  SELF.AddHistoryField(?GSGD:HargaTotal,14)
  SELF.AddHistoryField(?GSGD:Konversi,15)
  SELF.AddHistoryField(?GSGD:SatuanBeli,16)
  SELF.AddUpdateFile(Access:GStockGdg)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:GDBatal.Open                                      ! File GStockGdg used by this procedure, so make sure it's RelationManager is open
  Access:GStockGdg.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:GStockGdg
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
  BRW2.Init(?Browse:2,Queue:Browse:2.ViewPosition,BRW2::View:Browse,Queue:Browse:2,Relate:GDBatal,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:2{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW2.Q &= Queue:Browse:2
  BRW2.AddSortOrder(,GDBTL:KeyKodeBarang)                  ! Add the sort order for GDBTL:KeyKodeBarang for sort order 1
  BRW2.AddRange(GDBTL:KodeBarang,Relate:GDBatal,Relate:GStockGdg) ! Add file relationship range limit for sort order 1
  BRW2.AddField(GDBTL:NoBatal,BRW2.Q.GDBTL:NoBatal)        ! Field GDBTL:NoBatal is a hot field or requires assignment from browse
  BRW2.AddField(GDBTL:KodeBarang,BRW2.Q.GDBTL:KodeBarang)  ! Field GDBTL:KodeBarang is a hot field or requires assignment from browse
  BRW2.AddField(GDBTL:NamaBarang,BRW2.Q.GDBTL:NamaBarang)  ! Field GDBTL:NamaBarang is a hot field or requires assignment from browse
  BRW2.AddField(GDBTL:Satuan,BRW2.Q.GDBTL:Satuan)          ! Field GDBTL:Satuan is a hot field or requires assignment from browse
  BRW2.AddField(GDBTL:HargaSatuan,BRW2.Q.GDBTL:HargaSatuan) ! Field GDBTL:HargaSatuan is a hot field or requires assignment from browse
  BRW2.AddField(GDBTL:Kuantitas,BRW2.Q.GDBTL:Kuantitas)    ! Field GDBTL:Kuantitas is a hot field or requires assignment from browse
  BRW2.AddField(GDBTL:JumlahHarga,BRW2.Q.GDBTL:JumlahHarga) ! Field GDBTL:JumlahHarga is a hot field or requires assignment from browse
  BRW2.AddField(GDBTL:Discount,BRW2.Q.GDBTL:Discount)      ! Field GDBTL:Discount is a hot field or requires assignment from browse
  BRW2.AddField(GDBTL:BonusBrg,BRW2.Q.GDBTL:BonusBrg)      ! Field GDBTL:BonusBrg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateGStockGdg',QuickWindow)              ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW2.AskProcedure = 1
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
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:GDBatal.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateGStockGdg',QuickWindow)           ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


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
    UpdateGDBatal
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

