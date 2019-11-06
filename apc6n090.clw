

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N090.INC'),ONCE        !Local module procedure declarations
                     END


WindowScanObat PROCEDURE                                   ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
vl_hna               REAL                                  !
loc:mr               STRING(20)                            !
loc:kodeobat         STRING(20)                            !
loc:nama_pasien      STRING(30)                            !
loc:nama_obat        STRING(30)                            !
vl_nomor             STRING(20)                            !
Window               WINDOW('Scan Obat ...'),AT(,,475,256),FONT('Arial',8,,FONT:regular),CENTER,SYSTEM,GRAY
                       PROMPT('MR :'),AT(37,26,71,41),USE(?loc:mr:Prompt),FONT('Arial',36,,FONT:bold)
                       ENTRY(@s20),AT(218,31,200,27),USE(loc:mr)
                       BUTTON('Scan MR'),AT(218,63,200,30),USE(?Button2),FONT('Arial',26,,FONT:bold),DEFAULT
                       STRING(@s30),AT(37,98),USE(loc:nama_pasien),TRN,FONT('Arial',26,,FONT:bold)
                       PROMPT('Kode Obat:'),AT(37,143),USE(?loc:kodeobat:Prompt),FONT('Arial',36,,FONT:bold)
                       ENTRY(@s20),AT(218,149,200,27),USE(loc:kodeobat),DECIMAL(14)
                       STRING(@s30),AT(37,217),USE(loc:nama_obat),TRN,FONT('Arial',26,,FONT:bold)
                       BUTTON('Scan Obat/Alkes'),AT(218,182,200,30),USE(?OkButton),HIDE,FONT('Arial',26,,FONT:bold)
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
!Proses Penomoran Otomatis Transaksi
Isi_Nomor Routine
   vl_nomor=''
   display
!   loop
!     logout(69,nomrskr)
!     if errorcode()=56 then cycle.
!     !Silahkan diganti ---> 69=Transaksi Apotik ke Pasien Rawat Inap
     NOM1:No_urut=69
     access:nomor_skr.fetch(NOM1:PrimaryKey)
     if not(errorcode()) then
        vl_nomor=NOM1:No_Trans
        !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
!        NOMR:Urut
!        NOMR:Urut =1
!        NOMR:Nomor=vl_nomor
        NOM1:No_Trans=sub(vl_nomor,1,6)&format(deformat(sub(vl_nomor,7,6),@n6)+1,@p######p)
        put(nomor_skr)
     end
!     break
!   end
   if format(sub(vl_nomor,5,2),@n2)<>month(today()) then
      if sub(format(year(today()),@p####p),3,2)>sub(vl_nomor,3,2)
         !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
         !nomrbatal{prop:sql}='delete dba.nomrbatal where No=1'
!         loop
!            logout(1,nomrskr)
!            if errorcode()<>0 then cycle.
            !Silahkan diganti ---> 1=Transaksi Apotik ke pasien Rawat Inap
            NOM1:No_urut=69
            access:nomor_skr.fetch(NOM1:PrimaryKey)
            if not(errorcode()) then
               vl_nomor =NOM1:No_Trans
               NOM1:No_Trans=sub(vl_nomor,1,2)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'000002'
               access:nomor_skr.update()
!               if errorcode()<>0 then
!                  rollback
!                  cycle
!               else
                  vl_nomor=sub(vl_nomor,1,2)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'000001'
!                  commit
!               end
            end
!            break
!         end
      elsif sub(format(year(today()),@p####p),3,2)=sub(vl_nomor,3,2)
         if format(sub(vl_nomor,5,2),@n2)<month(today())
            !Silahkan diganti ---> 1=Transaksi Apotik ke Pasien Rawat Inap
            !nomrbatal{prop:sql}='delete dba.nomrbatal where No=1'
!            loop
!               logout(1,nomrskr)
!               if errorcode()<>0 then cycle.
               !Silahkan diganti ---> 1=Transaksi Apotik ke pasien Rawat Inap
               NOM1:No_urut=69
               access:nomor_skr.fetch(NOM1:PrimaryKey)
               if not(errorcode()) then
                  vl_nomor =NOM1:No_Trans
                  NOM1:No_Trans=sub(vl_nomor,1,2)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'000002'
                  access:nomor_skr.update()
!                  if errorcode()<>0 then
!                     rollback
!                     cycle
!                  else
                     vl_nomor=sub(vl_nomor,1,2)&sub(format(year(today()),@p####p),3,2)&format(month(today()),@p##p)&'000001'
!                     commit
!                  end
               end
!               break
!            end
         end
      end
   end
   !Silahkan diganti ---> Field penomoran transaksi bersangkutan
   APO1:NoTransaksi=vl_nomor
   display

cari_pasien routine
   ri_hrinap{prop:sql}='select * from dba.ri_hrinap where nomor_mr='&loc:mr&' order by NoUrut desc'
   ri_hrinap{prop:sql}='select * from dba.ri_hrinap where nomor_mr='&loc:mr&' order by NoUrut desc'
   if access:ri_hrinap.next()<>level:benign then
      message('Pasien belum pernah dirawat !!!')
      SELECT(?loc:mr)
   else
      APO1:no_urut=RI_HR:NoUrut
      if RI_HR:StatusTutupFar=1 then
         message('Status Farmasi sudah ditutup !')
         SELECT(?loc:mr)
      elsif RI_HR:No_Nota<>'' then
         message('Status Nota sudah tutup !')
         SELECT(?loc:mr)
      else
         APO1:KodeMitra  =RI_HR:Kontraktor
         APO1:JenisPasien=RI_HR:Pembayaran
         APO1:NomorTransaksiRanap=RI_HR:nomortrans
         if RI_HR:statusbayar=1 then
            message('Pasien Sudah Dibuatkan Nota !!! Hubungi Keuangan !!!')
            SELECT(?loc:mr)
         end
         ri_pinruang{prop:sql}='select * from dba.ri_pinruang where nomor_mr='&RI_HR:Nomor_mr&' and nourut='&RI_HR:NoUrut&' order by Tanggal_Masuk desc,jam_masuk desc'
         ri_pinruang{prop:sql}='select * from dba.ri_pinruang where nomor_mr='&RI_HR:Nomor_mr&' and nourut='&RI_HR:NoUrut&' order by Tanggal_Masuk desc,jam_masuk desc'
         if access:ri_pinruang.next()<>level:benign then
            message('Ruangan Pasien Tidak Ada !!! Hub. EDP !!!')
            SELECT(?loc:mr)
         else
            IF RI_PI:Status=1
               ITbr:KODE_RUANG=RI_PI:Ruang
               GET(ITbrRwt,ITbr:KeyKodeRuang)
               ITbk:KodeKelas=ITbr:KODEKelas
               GET(ITbKelas,ITbk:KeyKodeKelas)
               APO1:Kelas = ITbk:Kelas
            END
         end
         JKon:KODE_KTR=RI_HR:Kontraktor
         access:jkontrak.fetch(JKon:KeyKodeKtr)
      end
   end
   display
   
isi_harga routine
   GSGD:Kode_brg    =GBAR:Kode_brg
   access:gstockgdg.fetch(GSGD:KeyKodeBrg)
   GSTO:Kode_Apotik =GL_entryapotik
   GSTO:Kode_Barang =GBAR:Kode_brg
   if access:gstokaptk.fetch(GSTO:KeyBarang)=level:benign then
      if GSTO:Saldo=0 then
         message('STOK KOSONG !!!')
         loc:kodeobat=''
         loc:nama_obat=''
         display
         select(?loc:kodeobat)
      elsif GSTO:Saldo<APD:Jumlah then
         message('STOK KOSONG !!!')
         loc:kodeobat=''
         loc:nama_obat=''
         display
         select(?loc:kodeobat)
      else
         APO1:Harga=GSTO:Harga_Dasar
         CASE APO1:JenisPasien
         !untuk menentukan cara bayar pasen
         OF 3
            !UNTUK pasien kontraktor, cari dahulu persentasenya
            JKon:KODE_KTR=APO1:KodeMitra
            access:jkontrak.fetch(JKon:KeyKodeKtr)
            if JKon:HargaObat>0 then
               !Kontraktor Telkom
               APO1:Total = GL_beaR + (( GSTO:Harga_Dasar * (1+(10/100)) *JKon:HargaObat) * APO1:Jumlah)
            else
               APO:KODE_KTR = APO1:KodeMitra
               APO:Kode_brg = APO1:Kode_Barang
               GET(APOBKONT,APO:by_kode_ktr)
               IF ERRORCODE() > 0
                  !Perhitungan biasa
                  CASE clip(APO1:Kelas)
                  OF '1'
                         APO1:Total = GL_beaR + (( GSTO:Harga_Dasar * (1+(10/100)) * (1 + (Glo::rwt1 / 100 ))) * APO1:Jumlah)
                  OF '2'
                         APO1:Total = GL_beaR + (( GSTO:Harga_Dasar * (1+(10/100)) * (1 + (Glo::rwt2 / 100 ))) * APO1:Jumlah)
                  OF '3'
                         APO1:Total = GL_beaR + (( GSTO:Harga_Dasar * (1+(10/100)) * (1 + (Glo::rwt3 / 100 ))) * APO1:Jumlah)
                  OF 'VIP' 
                         APO1:Total = GL_beaR + (( GSTO:Harga_Dasar * (1+(10/100)) * (1 + (Glo::rwtvip / 100 ))) * APO1:Jumlah)
                  OF 'VVI'
                         APO1:Total = GL_beaR + (( GSTO:Harga_Dasar * (1+(10/100)) * (1 + (Glo::rwtvip / 100 ))) * APO1:Jumlah)
                  ELSE
                         APO1:Total = GL_beaR + (( GSTO:Harga_Dasar * (1+(10/100)) * (1 + (Glo::rwt1 / 100 ))) * APO1:Jumlah)
                  END
               ELSE
                  !kekecualian berdasarkan tabel ApobKont
                  APO1:Total = GL_beaR + (( GSTO:Harga_Dasar * (1+(10/100)) * (1 + (APO:PERS_TAMBAH / 100 ))) * APO1:Jumlah)
               END
            end
         OF 2
            !UNTUK pasien umum, cari dahulu persentasenya
            CASE clip(APO1:Kelas)
            OF '1'
                      APO1:Total =  GL_beaR + (( GSTO:Harga_Dasar * (1+(10/100)) * (1+(Glo::rwt1 / 100 ))) * APO1:Jumlah)
            OF '2'
                      APO1:Total =  GL_beaR + (( GSTO:Harga_Dasar * (1+(10/100)) * (1+(Glo::rwt2 / 100 ))) * APO1:Jumlah)
            OF '3'
                      APO1:Total =  GL_beaR + (( GSTO:Harga_Dasar * (1+(10/100)) * (1+(Glo::rwt3 / 100 ))) * APO1:Jumlah)
            OF 'VIP' 
                      APO1:Total =  GL_beaR + (( GSTO:Harga_Dasar * (1+(10/100)) *  (1+(Glo::rwtvip / 100 ))) * APO1:Jumlah)
            OF 'VVI'
                      APO1:Total =  GL_beaR + (( GSTO:Harga_Dasar * (1+(10/100)) *  (1+(Glo::rwtvip / 100 ))) * APO1:Jumlah)
            END
         OF 1
            APO1:Total = GL_beaR + ( GSTO:Harga_Dasar * APO1:Jumlah*(1+(10/100)))
         END

         !Awal Perbaikan Tgl 20/10/2005 Obat Askes
         if sub(clip(APO1:Kode_Barang),1,3)='3.3' then
            IF sub(clip(APO1:Kode_Barang),1,8)='3.3.EMBA'
               !Resep Jadi
               GSGD:Kode_brg=APO1:Kode_Barang
               access:gstockgdg.fetch(GSGD:KeyKodeBrg)
               APO1:Total = GSTO:Harga_Dasar * APO1:Jumlah
            else
               !Resep Jadi
               GSGD:Kode_brg=APO1:Kode_Barang
               access:gstockgdg.fetch(GSGD:KeyKodeBrg)
               vl_hna=(GSTO:Harga_Dasar*(1-GSGD:Discount/100))*1.1
               if vl_hna<=50000 then
                  APO1:Total = GL_beaR + vl_hna * APO1:Jumlah * 1.2
               elsif vl_hna<=250000 then
                  APO1:Total = GL_beaR + vl_hna * APO1:Jumlah * 1.15
               elsif vl_hna<=500000 then
                  APO1:Total = GL_beaR + vl_hna * APO1:Jumlah * 1.1
               elsif vl_hna<=1000000 then
                  APO1:Total = GL_beaR + vl_hna * APO1:Jumlah * 1.05
               else
                  APO1:Total = GL_beaR + vl_hna * APO1:Jumlah * 1.02
               end
            end
         end
         !Akhir Perbaikan Tgl 20/10/2005 Obat Askes
         IF sub(clip(APO1:Kode_Barang),1,8)='3.1.EMBA' then
            !Resep Jadi
            GSGD:Kode_brg=APO1:Kode_Barang
            access:gstockgdg.fetch(GSGD:KeyKodeBrg)
            APO1:Total = GSTO:Harga_Dasar * APO1:Jumlah
         end
         access:apobatruang.insert()
      end
   end
   display

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('WindowScanObat')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?loc:mr:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:APObatRuang.Open                                  ! File GStockGdg used by this procedure, so make sure it's RelationManager is open
  Relate:GBarang.SetOpenRelated()
  Relate:GBarang.Open                                      ! File GStockGdg used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File GStockGdg used by this procedure, so make sure it's RelationManager is open
  Access:JPasien.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:RI_HRInap.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:RI_PinRuang.UseFile                               ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:JKontrak.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITbKelas.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:ITbrRwt.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStockGdg.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  Iset:deskripsi = 'Bea_R'
  Get(IsetupAp,ISET:by_deskripsi)
  GL_beaR = Iset:Nilai
  
  Iset:deskripsi = 'KLS_1'
  Get(IsetupAp,Iset:by_deskripsi)
  Glo::rwt1 = Iset:Nilai
  
  Iset:deskripsi = 'KLS_2'
  Get(IsetupAp,Iset:by_deskripsi)
  glo::rwt2 = Iset:Nilai
  
  Iset:deskripsi = 'KLS_3'
  Get(IsetupAp,Iset:by_deskripsi)
  glo::rwt3 = Iset:Nilai
  
  Iset:deskripsi = 'KLS_Vip'
  Get(IsetupAp,Iset:by_deskripsi)
  glo::rwtvip = Iset:Nilai
  
  Iset:deskripsi = 'PPN'
  Get(IsetupAp,Iset:by_deskripsi)
  GL_PPN = Iset:Nilai
  display
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('WindowScanObat',Window)                    ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:APObatRuang.Close
    Relate:GBarang.Close
    Relate:Nomor_SKR.Close
  END
  IF SELF.Opened
    INIMgr.Update('WindowScanObat',Window)                 ! Save window data to non-volatile store
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
    OF ?loc:mr
      JPas:Nomor_mr=loc:mr
      access:jpasien.fetch(JPas:KeyNomorMr)
      loc:nama_pasien=JPas:Nama
      !message('yes')
      display
    OF ?Button2
      ThisWindow.Update
      select(?loc:kodeobat)
      hide(?button2)
      ?okbutton{prop:default}=1
      unhide(?okbutton)
    OF ?loc:kodeobat
      GBAR:KodeBarcode=loc:kodeobat
      access:gbarang.fetch(GBAR:Barcode_GBarang_FK)
      loc:nama_obat=GBAR:Nama_Brg
      display
      select(?OkButton)
    OF ?OkButton
      ThisWindow.Update
      do isi_nomor
      do cari_pasien
      APO1:Kode_Apotik    =GL_entryapotik
      APO1:Kode_Barang    =GBAR:Kode_brg
      APO1:Tanggal        =today()
      APO1:Jam            =clock()
      APO1:Jumlah         =1
      APO1:Status         =0
      APO1:NomorMR        =loc:mr
      do isi_harga
      
      loc:mr=''
      loc:kodeobat=''
      loc:nama_pasien=''
      loc:nama_obat=''
      display
      unhide(?button2)
      ?button2{prop:default}=1
      select(?loc:mr)
      hide(?okbutton)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

