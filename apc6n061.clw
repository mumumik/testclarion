

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N061.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N010.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N060.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N062.INC'),ONCE        !Req'd for module callout resolution
                     END


cek_kontraktor PROCEDURE                                   ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
Nomor_pengantar      STRING(10)                            !
window               WINDOW('Data Kontraktor'),AT(,,250,111),FONT('Times New Roman',10,,),ALRT(EscKey),GRAY,MDI
                       PROMPT('Kode Kontraktor :'),AT(15,11),USE(?Prompt3),FONT(,,,FONT:bold)
                       ENTRY(@s10),AT(76,10,66,14),USE(vg_kontraktor)
                       BUTTON('F2'),AT(147,10,12,14),USE(?CallLookup:2),KEY(F2Key)
                       BUTTON('OK'),AT(47,71,67,22),USE(?OkButton),LEFT,ICON(ICON:Tick),DEFAULT
                       BUTTON('&Batal'),AT(128,71,67,22),USE(?CancelButton),LEFT,FONT('Times New Roman',12,COLOR:Black,),ICON(ICON:Hand)
                       PROMPT('Kode Kontraktor :'),AT(14,32),USE(?Prompt2)
                       STRING(@s10),AT(76,32,47,10),USE(JKon:KODE_KTR),FONT('Arial',10,,FONT:bold)
                       STRING(@s40),AT(76,50,142,10),USE(JKon:NAMA_KTR),FONT('Arial',10,,FONT:bold)
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
  ?OkButton{PROP:DISABLE}=1
  CLEAR(JDKt:Nomor_mr)
  CLEAR(JPas:Nama)
  CLEAR(JKon:NAMA_KTR)
  CLEAR(JDKt:Kode_Kontrak)
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('cek_kontraktor')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Prompt3
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:JDataKtr.SetOpenRelated()
  Relate:JDataKtr.Open                                     ! File JKontrak used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKontrak.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('cek_kontraktor',window)                    ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:JDataKtr.Close
  END
  IF SELF.Opened
    INIMgr.Update('cek_kontraktor',window)                 ! Save window data to non-volatile store
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
    Cari_no_urut
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
    OF ?vg_kontraktor
      JKon:KODE_KTR = vg_kontraktor
      GET (JKontrak,Jkon:KeyKodeKtr)
      IF ERRORCODE()
          MESSAGE ('Tidak Ada Nama Kontraktor Tersebut !!!')
          SELECT(?vg_kontraktor)
          CYCLE
      END
      !JPas:Nomor_mr=JDKt:Nomor_mr
      !Access:JPasien.Fetch(JPas:KeyNomorMr)
      ?OkButton{PROP:DISABLE}=0
    OF ?OkButton
      BREAK
    OF ?CancelButton
      Status=2
      BREAK
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?vg_kontraktor
      IF vg_kontraktor OR ?vg_kontraktor{Prop:Req}
        JKon:KODE_KTR = vg_kontraktor
        IF Access:JKontrak.TryFetch(JKon:KeyKodeKtr)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            vg_kontraktor = JKon:KODE_KTR
          ELSE
            SELECT(?vg_kontraktor)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup:2
      ThisWindow.Update
      JKon:KODE_KTR = vg_kontraktor
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        vg_kontraktor = JKon:KODE_KTR
      END
      ThisWindow.Reset(1)
      !JDKt:NoUrut = Nomor_pengantar
      !GET (JDataKtr,JDKt:KeyNoUrut)
      !IF ERRORCODE()
      !    MESSAGE ('Nomor tersebut tidak ada dalam Daftar')
      !    SELECT(?Nomor_pengantar)
      !    ?OkButton{PROP:DISABLE}=1
      !    CYCLE
      !END
      ?OkButton{PROP:DISABLE}=0
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
      select(?cancelButton)
      presskey( 13)
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

cari_nm_peg PROCEDURE                                      ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
nip_peg              STRING(10)                            !
nm_peg               STRING(40)                            !
BRW1::View:Browse    VIEW(SMPegawai)
                       PROJECT(PEGA:Nik)
                       PROJECT(PEGA:Nama)
                       PROJECT(PEGA:Tgl_Lahir)
                       PROJECT(PEGA:Unit)
                       JOIN(RUNK:Pkey,PEGA:Unit)
                         PROJECT(RUNK:Nama)
                         PROJECT(RUNK:KodeUnker)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PEGA:Nik               LIKE(PEGA:Nik)                 !List box control field - type derived from field
PEGA:Nama              LIKE(PEGA:Nama)                !List box control field - type derived from field
PEGA:Tgl_Lahir         LIKE(PEGA:Tgl_Lahir)           !List box control field - type derived from field
RUNK:Nama              LIKE(RUNK:Nama)                !List box control field - type derived from field
RUNK:KodeUnker         LIKE(RUNK:KodeUnker)           !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Melihat Data Pegawai'),AT(,,358,222),FONT('MS Sans Serif',8,COLOR:Black,),IMM,HLP('cari_nm_peg'),SYSTEM,GRAY,RESIZE
                       LIST,AT(8,22,342,148),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('40L|M~Nik~@s7@163L|M~Nama~@s40@55L|M~Tgl Lahir~@d06@120L|M~Unit Kerja~@s30@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(246,0,45,14),USE(?Select:2),HIDE
                       SHEET,AT(4,4,350,188),USE(?CurrentTab)
                         TAB('NAMA Pegawai (F2)'),USE(?Tab:2),KEY(F2Key)
                           PROMPT('Nama Pegawai :'),AT(11,174),USE(?Prompt1)
                           ENTRY(@s40),AT(83,173,137,15),USE(PEGA:Nama)
                         END
                         TAB('NIP Pegawai (F3)'),USE(?Tab:6),KEY(F3Key)
                           STRING('NIP Pegawai :'),AT(18,176),USE(?String1)
                           ENTRY(@s7),AT(70,176,53,10),USE(PEGA:Nik)
                         END
                       END
                       BUTTON('Close'),AT(145,0,45,14),USE(?Close),HIDE
                       BUTTON('Help'),AT(294,0,45,14),USE(?Help),HIDE,STD(STD:Help)
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
BRW1::Sort4:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW1::Sort4:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('cari_nm_peg')
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
  Relate:SMPegawai.SetOpenRelated()
  Relate:SMPegawai.Open                                    ! File SMPegawai used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:SMPegawai,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort4:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon PEGA:Nik for sort order 1
  BRW1.AddSortOrder(BRW1::Sort4:StepClass,PEGA:Pkey)       ! Add the sort order for PEGA:Pkey for sort order 1
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort4:Locator.Init(?PEGA:Nik,PEGA:Nik,,BRW1)       ! Initialize the browse locator using ?PEGA:Nik using key: PEGA:Pkey , PEGA:Nik
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon PEGA:Nama for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,PEGA:KeyNama)    ! Add the sort order for PEGA:KeyNama for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?PEGA:Nama,PEGA:Nama,,BRW1)     ! Initialize the browse locator using ?PEGA:Nama using key: PEGA:KeyNama , PEGA:Nama
  BRW1.AddField(PEGA:Nik,BRW1.Q.PEGA:Nik)                  ! Field PEGA:Nik is a hot field or requires assignment from browse
  BRW1.AddField(PEGA:Nama,BRW1.Q.PEGA:Nama)                ! Field PEGA:Nama is a hot field or requires assignment from browse
  BRW1.AddField(PEGA:Tgl_Lahir,BRW1.Q.PEGA:Tgl_Lahir)      ! Field PEGA:Tgl_Lahir is a hot field or requires assignment from browse
  BRW1.AddField(RUNK:Nama,BRW1.Q.RUNK:Nama)                ! Field RUNK:Nama is a hot field or requires assignment from browse
  BRW1.AddField(RUNK:KodeUnker,BRW1.Q.RUNK:KodeUnker)      ! Field RUNK:KodeUnker is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('cari_nm_peg',QuickWindow)                  ! Restore window settings from non-volatile store
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
    Relate:SMPegawai.Close
  END
  IF SELF.Opened
    INIMgr.Update('cari_nm_peg',QuickWindow)               ! Save window data to non-volatile store
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

cek_pegawai PROCEDURE                                      ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
nip_pegawai          STRING(10)                            !
rm_pegawai           STRING(20)                            !
window               WINDOW('Data Pegawai'),AT(,,225,153),FONT('Times New Roman',10,COLOR:Black,),ALRT(EscKey),GRAY
                       BUTTON('&OK'),AT(173,13,35,26),USE(?OkButton),DEFAULT
                       PANEL,AT(7,13,155,63),USE(?Panel1)
                       PROMPT('NIP Pegawai :'),AT(20,23),USE(?Prompt1),FONT('Times New Roman',12,,)
                       ENTRY(@s10),AT(80,25,,10),USE(nip_pegawai),FONT('Times New Roman',12,,)
                       BUTTON('F2'),AT(137,24,12,12),USE(?CallLookup),KEY(F2Key)
                       GROUP('Nama Pegawai'),AT(20,46,134,26),USE(?Group1),BOXED
                       END
                       STRING(@s40),AT(27,58),USE(PEG:NAMA),FONT('Times New Roman',10,,)
                       GROUP('Nomor RM pasien'),AT(7,81,156,64),USE(?Group2),BOXED
                         ENTRY(@n10),AT(30,96,,10),USE(rm_pegawai),FONT(,14,,)
                         BUTTON('F3'),AT(98,95,12,12),USE(?CallLookup:2),KEY(F3Key)
                         STRING(@s35),AT(21,118,124,10),USE(JKE:Nama),FONT('Times New Roman',12,,)
                       END
                       BUTTON('&Batal'),AT(173,49,35,26),USE(?CancelButton)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
  GlobalErrors.SetProcedureName('cek_pegawai')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OkButton
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:JKelPeg.SetOpenRelated()
  Relate:JKelPeg.Open                                      ! File SMPegawai used by this procedure, so make sure it's RelationManager is open
  Relate:SMPegawai.SetOpenRelated()
  Relate:SMPegawai.Open                                    ! File SMPegawai used by this procedure, so make sure it's RelationManager is open
  Access:JPegawai.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('cek_pegawai',window)                       ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:JKelPeg.Close
    Relate:SMPegawai.Close
  END
  IF SELF.Opened
    INIMgr.Update('cek_pegawai',window)                    ! Save window data to non-volatile store
  END
  Glo::no_mr = rm_pegawai
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
      cari_nm_peg
      cari_rm_kel
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
    OF ?OkButton
      break
    OF ?rm_pegawai
      JKE:Nomor_mr=rm_pegawai
      GET(JKelPeg,JKE:by_nomor)
      IF JKE:NIP <> PEG:NIP OR ERRORCODE()
          MESSAGE('Nomor RM Tidak Masuk Dalam daftar Kepegawaian')
          SELECT(?rm_pegawai)
          ?OKButton{PROP:DISABLE}=1
          CYCLE
      END
      IF JKE:RESEP = 'P'
          MESSAGE('Status: Tidak Dapat Gratis, Pakai Tunai')
          SELECT(?rm_pegawai)
          ?OKButton{PROP:DISABLE}=1
          CYCLE
      END
      JPas:Nomor_mr=rm_pegawai
      Access:JPasien.Fetch(JPas:KeyNomorMr)
      ?OKButton{PROP:DISABLE}=0
    OF ?CancelButton
      Status=2
      BREAK
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?nip_pegawai
      IF nip_pegawai OR ?nip_pegawai{Prop:Req}
        PEGA:Nik = nip_pegawai
        IF Access:SMPegawai.TryFetch(PEGA:Pkey)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            nip_pegawai = PEGA:Nik
          ELSE
            SELECT(?nip_pegawai)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      PEGA:Nik = nip_pegawai
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        nip_pegawai = PEGA:Nik
      END
      ThisWindow.Reset(1)
    OF ?rm_pegawai
      IF rm_pegawai OR ?rm_pegawai{Prop:Req}
        JPas:Nomor_mr = rm_pegawai
        IF Access:JPasien.TryFetch(JPas:KeyNomorMr)
          IF SELF.Run(2,SelectRecord) = RequestCompleted
            rm_pegawai = JPas:Nomor_mr
          ELSE
            SELECT(?rm_pegawai)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup:2
      ThisWindow.Update
      JPas:Nomor_mr = rm_pegawai
      IF SELF.Run(2,SelectRecord) = RequestCompleted
        rm_pegawai = JPas:Nomor_mr
      END
      ThisWindow.Reset(1)
      ! KEY_SELini dari select di browse file untuk search
      if key_sel=1
          ?OKButton{PROP:DISABLE}=0
          JPas:Nomor_mr=JKE:Nomor_mr
          GET(JPASIEN,JPas:KeyNomorMr)
      end
      IF JKE:RESEP = 'P'
          MESSAGE('Status: Tidak Dapat Gratis, Pakai Tunai')
          SELECT(?rm_pegawai)
          ?OKButton{PROP:DISABLE}=1
      END
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
      select(?cancelButton)
      presskey( 13)
    OF EVENT:OpenWindow
      ?OKButton{PROP:DISABLE}=TRUE
      CLEAR (PEG:RECORD)
      CLEAR (JKE:RECORD)
      DISPLAY
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

cari_rm_kel PROCEDURE                                      ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
nm_kel_pasien        STRING(35)                            !
rm_pasien            ULONG                                 !
BRW1::View:Browse    VIEW(JPasien)
                       PROJECT(JPas:Nomor_mr)
                       PROJECT(JPas:Nama)
                       PROJECT(JPas:TanggalLahir)
                       PROJECT(JPas:Alamat)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
JPas:Nomor_mr          LIKE(JPas:Nomor_mr)            !List box control field - type derived from field
JPas:Nama              LIKE(JPas:Nama)                !List box control field - type derived from field
JPas:TanggalLahir      LIKE(JPas:TanggalLahir)        !List box control field - type derived from field
JPas:Alamat            LIKE(JPas:Alamat)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Melihat Data Keluarga Pegawai'),AT(,,332,206),FONT('MS Sans Serif',8,COLOR:Black,),IMM,HLP('cari_rm_kel'),SYSTEM,GRAY,RESIZE
                       LIST,AT(8,21,316,158),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('40L|M~Nomor MR~@N010_@140L|M~Nama~@s35@40L|M~Tanggal Lahir~@D06@140L|M~Alamat~@s' &|
   '35@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(273,1,45,14),USE(?Select:2),HIDE
                       SHEET,AT(4,4,324,193),USE(?CurrentTab)
                         TAB('Nama (F2)'),USE(?Tab:2),KEY(F2Key)
                           PROMPT('Nama :'),AT(9,183),USE(?JPas:Nama:Prompt)
                           ENTRY(@s35),AT(59,183,84,10),USE(JPas:Nama),HLP('Nama mendahului gelar'),MSG('Nama pasien'),REQ,CAP
                         END
                         TAB('Nomor RM (F3)'),USE(?Tab:3),KEY(F3Key)
                           PROMPT('Nomor MR :'),AT(9,184),USE(?JPas:Nomor_mr:Prompt)
                           ENTRY(@N010_),AT(59,184,60,10),USE(JPas:Nomor_mr),IMM,MSG('Nomor Medical record pasien'),TIP('Nomor KIUP')
                         END
                       END
                       BUTTON('Close'),AT(167,0,45,14),USE(?Close),HIDE
                       BUTTON('Help'),AT(225,0,45,14),USE(?Help),HIDE,STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW1::Sort1:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('cari_rm_kel')
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
  Relate:JKelPeg.SetOpenRelated()
  Relate:JKelPeg.Open                                      ! File JKelPeg used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPegawai.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:JPasien,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive) ! Moveable thumb based upon JPas:Nomor_mr for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,JPas:KeyNomorMr) ! Add the sort order for JPas:KeyNomorMr for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?JPas:Nomor_mr,JPas:Nomor_mr,,BRW1) ! Initialize the browse locator using ?JPas:Nomor_mr using key: JPas:KeyNomorMr , JPas:Nomor_mr
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon JPas:Nama for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,JPas:KeyNama)    ! Add the sort order for JPas:KeyNama for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?JPas:Nama,JPas:Nama,,BRW1)     ! Initialize the browse locator using ?JPas:Nama using key: JPas:KeyNama , JPas:Nama
  BRW1.AddField(JPas:Nomor_mr,BRW1.Q.JPas:Nomor_mr)        ! Field JPas:Nomor_mr is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nama,BRW1.Q.JPas:Nama)                ! Field JPas:Nama is a hot field or requires assignment from browse
  BRW1.AddField(JPas:TanggalLahir,BRW1.Q.JPas:TanggalLahir) ! Field JPas:TanggalLahir is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Alamat,BRW1.Q.JPas:Alamat)            ! Field JPas:Alamat is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('cari_rm_kel',QuickWindow)                  ! Restore window settings from non-volatile store
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
    Relate:JKelPeg.Close
  END
  IF SELF.Opened
    INIMgr.Update('cari_rm_kel',QuickWindow)               ! Save window data to non-volatile store
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
    OF ?Select:2
      key_sel=1
    END
  ReturnValue = PARENT.TakeAccepted()
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
    OF EVENT:OpenWindow
      key_sel=0
    END
  ReturnValue = PARENT.TakeWindowEvent()
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
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

Trig_WindowReturRawatInapNew PROCEDURE                     ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
loc_mr               BYTE                                  !
loc::thread          BYTE                                  !
loc::pers_disc       BYTE                                  !
loc::no_mr           LONG                                  !
loc::status          STRING(10)                            !
loc:mitra            STRING(20)                            !
window               WINDOW('Pengembalian obat-obatan dari Ruangan ke Farmasi'),AT(,,287,158),FONT('Arial',8,,),ICON('Vcrprior.ico'),GRAY,MDI,IMM
                       ENTRY(@n010_),AT(77,41),USE(loc::no_mr),RIGHT(1),FONT('Times New Roman',12,COLOR:Black,)
                       BUTTON('&OK'),AT(227,16,50,21),USE(?OkButton),LEFT,ICON(ICON:Tick),DEFAULT
                       BUTTON('&Keluar'),AT(227,41,50,21),USE(?CancelButton),LEFT,ICON(ICON:Cross)
                       STRING('BARU'),AT(15,4,24,10),USE(?String13)
                       PANEL,AT(15,16,203,47),USE(?Panel1)
                       STRING('Data Pasien Ruang Rawat'),AT(67,18,91,11),USE(?String1),TRN,FONT('Comic Sans MS',,COLOR:Purple,FONT:italic)
                       LINE,AT(16,32,200,0),USE(?Line1),COLOR(040FF00H),LINEWIDTH(2)
                       PROMPT('Nomor RM :'),AT(18,43),USE(?loc::no_mr:Prompt),TRN,FONT('Times New Roman',12,COLOR:Black,FONT:bold)
                       BUTTON('...'),AT(128,40,17,16),USE(?Button4),DISABLE,HIDE
                       GROUP('Resume Pasien'),AT(15,68,256,83),USE(?Group1),BOXED,FONT('Lucida Handwriting',12,0800040H,)
                         STRING('Nama :'),AT(22,82),USE(?String7),TRN,FONT('Tahoma',10,COLOR:Maroon,)
                         STRING(@s35),AT(110,82),USE(JPas:Nama),TRN,FONT('Times New Roman',,COLOR:Black,)
                         STRING('Alamat :'),AT(22,99),USE(?String9),TRN,FONT('Tahoma',10,COLOR:Maroon,)
                         STRING(@s35),AT(110,99),USE(JPas:Alamat),TRN,FONT('Times New Roman',,COLOR:Black,)
                         STRING('Ruang Rawat :'),AT(22,115),USE(?String11),TRN,FONT('Tahoma',10,COLOR:Maroon,)
                         STRING(@s20),AT(110,115),USE(ITbr:NAMA_RUANG),TRN,FONT('Times New Roman',,COLOR:Black,)
                         STRING('Status Pembayaran :'),AT(22,132),USE(?String2),TRN,FONT('Tahoma',10,COLOR:Maroon,)
                         STRING(@n1),AT(112,132),USE(RI_HR:Pembayaran),TRN,FONT('Times New Roman',,COLOR:Black,)
                         STRING('['),AT(119,132),USE(?String4),TRN,FONT('Times New Roman',,COLOR:Black,)
                         STRING(@s10),AT(127,132),USE(loc::status),TRN,FONT('Times New Roman',,COLOR:Black,)
                         STRING(']'),AT(170,132),USE(?String5),TRN,FONT('Times New Roman',,COLOR:Black,)
                         STRING(@s20),AT(175,132),USE(loc:mitra)
                       END
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
  loc::no_mr = 0
  CLEAR(loc::status)
  CLEAR(JPas:Nama)
  CLEAR(JPas:Alamat)
  CLEAR(ITbr:NAMA_RUANG)
  CLEAR(JPas:Jenis_Pasien)
  ?OkButton{PROP:DISABLE}=1
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_WindowReturRawatInapNew')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?loc::no_mr
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  loc::thread=glo::mainthreadno
  !POST(EVENT:Disable_ReturRInap,,loc::thread)
  
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:APDTRANS.SetOpenRelated()
  Relate:APDTRANS.Open                                     ! File JKontrak used by this procedure, so make sure it's RelationManager is open
  Relate:APkemtmp.Open                                     ! File JKontrak used by this procedure, so make sure it's RelationManager is open
  Access:IPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITbrRwt.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITbKelas.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:IDataKtr.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITrPasen.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APHTRANS.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:RI_HRInap.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:RI_PinRuang.UseFile                               ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKontrak.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Trig_WindowReturRawatInapNew',window)      ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:APkemtmp.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_WindowReturRawatInapNew',window)   ! Save window data to non-volatile store
  END
  !POST(EVENT:Enable_ReturRInap,,loc::thread)
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
    OF ?loc::no_mr
      JPas:Nomor_mr=loc::no_mr
      access:jpasien.fetch(JPas:KeyNomorMr)
      !IF JPas:Inap<>1 then
      !   message('Nomor RM Tidak Ada Dalam daftar Rawat Inap')
      !   ?OkButton{PROP:DISABLE}=1
      !   CLEAR (JPas:Nama)
      !   CLEAR (JPas:Alamat)
      !   CLEAR (ITbr:NAMA_RUANG)
      !   CLEAR (LOC::Status)
      !   CLEAR (JPas:Jenis_Pasien)
      !   DISPLAY
      !   SELECT(?loc::no_mr)
      !ELSE
         ri_hrinap{prop:sql}='select * from dba.ri_hrinap where nomor_mr='&loc::no_mr&' order by NoUrut desc'
         ri_hrinap{prop:sql}='select * from dba.ri_hrinap where nomor_mr='&loc::no_mr&' order by NoUrut desc'
         access:ri_hrinap.next()
         IF RI_HR:Pembayaran = 3
            IDtK:Nomor_mr = loc::no_mr
            GET(IDataKtr,IDtK:KeyNomorMr)
            LOC::Status = 'Kontraktor'
            JKon:KODE_KTR=RI_HR:Kontraktor
            access:jkontrak.fetch(JKon:KeyKodeKtr)
            loc:mitra =JKon:NAMA_KTR
            display
         ELSIF RI_HR:Pembayaran= 2
            LOC::Status = 'Tunai'
         ELSIF RI_HR:Pembayaran = 1
            LOC::Status = 'Pegawai'
         END
      
         if errorcode()=33 then
            message('Pasien Sudah Pulang !!! Hubungi Ruangan/Pendaftaran !!1')
         elsif RI_HR:statusbayar=1 then
            message('Pasien Sudah Dibuatkan Nota !!! Hubungi Keuangan !!!')
            ?OkButton{PROP:DISABLE}=1
            CLEAR (JPas:Nama)
            CLEAR (JPas:Alamat)
            CLEAR (ITbr:NAMA_RUANG)
            CLEAR (LOC::Status)
            CLEAR (JPas:Jenis_Pasien)
            DISPLAY
            SELECT(?loc::no_mr)
            cycle
         elsif RI_HR:StatusTutupFar=1 then
            message('Status Farmasi sudah ditutup !!!')
            ?OkButton{PROP:DISABLE}=1
            CLEAR (JPas:Nama)
            CLEAR (JPas:Alamat)
            CLEAR (ITbr:NAMA_RUANG)
            CLEAR (LOC::Status)
            CLEAR (JPas:Jenis_Pasien)
            DISPLAY
            SELECT(?loc::no_mr)
            cycle
        elsif RI_HR:no_nota<>'' then
            message('Nota sudah dibuat  !!!')
            ?OkButton{PROP:DISABLE}=1
            CLEAR (JPas:Nama)
            CLEAR (JPas:Alamat)
            CLEAR (ITbr:NAMA_RUANG)
            CLEAR (LOC::Status)
            CLEAR (JPas:Jenis_Pasien)
            DISPLAY
            SELECT(?loc::no_mr)
            cycle
         else
            ri_pinruang{prop:sql}='select * from dba.ri_pinruang where nomor_mr='&RI_HR:Nomor_mr&' and nourut='&RI_HR:NoUrut&' order by Tanggal_Masuk desc,Jam_Masuk desc'
            access:ri_pinruang.next()
            IF RI_PI:Status=1
               ?OkButton{PROP:DISABLE}=0
               ITbr:KODE_RUANG=RI_PI:Ruang
               GET(ITbrRwt,ITbr:KeyKodeRuang)
               APKT:Nomor_mr=loc::no_mr
               GET(APkemtmp,APKT:key_mr)
               IF ERRORCODE() = 0
                  message('Nomor RM Sedang dipakai Orang lain, Kerjakan Resep lainnya')
                  ?OkButton{PROP:DISABLE}=1
                  CLEAR (JPas:Nama)
                  CLEAR (JPas:Alamat)
                  CLEAR (ITbr:NAMA_RUANG)
                  CLEAR (LOC::Status)
                  CLEAR (JPas:Jenis_Pasien)
                  DISPLAY
                  SELECT(?loc::no_mr)
               ELSE
                  !message('Select * from dba.aphtrans where nomor_mr='''&loc::no_mr&''' and ((tanggal='''&format(RI_HR:Tanggal_Masuk,@d10)&''' and jam>='''&format(RI_HR:Jam_masuk,@t04)&''') or tanggal>'''&format(RI_HR:Tanggal_Masuk,@d10)&''') order by n0_tran desc')
                  APHTRANS{PROP:SQL}='Select * from dba.aphtrans where nomor_mr='''&loc::no_mr&''' and ((tanggal='''&format(RI_HR:Tanggal_Masuk,@d10)&''' and jam>='''&format(RI_HR:Jam_masuk,@t04)&''') or tanggal>'''&format(RI_HR:Tanggal_Masuk,@d10)&''') order by n0_tran desc'
                  !APHTRANS{PROP:SQL}='Select * from dba.aphtrans where nomor_mr='''&loc::no_mr&''' and tanggal>='''&format(RI_HR:Tanggal_Masuk,@d10)&''' order by n0_tran'
                  LOOP
                     IF Access:APHTRANS.Next()<>level:benign then break.
                     loc::pers_disc = 0
      
                     apdtrans{prop:sql}='select * from dba.apdtrans where n0_tran='''&APH:N0_tran&''''
                     LOOP
                        IF Access:APDTRANS.Next()<>level:benign then break.
                        IF APD:Kode_brg = '_Disc'
                           loc::pers_disc = APD:Total / (APD:Total+APH:Biaya)
                           BREAK
                        END
                     END
      
                     apdtrans{prop:sql}='select * from dba.apdtrans where n0_tran='''&APH:N0_tran&''''
                     LOOP
                        IF Access:APDTRANS.next()<>level:benign THEN BREAK.
                        IF APD:Jumlah <> 0 AND APD:Kode_brg <> '_Campur' AND APD:Kode_brg <> '_Disc'
                           APKT:Kode_brg = APD:Kode_brg
                           APKT:Nomor_mr = loc::no_mr
                           GET(APkemtmp,APKT:key_no_mr)
                           IF ERRORCODE()= 35
                              APKT:Nomor_mr   = loc::no_mr
                              APKT:Kode_brg   = APD:Kode_brg
                              if APH:Biaya>0 then
                                 APKT:Jumlah     = APD:Jumlah
                              else
                                 APKT:Jumlah     = -APD:Jumlah
                              end
                              APKT:Harga_Dasar = ( 1-loc::pers_disc ) * APD:Total / APD:Jumlah
                              APKT:Harga_Dasar_benar = APD:Harga_Dasar
                              Access:APkemtmp.Insert()
                           ELSE
                              if APH:Biaya>0 then
                                 APKT:Jumlah = APKT:Jumlah + APD:Jumlah
                              else
                                 APKT:Jumlah = APKT:Jumlah - APD:Jumlah
                              end
                              IF APH:Biaya >0
                                 !IF APKT:Harga_Dasar > ( 1-loc::pers_disc ) * APD:Total / APD:Jumlah
                                    APKT:Harga_Dasar =  ( 1-loc::pers_disc ) * APD:Total / APD:Jumlah
                                 !END
                                 !IF APKT:Harga_Dasar_benar > APD:Harga_Dasar
                                    APKT:Harga_Dasar_benar =  APD:Harga_Dasar
                                 !END
                              END
                              Access:APkemtmp.Update()
                           END
                        END
                     END
                  END
                  Glo::no_mr=loc::no_mr
               END
            end
         END
      !END
    OF ?OkButton
      glo::form_insert=1
      !UpdateReturRawatInap
      Trig_BrowseReturRawatInap1
      CLEAR(loc::status)
      CLEAR(JPas:Nama)
      CLEAR(JPas:Alamat)
      CLEAR(ITbr:NAMA_RUANG)
      CLEAR(JPas:Jenis_Pasien)
      CLEAR(loc::no_mr)
      ?OkButton{PROP:DISABLE}=1
      DISPLAY
       POST(Event:CloseWindow)
    OF ?CancelButton
      glo::form_insert=0
      IF loc::no_mr <> 0
         apkemtmp{prop:sql}='delete from dba.apkemtmp where Nomor_mr='''&loc::no_mr&''''
      END
      POST(EVENT:CLOSEWINDOW)
    OF ?Button4
      globalrequest=selectrecord
      cari_mr_pasien_inap
      loc::no_mr=JPas:Nomor_mr
      display
      IF loc::no_mr=''
         message('Nomor RM Tidak Ada Dalam daftar Rawat Inap')
         ?OkButton{PROP:DISABLE}=1
         CLEAR (JPas:Nama)
         CLEAR (JPas:Alamat)
         CLEAR (ITbr:NAMA_RUANG)
         CLEAR (LOC::Status)
         CLEAR (JPas:Jenis_Pasien)
         DISPLAY
         SELECT(?loc::no_mr)
      ELSE
         IF JPas:Jenis_Pasien = 3
            IDtK:Nomor_mr = loc::no_mr
            GET(IDataKtr,IDtK:KeyNomorMr)
            LOC::Status = 'Kontraktor'
         ELSIF JPas:Jenis_Pasien= 2
            LOC::Status = 'Tunai'
         ELSIF JPas:Jenis_Pasien = 1
            LOC::Status = 'Pegawai'
         END
      
         ri_hrinap{prop:sql}='select * from dba.ri_hrinap where nomor_mr='&loc::no_mr&' and pulang=0'
         ri_hrinap{prop:sql}='select * from dba.ri_hrinap where nomor_mr='&loc::no_mr&' and pulang=0'
         access:ri_hrinap.next()
         if errorcode()=33 then
            message('Pasien Sudah Pulang !!! Hubungi Ruangan/Pendaftaran !!1')
         elsif RI_HR:statusbayar=1 then
            message('Pasien Sudah Dibuatkan Nota !!! Hubungi Keuangan !!1')
            ?OkButton{PROP:DISABLE}=1
            CLEAR (JPas:Nama)
            CLEAR (JPas:Alamat)
            CLEAR (ITbr:NAMA_RUANG)
            CLEAR (LOC::Status)
            CLEAR (JPas:Jenis_Pasien)
            DISPLAY
            SELECT(?loc::no_mr)
            cycle
         else
            ri_pinruang{prop:sql}='select * from dba.ri_pinruang where nomor_mr='&RI_HR:Nomor_mr&' and nourut='&RI_HR:NoUrut&' order by Tanggal_Masuk,Jam_Masuk desc'
            ri_pinruang{prop:sql}='select * from dba.ri_pinruang where nomor_mr='&RI_HR:Nomor_mr&' and nourut='&RI_HR:NoUrut&' order by Tanggal_Masuk,Jam_Masuk desc'
            access:ri_pinruang.next()
            !message(RI_PI:Ruang)
            IF RI_PI:Status=1
               ?OkButton{PROP:DISABLE}=0
               ITbr:KODE_RUANG=RI_PI:Ruang
               GET(ITbrRwt,ITbr:KeyKodeRuang)
               APKT:Nomor_mr=loc::no_mr
               GET(APkemtmp,APKT:key_mr)
               IF ERRORCODE() = 0
                  message('Nomor RM Sedang dipakai Orang lain, Kerjakan Resep lainnya')
                  ?OkButton{PROP:DISABLE}=1
                  CLEAR (JPas:Nama)
                  CLEAR (JPas:Alamat)
                  CLEAR (ITbr:NAMA_RUANG)
                  CLEAR (LOC::Status)
                  CLEAR (JPas:Jenis_Pasien)
                  DISPLAY
                  SELECT(?loc::no_mr)
               ELSE
                  !message('Select * from dba.aphtrans where nomor_mr='''&loc::no_mr&''' and tanggal>='''&format(RI_HR:Tanggal_Masuk,@d10)&'''')
                  !message('Select * from dba.aphtrans where nomor_mr='''&loc::no_mr&''' and ((tanggal='''&format(RI_HR:Tanggal_Masuk,@d10)&''' and jam>='''&format(RI_HR:Jam_masuk,@t04)&''') or tanggal>'''&format(RI_HR:Tanggal_Masuk,@d10)&''') order by n0_tran desc')
                  APHTRANS{PROP:SQL}='Select * from dba.aphtrans where nomor_mr='''&loc::no_mr&''' and ((tanggal='''&format(RI_HR:Tanggal_Masuk,@d10)&''' and jam>='''&format(RI_HR:Jam_masuk,@t04)&''') or tanggal>'''&format(RI_HR:Tanggal_Masuk,@d10)&''') order by n0_tran desc'
                  !APHTRANS{PROP:SQL}='Select * from dba.aphtrans where nomor_mr='''&loc::no_mr&''' and tanggal>='''&format(RI_HR:Tanggal_Masuk,@d10)&''' order by n0_tran desc'
                  LOOP
                     IF Access:APHTRANS.Next()<>level:benign then break.
                     loc::pers_disc = 0
      
                     apdtrans{prop:sql}='select * from dba.apdtrans where n0_tran='''&APH:N0_tran&''''
                     apdtrans{prop:sql}='select * from dba.apdtrans where n0_tran='''&APH:N0_tran&''''
                     LOOP
                        IF Access:APDTRANS.Next()<>level:benign then break.
                        IF APD:Kode_brg = '_Disc'
                           loc::pers_disc = APD:Total / (APD:Total+APH:Biaya)
                           BREAK
                        END
                     END
      
                     apdtrans{prop:sql}='select * from dba.apdtrans where n0_tran='''&APH:N0_tran&''''
                     apdtrans{prop:sql}='select * from dba.apdtrans where n0_tran='''&APH:N0_tran&''''
                     LOOP
                        IF Access:APDTRANS.next()<>level:benign THEN BREAK.
                        IF APD:Jumlah <> 0 AND APD:Kode_brg <> '_Campur' AND APD:Kode_brg <> '_Disc'
                           APKT:Kode_brg = APD:Kode_brg
                           APKT:Nomor_mr = loc::no_mr
                           GET(APkemtmp,APKT:key_no_mr)
                           IF ERRORCODE()= 35
                              APKT:Nomor_mr   = loc::no_mr
                              APKT:Kode_brg   = APD:Kode_brg
                              if APH:Biaya>0 then
                                 APKT:Jumlah     = APD:Jumlah
                              else
                                 APKT:Jumlah     = -APD:Jumlah
                              end
                              APKT:Harga_Dasar= ( 1-loc::pers_disc ) * APD:Total / APD:Jumlah
                              APKT:Harga_Dasar_benar = APD:Harga_Dasar
                              Access:APkemtmp.Insert()
                           ELSE
                              if APH:Biaya>0 then
                                 APKT:Jumlah = APKT:Jumlah + APD:Jumlah
                              else
                                 APKT:Jumlah = APKT:Jumlah - APD:Jumlah
                              end
                              IF APH:Biaya >0
                                 IF APKT:Harga_Dasar > ( 1-loc::pers_disc ) * APD:Total / APD:Jumlah
                                    APKT:Harga_Dasar =  ( 1-loc::pers_disc ) * APD:Total / APD:Jumlah
                                 END
                                 IF APKT:Harga_Dasar_benar > APD:Harga_Dasar
                                    APKT:Harga_Dasar_benar =  APD:Harga_Dasar
                                 END
                              END
                              Access:APkemtmp.Update()
                           END
                        END
                     END
                  END
                  Glo::no_mr=loc::no_mr
               END
            end
         END
      END
      
      
      
    END
  ReturnValue = PARENT.TakeAccepted()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

