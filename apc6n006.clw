

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N006.INC'),ONCE        !Local module procedure declarations
                     END


SelectDokter PROCEDURE                                     ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(JDokter)
                       PROJECT(JDok:Kode_Dokter)
                       PROJECT(JDok:Nama_Dokter)
                       PROJECT(JDok:Status)
                       PROJECT(JDok:Keterangan)
                       PROJECT(JDok:Tlp_Rumah)
                       PROJECT(JDok:Tlp_Tmp_Praktek)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
JDok:Kode_Dokter       LIKE(JDok:Kode_Dokter)         !List box control field - type derived from field
JDok:Nama_Dokter       LIKE(JDok:Nama_Dokter)         !List box control field - type derived from field
JDok:Status            LIKE(JDok:Status)              !List box control field - type derived from field
JDok:Keterangan        LIKE(JDok:Keterangan)          !List box control field - type derived from field
JDok:Tlp_Rumah         LIKE(JDok:Tlp_Rumah)           !List box control field - type derived from field
JDok:Tlp_Tmp_Praktek   LIKE(JDok:Tlp_Tmp_Praktek)     !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Dokter'),AT(,,415,240),FONT('Arial',8,,),CENTER,IMM,HLP('SelectDokter'),SYSTEM,GRAY,MDI
                       LIST,AT(8,19,400,194),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('32L(2)|M~KODE~@s5@126L(2)|M~NAMA~@s30@44L(2)|M~Status~@s10@111L(2)|M~Keterangan~' &|
   '@s30@80L(2)|M~Tlp Rumah~@s20@80L(2)|M~Tlp Tmp Praktek~@s20@'),FROM(Queue:Browse:1)
                       BUTTON('&Pilih'),AT(176,218,45,14),USE(?Select:2),DEFAULT
                       SHEET,AT(3,1,409,236),USE(?CurrentTab)
                         TAB('Nama (&F2)'),USE(?Tab:3),KEY(F2Key)
                           PROMPT('NAMA_DR:'),AT(10,219),USE(?JDok:Nama_Dokter:Prompt)
                           ENTRY(@s30),AT(60,219,60,10),USE(JDok:Nama_Dokter),MSG('Nama Dokter'),TIP('Nama Dokter'),UPR
                         END
                         TAB('NIK (F3)'),USE(?Tab:2),KEY(F3Key)
                           PROMPT('KODE_DR:'),AT(11,219),USE(?JDok:Kode_Dokter:Prompt)
                           ENTRY(@s5),AT(61,219,60,10),USE(JDok:Kode_Dokter),MSG('Kode Dokter'),TIP('Kode Dokter'),UPR
                         END
                       END
                       BUTTON('&Selesai'),AT(225,218,45,14),USE(?Close)
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
BRW1::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('SelectDokter')
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
  Relate:JDokter.Open                                      ! File JStatusDr used by this procedure, so make sure it's RelationManager is open
  Relate:JSUMDR.Open                                       ! File JStatusDr used by this procedure, so make sure it's RelationManager is open
  Relate:JStatusDr.Open                                    ! File JStatusDr used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:JDokter,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,JDok:KeyKodeDokter)                   ! Add the sort order for JDok:KeyKodeDokter for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?JDok:Kode_Dokter,JDok:Kode_Dokter,,BRW1) ! Initialize the browse locator using ?JDok:Kode_Dokter using key: JDok:KeyKodeDokter , JDok:Kode_Dokter
  BRW1.AddSortOrder(,JDok:KeyKodeDokter)                   ! Add the sort order for JDok:KeyKodeDokter for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?JDok:Nama_Dokter,JDok:Kode_Dokter,,BRW1) ! Initialize the browse locator using ?JDok:Nama_Dokter using key: JDok:KeyKodeDokter , JDok:Kode_Dokter
  BRW1.AddField(JDok:Kode_Dokter,BRW1.Q.JDok:Kode_Dokter)  ! Field JDok:Kode_Dokter is a hot field or requires assignment from browse
  BRW1.AddField(JDok:Nama_Dokter,BRW1.Q.JDok:Nama_Dokter)  ! Field JDok:Nama_Dokter is a hot field or requires assignment from browse
  BRW1.AddField(JDok:Status,BRW1.Q.JDok:Status)            ! Field JDok:Status is a hot field or requires assignment from browse
  BRW1.AddField(JDok:Keterangan,BRW1.Q.JDok:Keterangan)    ! Field JDok:Keterangan is a hot field or requires assignment from browse
  BRW1.AddField(JDok:Tlp_Rumah,BRW1.Q.JDok:Tlp_Rumah)      ! Field JDok:Tlp_Rumah is a hot field or requires assignment from browse
  BRW1.AddField(JDok:Tlp_Tmp_Praktek,BRW1.Q.JDok:Tlp_Tmp_Praktek) ! Field JDok:Tlp_Tmp_Praktek is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectDokter',QuickWindow)                 ! Restore window settings from non-volatile store
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
    Relate:JDokter.Close
    Relate:JSUMDR.Close
    Relate:JStatusDr.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectDokter',QuickWindow)              ! Save window data to non-volatile store
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

SelectJTransaksiMR PROCEDURE                               ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
vl_tanggal           DATE                                  !
vl_tanggal0          DATE                                  !
BRW1::View:Browse    VIEW(JTransaksi)
                       PROJECT(JTra:No_Nota)
                       PROJECT(JTra:Tanggal)
                       PROJECT(JTra:NamaJawab)
                       PROJECT(JTra:AlamatJawab)
                       PROJECT(JTra:Nomor_Mr)
                       PROJECT(JTra:Kode_poli)
                       PROJECT(JTra:BiayaRSI)
                       PROJECT(JTra:Baru_Lama)
                       PROJECT(JTra:BiayaDokter)
                       PROJECT(JTra:BiayaTotal)
                       PROJECT(JTra:Kode_Transaksi)
                       PROJECT(JTra:NIP)
                       PROJECT(JTra:Status)
                       PROJECT(JTra:Kontraktor)
                       PROJECT(JTra:LamaBaru)
                       PROJECT(JTra:StatusBatal)
                       PROJECT(JTra:Kode_dokter)
                       PROJECT(JTra:Rujukan)
                       PROJECT(JTra:Selesai)
                       PROJECT(JTra:Cetak)
                       JOIN(JDok:KeyKodeDokter,JTra:Kode_dokter)
                         PROJECT(JDok:Nama_Dokter)
                         PROJECT(JDok:Kode_Dokter)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
JTra:No_Nota           LIKE(JTra:No_Nota)             !List box control field - type derived from field
JTra:No_Nota_NormalFG  LONG                           !Normal forground color
JTra:No_Nota_NormalBG  LONG                           !Normal background color
JTra:No_Nota_SelectedFG LONG                          !Selected forground color
JTra:No_Nota_SelectedBG LONG                          !Selected background color
JTra:Tanggal           LIKE(JTra:Tanggal)             !List box control field - type derived from field
JTra:NamaJawab         LIKE(JTra:NamaJawab)           !List box control field - type derived from field
JTra:AlamatJawab       LIKE(JTra:AlamatJawab)         !List box control field - type derived from field
JTra:Nomor_Mr          LIKE(JTra:Nomor_Mr)            !List box control field - type derived from field
JTra:Kode_poli         LIKE(JTra:Kode_poli)           !List box control field - type derived from field
JDok:Nama_Dokter       LIKE(JDok:Nama_Dokter)         !List box control field - type derived from field
JTra:BiayaRSI          LIKE(JTra:BiayaRSI)            !List box control field - type derived from field
JTra:Baru_Lama         LIKE(JTra:Baru_Lama)           !List box control field - type derived from field
JTra:BiayaDokter       LIKE(JTra:BiayaDokter)         !List box control field - type derived from field
JTra:BiayaTotal        LIKE(JTra:BiayaTotal)          !List box control field - type derived from field
JTra:Kode_Transaksi    LIKE(JTra:Kode_Transaksi)      !List box control field - type derived from field
JTra:NIP               LIKE(JTra:NIP)                 !List box control field - type derived from field
JTra:Status            LIKE(JTra:Status)              !List box control field - type derived from field
JTra:Kontraktor        LIKE(JTra:Kontraktor)          !List box control field - type derived from field
JTra:LamaBaru          LIKE(JTra:LamaBaru)            !List box control field - type derived from field
JTra:StatusBatal       LIKE(JTra:StatusBatal)         !List box control field - type derived from field
JTra:Kode_dokter       LIKE(JTra:Kode_dokter)         !List box control field - type derived from field
JTra:Rujukan           LIKE(JTra:Rujukan)             !Browse key field - type derived from field
JTra:Selesai           LIKE(JTra:Selesai)             !Browse key field - type derived from field
JTra:Cetak             LIKE(JTra:Cetak)               !Browse key field - type derived from field
JDok:Kode_Dokter       LIKE(JDok:Kode_Dokter)         !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Pendaftaran Rawat Jalan'),AT(,,358,195),FONT('Arial',8,,),CENTER,IMM,HLP('BrowseJTransaksi'),SYSTEM,GRAY,MDI
                       LIST,AT(8,21,342,133),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('47R(2)|M*~No Nota~C(0)@s10@50R(2)|M~Tanggal~C(0)@D06@139R(2)|M~Nama~C(0)@s40@159' &|
   'R(2)|M~Alamat~C(0)@s50@56R(2)|M~Nomor Mr~C(0)@N010_@47L(2)|M~Kode poli~@s10@120L' &|
   '(2)|M~Dokter~@s30@60D(18)|M~Biaya RSI~C(0)@n14.2@40L(2)|M~Baru Lama~@s1@60D(12)|' &|
   'M~Biaya Dokter~C(0)@n14.2@60D(14)|M~Biaya Total~C(0)@n14.2@60R(2)|M~Kode Transak' &|
   'si~C(0)@n1@28R(2)|M~NIP~C(0)@s7@4R(2)|M~Status~C(0)@s1@40R(2)|M~Kontraktor~C(0)@' &|
   's10@12R(2)|M~Lama Baru~C(0)@n3@12R(2)|M~Status Batal~C(0)@n3@40R(2)|M~Kode dokte' &|
   'r~C(0)@s10@'),FROM(Queue:Browse:1)
                       BUTTON('&Pilih'),AT(305,158,45,14),USE(?Select:2)
                       BOX,AT(11,179,16,14),USE(?Box1),COLOR(COLOR:Black),FILL(COLOR:Red)
                       STRING('Transaksi Batal'),AT(31,182),USE(?String1)
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('Nomor MR (F2)'),USE(?Tab:2),KEY(F2Key)
                           PROMPT('&NOMOR MR:'),AT(9,159),USE(?JTra:Nomor_Mr:Prompt)
                           ENTRY(@N10),AT(59,159,60,10),USE(JTra:Nomor_Mr),RIGHT(1),MSG('Nomor KIUP'),TIP('Nomor KIUP')
                         END
                       END
                       BUTTON('&Selesai'),AT(305,180,45,14),USE(?Close)
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
SetQueueRecord         PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
BRW1::Sort5:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 6
BRW1::Sort6:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 7
BRW1::Sort7:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 8
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
  GlobalErrors.SetProcedureName('SelectJTransaksiMR')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('vl_tanggal0',vl_tanggal0)                          ! Added by: BrowseBox(ABC)
  BIND('vl_tanggal',vl_tanggal)                            ! Added by: BrowseBox(ABC)
  BIND('glo:mr',glo:mr)                                    ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  vl_tanggal=today()
  vl_tanggal0=today()-4
  display
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:JDokter.Open                                      ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:JHBILLING.Open                                    ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:JPTmpKel.Open                                     ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:JRujuk.Open                                       ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:JTbTransaksi.Open                                 ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPoli.UseFile                                     ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JTBayar.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JTindaka.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:JTransaksi,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,JTra:KeyKodeDokter)                   ! Add the sort order for JTra:KeyKodeDokter for sort order 1
  BRW1.AddSortOrder(,JTra:KeyRujukan)                      ! Add the sort order for JTra:KeyRujukan for sort order 2
  BRW1.AddSortOrder(,JTra:KeyKodePoli)                     ! Add the sort order for JTra:KeyKodePoli for sort order 3
  BRW1.AddSortOrder(,JTra:KeyTanggal)                      ! Add the sort order for JTra:KeyTanggal for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,JTra:Tanggal,1,BRW1)           ! Initialize the browse locator using  using key: JTra:KeyTanggal , JTra:Tanggal
  BRW1.AddSortOrder(,JTra:KeyNoNota)                       ! Add the sort order for JTra:KeyNoNota for sort order 5
  BRW1.AddLocator(BRW1::Sort5:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort5:Locator.Init(,JTra:No_Nota,1,BRW1)           ! Initialize the browse locator using  using key: JTra:KeyNoNota , JTra:No_Nota
  BRW1.AddSortOrder(,JTra:KeySelesai)                      ! Add the sort order for JTra:KeySelesai for sort order 6
  BRW1.AddLocator(BRW1::Sort6:Locator)                     ! Browse has a locator for sort order 6
  BRW1::Sort6:Locator.Init(,JTra:Selesai,1,BRW1)           ! Initialize the browse locator using  using key: JTra:KeySelesai , JTra:Selesai
  BRW1.AddSortOrder(,JTra:KeyCetak)                        ! Add the sort order for JTra:KeyCetak for sort order 7
  BRW1.AddLocator(BRW1::Sort7:Locator)                     ! Browse has a locator for sort order 7
  BRW1::Sort7:Locator.Init(,JTra:Cetak,1,BRW1)             ! Initialize the browse locator using  using key: JTra:KeyCetak , JTra:Cetak
  BRW1.AddSortOrder(,JTra:KeyTransaksi)                    ! Add the sort order for JTra:KeyTransaksi for sort order 8
  BRW1.AddSortOrder(,JTra:descnota_jtransaksi_ik)          ! Add the sort order for JTra:descnota_jtransaksi_ik for sort order 9
  BRW1.SetFilter('(JTRA:Tanggal>=vl_tanggal0 and JTRA:Tanggal<<=vl_tanggal and jtra:nomor_mr=glo:mr)') ! Apply filter expression to browse
  BRW1.AddField(JTra:No_Nota,BRW1.Q.JTra:No_Nota)          ! Field JTra:No_Nota is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Tanggal,BRW1.Q.JTra:Tanggal)          ! Field JTra:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(JTra:NamaJawab,BRW1.Q.JTra:NamaJawab)      ! Field JTra:NamaJawab is a hot field or requires assignment from browse
  BRW1.AddField(JTra:AlamatJawab,BRW1.Q.JTra:AlamatJawab)  ! Field JTra:AlamatJawab is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Nomor_Mr,BRW1.Q.JTra:Nomor_Mr)        ! Field JTra:Nomor_Mr is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Kode_poli,BRW1.Q.JTra:Kode_poli)      ! Field JTra:Kode_poli is a hot field or requires assignment from browse
  BRW1.AddField(JDok:Nama_Dokter,BRW1.Q.JDok:Nama_Dokter)  ! Field JDok:Nama_Dokter is a hot field or requires assignment from browse
  BRW1.AddField(JTra:BiayaRSI,BRW1.Q.JTra:BiayaRSI)        ! Field JTra:BiayaRSI is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Baru_Lama,BRW1.Q.JTra:Baru_Lama)      ! Field JTra:Baru_Lama is a hot field or requires assignment from browse
  BRW1.AddField(JTra:BiayaDokter,BRW1.Q.JTra:BiayaDokter)  ! Field JTra:BiayaDokter is a hot field or requires assignment from browse
  BRW1.AddField(JTra:BiayaTotal,BRW1.Q.JTra:BiayaTotal)    ! Field JTra:BiayaTotal is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Kode_Transaksi,BRW1.Q.JTra:Kode_Transaksi) ! Field JTra:Kode_Transaksi is a hot field or requires assignment from browse
  BRW1.AddField(JTra:NIP,BRW1.Q.JTra:NIP)                  ! Field JTra:NIP is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Status,BRW1.Q.JTra:Status)            ! Field JTra:Status is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Kontraktor,BRW1.Q.JTra:Kontraktor)    ! Field JTra:Kontraktor is a hot field or requires assignment from browse
  BRW1.AddField(JTra:LamaBaru,BRW1.Q.JTra:LamaBaru)        ! Field JTra:LamaBaru is a hot field or requires assignment from browse
  BRW1.AddField(JTra:StatusBatal,BRW1.Q.JTra:StatusBatal)  ! Field JTra:StatusBatal is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Kode_dokter,BRW1.Q.JTra:Kode_dokter)  ! Field JTra:Kode_dokter is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Rujukan,BRW1.Q.JTra:Rujukan)          ! Field JTra:Rujukan is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Selesai,BRW1.Q.JTra:Selesai)          ! Field JTra:Selesai is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Cetak,BRW1.Q.JTra:Cetak)              ! Field JTra:Cetak is a hot field or requires assignment from browse
  BRW1.AddField(JDok:Kode_Dokter,BRW1.Q.JDok:Kode_Dokter)  ! Field JDok:Kode_Dokter is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectJTransaksiMR',QuickWindow)           ! Restore window settings from non-volatile store
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
    Relate:JDokter.Close
    Relate:JHBILLING.Close
    Relate:JPTmpKel.Close
    Relate:JRujuk.Close
    Relate:JTbTransaksi.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectJTransaksiMR',QuickWindow)        ! Save window data to non-volatile store
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
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSIF CHOICE(?CurrentTab) = 5
    RETURN SELF.SetSort(4,Force)
  ELSIF CHOICE(?CurrentTab) = 6
    RETURN SELF.SetSort(5,Force)
  ELSIF CHOICE(?CurrentTab) = 7
    RETURN SELF.SetSort(6,Force)
  ELSIF CHOICE(?CurrentTab) = 8
    RETURN SELF.SetSort(7,Force)
  ELSIF CHOICE(?CurrentTab) = 9
    RETURN SELF.SetSort(8,Force)
  ELSE
    RETURN SELF.SetSort(9,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (jtra:statusbatal=1)
    SELF.Q.JTra:No_Nota_NormalFG = 255                     ! Set conditional color values for JTra:No_Nota
    SELF.Q.JTra:No_Nota_NormalBG = -1
    SELF.Q.JTra:No_Nota_SelectedFG = 255
    SELF.Q.JTra:No_Nota_SelectedBG = -1
  ELSE
    SELF.Q.JTra:No_Nota_NormalFG = -1                      ! Set color values for JTra:No_Nota
    SELF.Q.JTra:No_Nota_NormalBG = -1
    SELF.Q.JTra:No_Nota_SelectedFG = -1
    SELF.Q.JTra:No_Nota_SelectedBG = -1
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

SelectJTransaksiMRPengatur PROCEDURE                       ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
vl_tanggal           DATE                                  !
vl_tanggal0          DATE                                  !
BRW1::View:Browse    VIEW(JTransaksi)
                       PROJECT(JTra:No_Nota)
                       PROJECT(JTra:Tanggal)
                       PROJECT(JTra:NamaJawab)
                       PROJECT(JTra:AlamatJawab)
                       PROJECT(JTra:Nomor_Mr)
                       PROJECT(JTra:Kode_poli)
                       PROJECT(JTra:BiayaRSI)
                       PROJECT(JTra:Baru_Lama)
                       PROJECT(JTra:BiayaDokter)
                       PROJECT(JTra:BiayaTotal)
                       PROJECT(JTra:Kode_Transaksi)
                       PROJECT(JTra:NIP)
                       PROJECT(JTra:Status)
                       PROJECT(JTra:Kontraktor)
                       PROJECT(JTra:LamaBaru)
                       PROJECT(JTra:StatusBatal)
                       PROJECT(JTra:Kode_dokter)
                       PROJECT(JTra:Rujukan)
                       PROJECT(JTra:Selesai)
                       PROJECT(JTra:Cetak)
                       JOIN(JDok:KeyKodeDokter,JTra:Kode_dokter)
                         PROJECT(JDok:Nama_Dokter)
                         PROJECT(JDok:Kode_Dokter)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
JTra:No_Nota           LIKE(JTra:No_Nota)             !List box control field - type derived from field
JTra:No_Nota_NormalFG  LONG                           !Normal forground color
JTra:No_Nota_NormalBG  LONG                           !Normal background color
JTra:No_Nota_SelectedFG LONG                          !Selected forground color
JTra:No_Nota_SelectedBG LONG                          !Selected background color
JTra:Tanggal           LIKE(JTra:Tanggal)             !List box control field - type derived from field
JTra:NamaJawab         LIKE(JTra:NamaJawab)           !List box control field - type derived from field
JTra:AlamatJawab       LIKE(JTra:AlamatJawab)         !List box control field - type derived from field
JTra:Nomor_Mr          LIKE(JTra:Nomor_Mr)            !List box control field - type derived from field
JTra:Kode_poli         LIKE(JTra:Kode_poli)           !List box control field - type derived from field
JDok:Nama_Dokter       LIKE(JDok:Nama_Dokter)         !List box control field - type derived from field
JTra:BiayaRSI          LIKE(JTra:BiayaRSI)            !List box control field - type derived from field
JTra:Baru_Lama         LIKE(JTra:Baru_Lama)           !List box control field - type derived from field
JTra:BiayaDokter       LIKE(JTra:BiayaDokter)         !List box control field - type derived from field
JTra:BiayaTotal        LIKE(JTra:BiayaTotal)          !List box control field - type derived from field
JTra:Kode_Transaksi    LIKE(JTra:Kode_Transaksi)      !List box control field - type derived from field
JTra:NIP               LIKE(JTra:NIP)                 !List box control field - type derived from field
JTra:Status            LIKE(JTra:Status)              !List box control field - type derived from field
JTra:Kontraktor        LIKE(JTra:Kontraktor)          !List box control field - type derived from field
JTra:LamaBaru          LIKE(JTra:LamaBaru)            !List box control field - type derived from field
JTra:StatusBatal       LIKE(JTra:StatusBatal)         !List box control field - type derived from field
JTra:Kode_dokter       LIKE(JTra:Kode_dokter)         !List box control field - type derived from field
JTra:Rujukan           LIKE(JTra:Rujukan)             !Browse key field - type derived from field
JTra:Selesai           LIKE(JTra:Selesai)             !Browse key field - type derived from field
JTra:Cetak             LIKE(JTra:Cetak)               !Browse key field - type derived from field
JDok:Kode_Dokter       LIKE(JDok:Kode_Dokter)         !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Pendaftaran Rawat Jalan'),AT(,,358,195),FONT('Arial',8,,),CENTER,IMM,HLP('BrowseJTransaksi'),SYSTEM,GRAY,MDI
                       LIST,AT(8,21,342,133),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('47R(2)|M*~No Nota~C(0)@s10@50R(2)|M~Tanggal~C(0)@D06@139R(2)|M~Nama~C(0)@s40@159' &|
   'R(2)|M~Alamat~C(0)@s50@56R(2)|M~Nomor Mr~C(0)@N010_@47L(2)|M~Kode poli~@s10@120L' &|
   '(2)|M~Dokter~@s30@60D(18)|M~Biaya RSI~C(0)@n14.2@40L(2)|M~Baru Lama~@s1@60D(12)|' &|
   'M~Biaya Dokter~C(0)@n14.2@60D(14)|M~Biaya Total~C(0)@n14.2@60R(2)|M~Kode Transak' &|
   'si~C(0)@n1@28R(2)|M~NIP~C(0)@s7@4R(2)|M~Status~C(0)@s1@40R(2)|M~Kontraktor~C(0)@' &|
   's10@12R(2)|M~Lama Baru~C(0)@n3@12R(2)|M~Status Batal~C(0)@n3@40R(2)|M~Kode dokte' &|
   'r~C(0)@s10@'),FROM(Queue:Browse:1)
                       BUTTON('&Pilih'),AT(305,158,45,14),USE(?Select:2)
                       BOX,AT(11,179,16,14),USE(?Box1),COLOR(COLOR:Black),FILL(COLOR:Red)
                       STRING('Transaksi Batal'),AT(31,182),USE(?String1)
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('Nomor MR (F2)'),USE(?Tab:2),KEY(F2Key)
                           PROMPT('&NOMOR MR:'),AT(9,159),USE(?JTra:Nomor_Mr:Prompt)
                           ENTRY(@N10),AT(59,159,60,10),USE(JTra:Nomor_Mr),RIGHT(1),MSG('Nomor KIUP'),TIP('Nomor KIUP')
                         END
                       END
                       BUTTON('&Selesai'),AT(305,180,45,14),USE(?Close)
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
SetQueueRecord         PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
BRW1::Sort5:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 6
BRW1::Sort6:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 7
BRW1::Sort7:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 8
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
  GlobalErrors.SetProcedureName('SelectJTransaksiMRPengatur')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('vl_tanggal0',vl_tanggal0)                          ! Added by: BrowseBox(ABC)
  BIND('vl_tanggal',vl_tanggal)                            ! Added by: BrowseBox(ABC)
  BIND('glo:mr',glo:mr)                                    ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  vl_tanggal=today()
  vl_tanggal0=date(month(today()),1,year(today()))
  display
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:JDokter.Open                                      ! File JTindaka used by this procedure, so make sure it's RelationManager is open
  Relate:JPTmpKel.Open                                     ! File JTindaka used by this procedure, so make sure it's RelationManager is open
  Relate:JRujuk.Open                                       ! File JTindaka used by this procedure, so make sure it's RelationManager is open
  Relate:JTbTransaksi.Open                                 ! File JTindaka used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPoli.UseFile                                     ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JTBayar.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JTindaka.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:JTransaksi,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,JTra:KeyKodeDokter)                   ! Add the sort order for JTra:KeyKodeDokter for sort order 1
  BRW1.AddSortOrder(,JTra:KeyRujukan)                      ! Add the sort order for JTra:KeyRujukan for sort order 2
  BRW1.AddSortOrder(,JTra:KeyKodePoli)                     ! Add the sort order for JTra:KeyKodePoli for sort order 3
  BRW1.AddSortOrder(,JTra:KeyTanggal)                      ! Add the sort order for JTra:KeyTanggal for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,JTra:Tanggal,1,BRW1)           ! Initialize the browse locator using  using key: JTra:KeyTanggal , JTra:Tanggal
  BRW1.AddSortOrder(,JTra:KeyNoNota)                       ! Add the sort order for JTra:KeyNoNota for sort order 5
  BRW1.AddLocator(BRW1::Sort5:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort5:Locator.Init(,JTra:No_Nota,1,BRW1)           ! Initialize the browse locator using  using key: JTra:KeyNoNota , JTra:No_Nota
  BRW1.AddSortOrder(,JTra:KeySelesai)                      ! Add the sort order for JTra:KeySelesai for sort order 6
  BRW1.AddLocator(BRW1::Sort6:Locator)                     ! Browse has a locator for sort order 6
  BRW1::Sort6:Locator.Init(,JTra:Selesai,1,BRW1)           ! Initialize the browse locator using  using key: JTra:KeySelesai , JTra:Selesai
  BRW1.AddSortOrder(,JTra:KeyCetak)                        ! Add the sort order for JTra:KeyCetak for sort order 7
  BRW1.AddLocator(BRW1::Sort7:Locator)                     ! Browse has a locator for sort order 7
  BRW1::Sort7:Locator.Init(,JTra:Cetak,1,BRW1)             ! Initialize the browse locator using  using key: JTra:KeyCetak , JTra:Cetak
  BRW1.AddSortOrder(,JTra:KeyTransaksi)                    ! Add the sort order for JTra:KeyTransaksi for sort order 8
  BRW1.AddSortOrder(,JTra:descnota_jtransaksi_ik)          ! Add the sort order for JTra:descnota_jtransaksi_ik for sort order 9
  BRW1.SetFilter('(JTRA:Tanggal>=vl_tanggal0 and JTRA:Tanggal<<=vl_tanggal and jtra:nomor_mr=glo:mr)') ! Apply filter expression to browse
  BRW1.AddField(JTra:No_Nota,BRW1.Q.JTra:No_Nota)          ! Field JTra:No_Nota is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Tanggal,BRW1.Q.JTra:Tanggal)          ! Field JTra:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(JTra:NamaJawab,BRW1.Q.JTra:NamaJawab)      ! Field JTra:NamaJawab is a hot field or requires assignment from browse
  BRW1.AddField(JTra:AlamatJawab,BRW1.Q.JTra:AlamatJawab)  ! Field JTra:AlamatJawab is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Nomor_Mr,BRW1.Q.JTra:Nomor_Mr)        ! Field JTra:Nomor_Mr is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Kode_poli,BRW1.Q.JTra:Kode_poli)      ! Field JTra:Kode_poli is a hot field or requires assignment from browse
  BRW1.AddField(JDok:Nama_Dokter,BRW1.Q.JDok:Nama_Dokter)  ! Field JDok:Nama_Dokter is a hot field or requires assignment from browse
  BRW1.AddField(JTra:BiayaRSI,BRW1.Q.JTra:BiayaRSI)        ! Field JTra:BiayaRSI is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Baru_Lama,BRW1.Q.JTra:Baru_Lama)      ! Field JTra:Baru_Lama is a hot field or requires assignment from browse
  BRW1.AddField(JTra:BiayaDokter,BRW1.Q.JTra:BiayaDokter)  ! Field JTra:BiayaDokter is a hot field or requires assignment from browse
  BRW1.AddField(JTra:BiayaTotal,BRW1.Q.JTra:BiayaTotal)    ! Field JTra:BiayaTotal is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Kode_Transaksi,BRW1.Q.JTra:Kode_Transaksi) ! Field JTra:Kode_Transaksi is a hot field or requires assignment from browse
  BRW1.AddField(JTra:NIP,BRW1.Q.JTra:NIP)                  ! Field JTra:NIP is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Status,BRW1.Q.JTra:Status)            ! Field JTra:Status is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Kontraktor,BRW1.Q.JTra:Kontraktor)    ! Field JTra:Kontraktor is a hot field or requires assignment from browse
  BRW1.AddField(JTra:LamaBaru,BRW1.Q.JTra:LamaBaru)        ! Field JTra:LamaBaru is a hot field or requires assignment from browse
  BRW1.AddField(JTra:StatusBatal,BRW1.Q.JTra:StatusBatal)  ! Field JTra:StatusBatal is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Kode_dokter,BRW1.Q.JTra:Kode_dokter)  ! Field JTra:Kode_dokter is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Rujukan,BRW1.Q.JTra:Rujukan)          ! Field JTra:Rujukan is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Selesai,BRW1.Q.JTra:Selesai)          ! Field JTra:Selesai is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Cetak,BRW1.Q.JTra:Cetak)              ! Field JTra:Cetak is a hot field or requires assignment from browse
  BRW1.AddField(JDok:Kode_Dokter,BRW1.Q.JDok:Kode_Dokter)  ! Field JDok:Kode_Dokter is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectJTransaksiMRPengatur',QuickWindow)   ! Restore window settings from non-volatile store
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
    Relate:JDokter.Close
    Relate:JPTmpKel.Close
    Relate:JRujuk.Close
    Relate:JTbTransaksi.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectJTransaksiMRPengatur',QuickWindow) ! Save window data to non-volatile store
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
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSIF CHOICE(?CurrentTab) = 5
    RETURN SELF.SetSort(4,Force)
  ELSIF CHOICE(?CurrentTab) = 6
    RETURN SELF.SetSort(5,Force)
  ELSIF CHOICE(?CurrentTab) = 7
    RETURN SELF.SetSort(6,Force)
  ELSIF CHOICE(?CurrentTab) = 8
    RETURN SELF.SetSort(7,Force)
  ELSIF CHOICE(?CurrentTab) = 9
    RETURN SELF.SetSort(8,Force)
  ELSE
    RETURN SELF.SetSort(9,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (jtra:statusbatal=1)
    SELF.Q.JTra:No_Nota_NormalFG = 255                     ! Set conditional color values for JTra:No_Nota
    SELF.Q.JTra:No_Nota_NormalBG = -1
    SELF.Q.JTra:No_Nota_SelectedFG = 255
    SELF.Q.JTra:No_Nota_SelectedBG = -1
  ELSE
    SELF.Q.JTra:No_Nota_NormalFG = -1                      ! Set color values for JTra:No_Nota
    SELF.Q.JTra:No_Nota_NormalBG = -1
    SELF.Q.JTra:No_Nota_SelectedFG = -1
    SELF.Q.JTra:No_Nota_SelectedBG = -1
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

cari_brg_lokal4 PROCEDURE                                  ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
loc::nama_brg        STRING(40)                            !Nama Barang
LOC::STOK            REAL                                  !Saldo
LOC::STOK2           REAL                                  !
BRW1::View:Browse    VIEW(GBarang)
                       PROJECT(GBAR:Kode_brg)
                       PROJECT(GBAR:Nama_Brg)
                       PROJECT(GBAR:Ket2)
                       PROJECT(GBAR:Kelompok)
                       PROJECT(GBAR:Status)
                       PROJECT(GBAR:FarNonFar)
                       JOIN(GSTO:KeyBarang,GBAR:Kode_brg)
                         PROJECT(GSTO:Saldo)
                         PROJECT(GSTO:Saldo_Minimal)
                         PROJECT(GSTO:Harga_Dasar)
                         PROJECT(GSTO:Kode_Apotik)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !List box control field - type derived from field
GBAR:Kode_brg_NormalFG LONG                           !Normal forground color
GBAR:Kode_brg_NormalBG LONG                           !Normal background color
GBAR:Kode_brg_SelectedFG LONG                         !Selected forground color
GBAR:Kode_brg_SelectedBG LONG                         !Selected background color
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Nama_Brg_NormalFG LONG                           !Normal forground color
GBAR:Nama_Brg_NormalBG LONG                           !Normal background color
GBAR:Nama_Brg_SelectedFG LONG                         !Selected forground color
GBAR:Nama_Brg_SelectedBG LONG                         !Selected background color
GBAR:Ket2              LIKE(GBAR:Ket2)                !List box control field - type derived from field
GBAR:Ket2_NormalFG     LONG                           !Normal forground color
GBAR:Ket2_NormalBG     LONG                           !Normal background color
GBAR:Ket2_SelectedFG   LONG                           !Selected forground color
GBAR:Ket2_SelectedBG   LONG                           !Selected background color
GSTO:Saldo             LIKE(GSTO:Saldo)               !List box control field - type derived from field
GSTO:Saldo_NormalFG    LONG                           !Normal forground color
GSTO:Saldo_NormalBG    LONG                           !Normal background color
GSTO:Saldo_SelectedFG  LONG                           !Selected forground color
GSTO:Saldo_SelectedBG  LONG                           !Selected background color
GSTO:Saldo_Minimal     LIKE(GSTO:Saldo_Minimal)       !List box control field - type derived from field
GSTO:Saldo_Minimal_NormalFG LONG                      !Normal forground color
GSTO:Saldo_Minimal_NormalBG LONG                      !Normal background color
GSTO:Saldo_Minimal_SelectedFG LONG                    !Selected forground color
GSTO:Saldo_Minimal_SelectedBG LONG                    !Selected background color
GSTO:Harga_Dasar       LIKE(GSTO:Harga_Dasar)         !List box control field - type derived from field
GSTO:Harga_Dasar_NormalFG LONG                        !Normal forground color
GSTO:Harga_Dasar_NormalBG LONG                        !Normal background color
GSTO:Harga_Dasar_SelectedFG LONG                      !Selected forground color
GSTO:Harga_Dasar_SelectedBG LONG                      !Selected background color
GBAR:Kelompok          LIKE(GBAR:Kelompok)            !List box control field - type derived from field
GBAR:Kelompok_NormalFG LONG                           !Normal forground color
GBAR:Kelompok_NormalBG LONG                           !Normal background color
GBAR:Kelompok_SelectedFG LONG                         !Selected forground color
GBAR:Kelompok_SelectedBG LONG                         !Selected background color
GBAR:Status            LIKE(GBAR:Status)              !List box control field - type derived from field
GBAR:Status_NormalFG   LONG                           !Normal forground color
GBAR:Status_NormalBG   LONG                           !Normal background color
GBAR:Status_SelectedFG LONG                           !Selected forground color
GBAR:Status_SelectedBG LONG                           !Selected background color
GSTO:Kode_Apotik       LIKE(GSTO:Kode_Apotik)         !List box control field - type derived from field
GSTO:Kode_Apotik_NormalFG LONG                        !Normal forground color
GSTO:Kode_Apotik_NormalBG LONG                        !Normal background color
GSTO:Kode_Apotik_SelectedFG LONG                      !Selected forground color
GSTO:Kode_Apotik_SelectedBG LONG                      !Selected background color
GBAR:FarNonFar         LIKE(GBAR:FarNonFar)           !List box control field - type derived from field
GBAR:FarNonFar_NormalFG LONG                          !Normal forground color
GBAR:FarNonFar_NormalBG LONG                          !Normal background color
GBAR:FarNonFar_SelectedFG LONG                        !Selected forground color
GBAR:FarNonFar_SelectedBG LONG                        !Selected background color
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Melihat Data Barang'),AT(,,417,190),FONT('Arial Narrow',10,,),IMM,HLP('cari_brg_lokal4'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,401,130),USE(?Browse:1),IMM,HVSCROLL,FONT(,12,,),MSG('Browsing Records'),FORMAT('48L(2)|M*~Kode Barang~@s10@137L(2)|M*~Nama Obat~@s40@58L(2)|M*~Kandungan~@s50@54' &|
   'R(2)|M*~Stok~L@n16.2@50D(2)|M*~Saldo Minimal~L@n16.2@65R(2)|M*~Harga Dasar~L@n15' &|
   '.2@24R(2)|M*~Kelompok~L@n6@12R(2)|M*~Status~L@n3@20R(2)|M*~Kode Apotik~L@s5@12R(' &|
   '2)|M*~Far Non Far~L@n3@'),FROM(Queue:Browse:1)
                       BUTTON('&Pilih'),AT(62,163,45,14),USE(?Select:2),HIDE
                       BUTTON('&STOK [Ctrl]'),AT(128,152,91,14),USE(?Button4),HIDE,KEY(529)
                       STRING(@n-12.2),AT(228,152,89,15),USE(LOC::STOK),HIDE,LEFT,FONT('Times New Roman',16,,FONT:regular),COLOR(0EEC41CH)
                       SHEET,AT(3,4,411,182),USE(?CurrentTab)
                         TAB('Kode Barang [F2]'),USE(?Tab:2),KEY(F2Key)
                           ENTRY(@s10),AT(63,152,60,10),USE(GBAR:Kode_brg),MSG('Kode Barang')
                           STRING('Saldo Minimal'),AT(165,171),USE(?String2),FONT('Times New Roman',,,,CHARSET:ANSI)
                           STRING(@N-12.2),AT(227,168,89,15),USE(LOC::STOK,,?LOC::STOK:2),HIDE,LEFT,FONT('Times New Roman',16,,FONT:regular),COLOR(0EEC41CH)
                           PROMPT('Kode Barang : '),AT(8,153),USE(?GBAR:Kode_brg:Prompt),FONT('Times New Roman',,,,CHARSET:ANSI)
                         END
                         TAB('Nama Barang [F3]'),USE(?Tab:3),KEY(F3Key)
                           PROMPT('Nama Barang : '),AT(12,153),USE(?GBAR:Nama_Brg:Prompt)
                           ENTRY(@s40),AT(63,152,60,10),USE(GBAR:Nama_Brg),MSG('Nama Barang')
                         END
                         TAB('Kandungan'),USE(?Tab3)
                           PROMPT('Kandungan:'),AT(8,153),USE(?GBAR:Ket2:Prompt)
                           ENTRY(@s50),AT(58,152,60,10),USE(GBAR:Ket2)
                         END
                       END
                       BUTTON('Close'),AT(13,163,45,14),USE(?Close),HIDE
                       BUTTON('Help'),AT(165,0,45,14),USE(?Help),DISABLE,HIDE,STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Open                   PROCEDURE(),DERIVED                 ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
SetQueueRecord         PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW1::Sort0:Locator  FilterLocatorClass                    ! Default Locator
BRW1::Sort1:Locator  FilterLocatorClass                    ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  FilterLocatorClass                    ! Conditional Locator - CHOICE(?CurrentTab) = 3
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
  GlobalErrors.SetProcedureName('cari_brg_lokal4')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo:apotikfilter',glo:apotikfilter)                ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:GBarang.Open                                      ! File vstokfifo used by this procedure, so make sure it's RelationManager is open
  Relate:vstokfifo.Open                                    ! File vstokfifo used by this procedure, so make sure it's RelationManager is open
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GBarang,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,GBAR:KeyNama)                         ! Add the sort order for GBAR:KeyNama for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?GBAR:Nama_Brg,GBAR:Nama_Brg,,BRW1) ! Initialize the browse locator using ?GBAR:Nama_Brg using key: GBAR:KeyNama , GBAR:Nama_Brg
  BRW1::Sort1:Locator.FloatRight = 1
  BRW1.SetFilter('(gbar:status=1 and gbar:farnonfar=0 and gsto:kode_apotik=glo:apotikfilter)') ! Apply filter expression to browse
  BRW1.AddSortOrder(,GBAR:keyNamaKandungan)                ! Add the sort order for GBAR:keyNamaKandungan for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(?GBAR:Ket2,GBAR:Ket2,1,BRW1)    ! Initialize the browse locator using ?GBAR:Ket2 using key: GBAR:keyNamaKandungan , GBAR:Ket2
  BRW1::Sort2:Locator.FloatRight = 1
  BRW1.SetFilter('(gbar:status=1 and gbar:farnonfar=0 and gsto:kode_apotik=glo:apotikfilter)') ! Apply filter expression to browse
  BRW1.AddSortOrder(,GBAR:KeyKodeBrg)                      ! Add the sort order for GBAR:KeyKodeBrg for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(?GBAR:Kode_brg,GBAR:Kode_brg,,BRW1) ! Initialize the browse locator using ?GBAR:Kode_brg using key: GBAR:KeyKodeBrg , GBAR:Kode_brg
  BRW1::Sort0:Locator.FloatRight = 1
  BRW1.SetFilter('(gbar:status=1 and gbar:farnonfar=0 and gsto:kode_apotik=glo:apotikfilter)') ! Apply filter expression to browse
  BRW1.AddField(GBAR:Kode_brg,BRW1.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Nama_Brg,BRW1.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Ket2,BRW1.Q.GBAR:Ket2)                ! Field GBAR:Ket2 is a hot field or requires assignment from browse
  BRW1.AddField(GSTO:Saldo,BRW1.Q.GSTO:Saldo)              ! Field GSTO:Saldo is a hot field or requires assignment from browse
  BRW1.AddField(GSTO:Saldo_Minimal,BRW1.Q.GSTO:Saldo_Minimal) ! Field GSTO:Saldo_Minimal is a hot field or requires assignment from browse
  BRW1.AddField(GSTO:Harga_Dasar,BRW1.Q.GSTO:Harga_Dasar)  ! Field GSTO:Harga_Dasar is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Kelompok,BRW1.Q.GBAR:Kelompok)        ! Field GBAR:Kelompok is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Status,BRW1.Q.GBAR:Status)            ! Field GBAR:Status is a hot field or requires assignment from browse
  BRW1.AddField(GSTO:Kode_Apotik,BRW1.Q.GSTO:Kode_Apotik)  ! Field GSTO:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:FarNonFar,BRW1.Q.GBAR:FarNonFar)      ! Field GBAR:FarNonFar is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('cari_brg_lokal4',QuickWindow)              ! Restore window settings from non-volatile store
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
    Relate:GBarang.Close
    Relate:vstokfifo.Close
  END
  IF SELF.Opened
    INIMgr.Update('cari_brg_lokal4',QuickWindow)           ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Open PROCEDURE

  CODE
  select(?Tab:3)
  PARENT.Open


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
    OF ?Button4
      !VST:kode_apotik = GL_entryapotik
      !VST:kode_barang = GBAR:Kode_brg
      !GET(vstokfifo,VST:primarykey)
      !IF NOT ERRORCODE()
      !    LOC::STOK = VST:jumlah
      !    DISPLAY
      !END
      !SELECT(?BROWSE:1)
      
      GSTO:Kode_Apotik = GL_entryapotik
      GSTO:Kode_Barang = GBAR:Kode_brg
      GET(gstokaptk,GSTO:KeyBarang)
      IF NOT ERRORCODE()
          LOC::STOK = GSTO:Saldo
          LOC::STOK2 = GSTO:Saldo_Minimal
          if LOC::STOK<=LOC::STOK2 then
             ?LOC::STOK{Prop:Color} = Color:yellow
          else
             ?LOC::STOK{Prop:Color} = Color:blue
          end
          DISPLAY
      END
      SELECT(?BROWSE:1)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Select:2
      ThisWindow.Update
      if GSTO:Saldo<=0 then
          message('Saldo tidak mencukupi')
          cycle
      end
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeNewSelection PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all NewSelection events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeNewSelection()
  LOC::STOK = ''
  LOC::STOK2 = ''
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
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (GSTO:Saldo<=GSTO:Saldo_minimal)
    SELF.Q.GBAR:Kode_brg_NormalFG = -1                     ! Set conditional color values for GBAR:Kode_brg
    SELF.Q.GBAR:Kode_brg_NormalBG = 65535
    SELF.Q.GBAR:Kode_brg_SelectedFG = 0
    SELF.Q.GBAR:Kode_brg_SelectedBG = 65535
  ELSE
    SELF.Q.GBAR:Kode_brg_NormalFG = -1                     ! Set color values for GBAR:Kode_brg
    SELF.Q.GBAR:Kode_brg_NormalBG = -1
    SELF.Q.GBAR:Kode_brg_SelectedFG = -1
    SELF.Q.GBAR:Kode_brg_SelectedBG = -1
  END
  IF (GSTO:Saldo<=GSTO:Saldo_minimal)
    SELF.Q.GBAR:Nama_Brg_NormalFG = -1                     ! Set conditional color values for GBAR:Nama_Brg
    SELF.Q.GBAR:Nama_Brg_NormalBG = 65535
    SELF.Q.GBAR:Nama_Brg_SelectedFG = 0
    SELF.Q.GBAR:Nama_Brg_SelectedBG = 65535
  ELSE
    SELF.Q.GBAR:Nama_Brg_NormalFG = -1                     ! Set color values for GBAR:Nama_Brg
    SELF.Q.GBAR:Nama_Brg_NormalBG = -1
    SELF.Q.GBAR:Nama_Brg_SelectedFG = -1
    SELF.Q.GBAR:Nama_Brg_SelectedBG = -1
  END
  IF (GSTO:Saldo<=GSTO:Saldo_minimal)
    SELF.Q.GBAR:Ket2_NormalFG = -1                         ! Set conditional color values for GBAR:Ket2
    SELF.Q.GBAR:Ket2_NormalBG = 65535
    SELF.Q.GBAR:Ket2_SelectedFG = 0
    SELF.Q.GBAR:Ket2_SelectedBG = 65535
  ELSE
    SELF.Q.GBAR:Ket2_NormalFG = -1                         ! Set color values for GBAR:Ket2
    SELF.Q.GBAR:Ket2_NormalBG = -1
    SELF.Q.GBAR:Ket2_SelectedFG = -1
    SELF.Q.GBAR:Ket2_SelectedBG = -1
  END
  IF (GSTO:Saldo<=GSTO:Saldo_minimal)
    SELF.Q.GSTO:Saldo_NormalFG = -1                        ! Set conditional color values for GSTO:Saldo
    SELF.Q.GSTO:Saldo_NormalBG = 65535
    SELF.Q.GSTO:Saldo_SelectedFG = 0
    SELF.Q.GSTO:Saldo_SelectedBG = 65535
  ELSE
    SELF.Q.GSTO:Saldo_NormalFG = -1                        ! Set color values for GSTO:Saldo
    SELF.Q.GSTO:Saldo_NormalBG = -1
    SELF.Q.GSTO:Saldo_SelectedFG = -1
    SELF.Q.GSTO:Saldo_SelectedBG = -1
  END
  IF (GSTO:Saldo<=GSTO:Saldo_minimal)
    SELF.Q.GSTO:Saldo_Minimal_NormalFG = -1                ! Set conditional color values for GSTO:Saldo_Minimal
    SELF.Q.GSTO:Saldo_Minimal_NormalBG = 65535
    SELF.Q.GSTO:Saldo_Minimal_SelectedFG = 0
    SELF.Q.GSTO:Saldo_Minimal_SelectedBG = 65535
  ELSE
    SELF.Q.GSTO:Saldo_Minimal_NormalFG = -1                ! Set color values for GSTO:Saldo_Minimal
    SELF.Q.GSTO:Saldo_Minimal_NormalBG = -1
    SELF.Q.GSTO:Saldo_Minimal_SelectedFG = -1
    SELF.Q.GSTO:Saldo_Minimal_SelectedBG = -1
  END
  IF (GSTO:Saldo<=GSTO:Saldo_minimal)
    SELF.Q.GSTO:Harga_Dasar_NormalFG = -1                  ! Set conditional color values for GSTO:Harga_Dasar
    SELF.Q.GSTO:Harga_Dasar_NormalBG = 65535
    SELF.Q.GSTO:Harga_Dasar_SelectedFG = 0
    SELF.Q.GSTO:Harga_Dasar_SelectedBG = 65535
  ELSE
    SELF.Q.GSTO:Harga_Dasar_NormalFG = -1                  ! Set color values for GSTO:Harga_Dasar
    SELF.Q.GSTO:Harga_Dasar_NormalBG = -1
    SELF.Q.GSTO:Harga_Dasar_SelectedFG = -1
    SELF.Q.GSTO:Harga_Dasar_SelectedBG = -1
  END
  IF (GSTO:Saldo<=GSTO:Saldo_minimal)
    SELF.Q.GBAR:Kelompok_NormalFG = -1                     ! Set conditional color values for GBAR:Kelompok
    SELF.Q.GBAR:Kelompok_NormalBG = 65535
    SELF.Q.GBAR:Kelompok_SelectedFG = 0
    SELF.Q.GBAR:Kelompok_SelectedBG = 65535
  ELSE
    SELF.Q.GBAR:Kelompok_NormalFG = -1                     ! Set color values for GBAR:Kelompok
    SELF.Q.GBAR:Kelompok_NormalBG = -1
    SELF.Q.GBAR:Kelompok_SelectedFG = -1
    SELF.Q.GBAR:Kelompok_SelectedBG = -1
  END
  IF (GSTO:Saldo<=GSTO:Saldo_minimal)
    SELF.Q.GBAR:Status_NormalFG = -1                       ! Set conditional color values for GBAR:Status
    SELF.Q.GBAR:Status_NormalBG = 65535
    SELF.Q.GBAR:Status_SelectedFG = 0
    SELF.Q.GBAR:Status_SelectedBG = 65535
  ELSE
    SELF.Q.GBAR:Status_NormalFG = -1                       ! Set color values for GBAR:Status
    SELF.Q.GBAR:Status_NormalBG = -1
    SELF.Q.GBAR:Status_SelectedFG = -1
    SELF.Q.GBAR:Status_SelectedBG = -1
  END
  IF (GSTO:Saldo<=GSTO:Saldo_minimal)
    SELF.Q.GSTO:Kode_Apotik_NormalFG = -1                  ! Set conditional color values for GSTO:Kode_Apotik
    SELF.Q.GSTO:Kode_Apotik_NormalBG = 65535
    SELF.Q.GSTO:Kode_Apotik_SelectedFG = 0
    SELF.Q.GSTO:Kode_Apotik_SelectedBG = 65535
  ELSE
    SELF.Q.GSTO:Kode_Apotik_NormalFG = -1                  ! Set color values for GSTO:Kode_Apotik
    SELF.Q.GSTO:Kode_Apotik_NormalBG = -1
    SELF.Q.GSTO:Kode_Apotik_SelectedFG = -1
    SELF.Q.GSTO:Kode_Apotik_SelectedBG = -1
  END
  IF (GSTO:Saldo<=GSTO:Saldo_minimal)
    SELF.Q.GBAR:FarNonFar_NormalFG = -1                    ! Set conditional color values for GBAR:FarNonFar
    SELF.Q.GBAR:FarNonFar_NormalBG = 65535
    SELF.Q.GBAR:FarNonFar_SelectedFG = 0
    SELF.Q.GBAR:FarNonFar_SelectedBG = 65535
  ELSE
    SELF.Q.GBAR:FarNonFar_NormalFG = -1                    ! Set color values for GBAR:FarNonFar
    SELF.Q.GBAR:FarNonFar_NormalBG = -1
    SELF.Q.GBAR:FarNonFar_SelectedFG = -1
    SELF.Q.GBAR:FarNonFar_SelectedBG = -1
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

UpdateAPDTcam PROCEDURE                                    ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
tombol_ok            BYTE                                  !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
loc::hitung          BYTE                                  !
History::APD1:Record LIKE(APD1:RECORD),THREAD
QuickWindow          WINDOW('Merubah Data Obat Campur'),AT(,,325,165),FONT('Arial',8,,),IMM,HLP('UpdateAPDTcam'),SYSTEM,GRAY,MDI
                       PROMPT('No Transaksi :'),AT(77,4),USE(?APD1:N0_tran:Prompt)
                       ENTRY(@s15),AT(130,4,64,10),USE(APD1:N0_tran),DISABLE,MSG('nomor transaksi'),TIP('nomor transaksi')
                       PROMPT('No. Camp. :'),AT(205,4),USE(?APD1:Camp:Prompt),FONT('Times New Roman',10,COLOR:Black,)
                       ENTRY(@n2),AT(258,5,40,10),USE(APD1:Camp),DISABLE
                       SHEET,AT(7,16,315,117),USE(?CurrentTab)
                         TAB('Data Obat'),USE(?Tab:1)
                           PROMPT('Kode Barang:'),AT(11,40),USE(?APD1:Kode_brg:Prompt)
                           ENTRY(@s10),AT(65,37,65,13),USE(APD1:Kode_brg),FONT('Times New Roman',14,COLOR:Black,),MSG('Kode Barang'),TIP('Kode Barang')
                           BUTTON('&H'),AT(133,36,12,12),USE(?CallLookup),KEY(F2Key)
                           STRING(@s40),AT(157,39),USE(GBAR:Nama_Brg)
                           PROMPT('Jumlah:'),AT(11,60),USE(?APD1:Jumlah:Prompt)
                           ENTRY(@n-14.2),AT(65,60,65,14),USE(APD1:Jumlah),DECIMAL(14),FONT('Times New Roman',12,COLOR:Black,),MSG('Jumlah'),TIP('Jumlah')
                           IMAGE('YRPLUS.ICO'),AT(183,58,19,20),USE(?Image1)
                           IMAGE('YRPLUS.ICO'),AT(203,58,19,20),USE(?Image2)
                           GROUP('Nilai Konversi'),AT(233,60,75,49),USE(?Group1),BOXED,FONT('Times New Roman',10,COLOR:Black,)
                             STRING(@s10),AT(244,71),USE(APB:Sat_besar),LEFT(1)
                             STRING('='),AT(291,71),USE(?String5),FONT(,,,FONT:bold)
                             STRING(@n-14),AT(244,84,52,9),USE(APB:Nilai_konversi)
                             STRING(@s10),AT(244,95),USE(APB:Sat_kecil,,?APB:Sat_kecil:2)
                           END
                           STRING(@s10),AT(139,63),USE(APB:Sat_kecil),FONT('Times New Roman',10,COLOR:Black,)
                           BUTTON('Hitung (F4)'),AT(65,81,65,25),USE(?Button5),LEFT,FONT('Arial',8,,FONT:bold),KEY(F4Key),ICON(ICON:Exclamation)
                           BUTTON('&K [F5]'),AT(140,81,29,25),USE(?Button6),KEY(F5Key)
                           PROMPT('Total:'),AT(11,111),USE(?APD1:Total:Prompt)
                           ENTRY(@n11.2),AT(65,111,65,13),USE(APD1:Total),DECIMAL(14),FONT('Times New Roman',10,COLOR:Black,),MSG('Harga Dasar'),TIP('Harga Dasar')
                         END
                       END
                       BUTTON('&OK [End]'),AT(203,138,87,22),USE(?OK),LEFT,FONT('Arial',9,,),KEY(EndKey),ICON(ICON:Save),DEFAULT
                       BUTTON('&Batal'),AT(100,139,87,22),USE(?Cancel),LEFT,FONT('Arial',9,,),ICON(ICON:Cross)
                       BUTTON('Help'),AT(1,143,45,14),USE(?Help),STD(STD:Help)
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
  ?APD1:Total{PROP:READONLY}=TRUE
  APD1:Jumlah{PROP:DISABLE}=1
  IF Dtd_ndtd = 2 THEN ?Button5{PROP:DISABLE}=1.
  ?OK{PROP:DISABLE}=1
  APD1:N0_tran = glo::no_nota
  APD1:Camp= glo::campur
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateAPDTcam')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APD1:N0_tran:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APD1:Record,History::APD1:Record)
  SELF.AddHistoryField(?APD1:N0_tran,1)
  SELF.AddHistoryField(?APD1:Camp,6)
  SELF.AddHistoryField(?APD1:Kode_brg,2)
  SELF.AddHistoryField(?APD1:Jumlah,3)
  SELF.AddHistoryField(?APD1:Total,5)
  SELF.AddUpdateFile(Access:APDTcam)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:APBRGCMP.Open                                     ! File APHTRANS used by this procedure, so make sure it's RelationManager is open
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APOBKONT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:APDTcam
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
  INIMgr.Fetch('UpdateAPDTcam',QuickWindow)                ! Restore window settings from non-volatile store
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
    Relate:APBRGCMP.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateAPDTcam',QuickWindow)             ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = APD1:Kode_brg                            ! Assign linking field value
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
    OF ?APD1:Kode_brg
      !cek tabel obat campur (apbrgcmp)
      APB:Kode_brg= APD1:Kode_brg
      GET(APBRGCMP,APB:by_kd_barang)
      IF ERRORCODE()=35
          MESSAGE( 'Barang Tidak Terdapat pada Tabel Obat Campur')
          SELECT (?APD1:Kode_brg)
          ?APD1:Jumlah{PROP:DISABLE}=1
          CYCLE
      END
      !cocokkan tabel gbarang
      GBAR:Kode_brg = APD1:Kode_brg
      Access:GBarang.Fetch(GBAR:KeyKodeBrg)
      !cek di tabel gstokaptk
      GSTO:Kode_Apotik = GL_entryapotik
      GSTO:Kode_Barang=APD1:Kode_brg
      GET(GStokAptk,GSTO:KeyBarang)
      IF ERRORCODE() =35
          ?APD1:Jumlah{PROP:DISABLE}=1
          MESSAGE('Barang tersebut tidak ada dalam Daftar Obat')
          CLEAR (APD1:Kode_brg )
          CLEAR (GBAR:Nama_Brg)
          DISPLAY
          SELECT(?APD1:Kode_brg)
      ELSE
          ?APD1:Jumlah{PROP:DISABLE}=0
          SELECT(?APD1:Jumlah)
      END
    OF ?APD1:Jumlah
      if tombol_ok = 0
      loc::hitung = 0
      IF APD1:Jumlah = 0
          ?OK{PROP:DISABLE}=1
      ELSE
              IF self.request = changerecord
                  GSTO:Kode_Apotik = GL_entryapotik
                  GSTO:Kode_Barang = APD1:Kode_brg
                  GET(GStokaptk,GSTO:KeyBarang)
              END
              APD1:J_potong = ROUND ((APD1:Jumlah / APB:Nilai_konversi) + 0.4999,1)
              IF APD1:J_potong > GSTO:Saldo
                  MESSAGE('Jumlah Stok yang ada : ' & GSTO:Saldo )
                  SELECT (?APD1:Jumlah)
                  CYCLE
              END
              ?OK{PROP:DISABLE}=0
              CASE  status
              OF 1
                  APD1:Total = APD1:J_potong * GSTO:Harga_Dasar
              OF 2
                  APD1:Total = GL_beaR + |
                  (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(GL_Um_kls1 / 100 ))) * APD1:J_potong)
              OF 3
                  APO:KODE_KTR = GLO::back_up
                  APO:Kode_brg = APD1:Kode_brg
                  GET(APOBKONT,APO:by_kode_ktr)
                  IF ERRORCODE() = 35
                      APD1:Total = GL_beaR + |
                      (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1 + (GL_nt_kls2 / 100 ))) * APD1:J_potong)
                  ELSE
                      APD1:Total = GL_beaR + |
                      (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1 + (APO:PERS_TAMBAH / 100 ))) * APD1:J_potong)
                  END
              END
              APD1:Harga_Dasar = GSTO:Harga_Dasar
              DISPLAY
      END
      end
    OF ?Button5
      IF loc::hitung = 0
      
          APD1:Jumlah = GLO::jml_cmp * APD1:Jumlah
          APD1:J_potong = ROUND ( (APD1:Jumlah / APB:Nilai_konversi)+0.4999,1)
          IF APD1:J_potong > GSTO:Saldo
              MESSAGE('Jumlah Stok yang ada : ' & GSTO:Saldo )
              SELECT (?APD1:Jumlah)
              CYCLE
          END
          ?OK{PROP:DISABLE}=0
          CASE  status
          OF 1
            APD1:Total = APD1:J_potong * GSTO:Harga_Dasar
          OF 2
            APD1:Total = GL_beaR + |
            (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1 + (GL_Um_kls1 / 100 ))) * APD1:J_potong)
          OF 3
            APO:KODE_KTR = GLO::back_up
            APO:Kode_brg = APD1:Kode_brg
            GET(APOBKONT,APO:by_kode_ktr)
            IF ERRORCODE() = 35
                APD1:Total = GL_beaR + |
                (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1 + (GL_nt_kls2 / 100 ))) * APD1:J_potong)
            ELSE
                APD1:Total = GL_beaR + |
                (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) *  (1 + (APO:PERS_TAMBAH / 100 ))) * APD1:J_potong)
            END
          END
          DISPLAY
          loc::hitung = 1
      END
    OF ?Button6
      APD1:Total = GL_beaR + |
            (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1 + (GL_nt_kls2 / 100 ))) * APD1:J_potong)
         
      DISPLAY
    OF ?OK
      tombol_ok = 1
      
      
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?APD1:Kode_brg
      IF APD1:Kode_brg OR ?APD1:Kode_brg{Prop:Req}
        GBAR:Kode_brg = APD1:Kode_brg
        IF Access:GBarang.TryFetch(GBAR:KeyKodeBrg)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            APD1:Kode_brg = GBAR:Kode_brg
          ELSE
            SELECT(?APD1:Kode_brg)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      GBAR:Kode_brg = APD1:Kode_brg
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        APD1:Kode_brg = GBAR:Kode_brg
      END
      ThisWindow.Reset(1)
      !cek di tabel obat campur (apbrgcmp)
      APB:Kode_brg= APD1:Kode_brg
      GET(APBRGCMP,APB:by_kd_barang)
      IF ERRORCODE() = 35
          MESSAGE( 'Barang Tidak Terdapat pada Tabel Obat Campur')
          SELECT (?APD1:Kode_brg)
          ?APD1:Jumlah{PROP:DISABLE}=1
          CYCLE
      END
      !cek di tabel gstokaptk
      GSTO:Kode_Apotik = GL_entryapotik
      GSTO:Kode_Barang=APD1:Kode_brg
      GET(GStokAptk,GSTO:KeyBarang)
      IF ERRORCODE() = 35
          ?APD1:Jumlah{PROP:DISABLE}=1
          MESSAGE('Barang tersebut tidak ada dalam Daftar Obat')
          CLEAR (APD1:Kode_brg )
          CLEAR (GBAR:Nama_Brg)
          DISPLAY
          SELECT(?APD1:Kode_brg)
      ELSE
          ?APD1:Jumlah{PROP:DISABLE}=0
          SELECT(?APD1:Jumlah)
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

