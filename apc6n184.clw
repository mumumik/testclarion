

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N184.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N058.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N103.INC'),ONCE        !Req'd for module callout resolution
                     END


Trig_BrowseReturRawatInapPerTransaksi PROCEDURE            ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
VL_NOTA              STRING(10)                            !
loc:nota             STRING(20)                            !
vl_no_urut           SHORT                                 !
vl_nomor             STRING(15)                            !
loc::thread          BYTE                                  !
loc::simpan          STRING(15)                            !nomor transaksi
Nomor_mr_APH         LONG                                  !Nomor Medical record pasien
Biaya_APH            REAL                                  !Total Biaya Pembelian
Asal_APH             STRING(10)                            !Kode darimana resep berasal
Kode_brg             STRING(10),DIM(50)                    !Kode Barang
Jumlah               REAL,DIM(50)                          !Jumlah
J_potong             REAL,DIM(50)                          !Jumlah yang dipotong ke tabel obat
Total                REAL,DIM(50)                          !Total harga barang / item
Camp                 ULONG,DIM(50)                         !
Harga_Dasar          REAL,DIM(50)                          !Harga Dasar
Kode_brg_apd         STRING(10),DIM(50)                    !Kode Barang
Jumlah_apd           REAL,DIM(50)                          !Jumlah
Total_apd            REAL,DIM(50)                          !Total harga barang / item
Camp_apd             ULONG,DIM(50)                         !
Harga_Dasar_apd      REAL,DIM(50)                          !Harga Dasar
DISKON_APD           REAL,DIM(50)                          !
Alamat               STRING(35)                            !Alamat Pasien
Nama                 STRING(35)                            !Nama pasien
RT                   STRING(3)                             !RT pasien
RW                   STRING(3)                             !RW pasien
Kota                 STRING(20)                            !Kota pasien
putar                ULONG                                 !
FilesOpened          BYTE                                  !
Lunas                STRING(5)                             !
Poliklinik           STRING(1)                             !
LOC::No_transaksi    STRING(15)                            !nomor transaksi
loc::no_tran_lama    STRING(15)                            !nomor transaksi
vl_nip               STRING(7)                             !
vl_kontraktor        STRING(10)                            !
vl_cara_bayar        BYTE                                  !
vl_lama_baru         BYTE                                  !
BRW1::View:Browse    VIEW(APHTRANS)
                       PROJECT(APH:Nomor_mr)
                       PROJECT(APH:Tanggal)
                       PROJECT(APH:Biaya)
                       PROJECT(APH:N0_tran)
                       PROJECT(APH:NoNota)
                       PROJECT(APH:Kode_Apotik)
                       PROJECT(APH:Asal)
                       PROJECT(APH:User)
                       PROJECT(APH:Batal)
                       JOIN(JPas:KeyNomorMr,APH:Nomor_mr)
                         PROJECT(JPas:Nama)
                         PROJECT(JPas:Nomor_mr)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
APH:Nomor_mr           LIKE(APH:Nomor_mr)             !List box control field - type derived from field
JPas:Nama              LIKE(JPas:Nama)                !List box control field - type derived from field
APH:Tanggal            LIKE(APH:Tanggal)              !List box control field - type derived from field
APH:Biaya              LIKE(APH:Biaya)                !List box control field - type derived from field
APH:N0_tran            LIKE(APH:N0_tran)              !List box control field - type derived from field
APH:NoNota             LIKE(APH:NoNota)               !List box control field - type derived from field
APH:Kode_Apotik        LIKE(APH:Kode_Apotik)          !List box control field - type derived from field
APH:Asal               LIKE(APH:Asal)                 !List box control field - type derived from field
APH:User               LIKE(APH:User)                 !List box control field - type derived from field
APH:Batal              LIKE(APH:Batal)                !List box control field - type derived from field
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
APD:N0_tran            LIKE(APD:N0_tran)              !Primary key field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Pembatalan Transaksi Instalasi Farmasi- Rawat Jalan'),AT(,,457,234),FONT('Arial',8,,),CENTER,IMM,HLP('Tran_Poliklinik'),SYSTEM,GRAY,MDI
                       LIST,AT(10,20,435,66),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('49L|FM~Nomor RM~C@N010_@99L|FM~Nama~C@s35@51R(1)|M~Tanggal~C(0)@d06@54R(1)|M~Bia' &|
   'ya~C(0)@n-15.2@64L|M~No. Transaksi~C@s15@47L|M~No Billing~C@s10@25L|M~ Apotik~C@' &|
   's5@44L|M~Asal~@s10@16L|M~User~@s4@12L|M~Batal~@n3@'),FROM(Queue:Browse:1)
                       LIST,AT(10,119,435,87),USE(?List),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('52L|FM~Kode Barang~C@s10@147L|FM~Nama Obat~C@s40@68L|FM~Keterangan~C@s50@62R(14)' &|
   '|M~Jumlah~C(0)@n-12.2@63D(14)|M~Total~C(0)@n-15.2@60D(14)|M~Diskon~C(0)@n-15.2@6' &|
   '0L~Camp~C@n2@'),FROM(Queue:Browse)
                       BUTTON('&Batalkan'),AT(368,91,78,20),USE(?Button9),LEFT,FONT('Times New Roman',10,,FONT:bold),ICON(ICON:Cut)
                       BUTTON('T&ransaksi '),AT(375,0,59,15),USE(?Insert:3),DISABLE,HIDE,LEFT,FONT('Times New Roman',12,COLOR:Blue,FONT:regular)
                       BUTTON('&Select'),AT(279,1,45,14),USE(?Select:2),HIDE
                       BUTTON('&Change'),AT(229,1,45,14),USE(?Change:3),DISABLE,HIDE,DEFAULT
                       BUTTON('&Delete'),AT(179,1,45,14),USE(?Delete:3),DISABLE,HIDE
                       SHEET,AT(5,4,445,111),USE(?CurrentTab)
                         TAB('No. Transaksi [F3]'),USE(?Tab:3),KEY(F3Key)
                           BUTTON('Cetak Detil'),AT(15,91,69,20),USE(?Button8),LEFT,ICON(ICON:Print)
                           PROMPT('No. Transaksi:'),AT(89,96),USE(?APH:N0_tran:Prompt)
                           ENTRY(@s15),AT(139,94,93,13),USE(APH:N0_tran),MSG('nomor transaksi'),TIP('nomor transaksi')
                         END
                         TAB('No Billing'),USE(?Tab2)
                           PROMPT('No Billing:'),AT(13,96),USE(?APH:NoNota:Prompt)
                           ENTRY(@s20),AT(63,94,93,13),USE(loc:nota)
                         END
                       END
                       BUTTON('&Tutup'),AT(360,209,83,22),USE(?Close),LEFT,ICON(ICON:Cross)
                       BUTTON('Help'),AT(329,1,45,14),USE(?Help),HIDE,STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
Open                   PROCEDURE(),DERIVED                 ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  IncrementalLocatorClass               ! Default Locator
BRW1::Sort2:Locator  IncrementalLocatorClass               ! Conditional Locator - choice(?CurrentTab)=2
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW6                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
                     END

BRW6::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::EIPManager     BrowseEIPManager                      ! Browse EIP Manager for Browse using ?Browse:1
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
!Proses Penomoran Otomatis Transaksi
Isi_Nomor Routine
   vl_nomor=''
   display
   loop
      logout(1,nomor_batal)
      if errorcode()=56 then
         cycle.
      !Silahkan diganti ---> 6=Transaksi Apotik Batal
      NOM:No_Urut=6
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 6=Transaksi Apotik Batal
         NOMU:Urut =6
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
        !Silahkan diganti ---> 1=Transaksi Apotik Batal
        NOM1:No_urut=6
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 1=Transaksi Apotik Batal
           NOMU:Urut =6
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
      !Silahkan diganti ---> 6=Transaksi Apotik Batal
      nomor_batal{prop:sql}='delete dba.nomor_batal where No=6'
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 6=Transaksi Apotik Batal
         NOM1:No_urut=6
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
   !APH:N0_tran=vl_nomor
   LOC::No_transaksi=vl_nomor
   display

Batal_Nomor Routine
   !Silahkan diganti ---> 6=Transaksi Apotik Batal
   NOM:No_Urut =6
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=APH:N0_tran
   NOM:Keterangan='Batal Trans Aptk'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 6=Transaksi Apotik Batal
   NOMU:Urut =6
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOMU:Nomor=APH:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   delete(nomoruse)

hapus_nomor_use routine
   NOMU:Urut    =6
   NOMU:Nomor   =LOC::No_transaksi
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
      !Silahkan diganti ---> 6=Transaksi Apotik Batal
      NOM:No_Urut=vl_no_urut
      get(nomor_batal,NOM:NoUrut_NoBatal_FK)
      if not(errorcode()) then
         vl_nomor=clip(NOM:No_Trans)
         display
         !Silahkan diganti ---> 6=Transaksi Apotik Batal
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
        !Silahkan diganti ---> 1=Transaksi Apotik Batal
        NOM1:No_urut=vl_no_urut
        access:nomor_skr.fetch(NOM1:PrimaryKey)
        if not(errorcode()) then
           vl_nomor=NOM1:No_Trans
           !Silahkan diganti ---> 1=Transaksi Apotik Batal
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
      !Silahkan diganti ---> 6=Transaksi Apotik Batal
      nomor_batal{prop:sql}='delete dba.nomor_batal where No='&vl_no_urut
      loop
         logout(1,nomor_skr)
         if errorcode()<>0 then cycle.
         !Silahkan diganti ---> 6=Transaksi Apotik Batal
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
   !APH:N0_tran=vl_nomor
   LOC::No_transaksi=vl_nomor
   display

Batal_Nomor1 Routine
   !Silahkan diganti ---> 6=Transaksi Apotik Batal
   NOM:No_Urut =vl_no_urut
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOM:No_Trans=APH:N0_tran
   NOM:Keterangan='Batal Trans Aptk'
   access:nomor_batal.insert()
   !Silahkan diganti ---> 6=Transaksi Apotik Batal
   NOMU:Urut =vl_no_urut
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   NOMU:Nomor=APH:N0_tran
   access:nomoruse.fetch(NOMU:PrimaryKey)
   delete(nomoruse)

hapus_nomor_use1 routine
   NOMU:Urut    =vl_no_urut
   NOMU:Nomor   =LOC::No_transaksi
   access:nomoruse.fetch(NOMU:PrimaryKey)
   if errorcode()=0 then
      delete(nomoruse)
   end

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
  Access:ISetupAp.Close()
  ! Untuk tambah 2 data di GBarang, yaitu _campur dan _ biaya ( untuk obat campur )
  GBAR:Kode_brg = '_Campur'
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  IF ERRORCODE()
      GBAR:Kode_brg = '_Campur'
      GBAR:Nama_Brg = 'Total Obat Campur'
      Access:GBarang.Insert()
  END
  GBAR:Kode_brg = '_Biaya'
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  IF ERRORCODE()
      GBAR:Kode_brg = '_Biaya'
      GBAR:Nama_Brg = 'Biaya Obat Campur'
      Access:GBarang.Insert()
  END
  ! Untuk transaksi rutine, jika ada discount
  GBAR:Kode_brg = '_Disc'
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  IF ERRORCODE()
      GBAR:Kode_brg = '_Disc'
      GBAR:Nama_Brg = 'Discount'
      Access:GBarang.Insert()
  END
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Trig_BrowseReturRawatInapPerTransaksi')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  loc::thread=glo::mainthreadno
  !POST(EVENT:Disable_BatalTrans,,loc::thread)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  case deformat(sub(clip(GL_entryapotik),3,2),@n2)
     of '01'
        vl_no_urut=31
     of '02'
        vl_no_urut=32
     of '04'
        vl_no_urut=33
     of '06'
        vl_no_urut=34
     of '07'
        vl_no_urut=35
     of '08'
        vl_no_urut=36
  END
  Relate:APDTRANS.Open                                     ! File JTransaksi used by this procedure, so make sure it's RelationManager is open
  Relate:Ano_pakai.Open                                    ! File JTransaksi used by this procedure, so make sure it's RelationManager is open
  Relate:IAP_SET.Open                                      ! File JTransaksi used by this procedure, so make sure it's RelationManager is open
  Relate:JDBILLING.Open                                    ! File JTransaksi used by this procedure, so make sure it's RelationManager is open
  Relate:JDDBILLING.Open                                   ! File JTransaksi used by this procedure, so make sure it's RelationManager is open
  Relate:JHBILLING.Open                                    ! File JTransaksi used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File JTransaksi used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_Batal.Open                                  ! File JTransaksi used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File JTransaksi used by this procedure, so make sure it's RelationManager is open
  Access:ApReLuar.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:APDTcam.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JTransaksi.UseFile                                ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:APHTRANS,SELF) ! Initialize the browse manager
  BRW6.Init(?List,Queue:Browse.ViewPosition,BRW6::View:Browse,Queue:Browse,Relate:APDTRANS,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,APH:nonota_aphtras_key)               ! Add the sort order for APH:nonota_aphtras_key for sort order 1
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort2:Locator.Init(?loc:nota,APH:NoNota,1,BRW1)    ! Initialize the browse locator using ?loc:nota using key: APH:nonota_aphtras_key , APH:NoNota
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon APH:N0_tran for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,APH:by_transaksi) ! Add the sort order for APH:by_transaksi for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?APH:N0_tran,APH:N0_tran,,BRW1) ! Initialize the browse locator using ?APH:N0_tran using key: APH:by_transaksi , APH:N0_tran
  BRW1.AddField(APH:Nomor_mr,BRW1.Q.APH:Nomor_mr)          ! Field APH:Nomor_mr is a hot field or requires assignment from browse
  BRW1.AddField(JPas:Nama,BRW1.Q.JPas:Nama)                ! Field JPas:Nama is a hot field or requires assignment from browse
  BRW1.AddField(APH:Tanggal,BRW1.Q.APH:Tanggal)            ! Field APH:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(APH:Biaya,BRW1.Q.APH:Biaya)                ! Field APH:Biaya is a hot field or requires assignment from browse
  BRW1.AddField(APH:N0_tran,BRW1.Q.APH:N0_tran)            ! Field APH:N0_tran is a hot field or requires assignment from browse
  BRW1.AddField(APH:NoNota,BRW1.Q.APH:NoNota)              ! Field APH:NoNota is a hot field or requires assignment from browse
  BRW1.AddField(APH:Kode_Apotik,BRW1.Q.APH:Kode_Apotik)    ! Field APH:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(APH:Asal,BRW1.Q.APH:Asal)                  ! Field APH:Asal is a hot field or requires assignment from browse
  BRW1.AddField(APH:User,BRW1.Q.APH:User)                  ! Field APH:User is a hot field or requires assignment from browse
  BRW1.AddField(APH:Batal,BRW1.Q.APH:Batal)                ! Field APH:Batal is a hot field or requires assignment from browse
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
  BRW6.AddField(GBAR:Kode_brg,BRW6.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Trig_BrowseReturRawatInapPerTransaksi',QuickWindow) ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW6.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW6.ToolbarItem.HelpButton = ?Help
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APDTRANS.Close
    Relate:Ano_pakai.Close
    Relate:IAP_SET.Close
    Relate:JDBILLING.Close
    Relate:JDDBILLING.Close
    Relate:JHBILLING.Close
    Relate:NomorUse.Close
    Relate:Nomor_Batal.Close
    Relate:Nomor_SKR.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_BrowseReturRawatInapPerTransaksi',QuickWindow) ! Save window data to non-volatile store
  END
  !POST(EVENT:Enable_BatalTrans,,loc::thread)
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
    OF ?Button9
      JPas:Nomor_mr = APH:Nomor_mr
      GET(jpasien,JPas:KeyNomorMr)
      IF ERRORCODE()
         message('Pasien Tidak Ada !')
      else
         ri_hrinap{prop:sql}='select * from dba.ri_hrinap where nomor_mr='&APH:Nomor_mr&' order by nourut desc'
         ri_hrinap{prop:sql}='select * from dba.ri_hrinap where nomor_mr='&APH:Nomor_mr&' order by nourut desc'
         access:ri_hrinap.next()
         glo:nota     =RI_HR:nomortrans
         glo:tglfilter=RI_HR:Tanggal_Masuk
         if glo:nota = ''
              message('Pasien tidak ada dalam daftar rawat inap')
              cycle
         end
      END
      
      
      !message(APH:NoNota)
      JHB:NOMOR=APH:NoNota
      if access:jhbilling.fetch(JHB:KNOMOR)=level:benign then
         !message(JHB:TUTUP)
         if JHB:TUTUP=1 then
            message('Nota sudah ditutup !!!')
            cycle
         end
      end
      
      NOM1:No_urut=1
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
      
      
      IF GL_entryapotik<>APH:Kode_Apotik then
         message('Apotik tidak sama dengan Apotik Transaksi ! Apotik Transaksinya = '&APH:Kode_Apotik&' !')
      else
      !   JDB:NOMOR                    =APH:NoNota
      !   JDB:NOTRAN_INTERNAL          =APH:N0_tran
      !   JDB:KODEJASA                 ='FAR.00001.00.00'
      !   JDB:Status_Batal_Produksi    =0
      !   if access:jdbilling.fetch(JDB:PK1)=level:benign then
      !      if upper(clip(vg_user))<>'ADI' then
      !         if JDB:STATUS_TUTUP=1 then
      !            message('Transaksi ini sudah ada pembayaran, silahkan hubungi Billing !!! ')
      !            cycle
      !         end
      !      end
      !   end
         JTra:No_Nota=APH:NoNota
         access:jtransaksi.fetch(JTra:KeyNoNota)
         if JTra:StatusBatal=1 then
            if upper(clip(vg_user))<>'ADI' then
               message('Anda tidak berhak membatalkan !!!')
               cycle
            end
         end
      
         JHB:NOMOR=APH:NoNota
         if access:jhbilling.fetch(JHB:KNOMOR)=level:benign then
      
            if JHB:TUTUP<>1 then
      
               CASE MESSAGE('Batalkan Transaksi nomor : '&APH:N0_tran&'?','PEMBATALAN TRANSAKSI',ICON:Question,BUTTON:Yes+BUTTON:No,BUTTON:No,1)
      
               OF BUTTON:No                            !    the window is System Modal
                 
               OF BUTTON:Yes
                   glo:tanggalbatal=today()
                   windowtanggalbatal
                   
                   GET(APHTRANS,APH:by_transaksi)
                   IF APH:Batal = 1
                       MESSAGE('DATA '&APH:N0_tran&' Sudah pernah dibatalkan')
                   ELSE
                       loc::no_tran_lama = APH:N0_tran
                       APH:Batal = 1
                       put(APHTRANS)
                       !Isi Nomor Baru
                       do Isi_Nomor
                       APR:N0_tran = loc::no_tran_lama
                       GET(ApReLuar,APR:by_transaksi)
                       IF NOT ERRORCODE()
                           Nama = APR:Nama
                           Alamat = APR:Alamat
                           RT = APR:RT
                           RW = APR:RW
                           Kota = APR:Kota
                           APR:N0_tran = LOC::No_transaksi
                           APR:Nama = Nama
                           APR:Alamat = Alamat
                           APR:RT = RT
                           APR:RW = RW
                           APR:Kota = Kota
                           ADD (ApReLuar)
                       END
                       I# = 1
                       apdtcam{prop:sql}='select * from dba.apdtcam where n0_tran='''&loc::no_tran_lama&''''
                       LOOP
                           IF Access:APDTCAM.next()<>level:benign THEN
                               I# = I# - 1
                               BREAK
                           END
                           Kode_brg[I#] = APD1:Kode_brg
                           Jumlah[I#] = - APD1:Jumlah
                           J_potong[I#] = - APD1:J_potong
                           Total[I#] = - APD1:Total
                           Camp[I#] = APD1:Camp
                           Harga_Dasar[I#] = APD1:Harga_Dasar
                           I# = I# + 1
                       END
                       IF I# > 0
                           LOOP S# = 1 TO I#
                                   APD1:N0_tran = LOC::No_transaksi
                                   APD1:Kode_brg = Kode_brg[S#]
                                   APD1:Jumlah = Jumlah[S#]
                                   APD1:J_potong = J_potong[S#]
                                   APD1:Total = Total[S#]
                                   APD1:Camp = Camp[S#]
                                   APD1:Harga_Dasar = Harga_Dasar[S#]
                                   ADD (APDTcam)
                           END
                       END
                       I# = 1
                       SET( BRW6::View:Browse)
                       LOOP
                           NEXT(BRW6::View:Browse)
                           IF ERRORCODE() THEN
                               I# = I# - 1
                               BREAK
                           END
                           Kode_brg_apd[I#] = APD:Kode_brg
                           Jumlah_apd[I#] = APD:Jumlah
                           Total_apd[I#] = - APD:Total
                           Camp_apd[i#] = APD:Camp
                           Harga_Dasar_apd[I#] = APD:Harga_Dasar
                           DISKON_APD[I#]=-APD:Diskon
                           I# = I# + 1
                       END
      
                       LOOP S# = 1 TO I#
                           APD:N0_tran     =LOC::No_transaksi
                           APD:Kode_brg    =Kode_brg_apd[S#]
                           APD:Jumlah      =Jumlah_apd[S#]
                           APD:Total       =Total_apd[S#]
                           APD:Camp        =Camp_apd[S#]
                           APD:Harga_Dasar =Harga_Dasar_apd[S#]
                           APD:Diskon      =DISKON_APD[S#]
                           ADD (APDTrans)
                       END
      
                       Nomor_mr_APH = APH:Nomor_mr
                       Biaya_APH = - APH:Biaya
                       Asal_APH =  APH:Asal
                       vl_nip=APH:NIP
                       vl_kontraktor=APH:Kontrak
                       vl_lama_baru=APH:LamaBaru
                       vl_cara_bayar=APH:cara_bayar
                       vl_nota      =APH:NoNota
                       !windownota
                       !vl_nota      =glo:nota
      
                       !message(Nomor_mr_APH&' '&clip(LOC::No_transaksi)&' '&Biaya_APH)
                       
                       APH:Nomor_mr           = Nomor_mr_APH
                       APH:Tanggal            = glo:tanggalbatal
                       APH:Biaya              = Biaya_APH
                       APH:N0_tran            = clip(LOC::No_transaksi)
                       APH:User               = Glo:USER_ID
                       APH:Bayar              = 1
                       APH:Ra_jal             = 1
                       APH:Asal               = Asal_APH
                       APH:cara_bayar         = vl_cara_bayar
                       APH:Kode_Apotik        = GL_entryapotik
                       APH:Batal              = 0
                       APH:Diskon             = 0
                       APH:NIP                = vl_nip
                       APH:Kontrak            = vl_kontraktor
                       APH:LamaBaru           = vl_lama_baru
                       APH:dokter             = ''
                       APH:NoNota             = vl_nota
                       APH:Ruang              = ''
                       APH:NoPaket            = 0
                       APH:Racikan            = 0
                       APH:Jam                = clock()
                       APH:NomorEPresribing   = ''
                       APH:Resep              = 0
                       APH:NilaiKontrak       = 0
                       APH:NilaiTunai         = 0
                       APH:NilaiDitagih       = 0
                       APH:NomorReference     = ''
                       if access:APHTRANS.insert()<>level:benign then message(error()).
      
                       !Update Billing
                       JDB:NOMOR            =APH:NoNota
                       JDB:NOTRAN_INTERNAL  =APH:N0_tran
                       JDB:KODEJASA         ='FAR.00001.00.00'
                       JDB:TOTALBIAYA       =APH:Biaya
                       JDB:KETERANGAN       =''
                       JDB:JUMLAH           =1
      !                 if GL_entryapotik='FM04' or GL_entryapotik='FM09' then
      !                    JDB:KODE_BAGIAN      ='FARMASI'
      !                 else
      !                    JDB:KODE_BAGIAN      ='FARPD'
      !                 end
                       JDB:KODE_BAGIAN      =APH:Kode_Apotik
      
                          JDB:Validasi=1
                          JDB:UsrValidasi=Glo:USER_ID
                          JDB:JmValidasi=clock()
                          JDB:TglValidasi=glo:tanggalbatal
      
                       if APH:cara_bayar<>3 then
                          JDB:DTG_JD           =0
                       else
                          if APH:Nomor_mr=99999999 then
                             JDB:DTG_JD           =0
                          else
                             JDB:DTG_JD           =APH:Biaya
                          end
                       end
      
      
      
      !                 if APH:cara_bayar<>3 then
      !                    JDB:Validasi=1
      !                    JDB:UsrValidasi=Glo:User_id
      !                    JDB:JmValidasi=clock()
      !                    JDB:TglValidasi=JTra:Tanggal
      !                 end
      
                       !JDB:TglValidasi      =today()
                       !JDB:JmValidasi       =clock()
      
                       JDB:KoreksiTarif     =0
                       JDB:STATUS_TUTUP     =0
                       JDB:StatusBatal      =0
                       JDB:STATUS_TUTUP     =0
                       JDB:StatusBatal      =0
                       JDB:JUMLAH_BYR       =0
                       JDB:SISA_BYR         =0
                       JDB:NO_PEMBAYARAN    =''
                       JDB:DISCOUNT         =0
                       JDB:BYRSELISIH       =0
                       JDB:JenisPembayaran  =APH:cara_bayar
                       JDB:ValidasiProduksi =1
                       access:jdbilling.insert()
                       JDDB:NOMOR           =APH:NoNota
                       JDDB:NOTRAN_INTERNAL =APH:N0_tran
                       JDDB:KODEJASA        ='FAR.00001.00.00'
                       JDDB:SUBKODEJASA     ='FAR.00001.04.00'
                       JDDB:KETERANGAN      =''
                       JDDB:JUMLAH          =1
                       JDDB:TOTALBIAYA      =APH:Biaya
                       if APH:cara_bayar<>3 then
                          JDDB:DTG_JD           =0
                       else
                          if APH:Nomor_mr=99999999 then
                             JDDB:DTG_JD           =0
                          else
                             JDDB:DTG_JD           =APH:Biaya
                          end
                       end
      
                       access:jddbilling.insert()
                       !glo::no_nota=APH:N0_tran
      
      
      
                       ANOp:Nomor = LOC::No_transaksi
                       Get(Ano_pakai,ANOp:key_isi)
                       DELETE(ANo_Pakai)
                       message('Nomor transaksi pembatalan |'&LOC::No_transaksi)
                       glo::no_nota = LOC::No_transaksi
      !                 PrintBatalRawatJalan
                       do hapus_nomor_use
                   END
               END
            else
               message('Billing sudah ditutup !')
            end
         else
            message('No Billing tidak ada !')
         end
      end
    OF ?Button8
      glo::no_nota=APH:N0_tran
      display
      PrintBatalRawatJalan()
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
    OF ?APH:N0_tran
      select(?Browse:1)
    OF ?loc:nota
      select(?Browse:1)
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
  SELF.EIP &= BRW1::EIPManager                             ! Set the EIP manager
  SELF.AddEditControl(,2)
  SELF.DeleteAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Default+EIPAction:Remain+EIPAction:RetainColumn
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END


BRW1.Open PROCEDURE

  CODE
  IF GLO:LEVEL > 2
      ?Button9{PROP:DISABLE}=TRUE
  END
  PARENT.Open


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


BRW6.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

