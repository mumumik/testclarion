

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N005.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N003.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N006.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N007.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N008.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N118.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N119.INC'),ONCE        !Req'd for module callout resolution
                     END


BrowseRajalNonBill PROCEDURE                               ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
loc::thread          BYTE                                  !
Lunas                STRING(5)                             !
Poliklinik           STRING(1)                             !
LOC::No_transaksi    STRING(15)                            !Nomor Transaksi
vl_total             REAL                                  !
BRW1::View:Browse    VIEW(APHTRANS)
                       PROJECT(APH:Nomor_mr)
                       PROJECT(APH:Tanggal)
                       PROJECT(APH:Jam)
                       PROJECT(APH:Biaya)
                       PROJECT(APH:N0_tran)
                       PROJECT(APH:Kode_Apotik)
                       PROJECT(APH:Asal)
                       PROJECT(APH:User)
                       PROJECT(APH:cara_bayar)
                       PROJECT(APH:dokter)
                       PROJECT(APH:NoNota)
                       PROJECT(APH:NomorEPresribing)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APH:Nomor_mr           LIKE(APH:Nomor_mr)             !List box control field - type derived from field
APH:Tanggal            LIKE(APH:Tanggal)              !List box control field - type derived from field
APH:Jam                LIKE(APH:Jam)                  !List box control field - type derived from field
APH:Biaya              LIKE(APH:Biaya)                !List box control field - type derived from field
APH:N0_tran            LIKE(APH:N0_tran)              !List box control field - type derived from field
APH:N0_tran_NormalFG   LONG                           !Normal forground color
APH:N0_tran_NormalBG   LONG                           !Normal background color
APH:N0_tran_SelectedFG LONG                           !Selected forground color
APH:N0_tran_SelectedBG LONG                           !Selected background color
APH:Kode_Apotik        LIKE(APH:Kode_Apotik)          !List box control field - type derived from field
APH:Asal               LIKE(APH:Asal)                 !List box control field - type derived from field
APH:User               LIKE(APH:User)                 !List box control field - type derived from field
APH:cara_bayar         LIKE(APH:cara_bayar)           !List box control field - type derived from field
APH:dokter             LIKE(APH:dokter)               !List box control field - type derived from field
Poliklinik             LIKE(Poliklinik)               !List box control field - type derived from local data
Lunas                  LIKE(Lunas)                    !List box control field - type derived from local data
APH:NoNota             LIKE(APH:NoNota)               !List box control field - type derived from field
APH:NomorEPresribing   LIKE(APH:NomorEPresribing)     !List box control field - type derived from field
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
QuickWindow          WINDOW('Transaksi Instalasi Farmasi- Rawat Jalan'),AT(,,457,234),FONT('Arial',8,,),CENTER,IMM,HLP('Tran_Poliklinik'),SYSTEM,GRAY,MDI
                       BUTTON('T&ransaksi (Ins)'),AT(363,85,83,26),USE(?Insert:3),LEFT,FONT('Arial',8,COLOR:Blue,FONT:regular),KEY(InsertKey),ICON(ICON:Open)
                       BUTTON('Cetak &Nota'),AT(117,50,61,26),USE(?Print:2),HIDE,LEFT,FONT('Times New Roman',10,COLOR:Blue,FONT:bold),ICON(ICON:Print)
                       BUTTON('Cetak &Detail'),AT(9,85,65,26),USE(?Print),LEFT,FONT('Arial',8,COLOR:Blue,FONT:bold),ICON(ICON:Print1)
                       LIST,AT(10,25,435,57),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('52L|FM~Nomor RM~C@N010_@51R(1)|M~Tanggal~C(0)@D8@40R(1)|M~Jam~C(0)@t04@55R(1)|M~' &|
   'Biaya~C(0)@n-14@64L|M*~No. Transaksi~C@s15@26L|M~Apotik~@s5@44L|M~Asal~@s10@25L|' &|
   'M~User~@s4@38L|M~cara bayar~@n1@24L|M~dokter~@s5@32L|M~Poliklinik~C@s1@20L|M~Lun' &|
   'as~@s5@40L|M~No Nota~@s10@80L|M~Nomor EP resribing~@s20@'),FROM(Queue:Browse:1)
                       LIST,AT(5,127,443,79),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('52L|FM~Kode Barang~C@s10@115L|FM~Nama Obat~C@s40@74L|FM~Keterangan~C@s50@71D(14)' &|
   '|M~Jumlah~C(0)@n-10.2@63D(14)|M~Total~C(0)@n-15.2@60R(2)|M~Diskon~C(0)@n-15.2@60' &|
   'L~Camp~C@n2@60L~N 0 tran~C@s15@'),FROM(Queue:Browse)
                       BUTTON('Cetak &Kwitansi'),AT(77,85,77,26),USE(?Print:3),LEFT,FONT('Arial',8,COLOR:Blue,FONT:bold),ICON(ICON:Print)
                       BUTTON('&Select'),AT(271,41,45,14),USE(?Select:2),HIDE
                       BUTTON('&Change'),AT(221,41,45,14),USE(?Change:3),DISABLE,HIDE,DEFAULT
                       BUTTON('&Delete'),AT(171,41,45,14),USE(?Delete:3),DISABLE,HIDE
                       SHEET,AT(5,8,445,107),USE(?CurrentTab)
                         TAB('No. Nota RM [F2]'),USE(?Tab:2),KEY(F2Key),FONT('Times New Roman',10,COLOR:Black,)
                           PROMPT('Nomor Transaksi :'),AT(215,92),USE(?LOC::No_transaksi:Prompt),FONT('Times New Roman',10,,)
                           ENTRY(@s15),AT(289,90,71,13),USE(LOC::No_transaksi),FONT('Times New Roman',10,,),MSG('Nomor Transaksi'),TIP('Nomor Transaksi')
                         END
                         TAB('Nomor RM [F3]'),USE(?Tab:3),KEY(F3Key),FONT('Times New Roman',10,COLOR:Black,)
                         END
                       END
                       STRING('KELUAR OBAT RAJAL TIDAK UPDATE BILLING !!!'),AT(194,7,263,13),USE(?String1:2),FONT('Arial',12,COLOR:Red,FONT:bold)
                       BUTTON('&Tutup'),AT(360,211,83,22),USE(?Close),LEFT,ICON(ICON:Cross)
                       BUTTON('Help'),AT(321,41,45,14),USE(?Help),HIDE,STD(STD:Help)
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
BRW1::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW1::Sort1:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW6                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetQueue             PROCEDURE(BYTE ResetMode),DERIVED   ! Method added to host embed code
                     END

BRW6::Sort0:Locator  StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False) ! Method added to host embed code
                     END

view::sql view(filesql)
            project(FIL:FString1)
          end

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
  ! untuk mengambil data setup persentase
  SHARE(ISetupAp)
  IF ERRORCODE() OR RECORDS(ISetupAp) = 0 THEN
     MESSAGE ('Jalankan menu SET UP dahulu')
     POST(EVENT:CloseWindow)
  END
  Iset:deskripsi = 'Bea_R'
  Get(IsetupAp,Iset:by_deskripsi)
  GL_beaR = Iset:Nilai
  Iset:deskripsi = 'KLS_UC'
  Get(IsetupAp,Iset:by_deskripsi)
  GL_Um_kls1 = Iset:Nilai
  Iset:deskripsi = 'KLS_UN'
  Get(IsetupAp,Iset:by_deskripsi)
  GL_nt_kls2 = Iset:Nilai
  Iset:deskripsi = 'PPN'
  Get(IsetupAp,Iset:by_deskripsi)
  GL_PPN = Iset:Nilai
  Access:ISetupAp.Close()
  ! Untuk tambah 2 data di GBarang, yaitu _campur dan _ biaya ( untuk obat campur )
  GBAR:Kode_brg = '_Campur'
  IF Access:GBarang.Fetch(GBAR:KeyKodeBrg) <> level:benign THEN
      GBAR:Kode_brg = '_Campur'
      GBAR:Nama_Brg = 'Total Obat Campur'
      Access:GBarang.Insert()
  END
  GBAR:Kode_brg = '_Biaya'
  IF Access:GBarang.Fetch(GBAR:KeyKodeBrg) <> level:benign
      GBAR:Kode_brg = '_Biaya'
      GBAR:Nama_Brg = 'Biaya Obat Campur'
      Access:GBarang.Insert()
  END
  ! Untuk transaksi rutine, jika ada discount
  GBAR:Kode_brg = '_Disc'
  IF Access:GBarang.Fetch(GBAR:KeyKodeBrg) <> level:benign
      GBAR:Kode_brg = '_Disc'
      GBAR:Nama_Brg = 'Discount'
      Access:GBarang.Insert()
  END
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowseRajalNonBill')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Insert:3
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  BIND('Poliklinik',Poliklinik)                            ! Added by: BrowseBox(ABC)
  BIND('Lunas',Lunas)                                      ! Added by: BrowseBox(ABC)
  loc::thread=glo::mainthreadno
  !POST(EVENT:Disable_RJalanN,,loc::thread)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:APDTRANS.SetOpenRelated()
  Relate:APDTRANS.Open                                     ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql.Open                                      ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:JDBILLING.Open                                    ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:JDDBILLING.Open                                   ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:JHBILLING.Open                                    ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:SMPegawai.SetOpenRelated()
  Relate:SMPegawai.Open                                    ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:TBTransResepDokterHeader.Open                     ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JTransaksi.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JDokter.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKontrak.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
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
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,APH:Nomor_mr,1,BRW1)           ! Initialize the browse locator using  using key: APH:by_medrec , APH:Nomor_mr
  BRW1.SetFilter('(aph:kode_apotik=GL_entryapotik)')       ! Apply filter expression to browse
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon APH:N0_tran for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,APH:by_transaksi) ! Add the sort order for APH:by_transaksi for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?LOC::No_transaksi,APH:N0_tran,,BRW1) ! Initialize the browse locator using ?LOC::No_transaksi using key: APH:by_transaksi , APH:N0_tran
  BRW1.SetFilter('(aph:kode_apotik=GL_entryapotik)')       ! Apply filter expression to browse
  BRW1.AddField(APH:Nomor_mr,BRW1.Q.APH:Nomor_mr)          ! Field APH:Nomor_mr is a hot field or requires assignment from browse
  BRW1.AddField(APH:Tanggal,BRW1.Q.APH:Tanggal)            ! Field APH:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(APH:Jam,BRW1.Q.APH:Jam)                    ! Field APH:Jam is a hot field or requires assignment from browse
  BRW1.AddField(APH:Biaya,BRW1.Q.APH:Biaya)                ! Field APH:Biaya is a hot field or requires assignment from browse
  BRW1.AddField(APH:N0_tran,BRW1.Q.APH:N0_tran)            ! Field APH:N0_tran is a hot field or requires assignment from browse
  BRW1.AddField(APH:Kode_Apotik,BRW1.Q.APH:Kode_Apotik)    ! Field APH:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(APH:Asal,BRW1.Q.APH:Asal)                  ! Field APH:Asal is a hot field or requires assignment from browse
  BRW1.AddField(APH:User,BRW1.Q.APH:User)                  ! Field APH:User is a hot field or requires assignment from browse
  BRW1.AddField(APH:cara_bayar,BRW1.Q.APH:cara_bayar)      ! Field APH:cara_bayar is a hot field or requires assignment from browse
  BRW1.AddField(APH:dokter,BRW1.Q.APH:dokter)              ! Field APH:dokter is a hot field or requires assignment from browse
  BRW1.AddField(Poliklinik,BRW1.Q.Poliklinik)              ! Field Poliklinik is a hot field or requires assignment from browse
  BRW1.AddField(Lunas,BRW1.Q.Lunas)                        ! Field Lunas is a hot field or requires assignment from browse
  BRW1.AddField(APH:NoNota,BRW1.Q.APH:NoNota)              ! Field APH:NoNota is a hot field or requires assignment from browse
  BRW1.AddField(APH:NomorEPresribing,BRW1.Q.APH:NomorEPresribing) ! Field APH:NomorEPresribing is a hot field or requires assignment from browse
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
  INIMgr.Fetch('BrowseRajalNonBill',QuickWindow)           ! Restore window settings from non-volatile store
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
    Relate:FileSql.Close
    Relate:JDBILLING.Close
    Relate:JDDBILLING.Close
    Relate:JHBILLING.Close
    Relate:Nomor_SKR.Close
    Relate:SMPegawai.Close
    Relate:TBTransResepDokterHeader.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseRajalNonBill',QuickWindow)        ! Save window data to non-volatile store
  END
  !POST(EVENT:Enable_RJalanN,,loc::thread)
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
      Trig_UpdateRawatJalan11
      PrintTransRawatJalan1
      Cetak_nota_apotik
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
      NOM1:No_urut=63
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
    OF ?Print:3
      glo:nomor=APH:N0_tran
      display
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Print:3
      ThisWindow.Update
      START(PrintKwitansiRajal, 25000)
      ThisWindow.Reset
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
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:CloseWindow
      close(view::sql)
    OF EVENT:OpenWindow
      open(view::sql)
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


BRW1.ResetFromAsk PROCEDURE(*BYTE Request,*BYTE Response)

  CODE
  PARENT.ResetFromAsk(Request,Response)
  if request=1 and response=1 then
  !   JDB:NOMOR            =APH:NoNota
  !   JDB:NOTRAN_INTERNAL  =APH:N0_tran
  !   JDB:KODEJASA         ='FAR.00001.00.00'
  !   JDB:TOTALBIAYA       =APH:Biaya
  !   JDB:KETERANGAN       =''
  !   JDB:JUMLAH           =1
  !   if GL_entryapotik='FM04' or GL_entryapotik='FM09' or GL_entryapotik='FM10' then
  !      JDB:KODE_BAGIAN      ='FARMASI'
  !   else
  !      JDB:KODE_BAGIAN      ='FARPD'
  !   end
  !   JDB:VALIDASI         =0
  !   JDB:STATUS_TUTUP     =0
  !   JDB:StatusBatal      =0
  !   JDB:VALIDASI         =0
  !   JDB:STATUS_TUTUP     =0
  !   JDB:StatusBatal      =0
  !   JDB:JUMLAH_BYR       =0
  !   JDB:SISA_BYR         =0
  !   JDB:NO_PEMBAYARAN    =''
  !   JDB:DISCOUNT         =0
  !   JDB:BYRSELISIH       =0
  !   JDB:VALIDASI         =0
  !   JDB:JenisPembayaran  =APH:cara_bayar
  !   JDB:TglTransaksi     =APH:Tanggal
  !   JDB:JamTransaksi     =APH:Jam
  !   JDB:ValidasiProduksi =1
  !   JDB:TglValidasiProduksi=APH:Tanggal
  !   JDB:JamValidasiProduksi=APH:Jam
  !   JDB:UservalidasiProduksi=APH:User
  !   access:jdbilling.insert()
  !   JDDB:NOMOR           =APH:NoNota
  !   JDDB:NOTRAN_INTERNAL =APH:N0_tran
  !   JDDB:KODEJASA        ='FAR.00001.00.00'
  !   JDDB:SUBKODEJASA     ='FAR.00001.04.00'
  !   JDDB:KETERANGAN      =''
  !   JDDB:JUMLAH          =1
  !   JDDB:TOTALBIAYA      =APH:Biaya
  !   JDB:ValidasiProduksi =1
  !   access:jddbilling.insert()
     !Update Status Resep Elektronik
     TBT2:NoTrans=APH:NomorEPresribing
     if access:tbtransresepdokterheader.fetch(TBT2:PK)=level:benign then
        TBT2:Status=1
        access:tbtransresepdokterheader.update()
     end
  
     glo::no_nota=APH:N0_tran
  !   PrintTransRawatJalan
  
  !   view::sql{prop:sql}='select kode_brg from dba.apdtrans where n0_tran='''&APH:N0_tran&''''
  !   loop
  !      next(view::sql)
  !      if errorcode() then break.
  !      glo_kode_barang=FIL:FString1
  !      !start(printetiketrajal,25000)
  !   end
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
  IF (APH:Bayar = 1)
    Lunas = 'Lunas'
  ELSE
    Lunas = 'Belum'
  END
  IF (APH:Ra_jal = 1)
    Poliklinik = 'Y'
  ELSE
    Poliklinik = 'N'
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
  SELF.Q.Poliklinik = Poliklinik                           !Assign formula result to display queue
  SELF.Q.Lunas = Lunas                                     !Assign formula result to display queue


BRW6.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW6.ResetQueue PROCEDURE(BYTE ResetMode)

  CODE
  PARENT.ResetQueue(ResetMode)
  vl_total=0
  set(BRW6::View:Browse)
  loop
     next(BRW6::View:Browse)
     if errorcode() then break.
     vl_total+=APD:Total-APD:Diskon
  end
  
  if round(vl_total,1)<>APH:Biaya then
     if (APH:Biaya-round(vl_total,1))<=1 then
        vl_total=round(vl_total,1)+1
     else
        message('Total beda dengan detil, harap hubungi Divisi SIMRS ! '&round(vl_total,1)&' '&APH:Biaya)
        access:aphtrans.fetch(APH:by_transaksi)
        APH:Biaya=round(vl_total,1)
        access:aphtrans.update()
        brw1.resetfromfile
        brw1.resetsort(1)
        message('Data sudah disamakan, silahkan cetak ulang struk !')
     end
  
  end


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

Cetak_nota_apotik PROCEDURE                                ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
print_ajuan          STRING(10)                            !
FilesOpened          BYTE                                  !
print_ajuan2         LONG                                  !Nomor Medical record pasien
print_ajuan3         STRING(35)                            !Nama pasien
Process:View         VIEW(APHTRANS)
                       PROJECT(APH:Biaya)
                       PROJECT(APH:Jam)
                       PROJECT(APH:Kode_Apotik)
                       PROJECT(APH:N0_tran)
                       PROJECT(APH:Tanggal)
                       PROJECT(APH:User)
                       PROJECT(APH:Nomor_mr)
                       JOIN(JPas:KeyNomorMr,APH:Nomor_mr)
                       END
                       JOIN(GAPO:KeyNoApotik,APH:Kode_Apotik)
                         PROJECT(GAPO:Nama_Apotik)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(10,3,96,2000),PAPER(PAPER:A4SMALL),PRE(RPT),FONT('Times New Roman',10,COLOR:Black,),MM
detail1                DETAIL,AT(,,64,55),USE(?detail1)
                         STRING(@s10),AT(1,11),USE(print_ajuan),FONT('Times New Roman',8,,)
                         STRING(@N010_),AT(22,11),USE(print_ajuan2),FONT('Times New Roman',8,,)
                         STRING(@t04),AT(41,11),USE(APH:Jam),TRN,FONT('Times New Roman',8,,)
                         STRING('Ins. Farmasi RS. Mitra Kasih'),AT(2,1),USE(?String21),TRN,FONT('Times New Roman',8,,)
                         STRING(@s5),AT(47,5,11,4),USE(APH:Kode_Apotik),FONT('Times New Roman',8,,FONT:italic)
                         LINE,AT(1,10,55,0),USE(?Line1),COLOR(COLOR:Black)
                         STRING('Surat Pengantar Pembayaran'),AT(2,5,42,4),LEFT,FONT('Times New Roman',8,,)
                         BOX,AT(1,16,58,6),USE(?Box1),COLOR(COLOR:Black)
                         STRING(@s35),AT(3,17,55,4),USE(print_ajuan3),FONT('Times New Roman',8,,)
                         STRING(@n-14),AT(34,23,23,4),USE(APH:Biaya),RIGHT(1),FONT('Times New Roman',8,,)
                         STRING('Total Penagihan  :  Rp.'),AT(1,23,32,4),TRN,FONT('Times New Roman',8,,)
                         STRING(@s15),AT(28,27,26,4),USE(APH:N0_tran),FONT('Times New Roman',8,,)
                         STRING('No. Transaksi  :'),AT(1,27,24,4),TRN,FONT('Times New Roman',8,,)
                         STRING('Cimahi,'),AT(23,35),USE(?String16),TRN,FONT('Times New Roman',8,,)
                         STRING(@D8),AT(36,35,21,4),USE(APH:Tanggal),RIGHT(1),FONT('Times New Roman',8,,)
                         STRING(@s30),AT(12,31,50,5),USE(GAPO:Nama_Apotik),FONT('Times New Roman',8,,)
                         STRING('Penanggung Jawab'),AT(33,40,24,4),TRN,FONT('Times New Roman',8,,)
                         STRING(@s4),AT(41,47,12,4),USE(APH:User),FONT('Times New Roman',8,,)
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
  GlobalErrors.SetProcedureName('Cetak_nota_apotik')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:APHTRANS.Open                                     ! File ApReLuar used by this procedure, so make sure it's RelationManager is open
  Access:ApReLuar.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Cetak_nota_apotik',ProgressWindow)         ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:APHTRANS, ?Progress:PctText, Progress:Thermometer, ProgressMgr, APH:N0_tran)
  ThisReport.AddSortOrder(APH:by_transaksi)
  ThisReport.AddRange(APH:N0_tran,APH:N0_tran)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report)
  ?Progress:UserString{Prop:Text}=''
  Relate:APHTRANS.SetQuickScan(1,Propagate:OneMany)
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
    INIMgr.Update('Cetak_nota_apotik',ProgressWindow)      ! Save window data to non-volatile store
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

Cari_nama_poli PROCEDURE                                   ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
nm_poli              STRING(25)                            !
BRW1::View:Browse    VIEW(JPoli)
                       PROJECT(JPol:NAMA_POLI)
                       PROJECT(JPol:POLIKLINIK)
                       PROJECT(JPol:TEMPAT)
                       PROJECT(JPol:NO_POLI)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
JPol:NAMA_POLI         LIKE(JPol:NAMA_POLI)           !List box control field - type derived from field
JPol:POLIKLINIK        LIKE(JPol:POLIKLINIK)          !List box control field - type derived from field
JPol:TEMPAT            LIKE(JPol:TEMPAT)              !List box control field - type derived from field
JPol:NO_POLI           LIKE(JPol:NO_POLI)             !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Melihat data Poliklinik'),AT(,,269,148),FONT('Arial',8,,),IMM,HLP('Cari_nama_poli'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,251,95),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('80L(2)|FM~Nama Poli~C@s25@44L(2)|M~Kode Poli~@s10@35L(2)|M~Lokasi~@s5@64R(2)|M~N' &|
   'o. Poli~C(0)@n-14@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(133,0,45,14),USE(?Select:2),HIDE
                       SHEET,AT(4,4,261,143),USE(?CurrentTab)
                         TAB('Kode Poli (F2)'),USE(?Tab:2),KEY(F2Key)
                         END
                         TAB('Nama Poliklinik (F3)'),USE(?Tab:3),KEY(F3Key)
                           STRING('Nama Poli :'),AT(87,124),USE(?String1)
                           ENTRY(@s25),AT(139,124,,10),USE(nm_poli)
                         END
                       END
                       BUTTON('Close'),AT(138,0,45,14),USE(?Close),HIDE
                       BUTTON('Help'),AT(199,0,45,14),USE(?Help),HIDE,STD(STD:Help)
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
BRW1::Sort1:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('Cari_nama_poli')
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
  Relate:JPoli.SetOpenRelated()
  Relate:JPoli.Open                                        ! File JUPF used by this procedure, so make sure it's RelationManager is open
  Access:JTempat.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JTransaksi.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JUPF.UseFile                                      ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:JPoli,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon JPol:NAMA_POLI for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,JPol:BY_NAMA)    ! Add the sort order for JPol:BY_NAMA for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?nm_poli,JPol:NAMA_POLI,,BRW1)  ! Initialize the browse locator using ?nm_poli using key: JPol:BY_NAMA , JPol:NAMA_POLI
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon JPol:POLIKLINIK for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,JPol:BY_POLI)    ! Add the sort order for JPol:BY_POLI for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,JPol:POLIKLINIK,,BRW1)         ! Initialize the browse locator using  using key: JPol:BY_POLI , JPol:POLIKLINIK
  BRW1.AddField(JPol:NAMA_POLI,BRW1.Q.JPol:NAMA_POLI)      ! Field JPol:NAMA_POLI is a hot field or requires assignment from browse
  BRW1.AddField(JPol:POLIKLINIK,BRW1.Q.JPol:POLIKLINIK)    ! Field JPol:POLIKLINIK is a hot field or requires assignment from browse
  BRW1.AddField(JPol:TEMPAT,BRW1.Q.JPol:TEMPAT)            ! Field JPol:TEMPAT is a hot field or requires assignment from browse
  BRW1.AddField(JPol:NO_POLI,BRW1.Q.JPol:NO_POLI)          ! Field JPol:NO_POLI is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Cari_nama_poli',QuickWindow)               ! Restore window settings from non-volatile store
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
    Relate:JPoli.Close
  END
  IF SELF.Opened
    INIMgr.Update('Cari_nama_poli',QuickWindow)            ! Save window data to non-volatile store
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

Trig_UpdateRawatJalan11 PROCEDURE                          ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
loc:tgl              DATE                                  !
loc:temth2           LONG                                  !
loc:bl2              SHORT                                 !
loc:bls2             STRING(2)                             !
loc:th22             STRING(2)                             !
loc:th32             STRING(2)                             !
loc:nums2            STRING(5)                             !
loc:nomor            STRING(20)                            !
vl_round             REAL                                  !
vl_no_urut           LONG                                  !
vl_sudah             BYTE                                  !
vl_nomor             STRING(15)                            !
masuk_disc           BYTE                                  !
sudah_nomor          BYTE                                  !
Loc::delete          BYTE                                  !
Tahun_ini            LONG                                  !
loc::copy_total      LONG                                  !Total Biaya Pembelian
loc::camp            BYTE                                  !
Loc::SavPoint        LONG                                  !
putar                ULONG                                 !
CEK_RUN              BYTE                                  !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
discount             LONG                                  !
pers_disc            LONG                                  !
LOC::TOTAL           LONG                                  !
Hitung_campur        BYTE                                  !
loc::nama            STRING(20)                            !
loc::alamat          STRING(35)                            !
loc::RT              BYTE                                  !
loc::rw              BYTE                                  !
loc::kota            STRING(20)                            !
vl_real              REAL                                  !
vl_hasil             REAL                                  !
vl_seribu            REAL                                  !
vl_selisih           REAL                                  !
vl_diskon_pct        REAL                                  !
vl_total             REAL                                  !
vl_hna               REAL                                  !
BRW4::View:Browse    VIEW(APDTRANS)
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
Queue:Browse:4       QUEUE                            !Queue declaration for browse/combo box using ?Browse:4
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
History::APH:Record  LIKE(APH:RECORD),THREAD
QuickWindow          WINDOW('Transaksi Instalasi Farmasi - Rawat Jalan'),AT(,,456,256),FONT('Arial',8,,),CENTER,IMM,HLP('UpdateAPHTRANS'),ALRT(EscKey),TIMER(100),GRAY,MDI
                       SHEET,AT(2,5,452,112),USE(?CurrentTab)
                         TAB('Poliklinik (F5)'),USE(?Tab:1),KEY(F5Key),FONT('Arial',8,COLOR:Black,)
                           ENTRY(@s20),AT(137,24,69,10),USE(loc:nomor),UPR
                           ENTRY(@N10),AT(131,38,81,15),USE(APH:Nomor_mr),IMM,DISABLE,FONT('Times New Roman',16,,FONT:bold),MSG('Nomor Medical record pasien'),TIP('Nomor KIUP')
                           PROMPT('RM :'),AT(109,43,18,10),USE(?APH:Nomor_mr:Prompt),FONT('Times New Roman',10,,FONT:bold)
                           OPTION('Status Pembayaran'),AT(6,19,99,49),USE(status),DISABLE,BOXED,FONT('Times New Roman',12,COLOR:Navy,)
                             RADIO('&Gratis / Pegawai'),AT(12,30),USE(?Option1:Radio1),HIDE,FONT('Arial',8,COLOR:Green,FONT:bold),VALUE('1')
                             RADIO('&Umum'),AT(12,42),USE(?Option1:Radio3),FONT('Arial',8,COLOR:Black,),VALUE('2')
                             RADIO('&Non Umum'),AT(12,52,91,13),USE(?Option1:Radio2),FONT('Arial',8,COLOR:Red,FONT:bold),VALUE('3')
                           END
                           PROMPT('Nota'),AT(107,24),USE(?loc:nomortrans:Prompt)
                           ENTRY(@s10),AT(287,23,62,16),USE(APH:Asal),DISABLE,FONT('Times New Roman',14,,),MSG('Kode Poliklinik'),TIP('Kode Poliklinik')
                           BUTTON('&P (F3)'),AT(350,22,26,16),USE(?CallLookup),KEY(F3Key)
                           PROMPT('Nama  :'),AT(217,43),USE(?Prompt5)
                           ENTRY(@s35),AT(247,43,93,10),USE(JPas:Nama),DISABLE,FONT(,,,FONT:bold),HLP('Nama mendahului gelar'),MSG('Nama pasien'),REQ,CAP
                           ENTRY(@s35),AT(344,43,97,10),USE(loc::nama,,?loc::nama:2)
                           PROMPT('Alamat :'),AT(109,57),USE(?Prompt6)
                           ENTRY(@s35),AT(142,57,93,10),USE(JPas:Alamat),DISABLE,HLP('contoh : Kopo Jl'),MSG('Alamat Pasien'),CAP
                           ENTRY(@s35),AT(239,57,97,10),USE(loc::alamat,,?loc::alamat:2)
                           PROMPT('Kota :'),AT(341,57),USE(?APH:NoNota:Prompt:2)
                           PROMPT('NIP:'),AT(8,72),USE(?APH:NIP:Prompt)
                           ENTRY(@s7),AT(24,72,45,10),USE(APH:NIP),DISABLE
                           BUTTON('F4'),AT(73,72,19,10),USE(?Button10),DISABLE
                           PROMPT('No. Resep :'),AT(72,72),USE(?APH:NomorEPresribing:Prompt)
                           ENTRY(@s20),AT(115,72,53,10),USE(APH:NomorEPresribing),DISABLE
                           BUTTON('F9'),AT(171,72,19,10),USE(?Button13)
                           ENTRY(@s40),AT(24,85,112,10),USE(PEGA:Nama),DISABLE
                           PROMPT('Kontraktor:'),AT(196,72),USE(?APH:Kontraktor:Prompt)
                           ENTRY(@s10),AT(240,72,55,10),USE(APH:Kontrak),DISABLE
                           BUTTON('F5'),AT(298,72,19,10),USE(?Button11),DISABLE
                           ENTRY(@s100),AT(319,72,132,10),USE(JKon:NAMA_KTR),DISABLE
                           PROMPT('Nota:'),AT(314,102),USE(?APH:NoNota:Prompt),HIDE
                           ENTRY(@s10),AT(335,102,5,10),USE(APH:NoNota),HIDE,REQ
                           ENTRY(@s20),AT(367,57,69,10),USE(loc::kota,,?loc::kota:2)
                           PROMPT('Dokter:'),AT(196,85),USE(?APH:dokter:Prompt)
                           ENTRY(@s5),AT(240,85,55,10),USE(APH:dokter),DISABLE
                           BUTTON('F7'),AT(298,85,19,10),USE(?Button20),KEY(F7Key)
                           ENTRY(@s30),AT(319,85,132,10),USE(JDok:Nama_Dokter),DISABLE,MSG('Nama Dokter'),TIP('Nama Dokter'),UPR
                           PROMPT('Pembeli Lgs:'),AT(15,102),USE(?JTra:NamaJawab:Prompt)
                           ENTRY(@s40),AT(65,102,87,10),USE(JTra:NamaJawab)
                           PROMPT('Alamat :'),AT(159,102),USE(?JTra:AlamatJawab:Prompt)
                           ENTRY(@s50),AT(194,102,110,10),USE(JTra:AlamatJawab)
                           STRING(@s25),AT(377,26,66,10),USE(JPol:NAMA_POLI)
                           PROMPT('Asal:'),AT(258,25),USE(?APH:Asal:Prompt),FONT('Arial',10,,)
                           BUTTON('F2'),AT(225,22,26,16),USE(?Button12),HIDE,KEY(F2Key)
                         END
                       END
                       PROMPT('No Nota:'),AT(104,3),USE(?APH:NoNota:Prompt:3),HIDE
                       ENTRY(@s10),AT(140,3,61,10),USE(APH:NoNota,,?APH:NoNota:2),DISABLE
                       BUTTON('&Tambah Obat (+)'),AT(5,193,139,19),USE(?Insert:5),FONT('Arial',8,COLOR:Black,FONT:bold),KEY(PlusKey)
                       PROMPT('Kode Apotik:'),AT(209,3,46,10),USE(?APH:Kode_Apotik:Prompt)
                       BUTTON('F8'),AT(209,24,13,10),USE(?calllookup:3),DISABLE,KEY(F8Key)
                       ENTRY(@s5),AT(259,3,39,10),USE(APH:Kode_Apotik),DISABLE,MSG('Kode Apotik'),TIP('Kode Apotik')
                       PROMPT('&TANGGAL:'),AT(306,3,37,10),USE(?APH:Tanggal:Prompt)
                       PROMPT('No Trans:'),AT(7,218),USE(?APH:N0_tran:Prompt),FONT('Arial',8,,FONT:bold+FONT:italic+FONT:underline)
                       ENTRY(@s15),AT(46,217,95,13),USE(APH:N0_tran),DISABLE,FONT('Arial',12,COLOR:Black,FONT:bold),MSG('nomor transaksi'),TIP('nomor transaksi')
                       LINE,AT(279,233,163,0),USE(?Line1),COLOR(COLOR:Black),LINEWIDTH(2)
                       LIST,AT(7,120,440,69),USE(?Browse:4),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('47L(2)|FM~Kode Barang~L(0)@s10@163L(2)|M~Nama Obat~C(0)@s40@65L(2)|M~Keterangan~' &|
   'C(0)@s50@52R(2)|M~Jumlah~C(0)@n-12.2@53R(2)|M~Total~C(0)@n-13.2@60R(2)|M~Diskon~' &|
   'C(0)@n-15.2@27L|M~Camp~C@n2@63L(2)|FM~N 0 tran~L(0)@s15@'),FROM(Queue:Browse:4)
                       PROMPT('Total :'),AT(285,240),USE(?APH:Biaya:Prompt),FONT('Arial',9,COLOR:Black,FONT:bold+FONT:italic)
                       ENTRY(@n-15.2),AT(345,239,97,14),USE(APH:Biaya),DISABLE,RIGHT(1),MSG('Total Biaya Pembelian'),TIP('Total Biaya Pembelian')
                       PANEL,AT(5,214,139,19),USE(?Panel2)
                       BUTTON('&OK (End)'),AT(205,193,45,35),USE(?OK),FONT('Arial',8,COLOR:Black,),KEY(EndKey),ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(153,193,45,35),USE(?Cancel),FONT('Arial',8,COLOR:Black,),ICON(ICON:Cross)
                       BUTTON('Pembulatan [-]'),AT(148,237,102,18),USE(?Button9),FONT('Arial',8,COLOR:Black,FONT:regular),KEY(MinusKey)
                       PROMPT('Sub Total'),AT(285,194),USE(?Prompt10),FONT('Arial',9,COLOR:Black,)
                       ENTRY(@n-15.2),AT(345,212,97,14),USE(discount),DISABLE
                       PROMPT('Diskon :'),AT(285,212),USE(?Prompt8),FONT('Arial',9,COLOR:Black,)
                       BUTTON('&Edit [Ctrl]'),AT(5,237,139,18),USE(?Change:5),FONT(,,COLOR:Blue,FONT:bold),KEY(529)
                       BUTTON('&Delete'),AT(403,0,45,14),USE(?Delete:5),HIDE
                       ENTRY(@n-15.2),AT(345,194,97,14),USE(LOC::TOTAL),DISABLE
                       ENTRY(@D8),AT(348,3,70,10),USE(APH:Tanggal),DISABLE,RIGHT(1),FONT('Times New Roman',12,COLOR:Black,),MSG('Tanggal berobat pasen'),TIP('Tanggal berobat pasen')
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
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Update                 PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW4                 CLASS(BrowseClass)                    ! Browse using ?Browse:4
Q                      &Queue:Browse:4                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetFromAsk           PROCEDURE(*BYTE Request,*BYTE Response),DERIVED ! Method added to host embed code
ResetFromView          PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW4::Sort0:StepClass StepStringClass                      ! Default Step Manager
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False) ! Method added to host embed code
                     END

view::jtrans view(filesql2)
                project(FIL1:Byte1,FIL1:Byte2,FIL1:String1,FIL1:String2,FIL1:String3,FIL1:String4,FIL1:String5)
             end
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
        NEXT(BRW4::View:Browse)
        IF ERRORCODE() THEN BREAK.
        DELETE(BRW4::View:Browse)
    END

BATAL_D_DUA ROUTINE
    SET(APDTcam)
    APD1:N0_tran=glo::no_nota
    SET(APD1:by_tranno,APD1:by_tranno)
    LOOP
        IF Access:APDTcam.Next()<>Level:Benign OR APD1:N0_tran <> glo::no_nota THEN BREAK.
        DELETE( APDTcam)
    END

BATAL_Transaksi ROUTINE
    SET(APDTcam)
    APD1:N0_tran=glo::no_nota
    APD1:Camp=APD:Camp
    SET(APD1:by_tran_cam,APD1:by_tran_cam)
    LOOP
        IF Access:APDTcam.Next()<>Level:Benign OR APD1:Camp<>APD:Camp THEN BREAK.
        DELETE( APDTcam)
    END


!Proses Penomoran Otomatis Transaksi
Isi_Nomor Routine
   vl_nomor=''
   display
   loop
      logout(1,nomor_batal)
      if errorcode()=56 then
         cycle.
      !Silahkan diganti ---> 63=Transaksi Apotik ke Pasien Rawat Jalan
      NOM:No_Urut=63
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 63=Transaksi Apotik ke Pasien Rawat Jalan
         NOMU:Urut =63
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
        !Silahkan diganti ---> 63=Transaksi Apotik ke Pasien Rawat Jalan
        NOM1:No_urut=63
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 63=Transaksi Apotik ke Pasien Rawat Jalan
           NOMU:Urut =63
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
      !Silahkan diganti ---> 63=Transaksi Apotik ke Pasien Rawat Jalan
      nomor_batal{prop:sql}='delete dba.nomor_batal where No=63'
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 63=Transaksi Apotik ke pasien Rawat Jalan
         NOM1:No_urut=63
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
   APH:N0_tran=vl_nomor
   display

Batal_Nomor Routine
   !Silahkan diganti ---> 63=Transaksi Apotik ke pasien Rawat Jalan
   NOM:No_Urut =63
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=APH:N0_tran
   NOM:Keterangan='Aptk R. Jalan'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 63=Transaksi Apotik ke pasien Rawat Jalan
   NOMU:Urut =63
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOMU:Nomor=APH:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   delete(nomoruse)

Hapus_Nomor_Use Routine
   NOMU:Urut =63
   NOMU:Nomor=APH:N0_tran
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
      !Silahkan diganti ---> 63=Transaksi Apotik ke Pasien Rawat Jalan
      NOM:No_Urut=vl_no_urut
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 63=Transaksi Apotik ke Pasien Rawat Jalan
         NOMU:Urut =vl_no_urut
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
        !Silahkan diganti ---> 63=Transaksi Apotik ke Pasien Rawat Jalan
        NOM1:No_urut=vl_no_urut
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 63=Transaksi Apotik ke Pasien Rawat Jalan
           NOMU:Urut =vl_no_urut
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
      !Silahkan diganti ---> 63=Transaksi Apotik ke Pasien Rawat Jalan
      nomor_batal{prop:sql}='delete dba.nomor_batal where No='&vl_no_urut
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 63=Transaksi Apotik ke pasien Rawat Jalan
         NOM1:No_urut=vl_no_urut
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
   APH:N0_tran=vl_nomor
   display

Batal_Nomor1 Routine
   !Silahkan diganti ---> 63=Transaksi Apotik ke pasien Rawat Jalan
   NOM:No_Urut =vl_no_urut
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=APH:N0_tran
   NOM:Keterangan='Aptk R. Jalan'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 63=Transaksi Apotik ke pasien Rawat Jalan
   NOMU:Urut =vl_no_urut
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOMU:Nomor=APH:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   delete(nomoruse)

Hapus_Nomor_Use1 Routine
   NOMU:Urut =vl_no_urut
   NOMU:Nomor=APH:N0_tran
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
    ActionMessage = 'Changing a APHTRANS Record'
  END
  status=2
  CLEAR(JPas:Nama)
  CLEAR(JPas:Alamat)
  CLEAR(JPol:Nama_poli)
  CLEAR(loc::nama)
  CLEAR(loc::alamat)
  CLEAR(loc::RT)
  CLEAR(loc::rw)
  CLEAR(loc::kota)
  CEK_RUN=0
  ?OK{PROP:DISABLE}=TRUE
  discount=0
  pers_disc=0
  ?BROWSE:4{PROP:DISABLE}=TRUE
  ?Insert:5{PROP:DISABLE}=TRUE
  Hitung_campur = 0
  sudah_nomor = 0
  masuk_disc = 0
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_UpdateRawatJalan11')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?loc:nomor
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  APH:Nomor_mr = 99999999
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APH:Record,History::APH:Record)
  SELF.AddHistoryField(?APH:Nomor_mr,1)
  SELF.AddHistoryField(?APH:Asal,8)
  SELF.AddHistoryField(?APH:NIP,13)
  SELF.AddHistoryField(?APH:NomorEPresribing,23)
  SELF.AddHistoryField(?APH:Kontrak,14)
  SELF.AddHistoryField(?APH:NoNota,17)
  SELF.AddHistoryField(?APH:dokter,16)
  SELF.AddHistoryField(?APH:NoNota:2,17)
  SELF.AddHistoryField(?APH:Kode_Apotik,10)
  SELF.AddHistoryField(?APH:N0_tran,4)
  SELF.AddHistoryField(?APH:Biaya,3)
  SELF.AddHistoryField(?APH:Tanggal,2)
  SELF.AddUpdateFile(Access:APHTRANS)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  case deformat(sub(clip(GL_entryapotik),3,2),@n2)
     of '01'
        vl_no_urut=22
     of '02'
        vl_no_urut=23
     of '04'
        vl_no_urut=24
     of '06'
        vl_no_urut=25
     of '07'
        vl_no_urut=26
     of '08'
        vl_no_urut=27
  END
  Relate:APDTRANS.Open                                     ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:APDTRANSDet.Open                                  ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:Ano_pakai.Open                                    ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:Apetiket.Open                                     ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql.Open                                      ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql2.Open                                     ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:IAP_SET.Open                                      ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:JHBILLING.Open                                    ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_Batal.Open                                  ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:SMPegawai.SetOpenRelated()
  Relate:SMPegawai.Open                                    ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:TBTransResepDokterDetail.Open                     ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:TBTransResepDokterEtiket.Open                     ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:TBTransResepDokterHeader.Open                     ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:TBTransResepObatCampur.Open                       ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:Tbstawal.Open                                     ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPoli.UseFile                                     ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKelPeg.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APDTcam.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ApReLuar.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JTransaksi.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:APHTRANS
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
  BRW4.Init(?Browse:4,Queue:Browse:4.ViewPosition,BRW4::View:Browse,Queue:Browse:4,Relate:APDTRANS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  if self.request=1 then
     do isi_nomor
  end
  open(view::jtrans)
  ?Browse:4{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW4.Q &= Queue:Browse:4
  BRW4::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon APD:N0_tran for sort order 1
  BRW4.AddSortOrder(BRW4::Sort0:StepClass,APD:notran_kode) ! Add the sort order for APD:notran_kode for sort order 1
  BRW4.AddRange(APD:N0_tran,Relate:APDTRANS,Relate:APHTRANS) ! Add file relationship range limit for sort order 1
  BRW4.AddField(APD:Kode_brg,BRW4.Q.APD:Kode_brg)          ! Field APD:Kode_brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Nama_Brg,BRW4.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Ket2,BRW4.Q.GBAR:Ket2)                ! Field GBAR:Ket2 is a hot field or requires assignment from browse
  BRW4.AddField(APD:Jumlah,BRW4.Q.APD:Jumlah)              ! Field APD:Jumlah is a hot field or requires assignment from browse
  BRW4.AddField(APD:Total,BRW4.Q.APD:Total)                ! Field APD:Total is a hot field or requires assignment from browse
  BRW4.AddField(APD:Diskon,BRW4.Q.APD:Diskon)              ! Field APD:Diskon is a hot field or requires assignment from browse
  BRW4.AddField(APD:Camp,BRW4.Q.APD:Camp)                  ! Field APD:Camp is a hot field or requires assignment from browse
  BRW4.AddField(APD:N0_tran,BRW4.Q.APD:N0_tran)            ! Field APD:N0_tran is a hot field or requires assignment from browse
  BRW4.AddField(GBAR:Kode_brg,BRW4.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_UpdateRawatJalan11',QuickWindow)      ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW4.AskProcedure = 3
  SELF.AddItem(ToolbarForm)
  BRW4.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  if (self.request=1 and self.response=2) or (self.request=3 and self.response=1) then
     do batal_nomor
     DO BATAL_D_DUA
     DO BATAL_D_UTAMA
  end
  if self.request=1 and self.response=1 then
     do hapus_nomor_use
  end
  close(view::jtrans)
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:APDTRANSDet.Close
    Relate:Ano_pakai.Close
    Relate:Apetiket.Close
    Relate:FileSql.Close
    Relate:FileSql2.Close
    Relate:IAP_SET.Close
    Relate:JHBILLING.Close
    Relate:NomorUse.Close
    Relate:Nomor_Batal.Close
    Relate:Nomor_SKR.Close
    Relate:SMPegawai.Close
    Relate:TBTransResepDokterDetail.Close
    Relate:TBTransResepDokterEtiket.Close
    Relate:TBTransResepDokterHeader.Close
    Relate:TBTransResepObatCampur.Close
    Relate:Tbstawal.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_UpdateRawatJalan11',QuickWindow)   ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
    APH:Tanggal = Today()
    APH:Kode_Apotik = GL_entryapotik
    APH:Jam = clock()
    APH:User = glo:user_id
  PARENT.PrimeFields


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  JTra:No_Nota = APH:NoNota                                ! Assign linking field value
  Access:JTransaksi.Fetch(JTra:KeyNoNota)
  JDok:Kode_Dokter = APH:dokter                            ! Assign linking field value
  Access:JDokter.Fetch(JDok:KeyKodeDokter)
  JKon:KODE_KTR = APH:Kontrak                              ! Assign linking field value
  Access:JKontrak.Fetch(JKon:KeyKodeKtr)
  PEGA:Nik = APH:NIP                                       ! Assign linking field value
  Access:SMPegawai.Fetch(PEGA:Pkey)
  APH:Biaya = (LOC::TOTAL - discount)
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
      Cari_nama_poli
      SelectDokter
      Trig_UpdateRawatJalanDetil2
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
    OF ?APH:Nomor_mr
      if vl_sudah=0
         IF CLIP(loc::nama) = ''
             JPas:Nomor_mr=APH:Nomor_mr
             GET( JPasien,JPas:KeyNomorMr)
             IF ERRORCODE() = 35 THEN
                 MESSAGE('Nomor RM Tidak Ada Dalam daftar')
                 JKon:KODE_KTR    =''
                 access:jkontrak.fetch(JKon:KeyKodeKtr)
                 PEGA:Nik         =''
                 access:smpegawai.fetch(PEGA:Pkey)
                 JDok:Kode_Dokter=''
                 access:jdokter.fetch(JDok:KeyKodeDokter)
                 APH:dokter       =''
                 APH:Asal         =''
                 APH:NIP          =''
                 APH:Kontrak      =''
                 APH:NoNota       =''
                 !APH:Nomor_mr     = 99999999
                 APH:cara_bayar   =2
                 status           =2
                 ?BROWSE:4{PROP:DISABLE}=1
                 ?Insert:5{PROP:DISABLE}=TRUE
                 ?APH:NIP{PROP:DISABLE}=true
                 ?APH:Kontrak{PROP:DISABLE}=TRUE
                 ?Button11{PROP:DISABLE}=TRUE
                 ?Button10{PROP:DISABLE}=true
                 ?APH:NoNota{PROP:DISABLE}=true
                 ?CallLookup:3{PROP:DISABLE}=false
                 CLEAR (JPas:Nama)
                 CLEAR (JPas:Alamat)
                 DISPLAY
                 SELECT(?APH:Nomor_mr)
             ELSE
                 ?BROWSE:4{PROP:DISABLE}=0
                 ?Insert:5{PROP:DISABLE}=0
                 glo::campur=0
                 !message('select kode_transaksi,lamabaru,kode_dokter,kontraktor,kode_poli,no_nota,nip from dba.jtransaksi where statusBatal<<>1 and nomor_mr='&aph:nomor_mr&' and tanggal='''&format(today(),@d10)&''' order by no_nota')
                 !(statusBatal<<>1 or statusBatal is null) and 
                 view::jtrans{prop:sql}='select kode_transaksi,lamabaru,kode_dokter,kontraktor,kode_poli,no_nota,nip from dba.jtransaksi where (statusBatal<<>1 or statusBatal is null) and nomor_mr='&aph:nomor_mr&' and tanggal='''&format(today(),@d10)&''' order by no_nota desc'
                 !if errorcode() then message(error()).
                 next(view::jtrans)
                 if not errorcode() then
                    loc:nomor=FIL1:String4
                    JPas:Nomor_mr=aph:nomor_mr
                    access:jpasien.fetch(JPas:KeyNomorMr)
                    JDok:Kode_Dokter=FIL1:String1
                    access:jdokter.fetch(JDok:KeyKodeDokter)
                    APH:Asal     =FIL1:String3
                    APH:dokter   =FIL1:String1
                    !message(JTra:Kode_Transaksi)
                    !message(FIL1:Byte1&' '&FIL1:String2)
                    if FIL1:Byte1=3 then
                       JKon:KODE_KTR=FIL1:String2
                       access:jkontrak.fetch(JKon:KeyKodeKtr)
                       !message(JKon:NAMA_KTR)
                       APH:Kontrak =FIL1:String2
                       APH:NIP      =''
                       PEGA:Nik         =''
                       APH:NoNota    =FIL1:String4
                       access:smpegawai.fetch(PEGA:Pkey)
                       ?Button11{PROP:DISABLE}=false
                       ?Button10{PROP:DISABLE}=true
                       ?APH:NIP{PROP:DISABLE}=true
                       ?APH:Kontrak{PROP:DISABLE}=false
                       ?APH:NoNota{PROP:DISABLE}=false
                       ?CallLookup:3{PROP:DISABLE}=false
                    elsif FIL1:Byte1=1 then
                       JKon:KODE_KTR =''
                       access:jkontrak.fetch(JKon:KeyKodeKtr)
                       APH:Kontrak   =''
                       APH:NoNota    =''
                       PEGA:Nik      =FIL1:String5
                       access:smpegawai.fetch(PEGA:Pkey)
                       APH:NIP       =FIL1:String5
                       ?Button11{PROP:DISABLE}=true
                       ?Button10{PROP:DISABLE}=false
                       !?APH:NIP{PROP:DISABLE}=false
                       ?APH:Kontrak{PROP:DISABLE}=TRUE
                       ?APH:NoNota{PROP:DISABLE}=true
                       ?CallLookup:3{PROP:DISABLE}=false
                    else
                       JKon:KODE_KTR =''
                       access:jkontrak.fetch(JKon:KeyKodeKtr)
                       PEGA:Nik      =''
                       access:smpegawai.fetch(PEGA:Pkey)
                       APH:NIP       =''
                       APH:Kontrak   =''
                       APH:NoNota    =''
                       ?Button10{PROP:DISABLE}=true
                       ?Button11{PROP:DISABLE}=true
                       ?APH:NIP{PROP:DISABLE}=true
                       ?APH:Kontrak{PROP:DISABLE}=TRUE
                       ?APH:NoNota{PROP:DISABLE}=true
                       ?CallLookup:3{PROP:DISABLE}=false
                    end
                    APH:LamaBaru  =FIL1:Byte2
                    APH:cara_bayar=FIL1:Byte1
                    APH:NoNota    =loc:nomor
                    status=FIL1:Byte1
                    display
                 else
                    !message(JTra:Kode_Transaksi&' '&errorcode())
                    JKon:KODE_KTR    =''
                    access:jkontrak.fetch(JKon:KeyKodeKtr)
                    PEGA:Nik         =''
                    access:smpegawai.fetch(PEGA:Pkey)
                    JDok:Kode_Dokter=''
                    access:jdokter.fetch(JDok:KeyKodeDokter)
                    APH:dokter       =''
                    APH:Asal         =''
                    APH:NIP          =''
                    APH:Kontrak      =''
                    APH:NoNota       =''
                    APH:cara_bayar   =2
                    status=2
                    ?APH:NIP{PROP:DISABLE}=true
                    ?APH:Kontrak{PROP:DISABLE}=TRUE
                    ?APH:NoNota{PROP:DISABLE}=true
                    ?Button10{PROP:DISABLE}=true
                    ?Button11{PROP:DISABLE}=true
                    ?CallLookup:3{PROP:DISABLE}=false
                 end
             END
         ELSE
             APH:Nomor_mr = 99999999
         END
      end
      display
    OF ?status
      if vl_sudah=0
      IF CEK_RUN = 0
        CASE status
        OF 1
           JKon:KODE_KTR=''
           access:jkontrak.fetch(JKon:KeyKodeKtr)
           APH:Kontrak=''
           !APH:NoNota=''
           ?APH:Kontrak{PROP:DISABLE}=TRUE
           ?Button11{PROP:DISABLE}=TRUE
           ?Button10{PROP:DISABLE}=false
           ?APH:NoNota{PROP:DISABLE}=false
           ?CallLookup:3{PROP:DISABLE}=false
           ?Insert:5{PROP:DISABLE}=false
           display
           !select(?Button10)
        of 2
           JKon:KODE_KTR=''
           access:jkontrak.fetch(JKon:KeyKodeKtr)
           APH:Kontrak=''
           PEGA:Nik=''
           access:smpegawai.fetch(PEGA:Pkey)
           APH:NIP=''
           !APH:NoNota=''
           ?APH:Kontrak{PROP:DISABLE}=TRUE
           ?Button11{PROP:DISABLE}=TRUE
           ?APH:NIP{PROP:DISABLE}=TRUE
           ?Button10{PROP:DISABLE}=true
           ?APH:NoNota{PROP:DISABLE}=false
           ?CallLookup:3{PROP:DISABLE}=false
           ?Insert:5{PROP:DISABLE}=false
           display
        OF 3
           PEGA:Nik=''
           access:smpegawai.fetch(PEGA:Pkey)
           APH:NIP=''
           ?APH:NIP{PROP:DISABLE}=TRUE
           ?APH:Kontrak{PROP:DISABLE}=false
           ?Button11{PROP:DISABLE}=false
           ?Button10{PROP:DISABLE}=true
           ?APH:NoNota{PROP:DISABLE}=false
           ?CallLookup:3{PROP:DISABLE}=false
           ?Insert:5{PROP:DISABLE}=false
           display
           !select(?Button11)
        end
        APH:cara_bayar=status
      end
      end
    OF ?OK
      if APH:NoNota='' then
         message('No nota harus terisi !!!')
         cycle
      end
      !if vl_sudah=0
      sudah_nomor = 0
      glo::no_nota = APH:N0_tran
      !memperbaharui file Aphtrans, apdtrans, gstokaptk, apreluar
      CEK_RUN=1
      APH:User=GL::Prefix
      ! *****UNTUK file ApHTrans******
      APH:Bayar=0
      APH:Ra_jal=1
      APH:cara_bayar=status
      APH:Kode_Apotik=GL_entryapotik
      APH:User = Glo:USER_ID
      
      !untuk file ApReLuar
      IF CLIP(loc::nama) <> ''
          APR:Nama = loc::nama
          APR:Alamat = loc::alamat
          APR:RT     = loc::RT
          APR:RW     = loc::rw
          APR:Kota   = loc::kota
          APR:N0_tran = APH:N0_tran
          Access:ApReLuar.Insert()
      END
      
      !untuk file ApDTrans
      !IF discount <> 0
      !    APD:N0_tran = APH:N0_tran
      !    APD:Kode_brg = '_Disc'
      !    APD:Total = - discount
      !    APD:Jumlah = pers_disc
      !    Access:APDTRANS.Insert()
      !END
      
      !cek dulu bulannya ya, kalau sudah berubah, tulis dulu ke file awal bulan
      IF MONTH(glo::tgl_awal_kerja) <> mONTH(TODAY())
         APH:Tanggal = TODAY()
         Tahun_ini = YEAR(TODAY())
         Loc::delete=0
         SET(APDTRANS)
         APD:N0_tran = APH:N0_tran
         SET(APD:by_transaksi,APD:by_transaksi)
         LOOP
            IF Access:APDTRANS.Next()<>Level:Benign OR APD:N0_tran <> APH:N0_tran THEN BREAK.
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
            END
         END
      END
      !end
      vl_sudah=1
    OF ?discount
      if vl_sudah=0
      IF DISCOUNT > 0 AND masuk_disc = 0
          masuk_disc = 1
      END
      end
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?loc:nomor
      if vl_sudah=0
         !if loc:nomor<>'' then
         if loc:tgl=0 then
            loc:tgl=today()
         end
         !khusus untuk nomor pake jjjjjjjjj
         if loc:nomor<>'' then
            if numeric(loc:nomor)=1 then
              ! loc:ang_string=numeric(loc:Trans_lokal) 
               loc:temth2=year(loc:tgl)
               loc:bl2=month(loc:tgl)
               loc:bls2=format(loc:bl2,@p##p)
               loc:th22=sub(loc:temth2,3,2)
               loc:th32=format(loc:th22,@p##p)
               loc:nums2=format(loc:nomor,@p#####p)
               loc:nomor=clip('J')&''&clip(loc:th32)&''&clip(loc:bls2)&''&clip(loc:nums2)
            end
            JTra:No_Nota=loc:nomor
            GET(jtRANSAKSI,JTra:KeyNoNota)
            IF NOT ERRORCODE() THEN
            END
            if JTra:StatusBatal=1 then
               message('Registrasi sudah batal !!!')
               loc:nomor=''
               select(?loc:nomor)
               cycle
            end
            !message(loc:nomor)
            JHB:NOMOR=loc:nomor
            if access:jhbilling.fetch(JHB:KNOMOR)=level:benign then
               !message(JHB:TUTUP)
      !         if JHB:TUTUP=1 then
      !            message('Nota sudah ditutup !!!')
      !            loc:nomor=''
      !            select(?loc:nomor)
      !            cycle
      !         else
                  APH:NoNota=loc:nomor
                  DISPLAY
      !         end
            else
               message('Nota tidak ada !!!')
               loc:nomor=''
               select(?loc:nomor)
               cycle
            end
            APH:NoNota=loc:nomor
            APH:Nomor_mr=JTra:Nomor_Mr
            display
      
            IF CLIP(loc::nama) = ''
                JPas:Nomor_mr=APH:Nomor_mr
                GET( JPasien,JPas:KeyNomorMr)
                IF ERRORCODE() = 35 THEN
                    MESSAGE('Nomor RM Tidak Ada Dalam daftar')
                    JKon:KODE_KTR    =''
                    access:jkontrak.fetch(JKon:KeyKodeKtr)
                    PEGA:Nik         =''
                    access:smpegawai.fetch(PEGA:Pkey)
                    JDok:Kode_Dokter=''
                    access:jdokter.fetch(JDok:KeyKodeDokter)
                    APH:dokter       =''
                    APH:Asal         =''
                    APH:NIP          =''
                    APH:Kontrak      =''
                    APH:NoNota       =''
                    !APH:Nomor_mr     = 99999999
                    APH:cara_bayar   =2
                    status           =2
                    ?BROWSE:4{PROP:DISABLE}=1
                    ?Insert:5{PROP:DISABLE}=TRUE
                    ?APH:NIP{PROP:DISABLE}=true
                    ?APH:Kontrak{PROP:DISABLE}=TRUE
                    ?Button11{PROP:DISABLE}=TRUE
                    ?Button10{PROP:DISABLE}=true
                    ?APH:NoNota{PROP:DISABLE}=true
                    ?CallLookup:3{PROP:DISABLE}=false
                    CLEAR (JPas:Nama)
                    CLEAR (JPas:Alamat)
                    DISPLAY
                    !SELECT(?APH:Nomor_mr)
                ELSE
                    ?BROWSE:4{PROP:DISABLE}=0
                    ?Insert:5{PROP:DISABLE}=0
                    glo::campur=0
                    !message('select kode_transaksi,lamabaru,kode_dokter,kontraktor,kode_poli,no_nota,nip from dba.jtransaksi where statusBatal<<>1 and nomor_mr='&aph:nomor_mr&' and tanggal='''&format(today(),@d10)&''' order by no_nota')
                    !(statusBatal<<>1 or statusBatal is null) and 
                    !view::jtrans{prop:sql}='select kode_transaksi,lamabaru,kode_dokter,kontraktor,kode_poli,no_nota,nip from dba.jtransaksi where (statusBatal<<>1 or statusBatal is null) and No_Nota='''&clip(loc:nomor)&''' and tanggal='''&format(today(),@d10)&''' order by no_nota desc'
                    view::jtrans{prop:sql}='select kode_transaksi,lamabaru,kode_dokter,kontraktor,kode_poli,no_nota,nip from dba.jtransaksi where (statusBatal<<>1 or statusBatal is null) and No_Nota='''&clip(loc:nomor)&''' order by no_nota desc'
                    !if errorcode() then message(error()).
                    next(view::jtrans)
                    if not errorcode() then
                       !message(FIL1:String1&' '&FIL1:String2&' '&FIL1:String3)
                       JPas:Nomor_mr=aph:nomor_mr
                       access:jpasien.fetch(JPas:KeyNomorMr)
                       JDok:Kode_Dokter=FIL1:String1
                       access:jdokter.fetch(JDok:KeyKodeDokter)
                       APH:Asal     =FIL1:String3
                       APH:dokter   =FIL1:String1
                       !PH:NoNota   =
                       display
                       !message(JTra:Kode_Transaksi)
                       !message(FIL1:Byte1&' '&FIL1:String2)
                       if FIL1:Byte1=3 then
                          JKon:KODE_KTR=FIL1:String2
                          access:jkontrak.fetch(JKon:KeyKodeKtr)
                          !message(JKon:NAMA_KTR)
                          APH:Kontrak =FIL1:String2
                          APH:NIP      =''
                          PEGA:Nik         =''
                          status=3
                          APH:NoNota    =FIL1:String4
                          access:smpegawai.fetch(PEGA:Pkey)
                          !?Button11{PROP:DISABLE}=false
                          ?Button10{PROP:DISABLE}=true
                          ?APH:NIP{PROP:DISABLE}=true
                          !?APH:Kontrak{PROP:DISABLE}=false
                          !?APH:NoNota{PROP:DISABLE}=false
                          !?CallLookup:3{PROP:DISABLE}=false
      !                 elsif FIL1:Byte1=1 then
      !                    JKon:KODE_KTR =''
      !                    access:jkontrak.fetch(JKon:KeyKodeKtr)
      !                    APH:Kontrak   =''
      !                    !APH:NoNota    =''
      !                    PEGA:Nik      =FIL1:String5
      !                    access:smpegawai.fetch(PEGA:Pkey)
      !                    APH:NIP       =FIL1:String5
      !                    status=1
      !                    ?Button11{PROP:DISABLE}=true
      !                    ?Button10{PROP:DISABLE}=false
      !                    !?APH:NIP{PROP:DISABLE}=false
      !                    ?APH:Kontrak{PROP:DISABLE}=TRUE
      !                    ?APH:NoNota{PROP:DISABLE}=true
      !                    ?CallLookup:3{PROP:DISABLE}=false
                       else
                          JKon:KODE_KTR =''
                          access:jkontrak.fetch(JKon:KeyKodeKtr)
                          PEGA:Nik      =''
                          access:smpegawai.fetch(PEGA:Pkey)
                          APH:NIP       =''
                          APH:Kontrak   =''
                          !APH:NoNota    =''
                          status=2
                          ?Button10{PROP:DISABLE}=true
                          ?Button11{PROP:DISABLE}=true
                          ?APH:NIP{PROP:DISABLE}=true
                          ?APH:Kontrak{PROP:DISABLE}=TRUE
                          ?APH:NoNota{PROP:DISABLE}=true
                          !?CallLookup:3{PROP:DISABLE}=false
                       end
                       APH:LamaBaru  =FIL1:Byte2
                       APH:cara_bayar=FIL1:Byte1
                       status=FIL1:Byte1
                       display
                    else
                       message('Nota sudah lewat hari !')
                       JKon:KODE_KTR    =''
                       access:jkontrak.fetch(JKon:KeyKodeKtr)
                       PEGA:Nik         =''
                       access:smpegawai.fetch(PEGA:Pkey)
                       JDok:Kode_Dokter=''
                       access:jdokter.fetch(JDok:KeyKodeDokter)
                       APH:dokter       =''
                       APH:Asal         =''
                       APH:NIP          =''
                       APH:Kontrak      =''
                       APH:NoNota       =''
                       APH:cara_bayar   =2
                       status=2
                       ?APH:NIP{PROP:DISABLE}=true
                       ?APH:Kontrak{PROP:DISABLE}=TRUE
                       ?APH:NoNota{PROP:DISABLE}=true
                       ?Button10{PROP:DISABLE}=true
                       ?Button11{PROP:DISABLE}=true
                       ?CallLookup:3{PROP:DISABLE}=false
                    end
                END
            ELSE
                APH:Nomor_mr = 99999999
            END
         end
         display
      END
    OF ?CallLookup
      ThisWindow.Update
      JPol:POLIKLINIK = APH:Asal
      IF SELF.Run(1,SelectRecord) = RequestCompleted       ! Call lookup procedure and verify RequestCompleted
        APH:Asal = JPol:POLIKLINIK
      END
      ThisWindow.Reset(1)
    OF ?Button10
      ThisWindow.Update
      if vl_sudah=0
         globalrequest=selectrecord
         selectpegawai
         APH:NIP=PEGA:Nik
         display
         if status=1 then
         !aph:nip<>'' then
            enable(?ok)
         else
            disable(?ok)
         end
      
         if APH:NIP<>'' then
            ?insert:5{prop:disable}=false
         else
            ?insert:5{prop:disable}=true
         end
      end
    OF ?Button13
      ThisWindow.Update
      if vl_sudah=0
      glo:nobillresep=loc:nomor
      glo:mrstring=APH:Nomor_mr
      !message(glo:mrstring)
      globalrequest=selectrecord
      SelectResepHeader
      APH:NomorEPresribing=TBT2:NoTrans
      tbtransresepdokterdetail{prop:sql}='select * from dba.tbtransresepdokterdetail where notrans='''&TBT2:NoTrans&''''
      loop
         if access:tbtransresepdokterdetail.next()<>level:benign then break.
         !message(APH:N0_tran&' '&TBT:ItemCode&' '&TBT:Qty)
      
         APD:N0_tran      =APH:N0_tran
         APD:Kode_brg     =TBT:ItemCode
         APD:Jumlah       =TBT:Qty
         display
      
         !HITUNG HARGA
         GSTO:Kode_Apotik = GL_entryapotik
         GSTO:Kode_Barang = APD:Kode_brg
         GET(GStokaptk,GSTO:KeyBarang)
         if not(errorcode()) then
         !message(APD:Jumlah&' '&GSTO:Saldo)
         APD:Total = 0
         APD:Harga_Dasar = 0
         !message(APD:Jumlah&' '&GSTO:Saldo&' '&GSTO:Kode_Barang)
         IF APD:Jumlah <= GSTO:Saldo and APD:Jumlah<>0 then
            GBAR:Kode_brg =APD:Kode_brg
            access:gbarang.fetch(GBAR:KeyKodeBrg)
      
            !?OK{PROP:DISABLE}=0
            if GBAR:Kelompok=19 then
               APD:Total = GL_beaR + (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1.3)) * APD:Jumlah)
            else
               CASE  status
               OF 1
                  APD:Total = APD:Jumlah * GSTO:Harga_Dasar * (1+(GL_PPN/100))
               of 3
                  JKon:KODE_KTR=APH:Kontrak
                  access:jkontrak.fetch(JKon:KeyKodeKtr)
                  if JKon:HargaObat>0 then
                     APD:Total = GL_beaR + |
                              (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) *JKon:HargaObat) * APD:Jumlah)
                  else
                     APO:KODE_KTR = GLO::back_up
                     APO:Kode_brg = APD:Kode_brg
                     GET(APOBKONT,APO:by_kode_ktr)
                     IF ERRORCODE() then
                        APD:Total = GL_beaR + |
                               (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(GL_nt_kls2 / 100 ))) * APD:Jumlah)
                     ELSE
                        APD:Total = GL_beaR + |
                               (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+ (APO:PERS_TAMBAH / 100 ))) * APD:Jumlah)
                     end
                  END
               else
                  if GBAR:Kelompok=22 then
                     APD:Total = GL_beaR + |
                               (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+( 10/ 100 ))) * APD:Jumlah)
                  else
                     APD:Total = GL_beaR + |
                               (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+( GL_Um_kls1 / 100 ))) * APD:Jumlah)
                  end
      
               END
            end
            !Awal Perbaikan Tgl 10/10/2005 Obat Onkologi
            if GBAR:Kelompok=20 then
               GSGD:Kode_brg=APD:Kode_brg
               access:gstockgdg.fetch(GSGD:KeyKodeBrg)
               APD:Total = GL_beaR + ((GSTO:Harga_Dasar*(1-GSGD:Discount/100))*(1+GL_PPN/100)) * APD:Jumlah
            end
            !Akhir Perbaikan Tgl 10/10/2005 Obat Onkologi
      
            !Awal Perbaikan Tgl 20/10/2005 Obat Askes
            if sub(clip(APD:Kode_brg),1,3)='3.3' then
               IF sub(clip(APD:Kode_brg),1,8)='3.3.EMBA'
                  !Resep Jadi
                  GSGD:Kode_brg=APD:Kode_brg
                  access:gstockgdg.fetch(GSGD:KeyKodeBrg)
                  APD:Total = GSTO:Harga_Dasar * APD:Jumlah
               else
                  !Resep Jadi
                  GSGD:Kode_brg=APD:Kode_brg
                  access:gstockgdg.fetch(GSGD:KeyKodeBrg)
                  vl_hna=(GSTO:Harga_Dasar*(1-GSGD:Discount/100))*1.1
                  if vl_hna<50000 then
                     APD:Total = GL_beaR + vl_hna * APD:Jumlah * 1.2
                  elsif vl_hna<100000 then
                     APD:Total = GL_beaR + vl_hna * APD:Jumlah * 1.15
                  else
                     APD:Total = GL_beaR + vl_hna * APD:Jumlah * 1.1
                  end
                  display
               end
            end
            !Akhir Perbaikan Tgl 20/10/2005 Obat Askes
            IF sub(clip(APD:Kode_brg),1,8)='3.1.EMBA'
              !Resep Jadi
              GSGD:Kode_brg=APD:Kode_brg
              access:gstockgdg.fetch(GSGD:KeyKodeBrg)
              APD:Total = GSTO:Harga_Dasar * APD:Jumlah
            end
            display
      
            APD:Harga_Dasar = GSTO:Harga_Dasar
            vl_diskon_pct=(APD:Diskon*100)/APD:Total
            vl_total     =APD:Total-APD:Diskon
            display
            !SELESAI HITUNG HARGA
         else
            APD:Jumlah       = 0
            APD:Total        = 0
            APD:Harga_Dasar  = 0
            display
         end
         access:apdtrans.insert()
         else
            APD:Jumlah       = 0
            APD:Total        = 0
            APD:Harga_Dasar  = 0
            access:apdtrans.insert()
            display
         end
      end
      
      !Obat Campur
      tbtransresepobatcampur{prop:sql}='select * from dba.tbtransresepobatcampur where notrans='''&TBT2:NoTrans&''''
      loop
         if access:tbtransresepobatcampur.next()<>level:benign then break.
         !message(APH:N0_tran&' '&TBT:ItemCode&' '&TBT:Qty)
      
         APD:N0_tran      =APH:N0_tran
         APD:Kode_brg     =TBT3:ItemCode
         APD:Jumlah       =TBT3:Qty
         display
      
         !HITUNG HARGA
         GSTO:Kode_Apotik = GL_entryapotik
         GSTO:Kode_Barang = APD:Kode_brg
         GET(GStokaptk,GSTO:KeyBarang)
         if not(errorcode()) then
         !message(APD:Jumlah&' '&GSTO:Saldo)
         APD:Total = 0
         APD:Harga_Dasar = 0
         IF APD:Jumlah <= GSTO:Saldo and APD:Jumlah<>0 then
            GBAR:Kode_brg =APD:Kode_brg
            access:gbarang.fetch(GBAR:KeyKodeBrg)
      
            !?OK{PROP:DISABLE}=0
            if GBAR:Kelompok=19 then
               APD:Total = GL_beaR + (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1.3)) * APD:Jumlah)
            else
               CASE  status
               OF 1
                  APD:Total = APD:Jumlah * GSTO:Harga_Dasar * (1+(GL_PPN/100))
               OF 2
                  if GBAR:Kelompok=22 then
                     APD:Total = GL_beaR + |
                               (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+( 10/ 100 ))) * APD:Jumlah)
                  else
                     APD:Total = GL_beaR + |
                               (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+( GL_Um_kls1 / 100 ))) * APD:Jumlah)
                  end
               OF 3
                  JKon:KODE_KTR=APH:Kontrak
                  access:jkontrak.fetch(JKon:KeyKodeKtr)
                  if JKon:HargaObat>0 then
                     APD:Total = GL_beaR + |
                              (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) *JKon:HargaObat) * APD:Jumlah)
                  else
                     APO:KODE_KTR = GLO::back_up
                     APO:Kode_brg = APD:Kode_brg
                     GET(APOBKONT,APO:by_kode_ktr)
                     IF ERRORCODE() then
                        APD:Total = GL_beaR + |
                               (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+(GL_nt_kls2 / 100 ))) * APD:Jumlah)
                     ELSE
                        APD:Total = GL_beaR + |
                               (( GSTO:Harga_Dasar * (1+(GL_PPN/100)) * (1+ (APO:PERS_TAMBAH / 100 ))) * APD:Jumlah)
                     end
                  END
               END
            end
            !Awal Perbaikan Tgl 10/10/2005 Obat Onkologi
            if GBAR:Kelompok=20 then
               GSGD:Kode_brg=APD:Kode_brg
               access:gstockgdg.fetch(GSGD:KeyKodeBrg)
               APD:Total = GL_beaR + ((GSTO:Harga_Dasar*(1-GSGD:Discount/100))*(1+GL_PPN/100)) * APD:Jumlah
            end
            !Akhir Perbaikan Tgl 10/10/2005 Obat Onkologi
      
            !Awal Perbaikan Tgl 20/10/2005 Obat Askes
            if sub(clip(APD:Kode_brg),1,3)='3.3' then
               IF sub(clip(APD:Kode_brg),1,8)='3.3.EMBA'
                  !Resep Jadi
                  GSGD:Kode_brg=APD:Kode_brg
                  access:gstockgdg.fetch(GSGD:KeyKodeBrg)
                  APD:Total = GSTO:Harga_Dasar * APD:Jumlah
               else
                  !Resep Jadi
                  GSGD:Kode_brg=APD:Kode_brg
                  access:gstockgdg.fetch(GSGD:KeyKodeBrg)
                  vl_hna=(GSTO:Harga_Dasar*(1-GSGD:Discount/100))*1.1
                  if vl_hna<50000 then
                     APD:Total = GL_beaR + vl_hna * APD:Jumlah * 1.2
                  elsif vl_hna<100000 then
                     APD:Total = GL_beaR + vl_hna * APD:Jumlah * 1.15
                  else
                     APD:Total = GL_beaR + vl_hna * APD:Jumlah * 1.1
                  end
                  display
               end
            end
            IF sub(clip(APD:Kode_brg),1,8)='3.1.EMBA'
              !Resep Jadi
              GSGD:Kode_brg=APD:Kode_brg
              access:gstockgdg.fetch(GSGD:KeyKodeBrg)
              APD:Total = GSTO:Harga_Dasar * APD:Jumlah
            end
            display
      
            !Akhir Perbaikan Tgl 20/10/2005 Obat Askes
      
            APD:Harga_Dasar = GSTO:Harga_Dasar
            vl_diskon_pct=(APD:Diskon*100)/APD:Total
            vl_total     =APD:Total-APD:Diskon
            display
            !SELESAI HITUNG HARGA
         else
            APD:Jumlah       = 0
            APD:Total        = 0
            APD:Harga_Dasar  = 0
            display
         end
         access:apdtrans.insert()
         else
            APD:Jumlah       = 0
            APD:Total        = 0
            APD:Harga_Dasar  = 0
            access:apdtrans.insert()
            display
         end
      end
      
      
      brw4.resetsort(1)
      display
      end
      
    OF ?APH:Kontrak
      if vl_sudah=0
         JKon:KODE_KTR=APH:Kontrak
         access:jkontrak.fetch(JKon:KeyKodeKtr)
         if APH:NoNota<>'' and APH:Kontrak<>'' then
            ?insert:5{prop:disable}=false
         else
            ?insert:5{prop:disable}=true
         end
         display
      end
    OF ?Button11
      ThisWindow.Update
      if vl_sudah=0
         globalrequest=selectrecord
         selectjkontrak
         APH:Kontrak=JKon:KODE_KTR
         if APH:NoNota<>'' and APH:Kontrak<>'' then
            ?insert:5{prop:disable}=false
         else
            ?insert:5{prop:disable}=true
         end
         display
         if status=3 then
         !and APH:Kontraktor<>'' then
            enable(?ok)
         else
            disable(?ok)
         end
      end
      display
    OF ?APH:dokter
      IF APH:dokter OR ?APH:dokter{Prop:Req}
        JDok:Kode_Dokter = APH:dokter
        IF Access:JDokter.TryFetch(JDok:KeyKodeDokter)
          IF SELF.Run(2,SelectRecord) = RequestCompleted
            APH:dokter = JDok:Kode_Dokter
          ELSE
            SELECT(?APH:dokter)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?Button20
      ThisWindow.Update
      JDok:Kode_Dokter = APH:dokter
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        APH:dokter = JDok:Kode_Dokter
      END
      ThisWindow.Reset(1)
    OF ?Button12
      ThisWindow.Update
      if vl_sudah=0
         globalrequest=selectrecord
         selectjtransaksi
         if JTra:Kontraktor<>'' then
            JKon:KODE_KTR=JTra:Kontraktor
            access:jkontrak.fetch(JKon:KeyKodeKtr)
            JPas:Nomor_mr=JTra:Nomor_Mr
            access:jpasien.fetch(JPas:KeyNomorMr)
            APH:dokter=JTra:Kode_dokter
            access:jdokter.fetch(JDok:KeyKodeDokter)
            APH:NoNota=JTra:No_Nota
            APH:Nomor_mr=JTra:Nomor_Mr
            APH:NIP      =JTra:NIP
            APH:Kontrak =JTra:Kontraktor
            if APH:Kontrak<>'' then
               APH:NoNota  =JTra:No_Nota
            else
               APH:NoNota  =''
            end
            display
            APH:LamaBaru =JTra:LamaBaru
            APH:cara_bayar=JTra:Kode_Transaksi
         else
            JKon:KODE_KTR =''
            access:jkontrak.fetch(JKon:KeyKodeKtr)
            APH:Asal      =''
            APH:NIP       =''
            APH:Kontrak   =''
            APH:NoNota    =''
            APH:LamaBaru  =JTra:LamaBaru
            APH:cara_bayar=JTra:Kode_Transaksi
            APH:dokter    =JTra:Kode_dokter
            access:jdokter.fetch(JDok:KeyKodeDokter)
            APH:NoNota    =JTra:No_Nota
            display
         end
         status=JTra:Kode_Transaksi
         if status=0 then
            status=2
         end
         ?BROWSE:4{PROP:DISABLE}=0
         ?Insert:5{PROP:DISABLE}=0
         glo::campur=0
         APH:Asal=JTra:Kode_poli
         display
      end
    OF ?Insert:5
      ThisWindow.Update
      if vl_sudah=0
      disable(?loc:nomor)
      disable(?calllookup:3)
      disable(?APH:Kontrak)
      disable(?Button11)
      disable(?Button20)
      disable(?JTra:NamaJawab)
      disable(?JTra:AlamatJawab)
      display
      end
    OF ?calllookup:3
      ThisWindow.Update
      if vl_sudah=0
      glo:mr=APH:Nomor_mr
      display
      globalrequest=selectrecord
      if GLO:LEVEL>1 then
      SelectJTransaksiMR()
      else
      SelectJTransaksiMRPengatur()
      end
      end
      if vl_sudah=0
         !if JTra:Kontraktor='' then
         !   message('Bukan pasien kontraktor !!!')
         !   aph:nonota=''
         !else
            APH:NoNota=JTra:No_Nota
            loc:nomor=JTra:No_Nota
            APH:dokter=JTra:Kode_dokter
            status=JTra:Kode_Transaksi
            display
            !message(APH:NoNota&' '&JTra:No_Nota)
            JKon:KODE_KTR=JTra:Kontraktor
            access:jkontrak.fetch(JKon:KeyKodeKtr)
            APH:Kontrak=JTra:Kontraktor
            APH:Asal=JTra:Kode_poli
            if JTra:No_Nota<>'' then
            enable(?Insert:5)
            enable(?Browse:4)
            end
         !end
         !f APH:NoNota<>'' and APH:Kontrak<>'' then
         !  ?insert:5{prop:disable}=false
         !lse
         !  ?insert:5{prop:disable}=true
         !nd
         display
      end
      
    OF ?OK
      ThisWindow.Update
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?Button9
      ThisWindow.Update
      if vl_sudah=0
         IF LOC::TOTAL <> 0
             !vl_round = round(APH:Biaya)
             !Pembulatan
             vl_hasil=0
             vl_real=APH:Biaya
             vl_seribu=round(APH:Biaya,1000)
             !message(vl_seribu)
             if vl_seribu<vl_real then
                vl_selisih=vl_real-vl_seribu
                !message(vl_selisih)
                if vl_selisih>100 then
                   vl_selisih=500
                   vl_hasil=vl_seribu+vl_selisih
                else
                   vl_hasil=vl_seribu
                end
             else
                vl_selisih=vl_seribu-vl_real
                !message(vl_selisih)
                if vl_selisih>400 then
                   vl_hasil=vl_seribu-500
                else
                   vl_hasil=vl_seribu
                end
             end
             !selesai
             !APH:Biaya = ROUND( ((APH:Biaya /100) + 0.4999) , 1 ) *100
             APH:Biaya = vl_hasil
             IF discount <>0
                 loc::copy_total = APH:Biaya + discount
                 masuk_disc = 1
                 ?discount{PROP:READONLY}=FALSE
             ELSE
                 loc::copy_total = APH:Biaya
             END
             SET( BRW4::View:Browse)
                 LOOP
                     NEXT(BRW4::View:Browse)
                     IF APD:Camp = 0 AND APD:N0_tran = APH:N0_tran
                         APD:Total = APD:Total + loc::copy_total - LOC::TOTAL
                         PUT(APDTRANS)
                         BREAK
                     END
                     IF ERRORCODE() > 0  OR  APD:N0_tran <> APH:N0_tran
                         SET( BRW4::View:Browse)
                         LOOP
                             NEXT( BRW4::View:Browse )
                             IF APD:Kode_brg = '_Campur'
                                 APD:Total = APD:Total + loc::copy_total - LOC::TOTAL
                                 PUT(APDTRANS)
                                 SET(APDTcam)
                                 APD1:N0_tran = APH:N0_tran
                                 APD1:Camp = APD:Camp
                                 SET (APD1:by_tranno,APD1:by_tranno)
                                 LOOP
                                     NEXT( APDTcam )
                                     IF APD1:Kode_brg = '_Biaya'
                                         APD1:Total = APD1:Total  + loc::copy_total - LOC::TOTAL
                                         PUT(APDTcam)
                                         BREAK
                                     END
                                 END
      
                                 BREAK
                             END
                         END
                         BREAK
                     END
                     
                 END
                 LOC::TOTAL = loc::copy_total
             DISPLAY
             BRW4.RESETSORT(1)
            
         END
      end
    OF ?discount
      ThisWindow.Reset(1)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
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
  ReturnValue = PARENT.TakeSelected()
    CASE FIELD()
    OF ?APH:Asal
      JPol:POLIKLINIK = APH:Asal
      IF Access:JPoli.TryFetch(JPol:BY_POLI)
        IF SELF.Run(1,SelectRecord) = RequestCompleted
          APH:Asal = JPol:POLIKLINIK
        END
      END
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
    OF EVENT:AlertKey
      select(?cancel)
      presskey( 13)
    OF EVENT:CloseWindow
      IF SELF.RESPONSE = 1 THEN
         !PrintTransRawatJalan
      END
    OF EVENT:Timer
      if vl_sudah=0
         IF LOC::TOTAL = 0
             ?OK{PROP:DISABLE}=1
         ELSE
             ?OK{PROP:DISABLE}=0
         END
      end
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APH:Biaya = (LOC::TOTAL - discount)


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


BRW4.ResetFromAsk PROCEDURE(*BYTE Request,*BYTE Response)

  CODE
  PARENT.ResetFromAsk(Request,Response)
  brw4.resetsort(1)
  !
  !set(BRW4::View:Browse)
  !next(BRW4::View:Browse)
  !if not(errorcode()) then
  !   ?Button10{PROP:DISABLE}=true
  !   ?Button11{PROP:DISABLE}=true
  !   ?APH:Kontrak{PROP:DISABLE}=TRUE
  !   ?APH:NoNota{PROP:DISABLE}=true
  !   ?CallLookup:3{PROP:DISABLE}=true
  !else
  !   if status=3 then
  !      ?Button11{PROP:DISABLE}=false
  !      ?Button10{PROP:DISABLE}=true
  !      ?APH:Kontrak{PROP:DISABLE}=false
  !      ?APH:NoNota{PROP:DISABLE}=false
  !      ?CallLookup:3{PROP:DISABLE}=false
  !   elsif status=1 then
  !      ?Button11{PROP:DISABLE}=true
  !      ?Button10{PROP:DISABLE}=false
  !      ?APH:Kontrak{PROP:DISABLE}=TRUE
  !      ?APH:NoNota{PROP:DISABLE}=true
  !      ?CallLookup:3{PROP:DISABLE}=true
  !   else
  !      ?Button10{PROP:DISABLE}=true
  !      ?Button11{PROP:DISABLE}=true
  !      ?APH:Kontrak{PROP:DISABLE}=TRUE
  !      ?APH:NoNota{PROP:DISABLE}=true
  !      ?CallLookup:3{PROP:DISABLE}=true
  !   end
  !end
  !
  disable(?status)


BRW4.ResetFromView PROCEDURE

LOC::TOTAL:Sum       REAL                                  ! Sum variable for browse totals
discount:Sum         REAL                                  ! Sum variable for browse totals
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
    LOC::TOTAL:Sum += APD:Total
    discount:Sum += APD:Diskon
  END
  LOC::TOTAL = LOC::TOTAL:Sum
  discount = discount:Sum
  PARENT.ResetFromView
  Relate:APDTRANS.SetQuickScan(0)
  SETCURSOR()


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

