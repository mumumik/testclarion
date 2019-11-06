

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N045.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N142.INC'),ONCE        !Req'd for module callout resolution
                     END


SelectGApotik PROCEDURE                                    ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(GApotik)
                       PROJECT(GAPO:Kode_Apotik)
                       PROJECT(GAPO:Nama_Apotik)
                       PROJECT(GAPO:Keterangan)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GAPO:Kode_Apotik       LIKE(GAPO:Kode_Apotik)         !List box control field - type derived from field
GAPO:Nama_Apotik       LIKE(GAPO:Nama_Apotik)         !List box control field - type derived from field
GAPO:Keterangan        LIKE(GAPO:Keterangan)          !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Data Sub Farmasi'),AT(,,216,170),FONT('Arial',8,,),IMM,HLP('SelectGApotik'),SYSTEM,GRAY,MDI
                       LIST,AT(8,26,200,128),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('48L(2)|M~Kode Sub~@s5@80L(2)|M~Nama SubFarmasi~@s30@80L(2)|M~Keterangan~@s20@'),FROM(Queue:Browse:1)
                       BUTTON('&Select'),AT(163,166,45,14),USE(?Select:2),HIDE
                       SHEET,AT(4,4,208,161),USE(?CurrentTab)
                         TAB('Kode Sub (F2)'),USE(?Tab:2),KEY(F2Key)
                         END
                         TAB('Nama SubFarmasi (F3)'),USE(?Tab:3),KEY(F3Key)
                         END
                       END
                       BUTTON('Close'),AT(118,152,45,14),USE(?Close),HIDE
                       BUTTON('Help'),AT(167,152,45,14),USE(?Help),HIDE,STD(STD:Help)
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
  GlobalErrors.SetProcedureName('SelectGApotik')
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
  Relate:GApotik.SetOpenRelated()
  Relate:GApotik.Open                                      ! File GApotik used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GApotik,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon GAPO:Nama_Apotik for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,GAPO:KeyNama)    ! Add the sort order for GAPO:KeyNama for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,GAPO:Nama_Apotik,1,BRW1)       ! Initialize the browse locator using  using key: GAPO:KeyNama , GAPO:Nama_Apotik
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon GAPO:Kode_Apotik for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,GAPO:KeyNoApotik) ! Add the sort order for GAPO:KeyNoApotik for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,GAPO:Kode_Apotik,1,BRW1)       ! Initialize the browse locator using  using key: GAPO:KeyNoApotik , GAPO:Kode_Apotik
  BRW1.AddField(GAPO:Kode_Apotik,BRW1.Q.GAPO:Kode_Apotik)  ! Field GAPO:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GAPO:Nama_Apotik,BRW1.Q.GAPO:Nama_Apotik)  ! Field GAPO:Nama_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GAPO:Keterangan,BRW1.Q.GAPO:Keterangan)    ! Field GAPO:Keterangan is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('SelectGApotik',QuickWindow)                ! Restore window settings from non-volatile store
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
    Relate:GApotik.Close
  END
  IF SELF.Opened
    INIMgr.Update('SelectGApotik',QuickWindow)             ! Save window data to non-volatile store
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

UpdateApHProd PROCEDURE                                    ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
vl_nomor             STRING(15)                            !
BRW2::View:Browse    VIEW(ApDProd)
                       PROJECT(APDP:Kode_Brg)
                       PROJECT(APDP:Jumlah)
                       PROJECT(APDP:Biaya)
                       PROJECT(APDP:N0_tran)
                       JOIN(GBAR:KeyKodeBrg,APDP:Kode_Brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:No_Satuan)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?Browse:2
APDP:Kode_Brg          LIKE(APDP:Kode_Brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:No_Satuan         LIKE(GBAR:No_Satuan)           !List box control field - type derived from field
APDP:Jumlah            LIKE(APDP:Jumlah)              !List box control field - type derived from field
APDP:Biaya             LIKE(APDP:Biaya)               !List box control field - type derived from field
APDP:N0_tran           LIKE(APDP:N0_tran)             !List box control field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::APHP:Record LIKE(APHP:RECORD),THREAD
QuickWindow          WINDOW('Update the ApHProd File'),AT(,,353,199),FONT('Arial',8,,),CENTER,IMM,HLP('UpdateApHProd'),SYSTEM,GRAY,MDI
                       PROMPT('Nomor:'),AT(8,9),USE(?APHP:N0_tran:Prompt)
                       ENTRY(@s15),AT(61,9,88,10),USE(APHP:N0_tran),DISABLE,MSG('nomor transaksi'),TIP('nomor transaksi')
                       PROMPT('Kode Apotik:'),AT(8,23),USE(?APHP:Kode_Apotik:Prompt)
                       ENTRY(@s5),AT(61,23,40,10),USE(APHP:Kode_Apotik),DISABLE,MSG('Kode Apotik'),TIP('Kode Apotik'),REQ
                       BUTTON('F2'),AT(103,22,12,12),USE(?CallLookup),HIDE,KEY(F2Key)
                       ENTRY(@s30),AT(118,23,93,10),USE(GAPO:Nama_Apotik),DISABLE,MSG('Nama Apotik'),TIP('Nama Apotik')
                       PROMPT('Tanggal:'),AT(8,36),USE(?APHP:Tanggal:Prompt)
                       ENTRY(@D06),AT(61,36,65,10),USE(APHP:Tanggal),DISABLE
                       OPTION,AT(61,49,77,23),USE(APHP:Jenis),BOXED
                         RADIO('OK'),AT(71,58),USE(?APHP:Jenis:Radio1),VALUE('1')
                         RADIO('Batal'),AT(100,58),USE(?APHP:Jenis:Radio2),VALUE('2')
                       END
                       LIST,AT(3,78,346,74),USE(?Browse:2),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('45L(2)|M~Kode Brg~@s10@133L(2)|M~Nama Obat~@s40@40L(2)|M~Satuan~@s10@57R(2)|M~Ju' &|
   'mlah~C(0)@n-14.2@53R(2)|M~Biaya~L@n-14.2@64L(2)|M~N 0 tran~@s15@'),FROM(Queue:Browse:2)
                       BUTTON('&Tambah (+)'),AT(30,158,45,14),USE(?Insert:3),KEY(PlusKey)
                       BUTTON('&Ubah'),AT(79,158,45,14),USE(?Change:3)
                       BUTTON('&Hapus (Del)'),AT(128,158,45,14),USE(?Delete:3),KEY(DeleteKey)
                       BUTTON('&OK'),AT(53,177,45,14),USE(?OK),DEFAULT
                       BUTTON('&Batal'),AT(101,177,45,14),USE(?Cancel)
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
                     END

Toolbar              ToolbarClass
BRW2                 CLASS(BrowseClass)                    ! Browse using ?Browse:2
Q                      &Queue:Browse:2                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
                     END

BRW2::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
!Proses Penomoran Otomatis Transaksi
Isi_Nomor Routine
   vl_nomor=''
   display
   loop
      logout(1,nomor_batal)
      if errorcode()=56 then
         cycle.
      !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
      NOM:No_Urut=12
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
         NOMU:Urut =12
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
        !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
        NOM1:No_urut=12
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
           NOMU:Urut =1
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
      !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
      nomor_batal{prop:sql}='delete dba.nomor_batal where No=12'
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 1=Transaksi Apotik ke pasien Rawat Inap
         NOM1:No_urut=12
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
   APHP:N0_tran=vl_nomor
   display

Batal_Nomor Routine
   !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
   NOM:No_Urut =12
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=APHP:N0_tran
   NOM:Keterangan='Trans Prod. Obat'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
   NOMU:Urut =12
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOMU:Nomor=APHP:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   delete(nomoruse)

hapus_nomor_use routine
   NOMU:Urut    =12
   NOMU:Nomor   =APHP:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   if errorcode()=0 then
      delete(nomoruse)
   end
batal_detil routine
   apdprod{prop:sql}='delete dba.apdprod where n0_tran='''&APHP:N0_tran&''''
   apddprod{prop:sql}='delete dba.apddprod where n0_tran='''&APHP:N0_tran&''''


ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Tambah Transaksi'
  OF ChangeRecord
    GlobalErrors.Throw(Msg:UpdateIllegal)
    RETURN
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateApHProd')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APHP:N0_tran:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APHP:Record,History::APHP:Record)
  SELF.AddHistoryField(?APHP:N0_tran,1)
  SELF.AddHistoryField(?APHP:Kode_Apotik,2)
  SELF.AddHistoryField(?APHP:Tanggal,3)
  SELF.AddHistoryField(?APHP:Jenis,6)
  SELF.AddUpdateFile(Access:ApHProd)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:ApDDProd.Open                                     ! File ApDDProd used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File ApDDProd used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_Batal.Open                                  ! File ApDDProd used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File ApDDProd used by this procedure, so make sure it's RelationManager is open
  Access:ApHProd.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:ApHProd
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:None                        ! Changes not allowed
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  BRW2.Init(?Browse:2,Queue:Browse:2.ViewPosition,BRW2::View:Browse,Queue:Browse:2,Relate:ApDProd,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  if self.request=1 then
     do isi_nomor
  end
  ?Browse:2{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW2.Q &= Queue:Browse:2
  BRW2.AddSortOrder(,APDP:key_no_nota)                     ! Add the sort order for APDP:key_no_nota for sort order 1
  BRW2.AddRange(APDP:N0_tran,Relate:ApDProd,Relate:ApHProd) ! Add file relationship range limit for sort order 1
  BRW2.AddLocator(BRW2::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW2::Sort0:Locator.Init(,APDP:Kode_Brg,1,BRW2)          ! Initialize the browse locator using  using key: APDP:key_no_nota , APDP:Kode_Brg
  BRW2.AddField(APDP:Kode_Brg,BRW2.Q.APDP:Kode_Brg)        ! Field APDP:Kode_Brg is a hot field or requires assignment from browse
  BRW2.AddField(GBAR:Nama_Brg,BRW2.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW2.AddField(GBAR:No_Satuan,BRW2.Q.GBAR:No_Satuan)      ! Field GBAR:No_Satuan is a hot field or requires assignment from browse
  BRW2.AddField(APDP:Jumlah,BRW2.Q.APDP:Jumlah)            ! Field APDP:Jumlah is a hot field or requires assignment from browse
  BRW2.AddField(APDP:Biaya,BRW2.Q.APDP:Biaya)              ! Field APDP:Biaya is a hot field or requires assignment from browse
  BRW2.AddField(APDP:N0_tran,BRW2.Q.APDP:N0_tran)          ! Field APDP:N0_tran is a hot field or requires assignment from browse
  BRW2.AddField(GBAR:Kode_brg,BRW2.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateApHProd',QuickWindow)                ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW2.AskProcedure = 2
  SELF.AddItem(ToolbarForm)
  BRW2.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  if (self.request=1 and self.response=2) or (self.request=3 and self.response=1) then
     do batal_nomor
     do batal_detil
  end
  if (self.request=1 and self.response=1) then
     !message('test1')
     do hapus_nomor_use
     !message('test2')
     glo::nomor=APDP:N0_tran
     !message('test3')
     !display
     PrintProduksiObat1
     !message('test4')
  end
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ApDDProd.Close
    Relate:NomorUse.Close
    Relate:Nomor_Batal.Close
    Relate:Nomor_SKR.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateApHProd',QuickWindow)             ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
    APHP:Tanggal = today()
    APHP:User = glo:user_id
    APHP:Jenis = 1
    APHP:Kode_Apotik = GL_entryapotik
  PARENT.PrimeFields


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  GAPO:Kode_Apotik = APHP:Kode_Apotik                      ! Assign linking field value
  Access:GApotik.Fetch(GAPO:KeyNoApotik)
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
      SelectGApotik
      UpdateApDProd
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?APHP:Kode_Apotik
      IF APHP:Kode_Apotik OR ?APHP:Kode_Apotik{Prop:Req}
        GAPO:Kode_Apotik = APHP:Kode_Apotik
        IF Access:GApotik.TryFetch(GAPO:KeyNoApotik)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            APHP:Kode_Apotik = GAPO:Kode_Apotik
          ELSE
            SELECT(?APHP:Kode_Apotik)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      GAPO:Kode_Apotik = APHP:Kode_Apotik
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        APHP:Kode_Apotik = GAPO:Kode_Apotik
      END
      ThisWindow.Reset(1)
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

UpdateApDProd PROCEDURE                                    ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
BRW2::View:Browse    VIEW(ApDDProd)
                       PROJECT(APDDP:Kode_Asal)
                       PROJECT(APDDP:Jumlah)
                       PROJECT(APDDP:Biaya)
                       PROJECT(APDDP:N0_tran)
                       PROJECT(APDDP:Kode_Brg)
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?Browse:2
APDDP:Kode_Asal        LIKE(APDDP:Kode_Asal)          !List box control field - type derived from field
APDDP:Jumlah           LIKE(APDDP:Jumlah)             !List box control field - type derived from field
APDDP:Biaya            LIKE(APDDP:Biaya)              !List box control field - type derived from field
APDDP:N0_tran          LIKE(APDDP:N0_tran)            !List box control field - type derived from field
APDDP:Kode_Brg         LIKE(APDDP:Kode_Brg)           !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
History::APDP:Record LIKE(APDP:RECORD),THREAD
QuickWindow          WINDOW('Update the ApDProd File'),AT(,,187,217),FONT('Arial',8,,),CENTER,IMM,HLP('UpdateApDProd'),SYSTEM,GRAY,MDI
                       PROMPT('N0 tran:'),AT(16,7),USE(?APDP:N0_tran:Prompt)
                       ENTRY(@s15),AT(70,7,64,10),USE(APDP:N0_tran),DISABLE,MSG('nomor transaksi'),TIP('nomor transaksi')
                       PROMPT('Kode Brg:'),AT(16,21),USE(?APDP:Kode_Brg:Prompt)
                       ENTRY(@s10),AT(70,21,64,10),USE(APDP:Kode_Brg),DISABLE
                       BUTTON('F2'),AT(136,20,12,12),USE(?CallLookup),KEY(F2Key)
                       ENTRY(@s40),AT(70,35,93,10),USE(GBAR:Nama_Brg),DISABLE,MSG('Nama Barang'),TIP('Nama Barang')
                       PROMPT('Jumlah:'),AT(15,49),USE(?APDP:Jumlah:Prompt)
                       ENTRY(@n-14.2),AT(70,49,64,10),USE(APDP:Jumlah),RIGHT(1)
                       PROMPT('Biaya:'),AT(15,64),USE(?APDP:Biaya:Prompt)
                       ENTRY(@n-14.2),AT(70,64,64,10),USE(APDP:Biaya),DISABLE,RIGHT(1)
                       LIST,AT(7,87,169,89),USE(?Browse:2),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('44L(2)|M~Kode Asal~@s10@53R(2)|M~Jumlah~C(0)@n-14.2@56R(2)|M~Biaya~C(0)@n-14.2@6' &|
   '4L(2)|M~N 0 tran~@s15@44L(2)|M~Kode Brg~@s10@'),FROM(Queue:Browse:2)
                       BUTTON('&Tambah (+)'),AT(16,181,45,14),USE(?Insert:3),KEY(PlusKey)
                       BUTTON('&Ubah'),AT(64,181,45,14),USE(?Change:3)
                       BUTTON('&Hapus (Del)'),AT(111,181,45,14),USE(?Delete:3),KEY(DeleteKey)
                       BUTTON('&OK'),AT(16,200,45,14),USE(?OK),DEFAULT
                       BUTTON('&Batal'),AT(137,201,45,14),USE(?Batal),DISABLE,HIDE
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
BRW2                 CLASS(BrowseClass)                    ! Browse using ?Browse:2
Q                      &Queue:Browse:2                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
                     END

BRW2::Sort0:Locator  StepLocatorClass                      ! Default Locator
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
    ActionMessage = 'Tambah Obat Tujuan'
  OF ChangeRecord
    ActionMessage = 'Ubah Obat Tujuan'
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateApDProd')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APDP:N0_tran:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APDP:Record,History::APDP:Record)
  SELF.AddHistoryField(?APDP:N0_tran,1)
  SELF.AddHistoryField(?APDP:Kode_Brg,2)
  SELF.AddHistoryField(?APDP:Jumlah,3)
  SELF.AddHistoryField(?APDP:Biaya,4)
  SELF.AddUpdateFile(Access:ApDProd)
  SELF.AddItem(?Batal,RequestCancelled)                    ! Add the cancel control to the window manager
  Relate:ApDDProd.Open                                     ! File ApObInst used by this procedure, so make sure it's RelationManager is open
  Access:ApDProd.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ApHProd.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ApObInst.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:ApDProd
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
  BRW2.Init(?Browse:2,Queue:Browse:2.ViewPosition,BRW2::View:Browse,Queue:Browse:2,Relate:ApDDProd,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:2{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW2.Q &= Queue:Browse:2
  BRW2.AddSortOrder(,APDDP:key_no_nota)                    ! Add the sort order for APDDP:key_no_nota for sort order 1
  BRW2.AddRange(APDDP:Kode_Brg,Relate:ApDDProd,Relate:ApDProd) ! Add file relationship range limit for sort order 1
  BRW2.AddLocator(BRW2::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW2::Sort0:Locator.Init(,APDDP:Kode_Asal,1,BRW2)        ! Initialize the browse locator using  using key: APDDP:key_no_nota , APDDP:Kode_Asal
  BRW2.AddField(APDDP:Kode_Asal,BRW2.Q.APDDP:Kode_Asal)    ! Field APDDP:Kode_Asal is a hot field or requires assignment from browse
  BRW2.AddField(APDDP:Jumlah,BRW2.Q.APDDP:Jumlah)          ! Field APDDP:Jumlah is a hot field or requires assignment from browse
  BRW2.AddField(APDDP:Biaya,BRW2.Q.APDDP:Biaya)            ! Field APDDP:Biaya is a hot field or requires assignment from browse
  BRW2.AddField(APDDP:N0_tran,BRW2.Q.APDDP:N0_tran)        ! Field APDDP:N0_tran is a hot field or requires assignment from browse
  BRW2.AddField(APDDP:Kode_Brg,BRW2.Q.APDDP:Kode_Brg)      ! Field APDDP:Kode_Brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateApDProd',QuickWindow)                ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW2.AskProcedure = 2
  SELF.AddItem(ToolbarForm)
  BRW2.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ApDDProd.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateApDProd',QuickWindow)             ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = APDP:Kode_Brg                            ! Assign linking field value
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
    EXECUTE Number
      SelectGBarang
      UpdateApDDProd
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?APDP:Kode_Brg
      IF APDP:Kode_Brg OR ?APDP:Kode_Brg{Prop:Req}
        GBAR:Kode_brg = APDP:Kode_Brg
        IF Access:GBarang.TryFetch(GBAR:KeyKodeBrg)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            APDP:Kode_Brg = GBAR:Kode_brg
          ELSE
            SELECT(?APDP:Kode_Brg)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      GBAR:Kode_brg = APDP:Kode_Brg
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        APDP:Kode_Brg = GBAR:Kode_brg
      END
      ThisWindow.Reset(1)
    OF ?APDP:Jumlah
      GSTO:Kode_Apotik =APHP:Kode_Apotik
      GSTO:Kode_Barang =APDP:Kode_Brg
      if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
         APDP:Biaya=APDP:Jumlah*GSTO:Harga_Dasar
      else
         message('Harga Gak Ada !!!')
      end
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

UpdateApDDProd PROCEDURE                                   ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
History::APDDP:Record LIKE(APDDP:RECORD),THREAD
QuickWindow          WINDOW('Update the ApDDProd File'),AT(,,197,139),FONT('Arial',8,,),CENTER,IMM,HLP('UpdateApDDProd'),SYSTEM,GRAY,MDI
                       PROMPT('Nomor:'),AT(9,15),USE(?APDDP:N0_tran:Prompt)
                       ENTRY(@s15),AT(61,15,64,10),USE(APDDP:N0_tran),DISABLE,MSG('nomor transaksi'),TIP('nomor transaksi')
                       PROMPT('Kode Tujuan:'),AT(9,29),USE(?APDDP:Kode_Brg:Prompt)
                       ENTRY(@s10),AT(61,29,64,10),USE(APDDP:Kode_Brg),DISABLE
                       PROMPT('Kode Asal:'),AT(9,43),USE(?APDDP:Kode_Asal:Prompt)
                       ENTRY(@s10),AT(61,43,44,10),USE(APDDP:Kode_Asal),DISABLE
                       BUTTON('F2'),AT(107,42,12,12),USE(?CallLookup),KEY(F2Key)
                       ENTRY(@s40),AT(61,57,125,10),USE(GBAR:Nama_Brg),DISABLE,MSG('Nama Barang'),TIP('Nama Barang')
                       ENTRY(@s10),AT(61,72,64,10),USE(GBAR:No_Satuan),DISABLE,MSG('No Satuan'),TIP('No Satuan')
                       PROMPT('Jumlah:'),AT(9,87),USE(?APDDP:Jumlah:Prompt)
                       ENTRY(@n-14.2),AT(61,87,64,10),USE(APDDP:Jumlah),RIGHT(1)
                       PROMPT('Biaya:'),AT(9,102),USE(?APDDP:Biaya:Prompt)
                       ENTRY(@n-14.2),AT(61,102,64,10),USE(APDDP:Biaya),DISABLE,RIGHT(1)
                       BUTTON('&OK'),AT(29,120,45,14),USE(?OK),DEFAULT
                       BUTTON('&Batal'),AT(78,120,45,14),USE(?Cancel)
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
    ActionMessage = 'Tambah Obat Asal'
  OF ChangeRecord
    ActionMessage = 'Tambah Obat Asal'
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateApDDProd')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?APDDP:N0_tran:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(APDDP:Record,History::APDDP:Record)
  SELF.AddHistoryField(?APDDP:N0_tran,1)
  SELF.AddHistoryField(?APDDP:Kode_Brg,2)
  SELF.AddHistoryField(?APDDP:Kode_Asal,3)
  SELF.AddHistoryField(?APDDP:Jumlah,4)
  SELF.AddHistoryField(?APDDP:Biaya,5)
  SELF.AddUpdateFile(Access:ApDDProd)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:ApDDProd.Open                                     ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Access:ApHProd.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:ApDDProd
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
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateApDDProd',QuickWindow)               ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ApDDProd.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateApDDProd',QuickWindow)            ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = APDDP:Kode_Asal                          ! Assign linking field value
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
    SelectGBarang
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
    OF ?CallLookup
      APDDP:Jumlah=0
      display
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?APDDP:Kode_Asal
      IF APDDP:Kode_Asal OR ?APDDP:Kode_Asal{Prop:Req}
        GBAR:Kode_brg = APDDP:Kode_Asal
        IF Access:GBarang.TryFetch(GBAR:KeyKodeBrg)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            APDDP:Kode_Asal = GBAR:Kode_brg
          ELSE
            SELECT(?APDDP:Kode_Asal)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      GBAR:Kode_brg = APDDP:Kode_Asal
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        APDDP:Kode_Asal = GBAR:Kode_brg
      END
      ThisWindow.Reset(1)
    OF ?APDDP:Jumlah
      GSTO:Kode_Apotik =APHP:Kode_Apotik
      GSTO:Kode_Barang =APDDP:Kode_Asal
      if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
         if GSTO:Saldo<APDDP:Jumlah then
            message('jumlah tidak mencukupi !!!')
            APDDP:Jumlah =0
            display
         else
            APDDP:Biaya=APDDP:Jumlah*GSTO:Harga_Dasar
         end
      else
         message('Harga Tidak Ada !!!')
      end                       
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

