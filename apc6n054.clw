

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N054.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N143.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N144.INC'),ONCE        !Req'd for module callout resolution
                     END


BrowseStokGudang PROCEDURE                                 ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(GStockGdg)
                       PROJECT(GSGD:Harga_Beli)
                       PROJECT(GSGD:Jumlah_Stok)
                       PROJECT(GSGD:Discount)
                       PROJECT(GSGD:Kode_brg)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GSGD:Harga_Beli        LIKE(GSGD:Harga_Beli)          !List box control field - type derived from field
GSGD:Jumlah_Stok       LIKE(GSGD:Jumlah_Stok)         !List box control field - type derived from field
GSGD:Discount          LIKE(GSGD:Discount)            !List box control field - type derived from field
GSGD:Kode_brg          LIKE(GSGD:Kode_brg)            !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW4::View:Browse    VIEW(GBarang)
                       PROJECT(GBAR:Kode_brg)
                       PROJECT(GBAR:Nama_Brg)
                       PROJECT(GBAR:No_Satuan)
                       PROJECT(GBAR:Jenis_Brg)
                       PROJECT(GBAR:Status)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:No_Satuan         LIKE(GBAR:No_Satuan)           !List box control field - type derived from field
GBAR:Jenis_Brg         LIKE(GBAR:Jenis_Brg)           !List box control field - type derived from field
GBAR:Status            LIKE(GBAR:Status)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Stok Gudang'),AT(,,358,188),FONT('Arial',8,,),CENTER,IMM,HLP('BrowseStokGudang'),SYSTEM,GRAY,MDI
                       SHEET,AT(1,2,356,142),USE(?Sheet1)
                         TAB('Kode (F2)'),USE(?Tab1),KEY(F2Key)
                           PROMPT('&Cari Kode :'),AT(5,128),USE(?GBAR:Kode_brg:Prompt)
                           ENTRY(@s10),AT(55,128,60,10),USE(GBAR:Kode_brg),MSG('Kode Barang'),TIP('Kode Barang')
                         END
                         TAB('Nama (F3)'),USE(?Tab2),KEY(F3Key)
                           PROMPT('&Cari Nama :'),AT(5,128),USE(?GBAR:Nama_Brg:Prompt)
                           ENTRY(@s40),AT(55,128,127,10),USE(GBAR:Nama_Brg),MSG('Nama Barang'),TIP('Nama Barang')
                         END
                       END
                       LIST,AT(4,19,350,104),USE(?List),IMM,MSG('Browsing Records'),FORMAT('47L|M~Kode Barang~@s10@165L|M~Nama Barang~@s40@51L|M~Satuan~@s10@20L|M~Jenis Brg' &|
   '~@s5@12L|M~Status~@n3@'),FROM(Queue:Browse)
                       LIST,AT(6,153,183,28),USE(?Browse:1),IMM,MSG('Browsing Records'),FORMAT('68D(20)|M~Harga Beli~C(0)@n16.`2@76D(22)|M~Jumlah Stok~C(0)@n18.2@40R(22)|M~Disk' &|
   'on~C(0)@n10.2@'),FROM(Queue:Browse:1)
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
                     END

BRW4                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW4::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW4::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - choice(?sheet1)=2
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
  GlobalErrors.SetProcedureName('BrowseStokGudang')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GBAR:Kode_brg:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:GBarang.Open                                      ! File GBarang used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GStockGdg,SELF) ! Initialize the browse manager
  BRW4.Init(?List,Queue:Browse.ViewPosition,BRW4::View:Browse,Queue:Browse,Relate:GBarang,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,GSGD:KeyKodeBrg)                      ! Add the sort order for GSGD:KeyKodeBrg for sort order 1
  BRW1.AddRange(GSGD:Kode_brg,Relate:GStockGdg,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW1.AddField(GSGD:Harga_Beli,BRW1.Q.GSGD:Harga_Beli)    ! Field GSGD:Harga_Beli is a hot field or requires assignment from browse
  BRW1.AddField(GSGD:Jumlah_Stok,BRW1.Q.GSGD:Jumlah_Stok)  ! Field GSGD:Jumlah_Stok is a hot field or requires assignment from browse
  BRW1.AddField(GSGD:Discount,BRW1.Q.GSGD:Discount)        ! Field GSGD:Discount is a hot field or requires assignment from browse
  BRW1.AddField(GSGD:Kode_brg,BRW1.Q.GSGD:Kode_brg)        ! Field GSGD:Kode_brg is a hot field or requires assignment from browse
  BRW4.Q &= Queue:Browse
  BRW4.AddSortOrder(,GBAR:KeyNama)                         ! Add the sort order for GBAR:KeyNama for sort order 1
  BRW4.AddLocator(BRW4::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW4::Sort1:Locator.Init(?GBAR:Nama_Brg,GBAR:Nama_Brg,,BRW4) ! Initialize the browse locator using ?GBAR:Nama_Brg using key: GBAR:KeyNama , GBAR:Nama_Brg
  BRW4.SetFilter('(gbar:status=1 and GBAR:FarNonFar=0)')   ! Apply filter expression to browse
  BRW4.AddSortOrder(,GBAR:KeyKodeBrg)                      ! Add the sort order for GBAR:KeyKodeBrg for sort order 2
  BRW4.AddLocator(BRW4::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW4::Sort0:Locator.Init(?GBAR:Kode_brg,GBAR:Kode_brg,,BRW4) ! Initialize the browse locator using ?GBAR:Kode_brg using key: GBAR:KeyKodeBrg , GBAR:Kode_brg
  BRW4.SetFilter('(gbar:status=1 and GBAR:FarNonFar=0)')   ! Apply filter expression to browse
  BRW4.AddField(GBAR:Kode_brg,BRW4.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Nama_Brg,BRW4.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:No_Satuan,BRW4.Q.GBAR:No_Satuan)      ! Field GBAR:No_Satuan is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Jenis_Brg,BRW4.Q.GBAR:Jenis_Brg)      ! Field GBAR:Jenis_Brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Status,BRW4.Q.GBAR:Status)            ! Field GBAR:Status is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseStokGudang',QuickWindow)             ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW4.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:GBarang.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseStokGudang',QuickWindow)          ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW4.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW4.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF choice(?sheet1)=2
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

wSetTglRekap PROCEDURE                                     ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
Window               WINDOW('Isi Tanggal Cetak Obat'),AT(,,157,73),FONT('Arial',9,,FONT:regular),CENTER,GRAY
                       PROMPT('Tanggal Awal'),AT(9,12),USE(?Glo:TanggalAwal:Prompt),TRN
                       ENTRY(@d06),AT(55,12,55,10),USE(Glo:TglAwal),RIGHT(1)
                       PROMPT('Tanggal akhir'),AT(7,27),USE(?Glo:TanggalAkhir:Prompt),TRN
                       ENTRY(@D06),AT(55,27,54,10),USE(Glo:TglAkhir),RIGHT(1)
                       BUTTON('Keluar<<Esc>'),AT(1,45,51,14),USE(?Button2),HIDE,KEY(EscKey)
                       BUTTON('OK'),AT(53,53,45,14),USE(?Button1),KEY(EnterKey)
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
  GlobalErrors.SetProcedureName('wSetTglRekap')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Glo:TanggalAwal:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('wSetTglRekap',Window)                      ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('wSetTglRekap',Window)                   ! Save window data to non-volatile store
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
    OF ?Button2
      post(event:closewindow)
    OF ?Button1
      if Glo:TglAwal>Glo:TglAkhir then
         message('Tanggal Akhir tidak boleh lebih kecil dari tgl awal','Konfirmasi',icon:exclamation)
         select(?glo:tglAkhir)
         display
         cycle
      end
      post(event:closewindow)
    END
  ReturnValue = PARENT.TakeAccepted()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

BrwCetakObatAskes PROCEDURE                                ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(JPasien)
                       PROJECT(JPas:Nomor_mr)
                       PROJECT(JPas:Nama)
                       PROJECT(JPas:Alamat)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
JPas:Nomor_mr          LIKE(JPas:Nomor_mr)            !List box control field - type derived from field
JPas:Nama              LIKE(JPas:Nama)                !List box control field - type derived from field
JPas:Alamat            LIKE(JPas:Alamat)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(RI_HRInap)
                       PROJECT(RI_HR:NoUrut)
                       PROJECT(RI_HR:Tanggal_Masuk)
                       PROJECT(RI_HR:Tanggal_Keluar)
                       PROJECT(RI_HR:No_Nota)
                       PROJECT(RI_HR:Penanggung)
                       PROJECT(RI_HR:Alamat)
                       PROJECT(RI_HR:Kontraktor)
                       PROJECT(RI_HR:Nomor_mr)
                       JOIN(JKon:KeyKodeKtr,RI_HR:Kontraktor)
                         PROJECT(JKon:NAMA_KTR)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?List:2
RI_HR:NoUrut           LIKE(RI_HR:NoUrut)             !List box control field - type derived from field
RI_HR:Tanggal_Masuk    LIKE(RI_HR:Tanggal_Masuk)      !List box control field - type derived from field
RI_HR:Tanggal_Keluar   LIKE(RI_HR:Tanggal_Keluar)     !List box control field - type derived from field
RI_HR:No_Nota          LIKE(RI_HR:No_Nota)            !List box control field - type derived from field
RI_HR:Penanggung       LIKE(RI_HR:Penanggung)         !List box control field - type derived from field
RI_HR:Alamat           LIKE(RI_HR:Alamat)             !List box control field - type derived from field
RI_HR:Kontraktor       LIKE(RI_HR:Kontraktor)         !List box control field - type derived from field
JKon:NAMA_KTR          LIKE(JKon:NAMA_KTR)            !List box control field - type derived from field
RI_HR:Nomor_mr         LIKE(RI_HR:Nomor_mr)           !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BrowseWindow         WINDOW('Cetak Obat Askes'),AT(,,453,270),FONT('Arial',8,,FONT:regular),CENTER,SYSTEM,GRAY,MDI
                       SHEET,AT(3,2,450,136),USE(?Sheet1)
                         TAB('Urut Mr'),USE(?Tab1)
                           PROMPT('Nomor MR :'),AT(17,124),USE(?JPas:Nomor_mr:Prompt)
                           ENTRY(@N010_b),AT(67,124,113,10),USE(JPas:Nomor_mr),IMM,COLOR(COLOR:White),MSG('Nomor Medical record pasien'),TIP('Nomor KIUP')
                         END
                         TAB('Urut Nama'),USE(?Tab2)
                           PROMPT('Nama :'),AT(11,123),USE(?JPas:Nama:Prompt)
                           ENTRY(@s35),AT(39,122,219,10),USE(JPas:Nama),HLP('Nama mendahului gelar'),MSG('Nama pasien'),REQ,CAP
                         END
                       END
                       LIST,AT(9,18,438,101),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('40L|M~Nomor MR~@N010_@140L|M~Nama~@s35@140L|M~Alamat~@s35@'),FROM(Queue:Browse)
                       LIST,AT(13,148,434,70),USE(?List:2),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('28R|M~No Urut~L@n-7@40L|M~Tgl Masuk~@D06@40L|M~Tgl Keluar~@D06@40L|M~No Nota~@s1' &|
   '0@140L|M~Penanggung~@s35@90L|M~Alamat~@s35@40L|M~Kontraktor~@s10@400L|M~Nama Ktr' &|
   '~@s100@'),FROM(Queue:Browse:1)
                       BUTTON('Cetak Obat Askes'),AT(257,229,78,12),USE(?Button6)
                       BUTTON('&Insert'),AT(3,248,40,12),USE(?Insert),DISABLE,HIDE,KEY(InsertKey)
                       BUTTON('&Change'),AT(46,248,40,12),USE(?Change),DISABLE,HIDE,KEY(CtrlEnter),DEFAULT
                       BUTTON('&Delete'),AT(91,248,40,12),USE(?Delete),DISABLE,HIDE,KEY(DeleteKey)
                       BUTTON('&Select'),AT(141,248,40,12),USE(?Select),DISABLE,HIDE,KEY(EnterKey)
                       BUTTON('Keluar'),AT(343,228,93,12),USE(?Close)
                       BUTTON('Cetak Obat Rawat Inap'),AT(142,230,103,12),USE(?Button7)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - choice(?Sheet1)=2
BRW5                 CLASS(BrowseClass)                    ! Browse using ?List:2
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
                     END

BRW5::Sort0:Locator  StepLocatorClass                      ! Default Locator

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
  GlobalErrors.SetProcedureName('BrwCetakObatAskes')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?JPas:Nomor_mr:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:JPasien.Open                                      ! File RI_HRInap used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?List,Queue:Browse.ViewPosition,BRW1::View:Browse,Queue:Browse,Relate:JPasien,SELF) ! Initialize the browse manager
  BRW5.Init(?List:2,Queue:Browse:1.ViewPosition,BRW5::View:Browse,Queue:Browse:1,Relate:RI_HRInap,SELF) ! Initialize the browse manager
  SELF.Open(BrowseWindow)                                  ! Open window
  ?List{Prop:LineHeight} = 0
  ?List:2{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse
  BRW1.AddSortOrder(,JPas:KeyNama)                         ! Add the sort order for JPas:KeyNama for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?JPas:Nama,JPas:Nama,,BRW1)     ! Initialize the browse locator using ?JPas:Nama using key: JPas:KeyNama , JPas:Nama
  BRW1.AppendOrder('JPas:Nomor_mr')                        ! Append an additional sort order
  BRW1.AddSortOrder(,JPas:KeyNomorMr)                      ! Add the sort order for JPas:KeyNomorMr for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?JPas:Nomor_mr,JPas:Nomor_mr,,BRW1) ! Initialize the browse locator using ?JPas:Nomor_mr using key: JPas:KeyNomorMr , JPas:Nomor_mr
  BRW1.AddField(JPas:Nomor_mr,BRW1.Q.JPas:Nomor_mr)        ! Field JPas:Nomor_mr is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nama,BRW1.Q.JPas:Nama)                ! Field JPas:Nama is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Alamat,BRW1.Q.JPas:Alamat)            ! Field JPas:Alamat is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse:1
  BRW5.AddSortOrder(,RI_HR:PrimaryKey)                     ! Add the sort order for RI_HR:PrimaryKey for sort order 1
  BRW5.AddRange(RI_HR:Nomor_mr,Relate:RI_HRInap,Relate:JPasien) ! Add file relationship range limit for sort order 1
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort0:Locator.Init(,RI_HR:NoUrut,1,BRW5)           ! Initialize the browse locator using  using key: RI_HR:PrimaryKey , RI_HR:NoUrut
  BRW5.AddField(RI_HR:NoUrut,BRW5.Q.RI_HR:NoUrut)          ! Field RI_HR:NoUrut is a hot field or requires assignment from browse
  BRW5.AddField(RI_HR:Tanggal_Masuk,BRW5.Q.RI_HR:Tanggal_Masuk) ! Field RI_HR:Tanggal_Masuk is a hot field or requires assignment from browse
  BRW5.AddField(RI_HR:Tanggal_Keluar,BRW5.Q.RI_HR:Tanggal_Keluar) ! Field RI_HR:Tanggal_Keluar is a hot field or requires assignment from browse
  BRW5.AddField(RI_HR:No_Nota,BRW5.Q.RI_HR:No_Nota)        ! Field RI_HR:No_Nota is a hot field or requires assignment from browse
  BRW5.AddField(RI_HR:Penanggung,BRW5.Q.RI_HR:Penanggung)  ! Field RI_HR:Penanggung is a hot field or requires assignment from browse
  BRW5.AddField(RI_HR:Alamat,BRW5.Q.RI_HR:Alamat)          ! Field RI_HR:Alamat is a hot field or requires assignment from browse
  BRW5.AddField(RI_HR:Kontraktor,BRW5.Q.RI_HR:Kontraktor)  ! Field RI_HR:Kontraktor is a hot field or requires assignment from browse
  BRW5.AddField(JKon:NAMA_KTR,BRW5.Q.JKon:NAMA_KTR)        ! Field JKon:NAMA_KTR is a hot field or requires assignment from browse
  BRW5.AddField(RI_HR:Nomor_mr,BRW5.Q.RI_HR:Nomor_mr)      ! Field RI_HR:Nomor_mr is a hot field or requires assignment from browse
  INIMgr.Fetch('BrwCetakObatAskes',BrowseWindow)           ! Restore window settings from non-volatile store
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
    Relate:JPasien.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrwCetakObatAskes',BrowseWindow)        ! Save window data to non-volatile store
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
    OF ?Button6
      glo:mr=JPas:Nomor_mr
      !GLO:URUTINAP=RI_HR:NoUrut
      Glo:TglAwal=RI_HR:Tanggal_Masuk
      if RI_HR:Tanggal_Keluar<>0 then
         Glo:TglAkhir=RI_HR:Tanggal_Keluar
      else
         Glo:TglAkhir=today()
      end
    OF ?Button7
      access:ri_hrinap.fetch(RI_HR:PrimaryKey)
      glo:Mr_cetakNota       =RI_HR:Nomor_mr
      glo:urut_pas_cetakNota=RI_HR:NoUrut
      PrintObatTerbaru()
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button6
      ThisWindow.Update
      PrintObatTerbaru_Askes()
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
  SELF.SelectControl = ?Select
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF choice(?Sheet1)=2
    RETURN SELF.SetSort(1,Force)
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW5.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)

