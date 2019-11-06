   PROGRAM



   INCLUDE('ABERROR.INC'),ONCE
   INCLUDE('ABFILE.INC'),ONCE
   INCLUDE('ABFUZZY.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ERRORS.CLW'),ONCE
   INCLUDE('KEYCODES.CLW'),ONCE
include('prnprop.clw')
_CCLSDllMode_   EQUATE(1)
_CCLSLinkMode_  EQUATE(0)
 INCLUDE('EXLCLASS.INC'),ONCE

   MAP
     MODULE('Windows API')
SystemParametersInfo PROCEDURE (LONG uAction, LONG uParam, *? lpvParam, LONG fuWinIni),LONG,RAW,PROC,PASCAL,DLL(TRUE),NAME('SystemParametersInfoA')
     END
     MODULE('APC6NBC.CLW')
DctInit     PROCEDURE                                      ! Initializes the dictionary definition module
DctKill     PROCEDURE                                      ! Kills the dictionary definition module
     END
!--- Application Global and Exported Procedure Definitions --------------------------------------------
     MODULE('APC6N001.CLW')
Main                   PROCEDURE   !
     END
     MODULE('APC6N061.CLW')
cek_kontraktor         PROCEDURE   !
cek_pegawai            PROCEDURE   !
     END
     !    Module('winapi')
     !         SHELLEXECUTE(Unsigned, *CString, *CString, *CString, *CString,Signed),Unsigned, Pascal, Raw, Proc,name('SHELLEXECUTEA'),proc
     !         GetDesktopWindow(), Unsigned, Pascal
     !         !GetWindowText(Long,Long,SIGNED),SIGNED,PASCAL,RAW,NAME('GetWindowTextA')
     !         GetClassName(UNSIGNED,*CSTRING,SIGNED),SIGNED,PASCAL,RAW,NAME('GetClassNameA')
     !         GetWindowText(Long,Long,SIGNED),SIGNED,PASCAL,RAW,NAME('GetWindowTextA')
     !    End
   END

GL_entryapotik       STRING(5)
glo:noepre           STRING(20)
glo:nonota           STRING(20)
QRinObat             QUEUE,PRE()
QRinObat_NoTran        STRING(20)
QRinObat_TransApotik   STRING(20)
QRinObat_KodeBarang    STRING(20)
QRinObat_NoMR          LONG
QRinObat_NamaPasien    STRING(50)
QRinObat_tglTutup      DATE
QRinObat_NamaBarang    STRING(50)
QRinObat_HPP           REAL
QRinObat_HargaJual     REAL
QRinObat_Fee           REAL
QRinObat_Margin        REAL
                     END
glo:tglfilter        DATE
glo:mrfilter         LONG
glo:jumobat          SHORT
glo:tanggalbatal     DATE
glo:apotikfilter     STRING(5)
glo:koderuang        STRING(10)
glo:namaruang        STRING(20)
vg_tanggalopname     DATE
glo:loginmanagerok   BYTE
GLO:INSDIGUNAKAN     STRING(20)
GLO:APOTIKINS        STRING(5)
glo:urut             SHORT
glo:nama             STRING(30)
glo:printerset       STRING(50)
glo:printerkwitansi  STRING(50)
glo:nomorkwitansi    STRING(20)
glo:keterangankwitansi STRING(50)
glo:nobillresep      STRING(20)
glo:mrstring         STRING(20)
glo:nota             STRING(10)
glo:apotik           STRING(5)
glo:nomor            STRING(15)
glo:keluar_masuk_inst BYTE
vg_jum_r             SHORT
glo:nobatal          STRING(15)
glo:sumedang         STRING(15)
vg_kfifo_jumlah      REAL
vg_kfifo_total       REAL
vg_kontraktor        STRING(10)
vg_nip               STRING(7)
gl:kontrak           STRING(10)
gl:cara_bayar        BYTE
gl:nik               STRING(7)
gl:nota              STRING(10)
glo:instalasi        STRING(5)
glo::mainthreadno    BYTE
glo:tahun            LONG
glo:bulan            SHORT
glo_kode_barang      STRING(10)
glo_kls_rawat        STRING(3)
glo::tgl_awal_kerja  DATE
GL_PPN               ULONG
glo:flag             BYTE
GLO:KUNCI1           STRING('''~@()&*%#JjAP*(&#@'' {1}')
GLO:KUNCI            STRING('''&*%^@!90123k90wdqs''')
GLO:LEVEL            BYTE
GLO:AKSES            STRING(20)
GLO:BAGIAN           STRING(20)
GLO:JAM              LONG
GLO:TANGGAL          LONG
VG_TANGGAL1          LONG
VG_TANGGAL2          LONG
vg_bpb               STRING(10)
jumlah_keluar        REAL
Glo::no_mr           LONG
Glo:USER_ID          STRING(10)
Glo:Tempat           STRING(10)
Glo:Rekap            LONG
coba                 STRING(5)
Glo:lap              STRING(20)
GL_beaR              LONG
GL_Um_kls1           BYTE
GL_KLS3              BYTE
GL_KLS_vip           BYTE
GL_nt_kls2           LONG
key_sel              BYTE
VG_USER              STRING(20)
VG_Login             STRING(20)
GL_namaapotik        STRING(30)
status               BYTE
Dtd_ndtd             BYTE
glo::campur          BYTE
GLO::back_up         STRING(10)
GL::Prefix           STRING(4)
GLO::jml_cmp         LONG
GLO:TanggalAwal      LONG
Glo:TanggalAkhir     LONG
glo::form_insert     BYTE
glo::no_nota         STRING(15)
glo::nomor           STRING(15)
Glo::kode_apotik     STRING(5)
Glo::rwt1            BYTE
glo::rwt2            BYTE
glo::rwt3            BYTE
glo::rwtvip          BYTE
glo:no_trans_ruang   STRING(15)
Que:P                QUEUE,PRE()
qp:kode_barang         STRING(10)
qp:nama_barang         STRING(20)
qp:jumlah              REAL
qp:harga               REAL
qp:sat                 STRING(10)
                     END
Que::Print           QUEUE,PRE()
gloq::Kode_brg         STRING(20)
gloq::nama_brg         STRING(30)
gloq::keluar           REAL
gloq::Retur            REAL
gloq::total            REAL
gloq::harga            REAL
gloq::total_harga      REAL
                     END
Glo:QueFifo          QUEUE,PRE()
Tanggal                DATE
NomorIn                STRING(20)
JumlahIn               REAL
HargaIn                REAL
TotalIn                REAL
NomorOut               STRING(20)
JumlahOut              REAL
HargaOut               REAL
TotalOut               REAL
Tanggalout             DATE
harga_jual             REAL
hargasaldo             REAL
jumlahsaldo            REAL
totalsaldo             REAL
nomormr                LONG
namapasien             STRING(20)
                     END
glo:statusSMD        BYTE
glo:mr               LONG
Glo:TglAwal          DATE
Glo:TglAkhir         DATE
glo:Mr_cetakNota     LONG
glo:urut_pas_cetakNota USHORT
glo:bpjs_no_mr       LONG
glo:bpjs_tanggal     DATE
glo:bpjs_biaya       REAL
glo:bpjs_no_tran     STRING(20)
glo:bpjs_nonota      STRING(20)
glo:bpjs_jam         LONG
glo:bpjs_kode_apotik STRING(20)
glo:bpjs_asal        STRING(20)
glo:bpjs_user        STRING(20)
glo:bpjs_cara_bayar  SHORT
glo:bpjs_kontrak     STRING(20)
glo:bpjs_dokter      STRING(20)
glo:bpjs_lunas       STRING(20)
glo:bpjs_nama_pasien STRING(100)
glo:bpjs_alamat_pasien STRING(256)
glo:bpjs_urut        SHORT
glo:bpjs_noPaket     SHORT
vg_notrans           STRING(20)
vg_kodeapotik        STRING(20)
GLO:HARGA_DASAR      LONG
GLO:HARGA_DASAR_BATAL LONG
GLO:HARGA_DASAR_RETUR LONG
GLO:HARGA_DASAR_INAP LONG
GLO:HARGA_DASAR_INAP_RETUR LONG
GLO:HARGA_DASAR_INAP_RETUR_PEROBAT LONG
vg_shift_apotik      USHORT
glo:biaya_total_batal REAL
glo:isRacik          BYTE
glo:reseprajal1      BYTE
glo:reseprajal2      BYTE
glo:reseprajal3      BYTE
glo:reseprajal4      BYTE
glo:reseprajal5      BYTE
glo:resepranap1      BYTE
glo:resepranap2      BYTE
glo:resepranap3      BYTE
glo:resepranap4      BYTE
glo:resepranap5      BYTE
glo:totalreseprajal1 SHORT
glo:totalreseprajal2 SHORT
glo:totalreseprajal3 SHORT
glo:totalreseprajal4 SHORT
glo:totalreseprajal5 SHORT
glo:totalresepranap1 SHORT
glo:totalresepranap2 SHORT
glo:totalresepranap3 SHORT
glo:totalresepranap4 SHORT
glo:totalresepranap5 SHORT
glo:ktt              BYTE
glo:nota_retur       STRING(20)
SilentRunning        BYTE(0)                               ! Set true when application is running in 'silent mode'

APEPREH              FILE,DRIVER('SQLAnywhere'),NAME('dba.APEPREH'),PRE(APE3),CREATE,BINDABLE,THREAD
by_medrec                KEY(APE3:Nomor_mr),DUP,NOCASE,OPT
by_transaksi             KEY(APE3:N0_tran),OPT,PRIMARY
BY_KODEAP                KEY(APE3:Kode_Apotik),DUP,NOCASE,OPT
keytanggal               KEY(APE3:Tanggal),DUP,NOCASE,OPT
KeyNoMrAsal              KEY(APE3:Nomor_mr,APE3:Asal),DUP,NOCASE,OPT
dokter_apepreh_fk        KEY(APE3:Dokter),DUP,NOCASE,OPT
nonota_apepreh_fk        KEY(APE3:NoNota),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_mr                    LONG
Tanggal                     DATE
Biaya                       REAL
N0_tran                     STRING(20)
User                        STRING(20)
Bayar                       BYTE
Ra_jal                      BYTE
Asal                        STRING(10)
cara_bayar                  BYTE
Kode_Apotik                 STRING(10)
Batal                       BYTE
Diskon                      REAL
NIP                         STRING(7)
Kontrak                     STRING(10)
LamaBaru                    BYTE
Dokter                      STRING(5)
NoNota                      STRING(16)
Urut                        SHORT
Ruang                       STRING(10)
NoPaket                     SHORT
Racikan                     BYTE
Jam                         TIME
NomorEpresribing            STRING(20)
Resep                       BYTE
NilaiKontrak                REAL
NilaiTunai                  REAL
NilaiDitagih                REAL
                         END
                     END                       

JPengirim            FILE,DRIVER('SQLAnywhere'),NAME('dba.JPengirim'),PRE(JPE),CREATE,BINDABLE,THREAD
primarykey               KEY(JPE:No),NOCASE,OPT,PRIMARY
nama_jpengirim_key       KEY(JPE:Nama),DUP,NOCASE,OPT
salesman_jpengirim_fk    KEY(JPE:Salesman),DUP,NOCASE,OPT
Record                   RECORD,PRE()
No                          LONG
Nama                        STRING(50)
Jenis                       SHORT
Alamat                      STRING(50)
Telp                        STRING(20)
HP                          STRING(20)
Salesman                    STRING(10)
                         END
                     END                       

HM_BARANGNEW         FILE,DRIVER('SQLAnywhere'),NAME('DBA.HM_BARANGNEW'),PRE(HM_),BINDABLE,THREAD
PK                       KEY(HM_:KODEBARANG),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
KODEBARANG                  STRING(11)
KODEGF                      STRING(2)
KODEPB                      STRING(3)
KODEBS                      STRING(2)
KODESM                      STRING(2)
KDGLBAR                     STRING(1)
KDGRBAR                     STRING(1)
KDFMKLG                     STRING(10)
KDTENGAH                    STRING(2)
NAMABARANG                  CSTRING(51)
HARGARWJ                    PDECIMAL(11,2)
HARGABELI                   PDECIMAL(11,2)
MRGPROFIT                   PDECIMAL(7,2)
HARGAAVG                    PDECIMAL(19,4)
STSBARANG                   STRING(1)
SATUANJUAL                  STRING(15)
NOITEMBAR                   CSTRING(8)
TGLAKTIF                    STRING(8)
TGLAKTIF_GROUP              GROUP,OVER(TGLAKTIF)
TGLAKTIF_DATE                 DATE
TGLAKTIF_TIME                 TIME
                            END
STANDAR                     STRING(1)
SAT_INDEKS                  PDECIMAL(19)
QTYGD                       PDECIMAL(13,2)
AWQTYGD                     PDECIMAL(13,2)
STDMINGD                    PDECIMAL(13,2)
STDMAXGD                    PDECIMAL(13,2)
SCMTRCD                     STRING(10)
EXPDATE                     STRING(8)
EXPDATE_GROUP               GROUP,OVER(EXPDATE)
EXPDATE_DATE                  DATE
EXPDATE_TIME                  TIME
                            END
JENIS                       STRING(1)
ANASTHESI                   STRING(1)
QTYFISIK                    PDECIMAL(19,2)
valid                       STRING(1)
TYPEOBAT                    STRING(1)
FLAGBHP                     STRING(1)
KODEREKPERSEDIAAN           CSTRING(21)
KODEREKRESEP                CSTRING(21)
KODEREKRESEPRI              CSTRING(21)
KODEREKRESEPPT              CSTRING(21)
KODEREKRESEPRIPT            CSTRING(21)
KODEREKBIAYA                CSTRING(21)
HARGABELILM                 PDECIMAL(19)
KDGRPROFIT                  STRING(2)
KONVERSI_NETTO              PDECIMAL(19)
KONVERSI_SERAPAN            PDECIMAL(19)
KDKLSTRP                    STRING(3)
KDSUBKLSTRP                 STRING(3)
KODEGENERIC                 STRING(3)
                         END
                     END                       

ASetApotik           FILE,DRIVER('TOPSPEED'),NAME('ASetApotik'),PRE(ASE),CREATE,BINDABLE,THREAD
PK                       KEY(ASE:KodeApotik),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
KodeApotik                  STRING(5)
                         END
                     END                       

TBTransResepDokterDetail FILE,DRIVER('SQLAnywhere'),NAME('dba.TBTransResepDokterDetail'),PRE(TBT),CREATE,BINDABLE,THREAD
PK                       KEY(TBT:NoTrans,TBT:ItemCode),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
NoTrans                     STRING(20)
ItemCode                    STRING(20)
ItemName                    STRING(100)
Nomor                       REAL
Isi                         STRING(15)
Qty                         REAL
Unit                        STRING(15)
Keterangan                  STRING(50)
StatusResep                 SHORT
KodeZat                     STRING(10)
                         END
                     END                       

JHBILLING            FILE,DRIVER('SQLAnywhere'),NAME('DBA.JHBILLING'),PRE(JHB),CREATE,BINDABLE,THREAD
KNOMOR                   KEY(JHB:NOMOR),NOCASE,OPT,PRIMARY
KMR                      KEY(JHB:MR),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NOMOR                       STRING(20)
TGL                         DATE
MR                          LONG
JENIS_TRANSAKSI             BYTE
KETERANGAN                  STRING(20)
TOTALBIAYA                  REAL
JUMLAH_BYR                  REAL
SISA_BYR                    REAL
NoRegRinap                  STRING(20)
NoUrutRinap                 SHORT
StatusPindahKeInap          BYTE
StatusJalanInap             BYTE
DiscountTtl                 REAL
SelisihTtl                  REAL
StatusIsiSelisih            BYTE
StatusIsidiscount           BYTE
KodeKontraktor              STRING(20)
StatusBatal                 BYTE
Nip                         STRING(30)
TglSuratPengantar           DATE
NoSuratPengantar            STRING(30)
NamaPegawai                 STRING(40)
Keterangan_NamaPasien       STRING(40)
Golongan                    STRING(20)
DITANGGUNG                  REAL
TDDITANGGUNG                REAL
TUTUP                       BYTE
TglTutup                    DATE
                         END
                     END                       

JDDBILLING           FILE,DRIVER('SQLAnywhere'),NAME('DBA.JDDBILLING'),PRE(JDDB),CREATE,BINDABLE,THREAD
PK1                      KEY(JDDB:NOMOR,JDDB:NOTRAN_INTERNAL,JDDB:KODEJASA,JDDB:SUBKODEJASA),NOCASE,OPT,PRIMARY
KSUBKODEJASA             KEY(JDDB:SUBKODEJASA),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NOMOR                       STRING(20)
NOTRAN_INTERNAL             STRING(20)
KODEJASA                    STRING(20)
SUBKODEJASA                 STRING(20)
KETERANGAN                  STRING(20)
JUMLAH                      REAL
TOTALBIAYA                  REAL
SELISIH                     REAL
DISCOUNT                    REAL
discount2                   REAL
Selisih2                    REAL
DiscountJdbilling           REAL
SelisihJdBilling            REAL
StatusSelisih               BYTE
PenambahanPengurangan       REAL
kode_dr                     STRING(20)
PembJsDrTunai               REAL
PemJsDrKtr                  REAL
Status_Batal_Produksi       BYTE
KoreksiTarif                REAL
DTG_JD                      REAL
DTG_JDD                     REAL
DTG_JH                      REAL
hppobat                     REAL
                         END
                     END                       

JDBILLING            FILE,DRIVER('SQLAnywhere'),NAME('DBA.JDBILLING'),PRE(JDB),CREATE,BINDABLE,THREAD
PK1                      KEY(JDB:NOMOR,JDB:NOTRAN_INTERNAL,JDB:KODEJASA),NOCASE,OPT,PRIMARY
notranint_jdbilling_ik   KEY(JDB:NOTRAN_INTERNAL),DUP,NOCASE,OPT
K_KODEJASA               KEY(JDB:KODEJASA),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NOMOR                       STRING(20)
NOTRAN_INTERNAL             STRING(20)
KODEJASA                    STRING(20)
TOTALBIAYA                  REAL
KETERANGAN                  STRING(20)
JUMLAH                      REAL
JUMLAH_BYR                  REAL
SISA_BYR                    REAL
NO_PEMBAYARAN               STRING(20)
KODE_DOKTER                 STRING(20)
KODE_BAGIAN                 STRING(20)
STATUS_TUTUP                BYTE
DISCOUNT                    REAL
BYRSELISIH                  REAL
VALIDASI                    BYTE
NOREGRINAP                  BYTE
NOURUTRINAP                 BYTE
Selisih2                    REAL
Discount2                   REAL
DisJddbilling               REAL
SelisihJddbilling           REAL
PdPm                        STRING(5)
InstalasiInap               STRING(20)
TindItrPsman                STRING(20)
StatusBatal                 BYTE
StrukPembatalan             STRING(20)
UsrValidasi                 STRING(20)
JmValidasi                  TIME
TglValidasi                 DATE
UsrPembatalan               STRING(20)
NoKomputerBilling           BYTE
JenisPembayaran             BYTE
StatusChekUp                BYTE
PenambahanPengurangan       REAL
TglTransaksi                DATE
JamTransaksi                TIME
KodeKassa                   STRING(1)
TglByr                      DATE
ValidasiProduksi            BYTE
TglValidasiProduksi         DATE
JamValidasiProduksi         TIME
UservalidasiProduksi        STRING(20)
Status_Batal_Produksi       BYTE
PeriodeKtr                  DATE
KetTindKtr                  STRING(40)
DTG_JH                      REAL
DTG_JD                      REAL
DTG_JDD                     REAL
T_DTG_JH                    REAL
T_DTG_JD                    REAL
T_DTG_JDD                   REAL
T_01                        REAL
T_02                        REAL
T_03                        REAL
T_04                        REAL
T_01JDD                     REAL
T_02JDD                     REAL
T_03JDD                     REAL
T_04JDD                     REAL
NT_01                       REAL
NT_02                       REAL
NT_03                       REAL
NT_04                       REAL
NT_01JDD                    REAL
NT_02JDD                    REAL
NT_03JDD                    REAL
NT_04JDD                    REAL
PenamPengJdd                REAL
Status_isi_dtg_val          BYTE
Status_gab                  BYTE
Nobill_Gab                  STRING(20)
StatusTindLain              BYTE
Pembulatan                  REAL
JenisTarif                  USHORT
TipeDr                      BYTE
JenisTarif_Kor              USHORT
KoreksiTarif                REAL
Disc_PertindKtr             REAL
hppobat                     REAL
                         END
                     END                       

FileSql2             FILE,DRIVER('SQLAnywhere'),NAME('dba.FileSql2'),PRE(FIL1),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(FIL1:Long1),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
Long1                       LONG
Long2                       LONG
Long3                       LONG
Long4                       LONG
Long5                       LONG
Long6                       LONG
Long7                       LONG
Long8                       LONG
Long9                       LONG
Long10                      LONG
Real1                       REAL
Real2                       REAL
Real3                       REAL
Real4                       REAL
Real5                       REAL
Real6                       REAL
Real7                       REAL
Real8                       REAL
Real9                       REAL
Real10                      REAL
Byte1                       BYTE
Byte2                       BYTE
Byte3                       BYTE
Byte4                       BYTE
Byte5                       BYTE
Short1                      SHORT
Short2                      SHORT
Short3                      SHORT
Short4                      SHORT
Short5                      SHORT
String1                     STRING(1000)
String2                     STRING(100)
String3                     STRING(1000)
String4                     STRING(1000)
String5                     STRING(1000)
String6                     STRING(1000)
String7                     STRING(1000)
String8                     STRING(1000)
String9                     STRING(1000)
String10                    STRING(1000)
Date1                       DATE
Date2                       DATE
Date3                       DATE
Date4                       DATE
Date5                       DATE
Date6                       DATE
Date7                       DATE
Date8                       DATE
Date9                       DATE
Date10                      DATE
Time1                       TIME
Time2                       TIME
Time3                       TIME
Time4                       TIME
Time5                       TIME
                         END
                     END                       

JKontrakObat         FILE,DRIVER('SQLAnywhere'),NAME('dba.JKontrakObat'),PRE(JKOO),CREATE,BINDABLE,THREAD
by_kode_ktr              KEY(JKOO:KodeKontrak,JKOO:Kode_brg),NOCASE,OPT,PRIMARY
by_kode_brg              KEY(JKOO:Kode_brg),DUP,NOCASE,OPT
Record                   RECORD,PRE()
KodeKontrak                 LONG
Kode_brg                    STRING(10)
PERS_TAMBAH                 BYTE
                         END
                     END                       

ApEmbalase           FILE,DRIVER('SQLAnywhere'),NAME('dba.ApEmbalase'),PRE(APE2),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(APE2:No),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
No                          SHORT
Keterangan                  STRING(30)
Rupiah                      REAL
                         END
                     END                       

VAPDTRANS            FILE,DRIVER('SQLAnywhere'),NAME('dba.VAPDTRANS'),PRE(APD4),CREATE,BINDABLE,THREAD
PK                       KEY(APD4:N0_tran,APD4:Kode_brg,APD4:Camp),OPT,PRIMARY
kodebrg_apdtrans_fk      KEY(APD4:Kode_brg),DUP,OPT
Record                   RECORD,PRE()
N0_tran                     STRING(15)
Kode_brg                    STRING(10)
Jumlah                      REAL
Total                       LONG
Camp                        ULONG
Harga_Dasar                 REAL
Diskon                      REAL
Jum1                        SHORT
Jum2                        SHORT
StatusPaket                 BYTE
Kontrak                     REAL
Tunai                       REAL
Ditagih                     REAL
PPN                         REAL
namaobatracik               STRING(40)
total_dtg                   REAL
ktt                         BYTE
                         END
                     END                       

APEPRED              FILE,DRIVER('SQLAnywhere'),NAME('dba.APEPRED'),PRE(APE4),CREATE,BINDABLE,THREAD
by_transaksi             KEY(APE4:N0_tran),DUP,OPT
notran_kode              KEY(APE4:N0_tran,APE4:Kode_brg,APE4:Camp),OPT,PRIMARY
by_kodebrg               KEY(APE4:Kode_brg),DUP,OPT
by_tran_cam              KEY(APE4:N0_tran,APE4:Camp),DUP,OPT
Record                   RECORD,PRE()
N0_tran                     STRING(15)
Kode_brg                    STRING(10)
Jumlah                      REAL
Total                       LONG
Camp                        ULONG
Harga_dasar                 REAL
Diskon                      REAL
jum1                        SHORT
jum2                        SHORT
StatusPaket                 BYTE
Kontrak                     REAL
Tunai                       REAL
Ditagih                     REAL
Frekuensi                   REAL
JumFrekuensi                REAL
Keterangan                  STRING(50)
                         END
                     END                       

AFIFOOUTTemp         FILE,DRIVER('SQLAnywhere'),NAME('DBA.AFIFOOUTTemp'),PRE(AFI21),BINDABLE,THREAD
KEY1                     KEY(AFI21:Kode_Barang,AFI21:Mata_Uang,AFI21:NoTransaksi,AFI21:Transaksi,AFI21:Kode_Apotik,AFI21:NoTransKeluar),PRIMARY
urut1_afifoouttemp_key   KEY(AFI21:Kode_Barang,AFI21:Tanggal,AFI21:Jam),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Kode_Barang                 STRING(10),NAME('Kode_Barang')
Mata_Uang                   STRING(5),NAME('Mata_Uang')
NoTransaksi                 STRING(15),NAME('NoTransaksi')
Transaksi                   BYTE,NAME('Transaksi')
NoTransKeluar               STRING(15),NAME('NoTransKeluar')
Tanggal                     DATE,NAME('Tanggal')
Harga                       REAL,NAME('Harga')
Jumlah                      REAL,NAME('Jumlah')
Tgl_Update                  DATE,NAME('Tgl_Update')
Jam_Update                  TIME,NAME('Jam_Update')
Operator                    STRING(20),NAME('Operator')
Jam                         TIME,NAME('Jam')
Kode_Apotik                 STRING(5),NAME('Kode_Apotik')
                         END
                     END                       

APDTRANSBackup       FILE,DRIVER('SQLAnywhere'),NAME('dba.APDTRANSBackup'),PRE(APD3),CREATE,BINDABLE,THREAD
by_transaksi             KEY(APD3:N0_tran),DUP,OPT
notran_kode              KEY(APD3:N0_tran,APD3:Kode_brg,APD3:Camp),OPT,PRIMARY
by_kodebrg               KEY(APD3:Kode_brg),DUP,OPT
by_tran_cam              KEY(APD3:N0_tran,APD3:Camp),DUP,OPT
Record                   RECORD,PRE()
N0_tran                     STRING(15)
Kode_brg                    STRING(10)
Jumlah                      REAL
Total                       LONG
Camp                        ULONG
Harga_Dasar                 REAL
Diskon                      REAL
Jum1                        SHORT
Jum2                        SHORT
                         END
                     END                       

vstokfifo            FILE,DRIVER('SQLAnywhere'),NAME('dba.vstokfifo'),PRE(VST),CREATE,BINDABLE,THREAD
primarykey               KEY(VST:kode_barang,VST:kode_apotik),NOCASE,OPT,PRIMARY
apotik_vstokfifo_key     KEY(VST:kode_apotik),DUP,NOCASE,OPT
Record                   RECORD,PRE()
kode_barang                 STRING(10)
jumlah                      REAL
kode_apotik                 STRING(5)
                         END
                     END                       

SMUnit_Master        FILE,DRIVER('SQLAnywhere'),NAME('DBA.SMUnit_Master'),PRE(UNM),CREATE,BINDABLE,THREAD
Key1                     KEY(UNM:NO),NOCASE,OPT,PRIMARY
KeyNama                  KEY(UNM:Nama),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NO                          USHORT
Nama                        STRING(20)
                         END
                     END                       

APHTRANSBackup       FILE,DRIVER('SQLAnywhere'),NAME('dba.APHTRANSBackup'),PRE(APH2),CREATE,BINDABLE,THREAD
by_medrec                KEY(APH2:Nomor_mr),DUP,NOCASE,OPT
Prescribe_Aphtrans_FK    KEY(APH2:NomorEPresribing),DUP,NOCASE,OPT
nonota_aphtras_key       KEY(APH2:NoNota),DUP,NOCASE,OPT
dokter_aphtrans_fk       KEY(APH2:dokter),DUP,NOCASE,OPT
by_transaksi             KEY(APH2:N0_tran),OPT,PRIMARY
BY_KODEAP                KEY(APH2:Kode_Apotik),DUP,OPT
keytanggal               KEY(APH2:Tanggal),DUP,NOCASE,OPT
KeyNoMrAsal              KEY(APH2:Nomor_mr,APH2:Asal),DUP,NOCASE,OPT
Pegawai_aphtrans_fk      KEY(APH2:NIP),DUP,NOCASE,OPT
Kontrak_aphtrans_fk      KEY(APH2:Kontrak),DUP,NOCASE,OPT
nopaket_aphtrans_fk      KEY(APH2:NoPaket),DUP,NOCASE,OPT
Ktgl_jam                 KEY(APH2:Tanggal,APH2:Jam),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_mr                    LONG
Tanggal                     DATE
Biaya                       REAL
N0_tran                     STRING(15)
User                        STRING(4)
Bayar                       BYTE
Ra_jal                      BYTE
Asal                        STRING(10)
cara_bayar                  BYTE
Kode_Apotik                 STRING(5)
Batal                       BYTE
Diskon                      REAL
NIP                         STRING(7)
Kontrak                     STRING(10)
LamaBaru                    BYTE
dokter                      STRING(5)
NoNota                      STRING(10)
Urut                        SHORT
Ruang                       STRING(10)
NoPaket                     SHORT
Racikan                     BYTE
Jam                         TIME
NomorEPresribing            STRING(20)
                         END
                     END                       

ApNotaObat           FILE,DRIVER('SQLAnywhere'),NAME('DBA.ApNotaObat'),PRE(APN1),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(APN1:Nomor),NOCASE,OPT,PRIMARY
Pegawai_APNotaObat_FK    KEY(APN1:NIP),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor                       STRING(15)
NIP                         STRING(7)
                         END
                     END                       

SMRUnker             FILE,DRIVER('SQLAnywhere'),NAME('DBA.SMRUnker'),PRE(RUNK),CREATE,BINDABLE,THREAD
Pkey                     KEY(RUNK:KodeUnker),NAME('Pkey'),NOCASE,OPT,PRIMARY
KeyNama                  KEY(RUNK:Nama),DUP,NOCASE,OPT
KeyUnitMaster            KEY(RUNK:Unit_Master),DUP,NOCASE,OPT
KeyNewCode               KEY(RUNK:NewCode),DUP,NOCASE,OPT
Record                   RECORD,PRE()
KodeUnker                   STRING(2)
Nama                        STRING(30)
Manajer                     STRING(20)
Unit_Master                 USHORT
NewCode                     STRING(1)
Kupon                       LONG
Kelas_PA                    BYTE
                         END
                     END                       

SMPegawai            FILE,DRIVER('SQLAnywhere'),NAME('DBA.SMPegawai'),PRE(PEGA),CREATE,BINDABLE,THREAD
Pkey                     KEY(PEGA:Nik),PRIMARY
KeyTanggalMasuk          KEY(PEGA:Tgl_Masuk_kerja),DUP,NOCASE,OPT
KeyTglLahir              KEY(PEGA:Tgl_Lahir),DUP,NOCASE,OPT
KeyNikLama               KEY(PEGA:NIK_Lama),DUP
KeyRPend                 KEY(PEGA:RPend),DUP,OPT
KeyJabatan               KEY(PEGA:Jabatan),DUP,OPT
KeyUnit                  KEY(PEGA:Unit),DUP,OPT
KeyNama                  KEY(PEGA:Nama),DUP
KeyAbsen                 KEY(PEGA:No_Absen),DUP
KeySub_UnitPeg           KEY(PEGA:Sub_Bagian),DUP,OPT
KeyNikPalingBaru         KEY(PEGA:NIK_PALING_BARU),DUP,NOCASE,OPT
Profesi_Pegawai_FK       KEY(PEGA:Profesi),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nik                         STRING(7)
Nama                        STRING(40)
GajiPokok                   REAL
NPanggil                    STRING(20)
Photo                       STRING(120)
Status                      USHORT
T_Jabatan                   REAL
T_Variabel                  REAL
Jenis_Kelamin               BYTE
Tgl_Lahir                   DATE
Tempat_Lahir                STRING(30)
Agama                       BYTE
Alamat                      STRING(75)
Telepon                     STRING(20)
Tgl_Masuk_kerja             DATE
Jabatan                     STRING(3)
Unit                        STRING(2)
User_Name                   STRING(20)
No_Pelamar                  STRING(10)
Keputusan                   STRING(30)
Tgl_Pengangkatan            DATE
RPend                       STRING(4)
Golongan                    STRING(5)
Kategori                    STRING(20)
Sistem_Gaji                 BYTE
Tgl_Menjabat                DATE
Shift                       BYTE
Jenis_Pegawai               BYTE
No_Urut                     STRING(5)
Nikah                       BYTE
Fix_Sallary                 BYTE
Lembur                      REAL
NIK_Lama                    STRING(7)
Ket_Bagian                  STRING(30)
Ket_Jabatan                 STRING(30)
Lembur_Tetap                BYTE
Uang_Makan                  REAL
Astek                       BYTE
SPSI                        BYTE
Koperasi                    BYTE
Laporan                     BYTE
T_Prestasi                  REAL
No_Absen                    STRING(10)
T_Keahlian                  REAL
Sub_Bagian                  STRING(5)
Alamat_Dulu                 STRING(75)
RT                          STRING(4)
RW                          STRING(4)
Kota                        STRING(30)
Kode_Pos                    STRING(5)
Status_Rumah                BYTE
No_KTP                      STRING(25)
WargaNegara                 BYTE
GolDarah                    STRING(2)
Tinggi                      REAL
Berat                       REAL
Status_Kawin                STRING(1)
Transportasi                BYTE
Jenis_Kendaraan             BYTE
Pemilik_Kendaraan           BYTE
No_SIM                      STRING(15)
Transport                   BYTE
NIK_PALING_BARU             STRING(10)
Direct_Indirect             STRING(2)
Absen                       BYTE
Profesi                     SHORT
Pensiun                     BYTE
NoRekening                  STRING(25)
                         END
                     END                       

JtmTinRj             FILE,DRIVER('SQLAnywhere'),NAME('dba.JtmTinRj'),PRE(JTM),CREATE,BINDABLE,THREAD
KNotaJenisMr             KEY(JTM:Nota,JTM:Jenis,JTM:Tgl,JTM:KodeTran2),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
Nota                        STRING(10)
Tgl                         DATE
Kassa                       STRING(10)
Tmpat                       STRING(10)
Mr                          LONG
Jenis                       BYTE
KodeTran2                   STRING(20)
Biaya                       REAL
NamaTindakan                STRING(30)
Keterangan                  STRING(60)
                         END
                     END                       

APObatRuang          FILE,DRIVER('SQLAnywhere'),NAME('DBA.APObatRuang'),PRE(APO1),BINDABLE,THREAD
PK                       KEY(APO1:NoTransaksi),PRIMARY
Apotik_ObatRuangan_FK    KEY(APO1:Kode_Apotik),DUP,NOCASE,OPT
Barang_ObatRuangan_FK    KEY(APO1:Kode_Barang),DUP,NOCASE,OPT
Mitra_APObatRuang_FK     KEY(APO1:KodeMitra),DUP,NOCASE,OPT
Jpasien_APObatRuang_FK   KEY(APO1:NomorMR),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NoTransaksi                 STRING(20),NAME('NoTransaksi')
Kode_Apotik                 STRING(5),NAME('Kode_Apotik')
Kode_Barang                 STRING(10),NAME('Kode_Barang')
JenisTransaksi              BYTE,NAME('JenisTransaksi')
Tanggal                     DATE,NAME('Tanggal')
Jam                         TIME,NAME('Jam')
Jumlah                      REAL
Harga                       REAL
Diskon                      REAL
Total                       REAL
Status                      BYTE
NomorMR                     LONG
NomorTransaksiRanap         STRING(20)
Kelas                       STRING(10)
KodeMitra                   STRING(10)
JenisPasien                 BYTE
no_urut                     SHORT
                         END
                     END                       

ApPaketH             FILE,DRIVER('SQLAnywhere'),NAME('dba.ApPaketH'),PRE(APP2),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(APP2:No),NOCASE,OPT,PRIMARY
nama_apaketh_ik          KEY(APP2:Keterangan),DUP,NOCASE,OPT
Record                   RECORD,PRE()
No                          SHORT
Keterangan                  STRING(30)
Harga                       REAL
                         END
                     END                       

ApNotaManual         FILE,DRIVER('TOPSPEED'),NAME('dba.ApNotaManual'),PRE(APN),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(APN:Kode_Apotik,APN:Tanggal,APN:Status,APN:Jenis_Pasien),NOCASE,OPT,PRIMARY
Apotik_ApNotaManual_FK   KEY(APN:Kode_Apotik),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Kode_Apotik                 STRING(5)
Tanggal                     DATE
Status                      BYTE
Jenis_Pasien                BYTE
Jumlah_R                    LONG
Jumlah_Lbr                  LONG
Jumlah_Rupiah               REAL
                         END
                     END                       

Apetiket1            FILE,DRIVER('SQLAnywhere'),NAME('DBA.Apetiket1'),PRE(Ape1),BINDABLE,THREAD
KEY1                     KEY(Ape1:No),PRIMARY
nama_etiket1_key         KEY(Ape1:Nama),DUP,NOCASE,OPT
Record                   RECORD,PRE()
No                          BYTE,NAME('No')
Nama                        STRING(30),NAME('Nama')
                         END
                     END                       

ASaldoAwal           FILE,DRIVER('SQLAnywhere'),NAME('dba.ASaldoAwal'),PRE(ASA),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(ASA:Kode_Barang,ASA:Apotik,ASA:Bulan,ASA:Tahun),NOCASE,OPT,PRIMARY
Barang_ASaldoAwal_FK     KEY(ASA:Kode_Barang),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Kode_Barang                 STRING(10)
Apotik                      STRING(5)
Bulan                       SHORT
Tahun                       SHORT
Jumlah                      REAL
Harga                       REAL
Total                       REAL
                         END
                     END                       

Aphtransadd          FILE,DRIVER('SQLAnywhere'),NAME('dba.aphtransadd'),PRE(APH1),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(APH1:Nomor),OPT,PRIMARY
itbrrwt_ruangan_fk       KEY(APH1:Ruangan),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor                       STRING(15)
Ruangan                     STRING(10)
                         END
                     END                       

OKBiayaLain          FILE,DRIVER('SQLAnywhere'),NAME('DBA.OKBiayaLain'),PRE(OKB),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(OKB:Nomor,OKB:Nama_Tindakan),OPT,PRIMARY
KeyNamaTind_OKLain       KEY(OKB:Nama_Tindakan),DUP,OPT
keynomor                 KEY(OKB:Nomor),DUP
Record                   RECORD,PRE()
Nomor                       STRING(12)
Nama_Tindakan               STRING(10)
biaya                       REAL
Keterangan                  STRING(30)
                         END
                     END                       

OKOperator           FILE,DRIVER('SQLAnywhere'),NAME('dba.okoperator'),PRE(OKO),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(OKO:Kode),PRIMARY
KeyKode                  KEY(OKO:Kode),DUP,NOCASE,OPT
KeyNama                  KEY(OKO:Nama),DUP,OPT
Record                   RECORD,PRE()
Kode                        STRING(5)
Nama                        STRING(30)
TarifRJalan                 REAL
TarifA                      REAL
TarifB                      REAL
TarifC                      REAL
TarifD                      REAL
Keterangan                  STRING(30)
Jenis_Operasi               BYTE
                         END
                     END                       

GBarKel              FILE,DRIVER('SQLAnywhere'),NAME('DBA.GBarKel'),PRE(GBA1),CREATE,BINDABLE,THREAD
PK                       KEY(GBA1:Kode),PRIMARY
Record                   RECORD,PRE()
Kode                        LONG
Nama                        STRING(40)
                         END
                     END                       

INAdjust             FILE,DRIVER('SQLAnywhere'),NAME('dba.INAdjust'),PRE(INAD),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(INAD:Nomor),PRIMARY
GBarang_INADjust_Key     KEY(INAD:Kode_Barang),DUP
Record                   RECORD,PRE()
Nomor                       STRING(15)
harga                       REAL
Kode_Barang                 STRING(10)
Jumlah                      REAL
Tanggal                     DATE
Jam                         TIME
Keterangan                  STRING(30)
Operator                    STRING(10)
Status                      BYTE
Kode_Ruang                  STRING(5)
                         END
                     END                       

ApStokopSS           FILE,DRIVER('SQLAnywhere'),NAME('dba.ApStokopSS'),PRE(Apso1),BINDABLE,THREAD
kdapotik_brg             KEY(Apso1:Kode_Apotik,Apso1:Tanggal,Apso1:Kode_Barang),OPT,PRIMARY
keykdap_bln_thn          KEY(Apso1:Kode_Apotik,Apso1:Tanggal),DUP,OPT
keykode_barang           KEY(Apso1:Kode_Barang),DUP,OPT
Record                   RECORD,PRE()
Kode_Apotik                 STRING(5)
Kode_Barang                 STRING(10)
Tanggal                     DATE
satuan                      STRING(10)
Stkomputer                  REAL
StHitung                    REAL
StKartu                     REAL
Selisih                     REAL
Harga                       REAL
Nilaistok                   REAL
                         END
                     END                       

GStokOp              FILE,DRIVER('SQLAnywhere'),NAME('DBA.GStokOp'),PRE(GST2),BINDABLE,THREAD
PrimaryKey               KEY(GST2:Kode_Barang,GST2:Tahun,GST2:Bulan),PRIMARY
Gbar_GSokOp_Key          KEY(GST2:Kode_Barang),DUP
gstokop_bulan_tahun_key  KEY(GST2:Bulan,GST2:Tahun),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Kode_Barang                 STRING(10)
Tahun                       SHORT
Bulan                       SHORT
satuan                      STRING(10)
STKomputer                  REAL
STHitung                    REAL
STKartu                     REAL
Selisih                     REAL
Harga                       REAL
NilaiStok                   REAL
                         END
                     END                       

RiTind               FILE,DRIVER('SQLAnywhere'),NAME('dba.RiTind'),PRE(Tind),CREATE,BINDABLE,THREAD
K1                       KEY(Tind:Mr,Tind:Urut,Tind:TglMasuk,Tind:JamMasuk,Tind:Ruang,Tind:KodeJasa),NOCASE,OPT,PRIMARY
KkodeJasa                KEY(Tind:KodeJasa),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Mr                          LONG
Urut                        USHORT
TglMasuk                    DATE
JamMasuk                    TIME
Ruang                       STRING(20)
Tgl_trans                   DATE
Jam_trans                   TIME
Jumlah_tran                 USHORT
Ket                         STRING(50)
BiayaPerTind                REAL
Usr                         STRING(20)
tglUpdate                   DATE
JamUpdate                   TIME
KodeJasa                    STRING(20)
                         END
                     END                       

ApPaketD             FILE,DRIVER('SQLAnywhere'),NAME('dba.ApPaketD'),PRE(APP21),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(APP21:No,APP21:Kode_Barang),NOCASE,OPT,PRIMARY
barang_appaketd_fk       KEY(APP21:Kode_Barang),DUP,NOCASE,OPT
Record                   RECORD,PRE()
No                          SHORT
Kode_Barang                 STRING(10)
Jumlah                      REAL
Harga                       REAL
Jenis                       BYTE
                         END
                     END                       

INHDKB               FILE,DRIVER('SQLAnywhere'),NAME('dba.INHDKB'),PRE(INH),CREATE,BINDABLE,THREAD
PK                       KEY(INH:Nomor),NOCASE,OPT,PRIMARY
ins_inhdkb_fk            KEY(INH:Instalasi),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor                       STRING(12)
Tanggal                     DATE
Jam                         TIME
Operator                    STRING(20)
Validasi                    BYTE
TanggalValidasi             DATE
JamValidasi                 TIME
UserValidasi                STRING(20)
Instalasi                   STRING(5)
Ambil                       BYTE
                         END
                     END                       

GAdjusment           FILE,DRIVER('SQLAnywhere'),NAME('dba.GAdjusment'),PRE(GAD),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(GAD:Nomor),PRIMARY
GBarang_GAdjusment_Key   KEY(GAD:Kode_Barang),DUP
Record                   RECORD,PRE()
Nomor                       STRING(10)
Kode_Barang                 STRING(10)
Jumlah                      REAL
Tanggal                     DATE
Jam                         TIME
Keterangan                  STRING(30)
Operator                    STRING(10)
Status                      BYTE
Harga                       REAL
                         END
                     END                       

OKJenisBedah         FILE,DRIVER('SQLAnywhere'),NAME('DBA.OKJenisBedah'),PRE(OKJ),CREATE,BINDABLE,THREAD
PK                       KEY(OKJ:Kode),OPT,PRIMARY
Record                   RECORD,PRE()
Kode                        STRING(10)
Nama_Tindakan               STRING(50)
BiayaRJalan                 REAL
BiayaA                      REAL
BiayaB                      REAL
BiayaC                      REAL
BiayaD                      REAL
Keterangan                  STRING(30)
Operator                    STRING(20)
Jenis_Operasi               BYTE
                         END
                     END                       

OKHKeluar            FILE,DRIVER('SQLAnywhere'),NAME('dba.OKHKeluar'),PRE(OKH),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(OKH:Nomor),OPT,PRIMARY
keyNomor                 KEY(OKH:Nomor),DUP,OPT
keyNomorMR               KEY(OKH:NomorMR),DUP,NOCASE,OPT
OKJBedah_OKHKeluar_Key   KEY(OKH:Jenis_Bedah),DUP
OKJAnestesi_OKHKeluar_Key KEY(OKH:Jenis_Anesthesi),DUP
Record                   RECORD,PRE()
Nomor                       STRING(12)
NomorMR                     LONG
Tanggal                     DATE
Jam                         TIME
Jenis_Bedah                 STRING(5)
Jenis_Anesthesi             STRING(10)
User                        STRING(20)
Jenis_operasi               BYTE
Lama_Operasi                LONG
Operasi                     BYTE
Urut                        SHORT
Biaya_Operasi               REAL
Total_Biaya                 REAL
BiayaObat                   REAL
BiayaJasa                   REAL
BiayaOperator               REAL
BiayaLain                   REAL
BiayaAnestesis              REAL
tempat                      STRING(20)
BiayaJasaDokter             REAL
                         END
                     END                       

AptoInSmdD           FILE,DRIVER('SQLAnywhere'),NAME('dba.AptoInSmdD'),PRE(APTD1),CREATE,BINDABLE,THREAD
key_kd_brg               KEY(APTD1:Kode_Brg),DUP,NOCASE,OPT
key_no_nota              KEY(APTD1:N0_tran,APTD1:Kode_Brg),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
N0_tran                     STRING(15)
Kode_Brg                    STRING(10)
Jumlah                      REAL
Diskon                      REAL
Pct                         REAL
Biaya                       REAL
Harga                       REAL
                         END
                     END                       

AptoInSmdH           FILE,DRIVER('SQLAnywhere'),NAME('dba.AptoInSmdH'),PRE(APTI1),CREATE,BINDABLE,THREAD
key_no_tran              KEY(APTI1:N0_tran),NOCASE,OPT,PRIMARY
key_apotik               KEY(APTI1:Kode_Apotik,APTI1:Tanggal),DUP,NOCASE,OPT
key_tujuan               KEY(APTI1:Kd_ruang,APTI1:Tanggal),DUP,NOCASE,OPT
key_tanggal              KEY(APTI1:Tanggal),DUP,NOCASE,OPT
Record                   RECORD,PRE()
N0_tran                     STRING(15)
Kode_Apotik                 STRING(5)
Kd_ruang                    STRING(5)
Tanggal                     DATE
Jam                         TIME
Total_Biaya                 REAL
User                        STRING(10)
Status                      BYTE
                         END
                     END                       

IRK_PDPT             FILE,DRIVER('SQLAnywhere'),NAME('dba.IRK_PDPT'),PRE(IR_KP),CREATE,BINDABLE,THREAD
KMr_NoNota               KEY(IR_KP:No_Mr,IR_KP:no_urut,IR_KP:No_Nota,IR_KP:urtTrans),NOCASE,OPT,PRIMARY
K_Mr                     KEY(IR_KP:No_Mr),DUP,NOCASE,OPT
Record                   RECORD,PRE()
No_Mr                       LONG
Tgl_update                  DATE
Ket_bayar                   STRING(20)
Status_Pembayaran           BYTE
Ruang                       STRING(20)
Kelas                       STRING(20)
Biaya_Dr                    REAL
Biaya_Perawatan             REAL
Keterangan                  STRING(60)
Penanggung                  STRING(30)
No_Nota                     STRING(20)
Status_cek                  BYTE
tgl_batal                   DATE
statusbatal                 BYTE
User                        STRING(20)
tglUpdateAkhir              DATE
jam                         TIME
TglNota                     DATE
TglMasuk                    DATE
tgl_pulang                  DATE
no_urut                     USHORT
urtTrans                    BYTE
                         END
                     END                       

RekJsaDr             FILE,DRIVER('SQLAnywhere'),NAME('dba.rekjsadr'),PRE(REK),CREATE,BINDABLE,THREAD
K1                       KEY(REK:NOMR,REK:No_urut,REK:Kode_dr,REK:Tgl_masuk,REK:jam_masuk),NOCASE,OPT,PRIMARY
KKodedr                  KEY(REK:Kode_dr),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NOMR                        LONG
No_urut                     SHORT
Kode_dr                     STRING(20)
Tgl_masuk                   DATE
jam_masuk                   TIME
tgl_keluar                  DATE
jam_keluar                  TIME
Biaya                       REAL
Ket                         STRING(50)
Tgl_update                  DATE
PengantarNonPengantar       STRING(2)
Prosentase                  REAL
statusDr                    BYTE
                         END
                     END                       

ApDDProd             FILE,DRIVER('SQLAnywhere'),NAME('dba.ApDDprod'),PRE(APDDP),CREATE,BINDABLE,THREAD
key_kd_brg               KEY(APDDP:Kode_Brg),DUP,NOCASE,OPT
key_no_nota              KEY(APDDP:N0_tran,APDDP:Kode_Brg,APDDP:Kode_Asal),NOCASE,OPT,PRIMARY
Key_Kode_asal            KEY(APDDP:Kode_Asal),DUP,NOCASE,OPT
Record                   RECORD,PRE()
N0_tran                     STRING(15)
Kode_Brg                    STRING(10)
Kode_Asal                   STRING(10)
Jumlah                      REAL
Biaya                       REAL
                         END
                     END                       

GKStok               FILE,DRIVER('SQLAnywhere'),NAME('DBA.GKStok'),PRE(GKS),BINDABLE,THREAD
PrimaryKey               KEY(GKS:Kode_Barang,GKS:Tanggal,GKS:Transaksi,GKS:NoTransaksi),PRIMARY
UrutTanggal_Key          KEY(GKS:Tanggal,GKS:Jam),DUP,NOCASE,OPT
BrgTglJamNoTrans_Key     KEY(GKS:Kode_Barang,GKS:Tanggal,GKS:Jam,GKS:NoTransaksi),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Kode_Barang                 STRING(10)
Tanggal                     DATE
Jam                         TIME
Transaksi                   STRING(50)
NoTransaksi                 STRING(15)
Debet                       REAL
Kredit                      REAL
Opname                      REAL
Status                      BYTE
                         END
                     END                       

RI_DSBBK             FILE,DRIVER('SQLAnywhere'),NAME('dba.RI_DSBBK'),PRE(RI_DSB),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(RI_DSB:Nomor,RI_DSB:Kode_brg,RI_DSB:Camp),OPT,PRIMARY
by_transaksi             KEY(RI_DSB:Nomor),DUP,OPT
Barang_RI_DSBBK_FK       KEY(RI_DSB:Kode_brg),DUP,OPT
by_tran_cam              KEY(RI_DSB:Nomor,RI_DSB:Camp),DUP,OPT
Record                   RECORD,PRE()
Nomor                       STRING(15)
Kode_brg                    STRING(10)
Camp                        ULONG
Jumlah                      REAL
Harga_Dasar                 REAL
Total                       LONG
Diskon                      REAL
                         END
                     END                       

GSaldoawal           FILE,DRIVER('SQLAnywhere'),NAME('dba.GSaldoawal'),PRE(GSA),BINDABLE,THREAD
PrimaryKey               KEY(GSA:Kode_barang,GSA:Bulan,GSA:tahun),PRIMARY
gsawal_gbar_fk           KEY(GSA:Kode_barang),DUP
Record                   RECORD,PRE()
Kode_barang                 STRING(10)
Bulan                       SHORT
tahun                       SHORT
jumlah                      REAL
harga                       REAL
total                       REAL
                         END
                     END                       

GBrgDis              FILE,DRIVER('SQLAnywhere'),NAME('dba.GBrgDis'),PRE(GBR),BINDABLE,THREAD
PK                       KEY(GBR:Kode_Brg),PRIMARY
Record                   RECORD,PRE()
Kode_Brg                    STRING(10)
Bonus                       LONG
Discount                    REAL
                         END
                     END                       

RI_HSBBK             FILE,DRIVER('SQLAnywhere'),NAME('dba.RI_HSBBK'),PRE(RI_HSB),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(RI_HSB:Nomor),OPT,PRIMARY
pasien_ri_hsbbk_fk       KEY(RI_HSB:Nomor_mr),DUP,NOCASE,OPT
Instalasi_ri_hsbbk_fk    KEY(RI_HSB:Kode_Inst),DUP,OPT
keytanggal               KEY(RI_HSB:Tanggal),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor                       STRING(15)
Nomor_mr                    LONG
Tanggal                     DATE
Biaya                       LONG
Bayar                       BYTE
cara_bayar                  BYTE
Kode_Inst                   STRING(5)
Batal                       BYTE
User                        STRING(4)
Keterangan                  STRING(20)
                         END
                     END                       

IR_Bayi              FILE,DRIVER('SQLAnywhere'),NAME('dba.IR_Bayi'),PRE(IRB),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(IRB:Nomor_mr,IRB:NoUrut,IRB:Tanggal_Masuk,IRB:Jam_Masuk),NOCASE,OPT,PRIMARY
keymr_tgl                KEY(IRB:Nomor_mr,-IRB:Tanggal_Masuk),DUP,NOCASE,OPT
KeyTanggalMasuk          KEY(IRB:Tanggal_Masuk),DUP,NOCASE,OPT
KeyKodeRuang             KEY(IRB:Ruang),DUP,NOCASE,OPT
KeyNoMrRuang             KEY(IRB:Nomor_mr,IRB:Ruang),DUP,NOCASE,OPT
KeyNoMrSaja              KEY(IRB:Nomor_mr),DUP,NOCASE,OPT
KeyNoMrStatus            KEY(IRB:Nomor_mr),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_mr                    LONG
NoUrut                      SHORT
Ruang                       STRING(10)
Kelas                       STRING(10)
Jam_Masuk                   TIME
Tanggal_Masuk               DATE
Jam_Keluar                  TIME
Tanggal_Keluar              DATE
BiayaRawat                  REAL
Jam                         TIME
TotalPerawatan              REAL
JMLBAYI                     BYTE
jml_hari                    BYTE
                         END
                     END                       

FIFOOUT              FILE,DRIVER('SQLAnywhere'),NAME('DBA.FIFOOUT'),PRE(FIF2),BINDABLE,THREAD
KEY1                     KEY(FIF2:Kode_Barang,FIF2:Mata_Uang,FIF2:NoTransaksi,FIF2:Transaksi,FIF2:NoTransKeluar),PRIMARY
FIFOIN_FIFOOUT_FK        KEY(FIF2:Kode_Barang,FIF2:Mata_Uang,FIF2:NoTransaksi),DUP
Record                   RECORD,PRE()
Kode_Barang                 STRING(10),NAME('Kode_Barang')
Mata_Uang                   STRING(5),NAME('Mata_Uang')
NoTransaksi                 STRING(10),NAME('NoTransaksi')
Transaksi                   BYTE
NoTransKeluar               STRING(10),NAME('NoTransKeluar')
Tanggal                     DATE,NAME('Tanggal')
Harga                       REAL,NAME('Harga')
Jumlah                      REAL,NAME('Jumlah')
tgl_update                  DATE,NAME('tgl_update')
jam_update                  TIME,NAME('jam_update')
operator                    STRING(20),NAME('operator')
Jam                         TIME
                         END
                     END                       

FIFOIN               FILE,DRIVER('SQLAnywhere'),NAME('DBA.FIFOIN'),PRE(FIF),BINDABLE,THREAD
KEY1                     KEY(FIF:Kode_Barang,FIF:Mata_Uang,FIF:NoTransaksi,FIF:Transaksi),PRIMARY
kodebrg_notrans_key      KEY(FIF:Kode_Barang,FIF:NoTransaksi),DUP
MataUang_FIFOIN_FK       KEY(FIF:Mata_Uang),DUP
barang_FIFOIN_FK         KEY(FIF:Kode_Barang),DUP
Record                   RECORD,PRE()
Kode_Barang                 STRING(10),NAME('Kode_Barang')
Mata_Uang                   STRING(5),NAME('Mata_Uang')
NoTransaksi                 STRING(10),NAME('NoTransaksi')
Transaksi                   BYTE
Tanggal                     DATE,NAME('Tanggal')
Harga                       REAL,NAME('Harga')
Jumlah                      REAL,NAME('Jumlah')
Jumlah_Keluar               REAL,NAME('Jumlah_Keluar')
Tgl_Update                  DATE,NAME('Tgl_Update')
Jam_Update                  TIME,NAME('Jam_Update')
Operator                    STRING(20),NAME('Operator')
Jam                         TIME
Status                      BYTE
expiredate                  DATE
no_batch                    STRING(30)
                         END
                     END                       

ITr_Umka             FILE,DRIVER('SQLAnywhere'),NAME('dba.ITr_Umka'),PRE(Tr_Um),CREATE,BINDABLE,THREAD
K_ruangan                KEY(Tr_Um:Kode_ruangan),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
Kode_ruangan                STRING(10)
Tarif_Rawat_Inap            REAL
Tarif_ass_dr                REAL
Tarif_sp_dr                 REAL
Tarif_lainnya               REAL
                         END
                     END                       

ApInOutBln           FILE,DRIVER('SQLAnywhere'),NAME('dba.ApInOutBln'),PRE(APIN),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(APIN:Tahun,APIN:Bulan,APIN:Gudang,APIN:Kode),NOCASE,OPT,PRIMARY
Barang_Apinoutbln_fk     KEY(APIN:Kode),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Tahun                       LONG
Bulan                       SHORT
Gudang                      STRING(5)
Kode                        STRING(10)
Nama_Brg                    STRING(40)
Satuan                      STRING(10)
Harga                       REAL
Awal                        REAL
RpAwal                      REAL
Masuk                       REAL
RpMasuk                     REAL
Keluar                      REAL
RpKeluar                    REAL
Akhir                       REAL
RpAkhir                     REAL
                         END
                     END                       

IMJasa               FILE,DRIVER('SQLAnywhere'),NAME('dba.IMJasa'),PRE(IMJ),CREATE,BINDABLE,THREAD
KKode                    KEY(IMJ:Kode),NOCASE,OPT,PRIMARY
KNama                    KEY(IMJ:Nama),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Kode                        STRING(6)
Nama                        STRING(40)
Harga                       REAL
Keterangan                  STRING(40)
Biaya1                      REAL
Biaya2                      REAL
Biaya3                      REAL
BiayaLC                     REAL
                         END
                     END                       

ITrPsMan             FILE,DRIVER('SQLAnywhere'),NAME('dba.ITrPsMan'),PRE(ITRMn),CREATE,BINDABLE,THREAD
K1                       KEY(ITRMn:no_mr,ITRMn:No_urut,ITRMn:Kode_Jasa,ITRMn:TGLAWAL,ITRMn:Jam_masuk,ITRMn:Keterangan),NOCASE,OPT,PRIMARY
K_kodeJasa               KEY(ITRMn:Kode_Jasa),DUP,NOCASE,OPT
Kmr                      KEY(ITRMn:no_mr),DUP,NOCASE,OPT
KMrUrutJasa              KEY(ITRMn:no_mr,ITRMn:No_urut,ITRMn:Kode_Jasa),DUP,NOCASE,OPT
KMrUrutJasaKet           KEY(ITRMn:no_mr,ITRMn:No_urut,ITRMn:Kode_Jasa,ITRMn:Keterangan),DUP,NOCASE,OPT
Kket                     KEY(ITRMn:Keterangan),DUP,NOCASE,OPT
Record                   RECORD,PRE()
no_mr                       LONG
No_urut                     SHORT
Kode_Jasa                   STRING(6)
Biaya                       REAL
Keterangan                  STRING(20)
TGLAWAL                     DATE
TGLAKHIR                    DATE
KET2                        STRING(100)
Jumlah                      REAL
Jam_masuk                   TIME
StatusTrans                 BYTE
Status_tutup                BYTE
Tgl_updt_dr                 DATE
Status_n_pn                 STRING(5)
ket_lain                    STRING(50)
                         END
                     END                       

RI_DTOAPTK           FILE,DRIVER('SQLAnywhere'),NAME('dba.RI_DTOAPTK'),PRE(RIDTO),CREATE,BINDABLE,THREAD
key_kd_brg               KEY(RIDTO:Kode_Brg),DUP,NOCASE,OPT
key_no_nota              KEY(RIDTO:N0_tran,RIDTO:Kode_Brg),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
N0_tran                     STRING(15)
Kode_Brg                    STRING(10)
Jumlah                      LONG
Biaya                       LONG
                         END
                     END                       

ApDProd              FILE,DRIVER('SQLAnywhere'),NAME('dba.ApDprod'),PRE(APDP),CREATE,BINDABLE,THREAD
key_kd_brg               KEY(APDP:Kode_Brg),DUP,NOCASE,OPT
key_no_nota              KEY(APDP:N0_tran,APDP:Kode_Brg),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
N0_tran                     STRING(15)
Kode_Brg                    STRING(10)
Jumlah                      REAL
Biaya                       REAL
                         END
                     END                       

ApHProd              FILE,DRIVER('SQLAnywhere'),NAME('dba.ApHProd'),PRE(APHP),CREATE,BINDABLE,THREAD
key_no_tran              KEY(APHP:N0_tran),NOCASE,OPT,PRIMARY
key_apotik               KEY(APHP:Kode_Apotik,APHP:Tanggal),DUP,NOCASE,OPT
key_tujuan               KEY(APHP:Tanggal),DUP,NOCASE,OPT
key_tanggal              KEY(APHP:Tanggal),DUP,NOCASE,OPT
Record                   RECORD,PRE()
N0_tran                     STRING(15)
Kode_Apotik                 STRING(5)
Tanggal                     DATE
User                        STRING(4)
Total_Biaya                 REAL
Jenis                       BYTE
                         END
                     END                       

Apcettmp             FILE,DRIVER('SQLAnywhere'),NAME('dba.Apcettmp'),PRE(Apcp),CREATE,BINDABLE,THREAD
keynokd                  KEY(Apcp:Nomor,Apcp:Kode_Barang),OPT,PRIMARY
keykodebrg               KEY(Apcp:Kode_Barang),DUP,OPT
keynmbrg                 KEY(Apcp:Nmbarang),DUP,OPT
key_no                   KEY(Apcp:Nomor),DUP,OPT
Record                   RECORD,PRE()
Nomor                       BYTE
Kode_Barang                 STRING(10)
Nmbarang                    STRING(40)
satuan                      STRING(10)
Stkomputer                  REAL
StKartu                     REAL
StHitung                    REAL
Selisih                     REAL
Harga                       REAL
Nilaistok                   REAL
keterangan                  STRING(10)
                         END
                     END                       

RI_HToAptk           FILE,DRIVER('SQLAnywhere'),NAME('dba.RI_ToAptk'),PRE(RI_TOA),CREATE,BINDABLE,THREAD
key_no_tran              KEY(RI_TOA:N0_tran),NOCASE,OPT,PRIMARY
key_apotik               KEY(RI_TOA:Kode_Apotik,RI_TOA:Tanggal),DUP,NOCASE,OPT
key_ruang                KEY(RI_TOA:Kd_ruang,RI_TOA:Tanggal),DUP,NOCASE,OPT
key_tanggal              KEY(RI_TOA:Tanggal),DUP,NOCASE,OPT
Record                   RECORD,PRE()
N0_tran                     STRING(15)
Kd_ruang                    STRING(5)
Kode_Apotik                 STRING(5)
Tanggal                     DATE
Total_Biaya                 LONG
User                        STRING(4)
                         END
                     END                       

Nomor_SKR            FILE,DRIVER('SQLAnywhere'),NAME('dba.nomor_SKR'),PRE(NOM1),BINDABLE,THREAD
PrimaryKey               KEY(NOM1:No_urut),PRIMARY
Record                   RECORD,PRE()
No_urut                     LONG
No_Trans                    STRING(15)
Keterangan                  STRING(30)
                         END
                     END                       

Ano_pakai            FILE,DRIVER('SQLAnywhere'),PRE(ANOp),CREATE,BINDABLE,THREAD
key_isi                  KEY(ANOp:Nomor),NAME('key_isi'),OPT,PRIMARY
Record                   RECORD,PRE()
Nomor                       STRING(10)
                         END
                     END                       

Tbstawal             FILE,DRIVER('SQLAnywhere'),NAME('dba.Tbstawal'),PRE(TBS),CREATE,BINDABLE,THREAD
kdap_brg                 KEY(TBS:Kode_Apotik,TBS:Kode_Barang,TBS:Tahun),OPT,PRIMARY
key_kd_barang            KEY(TBS:Kode_Barang),DUP,OPT
KeyThnFar                KEY(TBS:Tahun,TBS:Kode_Apotik),DUP,NOCASE,OPT
KeyTahunSaja             KEY(TBS:Tahun),DUP,NOCASE,OPT
KeyFarSaja               KEY(TBS:Kode_Apotik),DUP,OPT
Record                   RECORD,PRE()
Kode_Apotik                 STRING(5)
Kode_Barang                 STRING(10)
Tahun                       USHORT
Januari                     USHORT
Februari                    USHORT
Maret                       USHORT
April                       USHORT
Mei                         USHORT
Juni                        USHORT
Juli                        USHORT
Agustus                     USHORT
September                   USHORT
Oktober                     USHORT
November                    USHORT
Desember                    USHORT
                         END
                     END                       

GNOBBPB              FILE,DRIVER('SQLAnywhere'),NAME('dba.GNOBBPB'),PRE(GNOBBPB),CREATE,BINDABLE,THREAD
KeyNomor                 KEY(GNOBBPB:NoBPB),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
NoBPB                       STRING(10)
                         END
                     END                       

GNOABPB              FILE,DRIVER('SQLAnywhere'),NAME('dba.GNOABPB'),PRE(GNOABPB),CREATE,BINDABLE,THREAD
KeyNo                    KEY(GNOABPB:No),NOCASE,OPT,PRIMARY
keynomor                 KEY(GNOABPB:Nomor),DUP,NOCASE,OPT
Record                   RECORD,PRE()
No                          USHORT
Nomor                       STRING(10)
                         END
                     END                       

APpotkem             FILE,DRIVER('SQLAnywhere'),NAME('dba.APpotkem'),PRE(APP1),CREATE,BINDABLE,THREAD
key_nota_brg             KEY(APP1:N0_tran,APP1:Kode_brg),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
N0_tran                     STRING(15)
Kode_brg                    STRING(10)
Jumlah                      REAL
                         END
                     END                       

ApLapBln             FILE,DRIVER('SQLAnywhere'),NAME('dba.ApLapBln'),PRE(Alab),CREATE,BINDABLE,THREAD
KeyNo                    KEY(Alab:No),DUP,NOCASE,OPT
key_no_kdbrg             KEY(Alab:No,Alab:Kode),OPT,PRIMARY
Record                   RECORD,PRE()
No                          USHORT
Kode                        STRING(10)
Nama_Brg                    STRING(40)
Stok_awal                   LONG
SaldoAwal                   REAL
Stok_masuk                  LONG
Debet                       REAL
Stok_Keluar                 LONG
Kredit                      REAL
Stok_akhir                  LONG
SaldoAkhir                  REAL
Harga                       REAL
revisi                      STRING(2)
                         END
                     END                       

VGBarangNew          FILE,DRIVER('SQLAnywhere'),NAME('dba.VGBarangNew'),PRE(GBAR2),CREATE,BINDABLE,THREAD
KeyKodeBrg               KEY(GBAR2:Kode_brg),NAME('KeyKodeBrg'),OPT,PRIMARY
KeyNama                  KEY(GBAR2:Nama_Brg),DUP,NAME('KeyNama'),OPT
KeyKodeUPF               KEY(GBAR2:Kode_UPF),DUP,OPT
KeyKodeKelompok          KEY(GBAR2:Kelompok),DUP,NOCASE,OPT
KeyKodeAsliBrg           KEY(GBAR2:Kode_Asli),DUP,NOCASE,OPT
Barcode_GBarang_FK       KEY(GBAR2:KodeBarcode),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Kode_brg                    STRING(10)
Nama_Brg                    STRING(40)
Jenis_Brg                   STRING(5)
No_Satuan                   STRING(10)
Dosis                       ULONG
Stok_Total                  REAL
Kode_UPF                    STRING(10)
Kode_Apotik                 STRING(5)
Kelompok                    LONG
Status                      BYTE
Kode_Asli                   STRING(10)
KetSatuan                   STRING(20)
KelBesar                    STRING(1)
StatusGen                   BYTE
Sediaan                     STRING(2)
Farmakolog                  STRING(2)
StatusBeli                  BYTE
Pabrik                      STRING(2)
Fungsi                      STRING(2)
Ket1                        STRING(50)
Ket2                        STRING(50)
Kode_Principal              STRING(3)
KodeBarcode                 STRING(30)
Harga                       REAL
Golongan                    STRING(40)
Kandungan                   STRING(40)
SatuanBeli                  STRING(10)
Konversi                    REAL
FarNonFar                   BYTE
                         END
                     END                       

JPASSWRD             FILE,DRIVER('SQLAnywhere'),NAME('dba.JPASSWRD'),PRE(JPSW),CREATE,BINDABLE,THREAD
KeyUSerId                KEY(JPSW:USER_ID),NOCASE,OPT,PRIMARY
KeyId                    KEY(JPSW:ID),DUP,NOCASE,OPT
KEYBAGIAN                KEY(JPSW:BAGIAN),DUP,NOCASE,OPT
Record                   RECORD,PRE()
USER_ID                     STRING(20)
ID                          STRING(10)
BAGIAN                      STRING(20)
AKSES                       STRING(20)
LEVEL                       BYTE
Prefix                      STRING(4)
                         END
                     END                       

JPasien              FILE,DRIVER('SQLAnywhere'),NAME('dba.JPasien'),PRE(JPas),CREATE,BINDABLE,THREAD
KeyNomorMr               KEY(JPas:Nomor_mr),OPT,PRIMARY
KeyAlamat                KEY(JPas:Alamat),DUP,OPT
KeyNama                  KEY(JPas:Nama),DUP,NAME('JPasKeyNama'),OPT
KeyKec                   KEY(JPas:Kecamatan,JPas:Kota),DUP,OPT
KeyKembali               KEY(JPas:kembali,JPas:Tanggal),DUP,OPT
KeyTanggal               KEY(JPas:Tanggal),DUP,NOCASE,OPT
KeyKota                  KEY(JPas:Kota),DUP,OPT
KeyKelurahan             KEY(JPas:Kelurahan),DUP,NOCASE,OPT
Inap_JPasien_FK          KEY(JPas:Inap),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_mr                    LONG
Nama                        STRING(35)
TanggalLahir                DATE
Umur                        LONG
Umur_Bln                    LONG
Jenis_kelamin               STRING(1)
Alamat                      STRING(35)
RT                          LONG
RW                          LONG
Kelurahan                   STRING(20)
Kecamatan                   STRING(30)
Kota                        STRING(20)
Agama                       STRING(12)
pekerjaan                   STRING(20)
Telepon                     STRING(15)
Tanggal                     DATE
kembali                     LONG
Kontrak                     STRING(20)
User                        STRING(10)
TEMPAT                      STRING(10)
Jam                         TIME
Inap                        BYTE
Jenis_Pasien                BYTE
                         END
                     END                       

IPasien              FILE,DRIVER('SQLAnywhere'),NAME('dba.IPasien'),PRE(IPas),CREATE,BINDABLE,THREAD
KeyNomorMr               KEY(IPas:Nomor_mr),NOCASE,OPT,PRIMARY
KeyTanggalKeluar         KEY(IPas:Tanggal_Keluar),DUP,NOCASE,OPT
KeyTanggalMasuk          KEY(IPas:Tanggal_Masuk),DUP,NOCASE,OPT
KeyNoNota                KEY(IPas:No_Nota),DUP,NOCASE,OPT
KeyKodeDr                KEY(IPas:DrPengirim),DUP,NOCASE,OPT
KeyKlinikKirim           KEY(IPas:DikirimOleh),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_mr                    LONG
Kontrak                     STRING(1)
Laporan                     STRING(1)
No_Nota                     STRING(10)
Tanggal_Masuk               DATE
Tanggal_Keluar              DATE
Tanggal                     DATE
User                        STRING(20)
Jam                         TIME
Status                      STRING(1)
Pembayaran                  BYTE
DikirimOleh                 STRING(10)
DrPengirim                  STRING(10)
VisitePerHari               REAL
TotalVisite                 REAL
LastRoom                    STRING(10)
Keterangan                  STRING(30)
TotalPerawatan              REAL
TotalVisiteDr               REAL
TotalLab                    REAL
TotalObat                   REAL
TotalTindakan               REAL
TotalPemakaianAlat          REAL
TotalPPSP                   REAL
TotalGizi                   REAL
TotalTelepon                REAL
BiayaLain                   REAL
Penanggung                  STRING(35)
Alamat                      STRING(35)
RT                          BYTE
RW                          BYTE
Kelurahan                   STRING(20)
Kecamatan                   STRING(30)
Kota                        STRING(20)
Pendapatan                  STRING(20)
RpPendapatan                REAL
Pekerjaan                   STRING(20)
                         END
                     END                       

JKontrak             FILE,DRIVER('SQLAnywhere'),NAME('dba.JKontrak'),PRE(JKon),CREATE,BINDABLE,THREAD
KeyKodeKtr               KEY(JKon:KODE_KTR),OPT,PRIMARY
KeyNamaKtr               KEY(JKon:NAMA_KTR),DUP,OPT
KeyGroup                 KEY(JKon:GROUP),DUP,OPT
Record                   RECORD,PRE()
KODE_KTR                    STRING(10)
NAMA_KTR                    STRING(100)
ALAMAT                      STRING(100)
KOTA                        STRING(20)
TELPON                      STRING(20)
KET                         STRING(30)
RawatJalan                  STRING(1)
RawatInap                   STRING(1)
CONTACT_PERSON              STRING(20)
GROUP                       LONG
No_Ktr                      LONG
Tanggal                     DATE
USER                        STRING(10)
PercentTarif                REAL
PKS                         BYTE
DM                          BYTE
OBT                         BYTE
MCU                         BYTE
Keterangan                  STRING(50)
Fax                         STRING(20)
PM                          BYTE
PD                          BYTE
Jenis_Obat                  BYTE
Status                      BYTE
Aktif                       BYTE
view_nip                    BYTE
status_brs                  BYTE
status_jpk                  BYTE
HargaObat                   REAL
Status_Pis_LapRjln          BYTE
Tanpa_Adm                   BYTE
Status_Pis_LapRin           BYTE
                         END
                     END                       

ApStokop             FILE,DRIVER('SQLAnywhere'),NAME('dba.ApStokop'),PRE(Apso),BINDABLE,THREAD
kdapotik_brg             KEY(Apso:Kode_Apotik,Apso:Tahun,Apso:Bulan,Apso:Kode_Barang),OPT,PRIMARY
keykdap_bln_thn          KEY(Apso:Kode_Apotik,Apso:Bulan,Apso:Tahun),DUP,OPT
keykode_barang           KEY(Apso:Kode_Barang),DUP,OPT
Record                   RECORD,PRE()
Kode_Apotik                 STRING(5)
Kode_Barang                 STRING(10)
Tahun                       USHORT
Bulan                       BYTE
satuan                      STRING(10)
Stkomputer                  REAL
StHitung                    REAL
StKartu                     REAL
Selisih                     REAL
Harga                       REAL
Nilaistok                   REAL
                         END
                     END                       

GBarangAlias         FILE,DRIVER('SQLAnywhere'),NAME('dba.GBarangAlias'),PRE(GBAR1),CREATE,BINDABLE,THREAD
KeyKodeBrg               KEY(GBAR1:Kode_brg,GBAR1:KodeAlias),NAME('KeyKodeBrg'),OPT,PRIMARY
Keykodealias             KEY(GBAR1:KodeAlias),DUP,NAME('KeyNama'),OPT
Record                   RECORD,PRE()
Kode_brg                    STRING(10)
KodeAlias                   STRING(10)
                         END
                     END                       

ITbrRwt              FILE,DRIVER('SQLAnywhere'),NAME('dba.ITbrRwt'),PRE(ITbr),CREATE,BINDABLE,THREAD
KeyKodeRuang             KEY(ITbr:KODE_RUANG),NOCASE,OPT,PRIMARY
KeyNamaRuang             KEY(ITbr:NAMA_RUANG),DUP,NOCASE,OPT
KeyKodeKelas             KEY(ITbr:KodeKelas),DUP,NOCASE,OPT
KeyTempat                KEY(ITbr:TEMPAT),DUP,NOCASE,OPT
KPDPM                    KEY(ITbr:PDPM),DUP,NOCASE,OPT
Induk_Itbrwt_FK          KEY(ITbr:Induk),DUP,NOCASE,OPT
Record                   RECORD,PRE()
KODE_RUANG                  STRING(10)
NAMA_RUANG                  STRING(20)
KodeKelas                   STRING(10)
KAPASITAS                   ULONG
TEMPAT                      ULONG
ROOT_KLS                    STRING(10)
PDPM                        STRING(10)
Induk                       STRING(20)
                         END
                     END                       

GDBPBMaster          FILE,DRIVER('SQLAnywhere'),NAME('dba.GDBPBMaster'),PRE(GDBPB1),CREATE,BINDABLE,THREAD
KeyNoBPB                 KEY(GDBPB1:NoBPB),OPT
KeyBPBItem               KEY(GDBPB1:NoBPB,GDBPB1:Kode_Brg),OPT,PRIMARY
KeyKodeBarang            KEY(GDBPB1:Kode_Brg),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NoBPB                       STRING(10)
Kode_Brg                    STRING(10)
NoItem                      SHORT
Jumlah                      REAL
Keterangan                  STRING(20)
Qty_Accepted                REAL
                         END
                     END                       

OKFIFOIN             FILE,DRIVER('SQLAnywhere'),NAME('DBA.OKFIFOIN'),PRE(FIF1),BINDABLE,THREAD
KEY1                     KEY(FIF1:Kode_Barang,FIF1:Mata_Uang,FIF1:NoTransaksi,FIF1:Transaksi),PRIMARY
kodebrg_notrans_key      KEY(FIF1:Kode_Barang,FIF1:NoTransaksi),DUP
MataUang_OKFIFOIN_FK     KEY(FIF1:Mata_Uang),DUP
barang_OKFIFOIN_FK       KEY(FIF1:Kode_Barang),DUP
Record                   RECORD,PRE()
Kode_Barang                 STRING(10),NAME('Kode_Barang')
Mata_Uang                   STRING(5),NAME('Mata_Uang')
NoTransaksi                 STRING(10),NAME('NoTransaksi')
Transaksi                   BYTE
Tanggal                     DATE,NAME('Tanggal')
Harga                       REAL,NAME('Harga')
Jumlah                      REAL,NAME('Jumlah')
Jumlah_Keluar               REAL,NAME('Jumlah_Keluar')
Tgl_Update                  DATE,NAME('Tgl_Update')
Jam_Update                  TIME,NAME('Jam_Update')
Operator                    STRING(20),NAME('Operator')
Jam                         TIME
Status                      BYTE
                         END
                     END                       

OKFIFOOUT            FILE,DRIVER('SQLAnywhere'),NAME('DBA.OKFIFOOUT'),PRE(FIF21),BINDABLE,THREAD
KEY1                     KEY(FIF21:Kode_Barang,FIF21:Mata_Uang,FIF21:NoTransaksi,FIF21:Transaksi,FIF21:NoTransKeluar),PRIMARY
FIFOIN_FIFOOUT_FK        KEY(FIF21:Kode_Barang,FIF21:Mata_Uang,FIF21:NoTransaksi),DUP
Record                   RECORD,PRE()
Kode_Barang                 STRING(10),NAME('Kode_Barang')
Mata_Uang                   STRING(5),NAME('Mata_Uang')
NoTransaksi                 STRING(10),NAME('NoTransaksi')
Transaksi                   BYTE
NoTransKeluar               STRING(10),NAME('NoTransKeluar')
Tanggal                     DATE,NAME('Tanggal')
Harga                       REAL,NAME('Harga')
Jumlah                      REAL,NAME('Jumlah')
tgl_update                  DATE,NAME('tgl_update')
jam_update                  TIME,NAME('jam_update')
operator                    STRING(20),NAME('operator')
Jam                         TIME
                         END
                     END                       

Apklutmp             FILE,DRIVER('SQLAnywhere'),NAME('dba.Apklutmp'),PRE(APKL),CREATE,BINDABLE,THREAD
key_nota_brg             KEY(APKL:N0_tran,APKL:Kode_brg),NOCASE,OPT,PRIMARY
key_nota                 KEY(APKL:N0_tran),DUP,NOCASE,OPT
Record                   RECORD,PRE()
N0_tran                     STRING(15)
Kode_brg                    STRING(10)
Jumlah                      REAL
Harga_Dasar                 REAL
Harga_Dasar_benar           REAL
                         END
                     END                       

GSATMP               FILE,DRIVER('SQLAnywhere'),NAME('dba.GSATMP'),PRE(GSTO1),CREATE,BINDABLE,THREAD
KeyBarang                KEY(GSTO1:Kode_Barang),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
Kode_Barang                 STRING(10)
Apotik1                     REAL
Apotik2                     REAL
Apotik3                     REAL
Apotik4                     REAL
Apotik5                     REAL
Apotik6                     REAL
Apotik7                     REAL
Apotik8                     REAL
Apotik9                     REAL
Apotik10                    REAL
                         END
                     END                       

GBarUPF              FILE,DRIVER('SQLAnywhere'),NAME('dba.GBarUPF'),PRE(GBA),CREATE,BINDABLE,THREAD
KeyUPF                   KEY(GBA:UPFBar),NOCASE,OPT,PRIMARY
KeyNama                  KEY(GBA:NamaUPF),DUP,NOCASE,OPT
KeyKode_Nama             KEY(GBA:UPFBar,GBA:NamaUPF),DUP,NOCASE,OPT
Record                   RECORD,PRE()
UPFBar                      STRING(10)
NamaUPF                     STRING(30)
                         END
                     END                       

GHBPBMaster          FILE,DRIVER('SQLAnywhere'),NAME('dba.GHBPBMaster'),PRE(GHBPB1),CREATE,BINDABLE,THREAD
KeyNoBPB                 KEY(GHBPB1:NoBPB),OPT,PRIMARY
KeyStatus                KEY(GHBPB1:Status),DUP,NOCASE,OPT
KeyNoApotik              KEY(GHBPB1:Kode_Apotik),DUP,OPT
KeyTanggal               KEY(GHBPB1:Tanggal),DUP,OPT
Record                   RECORD,PRE()
NoBPB                       STRING(10)
Kode_Apotik                 STRING(5)
Tanggal                     DATE
Status                      STRING(5)
Verifikasi                  BYTE
UserInput                   STRING(20)
UserVal                     STRING(20)
JamInput                    TIME
TanggalVal                  DATE
JamVal                      TIME
Keterangan                  STRING(255)
                         END
                     END                       

TBDiagnosa           FILE,DRIVER('SQLAnywhere'),NAME('dba.TBDiagnosa'),PRE(TBDI),CREATE,BINDABLE,THREAD
KeyDiagnosa              KEY(TBDI:Diagnosa),OPT,PRIMARY
KeyDeskripsi             KEY(TBDI:Deskripsi),DUP,OPT
Record                   RECORD,PRE()
Diagnosa                    STRING(20)
Deskripsi                   STRING(40)
                         END
                     END                       

ApLapKel             FILE,DRIVER('SQLAnywhere'),NAME('dba.ApLapKel'),PRE(APLK),CREATE,BINDABLE,THREAD
key_no_tgl               KEY(APLK:No_laporan,APLK:Tanggal),DUP,NOCASE,OPT
key_no_lap               KEY(APLK:No_laporan),DUP,NOCASE,OPT
key_kode_brg             KEY(APLK:Kode_brg),DUP,NOCASE,OPT
PrimaryKey               KEY(APLK:Nomor,APLK:N0_tran),OPT,PRIMARY
Record                   RECORD,PRE()
No_laporan                  BYTE
Tanggal                     DATE
Kode_brg                    STRING(10)
Kode_keluar                 BYTE
Tujuan                      STRING(10)
Jumlah                      REAL
Total                       REAL
N0_tran                     STRING(15)
Nomor                       ULONG
                         END
                     END                       

DDTBalKT             FILE,DRIVER('SQLAnywhere'),NAME('dba.DDTBalKT'),PRE(DDBK),CREATE,BINDABLE,THREAD
KeyNoPeriksaBal          KEY(DDBK:NoPeriksa),DUP,NOCASE,OPT
KeyKodeBalut             KEY(DDBK:KodeBalut),DUP,NOCASE,OPT
KeyNoPe_KBalut           KEY(DDBK:NoPeriksa,DDBK:KodeBalut),NOCASE,OPT
Record                   RECORD,PRE()
NoPeriksa                   STRING(12)
KodeUrut                    BYTE
KodeBalut                   STRING(10)
KETERANGAN                  STRING(35)
Biaya                       REAL
                         END
                     END                       

JDokter              FILE,DRIVER('SQLAnywhere'),NAME('dba.JDokter'),PRE(JDok),CREATE,BINDABLE,THREAD
KeyKodeDokter            KEY(JDok:Kode_Dokter),OPT,PRIMARY
KeyNamaDokter            KEY(JDok:Nama_Dokter),DUP,OPT
KeyStatus                KEY(JDok:Status),DUP,OPT
Kstatusmitra             KEY(JDok:status_mitra_pengantar),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Kode_Dokter                 STRING(5)
Nama_Dokter                 STRING(30)
Status                      STRING(10)
Keterangan                  STRING(30)
Tlp_Rumah                   STRING(20)
Tlp_Tmp_Praktek             STRING(20)
TANGGAL                     DATE
JAM                         TIME
USER                        STRING(20)
PersenPengantar             REAL
NonPengantar                REAL
StandarVip                  REAL
Standar1                    REAL
Standar2                    REAL
Standar3                    REAL
PD                          REAL
PM                          REAL
status_mitra_pengantar      BYTE
status_lain                 BYTE
                         END
                     END                       

APkemtmp             FILE,DRIVER('SQLAnywhere'),NAME('dba.APkemtmp'),PRE(APKT),CREATE,BINDABLE,THREAD
key_no_mr                KEY(APKT:Nomor_mr,APKT:Kode_brg),NOCASE,OPT,PRIMARY
key_mr                   KEY(APKT:Nomor_mr),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_mr                    LONG
Kode_brg                    STRING(10)
Jumlah                      REAL
Harga_Dasar                 REAL
Harga_Dasar_benar           REAL
                         END
                     END                       

DTTindak             FILE,DRIVER('SQLAnywhere'),NAME('dba.DTTindak'),PRE(DTTI),CREATE,BINDABLE,THREAD
KeyKodeTindak            KEY(DTTI:KodeTindak),NOCASE,OPT,PRIMARY
KeyUPF                   KEY(DTTI:UPFBar),DUP,NOCASE,OPT
Record                   RECORD,PRE()
UPFBar                      STRING(10)
KodeTindak                  LONG
Nama                        STRING(50)
Type                        STRING(12)
Satuan                      STRING(10)
Jenis                       STRING(20)
In                          BYTE
TotHargaVip                 REAL
TotHargaSatu                REAL
TotHargaDua                 REAL
TotHargaTiga                REAL
                         END
                     END                       

DDTJahit             FILE,DRIVER('SQLAnywhere'),NAME('dba.DDTJahit'),PRE(DDTJ),CREATE,BINDABLE,THREAD
KeyNoPeriksaJah          KEY(DDTJ:NoPeriksa),DUP,NOCASE,OPT
KeyKodeJahit             KEY(DDTJ:KodeJahit),DUP,NOCASE,OPT
KeyNoPe_KJahit           KEY(DDTJ:NoPeriksa,DDTJ:KodeJahit),NOCASE,OPT
Record                   RECORD,PRE()
NoPeriksa                   STRING(12)
KodeUrut                    BYTE
KodeJahit                   STRING(10)
Pemakaian                   LONG
Satuan                      STRING(5)
Biaya                       REAL
                         END
                     END                       

DHPasBat             FILE,DRIVER('SQLAnywhere'),NAME('dba.DHPasBat'),PRE(DHPB),CREATE,BINDABLE,THREAD
KeyNomorMr               KEY(DHPB:Nomor_mr),DUP,NOCASE,OPT
KeyNomorPeriksa          KEY(DHPB:NoPeriksa),NOCASE,OPT,PRIMARY
KeyNomPTgJamBalik        KEY(-DHPB:NoPeriksa,-DHPB:TanggalBatal,-DHPB:JamBatal),NOCASE,OPT
KeyKodeDiagKerja         KEY(DHPB:KodeDiagnosa),DUP,NOCASE,OPT
KeyDiagTambah            KEY(DHPB:DiagTambah),DUP,NOCASE,OPT
keyKodeRegion            KEY(DHPB:KodeRegion),DUP,NOCASE,OPT
KeyTanggalMasuk          KEY(DHPB:TanggalMasuk),DUP,NOCASE,OPT
KeyTglMasuk_Jam          KEY(DHPB:TanggalMasuk,-DHPB:Jammasuk),DUP,NOCASE,OPT
KeyTindakanAkhir         KEY(DHPB:TindakanAkhir),DUP,NOCASE,OPT
KeyKodeRuang             KEY(DHPB:Ruang),DUP,NOCASE,OPT
KeyTindakan              KEY(DHPB:Tindakan),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NoPeriksa                   STRING(12)
Nomor_mr                    LONG
KodeDiagnosa                LONG
KodeRegion                  LONG
DiagTambah                  LONG
Keracunan                   STRING(30)
Kecelakaan                  STRING(30)
Lokasi                      STRING(40)
TanggalMasuk                DATE
Jammasuk                    TIME
TanggalBatal                DATE
JamBatal                    TIME
StatusPP                    STRING(3)
Ruang                       STRING(10)
Dokter_OP                   STRING(32)
Dok_anes                    STRING(32)
Tanggungan                  STRING(20)
Tindakan                    STRING(20)
TindakanAkhir               LONG
SewaTpInsBed                BYTE
NmSewaTpInsBed              STRING(15)
NmOperasi                   STRING(20)
SewaMesAnes                 BYTE
NmSewaMesAnes               STRING(15)
PengObatAlat                REAL
Sifat                       STRING(1)
Pembayaran                  BYTE
KodeKtr                     BYTE
StatusLunas                 BYTE
StatusCetakKerja            BYTE
TotalBiySewDoc              REAL
TotalBiyOp                  REAL
TotalBiyAnes                REAL
TotalBiySewIBed             REAL
TotalBiySewMes              REAL
TotalBiyObat                REAL
TotalBiyASunIn              REAL
TotalBiyBenJah              REAL
TotalBiyBal                 REAL
TotalBiyGas                 REAL
TotalBiyLain                REAL
TotalBiySEL_ALAT            REAL
TotalBiySeluruh             REAL
User                        STRING(20)
                         END
                     END                       

DDTRpTin             FILE,DRIVER('SQLAnywhere'),NAME('dba.DDTRpTin'),PRE(DDTP),CREATE,BINDABLE,THREAD
KeyNoPeriksaTindak       KEY(DDTP:NoPeriksa),DUP,NOCASE,OPT
KeyKodeAlatDetail        KEY(DDTP:KodeDet),DUP,NOCASE,OPT
KeyNoPe_KDet             KEY(DDTP:NoPeriksa,DDTP:KodeDet),NOCASE,OPT
Record                   RECORD,PRE()
NoPeriksa                   STRING(12)
KodeUrut                    BYTE
KodeDet                     STRING(10)
Nama                        STRING(29)
Jenis                       STRING(20)
Type                        STRING(20)
Biaya                       REAL
Pemakaian                   LONG
Satuan                      STRING(5)
                         END
                     END                       

DDTLain              FILE,DRIVER('SQLAnywhere'),NAME('dba.DDTLain'),PRE(DDTL),CREATE,BINDABLE,THREAD
KeyNoPeriksaLain         KEY(DDTL:NoPeriksa),DUP,NOCASE,OPT
KeyKodeLain              KEY(DDTL:KodeLain),DUP,NOCASE,OPT
KeyNoPe_KLain            KEY(DDTL:NoPeriksa,DDTL:KodeLain),NOCASE,OPT
Record                   RECORD,PRE()
NoPeriksa                   STRING(12)
KodeUrut                    BYTE
KodeLain                    STRING(10)
Pemakaian                   LONG
Satuan                      STRING(5)
Biaya                       REAL
                         END
                     END                       

DHPToday             FILE,DRIVER('SQLAnywhere'),NAME('dba.DHPToday'),PRE(DHPT),CREATE,BINDABLE,THREAD
KeyNomorMr               KEY(DHPT:Nomor_mr),DUP,NOCASE,OPT
KeyNomorPeriksa          KEY(DHPT:NoPeriksa),NOCASE,OPT,PRIMARY
KeyNomorPeriksaBalik     KEY(-DHPT:NoPeriksa),DUP,NOCASE,OPT
KeyKodeDiagKerja         KEY(DHPT:KodeDiagnosa),DUP,NOCASE,OPT
KeyDiagTambah            KEY(DHPT:DiagTambah),DUP,NOCASE,OPT
keyKodeRegion            KEY(DHPT:KodeRegion),DUP,NOCASE,OPT
KeyTglMasuk_Jam          KEY(DHPT:TanggalMasuk,-DHPT:Jammasuk),DUP,NOCASE,OPT
KeyTindakanAkhir         KEY(DHPT:TindakanAkhir),DUP,NOCASE,OPT
KeyKodeRuang             KEY(DHPT:Ruang),DUP,NOCASE,OPT
KeyObatNotta             KEY(DHPT:NoPeriksa,DHPT:K_OBATOBATAN),DUP,NOCASE,OPT
KeyTindakan              KEY(DHPT:Tindakan),DUP,NOCASE,OPT
KeySunInNotta            KEY(DHPT:NoPeriksa,DHPT:K_alSunIn),DUP,NOCASE,OPT
KeyBenJahNotta           KEY(DHPT:NoPeriksa,DHPT:K_Benjah),DUP,NOCASE,OPT
KeyBalNotta              KEY(DHPT:NoPeriksa,DHPT:K_Bal),DUP,NOCASE,OPT
KeyGasAnNotta            KEY(DHPT:NoPeriksa,DHPT:K_GasAnes),DUP,NOCASE,OPT
KeyLainNotta             KEY(DHPT:NoPeriksa,DHPT:K_AlLain),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NoPeriksa                   STRING(12)
Nomor_mr                    LONG
KodeDiagnosa                LONG
KodeRegion                  LONG
DiagTambah                  LONG
Keracunan                   STRING(30)
Kecelakaan                  STRING(30)
Lokasi                      STRING(40)
TanggalMasuk                DATE
Jammasuk                    TIME
TanggalKeluar               DATE
JamKeluar                   TIME
StatusPP                    STRING(3)
Ruang                       STRING(10)
Dokter_OP                   STRING(32)
Dok_anes                    STRING(32)
Tanggungan                  STRING(20)
Tindakan                    STRING(20)
TindakanAkhir               LONG
SewaTpInsBed                BYTE
NmSewaTpInsBed              STRING(15)
NmOperasi                   STRING(20)
SewaMesAnes                 BYTE
NmSewaMesAnes               STRING(15)
PengObatAlat                REAL
Sifat                       STRING(1)
Pembayaran                  BYTE
KodeKtr                     BYTE
StatusLunas                 BYTE
StatusCetakKerja            BYTE
K_OBATOBATAN                BYTE
K_alSunIn                   BYTE
K_Benjah                    BYTE
K_Bal                       BYTE
K_GasAnes                   BYTE
K_AlLain                    BYTE
TotalBiySewDoc              REAL
TotalBiyOp                  REAL
TotalBiyAnes                REAL
TotalBiySewIBed             REAL
TotalBiySewMes              REAL
TotalBiyObat                REAL
TotalBiyASunIn              REAL
TotalBiyBenJah              REAL
TotalBiyBal                 REAL
TotalBiyGas                 REAL
TotalBiyLain                REAL
TotalBiySEL_ALAT            REAL
TotalBiySeluruh             REAL
User                        STRING(20)
                         END
                     END                       

AAdjust              FILE,DRIVER('SQLAnywhere'),NAME('dba.AAdjust'),PRE(AAD),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(AAD:Nomor),PRIMARY
GBarang_GAdjusment_Key   KEY(AAD:Kode_Barang),DUP
Record                   RECORD,PRE()
Nomor                       STRING(20)
Kode_Barang                 STRING(10)
Jumlah                      REAL
Tanggal                     DATE
Jam                         TIME
Keterangan                  STRING(30)
Operator                    STRING(10)
Status                      BYTE
Kode_Apotik                 STRING(5)
Harga                       REAL
QtyStok                     REAL
QtyFisik                    REAL
verifikasi                  BYTE
                         END
                     END                       

DDTambah             FILE,DRIVER('SQLAnywhere'),NAME('dba.DDTambah'),PRE(DDTh),CREATE,BINDABLE,THREAD
KeyNoPeriksaTindak       KEY(DDTh:NoPeriksa),DUP,NOCASE,OPT
KeyNamaDiagReg           KEY(DDTh:NamaDiagnosa,DDTh:NamaRegion),DUP,NOCASE,OPT
KeyNamaDiag              KEY(DDTh:NamaDiagnosa),DUP,NOCASE,OPT
KeyNamaRegion            KEY(DDTh:NamaRegion),DUP,NOCASE,OPT
KeyNoPe_KTindak          KEY(DDTh:NoPeriksa,DDTh:NamaDiagnosa),NOCASE,OPT
Record                   RECORD,PRE()
NoPeriksa                   STRING(12)
KodeUrut                    BYTE
NamaDiagnosa                STRING(20)
NamaRegion                  STRING(20)
Biaya                       REAL
                         END
                     END                       

DDTGas               FILE,DRIVER('SQLAnywhere'),NAME('dba.DDTGas'),PRE(DDTG),CREATE,BINDABLE,THREAD
KeyNoPeriksaGas          KEY(DDTG:NoPeriksa),DUP,NOCASE,OPT
KeyKodeGas               KEY(DDTG:KodeGas),DUP,NOCASE,OPT
KeyNoPe_KGas             KEY(DDTG:NoPeriksa,DDTG:KodeGas),NOCASE,OPT
Record                   RECORD,PRE()
NoPeriksa                   STRING(12)
KodeUrut                    BYTE
KodeGas                     STRING(10)
Pemakaian                   LONG
Satuan                      STRING(5)
Biaya                       REAL
                         END
                     END                       

ROGBarang            FILE,DRIVER('SQLAnywhere'),NAME('dba.ROGBarang'),PRE(RoGB),CREATE,BINDABLE,THREAD
KeyKodeBrg               KEY(RoGB:Kode_brg),NAME('KeyKodeBrg'),OPT,PRIMARY
keyjenisfilm             KEY(RoGB:KodeFilm),DUP,NOCASE,OPT
KeyNama                  KEY(RoGB:Nama_Brg),DUP,NAME('KeyNama'),OPT
Record                   RECORD,PRE()
Kode_brg                    STRING(10)
Nama_Brg                    STRING(40)
Jenis_Brg                   STRING(5)
No_Satuan                   STRING(10)
Dosis                       ULONG
Stok_Total                  REAL
Jumlah_Stok                 REAL
debet                       REAL
kredit                      REAL
Harga_Beli                  REAL
HargaSebelum                REAL
stock_min                   REAL
stock_max                   REAL
Discount                    REAL
HargaJual                   REAL
BiayaRoTotal                REAL
BiayaRoRi1                  REAL
BiayaRoRi2                  REAL
BiayaRoRi3                  REAL
BiayaRoRi4                  REAL
KodeFilm                    STRING(10)
Kode_Instalasi              STRING(5)
Jenis                       STRING(10)
                         END
                     END                       

OKKStok              FILE,DRIVER('SQLAnywhere'),NAME('DBA.OKKStok'),PRE(GKS1),BINDABLE,THREAD
PrimaryKey               KEY(GKS1:Kode_Barang,GKS1:Tanggal,GKS1:Transaksi,GKS1:NoTransaksi),PRIMARY
UrutTanggal_Key          KEY(GKS1:Tanggal,GKS1:Jam),DUP,NOCASE,OPT
BrgTglJamNoTrans_Key     KEY(GKS1:Kode_Barang,GKS1:Tanggal,GKS1:Jam,GKS1:NoTransaksi),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Kode_Barang                 STRING(10)
Tanggal                     DATE
Jam                         TIME
Transaksi                   STRING(50)
NoTransaksi                 STRING(15)
Debet                       REAL
Kredit                      REAL
Opname                      REAL
Status                      BYTE
                         END
                     END                       

DDTBal               FILE,DRIVER('SQLAnywhere'),NAME('dba.DDTBal'),PRE(DDTB),CREATE,BINDABLE,THREAD
KeyNoPeriksaBal          KEY(DDTB:NoPeriksa),DUP,NOCASE,OPT
KeyKodeBalut             KEY(DDTB:KodeBalut),DUP,NOCASE,OPT
KeyNoPe_KBalut           KEY(DDTB:NoPeriksa,DDTB:KodeBalut),NOCASE,OPT
Key3rec                  KEY(DDTB:NoPeriksa,DDTB:KodeBalut,DDTB:KEL),NOCASE,OPT
Record                   RECORD,PRE()
NoPeriksa                   STRING(12)
KodeUrut                    BYTE
KodeBalut                   STRING(10)
Pemakaian                   LONG
Satuan                      STRING(5)
Biaya                       REAL
KEL                         BYTE
                         END
                     END                       

DDTSunIn             FILE,DRIVER('SQLAnywhere'),NAME('dba.DDTSunIn'),PRE(DDSI),CREATE,BINDABLE,THREAD
KeyNoPeriksaTindak       KEY(DDSI:NoPeriksa),DUP,NOCASE,OPT
KeyKodeSunIn             KEY(DDSI:KodeSunIn),DUP,NOCASE,OPT
KeyNoPe_KSunIn           KEY(DDSI:NoPeriksa,DDSI:KodeSunIn),NOCASE,OPT
Record                   RECORD,PRE()
NoPeriksa                   STRING(12)
KodeUrut                    BYTE
KodeSunIn                   STRING(10)
Pemakaian                   LONG
Satuan                      STRING(5)
Biaya                       REAL
                         END
                     END                       

DDTobat              FILE,DRIVER('SQLAnywhere'),NAME('dba.DDTobat'),PRE(DDTO),CREATE,BINDABLE,THREAD
KeyNoPeriksaObat         KEY(DDTO:NoPeriksa),DUP,NOCASE,OPT
KeyKodeObat              KEY(DDTO:KodeObat),DUP,NOCASE,OPT
KeyNoPe_KTindak          KEY(DDTO:NoPeriksa,DDTO:KodeObat),NOCASE,OPT
Record                   RECORD,PRE()
NoPeriksa                   STRING(12)
KodeUrut                    BYTE
KodeObat                    STRING(10)
Pemakaian                   LONG
Satuan                      STRING(5)
Biaya                       REAL
                         END
                     END                       

IDataKtr             FILE,DRIVER('SQLAnywhere'),NAME('dba.IDataKtr'),PRE(IDtK),CREATE,BINDABLE,THREAD
KeyNama                  KEY(IDtK:Kode_kontrak),DUP,NOCASE,OPT
KeyNomorMr               KEY(IDtK:Nomor_mr),NOCASE,OPT,PRIMARY
KeyTanggal               KEY(IDtK:Tanggal),DUP,NOCASE,OPT
KeyKodeKontrak           KEY(IDtK:Kode_kontrak),DUP,NOCASE,OPT
KeyNoNota                KEY(IDtK:NoNota),DUP,NOCASE,OPT
KeyNoUrut                KEY(IDtK:NoUrut),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_mr                    LONG
Kode_kontrak                STRING(10)
NIK                         STRING(20)
GOL                         STRING(20)
No_Surat_Pengantar          STRING(20)
Telepon_rumah               STRING(15)
Tgl_surat_pgt               DATE
Tanggal                     DATE
NoNota                      STRING(10)
User                        STRING(20)
NoUrut                      STRING(10)
                         END
                     END                       

DDTindak             FILE,DRIVER('SQLAnywhere'),NAME('dba.DDTindak'),PRE(DDTN),CREATE,BINDABLE,THREAD
KeyNoPeriksaTindak       KEY(DDTN:NoPeriksa),DUP,NOCASE,OPT
KeyKodeTindak            KEY(DDTN:KodeTindak),DUP,NOCASE,OPT
KeyNoPe_KTindak          KEY(DDTN:NoPeriksa,DDTN:KodeTindak),NOCASE,OPT
Record                   RECORD,PRE()
NoPeriksa                   STRING(12)
KodeUrut                    BYTE
KodeTindak                  LONG
NamaTindakan                STRING(35)
Satuan                      STRING(5)
Biaya                       REAL
                         END
                     END                       

JKET                 FILE,DRIVER('SQLAnywhere'),NAME('dba.JKET'),PRE(JKET),CREATE,BINDABLE,THREAD
KeyKode                  KEY(JKET:KODE),OPT,PRIMARY
KeyDeskripsi             KEY(JKET:DESKRIPSI),DUP,OPT
Record                   RECORD,PRE()
KODE                        STRING(10)
DESKRIPSI                   STRING(40)
                         END
                     END                       

IRekRu               FILE,DRIVER('SQLAnywhere'),NAME('dba.IRekRu'),PRE(IREK),CREATE,BINDABLE,THREAD
KeyRuang                 KEY(IREK:Ruang),NOCASE,OPT,PRIMARY
KeyRekap                 KEY(IREK:Rekap),DUP,NOCASE,OPT
KeyNomorMr               KEY(IREK:Nomor_Mr),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Ruang                       STRING(10)
Nomor_Mr                    LONG
Rekap                       LONG
                         END
                     END                       

HM_SUPPLIER          FILE,DRIVER('SQLAnywhere'),NAME('DBA.HM_SUPPLIER'),PRE(HM_S),BINDABLE,THREAD
Record                   RECORD,PRE()
KODESUPP                    STRING(3)
NAMASUPP                    CSTRING(51)
ALAMAT1                     CSTRING(51)
ALAMAT2                     CSTRING(51)
NOTELP                      CSTRING(21)
NOFAX                       CSTRING(21)
STSSUPP                     STRING(1)
APGRPID                     STRING(3)
TYPESUPP                    STRING(1)
                         END
                     END                       

HM_DOKTER            FILE,DRIVER('SQLAnywhere'),NAME('DBA.HM_DOKTER'),PRE(HM_D),BINDABLE,THREAD
Record                   RECORD,PRE()
KODEDOKTER                  STRING(4)
KDSPESIAL                   STRING(2)
KODEBAGIAN                  STRING(4)
NAMADOKTER                  STRING(30)
JNSKELAMIN                  STRING(1)
ALM1DOKTER                  CSTRING(41)
ALM2DOKTER                  CSTRING(41)
TELPDOKTER                  STRING(25)
TELPRAKTEK                  STRING(25)
NOPAGERDR                   STRING(25)
JSDRPASDR                   PDECIMAL(7,2)
JSDRPASRS                   PDECIMAL(7,2)
JSDRPASVT                   PDECIMAL(7,2)
POTPAJAK                    PDECIMAL(7,2)
STSKERJADR                  STRING(1)
PASDRHJ                     STRING(1)
PASRSHJ                     STRING(1)
NOREKDR                     STRING(20)
KETDOKTER                   CSTRING(41)
FLAGHADIR                   STRING(1)
MAXPASIEN                   SHORT
MAXKONTRAK                  PDECIMAL(11,4)
KODEPMR                     STRING(6)
USLOGNM                     CSTRING(21)
LAMAPLY                     PDECIMAL(5,2)
                         END
                     END                       

HM_DOKTERLUAR        FILE,DRIVER('SQLAnywhere'),NAME('DBA.HM_DOKTERLUAR'),PRE(HM_DL),BINDABLE,THREAD
Record                   RECORD,PRE()
KODEDOKTER                  STRING(4)
NAMADOKTER                  CSTRING(51)
ALAMAT                      CSTRING(51)
KDSPESIAL                   STRING(2)
TELP                        CSTRING(51)
                         END
                     END                       

HM_Kontraktor        FILE,DRIVER('SQLAnywhere'),NAME('DBA.HM_Kontraktor'),PRE(HM_K),BINDABLE,THREAD
Record                   RECORD,PRE()
KODEPT                      STRING(4)
KODEGRPPT                   STRING(4)
KODEGRBR                    STRING(10)
KDGRPTRF                    STRING(1)
NAMAPT                      CSTRING(61)
NOKONTRAK                   CSTRING(51)
TGLAWALKONTRAK              STRING(8)
TGLAWALKONTRAK_GROUP        GROUP,OVER(TGLAWALKONTRAK)
TGLAWALKONTRAK_DATE           DATE
TGLAWALKONTRAK_TIME           TIME
                            END
TGLAKHIRKONTRAK             STRING(8)
TGLAKHIRKONTRAK_GROUP       GROUP,OVER(TGLAKHIRKONTRAK)
TGLAKHIRKONTRAK_DATE          DATE
TGLAKHIRKONTRAK_TIME          TIME
                            END
MRGPROFIT                   PDECIMAL(7,2)
STSKONTRAK                  STRING(1)
STSKARYAWAN                 STRING(1)
BTPAYRI                     PDECIMAL(11,4)
BTPAYRJ                     PDECIMAL(11,4)
DISCRJ                      BYTE
DISCRI                      SHORT
JNSDISCRJ                   STRING(1)
JNSDISCRI                   STRING(1)
ALAMAT1                     CSTRING(51)
ALAMAT2                     CSTRING(51)
NOTLP                       CSTRING(31)
NOFAX                       CSTRING(31)
COPERSON1                   CSTRING(21)
TLPRMH1                     CSTRING(16)
NOHP1                       CSTRING(16)
COPERSON2                   CSTRING(21)
TLPRMH2                     CSTRING(16)
NOHP2                       CSTRING(16)
LYNKARYA                    STRING(1)
LYNKARYAPA                  STRING(1)
LYNKARYAPR                  STRING(1)
ALLDRSP                     STRING(1)
DRSPTNT                     STRING(1)
RWIBIASA                    STRING(1)
RWIOPERASI                  STRING(1)
RILHRNORM                   STRING(1)
RILHRVAC                    STRING(1)
RILHRSECT                   STRING(1)
MAXOBAT                     PDECIMAL(11,4)
KETMAXOBAT                  CSTRING(61)
PROSRWJ                     CSTRING(61)
PROSRWI                     CSTRING(61)
PROSUGD                     CSTRING(61)
PAJAK                       STRING(1)
KODEGTRFPT                  STRING(2)
IURBIAYA                    SHORT
JNSTARIF                    STRING(1)
DINAS                       STRING(1)
JNSOBAT                     STRING(5)
GRPOBATGRTS                 STRING(1)
DISCGRTS                    PDECIMAL(9,2)
ADMBARU                     STRING(6)
ADMLAMA                     STRING(6)
ADMBARUSORE                 STRING(6)
ADMLAMASORE                 STRING(6)
ADMRWI                      STRING(6)
MRGOBTASKES1                PDECIMAL(5,2)
MRGOBTASKES2                PDECIMAL(5,2)
MRGOBTASKES3                PDECIMAL(5,2)
SUBSIDI                     PDECIMAL(11,4)
ARGRPID                     STRING(3)
MATERAI                     STRING(1)
JENISPT                     STRING(1)
STSDATATANG                 STRING(1)
TYPEDATATANG                STRING(1)
COPERSON3                   CSTRING(21)
NOHP3                       CSTRING(16)
TLPRMH3                     CSTRING(16)
RILHRKUR                    STRING(1)
STSPT                       STRING(10)
MASAPEMBAYARAN              STRING(2)
STSPEMERIKSAAN              STRING(1)
HARGAPEMERIKSAAN            STRING(1)
STSOBAT                     STRING(1)
STSKAMAR                    STRING(1)
HARGAKAMAR                  STRING(1)
KONFIRMRJ                   STRING(1)
KONFIRMRI                   STRING(1)
JNS_MRG                     STRING(1)
UANGSER1                    PDECIMAL(11,4)
UANGSER2                    PDECIMAL(11,4)
UANGSER3                    PDECIMAL(11,4)
UANGSER4                    PDECIMAL(11,4)
UANGSER5                    PDECIMAL(11,4)
UANGSER6                    PDECIMAL(11,4)
EMBALACE1                   PDECIMAL(11,4)
EMBALACE2                   PDECIMAL(11,4)
EMBALACE3                   PDECIMAL(11,4)
EMBALACE4                   PDECIMAL(11,4)
EMBALACE5                   PDECIMAL(11,4)
FLAGRESEP                   STRING(1)
FLAGADM                     STRING(1)
                         END
                     END                       

HM_PASIEN            FILE,DRIVER('SQLAnywhere'),NAME('DBA.HM_PASIEN'),PRE(HM_P),BINDABLE,THREAD
Record                   RECORD,PRE()
HBBSAG                      CSTRING(51)
TGLEDITSTS                  STRING(8)
TGLEDITSTS_GROUP            GROUP,OVER(TGLEDITSTS)
TGLEDITSTS_DATE               DATE
TGLEDITSTS_TIME               TIME
                            END
FLAGRAUDHAH                 STRING(1)
UNITAWAL                    STRING(4)
NOKTP                       CSTRING(101)
KDPKRJAAN                   STRING(2)
NOPASIEN                    STRING(8)
KODEAGAMA                   STRING(1)
KODEDARAH                   STRING(2)
KODEDIDIK                   STRING(1)
KODEPT                      STRING(4)
NAMAPASIEN                  CSTRING(41)
NAMAEYD                     CSTRING(41)
TMPLAHIR                    STRING(15)
TGLLAHIR                    STRING(8)
TGLLAHIR_GROUP              GROUP,OVER(TGLLAHIR)
TGLLAHIR_DATE                 DATE
TGLLAHIR_TIME                 TIME
                            END
JNSKELAMIN                  STRING(1)
STKAWIN                     STRING(1)
ALM1PASIEN                  CSTRING(41)
ALM2PASIEN                  CSTRING(41)
KDPROPINSI                  STRING(3)
KDKOTA                      STRING(3)
KOTAPAS                     STRING(15)
KLRHPAS                     CSTRING(21)
KECPAS                      CSTRING(51)
KDPOSPAS                    STRING(5)
TLPPASIEN                   STRING(25)
PEKERJAAN                   CSTRING(41)
ALMPEKERJA                  CSTRING(41)
TLPPEKERJA                  STRING(25)
ALLERGI                     CSTRING(41)
NAMAPGJWB                   CSTRING(41)
NIKPGJWB                    CSTRING(21)
ALM1PGJWB                   CSTRING(41)
ALM2PGJWB                   CSTRING(41)
HUBPGJWB                    STRING(20)
NOTANGPAS                   PDECIMAL(19)
TGLAKHRS                    STRING(8)
TGLAKHRS_GROUP              GROUP,OVER(TGLAKHRS)
TGLAKHRS_DATE                 DATE
TGLAKHRS_TIME                 TIME
                            END
UNITAKHRS                   STRING(4)
WARGANEGARA                 STRING(1)
NEGARA                      STRING(15)
RETENSI                     STRING(1)
NAMAPANGGILAN               CSTRING(16)
KODEJBT                     STRING(2)
KDGRPTRF                    STRING(1)
STSPASIEN                   STRING(1)
NOPASIENHISTORY             STRING(8)
KODEPT1                     STRING(4)
NOPOLIS                     STRING(20)
TGLAWALRS                   STRING(8)
TGLAWALRS_GROUP             GROUP,OVER(TGLAWALRS)
TGLAWALRS_DATE                DATE
TGLAWALRS_TIME                TIME
                            END
PHOTO                       CSTRING(151)
BARCODE                     CSTRING(151)
HDKUNJKE                    LONG
HDKUNJ1ST                   STRING(8)
HDKUNJ1ST_GROUP             GROUP,OVER(HDKUNJ1ST)
HDKUNJ1ST_DATE                DATE
HDKUNJ1ST_TIME                TIME
                            END
KUNJFIS                     LONG
NMKANTOR                    CSTRING(51)
DOKTERHD                    CSTRING(51)
DX                          CSTRING(51)
                         END
                     END                       

HM_DIAGNOSA          FILE,DRIVER('SQLAnywhere'),NAME('DBA.HM_DIAGNOSA'),PRE(HM_DI),BINDABLE,THREAD
Record                   RECORD,PRE()
DTD                         STRING(8)
GOLSAKIT                    STRING(150)
DAFRINCI                    STRING(40)
FLAGDTD                     STRING(1)
NOLAP                       STRING(2)
KDLAYANAN                   STRING(2)
JNSSAKIT                    STRING(1)
LAPBULANAN                  STRING(1)
JENIS                       STRING(1)
INDEKS                      STRING(1)
                         END
                     END                       

JTindaka             FILE,DRIVER('SQLAnywhere'),NAME('dba.JTindaka'),PRE(JTin),CREATE,BINDABLE,THREAD
KeyKodeTInd              KEY(JTin:KodeTind),OPT,PRIMARY
KeyNamaTind              KEY(JTin:NamaTind),DUP,OPT
KeyUpf                   KEY(JTin:UPF),DUP,OPT
KeyKet                   KEY(JTin:Keterangan),DUP,OPT
Record                   RECORD,PRE()
KodeTind                    STRING(10)
NamaTind                    STRING(35)
UPF                         STRING(10)
Keterangan                  STRING(30)
BiayaDasar                  REAL
Kelas1                      REAL
Kelas2                      REAL
Kelas3                      REAL
VIP                         REAL
Tanggal                     DATE
Jam                         TIME
User                        STRING(10)
                         END
                     END                       

DTPBalut             FILE,DRIVER('SQLAnywhere'),NAME('dba.DTPBalut'),PRE(DTPB),CREATE,BINDABLE,THREAD
KeyUPF                   KEY(DTPB:UPFBar),DUP,NOCASE,OPT
KeyKodeBalut             KEY(DTPB:KodeBalut),NOCASE,OPT
KeyKodePaketBalut        KEY(DTPB:KodePBalut),DUP,NOCASE,OPT
Record                   RECORD,PRE()
UPFBar                      STRING(10)
KodePBalut                  STRING(10)
KodeBalut                   STRING(10)
NamaBalut                   STRING(29)
Satuan                      STRING(10)
In                          BYTE
Harga                       ULONG
Setiap                      LONG
HabisPak                    BYTE
                         END
                     END                       

JUPF                 FILE,DRIVER('SQLAnywhere'),NAME('dba.JUPF'),PRE(JUPF),CREATE,BINDABLE,THREAD
KeyKodeUpf               KEY(JUPF:Kode_UPF),OPT,PRIMARY
KeyNamaUpf               KEY(JUPF:Nama_UPF),DUP,OPT
Record                   RECORD,PRE()
Kode_UPF                    STRING(10)
Nama_UPF                    STRING(30)
                         END
                     END                       

JPoli                FILE,DRIVER('SQLAnywhere'),NAME('dba.JPoli'),PRE(JPol),CREATE,BINDABLE,THREAD
BY_POLI                  KEY(JPol:POLIKLINIK),OPT,PRIMARY
BY_NAMA                  KEY(JPol:NAMA_POLI),DUP,OPT
ByUPF                    KEY(JPol:UPF),DUP,OPT
ByNoPoli                 KEY(JPol:NO_POLI),DUP,NOCASE,OPT
KeyTempat                KEY(JPol:TEMPAT),DUP,OPT
KeyLantai                KEY(JPol:Lantai),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NAMA_POLI                   STRING(25)
POLIKLINIK                  STRING(10)
TEMPAT                      STRING(5)
NO_POLI                     LONG
UPF                         STRING(10)
BiayaRSI                    REAL
BiayaDokter                 REAL
TotalBiaya                  REAL
User                        STRING(10)
Tanggal                     DATE
Lantai                      BYTE
                         END
                     END                       

JKecamatan           FILE,DRIVER('SQLAnywhere'),NAME('dba.JKecamatan'),PRE(JKec),CREATE,BINDABLE,THREAD
KeyKecamatan             KEY(JKec:KECAMATAN),NOCASE,OPT,PRIMARY
KeyKota                  KEY(JKec:KOTA),DUP,NOCASE,OPT
Record                   RECORD,PRE()
KECAMATAN                   STRING(20)
KOTA                        STRING(20)
Wilayah                     STRING(5)
                         END
                     END                       

JGroupKtr            FILE,DRIVER('SQLAnywhere'),NAME('dba.JGroupKtr'),PRE(GrK),CREATE,BINDABLE,THREAD
KeyKodeGroup             KEY(GrK:KODE_GROUP),NOCASE,OPT,PRIMARY
KeyNamaGroup             KEY(GrK:NAMA_GROUP),DUP,OPT
Record                   RECORD,PRE()
KODE_GROUP                  LONG
NAMA_GROUP                  STRING(40)
NO_GROUP                    LONG
KET                         STRING(40)
                         END
                     END                       

JTransaksi           FILE,DRIVER('SQLAnywhere'),NAME('dba.JTransaksi'),PRE(JTra),CREATE,BINDABLE,THREAD
KeyNomorMr               KEY(JTra:Nomor_Mr),DUP,NOCASE,OPT
descnota_jtransaksi_ik   KEY(-JTra:No_Nota),DUP,NOCASE,OPT
KeyKodeDokter            KEY(JTra:Kode_dokter),DUP,NOCASE,OPT
KeyRujukan               KEY(JTra:Rujukan),DUP,NOCASE,OPT
KeyKodePoli              KEY(JTra:Kode_poli),DUP,NOCASE,OPT
KeyTanggal               KEY(JTra:Tanggal),DUP,NOCASE,OPT
KeyNoNota                KEY(JTra:No_Nota),NOCASE,OPT,PRIMARY
KeySelesai               KEY(JTra:Selesai),DUP,NOCASE,OPT
KeyCetak                 KEY(JTra:Cetak),DUP,NOCASE,OPT
KeyTransaksi             KEY(JTra:Kode_Transaksi),DUP,NOCASE,OPT
Pegawai_JTransaksi_FK    KEY(JTra:NIP),DUP,NOCASE,OPT
Kontraktor_JTransaksi_FK KEY(JTra:Kontraktor),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_Mr                    LONG
Tanggal                     DATE
Baru_Lama                   STRING(1)
Kode_poli                   STRING(10)
Kode_dokter                 STRING(10)
BiayaRSI                    REAL
BiayaDokter                 REAL
BiayaTotal                  REAL
Kode_Transaksi              BYTE
Konsul                      STRING(1)
Rujukan                     STRING(15)
No_Nota                     STRING(10)
Tempat                      STRING(10)
Setor                       STRING(20)
User                        STRING(10)
Selesai                     STRING(1)
Jam                         TIME
Cetak                       STRING(1)
Status                      STRING(1)
NIP                         STRING(7)
Kontraktor                  STRING(10)
LamaBaru                    BYTE
byr_pendaftraran            SHORT
PDPM                        STRING(2)
Lokasi                      BYTE
StatusKonsul                BYTE
NoRegKontrak                STRING(10)
Pengirim                    LONG
NamaJawab                   STRING(40)
AlamatJawab                 STRING(50)
RTJawab                     LONG
RWJawab                     LONG
KelurahanJawab              STRING(30)
KecamatanJawab              STRING(30)
KotaJawab                   STRING(30)
StatusDaftar                BYTE
StatusJawab                 BYTE
PekerjaanJawab              STRING(30)
StatusNoSP                  BYTE
SJP                         STRING(30)
statustindpoli              BYTE
StatusBatal                 BYTE
StatusRujukan               BYTE
NoResep                     STRING(30)
BiayaKontrakDr              REAL
BiayaKontrakRSI             REAL
PoliSelisih                 STRING(10)
StatusSelisih               BYTE
NilaiSelisih                REAL
SPJ                         STRING(30)
Nilai1                      REAL
Nilai2                      REAL
Umur                        STRING(20)
Pegawai                     BYTE
StatusBayar                 BYTE
KetNamaPasen                STRING(50)
AcuanTarif                  LONG
Keterangan                  STRING(30)
StatusInsertBilling         BYTE
StatusDr                    BYTE
Dr_pers                     STRING(40)
Kls_tanggungan              STRING(5)
StatusMGM                   BYTE
KodeMember                  STRING(20)
salesman                    STRING(10)
PenanggungTelpRumah         STRING(20)
PenanggungHandphone         STRING(20)
PenanggungKTP               STRING(20)
HambatanFisik1              BYTE
HambatanFisik2              STRING(20)
PengantarNama               STRING(30)
PengantarAlamat             STRING(50)
DokterDituju                STRING(5)
NamaKontrak1                STRING(30)
Kontrak2                    STRING(10)
Kontrak3                    STRING(10)
NamaKontrak2                STRING(30)
NamaKontrak3                STRING(30)
StatusMCU                   BYTE
                         END
                     END                       

JDataKtr             FILE,DRIVER('SQLAnywhere'),NAME('dba.JDataKtr'),PRE(JDKt),CREATE,BINDABLE,THREAD
KeyNomorMr               KEY(JDKt:Nomor_mr,-JDKt:Tgl_surat_pgt),NOCASE,OPT,PRIMARY
KeyNama                  KEY(JDKt:NamaPegawai),DUP,OPT
KeyKodeKontrak           KEY(JDKt:Kode_Kontrak),DUP,OPT
KeyTanggal               KEY(JDKt:Tanggal),DUP,NOCASE,OPT
KeyNoUrut                KEY(JDKt:NoUrut),DUP,NOCASE,OPT
KeyNomorMrSendiri        KEY(JDKt:Nomor_mr),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_mr                    LONG
NoUrut                      STRING(10)
Kode_Kontrak                STRING(10)
NIK                         STRING(20)
GOL                         STRING(10)
No_Surat_Pengantar          STRING(20)
Telepon_rumah               STRING(15)
Tgl_surat_pgt               DATE
Tanggal                     DATE
User                        STRING(10)
NamaPegawai                 STRING(25)
                         END
                     END                       

INSaldoawal          FILE,DRIVER('SQLAnywhere'),NAME('dba.INSaldoawal'),PRE(INSA),BINDABLE,THREAD
PrimaryKey               KEY(INSA:Kode_barang,INSA:Bulan,INSA:tahun),PRIMARY
oksawal_gbar_fk          KEY(INSA:Kode_barang),DUP
Record                   RECORD,PRE()
Kode_barang                 STRING(10)
Bulan                       SHORT
tahun                       SHORT
jumlah                      REAL
harga                       REAL
total                       REAL
                         END
                     END                       

JTbTransaksi         FILE,DRIVER('SQLAnywhere'),NAME('dba.JTbTransaksi'),PRE(JTbT),CREATE,BINDABLE,THREAD
KeyKodeTransaksi         KEY(JTbT:KODE_TRANS),NOCASE,OPT,PRIMARY
KeyNamaTransaksi         KEY(JTbT:Nama_Transaksi),DUP,OPT
Record                   RECORD,PRE()
KODE_TRANS                  LONG
Nama_Transaksi              STRING(30)
Status                      STRING(6)
Keterangan                  STRING(20)
                         END
                     END                       

DTPBena              FILE,DRIVER('SQLAnywhere'),NAME('dba.DTPBena'),PRE(DTPE),CREATE,BINDABLE,THREAD
KeyUPF                   KEY(DTPE:UPFBar),DUP,NOCASE,OPT
KeyKodeBenang            KEY(DTPE:KodeBenang),NOCASE,OPT
KeyKodePaketBenang       KEY(DTPE:KodePBenang),DUP,NOCASE,OPT
Record                   RECORD,PRE()
UPFBar                      STRING(10)
KodePBenang                 STRING(10)
KodeBenang                  STRING(10)
NamaBenang                  STRING(29)
Satuan                      STRING(10)
In                          BYTE
Harga                       ULONG
Setiap                      LONG
HabisPak                    BYTE
                         END
                     END                       

DTTin_Ak             FILE,DRIVER('SQLAnywhere'),NAME('dba.DTTin_Ak'),PRE(DTTA),CREATE,BINDABLE,THREAD
KeyKodeTindak            KEY(DTTA:KodeTindakAk),NOCASE,OPT
KeyUPF                   KEY(DTTA:UPFBar),DUP,NOCASE,OPT
Record                   RECORD,PRE()
UPFBar                      STRING(10)
KodeTindakAk                LONG
Nama                        STRING(29)
Type                        STRING(12)
Satuan                      STRING(10)
Jenis                       STRING(20)
In                          BYTE
Harga                       REAL
                         END
                     END                       

DTTindHr             FILE,DRIVER('SQLAnywhere'),NAME('dba.DTTindHr'),PRE(DTNH),CREATE,BINDABLE,THREAD
KeyKodeTindak_and_Jasa   KEY(DTNH:KodeTindak,DTNH:KodeJasa),NOCASE,OPT,PRIMARY
KeyUPF                   KEY(DTNH:UPFBar),DUP,NOCASE,OPT
keykodetindak            KEY(DTNH:KodeTindak),DUP,NOCASE,OPT
Record                   RECORD,PRE()
UPFBar                      STRING(10)
KodeTindak                  LONG
KodeJasa                    STRING(3)
NamaJasa                    STRING(31)
VIP                         REAL
Satu                        REAL
Dua                         REAL
Tiga                        REAL
                         END
                     END                       

DTPLain              FILE,DRIVER('SQLAnywhere'),NAME('dba.DTPLain'),PRE(DTPL),CREATE,BINDABLE,THREAD
KeyUPF                   KEY(DTPL:UPFBar),DUP,NOCASE,OPT
KeyKodeLain              KEY(DTPL:KodeLain),NOCASE,OPT
KeyKodePaketlain         KEY(DTPL:KodePLain),DUP,NOCASE,OPT
Record                   RECORD,PRE()
UPFBar                      STRING(10)
KodePLain                   STRING(10)
KodeLain                    STRING(10)
NamaLain                    STRING(29)
Satuan                      STRING(10)
In                          BYTE
Harga                       ULONG
Setiap                      LONG
HabisPak                    BYTE
                         END
                     END                       

JKota                FILE,DRIVER('SQLAnywhere'),NAME('dba.JKota'),PRE(JKot),CREATE,BINDABLE,THREAD
KeyKota                  KEY(JKot:Kota),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
Kota                        STRING(20)
                         END
                     END                       

JStatusDr            FILE,DRIVER('SQLAnywhere'),NAME('dba.JStatusDr'),PRE(JSta),CREATE,BINDABLE,THREAD
KeyStatus                KEY(JSta:Status),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
Status                      STRING(10)
Deskripsi                   STRING(25)
                         END
                     END                       

JDKuitansi           FILE,DRIVER('SQLAnywhere'),NAME('dba.JDKuitansi'),PRE(JDKU),CREATE,BINDABLE,THREAD
KeyNoKuitansi            KEY(JDKU:NoKuitansi),OPT,PRIMARY
KeyTanggal               KEY(JDKU:Tanggal),DUP,NOCASE,OPT
KeyNoBukti               KEY(JDKU:NoBukti),DUP,OPT
Record                   RECORD,PRE()
NoKuitansi                  STRING(10)
NoBukti                     STRING(10)
Tanggal                     DATE
Biaya                       REAL
User                        STRING(10)
                         END
                     END                       

RI_KStok             FILE,DRIVER('SQLAnywhere'),NAME('DBA.RI_KStok'),PRE(RI_KS),BINDABLE,THREAD
PrimaryKey               KEY(RI_KS:Kode_Barang,RI_KS:Tanggal,RI_KS:Transaksi,RI_KS:NoTransaksi,RI_KS:Kode_Ruang),PRIMARY
UrutTanggal_Key          KEY(RI_KS:Tanggal,RI_KS:Jam),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Kode_Barang                 STRING(10)
Tanggal                     DATE
Jam                         TIME
Transaksi                   STRING(30)
NoTransaksi                 STRING(15)
Debet                       REAL
Kredit                      REAL
Opname                      REAL
Kode_Ruang                  STRING(5)
                         END
                     END                       

ITrPasen             FILE,DRIVER('SQLAnywhere'),NAME('dba.ITrPasen'),PRE(ITRP),CREATE,BINDABLE,THREAD
KeyNomorMr               KEY(ITRP:Nomor_mr,ITRP:Tanggal_Masuk,ITRP:Jam_Masuk),NOCASE,OPT,PRIMARY
keymr_tgl                KEY(ITRP:Nomor_mr,-ITRP:Tanggal_Masuk),DUP,NOCASE,OPT
KeyTanggalMasuk          KEY(ITRP:Tanggal_Masuk),DUP,NOCASE,OPT
KeyKodeRuang             KEY(ITRP:Ruang),DUP,NOCASE,OPT
KeyKodeDokter            KEY(ITRP:Kode_Dokter),DUP,NOCASE,OPT
KeyNoNota                KEY(ITRP:NoNota),DUP,NOCASE,OPT
KeyNoMrRuang             KEY(ITRP:Nomor_mr,ITRP:Ruang),DUP,NOCASE,OPT
KeyNoMrSaja              KEY(ITRP:Nomor_mr),DUP,NOCASE,OPT
KeyNoMrStatus            KEY(ITRP:Nomor_mr,ITRP:Status),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_mr                    LONG
Ruang                       STRING(10)
Kelas                       STRING(10)
Jam_Masuk                   TIME
Tanggal_Masuk               DATE
Jam_Keluar                  TIME
Tanggal_Keluar              DATE
Kode_Dokter                 STRING(10)
Status                      BYTE
BiayaRawat                  REAL
BiayaVstRsi                 REAL
BiayaVstDr                  REAL
BiayaTotVstDr               REAL
Tanggal                     DATE
User                        STRING(10)
Jam                         TIME
NoNota                      STRING(10)
TotalPerawatan              REAL
TotalVisiteDr               REAL
TotalObat                   REAL
TotalTindakan               REAL
TotalPemakaianAlat          REAL
TotalPPSP                   REAL
TotalGizi                   REAL
TotalTelepon                REAL
BiayaLain                   REAL
                         END
                     END                       

AAwalBln             FILE,DRIVER('SQLAnywhere'),NAME('dba.aawalbln'),PRE(AAWL),BINDABLE,THREAD
Key_bln_aptk             KEY(AAWL:Kode_Apotik,AAWL:Bulan),OPT,PRIMARY
Record                   RECORD,PRE()
Bulan                       LONG
Kode_Apotik                 STRING(5)
status                      BYTE
                         END
                     END                       

INDDKB               FILE,DRIVER('SQLAnywhere'),NAME('dba.INDDKB'),PRE(IND),CREATE,BINDABLE,THREAD
PK                       KEY(IND:Nomor,IND:KodeBarang),NOCASE,OPT,PRIMARY
barang_inddkb_fk         KEY(IND:KodeBarang),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor                       STRING(12)
KodeBarang                  STRING(10)
Jumlah                      REAL
Harga                       REAL
Total                       REAL
Keterangan                  STRING(50)
                         END
                     END                       

JAnggota             FILE,DRIVER('SQLAnywhere'),NAME('dba.JAnggota'),PRE(JAng),CREATE,BINDABLE,THREAD
KeyNomor_Mr              KEY(JAng:Nomor_MR),NOCASE,OPT
KeyNomorAnggota          KEY(JAng:NomorAnggota),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
Nomor_MR                    LONG
NomorAnggota                LONG
Nama                        STRING(30)
Alamat                      STRING(40)
Telpon                      STRING(20)
Tanggal                     DATE
User                        STRING(10)
                         END
                     END                       

JPJawab              FILE,DRIVER('SQLAnywhere'),NAME('dba.JPJawab'),PRE(JPJ),CREATE,BINDABLE,THREAD
KeyNomorMr               KEY(JPJ:Nomor_Mr),NOCASE,OPT,PRIMARY
KeyTanggal               KEY(JPJ:Tanggal),DUP,NOCASE,OPT
KeyNama                  KEY(JPJ:Nama),DUP,NOCASE,OPT
KeyKecamatan             KEY(JPJ:Kecamatan),DUP,NOCASE,OPT
KeyKota                  KEY(JPJ:Kota),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_Mr                    LONG
Nama                        STRING(35)
Alamat                      STRING(40)
RT                          LONG
RW                          LONG
Keluarahan                  STRING(20)
Kecamatan                   STRING(30)
Kota                        STRING(20)
Pendapatan                  STRING(8)
RpPendapatan                REAL
Tanggal                     DATE
User                        STRING(10)
Telepon                     STRING(15)
                         END
                     END                       

IPJawab              FILE,DRIVER('SQLAnywhere'),NAME('dba.IPJawab'),PRE(IPJA),CREATE,BINDABLE,THREAD
KeyNomorMr               KEY(IPJA:Nomor_Mr),NOCASE,OPT,PRIMARY
KeyTanggal               KEY(IPJA:Tanggal),DUP,NOCASE,OPT
KeyNama                  KEY(IPJA:Nama),DUP,NOCASE,OPT
KeyKecamatan             KEY(IPJA:Kecamatan),DUP,NOCASE,OPT
KeyKota                  KEY(IPJA:Kota),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_Mr                    LONG
Nama                        STRING(30)
Alamat                      STRING(40)
RT                          ULONG
RW                          ULONG
Keluarahan                  STRING(20)
Kecamatan                   STRING(30)
Kota                        STRING(20)
Tanggal                     DATE
RpPendapatan                REAL
User                        STRING(10)
                         END
                     END                       

JTempat              FILE,DRIVER('SQLAnywhere'),NAME('dba.JTempat'),PRE(JTem),CREATE,BINDABLE,THREAD
KeyKodeTempat            KEY(JTem:KodeTempat),OPT,PRIMARY
KeyNamaTempat            KEY(JTem:NamaTempat),DUP,OPT
Record                   RECORD,PRE()
KodeTempat                  STRING(10)
NamaTempat                  STRING(40)
                         END
                     END                       

JKPoli               FILE,DRIVER('SQLAnywhere'),NAME('dba.JKPoli'),PRE(JKPO),CREATE,BINDABLE,THREAD
BY_POLI                  KEY(JKPO:POLIKLINIK),OPT,PRIMARY
KeyKontrak               KEY(JKPO:Kontrak),DUP,OPT
Record                   RECORD,PRE()
POLIKLINIK                  STRING(10)
Kontrak                     STRING(10)
Prosen                      REAL
BiayaRSI                    REAL
BiayaDokter                 REAL
TotalBiaya                  REAL
User                        STRING(10)
Tanggal                     DATE
                         END
                     END                       

ITmpPas              FILE,DRIVER('SQLAnywhere'),NAME('dba.ITmpPas'),PRE(ITMP),CREATE,BINDABLE,THREAD
KeyNomor_Mr              KEY(ITMP:Nomor_mr),DUP,NOCASE,OPT
KeyRekap                 KEY(ITMP:Rekap),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
Nomor_mr                    LONG
Rekap                       LONG
                         END
                     END                       

JPSWUP               FILE,DRIVER('SQLAnywhere'),NAME('dba.JPSWUP'),PRE(JPS1),CREATE,BINDABLE,THREAD
KeyUSerId                KEY(JPS1:USER_ID),NOCASE,OPT,PRIMARY
KeyId                    KEY(JPS1:ID),DUP,NOCASE,OPT
Record                   RECORD,PRE()
USER_ID                     STRING(20)
ID                          STRING(10)
Tanggal                     DATE
                         END
                     END                       

IByTrPas             FILE,DRIVER('SQLAnywhere'),NAME('dba.IByTrPas'),PRE(IBYT),CREATE,BINDABLE,THREAD
KeyNomorMR               KEY(IBYT:Nomor_MR),NOCASE,OPT,PRIMARY
KeyTglMasuk              KEY(IBYT:TglMasuk),DUP,NOCASE,OPT
KeyKodeDokter            KEY(IBYT:KodeDokter),DUP,NOCASE,OPT
KeyRuang                 KEY(IBYT:Ruang),DUP,NOCASE,OPT
KeyNoNota                KEY(IBYT:NoNota),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_MR                    DECIMAL(10)
Ruang                       STRING(10)
JamMasuk                    TIME
TglMasuk                    DATE
JamKeluar                   TIME
TglKeluar                   DATE
Status                      BYTE
KodeDokter                  STRING(10)
JmlBayi                     BYTE
BiayaRawat                  REAL
BiayaVstRsi                 REAL
BiayaVstDr                  REAL
BiayaTotVstDr               REAL
User                        STRING(10)
Tanggal                     DATE
Jam                         TIME
NoNota                      STRING(10)
                         END
                     END                       

JTBayar              FILE,DRIVER('SQLAnywhere'),NAME('dba.JTBayar'),PRE(JTBA),CREATE,BINDABLE,THREAD
KeyNomorMr               KEY(JTBA:Nomor_Mr),DUP,NOCASE,OPT
KeyNoBukti               KEY(JTBA:NoBukti),DUP,OPT
KeyKlinik                KEY(JTBA:Kode),DUP,NOCASE,OPT
KeyDokter                KEY(JTBA:Dokter),DUP,NOCASE,OPT
KeyTanggal               KEY(JTBA:Tanggal),DUP,NOCASE,OPT
KeyNoNota                KEY(JTBA:NoNota),OPT,PRIMARY
KeyTempat                KEY(JTBA:Tempat),DUP,NOCASE,OPT
KeyTransaksi             KEY(JTBA:Transaksi),DUP,NOCASE,OPT
KeyKodeDokter            KEY(JTBA:Dokter),DUP,NOCASE,OPT
KeyLantai                KEY(JTBA:Lantai),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_Mr                    LONG
NoNota                      STRING(10)
Pengirim                    STRING(10)
Kode                        STRING(10)
Dokter                      STRING(10)
NoBukti                     STRING(10)
BiayaRSI                    REAL
BiayaDokter                 REAL
Biaya                       REAL
Transaksi                   BYTE
Tempat                      STRING(10)
Tanggal                     DATE
Jam                         TIME
User                        STRING(10)
Kassa                       STRING(10)
Jenis                       STRING(1)
Selesai                     STRING(1)
Status                      STRING(10)
Prosen                      REAL
Lantai                      BYTE
                         END
                     END                       

JDiagnosa            FILE,DRIVER('SQLAnywhere'),NAME('dba.JDiagnosa'),PRE(JDIA),CREATE,BINDABLE,THREAD
KeyNomorMR               KEY(JDIA:Nomor_MR,JDIA:Tanggal,JDIA:KodeDokter),NOCASE,OPT,PRIMARY
KeyTanggal               KEY(JDIA:Tanggal),DUP,NOCASE,OPT
KeyNoMrSaja              KEY(JDIA:Nomor_MR),DUP,NOCASE,OPT
KeyDiagnosa              KEY(JDIA:Diagnosa),DUP,OPT
Record                   RECORD,PRE()
Nomor_MR                    LONG
Diagnosa                    STRING(20)
Keterangan                  STRING(30)
Tanggal                     DATE
KodeDokter                  STRING(10)
NamaDokter                  STRING(20)
User                        STRING(10)
                         END
                     END                       

RI_Stok              FILE,DRIVER('SQLAnywhere'),NAME('dba.RI_Stok'),PRE(RI_ST),CREATE,BINDABLE,THREAD
Ruangan_RI_Stok_FK       KEY(RI_ST:Kode_Ruang),DUP,NAME('KeyApotik'),OPT
KeyBarang                KEY(RI_ST:Kode_Barang,RI_ST:Kode_Ruang),NAME('KeyBarang'),OPT,PRIMARY
key_kd_brg               KEY(RI_ST:Kode_Barang),DUP,NAME('key_kd_brg'),OPT
Record                   RECORD,PRE()
Kode_Ruang                  STRING(10)
Kode_Barang                 STRING(10)
Saldo_Minimal               REAL
Saldo                       REAL
Harga_Dasar                 REAL
                         END
                     END                       

Nomor_Batal          FILE,DRIVER('SQLAnywhere'),NAME('dba.nomor_batal'),PRE(NOM),BINDABLE,THREAD
PrimaryKey               KEY(NOM:No_Urut,NOM:No_Trans),PRIMARY
NoUrut_NoBatal_FK        KEY(NOM:No_Urut),DUP,NOCASE,OPT
Record                   RECORD,PRE()
No_Urut                     LONG
No_Trans                    STRING(15)
Keterangan                  STRING(30)
                         END
                     END                       

JTPasien             FILE,DRIVER('SQLAnywhere'),NAME('dba.JTPasien'),PRE(JTPA),CREATE,BINDABLE,THREAD
KeyNomorMr               KEY(JTPA:Nomor_Mr),DUP,NOCASE,OPT
KeyKodeTind              KEY(JTPA:KodeTindakan),DUP,OPT
KeyTanggal               KEY(JTPA:Tanggal),DUP,NOCASE,OPT
KeyNoNota                KEY(JTPA:No_Nota),OPT,PRIMARY
KeyKodeDokter            KEY(JTPA:Kode_dokter),DUP,OPT
KeyAnestesi              KEY(JTPA:Anestesi),DUP,OPT
KeyTransaksi             KEY(JTPA:Kode_Transaksi),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_Mr                    LONG
Tanggal                     DATE
KodeTindakan                STRING(10)
Kode_dokter                 STRING(10)
Anestesi                    STRING(10)
BiayaRsi                    REAL
BiayaDokter                 REAL
BiayaAnestesi               REAL
SewaTempat                  REAL
SewaMesin                   REAL
ObatAlat                    REAL
BiayaTotal                  REAL
Kode_Transaksi              BYTE
No_Nota                     STRING(10)
Tempat                      STRING(10)
Selesai                     STRING(1)
Setor                       STRING(20)
User                        STRING(10)
Jam                         TIME
Status                      STRING(1)
Prosen                      REAL
Kassa                       STRING(20)
Poli                        STRING(10)
Lab                         REAL
Rontgen                     REAL
Fisio_terapi                REAL
CheckUp                     REAL
Usg                         REAL
Ecg                         REAL
No_struk                    STRING(20)
BiayaDrHeader               REAL
                         END
                     END                       

DTOBAT               FILE,DRIVER('SQLAnywhere'),NAME('dba.DTOBAT'),PRE(DTOB),CREATE,BINDABLE,THREAD
KeyKodeObat              KEY(DTOB:KodeObat),NOCASE,OPT
Record                   RECORD,PRE()
KodeObat                    STRING(10)
NamaObat                    STRING(29)
Satuan                      STRING(10)
Jenis                       STRING(20)
In                          BYTE
Harga                       REAL
Setiap                      LONG
HabisPak                    BYTE
                         END
                     END                       

DTDiKer              FILE,DRIVER('SQLAnywhere'),NAME('dba.DTDiKer'),PRE(DKER),CREATE,BINDABLE,THREAD
KeyKodeDiag              KEY(DKER:KodeDiagnosa),NOCASE,OPT
KeyNamaDiag              KEY(DKER:DiagnosaKerja),DUP,NOCASE,OPT
Record                   RECORD,PRE()
KodeDiagnosa                LONG
DiagnosaKerja               STRING(30)
Harga                       REAL
Jumlah                      LONG
                         END
                     END                       

DTBalut              FILE,DRIVER('SQLAnywhere'),NAME('dba.DTBalut'),PRE(DTBA),CREATE,BINDABLE,THREAD
KeyUPF                   KEY(DTBA:UPFBar),DUP,NOCASE,OPT
KeyKodeBalut             KEY(DTBA:KodeBalut),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
UPFBar                      STRING(10)
KodeBalut                   STRING(10)
NamaBalut                   STRING(29)
Satuan                      STRING(10)
Jenis                       STRING(20)
In                          BYTE
Harga                       REAL
Setiap                      LONG
HabisPak                    BYTE
                         END
                     END                       

DTAlLain             FILE,DRIVER('SQLAnywhere'),NAME('dba.DTAlLain'),PRE(DAL),CREATE,BINDABLE,THREAD
KeyUPF                   KEY(DAL:UPFBar),DUP,NOCASE,OPT
KeyKodeAlat              KEY(DAL:KodeAlat),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
UPFBar                      STRING(10)
KodeAlat                    STRING(10)
NamaAlat                    STRING(29)
Satuan                      STRING(10)
Jenis                       STRING(20)
In                          BYTE
Harga                       REAL
Setiap                      LONG
HabisPak                    BYTE
                         END
                     END                       

RoKStok              FILE,DRIVER('SQLAnywhere'),NAME('DBA.RoKStok'),PRE(RoKS),BINDABLE,THREAD
KEY1                     KEY(RoKS:Kode_Barang,RoKS:Kode_Tempat,RoKS:Tanggal,RoKS:Transaksi,RoKS:NoTransaksi,RoKS:statusbarang),PRIMARY
BrgTanggalJamFKApKStok   KEY(RoKS:Kode_Barang,RoKS:Tanggal,RoKS:Jam,RoKS:NoTransaksi),DUP,NOCASE,OPT
KeyBarangAPKSTOK         KEY(RoKS:Kode_Barang),DUP,NOCASE,OPT
INKSTOK_RUANG_FK         KEY(RoKS:Kode_Tempat),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Kode_Barang                 STRING(10),NAME('Kode_Barang')
Tanggal                     DATE,NAME('Tanggal')
Jam                         TIME,NAME('Jam')
Transaksi                   STRING(50),NAME('Transaksi')
NoTransaksi                 STRING(15),NAME('NoTransaksi')
Debet                       REAL,NAME('Debet')
Kredit                      REAL,NAME('Kredit')
Opname                      REAL,NAME('Opname')
Kode_Tempat                 STRING(5)
Status                      BYTE
user                        STRING(12)
keterangan                  STRING(60)
tglupdate                   STRING(20)
jamupdate                   TIME
statusbarang                BYTE
                         END
                     END                       

DTGas                FILE,DRIVER('SQLAnywhere'),NAME('dba.DTGas'),PRE(DTGA),CREATE,BINDABLE,THREAD
KeyUPF                   KEY(DTGA:UPFBar),DUP,NOCASE,OPT
KeyKodeGas               KEY(DTGA:KodeGas),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
UPFBar                      STRING(10)
KodeGas                     STRING(10)
NamaGas                     STRING(29)
Satuan                      STRING(10)
Jenis                       STRING(20)
In                          BYTE
Harga                       REAL
Setiap                      LONG
HabisPak                    BYTE
                         END
                     END                       

DTDDKer              FILE,DRIVER('SQLAnywhere'),NAME('dba.DTDDKer'),PRE(DDDR),CREATE,BINDABLE,THREAD
KeyKodeDiagnosa          KEY(DDDR:KodeDiagnosa),DUP,NOCASE,OPT
KeyKode_DiagRegion       KEY(DDDR:KodeDiagnosa,DDDR:KodeRegion),NOCASE,OPT
KeyKodeRegion            KEY(DDDR:KodeRegion),DUP,NOCASE,OPT
Record                   RECORD,PRE()
KodeDiagnosa                LONG
KodeRegion                  LONG
Region                      STRING(15)
                         END
                     END                       

GStokPerBulan        FILE,DRIVER('SQLAnywhere'),NAME('dba.GStokPerBulan'),PRE(GST),BINDABLE,THREAD
PrimaryKey               KEY(GST:KodeBrg,GST:Bulan,GST:Tahun),NOCASE,OPT,PRIMARY
KeyKodeBarang            KEY(GST:KodeBrg),DUP,NOCASE,OPT
Record                   RECORD,PRE()
KodeBrg                     STRING(10)
Bulan                       LONG
Tahun                       LONG
Saldo                       REAL
Debet                       REAL
Kredit                      REAL
total_debet                 LONG
total_kredit                LONG
                         END
                     END                       

IDaftarAlat          FILE,DRIVER('SQLAnywhere'),NAME('dba.IDaftarAlat'),PRE(IDFA),CREATE,BINDABLE,THREAD
KeyKodeAlat              KEY(IDFA:KodeAlat),NOCASE,OPT,PRIMARY
KeyNamaAlat              KEY(IDFA:NamaAlat),DUP,NOCASE,OPT
Record                   RECORD,PRE()
KodeAlat                    STRING(10)
NamaAlat                    STRING(45)
Jumlah                      REAL
TarifSewaStandar            REAL
SatuanSewa                  STRING(5)
HargaBeli                   REAL
NilaiPenyusutanPerHari      REAL
                         END
                     END                       

ILIST                FILE,DRIVER('SQLAnywhere'),NAME('Dba.ILIST'),PRE(ILIS),CREATE,BINDABLE,THREAD
KeyNomorMR               KEY(ILIS:Nomor_MR),NOCASE,OPT,PRIMARY
KeyTanggal               KEY(ILIS:Tanggal),DUP,NOCASE,OPT
KeyStatus                KEY(ILIS:Status),DUP,OPT
Record                   RECORD,PRE()
Nomor_MR                    LONG
Tanggal                     DATE
Status                      STRING(20)
Keterangan                  STRING(20)
User                        STRING(10)
                         END
                     END                       

DTAsi                FILE,DRIVER('SQLAnywhere'),NAME('dba.DTAsi'),PRE(DTAI),CREATE,BINDABLE,THREAD
KeyKodeAsIn              KEY(DTAI:KodeAlSI),NOCASE,OPT,PRIMARY
KeyUPF                   KEY(DTAI:UPFBar),DUP,NOCASE,OPT
Record                   RECORD,PRE()
UPFBar                      STRING(10)
KodeAlSI                    STRING(10)
Nama                        STRING(29)
Type                        STRING(12)
Satuan                      STRING(10)
Jenis                       STRING(20)
In                          BYTE
Harga                       REAL
Setiap                      LONG
HabisPak                    BYTE
                         END
                     END                       

DTBena               FILE,DRIVER('SQLAnywhere'),NAME('dba.DTBena'),PRE(DTBE),CREATE,BINDABLE,THREAD
KeyUPF                   KEY(DTBE:UPFBar),DUP,NOCASE,OPT
KeyKodeBenang            KEY(DTBE:KodeBenang),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
UPFBar                      STRING(10)
KodeBenang                  STRING(10)
NamaBenang                  STRING(29)
Satuan                      STRING(10)
Jenis                       STRING(20)
In                          BYTE
Harga                       REAL
Setiap                      LONG
HabisPak                    BYTE
                         END
                     END                       

JRujuk               FILE,DRIVER('SQLAnywhere'),NAME('dba.JRujuk'),PRE(JRUK),CREATE,BINDABLE,THREAD
KeyRujukan               KEY(JRUK:Rujukan),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
Rujukan                     STRING(15)
                         END
                     END                       

JHKuitansi           FILE,DRIVER('SQLAnywhere'),NAME('dba.JHKuitansi'),PRE(JHKU),CREATE,BINDABLE,THREAD
KeyNomorMr               KEY(JHKU:Nomor_MR),DUP,NOCASE,OPT
KeyTanggal               KEY(JHKU:Tanggal),DUP,NOCASE,OPT
KeyNoKuitansi            KEY(JHKU:NoKuitansi),OPT,PRIMARY
Record                   RECORD,PRE()
Nomor_MR                    DECIMAL(8)
Tanggal                     DATE
AtasNama                    STRING(30)
NoKuitansi                  STRING(10)
Biaya                       REAL
Cetak                       BYTE
Deskripsi                   STRING(70)
Deskripsi1                  STRING(70)
Deskripsi2                  STRING(70)
NoSeri                      STRING(10)
User                        STRING(10)
                         END
                     END                       

IPkiTlp              FILE,DRIVER('SQLAnywhere'),NAME('dba.IPkiTlp'),PRE(IPAT),CREATE,BINDABLE,THREAD
KeyNoMrRuang             KEY(IPAT:Nomor_mr,IPAT:Ruang),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
Nomor_mr                    LONG
Ruang                       STRING(10)
Biaya                       REAL
Keterangan                  STRING(60)
User                        STRING(10)
Tanggal                     DATE
Jam                         TIME
                         END
                     END                       

ITabelGizi           FILE,DRIVER('SQLAnywhere'),NAME('dba.ITabelGizi'),PRE(ITAG),CREATE,BINDABLE,THREAD
KeyKode                  KEY(ITAG:Kode),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
Kode                        STRING(10)
Deskripsi                   STRING(60)
TarifStandarGizi            REAL
Jumlah                      REAL
                         END
                     END                       

IDNotaSm             FILE,DRIVER('SQLAnywhere'),NAME('dba.IDNotaSm'),PRE(IDNS),CREATE,BINDABLE,THREAD
KeyNoMrNoNota            KEY(IDNS:No_Nota,IDNS:Nomor_mr),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
No_Nota                     STRING(10)
Nomor_mr                    LONG
KodeJasa                    STRING(10)
NamaJasa                    STRING(45)
Biaya                       REAL
                         END
                     END                       

IPkiPPSP             FILE,DRIVER('SQLAnywhere'),NAME('dba.IPkiPPSP'),PRE(IPPP),CREATE,BINDABLE,THREAD
KeyNoMrRuang             KEY(IPPP:Nomor_mr,IPPP:Ruang),NOCASE,OPT,PRIMARY
KeyKodeItem              KEY(IPPP:KodeItem),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_mr                    LONG
Ruang                       STRING(10)
KodeItem                    STRING(10)
Jumlah                      REAL
Harga                       REAL
User                        STRING(10)
Tanggal                     DATE
Jam                         TIME
                         END
                     END                       

RI_Diagnosa          FILE,DRIVER('SQLAnywhere'),NAME('dba.RI_Diagnosa'),PRE(RI_DI),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(RI_DI:Nomor_MR,RI_DI:NoUrut,RI_DI:Tanggal,RI_DI:Diagnosa),NOCASE,OPT,PRIMARY
KeyNoMRSaja              KEY(RI_DI:Nomor_MR),DUP,NOCASE,OPT
KeyTanggal               KEY(RI_DI:Tanggal),DUP,NOCASE,OPT
KeyDiagnosa              KEY(RI_DI:Diagnosa),DUP,OPT
KeyDokter                KEY(RI_DI:KodeDokter),DUP,OPT
Record                   RECORD,PRE()
Nomor_MR                    LONG
NoUrut                      SHORT
Tanggal                     DATE
Diagnosa                    STRING(20)
Keterangan                  STRING(30)
KodeDokter                  STRING(5)
NamaDokter                  STRING(20)
User                        STRING(10)
                         END
                     END                       

IUMPasen             FILE,DRIVER('SQLAnywhere'),NAME('dba.IUMPasen'),PRE(IUMP),CREATE,BINDABLE,THREAD
KeyNomorMRUrtTgl         KEY(IUMP:Nomor_MR,IUMP:NOUrut,IUMP:Tanggal,IUMP:Jam),NOCASE,OPT,PRIMARY
KeyNoBukti               KEY(IUMP:NoBukti),DUP,OPT
KeyTanggal               KEY(IUMP:Tanggal),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_MR                    LONG
NOUrut                      USHORT
Tanggal                     DATE
Biaya                       REAL
BiayaAskes                  REAL
Ket                         STRING(10)
NoBukti                     STRING(10)
AtasNama                    STRING(35)
SelisihPerawatan            STRING(1)
Jam                         TIME
User                        STRING(10)
Kassa                       STRING(10)
Tempat                      STRING(10)
Cetak                       BYTE
Ruang                       STRING(10)
Kelas                       STRING(10)
                         END
                     END                       

IPkiGizi             FILE,DRIVER('SQLAnywhere'),NAME('dba.IPkiGizi'),PRE(IPAG),CREATE,BINDABLE,THREAD
KeyNoMrRuang             KEY(IPAG:Nomor_mr,IPAG:Ruang),NOCASE,OPT,PRIMARY
KeyKode                  KEY(IPAG:Kode),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_mr                    LONG
Ruang                       STRING(10)
Kode                        STRING(10)
Jumlah                      REAL
Harga                       REAL
Keterangan                  STRING(80)
user                        STRING(10)
Tanggal                     DATE
Jam                         TIME
                         END
                     END                       

INoPasen             FILE,DRIVER('SQLAnywhere'),NAME('dba.INoPasen'),PRE(INOP),CREATE,BINDABLE,THREAD
KeyNomorMr               KEY(INOP:Nomor_Mr),NOCASE,OPT,PRIMARY
KeyTanggal               KEY(INOP:Tanggal),DUP,NOCASE,OPT
KeyNoNota                KEY(INOP:NoNota),DUP,NOCASE,OPT
KeyNoBukti               KEY(INOP:NoBukti),DUP,NOCASE,OPT
KeyNoKuitansi            KEY(INOP:NoKuitansi),DUP,NOCASE,OPT
KeyKodeRuang             KEY(INOP:Ruang),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_Mr                    LONG
Tanggal                     DATE
BiayaTotal                  REAL
Bayar                       REAL
Saldo                       REAL
Ket                         STRING(20)
NoNota                      STRING(10)
Pulang                      BYTE
NoKuitansi                  STRING(10)
NoBukti                     STRING(10)
AtasNama                    STRING(35)
Selisih                     STRING(1)
Jam                         TIME
User                        STRING(10)
Kassa                       STRING(10)
Tempat                      STRING(10)
Cetak                       BYTE
Ruang                       STRING(10)
                         END
                     END                       

JJDokter             FILE,DRIVER('SQLAnywhere'),NAME('dba.JJDokter'),PRE(JJDO),CREATE,BINDABLE,THREAD
KeyNomorMr               KEY(JJDO:Nomor_Mr),DUP,NOCASE,OPT
KeyTglKel                KEY(JJDO:TanggalPengeluaran),DUP,NOCASE,OPT
KeyTglPem                KEY(JJDO:TanggalPeriksa),DUP,NOCASE,OPT
KeyNoNota                KEY(JJDO:NoNota),DUP,OPT
KeyNoBukti               KEY(JJDO:NoBukti),DUP,OPT
KeyDokter                KEY(JJDO:KodeDokter),DUP,OPT
KeyNoPengeluaran         KEY(JJDO:NoPengeluaran),OPT,PRIMARY
Record                   RECORD,PRE()
Nomor_Mr                    DECIMAL(8)
TanggalPeriksa              DATE
TanggalPengeluaran          DATE
KodeDokter                  STRING(10)
Biaya                       REAL
Prosen                      REAL
Status                      STRING(1)
NoNota                      STRING(10)
NoBukti                     STRING(10)
User                        STRING(10)
NoPengeluaran               STRING(10)
                         END
                     END                       

RI_LIST              FILE,DRIVER('SQLAnywhere'),NAME('Dba.RI_LIST'),PRE(RI_LI),CREATE,BINDABLE,THREAD
KeyNomorMR               KEY(RI_LI:Nomor_MR),NOCASE,OPT,PRIMARY
KeyTanggal               KEY(RI_LI:Tanggal),DUP,NOCASE,OPT
KeyStatus                KEY(RI_LI:Status),DUP,OPT
Record                   RECORD,PRE()
Nomor_MR                    LONG
Tanggal                     DATE
Status                      STRING(20)
Keterangan                  STRING(20)
User                        STRING(10)
                         END
                     END                       

JKTindak             FILE,DRIVER('SQLAnywhere'),NAME('dba.JKTindak'),PRE(JKTI),CREATE,BINDABLE,THREAD
KeyKontrak               KEY(JKTI:Kontrak),OPT,PRIMARY
KeyKodeTnd               KEY(JKTI:KodeTind),DUP,OPT
Record                   RECORD,PRE()
Kontrak                     STRING(10)
Prosen                      REAL
KodeTind                    STRING(10)
BiayaRSI                    REAL
BiayaDr                     REAL
Total                       REAL
Tanggal                     DATE
Jam                         TIME
User                        STRING(10)
                         END
                     END                       

IPkiObat             FILE,DRIVER('SQLAnywhere'),NAME('dba.IPkiObat'),PRE(IPKO),CREATE,BINDABLE,THREAD
KeyNoMrRuang             KEY(IPKO:Nomor_mr,IPKO:Ruang),NOCASE,OPT,PRIMARY
KeyKodeObat              KEY(IPKO:KodeObat),DUP,NOCASE,OPT
KeyObatTanggal           KEY(IPKO:KodeObat,IPKO:Tanggal),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_mr                    LONG
Ruang                       STRING(10)
Tanggal                     DATE
KodeObat                    STRING(10)
Jumlah                      REAL
HargaSatuan                 REAL
TotalHarga                  REAL
PotonganHarga               REAL
User                        STRING(10)
Jam                         TIME
                         END
                     END                       

RI_HRInap            FILE,DRIVER('SQLAnywhere'),NAME('dba.RI_HRInap'),PRE(RI_HR),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(RI_HR:Nomor_mr,RI_HR:NoUrut),NOCASE,OPT,PRIMARY
KeyTanggalKeluar         KEY(RI_HR:Tanggal_Keluar),DUP,NOCASE,OPT
KeyTanggalMasuk          KEY(RI_HR:Tanggal_Masuk),DUP,NOCASE,OPT
KeyNoNota                KEY(RI_HR:No_Nota),DUP,NOCASE,OPT
KeyKodeDr                KEY(RI_HR:DrPengirim),DUP,NOCASE,OPT
KeyKlinikKirim           KEY(RI_HR:DikirimOleh),DUP,NOCASE,OPT
KNomr_status             KEY(RI_HR:Nomor_mr,RI_HR:Status_Keluar),DUP,NOCASE,OPT
Kmr                      KEY(RI_HR:Nomor_mr),DUP,NOCASE,OPT
Ruang_RI_HRInap_FK       KEY(RI_HR:LastRoom),DUP,NOCASE,OPT
Kruang                   KEY(RI_HR:LastRoom),DUP,NOCASE,OPT
KMrUrtDiscn              KEY(RI_HR:Nomor_mr,-RI_HR:NoUrut),DUP,NOCASE,OPT
Pegawai_RIHRInap_FK      KEY(RI_HR:NIP),DUP,NOCASE,OPT
Kontraktor_RIHRINAP_FK   KEY(RI_HR:Kontraktor),DUP,NOCASE,OPT
salesman_ri_hrinap_fk    KEY(RI_HR:Salesman),DUP,NOCASE,OPT
keynoTrans               KEY(RI_HR:nomortrans),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_mr                    LONG
NoUrut                      SHORT
Kontrak                     STRING(1)
Laporan                     STRING(1)
No_Nota                     STRING(10)
Tanggal_Masuk               DATE
Tanggal_Keluar              DATE
Tanggal                     DATE
User                        STRING(20)
Jam                         TIME
Status                      STRING(1)
Pembayaran                  BYTE
DikirimOleh                 STRING(10)
DrPengirim                  STRING(5)
VisitePerHari               REAL
TotalVisite                 REAL
LastRoom                    STRING(10)
Keterangan                  STRING(30)
TotalPerawatan              REAL
TotalVisiteDr               REAL
TotalLab                    REAL
TotalObat                   REAL
TotalTindakan               REAL
TotalPemakaianAlat          REAL
TotalPPSP                   REAL
TotalGizi                   REAL
TotalTelepon                REAL
BiayaLain                   REAL
Penanggung                  STRING(35)
Alamat                      STRING(35)
RT                          BYTE
RW                          BYTE
Kelurahan                   STRING(20)
Kecamatan                   STRING(30)
Kota                        STRING(20)
Pendapatan                  STRING(20)
RpPendapatan                REAL
Pekerjaan                   STRING(20)
Jam_Masuk                   TIME
Jam_Keluar                  TIME
Pulang                      BYTE
DR_Perawat                  STRING(5)
Status_Keluar               BYTE
Status_Hubungan             STRING(5)
JK_Penjawab                 STRING(1)
statusbayar                 BYTE
tgl_byr_uang_muka           DATE
tgl_kembali_uang_muka       DATE
tgl_bayar                   DATE
StatusNotaSementara         BYTE
TglTagihUM                  DATE
NIP                         STRING(7)
Kontraktor                  STRING(10)
LamaBaru                    BYTE
Rujukan                     STRING(30)
status_adm                  BYTE
nomortrans                  STRING(20)
keldekat                    STRING(35)
KDPekerjaan                 STRING(20)
KDAlamat                    STRING(35)
kdrt                        SHORT
kdrw                        SHORT
kdkelurahan                 STRING(20)
kdkecamatan                 STRING(30)
kdkota                      STRING(20)
kdtelp                      STRING(20)
pentelp                     STRING(20)
BaruLama                    STRING(1)
Pengirim                    LONG
Lunas                       BYTE
OneDayCare                  BYTE
PKS                         BYTE
SPJ                         STRING(30)
Selisih                     REAL
DiscountTtl                 REAL
StatusIsiSelisihTtl         BYTE
StatusProgramBaru           BYTE
StatusTutupFar              BYTE
StatusTutupLab              BYTE
DitanggungTtl               REAL
TgDitanggungTtl             REAL
StatusTutup                 BYTE
T_01                        REAL
T_02                        REAL
T_03                        REAL
T_04                        REAL
NT_01                       REAL
NT_02                       REAL
NT_03                       REAL
NT_04                       REAL
TglTutup                    DATE
Adm_Tun                     REAL
Adm_Ktr                     REAL
Adm_Pt_Gaji                 REAL
Adm_sp                      REAL
Pembulatan_Tun              REAL
Pembulatan_sp               REAL
Pembulatan_Ktr              REAL
Pembulatan_PtGji            REAL
Tgl_Jt_Tem_Mitra            DATE
Tgl_Jt_Tem_sp               DATE
Nik                         STRING(20)
UserPembNota                STRING(20)
StatusPotGaji               BYTE
KetNipPegKtr                STRING(20)
DitanggungPerTin            REAL
DitanggungPerSubTin         REAL
Spu_RsiNon_NT               BYTE
JenisKendaraan              BYTE
Nopol                       STRING(20)
NomorKamar                  STRING(15)
NomorBed                    STRING(20)
Salesman                    STRING(10)
hakkelas                    STRING(10)
                         END
                     END                       

IPasPul              FILE,DRIVER('SQLAnywhere'),NAME('dba.IPaspul'),PRE(IPAL),CREATE,BINDABLE,THREAD
KeyNomorMr               KEY(IPAL:Nomor_mr,IPAL:Tanggal_Masuk,IPAL:No_Nota),NOCASE,OPT,PRIMARY
KeyTanggalKeluar         KEY(IPAL:Tanggal_Keluar),DUP,NOCASE,OPT
KeyTanggalMasuk          KEY(IPAL:Tanggal_Masuk),DUP,NOCASE,OPT
KeyNoNota                KEY(IPAL:No_Nota),DUP,NOCASE,OPT
KeyKodeDr                KEY(IPAL:DrPengirim),DUP,NOCASE,OPT
KeyKlinikKirim           KEY(IPAL:DikirimOleh),DUP,NOCASE,OPT
KeyNoMrSaja              KEY(IPAL:Nomor_mr),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_mr                    LONG
Kontrak                     STRING(1)
Laporan                     STRING(1)
No_Nota                     STRING(10)
Tanggal_Masuk               DATE
Tanggal_Keluar              DATE
Tanggal                     DATE
User                        STRING(20)
Jam                         TIME
Status                      STRING(1)
Pembayaran                  BYTE
DikirimOleh                 STRING(10)
DrPengirim                  STRING(10)
VisitePerHari               REAL
TotalVisite                 REAL
LastRoom                    STRING(10)
Keterangan                  STRING(30)
TotalPerawatan              REAL
TotalVisiteDr               REAL
TotalLab                    REAL
TotalObat                   REAL
TotalTindakan               REAL
TotalPemakaianAlat          REAL
TotalPPSP                   REAL
TotalGizi                   REAL
TotalTelepon                REAL
BiayaLain                   REAL
Penanggung                  STRING(35)
Alamat                      STRING(35)
RT                          BYTE
RW                          BYTE
Kelurahan                   STRING(20)
Kecamatan                   STRING(30)
Kota                        STRING(20)
Pendapatan                  STRING(20)
RpPendapatan                REAL
Pekerjaan                   STRING(20)
                         END
                     END                       

JTDokter             FILE,DRIVER('SQLAnywhere'),NAME('dba.JTDokter'),PRE(JTDr),CREATE,BINDABLE,THREAD
keyNoNotaSaja            KEY(JTDr:NoNota),DUP,OPT
KeyNota                  KEY(JTDr:NoNota,JTDr:KodeDokter,JTDr:Tanggal),NOCASE,OPT,PRIMARY
KeyKodeDokter            KEY(JTDr:KodeDokter),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NoNota                      STRING(10)
KodeDokter                  STRING(10)
Biaya                       REAL
Tanggal                     DATE
User                        STRING(10)
Jam                         TIME
Ket                         STRING(40)
                         END
                     END                       

JKontrakMaster       FILE,DRIVER('SQLAnywhere'),NAME('dba.JKontrakMaster'),PRE(JKOM),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(JKOM:Kode),NOCASE,OPT,PRIMARY
nama_jkontrakmaster_key  KEY(JKOM:Nama),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Kode                        LONG
Nama                        STRING(50)
StatusTabelObat             BYTE
                         END
                     END                       

JLokasi              FILE,DRIVER('SQLAnywhere'),NAME('DBA.JLokasi'),PRE(JLO),CREATE,BINDABLE,THREAD
key_kode                 KEY(JLO:Kode),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Kode                        SHORT
nama                        STRING(20)
tempat                      STRING(10)
                         END
                     END                       

IPkiAlat             FILE,DRIVER('SQLAnywhere'),NAME('dba.IPkiAlat'),PRE(IPKA),CREATE,BINDABLE,THREAD
KeyNoMrRuang             KEY(IPKA:Nomor_mr,IPKA:Ruang),NOCASE,OPT,PRIMARY
KeyKodeAlat              KEY(IPKA:KodeAlat),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_mr                    LONG
Ruang                       STRING(10)
KodeAlat                    STRING(10)
Jumlah                      REAL
Tarif                       REAL
user                        STRING(10)
tanggal                     DATE
jam                         TIME
                         END
                     END                       

VAphtransJPasien     FILE,DRIVER('SQLAnywhere'),NAME('dba.VAphtransJPasien'),PRE(VAP),CREATE,BINDABLE,THREAD
PK                       KEY(VAP:N0_tran),DUP,NOCASE,OPT
JTransaksi_VAphtransJpasien_FK KEY(VAP:NoNota),DUP,NOCASE,OPT
Nama_VAphtransJpasien_IK KEY(VAP:Nama),DUP,NOCASE,OPT
MR_VAphtransJpasien_IK   KEY(VAP:Nomor_MR),DUP,NOCASE,OPT
Record                   RECORD,PRE()
N0_tran                     STRING(15)
Nomor_MR                    LONG
Nama                        STRING(20)
Kode_Apotik                 STRING(5)
Tanggal                     DATE
Biaya                       REAL
NoNota                      STRING(10)
                         END
                     END                       

AptoInHe             FILE,DRIVER('SQLAnywhere'),NAME('dba.AptoInHe'),PRE(APTI),CREATE,BINDABLE,THREAD
key_no_tran              KEY(APTI:N0_tran),NOCASE,OPT,PRIMARY
key_apotik               KEY(APTI:Kode_Apotik,APTI:Tanggal),DUP,NOCASE,OPT
key_tujuan               KEY(APTI:Kd_ruang,APTI:Tanggal),DUP,NOCASE,OPT
key_tanggal              KEY(APTI:Tanggal),DUP,NOCASE,OPT
nodkb_aptoinhe_fk        KEY(APTI:nomordkb),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Kode_Apotik                 STRING(5)
Tanggal                     DATE
N0_tran                     STRING(15)
User                        STRING(4)
Total_Biaya                 REAL
Kd_ruang                    STRING(5)
nomordkb                    STRING(20)
                         END
                     END                       

AptoApHe             FILE,DRIVER('SQLAnywhere'),NAME('dba.AptoApHe'),PRE(APTH),CREATE,BINDABLE,THREAD
key_kode_ap              KEY(APTH:Kode_Apotik,APTH:Tanggal),DUP,NOCASE,OPT
key_notran               KEY(APTH:N0_tran),NOCASE,OPT,PRIMARY
key_ap_kel               KEY(APTH:ApotikKeluar,APTH:Tanggal),DUP,NOCASE,OPT
key_tanggal              KEY(APTH:Tanggal),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Kode_Apotik                 STRING(5)
Tanggal                     DATE
N0_tran                     STRING(15)
User                        STRING(4)
Total_Biaya                 REAL
ApotikKeluar                STRING(5)
                         END
                     END                       

APtoAPde             FILE,DRIVER('SQLAnywhere'),NAME('dba.APtoAPde'),PRE(APTO),CREATE,BINDABLE,THREAD
KeyKodeBrg               KEY(APTO:Kode_Brg),DUP,NOCASE,OPT
key_no_nota              KEY(APTO:N0_tran,APTO:Kode_Brg),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
Kode_Brg                    STRING(10)
N0_tran                     STRING(15)
Jumlah                      REAL
Biaya                       REAL
                         END
                     END                       

IKUmPesn             FILE,DRIVER('SQLAnywhere'),NAME('dba.IKUmPesn'),PRE(IKUPs),CREATE,BINDABLE,THREAD
KeyNomorMRUrtTgl         KEY(IKUPs:Nomor_MR,IKUPs:NOUrut,IKUPs:Cetak,IKUPs:Tanggal),NOCASE,OPT,PRIMARY
KeyNoBukti               KEY(IKUPs:NoBukti),DUP,OPT
Record                   RECORD,PRE()
Nomor_MR                    LONG
NOUrut                      USHORT
Tanggal                     DATE
Biaya                       REAL
BiayaAskes                  REAL
Ket                         STRING(10)
NoBukti                     STRING(10)
AtasNama                    STRING(35)
SelisihPerawatan            STRING(1)
Jam                         TIME
User                        STRING(10)
Kassa                       STRING(10)
Tempat                      STRING(10)
Cetak                       BYTE
Ruang                       STRING(10)
Kelas                       STRING(10)
TglUpdate                   DATE
                         END
                     END                       

APOBKONT             FILE,DRIVER('SQLAnywhere'),NAME('dba.APOBKONT'),PRE(APO),CREATE,BINDABLE,THREAD
by_kode_ktr              KEY(APO:KODE_KTR,APO:Kode_brg),NOCASE,OPT,PRIMARY
by_kode_brg              KEY(APO:Kode_brg),DUP,NOCASE,OPT
Record                   RECORD,PRE()
KODE_KTR                    STRING(10)
Kode_brg                    STRING(10)
PERS_TAMBAH                 BYTE
                         END
                     END                       

RI_JasaRawat         FILE,DRIVER('SQLAnywhere'),NAME('dba.RI_JasaRawat'),PRE(RI_JA),CREATE,BINDABLE,THREAD
K1                       KEY(RI_JA:no_mr,RI_JA:No_urut,RI_JA:Kode_Jasa,RI_JA:Keterangan1),NOCASE,OPT,PRIMARY
K_kodeJasa               KEY(RI_JA:Kode_Jasa),DUP,NOCASE,OPT
Kmr                      KEY(RI_JA:no_mr),DUP,NOCASE,OPT
KMrUrutJasa              KEY(RI_JA:no_mr,RI_JA:No_urut,RI_JA:Kode_Jasa),DUP,NOCASE,OPT
KMrUrutJasaKet           KEY(RI_JA:no_mr,RI_JA:No_urut,RI_JA:Kode_Jasa,RI_JA:Keterangan1),DUP,NOCASE,OPT
Kket                     KEY(RI_JA:Keterangan1),DUP,NOCASE,OPT
Record                   RECORD,PRE()
no_mr                       LONG
No_urut                     SHORT
Kode_Jasa                   STRING(6)
Biaya                       REAL
TGLAWAL                     DATE
TGLAKHIR                    DATE
Keterangan1                 STRING(20)
Keterangan2                 STRING(100)
Keterangan3                 STRING(250)
Jam_Masuk                   TIME
                         END
                     END                       

APBRGCMP             FILE,DRIVER('SQLAnywhere'),NAME('dba.APBRGCMP'),PRE(APB),CREATE,BINDABLE,THREAD
by_kd_barang             KEY(APB:Kode_brg),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
Kode_brg                    STRING(10)
Sat_besar                   STRING(10)
Sat_kecil                   STRING(10)
Nilai_konversi              LONG
                         END
                     END                       

JKelPeg              FILE,DRIVER('SQLAnywhere'),NAME('dba.JKelPeg'),PRE(JKE),CREATE,BINDABLE,THREAD
by_nip                   KEY(JKE:NIP),OPT,PRIMARY
by_nomor                 KEY(JKE:Nomor_mr),DUP,NOCASE,OPT
by_nama                  KEY(JKE:Nama),DUP,OPT
Record                   RECORD,PRE()
NIP                         STRING(10)
Nomor_mr                    LONG
Nama                        STRING(35)
TGL_LAHIR                   DATE
SEX                         STRING(1)
Hubungan                    STRING(10)
RESEP                       STRING(1)
                         END
                     END                       

queue                FILE,DRIVER('SQLAnywhere'),NAME('dba.queue'),PRE(QUE),CREATE,BINDABLE,THREAD
kqueue                   KEY(QUE:queue),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
queue                       BYTE
                         END
                     END                       

APDTcam              FILE,DRIVER('SQLAnywhere'),NAME('dba.APDTcam'),PRE(APD1),CREATE,BINDABLE,THREAD
by_tran_cam              KEY(APD1:N0_tran,APD1:Kode_brg,APD1:Camp),NOCASE,OPT,PRIMARY
by_kodebrg               KEY(APD1:Kode_brg),DUP,NOCASE,OPT
by_tranno                KEY(APD1:N0_tran,APD1:Camp),DUP,NOCASE,OPT
Record                   RECORD,PRE()
N0_tran                     STRING(15)
Kode_brg                    STRING(10)
Jumlah                      REAL
J_potong                    REAL
Total                       LONG
Camp                        ULONG
Harga_Dasar                 REAL
                         END
                     END                       

APDTRANS             FILE,DRIVER('SQLAnywhere'),NAME('dba.APDTRANS'),PRE(APD),CREATE,BINDABLE,THREAD
by_transaksi             KEY(APD:N0_tran),DUP,OPT
notran_kode              KEY(APD:N0_tran,APD:Kode_brg,APD:Camp),OPT,PRIMARY
by_kodebrg               KEY(APD:Kode_brg),DUP,OPT
by_tran_cam              KEY(APD:N0_tran,APD:Camp),DUP,OPT
transjum_apdtrans_fk     KEY(APD:N0_tran,APD:Jum1,APD:Kode_brg,APD:Camp),DUP,NOCASE,OPT
by_tran_kdbrg            KEY(APD:N0_tran,APD:Kode_brg),DUP,NOCASE,OPT
Record                   RECORD,PRE()
N0_tran                     STRING(15)
Kode_brg                    STRING(10)
Jumlah                      REAL
Total                       LONG
Camp                        ULONG
Harga_Dasar                 LONG
Diskon                      REAL
Jum1                        SHORT
Jum2                        SHORT
namaobatracik               STRING(40)
total_dtg                   LONG
ktt                         BYTE
                         END
                     END                       

AptoInDe             FILE,DRIVER('SQLAnywhere'),NAME('dba.AptoInDe'),PRE(APTD),CREATE,BINDABLE,THREAD
key_kd_brg               KEY(APTD:Kode_Brg),DUP,NOCASE,OPT
key_no_nota              KEY(APTD:N0_tran,APTD:Kode_Brg),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
Kode_Brg                    STRING(10)
N0_tran                     STRING(15)
Jumlah                      REAL
Biaya                       REAL
                         END
                     END                       

ApReLuar             FILE,DRIVER('SQLAnywhere'),NAME('dba.ApReLuar'),PRE(APR),CREATE,BINDABLE,THREAD
by_transaksi             KEY(APR:N0_tran),OPT,PRIMARY
key_nama_pasien          KEY(APR:Nama,APR:Alamat),DUP,NOCASE,OPT
key_nama                 KEY(APR:Nama),DUP,NOCASE,OPT
Record                   RECORD,PRE()
N0_tran                     STRING(15)
Nama                        STRING(35)
Alamat                      STRING(35)
RT                          STRING(3)
RW                          STRING(3)
Kota                        STRING(20)
                         END
                     END                       

ITAGUM               FILE,DRIVER('SQLAnywhere'),NAME('Dba.ITAGUM'),PRE(ITGU),CREATE,BINDABLE,THREAD
KeyNomor_Mr              KEY(ITGU:Nomor_Mr,ITGU:TanggalMasuk),NOCASE,OPT,PRIMARY
KeyNoMrSaja              KEY(ITGU:Nomor_Mr),DUP,NOCASE,OPT
KeyTanggal               KEY(ITGU:TanggalMasuk),DUP,NOCASE,OPT
KeyRuang                 KEY(ITGU:Ruang),DUP,OPT
KeyCetak                 KEY(ITGU:Cetak),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_Mr                    LONG
TanggalMasuk                DATE
Ruang                       STRING(10)
Kelas                       STRING(10)
Rawat                       REAL
Visite                      REAL
Cetak                       BYTE
                         END
                     END                       

APHTRANSBPJS         FILE,DRIVER('SQLAnywhere'),NAME('Apotik.APHTRANSBPJS'),PRE(APHB),CREATE,BINDABLE,THREAD
by_medrec                KEY(APHB:Nomor_mr),DUP,NOCASE,OPT
Prescribe_Aphtrans_FK    KEY(APHB:NomorEPresribing),DUP,NOCASE,OPT
nonota_aphtras_key       KEY(APHB:NoNota),DUP,NOCASE,OPT
dokter_aphtrans_fk       KEY(APHB:dokter),DUP,NOCASE,OPT
by_transaksi             KEY(APHB:N0_tran),OPT,PRIMARY
BY_KODEAP                KEY(APHB:Kode_Apotik),DUP,OPT
keytanggal               KEY(APHB:Tanggal),DUP,NOCASE,OPT
KeyNoMrAsal              KEY(APHB:Nomor_mr,APHB:Asal),DUP,NOCASE,OPT
Pegawai_aphtrans_fk      KEY(APHB:NIP),DUP,NOCASE,OPT
Kontrak_aphtrans_fk      KEY(APHB:Kontrak),DUP,NOCASE,OPT
nopaket_aphtrans_fk      KEY(APHB:NoPaket),DUP,NOCASE,OPT
Ktgl_jam                 KEY(APHB:Tanggal,APHB:Jam),DUP,NOCASE,OPT
mrurut_aphtrans_fk       KEY(APHB:Nomor_mr,APHB:Urut),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_mr                    LONG
Tanggal                     DATE
Biaya                       REAL
N0_tran                     STRING(15)
User                        STRING(4)
Bayar                       BYTE
Ra_jal                      BYTE
Asal                        STRING(10)
cara_bayar                  BYTE
Kode_Apotik                 STRING(5)
Batal                       BYTE
Diskon                      REAL
NIP                         STRING(7)
Kontrak                     STRING(10)
LamaBaru                    BYTE
dokter                      STRING(5)
NoNota                      STRING(10)
Urut                        SHORT
Ruang                       STRING(10)
NoPaket                     SHORT
Racikan                     BYTE
Jam                         TIME
NomorEPresribing            STRING(20)
Resep                       SHORT
NilaiKontrak                REAL
NilaiTunai                  REAL
NilaiDitagih                REAL
NomorReference              STRING(20)
                         END
                     END                       

RI_PinRuang          FILE,DRIVER('SQLAnywhere'),NAME('dba.RI_PinRuang'),PRE(RI_PI),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(RI_PI:Nomor_mr,RI_PI:NoUrut,RI_PI:Tanggal_Masuk,RI_PI:Jam_Masuk),NOCASE,OPT,PRIMARY
keymr_tgl                KEY(RI_PI:Nomor_mr,-RI_PI:Tanggal_Masuk),DUP,NOCASE,OPT
KeyTanggalMasuk          KEY(RI_PI:Tanggal_Masuk),DUP,NOCASE,OPT
KeyKodeRuang             KEY(RI_PI:Ruang),DUP,NOCASE,OPT
KeyKodeDokter            KEY(RI_PI:Kode_Dokter),DUP,NOCASE,OPT
KeyNoNota                KEY(RI_PI:NoNota),DUP,NOCASE,OPT
KeyNoMrRuang             KEY(RI_PI:Nomor_mr,RI_PI:Ruang),DUP,NOCASE,OPT
KeyNoMrSaja              KEY(RI_PI:Nomor_mr),DUP,NOCASE,OPT
KeyNoMrStatus            KEY(RI_PI:Nomor_mr,RI_PI:Status),DUP,NOCASE,OPT
NomorMR_Urut_Key         KEY(RI_PI:Nomor_mr,RI_PI:Urut_Pindah),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_mr                    LONG
NoUrut                      SHORT
Urut_Pindah                 SHORT
Ruang                       STRING(10)
Kelas                       STRING(10)
Jam_Masuk                   TIME
Tanggal_Masuk               DATE
Jam_Keluar                  TIME
Tanggal_Keluar              DATE
Kode_Dokter                 STRING(5)
Status                      BYTE
BiayaRawat                  REAL
BiayaVstRsi                 REAL
BiayaVstDr                  REAL
BiayaTotVstDr               REAL
Tanggal                     DATE
User                        STRING(10)
Jam                         TIME
NoNota                      STRING(10)
TotalPerawatan              REAL
TotalVisiteDr               REAL
TotalObat                   REAL
TotalTindakan               REAL
TotalPemakaianAlat          REAL
TotalPPSP                   REAL
TotalGizi                   REAL
TotalTelepon                REAL
BiayaLain                   REAL
Tanggal_Uang                DATE
                         END
                     END                       

RI_VisitDr           FILE,DRIVER('SQLAnywhere'),NAME('dba.RI_VisitDr'),PRE(VI_SI),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(VI_SI:Nomor_mr,VI_SI:NoUrut,VI_SI:Tanggal_Masuk,VI_SI:Jam_Masuk,VI_SI:tanggal,VI_SI:Jam),NOCASE,OPT,PRIMARY
KeyKodeDr                KEY(VI_SI:KodeDokter),DUP,NOCASE,OPT
KeyTanggal               KEY(VI_SI:tanggal),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_mr                    LONG
NoUrut                      SHORT
Urut_Pindah                 SHORT
KodeDokter                  STRING(5)
Tanggalawal                 DATE
Tanggalakhir                DATE
Biaya                       REAL
JumlahVisite                USHORT
VisiteTotal                 REAL
user                        STRING(10)
tanggal                     DATE
Jam                         TIME
Ruang                       STRING(10)
Kelas                       STRING(10)
Tanggal_Masuk               DATE
Jam_Masuk                   TIME
Dr_visit                    BYTE
ket                         STRING(60)
biaya_lain                  REAL
status_pengantar            BYTE
status_lain                 BYTE
                         END
                     END                       

APHTRANS             FILE,DRIVER('SQLAnywhere'),NAME('dba.APHTRANS'),PRE(APH),CREATE,BINDABLE,THREAD
keyEpre                  KEY(APH:NomorEPresribing),DUP,NOCASE,OPT
by_medrec                KEY(APH:Nomor_mr),DUP,NOCASE,OPT
Prescribe_Aphtrans_FK    KEY(APH:NomorEPresribing),DUP,NOCASE,OPT
nonota_aphtras_key       KEY(APH:NoNota),DUP,NOCASE,OPT
dokter_aphtrans_fk       KEY(APH:dokter),DUP,NOCASE,OPT
by_transaksi             KEY(APH:N0_tran),OPT,PRIMARY
BY_KODEAP                KEY(APH:Kode_Apotik),DUP,OPT
keytanggal               KEY(APH:Tanggal),DUP,NOCASE,OPT
KeyNoMrAsal              KEY(APH:Nomor_mr,APH:Asal),DUP,NOCASE,OPT
Pegawai_aphtrans_fk      KEY(APH:NIP),DUP,NOCASE,OPT
Kontrak_aphtrans_fk      KEY(APH:Kontrak),DUP,NOCASE,OPT
nopaket_aphtrans_fk      KEY(APH:NoPaket),DUP,NOCASE,OPT
Ktgl_jam                 KEY(APH:Tanggal,APH:Jam),DUP,NOCASE,OPT
mrurut_aphtrans_fk       KEY(APH:Nomor_mr,APH:Urut),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_mr                    LONG
Tanggal                     DATE
Biaya                       REAL
N0_tran                     STRING(15)
User                        STRING(4)
Bayar                       BYTE
Ra_jal                      BYTE
Asal                        STRING(10)
cara_bayar                  BYTE
Kode_Apotik                 STRING(5)
Batal                       BYTE
Diskon                      REAL
NIP                         STRING(7)
Kontrak                     STRING(10)
LamaBaru                    BYTE
dokter                      STRING(5)
NoNota                      STRING(10)
Urut                        SHORT
Ruang                       STRING(10)
NoPaket                     SHORT
Racikan                     BYTE
Jam                         TIME
NomorEPresribing            STRING(20)
Resep                       SHORT
NilaiKontrak                REAL
NilaiTunai                  REAL
NilaiDitagih                REAL
NomorReference              STRING(20)
Harga_Dasar                 REAL
NoTransaksiAsal             STRING(15)
shift                       USHORT
biaya_dtg                   REAL
                         END
                     END                       

JPegawai             FILE,DRIVER('SQLAnywhere'),NAME('dba.JPegawai'),PRE(PEG),CREATE,BINDABLE,THREAD
KeyNIP                   KEY(PEG:NIP),NOCASE,OPT,PRIMARY
KeyGol                   KEY(PEG:GOL),DUP,NOCASE,OPT
KeyJabatan               KEY(PEG:JABATAN),DUP,NOCASE,OPT
KeyAlamat                KEY(PEG:ALAMAT),DUP,NOCASE,OPT
KeyNama                  KEY(PEG:NAMA),DUP,NOCASE,OPT
KeyID                    KEY(PEG:ID),DUP,NOCASE,OPT
KeyTanggalBekerja        KEY(PEG:MULAI_BEKERJA),DUP,NOCASE,OPT
KeyPendidikan            KEY(PEG:PENDIDIKAN),DUP,NOCASE,OPT
KeyTanggalLahir          KEY(PEG:TGL_LAHIR),DUP,NOCASE,OPT
KeySex                   KEY(PEG:SEX),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NIP                         STRING(10)
NAMA                        STRING(40)
TEMPAT_LAHIR                STRING(20)
TGL_LAHIR                   DATE
SEX                         STRING(1)
ALAMAT                      STRING(40)
MULAI_BEKERJA               DATE
PENDIDIKAN                  STRING(10)
GOL                         STRING(10)
BAGIAN                      STRING(20)
JABATAN                     STRING(30)
ID                          STRING(10)
                         END
                     END                       

Appegrsi             FILE,DRIVER('SQLAnywhere'),NAME('dba.Appegrsi'),PRE(APP),CREATE,BINDABLE,THREAD
by_nip                   KEY(APP:NIP),DUP,NOCASE,OPT
by_tran                  KEY(APP:N0_tran),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
NIP                         STRING(10)
N0_tran                     STRING(15)
Biaya                       LONG
Tanggal                     DATE
                         END
                     END                       

IAORDER              FILE,DRIVER('SQLAnywhere'),NAME('dba.IAORDER'),PRE(IAOR),CREATE,BINDABLE,THREAD
keyno_order              KEY(IAOR:ORDER),DUP,NOCASE,OPT
key_nomorRM              KEY(IAOR:Nomor_mr),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Tanggal                     LONG
KODE_RUANG                  STRING(10)
Nomor_mr                    LONG
ORDER                       STRING(8)
Prefix                      STRING(4)
                         END
                     END                       

IDAOrder             FILE,DRIVER('SQLAnywhere'),NAME('dba.IDAOrder'),PRE(IDAO),CREATE,BINDABLE,THREAD
keyorder                 KEY(IDAO:ORDER),DUP,NOCASE,OPT
key_kodeobat             KEY(IDAO:Kode_brg),DUP,NOCASE,OPT
Record                   RECORD,PRE()
ORDER                       STRING(8)
Kode_brg                    STRING(10)
Jumlah                      ULONG
                         END
                     END                       

ISetupAp             FILE,DRIVER('SQLAnywhere'),NAME('dba.ISetupAp'),PRE(ISET),CREATE,BINDABLE,THREAD
by_deskripsi             KEY(ISET:Deskripsi),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
Deskripsi                   STRING(8)
Nilai                       ULONG
                         END
                     END                       

JAnestesi            FILE,DRIVER('SQLAnywhere'),NAME('dba.JAnestesi'),PRE(JANE),CREATE,BINDABLE,THREAD
KeyKodeAnestesi          KEY(JANE:KodeAnestesi),OPT,PRIMARY
KeyNamaAnestesi          KEY(JANE:NamaAnestesi),DUP,OPT
KeyStatus                KEY(JANE:Status),DUP,OPT
Record                   RECORD,PRE()
KodeAnestesi                STRING(5)
NamaAnestesi                STRING(30)
Status                      STRING(10)
Keterangan                  STRING(30)
Tlp_Rumah                   STRING(20)
Tlp_Tmp_Praktek             STRING(20)
TANGGAL                     DATE
JAM                         TIME
USER                        STRING(20)
PersenPengantar             REAL
NonPengantar                REAL
StandarVip                  REAL
Standar1                    REAL
Standar2                    REAL
Standar3                    REAL
PD                          REAL
PM                          REAL
                         END
                     END                       

IDiagnosa            FILE,DRIVER('SQLAnywhere'),NAME('dba.IDiagnosa'),PRE(IDIA),CREATE,BINDABLE,THREAD
KeyNomorMR               KEY(IDIA:Nomor_MR,IDIA:Tanggal,IDIA:KodeDokter),NOCASE,OPT,PRIMARY
KeyNoMRSaja              KEY(IDIA:Nomor_MR),DUP,NOCASE,OPT
KeyTanggal               KEY(IDIA:Tanggal),DUP,NOCASE,OPT
KeyDiagnosa              KEY(IDIA:Diagnosa),DUP,OPT
KeyDokter                KEY(IDIA:KodeDokter),DUP,OPT
Record                   RECORD,PRE()
Nomor_MR                    LONG
Diagnosa                    STRING(20)
Keterangan                  STRING(30)
Tanggal                     DATE
KodeDokter                  STRING(10)
NamaDokter                  STRING(20)
User                        STRING(10)
                         END
                     END                       

IAP_SET              FILE,DRIVER('SQLAnywhere'),NAME('dba.IAP_SET'),PRE(IAPS),CREATE,BINDABLE,THREAD
BYPATOKAN                KEY(IAPS:Patokan),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
Patokan                     STRING(8)
Isi                         STRING(10)
                         END
                     END                       

GStockGdg            FILE,DRIVER('SQLAnywhere'),NAME('dba.GStockGdg'),PRE(GSGD),CREATE,BINDABLE,THREAD
KeyKodeBrg               KEY(GSGD:Kode_brg),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
Kode_brg                    STRING(10)
Harga_Beli                  REAL
Eoq                         REAL
Jumlah_Stok                 REAL
HargaSebelum                REAL
SaldoAwalThn                REAL
stock_min                   REAL
stock_max                   REAL
Discount                    REAL
Saldo_Maksimal              REAL
HargaJualUmum               REAL
HargaJualFT                 REAL
HargaJualMCU                REAL
HargaTotal                  REAL
Konversi                    REAL
SatuanBeli                  STRING(20)
                         END
                     END                       

JKelurahan           FILE,DRIVER('SQLAnywhere'),NAME('dba.JKelurahan'),PRE(JKel),CREATE,BINDABLE,THREAD
Kelurahan_PK             KEY(JKel:Kelurahan,JKel:KECAMATAN),NOCASE,OPT,PRIMARY
KeyKecamatan             KEY(JKel:KECAMATAN),DUP,NOCASE,OPT
KeyKota                  KEY(JKel:KOTA),DUP,NOCASE,OPT
Kelurahan_Only_Key       KEY(JKel:Kelurahan),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Kelurahan                   STRING(20)
KECAMATAN                   STRING(20)
KOTA                        STRING(20)
Wilayah                     STRING(5)
                         END
                     END                       

GBAStock             FILE,DRIVER('SQLAnywhere'),NAME('dba.GBAStock'),PRE(GBAS),CREATE,BINDABLE,THREAD
KeyKodeBrg               KEY(GBAS:Kode_brg),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
Kode_brg                    STRING(10)
HARGA_BELI                  REAL
Eoq                         REAL
STOK_GD                     REAL
HargaSebelum                REAL
SaldoAwalThn                REAL
                         END
                     END                       

GRekapBK             FILE,DRIVER('SQLAnywhere'),NAME('dba.GRekapBK'),PRE(GREK),CREATE,BINDABLE,THREAD
KeyKodeBrg               KEY(GREK:KodeBrg),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
KodeBrg                     STRING(10)
Jumlah                      ULONG
                         END
                     END                       

GPBF                 FILE,DRIVER('SQLAnywhere'),NAME('dba.GPBF'),PRE(GPBF),CREATE,BINDABLE,THREAD
KeyKodePBF               KEY(GPBF:KODE_PBF),OPT,PRIMARY
KeyNamaPBF               KEY(GPBF:PBF),DUP,OPT
Record                   RECORD,PRE()
KODE_PBF                    STRING(10)
PBF                         STRING(30)
ALAMAT                      STRING(30)
KOTA                        STRING(15)
TELP                        STRING(8)
                         END
                     END                       

GDBSBBK              FILE,DRIVER('SQLAnywhere'),NAME('dba.GDBSBBK'),PRE(GDBSB),CREATE,BINDABLE,THREAD
KeyNoBSBBKItem           KEY(GDBSB:NoBSBBK,GDBSB:KodeBarang),OPT,PRIMARY
KeyNoBSBBK               KEY(GDBSB:NoBSBBK),DUP,OPT
KeyBarang                KEY(GDBSB:KodeBarang),DUP,OPT
Record                   RECORD,PRE()
NoBSBBK                     STRING(10)
KodeBarang                  STRING(10)
Jumlah_Sat                  REAL
Harga                       REAL
Total                       REAL
Keterangan                  STRING(20)
                         END
                     END                       

GHSBBM               FILE,DRIVER('SQLAnywhere'),NAME('dba.GHSBBM'),PRE(GHSBM),CREATE,BINDABLE,THREAD
KeyNoSBBM                KEY(GHSBM:NoSBBM),OPT,PRIMARY
KeyKodePBF               KEY(GHSBM:KodePBF),DUP,NOCASE,OPT
KeyNoSPB                 KEY(GHSBM:NoSPB),DUP,OPT
KeyNoFaktur              KEY(GHSBM:NoFaktur),DUP,NOCASE,OPT
KeyTglSBBM               KEY(GHSBM:TglSBBM),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NoSBBM                      STRING(10)
TglSBBM                     DATE
NoSPB                       STRING(10)
NoFaktur                    STRING(15)
TglFaktur                   DATE
TglJatuhTempo               DATE
NilaiFaktur                 REAL
KodePBF                     STRING(10)
PPn                         REAL
Discount                    DECIMAL(7,2)
Total_Harga                 REAL
Printed                     BYTE
Materai                     REAL
RpPPN                       REAL
RpDiscount                  REAL
                         END
                     END                       

GDSBBM               FILE,DRIVER('SQLAnywhere'),NAME('dba.GDSBBM'),PRE(GDSBM),CREATE,BINDABLE,THREAD
KeyNoSBBMKodeBrg         KEY(GDSBM:NoSBBM,GDSBM:KodeBarang),OPT,PRIMARY
KeyNoSBBM                KEY(GDSBM:NoSBBM),DUP,OPT
KeyKodeBarang            KEY(GDSBM:KodeBarang),DUP,OPT
Record                   RECORD,PRE()
NoSBBM                      STRING(10)
KodeBarang                  STRING(10)
HargaSatuan                 REAL
Kuantitas                   REAL
Discount                    DECIMAL(7,2)
Total_Harga                 REAL
BonusBrg                    REAL
Jenis_PPn                   BYTE
PPn                         REAL
RpDiscount                  REAL
statusDisc                  BYTE
Keterangan                  STRING(30)
                         END
                     END                       

DTabDoc              FILE,DRIVER('SQLAnywhere'),NAME('dba.DTabDoc'),PRE(DTDK),CREATE,BINDABLE,THREAD
KeyNIP                   KEY(DTDK:NIP),NOCASE,OPT,PRIMARY
KeyNama                  KEY(DTDK:NAMA),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NIP                         STRING(10)
NAMA                        STRING(40)
Harga                       REAL
                         END
                     END                       

GHBatal              FILE,DRIVER('SQLAnywhere'),NAME('dba.GHBatal'),PRE(GHBTL),CREATE,BINDABLE,THREAD
KeyNoBatal               KEY(GHBTL:NoBatal),NOCASE,OPT,PRIMARY
KeyNoSBBM                KEY(GHBTL:NoSBBM),DUP,NOCASE,OPT
KeyKodePBF               KEY(GHBTL:KodePBF),DUP,NOCASE,OPT
KeyTglBatal              KEY(GHBTL:TglBatal),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NoBatal                     STRING(10)
NoSBBM                      STRING(10)
TglBatal                    DATE
NoLembar                    STRING(13)
NoFaktur                    STRING(15)
TglJatuhTempo               DATE
KodePBF                     STRING(10)
Printed                     BYTE
Materai                     REAL
                         END
                     END                       

JSUMDR               FILE,DRIVER('SQLAnywhere'),NAME('dba.JSUMDR'),PRE(JSU),CREATE,BINDABLE,THREAD
kuser                    KEY(JSU:Statusmitra),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
Statusmitra                 BYTE
persen_pentantar            REAL
Persen_non_pengantar        REAL
Ket                         STRING(40)
                         END
                     END                       

GDBatal              FILE,DRIVER('SQLAnywhere'),NAME('dba.GDBatal'),PRE(GDBTL),CREATE,BINDABLE,THREAD
KeyNoBatalKodeBrg        KEY(GDBTL:NoBatal,GDBTL:KodeBarang),OPT,PRIMARY
KeyNoBatal               KEY(GDBTL:NoBatal),DUP,OPT
KeyKodeBarang            KEY(GDBTL:KodeBarang),DUP,OPT
Record                   RECORD,PRE()
NoBatal                     STRING(10)
KodeBarang                  STRING(10)
NamaBarang                  STRING(40)
Satuan                      STRING(10)
HargaSatuan                 REAL
Kuantitas                   REAL
JumlahHarga                 REAL
Discount                    DECIMAL(7,2)
BonusBrg                    REAL
Jenis_PPn                   BYTE
PPn                         REAL
status_disc                 BYTE
                         END
                     END                       

GHSPB                FILE,DRIVER('SQLAnywhere'),NAME('dba.GHSPB'),PRE(GHSPB),CREATE,BINDABLE,THREAD
KeyNoSPB                 KEY(GHSPB:NoSPB),OPT
KeyTanggal               KEY(-GHSPB:Tanggal),DUP,NOCASE,OPT
KeyNoSPBBalik            KEY(-GHSPB:NoSPB),DUP,OPT
KeyPBF                   KEY(GHSPB:KodePBF),DUP,OPT
Record                   RECORD,PRE()
NoSPB                       STRING(10)
Tanggal                     DATE
KodePBF                     STRING(10)
Pemohon                     STRING(30)
STATUS                      STRING(13)
JenisPPn                    STRING(20)
SubTotalHarga               REAL
PPn                         REAL
Discount                    DECIMAL(7,2)
Total_Harga                 REAL
StatusPembayaran            STRING(6)
Note                        STRING(50)
Statuscetak                 BYTE
RpPPN                       REAL
RpDiscount                  REAL
StatusNum                   BYTE
Jam                         TIME
Nomor_SO                    STRING(20)
                         END
                     END                       

GHBSBBK              FILE,DRIVER('SQLAnywhere'),NAME('dba.GHBSBBK'),PRE(GHBSB),CREATE,BINDABLE,THREAD
KeyNoBSBBK               KEY(GHBSB:NoBSBBK),OPT,PRIMARY
KeyTanggal               KEY(GHBSB:Tanggal_BSBBK),DUP,NOCASE,OPT
KeyNoSBBK                KEY(GHBSB:NoSBBK),DUP,OPT
Key_NoSBBK_Status        KEY(GHBSB:NoBSBBK),DUP,OPT
KeyKdAptk                KEY(GHBSB:kode_apotik),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NoBSBBK                     STRING(10)
Tanggal_BSBBK               DATE
NoSBBK                      STRING(10)
Total                       REAL
Keterangan                  STRING(30)
Status                      BYTE
kode_apotik                 STRING(5)
                         END
                     END                       

GDSPB                FILE,DRIVER('SQLAnywhere'),NAME('dba.GDSPB'),PRE(GDSPB),CREATE,BINDABLE,THREAD
KeyNoSPB                 KEY(GDSPB:NoSPB),DUP,OPT
KeyKodeBrg               KEY(GDSPB:KodeBarang),DUP,OPT
PrimaryKey               KEY(GDSPB:NoSPB,GDSPB:KodeBarang),OPT,PRIMARY
Record                   RECORD,PRE()
NoSPB                       STRING(10)
KodeBarang                  STRING(10)
Jumlah                      REAL
Harga_Sat                   REAL
Jenis_PPN                   BYTE
PPN                         REAL
Discount                    REAL
Keterangan                  STRING(30)
StatusDisc                  BYTE
total_harga                 REAL
OSPO                        REAL
Qty_Available               REAL
Status                      STRING(20)
                         END
                     END                       

GStokAptk            FILE,DRIVER('SQLAnywhere'),NAME('dba.GStokAptk'),PRE(GSTO),CREATE,BINDABLE,THREAD
KeyApotik                KEY(GSTO:Kode_Apotik),DUP,NAME('KeyApotik'),OPT
KeyBarang                KEY(GSTO:Kode_Barang,GSTO:Kode_Apotik),NAME('KeyBarang'),OPT,PRIMARY
key_kd_brg               KEY(GSTO:Kode_Barang),DUP,NAME('key_kd_brg'),OPT
Record                   RECORD,PRE()
Kode_Apotik                 STRING(5)
Kode_Barang                 STRING(10)
Saldo_Minimal               REAL
Saldo                       REAL
Harga_Dasar                 REAL
Saldo_Maksimal              REAL
                         END
                     END                       

GHBPB                FILE,DRIVER('SQLAnywhere'),NAME('dba.GHBPB'),PRE(GHBPB),CREATE,BINDABLE,THREAD
KeyNoBPB                 KEY(GHBPB:NoBPB),OPT,PRIMARY
KeyStatus                KEY(GHBPB:Status),DUP,NOCASE,OPT
KeyNoApotik              KEY(GHBPB:Kode_Apotik),DUP,OPT
KeyTanggal               KEY(GHBPB:Tanggal),DUP,OPT
KeyMasterGHBPB           KEY(GHBPB:NoMaster),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NoBPB                       STRING(10)
Kode_Apotik                 STRING(5)
Tanggal                     DATE
Status                      STRING(5)
Verifikasi                  BYTE
UserInput                   STRING(20)
UserVal                     STRING(20)
JamInput                    TIME
TanggalVal                  DATE
JamVal                      TIME
NoMaster                    STRING(20)
                         END
                     END                       

JPTmpKel             FILE,DRIVER('SQLAnywhere'),NAME('dba.JPTmpKel'),PRE(JPTK),CREATE,BINDABLE,THREAD
KeyNomorMr               KEY(JPTK:Nomor_mr),NOCASE,OPT
KeyNama                  KEY(JPTK:Nama),DUP,NOCASE,OPT
KeyKec                   KEY(JPTK:Kecamatan,JPTK:Kota),DUP,NOCASE,OPT
KeyKembali               KEY(JPTK:kembali,JPTK:Tanggal),DUP,NOCASE,OPT
KeyTanggal               KEY(JPTK:Tanggal),DUP,NOCASE,OPT
KeyKota                  KEY(JPTK:Kota),DUP,NOCASE,OPT
KeyLantai                KEY(JPTK:Lantai),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_mr                    LONG
Nama                        STRING(35)
TanggalLahir                DATE
Umur                        LONG
Umur_Bln                    LONG
Jenis_kelamin               STRING(1)
Alamat                      STRING(35)
RT                          LONG
RW                          LONG
Kelurahan                   STRING(20)
Kecamatan                   STRING(30)
Kota                        STRING(20)
Agama                       STRING(12)
pekerjaan                   STRING(20)
Telepon                     STRING(15)
Tanggal                     DATE
kembali                     LONG
Kontrak                     STRING(20)
User                        STRING(10)
TEMPAT                      STRING(10)
Jam                         TIME
Lantai                      BYTE
KodeKlinik                  STRING(10)
NamaKlinik                  STRING(30)
                         END
                     END                       

JTDbyr               FILE,DRIVER('SQLAnywhere'),NAME('dba.JTDbyr'),PRE(JTD),CREATE,BINDABLE,THREAD
KNotaJasa                KEY(JTD:NONota,JTD:KodeJasa),NOCASE,OPT,PRIMARY
KJasa                    KEY(JTD:KodeJasa),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NONota                      STRING(10)
KodeJasa                    STRING(10)
Biaya                       REAL
Jmltindakan                 REAL
Keterangan                  STRING(40)
                         END
                     END                       

JREKJD               FILE,DRIVER('SQLAnywhere'),NAME('dba.JREKJD'),PRE(JRJD),CREATE,BINDABLE,THREAD
KeyKodeKlinik            KEY(JRJD:KodePoli),DUP,NOCASE,OPT
KeyDokter                KEY(JRJD:KodeDokter),DUP,NOCASE,OPT
KeyNo                    KEY(JRJD:No),DUP,NOCASE,OPT
KeyRekap                 KEY(JRJD:Rekap,JRJD:Nomor_Mr),NOCASE,OPT,PRIMARY
KeyRekapSaja             KEY(JRJD:Rekap),DUP,NOCASE,OPT
Record                   RECORD,PRE()
No                          STRING(5)
Nomor_Mr                    LONG
NamaPasien                  STRING(35)
LP                          STRING(1)
Umur                        BYTE
KodePoli                    STRING(10)
KodeDokter                  STRING(10)
RSI                         REAL
Dokter                      REAL
Tindakan                    REAL
Total                       REAL
Rekap                       LONG
                         END
                     END                       

GDBPB                FILE,DRIVER('SQLAnywhere'),NAME('dba.GDBPB'),PRE(GDBPB),CREATE,BINDABLE,THREAD
KeyNoBPB                 KEY(GDBPB:NoBPB),OPT
KeyBPBItem               KEY(GDBPB:NoBPB,GDBPB:Kode_Brg),OPT,PRIMARY
KeyKodeBarang            KEY(GDBPB:Kode_Brg),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NoBPB                       STRING(10)
Kode_Brg                    STRING(10)
NoItem                      SHORT
Jumlah                      REAL
Keterangan                  STRING(20)
Qty_Accepted                REAL
                         END
                     END                       

MBarang              FILE,DRIVER('SQLAnywhere'),NAME('dba.MBarang'),PRE(MBA1),CREATE,BINDABLE,THREAD
Record                   RECORD,PRE()
Kode                        STRING(12)
Nama                        STRING(100)
JenisBrg                    SHORT
GroupBrg                    SHORT
Generik                     STRING(1)
NamaGenerik                 STRING(30)
Golongan_Obat               STRING(1)
SatuanBeli                  STRING(10)
SatuanJual                  STRING(10)
Isi                         LONG
Sediaan                     STRING(10)
Kemasan                     STRING(20)
HrgBeliSblmPPN              REAL
PPN                         REAL
HrgBeliSetelahPPN           REAL
HrgJualPerPcs               REAL
HrgJualPerBox               REAL
StockAkhir                  REAL
StockMin                    REAL
KodePBF1                    STRING(5)
KodePBF2                    STRING(5)
KodePBF3                    STRING(5)
StatusBrg                   SHORT
JamUbah                     STRING(8)
UserName                    STRING(10)
                         END
                     END                       

GHSBBK               FILE,DRIVER('SQLAnywhere'),NAME('dba.GHSBBK'),PRE(GHSB),CREATE,BINDABLE,THREAD
KeyNoSBBK                KEY(GHSB:NoSBBK),OPT,PRIMARY
KeyTanggal               KEY(GHSB:Tanggal_SBBK),DUP,NOCASE,OPT
Key_NoSBBK_Status        KEY(GHSB:Status,GHSB:NoSBBK),DUP,NOCASE,OPT
KeyNoBPB                 KEY(GHSB:NoBPB),DUP,OPT
Record                   RECORD,PRE()
NoSBBK                      STRING(10)
Tanggal_SBBK                DATE
NoBPB                       STRING(10)
Total                       REAL
Keterangan                  STRING(30)
Status                      BYTE
                         END
                     END                       

GDSBBK               FILE,DRIVER('SQLAnywhere'),NAME('dba.GDSBBK'),PRE(GDSB),CREATE,BINDABLE,THREAD
KeyNoSBBKItem            KEY(GDSB:NoSBBK,GDSB:KodeBarang),OPT,PRIMARY
KeyNoSBBK                KEY(GDSB:NoSBBK),DUP,OPT
KeyBarang                KEY(GDSB:KodeBarang),DUP,OPT
Record                   RECORD,PRE()
NoSBBK                      STRING(10)
KodeBarang                  STRING(10)
Jumlah_Sat                  REAL
Harga                       REAL
Total                       REAL
Keterangan                  STRING(20)
                         END
                     END                       

GApotik              FILE,DRIVER('SQLAnywhere'),NAME('dba.GApotik'),PRE(GAPO),CREATE,BINDABLE,THREAD
KeyNoApotik              KEY(GAPO:Kode_Apotik),NOCASE,OPT,PRIMARY
KeyNama                  KEY(GAPO:Nama_Apotik),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Kode_Apotik                 STRING(5)
Nama_Apotik                 STRING(30)
Keterangan                  STRING(20)
Keterangan2                 STRING(20)
                         END
                     END                       

JTSBayar             FILE,DRIVER('SQLAnywhere'),NAME('dba.JTSBayar'),PRE(JTBS),CREATE,BINDABLE,THREAD
KeyNomorMr               KEY(JTBS:Nomor_Mr),DUP,NOCASE,OPT
KeyNoBukti               KEY(JTBS:NoBukti),OPT,PRIMARY
KeyKlinik                KEY(JTBS:Kode),DUP,NOCASE,OPT
KeyDokter                KEY(JTBS:Dokter),DUP,NOCASE,OPT
KeyTanggal               KEY(JTBS:Tanggal),DUP,NOCASE,OPT
KeyNoNota                KEY(JTBS:NoNota),DUP,NOCASE,OPT
KeyTempat                KEY(JTBS:Tempat),DUP,NOCASE,OPT
KeyTransaksi             KEY(JTBS:Transaksi),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_Mr                    LONG
NoNota                      STRING(10)
Pengirim                    STRING(10)
Kode                        STRING(10)
Dokter                      STRING(10)
NoBukti                     STRING(10)
BiayaRSI                    REAL
BiayaDokter                 REAL
Biaya                       REAL
Transaksi                   BYTE
Tempat                      STRING(10)
Tanggal                     DATE
Jam                         TIME
User                        STRING(10)
Kassa                       STRING(10)
Jenis                       STRING(1)
Selesai                     STRING(1)
Status                      STRING(10)
Prosen                      REAL
                         END
                     END                       

GRBatalK             FILE,DRIVER('SQLAnywhere'),NAME('dba.GRBatalK'),PRE(GRBK),CREATE,BINDABLE,THREAD
KeyKodeBrg               KEY(GRBK:KodeBrg),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
KodeBrg                     STRING(10)
Jumlah                      ULONG
                         END
                     END                       

GBarang              FILE,DRIVER('SQLAnywhere'),NAME('dba.GBarang'),PRE(GBAR),CREATE,BINDABLE,THREAD
keyNamaKandungan         KEY(GBAR:Ket2),DUP,NOCASE,OPT
KeyKodeBrg               KEY(GBAR:Kode_brg),NAME('KeyKodeBrg'),OPT,PRIMARY
KeyNama                  KEY(GBAR:Nama_Brg),DUP,NAME('KeyNama'),OPT
KeyKodeUPF               KEY(GBAR:Kode_UPF),DUP,OPT
KeyKodeKelompok          KEY(GBAR:Kelompok),DUP,NOCASE,OPT
KeyKodeAsliBrg           KEY(GBAR:Kode_Asli),DUP,NOCASE,OPT
Barcode_GBarang_FK       KEY(GBAR:KodeBarcode),DUP,NOCASE,OPT
Ket1_gbarang_fk          KEY(GBAR:Ket1),DUP,NOCASE,OPT
KeyKodeKandungan         KEY(GBAR:Kandungan),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Kode_brg                    STRING(10)
Nama_Brg                    STRING(40)
Jenis_Brg                   STRING(5)
No_Satuan                   STRING(10)
Dosis                       ULONG
Stok_Total                  REAL
Kode_UPF                    STRING(10)
Kode_Apotik                 STRING(5)
Kelompok                    LONG
Status                      BYTE
Kode_Asli                   STRING(10)
KetSatuan                   STRING(20)
KelBesar                    STRING(1)
StatusGen                   BYTE
Sediaan                     STRING(2)
Farmakolog                  STRING(2)
StatusBeli                  BYTE
Pabrik                      STRING(2)
Fungsi                      STRING(2)
Ket1                        STRING(50)
Ket2                        STRING(50)
Kode_Principal              STRING(3)
KodeBarcode                 STRING(30)
Harga                       REAL
Golongan                    STRING(40)
Kandungan                   STRING(40)
SatuanBeli                  STRING(10)
Konversi                    REAL
FarNonFar                   BYTE
                         END
                     END                       

GLapBln              FILE,DRIVER('SQLAnywhere'),NAME('dba.GLapBln'),PRE(GLAB),CREATE,BINDABLE,THREAD
KeyNo                    KEY(GLAB:No),NOCASE,OPT,PRIMARY
KeyKode                  KEY(GLAB:Kode),DUP,NOCASE,OPT
Record                   RECORD,PRE()
No                          USHORT
Kode                        STRING(10)
SaldoAwal                   REAL
Debet                       REAL
Kredit                      REAL
SaldoAkhir                  REAL
Harga                       REAL
Total                       REAL
                         END
                     END                       

GSatuan              FILE,DRIVER('SQLAnywhere'),NAME('dba.GSatuan'),PRE(GSAT),CREATE,BINDABLE,THREAD
Key_No_Satuan            KEY(GSAT:No_Satuan),NOCASE,OPT,PRIMARY
Key_Nama_Satuan          KEY(GSAT:Nama_Satuan),DUP,NOCASE,OPT
Record                   RECORD,PRE()
No_Satuan                   STRING(5)
Nama_Satuan                 STRING(10)
                         END
                     END                       

LAdaDet              FILE,DRIVER('SQLAnywhere'),NAME('dba.LAdaDet'),PRE(LADD),CREATE,BINDABLE,THREAD
KeyNPer_KLab             KEY(LADD:NoPeriksa,LADD:KodeLab),NOCASE,OPT
Record                   RECORD,PRE()
NoPeriksa                   STRING(12)
KodeLab                     STRING(12)
AdaKet                      BYTE
Ket                         STRING(100)
                         END
                     END                       

MBarangMK            FILE,DRIVER('SQLAnywhere'),NAME('dba.MBarangMK'),PRE(MBA),CREATE,BINDABLE,THREAD
Record                   RECORD,PRE()
Kode                        STRING(254)
Nama                        STRING(254)
JenisBarang                 STRING(254)
GroupBarang                 STRING(254)
Generik                     STRING(254)
NamaGenerik                 STRING(254)
GolObat                     STRING(254)
SatuanBeli                  STRING(254)
SatuanJual                  STRING(254)
Isi                         STRING(254)
Sediaan                     STRING(254)
Kemasan                     STRING(254)
HargaSblmPPN                STRING(254)
PPN                         STRING(254)
HargaSetelahPPN             STRING(254)
HargaJualPerPcs             STRING(254)
HargaJualPerBox             STRING(254)
StokAkhir                   STRING(254)
StokMinimal                 STRING(254)
KodePBF1                    STRING(254)
KodePBF2                    STRING(254)
KodePBF3                    STRING(254)
StatusBarang                STRING(254)
JamUbah                     STRING(254)
UserUbah                    STRING(254)
                         END
                     END                       

JTTBayar             FILE,DRIVER('SQLAnywhere'),NAME('dba.JTTBayar'),PRE(JTTB),CREATE,BINDABLE,THREAD
KeyNomorMr               KEY(JTTB:Nomor_Mr),DUP,NOCASE,OPT
KeyNoBukti               KEY(JTTB:NoBukti),DUP,OPT
KeyKode                  KEY(JTTB:Kode),DUP,OPT
KeyDokter                KEY(JTTB:Dokter),DUP,OPT
KeyTanggal               KEY(JTTB:Tanggal),DUP,NOCASE,OPT
KeyNoNota                KEY(JTTB:NoNota),OPT,PRIMARY
KeyTempat                KEY(JTTB:Tempat),DUP,OPT
KeyTransaksi             KEY(JTTB:Transaksi),DUP,NOCASE,OPT
KeyKodeDokter            KEY(JTTB:Dokter),DUP,OPT
KeyLantai                KEY(JTTB:Lantai),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_Mr                    LONG
NoNota                      STRING(10)
Pengirim                    STRING(10)
Kode                        STRING(10)
Dokter                      STRING(10)
NoBukti                     STRING(10)
BiayaRSI                    REAL
BiayaDokter                 REAL
Biaya                       REAL
Transaksi                   BYTE
Tempat                      STRING(10)
Tanggal                     DATE
Jam                         TIME
User                        STRING(10)
Kassa                       STRING(10)
Jenis                       STRING(1)
Selesai                     STRING(1)
Status                      STRING(10)
Prosen                      REAL
Lantai                      BYTE
                         END
                     END                       

OKLain               FILE,DRIVER('SQLAnywhere'),NAME('dba.oklain'),PRE(OKL),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(OKL:kode),OPT,PRIMARY
KeyNama                  KEY(OKL:Nama),DUP,OPT
KeyKode                  KEY(OKL:kode),DUP,OPT
Record                   RECORD,PRE()
kode                        STRING(10)
Nama                        STRING(30)
Biaya                       REAL
Keterangan                  STRING(30)
                         END
                     END                       

ODDOp                FILE,DRIVER('SQLAnywhere'),NAME('dba.ODDOp'),PRE(ODP),CREATE,BINDABLE,THREAD
KeyNoPeriksa             KEY(ODP:NoPeriksa),DUP,NOCASE,OPT
KeyNoPeriksaKodeUrut     KEY(ODP:NoPeriksa,ODP:KodeUrut),NOCASE,OPT
KeyGKodeLab              KEY(ODP:KodeUrut),DUP,NOCASE,OPT
KeyKodeLab               KEY(ODP:KodeBar),DUP,NOCASE,OPT
KeyKodePasien            KEY(ODP:Panjang),DUP,NOCASE,OPT
KeyNoPer_SGLab           KEY(ODP:NoPeriksa),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NoPeriksa                   STRING(12)
KodeUrut                    BYTE
KodeBar                     STRING(12)
TanggalMasuk                DATE
JamKeluar                   TIME
Panjang                     LONG
Harga                       ULONG
Hasil                       STRING(20)
LEVEL                       BYTE
LevelHasil                  BYTE
User                        STRING(20)
                         END
                     END                       

LHLAB                FILE,DRIVER('SQLAnywhere'),NAME('dba.LHLAB'),PRE(HLA),CREATE,BINDABLE,THREAD
KeyGKodeLab              KEY(HLA:GKodeLab),DUP,NOCASE,OPT
KeyGKN                   KEY(HLA:NO,HLA:GKodeLab),NOCASE,OPT
Record                   RECORD,PRE()
GKodeLab                    STRING(5)
NO                          BYTE
NamaLab                     STRING(50)
KodeLast                    STRING(7)
                         END
                     END                       

ITbKelas             FILE,DRIVER('SQLAnywhere'),NAME('dba.ITbKelas'),PRE(ITbk),CREATE,BINDABLE,THREAD
KeyKodeKelas             KEY(ITbk:KodeKelas),NOCASE,OPT,PRIMARY
KeyNamaKelas             KEY(ITbk:NamaKelas),DUP,NOCASE,OPT
Record                   RECORD,PRE()
KodeKelas                   STRING(10)
NamaKelas                   STRING(20)
BiayaRawat                  REAL
BiayaRawatBy                REAL
VisiteRSI                   REAL
VisiteDokter                REAL
Kelas                       STRING(3)
abc                         STRING(3)
BiayaRawatOld               REAL
BiayaRawatByOld             REAL
VisiteRSIOld                REAL
VisiteDokterOld             REAL
StatusAktif                 BYTE
                         END
                     END                       

LKtrPers             FILE,DRIVER('SQLAnywhere'),NAME('dba.LKtrPers'),PRE(LKtP),CREATE,BINDABLE,THREAD
KeyKodeKontrak           KEY(LKtP:KODE_KTR),DUP,NOCASE,OPT
KeyKodeLab               KEY(LKtP:KodeLab),DUP,NOCASE,OPT
KeyPersen                KEY(LKtP:Persen),DUP,NOCASE,OPT
KeyKonKLab               KEY(LKtP:KODE_KTR,LKtP:KodeLab),NOCASE,OPT
Record                   RECORD,PRE()
KODE_KTR                    STRING(10)
KodeLab                     STRING(10)
Persen                      BYTE
                         END
                     END                       

LPasExt              FILE,DRIVER('SQLAnywhere'),NAME('dba.LPasExt'),PRE(LPaX),CREATE,BINDABLE,THREAD
KeyNomorNotta            KEY(LPaX:Nomor_Notta),NOCASE,OPT,PRIMARY
KeyNomor_MR              KEY(LPaX:Nomor_MR),DUP,NOCASE,OPT
KeyNama                  KEY(LPaX:Nama),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_Notta                 STRING(12)
Nomor_MR                    LONG
Nama                        STRING(35)
TanggalLahir                DATE
Umur                        LONG
Jenis_kelamin               STRING(1)
Alamat                      STRING(35)
Agama                       STRING(12)
pekerjaan                   STRING(20)
Telepon                     STRING(15)
User                        STRING(10)
Suruh                       STRING(20)
Jam                         TIME
                         END
                     END                       

OKIBiayaLain         FILE,DRIVER('SQLAnywhere'),NAME('DBA.OKIBiayaLain'),PRE(OKB1),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(OKB1:Nomor,OKB1:Nama_Tindakan),OPT,PRIMARY
keyTindakan_oklain       KEY(OKB1:Nama_Tindakan),DUP
Record                   RECORD,PRE()
Nomor                       STRING(12)
Nama_Tindakan               STRING(10)
biaya                       REAL
Keterangan                  STRING(30)
nomor_mr                    LONG
urut                        USHORT
                         END
                     END                       

OKIDKeluar           FILE,DRIVER('SQLAnywhere'),NAME('dba.OKIDKeluar'),PRE(OKD3),CREATE,BINDABLE,THREAD
PRimaryKey               KEY(OKD3:Nomor,OKD3:Kode_Barang),OPT,PRIMARY
KeyNomor                 KEY(OKD3:Nomor),DUP
Barang_OKIDKeluar_Key    KEY(OKD3:Kode_Barang),DUP
Record                   RECORD,PRE()
Nomor                       STRING(12)
Kode_Barang                 STRING(10)
Jumlah                      REAL
Harga                       REAL
Biaya                       REAL
no_mr                       LONG
urut                        USHORT
                         END
                     END                       

OKIDOPAN             FILE,DRIVER('SQLAnywhere'),NAME('DBA.OKIDOPAN'),PRE(OKD21),BINDABLE,THREAD
PK                       KEY(OKD21:Nomor,OKD21:Operator,OKD21:Anestesis),OPT,PRIMARY
KeyNomor                 KEY(OKD21:Nomor),DUP
operatorKey              KEY(OKD21:Operator),DUP,NOCASE,OPT
anestesiskey             KEY(OKD21:Anestesis),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor                       STRING(12)
Operator                    STRING(5)
Anestesis                   STRING(5)
Keterangan                  STRING(30)
Biaya_Operator              REAL
biaya_anestesist            REAL
nomor_mr                    LONG
urut                        USHORT
                         END
                     END                       

LPasLab              FILE,DRIVER('SQLAnywhere'),NAME('dba.LPasLab'),PRE(LPas),CREATE,BINDABLE,THREAD
KeyNomorMr               KEY(LPas:Nomor_mr),DUP,NOCASE,OPT
KeyNomorPeriksa          KEY(LPas:NoPeriksa),NOCASE,OPT,PRIMARY
keynama                  KEY(LPas:nama),DUP,NOCASE,OPT
KeyNomorPeriksaBalik     KEY(-LPas:NoPeriksa),DUP,NOCASE,OPT
KeyJenis                 KEY(LPas:Jalan),DUP,NOCASE,OPT
keyRuang                 KEY(LPas:Ruang),DUP,NOCASE,OPT
KeyTglMasuk_Jam          KEY(LPas:TanggalMasuk,-LPas:Jam),DUP,NOCASE,OPT
KeyNoMrRuang             KEY(LPas:Nomor_mr,LPas:Ruang),DUP,NOCASE,OPT
KeyNomorMrInapTgl        KEY(LPas:Nomor_mr,LPas:Inap,LPas:TanggalMasuk),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NoPeriksa                   STRING(12)
Nomor_mr                    LONG
Kelas                       STRING(4)
Ruang                       STRING(10)
Jalan                       BYTE
Inap                        BYTE
TotalBayar                  REAL
TanggalMasuk                DATE
Sifat                       STRING(1)
Pembayaran                  BYTE
KodeKtr                     BYTE
StatusLunas                 BYTE
StatusHasil                 BYTE
StatusCetakKerja            BYTE
Jam                         TIME
JU                          BYTE
User                        STRING(20)
nama                        STRING(50)
kode_dokter                 STRING(5)
umurtahun                   BYTE
umurbulan                   BYTE
                         END
                     END                       

OKIDRinci            FILE,DRIVER('SQLAnywhere'),NAME('dba.OKIDRinci'),PRE(OKD11),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(OKD11:Nomor,OKD11:Jasa),OPT,PRIMARY
KEyNomor                 KEY(OKD11:Nomor),DUP
OKAlatKamar_OKDRinci_Key KEY(OKD11:Jasa),DUP
Record                   RECORD,PRE()
Nomor                       STRING(12)
nomor_mr                    LONG
urut                        USHORT
Jasa                        STRING(5)
Biaya                       REAL
Keterangan                  STRING(30)
                         END
                     END                       

OKHInap              FILE,DRIVER('SQLAnywhere'),NAME('dba.OKHInap'),PRE(OKH1),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(OKH1:Nomor),OPT,PRIMARY
KeyNoMR                  KEY(OKH1:NomorMR),DUP,NOCASE,OPT
KeyNomor                 KEY(OKH1:Nomor),DUP,OPT
RI_HRInap_OKHKeluar_key  KEY(OKH1:NomorMR),DUP
OKJBedah_OKHKeluar_Key   KEY(OKH1:Jenis_Bedah),DUP
OKJAnestesi_OKHKeluar_Key KEY(OKH1:Jenis_Anesthesi),DUP
Record                   RECORD,PRE()
Nomor                       STRING(12)
NomorMR                     LONG
Tanggal                     DATE
Jam                         TIME
Jenis_Bedah                 STRING(10)
Jenis_Anesthesi             STRING(10)
User                        STRING(20)
Jenis_Operasi               BYTE
Lama_Operasi                LONG
Operasi                     BYTE
NoUrut                      SHORT
Kelas                       BYTE
BiayaObat                   REAL
BiayaJasa                   REAL
BiayaOperator               REAL
BiayaLain                   REAL
BiayaOperasi                REAL
TotalBiaya                  REAL
BiayaAnestesis              REAL
tempat                      STRING(20)
BiayaJasaDokter             REAL
                         END
                     END                       

OKAlatKamar          FILE,DRIVER('SQLAnywhere'),NAME('dba.OKAlatKamar'),PRE(OKA1),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(OKA1:Kode),OPT,PRIMARY
keyNama                  KEY(OKA1:Nama),DUP,OPT
KodeKey                  KEY(OKA1:Kode),DUP
Record                   RECORD,PRE()
Kode                        STRING(5)
Nama                        STRING(30)
BiayaRJalan                 REAL
BiayaA                      REAL
BiayaB                      REAL
BiayaC                      REAL
BiayaD                      REAL
Keterangan                  STRING(30)
Operator                    STRING(20)
Tanggal_Update              DATE
Jam_Update                  TIME
BiayaE                      REAL
BiayaF                      REAL
BiayaG                      REAL
BiayaH                      REAL
BiayaI                      REAL
BiayaJ                      REAL
BiayaK                      REAL
BiayaL                      REAL
BiayaM                      REAL
BiayaN                      REAL
BiayaO                      REAL
BiayaP                      REAL
                         END
                     END                       

OKAnestesist         FILE,DRIVER('SQLAnywhere'),NAME('dba.OKAnestesist'),PRE(OKA),CREATE,BINDABLE,THREAD
KeyKodeOpr               KEY(OKA:Kode),OPT,PRIMARY
keyNama                  KEY(OKA:Nama),DUP,OPT
key_kode                 KEY(OKA:Kode),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Kode                        STRING(5)
Nama                        STRING(30)
Tarif                       REAL
Keterangan                  STRING(20)
                         END
                     END                       

OKDOPAN              FILE,DRIVER('SQLAnywhere'),NAME('DBA.OKDOPAN'),PRE(OKD2),BINDABLE,THREAD
PK                       KEY(OKD2:Nomor,OKD2:Operator,OKD2:Anestesis),OPT,PRIMARY
KeyNomor                 KEY(OKD2:Nomor),DUP
Operator_OKDOPAN_Key     KEY(OKD2:Operator),DUP
Anestesis_OKDOPAN_Key    KEY(OKD2:Anestesis),DUP
Record                   RECORD,PRE()
Nomor                       STRING(12)
Operator                    STRING(5)
Anestesis                   STRING(5)
Keterangan                  STRING(30)
Biaya_Operator              REAL
biaya_anestesist            REAL
                         END
                     END                       

JTTSByr              FILE,DRIVER('SQLAnywhere'),NAME('dba.JTTSByr'),PRE(JTTS),CREATE,BINDABLE,THREAD
KeyNomorMr               KEY(JTTS:Nomor_Mr),DUP,NOCASE,OPT
KeyNoBukti               KEY(JTTS:NoBukti),OPT,PRIMARY
KeyKode                  KEY(JTTS:Kode),DUP,OPT
KeyDokter                KEY(JTTS:Dokter),DUP,OPT
KeyTanggal               KEY(JTTS:Tanggal),DUP,NOCASE,OPT
KeyNoNota                KEY(JTTS:NoNota),DUP,OPT
KeyTempat                KEY(JTTS:Tempat),DUP,OPT
KeyTransaksi             KEY(JTTS:Transaksi),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_Mr                    LONG
NoNota                      STRING(10)
Pengirim                    STRING(10)
Kode                        STRING(10)
Dokter                      STRING(10)
NoBukti                     STRING(10)
BiayaRSI                    REAL
BiayaDokter                 REAL
Biaya                       REAL
Transaksi                   BYTE
Tempat                      STRING(10)
Tanggal                     DATE
Jam                         TIME
User                        STRING(10)
Kassa                       STRING(10)
Jenis                       STRING(1)
Selesai                     STRING(1)
Status                      STRING(10)
Prosen                      REAL
                         END
                     END                       

RoPasLu              FILE,DRIVER('SQLAnywhere'),NAME('dba.RoPasLu'),PRE(RPLU),CREATE,BINDABLE,THREAD
KeyNoUrut                KEY(RPLU:NoUrut),OPT,PRIMARY
KeyNama                  KEY(RPLU:Nama),DUP,OPT
KeyTanggal               KEY(RPLU:Tanggal),DUP,NOCASE,OPT
KeyKecamatan             KEY(RPLU:Kecamatan),DUP,OPT
KeyKota                  KEY(RPLU:Kota),DUP,OPT
Record                   RECORD,PRE()
Nomor_MR                    LONG
NoUrut                      STRING(10)
Nama                        STRING(35)
TanggalLahir                DATE
Umur                        LONG
Umur_Bln                    BYTE
Jenis_kelamin               STRING(1)
Alamat                      STRING(35)
RT                          ULONG
RW                          ULONG
Kelurahan                   STRING(30)
Kecamatan                   STRING(30)
Kota                        STRING(20)
Agama                       STRING(12)
pekerjaan                   STRING(20)
Telepon                     STRING(15)
Suruh                       STRING(20)
Jam                         TIME
Tanggal                     DATE
User                        STRING(10)
NoNota                      STRING(10)
KodeTempat                  STRING(10)
Pembayaran                  BYTE
Ruang_Klinik                STRING(10)
Kelas                       STRING(10)
TotalBiaya                  REAL
adabatal                    BYTE
                         END
                     END                       

RI_DSBBM             FILE,DRIVER('SQLAnywhere'),NAME('dba.RI_DSBBM'),PRE(RI_DSM),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(RI_DSM:Nomor,RI_DSM:Kode_brg),OPT,PRIMARY
by_transaksi             KEY(RI_DSM:Nomor),DUP,OPT
Barang_RI_DSBBM_FK       KEY(RI_DSM:Kode_brg),DUP,OPT
by_tran_cam              KEY(RI_DSM:Nomor,RI_DSM:Camp),DUP,OPT
Record                   RECORD,PRE()
Nomor                       STRING(15)
Kode_brg                    STRING(10)
Camp                        ULONG
Jumlah                      REAL
Harga_Dasar                 REAL
Total                       LONG
Diskon                      REAL
                         END
                     END                       

OHPasOp              FILE,DRIVER('SQLAnywhere'),NAME('dba.OHPasOp'),PRE(OPas),CREATE,BINDABLE,THREAD
KeyNomorMr               KEY(OPas:Nomor_mr),DUP,NOCASE,OPT
KeyNomorPeriksa          KEY(OPas:NoPeriksa),NOCASE,OPT,PRIMARY
KeyNomorPeriksaBalik     KEY(-OPas:NoPeriksa),DUP,NOCASE,OPT
KeyJenis                 KEY(OPas:Jalan),DUP,NOCASE,OPT
keyRuang                 KEY(OPas:Ruang),DUP,NOCASE,OPT
KeyTglMasuk_Jam          KEY(OPas:TanggalMasuk,-OPas:Jam),DUP,NOCASE,OPT
KeyObatNotta             KEY(OPas:NoPeriksa,OPas:K_OBATOBATAN),DUP,NOCASE,OPT
KeySunInNotta            KEY(OPas:NoPeriksa,OPas:K_alSunIn),DUP,NOCASE,OPT
KeyBenJahNotta           KEY(OPas:NoPeriksa,OPas:K_Benjah),DUP,NOCASE,OPT
KeyBalNotta              KEY(OPas:NoPeriksa,OPas:K_Bal),DUP,NOCASE,OPT
KeyGasAnNotta            KEY(OPas:NoPeriksa,OPas:K_GasAnes),DUP,NOCASE,OPT
KeyLainNotta             KEY(OPas:NoPeriksa,OPas:K_AlLain),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NoPeriksa                   STRING(12)
Nomor_mr                    LONG
Kelas                       STRING(4)
Ruang                       STRING(10)
Jalan                       BYTE
Inap                        BYTE
TotalBayar                  ULONG
TanggalMasuk                LONG
Sifat                       STRING(1)
Pembayaran                  BYTE
KodeKtr                     BYTE
StatusLunas                 BYTE
StatusHasil                 BYTE
StatusCetakKerja            BYTE
Jam                         LONG
JU                          BYTE
User                        STRING(20)
K_OBATOBATAN                BYTE
K_alSunIn                   BYTE
K_Benjah                    BYTE
K_Bal                       BYTE
K_GasAnes                   BYTE
K_AlLain                    BYTE
                         END
                     END                       

LDDPerik             FILE,DRIVER('SQLAnywhere'),NAME('dba.LDDPerik'),PRE(LDD),CREATE,BINDABLE,THREAD
KeyNoPeriksa             KEY(LDD:NoPeriksa),DUP,NOCASE,OPT
KeyNPer_KLab             KEY(LDD:NoPeriksa,LDD:KodeLab),NOCASE,OPT,PRIMARY
KeyGKodeLab              KEY(LDD:GKodeLab),DUP,NOCASE,OPT
KeyKodeLab               KEY(LDD:KodeLab),DUP,NOCASE,OPT
KeyTanggal               KEY(LDD:TanggalHasil),DUP,NOCASE,OPT
KeyKodePasien            KEY(LDD:KodePasien),DUP,NOCASE,OPT
KeySGLab                 KEY(LDD:SubGLab),DUP,NOCASE,OPT
KeyNoPer_SGLab           KEY(LDD:NoPeriksa,LDD:SubGLab),DUP,NOCASE,OPT
KeyNoperiksaTglmasuk     KEY(LDD:NoPeriksa,LDD:TanggalMasuk),DUP,NOCASE,OPT
keyNoPeriksaGroupTglmasuk KEY(LDD:NoPeriksa,LDD:GKodeLab,LDD:TanggalMasuk),DUP,NOCASE,OPT
KeyNoPeriksaTglmasukGroup KEY(LDD:NoPeriksa,LDD:TanggalMasuk,LDD:GKodeLab),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NoPeriksa                   STRING(12)
SubGLab                     STRING(7)
GKodeLab                    STRING(12)
KodeLab                     STRING(12)
TanggalMasuk                DATE
JamMasuk                    TIME
TanggalHasil                DATE
JamKeluar                   TIME
KodePasien                  LONG
Harga                       ULONG
Hasil                       STRING(40)
LEVEL                       BYTE
LevelHasil                  BYTE
User                        STRING(20)
                         END
                     END                       

RI_HSBBM             FILE,DRIVER('SQLAnywhere'),NAME('dba.RI_HSBBM'),PRE(RI_HSM),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(RI_HSM:Nomor),OPT,PRIMARY
Instalasi_ri_hsbbm_fk    KEY(RI_HSM:Kode_Inst),DUP,OPT
keytanggal               KEY(RI_HSM:Tanggal),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor                       STRING(15)
Tanggal                     DATE
Biaya                       LONG
Bayar                       BYTE
cara_bayar                  BYTE
Kode_Inst                   STRING(5)
Batal                       BYTE
User                        STRING(4)
Keterangan                  STRING(20)
                         END
                     END                       

LsPel                FILE,DRIVER('TOPSPEED'),OEM,NAME('c:\program\LsPel.tps'),PRE(LsPn),CREATE,BINDABLE,THREAD
keynoauto                KEY(LsPn:noauto),DUP,NOCASE,OPT
keypelayanan             KEY(LsPn:Nopel),DUP,NOCASE,OPT
keynama                  KEY(LsPn:name),DUP,NOCASE,OPT
keygroup                 KEY(LsPn:group),DUP,NOCASE,OPT
keygroupsize             KEY(LsPn:group,LsPn:name),DUP,NOCASE,OPT
keykoderuang             KEY(LsPn:Ruang),DUP,NOCASE,OPT
Record                   RECORD,PRE()
noauto                      BYTE
Nopel                       BYTE
name                        STRING(40)
Ruang                       STRING(50)
group                       STRING(20)
                         END
                     END                       

OKDRinci             FILE,DRIVER('SQLAnywhere'),NAME('dba.OKDRinci'),PRE(OKD1),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(OKD1:Nomor,OKD1:Jasa),OPT,PRIMARY
OKAlatKamar_OKDRinci_Key KEY(OKD1:Jasa),DUP
KeyNomor                 KEY(OKD1:Nomor),DUP
Record                   RECORD,PRE()
Nomor                       STRING(12)
Jasa                        STRING(5)
Biaya                       REAL
Keterangan                  STRING(30)
                         END
                     END                       

OKJenisAnestesi      FILE,DRIVER('SQLAnywhere'),NAME('dba.OKJenisAnestesi'),PRE(OKJ1),CREATE,BINDABLE,THREAD
PK                       KEY(OKJ1:Kode),OPT,PRIMARY
Record                   RECORD,PRE()
Kode                        STRING(10)
Nama                        STRING(50)
Biaya                       REAL
Keterangan                  STRING(30)
Operator                    STRING(10)
                         END
                     END                       

OKDKeluar            FILE,DRIVER('SQLAnywhere'),NAME('dba.OKDKeluar'),PRE(OKD),CREATE,BINDABLE,THREAD
PRimaryKey               KEY(OKD:Nomor,OKD:Kode_Barang),OPT,PRIMARY
Barang_OKDKeluar_Key     KEY(OKD:Kode_Barang),DUP,OPT
KeyNomor                 KEY(OKD:Nomor),DUP
Record                   RECORD,PRE()
Nomor                       STRING(12)
Kode_Barang                 STRING(10)
Jumlah                      REAL
Harga                       REAL
Biaya                       REAL
                         END
                     END                       

NomorUse             FILE,DRIVER('SQLAnywhere'),NAME('dba.nomoruse'),PRE(NOMU),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(NOMU:Urut,NOMU:Nomor),NOCASE,OPT,PRIMARY
Urut_NomorUse_FK         KEY(NOMU:Urut),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Urut                        LONG
Nomor                       STRING(15)
Keterangan                  STRING(20)
                         END
                     END                       

DDOPe                FILE,DRIVER('SQLAnywhere'),NAME('dba.DDOPe'),PRE(DDOP),CREATE,BINDABLE,THREAD
KeyNoPeriksa             KEY(DDOP:NoPeriksa),DUP,NOCASE,OPT
KeyNoPeriksaKodeUrut     KEY(DDOP:NoPeriksa,DDOP:KodeUrut),NOCASE,OPT
KeyGKodeLab              KEY(DDOP:KodeUrut),DUP,NOCASE,OPT
KeyKodeLab               KEY(DDOP:KodeBar),DUP,NOCASE,OPT
KeyKodePasien            KEY(DDOP:Panjang),DUP,NOCASE,OPT
KeyNoPer_SGLab           KEY(DDOP:NoPeriksa),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NoPeriksa                   STRING(12)
KodeUrut                    BYTE
KodeBar                     STRING(12)
TanggalMasuk                DATE
JamKeluar                   TIME
Panjang                     LONG
Harga                       REAL
Hasil                       STRING(20)
LEVEL                       BYTE
LevelHasil                  BYTE
User                        STRING(20)
                         END
                     END                       

DHPasOp              FILE,DRIVER('SQLAnywhere'),NAME('dba.DHPasOp'),PRE(DHPA),CREATE,BINDABLE,THREAD
KeyNomorMr               KEY(DHPA:Nomor_mr),DUP,NOCASE,OPT
key:KodeDoc              KEY(DHPA:Dokter_OP),DUP,NOCASE,OPT
KeyAnes                  KEY(DHPA:Dok_anes),DUP,NOCASE,OPT
KeyNomorPeriksa          KEY(DHPA:NoPeriksa),NOCASE,OPT,PRIMARY
KeyNomorPeriksaBalik     KEY(-DHPA:NoPeriksa),DUP,NOCASE,OPT
KeyKodeDiagKerja         KEY(DHPA:KodeDiagnosa),DUP,NOCASE,OPT
KeyDiagTambah            KEY(DHPA:DiagTambah),DUP,NOCASE,OPT
keyKodeRegion            KEY(DHPA:KodeRegion),DUP,NOCASE,OPT
KeyTanggalMasuk          KEY(DHPA:TanggalMasuk),DUP,NOCASE,OPT
KeyTglMasuk_Jam          KEY(DHPA:TanggalMasuk,-DHPA:Jammasuk),DUP,NOCASE,OPT
KeyTindakanAkhir         KEY(DHPA:TindakanAkhir),DUP,NOCASE,OPT
KeyKodeRuang             KEY(DHPA:Ruang),DUP,NOCASE,OPT
KeyObatNotta             KEY(DHPA:NoPeriksa,DHPA:K_OBATOBATAN),DUP,NOCASE,OPT
KeyTindakan              KEY(DHPA:Tindakan),DUP,NOCASE,OPT
KeySunInNotta            KEY(DHPA:NoPeriksa,DHPA:K_alSunIn),DUP,NOCASE,OPT
KeyBenJahNotta           KEY(DHPA:NoPeriksa,DHPA:K_Benjah),DUP,NOCASE,OPT
KeyBalNotta              KEY(DHPA:NoPeriksa,DHPA:K_Bal),DUP,NOCASE,OPT
KeyGasAnNotta            KEY(DHPA:NoPeriksa,DHPA:K_GasAnes),DUP,NOCASE,OPT
KeyLainNotta             KEY(DHPA:NoPeriksa,DHPA:K_AlLain),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NoPeriksa                   STRING(12)
Nomor_mr                    LONG
KodeDiagnosa                LONG
KodeRegion                  LONG
DiagTambah                  LONG
Keracunan                   STRING(30)
Kecelakaan                  STRING(30)
Lokasi                      STRING(40)
TanggalMasuk                DATE
Jammasuk                    TIME
TanggalKeluar               DATE
JamKeluar                   TIME
StatusPP                    STRING(3)
Ruang                       STRING(10)
Dokter_OP                   STRING(32)
Dok_anes                    STRING(32)
Tanggungan                  STRING(20)
Tindakan                    STRING(20)
TindakanAkhir               LONG
SewaTpInsBed                BYTE
NmSewaTpInsBed              STRING(15)
NmOperasi                   STRING(20)
SewaMesAnes                 BYTE
NmSewaMesAnes               STRING(15)
PengObatAlat                REAL
Sifat                       STRING(1)
Pembayaran                  BYTE
KodeKtr                     BYTE
StatusLunas                 BYTE
StatusCetakKerja            BYTE
K_OBATOBATAN                BYTE
K_alSunIn                   BYTE
K_Benjah                    BYTE
K_Bal                       BYTE
K_GasAnes                   BYTE
K_AlLain                    BYTE
TotalBiySewDoc              REAL
TotalBiyOp                  REAL
TotalBiyAnes                REAL
TotalBiySewIBed             REAL
TotalBiySewMes              REAL
TotalBiyObat                REAL
TotalBiyASunIn              REAL
TotalBiyBenJah              REAL
TotalBiyBal                 REAL
TotalBiyGas                 REAL
TotalBiyLain                REAL
TotalBiySEL_ALAT            REAL
TotalBiySeluruh             REAL
User                        STRING(20)
                         END
                     END                       

IKKelas              FILE,DRIVER('SQLAnywhere'),NAME('dba.IKKelas'),PRE(IKTB),CREATE,BINDABLE,THREAD
KeyKodeKelas             KEY(IKTB:KodeKelas),NOCASE,OPT,PRIMARY
KeyKontraktor            KEY(IKTB:Kontrak),DUP,NOCASE,OPT
Record                   RECORD,PRE()
KodeKelas                   STRING(10)
Kontrak                     STRING(10)
Prosen                      REAL
BiayaRawat                  REAL
BiayaRawatBy                REAL
VisiteRSI                   REAL
VisiteDokter                REAL
User                        STRING(10)
Tanggal                     DATE
                         END
                     END                       

ROGFpmpd             FILE,DRIVER('SQLAnywhere'),NAME('dba.ROGFpmpd'),PRE(RoF),CREATE,BINDABLE,THREAD
KeyKode_inspmpd          KEY(RoF:Kode_tempat),DUP,NOCASE,OPT
keykd_barang_pmpd        KEY(RoF:Kode_brg,RoF:Kode_tempat),NOCASE,OPT,PRIMARY
key_kd_brg               KEY(RoF:Kode_brg),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Kode_tempat                 STRING(5)
Kode_brg                    STRING(10)
Saldo_Minimal               REAL
Saldo                       REAL
Harga_Dasar                 REAL
                         END
                     END                       

LAdaMemo             FILE,DRIVER('SQLAnywhere'),NAME('dba.LAdaMemo'),PRE(LADA),CREATE,BINDABLE,THREAD
KeyNomorNotta            KEY(LADA:NomorNotta),NOCASE,OPT
KeyAda                   KEY(LADA:Ada),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NomorNotta                  STRING(12)
Ada                         BYTE
KetMemo                     STRING(255)
                         END
                     END                       

LDLAB                FILE,DRIVER('SQLAnywhere'),NAME('dba.LDLAB'),PRE(LDL),CREATE,BINDABLE,THREAD
KeyGKodeLab              KEY(LDL:GKodeLab),DUP,NOCASE,OPT
KeyNamaJenisPeriksa      KEY(LDL:NamaJPeriksa),DUP,NOCASE,OPT
KeyKodeLab               KEY(LDL:KodeLab),NOCASE,OPT
KeySGLab                 KEY(LDL:SubGLab),DUP,NOCASE,OPT
KeyGk_Kode               KEY(LDL:GKodeLab,LDL:KodeLab),DUP,NOCASE,OPT
KeyGK_Nama               KEY(LDL:GKodeLab,LDL:NamaJPeriksa),DUP,NOCASE,OPT
Record                   RECORD,PRE()
GKodeLab                    STRING(5)
SubGLab                     STRING(7)
KodeLab                     STRING(7)
No                          BYTE
NamaJPeriksa                STRING(32)
SATUAN                      STRING(20)
LEVEL                       BYTE
NORMAL                      STRING(40)
BIAYA_2                     REAL
TOTAL                       USHORT
LevelHasil                  BYTE
AdaMemo                     BYTE
KETERANGAN                  STRING(40)
Biaya_0                     REAL
Biaya_1                     REAL
Biaya_3                     REAL
                         END
                     END                       

RI_DBSBBK            FILE,DRIVER('SQLAnywhere'),NAME('dba.RI_DBSBBK'),PRE(RI_DSB1),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(RI_DSB1:Nomor,RI_DSB1:Kode_brg,RI_DSB1:Camp),OPT,PRIMARY
by_transaksi             KEY(RI_DSB1:Nomor),DUP,OPT
Barang_RI_DSBBK_FK       KEY(RI_DSB1:Kode_brg),DUP,OPT
by_tran_cam              KEY(RI_DSB1:Nomor,RI_DSB1:Camp),DUP,OPT
Record                   RECORD,PRE()
Nomor                       STRING(15)
Kode_brg                    STRING(10)
Camp                        ULONG
Jumlah                      REAL
Harga_Dasar                 REAL
Total                       LONG
Diskon                      REAL
                         END
                     END                       

SubGrouplab          FILE,DRIVER('SQLAnywhere'),NAME('dba.SubGrouplab'),PRE(SGL),CREATE,BINDABLE,THREAD
KeySGKodeLab             KEY(SGL:KodeSGLab),DUP,NOCASE,OPT
KeyGKodeGroup            KEY(SGL:KodeGroup),DUP,NOCASE,OPT
Record                   RECORD,PRE()
KodeGroup                   STRING(5)
KodeSGLab                   STRING(6)
No                          STRING(5)
JenisSubGroup               STRING(25)
                         END
                     END                       

RoPasiCt             FILE,DRIVER('SQLAnywhere'),NAME('dba.RoPasiCt'),PRE(ROPA1),CREATE,BINDABLE,THREAD
KeyNomorMr               KEY(ROPA1:Nomor_Mr),DUP,NOCASE,OPT
KeyNoNota                KEY(ROPA1:NoNota),DUP,OPT
KeyNoUrut                KEY(ROPA1:NoUrut),DUP,OPT
KeyTanggal               KEY(ROPA1:Tanggal),DUP,NOCASE,OPT
KeyKodeBrg               KEY(ROPA1:Kode_Brg),DUP,OPT
KeyHasil                 KEY(ROPA1:Hasil),DUP,OPT
KeyRuangKlinik           KEY(ROPA1:Ruang_Klinik),DUP,OPT
KeyPeriksa               KEY(ROPA1:Periksa),DUP,OPT
KeyNoUrutNoMR            KEY(ROPA1:NoUrut,ROPA1:Nomor_Mr),DUP,NOCASE,OPT
KEYNOUrutNoMRBrg         KEY(ROPA1:NoUrut,ROPA1:Nomor_Mr,ROPA1:kodeFilm,ROPA1:Kode_Brg,ROPA1:statusbarang),NOCASE,OPT,PRIMARY
keykodefilm              KEY(ROPA1:kodeFilm),DUP,NOCASE,OPT
keykodefilmKodeBrg       KEY(ROPA1:kodeFilm,ROPA1:Kode_Brg),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_Mr                    LONG
NoUrut                      STRING(12)
Tanggal                     DATE
Jam                         TIME
Rawat                       STRING(2)
Periksa                     STRING(20)
Kode_Brg                    STRING(10)
Jumlah                      REAL
Biaya                       REAL
Hasil                       STRING(20)
NoNota                      STRING(10)
KodeTempat                  STRING(10)
Pembayaran                  BYTE
Selesai                     STRING(1)
Ruang_Klinik                STRING(10)
Kelas                       STRING(10)
AdaMemo                     STRING(1)
User                        STRING(10)
statusbarang                BYTE
PMPD                        STRING(5)
Tanggalhasil                DATE
JamHasil                    TIME
kodeFilm                    STRING(10)
RSI                         REAL
Konsul                      REAL
Opr                         REAL
                         END
                     END                       

RI_HBSBBK            FILE,DRIVER('SQLAnywhere'),NAME('dba.RI_HBSBBK'),PRE(RI_HSB1),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(RI_HSB1:Nomor),OPT,PRIMARY
pasien_ri_hsbbk_fk       KEY(RI_HSB1:Nomor_mr),DUP,NOCASE,OPT
Instalasi_ri_hsbbk_fk    KEY(RI_HSB1:Kode_Inst),DUP,OPT
keytanggal               KEY(RI_HSB1:Tanggal),DUP,NOCASE,OPT
Aptotik_rihsbbk_fk       KEY(RI_HSB1:Apotik),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor                       STRING(15)
Nomor_mr                    LONG
Tanggal                     DATE
Biaya                       LONG
Bayar                       BYTE
cara_bayar                  BYTE
Kode_Inst                   STRING(5)
Batal                       BYTE
User                        STRING(4)
Keterangan                  STRING(20)
Apotik                      STRING(5)
                         END
                     END                       

FileSql              FILE,DRIVER('SQLAnywhere'),NAME('dba.FileSql'),PRE(FIL),CREATE,BINDABLE,THREAD
PrimaryKey               KEY(FIL:FString1,FIL:FReal1,FIL:FLong1),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
FString1                    STRING(1000)
FString2                    STRING(20)
FString3                    STRING(1000)
FLong1                      LONG
FLong2                      LONG
FReal1                      REAL
FReal2                      REAL
FShort                      SHORT
FByte                       BYTE
FDate                       DATE
FTime                       TIME
                         END
                     END                       

RoPcsRJ              FILE,DRIVER('SQLAnywhere'),NAME('dba.RoPcsRJ'),PRE(RPCJ),CREATE,BINDABLE,THREAD
KeyNoUrut                KEY(RPCJ:NoUrut),OPT,PRIMARY
keydokkonsul             KEY(RPCJ:Dokkon),DUP,NOCASE,OPT
KeyNama                  KEY(RPCJ:Nama),DUP,OPT
KeyTanggal               KEY(RPCJ:Tanggal),DUP,NOCASE,OPT
KeyNoUrutNoMR            KEY(RPCJ:NoUrut,RPCJ:Nomor_MR),DUP,NOCASE,OPT
keyNomorMr               KEY(RPCJ:Nomor_MR),DUP,NOCASE,OPT
keyDokter                KEY(RPCJ:Dokter),DUP,NOCASE,OPT
keytempat                KEY(RPCJ:PMPD),DUP,NOCASE,OPT
keyPetugas               KEY(RPCJ:Petugas),DUP,NOCASE,OPT
keyTempatpmpdNoUrut      KEY(RPCJ:PMPD,RPCJ:NoUrut),DUP,NOCASE,OPT
KeytempatpmpdMR          KEY(RPCJ:PMPD,RPCJ:Nomor_MR),DUP,NOCASE,OPT
keytempatpmpdnama        KEY(RPCJ:PMPD,RPCJ:Nama),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_MR                    LONG
NoUrut                      STRING(12)
Nama                        STRING(35)
TanggalLahir                DATE
Umur                        LONG
Umur_Bln                    BYTE
Jenis_kelamin               STRING(1)
Alamat                      STRING(35)
Tanggal                     DATE
Jam                         TIME
User                        STRING(10)
Suruh                       STRING(20)
keterangan                  STRING(40)
NoNota                      STRING(10)
KodeTempat                  STRING(10)
Pembayaran                  BYTE
Ruang_Klinik                STRING(10)
Kelas                       STRING(10)
TotalBiaya                  REAL
adagagal                    BYTE
statuspasien                BYTE
Dokter                      STRING(12)
Klinis                      STRING(60)
sifat                       STRING(10)
PMPD                        STRING(20)
Lamabaru                    STRING(5)
NoFilm                      STRING(20)
Petugas                     STRING(20)
Opr                         REAL
Film                        STRING(10)
Jumlah                      BYTE
Gagal                       BYTE
KonEva                      STRING(12)
KonOral                     STRING(20)
WU                          LONG
Instalasi                   STRING(20)
G2430                       BYTE
G1824                       BYTE
Ggigi                       BYTE
RSI                         REAL
Konsul                      REAL
statuslunas                 BYTE
Dokkon                      STRING(12)
                         END
                     END                       

RoMemo               FILE,DRIVER('SQLAnywhere'),NAME('dba.RoMemo'),PRE(ROME),CREATE,BINDABLE,THREAD
KeyNoNota                KEY(ROME:NoNota,ROME:Tanggal,ROME:Memo),OPT,PRIMARY
KeyNomorMr               KEY(ROME:Nomor_Mr),DUP,NOCASE,OPT
KeyTanggal               KEY(ROME:Tanggal),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NoNota                      STRING(10)
Nomor_Mr                    LONG
Tanggal                     DATE
Memo                        CSTRING(150)
Jam                         TIME
User                        STRING(10)
                         END
                     END                       

RoPasHas             FILE,DRIVER('SQLAnywhere'),NAME('dba.RoPasHas'),PRE(RPHA),CREATE,BINDABLE,THREAD
KeyNoNota                KEY(RPHA:NoNota,RPHA:Hasil),OPT,PRIMARY
KeyTanggal               KEY(RPHA:Tanggal),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NoNota                      STRING(10)
Hasil                       STRING(30)
Jam                         TIME
Tanggal                     DATE
User                        STRING(10)
                         END
                     END                       

RoTbPem              FILE,DRIVER('SQLAnywhere'),NAME('dba.RoTbPem'),PRE(ROTP),CREATE,BINDABLE,THREAD
KeyPeriksa               KEY(ROTP:Periksa),OPT,PRIMARY
Record                   RECORD,PRE()
Periksa                     STRING(20)
                         END
                     END                       

RoStok               FILE,DRIVER('SQLAnywhere'),NAME('dba.RoStok'),PRE(RSTO),CREATE,BINDABLE,THREAD
KeyKodeBrg               KEY(RSTO:Kode_Brg,RSTO:KodeTempat,RSTO:tgltrans,RSTO:jam),NOCASE,OPT,PRIMARY
KeyTempat                KEY(RSTO:KodeTempat),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Kode_Brg                    STRING(10)
debet                       REAL
kredit                      REAL
opname                      REAL
KodeTempat                  STRING(10)
noTrans                     STRING(12)
tgltrans                    STRING(20)
jam                         TIME
tglupdate                   STRING(20)
jamupdate                   TIME
user                        STRING(12)
keterangan                  STRING(60)
                         END
                     END                       

RoPasien             FILE,DRIVER('SQLAnywhere'),NAME('dba.RoPasien'),PRE(ROPA),CREATE,BINDABLE,THREAD
KeyNomorMr               KEY(ROPA:Nomor_Mr),DUP,NOCASE,OPT
KeyNoNota                KEY(ROPA:NoNota),DUP,OPT
KeyNoUrut                KEY(ROPA:NoUrut),DUP,OPT
KeyTanggal               KEY(ROPA:Tanggal),DUP,NOCASE,OPT
KeyKodeBrg               KEY(ROPA:Kode_Brg),DUP,OPT
KeyHasil                 KEY(ROPA:Hasil),DUP,OPT
KeyRuangKlinik           KEY(ROPA:Ruang_Klinik),DUP,OPT
KeyPeriksa               KEY(ROPA:Periksa),DUP,OPT
KeyNoUrutNoMR            KEY(ROPA:NoUrut,ROPA:Nomor_Mr),DUP,NOCASE,OPT
KEYNOUrutNoMRBrg         KEY(ROPA:NoUrut,ROPA:Nomor_Mr,ROPA:kodeFilm,ROPA:Kode_Brg,ROPA:statusbarang),NOCASE,OPT,PRIMARY
keykodefilm              KEY(ROPA:kodeFilm),DUP,NOCASE,OPT
keykodefilmKodeBrg       KEY(ROPA:kodeFilm,ROPA:Kode_Brg),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_Mr                    LONG
NoUrut                      STRING(12)
Tanggal                     DATE
Jam                         TIME
Rawat                       BYTE
Periksa                     STRING(20)
Kode_Brg                    STRING(10)
Jumlah                      REAL
Biaya                       REAL
Hasil                       STRING(20)
NoNota                      STRING(10)
KodeTempat                  STRING(10)
Pembayaran                  BYTE
Selesai                     STRING(1)
Ruang_Klinik                STRING(10)
Kelas                       STRING(10)
AdaMemo                     STRING(1)
User                        STRING(10)
statusbarang                BYTE
PMPD                        STRING(5)
Tanggalhasil                DATE
JamHasil                    TIME
kodeFilm                    STRING(10)
RSI                         REAL
Konsul                      REAL
Opr                         REAL
                         END
                     END                       

RoPasRJ              FILE,DRIVER('SQLAnywhere'),NAME('dba.RoPasRJ'),PRE(RPRJ),CREATE,BINDABLE,THREAD
KeyNoUrut                KEY(RPRJ:NoUrut),OPT,PRIMARY
keydokkonsul             KEY(RPRJ:Dokkon),DUP,NOCASE,OPT
KeyNama                  KEY(RPRJ:Nama),DUP,OPT
KeyTanggal               KEY(RPRJ:Tanggal),DUP,NOCASE,OPT
KeyNoUrutNoMR            KEY(RPRJ:NoUrut,RPRJ:Nomor_MR),DUP,NOCASE,OPT
keyNomorMr               KEY(RPRJ:Nomor_MR),DUP,NOCASE,OPT
keyDokter                KEY(RPRJ:Dokter),DUP,NOCASE,OPT
keytempat                KEY(RPRJ:PMPD),DUP,NOCASE,OPT
keyTempatpmpdNoUrut      KEY(RPRJ:PMPD,RPRJ:NoUrut),DUP,NOCASE,OPT
keyTempatpmpdMR          KEY(RPRJ:PMPD,RPRJ:Nomor_MR),DUP,NOCASE,OPT
keyTempatpmpdNama        KEY(RPRJ:PMPD,RPRJ:Nama),DUP,NOCASE,OPT
keypetugas               KEY(RPRJ:Petugas),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_MR                    LONG
NoUrut                      STRING(12)
Nama                        STRING(35)
TanggalLahir                DATE
Umur                        LONG
Umur_Bln                    BYTE
Jenis_kelamin               STRING(1)
Alamat                      STRING(35)
Tanggal                     DATE
Jam                         TIME
User                        STRING(10)
Suruh                       STRING(20)
keterangan                  STRING(40)
NoNota                      STRING(10)
KodeTempat                  STRING(10)
Pembayaran                  BYTE
Ruang_Klinik                STRING(10)
Kelas                       STRING(10)
TotalBiaya                  REAL
adagagal                    BYTE
statuspasien                BYTE
Dokter                      STRING(12)
Tindakan                    STRING(60)
sifat                       STRING(10)
PMPD                        STRING(20)
Lamabaru                    STRING(5)
NoFilm                      STRING(20)
F3535                       BYTE
F3040                       BYTE
F2430                       BYTE
F1824                       BYTE
Fgigi                       BYTE
G3535                       BYTE
G3040                       BYTE
G2430                       BYTE
G1824                       BYTE
Ggigi                       BYTE
RSI                         REAL
Konsul                      REAL
Opr                         REAL
statuslunas                 BYTE
Dokkon                      STRING(12)
Petugas                     STRING(20)
instalasi                   STRING(10)
                         END
                     END                       

RoPasRIXXX           FILE,DRIVER('SQLAnywhere'),NAME('dba.RoPasRJ'),PRE(RPRI),CREATE,BINDABLE,THREAD
KeyNoUrut                KEY(RPRI:NoUrut),OPT,PRIMARY
KeyNama                  KEY(RPRI:Nama),DUP,OPT
KeyTanggal               KEY(RPRI:Tanggal),DUP,NOCASE,OPT
KeyNoUrutNoMR            KEY(RPRI:NoUrut,RPRI:Nomor_MR),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_MR                    LONG
NoUrut                      STRING(10)
Nama                        STRING(35)
TanggalLahir                DATE
Umur                        LONG
Umur_Bln                    BYTE
Jenis_kelamin               STRING(1)
Alamat                      STRING(35)
Tanggal                     DATE
Jam                         TIME
User                        STRING(10)
Suruh                       STRING(20)
keterangan                  STRING(40)
NoNota                      STRING(10)
KodeTempat                  STRING(10)
Pembayaran                  BYTE
Ruang_Klinik                STRING(10)
Kelas                       STRING(10)
TotalBiaya                  REAL
adabatal                    BYTE
                         END
                     END                       

IVisitDr             FILE,DRIVER('SQLAnywhere'),NAME('dba.IVisitDr'),PRE(IVID),CREATE,BINDABLE,THREAD
KeyNoMrRuang             KEY(IVID:Nomor_mr,IVID:Ruang,IVID:tanggal),NOCASE,OPT,PRIMARY
KeyKodeDr                KEY(IVID:KodeDokter),DUP,NOCASE,OPT
KeyTanggal               KEY(IVID:tanggal),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_mr                    LONG
KodeDokter                  STRING(10)
Tanggalawal                 DATE
Tanggalakhir                DATE
Biaya                       REAL
JumlahVisite                USHORT
VisiteTotal                 REAL
user                        STRING(10)
tanggal                     DATE
Jam                         TIME
Ruang                       STRING(10)
Kelas                       STRING(10)
                         END
                     END                       

ITindak              FILE,DRIVER('SQLAnywhere'),NAME('dba.ITindak'),PRE(ITIN),CREATE,BINDABLE,THREAD
KeyNoMrRuang             KEY(ITIN:Nomor_mr,ITIN:Ruang),NOCASE,OPT,PRIMARY
KeyKodeTindakan          KEY(ITIN:KodeTind),DUP,NOCASE,OPT
KeyNoMrSaja              KEY(ITIN:Nomor_mr),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Nomor_mr                    LONG
Ruang                       STRING(10)
KodeTind                    STRING(10)
Tarif                       REAL
User                        STRING(10)
Tanggal                     DATE
Jam                         TIME
                         END
                     END                       

IDaftarPPSP          FILE,DRIVER('SQLAnywhere'),NAME('dba.IDaftarPPSP'),PRE(IDAP),CREATE,BINDABLE,THREAD
KeyKodeItem              KEY(IDAP:KodeItem),NOCASE,OPT
KeyNamaItem              KEY(IDAP:NamaItem),DUP,NOCASE,OPT
Record                   RECORD,PRE()
KodeItem                    STRING(10)
NamaItem                    STRING(45)
HargaStandarP2SP            REAL
Stok                        REAL
                         END
                     END                       

TBinstli             FILE,DRIVER('SQLAnywhere'),NAME('dba.TBinstli'),PRE(TBis),CREATE,BINDABLE,THREAD
keykodeins               KEY(TBis:Kode_Instalasi),NOCASE,OPT,PRIMARY
keynamains               KEY(TBis:Nama_instalasi),DUP,NOCASE,OPT
key_ins_ins              KEY(TBis:Jenis_ins),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Kode_Instalasi              STRING(5)
Nama_instalasi              STRING(30)
Jenis_ins                   STRING(5)
InstalasiNota               STRING(40)
Status                      BYTE
Keterangan                  STRING(20)
                         END
                     END                       

ApObInst             FILE,DRIVER('SQLAnywhere'),NAME('dba.ApObInst'),PRE(APOB),CREATE,BINDABLE,THREAD
KeyKode_ins              KEY(APOB:Kode_Instalasi),DUP,NOCASE,OPT
keykd_barang             KEY(APOB:Kode_brg,APOB:Kode_Instalasi),NOCASE,OPT,PRIMARY
key_kd_brg               KEY(APOB:Kode_brg),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Kode_Instalasi              STRING(5)
Kode_brg                    STRING(10)
Saldo_Minimal               REAL
Saldo                       REAL
Harga_Dasar                 REAL
status                      BYTE
                         END
                     END                       

IHNotaSm             FILE,DRIVER('SQLAnywhere'),NAME('dba.IHNotaSm'),PRE(IHNS),CREATE,BINDABLE,THREAD
KeyNoNota                KEY(IHNS:No_Nota),NOCASE,OPT,PRIMARY
KeyNomorMr               KEY(IHNS:Nomor_mr),DUP,NOCASE,OPT
KeyNoMrNota              KEY(IHNS:No_Nota,IHNS:Nomor_mr),DUP,NOCASE,OPT
Record                   RECORD,PRE()
No_Nota                     STRING(10)
Nomor_mr                    LONG
Tanggal_Masuk               DATE
Tanggal_Keluar              DATE
Tanggungan                  STRING(30)
LastRoom                    STRING(20)
Keterangan                  STRING(100)
TotalPerawatan              REAL
TotalVisiteDr               REAL
TotalObat                   REAL
TotalTindakan               REAL
TotalPemakaianAlat          REAL
TotalPPSP                   REAL
TotalGizi                   REAL
TotalTelepon                REAL
BiayaLain                   REAL
Total                       REAL
SudahTerbayar               REAL
BelumTerbayar               REAL
KeteranganBiayaLain         STRING(60)
                         END
                     END                       

TBTransResepDokterEtiket FILE,DRIVER('SQLAnywhere'),NAME('dba.TBTransResepDokterEtiket'),PRE(TBT1),CREATE,BINDABLE,THREAD
PK                       KEY(TBT1:NoTrans,TBT1:ItemCode,TBT1:KodeEtiket),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
NoTrans                     STRING(20)
ItemCode                    STRING(15)
KodeEtiket                  STRING(15)
NamaEtiket                  STRING(50)
Pemakaian                   REAL
                         END
                     END                       

TBTransResepDokterHeader FILE,DRIVER('SQLAnywhere'),NAME('dba.TBTransResepDokterHeader'),PRE(TBT2),CREATE,BINDABLE,THREAD
PK                       KEY(TBT2:NoTrans),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
NoTrans                     STRING(20)
KodeReg                     STRING(15)
KodePasien                  STRING(15)
KodeDokter                  STRING(15)
Tanggal                     DATE
Jam                         TIME
Her                         SHORT
Status                      BYTE
                         END
                     END                       

TBTransResepDokterHeader_RI FILE,DRIVER('SQLAnywhere'),NAME('dba.TBTransResepDokterHeader_RI'),PRE(TBT21),CREATE,BINDABLE,THREAD
PK                       KEY(TBT21:NoTrans),NOCASE,OPT,PRIMARY
JPasien_TBTTransEpreRanap_FK KEY(TBT21:KodePasien),DUP,NOCASE,OPT
koderuang_epreranap_fk   KEY(TBT21:KodeRuang),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NoTrans                     STRING(20)
KodeReg                     STRING(15)
KodePasien                  STRING(15)
KodeDokter                  STRING(15)
Tanggal                     DATE
Jam                         TIME
Her                         SHORT
Status                      BYTE
UmurPerkiraan               LONG
BeratBadan                  LONG
Alergi                      STRING(50)
StatusObat                  BYTE
KodeRuang                   STRING(10)
                         END
                     END                       

TBTransResepDokterHeader_RIHarian FILE,DRIVER('SQLAnywhere'),NAME('dba.TBTransResepDokterHeader_RIHarian'),PRE(TBT211),CREATE,BINDABLE,THREAD
PK                       KEY(TBT211:NoTrans,TBT211:Tanggal),NOCASE,OPT,PRIMARY
PrioritasNoTrans_TBTTransRanap_IK KEY(TBT211:Tanggal,TBT211:Prioritas,TBT211:NoTrans),DUP,NOCASE,OPT
NoTrans_Key              KEY(TBT211:NoTrans),DUP,NOCASE,OPT
koderuang_epreranapharian_fk KEY(TBT211:KodeRuang),DUP,NOCASE,OPT
Record                   RECORD,PRE()
NoTrans                     STRING(20)
Tanggal                     DATE
Jam                         TIME
Operator                    STRING(20)
Status                      BYTE
Prioritas                   BYTE
Pending                     BYTE
NomorMR                     STRING(20)
NamaPasien                  STRING(40)
KodeRuang                   STRING(10)
                         END
                     END                       

TBTransResepObatCampur FILE,DRIVER('SQLAnywhere'),NAME('dba.TBTransResepObatCampur'),PRE(TBT3),CREATE,BINDABLE,THREAD
PK                       KEY(TBT3:NoTrans,TBT3:ItemCode),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
NoTrans                     STRING(20)
ItemCode                    STRING(15)
ItemName                    STRING(100)
Qty                         REAL
Unit                        STRING(10)
Nomor                       REAL
ItemCode1                   STRING(15)
                         END
                     END                       

TBTransResepItter    FILE,DRIVER('SQLAnywhere'),NAME('dba.TBTransResepItter'),PRE(TBT4),CREATE,BINDABLE,THREAD
PK                       KEY(TBT4:NoTrans,TBT4:ItemCode),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
NoTrans                     STRING(20)
ItemCode                    STRING(15)
Itter                       LONG
                         END
                     END                       

UHksRjln             FILE,DRIVER('SQLAnywhere'),NAME('dba.UHksRjln'),PRE(UHK),CREATE,BINDABLE,THREAD
KMrNota                  KEY(UHK:Mr,UHK:Nota),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
Mr                          LONG
Nota                        STRING(20)
Tgl                         DATE
Ket                         STRING(70)
StatusPmb                   BYTE
                         END
                     END                       

UtmptRj              FILE,DRIVER('SQLAnywhere'),NAME('dba.UJtmptRj'),PRE(UJT),CREATE,BINDABLE,THREAD
MrNotaTmpat              KEY(UJT:Mr,UJT:Nota,UJT:KodeTmpat),NOCASE,OPT,PRIMARY
Record                   RECORD,PRE()
Mr                          LONG
Nota                        STRING(20)
KodeTmpat                   STRING(20)
BiayaTempat                 REAL
KetTmpat                    STRING(20)
Dokter                      STRING(20)
BiayaDr                     REAL
KetDr                       STRING(20)
                         END
                     END                       

UDksRjln             FILE,DRIVER('SQLAnywhere'),NAME('dba.UDksRjln'),PRE(UKS),CREATE,BINDABLE,THREAD
K1                       KEY(UKS:Mr,UKS:NoNota,UKS:KodeTempat,UKS:Kodejasa),NOCASE,OPT,PRIMARY
KJasa                    KEY(UKS:Kodejasa),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Mr                          LONG
Tgl                         DATE
KodeTempat                  STRING(20)
Kodejasa                    STRING(10)
NoNota                      STRING(20)
Ket1                        STRING(20)
Ket2                        STRING(60)
Biaya                       REAL
jml                         REAL
                         END
                     END                       

UJMan                FILE,DRIVER('SQLAnywhere'),NAME('dba.UJMan'),PRE(UJM),CREATE,BINDABLE,THREAD
Key_KsaPoliKwit          KEY(UJM:Kasa,UJM:Poli,UJM:Kwitansi),NOCASE,OPT,PRIMARY
K_POLI                   KEY(UJM:Poli),DUP,NOCASE,OPT
KKasa                    KEY(UJM:Kasa),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Kasa                        STRING(20)
Poli                        STRING(20)
Kwitansi                    STRING(20)
tgl                         DATE
Ket                         STRING(50)
user                        STRING(20)
tgl_update                  DATE
JamUpdt                     TIME
Pembayaran                  BYTE
Biaya_dr                    REAL
biaya_rsi                   REAL
jmlpasen                    BYTE
                         END
                     END                       

AFIFOIN              FILE,DRIVER('SQLAnywhere'),NAME('DBA.AFIFOIN'),PRE(AFI),BINDABLE,THREAD
KEY1                     KEY(AFI:Kode_Barang,AFI:Mata_Uang,AFI:NoTransaksi,AFI:Transaksi,AFI:Kode_Apotik),PRIMARY
KeyBarangFIFOIN          KEY(AFI:Kode_Barang),DUP,NOCASE,OPT
BrgNoTransApotikKey      KEY(AFI:Kode_Barang,AFI:NoTransaksi,AFI:Kode_Apotik),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Kode_Barang                 STRING(10),NAME('Kode_Barang')
Mata_Uang                   STRING(5),NAME('Mata_Uang')
NoTransaksi                 STRING(15),NAME('NoTransaksi')
Transaksi                   BYTE,NAME('Transaksi')
Tanggal                     DATE,NAME('Tanggal')
Harga                       REAL,NAME('Harga')
Jumlah                      REAL,NAME('Jumlah')
Jumlah_Keluar               REAL,NAME('Jumlah_Keluar')
Tgl_Update                  DATE,NAME('Tgl_Update')
Jam_Update                  TIME,NAME('Jam_Update')
Operator                    STRING(20),NAME('Operator')
Jam                         TIME,NAME('Jam')
Kode_Apotik                 STRING(5),NAME('Kode_Apotik')
Status                      BYTE
ExpireDate                  DATE
                         END
                     END                       

AFIFOOUT             FILE,DRIVER('SQLAnywhere'),NAME('DBA.AFIFOOUT'),PRE(AFI2),BINDABLE,THREAD
KEY1                     KEY(AFI2:Kode_Barang,AFI2:Mata_Uang,AFI2:NoTransaksi,AFI2:Transaksi,AFI2:Kode_Apotik,AFI2:NoTransKeluar),PRIMARY
Record                   RECORD,PRE()
Kode_Barang                 STRING(10),NAME('Kode_Barang')
Mata_Uang                   STRING(5),NAME('Mata_Uang')
NoTransaksi                 STRING(15),NAME('NoTransaksi')
Transaksi                   BYTE,NAME('Transaksi')
NoTransKeluar               STRING(15),NAME('NoTransKeluar')
Tanggal                     DATE,NAME('Tanggal')
Harga                       REAL,NAME('Harga')
Jumlah                      REAL,NAME('Jumlah')
Tgl_Update                  DATE,NAME('Tgl_Update')
Jam_Update                  TIME,NAME('Jam_Update')
Operator                    STRING(20),NAME('Operator')
Jam                         TIME,NAME('Jam')
Kode_Apotik                 STRING(5),NAME('Kode_Apotik')
                         END
                     END                       

APKStok              FILE,DRIVER('SQLAnywhere'),NAME('DBA.APKStok'),PRE(APK),BINDABLE,THREAD
KEY1                     KEY(APK:Kode_Barang,APK:Tanggal,APK:Transaksi,APK:NoTransaksi,APK:Kode_Apotik),PRIMARY
BrgTanggalJamFKApKStok   KEY(APK:Kode_Barang,APK:Tanggal,APK:Jam,APK:NoTransaksi),DUP,NOCASE,OPT
KeyBarangAPKSTOK         KEY(APK:Kode_Barang),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Kode_Barang                 STRING(10),NAME('Kode_Barang')
Tanggal                     DATE,NAME('Tanggal')
Jam                         TIME,NAME('Jam')
Transaksi                   STRING(50),NAME('Transaksi')
NoTransaksi                 STRING(15),NAME('NoTransaksi')
Debet                       REAL,NAME('Debet')
Kredit                      REAL,NAME('Kredit')
Opname                      REAL,NAME('Opname')
Kode_Apotik                 STRING(5),NAME('Kode_Apotik')
Status                      BYTE
                         END
                     END                       

APDTRANSDet          FILE,DRIVER('SQLAnywhere'),NAME('DBA.APDTRANSDet'),PRE(APD2),BINDABLE,THREAD
KEY1                     KEY(APD2:N0_tran,APD2:Kode_brg,APD2:Camp),PRIMARY
Keterangan_Apdtransdet   KEY(APD2:Keterangan),DUP,NOCASE,OPT
keterangan2_apdtransdet_key KEY(APD2:Keterangan2),DUP,NOCASE,OPT
Record                   RECORD,PRE()
N0_tran                     STRING(15),NAME('N0_tran')
Kode_brg                    STRING(10),NAME('Kode_brg')
Keterangan                  BYTE,NAME('Keterangan')
Camp                        LONG,NAME('Camp')
Jumlah1                     STRING(10)
Jumlah2                     STRING(10)
Keterangan2                 BYTE
                         END
                     END                       

Apetiket             FILE,DRIVER('SQLAnywhere'),NAME('DBA.Apetiket'),PRE(Ape),BINDABLE,THREAD
KEY1                     KEY(Ape:No),PRIMARY
nama_etiket_key          KEY(Ape:Nama),DUP,NOCASE,OPT
Record                   RECORD,PRE()
No                          BYTE,NAME('No')
Nama                        STRING(30),NAME('Nama')
                         END
                     END                       

HM_BRGLOGISTIK       FILE,DRIVER('SQLAnywhere'),NAME('DBA.HM_BRGLOGISTIK'),PRE(HM_2),BINDABLE,THREAD
Record                   RECORD,PRE()
Column1                     CSTRING(255)
Column2                     CSTRING(255)
Column3                     CSTRING(255)
Column4                     CSTRING(255)
Column5                     CSTRING(255)
Column6                     CSTRING(255)
Column7                     CSTRING(255)
Column8                     SREAL
                         END
                     END                       

GBarangA             FILE,DRIVER('SQLAnywhere'),NAME('dba.GBarang'),PRE(GBA2),CREATE,BINDABLE,THREAD
keyNamaKandungan         KEY(GBA2:Ket2),DUP,NOCASE,OPT
KeyKodeBrg               KEY(GBA2:Kode_brg),NAME('KeyKodeBrg'),OPT,PRIMARY
KeyNama                  KEY(GBA2:Nama_Brg),DUP,NAME('KeyNama'),OPT
KeyKodeUPF               KEY(GBA2:Kode_UPF),DUP,OPT
KeyKodeKelompok          KEY(GBA2:Kelompok),DUP,NOCASE,OPT
KeyKodeAsliBrg           KEY(GBA2:Kode_Asli),DUP,NOCASE,OPT
Barcode_GBarang_FK       KEY(GBA2:KodeBarcode),DUP,NOCASE,OPT
Ket1_gbarang_fk          KEY(GBA2:Ket1),DUP,NOCASE,OPT
KeyKodeKandungan         KEY(GBA2:Kandungan),DUP,NOCASE,OPT
Record                   RECORD,PRE()
Kode_brg                    STRING(10)
Nama_Brg                    STRING(40)
Jenis_Brg                   STRING(5)
No_Satuan                   STRING(10)
Dosis                       ULONG
Stok_Total                  REAL
Kode_UPF                    STRING(10)
Kode_Apotik                 STRING(5)
Kelompok                    LONG
Status                      BYTE
Kode_Asli                   STRING(10)
KetSatuan                   STRING(20)
KelBesar                    STRING(1)
StatusGen                   BYTE
Sediaan                     STRING(2)
Farmakolog                  STRING(2)
StatusBeli                  BYTE
Pabrik                      STRING(2)
Fungsi                      STRING(2)
Ket1                        STRING(50)
Ket2                        STRING(50)
Kode_Principal              STRING(3)
KodeBarcode                 STRING(30)
Harga                       REAL
Golongan                    STRING(40)
Kandungan                   STRING(40)
SatuanBeli                  STRING(10)
Konversi                    REAL
FarNonFar                   BYTE
                         END
                     END                       


!EVENT:Disable_BPB     EQUATE(401h)
!EVENT:Enable_BPB      EQUATE(402h)
!
EVENT:Disable_RJalan     EQUATE(403h)
EVENT:Enable_RJalan     EQUATE(404h)
!
EVENT:Disable_RInap     EQUATE(405h)
EVENT:Enable_RInap      EQUATE(406h)
!
EVENT:Disable_ReturRJalan     EQUATE(407h)
EVENT:Enable_ReturRJalan     EQUATE(408h)
!
EVENT:Disable_ReturRInap      EQUATE(409h)
EVENT:Enable_ReturRInap      EQUATE(410h)
!
!EVENT:Disable_Ruangan     EQUATE(411h)
!EVENT:Enable_Ruangan     EQUATE(412h)
!
!EVENT:Disable_AntarApotik      EQUATE(413h)
!EVENT:Enable_AntarApotik      EQUATE(414h)
!
!EVENT:Disable_BatalTrans      EQUATE(415h)
!EVENT:Enable_BatalTrans      EQUATE(416h)
!
!EVENT:Disable_BPBV     EQUATE(417h)
!EVENT:Enable_BPBV      EQUATE(418h)
!
EVENT:Disable_RJalanN     EQUATE(419h)
EVENT:Enable_RJalanN     EQUATE(420h)
!
EVENT:Disable_RInapN     EQUATE(421h)
EVENT:Enable_RInapN      EQUATE(422h)

EVENT:Disable_ReportRInap     EQUATE(423h)
EVENT:Enable_ReportRInap      EQUATE(424h)

EVENT:Enable_PembatalanRJalan   EQUATE(425h)
EVENT:Disable_PembatalanRJalan  EQUATE(426h)

EVENT:Enable_PembatalanRInap    EQUATE(427h)
EVENT:Disable_PembatalanRInap   EQUATE(428h)


Access:APEPREH       &FileManager,THREAD                   ! FileManager for APEPREH
Relate:APEPREH       &RelationManager,THREAD               ! RelationManager for APEPREH
Access:JPengirim     &FileManager,THREAD                   ! FileManager for JPengirim
Relate:JPengirim     &RelationManager,THREAD               ! RelationManager for JPengirim
Access:HM_BARANGNEW  &FileManager,THREAD                   ! FileManager for HM_BARANGNEW
Relate:HM_BARANGNEW  &RelationManager,THREAD               ! RelationManager for HM_BARANGNEW
Access:ASetApotik    &FileManager,THREAD                   ! FileManager for ASetApotik
Relate:ASetApotik    &RelationManager,THREAD               ! RelationManager for ASetApotik
Access:TBTransResepDokterDetail &FileManager,THREAD        ! FileManager for TBTransResepDokterDetail
Relate:TBTransResepDokterDetail &RelationManager,THREAD    ! RelationManager for TBTransResepDokterDetail
Access:JHBILLING     &FileManager,THREAD                   ! FileManager for JHBILLING
Relate:JHBILLING     &RelationManager,THREAD               ! RelationManager for JHBILLING
Access:JDDBILLING    &FileManager,THREAD                   ! FileManager for JDDBILLING
Relate:JDDBILLING    &RelationManager,THREAD               ! RelationManager for JDDBILLING
Access:JDBILLING     &FileManager,THREAD                   ! FileManager for JDBILLING
Relate:JDBILLING     &RelationManager,THREAD               ! RelationManager for JDBILLING
Access:FileSql2      &FileManager,THREAD                   ! FileManager for FileSql2
Relate:FileSql2      &RelationManager,THREAD               ! RelationManager for FileSql2
Access:JKontrakObat  &FileManager,THREAD                   ! FileManager for JKontrakObat
Relate:JKontrakObat  &RelationManager,THREAD               ! RelationManager for JKontrakObat
Access:ApEmbalase    &FileManager,THREAD                   ! FileManager for ApEmbalase
Relate:ApEmbalase    &RelationManager,THREAD               ! RelationManager for ApEmbalase
Access:VAPDTRANS     &FileManager,THREAD                   ! FileManager for VAPDTRANS
Relate:VAPDTRANS     &RelationManager,THREAD               ! RelationManager for VAPDTRANS
Access:APEPRED       &FileManager,THREAD                   ! FileManager for APEPRED
Relate:APEPRED       &RelationManager,THREAD               ! RelationManager for APEPRED
Access:AFIFOOUTTemp  &FileManager,THREAD                   ! FileManager for AFIFOOUTTemp
Relate:AFIFOOUTTemp  &RelationManager,THREAD               ! RelationManager for AFIFOOUTTemp
Access:APDTRANSBackup &FileManager,THREAD                  ! FileManager for APDTRANSBackup
Relate:APDTRANSBackup &RelationManager,THREAD              ! RelationManager for APDTRANSBackup
Access:vstokfifo     &FileManager,THREAD                   ! FileManager for vstokfifo
Relate:vstokfifo     &RelationManager,THREAD               ! RelationManager for vstokfifo
Access:SMUnit_Master &FileManager,THREAD                   ! FileManager for SMUnit_Master
Relate:SMUnit_Master &RelationManager,THREAD               ! RelationManager for SMUnit_Master
Access:APHTRANSBackup &FileManager,THREAD                  ! FileManager for APHTRANSBackup
Relate:APHTRANSBackup &RelationManager,THREAD              ! RelationManager for APHTRANSBackup
Access:ApNotaObat    &FileManager,THREAD                   ! FileManager for ApNotaObat
Relate:ApNotaObat    &RelationManager,THREAD               ! RelationManager for ApNotaObat
Access:SMRUnker      &FileManager,THREAD                   ! FileManager for SMRUnker
Relate:SMRUnker      &RelationManager,THREAD               ! RelationManager for SMRUnker
Access:SMPegawai     &FileManager,THREAD                   ! FileManager for SMPegawai
Relate:SMPegawai     &RelationManager,THREAD               ! RelationManager for SMPegawai
Access:JtmTinRj      &FileManager,THREAD                   ! FileManager for JtmTinRj
Relate:JtmTinRj      &RelationManager,THREAD               ! RelationManager for JtmTinRj
Access:APObatRuang   &FileManager,THREAD                   ! FileManager for APObatRuang
Relate:APObatRuang   &RelationManager,THREAD               ! RelationManager for APObatRuang
Access:ApPaketH      &FileManager,THREAD                   ! FileManager for ApPaketH
Relate:ApPaketH      &RelationManager,THREAD               ! RelationManager for ApPaketH
Access:ApNotaManual  &FileManager,THREAD                   ! FileManager for ApNotaManual
Relate:ApNotaManual  &RelationManager,THREAD               ! RelationManager for ApNotaManual
Access:Apetiket1     &FileManager,THREAD                   ! FileManager for Apetiket1
Relate:Apetiket1     &RelationManager,THREAD               ! RelationManager for Apetiket1
Access:ASaldoAwal    &FileManager,THREAD                   ! FileManager for ASaldoAwal
Relate:ASaldoAwal    &RelationManager,THREAD               ! RelationManager for ASaldoAwal
Access:Aphtransadd   &FileManager,THREAD                   ! FileManager for Aphtransadd
Relate:Aphtransadd   &RelationManager,THREAD               ! RelationManager for Aphtransadd
Access:OKBiayaLain   &FileManager,THREAD                   ! FileManager for OKBiayaLain
Relate:OKBiayaLain   &RelationManager,THREAD               ! RelationManager for OKBiayaLain
Access:OKOperator    &FileManager,THREAD                   ! FileManager for OKOperator
Relate:OKOperator    &RelationManager,THREAD               ! RelationManager for OKOperator
Access:GBarKel       &FileManager,THREAD                   ! FileManager for GBarKel
Relate:GBarKel       &RelationManager,THREAD               ! RelationManager for GBarKel
Access:INAdjust      &FileManager,THREAD                   ! FileManager for INAdjust
Relate:INAdjust      &RelationManager,THREAD               ! RelationManager for INAdjust
Access:ApStokopSS    &FileManager,THREAD                   ! FileManager for ApStokopSS
Relate:ApStokopSS    &RelationManager,THREAD               ! RelationManager for ApStokopSS
Access:GStokOp       &FileManager,THREAD                   ! FileManager for GStokOp
Relate:GStokOp       &RelationManager,THREAD               ! RelationManager for GStokOp
Access:RiTind        &FileManager,THREAD                   ! FileManager for RiTind
Relate:RiTind        &RelationManager,THREAD               ! RelationManager for RiTind
Access:ApPaketD      &FileManager,THREAD                   ! FileManager for ApPaketD
Relate:ApPaketD      &RelationManager,THREAD               ! RelationManager for ApPaketD
Access:INHDKB        &FileManager,THREAD                   ! FileManager for INHDKB
Relate:INHDKB        &RelationManager,THREAD               ! RelationManager for INHDKB
Access:GAdjusment    &FileManager,THREAD                   ! FileManager for GAdjusment
Relate:GAdjusment    &RelationManager,THREAD               ! RelationManager for GAdjusment
Access:OKJenisBedah  &FileManager,THREAD                   ! FileManager for OKJenisBedah
Relate:OKJenisBedah  &RelationManager,THREAD               ! RelationManager for OKJenisBedah
Access:OKHKeluar     &FileManager,THREAD                   ! FileManager for OKHKeluar
Relate:OKHKeluar     &RelationManager,THREAD               ! RelationManager for OKHKeluar
Access:AptoInSmdD    &FileManager,THREAD                   ! FileManager for AptoInSmdD
Relate:AptoInSmdD    &RelationManager,THREAD               ! RelationManager for AptoInSmdD
Access:AptoInSmdH    &FileManager,THREAD                   ! FileManager for AptoInSmdH
Relate:AptoInSmdH    &RelationManager,THREAD               ! RelationManager for AptoInSmdH
Access:IRK_PDPT      &FileManager,THREAD                   ! FileManager for IRK_PDPT
Relate:IRK_PDPT      &RelationManager,THREAD               ! RelationManager for IRK_PDPT
Access:RekJsaDr      &FileManager,THREAD                   ! FileManager for RekJsaDr
Relate:RekJsaDr      &RelationManager,THREAD               ! RelationManager for RekJsaDr
Access:ApDDProd      &FileManager,THREAD                   ! FileManager for ApDDProd
Relate:ApDDProd      &RelationManager,THREAD               ! RelationManager for ApDDProd
Access:GKStok        &FileManager,THREAD                   ! FileManager for GKStok
Relate:GKStok        &RelationManager,THREAD               ! RelationManager for GKStok
Access:RI_DSBBK      &FileManager,THREAD                   ! FileManager for RI_DSBBK
Relate:RI_DSBBK      &RelationManager,THREAD               ! RelationManager for RI_DSBBK
Access:GSaldoawal    &FileManager,THREAD                   ! FileManager for GSaldoawal
Relate:GSaldoawal    &RelationManager,THREAD               ! RelationManager for GSaldoawal
Access:GBrgDis       &FileManager,THREAD                   ! FileManager for GBrgDis
Relate:GBrgDis       &RelationManager,THREAD               ! RelationManager for GBrgDis
Access:RI_HSBBK      &FileManager,THREAD                   ! FileManager for RI_HSBBK
Relate:RI_HSBBK      &RelationManager,THREAD               ! RelationManager for RI_HSBBK
Access:IR_Bayi       &FileManager,THREAD                   ! FileManager for IR_Bayi
Relate:IR_Bayi       &RelationManager,THREAD               ! RelationManager for IR_Bayi
Access:FIFOOUT       &FileManager,THREAD                   ! FileManager for FIFOOUT
Relate:FIFOOUT       &RelationManager,THREAD               ! RelationManager for FIFOOUT
Access:FIFOIN        &FileManager,THREAD                   ! FileManager for FIFOIN
Relate:FIFOIN        &RelationManager,THREAD               ! RelationManager for FIFOIN
Access:ITr_Umka      &FileManager,THREAD                   ! FileManager for ITr_Umka
Relate:ITr_Umka      &RelationManager,THREAD               ! RelationManager for ITr_Umka
Access:ApInOutBln    &FileManager,THREAD                   ! FileManager for ApInOutBln
Relate:ApInOutBln    &RelationManager,THREAD               ! RelationManager for ApInOutBln
Access:IMJasa        &FileManager,THREAD                   ! FileManager for IMJasa
Relate:IMJasa        &RelationManager,THREAD               ! RelationManager for IMJasa
Access:ITrPsMan      &FileManager,THREAD                   ! FileManager for ITrPsMan
Relate:ITrPsMan      &RelationManager,THREAD               ! RelationManager for ITrPsMan
Access:RI_DTOAPTK    &FileManager,THREAD                   ! FileManager for RI_DTOAPTK
Relate:RI_DTOAPTK    &RelationManager,THREAD               ! RelationManager for RI_DTOAPTK
Access:ApDProd       &FileManager,THREAD                   ! FileManager for ApDProd
Relate:ApDProd       &RelationManager,THREAD               ! RelationManager for ApDProd
Access:ApHProd       &FileManager,THREAD                   ! FileManager for ApHProd
Relate:ApHProd       &RelationManager,THREAD               ! RelationManager for ApHProd
Access:Apcettmp      &FileManager,THREAD                   ! FileManager for Apcettmp
Relate:Apcettmp      &RelationManager,THREAD               ! RelationManager for Apcettmp
Access:RI_HToAptk    &FileManager,THREAD                   ! FileManager for RI_HToAptk
Relate:RI_HToAptk    &RelationManager,THREAD               ! RelationManager for RI_HToAptk
Access:Nomor_SKR     &FileManager,THREAD                   ! FileManager for Nomor_SKR
Relate:Nomor_SKR     &RelationManager,THREAD               ! RelationManager for Nomor_SKR
Access:Ano_pakai     &FileManager,THREAD                   ! FileManager for Ano_pakai
Relate:Ano_pakai     &RelationManager,THREAD               ! RelationManager for Ano_pakai
Access:Tbstawal      &FileManager,THREAD                   ! FileManager for Tbstawal
Relate:Tbstawal      &RelationManager,THREAD               ! RelationManager for Tbstawal
Access:GNOBBPB       &FileManager,THREAD                   ! FileManager for GNOBBPB
Relate:GNOBBPB       &RelationManager,THREAD               ! RelationManager for GNOBBPB
Access:GNOABPB       &FileManager,THREAD                   ! FileManager for GNOABPB
Relate:GNOABPB       &RelationManager,THREAD               ! RelationManager for GNOABPB
Access:APpotkem      &FileManager,THREAD                   ! FileManager for APpotkem
Relate:APpotkem      &RelationManager,THREAD               ! RelationManager for APpotkem
Access:ApLapBln      &FileManager,THREAD                   ! FileManager for ApLapBln
Relate:ApLapBln      &RelationManager,THREAD               ! RelationManager for ApLapBln
Access:VGBarangNew   &FileManager,THREAD                   ! FileManager for VGBarangNew
Relate:VGBarangNew   &RelationManager,THREAD               ! RelationManager for VGBarangNew
Access:JPASSWRD      &FileManager,THREAD                   ! FileManager for JPASSWRD
Relate:JPASSWRD      &RelationManager,THREAD               ! RelationManager for JPASSWRD
Access:JPasien       &FileManager,THREAD                   ! FileManager for JPasien
Relate:JPasien       &RelationManager,THREAD               ! RelationManager for JPasien
Access:IPasien       &FileManager,THREAD                   ! FileManager for IPasien
Relate:IPasien       &RelationManager,THREAD               ! RelationManager for IPasien
Access:JKontrak      &FileManager,THREAD                   ! FileManager for JKontrak
Relate:JKontrak      &RelationManager,THREAD               ! RelationManager for JKontrak
Access:ApStokop      &FileManager,THREAD                   ! FileManager for ApStokop
Relate:ApStokop      &RelationManager,THREAD               ! RelationManager for ApStokop
Access:GBarangAlias  &FileManager,THREAD                   ! FileManager for GBarangAlias
Relate:GBarangAlias  &RelationManager,THREAD               ! RelationManager for GBarangAlias
Access:ITbrRwt       &FileManager,THREAD                   ! FileManager for ITbrRwt
Relate:ITbrRwt       &RelationManager,THREAD               ! RelationManager for ITbrRwt
Access:GDBPBMaster   &FileManager,THREAD                   ! FileManager for GDBPBMaster
Relate:GDBPBMaster   &RelationManager,THREAD               ! RelationManager for GDBPBMaster
Access:OKFIFOIN      &FileManager,THREAD                   ! FileManager for OKFIFOIN
Relate:OKFIFOIN      &RelationManager,THREAD               ! RelationManager for OKFIFOIN
Access:OKFIFOOUT     &FileManager,THREAD                   ! FileManager for OKFIFOOUT
Relate:OKFIFOOUT     &RelationManager,THREAD               ! RelationManager for OKFIFOOUT
Access:Apklutmp      &FileManager,THREAD                   ! FileManager for Apklutmp
Relate:Apklutmp      &RelationManager,THREAD               ! RelationManager for Apklutmp
Access:GSATMP        &FileManager,THREAD                   ! FileManager for GSATMP
Relate:GSATMP        &RelationManager,THREAD               ! RelationManager for GSATMP
Access:GBarUPF       &FileManager,THREAD                   ! FileManager for GBarUPF
Relate:GBarUPF       &RelationManager,THREAD               ! RelationManager for GBarUPF
Access:GHBPBMaster   &FileManager,THREAD                   ! FileManager for GHBPBMaster
Relate:GHBPBMaster   &RelationManager,THREAD               ! RelationManager for GHBPBMaster
Access:TBDiagnosa    &FileManager,THREAD                   ! FileManager for TBDiagnosa
Relate:TBDiagnosa    &RelationManager,THREAD               ! RelationManager for TBDiagnosa
Access:ApLapKel      &FileManager,THREAD                   ! FileManager for ApLapKel
Relate:ApLapKel      &RelationManager,THREAD               ! RelationManager for ApLapKel
Access:DDTBalKT      &FileManager,THREAD                   ! FileManager for DDTBalKT
Relate:DDTBalKT      &RelationManager,THREAD               ! RelationManager for DDTBalKT
Access:JDokter       &FileManager,THREAD                   ! FileManager for JDokter
Relate:JDokter       &RelationManager,THREAD               ! RelationManager for JDokter
Access:APkemtmp      &FileManager,THREAD                   ! FileManager for APkemtmp
Relate:APkemtmp      &RelationManager,THREAD               ! RelationManager for APkemtmp
Access:DTTindak      &FileManager,THREAD                   ! FileManager for DTTindak
Relate:DTTindak      &RelationManager,THREAD               ! RelationManager for DTTindak
Access:DDTJahit      &FileManager,THREAD                   ! FileManager for DDTJahit
Relate:DDTJahit      &RelationManager,THREAD               ! RelationManager for DDTJahit
Access:DHPasBat      &FileManager,THREAD                   ! FileManager for DHPasBat
Relate:DHPasBat      &RelationManager,THREAD               ! RelationManager for DHPasBat
Access:DDTRpTin      &FileManager,THREAD                   ! FileManager for DDTRpTin
Relate:DDTRpTin      &RelationManager,THREAD               ! RelationManager for DDTRpTin
Access:DDTLain       &FileManager,THREAD                   ! FileManager for DDTLain
Relate:DDTLain       &RelationManager,THREAD               ! RelationManager for DDTLain
Access:DHPToday      &FileManager,THREAD                   ! FileManager for DHPToday
Relate:DHPToday      &RelationManager,THREAD               ! RelationManager for DHPToday
Access:AAdjust       &FileManager,THREAD                   ! FileManager for AAdjust
Relate:AAdjust       &RelationManager,THREAD               ! RelationManager for AAdjust
Access:DDTambah      &FileManager,THREAD                   ! FileManager for DDTambah
Relate:DDTambah      &RelationManager,THREAD               ! RelationManager for DDTambah
Access:DDTGas        &FileManager,THREAD                   ! FileManager for DDTGas
Relate:DDTGas        &RelationManager,THREAD               ! RelationManager for DDTGas
Access:ROGBarang     &FileManager,THREAD                   ! FileManager for ROGBarang
Relate:ROGBarang     &RelationManager,THREAD               ! RelationManager for ROGBarang
Access:OKKStok       &FileManager,THREAD                   ! FileManager for OKKStok
Relate:OKKStok       &RelationManager,THREAD               ! RelationManager for OKKStok
Access:DDTBal        &FileManager,THREAD                   ! FileManager for DDTBal
Relate:DDTBal        &RelationManager,THREAD               ! RelationManager for DDTBal
Access:DDTSunIn      &FileManager,THREAD                   ! FileManager for DDTSunIn
Relate:DDTSunIn      &RelationManager,THREAD               ! RelationManager for DDTSunIn
Access:DDTobat       &FileManager,THREAD                   ! FileManager for DDTobat
Relate:DDTobat       &RelationManager,THREAD               ! RelationManager for DDTobat
Access:IDataKtr      &FileManager,THREAD                   ! FileManager for IDataKtr
Relate:IDataKtr      &RelationManager,THREAD               ! RelationManager for IDataKtr
Access:DDTindak      &FileManager,THREAD                   ! FileManager for DDTindak
Relate:DDTindak      &RelationManager,THREAD               ! RelationManager for DDTindak
Access:JKET          &FileManager,THREAD                   ! FileManager for JKET
Relate:JKET          &RelationManager,THREAD               ! RelationManager for JKET
Access:IRekRu        &FileManager,THREAD                   ! FileManager for IRekRu
Relate:IRekRu        &RelationManager,THREAD               ! RelationManager for IRekRu
Access:HM_SUPPLIER   &FileManager,THREAD                   ! FileManager for HM_SUPPLIER
Relate:HM_SUPPLIER   &RelationManager,THREAD               ! RelationManager for HM_SUPPLIER
Access:HM_DOKTER     &FileManager,THREAD                   ! FileManager for HM_DOKTER
Relate:HM_DOKTER     &RelationManager,THREAD               ! RelationManager for HM_DOKTER
Access:HM_DOKTERLUAR &FileManager,THREAD                   ! FileManager for HM_DOKTERLUAR
Relate:HM_DOKTERLUAR &RelationManager,THREAD               ! RelationManager for HM_DOKTERLUAR
Access:HM_Kontraktor &FileManager,THREAD                   ! FileManager for HM_Kontraktor
Relate:HM_Kontraktor &RelationManager,THREAD               ! RelationManager for HM_Kontraktor
Access:HM_PASIEN     &FileManager,THREAD                   ! FileManager for HM_PASIEN
Relate:HM_PASIEN     &RelationManager,THREAD               ! RelationManager for HM_PASIEN
Access:HM_DIAGNOSA   &FileManager,THREAD                   ! FileManager for HM_DIAGNOSA
Relate:HM_DIAGNOSA   &RelationManager,THREAD               ! RelationManager for HM_DIAGNOSA
Access:JTindaka      &FileManager,THREAD                   ! FileManager for JTindaka
Relate:JTindaka      &RelationManager,THREAD               ! RelationManager for JTindaka
Access:DTPBalut      &FileManager,THREAD                   ! FileManager for DTPBalut
Relate:DTPBalut      &RelationManager,THREAD               ! RelationManager for DTPBalut
Access:JUPF          &FileManager,THREAD                   ! FileManager for JUPF
Relate:JUPF          &RelationManager,THREAD               ! RelationManager for JUPF
Access:JPoli         &FileManager,THREAD                   ! FileManager for JPoli
Relate:JPoli         &RelationManager,THREAD               ! RelationManager for JPoli
Access:JKecamatan    &FileManager,THREAD                   ! FileManager for JKecamatan
Relate:JKecamatan    &RelationManager,THREAD               ! RelationManager for JKecamatan
Access:JGroupKtr     &FileManager,THREAD                   ! FileManager for JGroupKtr
Relate:JGroupKtr     &RelationManager,THREAD               ! RelationManager for JGroupKtr
Access:JTransaksi    &FileManager,THREAD                   ! FileManager for JTransaksi
Relate:JTransaksi    &RelationManager,THREAD               ! RelationManager for JTransaksi
Access:JDataKtr      &FileManager,THREAD                   ! FileManager for JDataKtr
Relate:JDataKtr      &RelationManager,THREAD               ! RelationManager for JDataKtr
Access:INSaldoawal   &FileManager,THREAD                   ! FileManager for INSaldoawal
Relate:INSaldoawal   &RelationManager,THREAD               ! RelationManager for INSaldoawal
Access:JTbTransaksi  &FileManager,THREAD                   ! FileManager for JTbTransaksi
Relate:JTbTransaksi  &RelationManager,THREAD               ! RelationManager for JTbTransaksi
Access:DTPBena       &FileManager,THREAD                   ! FileManager for DTPBena
Relate:DTPBena       &RelationManager,THREAD               ! RelationManager for DTPBena
Access:DTTin_Ak      &FileManager,THREAD                   ! FileManager for DTTin_Ak
Relate:DTTin_Ak      &RelationManager,THREAD               ! RelationManager for DTTin_Ak
Access:DTTindHr      &FileManager,THREAD                   ! FileManager for DTTindHr
Relate:DTTindHr      &RelationManager,THREAD               ! RelationManager for DTTindHr
Access:DTPLain       &FileManager,THREAD                   ! FileManager for DTPLain
Relate:DTPLain       &RelationManager,THREAD               ! RelationManager for DTPLain
Access:JKota         &FileManager,THREAD                   ! FileManager for JKota
Relate:JKota         &RelationManager,THREAD               ! RelationManager for JKota
Access:JStatusDr     &FileManager,THREAD                   ! FileManager for JStatusDr
Relate:JStatusDr     &RelationManager,THREAD               ! RelationManager for JStatusDr
Access:JDKuitansi    &FileManager,THREAD                   ! FileManager for JDKuitansi
Relate:JDKuitansi    &RelationManager,THREAD               ! RelationManager for JDKuitansi
Access:RI_KStok      &FileManager,THREAD                   ! FileManager for RI_KStok
Relate:RI_KStok      &RelationManager,THREAD               ! RelationManager for RI_KStok
Access:ITrPasen      &FileManager,THREAD                   ! FileManager for ITrPasen
Relate:ITrPasen      &RelationManager,THREAD               ! RelationManager for ITrPasen
Access:AAwalBln      &FileManager,THREAD                   ! FileManager for AAwalBln
Relate:AAwalBln      &RelationManager,THREAD               ! RelationManager for AAwalBln
Access:INDDKB        &FileManager,THREAD                   ! FileManager for INDDKB
Relate:INDDKB        &RelationManager,THREAD               ! RelationManager for INDDKB
Access:JAnggota      &FileManager,THREAD                   ! FileManager for JAnggota
Relate:JAnggota      &RelationManager,THREAD               ! RelationManager for JAnggota
Access:JPJawab       &FileManager,THREAD                   ! FileManager for JPJawab
Relate:JPJawab       &RelationManager,THREAD               ! RelationManager for JPJawab
Access:IPJawab       &FileManager,THREAD                   ! FileManager for IPJawab
Relate:IPJawab       &RelationManager,THREAD               ! RelationManager for IPJawab
Access:JTempat       &FileManager,THREAD                   ! FileManager for JTempat
Relate:JTempat       &RelationManager,THREAD               ! RelationManager for JTempat
Access:JKPoli        &FileManager,THREAD                   ! FileManager for JKPoli
Relate:JKPoli        &RelationManager,THREAD               ! RelationManager for JKPoli
Access:ITmpPas       &FileManager,THREAD                   ! FileManager for ITmpPas
Relate:ITmpPas       &RelationManager,THREAD               ! RelationManager for ITmpPas
Access:JPSWUP        &FileManager,THREAD                   ! FileManager for JPSWUP
Relate:JPSWUP        &RelationManager,THREAD               ! RelationManager for JPSWUP
Access:IByTrPas      &FileManager,THREAD                   ! FileManager for IByTrPas
Relate:IByTrPas      &RelationManager,THREAD               ! RelationManager for IByTrPas
Access:JTBayar       &FileManager,THREAD                   ! FileManager for JTBayar
Relate:JTBayar       &RelationManager,THREAD               ! RelationManager for JTBayar
Access:JDiagnosa     &FileManager,THREAD                   ! FileManager for JDiagnosa
Relate:JDiagnosa     &RelationManager,THREAD               ! RelationManager for JDiagnosa
Access:RI_Stok       &FileManager,THREAD                   ! FileManager for RI_Stok
Relate:RI_Stok       &RelationManager,THREAD               ! RelationManager for RI_Stok
Access:Nomor_Batal   &FileManager,THREAD                   ! FileManager for Nomor_Batal
Relate:Nomor_Batal   &RelationManager,THREAD               ! RelationManager for Nomor_Batal
Access:JTPasien      &FileManager,THREAD                   ! FileManager for JTPasien
Relate:JTPasien      &RelationManager,THREAD               ! RelationManager for JTPasien
Access:DTOBAT        &FileManager,THREAD                   ! FileManager for DTOBAT
Relate:DTOBAT        &RelationManager,THREAD               ! RelationManager for DTOBAT
Access:DTDiKer       &FileManager,THREAD                   ! FileManager for DTDiKer
Relate:DTDiKer       &RelationManager,THREAD               ! RelationManager for DTDiKer
Access:DTBalut       &FileManager,THREAD                   ! FileManager for DTBalut
Relate:DTBalut       &RelationManager,THREAD               ! RelationManager for DTBalut
Access:DTAlLain      &FileManager,THREAD                   ! FileManager for DTAlLain
Relate:DTAlLain      &RelationManager,THREAD               ! RelationManager for DTAlLain
Access:RoKStok       &FileManager,THREAD                   ! FileManager for RoKStok
Relate:RoKStok       &RelationManager,THREAD               ! RelationManager for RoKStok
Access:DTGas         &FileManager,THREAD                   ! FileManager for DTGas
Relate:DTGas         &RelationManager,THREAD               ! RelationManager for DTGas
Access:DTDDKer       &FileManager,THREAD                   ! FileManager for DTDDKer
Relate:DTDDKer       &RelationManager,THREAD               ! RelationManager for DTDDKer
Access:GStokPerBulan &FileManager,THREAD                   ! FileManager for GStokPerBulan
Relate:GStokPerBulan &RelationManager,THREAD               ! RelationManager for GStokPerBulan
Access:IDaftarAlat   &FileManager,THREAD                   ! FileManager for IDaftarAlat
Relate:IDaftarAlat   &RelationManager,THREAD               ! RelationManager for IDaftarAlat
Access:ILIST         &FileManager,THREAD                   ! FileManager for ILIST
Relate:ILIST         &RelationManager,THREAD               ! RelationManager for ILIST
Access:DTAsi         &FileManager,THREAD                   ! FileManager for DTAsi
Relate:DTAsi         &RelationManager,THREAD               ! RelationManager for DTAsi
Access:DTBena        &FileManager,THREAD                   ! FileManager for DTBena
Relate:DTBena        &RelationManager,THREAD               ! RelationManager for DTBena
Access:JRujuk        &FileManager,THREAD                   ! FileManager for JRujuk
Relate:JRujuk        &RelationManager,THREAD               ! RelationManager for JRujuk
Access:JHKuitansi    &FileManager,THREAD                   ! FileManager for JHKuitansi
Relate:JHKuitansi    &RelationManager,THREAD               ! RelationManager for JHKuitansi
Access:IPkiTlp       &FileManager,THREAD                   ! FileManager for IPkiTlp
Relate:IPkiTlp       &RelationManager,THREAD               ! RelationManager for IPkiTlp
Access:ITabelGizi    &FileManager,THREAD                   ! FileManager for ITabelGizi
Relate:ITabelGizi    &RelationManager,THREAD               ! RelationManager for ITabelGizi
Access:IDNotaSm      &FileManager,THREAD                   ! FileManager for IDNotaSm
Relate:IDNotaSm      &RelationManager,THREAD               ! RelationManager for IDNotaSm
Access:IPkiPPSP      &FileManager,THREAD                   ! FileManager for IPkiPPSP
Relate:IPkiPPSP      &RelationManager,THREAD               ! RelationManager for IPkiPPSP
Access:RI_Diagnosa   &FileManager,THREAD                   ! FileManager for RI_Diagnosa
Relate:RI_Diagnosa   &RelationManager,THREAD               ! RelationManager for RI_Diagnosa
Access:IUMPasen      &FileManager,THREAD                   ! FileManager for IUMPasen
Relate:IUMPasen      &RelationManager,THREAD               ! RelationManager for IUMPasen
Access:IPkiGizi      &FileManager,THREAD                   ! FileManager for IPkiGizi
Relate:IPkiGizi      &RelationManager,THREAD               ! RelationManager for IPkiGizi
Access:INoPasen      &FileManager,THREAD                   ! FileManager for INoPasen
Relate:INoPasen      &RelationManager,THREAD               ! RelationManager for INoPasen
Access:JJDokter      &FileManager,THREAD                   ! FileManager for JJDokter
Relate:JJDokter      &RelationManager,THREAD               ! RelationManager for JJDokter
Access:RI_LIST       &FileManager,THREAD                   ! FileManager for RI_LIST
Relate:RI_LIST       &RelationManager,THREAD               ! RelationManager for RI_LIST
Access:JKTindak      &FileManager,THREAD                   ! FileManager for JKTindak
Relate:JKTindak      &RelationManager,THREAD               ! RelationManager for JKTindak
Access:IPkiObat      &FileManager,THREAD                   ! FileManager for IPkiObat
Relate:IPkiObat      &RelationManager,THREAD               ! RelationManager for IPkiObat
Access:RI_HRInap     &FileManager,THREAD                   ! FileManager for RI_HRInap
Relate:RI_HRInap     &RelationManager,THREAD               ! RelationManager for RI_HRInap
Access:IPasPul       &FileManager,THREAD                   ! FileManager for IPasPul
Relate:IPasPul       &RelationManager,THREAD               ! RelationManager for IPasPul
Access:JTDokter      &FileManager,THREAD                   ! FileManager for JTDokter
Relate:JTDokter      &RelationManager,THREAD               ! RelationManager for JTDokter
Access:JKontrakMaster &FileManager,THREAD                  ! FileManager for JKontrakMaster
Relate:JKontrakMaster &RelationManager,THREAD              ! RelationManager for JKontrakMaster
Access:JLokasi       &FileManager,THREAD                   ! FileManager for JLokasi
Relate:JLokasi       &RelationManager,THREAD               ! RelationManager for JLokasi
Access:IPkiAlat      &FileManager,THREAD                   ! FileManager for IPkiAlat
Relate:IPkiAlat      &RelationManager,THREAD               ! RelationManager for IPkiAlat
Access:VAphtransJPasien &FileManager,THREAD                ! FileManager for VAphtransJPasien
Relate:VAphtransJPasien &RelationManager,THREAD            ! RelationManager for VAphtransJPasien
Access:AptoInHe      &FileManager,THREAD                   ! FileManager for AptoInHe
Relate:AptoInHe      &RelationManager,THREAD               ! RelationManager for AptoInHe
Access:AptoApHe      &FileManager,THREAD                   ! FileManager for AptoApHe
Relate:AptoApHe      &RelationManager,THREAD               ! RelationManager for AptoApHe
Access:APtoAPde      &FileManager,THREAD                   ! FileManager for APtoAPde
Relate:APtoAPde      &RelationManager,THREAD               ! RelationManager for APtoAPde
Access:IKUmPesn      &FileManager,THREAD                   ! FileManager for IKUmPesn
Relate:IKUmPesn      &RelationManager,THREAD               ! RelationManager for IKUmPesn
Access:APOBKONT      &FileManager,THREAD                   ! FileManager for APOBKONT
Relate:APOBKONT      &RelationManager,THREAD               ! RelationManager for APOBKONT
Access:RI_JasaRawat  &FileManager,THREAD                   ! FileManager for RI_JasaRawat
Relate:RI_JasaRawat  &RelationManager,THREAD               ! RelationManager for RI_JasaRawat
Access:APBRGCMP      &FileManager,THREAD                   ! FileManager for APBRGCMP
Relate:APBRGCMP      &RelationManager,THREAD               ! RelationManager for APBRGCMP
Access:JKelPeg       &FileManager,THREAD                   ! FileManager for JKelPeg
Relate:JKelPeg       &RelationManager,THREAD               ! RelationManager for JKelPeg
Access:queue         &FileManager,THREAD                   ! FileManager for queue
Relate:queue         &RelationManager,THREAD               ! RelationManager for queue
Access:APDTcam       &FileManager,THREAD                   ! FileManager for APDTcam
Relate:APDTcam       &RelationManager,THREAD               ! RelationManager for APDTcam
Access:APDTRANS      &FileManager,THREAD                   ! FileManager for APDTRANS
Relate:APDTRANS      &RelationManager,THREAD               ! RelationManager for APDTRANS
Access:AptoInDe      &FileManager,THREAD                   ! FileManager for AptoInDe
Relate:AptoInDe      &RelationManager,THREAD               ! RelationManager for AptoInDe
Access:ApReLuar      &FileManager,THREAD                   ! FileManager for ApReLuar
Relate:ApReLuar      &RelationManager,THREAD               ! RelationManager for ApReLuar
Access:ITAGUM        &FileManager,THREAD                   ! FileManager for ITAGUM
Relate:ITAGUM        &RelationManager,THREAD               ! RelationManager for ITAGUM
Access:APHTRANSBPJS  &FileManager,THREAD                   ! FileManager for APHTRANSBPJS
Relate:APHTRANSBPJS  &RelationManager,THREAD               ! RelationManager for APHTRANSBPJS
Access:RI_PinRuang   &FileManager,THREAD                   ! FileManager for RI_PinRuang
Relate:RI_PinRuang   &RelationManager,THREAD               ! RelationManager for RI_PinRuang
Access:RI_VisitDr    &FileManager,THREAD                   ! FileManager for RI_VisitDr
Relate:RI_VisitDr    &RelationManager,THREAD               ! RelationManager for RI_VisitDr
Access:APHTRANS      &FileManager,THREAD                   ! FileManager for APHTRANS
Relate:APHTRANS      &RelationManager,THREAD               ! RelationManager for APHTRANS
Access:JPegawai      &FileManager,THREAD                   ! FileManager for JPegawai
Relate:JPegawai      &RelationManager,THREAD               ! RelationManager for JPegawai
Access:Appegrsi      &FileManager,THREAD                   ! FileManager for Appegrsi
Relate:Appegrsi      &RelationManager,THREAD               ! RelationManager for Appegrsi
Access:IAORDER       &FileManager,THREAD                   ! FileManager for IAORDER
Relate:IAORDER       &RelationManager,THREAD               ! RelationManager for IAORDER
Access:IDAOrder      &FileManager,THREAD                   ! FileManager for IDAOrder
Relate:IDAOrder      &RelationManager,THREAD               ! RelationManager for IDAOrder
Access:ISetupAp      &FileManager,THREAD                   ! FileManager for ISetupAp
Relate:ISetupAp      &RelationManager,THREAD               ! RelationManager for ISetupAp
Access:JAnestesi     &FileManager,THREAD                   ! FileManager for JAnestesi
Relate:JAnestesi     &RelationManager,THREAD               ! RelationManager for JAnestesi
Access:IDiagnosa     &FileManager,THREAD                   ! FileManager for IDiagnosa
Relate:IDiagnosa     &RelationManager,THREAD               ! RelationManager for IDiagnosa
Access:IAP_SET       &FileManager,THREAD                   ! FileManager for IAP_SET
Relate:IAP_SET       &RelationManager,THREAD               ! RelationManager for IAP_SET
Access:GStockGdg     &FileManager,THREAD                   ! FileManager for GStockGdg
Relate:GStockGdg     &RelationManager,THREAD               ! RelationManager for GStockGdg
Access:JKelurahan    &FileManager,THREAD                   ! FileManager for JKelurahan
Relate:JKelurahan    &RelationManager,THREAD               ! RelationManager for JKelurahan
Access:GBAStock      &FileManager,THREAD                   ! FileManager for GBAStock
Relate:GBAStock      &RelationManager,THREAD               ! RelationManager for GBAStock
Access:GRekapBK      &FileManager,THREAD                   ! FileManager for GRekapBK
Relate:GRekapBK      &RelationManager,THREAD               ! RelationManager for GRekapBK
Access:GPBF          &FileManager,THREAD                   ! FileManager for GPBF
Relate:GPBF          &RelationManager,THREAD               ! RelationManager for GPBF
Access:GDBSBBK       &FileManager,THREAD                   ! FileManager for GDBSBBK
Relate:GDBSBBK       &RelationManager,THREAD               ! RelationManager for GDBSBBK
Access:GHSBBM        &FileManager,THREAD                   ! FileManager for GHSBBM
Relate:GHSBBM        &RelationManager,THREAD               ! RelationManager for GHSBBM
Access:GDSBBM        &FileManager,THREAD                   ! FileManager for GDSBBM
Relate:GDSBBM        &RelationManager,THREAD               ! RelationManager for GDSBBM
Access:DTabDoc       &FileManager,THREAD                   ! FileManager for DTabDoc
Relate:DTabDoc       &RelationManager,THREAD               ! RelationManager for DTabDoc
Access:GHBatal       &FileManager,THREAD                   ! FileManager for GHBatal
Relate:GHBatal       &RelationManager,THREAD               ! RelationManager for GHBatal
Access:JSUMDR        &FileManager,THREAD                   ! FileManager for JSUMDR
Relate:JSUMDR        &RelationManager,THREAD               ! RelationManager for JSUMDR
Access:GDBatal       &FileManager,THREAD                   ! FileManager for GDBatal
Relate:GDBatal       &RelationManager,THREAD               ! RelationManager for GDBatal
Access:GHSPB         &FileManager,THREAD                   ! FileManager for GHSPB
Relate:GHSPB         &RelationManager,THREAD               ! RelationManager for GHSPB
Access:GHBSBBK       &FileManager,THREAD                   ! FileManager for GHBSBBK
Relate:GHBSBBK       &RelationManager,THREAD               ! RelationManager for GHBSBBK
Access:GDSPB         &FileManager,THREAD                   ! FileManager for GDSPB
Relate:GDSPB         &RelationManager,THREAD               ! RelationManager for GDSPB
Access:GStokAptk     &FileManager,THREAD                   ! FileManager for GStokAptk
Relate:GStokAptk     &RelationManager,THREAD               ! RelationManager for GStokAptk
Access:GHBPB         &FileManager,THREAD                   ! FileManager for GHBPB
Relate:GHBPB         &RelationManager,THREAD               ! RelationManager for GHBPB
Access:JPTmpKel      &FileManager,THREAD                   ! FileManager for JPTmpKel
Relate:JPTmpKel      &RelationManager,THREAD               ! RelationManager for JPTmpKel
Access:JTDbyr        &FileManager,THREAD                   ! FileManager for JTDbyr
Relate:JTDbyr        &RelationManager,THREAD               ! RelationManager for JTDbyr
Access:JREKJD        &FileManager,THREAD                   ! FileManager for JREKJD
Relate:JREKJD        &RelationManager,THREAD               ! RelationManager for JREKJD
Access:GDBPB         &FileManager,THREAD                   ! FileManager for GDBPB
Relate:GDBPB         &RelationManager,THREAD               ! RelationManager for GDBPB
Access:MBarang       &FileManager,THREAD                   ! FileManager for MBarang
Relate:MBarang       &RelationManager,THREAD               ! RelationManager for MBarang
Access:GHSBBK        &FileManager,THREAD                   ! FileManager for GHSBBK
Relate:GHSBBK        &RelationManager,THREAD               ! RelationManager for GHSBBK
Access:GDSBBK        &FileManager,THREAD                   ! FileManager for GDSBBK
Relate:GDSBBK        &RelationManager,THREAD               ! RelationManager for GDSBBK
Access:GApotik       &FileManager,THREAD                   ! FileManager for GApotik
Relate:GApotik       &RelationManager,THREAD               ! RelationManager for GApotik
Access:JTSBayar      &FileManager,THREAD                   ! FileManager for JTSBayar
Relate:JTSBayar      &RelationManager,THREAD               ! RelationManager for JTSBayar
Access:GRBatalK      &FileManager,THREAD                   ! FileManager for GRBatalK
Relate:GRBatalK      &RelationManager,THREAD               ! RelationManager for GRBatalK
Access:GBarang       &FileManager,THREAD                   ! FileManager for GBarang
Relate:GBarang       &RelationManager,THREAD               ! RelationManager for GBarang
Access:GLapBln       &FileManager,THREAD                   ! FileManager for GLapBln
Relate:GLapBln       &RelationManager,THREAD               ! RelationManager for GLapBln
Access:GSatuan       &FileManager,THREAD                   ! FileManager for GSatuan
Relate:GSatuan       &RelationManager,THREAD               ! RelationManager for GSatuan
Access:LAdaDet       &FileManager,THREAD                   ! FileManager for LAdaDet
Relate:LAdaDet       &RelationManager,THREAD               ! RelationManager for LAdaDet
Access:MBarangMK     &FileManager,THREAD                   ! FileManager for MBarangMK
Relate:MBarangMK     &RelationManager,THREAD               ! RelationManager for MBarangMK
Access:JTTBayar      &FileManager,THREAD                   ! FileManager for JTTBayar
Relate:JTTBayar      &RelationManager,THREAD               ! RelationManager for JTTBayar
Access:OKLain        &FileManager,THREAD                   ! FileManager for OKLain
Relate:OKLain        &RelationManager,THREAD               ! RelationManager for OKLain
Access:ODDOp         &FileManager,THREAD                   ! FileManager for ODDOp
Relate:ODDOp         &RelationManager,THREAD               ! RelationManager for ODDOp
Access:LHLAB         &FileManager,THREAD                   ! FileManager for LHLAB
Relate:LHLAB         &RelationManager,THREAD               ! RelationManager for LHLAB
Access:ITbKelas      &FileManager,THREAD                   ! FileManager for ITbKelas
Relate:ITbKelas      &RelationManager,THREAD               ! RelationManager for ITbKelas
Access:LKtrPers      &FileManager,THREAD                   ! FileManager for LKtrPers
Relate:LKtrPers      &RelationManager,THREAD               ! RelationManager for LKtrPers
Access:LPasExt       &FileManager,THREAD                   ! FileManager for LPasExt
Relate:LPasExt       &RelationManager,THREAD               ! RelationManager for LPasExt
Access:OKIBiayaLain  &FileManager,THREAD                   ! FileManager for OKIBiayaLain
Relate:OKIBiayaLain  &RelationManager,THREAD               ! RelationManager for OKIBiayaLain
Access:OKIDKeluar    &FileManager,THREAD                   ! FileManager for OKIDKeluar
Relate:OKIDKeluar    &RelationManager,THREAD               ! RelationManager for OKIDKeluar
Access:OKIDOPAN      &FileManager,THREAD                   ! FileManager for OKIDOPAN
Relate:OKIDOPAN      &RelationManager,THREAD               ! RelationManager for OKIDOPAN
Access:LPasLab       &FileManager,THREAD                   ! FileManager for LPasLab
Relate:LPasLab       &RelationManager,THREAD               ! RelationManager for LPasLab
Access:OKIDRinci     &FileManager,THREAD                   ! FileManager for OKIDRinci
Relate:OKIDRinci     &RelationManager,THREAD               ! RelationManager for OKIDRinci
Access:OKHInap       &FileManager,THREAD                   ! FileManager for OKHInap
Relate:OKHInap       &RelationManager,THREAD               ! RelationManager for OKHInap
Access:OKAlatKamar   &FileManager,THREAD                   ! FileManager for OKAlatKamar
Relate:OKAlatKamar   &RelationManager,THREAD               ! RelationManager for OKAlatKamar
Access:OKAnestesist  &FileManager,THREAD                   ! FileManager for OKAnestesist
Relate:OKAnestesist  &RelationManager,THREAD               ! RelationManager for OKAnestesist
Access:OKDOPAN       &FileManager,THREAD                   ! FileManager for OKDOPAN
Relate:OKDOPAN       &RelationManager,THREAD               ! RelationManager for OKDOPAN
Access:JTTSByr       &FileManager,THREAD                   ! FileManager for JTTSByr
Relate:JTTSByr       &RelationManager,THREAD               ! RelationManager for JTTSByr
Access:RoPasLu       &FileManager,THREAD                   ! FileManager for RoPasLu
Relate:RoPasLu       &RelationManager,THREAD               ! RelationManager for RoPasLu
Access:RI_DSBBM      &FileManager,THREAD                   ! FileManager for RI_DSBBM
Relate:RI_DSBBM      &RelationManager,THREAD               ! RelationManager for RI_DSBBM
Access:OHPasOp       &FileManager,THREAD                   ! FileManager for OHPasOp
Relate:OHPasOp       &RelationManager,THREAD               ! RelationManager for OHPasOp
Access:LDDPerik      &FileManager,THREAD                   ! FileManager for LDDPerik
Relate:LDDPerik      &RelationManager,THREAD               ! RelationManager for LDDPerik
Access:RI_HSBBM      &FileManager,THREAD                   ! FileManager for RI_HSBBM
Relate:RI_HSBBM      &RelationManager,THREAD               ! RelationManager for RI_HSBBM
Access:LsPel         &FileManager,THREAD                   ! FileManager for LsPel
Relate:LsPel         &RelationManager,THREAD               ! RelationManager for LsPel
Access:OKDRinci      &FileManager,THREAD                   ! FileManager for OKDRinci
Relate:OKDRinci      &RelationManager,THREAD               ! RelationManager for OKDRinci
Access:OKJenisAnestesi &FileManager,THREAD                 ! FileManager for OKJenisAnestesi
Relate:OKJenisAnestesi &RelationManager,THREAD             ! RelationManager for OKJenisAnestesi
Access:OKDKeluar     &FileManager,THREAD                   ! FileManager for OKDKeluar
Relate:OKDKeluar     &RelationManager,THREAD               ! RelationManager for OKDKeluar
Access:NomorUse      &FileManager,THREAD                   ! FileManager for NomorUse
Relate:NomorUse      &RelationManager,THREAD               ! RelationManager for NomorUse
Access:DDOPe         &FileManager,THREAD                   ! FileManager for DDOPe
Relate:DDOPe         &RelationManager,THREAD               ! RelationManager for DDOPe
Access:DHPasOp       &FileManager,THREAD                   ! FileManager for DHPasOp
Relate:DHPasOp       &RelationManager,THREAD               ! RelationManager for DHPasOp
Access:IKKelas       &FileManager,THREAD                   ! FileManager for IKKelas
Relate:IKKelas       &RelationManager,THREAD               ! RelationManager for IKKelas
Access:ROGFpmpd      &FileManager,THREAD                   ! FileManager for ROGFpmpd
Relate:ROGFpmpd      &RelationManager,THREAD               ! RelationManager for ROGFpmpd
Access:LAdaMemo      &FileManager,THREAD                   ! FileManager for LAdaMemo
Relate:LAdaMemo      &RelationManager,THREAD               ! RelationManager for LAdaMemo
Access:LDLAB         &FileManager,THREAD                   ! FileManager for LDLAB
Relate:LDLAB         &RelationManager,THREAD               ! RelationManager for LDLAB
Access:RI_DBSBBK     &FileManager,THREAD                   ! FileManager for RI_DBSBBK
Relate:RI_DBSBBK     &RelationManager,THREAD               ! RelationManager for RI_DBSBBK
Access:SubGrouplab   &FileManager,THREAD                   ! FileManager for SubGrouplab
Relate:SubGrouplab   &RelationManager,THREAD               ! RelationManager for SubGrouplab
Access:RoPasiCt      &FileManager,THREAD                   ! FileManager for RoPasiCt
Relate:RoPasiCt      &RelationManager,THREAD               ! RelationManager for RoPasiCt
Access:RI_HBSBBK     &FileManager,THREAD                   ! FileManager for RI_HBSBBK
Relate:RI_HBSBBK     &RelationManager,THREAD               ! RelationManager for RI_HBSBBK
Access:FileSql       &FileManager,THREAD                   ! FileManager for FileSql
Relate:FileSql       &RelationManager,THREAD               ! RelationManager for FileSql
Access:RoPcsRJ       &FileManager,THREAD                   ! FileManager for RoPcsRJ
Relate:RoPcsRJ       &RelationManager,THREAD               ! RelationManager for RoPcsRJ
Access:RoMemo        &FileManager,THREAD                   ! FileManager for RoMemo
Relate:RoMemo        &RelationManager,THREAD               ! RelationManager for RoMemo
Access:RoPasHas      &FileManager,THREAD                   ! FileManager for RoPasHas
Relate:RoPasHas      &RelationManager,THREAD               ! RelationManager for RoPasHas
Access:RoTbPem       &FileManager,THREAD                   ! FileManager for RoTbPem
Relate:RoTbPem       &RelationManager,THREAD               ! RelationManager for RoTbPem
Access:RoStok        &FileManager,THREAD                   ! FileManager for RoStok
Relate:RoStok        &RelationManager,THREAD               ! RelationManager for RoStok
Access:RoPasien      &FileManager,THREAD                   ! FileManager for RoPasien
Relate:RoPasien      &RelationManager,THREAD               ! RelationManager for RoPasien
Access:RoPasRJ       &FileManager,THREAD                   ! FileManager for RoPasRJ
Relate:RoPasRJ       &RelationManager,THREAD               ! RelationManager for RoPasRJ
Access:RoPasRIXXX    &FileManager,THREAD                   ! FileManager for RoPasRIXXX
Relate:RoPasRIXXX    &RelationManager,THREAD               ! RelationManager for RoPasRIXXX
Access:IVisitDr      &FileManager,THREAD                   ! FileManager for IVisitDr
Relate:IVisitDr      &RelationManager,THREAD               ! RelationManager for IVisitDr
Access:ITindak       &FileManager,THREAD                   ! FileManager for ITindak
Relate:ITindak       &RelationManager,THREAD               ! RelationManager for ITindak
Access:IDaftarPPSP   &FileManager,THREAD                   ! FileManager for IDaftarPPSP
Relate:IDaftarPPSP   &RelationManager,THREAD               ! RelationManager for IDaftarPPSP
Access:TBinstli      &FileManager,THREAD                   ! FileManager for TBinstli
Relate:TBinstli      &RelationManager,THREAD               ! RelationManager for TBinstli
Access:ApObInst      &FileManager,THREAD                   ! FileManager for ApObInst
Relate:ApObInst      &RelationManager,THREAD               ! RelationManager for ApObInst
Access:IHNotaSm      &FileManager,THREAD                   ! FileManager for IHNotaSm
Relate:IHNotaSm      &RelationManager,THREAD               ! RelationManager for IHNotaSm
Access:TBTransResepDokterEtiket &FileManager,THREAD        ! FileManager for TBTransResepDokterEtiket
Relate:TBTransResepDokterEtiket &RelationManager,THREAD    ! RelationManager for TBTransResepDokterEtiket
Access:TBTransResepDokterHeader &FileManager,THREAD        ! FileManager for TBTransResepDokterHeader
Relate:TBTransResepDokterHeader &RelationManager,THREAD    ! RelationManager for TBTransResepDokterHeader
Access:TBTransResepDokterHeader_RI &FileManager,THREAD     ! FileManager for TBTransResepDokterHeader_RI
Relate:TBTransResepDokterHeader_RI &RelationManager,THREAD ! RelationManager for TBTransResepDokterHeader_RI
Access:TBTransResepDokterHeader_RIHarian &FileManager,THREAD ! FileManager for TBTransResepDokterHeader_RIHarian
Relate:TBTransResepDokterHeader_RIHarian &RelationManager,THREAD ! RelationManager for TBTransResepDokterHeader_RIHarian
Access:TBTransResepObatCampur &FileManager,THREAD          ! FileManager for TBTransResepObatCampur
Relate:TBTransResepObatCampur &RelationManager,THREAD      ! RelationManager for TBTransResepObatCampur
Access:TBTransResepItter &FileManager,THREAD               ! FileManager for TBTransResepItter
Relate:TBTransResepItter &RelationManager,THREAD           ! RelationManager for TBTransResepItter
Access:UHksRjln      &FileManager,THREAD                   ! FileManager for UHksRjln
Relate:UHksRjln      &RelationManager,THREAD               ! RelationManager for UHksRjln
Access:UtmptRj       &FileManager,THREAD                   ! FileManager for UtmptRj
Relate:UtmptRj       &RelationManager,THREAD               ! RelationManager for UtmptRj
Access:UDksRjln      &FileManager,THREAD                   ! FileManager for UDksRjln
Relate:UDksRjln      &RelationManager,THREAD               ! RelationManager for UDksRjln
Access:UJMan         &FileManager,THREAD                   ! FileManager for UJMan
Relate:UJMan         &RelationManager,THREAD               ! RelationManager for UJMan
Access:AFIFOIN       &FileManager,THREAD                   ! FileManager for AFIFOIN
Relate:AFIFOIN       &RelationManager,THREAD               ! RelationManager for AFIFOIN
Access:AFIFOOUT      &FileManager,THREAD                   ! FileManager for AFIFOOUT
Relate:AFIFOOUT      &RelationManager,THREAD               ! RelationManager for AFIFOOUT
Access:APKStok       &FileManager,THREAD                   ! FileManager for APKStok
Relate:APKStok       &RelationManager,THREAD               ! RelationManager for APKStok
Access:APDTRANSDet   &FileManager,THREAD                   ! FileManager for APDTRANSDet
Relate:APDTRANSDet   &RelationManager,THREAD               ! RelationManager for APDTRANSDet
Access:Apetiket      &FileManager,THREAD                   ! FileManager for Apetiket
Relate:Apetiket      &RelationManager,THREAD               ! RelationManager for Apetiket
Access:HM_BRGLOGISTIK &FileManager,THREAD                  ! FileManager for HM_BRGLOGISTIK
Relate:HM_BRGLOGISTIK &RelationManager,THREAD              ! RelationManager for HM_BRGLOGISTIK
Access:GBarangA      &FileManager,THREAD                   ! FileManager for GBarangA
Relate:GBarangA      &RelationManager,THREAD               ! RelationManager for GBarangA

FuzzyMatcher         FuzzyClass                            ! Global fuzzy matcher
GlobalErrorStatus    ErrorStatusClass,THREAD
GlobalErrors         ErrorClass                            ! Global error manager
INIMgr               INIClass                              ! Global non-volatile storage manager
GlobalRequest        BYTE(0),THREAD                        ! Set when a browse calls a form, to let it know action to perform
GlobalResponse       BYTE(0),THREAD                        ! Set to the response from the form
VCRRequest           LONG(0),THREAD                        ! Set to the request from the VCR buttons

Dictionary           CLASS,THREAD
Construct              PROCEDURE
Destruct               PROCEDURE
                     END

lCurrentFDSetting    LONG                                  ! Used by window frame dragging
lAdjFDSetting        LONG                                  ! ditto

  CODE
  GlobalErrors.Init(GlobalErrorStatus)
  FuzzyMatcher.Init                                        ! Initilaize the browse 'fuzzy matcher'
  FuzzyMatcher.SetOption(MatchOption:NoCase, 1)            ! Configure case matching
  FuzzyMatcher.SetOption(MatchOption:WordOnly, 0)          ! Configure 'word only' matching
  INIMgr.Init('apc6new.INI', NVD_INI)                      ! Configure INIManager to use INI file
  DctInit
  SystemParametersInfo (38, 0, lCurrentFDSetting, 0)       ! Configure frame dragging
  IF lCurrentFDSetting = 1
    SystemParametersInfo (37, 0, lAdjFDSetting, 3)
  END
  Main
  INIMgr.Update
  IF lCurrentFDSetting = 1
    SystemParametersInfo (37, 1, lAdjFDSetting, 3)
  END
  INIMgr.Kill                                              ! Destroy INI manager
  FuzzyMatcher.Kill                                        ! Destroy fuzzy matcher


Dictionary.Construct PROCEDURE

  CODE
  IF THREAD()<>1
     DctInit()
  END


Dictionary.Destruct PROCEDURE

  CODE
  DctKill()

