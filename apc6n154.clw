

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N154.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N151.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N153.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N155.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N156.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N157.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N158.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N159.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N161.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N163.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N164.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N165.INC'),ONCE        !Req'd for module callout resolution
                     END


WindowProsesHarapanMulia PROCEDURE                         ! Generated from procedure template - Window

QuickWindow          WINDOW('Window'),AT(,,309,224),FONT('MS Sans Serif',8,,FONT:regular),CENTER,IMM,HLP('WindowProsesHarapanMulia'),SYSTEM,GRAY,RESIZE
                       BUTTON('Proses Barang'),AT(12,10,95,14),USE(?Button3)
                       BUTTON('Proses Barang Log.'),AT(111,10,95,14),USE(?Button3:10)
                       BUTTON('Proses Barang Tertinggal'),AT(210,10,95,14),USE(?Button3:11)
                       BUTTON('Proses Dokter'),AT(12,28,95,14),USE(?Button3:2)
                       BUTTON('Proses Dokter Luar'),AT(12,46,95,14),USE(?Button3:3)
                       BUTTON('Proses Kontraktor'),AT(12,64,95,14),USE(?Button3:4)
                       BUTTON('Proses Pasien'),AT(12,81,95,14),USE(?Button3:5)
                       BUTTON('Proses Supplier'),AT(12,99,95,14),USE(?Button3:6)
                       BUTTON('Proses Diagnosa'),AT(12,116,95,14),USE(?Button3:7)
                       BUTTON('Proses Paten'),AT(12,134,95,14),USE(?Button3:8)
                       BUTTON('Proses Stok, FIFO, Kartu FIFO'),AT(12,153,95,14),USE(?Button3:9)
                       BUTTON('&OK'),AT(11,196,49,14),USE(?Ok),FLAT,LEFT,MSG('Accept operation'),TIP('Accept Operation'),ICON('WAOK.ICO')
                       BUTTON('&&Batal'),AT(62,196,49,14),USE(?Cancel),FLAT,LEFT,MSG('Cancel Operation'),TIP('Cancel Operation'),ICON('WACANCEL.ICO')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
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
  GlobalErrors.SetProcedureName('WindowProsesHarapanMulia')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Button3
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Ok,RequestCompleted)                       ! Add the close control to the window amanger
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('WindowProsesHarapanMulia',QuickWindow)     ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('WindowProsesHarapanMulia',QuickWindow)  ! Save window data to non-volatile store
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
    OF ?Button3
      ThisWindow.Update
      START(ProsesBarang, 25000)
      ThisWindow.Reset
    OF ?Button3:10
      ThisWindow.Update
      START(ProsesBarangLog, 25000)
      ThisWindow.Reset
    OF ?Button3:11
      ThisWindow.Update
      START(ProsesBarangTertinggal, 25000)
      ThisWindow.Reset
    OF ?Button3:2
      ThisWindow.Update
      START(ProsesDokter, 25000)
      ThisWindow.Reset
    OF ?Button3:3
      ThisWindow.Update
      START(ProsesDokterLuar, 25000)
      ThisWindow.Reset
    OF ?Button3:4
      ThisWindow.Update
      START(ProsesKontraktor, 25000)
      ThisWindow.Reset
    OF ?Button3:5
      ThisWindow.Update
      START(ProsesPasien, 25000)
      ThisWindow.Reset
    OF ?Button3:6
      ThisWindow.Update
      START(ProsesSupplier, 25000)
      ThisWindow.Reset
    OF ?Button3:7
      ThisWindow.Update
      START(ProsesDiagnosa, 25000)
      ThisWindow.Reset
    OF ?Button3:8
      ThisWindow.Update
      START(ProsesBarangPaten, 25000)
      ThisWindow.Reset
    OF ?Button3:9
      ThisWindow.Update
      START(ProsesIsiStokFIFOKartuSTOK, 25000)
      ThisWindow.Reset
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

