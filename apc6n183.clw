

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N183.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N049.INC'),ONCE        !Req'd for module callout resolution
                     END


BrowseObatPerPasienPerTanggal_Inap PROCEDURE               ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
Loc:nama             STRING(20)                            !
loc:pjgnama          SHORT                                 !
loc:filter           STRING(100)                           !
BRW1::View:Browse    VIEW(VAphtransJPasien)
                       PROJECT(VAP:N0_tran)
                       PROJECT(VAP:Tanggal)
                       PROJECT(VAP:Nomor_MR)
                       PROJECT(VAP:Nama)
                       PROJECT(VAP:Kode_Apotik)
                       PROJECT(VAP:Biaya)
                       PROJECT(VAP:NoNota)
                       JOIN(JTra:KeyNoNota,VAP:NoNota)
                         PROJECT(JTra:NamaJawab)
                         PROJECT(JTra:Kontraktor)
                         PROJECT(JTra:Kode_dokter)
                         JOIN(JKon:KeyKodeKtr,JTra:Kontraktor)
                           PROJECT(JKon:NAMA_KTR)
                           PROJECT(JKon:KODE_KTR)
                         END
                         JOIN(JDok:KeyKodeDokter,JTra:Kode_dokter)
                           PROJECT(JDok:Nama_Dokter)
                           PROJECT(JDok:Kode_Dokter)
                         END
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
VAP:N0_tran            LIKE(VAP:N0_tran)              !List box control field - type derived from field
VAP:Tanggal            LIKE(VAP:Tanggal)              !List box control field - type derived from field
VAP:Nomor_MR           LIKE(VAP:Nomor_MR)             !List box control field - type derived from field
VAP:Nama               LIKE(VAP:Nama)                 !List box control field - type derived from field
JTra:NamaJawab         LIKE(JTra:NamaJawab)           !List box control field - type derived from field
JKon:NAMA_KTR          LIKE(JKon:NAMA_KTR)            !List box control field - type derived from field
VAP:Kode_Apotik        LIKE(VAP:Kode_Apotik)          !List box control field - type derived from field
VAP:Biaya              LIKE(VAP:Biaya)                !List box control field - type derived from field
VAP:NoNota             LIKE(VAP:NoNota)               !List box control field - type derived from field
JDok:Nama_Dokter       LIKE(JDok:Nama_Dokter)         !List box control field - type derived from field
JKon:KODE_KTR          LIKE(JKon:KODE_KTR)            !Related join file key field - type derived from field
JDok:Kode_Dokter       LIKE(JDok:Kode_Dokter)         !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(VAPDTRANS)
                       PROJECT(APD4:Kode_brg)
                       PROJECT(APD4:Jumlah)
                       PROJECT(APD4:Total)
                       PROJECT(APD4:N0_tran)
                       PROJECT(APD4:Camp)
                       JOIN(GBAR:KeyKodeBrg,APD4:Kode_brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?List:2
APD4:Kode_brg          LIKE(APD4:Kode_brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
APD4:Jumlah            LIKE(APD4:Jumlah)              !List box control field - type derived from field
APD4:Total             LIKE(APD4:Total)               !List box control field - type derived from field
APD4:N0_tran           LIKE(APD4:N0_tran)             !List box control field - type derived from field
APD4:Camp              LIKE(APD4:Camp)                !Primary key field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('History Obat Pasien'),AT(,,512,294),FONT('MS Sans Serif',8,COLOR:Black,),IMM,HLP('BrowseObatPerPasien'),SYSTEM,GRAY,RESIZE,MDI
                       LIST,AT(8,23,495,86),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('60L|M~N 0 tran~@s15@47R|M~Tanggal~L@d06@47R|M~Nomor MR~L@n-14@80R|M~Nama~L@s20@5' &|
   '9R|M~Keterangan~L@s40@63D|M~Kontraktor~L@s50@31L|M~Apotik~@s5@56D|M~Biaya~L@n17.' &|
   '2@40D|M~No Nota~L@s10@120D|M~NAMA_DR~L@s30@'),FROM(Queue:Browse:1)
                       LIST,AT(8,132,495,143),USE(?List:2),IMM,VSCROLL,MSG('Browsing Records'),FORMAT('46L|M~Kode Barang~@s10@121L|M~Nama Obat~@s40@29D|M~Jumlah~L@n-11.2@55R|M~Total~L' &|
   '@n-15.2@60R|M~No Billing~L@s15@'),FROM(Queue:Browse:2)
                       SHEET,AT(4,4,503,121),USE(?CurrentTab)
                         TAB('Nomor MR'),USE(?Tab1)
                           PROMPT('Nomor MR:'),AT(11,110),USE(?JPas:Nama:Prompt)
                           ENTRY(@n-14),AT(52,110,77,10),USE(VAP:Nomor_MR),HLP('Nama mendahului gelar'),MSG('Nama pasien'),REQ,CAP
                         END
                         TAB('Nama'),USE(?Tab2)
                           PROMPT('Nama :'),AT(9,111),USE(?JPas:Nomor_mr:Prompt)
                           ENTRY(@s20),AT(36,111,91,10),USE(VAP:Nama),IMM,MSG('Nomor Medical record pasien'),TIP('Nomor KIUP')
                         END
                       END
                       BUTTON('&Selesai'),AT(370,278,45,14),USE(?Close)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
ApplyFilter            PROCEDURE(),DERIVED                 ! Method added to host embed code
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  FilterLocatorClass                    ! Default Locator
BRW1::Sort1:Locator  FilterLocatorClass                    ! Conditional Locator - choice(?CurrentTab)=2
BRW5                 CLASS(BrowseClass)                    ! Browse using ?List:2
Q                      &Queue:Browse:2                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
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
  GlobalErrors.SetProcedureName('BrowseObatPerPasienPerTanggal_Inap')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('VG_TANGGAL1',VG_TANGGAL1)                          ! Added by: BrowseBox(ABC)
  BIND('VG_TANGGAL2',VG_TANGGAL2)                          ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  WindowTanggal()
  Relate:VAPDTRANS.Open                                    ! File VAPDTRANS used by this procedure, so make sure it's RelationManager is open
  Relate:VAphtransJPasien.Open                             ! File VAPDTRANS used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:VAphtransJPasien,SELF) ! Initialize the browse manager
  BRW5.Init(?List:2,Queue:Browse:2.ViewPosition,BRW5::View:Browse,Queue:Browse:2,Relate:VAPDTRANS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List:2{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,VAP:Nama_VAphtransJpasien_IK)         ! Add the sort order for VAP:Nama_VAphtransJpasien_IK for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?VAP:Nama,VAP:Nama,1,BRW1)      ! Initialize the browse locator using ?VAP:Nama using key: VAP:Nama_VAphtransJpasien_IK , VAP:Nama
  BRW1::Sort1:Locator.FloatRight = 1
  BRW1.AppendOrder('vap:n0_tran')                          ! Append an additional sort order
  BRW1.SetFilter('(vap:tanggal>=VG_TANGGAL1 and vap:tanggal<<=VG_TANGGAL2)') ! Apply filter expression to browse
  BRW1.AddSortOrder(,VAP:MR_VAphtransJpasien_IK)           ! Add the sort order for VAP:MR_VAphtransJpasien_IK for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?VAP:Nomor_MR,VAP:Nomor_MR,1,BRW1) ! Initialize the browse locator using ?VAP:Nomor_MR using key: VAP:MR_VAphtransJpasien_IK , VAP:Nomor_MR
  BRW1::Sort0:Locator.FloatRight = 1
  BRW1.AppendOrder('vap:n0_tran')                          ! Append an additional sort order
  BRW1.SetFilter('(vap:tanggal>=VG_TANGGAL1 and vap:tanggal<<=VG_TANGGAL2)') ! Apply filter expression to browse
  BRW1.AddField(VAP:N0_tran,BRW1.Q.VAP:N0_tran)            ! Field VAP:N0_tran is a hot field or requires assignment from browse
  BRW1.AddField(VAP:Tanggal,BRW1.Q.VAP:Tanggal)            ! Field VAP:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(VAP:Nomor_MR,BRW1.Q.VAP:Nomor_MR)          ! Field VAP:Nomor_MR is a hot field or requires assignment from browse
  BRW1.AddField(VAP:Nama,BRW1.Q.VAP:Nama)                  ! Field VAP:Nama is a hot field or requires assignment from browse
  BRW1.AddField(JTra:NamaJawab,BRW1.Q.JTra:NamaJawab)      ! Field JTra:NamaJawab is a hot field or requires assignment from browse
  BRW1.AddField(JKon:NAMA_KTR,BRW1.Q.JKon:NAMA_KTR)        ! Field JKon:NAMA_KTR is a hot field or requires assignment from browse
  BRW1.AddField(VAP:Kode_Apotik,BRW1.Q.VAP:Kode_Apotik)    ! Field VAP:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(VAP:Biaya,BRW1.Q.VAP:Biaya)                ! Field VAP:Biaya is a hot field or requires assignment from browse
  BRW1.AddField(VAP:NoNota,BRW1.Q.VAP:NoNota)              ! Field VAP:NoNota is a hot field or requires assignment from browse
  BRW1.AddField(JDok:Nama_Dokter,BRW1.Q.JDok:Nama_Dokter)  ! Field JDok:Nama_Dokter is a hot field or requires assignment from browse
  BRW1.AddField(JKon:KODE_KTR,BRW1.Q.JKon:KODE_KTR)        ! Field JKon:KODE_KTR is a hot field or requires assignment from browse
  BRW1.AddField(JDok:Kode_Dokter,BRW1.Q.JDok:Kode_Dokter)  ! Field JDok:Kode_Dokter is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse:2
  BRW5.AddSortOrder(,APD4:PK)                              ! Add the sort order for APD4:PK for sort order 1
  BRW5.AddRange(APD4:N0_tran,VAP:N0_tran)                  ! Add single value range limit for sort order 1
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort0:Locator.Init(,APD4:Kode_brg,,BRW5)           ! Initialize the browse locator using  using key: APD4:PK , APD4:Kode_brg
  BRW5.AddField(APD4:Kode_brg,BRW5.Q.APD4:Kode_brg)        ! Field APD4:Kode_brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Nama_Brg,BRW5.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW5.AddField(APD4:Jumlah,BRW5.Q.APD4:Jumlah)            ! Field APD4:Jumlah is a hot field or requires assignment from browse
  BRW5.AddField(APD4:Total,BRW5.Q.APD4:Total)              ! Field APD4:Total is a hot field or requires assignment from browse
  BRW5.AddField(APD4:N0_tran,BRW5.Q.APD4:N0_tran)          ! Field APD4:N0_tran is a hot field or requires assignment from browse
  BRW5.AddField(APD4:Camp,BRW5.Q.APD4:Camp)                ! Field APD4:Camp is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Kode_brg,BRW5.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseObatPerPasienPerTanggal_Inap',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
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
    Relate:VAPDTRANS.Close
    Relate:VAphtransJPasien.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseObatPerPasienPerTanggal_Inap',QuickWindow) ! Save window data to non-volatile store
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
    OF ?VAP:Nomor_MR
      select(?Browse:1)
      display
    OF ?VAP:Nama
      select(?Browse:1)
    END
  ReturnValue = PARENT.TakeSelected()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.ApplyFilter PROCEDURE

  CODE
  PARENT.ApplyFilter
  BRW1.SetFilter(clip(loc:filter))


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


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


BRW5.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

