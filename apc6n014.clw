

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N014.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N015.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N049.INC'),ONCE        !Req'd for module callout resolution
                     END


UpdateAAdjust PROCEDURE                                    ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
vl_nomor             STRING(15)                            !
History::AAD:Record  LIKE(AAD:RECORD),THREAD
QuickWindow          WINDOW('Update the AAdjust File'),AT(,,208,216),FONT('Arial',8,,),CENTER,IMM,HLP('UpdateAAdjust'),SYSTEM,GRAY,MDI
                       PROMPT('Nomor:'),AT(13,7),USE(?AAD:Nomor:Prompt)
                       ENTRY(@s20),AT(67,7,68,10),USE(AAD:Nomor),DISABLE
                       PROMPT('Kode Barang:'),AT(13,20),USE(?AAD:Kode_Barang:Prompt)
                       ENTRY(@s10),AT(67,20,44,10),USE(AAD:Kode_Barang)
                       BUTTON('F2'),AT(113,19,12,12),USE(?CallLookup),KEY(F2Key)
                       PROMPT('Jumlah:'),AT(13,34),USE(?AAD:Jumlah:Prompt)
                       ENTRY(@n-12.2),AT(67,34,67,10),USE(AAD:Jumlah),DECIMAL(14)
                       PROMPT('Tanggal:'),AT(13,49),USE(?AAD:Tanggal:Prompt)
                       ENTRY(@d06),AT(67,49,67,10),USE(AAD:Tanggal)
                       PROMPT('Jam:'),AT(13,63),USE(?AAD:Jam:Prompt)
                       ENTRY(@t4),AT(67,63,67,10),USE(AAD:Jam),DISABLE
                       PROMPT('Keterangan:'),AT(13,76),USE(?AAD:Keterangan:Prompt)
                       ENTRY(@s30),AT(67,76,124,10),USE(AAD:Keterangan)
                       PROMPT('Operator:'),AT(13,90),USE(?AAD:Operator:Prompt)
                       ENTRY(@s10),AT(67,90,67,10),USE(AAD:Operator),DISABLE
                       OPTION('Status'),AT(67,103,77,36),USE(AAD:Status),BOXED
                         RADIO('Tambah Stok'),AT(71,113),USE(?AAD:Status:Radio1),VALUE('1')
                         RADIO('Kurang Stok'),AT(71,124),USE(?AAD:Status:Radio2),VALUE('2')
                       END
                       PROMPT('Harga:'),AT(13,144),USE(?AAD:Harga:Prompt)
                       ENTRY(@n-15.2),AT(67,144,67,10),USE(AAD:Harga),DISABLE,DECIMAL(14)
                       OPTION,AT(66,169,105,21),USE(AAD:verifikasi),BOXED
                         RADIO('Sudah'),AT(70,177),USE(?AAD:verifikasi:Radio1),DISABLE,VALUE('1')
                         RADIO('Belum'),AT(117,177),USE(?AAD:verifikasi:Radio2),DISABLE,VALUE('0')
                       END
                       STRING('Verifikasi:'),AT(13,178),USE(?String1)
                       PROMPT('Kode Apotik:'),AT(13,158),USE(?AAD:Kode_Apotik:Prompt)
                       ENTRY(@s5),AT(67,158,40,10),USE(AAD:Kode_Apotik),DISABLE
                       BUTTON('&Selesai'),AT(60,194,45,14),USE(?OK),DISABLE,DEFAULT
                       BUTTON('&Batal'),AT(108,194,45,14),USE(?Cancel)
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
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
Isi_Nomor Routine
   vl_nomor=''
   display
   loop
      logout(1,nomor_batal)
      if errorcode()=56 then
         cycle.
      !Silahkan diganti ---> 2=Transaksi Apotik ke Ruangan
      NOM:No_Urut=16
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 2=Transaksi Apotik ke Ruangan
         !NOMU:Urut =16
         !NOMU:Nomor=vl_nomor
         !add(nomoruse)
         !if errorcode()>0 then
         !   vl_nomor=''
         !   rollback
         !   cycle
         !end
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
        !Silahkan diganti ---> 2=Transaksi Apotik ke Ruangan
        NOM1:No_urut=16
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 2=Transaksi Apotik ke Ruangan
           !NOMU:Urut =16
           !NOMU:Nomor=vl_nomor
           !add(nomoruse)
           !if errorcode()>0 then
           !   rollback
           !   cycle
           !end
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
      !Silahkan diganti ---> 2=Transaksi Apotik ke Ruangan
      nomor_batal{prop:sql}='delete dba.nomor_batal where No=16'
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 2=Transaksi Apotik ke Ruangan
         NOM1:No_urut=16
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
   AAD:Nomor=vl_nomor
   display

Batal_Nomor Routine
   !Silahkan diganti ---> 2=Transaksi Apotik ke Ruangan
   NOM:No_Urut =16
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=AAD:Nomor
   NOM:Keterangan='Koreksi'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 2=Transaksi Apotik ke Ruangan
   !NOMU:Urut =16
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   !NOMU:Nomor=AAD:Nomor
   !access:nomoruse.fetch(NOMU:PrimaryKey)
   !delete(nomoruse)

hapus_nomor_use routine
   NOMU:Urut    =16
   NOMU:Nomor   =AAD:Nomor
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
    ActionMessage = 'Tambah Transaksi'
  OF ChangeRecord
    ActionMessage = 'Ubah Transaksi '
  END
  QuickWindow{Prop:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateAAdjust')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?AAD:Nomor:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(AAD:Record,History::AAD:Record)
  SELF.AddHistoryField(?AAD:Nomor,1)
  SELF.AddHistoryField(?AAD:Kode_Barang,2)
  SELF.AddHistoryField(?AAD:Jumlah,3)
  SELF.AddHistoryField(?AAD:Tanggal,4)
  SELF.AddHistoryField(?AAD:Jam,5)
  SELF.AddHistoryField(?AAD:Keterangan,6)
  SELF.AddHistoryField(?AAD:Operator,7)
  SELF.AddHistoryField(?AAD:Status,8)
  SELF.AddHistoryField(?AAD:Harga,10)
  SELF.AddHistoryField(?AAD:verifikasi,13)
  SELF.AddHistoryField(?AAD:Kode_Apotik,9)
  SELF.AddUpdateFile(Access:AAdjust)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:AAdjust.Open                                      ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Relate:GStokAptk.Open                                    ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_Batal.Open                                  ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:AAdjust
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
  if self.request=1 then
     do isi_nomor
  end
  
  
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateAAdjust',QuickWindow)                ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  !message(AAD:Kode_Barang&' '&GL_entryapotik)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  if self.request=1 and self.response=1 then
     do hapus_nomor_use
  elsif (self.request=1 and self.response=2) or (self.request=3 and self.response=1) then
     do batal_nomor
  end
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAdjust.Close
    Relate:GStokAptk.Close
    Relate:NomorUse.Close
    Relate:Nomor_Batal.Close
    Relate:Nomor_SKR.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateAAdjust',QuickWindow)             ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
    AAD:Status = 1
    AAD:Tanggal = today()
    AAD:Jam = clock()
    AAD:Keterangan = 'Koreksi'
    AAD:Operator = vg_user
    AAD:Kode_Apotik = GL_entryapotik
  PARENT.PrimeFields


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = AAD:Kode_Barang                          ! Assign linking field value
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
    SelectBarang
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
    OF ?AAD:Kode_Barang
      if AAD:Status=2 then
         GSTO:Kode_Apotik    =GL_entryapotik
         GSTO:Kode_Barang    =AAD:Kode_Barang
         if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
            if GSTO:Saldo<AAD:Jumlah then
               message('Barang tidak mencukupi !!!')
               disable(?ok)
               select(?aad:jumlah)
            else
               enable(?ok)
            end
         else
            message('Barang tidak ada !!!')
            disable(?ok)
            select(?aad:jumlah)
         end
         GSTO:Kode_Apotik=GL_entryapotik
         GSTO:Kode_Barang=AAD:Kode_Barang
         if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
            AAD:Harga=GSTO:Harga_Dasar
            display
         end
      
      else
         GSTO:Kode_Apotik=GL_entryapotik
         GSTO:Kode_Barang=AAD:Kode_Barang
         if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
            AAD:Harga=GSTO:Harga_Dasar
            display
         end
         enable(?ok)
      end
      IF AAD:Kode_Barang OR ?AAD:Kode_Barang{Prop:Req}
        GBAR:Kode_brg = AAD:Kode_Barang
        IF Access:GBarang.TryFetch(GBAR:KeyKodeBrg)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            AAD:Kode_Barang = GBAR:Kode_brg
          ELSE
            SELECT(?AAD:Kode_Barang)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      GBAR:Kode_brg = AAD:Kode_Barang
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        AAD:Kode_Barang = GBAR:Kode_brg
      END
      ThisWindow.Reset(1)
      if AAD:Status=2 then
         GSTO:Kode_Apotik    =GL_entryapotik
         GSTO:Kode_Barang    =AAD:Kode_Barang
         if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
            if GSTO:Saldo<AAD:Jumlah then
               message('Barang tidak mencukupi !!!')
               disable(?ok)
               select(?aad:jumlah)
            else
               enable(?ok)
            end
         else
            message('Barang tidak ada !!!')
            disable(?ok)
            select(?aad:jumlah)
         end
            GSTO:Kode_Apotik=GL_entryapotik
         GSTO:Kode_Barang=AAD:Kode_Barang
         if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
            AAD:Harga=GSTO:Harga_Dasar
            display
         end
      
      else
            GSTO:Kode_Apotik=GL_entryapotik
         GSTO:Kode_Barang=AAD:Kode_Barang
         if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
            AAD:Harga=GSTO:Harga_Dasar
            display
         end
      
         enable(?ok)
      end
    OF ?AAD:Jumlah
      if AAD:Status=2 then
         GSTO:Kode_Apotik    =GL_entryapotik
         GSTO:Kode_Barang    =AAD:Kode_Barang
         if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
            !message(GSTO:Saldo&' '&AAD:Jumlah)
            if GSTO:Saldo<AAD:Jumlah then
               message('Barang tidak mencukupi !!!')
               disable(?ok)
               select(?aad:jumlah)
            else
               enable(?ok)
            end
         else
            message('Barang tidak ada !!!')
            disable(?ok)
            select(?aad:jumlah)
         end
         GSTO:Kode_Apotik=GL_entryapotik
         GSTO:Kode_Barang=AAD:Kode_Barang
         if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
            AAD:Harga=GSTO:Harga_Dasar
            display
         end
      
      else
         GSTO:Kode_Apotik=GL_entryapotik
         GSTO:Kode_Barang=AAD:Kode_Barang
         if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
            AAD:Harga=GSTO:Harga_Dasar
            display
         end
      
         enable(?ok)
      end
    OF ?AAD:Status
      if AAD:Status=2 then
         GSTO:Kode_Apotik    =GL_entryapotik
         GSTO:Kode_Barang    =AAD:Kode_Barang
         if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
            if GSTO:Saldo<AAD:Jumlah then
               message('Barang tidak mencukupi !!!')
               disable(?ok)
               select(?aad:jumlah)
            else
               enable(?ok)
            end
         else
            message('Barang tidak ada !!!')
            disable(?ok)
            select(?aad:jumlah)
         end
            GSTO:Kode_Apotik=GL_entryapotik
         GSTO:Kode_Barang=AAD:Kode_Barang
         if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
            AAD:Harga=GSTO:Harga_Dasar
            display
         end
      
      else
            GSTO:Kode_Apotik=GL_entryapotik
         GSTO:Kode_Barang=AAD:Kode_Barang
         if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
            AAD:Harga=GSTO:Harga_Dasar
            display
         end
      
         enable(?ok)
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
    OF EVENT:OpenWindow
      if self.request=2 then
       disable(?AAD:Kode_Barang)
       disable(?CallLookup)
       disable(?AAD:Jumlah)
       disable(?AAD:Tanggal)
       disable(?AAD:Keterangan)
       disable(?AAD:Status:Radio1)
       disable(?AAD:Status:Radio2)
       enable(?AAD:verifikasi:Radio1)
       enable(?AAD:verifikasi:Radio2)
       enable(?OK)
      end
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

BrowseAdjust PROCEDURE                                     ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(AAdjust)
                       PROJECT(AAD:Nomor)
                       PROJECT(AAD:verifikasi)
                       PROJECT(AAD:Kode_Barang)
                       PROJECT(AAD:Jumlah)
                       PROJECT(AAD:Tanggal)
                       PROJECT(AAD:Jam)
                       PROJECT(AAD:Keterangan)
                       PROJECT(AAD:Operator)
                       PROJECT(AAD:Status)
                       PROJECT(AAD:Kode_Apotik)
                       JOIN(GBAR:KeyKodeBrg,AAD:Kode_Barang)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Ket2)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
AAD:Nomor              LIKE(AAD:Nomor)                !List box control field - type derived from field
AAD:verifikasi         LIKE(AAD:verifikasi)           !List box control field - type derived from field
AAD:Kode_Barang        LIKE(AAD:Kode_Barang)          !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Ket2              LIKE(GBAR:Ket2)                !List box control field - type derived from field
AAD:Jumlah             LIKE(AAD:Jumlah)               !List box control field - type derived from field
AAD:Tanggal            LIKE(AAD:Tanggal)              !List box control field - type derived from field
AAD:Jam                LIKE(AAD:Jam)                  !List box control field - type derived from field
AAD:Keterangan         LIKE(AAD:Keterangan)           !List box control field - type derived from field
AAD:Operator           LIKE(AAD:Operator)             !List box control field - type derived from field
AAD:Status             LIKE(AAD:Status)               !List box control field - type derived from field
AAD:Kode_Apotik        LIKE(AAD:Kode_Apotik)          !List box control field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Koreksi Stok'),AT(,,420,240),FONT('Arial',8,,),CENTER,IMM,HLP('BrowseAdjust'),SYSTEM,GRAY,MDI
                       LIST,AT(8,19,405,178),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('85L(2)|M~Nomor~@s20@35L(2)|M~Verifikasi~@n3@48L(2)|M~Kode Barang~@s10@95L(2)|M~N' &|
   'ama Obat~@s40@67L(2)|M~Keterangan~@s50@44D(16)|M~Jumlah~C(0)@n10.2@49R(2)|M~Tang' &|
   'gal~C(0)@d06@34R(2)|M~Jam~C(0)@t4@80L(2)|M~Keterangan~@s30@44L(2)|M~Operator~@s1' &|
   '0@28R(2)|M~Status~C(0)@n3@48L(2)|M~Kode Apotik~@s5@'),FROM(Queue:Browse:1)
                       BUTTON('&Tambah (+)'),AT(207,201,45,14),USE(?Insert:2),KEY(PlusKey)
                       BUTTON('&Verifikasi'),AT(256,201,45,14),USE(?Change:2)
                       BUTTON('&Hapus (Del)'),AT(305,201,45,14),USE(?Delete:2),DISABLE,HIDE,KEY(DeleteKey)
                       STRING('Verifikasi : '),AT(8,220),USE(?String1),FONT('Times New Roman',10,,,CHARSET:ANSI)
                       STRING('0 = Belum / Tidak Diverifikasi'),AT(50,220),USE(?String2),FONT('Times New Roman',10,,,CHARSET:ANSI)
                       SHEET,AT(4,2,413,218),USE(?CurrentTab)
                         TAB('Nomor (F2)'),USE(?Tab:2),KEY(F2Key)
                           PROMPT('Nomor:'),AT(11,203),USE(?AAD:Nomor:Prompt)
                           ENTRY(@s10),AT(61,203,60,10),USE(AAD:Nomor)
                         END
                         TAB('Kode Barang (F3)'),USE(?Tab:3),KEY(F3Key)
                           PROMPT('Kode Barang:'),AT(11,205),USE(?AAD:Kode_Barang:Prompt)
                           ENTRY(@s10),AT(61,205,60,10),USE(AAD:Kode_Barang)
                         END
                       END
                       BUTTON('&Selesai'),AT(207,224,45,14),USE(?Close),DEFAULT
                       STRING('1 = Sudah Diverifikasi'),AT(50,229),USE(?String3),FONT('Times New Roman',10,,,CHARSET:ANSI)
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
  GlobalErrors.SetProcedureName('BrowseAdjust')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  BIND('VG_TANGGAL1',VG_TANGGAL1)                          ! Added by: BrowseBox(ABC)
  BIND('VG_TANGGAL2',VG_TANGGAL2)                          ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  WindowTanggal()
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:AAdjust.Open                                      ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_Batal.Open                                  ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:AAdjust,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,AAD:GBarang_GAdjusment_Key)           ! Add the sort order for AAD:GBarang_GAdjusment_Key for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?AAD:Kode_Barang,AAD:Kode_Barang,,BRW1) ! Initialize the browse locator using ?AAD:Kode_Barang using key: AAD:GBarang_GAdjusment_Key , AAD:Kode_Barang
  BRW1.SetFilter('(AAD:Kode_Apotik=GL_entryapotik)')       ! Apply filter expression to browse
  BRW1.AddSortOrder(,AAD:PrimaryKey)                       ! Add the sort order for AAD:PrimaryKey for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?AAD:Nomor,AAD:Nomor,,BRW1)     ! Initialize the browse locator using ?AAD:Nomor using key: AAD:PrimaryKey , AAD:Nomor
  BRW1.SetFilter('(AAD:Kode_Apotik=GL_entryapotik and AAD:Tanggal >= VG_TANGGAL1 and AAD:Tanggal <<= VG_TANGGAL2)') ! Apply filter expression to browse
  BRW1.AddField(AAD:Nomor,BRW1.Q.AAD:Nomor)                ! Field AAD:Nomor is a hot field or requires assignment from browse
  BRW1.AddField(AAD:verifikasi,BRW1.Q.AAD:verifikasi)      ! Field AAD:verifikasi is a hot field or requires assignment from browse
  BRW1.AddField(AAD:Kode_Barang,BRW1.Q.AAD:Kode_Barang)    ! Field AAD:Kode_Barang is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Nama_Brg,BRW1.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Ket2,BRW1.Q.GBAR:Ket2)                ! Field GBAR:Ket2 is a hot field or requires assignment from browse
  BRW1.AddField(AAD:Jumlah,BRW1.Q.AAD:Jumlah)              ! Field AAD:Jumlah is a hot field or requires assignment from browse
  BRW1.AddField(AAD:Tanggal,BRW1.Q.AAD:Tanggal)            ! Field AAD:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(AAD:Jam,BRW1.Q.AAD:Jam)                    ! Field AAD:Jam is a hot field or requires assignment from browse
  BRW1.AddField(AAD:Keterangan,BRW1.Q.AAD:Keterangan)      ! Field AAD:Keterangan is a hot field or requires assignment from browse
  BRW1.AddField(AAD:Operator,BRW1.Q.AAD:Operator)          ! Field AAD:Operator is a hot field or requires assignment from browse
  BRW1.AddField(AAD:Status,BRW1.Q.AAD:Status)              ! Field AAD:Status is a hot field or requires assignment from browse
  BRW1.AddField(AAD:Kode_Apotik,BRW1.Q.AAD:Kode_Apotik)    ! Field AAD:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GBAR:Kode_brg,BRW1.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseAdjust',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAdjust.Close
    Relate:NomorUse.Close
    Relate:Nomor_Batal.Close
    Relate:Nomor_SKR.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseAdjust',QuickWindow)              ! Save window data to non-volatile store
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
    UpdateAAdjust
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
    OF ?Insert:2
      NOM1:No_urut=16
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
      
      
      if GLO:LEVEL>1 then
         message('Anda tidak diijinkan untuk mengoreksi data !!!')
         cycle
      end
    OF ?Change:2
      if Glo:Bagian = 'SIM' and AAD:verifikasi = 0 then
      
      else
          message('Anda tidak diijinkan untuk melakukan verifikasi!')
          cycle
      end
    OF ?Delete:2
      cycle
    END
  ReturnValue = PARENT.TakeAccepted()
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
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:2
    SELF.ChangeControl=?Change:2
    SELF.DeleteControl=?Delete:2
  END


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

BrowseSearchMR PROCEDURE                                   ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
vl_tanggal           DATE                                  !
BRW1::View:Browse    VIEW(JPasien)
                       PROJECT(JPas:Nama)
                       PROJECT(JPas:Nomor_mr)
                       JOIN(JTra:KeyNomorMr,JPas:Nomor_mr)
                         PROJECT(JTra:Nomor_Mr)
                         PROJECT(JTra:No_Nota)
                         PROJECT(JTra:Tanggal)
                         PROJECT(JTra:Baru_Lama)
                         PROJECT(JTra:Kode_poli)
                         PROJECT(JTra:Kode_dokter)
                         PROJECT(JTra:BiayaRSI)
                         PROJECT(JTra:BiayaDokter)
                         PROJECT(JTra:BiayaTotal)
                         PROJECT(JTra:Kode_Transaksi)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
JTra:Nomor_Mr          LIKE(JTra:Nomor_Mr)            !List box control field - type derived from field
JTra:No_Nota           LIKE(JTra:No_Nota)             !List box control field - type derived from field
JPas:Nama              LIKE(JPas:Nama)                !List box control field - type derived from field
JTra:Tanggal           LIKE(JTra:Tanggal)             !List box control field - type derived from field
JTra:Baru_Lama         LIKE(JTra:Baru_Lama)           !List box control field - type derived from field
JTra:Kode_poli         LIKE(JTra:Kode_poli)           !List box control field - type derived from field
JTra:Kode_dokter       LIKE(JTra:Kode_dokter)         !List box control field - type derived from field
JTra:BiayaRSI          LIKE(JTra:BiayaRSI)            !List box control field - type derived from field
JTra:BiayaDokter       LIKE(JTra:BiayaDokter)         !List box control field - type derived from field
JTra:BiayaTotal        LIKE(JTra:BiayaTotal)          !List box control field - type derived from field
JTra:Kode_Transaksi    LIKE(JTra:Kode_Transaksi)      !List box control field - type derived from field
JPas:Nomor_mr          LIKE(JPas:Nomor_mr)            !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Cari MR Dafftar Hari Ini'),AT(,,358,251),FONT('Arial',8,,),CENTER,IMM,HLP('BrowseSearchMR'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,342,185),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('54R(2)|M~Nomor Mr~C(0)@N010_@49R(2)|M~No Nota~C(0)@s10@156R(2)|M~Nama~C(0)@s35@5' &|
   '3R(2)|M~Tanggal~C(0)@D06@40L(2)|M~Baru Lama~@s1@44L(2)|M~Kode poli~@s10@48L(2)|M' &|
   '~Kode dokter~@s10@60D(18)|M~Biaya RSI~C(0)@n14.2@60D(12)|M~Biaya Dokter~C(0)@n14' &|
   '.2@60D(14)|M~Biaya Total~C(0)@n14.2@60R(2)|M~Kode Transaksi~C(0)@n1@'),FROM(Queue:Browse:1)
                       SHEET,AT(4,4,350,222),USE(?CurrentTab)
                         TAB('&Nomor MR (F2)'),USE(?Tab:2),KEY(F2Key)
                           PROMPT('&NOMOR MR:'),AT(13,210),USE(?JTra:Nomor_Mr:Prompt)
                           ENTRY(@P##.###.###P),AT(63,210,69,10),USE(JPas:Nomor_mr),RIGHT(1),MSG('Nomor KIUP'),TIP('Nomor KIUP')
                         END
                         TAB('&Nama (F3)'),USE(?Tab2),KEY(F3Key)
                           PROMPT('Nama :'),AT(8,210),USE(?JPas:Nama:Prompt)
                           ENTRY(@s35),AT(39,210,89,10),USE(JPas:Nama),HLP('Nama mendahului gelar'),MSG('Nama pasien'),REQ,CAP
                         END
                       END
                       BUTTON('&Selesai'),AT(305,231,45,14),USE(?Close)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort1:Locator  IncrementalLocatorClass               ! Conditional Locator - choice(?CurrentTab)=2
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
  GlobalErrors.SetProcedureName('BrowseSearchMR')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('vl_Tanggal',vl_Tanggal)                            ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:JPTmpKel.Open                                     ! File JTBayar used by this procedure, so make sure it's RelationManager is open
  Relate:JPasien.Open                                      ! File JTBayar used by this procedure, so make sure it's RelationManager is open
  Access:JTBayar.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  vl_tanggal=today()
  display
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:JPasien,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,JPas:KeyNama)                         ! Add the sort order for JPas:KeyNama for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?JPas:Nama,JPas:Nama,,BRW1)     ! Initialize the browse locator using ?JPas:Nama using key: JPas:KeyNama , JPas:Nama
  BRW1.SetFilter('(jtra:tanggal=vl_Tanggal)')              ! Apply filter expression to browse
  BRW1.AddSortOrder(,JPas:KeyNomorMr)                      ! Add the sort order for JPas:KeyNomorMr for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?JPas:Nomor_mr,JPas:Nomor_mr,,BRW1) ! Initialize the browse locator using ?JPas:Nomor_mr using key: JPas:KeyNomorMr , JPas:Nomor_mr
  BRW1.SetFilter('(jtra:tanggal=vl_Tanggal)')              ! Apply filter expression to browse
  BRW1.AddField(JTra:Nomor_Mr,BRW1.Q.JTra:Nomor_Mr)        ! Field JTra:Nomor_Mr is a hot field or requires assignment from browse
  BRW1.AddField(JTra:No_Nota,BRW1.Q.JTra:No_Nota)          ! Field JTra:No_Nota is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nama,BRW1.Q.JPas:Nama)                ! Field JPas:Nama is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Tanggal,BRW1.Q.JTra:Tanggal)          ! Field JTra:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Baru_Lama,BRW1.Q.JTra:Baru_Lama)      ! Field JTra:Baru_Lama is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Kode_poli,BRW1.Q.JTra:Kode_poli)      ! Field JTra:Kode_poli is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Kode_dokter,BRW1.Q.JTra:Kode_dokter)  ! Field JTra:Kode_dokter is a hot field or requires assignment from browse
  BRW1.AddField(JTra:BiayaRSI,BRW1.Q.JTra:BiayaRSI)        ! Field JTra:BiayaRSI is a hot field or requires assignment from browse
  BRW1.AddField(JTra:BiayaDokter,BRW1.Q.JTra:BiayaDokter)  ! Field JTra:BiayaDokter is a hot field or requires assignment from browse
  BRW1.AddField(JTra:BiayaTotal,BRW1.Q.JTra:BiayaTotal)    ! Field JTra:BiayaTotal is a hot field or requires assignment from browse
  BRW1.AddField(JTra:Kode_Transaksi,BRW1.Q.JTra:Kode_Transaksi) ! Field JTra:Kode_Transaksi is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nomor_mr,BRW1.Q.JPas:Nomor_mr)        ! Field JPas:Nomor_mr is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseSearchMR',QuickWindow)               ! Restore window settings from non-volatile store
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
    Relate:JPTmpKel.Close
    Relate:JPasien.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseSearchMR',QuickWindow)            ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

WindowTanggal121 PROCEDURE                                 ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
Window               WINDOW('Tanggal'),AT(,,185,92),FONT('Arial',8,,FONT:regular),CENTER,GRAY
                       PANEL,AT(3,5,172,62),USE(?Panel1)
                       PROMPT('Dari Tanggal '),AT(25,17),USE(?VG_TANGGAL1:Prompt)
                       ENTRY(@D6-),AT(82,17,60,10),USE(VG_TANGGAL1)
                       PROMPT('Sampai Tanggal'),AT(25,37),USE(?VG_TANGGAL2:Prompt)
                       ENTRY(@d6-),AT(82,37,60,10),USE(VG_TANGGAL2)
                       BUTTON('OK'),AT(32,71,123,14),USE(?OkButton),DEFAULT
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
  GlobalErrors.SetProcedureName('WindowTanggal121')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Panel1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('WindowTanggal121',Window)                  ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('WindowTanggal121',Window)               ! Save window data to non-volatile store
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
    OF ?OkButton
      ThisWindow.Update
      break
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

PrintKArtuFifoQue11 PROCEDURE                              ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
vl_ke                SHORT                                 !
vl_no                LONG                                  !
FilesOpened          BYTE                                  !
vl_hitung            SHORT(0)                              !
loc::datel           DATE                                  !
loc::time            TIME                                  !
loc::total           LONG                                  !
loc::nama_apotik     STRING(30)                            !Nama Apotik
APA                  STRING(20)                            !
vl_bulan             SHORT                                 !
vl_tahun             LONG                                  !
vl_harga_raja        REAL                                  !
vl_harga_ranap_3     REAL                                  !
vl_harga_ranap_12vip REAL                                  !
vl_saldo_akhir       REAL                                  !
vl_debet             REAL                                  !
vl_kredit            REAL                                  !
vl_tanggal           STRING(5000)                          !
vl_jam               STRING(5000)                          !
vl_nomor             STRING(5000)                          !
vl_harga             STRING(5000)                          !
vl_jumlah            STRING(5000)                          !
vl_avi_harga         REAL                                  !
vl_afi_total         REAL                                  !
vl_out_total         STRING(5000)                          !
vl_harga_opname      REAL                                  !
vl_sub_total         REAL                                  !
vl_saldo_awal_jum    REAL                                  !
vl_saldo_awal_harga  REAL                                  !
vl_saldo_awal_total  REAL                                  !
vl_saldo_akhir_jum   REAL                                  !
vl_saldo_akhir_harga REAL                                  !
vl_saldo_akhir_total REAL                                  !
vl_saldo_awal_rp     REAL                                  !
vl_saldo_akhir_rp    REAL                                  !
vl_total_jual        REAL                                  !
vl_tot_fifo          REAL                                  !
vl_tot_jual          REAL                                  !
vl_tot_sisa          REAL                                  !
Process:View         VIEW(FileSql)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(146,1781,11208,5885),PAPER(PAPER:A4),PRE(RPT),FONT('Arial',10,COLOR:Black,),LANDSCAPE,THOUS
                       HEADER,AT(156,292,11219,1490),FONT('Arial',8,,FONT:regular)
                         STRING('KARTU STOK'),AT(42,10,1615,219),TRN,LEFT,FONT(,12,,FONT:bold)
                         STRING('Apotik'),AT(42,208,625,146),USE(?String14),TRN,FONT('Arial',8,,FONT:regular)
                         STRING(':'),AT(708,208,135,146),USE(?String14:2),TRN,FONT('Arial',8,,FONT:regular)
                         STRING(@s5),AT(823,208,427,146),USE(GL_entryapotik)
                         STRING(@s30),AT(1250,208,1927,146),USE(GAPO:Nama_Apotik)
                         BOX,AT(21,1031,11000,458),COLOR(COLOR:Black)
                         STRING('Saldo Awal/Pemasukan'),AT(1292,1052,1365,167),USE(?String10:4),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Pengeluaran'),AT(4792,1052,802,167),USE(?String10:12),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Saldo Akhir'),AT(9854,1052,802,167),USE(?String10:9),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Penyesuaian Harga'),AT(7948,1052,1135,167),USE(?String10:11),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Penjualan'),AT(6917,1052,635,167),USE(?String10:23),TRN,FONT('Arial',8,,FONT:regular)
                         LINE,AT(3313,1031,0,448),USE(?Line5:4),COLOR(COLOR:Black)
                         LINE,AT(9167,1031,0,448),USE(?Line5:3),COLOR(COLOR:Black)
                         LINE,AT(6531,1031,0,448),USE(?Line5:2),COLOR(COLOR:Black)
                         LINE,AT(7854,1031,0,448),USE(?Line5:5),COLOR(COLOR:Black)
                         STRING('Nomor'),AT(792,1281,521,167),USE(?String10:5),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('No.'),AT(73,1146,260,167),USE(?String10:2),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Tanggal'),AT(281,1146,448,167),USE(?String10:3),TRN,FONT('Arial',8,,FONT:regular)
                         LINE,AT(760,1260,10256,0),COLOR(COLOR:Black)
                         STRING('Jumlah'),AT(1646,1281,438,167),USE(?String10:7),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Harga'),AT(2260,1281,344,167),USE(?String10:6),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Total'),AT(3010,1281,281,167),USE(?String10:8),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Tanggal'),AT(3427,1281,417,167),USE(?String10:14),TRN,FONT('Arial',8,,FONT:regular)
                         STRING('Jumlah'),AT(4750,1281,438,167),USE(?String10:15),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Harga'),AT(5344,1281,438,167),USE(?String10:10),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Total'),AT(6042,1281,438,167),USE(?String10:13),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Jumlah'),AT(9229,1292,438,167),USE(?String10:18),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Harga'),AT(9854,1292,438,167),USE(?String10:19),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Total'),AT(10510,1292,438,167),USE(?String10:17),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Harga'),AT(7979,1281,438,167),USE(?String10:21),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Total'),AT(8667,1281,438,167),USE(?String10:20),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Total'),AT(7385,1281,438,167),USE(?String10:25),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Harga'),AT(6698,1281,438,167),USE(?String10:24),TRN,RIGHT,FONT('Arial',8,,FONT:regular)
                         STRING('Nomor'),AT(3906,1281,521,167),USE(?String10:16),TRN,FONT('Arial',8,,FONT:regular)
                         LINE,AT(760,1031,0,458),USE(?Line5),COLOR(COLOR:Black)
                         STRING('Kode'),AT(42,365,625,146),TRN,FONT('Arial',8,,FONT:regular)
                         STRING(':'),AT(708,365,135,146),USE(?String14:3),TRN,FONT('Arial',8,,FONT:regular)
                         STRING(@s40),AT(823,521,2083,146),USE(GBAR:Nama_Brg),TRN
                         STRING('Nama '),AT(42,521,625,146),USE(?String57),TRN,FONT('Arial',8,,FONT:regular)
                         STRING(':'),AT(708,531,135,146),USE(?String14:4),TRN,FONT('Arial',8,,FONT:regular)
                         STRING(@s10),AT(823,365,677,146),USE(GBAR:Kode_brg),TRN
                         STRING('Satuan'),AT(42,688,625,146),USE(?String19),TRN
                         STRING(':'),AT(708,688,135,146),USE(?String14:5),TRN,FONT('Arial',8,,FONT:regular)
                         STRING(@s10),AT(823,688,677,146),USE(GBAR:No_Satuan)
                         STRING('Periode '),AT(42,854,625,146),USE(?String19:2),TRN
                         STRING(':'),AT(708,854,135,146),USE(?String14:6),TRN,FONT('Arial',8,,FONT:regular)
                         STRING(@D06),AT(823,854,615,146),USE(VG_TANGGAL1),LEFT(1)
                         STRING('s.d.'),AT(1490,854,188,146),USE(?String19:3),TRN
                         STRING(@D06),AT(1688,854,615,146),USE(VG_TANGGAL2),TRN,RIGHT(1)
                       END
break1                 BREAK(APA)
detail1                  DETAIL,AT(,,,125),USE(?detail1),FONT('Arial',7,,FONT:regular)
                           STRING(@n12.2B),AT(2010,0,573,125),USE(HargaIn),TRN,RIGHT
                           STRING(@n15.2B),AT(2594,0,708,125),USE(TotalIn),TRN,RIGHT(2)
                           STRING(@n3),AT(73,0,135,125),CNT,RESET(break1),USE(vl_no),TRN,RIGHT(1),FONT('Arial',7,,FONT:regular)
                           STRING(@d06B),AT(240,0,510,125),USE(Tanggal),TRN
                           STRING(@n10.2),AT(9229,0,479,125),USE(vl_saldo_akhir_jum),TRN,RIGHT
                           STRING(@n12.2),AT(9729,0,573,125),USE(vl_saldo_akhir_harga),TRN,RIGHT
                           STRING(@n15.2),AT(10323,0,667,125),USE(vl_saldo_akhir_total),TRN,RIGHT(2)
                           LINE,AT(11021,-10,0,135),USE(?Line8:5),COLOR(COLOR:Black)
                           LINE,AT(31,-10,0,135),USE(?Line8:7),COLOR(COLOR:Black)
                           LINE,AT(771,-10,0,135),USE(?Line8:6),COLOR(COLOR:Black)
                           LINE,AT(9177,-10,0,135),USE(?Line8:4),COLOR(COLOR:Black)
                           LINE,AT(7865,-10,0,135),USE(?Line8:3),COLOR(COLOR:Black)
                           LINE,AT(3323,-10,0,135),USE(?Line8),COLOR(COLOR:Black)
                           STRING(@n10.2B),AT(6615,0,552,125),USE(harga_jual),TRN,RIGHT(14)
                           STRING(@n15.2B),AT(7188,0,667,125),USE(vl_total_jual),TRN,RIGHT(14)
                           STRING(@d06B),AT(3365,0,521,125),USE(Tanggalout),TRN
                           STRING(@s20B),AT(3906,0,802,125),USE(NomorOut),TRN
                           STRING(@n10.2B),AT(4698,0,510,125),USE(JumlahOut),TRN,RIGHT(14)
                           STRING(@n12.2B),AT(5208,0,583,125),USE(HargaOut),TRN,RIGHT
                           STRING(@n15.2B),AT(5792,0,729,125),USE(TotalOut),TRN,RIGHT(2)
                           LINE,AT(6542,-10,0,135),USE(?Line8:2),COLOR(COLOR:Black)
                           STRING(@s20B),AT(813,0,708,125),USE(NomorIn),TRN
                           STRING(@n10.2B),AT(1510,0,510,125),USE(JumlahIn),TRN,RIGHT(14)
                         END
                         FOOTER,AT(0,0,,302)
                           LINE,AT(21,0,11021,0),USE(?Line6),COLOR(COLOR:Black)
                           STRING('Total :'),AT(5271,21,302,125),USE(?String63),TRN,FONT('Arial',8,,FONT:regular)
                           STRING(@n15.2),AT(5583,21,958,125),SUM,RESET(break1),USE(TotalOut,,?TotalOut:2),TRN,RIGHT(2),FONT('Arial',8,,FONT:regular)
                           STRING(@n15.2),AT(6906,21,958,125),SUM,RESET(break1),USE(vl_total_jual,,?vl_total_jual:2),TRN,RIGHT(14),FONT('Arial',8,,FONT:regular)
                         END
                       END
                       FOOTER,AT(104,7708,11385,188)
                         LINE,AT(63,0,11031,0),USE(?LineBawah),HIDE,COLOR(COLOR:Black)
                         STRING('Page xxxxx of xxxxx'),AT(5938,10,1302,208),USE(?PageOfString),FONT('Times New Roman',8,,)
                         STRING('Kartu Stok Instalasi Farmasi'),AT(188,10,1615,208),USE(?String60),TRN,FONT('Arial',8,,FONT:regular+FONT:italic)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Next                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Previewer            PrintPreviewClass                     ! Print Previewer

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
  GlobalErrors.SetProcedureName('PrintKArtuFifoQue11')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  WindowTanggal121()
  ProsesKartuFIFOInQue1()
  ProsesKartuFIFOQue1()
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: Report
  BIND('glo:bulan',glo:bulan)                              ! Added by: Report
  BIND('glo:tahun',glo:tahun)                              ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  vl_saldo_awal_jum=0
  vl_saldo_awal_harga=0
  vl_saldo_awal_total=0
  display
  Relate:AFIFOOUT.SetOpenRelated()
  Relate:AFIFOOUT.Open                                     ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql.Open                                      ! File GBarang used by this procedure, so make sure it's RelationManager is open
  Access:GApotik.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GBarang.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  GBAR:Kode_brg=glo_kode_barang
  access:gbarang.fetch(GBAR:KeyKodeBrg)
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintKArtuFifoQue11',ProgressWindow)       ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisReport.Init(Process:View, Relate:FileSql, ?Progress:PctText, Progress:Thermometer, RECORDS(Glo:QueFifo))
  ThisReport.AddSortOrder()
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report,Previewer)
  ?Progress:UserString{Prop:Text}=''
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom=True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AFIFOOUT.Close
    Relate:FileSql.Close
  END
  IF SELF.Opened
    INIMgr.Update('PrintKArtuFifoQue11',ProgressWindow)    ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Next PROCEDURE

ReturnValue          BYTE,AUTO

Progress BYTE,AUTO
  CODE
      ThisReport.RecordsProcessed+=1
      GET(Glo:QueFifo,ThisReport.RecordsProcessed)
      IF ERRORCODE() THEN
         ReturnValue = Level:Notify
      ELSE
         ReturnValue = Level:Benign
      END
      IF ReturnValue = Level:Notify
          IF ThisReport.RecordsProcessed>RECORDS(Glo:QueFifo)
             SELF.Response = RequestCompleted
             POST(Event:CloseWindow)
             RETURN Level:Notify
          ELSE
             SELF.Response = RequestCancelled
             POST(Event:CloseWindow)
             RETURN Level:Fatal
          END
      ELSE
         Progress = ThisReport.RecordsProcessed / ThisReport.RecordsToProcess*100
         IF Progress > 100 THEN Progress = 100.
         IF Progress <> Progress:Thermometer
           Progress:Thermometer = Progress
           DISPLAY()
         END
      END
      RETURN Level:Benign
  ReturnValue = PARENT.Next()
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  vl_total_jual = JumlahOut * harga_jual
  vl_saldo_akhir_jum  =vl_saldo_awal_jum+Glo:QueFifo.JumlahIn-Glo:QueFifo.JumlahOut
  vl_saldo_akhir_total=vl_saldo_awal_total+(Glo:QueFifo.JumlahIn*Glo:QueFifo.HargaIn)-(Glo:QueFifo.JumlahOut*Glo:QueFifo.HargaOut)
  if vl_saldo_akhir_jum=0 then
     vl_saldo_akhir_harga=0
  else
     vl_saldo_akhir_harga=vl_saldo_akhir_total/vl_saldo_akhir_jum
  end
  ReturnValue = PARENT.TakeRecord()
  settarget(report)
  unhide(?LineBawah)
  settarget
  PRINT(RPT:detail1)
  vl_saldo_awal_jum   =vl_saldo_akhir_jum
  vl_saldo_awal_harga =vl_saldo_akhir_harga
  vl_saldo_awal_total =vl_saldo_akhir_total
  display
  RETURN ReturnValue

