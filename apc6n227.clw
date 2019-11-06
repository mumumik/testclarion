

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N227.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N063.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('APC6N228.INC'),ONCE        !Req'd for module callout resolution
                     END


Trig_WindowReturRawatJalanNonBilling PROCEDURE             ! Generated from procedure template - Window

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
  GlobalErrors.SetProcedureName('Trig_WindowReturRawatJalanNonBilling')
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
  INIMgr.Fetch('Trig_WindowReturRawatJalanNonBilling',window) ! Restore window settings from non-volatile store
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
    INIMgr.Update('Trig_WindowReturRawatJalanNonBilling',window) ! Save window data to non-volatile store
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
          if sub(APH:N0_tran,1,3)<>'APO' or APH:Ra_jal<>1 then
              loc::err = 1
              loc::message = 6
          else
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
                                  !!loc::err = 1
                                  !!loc::message = 4
                                  !ELSE
                                  loc::pers_disc = 0
      
                                  apdtrans{prop:sql}='select * from dba.apdtrans where n0_tran='''&APH:N0_tran&''' and camp=0'
                                  LOOP
                                  IF Access:APDTRANS.Next()<>level:benign then break.
                                  IF APD:Kode_brg = '_Disc'
                                      loc::pers_disc = APD:Total / (APD:Total+APH:Biaya)
                                  BREAK
                                  END
                              END
      
      
      
      
                          apdtrans{prop:sql}='select * from dba.apdtrans where n0_tran='''&APH:N0_tran&''' and camp=0'
                          LOOP
                              IF Access:APDTRANS.Next()<>level:benign then break.
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
                                          APKL:Harga_Dasar_benar =  APD:Harga_Dasar
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
              else
                 message('Nota Sudah Ditutup !')
              end
              else
                 message('Nota Tidak Ketemu !')
              end
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
          OF 6
              MESSAGE('Tidak dapat melakukan retur dengan menu ini, silahkan menggunakan menu Retur Penjualan Pasien Rawat Jalan / Retur Penjualan Pasien Rawat Jalan Per Transaksi')
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
      Trig_BrowseReturRawatJalanNonBilling
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

