

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N024.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N018.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N023.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N025.INC'),ONCE        !Req'd for module callout resolution
                     END


WindowAllTransKeluar PROCEDURE                             ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
vl_jum1              REAL                                  !
vl_jum2              REAL                                  !
vl_jum3              REAL                                  !
vl_jum4              REAL                                  !
vl_jum5              REAL                                  !
vl_jum6              REAL                                  !
vl_jum7              REAL                                  !
vl_jum8              REAL                                  !
BRW1::View:Browse    VIEW(GDBSBBK)
                       PROJECT(GDBSB:NoBSBBK)
                       PROJECT(GDBSB:KodeBarang)
                       PROJECT(GDBSB:Jumlah_Sat)
                       PROJECT(GDBSB:Harga)
                       PROJECT(GDBSB:Total)
                       JOIN(GHBSB:KeyNoBSBBK,GDBSB:NoBSBBK)
                         PROJECT(GHBSB:Tanggal_BSBBK)
                         PROJECT(GHBSB:kode_apotik)
                         PROJECT(GHBSB:NoBSBBK)
                       END
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
GDBSB:NoBSBBK          LIKE(GDBSB:NoBSBBK)            !List box control field - type derived from field
GDBSB:KodeBarang       LIKE(GDBSB:KodeBarang)         !List box control field - type derived from field
GDBSB:Jumlah_Sat       LIKE(GDBSB:Jumlah_Sat)         !List box control field - type derived from field
GDBSB:Harga            LIKE(GDBSB:Harga)              !List box control field - type derived from field
GDBSB:Total            LIKE(GDBSB:Total)              !List box control field - type derived from field
GHBSB:Tanggal_BSBBK    LIKE(GHBSB:Tanggal_BSBBK)      !List box control field - type derived from field
GHBSB:kode_apotik      LIKE(GHBSB:kode_apotik)        !List box control field - type derived from field
GHBSB:NoBSBBK          LIKE(GHBSB:NoBSBBK)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW2::View:Browse    VIEW(APDTRANS)
                       PROJECT(APD:N0_tran)
                       PROJECT(APD:Kode_brg)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:Total)
                       PROJECT(APD:Harga_Dasar)
                       PROJECT(APD:Diskon)
                       PROJECT(APD:Camp)
                       JOIN(APH:by_transaksi,APD:N0_tran)
                         PROJECT(APH:Tanggal)
                         PROJECT(APH:Biaya)
                         PROJECT(APH:Kode_Apotik)
                         PROJECT(APH:N0_tran)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?List:2
APD:N0_tran            LIKE(APD:N0_tran)              !List box control field - type derived from field
APH:Tanggal            LIKE(APH:Tanggal)              !List box control field - type derived from field
APD:Kode_brg           LIKE(APD:Kode_brg)             !List box control field - type derived from field
APD:Jumlah             LIKE(APD:Jumlah)               !List box control field - type derived from field
APH:Biaya              LIKE(APH:Biaya)                !List box control field - type derived from field
APD:Total              LIKE(APD:Total)                !List box control field - type derived from field
APD:Harga_Dasar        LIKE(APD:Harga_Dasar)          !List box control field - type derived from field
APD:Diskon             LIKE(APD:Diskon)               !List box control field - type derived from field
APH:Kode_Apotik        LIKE(APH:Kode_Apotik)          !List box control field - type derived from field
APD:Camp               LIKE(APD:Camp)                 !Primary key field - type derived from field
APH:N0_tran            LIKE(APH:N0_tran)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW4::View:Browse    VIEW(AptoInDe)
                       PROJECT(APTD:Kode_Brg)
                       PROJECT(APTD:N0_tran)
                       PROJECT(APTD:Jumlah)
                       PROJECT(APTD:Biaya)
                       JOIN(APTI:key_no_tran,APTD:N0_tran)
                         PROJECT(APTI:Tanggal)
                         PROJECT(APTI:Kode_Apotik)
                         PROJECT(APTI:Total_Biaya)
                         PROJECT(APTI:N0_tran)
                       END
                     END
Queue:Browse:3       QUEUE                            !Queue declaration for browse/combo box using ?List:4
APTD:Kode_Brg          LIKE(APTD:Kode_Brg)            !List box control field - type derived from field
APTI:Tanggal           LIKE(APTI:Tanggal)             !List box control field - type derived from field
APTI:Kode_Apotik       LIKE(APTI:Kode_Apotik)         !List box control field - type derived from field
APTI:Total_Biaya       LIKE(APTI:Total_Biaya)         !List box control field - type derived from field
APTI:Total_Biaya       LIKE(APTI:Total_Biaya)         !List box control field - type derived from field - type derived from field
APTD:N0_tran           LIKE(APTD:N0_tran)             !List box control field - type derived from field
APTD:Jumlah            LIKE(APTD:Jumlah)              !List box control field - type derived from field
APTD:Biaya             LIKE(APTD:Biaya)               !List box control field - type derived from field
APTI:N0_tran           LIKE(APTI:N0_tran)             !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW3::View:Browse    VIEW(ApDDProd)
                       PROJECT(APDDP:N0_tran)
                       PROJECT(APDDP:Kode_Brg)
                       PROJECT(APDDP:Jumlah)
                       PROJECT(APDDP:Biaya)
                       PROJECT(APDDP:Kode_Asal)
                       JOIN(APDP:key_no_nota,APDDP:N0_tran,APDDP:Kode_Brg)
                         PROJECT(APDP:N0_tran)
                         PROJECT(APDP:Kode_Brg)
                         JOIN(APHP:key_no_tran,APDP:N0_tran)
                           PROJECT(APHP:Kode_Apotik)
                           PROJECT(APHP:Tanggal)
                           PROJECT(APHP:N0_tran)
                         END
                       END
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?List:3
APDDP:N0_tran          LIKE(APDDP:N0_tran)            !List box control field - type derived from field
APDDP:Kode_Brg         LIKE(APDDP:Kode_Brg)           !List box control field - type derived from field
APDDP:Jumlah           LIKE(APDDP:Jumlah)             !List box control field - type derived from field
APDDP:Biaya            LIKE(APDDP:Biaya)              !List box control field - type derived from field
APHP:Kode_Apotik       LIKE(APHP:Kode_Apotik)         !List box control field - type derived from field
APHP:Tanggal           LIKE(APHP:Tanggal)             !List box control field - type derived from field
APDDP:Kode_Asal        LIKE(APDDP:Kode_Asal)          !Primary key field - type derived from field
APDP:N0_tran           LIKE(APDP:N0_tran)             !Related join file key field - type derived from field
APDP:Kode_Brg          LIKE(APDP:Kode_Brg)            !Related join file key field - type derived from field
APHP:N0_tran           LIKE(APHP:N0_tran)             !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW10::View:Browse   VIEW(AAdjust)
                       PROJECT(AAD:Nomor)
                       PROJECT(AAD:Kode_Apotik)
                       PROJECT(AAD:Tanggal)
                       PROJECT(AAD:Kode_Barang)
                       PROJECT(AAD:Jumlah)
                       PROJECT(AAD:Harga)
                       PROJECT(AAD:Status)
                     END
Queue:Browse:9       QUEUE                            !Queue declaration for browse/combo box using ?List:10
AAD:Nomor              LIKE(AAD:Nomor)                !List box control field - type derived from field
AAD:Kode_Apotik        LIKE(AAD:Kode_Apotik)          !List box control field - type derived from field
AAD:Tanggal            LIKE(AAD:Tanggal)              !List box control field - type derived from field
AAD:Kode_Barang        LIKE(AAD:Kode_Barang)          !List box control field - type derived from field
AAD:Jumlah             LIKE(AAD:Jumlah)               !List box control field - type derived from field
AAD:Tanggal            LIKE(AAD:Tanggal)              !List box control field - type derived from field - type derived from field
AAD:Harga              LIKE(AAD:Harga)                !List box control field - type derived from field
AAD:Status             LIKE(AAD:Status)               !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW11::View:Browse   VIEW(GBarang)
                       PROJECT(GBAR:Kode_brg)
                       PROJECT(GBAR:Nama_Brg)
                       PROJECT(GBAR:No_Satuan)
                       PROJECT(GBAR:Status)
                     END
Queue:Browse:10      QUEUE                            !Queue declaration for browse/combo box using ?List:11
GBAR:Kode_brg          LIKE(GBAR:Kode_brg)            !List box control field - type derived from field
GBAR:Nama_Brg          LIKE(GBAR:Nama_Brg)            !List box control field - type derived from field
GBAR:No_Satuan         LIKE(GBAR:No_Satuan)           !List box control field - type derived from field
GBAR:Status            LIKE(GBAR:Status)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(APtoAPde)
                       PROJECT(APTO:Kode_Brg)
                       PROJECT(APTO:N0_tran)
                       PROJECT(APTO:Jumlah)
                       PROJECT(APTO:Biaya)
                       JOIN(APTH:key_notran,APTO:N0_tran)
                         PROJECT(APTH:Kode_Apotik)
                         PROJECT(APTH:ApotikKeluar)
                         PROJECT(APTH:Tanggal)
                         PROJECT(APTH:N0_tran)
                       END
                     END
Queue:Browse:4       QUEUE                            !Queue declaration for browse/combo box using ?List:5
APTO:Kode_Brg          LIKE(APTO:Kode_Brg)            !List box control field - type derived from field
APTH:Kode_Apotik       LIKE(APTH:Kode_Apotik)         !List box control field - type derived from field
APTH:ApotikKeluar      LIKE(APTH:ApotikKeluar)        !List box control field - type derived from field
APTH:Tanggal           LIKE(APTH:Tanggal)             !List box control field - type derived from field
APTO:N0_tran           LIKE(APTO:N0_tran)             !List box control field - type derived from field
APTO:Jumlah            LIKE(APTO:Jumlah)              !List box control field - type derived from field
APTO:Biaya             LIKE(APTO:Biaya)               !List box control field - type derived from field
APTH:N0_tran           LIKE(APTH:N0_tran)             !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW6::View:Browse    VIEW(AptoInSmdD)
                       PROJECT(APTD1:N0_tran)
                       PROJECT(APTD1:Kode_Brg)
                       PROJECT(APTD1:Jumlah)
                       PROJECT(APTD1:Diskon)
                       PROJECT(APTD1:Harga)
                       JOIN(APTI1:key_no_tran,APTD1:N0_tran)
                         PROJECT(APTI1:Kode_Apotik)
                         PROJECT(APTI1:Tanggal)
                         PROJECT(APTI1:Total_Biaya)
                         PROJECT(APTI1:N0_tran)
                       END
                     END
Queue:Browse:5       QUEUE                            !Queue declaration for browse/combo box using ?List:6
APTI1:Kode_Apotik      LIKE(APTI1:Kode_Apotik)        !List box control field - type derived from field
APTD1:N0_tran          LIKE(APTD1:N0_tran)            !List box control field - type derived from field
APTI1:Tanggal          LIKE(APTI1:Tanggal)            !List box control field - type derived from field
APTI1:Total_Biaya      LIKE(APTI1:Total_Biaya)        !List box control field - type derived from field
APTD1:Kode_Brg         LIKE(APTD1:Kode_Brg)           !List box control field - type derived from field
APTD1:Jumlah           LIKE(APTD1:Jumlah)             !List box control field - type derived from field
APTD1:Diskon           LIKE(APTD1:Diskon)             !List box control field - type derived from field
APTD1:Harga            LIKE(APTD1:Harga)              !List box control field - type derived from field
APTI1:N0_tran          LIKE(APTI1:N0_tran)            !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW7::View:Browse    VIEW(AFIFOOUTTemp)
                       PROJECT(AFI21:Kode_Barang)
                       PROJECT(AFI21:Mata_Uang)
                       PROJECT(AFI21:NoTransaksi)
                       PROJECT(AFI21:Transaksi)
                       PROJECT(AFI21:NoTransKeluar)
                       PROJECT(AFI21:Tanggal)
                       PROJECT(AFI21:Harga)
                       PROJECT(AFI21:Jumlah)
                       PROJECT(AFI21:Tgl_Update)
                       PROJECT(AFI21:Jam_Update)
                       PROJECT(AFI21:Operator)
                       PROJECT(AFI21:Jam)
                       PROJECT(AFI21:Kode_Apotik)
                     END
Queue:Browse:6       QUEUE                            !Queue declaration for browse/combo box using ?List:7
AFI21:Kode_Barang      LIKE(AFI21:Kode_Barang)        !List box control field - type derived from field
AFI21:Mata_Uang        LIKE(AFI21:Mata_Uang)          !List box control field - type derived from field
AFI21:NoTransaksi      LIKE(AFI21:NoTransaksi)        !List box control field - type derived from field
AFI21:Transaksi        LIKE(AFI21:Transaksi)          !List box control field - type derived from field
AFI21:NoTransKeluar    LIKE(AFI21:NoTransKeluar)      !List box control field - type derived from field
AFI21:Tanggal          LIKE(AFI21:Tanggal)            !List box control field - type derived from field
AFI21:Harga            LIKE(AFI21:Harga)              !List box control field - type derived from field
AFI21:Jumlah           LIKE(AFI21:Jumlah)             !List box control field - type derived from field
AFI21:Tgl_Update       LIKE(AFI21:Tgl_Update)         !List box control field - type derived from field
AFI21:Jam_Update       LIKE(AFI21:Jam_Update)         !List box control field - type derived from field
AFI21:Operator         LIKE(AFI21:Operator)           !List box control field - type derived from field
AFI21:Jam              LIKE(AFI21:Jam)                !List box control field - type derived from field
AFI21:Kode_Apotik      LIKE(AFI21:Kode_Apotik)        !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Window               WINDOW('All Transaksi Keluar'),AT(,,421,260),FONT('Arial',8,,FONT:regular),CENTER,GRAY,MDI
                       SHEET,AT(4,2,412,114),USE(?Sheet3)
                         TAB('Nama (F2)'),USE(?Tab12)
                           PROMPT('Nama Obat:'),AT(8,102),USE(?GBAR:Nama_Brg:Prompt)
                           ENTRY(@s40),AT(58,102,60,10),USE(GBAR:Nama_Brg),MSG('Nama Barang'),TIP('Nama Barang')
                         END
                         TAB('Kode (f3)'),USE(?Tab13)
                           PROMPT('Kode Barang:'),AT(10,102),USE(?GBAR:Kode_brg:Prompt)
                           ENTRY(@s10),AT(60,102,60,10),USE(GBAR:Kode_brg),MSG('Kode Barang'),TIP('Kode Barang')
                         END
                       END
                       SHEET,AT(4,118,412,121),USE(?Sheet1)
                         TAB('BSBBK'),USE(?Tab1)
                           LIST,AT(9,136,401,77),USE(?List),IMM,VSCROLL,MSG('Browsing Records'),VCR,FORMAT('40L|M~No BSBBK~@s10@40L|M~Kode Barang~@s10@40D|M~Jumlah Sat~L@n10.2@60D|M~Harga~' &|
   'L@n15.`2@72D|M~Total~L@n18.`2@40D|M~Tanggal BSBBK~L@D6@20D|M~kode apotik~L@s5@'),FROM(Queue:Browse)
                           ENTRY(@n-15.2),AT(125,219,60,10),USE(vl_jum1),DECIMAL(14)
                           BUTTON('Proses SBBK'),AT(201,219,60,14),USE(?Button2)
                         END
                         TAB('Jual'),USE(?Tab2)
                           LIST,AT(7,136,405,79),USE(?List:2),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('64L|M~N 0 tran~@s15@49L|M~Tanggal~@d06@49L|M~Kode Barang~@s10@42R|M~Jumlah~L@n-1' &|
   '2.2@47R|M~Biaya~L@n-15.2@52R|M~Total~L@n-12.2@44D|M~Harga Dasar~L@n-11.2@60D|M~D' &|
   'iskon~L@n15.2@20D|M~Kode Apotik~L@s5@'),FROM(Queue:Browse:1)
                           BUTTON('Proses Retur Jual'),AT(228,219,65,14),USE(?Button3)
                           ENTRY(@n-15.2),AT(159,222,60,10),USE(vl_jum2),DECIMAL(14)
                         END
                         TAB('Ke Instalasi'),USE(?Tab4)
                           LIST,AT(8,136,405,75),USE(?List:4),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('47L|M~Kode Brg~@s10@51L|M~Tanggal~@D06@20L|M~Kode Apotik~@s5@49R|M~Total Biaya~L' &|
   '@n-12.2@62R|M~Total Biaya~L@n-18.2@66L|M~N 0 tran~@s15@53R|M~Jumlah~L@n-15.2@40R' &|
   '|M~Biaya~L@n-12.2@'),FROM(Queue:Browse:3)
                           BUTTON('Proses Dr Instalasi'),AT(215,216,73,14),USE(?Button4)
                           ENTRY(@n-15.2),AT(143,222,60,10),USE(vl_jum3),DECIMAL(14)
                         END
                         TAB('Produksi Minus'),USE(?Tab5)
                           LIST,AT(9,134,402,76),USE(?List:3),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('60L|M~N 0 tran~@s15@40L|M~Kode Brg~@s10@40D|M~Jumlah~L@n10.2@40D|M~Biaya~L@n10.2' &|
   '@20D|M~Kode Apotik~L@s5@44D|M~Tanggal~L@D08@'),FROM(Queue:Browse:2)
                           BUTTON('Proses Produksi Msk'),AT(209,216,69,14),USE(?Button5)
                           ENTRY(@n-15.2),AT(141,219,60,10),USE(vl_jum4),DECIMAL(14)
                         END
                         TAB('Koreksi Minus'),USE(?Tab6)
                           LIST,AT(8,134,403,75),USE(?List:10),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('46L|M~Nomor~@s10@20L|M~Kode Apotik~@s5@48L|M~Tanggal~@d06@43L|M~Kode Barang~@s10' &|
   '@48R|M~Jumlah~L@n-12.2@40D|M~Tanggal~L@d06@53R|M~Harga~L@n-15.2@12D|M~Status~L@n' &|
   '3@'),FROM(Queue:Browse:9)
                           BUTTON('Koreksi Plus'),AT(231,216,80,14),USE(?Button6)
                           ENTRY(@n-15.2),AT(165,219,60,10),USE(vl_jum5),DECIMAL(14)
                         END
                         TAB('Ke Apotik Lain'),USE(?Tab8)
                           LIST,AT(7,134,405,81),USE(?List:5),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('45L|M~Kode Brg~@s10@25L|M~Kode Apotik~@s5@29L|M~Apotik Keluar~@s5@43L|M~Tanggal~' &|
   '@D06@60L|M~N 0 tran~@s15@56D|M~Jumlah~L@n-14@40R|M~Biaya~L@n-14.2@'),FROM(Queue:Browse:4)
                           PROMPT('vl jum 6:'),AT(119,222),USE(?vl_jum6:Prompt)
                           ENTRY(@n-15.2),AT(184,222,60,10),USE(vl_jum6),DECIMAL(14)
                           BUTTON('Proses Dr Aptk Lain'),AT(254,219,78,14),USE(?Button7)
                         END
                         TAB('Ke Sumedang'),USE(?Tab9)
                           LIST,AT(9,134,402,84),USE(?List:6),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('20D|M~Kode Apotik~L@s5@60D|M~N 0 tran~L@s15@44D|M~Tanggal~L@D08@40D|M~Total Biay' &|
   'a~L@n-12@40L|M~Kode Brg~@s10@40D|M~Jumlah~L@n10.2@60D|M~Diskon~L@n15.2@60D|M~Har' &|
   'ga~L@n-15.2@'),FROM(Queue:Browse:5)
                           ENTRY(@n-15.2),AT(163,222,60,10),USE(vl_jum7),DECIMAL(14)
                           BUTTON('Retur Dr Sumedang'),AT(273,222,81,14),USE(?Button8)
                           PROMPT('vl jum 7:'),AT(113,222),USE(?vl_jum7:Prompt)
                         END
                         TAB('FIFOOUT Temp'),USE(?Tab10)
                           LIST,AT(9,135,401,84),USE(?List:7),IMM,HVSCROLL,MSG('Browsing Records'),VCR,FORMAT('40L|M~Kode Barang~@s10@20L|M~Mata Uang~@s5@60L|M~No Transaksi~@s15@24L|M~Transak' &|
   'si~@n3@60L|M~No Trans Keluar~@s15@40L|M~Tanggal~@d17@40L|M~Harga~@n10.2@40L|M~Ju' &|
   'mlah~@n10.2@40L|M~Tgl Update~@d17@32L|M~Jam Update~@t7@80L|M~Operator~@s20@32L|M' &|
   '~Jam~@t7@20L|M~Kode Apotik~@s5@'),FROM(Queue:Browse:6)
                           BUTTON('Proses Ke Fifoout'),AT(317,221,77,14),USE(?Button9)
                           PROMPT('vl jum 8:'),AT(187,224),USE(?vl_jum8:Prompt)
                           ENTRY(@n-15.2),AT(237,224,60,10),USE(vl_jum8),DECIMAL(14)
                         END
                       END
                       LIST,AT(9,18,402,79),USE(?List:11),IMM,VSCROLL,MSG('Browsing Records'),VCR,FORMAT('40L|M~Kode Barang~@s10@160L|M~Nama Obat~@s40@40L|M~Satuan~@s10@12L|M~Status~@n3@'),FROM(Queue:Browse:10)
                       BUTTON('&OK'),AT(344,243,60,14),USE(?OkButton),DEFAULT
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetFromView          PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW2                 CLASS(BrowseClass)                    ! Browse using ?List:2
Q                      &Queue:Browse:1                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetFromView          PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW2::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW4                 CLASS(BrowseClass)                    ! Browse using ?List:4
Q                      &Queue:Browse:3                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetFromView          PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW4::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW3                 CLASS(BrowseClass)                    ! Browse using ?List:3
Q                      &Queue:Browse:2                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetFromView          PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW3::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW10                CLASS(BrowseClass)                    ! Browse using ?List:10
Q                      &Queue:Browse:9                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetFromView          PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW10::Sort0:Locator StepLocatorClass                      ! Default Locator
BRW11                CLASS(BrowseClass)                    ! Browse using ?List:11
Q                      &Queue:Browse:10               !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED ! Method added to host embed code
                     END

BRW11::Sort0:Locator IncrementalLocatorClass               ! Default Locator
BRW11::Sort1:Locator IncrementalLocatorClass               ! Conditional Locator - choice(?Sheet3)=2
BRW5                 CLASS(BrowseClass)                    ! Browse using ?List:5
Q                      &Queue:Browse:4                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetFromView          PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW5::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW6                 CLASS(BrowseClass)                    ! Browse using ?List:6
Q                      &Queue:Browse:5                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
                     END

BRW6::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW7                 CLASS(BrowseClass)                    ! Browse using ?List:7
Q                      &Queue:Browse:6                !Reference to browse queue
Fetch                  PROCEDURE(BYTE Direction),DERIVED   ! Method added to host embed code
ResetFromView          PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

BRW7::Sort0:Locator  StepLocatorClass                      ! Default Locator

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
  GlobalErrors.SetProcedureName('WindowAllTransKeluar')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  WindowTanggal12Apotik()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GBAR:Nama_Brg:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('vg_tanggal1',vg_tanggal1)                          ! Added by: BrowseBox(ABC)
  BIND('vg_tanggal2',vg_tanggal2)                          ! Added by: BrowseBox(ABC)
  BIND('glo:apotik',glo:apotik)                            ! Added by: BrowseBox(ABC)
  BIND('AFI21:Tanggal',AFI21:Tanggal)                      ! Added by: BrowseBox(ABC)
  BIND('AFI21:kode_apotik',AFI21:kode_apotik)              ! Added by: BrowseBox(ABC)
  BIND('AFI21:Kode_Barang',AFI21:Kode_Barang)              ! Added by: BrowseBox(ABC)
  BIND('AFI21:Mata_Uang',AFI21:Mata_Uang)                  ! Added by: BrowseBox(ABC)
  BIND('AFI21:NoTransaksi',AFI21:NoTransaksi)              ! Added by: BrowseBox(ABC)
  BIND('AFI21:Transaksi',AFI21:Transaksi)                  ! Added by: BrowseBox(ABC)
  BIND('AFI21:NoTransKeluar',AFI21:NoTransKeluar)          ! Added by: BrowseBox(ABC)
  BIND('AFI21:Harga',AFI21:Harga)                          ! Added by: BrowseBox(ABC)
  BIND('AFI21:Jumlah',AFI21:Jumlah)                        ! Added by: BrowseBox(ABC)
  BIND('AFI21:Tgl_Update',AFI21:Tgl_Update)                ! Added by: BrowseBox(ABC)
  BIND('AFI21:Jam_Update',AFI21:Jam_Update)                ! Added by: BrowseBox(ABC)
  BIND('AFI21:Operator',AFI21:Operator)                    ! Added by: BrowseBox(ABC)
  BIND('AFI21:Jam',AFI21:Jam)                              ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AAdjust.Open                                      ! File AFIFOOUTTemp used by this procedure, so make sure it's RelationManager is open
  Relate:AFIFOOUTTemp.Open                                 ! File AFIFOOUTTemp used by this procedure, so make sure it's RelationManager is open
  Relate:APDTRANS.SetOpenRelated()
  Relate:APDTRANS.Open                                     ! File AFIFOOUTTemp used by this procedure, so make sure it's RelationManager is open
  Relate:AptoInSmdD.SetOpenRelated()
  Relate:AptoInSmdD.Open                                   ! File AFIFOOUTTemp used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?List,Queue:Browse.ViewPosition,BRW1::View:Browse,Queue:Browse,Relate:GDBSBBK,SELF) ! Initialize the browse manager
  BRW2.Init(?List:2,Queue:Browse:1.ViewPosition,BRW2::View:Browse,Queue:Browse:1,Relate:APDTRANS,SELF) ! Initialize the browse manager
  BRW4.Init(?List:4,Queue:Browse:3.ViewPosition,BRW4::View:Browse,Queue:Browse:3,Relate:AptoInDe,SELF) ! Initialize the browse manager
  BRW3.Init(?List:3,Queue:Browse:2.ViewPosition,BRW3::View:Browse,Queue:Browse:2,Relate:ApDDProd,SELF) ! Initialize the browse manager
  BRW10.Init(?List:10,Queue:Browse:9.ViewPosition,BRW10::View:Browse,Queue:Browse:9,Relate:AAdjust,SELF) ! Initialize the browse manager
  BRW11.Init(?List:11,Queue:Browse:10.ViewPosition,BRW11::View:Browse,Queue:Browse:10,Relate:GBarang,SELF) ! Initialize the browse manager
  BRW5.Init(?List:5,Queue:Browse:4.ViewPosition,BRW5::View:Browse,Queue:Browse:4,Relate:APtoAPde,SELF) ! Initialize the browse manager
  BRW6.Init(?List:6,Queue:Browse:5.ViewPosition,BRW6::View:Browse,Queue:Browse:5,Relate:AptoInSmdD,SELF) ! Initialize the browse manager
  BRW7.Init(?List:7,Queue:Browse:6.ViewPosition,BRW7::View:Browse,Queue:Browse:6,Relate:AFIFOOUTTemp,SELF) ! Initialize the browse manager
  SELF.Open(Window)                                        ! Open window
  ?List{Prop:LineHeight} = 0
  ?List:2{Prop:LineHeight} = 0
  ?List:4{Prop:LineHeight} = 0
  ?List:3{Prop:LineHeight} = 0
  ?List:10{Prop:LineHeight} = 0
  ?List:11{Prop:LineHeight} = 0
  ?List:5{Prop:LineHeight} = 0
  ?List:6{Prop:LineHeight} = 0
  ?List:7{Prop:LineHeight} = 0
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse
  BRW1.AddSortOrder(,GDBSB:KeyBarang)                      ! Add the sort order for GDBSB:KeyBarang for sort order 1
  BRW1.AddRange(GDBSB:KodeBarang,Relate:GDBSBBK,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,GDBSB:KodeBarang,,BRW1)        ! Initialize the browse locator using  using key: GDBSB:KeyBarang , GDBSB:KodeBarang
  BRW1.SetFilter('(GHBSB:Tanggal_BSBBK>=vg_tanggal1 and GHBSB:Tanggal_BSBBK<<=vg_tanggal2 and GHBSB:kode_apotik=glo:apotik)') ! Apply filter expression to browse
  BRW1.AddField(GDBSB:NoBSBBK,BRW1.Q.GDBSB:NoBSBBK)        ! Field GDBSB:NoBSBBK is a hot field or requires assignment from browse
  BRW1.AddField(GDBSB:KodeBarang,BRW1.Q.GDBSB:KodeBarang)  ! Field GDBSB:KodeBarang is a hot field or requires assignment from browse
  BRW1.AddField(GDBSB:Jumlah_Sat,BRW1.Q.GDBSB:Jumlah_Sat)  ! Field GDBSB:Jumlah_Sat is a hot field or requires assignment from browse
  BRW1.AddField(GDBSB:Harga,BRW1.Q.GDBSB:Harga)            ! Field GDBSB:Harga is a hot field or requires assignment from browse
  BRW1.AddField(GDBSB:Total,BRW1.Q.GDBSB:Total)            ! Field GDBSB:Total is a hot field or requires assignment from browse
  BRW1.AddField(GHBSB:Tanggal_BSBBK,BRW1.Q.GHBSB:Tanggal_BSBBK) ! Field GHBSB:Tanggal_BSBBK is a hot field or requires assignment from browse
  BRW1.AddField(GHBSB:kode_apotik,BRW1.Q.GHBSB:kode_apotik) ! Field GHBSB:kode_apotik is a hot field or requires assignment from browse
  BRW1.AddField(GHBSB:NoBSBBK,BRW1.Q.GHBSB:NoBSBBK)        ! Field GHBSB:NoBSBBK is a hot field or requires assignment from browse
  BRW2.Q &= Queue:Browse:1
  BRW2.AddSortOrder(,APD:by_kodebrg)                       ! Add the sort order for APD:by_kodebrg for sort order 1
  BRW2.AddRange(APD:Kode_brg,Relate:APDTRANS,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW2.AddLocator(BRW2::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW2::Sort0:Locator.Init(,APD:Kode_brg,,BRW2)            ! Initialize the browse locator using  using key: APD:by_kodebrg , APD:Kode_brg
  BRW2.SetFilter('(aph:Tanggal>=vg_tanggal1 and aph:Tanggal<<=vg_tanggal2 and aph:kode_apotik=glo:apotik and aph:biaya>0)') ! Apply filter expression to browse
  BRW2.AddField(APD:N0_tran,BRW2.Q.APD:N0_tran)            ! Field APD:N0_tran is a hot field or requires assignment from browse
  BRW2.AddField(APH:Tanggal,BRW2.Q.APH:Tanggal)            ! Field APH:Tanggal is a hot field or requires assignment from browse
  BRW2.AddField(APD:Kode_brg,BRW2.Q.APD:Kode_brg)          ! Field APD:Kode_brg is a hot field or requires assignment from browse
  BRW2.AddField(APD:Jumlah,BRW2.Q.APD:Jumlah)              ! Field APD:Jumlah is a hot field or requires assignment from browse
  BRW2.AddField(APH:Biaya,BRW2.Q.APH:Biaya)                ! Field APH:Biaya is a hot field or requires assignment from browse
  BRW2.AddField(APD:Total,BRW2.Q.APD:Total)                ! Field APD:Total is a hot field or requires assignment from browse
  BRW2.AddField(APD:Harga_Dasar,BRW2.Q.APD:Harga_Dasar)    ! Field APD:Harga_Dasar is a hot field or requires assignment from browse
  BRW2.AddField(APD:Diskon,BRW2.Q.APD:Diskon)              ! Field APD:Diskon is a hot field or requires assignment from browse
  BRW2.AddField(APH:Kode_Apotik,BRW2.Q.APH:Kode_Apotik)    ! Field APH:Kode_Apotik is a hot field or requires assignment from browse
  BRW2.AddField(APD:Camp,BRW2.Q.APD:Camp)                  ! Field APD:Camp is a hot field or requires assignment from browse
  BRW2.AddField(APH:N0_tran,BRW2.Q.APH:N0_tran)            ! Field APH:N0_tran is a hot field or requires assignment from browse
  BRW4.Q &= Queue:Browse:3
  BRW4.AddSortOrder(,APTD:key_kd_brg)                      ! Add the sort order for APTD:key_kd_brg for sort order 1
  BRW4.AddRange(APTD:Kode_Brg,Relate:AptoInDe,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW4.AddLocator(BRW4::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW4::Sort0:Locator.Init(,APTD:Kode_Brg,1,BRW4)          ! Initialize the browse locator using  using key: APTD:key_kd_brg , APTD:Kode_Brg
  BRW4.SetFilter('(apti:Tanggal>=vg_tanggal1 and apti:Tanggal<<=vg_tanggal2 and apti:kode_apotik=glo:apotik and apti:total_biaya>=0)') ! Apply filter expression to browse
  BRW4.AddField(APTD:Kode_Brg,BRW4.Q.APTD:Kode_Brg)        ! Field APTD:Kode_Brg is a hot field or requires assignment from browse
  BRW4.AddField(APTI:Tanggal,BRW4.Q.APTI:Tanggal)          ! Field APTI:Tanggal is a hot field or requires assignment from browse
  BRW4.AddField(APTI:Kode_Apotik,BRW4.Q.APTI:Kode_Apotik)  ! Field APTI:Kode_Apotik is a hot field or requires assignment from browse
  BRW4.AddField(APTI:Total_Biaya,BRW4.Q.APTI:Total_Biaya)  ! Field APTI:Total_Biaya is a hot field or requires assignment from browse
  BRW4.AddField(APTI:Total_Biaya,BRW4.Q.APTI:Total_Biaya)  ! Field APTI:Total_Biaya is a hot field or requires assignment from browse
  BRW4.AddField(APTD:N0_tran,BRW4.Q.APTD:N0_tran)          ! Field APTD:N0_tran is a hot field or requires assignment from browse
  BRW4.AddField(APTD:Jumlah,BRW4.Q.APTD:Jumlah)            ! Field APTD:Jumlah is a hot field or requires assignment from browse
  BRW4.AddField(APTD:Biaya,BRW4.Q.APTD:Biaya)              ! Field APTD:Biaya is a hot field or requires assignment from browse
  BRW4.AddField(APTI:N0_tran,BRW4.Q.APTI:N0_tran)          ! Field APTI:N0_tran is a hot field or requires assignment from browse
  BRW3.Q &= Queue:Browse:2
  BRW3.AddSortOrder(,APDDP:Key_Kode_asal)                  ! Add the sort order for APDDP:Key_Kode_asal for sort order 1
  BRW3.AddRange(APDDP:Kode_Asal,Relate:ApDDProd,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW3.AddLocator(BRW3::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW3::Sort0:Locator.Init(,APDDP:Kode_Asal,1,BRW3)        ! Initialize the browse locator using  using key: APDDP:Key_Kode_asal , APDDP:Kode_Asal
  BRW3.SetFilter('(aphp:Tanggal>=vg_tanggal1 and aphp:Tanggal<<=vg_tanggal2 and aphp:kode_apotik=glo:apotik)') ! Apply filter expression to browse
  BRW3.AddField(APDDP:N0_tran,BRW3.Q.APDDP:N0_tran)        ! Field APDDP:N0_tran is a hot field or requires assignment from browse
  BRW3.AddField(APDDP:Kode_Brg,BRW3.Q.APDDP:Kode_Brg)      ! Field APDDP:Kode_Brg is a hot field or requires assignment from browse
  BRW3.AddField(APDDP:Jumlah,BRW3.Q.APDDP:Jumlah)          ! Field APDDP:Jumlah is a hot field or requires assignment from browse
  BRW3.AddField(APDDP:Biaya,BRW3.Q.APDDP:Biaya)            ! Field APDDP:Biaya is a hot field or requires assignment from browse
  BRW3.AddField(APHP:Kode_Apotik,BRW3.Q.APHP:Kode_Apotik)  ! Field APHP:Kode_Apotik is a hot field or requires assignment from browse
  BRW3.AddField(APHP:Tanggal,BRW3.Q.APHP:Tanggal)          ! Field APHP:Tanggal is a hot field or requires assignment from browse
  BRW3.AddField(APDDP:Kode_Asal,BRW3.Q.APDDP:Kode_Asal)    ! Field APDDP:Kode_Asal is a hot field or requires assignment from browse
  BRW3.AddField(APDP:N0_tran,BRW3.Q.APDP:N0_tran)          ! Field APDP:N0_tran is a hot field or requires assignment from browse
  BRW3.AddField(APDP:Kode_Brg,BRW3.Q.APDP:Kode_Brg)        ! Field APDP:Kode_Brg is a hot field or requires assignment from browse
  BRW3.AddField(APHP:N0_tran,BRW3.Q.APHP:N0_tran)          ! Field APHP:N0_tran is a hot field or requires assignment from browse
  BRW10.Q &= Queue:Browse:9
  BRW10.AddSortOrder(,AAD:GBarang_GAdjusment_Key)          ! Add the sort order for AAD:GBarang_GAdjusment_Key for sort order 1
  BRW10.AddRange(AAD:Kode_Barang,Relate:AAdjust,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW10.AddLocator(BRW10::Sort0:Locator)                   ! Browse has a locator for sort order 1
  BRW10::Sort0:Locator.Init(,AAD:Kode_Barang,,BRW10)       ! Initialize the browse locator using  using key: AAD:GBarang_GAdjusment_Key , AAD:Kode_Barang
  BRW10.SetFilter('(aad:Tanggal>=vg_tanggal1 and aad:Tanggal<<=vg_tanggal2 and aad:kode_apotik=glo:apotik and aad:status=2)') ! Apply filter expression to browse
  BRW10.AddField(AAD:Nomor,BRW10.Q.AAD:Nomor)              ! Field AAD:Nomor is a hot field or requires assignment from browse
  BRW10.AddField(AAD:Kode_Apotik,BRW10.Q.AAD:Kode_Apotik)  ! Field AAD:Kode_Apotik is a hot field or requires assignment from browse
  BRW10.AddField(AAD:Tanggal,BRW10.Q.AAD:Tanggal)          ! Field AAD:Tanggal is a hot field or requires assignment from browse
  BRW10.AddField(AAD:Kode_Barang,BRW10.Q.AAD:Kode_Barang)  ! Field AAD:Kode_Barang is a hot field or requires assignment from browse
  BRW10.AddField(AAD:Jumlah,BRW10.Q.AAD:Jumlah)            ! Field AAD:Jumlah is a hot field or requires assignment from browse
  BRW10.AddField(AAD:Tanggal,BRW10.Q.AAD:Tanggal)          ! Field AAD:Tanggal is a hot field or requires assignment from browse
  BRW10.AddField(AAD:Harga,BRW10.Q.AAD:Harga)              ! Field AAD:Harga is a hot field or requires assignment from browse
  BRW10.AddField(AAD:Status,BRW10.Q.AAD:Status)            ! Field AAD:Status is a hot field or requires assignment from browse
  BRW11.Q &= Queue:Browse:10
  BRW11.AddSortOrder(,GBAR:KeyKodeBrg)                     ! Add the sort order for GBAR:KeyKodeBrg for sort order 1
  BRW11.AddLocator(BRW11::Sort1:Locator)                   ! Browse has a locator for sort order 1
  BRW11::Sort1:Locator.Init(?GBAR:Kode_brg,GBAR:Kode_brg,,BRW11) ! Initialize the browse locator using ?GBAR:Kode_brg using key: GBAR:KeyKodeBrg , GBAR:Kode_brg
  BRW11.SetFilter('(gbar:status=1)')                       ! Apply filter expression to browse
  BRW11.AddSortOrder(,GBAR:KeyNama)                        ! Add the sort order for GBAR:KeyNama for sort order 2
  BRW11.AddLocator(BRW11::Sort0:Locator)                   ! Browse has a locator for sort order 2
  BRW11::Sort0:Locator.Init(?GBAR:Nama_Brg,GBAR:Nama_Brg,,BRW11) ! Initialize the browse locator using ?GBAR:Nama_Brg using key: GBAR:KeyNama , GBAR:Nama_Brg
  BRW11.SetFilter('(gbar:status=1)')                       ! Apply filter expression to browse
  BRW11.AddField(GBAR:Kode_brg,BRW11.Q.GBAR:Kode_brg)      ! Field GBAR:Kode_brg is a hot field or requires assignment from browse
  BRW11.AddField(GBAR:Nama_Brg,BRW11.Q.GBAR:Nama_Brg)      ! Field GBAR:Nama_Brg is a hot field or requires assignment from browse
  BRW11.AddField(GBAR:No_Satuan,BRW11.Q.GBAR:No_Satuan)    ! Field GBAR:No_Satuan is a hot field or requires assignment from browse
  BRW11.AddField(GBAR:Status,BRW11.Q.GBAR:Status)          ! Field GBAR:Status is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse:4
  BRW5.AddSortOrder(,APTO:KeyKodeBrg)                      ! Add the sort order for APTO:KeyKodeBrg for sort order 1
  BRW5.AddRange(APTO:Kode_Brg,Relate:APtoAPde,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort0:Locator.Init(,APTO:Kode_Brg,1,BRW5)          ! Initialize the browse locator using  using key: APTO:KeyKodeBrg , APTO:Kode_Brg
  BRW5.SetFilter('(apth:Tanggal>=vg_tanggal1 and apth:Tanggal<<=vg_tanggal2 and apth:kode_apotik=glo:apotik)') ! Apply filter expression to browse
  BRW5.AddField(APTO:Kode_Brg,BRW5.Q.APTO:Kode_Brg)        ! Field APTO:Kode_Brg is a hot field or requires assignment from browse
  BRW5.AddField(APTH:Kode_Apotik,BRW5.Q.APTH:Kode_Apotik)  ! Field APTH:Kode_Apotik is a hot field or requires assignment from browse
  BRW5.AddField(APTH:ApotikKeluar,BRW5.Q.APTH:ApotikKeluar) ! Field APTH:ApotikKeluar is a hot field or requires assignment from browse
  BRW5.AddField(APTH:Tanggal,BRW5.Q.APTH:Tanggal)          ! Field APTH:Tanggal is a hot field or requires assignment from browse
  BRW5.AddField(APTO:N0_tran,BRW5.Q.APTO:N0_tran)          ! Field APTO:N0_tran is a hot field or requires assignment from browse
  BRW5.AddField(APTO:Jumlah,BRW5.Q.APTO:Jumlah)            ! Field APTO:Jumlah is a hot field or requires assignment from browse
  BRW5.AddField(APTO:Biaya,BRW5.Q.APTO:Biaya)              ! Field APTO:Biaya is a hot field or requires assignment from browse
  BRW5.AddField(APTH:N0_tran,BRW5.Q.APTH:N0_tran)          ! Field APTH:N0_tran is a hot field or requires assignment from browse
  BRW6.Q &= Queue:Browse:5
  BRW6.AddSortOrder(,APTD1:key_kd_brg)                     ! Add the sort order for APTD1:key_kd_brg for sort order 1
  BRW6.AddRange(APTD1:Kode_Brg,Relate:AptoInSmdD,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW6.AddLocator(BRW6::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW6::Sort0:Locator.Init(,APTD1:Kode_Brg,1,BRW6)         ! Initialize the browse locator using  using key: APTD1:key_kd_brg , APTD1:Kode_Brg
  BRW6.SetFilter('(apti1:Tanggal>=vg_tanggal1 and apti1:Tanggal<<=vg_tanggal2 and apti1:kode_apotik=glo:apotik and apti1:total_biaya>=0)') ! Apply filter expression to browse
  BRW6.AddField(APTI1:Kode_Apotik,BRW6.Q.APTI1:Kode_Apotik) ! Field APTI1:Kode_Apotik is a hot field or requires assignment from browse
  BRW6.AddField(APTD1:N0_tran,BRW6.Q.APTD1:N0_tran)        ! Field APTD1:N0_tran is a hot field or requires assignment from browse
  BRW6.AddField(APTI1:Tanggal,BRW6.Q.APTI1:Tanggal)        ! Field APTI1:Tanggal is a hot field or requires assignment from browse
  BRW6.AddField(APTI1:Total_Biaya,BRW6.Q.APTI1:Total_Biaya) ! Field APTI1:Total_Biaya is a hot field or requires assignment from browse
  BRW6.AddField(APTD1:Kode_Brg,BRW6.Q.APTD1:Kode_Brg)      ! Field APTD1:Kode_Brg is a hot field or requires assignment from browse
  BRW6.AddField(APTD1:Jumlah,BRW6.Q.APTD1:Jumlah)          ! Field APTD1:Jumlah is a hot field or requires assignment from browse
  BRW6.AddField(APTD1:Diskon,BRW6.Q.APTD1:Diskon)          ! Field APTD1:Diskon is a hot field or requires assignment from browse
  BRW6.AddField(APTD1:Harga,BRW6.Q.APTD1:Harga)            ! Field APTD1:Harga is a hot field or requires assignment from browse
  BRW6.AddField(APTI1:N0_tran,BRW6.Q.APTI1:N0_tran)        ! Field APTI1:N0_tran is a hot field or requires assignment from browse
  BRW7.Q &= Queue:Browse:6
  BRW7.AddSortOrder(,AFI21:KEY1)                           ! Add the sort order for AFI21:KEY1 for sort order 1
  BRW7.AddRange(AFI21:Kode_Barang,Relate:AFIFOOUTTemp,Relate:GBarang) ! Add file relationship range limit for sort order 1
  BRW7.AddLocator(BRW7::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW7::Sort0:Locator.Init(,AFI21:Mata_Uang,,BRW7)         ! Initialize the browse locator using  using key: AFI21:KEY1 , AFI21:Mata_Uang
  BRW7.SetFilter('(AFI21:Tanggal>=vg_tanggal1 and AFI21:Tanggal<<=vg_tanggal2 and AFI21:kode_apotik=glo:apotik)') ! Apply filter expression to browse
  BRW7.AddField(AFI21:Kode_Barang,BRW7.Q.AFI21:Kode_Barang) ! Field AFI21:Kode_Barang is a hot field or requires assignment from browse
  BRW7.AddField(AFI21:Mata_Uang,BRW7.Q.AFI21:Mata_Uang)    ! Field AFI21:Mata_Uang is a hot field or requires assignment from browse
  BRW7.AddField(AFI21:NoTransaksi,BRW7.Q.AFI21:NoTransaksi) ! Field AFI21:NoTransaksi is a hot field or requires assignment from browse
  BRW7.AddField(AFI21:Transaksi,BRW7.Q.AFI21:Transaksi)    ! Field AFI21:Transaksi is a hot field or requires assignment from browse
  BRW7.AddField(AFI21:NoTransKeluar,BRW7.Q.AFI21:NoTransKeluar) ! Field AFI21:NoTransKeluar is a hot field or requires assignment from browse
  BRW7.AddField(AFI21:Tanggal,BRW7.Q.AFI21:Tanggal)        ! Field AFI21:Tanggal is a hot field or requires assignment from browse
  BRW7.AddField(AFI21:Harga,BRW7.Q.AFI21:Harga)            ! Field AFI21:Harga is a hot field or requires assignment from browse
  BRW7.AddField(AFI21:Jumlah,BRW7.Q.AFI21:Jumlah)          ! Field AFI21:Jumlah is a hot field or requires assignment from browse
  BRW7.AddField(AFI21:Tgl_Update,BRW7.Q.AFI21:Tgl_Update)  ! Field AFI21:Tgl_Update is a hot field or requires assignment from browse
  BRW7.AddField(AFI21:Jam_Update,BRW7.Q.AFI21:Jam_Update)  ! Field AFI21:Jam_Update is a hot field or requires assignment from browse
  BRW7.AddField(AFI21:Operator,BRW7.Q.AFI21:Operator)      ! Field AFI21:Operator is a hot field or requires assignment from browse
  BRW7.AddField(AFI21:Jam,BRW7.Q.AFI21:Jam)                ! Field AFI21:Jam is a hot field or requires assignment from browse
  BRW7.AddField(AFI21:Kode_Apotik,BRW7.Q.AFI21:Kode_Apotik) ! Field AFI21:Kode_Apotik is a hot field or requires assignment from browse
  INIMgr.Fetch('WindowAllTransKeluar',Window)              ! Restore window settings from non-volatile store
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW2.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW4.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW3.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW10.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
  BRW11.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
  BRW5.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW6.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW7.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAdjust.Close
    Relate:AFIFOOUTTemp.Close
    Relate:APDTRANS.Close
    Relate:AptoInSmdD.Close
  END
  IF SELF.Opened
    INIMgr.Update('WindowAllTransKeluar',Window)           ! Save window data to non-volatile store
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
    OF ?Button2
      glo_kode_barang=GBAR:Kode_brg
      display
    OF ?Button3
      glo_kode_barang=GBAR:Kode_brg
      display
    OF ?Button4
      glo_kode_barang=GBAR:Kode_brg
      display
    OF ?Button5
      glo_kode_barang=GBAR:Kode_brg
      display
    OF ?Button6
      glo_kode_barang=GBAR:Kode_brg
      display
    OF ?Button7
      glo_kode_barang=GBAR:Kode_brg
      display
    OF ?Button8
      glo_kode_barang=GBAR:Kode_brg
      display
    OF ?Button9
      glo_kode_barang=GBAR:Kode_brg
      display
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Button2
      ThisWindow.Update
      START(ProsesFIFOOUTBSBBK, 25000)
      ThisWindow.Reset
    OF ?Button3
      ThisWindow.Update
      START(ProsesFIFOOUTJual, 25000)
      ThisWindow.Reset
    OF ?Button4
      ThisWindow.Update
      START(ProsesFIFOOUTDrInstalasi, 25000)
      ThisWindow.Reset
    OF ?Button5
      ThisWindow.Update
      START(ProsesProduksiKeluar, 25000)
      ThisWindow.Reset
    OF ?Button6
      ThisWindow.Update
      START(ProsesKoreksiMinus, 25000)
      ThisWindow.Reset
    OF ?Button7
      ThisWindow.Update
      START(ProsesKeApotikLain, 25000)
      ThisWindow.Reset
    OF ?Button8
      ThisWindow.Update
      START(ProsesKeSumedang, 25000)
      ThisWindow.Reset
    OF ?Button9
      ThisWindow.Update
      START(ProsesDrOutTempKeFIFOUT, 25000)
      ThisWindow.Reset
    OF ?OkButton
      ThisWindow.Update
      break
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW1.ResetFromView PROCEDURE

vl_jum1:Sum          REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:GDBSBBK.SetQuickScan(1)
  SELF.Reset
  LOOP
    CASE SELF.Next()
    OF Level:Notify
      BREAK
    OF Level:Fatal
      SETCURSOR()
      RETURN
    END
    SELF.SetQueueRecord
    vl_jum1:Sum += GDBSB:Jumlah_Sat
  END
  vl_jum1 = vl_jum1:Sum
  PARENT.ResetFromView
  Relate:GDBSBBK.SetQuickScan(0)
  SETCURSOR()


BRW2.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW2.ResetFromView PROCEDURE

vl_jum2:Sum          REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:APDTRANS.SetQuickScan(1)
  SELF.Reset
  LOOP
    CASE SELF.Next()
    OF Level:Notify
      BREAK
    OF Level:Fatal
      SETCURSOR()
      RETURN
    END
    SELF.SetQueueRecord
    vl_jum2:Sum += APD:Jumlah
  END
  vl_jum2 = vl_jum2:Sum
  PARENT.ResetFromView
  Relate:APDTRANS.SetQuickScan(0)
  SETCURSOR()


BRW4.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW4.ResetFromView PROCEDURE

vl_jum3:Sum          REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:AptoInDe.SetQuickScan(1)
  SELF.Reset
  LOOP
    CASE SELF.Next()
    OF Level:Notify
      BREAK
    OF Level:Fatal
      SETCURSOR()
      RETURN
    END
    SELF.SetQueueRecord
    vl_jum3:Sum += APTD:Jumlah
  END
  vl_jum3 = vl_jum3:Sum
  PARENT.ResetFromView
  Relate:AptoInDe.SetQuickScan(0)
  SETCURSOR()


BRW3.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW3.ResetFromView PROCEDURE

vl_jum4:Sum          REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:ApDDProd.SetQuickScan(1)
  SELF.Reset
  LOOP
    CASE SELF.Next()
    OF Level:Notify
      BREAK
    OF Level:Fatal
      SETCURSOR()
      RETURN
    END
    SELF.SetQueueRecord
    vl_jum4:Sum += APDDP:Jumlah
  END
  vl_jum4 = vl_jum4:Sum
  PARENT.ResetFromView
  Relate:ApDDProd.SetQuickScan(0)
  SETCURSOR()


BRW10.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW10.ResetFromView PROCEDURE

vl_jum5:Sum          REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:AAdjust.SetQuickScan(1)
  SELF.Reset
  LOOP
    CASE SELF.Next()
    OF Level:Notify
      BREAK
    OF Level:Fatal
      SETCURSOR()
      RETURN
    END
    SELF.SetQueueRecord
    vl_jum5:Sum += AAD:Jumlah
  END
  vl_jum5 = vl_jum5:Sum
  PARENT.ResetFromView
  Relate:AAdjust.SetQuickScan(0)
  SETCURSOR()


BRW11.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW11.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF choice(?Sheet3)=2
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


BRW5.ResetFromView PROCEDURE

vl_jum6:Sum          REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:APtoAPde.SetQuickScan(1)
  SELF.Reset
  LOOP
    CASE SELF.Next()
    OF Level:Notify
      BREAK
    OF Level:Fatal
      SETCURSOR()
      RETURN
    END
    SELF.SetQueueRecord
    vl_jum6:Sum += APTO:Jumlah
  END
  vl_jum6 = vl_jum6:Sum
  PARENT.ResetFromView
  Relate:APtoAPde.SetQuickScan(0)
  SETCURSOR()


BRW6.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW7.Fetch PROCEDURE(BYTE Direction)

GreenBarIndex   LONG
  CODE
  PARENT.Fetch(Direction)


BRW7.ResetFromView PROCEDURE

vl_jum8:Sum          REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:AFIFOOUTTemp.SetQuickScan(1)
  SELF.Reset
  LOOP
    CASE SELF.Next()
    OF Level:Notify
      BREAK
    OF Level:Fatal
      SETCURSOR()
      RETURN
    END
    SELF.SetQueueRecord
    vl_jum8:Sum += AFI21:Jumlah
  END
  vl_jum8 = vl_jum8:Sum
  PARENT.ResetFromView
  Relate:AFIFOOUTTemp.SetQuickScan(0)
  SETCURSOR()

ProsesFIFOOUTJual PROCEDURE                                ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
Process:View         VIEW(APDTRANS)
                       PROJECT(APD:Jumlah)
                       PROJECT(APD:N0_tran)
                       JOIN(APH:by_transaksi,APD:N0_tran)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Reset                  PROCEDURE(BYTE Force=0),DERIVED     ! Method added to host embed code
Update                 PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ProgressMgr          StepClass                             ! Progress Manager

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
  GlobalErrors.SetProcedureName('ProsesFIFOOUTJual')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  WindowTanggal12Apotik()
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('vg_tanggal1',vg_tanggal1)                          ! Added by: Process
  BIND('vg_tanggal2',vg_tanggal2)                          ! Added by: Process
  BIND('glo:apotik',glo:apotik)                            ! Added by: Process
  BIND('glo_kode_barang',glo_kode_barang)                  ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File AFIFOOUTTemp used by this procedure, so make sure it's RelationManager is open
  Relate:AFIFOOUTTemp.Open                                 ! File AFIFOOUTTemp used by this procedure, so make sure it's RelationManager is open
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesFIFOOUTJual',ProgressWindow)         ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:APDTRANS, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ThisProcess.SetFilter('aph:Tanggal>=vg_tanggal1 and aph:Tanggal<<=vg_tanggal2 and aph:kode_apotik=glo:apotik and aph:biaya>0 and apd:kode_brg=glo_kode_barang')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(APDTRANS,'QUICKSCAN=on')
  SEND(APHTRANS,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AFIFOIN.Close
    Relate:AFIFOOUTTemp.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesFIFOOUTJual',ProgressWindow)      ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  APH:N0_tran = APD:N0_tran                                ! Assign linking field value
  Access:APHTRANS.Fetch(APH:by_transaksi)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APH:N0_tran = APD:N0_tran                                ! Assign linking field value
  Access:APHTRANS.Fetch(APH:by_transaksi)


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  !message(APD:Kode_brg&' '&APH:Kode_Apotik)
  GSTO:Kode_Apotik    =APH:Kode_Apotik
  GSTO:Kode_Barang    =APD:Kode_brg
  access:gstokaptk.fetch(GSTO:KeyBarang)
  AFI21:Kode_Barang     =APD:Kode_brg
  AFI21:Mata_Uang       ='Rp'
  AFI21:NoTransaksi     =APD:N0_tran
  AFI21:Transaksi       =1
  AFI21:NoTransKeluar   =APD:N0_tran
  AFI21:Tanggal         =APH:Tanggal
  AFI21:Harga           =round(GSTO:Harga_Dasar*1.1,.01)
  AFI21:Jumlah          =APD:Jumlah
  AFI21:Tgl_Update      =APH:Tanggal
  AFI21:Jam_Update      =APH:Jam
  AFI21:Operator        ='ADI'
  AFI21:Jam             =APH:Jam
  AFI21:Kode_Apotik     =APH:Kode_Apotik
  access:afifoouttemp.insert()
  RETURN ReturnValue

ProsesFIFOOUTDrInstalasi PROCEDURE                         ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
Process:View         VIEW(AptoInDe)
                       PROJECT(APTD:Biaya)
                       PROJECT(APTD:Jumlah)
                       PROJECT(APTD:N0_tran)
                       JOIN(APTI:key_no_tran,APTD:N0_tran)
                         PROJECT(APTI:Kode_Apotik)
                         PROJECT(APTI:Tanggal)
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Reset                  PROCEDURE(BYTE Force=0),DERIVED     ! Method added to host embed code
Update                 PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ProgressMgr          StepClass                             ! Progress Manager

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
  GlobalErrors.SetProcedureName('ProsesFIFOOUTDrInstalasi')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  WindowTanggal12Apotik()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('vg_tanggal1',vg_tanggal1)                          ! Added by: Process
  BIND('vg_tanggal2',vg_tanggal2)                          ! Added by: Process
  BIND('glo:apotik',glo:apotik)                            ! Added by: Process
  BIND('glo_kode_barang',glo_kode_barang)                  ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File AFIFOOUTTemp used by this procedure, so make sure it's RelationManager is open
  Relate:AFIFOOUTTemp.Open                                 ! File AFIFOOUTTemp used by this procedure, so make sure it's RelationManager is open
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesFIFOOUTDrInstalasi',ProgressWindow)  ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:AptoInDe, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ThisProcess.SetFilter('apti:Tanggal>=vg_tanggal1 and apti:Tanggal<<=vg_tanggal2 and apti:kode_apotik=glo:apotik and apti:total_biaya>=0 and APTD:Kode_Brg=glo_kode_barang')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(AptoInDe,'QUICKSCAN=on')
  SEND(AptoInHe,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AFIFOIN.Close
    Relate:AFIFOOUTTemp.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesFIFOOUTDrInstalasi',ProgressWindow) ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  APTI:N0_tran = APTD:N0_tran                              ! Assign linking field value
  Access:AptoInHe.Fetch(APTI:key_no_tran)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APTI:N0_tran = APTD:N0_tran                              ! Assign linking field value
  Access:AptoInHe.Fetch(APTI:key_no_tran)


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  GSTO:Kode_Apotik    =APTI:Kode_Apotik
  GSTO:Kode_Barang    =APTD:Kode_Brg
  access:gstokaptk.fetch(GSTO:KeyBarang)
  AFI21:Kode_Barang     =APTD:Kode_Brg
  AFI21:Mata_Uang       ='Rp'
  AFI21:NoTransaksi     =APTD:N0_tran
  AFI21:Transaksi       =1
  AFI21:NoTransKeluar   =APTD:N0_tran
  AFI21:Tanggal         =APTI:Tanggal
  AFI21:Harga           =round(GSTO:Harga_Dasar*1.1,.01)
  AFI21:Jumlah          =APTD:Jumlah
  AFI21:Tgl_Update      =APTI:Tanggal
  AFI21:Jam_Update      =clock()
  AFI21:Operator        ='ADI'
  AFI21:Jam             =clock()
  AFI21:Kode_Apotik     =APTI:Kode_Apotik
  access:afifoouttemp.insert()
  RETURN ReturnValue

ProsesProduksiKeluar PROCEDURE                             ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
Process:View         VIEW(ApDDProd)
                       PROJECT(APDDP:Biaya)
                       PROJECT(APDDP:Jumlah)
                       PROJECT(APDDP:N0_tran)
                       PROJECT(APDDP:Kode_Brg)
                       JOIN(APDP:key_no_nota,APDDP:N0_tran,APDDP:Kode_Brg)
                         PROJECT(APDP:N0_tran)
                         JOIN(APHP:key_no_tran,APDP:N0_tran)
                         END
                       END
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Reset                  PROCEDURE(BYTE Force=0),DERIVED     ! Method added to host embed code
Update                 PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ProgressMgr          StepClass                             ! Progress Manager

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
  GlobalErrors.SetProcedureName('ProsesProduksiKeluar')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  WindowTanggal12Apotik()
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('vg_tanggal1',vg_tanggal1)                          ! Added by: Process
  BIND('vg_tanggal2',vg_tanggal2)                          ! Added by: Process
  BIND('glo:apotik',glo:apotik)                            ! Added by: Process
  BIND('glo_kode_barang',glo_kode_barang)                  ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Relate:AFIFOOUTTemp.Open                                 ! File GStokAptk used by this procedure, so make sure it's RelationManager is open
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesProduksiKeluar',ProgressWindow)      ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:ApDDProd, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ThisProcess.SetFilter('aphp:Tanggal>=vg_tanggal1 and aphp:Tanggal<<=vg_tanggal2 and aphp:kode_apotik=glo:apotik and apddp:kode_asal=glo_kode_barang')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(ApDDProd,'QUICKSCAN=on')
  SEND(ApDProd,'QUICKSCAN=on')
  SEND(ApHProd,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AFIFOIN.Close
    Relate:AFIFOOUTTemp.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesProduksiKeluar',ProgressWindow)   ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF ProgressWindow{Prop:AcceptAll} THEN RETURN.
  APDP:N0_tran = APDDP:N0_tran                             ! Assign linking field value
  APDP:Kode_Brg = APDDP:Kode_Brg                           ! Assign linking field value
  Access:ApDProd.Fetch(APDP:key_no_nota)
  APHP:N0_tran = APDP:N0_tran                              ! Assign linking field value
  Access:ApHProd.Fetch(APHP:key_no_tran)
  PARENT.Reset(Force)


ThisWindow.Update PROCEDURE

  CODE
  PARENT.Update
  APDP:N0_tran = APDDP:N0_tran                             ! Assign linking field value
  APDP:Kode_Brg = APDDP:Kode_Brg                           ! Assign linking field value
  Access:ApDProd.Fetch(APDP:key_no_nota)
  APHP:N0_tran = APDP:N0_tran                              ! Assign linking field value
  Access:ApHProd.Fetch(APHP:key_no_tran)


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  GSTO:Kode_Apotik    =APHP:Kode_Apotik
  GSTO:Kode_Barang    =APDDP:Kode_Asal
  access:gstokaptk.fetch(GSTO:KeyBarang)
  AFI21:Kode_Barang     =APDDP:Kode_Asal
  AFI21:Mata_Uang       ='Rp'
  AFI21:NoTransaksi     =APDP:N0_tran
  AFI21:Transaksi       =1
  AFI21:NoTransKeluar   =APDDP:N0_tran
  AFI21:Tanggal         =APHP:Tanggal
  AFI21:Harga           =round(GSTO:Harga_Dasar*1.1,.01)
  AFI21:Jumlah          =APDDP:Jumlah
  AFI21:Tgl_Update      =APHP:Tanggal
  AFI21:Jam_Update      =clock()
  AFI21:Operator        ='ADI'
  AFI21:Jam             =clock()
  AFI21:Kode_Apotik     =APHP:Kode_Apotik
  access:afifoouttemp.insert()
  RETURN ReturnValue

ProsesKoreksiMinus PROCEDURE                               ! Generated from procedure template - Process

FilesOpened          BYTE                                  !
Progress:Thermometer BYTE                                  !
Process:View         VIEW(AAdjust)
                     END
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),FONT('Arial',8,,),CENTER,TIMER(1),GRAY
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ProgressMgr          StepClass                             ! Progress Manager

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
  GlobalErrors.SetProcedureName('ProsesKoreksiMinus')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  WindowTanggal12Apotik()
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('vg_tanggal1',vg_tanggal1)                          ! Added by: Process
  BIND('vg_tanggal2',vg_tanggal2)                          ! Added by: Process
  BIND('glo:apotik',glo:apotik)                            ! Added by: Process
  BIND('glo_kode_barang',glo_kode_barang)                  ! Added by: Process
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AAdjust.Open                                      ! File AFIFOOUTTemp used by this procedure, so make sure it's RelationManager is open
  Relate:AFIFOIN.SetOpenRelated()
  Relate:AFIFOIN.Open                                      ! File AFIFOOUTTemp used by this procedure, so make sure it's RelationManager is open
  Relate:AFIFOOUTTemp.Open                                 ! File AFIFOOUTTemp used by this procedure, so make sure it's RelationManager is open
  Access:AFIFOOUT.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:GStokAptk.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesKoreksiMinus',ProgressWindow)        ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:AAdjust, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ThisProcess.SetFilter('aad:Tanggal>=vg_tanggal1 and aad:Tanggal<<=vg_tanggal2 and aad:kode_apotik=glo:apotik and aad:status=2 and aad:kode_barang=glo_kode_barang')
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(AAdjust,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:AAdjust.Close
    Relate:AFIFOIN.Close
    Relate:AFIFOOUTTemp.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesKoreksiMinus',ProgressWindow)     ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GSTO:Kode_Apotik    =AAD:Kode_Apotik
  GSTO:Kode_Barang    =AAD:Kode_Barang
  access:gstokaptk.fetch(GSTO:KeyBarang)
  AFI21:Kode_Barang     =AAD:Kode_Barang
  AFI21:Mata_Uang       ='Rp'
  AFI21:NoTransaksi     =AAD:Nomor
  AFI21:Transaksi       =1
  AFI21:NoTransKeluar   =AAD:Nomor
  AFI21:Tanggal         =AAD:Tanggal
  AFI21:Harga           =round(GSTO:Harga_Dasar*1.1,.01)
  AFI21:Jumlah          =AAD:Jumlah
  AFI21:Tgl_Update      =AAD:Tanggal
  AFI21:Jam_Update      =AAD:Jam
  AFI21:Operator        ='ADI'
  AFI21:Jam             =AAD:Jam
  AFI21:Kode_Apotik     =AAD:Kode_Apotik
  access:afifoouttemp.insert()
  ReturnValue = PARENT.TakeRecord()
  RETURN ReturnValue

