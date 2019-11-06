

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABQUERY.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N087.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N088.INC'),ONCE        !Req'd for module callout resolution
                     END


BrowseStokInstalasiLain PROCEDURE                          ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
loc:filter           STRING(100)                           !
FilesOpened          BYTE                                  !
loc:filter1          STRING(20)                            !
BRW1::View:Browse    VIEW(GStokAptk)
                       PROJECT(GSTO:Kode_Barang)
                       PROJECT(GSTO:Saldo)
                       PROJECT(GSTO:Saldo_Minimal)
                       PROJECT(GSTO:Saldo_Maksimal)
                       PROJECT(GSTO:Kode_Apotik)
                       JOIN(GBAR:KeyKodeBrg,GSTO:Kode_Barang)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:KodeBarcode)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GSTO:Kode_Barang       LIKE(GSTO:Kode_Barang)         !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Nama_Brg_NormalFG LONG                           !Normal forground color
GBAR:Nama_Brg_NormalBG LONG                           !Normal background color
GBAR:Nama_Brg_SelectedFG LONG                         !Selected forground color
GBAR:Nama_Brg_SelectedBG LONG                         !Selected background color
GBAR:KodeBarcode       LIKE(GBAR:KodeBarcode)         !List box control field - type derived from field
GBAR:KodeBarcode_NormalFG LONG                        !Normal forground color
GBAR:KodeBarcode_NormalBG LONG                        !Normal background color
GBAR:KodeBarcode_SelectedFG LONG                      !Selected forground color
GBAR:KodeBarcode_SelectedBG LONG                      !Selected background color
GSTO:Saldo             LIKE(GSTO:Saldo)               !List box control field - type derived from field
GSTO:Saldo_Minimal     LIKE(GSTO:Saldo_Minimal)       !List box control field - type derived from field
GSTO:Saldo_Maksimal    LIKE(GSTO:Saldo_Maksimal)      !List box control field - type derived from field
GSTO:Kode_Apotik       LIKE(GSTO:Kode_Apotik)         !List box control field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(GApotik)
                       PROJECT(GAPO:Kode_Apotik)
                       PROJECT(GAPO:Nama_Apotik)
                       PROJECT(GAPO:Keterangan)
                       PROJECT(GAPO:Keterangan2)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
GAPO:Kode_Apotik       LIKE(GAPO:Kode_Apotik)         !List box control field - type derived from field
GAPO:Nama_Apotik       LIKE(GAPO:Nama_Apotik)         !List box control field - type derived from field
GAPO:Keterangan        LIKE(GAPO:Keterangan)          !List box control field - type derived from field
GAPO:Keterangan2       LIKE(GAPO:Keterangan2)         !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Stok Seluruh Apotik dan Bagian'),AT(,,421,277),FONT('Arial',8,,),IMM,HLP('BrowseStokInstalasiLain'),SYSTEM,GRAY,MDI
                       SHEET,AT(2,1,419,123),USE(?Sheet1)
                         TAB('Kode'),USE(?Tab1)
                           BUTTON('&Query'),AT(145,107,42,14),USE(?Query)
                           PROMPT('Kode Apotik:'),AT(7,109),USE(?GAPO:Kode_Apotik:Prompt)
                           ENTRY(@s5),AT(57,109,77,10),USE(GAPO:Kode_Apotik),MSG('Kode Apotik'),TIP('Kode Apotik')
                         END
                         TAB('Nama'),USE(?Tab2)
                           PROMPT('Nama Apotik:'),AT(5,108),USE(?GAPO:Nama_Apotik:Prompt)
                           ENTRY(@s30),AT(55,108,77,10),USE(GAPO:Nama_Apotik),MSG('Nama Apotik'),TIP('Nama Apotik')
                         END
                       END
                       LIST,AT(6,18,411,86),USE(?List),IMM,VSCROLL,MSG('Browsing Records'),FORMAT('26L|M~Kode~@s5@126L|M~Nama Apotik~@s30@80L|M~Keterangan~@s20@80L|M~Keterangan 2~' &|
   '@s20@'),FROM(Queue:Browse)
                       LIST,AT(5,131,414,127),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('42L(2)|M~Kode~@s10@115L(2)|M*~Nama Obat / Barang~@s40@66L(2)|M*~Barcode~@s30@57R' &|
   '(2)|M~Saldo~C(0)@n16.2@58D(14)|M~Saldo Minimal~C(0)@n16.2@55D(12)|M~Saldo Maksim' &|
   'al~C(0)@n12.2@48L(2)|M~Kode Apotik~@s5@'),FROM(Queue:Browse:1)
                       BUTTON('&Insert'),AT(73,207,42,12),USE(?Insert),DISABLE,HIDE
                       BUTTON('&Ubah'),AT(5,261,42,14),USE(?Change)
                       BUTTON('&Delete'),AT(157,207,42,12),USE(?Delete),DISABLE,HIDE
                       BUTTON('Filter di bawah minimal STOK'),AT(117,261,99,14),USE(?Button3)
                       BUTTON('Filter di atas maksimal STOK'),AT(224,261,99,14),USE(?Button3:2)
                       BUTTON('Lepas Filter'),AT(325,261,47,14),USE(?Button3:3)
                       BUTTON('&Keluar'),AT(374,261,45,14),USE(?Close)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
QBE7                 QueryFormClass                        ! QBE List Class. 
QBV7                 QueryFormVisual                       ! QBE Visual Class
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
ApplyFilter            PROCEDURE(),DERIVED                 ! Method added to host embed code
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
SetQueueRecord         PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW5                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW5::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW5::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - choice(?Sheet1)=2
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
  GlobalErrors.SetProcedureName('BrowseStokInstalasiLain')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Query
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:GApotik.SetOpenRelated()
  Relate:GApotik.Open                                      ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Access:GBarang.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  loc:filter1=''
  loc:filter='GBAR:KodeBarcode<<>clip(loc:filter1)'
  display
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GStokAptk,SELF) ! Initialize the browse manager
  BRW5.Init(?List,Queue:Browse.ViewPosition,BRW5::View:Browse,Queue:Browse,Relate:GApotik,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  QBE7.Init(QBV7, INIMgr,'BrowseStokInstalasiLain', GlobalErrors)
  QBE7.QkSupport = True
  QBE7.QkMenuIcon = 'QkQBE.ico'
  QBE7.QkIcon = 'QkLoad.ico'
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,GSTO:KeyApotik)                       ! Add the sort order for GSTO:KeyApotik for sort order 1
  BRW1.AddRange(GSTO:Kode_Apotik,Relate:GStokAptk,Relate:GApotik) ! Add file relationship range limit for sort order 1
  BRW1.AppendOrder('GSTO:kode_barang')                     ! Append an additional sort order
  BRW1.AddField(GSTO:Kode_Barang,BRW1.Q.GSTO:Kode_Barang)  ! Field GSTO:Kode_Barang is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Nama_Brg,BRW1.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:KodeBarcode,BRW1.Q.GBAR:KodeBarcode)  ! Field GBAR:KodeBarcode is a hot field or requires assignment from browse
  BRW1.AddField(GSTO:Saldo,BRW1.Q.GSTO:Saldo)              ! Field GSTO:Saldo is a hot field or requires assignment from browse
  BRW1.AddField(GSTO:Saldo_Minimal,BRW1.Q.GSTO:Saldo_Minimal) ! Field GSTO:Saldo_Minimal is a hot field or requires assignment from browse
  BRW1.AddField(GSTO:Saldo_Maksimal,BRW1.Q.GSTO:Saldo_Maksimal) ! Field GSTO:Saldo_Maksimal is a hot field or requires assignment from browse
  BRW1.AddField(GSTO:Kode_Apotik,BRW1.Q.GSTO:Kode_Apotik)  ! Field GSTO:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Kode_brg,BRW1.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse
  BRW5.AddSortOrder(,GAPO:KeyNama)                         ! Add the sort order for GAPO:KeyNama for sort order 1
  BRW5.AddLocator(BRW5::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort1:Locator.Init(?GAPO:Nama_Apotik,GAPO:Nama_Apotik,1,BRW5) ! Initialize the browse locator using ?GAPO:Nama_Apotik using key: GAPO:KeyNama , GAPO:Nama_Apotik
  BRW5.SetFilter('(sub(clip(gapo:keterangan),1,5)=''Prima'')') ! Apply filter expression to browse
  BRW5.AddSortOrder(,GAPO:KeyNoApotik)                     ! Add the sort order for GAPO:KeyNoApotik for sort order 2
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW5::Sort0:Locator.Init(?GAPO:Kode_Apotik,GAPO:Kode_Apotik,1,BRW5) ! Initialize the browse locator using ?GAPO:Kode_Apotik using key: GAPO:KeyNoApotik , GAPO:Kode_Apotik
  BRW5.SetFilter('(sub(clip(gapo:keterangan),1,5)=''Prima'')') ! Apply filter expression to browse
  BRW5.AddField(GAPO:Kode_Apotik,BRW5.Q.GAPO:Kode_Apotik)  ! Field GAPO:Kode_Apotik is a hot field or requires assignment from browse
  BRW5.AddField(GAPO:Nama_Apotik,BRW5.Q.GAPO:Nama_Apotik)  ! Field GAPO:Nama_Apotik is a hot field or requires assignment from browse
  BRW5.AddField(GAPO:Keterangan,BRW5.Q.GAPO:Keterangan)    ! Field GAPO:Keterangan is a hot field or requires assignment from browse
  BRW5.AddField(GAPO:Keterangan2,BRW5.Q.GAPO:Keterangan2)  ! Field GAPO:Keterangan2 is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseStokInstalasiLain',QuickWindow)      ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW5.QueryControl = ?Query
  BRW5.UpdateQuery(QBE7,1)
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
  END
  IF SELF.Opened
    INIMgr.Update('BrowseStokInstalasiLain',QuickWindow)   ! Save window data to non-volatile store
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
    UpdateGstokAptkNew
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
    OF ?Insert
      cycle
    OF ?Delete
      cycle
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button3
      ThisWindow.Update
      loc:filter='GSTO:Saldo<<=GSTO:Saldo_Minimal and GBAR:KodeBarcode<<>clip(loc:filter1)'
      brw1.resetsort(1)
      display
    OF ?Button3:2
      ThisWindow.Update
      loc:filter='GSTO:Saldo>=GSTO:Saldo_Maksimal and GBAR:KodeBarcode<<>clip(loc:filter1)'
      brw1.resetsort(1)
      display
    OF ?Button3:3
      ThisWindow.Update
      loc:filter='GBAR:KodeBarcode<<>clip(loc:filter1)'
      brw1.resetsort(1)
      display
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.ApplyFilter PROCEDURE

  CODE
  !brw1.setfilter(clip(loc:filter))
  BIND('loc:filter1',loc:filter1)
  BRW1.SetFilter(clip(loc:filter))
    
  PARENT.ApplyFilter


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (gsto:saldo<gsto:saldo_minimal)
    SELF.Q.GBAR:Nama_Brg_NormalFG = 255                    ! Set conditional color values for GBAR:Nama_Brg
    SELF.Q.GBAR:Nama_Brg_NormalBG = -1
    SELF.Q.GBAR:Nama_Brg_SelectedFG = 255
    SELF.Q.GBAR:Nama_Brg_SelectedBG = -1
  ELSIF (gsto:saldo>gsto:saldo_maksimal)
    SELF.Q.GBAR:Nama_Brg_NormalFG = 32768                  ! Set conditional color values for GBAR:Nama_Brg
    SELF.Q.GBAR:Nama_Brg_NormalBG = -1
    SELF.Q.GBAR:Nama_Brg_SelectedFG = 32768
    SELF.Q.GBAR:Nama_Brg_SelectedBG = -1
  ELSE
    SELF.Q.GBAR:Nama_Brg_NormalFG = -1                     ! Set color values for GBAR:Nama_Brg
    SELF.Q.GBAR:Nama_Brg_NormalBG = -1
    SELF.Q.GBAR:Nama_Brg_SelectedFG = -1
    SELF.Q.GBAR:Nama_Brg_SelectedBG = -1
  END
  SELF.Q.GBAR:KodeBarcode_NormalFG = -1                    ! Set color values for GBAR:KodeBarcode
  SELF.Q.GBAR:KodeBarcode_NormalBG = -1
  SELF.Q.GBAR:KodeBarcode_SelectedFG = -1
  SELF.Q.GBAR:KodeBarcode_SelectedBG = -1


BRW5.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW5.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF choice(?Sheet1)=2
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

