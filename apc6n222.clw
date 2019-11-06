

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N222.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N064.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N147.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N148.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N223.INC'),ONCE        !Req'd for module callout resolution
                     END


Trig_BrowseReturRanapNewPerMRNonBilling PROCEDURE          ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
Lunas                STRING(5)                             !
Poliklinik           STRING(1)                             !
loc::no_mr           LONG                                  !
loc::thread          BYTE                                  !
BRW1::View:Browse    VIEW(APHTRANS)
                       PROJECT(APH:N0_tran)
                       PROJECT(APH:Tanggal)
                       PROJECT(APH:Biaya)
                       PROJECT(APH:User)
                       PROJECT(APH:cara_bayar)
                       PROJECT(APH:Kontrak)
                       PROJECT(APH:shift)
                       PROJECT(APH:biaya_dtg)
                       PROJECT(APH:NoTransaksiAsal)
                       PROJECT(APH:Kode_Apotik)
                       PROJECT(APH:Nomor_mr)
                       JOIN(JKon:KeyKodeKtr,APH:Kontrak)
                         PROJECT(JKon:NAMA_KTR)
                         PROJECT(JKon:KODE_KTR)
                       END
                       JOIN(JPas:KeyNomorMr,APH:Nomor_mr)
                         PROJECT(JPas:Nama)
                         PROJECT(JPas:Nomor_mr)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APH:N0_tran            LIKE(APH:N0_tran)              !List box control field - type derived from field
APH:Tanggal            LIKE(APH:Tanggal)              !List box control field - type derived from field
APH:Biaya              LIKE(APH:Biaya)                !List box control field - type derived from field
JPas:Nama              LIKE(JPas:Nama)                !List box control field - type derived from field
JKon:NAMA_KTR          LIKE(JKon:NAMA_KTR)            !List box control field - type derived from field
Lunas                  LIKE(Lunas)                    !List box control field - type derived from local data
APH:User               LIKE(APH:User)                 !List box control field - type derived from field
APH:cara_bayar         LIKE(APH:cara_bayar)           !List box control field - type derived from field
APH:Kontrak            LIKE(APH:Kontrak)              !List box control field - type derived from field
APH:shift              LIKE(APH:shift)                !List box control field - type derived from field
APH:biaya_dtg          LIKE(APH:biaya_dtg)            !List box control field - type derived from field
APH:NoTransaksiAsal    LIKE(APH:NoTransaksiAsal)      !List box control field - type derived from field
APH:Kode_Apotik        LIKE(APH:Kode_Apotik)          !List box control field - type derived from field
GL_entryapotik         LIKE(GL_entryapotik)           !Browse hot field - type derived from global data
JKon:KODE_KTR          LIKE(JKon:KODE_KTR)            !Related join file key field - type derived from field
JPas:Nomor_mr          LIKE(JPas:Nomor_mr)            !Related join file key field - type derived from field
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
                       PROJECT(APD:total_dtg)
                       PROJECT(APD:ktt)
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
APD:total_dtg          LIKE(APD:total_dtg)            !List box control field - type derived from field
APD:ktt                LIKE(APD:ktt)                  !List box control field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Pengembalian Obat Rawat Inap'),AT(,,527,277),FONT('Times New Roman',8,COLOR:Black,),IMM,HLP('Tran_Poliklinik'),SYSTEM,GRAY,RESIZE,MDI
                       LIST,AT(5,20,518,122),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('64L|M~No. Transaksi~C@s15@58R(1)|M~Tanggal~C(0)@D8@64R(1)|M~Biaya~C(0)@n-15.2@14' &|
   '0R(1)|M~Nama Pasien~C(0)@s35@67R(1)|M~Kontraktor~C(0)@s50@32L|M~Lunas~@s5@16L|M~' &|
   'User~@s4@4L|M~cara bayar~@n1@40L|M~Kontrak~@s10@24L|M~shift~@n6@64D|M~biaya dtg~' &|
   'L@N-16.2@60D|M~No Transaksi Asal~L@s15@20D|M~Kode Apotik~L@s5@'),FROM(Queue:Browse:1)
                       LIST,AT(5,180,518,68),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('52L|FM~Kode Barang~C@s10@121L|FM~Nama Obat~C@s40@87L|FM~Keterangan~C@s50@53R(2)|' &|
   'M~Jumlah~C(0)@n-12.2@63R(2)|M~Total~C(0)@n-15.2@60R(2)|M~Diskon~C(0)@n-15.2@60L|' &|
   'M~Camp~C@n2@60L|M~N 0 tran~C@s15@64D|M~total dtg~C@N-16.2@12D|M~ktt~C@n3@'),FROM(Queue:Browse)
                       BUTTON('T&ransaksi (F4)'),AT(367,146,72,26),USE(?Insert:3),LEFT,FONT('Times New Roman',8,COLOR:Lime,FONT:bold),MSG('Transaksi Pengembalian Obat'),TIP('Transaksi Pengembalian Obat'),KEY(F4Key),ICON(ICON:Open)
                       BUTTON('&Select'),AT(279,1,45,14),USE(?Select:2),HIDE
                       BUTTON('&Change'),AT(229,1,45,14),USE(?Change:3),DISABLE,HIDE,DEFAULT
                       BUTTON('&Delete'),AT(179,1,45,14),USE(?Delete:3),DISABLE,HIDE
                       SHEET,AT(4,4,522,172),USE(?CurrentTab)
                         TAB('No. Nota'),USE(?Tab:3)
                           BUTTON('Cetak &Detail'),AT(12,146,61,26),USE(?Print),LEFT,FONT('Times New Roman',8,COLOR:Yellow,FONT:bold),MSG('Cetak SBBM'),TIP('Cetak SBBM'),ICON(ICON:Print)
                           BUTTON('Cetak &Nota'),AT(83,146,61,26),USE(?Print:2),LEFT,FONT('Times New Roman',8,COLOR:Blue,FONT:bold),MSG('Cetak Nota Transaksi'),TIP('Mencetak Nota Transaksi'),ICON(ICON:Print1)
                         END
                       END
                       BUTTON('&Tutup'),AT(357,254,87,20),USE(?Close),LEFT,FONT('Times New Roman',10,COLOR:Teal,FONT:bold+FONT:italic),ICON(ICON:Cross)
                       BUTTON('Help'),AT(329,1,45,14),USE(?Help),HIDE,STD(STD:Help)
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
ResetFromAsk           PROCEDURE(*BYTE Request,*BYTE Response),DERIVED ! Method added to host embed code
SetQueueRecord         PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
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
  GlobalErrors.SetProcedureName('Trig_BrowseReturRanapNewPerMRNonBilling')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo:mrfilter',glo:mrfilter)                        ! Added by: BrowseBox(ABC)
  BIND('glo:tglfilter',glo:tglfilter)                      ! Added by: BrowseBox(ABC)
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  BIND('Lunas',Lunas)                                      ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:APDTRANS.Open                                     ! File JDDBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:JDBILLING.Open                                    ! File JDDBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:JDDBILLING.Open                                   ! File JDDBILLING used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JTransaksi.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:APHTRANS,SELF) ! Initialize the browse manager
  BRW6.Init(?List,Queue:Browse.ViewPosition,BRW6::View:Browse,Queue:Browse,Relate:APDTRANS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon APH:N0_tran for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,APH:by_transaksi) ! Add the sort order for APH:by_transaksi for sort order 1
  BRW1.SetFilter('(APH:nomor_mr=glo:mrfilter and aph:tanggal>=glo:tglfilter and sub(APH:N0_tran,1,3)=''APO'' and APH:Ra_jal=0 and APH:Kode_Apotik=GL_entryapotik)') ! Apply filter expression to browse
  BRW1.AddField(APH:N0_tran,BRW1.Q.APH:N0_tran)            ! Field APH:N0_tran is a hot field or requires assignment from browse
  BRW1.AddField(APH:Tanggal,BRW1.Q.APH:Tanggal)            ! Field APH:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(APH:Biaya,BRW1.Q.APH:Biaya)                ! Field APH:Biaya is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nama,BRW1.Q.JPas:Nama)                ! Field JPas:Nama is a hot field or requires assignment from browse
  BRW1.AddField(JKon:NAMA_KTR,BRW1.Q.JKon:NAMA_KTR)        ! Field JKon:NAMA_KTR is a hot field or requires assignment from browse
  BRW1.AddField(Lunas,BRW1.Q.Lunas)                        ! Field Lunas is a hot field or requires assignment from browse
  BRW1.AddField(APH:User,BRW1.Q.APH:User)                  ! Field APH:User is a hot field or requires assignment from browse
  BRW1.AddField(APH:cara_bayar,BRW1.Q.APH:cara_bayar)      ! Field APH:cara_bayar is a hot field or requires assignment from browse
  BRW1.AddField(APH:Kontrak,BRW1.Q.APH:Kontrak)            ! Field APH:Kontrak is a hot field or requires assignment from browse
  BRW1.AddField(APH:shift,BRW1.Q.APH:shift)                ! Field APH:shift is a hot field or requires assignment from browse
  BRW1.AddField(APH:biaya_dtg,BRW1.Q.APH:biaya_dtg)        ! Field APH:biaya_dtg is a hot field or requires assignment from browse
  BRW1.AddField(APH:NoTransaksiAsal,BRW1.Q.APH:NoTransaksiAsal) ! Field APH:NoTransaksiAsal is a hot field or requires assignment from browse
  BRW1.AddField(APH:Kode_Apotik,BRW1.Q.APH:Kode_Apotik)    ! Field APH:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GL_entryapotik,BRW1.Q.GL_entryapotik)      ! Field GL_entryapotik is a hot field or requires assignment from browse
  BRW1.AddField(JKon:KODE_KTR,BRW1.Q.JKon:KODE_KTR)        ! Field JKon:KODE_KTR is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nomor_mr,BRW1.Q.JPas:Nomor_mr)        ! Field JPas:Nomor_mr is a hot field or requires assignment from browse
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
  BRW6.AddField(APD:total_dtg,BRW6.Q.APD:total_dtg)        ! Field APD:total_dtg is a hot field or requires assignment from browse
  BRW6.AddField(APD:ktt,BRW6.Q.APD:ktt)                    ! Field APD:ktt is a hot field or requires assignment from browse
  BRW6.AddField(GBAR:Kode_brg,BRW6.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_BrowseReturRanapNewPerMRNonBilling',QuickWindow) ! Restore window settings from non-volatile store
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
    Relate:JDBILLING.Close
    Relate:JDDBILLING.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_BrowseReturRanapNewPerMRNonBilling',QuickWindow) ! Save window data to non-volatile store
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
      Trig_UpdateReturRanapNewNonBilling
      PrintReturRawatJalan1
      Cetak_nota_apotik121
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
      if APH:Biaya<0 or APH:NoTransaksiAsal<>'' then
         message('Transaksi Retur, tidak bisa diretur !')
         cycle
      end
      
      Glo::no_mr      =APH:Nomor_mr
      glo::no_nota    =APH:N0_tran
      vg_kontraktor   =APH:Kontrak
      glo::campur     =APH:cara_bayar
      !message(Glo::no_mr)
      display
    OF ?Close
      APklutmp{PROP:SQL}='DELETE FROM "DBA"."Apklutmp" WHERE N0_TRAN ='''&glo::no_nota&''''
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
  !   if GL_entryapotik='FM04' or GL_entryapotik='FM09' then
  !      JDB:KODE_BAGIAN      ='FARMASI'
  !   else
  !      JDB:KODE_BAGIAN      ='FARPD'
  !   end
  !   JDB:STATUS_TUTUP     =0
  !   JDB:StatusBatal      =0
  !   JDB:JUMLAH_BYR       =0
  !   JDB:SISA_BYR         =0
  !   JDB:NO_PEMBAYARAN    =''
  !   JDB:DISCOUNT         =0
  !   JDB:BYRSELISIH       =0
  !   JDB:VALIDASI         =0
  !   if APH:cara_bayar<>3 then
  !      JDB:Validasi=1
  !      JDB:UsrValidasi=Glo:User_id
  !      JDB:JmValidasi=clock()
  !      JDB:TglValidasi=JTra:Tanggal
  !   end
  !
  !   !JDB:TglValidasi      =today()
  !   !JDB:JmValidasi       =clock()
  !   JDB:KoreksiTarif     =0
  !   JDB:JenisPembayaran  =APH:cara_bayar
  !   JDB:ValidasiProduksi =1
  !   access:jdbilling.insert()
  !   JDDB:NOMOR           =APH:NoNota
  !   JDDB:NOTRAN_INTERNAL =APH:N0_tran
  !   JDDB:KODEJASA        ='FAR.00001.00.00'
  !   JDDB:SUBKODEJASA     ='FAR.00001.04.00'
  !   JDDB:KETERANGAN      =''
  !   JDDB:JUMLAH          =1
  !   JDDB:TOTALBIAYA      =APH:Biaya
  !   access:jddbilling.insert()
  
  
     glo::no_nota=APH:N0_tran
     PrintReturRawatJalan
     display
  end


BRW1.SetQueueRecord PROCEDURE

  CODE
  if APH:Bayar = 1 then
     Lunas = 'sudah'
  else
     Lunas = 'belum'
  end
  if APH:Ra_jal = 1 then
     Poliklinik = 'Y'
  else
     Poliklinik = 'N'
  end
  PARENT.SetQueueRecord
  


BRW6.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

