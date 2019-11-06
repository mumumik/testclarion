

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N001.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N002.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N011.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N012.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N014.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N015.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N018.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N019.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N021.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N022.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N024.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N025.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N028.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N029.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N030.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N031.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N032.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N033.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N034.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N035.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N036.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N037.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N038.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N039.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N040.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N041.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N043.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N046.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N047.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N048.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N049.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N050.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N051.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N052.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N053.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N054.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N055.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N056.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N057.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N058.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N059.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N063.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N064.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N066.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N067.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N069.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N070.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N071.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N072.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N073.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N074.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N075.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N077.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N078.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N081.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N084.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N086.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N087.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N090.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N091.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N092.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N093.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N100.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N101.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N102.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N105.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N107.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N110.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N111.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N112.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N113.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N114.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N115.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N116.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N154.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N167.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N185.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N188.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N189.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N191.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N193.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N204.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N212.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N213.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N214.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N217.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N219.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N221.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N224.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N227.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N230.INC'),ONCE        !Req'd for module callout resolution
                     END


SplashApotik PROCEDURE                                     ! Generated from procedure template - Splash

FilesOpened          BYTE                                  !
window               WINDOW,AT(,,204,94),FONT('MS Sans Serif',8,COLOR:Black,FONT:regular),CENTER,GRAY,NOFRAME,MDI
                       PANEL,AT(0,0,204,95),BEVEL(6)
                       PANEL,AT(8,6,191,83),BEVEL(-2,1)
                       STRING('Instalasi Farmasi'),AT(43,18,126,19),USE(?String2),CENTER,FONT('Arial',12,,FONT:bold+FONT:italic)
                       PANEL,AT(12,41,182,8),BEVEL(-1,1,09H)
                       STRING('Update : 6 November 2019'),AT(14,63,182,10),USE(?String1:2),CENTER,FONT('Arial',11,,FONT:bold+FONT:italic)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
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
  GlobalErrors.SetProcedureName('SplashApotik')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?String2
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.Open(window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('SplashApotik',window)                      ! Restore window settings from non-volatile store
  TARGET{Prop:Timer} = 500                                 ! Close window on timer event, so configure timer
  TARGET{Prop:Alrt,255} = MouseLeft                        ! Alert mouse clicks that will close window
  TARGET{Prop:Alrt,254} = MouseLeft2
  TARGET{Prop:Alrt,253} = MouseRight
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('SplashApotik',window)                   ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
    OF EVENT:AlertKey
      CASE KEYCODE()
      OF MouseLeft
      OROF MouseLeft2
      OROF MouseRight
        POST(Event:CloseWindow)                            ! Splash window will close on mouse click
      END
    OF EVENT:LoseFocus
        POST(Event:CloseWindow)                            ! Splash window will close when focus is lost
    OF Event:Timer
      POST(Event:CloseWindow)                              ! Splash window will close on event timer
    OF Event:AlertKey
      CASE KEYCODE()                                       ! Splash window will close on mouse click
      OF MouseLeft
      OROF MouseLeft2
      OROF MouseRight
        POST(Event:CloseWindow)
      END
    ELSE
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

Main PROCEDURE                                             ! Generated from procedure template - Frame

FilesOpened          BYTE                                  !
loc:ownerdb          STRING(50)                            !
loc:owner            STRING(50)                            !
loc:buka             BYTE                                  !
windowhandle         USHORT                                !
windowtitle          CSTRING(20)                           !
whnd                 LONG                                  !
wtitle               CSTRING(20)                           !
skiplookuppt         BYTE                                  !
rlen                 LONG                                  !
classname            CSTRING(20)                           !
findwindowname       STRING(20)                            !
SplashProcedureThread LONG
DisplayDayString STRING('Sunday   Monday   Tuesday  WednesdayThursday Friday   Saturday ')
DisplayDayText   STRING(9),DIM(7),OVER(DisplayDayString)
?AppFrame            APPLICATION('Gleor.Hospital - Apotik'),AT(,,578,588),ICON('APOTIK.ICO'),ALRT(F10Key),ALRT(F9Key),ALRT(EnterKey),STATUS(-1,80,120,45),WALLPAPER('BackgroundSA.jpg'),CENTERED,SYSTEM,MAX,MAXIMIZE,RESIZE,IMM
                       MENUBAR
                         MENU('&File'),USE(?FileMenu)
                           ITEM('&Ganti Password'),USE(?FileGantiPassword)
                           ITEM,SEPARATOR
                           ITEM('Set Apotik'),USE(?FileSetApotik)
                           MENU('For Programmer'),USE(?FileForProgrammer)
                             ITEM('Window Proses Harapan Mulia'),USE(?FileForProgrammerProsesHarapanMulia)
                             ITEM('Retur Rawat Inap Per Nota'),USE(?FileForProgrammerReturRawatInapPerNota)
                             ITEM('Retur Rawat &Jalan'),USE(?TransaksiReturRawatJalan),MSG('Pengembalian obat rawat jaln')
                             ITEM('BrowseGstokGdg'),USE(?FileForProgrammerBrowseGstokGdg)
                             ITEM('Konvert Barang Mitra Kasih'),USE(?FileForProgrammerKonvertBarangMitraKasih)
                             ITEM('Proses Harga Mitra Kasih'),USE(?FileForProgrammerProsesHargaMitraKasih)
                             ITEM('Proses Harga FIFO'),USE(?FileForProgrammerProsesHargaAdjustFifo)
                             ITEM('Proses Harga Adjust'),USE(?FileForProgrammerProsesHargaFIFO)
                             ITEM('Jual Ranap Barcode'),USE(?FileForProgrammerJualRanapBarcode)
                             ITEM('Batal Rajal Tidak Update Billing'),USE(?FileForProgrammerBatalRajalTidakUpdateBilling)
                             ITEM('Browse Barang Keluar Per Kode Barang'),USE(?FileForProgrammerBrowseBarangKeluarPerKodeBaran)
                             ITEM('BPB Manual'),USE(?FileForProgrammerBPBManual)
                             ITEM('Proses Insert Stok Blank Per Apotik'),USE(?FileForProgrammerProsesInsertStokBlankPerApotik)
                             ITEM('Proses Jenis Pasien Billing'),USE(?FileForProgrammerProsesJenisPasienBilling)
                             ITEM('Browse JTransaksi'),USE(?FileForProgrammerBrowseJTransaksi)
                             ITEM('Cek Semua Transaksi Masuk'),USE(?FileCekSemuaTransaksi)
                             ITEM('Cek Semua Transaksi Keluar'),USE(?FileForProgrammerCekSemuaTransaksiKeluar)
                             ITEM,SEPARATOR
                             ITEM('Cek Semua Transaksi Masuk Per Apotik'),USE(?FileForProgrammerCekSemuaTransaksiKeluarPerApot)
                             ITEM('Cek Semua Transaksi Keluar Per Apotik'),USE(?FileForProgrammerCekSemuaTransaksiKeluarPerApot2)
                             ITEM,SEPARATOR
                             ITEM('&Penjualan Manual '),USE(?TransaksiPenjualanManual)
                             ITEM('&Akses Password'),USE(?FileAksesPassword),MSG('Mengisi password baru untuk user')
                             ITEM('&Darurat Transaksi APHTRANS'),USE(?FileDaruratTransaksiAPHTRANS)
                             ITEM('ISO'),USE(?FileISO)
                             ITEM('Nomor &Use'),USE(?FileNomorUse)
                             ITEM('Nomor &Batal'),USE(?FileNomorBatal)
                             ITEM('Nomor Sekarang'),USE(?FileNomorSekarang)
                             ITEM('&Konvert'),USE(?TabelKonvert)
                             ITEM('Proses FIFO Nol dan null'),USE(?FileForProgrammerProsesFIFONoldannull)
                             ITEM('Proses FIFO dan STOOP Nol'),USE(?FileForProgrammerProsesFIFOdanSTOOPNol)
                             MENU('Khusus FM 04 '),USE(?ToolsKhususFM04)
                               ITEM('Proses Opname FM 04 Juli 2003'),USE(?ToolsKhususFM04ProsesOpnameFM04Juli2003),DISABLE
                               ITEM('Proses Mutasi FM 04 Mei - Juni 2003'),USE(?ToolsKhususFM04ProsesMutasFM04MeiJuni2003),DISABLE
                             END
                             ITEM('ProsesObatAskes'),USE(?FileForProgrammerProsesObatAskes)
                             ITEM('Proses FIFO Opname Harga Nol Jumlah Tidak'),USE(?FileForProgrammerProsesFIFOOpnameHargaNolJumlah)
                             ITEM('Stok Opname &Baru Gak Ada Embet'),USE(?HelpStokOpnameBaru2)
                             MENU('&Laporan'),USE(?Laporan)
                               MENU('Daftar Harga Obat'),USE(?LaporanDaftarHargaObat2)
                                 ITEM('Daftar Harga Obat'),USE(?LaporanDaftarHargaObat)
                                 ITEM('Daftar Harga Obat Per Kelas'),USE(?LaporanDaftarHargaObatPerKelas)
                               END
                               ITEM('Lap. Mutasi &Bulanan'),USE(?LaporanMutasiFromKartuFIFO)
                               ITEM('Lap. Hasil &Opname'),USE(?LaporanHasilOpname)
                               ITEM,SEPARATOR
                               MENU('Laporan Pengeluaran'),USE(?LaporanLaporanPengeluaran)
                                 ITEM('Lap. Harga Pokok Penjualan Per Apotik'),USE(?LaporanLapHargaPokokPenjualan)
                                 ITEM,SEPARATOR
                                 ITEM('Lap. Penjualan Per Apotik'),USE(?LaporanLapPenjualanPerApotik)
                                 ITEM('Lap. Retur Ke Gudang'),USE(?LaporanLaporanPengeluaranLapReturKeGudang)
                                 ITEM('Lap. Keluar ke Apotik Lain'),USE(?LaporanLaporanPenerimaanLapKeluarkeApotikLain)
                                 ITEM('Lap. Koreksi (-) Per Apotik'),USE(?LaporanLapKoreksiPerApotik)
                                 ITEM('Lap. Keluar Ke Instalasi'),USE(?LaporanLaporanPengeluaranLapKeluarKeInstalasi)
                               END
                               MENU('Laporan Penerimaan'),USE(?LaporanLaporanPenerimaan)
                                 ITEM('Lap. Penerimaan dr Gudang'),USE(?LaporanLaporanPenerimaanLapPenerimaandrGudang)
                                 ITEM('Lap. Retur Penjualan Per Apotik'),USE(?LaporanLapReturPenjualanPerApotik)
                                 ITEM('Lap. Terima dr  Apotik Lain'),USE(?LaporanLapTransferAntarApotik)
                                 ITEM('Lap. Koreksi (+) Per Apotik'),USE(?LaporanLaporanPenerimaanLapKoreksi)
                                 ITEM('Lap. Retur dr. Instalasi'),USE(?LaporanLaporanPenerimaanLapReturdrInstalasi)
                               END
                               ITEM,SEPARATOR
                               ITEM('&SBBK Per Ruangan '),USE(?LaporanSBBKRuangan)
                               ITEM('&Selisih KStok - Stok'),USE(?LaporanSelisihKStokStok)
                               ITEM('Selisih FIFO - STOK'),USE(?LaporanSelisihFIFOSTOK)
                               ITEM('Selisih FIFO dan GAPTKSTK'),USE(?FileForProgrammerLaporanSelisihFIFOdanGAPTKSTK)
                               ITEM('Lap. Mutasi FM 04 Mei - Juni'),USE(?ToolsKhususFM04LapMutasiFM04MeiJuni)
                             END
                             ITEM('Lap FIFO Harga Nol Jumlah Tidak'),USE(?FileForProgrammerLapFIFOHargaNolJumlahTidak)
                             ITEM('Input Transaksi Far Ke Billing'),USE(?FileForProgrammerInputTransaksiFarKeBilling)
                             ITEM('Insert Stok Opname Ke Kartu Stok'),USE(?FileForProgrammerInsertStokOpnameKeKartuStok)
                             ITEM('Order Obar dari Ruangan'),USE(?FileForProgrammerOrderObardariRuangan)
                             ITEM('Antrian Order Obat'),USE(?FileForProgrammerAntrianOrderObat)
                             ITEM('Obat Siap Panggil Perawat'),USE(?FileForProgrammerObatSiapPanggilPerawat)
                             ITEM('Scan Pengeluaran Obat'),USE(?TabelScanPengeluaranObat)
                             ITEM('Browse Transaksi Ruangan Ke Pasien'),USE(?FileForProgrammerBrowseTransaksiRuanganKePasien)
                           END
                           ITEM,SEPARATOR
                           ITEM('P&rint Setup...'),USE(?PrintSetup),MSG('Setup Printer'),STD(STD:PrintSetup)
                           ITEM,SEPARATOR
                           ITEM('E&xit'),USE(?Exit),MSG('Exit this application'),STD(STD:Close)
                         END
                         MENU('&Tabel'),USE(?Tabel),MSG('Melihat seluruh tabel')
                           ITEM('&Set Up'),USE(?TabelItem13),MSG('Melihat nilai penambahan dan PPN')
                           ITEM('&Obat / Alat'),USE(?TabelObatAlat),MSG('Melihat Tabel Obat & Alat di apotik')
                           ITEM('Sub&Farmasi'),USE(?TabelItem15),MSG('Melihat daftar Apotik')
                           ITEM('Obat &Kontraktor'),USE(?TabelObatKontraktor)
                           ITEM('Obat &Campur'),USE(?TabelObatCampur)
                           ITEM('Sat&uan'),USE(?TabelSatuan)
                           ITEM('&Instalasi'),USE(?TabelInstalasi)
                           ITEM('Obat Per Kelompok'),USE(?TabelObatPerKelompok)
                           ITEM,SEPARATOR
                           ITEM('&Lihat Stok di sub lain'),USE(?TabelMenu9Item30),MSG('Melihat data barang di sub lainnya')
                           ITEM,SEPARATOR
                           ITEM('Stok &Gudang'),USE(?TabelStokGudang)
                           ITEM('Kartu Stok'),USE(?TabelKartuStok),HIDE
                           ITEM('Kartu Stok All'),USE(?TabelKartuStokAll),HIDE
                           ITEM('Fifo Apotik'),USE(?TabelFifoApotik)
                           ITEM('Fifo All'),USE(?TabelFifoAll)
                           ITEM,SEPARATOR
                           ITEM('Master Etiket 1'),USE(?TabelMasterEtiket)
                           ITEM('Master Etiket 2'),USE(?TabelMasterEtiket2)
                           ITEM,SEPARATOR
                           ITEM('Embalase'),USE(?TabelEmbalase)
                           ITEM('Paket Obat'),USE(?TabelPaketObat)
                           ITEM,SEPARATOR
                           ITEM('Daftar Pasien Rawat Inap'),USE(?TabelDaftarPasienRawatInap)
                           ITEM('Alias Kode Barang'),USE(?TabelAliasHarga)
                           ITEM('Data Stok Instalasi Lain'),USE(?TabelDataStokInstalasiLain)
                           ITEM('E Prescribing'),USE(?TabelEPrescribing),HIDE
                         END
                         MENU('T&ransaksi'),USE(?Transaksi),MSG('Membuat Transaksi')
                           ITEM('&Bon Permintaan Barang'),USE(?PemesananLihatBPB),MSG('Lihat BPB')
                           ITEM,SEPARATOR
                           ITEM('&Keluar Obat Ruangan'),USE(?TransaksiRuangan),HIDE,MSG('Transaksi  Stok Ruangan')
                           ITEM('&Keluar Ke Sumedang'),USE(?TransaksiKeluarKeSumedang),HIDE
                           ITEM,SEPARATOR
                           ITEM('Penjualan Pasien Rawat &Inap'),USE(?TransaksiRawatInap),MSG('Transaksi pasien rawat inap')
                           ITEM('Penjualan Pasien BPJS Rawat Inap'),USE(?TransaksiPenjualanPasienRawatInapBPJS),HIDE
                           ITEM('Retur Penjualan Pasien Rawat &Inap'),USE(?TransaksiReturRawatInap),HIDE
                           ITEM('Retur Penjualan Pasien Rawat Inap'),USE(?FileForProgrammerReturRawatInapPerMR)
                           ITEM('Retur Penjualan Pasien Rawat Inap Per Transaksi'),USE(?TransaksiReturPenjualanPasienRawatInapPerTransa)
                           ITEM('Pembatalan Transaksi Rawat Inap'),USE(?TransaksiPembatalanTransaksiRawatInap)
                           ITEM,SEPARATOR
                           ITEM('&Transfer Antar Instalasi'),USE(?TransaksiAntarSubInstalasi)
                           ITEM,SEPARATOR
                           ITEM('Penjualan Pasien Rawat &Jalan'),USE(?TransaksiItem16),MSG('Transaksi Poliklinik')
                           ITEM('Penjualan Pasien BPJS Rawat Jalan'),USE(?TransaksiPenjualanPasienBPJSRawatJalan),HIDE
                           ITEM('Retur Penjualan Pasien Rawat Jalan Per Obat'),USE(?TransaksiReturPenjualanRawatJalanPerObat)
                           ITEM('&Retur Penjualan Pasien Rawat Jalan Per Transaksi'),USE(?TransaksiBatalTransaksi)
                           ITEM('Pembatalan Transaksi Rawat Jalan'),USE(?TransaksiPembatalanTransaksiRawatJalan)
                           ITEM,SEPARATOR
                           ITEM('Transaksi Obat Campur'),USE(?TransaksiTransaksiObatCampur),HIDE
                           ITEM('Produksi &Obat'),USE(?TransaksiProduksiObat)
                           ITEM('&Koreksi Stok'),USE(?TransaksiAdjusmentStok)
                           ITEM,SEPARATOR
                           ITEM('History Stok'),USE(?TransaksiHistoryStok),HIDE
                           MENU('Transaksi Tidak Update Billing Rawat Inap'),USE(?TransaksiTransaksiTidakUpdateBillingRawatInap)
                             ITEM('Pengeluaran Per Pasien'),USE(?TransaksiPengeluaranBarangTidakUpdateKeBillRana)
                             ITEM('Retur Per Obat'),USE(?TransaksiTransaksiTidakUpdateBillingRawatInapRe)
                             ITEM('Retur Per Transaksi'),USE(?TransaksiTransaksiTidakUpdateBillingRawatInapRe2)
                           END
                           MENU('Transaksi Tidak Update Billing Rawat Jalan'),USE(?TransaksiTransaksiTidakUpdateBillingRawatJalan)
                             ITEM('Pengeluaran Per Pasien'),USE(?TransaksiPengeluaranBarangTidakUpdatekeBillRaja)
                             ITEM('Retur Per Obat'),USE(?TransaksiTransaksiTidakUpdateBillingRawatJalanR)
                             ITEM('Retur Per Transaksi'),USE(?TransaksiTransaksiTidakUpdateBillingRawatJalanR2)
                           END
                           ITEM,SEPARATOR
                           ITEM('Cek Stok'),USE(?TransaksiCekStok),HIDE
                           ITEM('Antar Satelit'),USE(?TransaksiAntarSatelit),HIDE
                           ITEM('Nota &Obat Pegawai'),USE(?TransaksiNotaObatPegawai),HIDE
                           ITEM,SEPARATOR
                           ITEM('Etiket'),USE(?TransaksiEtiket)
                           ITEM('Scan Obat / Alkes'),USE(?TransaksiScanObatAlkes),HIDE
                           ITEM('Verifikasi BPB'),USE(?TransaksiVerifikasiBPB)
                           ITEM('Master BPB'),USE(?TransaksiMasterBPB)
                           ITEM('Tutup Transaksi'),USE(?TransaksiTutupTransaksi),HIDE
                           ITEM('Resep Elektronis'),USE(?TransaksiResepElektronis),HIDE
                           ITEM('Search Pasien Berdasarkan MR'),USE(?TransaksiSearchPasienBerdasarkanMR)
                           ITEM,SEPARATOR
                           ITEM('Bon DKB Instalasi'),USE(?TransaksiBonDKBInstalasi),HIDE
                         END
                         MENU('&Tools'),USE(?Help),MSG('Windows Help')
                           ITEM('Cetak Obat Askes Dan Non Askes Pasien R.Inap'),USE(?ToolsCetakObatAskesPasienRInap)
                           ITEM('&Stok Opname Baru'),USE(?HelpStokOpnameBaru)
                           ITEM('&Data Stok Opname Per Bulan'),USE(?ToolsDataStokOpnamePerBulan)
                           ITEM,SEPARATOR
                           ITEM('Opname Setiap Saat'),USE(?ToolsOpnameNew)
                           ITEM('Data Proses Opname Setiap Saat'),USE(?ToolsDataProsesOpnameSetiapSaat)
                           ITEM,SEPARATOR
                           ITEM('&Saldo Awal Bulan'),USE(?HelpSaldoAwalBulan)
                           ITEM('Saldo Awal &Per Bulan'),USE(?HelpSaldoAwalPerBulan)
                           ITEM,SEPARATOR
                           ITEM('Perbaikan Harga Obat Pasien Telkom'),USE(?ToolsPerbaikanHargaObatPasienTelkom),DISABLE,HIDE
                           ITEM('Perbaikan Harga Obat Pasien Telkom Rawat Jalan'),USE(?ToolsPerbaikanHargaObatPasienTelkomRawatJalan),HIDE
                           ITEM('Perbaikan Harga Obat Pasien Telkom Rawat Jalan 2'),USE(?ToolsPerbaikanHargaObatPasienTelkomRawatJalan2),HIDE
                           ITEM,SEPARATOR
                           ITEM('&Informasi'),USE(?HelpAbout)
                         END
                         MENU('&Laporan'),USE(?LaporanInstalasi)
                           ITEM('Rincian pemakaian obat pasien rawat inap berdasarkan nomor registrasi'),USE(?LaporanRincianpemakaianobatpasienrawatinapberda)
                           ITEM('Daftar Harga Obat'),USE(?LaporanDaftarHargaObat3)
                           MENU('Laporan Breakdown HPP Farmasi'),USE(?LaporanLaporanBreakdownHPPFarmasi)
                             ITEM('Rawat Inap'),USE(?LaporanLaporanBreakdownHPPFarmasiRawatInap)
                             ITEM('Rawat Jalan'),USE(?LaporanLaporanBreakdownHPPFarmasiRawatJalan)
                           END
                           ITEM('Mutasi Bulanan'),USE(?LaporanInstalasiMutasiBulanan),HIDE
                           ITEM('Mutasi Harian'),USE(?LaporanInstalasiMutasiHarian),HIDE
                         END
                         MENU('FAQ'),USE(?FAQ),DISABLE,HIDE
                           ITEM('Penghitungan harga jual obat'),USE(?FAQPenghitunganhargajualobat)
                         END
                       END
                       TOOLBAR,AT(0,0,,22),COLOR(0808040H)
                         BUTTON,AT(0,1,21,19),USE(?Button1),FLAT,MSG('Penjualan Pasien Rawat Inap'),TIP('Penjualan Pasien Rawat Inap'),ICON('medicine_256_nCz_icon.ico')
                         BUTTON,AT(20,1,21,19),USE(?Button2),IMM,FLAT,MSG('Retur Penjualan Pasien Rawat Inap Per Obat'),TIP('Retur Penjualan Pasien Rawat Inap Per Obat'),ICON('bid_02_256_T07_icon.ico')
                         BUTTON,AT(39,1,21,19),USE(?Button3),TRN,FLAT,MSG('Retur Penjualan Pasien Rawat Inap Per Transaksi'),TIP('Retur Penjualan Pasien Rawat Inap Per Transaksi'),ICON('cart_delete_256__2__6PH_icon.ico')
                         BUTTON,AT(87,1,21,19),USE(?Button3:2),TRN,FLAT,MSG('Penjualan Pasien Rawat Jalan'),TIP('Penjualan Pasien Rawat Jalan'),ICON('pill_128_C6G_icon.ico')
                         BUTTON,AT(106,1,21,19),USE(?Button3:3),TRN,FLAT,MSG('Retur Penjualan Pasien Rawat Jalan Per Obat'),TIP('Retur Penjualan Pasien Rawat Jalan Per Obat'),ICON('purchase_order_256_QZj_icon.ico')
                         BUTTON,AT(125,1,21,19),USE(?Button3:4),TRN,FLAT,MSG('Retur Penjualan Pasien Rawat Jalan Per Transaksi'),TIP('Retur Penjualan Pasien Rawat Jalan Per Transaksi'),ICON('shopping_basket_delete_256_QoC_icon.ico')
                         BUTTON,AT(58,1,21,19),USE(?Button3:5),TRN,FLAT,MSG('Rincian pemakaian obat pasien rawat inap berdasarkan nomor registrasi'),TIP('Rincian pemakaian obat pasien rawat inap berdasarkan nomor registrasi'),ICON('appointment_128_qVH_icon.ico')
                       END
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED                 ! Method added to host embed code
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
view::tgljam view(filesql)
               project(FIL:FDate,FIL:FTime)
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
Menu::FileMenu ROUTINE                                     ! Code for menu items on ?FileMenu
  CASE ACCEPTED()
  OF ?FileGantiPassword
    START(GantiPassword, 25000)
  OF ?FileSetApotik
    START(BrowseSetApotik, 25000)
  END
Menu::FileForProgrammer ROUTINE                            ! Code for menu items on ?FileForProgrammer
  CASE ACCEPTED()
  OF ?FileForProgrammerProsesHarapanMulia
    START(WindowProsesHarapanMulia, 25000)
  OF ?FileForProgrammerReturRawatInapPerNota
    START(Trig_WindowReturRanapNewPerNota, 25000)
  OF ?TransaksiReturRawatJalan
    START(Trig_WindowReturRawatJalan, 25000)
  OF ?FileForProgrammerBrowseGstokGdg
    START(browsegstockgdg, 25000)
  OF ?FileForProgrammerKonvertBarangMitraKasih
    START(ProsesKonvertBarangMK, 25000)
  OF ?FileForProgrammerProsesHargaMitraKasih
    START(ProsesHargaMitraKasih, 25000)
  OF ?FileForProgrammerProsesHargaAdjustFifo
    START(ProsesHargaFifoMitraKasih, 25000)
  OF ?FileForProgrammerProsesHargaFIFO
    START(ProsesHargaAdjustMitraKasih, 25000)
  OF ?FileForProgrammerJualRanapBarcode
    START(Trig_BrowseRawatInapBarcode, 25000)
  OF ?FileForProgrammerBatalRajalTidakUpdateBilling
    START(BrowseBatalTidakUpdateBilling, 25000)
  OF ?FileForProgrammerBrowseBarangKeluarPerKodeBaran
    START(BrowseBarangKeluarPerBarang, 25000)
  OF ?FileForProgrammerBPBManual
    START(BrowseBPBManual, 25000)
  OF ?FileForProgrammerProsesInsertStokBlankPerApotik
    START(ProsesIsiStokBlankPerAptk, 25000)
  OF ?FileForProgrammerProsesJenisPasienBilling
    START(ProsesBillingJenisPasien, 25000)
  OF ?FileForProgrammerBrowseJTransaksi
    START(BrowseJTransaksi, 25000)
  OF ?FileCekSemuaTransaksi
    START(WindowAllTrans, 25000)
  OF ?FileForProgrammerCekSemuaTransaksiKeluar
    START(WindowAllTransKeluar, 25000)
  OF ?FileForProgrammerCekSemuaTransaksiKeluarPerApot
    START(WindowAllTransPerAptk, 25000)
  OF ?FileForProgrammerCekSemuaTransaksiKeluarPerApot2
    START(WindowAllTransKeluarPerAptk, 25000)
  OF ?TransaksiPenjualanManual
    START(BrowseApNotaManual, 25000)
  OF ?FileAksesPassword
    START(BrowseUser, 25000)
  OF ?FileDaruratTransaksiAPHTRANS
    START(BrowseDaruratAPHTRANS, 25000)
  OF ?FileISO
    START(BrowseISO, 25000)
  OF ?FileNomorUse
    START(BrowseNomorUse, 25000)
  OF ?FileNomorBatal
    START(BrowseNomorBatal, 25000)
  OF ?FileNomorSekarang
    START(BrowseNomorSekarang, 25000)
  OF ?TabelKonvert
    START(WindowKonvert, 25000)
  OF ?FileForProgrammerProsesFIFONoldannull
    START(ProsesFIFONolNull, 25000)
  OF ?FileForProgrammerProsesFIFOdanSTOOPNol
    START(ProsesFIFOStokOpNol, 25000)
  OF ?FileForProgrammerProsesObatAskes
    START(ProsesObatAskes, 25000)
  OF ?FileForProgrammerProsesFIFOOpnameHargaNolJumlah
    START(ProsesFIFOHrgNolJumTdk, 25000)
  OF ?HelpStokOpnameBaru2
    START(BrowseSOBaruKomplit, 25000)
  OF ?FileForProgrammerLapFIFOHargaNolJumlahTidak
    START(PrintFIFOHrgNolJumTdk, 25000)
  OF ?FileForProgrammerInputTransaksiFarKeBilling
    START(WindowTransaksiFarKeBill, 25000)
  OF ?FileForProgrammerInsertStokOpnameKeKartuStok
    START(ProsesInsertStokOpnameKeKartuStok, 25000)
  OF ?FileForProgrammerOrderObardariRuangan
    START(BrowseOrderObatdariRuangan, 25000)
  OF ?FileForProgrammerAntrianOrderObat
    START(BrowseAntrianOrderObat, 25000)
  OF ?FileForProgrammerObatSiapPanggilPerawat
    START(BrowseObatSiapPanggilPerawat, 25000)
  OF ?TabelScanPengeluaranObat
    START(WindowScanObat, 25000)
  OF ?FileForProgrammerBrowseTransaksiRuanganKePasien
    START(BrowseAPObatRuang, 25000)
  END
Menu::ToolsKhususFM04 ROUTINE                              ! Code for menu items on ?ToolsKhususFM04
  CASE ACCEPTED()
  OF ?ToolsKhususFM04ProsesOpnameFM04Juli2003
    START(ProsesOpnameFM04Juli2003, 25000)
  OF ?ToolsKhususFM04ProsesMutasFM04MeiJuni2003
    START(ProsesMutasFM04MeiJuni, 25000)
  END
Menu::Laporan ROUTINE                                      ! Code for menu items on ?Laporan
  CASE ACCEPTED()
  OF ?LaporanMutasiFromKartuFIFO
    START(CetakMutasiKartuFIFO, 25000)
  OF ?LaporanHasilOpname
    START(PrintHasilOpname, 25000)
  OF ?LaporanSBBKRuangan
    START(PrintSBBKRuangan, 25000)
  OF ?LaporanSelisihKStokStok
    START(PrintSelisihKStokStok, 25000)
  OF ?LaporanSelisihFIFOSTOK
    START(PrintSelisihFIFOStok, 25000)
  OF ?FileForProgrammerLaporanSelisihFIFOdanGAPTKSTK
    START(PrintSelisihFIFOStokAptk, 25000)
  OF ?ToolsKhususFM04LapMutasiFM04MeiJuni
    START(PrintRekapMutasiMeiJuniFM04, 25000)
  END
Menu::LaporanDaftarHargaObat2 ROUTINE                      ! Code for menu items on ?LaporanDaftarHargaObat2
  CASE ACCEPTED()
  OF ?LaporanDaftarHargaObat
    START(PrintDaftarHargaObat, 25000)
  OF ?LaporanDaftarHargaObatPerKelas
    START(PrintDaftarHargaObat1, 25000)
  END
Menu::LaporanLaporanPengeluaran ROUTINE                    ! Code for menu items on ?LaporanLaporanPengeluaran
  CASE ACCEPTED()
  OF ?LaporanLapHargaPokokPenjualan
    START(ProsesLapHargaPokokPenjualan, 25000)
  OF ?LaporanLapPenjualanPerApotik
    START(ProsesLapPenjualanBarang, 25000)
  OF ?LaporanLaporanPengeluaranLapReturKeGudang
    START(ProsesLapReturKeGudang, 25000)
  OF ?LaporanLaporanPenerimaanLapKeluarkeApotikLain
    START(ProsesLapTransferAntarApotikKeluar, 25000)
  OF ?LaporanLapKoreksiPerApotik
    START(ProsesLapKoreksiPerApotikMinus, 25000)
  OF ?LaporanLaporanPengeluaranLapKeluarKeInstalasi
    START(ProsesLapKeluarKeInstalasi, 25000)
  END
Menu::LaporanLaporanPenerimaan ROUTINE                     ! Code for menu items on ?LaporanLaporanPenerimaan
  CASE ACCEPTED()
  OF ?LaporanLaporanPenerimaanLapPenerimaandrGudang
    START(ProsesLapTerimaDariGudang, 25000)
  OF ?LaporanLapReturPenjualanPerApotik
    START(ProsesLapReturPenjualanBarang, 25000)
  OF ?LaporanLapTransferAntarApotik
    START(ProsesLapTransferAntarApotikMasuk, 25000)
  OF ?LaporanLaporanPenerimaanLapKoreksi
    START(ProsesLapKoreksiPerApotikPlus, 25000)
  OF ?LaporanLaporanPenerimaanLapReturdrInstalasi
    START(ProsesLapReturDrInstalasi, 25000)
  END
Menu::Tabel ROUTINE                                        ! Code for menu items on ?Tabel
  CASE ACCEPTED()
  OF ?TabelItem13
    START(Atur_setup, 25000)
  OF ?TabelObatAlat
    START(tabel_stok_lokal, 25000)
  OF ?TabelItem15
    START(Lihat_apotik, 25000)
  OF ?TabelObatKontraktor
    START(tb_obat_kontraktor, 25000)
  OF ?TabelObatCampur
    START(Tabel_brg_campur, 25000)
  OF ?TabelSatuan
    START(Lihat_Rubah_Satuan_Brg, 25000)
  OF ?TabelInstalasi
    START(Tabel_instalasi, 25000)
  OF ?TabelObatPerKelompok
    START(BrowseObatPerKelompok, 25000)
  OF ?TabelMenu9Item30
    START(Lihat_stok_tempat_lain, 25000)
  OF ?TabelStokGudang
    START(BrowseStokGudang, 25000)
  OF ?TabelKartuStok
    START(BrowseKartuStokApotik, 25000)
  OF ?TabelKartuStokAll
    START(BrowseKartuStokApotikAll, 25000)
  OF ?TabelFifoApotik
    START(BrowseKartuFIFOApotik, 25000)
  OF ?TabelFifoAll
    START(BrowseKartuFIFOApotikAll, 25000)
  OF ?TabelMasterEtiket
    START(BrowseEtiket, 25000)
  OF ?TabelMasterEtiket2
    START(BrowseEtiket2, 25000)
  OF ?TabelEmbalase
    START(BrowseEmbalase, 25000)
  OF ?TabelPaketObat
    START(BrowsePaketObat, 25000)
  OF ?TabelDaftarPasienRawatInap
    START(BrowsePasienRanap, 25000)
  OF ?TabelAliasHarga
    START(BrowseAliasKodeBarang, 25000)
  OF ?TabelDataStokInstalasiLain
    START(BrowseStokInstalasiLain, 25000)
  OF ?TabelEPrescribing
    START(selectepre, 25000)
  END
Menu::Transaksi ROUTINE                                    ! Code for menu items on ?Transaksi
  CASE ACCEPTED()
  OF ?PemesananLihatBPB
    WindowTanggal
    START(BrowseInputOrder, 25000)
  OF ?TransaksiRuangan
    START(Trig_BrowseKeluarRuangan, 25000)
  OF ?TransaksiKeluarKeSumedang
    START(BrowseKeluarKeSumedang, 25000)
  OF ?TransaksiRawatInap
    START(Trig_BrowseRawatInap, 25000)
  OF ?TransaksiPenjualanPasienRawatInapBPJS
    START(Trig_BrowseRawatInapBpjs, 25000)
  OF ?TransaksiReturRawatInap
    START(Trig_WindowReturRawatInap, 25000)
  OF ?FileForProgrammerReturRawatInapPerMR
    START(Trig_WindowReturRanapNewPerMR, 25000)
  OF ?TransaksiReturPenjualanPasienRawatInapPerTransa
    START(Trig_WindowReturRanapNewPerNota, 25000)
  OF ?TransaksiPembatalanTransaksiRawatInap
    START(Trig_WindowReturRanapNewPerNotaSamaHarga, 25000)
  OF ?TransaksiAntarSubInstalasi
    START(Trig_BrowseAntarApotik, 25000)
  OF ?TransaksiItem16
    START(Trig_BrowseRawatJalan, 25000)
  OF ?TransaksiPenjualanPasienBPJSRawatJalan
    START(Trig_BrowseRawatJalanBpjs, 25000)
  OF ?TransaksiReturPenjualanRawatJalanPerObat
    START(Trig_WindowReturRawatJalan, 25000)
  OF ?TransaksiBatalTransaksi
    START(Trig_BrowseBatalRawatJalan, 25000)
  OF ?TransaksiPembatalanTransaksiRawatJalan
    START(Trig_BrowseBatalRawatJalanSamaHarga, 25000)
  OF ?TransaksiTransaksiObatCampur
    START(Trig_BrowseProduksi, 25000)
  OF ?TransaksiProduksiObat
    START(Trig_BrowseProduksi, 25000)
  OF ?TransaksiAdjusmentStok
    START(BrowseAdjust, 25000)
  OF ?TransaksiHistoryStok
    START(BrowseKartuFIFOApotik, 25000)
  OF ?TransaksiCekStok
    START(BrowseStokInstalasiLain, 25000)
  OF ?TransaksiAntarSatelit
    START(Trig_BrowseAntarInstalasi, 25000)
  OF ?TransaksiNotaObatPegawai
    START(BrowseNotaObatPegawai, 25000)
  OF ?TransaksiEtiket
    START(BrowseEtiketTrans, 25000)
  OF ?TransaksiScanObatAlkes
    START(WindowScanObat, 25000)
  OF ?TransaksiVerifikasiBPB
    START(BrowseInputOrderVerAll, 25000)
  OF ?TransaksiMasterBPB
    START(BrowseBPBMaster, 25000)
  OF ?TransaksiTutupTransaksi
    START(BrowseTutupTransaksi, 25000)
  OF ?TransaksiResepElektronis
    START(BrowseResepElektronis, 25000)
  OF ?TransaksiSearchPasienBerdasarkanMR
    START(BrowseSearchMR, 25000)
  OF ?TransaksiBonDKBInstalasi
    START(BrowseDKBInstalasi, 25000)
  END
Menu::TransaksiTransaksiTidakUpdateBillingRawatInap ROUTINE ! Code for menu items on ?TransaksiTransaksiTidakUpdateBillingRawatInap
  CASE ACCEPTED()
  OF ?TransaksiPengeluaranBarangTidakUpdateKeBillRana
    START(Trig_BrowseRawatInapNonBilling, 25000)
  OF ?TransaksiTransaksiTidakUpdateBillingRawatInapRe
    START(Trig_WindowReturRanapNewPerMRNonBilling, 25000)
  OF ?TransaksiTransaksiTidakUpdateBillingRawatInapRe2
    START(Trig_WindowReturRanapNewPerNotaNonBilling, 25000)
  END
Menu::TransaksiTransaksiTidakUpdateBillingRawatJalan ROUTINE ! Code for menu items on ?TransaksiTransaksiTidakUpdateBillingRawatJalan
  CASE ACCEPTED()
  OF ?TransaksiPengeluaranBarangTidakUpdatekeBillRaja
    START(Trig_BrowseRawatJalanNonBill, 25000)
  OF ?TransaksiTransaksiTidakUpdateBillingRawatJalanR
    START(Trig_WindowReturRawatJalanNonBilling, 25000)
  OF ?TransaksiTransaksiTidakUpdateBillingRawatJalanR2
    START(Trig_BrowseBatalRawatJalanNonBilling, 25000)
  END
Menu::Help ROUTINE                                         ! Code for menu items on ?Help
  CASE ACCEPTED()
  OF ?ToolsCetakObatAskesPasienRInap
    START(BrwCetakObatAskes, 25000)
  OF ?HelpStokOpnameBaru
    START(WindowPassGlobal, 25000)
  OF ?ToolsDataStokOpnamePerBulan
    START(BrowseOpnamePerBulan, 25000)
  OF ?ToolsOpnameNew
    START(BrowseOpnameSetiapSaat, 25000)
  OF ?ToolsDataProsesOpnameSetiapSaat
    START(BrowseDataOpnameSetiapSaat, 25000)
  OF ?HelpSaldoAwalBulan
    START(BrowseSaldoAwalBulan, 25000)
  OF ?HelpSaldoAwalPerBulan
    START(BrowseSaldoAwalPerBulan, 25000)
  OF ?ToolsPerbaikanHargaObatPasienTelkom
    START(BrowsePerbaikanHargaObatPasienTelkom, 25000)
  OF ?ToolsPerbaikanHargaObatPasienTelkomRawatJalan
    START(BrowsePerbaikanHargaObatPasienTelkomRajal, 25000)
  OF ?ToolsPerbaikanHargaObatPasienTelkomRawatJalan2
    START(BrowsePerbaikanHargaObatPasinTelkomRajal1, 25000)
  OF ?HelpAbout
    START(about, 25000)
  END
Menu::LaporanInstalasi ROUTINE                             ! Code for menu items on ?LaporanInstalasi
  CASE ACCEPTED()
  OF ?LaporanRincianpemakaianobatpasienrawatinapberda
    START(Trig_WindowCariNotaRanap, 25000)
  OF ?LaporanDaftarHargaObat3
    START(PrintDaftarHargaObat2, 25000)
  OF ?LaporanInstalasiMutasiBulanan
    START(CetakMutasiKartuFIFO, 25000)
  OF ?LaporanInstalasiMutasiHarian
    START(CetakMutasiKartuFIFOHarian, 25000)
  END
Menu::LaporanLaporanBreakdownHPPFarmasi ROUTINE            ! Code for menu items on ?LaporanLaporanBreakdownHPPFarmasi
  CASE ACCEPTED()
  OF ?LaporanLaporanBreakdownHPPFarmasiRawatInap
    START(LaporanPenjualanPerPasienPerObatRanap, 25000)
  OF ?LaporanLaporanBreakdownHPPFarmasiRawatJalan
    START(LaporanPenjualanPerPasienPerObatRajal, 25000)
  END
Menu::FAQ ROUTINE                                          ! Code for menu items on ?FAQ

ThisWindow.Ask PROCEDURE

  CODE
  IF NOT INRANGE(?AppFrame{Prop:Timer},1,100)
    ?AppFrame{Prop:Timer} = 100
  END
    ?AppFrame{Prop:StatusText,3} = CLIP(DisplayDayText[(TODAY()%7)+1]) & ', ' & FORMAT(TODAY(),@D8)
    ?AppFrame{Prop:StatusText,4} = FORMAT(CLOCK(),@T3)
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Main')
  glo::mainthreadno=thread()
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = 1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  !loc:owner=clip(getini('server','name',,'gleorhospital.ini'))
  !if clip(loc:owner)='' then
  !   jpasswrd{PROP:OWNER}='gleormk,apotik,apotik;eng=gleormk;commlinks=TCPIP'
  !else
  !   jpasswrd{prop:owner}=clip(loc:owner)&',apotik,apotik;eng='&clip(loc:owner)&';commlinks=TCPIP'
  !end
  glo:printerkwitansi=getini('apotik','printerkwitansi',,'gleorhospital.ini')
  loc:owner=getini('server','name',,'gleorhospital.ini')
  loc:ownerdb=getini('database','name',,'gleorhospital.ini')
  if loc:owner='' then
     jpasswrd{prop:owner}='gleorhm,apotik,apotik;eng=gleorhm;commlinks=TCPIP'
  else
     !jpasswrd{prop:owner}=clip(loc:owner)&',MR,MR;eng='&clip(loc:owner)&';commlinks=TCPIP'
     jpasswrd{prop:owner}=clip(loc:owner)&',apotik,apotik;eng='&clip(loc:owner)&';dbn='&clip(loc:ownerdb)&';commlinks=TCPIP'
  end
  
  open(jpasswrd)
  open(filesql)
  open(gapotik)
  open(nomoruse)
  open(Asetapotik)
  
  !!mencegah program kebuka lebih dari sekali
  !loc:buka=0
  !FindWindowName = 'APOTIK'
  !
  !Loop WindowHandle = 1 To 0FFFFh
  !     rlen# = GetWindowText(WindowHandle,Address(WindowTitle),200)
  !     If rlen# Then
  !         ret#  = GetClassName(WindowHandle,ClassName,200)
  !!         if sub(windowtitle,1,3)='blo' then
  !!           message(windowtitle)
  !!         end
  !         If (Sub(ClassName,1,6) = 'ClaWin')   And (sub(clip(windowtitle),1,6) = clip(FindWindowName))  Then
  !              !MESSAGE('program yg lagi buka '  &sub(clip(windowtitle),1,18))
  !              loc:buka=1
  !             
  !              !Return
  !          End
  !     End
  !End
  !!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  sub(clip(widdowtitle),1,16)
  
  omit('jangan')
  Relate:ASetApotik.Open                                   ! File ASetApotik used by this procedure, so make sure it's RelationManager is open
  Relate:FileSql.Open                                      ! File ASetApotik used by this procedure, so make sure it's RelationManager is open
  Relate:GApotik.SetOpenRelated()
  Relate:GApotik.Open                                      ! File ASetApotik used by this procedure, so make sure it's RelationManager is open
  Relate:JPASSWRD.SetOpenRelated()
  Relate:JPASSWRD.Open                                     ! File ASetApotik used by this procedure, so make sure it's RelationManager is open
  Relate:NomorUse.Open                                     ! File ASetApotik used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  jangan
  open(view::tgljam)
  view::tgljam{prop:sql}='select current date,current time from dummy'
  next(view::tgljam)
  settoday(FIL:FDate)
  setclock(FIL:FTime)
  close(view::tgljam)
  vg_tanggal1=today()
  vg_tanggal2=today()
  LoginBox()
  if clip(getini('apotik','lokal',,'gleorhospital.ini'))<>1 then
  
  if glo:akses='ALL' then
     
  EntryApotik()
  Entryshift()
  else
  EntryApotikFilter()
  Entryshift()
  end
  else
     if upper(clip(Glo:Bagian))='FARMASI' or upper(clip(Glo:Bagian))='GUDANG' then
        GL_entryapotik=clip(getini('apotik','satelit',,'gleorhospital.ini'))
        
        GAPO:Kode_Apotik=GL_entryapotik
        GET(GApotik,GAPO:KeyNoApotik)
        GL_namaapotik=GAPO:Nama_Apotik
        GLO:INSDIGUNAKAN=GAPO:Keterangan
     else
        
  !      GL_entryapotik=getini('kodeapotik','nama',,'E:\software\BARU\apotik\sim.ini')
  !      GAPO:Kode_Apotik=GL_entryapotik
  !      GET(GApotik,GAPO:KeyNoApotik)
  !      GL_namaapotik=GAPO:Nama_Apotik
  !      GLO:INSDIGUNAKAN=GAPO:Keterangan
  
        set(AsetApotik)
        next(AsetApotik)
        if not(errorcode()) then
           GL_entryapotik=ASE:KodeApotik
           GAPO:Kode_Apotik=GL_entryapotik
           GET(GApotik,GAPO:KeyNoApotik)
           GL_namaapotik=GAPO:Nama_Apotik
           GLO:INSDIGUNAKAN=GAPO:Keterangan
           close(Asetapotik)
        else
           GL_entryapotik=clip(getini('apotik','satelit',,'gleorhospital.ini'))
           GAPO:Kode_Apotik=GL_entryapotik
           GET(GApotik,GAPO:KeyNoApotik)
           GL_namaapotik=GAPO:Nama_Apotik
           GLO:INSDIGUNAKAN=GAPO:Keterangan
           !message(GL_entryapotik)
           close(Asetapotik)
        end
     end
  end
  display
  vg_tanggalopname=today()
  glo:apotikfilter=GL_entryapotik
  SELF.Open(?AppFrame)                                     ! Open window
  !message(GL_entryapotik)
  !message(vg_shift_apotik)
  !jika program kebuka 2 x
  !if loc:buka=1 then
  !   message('Anda tidak boleh membuka program yang sama lebih dari sekali | Program akan ditutup','Konfirmasi',icon:exclamation)
  !    post(event:closewindow)
  !   !cycle
  !end
  !!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  Do DefineListboxStyle
  INIMgr.Fetch('Main',?AppFrame)                           ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:ASetApotik.Close
    Relate:FileSql.Close
    Relate:GApotik.Close
    Relate:JPASSWRD.Close
    Relate:NomorUse.Close
  END
  IF SELF.Opened
    INIMgr.Update('Main',?AppFrame)                        ! Save window data to non-volatile store
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
    ELSE
      DO Menu::FileMenu                                    ! Process menu items on ?FileMenu menu
      DO Menu::FileForProgrammer                           ! Process menu items on ?FileForProgrammer menu
      DO Menu::ToolsKhususFM04                             ! Process menu items on ?ToolsKhususFM04 menu
      DO Menu::Laporan                                     ! Process menu items on ?Laporan menu
      DO Menu::LaporanDaftarHargaObat2                     ! Process menu items on ?LaporanDaftarHargaObat2 menu
      DO Menu::LaporanLaporanPengeluaran                   ! Process menu items on ?LaporanLaporanPengeluaran menu
      DO Menu::LaporanLaporanPenerimaan                    ! Process menu items on ?LaporanLaporanPenerimaan menu
      DO Menu::Tabel                                       ! Process menu items on ?Tabel menu
      DO Menu::Transaksi                                   ! Process menu items on ?Transaksi menu
      DO Menu::TransaksiTransaksiTidakUpdateBillingRawatInap ! Process menu items on ?TransaksiTransaksiTidakUpdateBillingRawatInap menu
      DO Menu::TransaksiTransaksiTidakUpdateBillingRawatJalan ! Process menu items on ?TransaksiTransaksiTidakUpdateBillingRawatJalan menu
      DO Menu::Help                                        ! Process menu items on ?Help menu
      DO Menu::LaporanInstalasi                            ! Process menu items on ?LaporanInstalasi menu
      DO Menu::LaporanLaporanBreakdownHPPFarmasi           ! Process menu items on ?LaporanLaporanBreakdownHPPFarmasi menu
      DO Menu::FAQ                                         ! Process menu items on ?FAQ menu
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button1
      START(Trig_BrowseRawatInap, 25000)
    OF ?Button2
      START(Trig_WindowReturRanapNewPerMR, 25000)
    OF ?Button3
      START(Trig_WindowReturRanapNewPerNota, 25000)
    OF ?Button3:2
      START(Trig_BrowseRawatJalan, 25000)
    OF ?Button3:3
      START(Trig_WindowReturRawatJalan, 25000)
    OF ?Button3:4
      START(Trig_BrowseBatalRawatJalan, 25000)
    OF ?Button3:5
      START(Trig_WindowCariNotaRanap, 25000)
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
  !?BPBBtn:3
  
  
  !OF EVENT:Disable_BPB
  !   DISABLE(?BPBBtn)
  !OF EVENT:Enable_BPB
  !   ENABLE(?BPBBtn)
  !OF EVENT:Disable_BPBV
  !   DISABLE(?BPBBtn:3)
  !OF EVENT:Enable_BPBV
  !   ENABLE(?BPBBtn:3)
  OF EVENT:Disable_RJalan
     DISABLE(?Button3:2)
     DISABLE(?TransaksiItem16)
  OF EVENT:Enable_RJalan
     ENABLE(?Button3:2)
     ENABLE(?TransaksiItem16)
  OF EVENT:Disable_RJalanN
     DISABLE(?Button3:4)
     DISABLE(?TransaksiBatalTransaksi)
  OF EVENT:Enable_RJalanN
     ENABLE(?Button3:4)
     ENABLE(?TransaksiBatalTransaksi)
  OF EVENT:Disable_RInap
     DISABLE(?Button1)
     DISABLE(?TransaksiRawatInap)
  OF EVENT:Enable_RInap
     ENABLE(?Button1)
     ENABLE(?TransaksiRawatInap)
  OF EVENT:Disable_RInapN
     DISABLE(?Button3)
     DISABLE(?TransaksiReturPenjualanPasienRawatInapPerTransa)
  OF EVENT:Enable_RInapN
     ENABLE(?Button3)
     ENABLE(?TransaksiReturPenjualanPasienRawatInapPerTransa)
  !!OF EVENT:Disable_Ruangan
  !!   DISABLE(?TransRuangBtn)
  !!OF EVENT:Enable_Ruangan
  !!   ENABLE(?TransRuangBtn)
  !OF EVENT:Disable_AntarApotik
  !   DISABLE(?TransAntarApotikBtn)
  !OF EVENT:Enable_AntarApotik
  !   ENABLE(?TransAntarApotikBtn)
  OF EVENT:Disable_ReturRJalan
     DISABLE(?Button3:3)
     DISABLE(?TransaksiReturPenjualanRawatJalanPerObat)
  OF EVENT:Enable_ReturRJalan
     ENABLE(?Button3:3)
     ENABLE(?TransaksiReturPenjualanRawatJalanPerObat)
  OF EVENT:Disable_ReturRInap
     DISABLE(?Button2)
     DISABLE(?FileForProgrammerReturRawatInapPerMR)
  OF EVENT:Enable_ReturRInap
     ENABLE(?Button2)
     ENABLE(?FileForProgrammerReturRawatInapPerMR)
  !OF EVENT:Disable_BatalTrans
  !   DISABLE(?TransBatalBtn)
  !OF EVENT:Enable_BatalTrans
  !   ENABLE(?TransBatalBtn)
  !
  OF EVENT:Enable_ReportRInap
      ENABLE(?Button3:5)
      ENABLE(?LaporanRincianpemakaianobatpasienrawatinapberda)
  OF EVENT:Disable_ReportRInap
      DISABLE(?Button3:5)
      DISABLE(?LaporanRincianpemakaianobatpasienrawatinapberda)
  
  OF EVENT:Enable_PembatalanRInap
      ENABLE(?TransaksiPembatalanTransaksiRawatInap)
  OF EVENT:Disable_PembatalanRInap
      DISABLE(?TransaksiPembatalanTransaksiRawatInap)
  
  OF EVENT:Enable_PembatalanRJalan
      ENABLE(?TransaksiPembatalanTransaksiRawatJalan)
  OF EVENT:Disable_PembatalanRJalan
      DISABLE(?TransaksiPembatalanTransaksiRawatJalan)
  
    OF EVENT:OpenWindow
      !IF GLO:LEVEL > 1
      !    ?TabelItem13{PROP:DISABLE} = 1
      !    ?TabelItem15{PROP:DISABLE} = 1
      !    ?BtnKoreksi{prop:disable}=1
      !    ?TabelFifoAll{prop:disable}=1
      !    ?TabelInstalasi{prop:disable}=1
      !    ?HelpStokOpnameBaru2{prop:disable}=1
      !else
      !   enable(?ToolsPerbaikanHargaObatPasienTelkom)
      !END
      !
      !IF GLO:LEVEL > 0
      !    ?FileAksesPassword{PROP:DISABLE} = 1
      !    ?HelpSaldoAwalBulan{PROP:DISABLE} = 1
      !    ?HelpSaldoAwalPerBulan{PROP:DISABLE} = 1
      !    ?TransaksiAdjusmentStok{prop:disable}=1
      !END
      !
      !if GL_entryapotik='FM08' or GL_entryapotik='FM12' or GL_entryapotik='FM01' or GL_entryapotik='FM11' or GL_entryapotik='FM39' or GL_entryapotik='FM01' then
      !   unhide(?TransRuangBtn)
      !else
      !   hide(?TransRuangBtn)
      !end
      !
      !if GL_entryapotik='FM09' then
      !      hide(?BPBBtn:4)
      !      hide(?BPBBtn:5)
      !      hide(?BPBBtn:6)
      !elsif GL_entryapotik='FM11' then
      !!GL_entryapotik='FM01' or 
      !   if glo:bagian<>'SIM'  then
      !      hide(?TransBatalBtn)
      !      hide(?TransReturJalanBtn)
      !      hide(?TransJalanBtn)
      !      hide(?BPBBtn:4)
      !      hide(?BPBBtn:5)
      !      hide(?BPBBtn:6)
      !   end
      !elsif (GL_entryapotik>='FM12' or glo:bagian='POLI' or glo:bagian='INV') and glo:bagian<>'SIM' and GL_entryapotik<>'FM39' and GL_entryapotik<>'FM01' then
      !   ?BtnKoreksi{prop:disable}=0
      !   hide(?TransAntarApotikBtn)
      !   hide(?TransJalanBtn)
      !   hide(?TransReturJalanBtn)
      !   hide(?TransBatalBtn)
      !   !hide(?ProdBtn)
      !   hide(?FileMenu)
      !   hide(?Tabel)
      !   hide(?Transaksi)
      !   hide(?Help)
      !   hide(?TransReturInapBtn)
      !   hide(?TransInapBtn)
      !   hide(?BtnKoreksi:2)
      !   unhide(?TransRuangBtn)
      !   unhide(?LaporanInstalasi)
      !   enable(?LaporanInstalasi)
      !   unhide(?BPBBtn:10)
      !else
      !   if glo:bagian<>'SIM'  then
      !      if GL_entryapotik<>'FM39' and GL_entryapotik<>'FM01' then
      !         hide(?TransReturInapBtn)
      !         hide(?TransInapBtn)
      !      end
      !      hide(?BPBBtn:4)
      !      hide(?BPBBtn:5)
      !      hide(?BPBBtn:6)
      !   else
      !      unhide(?LaporanInstalasi)
      !      unhide(?TransRuangBtn)
      !   end
      !end
      !
      !if glo:bagian<>'SIM'  then
      !   !hide(?FileNomorSekarang)
      !   !hide(?FileNomorBatal)
      !   !hide(?FileNomorUse)
      !   hide(?ToolsKhususFM04)
      !   !hide(?laporan)
      !   
      !else
      !   unhide(?FileDaruratTransaksiAPHTRANS)
      !   !hide(?NewBanget)
      !   unhide(?HelpStokOpnameBaru2)
      !end
      Glo::kode_apotik=GL_entryapotik
      if Glo::kode_apotik='FM01' or Glo::kode_apotik='fm01'
          glo:tuslah = 1500
      else
          glo:tuslah = 0
      end
      display
      !message(glo::kode_apotik)
      !
      !if clip(glo:akses)<>'' then
      !   !unhide(?BPBBtn:7)
      !end
      !
      !!message(clip(glo:bagian))
      !if clip(glo:bagian)<>'SIM' then
      !   hide(?ToolsDataProsesOpnameSetiapSaat)
      !end
      
      !?appframe{prop:text}='NAMA USER : '&UPPER(CLIP(vg_user))&' --> Server : '&clip(loc:owner)
      !if Glo:level=0 then
      !    unhide(?TransaksiPenjualanPasienRawatInapBPJS)
      !    unhide(?TransaksiPenjualanPasienBPJSRawatJalan)
      !end
      ?appframe{prop:text}='APOTIK VERSI: 2019.09.16 || NAMA USER : '&UPPER(CLIP(vg_user))&' --> Server : '&clip(loc:owner)&' --> Database : '&clip(loc:ownerdb)
      if clip(glo:bagian)<>'SIM'  then
          hide(?HelpStokOpnameBaru)
      end
      !?appframe{prop:text}='NAMA USER : '&UPPER(CLIP(vg_user))&' --> Server : Imman'
      display
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:AlertKey
      !!message(keycode())
      !if keycode()=F10key then
      !   disable(?FileMenu)
      !   disable(?Tabel)
      !   disable(?Transaksi)
      !   !disable(?LAporan)
      !   disable(?Help)
      !
      !   disable(?BpbBtn)
      !   disable(?TransRuangBtn)
      !   disable(?TransInapBtn)
      !   disable(?TransReturInapBtn)
      !   disable(?TransAntarApotikBtn)
      !   disable(?TransJalanBtn)
      !   disable(?TransReturJalanBtn)
      !   disable(?TransBatalBtn)
      !   disable(?ProdBtn)
      !   disable(?BtnKoreksi)
      !
      !!elsif keycode()=F9key then
      LoginBoxEsc()
      EntryApotik()
      !   
      !   enable(?FileMenu)
      !   enable(?Tabel)
      !   enable(?Transaksi)
      !   !enable(?LAporan)
      !   enable(?Help)
      !
      !   enable(?BpbBtn)
      !   enable(?TransRuangBtn)
      !   enable(?TransInapBtn)
      !   enable(?TransReturInapBtn)
      !   enable(?TransAntarApotikBtn)
      !   enable(?TransJalanBtn)
      !   enable(?TransReturJalanBtn)
      !   enable(?TransBatalBtn)
      !   enable(?ProdBtn)
      !   enable(?BtnKoreksi)
      !
      !   IF GLO:LEVEL > 1
      !    !?HelpStokOpname{PROP:DISABLE} = 1
      !    !?HelpMaintenance2{PROP:DISABLE} = 1
      !    ?TabelItem13{PROP:DISABLE} = 1
      !    ?TabelItem15{PROP:DISABLE} = 1
      !    
      !   END
      !   IF GLO:LEVEL > 0
      !       ?FileAksesPassword{PROP:DISABLE} = 1
      !       !?TabelApstokOpname{PROP:DISABLE} = 1
      !       !?TabelTBStawal{PROP:DISABLE} = 1
      !   END
      !
      !   if GL_entryapotik='FM08' or GL_entryapotik='FM01' then
      !      unhide(?TransRuangBtn)
      !   else
      !      hide(?TransRuangBtn)
      !   end
      !
      !   if GL_entryapotik<>'FM01' then
      !      hide(?TransReturInapBtn)
      !      hide(?TransInapBtn)
      !   end
      !
      !   if vg_user<>'ADI' then
      !      hide(?FileNomorSekarang)
      !      hide(?FileNomorBatal)
      !      !hide(?NewBanget)
      !   end
      !
      !end
      !
      !if keycode()=Enterkey then
      WindowScanObat()
      !end
    OF EVENT:OpenWindow
      SplashProcedureThread = START(SplashApotik)          ! Run the splash window procedure
    OF Event:Timer
      ?AppFrame{Prop:StatusText,3} = CLIP(DisplayDayText[(TODAY()%7)+1]) & ', ' & FORMAT(TODAY(),@D8)
      ?AppFrame{Prop:StatusText,4} = FORMAT(CLOCK(),@T3)
    ELSE
      IF SplashProcedureThread
        IF EVENT() = Event:Accepted
          POST(Event:CloseWindow,,SplashProcedureThread)   ! Close the splash window
          SplashPRocedureThread = 0
        END
     END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

PrintBPB PROCEDURE                                         ! Generated from procedure template - Report

Progress:Thermometer BYTE                                  !
vl_str               STRING(35)                            !
FilesOpened          BYTE                                  !
vl_no                USHORT                                !
vl_stgl              STRING(20)                            !
vl_jam               TIME                                  !
Process:View         VIEW(GDBPB)
                       PROJECT(GDBPB:Jumlah)
                       PROJECT(GDBPB:Keterangan)
                       PROJECT(GDBPB:Kode_Brg)
                       PROJECT(GDBPB:NoBPB)
                       JOIN(GBAR:KeyKodeBrg,GDBPB:Kode_Brg)
                         PROJECT(GBAR:Nama_Brg)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

report               REPORT,AT(1021,531,6000,10177),PRE(RPT),FONT('Arial',10,COLOR:Black,),THOUS
                       HEADER,AT(1000,302,6031,229),FONT('Arial',8,,FONT:regular)
                       END
break1                 BREAK(GDBPB:NoBPB)
                         HEADER,AT(0,0,,1563)
                           TEXT,AT(21,73,1771,146),USE(vl_str),BOXED,FONT('Arial',8,,FONT:regular),RESIZE
                           STRING(@s10),AT(583,250,677,156),USE(GHBPB:NoBPB),FONT('Arial',8,,FONT:regular)
                           STRING(':'),AT(521,250,42,156),USE(?String18),TRN
                           STRING('Nomor'),AT(21,250,323,156),USE(?String15),TRN,FONT('Arial',8,,FONT:regular)
                           STRING(@D6),AT(583,427,615,156),USE(GHBPB:Tanggal),FONT('Arial',8,,FONT:regular)
                           STRING(@s30),AT(21,750,1771,156),USE(GAPO:Nama_Apotik),FONT('Arial',8,,FONT:regular)
                           STRING(':'),AT(521,417,42,156),USE(?String19),TRN
                           STRING(@t04),AT(1260,427,490,156),USE(vl_jam),FONT('Arial',8,,FONT:regular)
                           STRING('/'),AT(1177,427,94,156),USE(?String16:2),TRN,FONT('Arial',8,,FONT:regular)
                           STRING('Tanggal'),AT(21,427,396,156),USE(?String16),TRN,FONT('Arial',8,,FONT:regular)
                           STRING(':'),AT(521,594,42,156),USE(?String20),TRN
                           STRING('Apotik'),AT(21,594,313,156),USE(?String17),TRN,FONT('Arial',8,,FONT:regular)
                           BOX,AT(21,938,1771,625),COLOR(0400040H)
                           STRING('No'),AT(104,979),USE(?String9),TRN
                           STRING('Kode'),AT(594,979,625,156),TRN
                           STRING('Jumlah'),AT(104,1333,417,208),TRN
                           STRING('Keterangan'),AT(625,1333,833,208),TRN
                           STRING('Nama'),AT(104,1156,521,156),USE(?String10),TRN
                         END
detail1                  DETAIL,AT(,,,448),FONT('Arial',8,,FONT:regular)
                           STRING(@n2),AT(94,10,219,156),CNT,USE(vl_no)
                           STRING(@s10),AT(583,10,729,156),USE(GDBPB:Kode_Brg)
                           STRING(@s40),AT(104,135,1667,208),USE(GBAR:Nama_Brg)
                           STRING(@n8.2),AT(94,271,521,156),USE(GDBPB:Jumlah),LEFT(14)
                           STRING(@s20),AT(583,271,1104,156),USE(GDBPB:Keterangan)
                           LINE,AT(10,438,1771,0),USE(?Line4),COLOR(COLOR:Black)
                         END
                         FOOTER,AT(0,0,,1000)
                           STRING('Mengetahui,'),AT(104,73),USE(?String23),TRN,FONT('Arial',8,,FONT:regular)
                           STRING('Pembuat,'),AT(1083,73),USE(?String21),TRN,FONT('Arial',8,,FONT:regular)
                           STRING(@s20),AT(833,531,938,188),USE(VG_USER),CENTER,FONT('Arial',8,,FONT:regular)
                           LINE,AT(73,719,698,0),USE(?Line2),COLOR(COLOR:Black)
                           LINE,AT(969,719,698,0),USE(?Line2:2),COLOR(COLOR:Black)
                         END
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
  GlobalErrors.SetProcedureName('PrintBPB')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('vg_Bpb',vg_Bpb)                                    ! Added by: Report
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  vl_jam = CLOCK()
  Relate:GApotik.SetOpenRelated()
  Relate:GApotik.Open                                      ! File GApotik used by this procedure, so make sure it's RelationManager is open
  Access:GHBPB.UseFile                                     ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  GHBPB:NoBPB=vg_bpb
  get(ghbpb,GHBPB:KeyNoBPB)
  GAPO:Kode_Apotik=GHBPB:Kode_Apotik
  get(GApotik,GAPO:KeyNoApotik)
  if GHBPB:Status='Tutup' Then
    vl_str='BON PERMINTAAN BARANG'
  else
    vl_str='BON PERMOHONAN PERMINTAAN BARANG'
  end
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintBPB',ProgressWindow)                  ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:GDBPB, ?Progress:PctText, Progress:Thermometer, ProgressMgr, GDBPB:NoBPB)
  ThisReport.AddSortOrder(GDBPB:KeyBPBItem)
  ThisReport.SetFilter('GDBPB:NoBPB=vg_Bpb')
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,report)
  ?Progress:UserString{Prop:Text}=''
  Relate:GDBPB.SetQuickScan(1,Propagate:OneMany)
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
    INIMgr.Update('PrintBPB',ProgressWindow)               ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  GBAR:Kode_brg = GDBPB:Kode_Brg                           ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  GBAR:Kode_brg = GDBPB:Kode_Brg                           ! Assign linking field value
  Access:GBarang.Fetch(GBAR:KeyKodeBrg)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:detail1)
  RETURN ReturnValue

BrowseInputOrder PROCEDURE                                 ! Generated from procedure template - Window

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
str                  STRING(20)                            !
vl_nomor             STRING(10)                            !
loc::thread          BYTE                                  !
BRW1::View:Browse    VIEW(GHBPB)
                       PROJECT(GHBPB:NoBPB)
                       PROJECT(GHBPB:Kode_Apotik)
                       PROJECT(GHBPB:Tanggal)
                       PROJECT(GHBPB:JamInput)
                       PROJECT(GHBPB:Status)
                       PROJECT(GHBPB:UserInput)
                       JOIN(GAPO:KeyNoApotik,GHBPB:Kode_Apotik)
                         PROJECT(GAPO:Nama_Apotik)
                         PROJECT(GAPO:Kode_Apotik)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
GHBPB:NoBPB            LIKE(GHBPB:NoBPB)              !List box control field - type derived from field
GHBPB:Kode_Apotik      LIKE(GHBPB:Kode_Apotik)        !List box control field - type derived from field
GAPO:Nama_Apotik       LIKE(GAPO:Nama_Apotik)         !List box control field - type derived from field
GHBPB:Tanggal          LIKE(GHBPB:Tanggal)            !List box control field - type derived from field
GHBPB:JamInput         LIKE(GHBPB:JamInput)           !List box control field - type derived from field
GHBPB:Status           LIKE(GHBPB:Status)             !List box control field - type derived from field
GHBPB:UserInput        LIKE(GHBPB:UserInput)          !List box control field - type derived from field
GAPO:Kode_Apotik       LIKE(GAPO:Kode_Apotik)         !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(GDBPB)
                       PROJECT(GDBPB:Kode_Brg)
                       PROJECT(GDBPB:Jumlah)
                       PROJECT(GDBPB:Qty_Accepted)
                       PROJECT(GDBPB:Keterangan)
                       PROJECT(GDBPB:NoBPB)
                       JOIN(GBAR:KeyKodeBrg,GDBPB:Kode_Brg)
                         PROJECT(GBAR:Nama_Brg)
                         PROJECT(GBAR:Ket1)
                         PROJECT(GBAR:No_Satuan)
                         PROJECT(GBAR:Ket2)
                         PROJECT(GBAR:Kode_brg)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
GDBPB:Kode_Brg         LIKE(GDBPB:Kode_Brg)           !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:Ket1              LIKE(GBAR:Ket1)                !List box control field - type derived from field
GBAR:No_Satuan         LIKE(GBAR:No_Satuan)           !List box control field - type derived from field
GDBPB:Jumlah           LIKE(GDBPB:Jumlah)             !List box control field - type derived from field
GDBPB:Qty_Accepted     LIKE(GDBPB:Qty_Accepted)       !List box control field - type derived from field
GBAR:Ket2              LIKE(GBAR:Ket2)                !List box control field - type derived from field
GDBPB:Keterangan       LIKE(GDBPB:Keterangan)         !List box control field - type derived from field
GDBPB:NoBPB            LIKE(GDBPB:NoBPB)              !Primary key field - type derived from field
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('BPB '),AT(,,463,258),FONT('Arial',8,,),CENTER,IMM,HLP('BrowseInputOrder'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,447,68),USE(?Browse:1),IMM,HVSCROLL,FONT('Arial',10,COLOR:Black,FONT:regular),COLOR(0FFFF80H,COLOR:Yellow,0808040H),MSG('Browsing Records'),FORMAT('45L(2)|_M~Nomor~@s10@45L(2)|_M~Kode Apotik~@s5@104L(2)|_M~Nama SubFarmasi~@s30@4' &|
   '9R(2)|_M~Tanggal~C(0)@D6@39R(2)|_M~Jam Input~C(0)@t04@28L(2)|_M~Status~@s5@80L(2' &|
   ')|_M~User Input~@s20@'),FROM(Queue:Browse:1)
                       BUTTON('&Tambah (+)'),AT(99,92,67,16),USE(?Insert:2),LEFT,KEY(PlusKey),ICON(ICON:New)
                       BUTTON('&Ubah'),AT(170,93,67,14),USE(?Change:2),DISABLE,HIDE,LEFT,ICON(ICON:Open),DEFAULT
                       BUTTON('&Hapus'),AT(241,93,67,14),USE(?Delete:2),DISABLE,HIDE,LEFT,ICON(ICON:Cut)
                       PANEL,AT(4,114,456,124),USE(?Panel1)
                       LIST,AT(8,118,447,115),USE(?List),IMM,HVSCROLL,FONT('Arial',10,COLOR:Black,FONT:regular),COLOR(0FFFF80H,COLOR:Yellow,0808040H),MSG('Browsing Records'),FORMAT('45L(1)|_M~Kode Brg~C@s10@129L(1)|_M~Nama Obat~C@s40@65L(1)|_M~Kemasan~C@s20@43L(' &|
   '1)|_M~Satuan~C@s10@54D(14)|_M~Jumlah~C(1)@n16.2@48R(1)|_M~Diterima~@n-12.2@77L(1' &|
   ')|_M~Ket~C@s50@80D(14)|_M~Keterangan~C(1)@s20@'),FROM(Queue:Browse)
                       SHEET,AT(4,5,456,107),USE(?CurrentTab)
                         TAB('Terurut berdasar No BPB'),USE(?Tab:2)
                           PROMPT('Nomor:'),AT(17,94),USE(?GHBPB:NoBPB:Prompt)
                           ENTRY(@s10),AT(46,94),USE(GHBPB:NoBPB),MSG('No BPB'),TIP('No BPB')
                           BUTTON('Cek Stok'),AT(327,93,67,14),USE(?Button6)
                         END
                         TAB('Semua BPB'),USE(?Tab2)
                         END
                       END
                       BUTTON('&Selesai'),AT(99,241,67,14),USE(?Close),LEFT,ICON(ICON:Tick)
                       BUTTON('&Print'),AT(170,241,67,14),USE(?Button5),LEFT,FONT('Arial',8,,FONT:bold+FONT:italic),ICON(ICON:Print1)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Ask                    PROCEDURE(BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM) ! Method added to host embed code
ResetFromAsk           PROCEDURE(*BYTE Request,*BYTE Response),DERIVED ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW1::Sort0:Locator  EntryLocatorClass                     ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - choice(?CurrentTab)=2
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW5                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetFromAsk           PROCEDURE(*BYTE Request,*BYTE Response),DERIVED ! Method added to host embed code
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
  GlobalErrors.SetProcedureName('BrowseInputOrder')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('GL_entryapotik',GL_entryapotik)                    ! Added by: BrowseBox(ABC)
  loc::thread=glo::mainthreadno
  !POST(EVENT:Disable_BPB,,loc::thread)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(?Close,RequestCompleted)                    ! Add the close control to the window amanger
  Relate:GApotik.SetOpenRelated()
  Relate:GApotik.Open                                      ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:GNOABPB.Open                                      ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:GNOBBPB.Open                                      ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  Relate:Nomor_SKR.Open                                    ! File Nomor_SKR used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  !set(GNOABPB)
  !loop
  !   access:gnoabpb.next()
  !   break
  !end
  !   If Records(GNOABPB) = 0 Then
  !    GNOABPB:No = 1
  !    GNOABPB:Nomor='BP'&format(month(today()),@P##P)&sub(format(year(today()),@P####P),3,2)&'0001'
  !    access:gnoabpb.Insert()
  !   End
  !
  !if month(today())<>format(sub(GNOABPB:Nomor,3,2),@n2) then
  !   GNOABPB:Nomor='BP'&format(month(today()),@P##P)&sub(format(year(today()),@P####P),3,2)&'0001'
  !   access:gnoabpb.update()
  !   set(GNOBBPB)
  !   loop
  !      if access:gnobbpb.next()<>level:benign then break.
  !      delete(gnobbpb)
  !   end
  !end
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:GHBPB,SELF) ! Initialize the browse manager
  BRW5.Init(?List,Queue:Browse.ViewPosition,BRW5::View:Browse,Queue:Browse,Relate:GDBPB,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Browse:1{Prop:LineHeight} = 0
  ?List{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,GHBPB:KeyNoBPB)                       ! Add the sort order for GHBPB:KeyNoBPB for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,GHBPB:NoBPB,,BRW1)             ! Initialize the browse locator using  using key: GHBPB:KeyNoBPB , GHBPB:NoBPB
  BRW1.SetFilter('(GHBPB:Kode_Apotik=GL_entryapotik and GHBPB:Status = ''tutup'')') ! Apply filter expression to browse
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon GHBPB:NoBPB for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,GHBPB:KeyNoBPB)  ! Add the sort order for GHBPB:KeyNoBPB for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?GHBPB:NoBPB,GHBPB:NoBPB,,BRW1) ! Initialize the browse locator using ?GHBPB:NoBPB using key: GHBPB:KeyNoBPB , GHBPB:NoBPB
  BRW1.SetFilter('(GHBPB:Kode_Apotik=GL_entryapotik and GHBPB:Status = ''tutup'')') ! Apply filter expression to browse
  BRW1.AddField(GHBPB:NoBPB,BRW1.Q.GHBPB:NoBPB)            ! Field GHBPB:NoBPB is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB:Kode_Apotik,BRW1.Q.GHBPB:Kode_Apotik) ! Field GHBPB:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GAPO:Nama_Apotik,BRW1.Q.GAPO:Nama_Apotik)  ! Field GAPO:Nama_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB:Tanggal,BRW1.Q.GHBPB:Tanggal)        ! Field GHBPB:Tanggal is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB:JamInput,BRW1.Q.GHBPB:JamInput)      ! Field GHBPB:JamInput is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB:Status,BRW1.Q.GHBPB:Status)          ! Field GHBPB:Status is a hot field or requires assignment from browse
  BRW1.AddField(GHBPB:UserInput,BRW1.Q.GHBPB:UserInput)    ! Field GHBPB:UserInput is a hot field or requires assignment from browse
  BRW1.AddField(GAPO:Kode_Apotik,BRW1.Q.GAPO:Kode_Apotik)  ! Field GAPO:Kode_Apotik is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse
  BRW5.AddSortOrder(,GDBPB:KeyBPBItem)                     ! Add the sort order for GDBPB:KeyBPBItem for sort order 1
  BRW5.AddRange(GDBPB:NoBPB,Relate:GDBPB,Relate:GHBPB)     ! Add file relationship range limit for sort order 1
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort0:Locator.Init(,GDBPB:Kode_Brg,,BRW5)          ! Initialize the browse locator using  using key: GDBPB:KeyBPBItem , GDBPB:Kode_Brg
  BRW5.AddField(GDBPB:Kode_Brg,BRW5.Q.GDBPB:Kode_Brg)      ! Field GDBPB:Kode_Brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Nama_Brg,BRW5.Q.GBAR:Nama_Brg)        ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Ket1,BRW5.Q.GBAR:Ket1)                ! Field GBAR:Ket1 is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:No_Satuan,BRW5.Q.GBAR:No_Satuan)      ! Field GBAR:No_Satuan is a hot field or requires assignment from browse
  BRW5.AddField(GDBPB:Jumlah,BRW5.Q.GDBPB:Jumlah)          ! Field GDBPB:Jumlah is a hot field or requires assignment from browse
  BRW5.AddField(GDBPB:Qty_Accepted,BRW5.Q.GDBPB:Qty_Accepted) ! Field GDBPB:Qty_Accepted is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Ket2,BRW5.Q.GBAR:Ket2)                ! Field GBAR:Ket2 is a hot field or requires assignment from browse
  BRW5.AddField(GDBPB:Keterangan,BRW5.Q.GDBPB:Keterangan)  ! Field GDBPB:Keterangan is a hot field or requires assignment from browse
  BRW5.AddField(GDBPB:NoBPB,BRW5.Q.GDBPB:NoBPB)            ! Field GDBPB:NoBPB is a hot field or requires assignment from browse
  BRW5.AddField(GBAR:Kode_brg,BRW5.Q.GBAR:Kode_brg)        ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseInputOrder',QuickWindow)             ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
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
    Relate:GApotik.Close
    Relate:GNOABPB.Close
    Relate:GNOBBPB.Close
    Relate:Nomor_SKR.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseInputOrder',QuickWindow)          ! Save window data to non-volatile store
  END
  !POST(EVENT:Enable_BPB,,loc::thread)
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
    UpdateGHBPB
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
      NOM1:No_urut=5
      access:nomor_skr.fetch(NOM1:PrimaryKey)
      if not(errorcode()) then
         if sub(format(year(today()),@p####p),3,2)<format(sub(clip(NOM1:No_Trans),3,2),@n2) then
            message('Tanggal sistem lebih kecil dari tanggal penomoran, tidak bisa dilanjutkan !!!')
            cycle
         elsif month(today())<format(sub(clip(NOM1:No_Trans),5,2),@n2) and sub(format(year(today()),@p####p),3,2)=format(sub(clip(NOM1:No_Trans),3,2),@n2) then
            message('Tanggal sistem lebih kecil dari tanggal penomoran, tidak bisa dilanjutkan !!!')
            cycle
         end
      end
    OF ?Button5
      vg_bpb=GHBPB:NoBPB
      display
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Change:2
      ThisWindow.Update
      !brw5.resetsort(1)
      cycle
    OF ?Delete:2
      ThisWindow.Update
      cycle
    OF ?Button6
      ThisWindow.Update
      START(ProsesStok, 25000)
      ThisWindow.Reset
    OF ?Button5
      ThisWindow.Update
      START(PrintBPB, 25000)
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
    OF EVENT:Timer
      brw1.ResetSort(1)
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Ask PROCEDURE(BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  !if request=3 then
  !   vl_nomor=GHBPB:NoBPB
  !   display
  !end
  ReturnValue = PARENT.Ask(Request)
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


BRW1.ResetFromAsk PROCEDURE(*BYTE Request,*BYTE Response)

  CODE
  PARENT.ResetFromAsk(Request,Response)
  !if request=3 and response=1 then
  !   GNOBBPB:NoBPB=vl_nomor
  !   access:gnobbpb.insert()
  !end
  brw1.resetsort(1)
  brw5.resetsort(1)


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


BRW5.ResetFromAsk PROCEDURE(*BYTE Request,*BYTE Response)

  CODE
  PARENT.ResetFromAsk(Request,Response)
  brw1.resetsort(1)
  brw5.resetsort(1)


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

selectapotik1 PROCEDURE                                    ! Generated from procedure template - Window

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
QuickWindow          WINDOW('Daftar SubFarmasi'),AT(,,216,188),FONT('Arial',8,,),CENTER,IMM,HLP('SelectApotik'),SYSTEM,GRAY,MDI
                       LIST,AT(8,20,200,124),USE(?Browse:1),IMM,HVSCROLL,MSG('Browsing Records'),FORMAT('48L(2)|M~Kode Sub~@s5@80L(2)|M~Nama sub Farmasi~@s30@80L(2)|M~Keterangan~@s20@'),FROM(Queue:Browse:1)
                       BUTTON('&Pilih'),AT(88,147,45,14),USE(?Select:2)
                       SHEET,AT(4,4,208,162),USE(?CurrentTab)
                         TAB('Kode Sub'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Selesai'),AT(88,170,45,14),USE(?Close)
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
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
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
  GlobalErrors.SetProcedureName('selectapotik1')
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
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon GAPO:Kode_Apotik for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,GAPO:KeyNoApotik) ! Add the sort order for GAPO:KeyNoApotik for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,GAPO:Kode_Apotik,1,BRW1)       ! Initialize the browse locator using  using key: GAPO:KeyNoApotik , GAPO:Kode_Apotik
  BRW1.AddField(GAPO:Kode_Apotik,BRW1.Q.GAPO:Kode_Apotik)  ! Field GAPO:Kode_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GAPO:Nama_Apotik,BRW1.Q.GAPO:Nama_Apotik)  ! Field GAPO:Nama_Apotik is a hot field or requires assignment from browse
  BRW1.AddField(GAPO:Keterangan,BRW1.Q.GAPO:Keterangan)    ! Field GAPO:Keterangan is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('selectapotik1',QuickWindow)                ! Restore window settings from non-volatile store
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
    Relate:GApotik.Close
  END
  IF SELF.Opened
    INIMgr.Update('selectapotik1',QuickWindow)             ! Save window data to non-volatile store
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults                                   ! Calculate default control parent-child relationships based upon their positions on the window

