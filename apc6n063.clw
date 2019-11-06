

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N063.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N064.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N148.INC'),ONCE        !Req'd for module callout resolution
                     END


Cari_nota_rd PROCEDURE                                     ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
loc::no_rm           LONG                                  !Nomor rekam medik
BRW1::View:Browse    VIEW(APHTRANS)
                       PROJECT(APH:Nomor_mr)
                       PROJECT(APH:N0_tran)
                       PROJECT(APH:Tanggal)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APH:Nomor_mr           LIKE(APH:Nomor_mr)             !List box control field - type derived from field
APH:N0_tran            LIKE(APH:N0_tran)              !List box control field - type derived from field
APH:Tanggal            LIKE(APH:Tanggal)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Melihat Data Nomor Transaksi'),AT(,,358,170),FONT('Times New Roman',8,,),CENTER,IMM,HLP('Cari_nota_rd'),SYSTEM,GRAY,RESIZE,MDI
                       LIST,AT(8,20,342,108),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('80R(2)|M~Nomor RM~C(0)@N010_@64L(2)|M~No. Transaksi~@s15@80R(2)|M~Tanggal~C(0)@D' &|
   '8@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(305,166,45,14),USE(?Select:2),HIDE
                       SHEET,AT(4,4,350,162),USE(?CurrentTab)
                         TAB('No. Rekam Medik (F2)'),USE(?Tab:2),KEY(F2Key)
                           PROMPT('Nomor RM :'),AT(188,138),USE(?loc::no_rm:Prompt),FONT('Times New Roman',12,COLOR:Black,)
                           ENTRY(@n10B),AT(258,138,78,16),USE(loc::no_rm),RIGHT(1),FONT('Times New Roman',12,,)
                         END
                         TAB('No. Transaksi (F3)'),USE(?Tab:3),KEY(F3Key)
                           PROMPT('N0 tran:'),AT(16,139),USE(?APH:N0_tran:Prompt)
                           ENTRY(@s15),AT(66,136,78,16),USE(APH:N0_tran),MSG('nomor transaksi'),TIP('nomor transaksi')
                         END
                       END
                       BUTTON('Close'),AT(169,0,45,14),USE(?Close),HIDE
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
BRW1::Sort0:StepClass StepLongClass                        ! Default Step Manager
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
  GlobalErrors.SetProcedureName('Cari_nota_rd')
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
  Relate:APHTRANS.SetOpenRelated()
  Relate:APHTRANS.Open                                     ! File JPasien used by this procedure, so make sure it's RelationManager is open
  Access:GApotik.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:APHTRANS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon APH:N0_tran for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,APH:by_transaksi) ! Add the sort order for APH:by_transaksi for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?APH:N0_tran,APH:N0_tran,,BRW1) ! Initialize the browse locator using ?APH:N0_tran using key: APH:by_transaksi , APH:N0_tran
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon APH:Nomor_mr for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,APH:by_medrec)   ! Add the sort order for APH:by_medrec for sort order 2
  BRW1.AddRange(APH:Nomor_mr,loc::no_rm)                   ! Add single value range limit for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?loc::no_rm,APH:Nomor_mr,1,BRW1) ! Initialize the browse locator using ?loc::no_rm using key: APH:by_medrec , APH:Nomor_mr
  BRW1.AddField(APH:Nomor_mr,BRW1.Q.APH:Nomor_mr)          ! Field APH:Nomor_mr is a hot field or requires assignment from browse
  BRW1.AddField(APH:N0_tran,BRW1.Q.APH:N0_tran)            ! Field APH:N0_tran is a hot field or requires assignment from browse
  BRW1.AddField(APH:Tanggal,BRW1.Q.APH:Tanggal)            ! Field APH:Tanggal is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Cari_nota_rd',QuickWindow)                 ! Restore window settings from non-volatile store
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
    Relate:APHTRANS.Close
  END
  IF SELF.Opened
    INIMgr.Update('Cari_nota_rd',QuickWindow)              ! Save window data to non-volatile store
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

Trig_WindowReturRawatJalan PROCEDURE                       ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
loc::thread          BYTE                                  !
loc::pers_disc       BYTE                                  !
loc::status          STRING(10)                            !
loc::err             BYTE                                  !Lokal error pesan
loc::message         BYTE                                  !Nomor message error
loc::nama            STRING(35)                            !Nama Pasien
loc::alamat          STRING(35)                            !Alamat Pasien
loc::rt              ULONG                                 !RT Pasien
loc::rw              ULONG                                 !RW Pasien
loc::kota            STRING(20)                            !Kota asal pasien
window               WINDOW('Pengembalian obat-obatan Rawat Jalan'),AT(,,287,158),ICON('Vcrprior.ico'),GRAY,MDI,IMM
                       PANEL,AT(15,8,203,47),USE(?Panel1)
                       STRING('Data Pasien Rawat Jalan'),AT(67,10,91,11),USE(?String1),FONT('Comic Sans MS',,COLOR:Purple,FONT:italic)
                       LINE,AT(16,24,200,0),USE(?Line1),COLOR(040FF00H),LINEWIDTH(2)
                       PROMPT('No. Transaksi :'),AT(16,32),USE(?glo::no_nota:Prompt),FONT('Arial Black',12,COLOR:Black,)
                       ENTRY(@s15),AT(84,32,86,14),USE(glo::no_nota),FONT('Arial Black',12,COLOR:Black,)
                       BUTTON('&L'),AT(172,32,16,14),USE(?Button4),HIDE,FONT('Times New Roman',,,)
                       BUTTON('&D'),AT(192,32,16,14),USE(?Button5),HIDE
                       GROUP('Resume Pasien'),AT(15,60,256,83),USE(?Group1),BOXED,FONT('Lucida Handwriting',12,0800040H,)
                         STRING(@s35),AT(107,79),USE(loc::nama),FONT('Times New Roman',,COLOR:Black,)
                         PROMPT('Nama :'),AT(53,77),USE(?Prompt2),FONT('Arial Black',,COLOR:Purple,)
                         PROMPT('Alamat :'),AT(53,93),USE(?Prompt3),FONT('Times New Roman',,COLOR:Black,)
                         STRING(@s35),AT(107,93),USE(loc::alamat),FONT('Times New Roman',,COLOR:Black,)
                         STRING(@n3),AT(150,107),USE(loc::rt),FONT('Times New Roman',,COLOR:Black,)
                         STRING(@n3),AT(185,107),USE(loc::rw),FONT('Times New Roman',,COLOR:Black,)
                         PROMPT('Kota : '),AT(53,121),USE(?Prompt5),FONT('Times New Roman',,COLOR:Black,)
                         STRING(@s20),AT(107,121),USE(loc::kota),FONT('Times New Roman',,COLOR:Black,)
                         STRING('/'),AT(174,107),USE(?String6),FONT('Times New Roman',,COLOR:Black,FONT:bold)
                         PROMPT('RT / RW  :'),AT(107,107),USE(?Prompt4),FONT('Times New Roman',,COLOR:Black,)
                       END
                       BUTTON('OK'),AT(226,8,46,18),USE(?OkButton),LEFT,ICON('Check1.ico'),DEFAULT
                       BUTTON('&Batal'),AT(226,37,46,18),USE(?CancelButton),LEFT,ICON(ICON:Cross)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
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

ThisWindow.Ask PROCEDURE

  CODE
  ?OKButton{PROP:DISABLE}=TRUE
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_WindowReturRawatJalan')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Panel1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  loc::thread=glo::mainthreadno
  POST(EVENT:Disable_ReturRJalan,,loc::thread)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  glo::no_nota = ''
  Relate:APDTRANS.Open                                     ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:APpotkem.Open                                     ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:Apklutmp.Open                                     ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Relate:JHBILLING.Open                                    ! File JHBILLING used by this procedure, so make sure it's RelationManager is open
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ApReLuar.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Trig_WindowReturRawatJalan',window)        ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:APpotkem.Close
    Relate:Apklutmp.Close
    Relate:JHBILLING.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_WindowReturRawatJalan',window)     ! Save window data to non-volatile store
  END
  POST(EVENT:Enable_ReturRJalan,,loc::thread)
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
    OF ?glo::no_nota
      Glo:lap = '0'
      loc::err = 0
      loc::message=0
      APH:N0_tran = glo::no_nota
      GET(APHTRANS,APH:by_transaksi)
      IF ERRORCODE()
         loc::err = 1
         loc::message = 1
      ELSE
         glo:nota_retur=clip(APH:NoNota)
         JHB:NOMOR=clip(APH:NoNota)
         if access:jhbilling.fetch(JHB:KNOMOR)=level:benign
              if JHB:TUTUP<>1 then
                  gl:nik          =APH:NIP
                  gl:kontrak      =APH:Kontrak
                  gl:nota         =APH:NoNota
                  gl:cara_bayar   =APH:cara_bayar
                  Glo::no_mr = APH:Nomor_mr
                  IF APH:Nomor_mr = 9999999999 or APH:Nomor_mr = 0
                      APR:N0_tran = glo::no_nota
                      GET(ApReLuar,APR:by_transaksi)
                      IF ERRORCODE()
                          loc::err = 1
                          loc::message = 5
                      ELSE
                          Glo:lap = '1'   !--Untuk ambil data dari apreluar--
                      END
                  ELSE
                      JPas:Nomor_mr = APH:Nomor_mr
                      GET(JPasien,JPas:KeyNomorMr)
                      IF ERRORCODE()
                          loc::err = 1
                          loc::message = 5
                      ELSE
                          Glo:lap= '2' !---untuk ambil data dari jPasien----
                      END
                  END
              
                  IF loc::err = 0
                      !APKL:N0_tran = glo::no_nota
                      !GET(Apklutmp,APKL:key_nota)
                      !IF NOT ERRORCODE()
                      !    loc::err = 1
                      !    loc::message = 2
                      !ELSE
                      !---- masukkan data ke apklutmp dari apdtrans---
      
                          !APH:N0_tran = glo::no_nota
                          !GET(APHTRANS,APH:by_transaksi)
                          !IF ERRORCODE()
                          !    loc::err = 1
                          !    loc::message = 3
                          !ELSE
                               !IF APH:Bayar = 0
                                  !!loc::err = 1
                                  !!loc::message = 4
                               !ELSE
                                   !loc::pers_disc = 0
      
                                   !apdtrans{prop:sql}='select * from dba.apdtrans where n0_tran='''&APH:N0_tran&''' and camp=0'
                                   !LOOP
                                   !    IF Access:APDTRANS.Next()<>level:benign then break.
                                   !        IF APD:Kode_brg = '_Disc'
                                   !            loc::pers_disc = APD:Total / (APD:Total+APH:Biaya)
                                   !            BREAK
                                   !END
                               !END
      
                               !apdtrans{prop:sql}='select * from dba.apdtrans where n0_tran='''&APH:N0_tran&''' and camp=0'
                               !LOOP
                                  !IF Access:APDTRANS.Next()<>level:benign then break.
                                  !IF APD:Jumlah <> 0 AND APD:Kode_brg <> '_Campur' AND APD:Kode_brg <> '_Disc'
                                      !APKL:N0_tran = glo::no_nota
                                      !APKL:Kode_brg = APD:Kode_brg
                                      !GET(APklutmp,APKL:key_nota_brg)
                                      !IF ERRORCODE()
                                          !APKL:N0_tran   = glo::no_nota
                                          !APKL:Kode_brg  = APD:Kode_brg
                                          !APKL:Jumlah    = APD:Jumlah
                                          !APKL:Harga_Dasar = ( 1-loc::pers_disc ) * APD:Total / APD:Jumlah
                                          !APKL:Harga_Dasar_benar = APD:Harga_Dasar
                                          !Access:APklutmp.Insert()
                                      !ELSE
                                          !APKL:Jumlah = APKL:Jumlah + APD:Jumlah
      
                                          !IF APKL:Harga_Dasar > ( 1-loc::pers_disc ) * APD:Total / APD:Jumlah
                                              !APKL:Harga_Dasar =  ( 1-loc::pers_disc ) * APD:Total / APD:Jumlah
                                          !END
                                          !IF APKL:Harga_Dasar_benar > APD:Harga_Dasar
                                              !APKL:Harga_Dasar_benar =  APD:Harga_Dasar
                                          !END
      
                                          !Access:APklutmp.Update()
                                       !END
                                       !APP1:N0_tran = glo::no_nota
                                       !APP1:Kode_brg = APD:Kode_brg
                                       !GET(APpotkem,APP1:key_nota_brg)
                                       !IF NOT ERRORCODE()
                                          !APKL:N0_tran = glo::no_nota
                                          !APKL:Kode_brg = APD:Kode_brg
                                          !GET(APklutmp,APKL:key_nota_brg)
                                          !APKL:Jumlah = APKL:Jumlah - APP1:Jumlah
                                          !Access:APklutmp.Update()
                                       !END
                                  !END
                               !END
                               ?OKButton{PROP:DISABLE}=0
                               ?glo::no_nota{PROP:DISABLE}=1
                               ?Button4{PROP:DISABLE}=1
                               ?Button5{PROP:DISABLE}=1
                          !END
                      !END
                  END
              !END
              else
                 message('Nota Sudah Ditutup !')
              end
         else
              message('Nota Tidak Ketemu !')
         end
      END
      IF loc::err = 1
         CASE loc::message
         OF 1
              MESSAGE('Nomor Transaksi tidak ditemukan')
          OF 2
              MESSAGE ('Nomor Transaksi tersebut sedang dipakai')
          OF 3
              MESSAGE('Ada kesalahan data, mohon laporkan Kepada EDP')
          OF 4
              MESSAGE('Transaksi kasir belum dilakukan, Gunakan fasilitas BATAL TRANSAKSI ')
          OF 5
              MESSAGE('Ada kesalahan data di ApReLuar, laporkan ke EDP')
          END
          ?OKButton{PROP:DISABLE}=1
          !CLEAR(glo::no_nota)
          CLEAR(loc::nama)
          CLEAR(loc::alamat)
          CLEAR(loc::rt)
          CLEAR(loc::rw)
          CLEAR(loc::kota)
          DISPLAY
          SELECT(?glo::no_nota)
      else
          select(?OKButton)
      END
      IF Glo:lap = '1'   !--Untuk ambil data dari apreluar--
          loc::nama   =  APR:Nama
          loc::alamat =  APR:Alamat
          loc::rt     =  APR:RT
          loc::rw     =  APR:RW
          loc::kota   =  APR:Kota
      ELSIF Glo:lap = '2'
          loc::nama   =  JPas:Nama
          loc::alamat =  JPas:Alamat
          loc::rt     =  JPas:RT
          loc::rw     =  JPas:RW
          loc::kota   =  JPas:Kota
      END
      APH:N0_tran = glo::no_nota
      GET(APHTRANS,APH:by_transaksi)
      IF ERRORCODE()
         message(error())
         loc::err = 1
         loc::message = 1
      END
    OF ?OkButton
      glo:nobatal=''
      display
      glo::form_insert=1
      APH:N0_tran = glo::no_nota
      GET(APHTRANS,APH:by_transaksi)
      glo::campur = APH:cara_bayar
      IF GL_entryapotik<>APH:Kode_Apotik then
          message('Apotik tidak sama dengan Apotik Transaksi ! Apotik Transaksinya = '&APH:Kode_Apotik&' !')
          cycle
      end
      !Retur_rawat_jalan
      Trig_BrowseReturRawatJalan
      CLEAR(glo::no_nota)
      CLEAR(loc::nama)
      CLEAR(loc::alamat)
      CLEAR(loc::rt)
      CLEAR(loc::rw)
      CLEAR(loc::kota)
      DISPLAY
       POST(Event:CloseWindow)
    OF ?CancelButton
      glo::form_insert=0
      !message(glo::no_nota)
      IF glo::no_nota <> ''
      !    SET(APklutmp)
      !    APKL:N0_tran = glo::no_nota
      !    SET(APKL:key_nota,APKL:key_nota)
      !    LOOP
      !        Access:APklutmp.Next()
      !        message(APKL:N0_tran&' '&glo::no_nota)
      !        if errorcode() OR (APKL:N0_tran <> glo::no_nota) then
      !        message(error())
      !        break.
      !        DELETE(APklutmp)
      !        message('bisa lho')
      !    END
          apklutmp{prop:sql}='delete dba.apklutmp where N0_tran='''&clip(glo::no_nota)&''''
      !    apklutmp{prop:sql}='delete dba.apklutmp where N0_tran='''&clip(glo::no_nota)&''''
      !    next(apklutmp)
      END
      POST(EVENT:CLOSEWINDOW)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button4
      ThisWindow.Update
      APR:N0_tran = glo::no_nota
      GlobalRequest = SelectRecord
      cari_nota_rj
      glo::no_nota = APR:N0_tran
      DISPLAY
      ThisWindow.Reset(1)
      
      
      Glo:lap = '0'
      loc::err = 0
      loc::message=0
      APH:N0_tran = glo::no_nota
      GET(APHTRANS,APH:by_transaksi)
      IF ERRORCODE()
          loc::err = 1
          loc::message = 1
      ELSE
          Glo::no_mr = APH:Nomor_mr
          IF APH:Nomor_mr = 9999999999
              APR:N0_tran = glo::no_nota
              GET(ApReLuar,APR:by_transaksi)
              IF ERRORCODE()
                  loc::err = 1
                  loc::message = 5
              ELSE
                  Glo:lap = '1'   !--Untuk ambil data dari apreluar--
              END
          ELSE
              JPas:Nomor_mr = APH:Nomor_mr
              GET(JPasien,JPas:KeyNomorMr)
              IF ERRORCODE()
                  loc::err = 1
                  loc::message = 5
              ELSE
                  Glo:lap= '2' !---untuk ambil data dari jPasien----
              END
          END
          !message(loc::err)
          IF loc::err = 0
              APKL:N0_tran = glo::no_nota
              GET(Apklutmp,APKL:key_nota)
              IF NOT ERRORCODE()
                  loc::err = 1
                  loc::message = 2
              ELSE
              !---- masukkan data ke apklutmp dari apdtrans---
      
                  APH:N0_tran = glo::no_nota
                  GET(APHTRANS,APH:by_transaksi)
                  IF ERRORCODE()
                      loc::err = 1
                      loc::message = 3
                  ELSE
                    !message(APH:Bayar)
                    IF APH:Bayar = 0
                      !loc::err = 1
                      !loc::message = 4
                    !ELSE
                      loc::pers_disc = 0
                      SET(APDTRANS)
                      APD:N0_tran = APH:N0_tran
                      SET(APD:by_transaksi,APD:by_transaksi)
                      LOOP
                          IF Access:APDTRANS.Next()  OR APD:N0_tran <> APH:N0_tran THEN BREAK.
                          IF APD:Kode_brg = '_Disc'
                             loc::pers_disc = APD:Total / (APD:Total+APH:Biaya)
                             BREAK
                          END
                      END
                      SET(APDTRANS)
                      APD:N0_tran = APH:N0_tran
                      SET(APD:by_transaksi,APD:by_transaksi)
                      LOOP
                         IF Access:APDTRANS.Next()  OR APD:N0_tran <> APH:N0_tran THEN BREAK.
                         IF APD:Jumlah <> 0 AND APD:Kode_brg <> '_Campur' AND APD:Kode_brg <> '_Disc'
                          APKL:N0_tran = glo::no_nota
                          APKL:Kode_brg = APD:Kode_brg
                          GET(APklutmp,APKL:key_nota_brg)
                          IF ERRORCODE()
                              APKL:N0_tran   = glo::no_nota
                              APKL:Kode_brg  = APD:Kode_brg
                              APKL:Jumlah    = APD:Jumlah
                              APKL:Harga_Dasar = ( 1-loc::pers_disc ) * APD:Total / APD:Jumlah
                              APKL:Harga_Dasar_benar = APD:Harga_Dasar
                              Access:APklutmp.Insert()
                          ELSE
                              APKL:Jumlah = APKL:Jumlah + APD:Jumlah
                              IF APKL:Harga_Dasar > ( 1-loc::pers_disc ) * APD:Total / APD:Jumlah
                                  APKL:Harga_Dasar =  ( 1-loc::pers_disc ) * APD:Total / APD:Jumlah
                              END
                              IF APKL:Harga_Dasar_benar > APD:Harga_Dasar
                                  APKL:Harga_Dasar_benar = APD:Harga_Dasar
                              END
                              Access:APklutmp.Update()
                          END
                          APP1:N0_tran = glo::no_nota
                          APP1:Kode_brg = APD:Kode_brg
                          GET(APpotkem,APP1:key_nota_brg)
                          IF NOT ERRORCODE()
                              APKL:N0_tran = glo::no_nota
                              APKL:Kode_brg = APD:Kode_brg
                              GET(APklutmp,APKL:key_nota_brg)
                              APKL:Jumlah = APKL:Jumlah - APP1:Jumlah
                              Access:APklutmp.Update()
                          END
                         END
                      END
                      ?OKButton{PROP:DISABLE}=0
                      ?glo::no_nota{PROP:DISABLE}=1
                      ?Button4{PROP:DISABLE}=1
                      ?Button5{PROP:DISABLE}=1
                    END
                  END
              END
          END
      END
      !message(loc::err)
      IF loc::err = 1
          CASE loc::message
          OF 1
              MESSAGE('Nomor Transaksi tidak ditemukan')
          OF 2
              MESSAGE ('Nomor Transaksi tersebut sedang dipakai')
          OF 3
              MESSAGE('Ada kesalahan data, mohon laporkan Kepada EDP')
          OF 4
              MESSAGE('Transaksi kasir belum dilakukan, Gunakan fasilitas BATAL TRANSAKSI ')
          OF 5
              MESSAGE('Ada kesalahan data di ApReLuar, laporkan ke EDP')
          END
          ?OKButton{PROP:DISABLE}=1
          CLEAR(glo::no_nota)
          CLEAR(loc::nama)
          CLEAR(loc::alamat)
          CLEAR(loc::rt)
          CLEAR(loc::rw)
          CLEAR(loc::kota)
          DISPLAY
          SELECT(?glo::no_nota)
      END
      IF Glo:lap = '1'   !--Untuk ambil data dari apreluar--
          loc::nama   =  APR:Nama
          loc::alamat =  APR:Alamat
          loc::rt     =  APR:RT
          loc::rw     =  APR:RW
          loc::kota   =  APR:Kota
      ELSIF Glo:lap = '2'
          loc::nama   =  JPas:Nama
          loc::alamat =  JPas:Alamat
          loc::rt     =  JPas:RT
          loc::rw     =  JPas:RW
          loc::kota   =  JPas:Kota
      END
    OF ?Button5
      ThisWindow.Update
      APH:N0_tran = glo::no_nota
      GlobalRequest = SelectRecord
      cari_nota_rd
      glo::no_nota = APH:N0_tran
      DISPLAY
      ThisWindow.Reset(1)
      
      
      Glo:lap = '0'
      loc::err = 0
      loc::message=0
      APH:N0_tran = glo::no_nota
      GET(APHTRANS,APH:by_transaksi)
      IF ERRORCODE()
          loc::err = 1
          loc::message = 1
      ELSE
          gl:kontrak    =APH:Kontrak
          gl:nik        =APH:NIP
          gl:nota       =APH:NoNota
          gl:cara_bayar =APH:cara_bayar
      
          Glo::no_mr = APH:Nomor_mr
          IF APH:Nomor_mr = 9999999999
              APR:N0_tran = glo::no_nota
              GET(ApReLuar,APR:by_transaksi)
              IF ERRORCODE()
                  loc::err = 1
                  loc::message = 5
              ELSE
                  Glo:lap = '1'   !--Untuk ambil data dari apreluar--
              END
          ELSE
              JPas:Nomor_mr = APH:Nomor_mr
              GET(JPasien,JPas:KeyNomorMr)
              IF ERRORCODE()
                  loc::err = 1
                  loc::message = 5
              ELSE
                  Glo:lap= '2' !---untuk ambil data dari jPasien----
              END
          END
          
          IF loc::err = 0
              APKL:N0_tran = glo::no_nota
              GET(Apklutmp,APKL:key_nota)
              IF NOT ERRORCODE()
                  loc::err = 1
                  loc::message = 2
              ELSE
              !---- masukkan data ke apklutmp dari apdtrans---
      
                  APH:N0_tran = glo::no_nota
                  GET(APHTRANS,APH:by_transaksi)
                  IF ERRORCODE()
                      loc::err = 1
                      loc::message = 3
                  ELSE
                    IF APH:Bayar = 0
                      !loc::err = 1
                      !loc::message = 4
                    !ELSE
                      loc::pers_disc = 0
                      SET(APDTRANS)
                      APD:N0_tran = APH:N0_tran
                      SET(APD:by_transaksi,APD:by_transaksi)
                      LOOP
                          IF Access:APDTRANS.Next()  OR APD:N0_tran <> APH:N0_tran THEN BREAK.
                          IF APD:Kode_brg = '_Disc'
                              loc::pers_disc = APD:Total / (APD:Total+APH:Biaya)
                              BREAK
                          END
                      END
                      SET(APDTRANS)
                      APD:N0_tran = APH:N0_tran
                      SET(APD:by_transaksi,APD:by_transaksi)
                      LOOP
                          IF Access:APDTRANS.Next()  OR APD:N0_tran <> APH:N0_tran THEN BREAK.
                          IF APD:Jumlah <> 0 AND APD:Kode_brg <> '_Campur' AND APD:Kode_brg <> '_Disc'
                              APKL:N0_tran = glo::no_nota
                              APKL:Kode_brg = APD:Kode_brg
                              GET(APklutmp,APKL:key_nota_brg)
                              IF ERRORCODE()
                                  APKL:N0_tran   = glo::no_nota
                                  APKL:Kode_brg  = APD:Kode_brg
                                  APKL:Jumlah    = APD:Jumlah
                                  APKL:Harga_Dasar = ( 1-loc::pers_disc ) * APD:Total / APD:Jumlah
                                  APKL:Harga_Dasar_benar = APD:Harga_Dasar
                                  Access:APklutmp.Insert()
                              ELSE
                                  APKL:Jumlah = APKL:Jumlah + APD:Jumlah
                                  IF APKL:Harga_Dasar > ( 1-loc::pers_disc ) * APD:Total / APD:Jumlah
                                      APKL:Harga_Dasar =  ( 1-loc::pers_disc ) * APD:Total / APD:Jumlah
                                  END
                                  IF APKL:Harga_Dasar_benar > APD:Harga_Dasar
                                      APKL:Harga_Dasar_benar = APD:Harga_Dasar
                                  END
                                  Access:APklutmp.Update()
                              END
                              APP1:N0_tran = glo::no_nota
                              APP1:Kode_brg = APD:Kode_brg
                              GET(APpotkem,APP1:key_nota_brg)
                              IF NOT ERRORCODE()
                                  APKL:N0_tran = glo::no_nota
                                  APKL:Kode_brg = APD:Kode_brg
                                  GET(APklutmp,APKL:key_nota_brg)
                                  APKL:Jumlah = APKL:Jumlah - APP1:Jumlah
                                  Access:APklutmp.Update()
                              END
                          END
                      END
                      ?OKButton{PROP:DISABLE}=0
                      ?glo::no_nota{PROP:DISABLE}=1
                      ?Button4{PROP:DISABLE}=1
                      ?Button5{PROP:DISABLE}=1
                    END
                  END
              END
          END
      END
      IF loc::err = 1
          CASE loc::message
          OF 1
              MESSAGE('Nomor Transaksi tidak ditemukan')
          OF 2
              MESSAGE ('Nomor Transaksi tersebut sedang dipakai')
          OF 3
              MESSAGE('Ada kesalahan data, mohon laporkan Kepada EDP')
          OF 4
              MESSAGE('Transaksi kasir belum dilakukan, Gunakan fasilitas BATAL TRANSAKSI ')
          OF 5
              MESSAGE('Ada kesalahan data di ApReLuar, laporkan ke EDP')
          END
          ?OKButton{PROP:DISABLE}=1
          CLEAR(glo::no_nota)
          CLEAR(loc::nama)
          CLEAR(loc::alamat)
          CLEAR(loc::rt)
          CLEAR(loc::rw)
          CLEAR(loc::kota)
          DISPLAY
          SELECT(?glo::no_nota)
      END
      IF Glo:lap = '1'   !--Untuk ambil data dari apreluar--
          loc::nama   =  APR:Nama
          loc::alamat =  APR:Alamat
          loc::rt     =  APR:RT
          loc::rw     =  APR:RW
          loc::kota   =  APR:Kota
      ELSIF Glo:lap = '2'
          loc::nama   =  JPas:Nama
          loc::alamat =  JPas:Alamat
          loc::rt     =  JPas:RT
          loc::rw     =  JPas:RW
          loc::kota   =  JPas:Kota
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

Cari_nota_rj PROCEDURE                                     ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
loc::no_transaksi    STRING(15)                            !
loc::nama_pasien     STRING(35)                            !
BRW1::View:Browse    VIEW(ApReLuar)
                       PROJECT(APR:N0_tran)
                       PROJECT(APR:Nama)
                       PROJECT(APR:Alamat)
                       PROJECT(APR:RT)
                       PROJECT(APR:RW)
                       PROJECT(APR:Kota)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APR:N0_tran            LIKE(APR:N0_tran)              !List box control field - type derived from field
APR:Nama               LIKE(APR:Nama)                 !List box control field - type derived from field
APR:Alamat             LIKE(APR:Alamat)               !List box control field - type derived from field
APR:RT                 LIKE(APR:RT)                   !List box control field - type derived from field
APR:RW                 LIKE(APR:RW)                   !List box control field - type derived from field
APR:Kota               LIKE(APR:Kota)                 !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Melihat No. nota Transaksi luar'),AT(,,344,187),FONT('MS Sans Serif',8,COLOR:Black,),IMM,HLP('Cari_nota_rj'),SYSTEM,GRAY,RESIZE,MDI
                       LIST,AT(8,20,328,124),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('64L(2)|FM~No. Transaksi~@s15@80L(2)|M~Nama~@s35@80L(2)|M~Alamat~@s35@16R(2)|M~RT' &|
   '~C(0)@N3@16R(2)|M~RW~C(0)@N3@80L(2)|M~Kota~@s20@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(195,0,45,14),USE(?Select:2),HIDE
                       SHEET,AT(4,4,336,179),USE(?CurrentTab)
                         TAB('No. Transaksi (F2)'),USE(?Tab:2),KEY(F2Key),COLOR(05FBA32H)
                           PROMPT('No. Transaksi :'),AT(145,158),USE(?Prompt1)
                           ENTRY(@s15),AT(207,155,83,15),USE(loc::no_transaksi),FONT('Times New Roman',12,,)
                         END
                         TAB('Nama Pasien (F3)'),USE(?Tab:3),KEY(F3Key),COLOR(0A7AC46H)
                           PROMPT('Nama Pasien :'),AT(98,155),USE(?loc::nama_pasien:Prompt)
                           ENTRY(@s35),AT(154,154,174,15),USE(loc::nama_pasien),FONT('Times New Roman',12,,)
                         END
                       END
                       BUTTON('Close'),AT(265,0,45,14),USE(?Close),HIDE
                       BUTTON('Help'),AT(236,0,45,14),USE(?Help),HIDE,STD(STD:Help)
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

BRW1::Sort0:Locator  EntryLocatorClass                     ! Default Locator
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
  GlobalErrors.SetProcedureName('Cari_nota_rj')
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
  Relate:ApReLuar.Open                                     ! File ApReLuar used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:ApReLuar,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon APR:Nama for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,APR:key_nama)    ! Add the sort order for APR:key_nama for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?loc::nama_pasien,APR:Nama,1,BRW1) ! Initialize the browse locator using ?loc::nama_pasien using key: APR:key_nama , APR:Nama
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon APR:N0_tran for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,APR:by_transaksi) ! Add the sort order for APR:by_transaksi for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?loc::no_transaksi,APR:N0_tran,,BRW1) ! Initialize the browse locator using ?loc::no_transaksi using key: APR:by_transaksi , APR:N0_tran
  BRW1.AddField(APR:N0_tran,BRW1.Q.APR:N0_tran)            ! Field APR:N0_tran is a hot field or requires assignment from browse
  BRW1.AddField(APR:Nama,BRW1.Q.APR:Nama)                  ! Field APR:Nama is a hot field or requires assignment from browse
  BRW1.AddField(APR:Alamat,BRW1.Q.APR:Alamat)              ! Field APR:Alamat is a hot field or requires assignment from browse
  BRW1.AddField(APR:RT,BRW1.Q.APR:RT)                      ! Field APR:RT is a hot field or requires assignment from browse
  BRW1.AddField(APR:RW,BRW1.Q.APR:RW)                      ! Field APR:RW is a hot field or requires assignment from browse
  BRW1.AddField(APR:Kota,BRW1.Q.APR:Kota)                  ! Field APR:Kota is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Cari_nota_rj',QuickWindow)                 ! Restore window settings from non-volatile store
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
    Relate:ApReLuar.Close
  END
  IF SELF.Opened
    INIMgr.Update('Cari_nota_rj',QuickWindow)              ! Save window data to non-volatile store
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

Trig_BrowseReturRawatJalan PROCEDURE                       ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
Lunas                STRING(5)                             !
Poliklinik           STRING(1)                             !
loc::no_mr           LONG                                  !
BRW1::View:Browse    VIEW(APHTRANS)
                       PROJECT(APH:N0_tran)
                       PROJECT(APH:Tanggal)
                       PROJECT(APH:Biaya)
                       PROJECT(APH:User)
                       PROJECT(APH:cara_bayar)
                       PROJECT(APH:NoNota)
                       PROJECT(APH:Kode_Apotik)
                       PROJECT(APH:NoTransaksiAsal)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APH:N0_tran            LIKE(APH:N0_tran)              !List box control field - type derived from field
APH:Tanggal            LIKE(APH:Tanggal)              !List box control field - type derived from field
APH:Biaya              LIKE(APH:Biaya)                !List box control field - type derived from field
Lunas                  LIKE(Lunas)                    !List box control field - type derived from local data
APH:User               LIKE(APH:User)                 !List box control field - type derived from field
APH:cara_bayar         LIKE(APH:cara_bayar)           !List box control field - type derived from field
APH:NoNota             LIKE(APH:NoNota)               !List box control field - type derived from field
APH:Kode_Apotik        LIKE(APH:Kode_Apotik)          !List box control field - type derived from field
APH:NoTransaksiAsal    LIKE(APH:NoTransaksiAsal)      !List box control field - type derived from field
glo:nobatal            LIKE(glo:nobatal)              !Browse hot field - type derived from global data
glo::no_nota           LIKE(glo::no_nota)             !Browse hot field - type derived from global data
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
                       PROJECT(APD:Harga_Dasar)
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
APD:Harga_Dasar        LIKE(APD:Harga_Dasar)          !List box control field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Pengembalian Obat Rawat Jalan'),AT(,,521,281),FONT('Times New Roman',8,COLOR:Black,),IMM,HLP('Tran_Poliklinik'),SYSTEM,GRAY,RESIZE,MDI
                       LIST,AT(8,20,504,114),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('64L|M~No. Transaksi~C@s15@58R(1)|M~Tanggal~C(0)@D8@64R(1)|M~Biaya~C(0)@n-15.2@32' &|
   'L|M~Lunas~@s5@21L|M~User~@s4@41L|M~cara bayar~@n1@40L|M~No Nota~@s10@20L|M~Kode ' &|
   'Apotik~@s5@60L|M~No Transaksi Asal~@s15@'),FROM(Queue:Browse:1)
                       LIST,AT(5,167,512,87),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('52L|FM~Kode Barang~C@s10@121L|FM~Nama Obat~C@s40@87L|FM~Keterangan~C@s50@53R(2)|' &|
   'M~Jumlah~C(0)@n-12.2@63R(2)|M~Total~C(0)@n-15.2@60R(2)|M~Diskon~C(0)@n-15.2@60L|' &|
   'M~Camp~C@n2@60L|M~N 0 tran~C@s15@44D|M~Harga Dasar~C@n11.2@'),FROM(Queue:Browse)
                       BUTTON('T&ransaksi (F4)'),AT(357,140,72,20),USE(?Insert:3),LEFT,FONT('Times New Roman',8,COLOR:Blue,FONT:bold),MSG('Transaksi Pengembalian Obat'),TIP('Transaksi Pengembalian Obat'),KEY(F4Key),ICON(ICON:Open)
                       BUTTON('&Select'),AT(279,1,45,14),USE(?Select:2),HIDE
                       BUTTON('&Change'),AT(229,1,45,14),USE(?Change:3),DISABLE,HIDE,DEFAULT
                       BUTTON('&Delete'),AT(179,1,45,14),USE(?Delete:3),DISABLE,HIDE
                       SHEET,AT(4,4,514,159),USE(?CurrentTab)
                         TAB('No. Transaksi'),USE(?Tab:3)
                           BUTTON('Cetak &Nota'),AT(161,140,61,20),USE(?Print:2),LEFT,FONT('Times New Roman',8,COLOR:Blue,FONT:bold),MSG('Cetak Nota Transaksi'),TIP('Mencetak Nota Transaksi'),ICON(ICON:Print1)
                           PROMPT('No Tran:'),AT(12,143),USE(?APH:N0_tran:Prompt)
                           ENTRY(@s15),AT(45,143,77,10),USE(APH:N0_tran),MSG('nomor transaksi'),TIP('nomor transaksi')
                         END
                       END
                       BUTTON('&Tutup'),AT(357,258,87,20),USE(?Close),LEFT,FONT('Times New Roman',10,COLOR:Teal,FONT:bold+FONT:italic),ICON(ICON:Cross)
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

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
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
  GlobalErrors.SetProcedureName('Trig_BrowseReturRawatJalan')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('glo:nota_retur',glo:nota_retur)                    ! Added by: BrowseBox(ABC)
  BIND('Lunas',Lunas)                                      ! Added by: BrowseBox(ABC)
  BIND('glo:nobatal',glo:nobatal)                          ! Added by: BrowseBox(ABC)
  BIND('glo::no_nota',glo::no_nota)                        ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  APH:N0_tran=glo::no_nota
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
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(?APH:N0_tran,APH:N0_tran,,BRW1) ! Initialize the browse locator using ?APH:N0_tran using key: APH:by_transaksi , APH:N0_tran
  BRW1.SetFilter('(APH:NoNota=glo:nota_retur)')            ! Apply filter expression to browse
  BRW1.AddField(APH:N0_tran,BRW1.Q.APH:N0_tran)            ! Field APH:N0_tran is a hot field or requires assignment from browse
  BRW1.AddField(APH:Tanggal,BRW1.Q.APH:Tanggal)            ! Field APH:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(APH:Biaya,BRW1.Q.APH:Biaya)                ! Field APH:Biaya is a hot field or requires assignment from browse
  BRW1.AddField(Lunas,BRW1.Q.Lunas)                        ! Field Lunas is a hot field or requires assignment from browse
  BRW1.AddField(APH:User,BRW1.Q.APH:User)                  ! Field APH:User is a hot field or requires assignment from browse
  BRW1.AddField(APH:cara_bayar,BRW1.Q.APH:cara_bayar)      ! Field APH:cara_bayar is a hot field or requires assignment from browse
  BRW1.AddField(APH:NoNota,BRW1.Q.APH:NoNota)              ! Field APH:NoNota is a hot field or requires assignment from browse
  BRW1.AddField(APH:Kode_Apotik,BRW1.Q.APH:Kode_Apotik)    ! Field APH:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(APH:NoTransaksiAsal,BRW1.Q.APH:NoTransaksiAsal) ! Field APH:NoTransaksiAsal is a hot field or requires assignment from browse
  BRW1.AddField(glo:nobatal,BRW1.Q.glo:nobatal)            ! Field glo:nobatal is a hot field or requires assignment from browse
  BRW1.AddField(glo::no_nota,BRW1.Q.glo::no_nota)          ! Field glo::no_nota is a hot field or requires assignment from browse
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
  BRW6.AddField(APD:Harga_Dasar,BRW6.Q.APD:Harga_Dasar)    ! Field APD:Harga_Dasar is a hot field or requires assignment from browse
  BRW6.AddField(GBAR:Kode_brg,BRW6.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_BrowseReturRawatJalan',QuickWindow)   ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW6.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW6.ToolbarItem.HelpButton = ?Help
  BRW6.PrintProcedure = 2
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
    INIMgr.Update('Trig_BrowseReturRawatJalan',QuickWindow) ! Save window data to non-volatile store
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
      Trig_UpdateReturRawatJalan
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
      glo::no_nota=APH:N0_tran
      if APH:Biaya <0 or APH:NoTransaksiAsal<>'' then
         message('Proses tidak dapat dilanjutkan, karena Transaksi ini merupakan Transaksi Retur')
         cycle
      end
      display
    OF ?Close
      !SET(APklutmp)
      !APKL:N0_tran = glo::no_nota
      !SET(APKL:key_nota,APKL:key_nota)
      !LOOP
      !    IF Access:APklutmp.Next() OR APKL:N0_tran <> glo::no_nota THEN BREAK.
      !    DELETE(APklutmp)
      !END
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
  !   !message(APH:N0_tran)
  !   JDB:NOMOR            =APH:NoNota
  !   JDB:NOTRAN_INTERNAL  =APH:N0_tran
  !   JDB:KODEJASA         ='FAR.00001.00.00'
  !   JDB:TOTALBIAYA       =APH:Biaya
  !   JDB:hppobat          =GLO:HARGA_DASAR_RETUR
  !   JDB:KETERANGAN       =''
  !   JDB:JUMLAH           =1
  !!   if GL_entryapotik='FM04' or GL_entryapotik='FM09' then
  !!      JDB:KODE_BAGIAN      ='FARMASI'
  !!   else
  !!      JDB:KODE_BAGIAN      ='FARPD'
  !!   end
  !   
  !   JDB:KODE_BAGIAN      =APH:Kode_Apotik
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
  !      JDB:DTG_JD           =0
  !   else
  !        if APH:Nomor_mr=99999999 then
  !            JDB:DTG_JD           =0
  !        else
  !            JDB:DTG_JD           =APH:biaya_dtg
  !        end
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
  !   JDDB:hppobat         =GLO:HARGA_DASAR_RETUR
  !   if APH:cara_bayar<>3 then
  !        JDDB:DTG_JD           =0
  !   else
  !        if APH:Nomor_mr=99999999 then
  !            JDDB:DTG_JD           =0
  !        else
  !            JDDB:DTG_JD           =APH:biaya_dtg
  !        end
  !   end
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

