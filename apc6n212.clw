

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N212.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N211.INC'),ONCE        !Req'd for module callout resolution
                     END


Trig_WindowCariNotaRanap PROCEDURE                         ! Generated from procedure template - Window

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
window               WINDOW('Laporan rincian obat-obatan rawat inap'),AT(,,287,158),ICON('Vcrprior.ico'),GRAY,MDI,IMM
                       PANEL,AT(15,8,203,47),USE(?Panel1)
                       STRING('Pasien Rawat Inap'),AT(67,10,91,11),USE(?String1),FONT('Comic Sans MS',,COLOR:Purple,FONT:italic)
                       LINE,AT(16,24,200,0),USE(?Line1),COLOR(040FF00H),LINEWIDTH(2)
                       PROMPT('Nomor Billing :'),AT(22,32),USE(?glo::no_nota:Prompt),FONT('Arial Black',12,COLOR:Black,)
                       ENTRY(@s20),AT(109,32,86,14),USE(glo::no_nota),FONT('Arial Black',12,,),UPR
                       GROUP('Nama Pasien'),AT(15,60,256,83),USE(?Group1),BOXED,FONT('Lucida Handwriting',12,0800040H,)
                         STRING(@s35),AT(107,79),USE(loc::nama),FONT('Times New Roman',,,)
                         PROMPT('Nama :'),AT(53,77),USE(?Prompt2),FONT('Arial Black',,COLOR:Purple,)
                         PROMPT('Alamat :'),AT(53,93),USE(?Prompt3),FONT('Times New Roman',,COLOR:Black,)
                         STRING(@s35),AT(107,93),USE(loc::alamat),FONT('Times New Roman',,,)
                         STRING(@n3),AT(150,107),USE(loc::rt),FONT('Times New Roman',,,)
                         STRING(@n3),AT(185,107),USE(loc::rw),FONT('Times New Roman',,,)
                         PROMPT('Kota : '),AT(53,121),USE(?Prompt5),FONT('Times New Roman',,COLOR:Black,)
                         STRING(@s20),AT(107,121),USE(loc::kota),FONT('Times New Roman',,,)
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
  GlobalErrors.SetProcedureName('Trig_WindowCariNotaRanap')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Panel1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  loc::thread=glo::mainthreadno
  !POST(EVENT:Disable_ReturRJalan,,loc::thread)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  glo::no_nota = ''
  Relate:JPasien.Open                                      ! File RI_HRInap used by this procedure, so make sure it's RelationManager is open
  Access:RI_HRInap.UseFile                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Trig_WindowCariNotaRanap',window)          ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:JPasien.Close
  END
  IF SELF.Opened
    INIMgr.Update('Trig_WindowCariNotaRanap',window)       ! Save window data to non-volatile store
  END
  !POST(EVENT:Enable_ReturRJalan,,loc::thread)
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
      RI_HR:nomortrans = glo::no_nota
      if access:ri_hrinap.fetch(RI_HR:keynoTrans)=level:benign then
         jpasien{prop:sql}='select * from dba.jpasien where nomor_mr='&RI_HR:Nomor_mr
         jpasien{prop:sql}='select * from dba.jpasien where nomor_mr='&RI_HR:Nomor_mr
         access:jpasien.next()
         !glo:nota     =RI_HR:nomortrans
         !glo:tglfilter=RI_HR:Tanggal_Masuk
         Glo::no_mr=RI_HR:Nomor_mr
         glo:urut  =RI_HR:NoUrut
         loc::nama    =JPas:Nama
         loc::alamat  =JPas:Alamat
         loc::rt      =JPas:RT
         loc::rw      =JPas:RW
         loc::kota    =JPas:Kota
         enable(?OkButton)
         select(?OkButton)
      else
         message('Tidak dapat menemukan nomor billing, pastikan data telah benar')
         cycle
         !loc::err = 1
         !loc::message = 1
      END
      
                                                                                                                                              
    OF ?OkButton
      !glo:nobatal=''
      !display
      !glo::form_insert=1
      !ri_hrinap{prop:sql}='select * from dba.ri_hrinap where nomor_mr='&glo:mrfilter&' order by nourut desc'
      !ri_hrinap{prop:sql}='select * from dba.ri_hrinap where nomor_mr='&glo:mrfilter&' order by nourut desc'
      !access:ri_hrinap.next()
      !glo:urut=RI_HR:NoUrut
      !APH:N0_tran = glo::no_nota
      !GET(APHTRANS,APH:by_transaksi)
      !glo::campur = APH:cara_bayar
      !Retur_rawat_jalan
      
      !printRincianObatRanapPerNoreg
      
      
      !message(glo:urut)
      
      !Trig_BrowseReturRawatJalan
      !CLEAR(glo::no_nota)
      !CLEAR(loc::nama)
      !CLEAR(loc::alamat)
      !CLEAR(loc::rt)
      !CLEAR(loc::rw)
      !CLEAR(loc::kota)
      DISPLAY
      printRincianObatRanapPerNoreg()
       POST(Event:CloseWindow)
    OF ?CancelButton
      !glo::form_insert=0
      !message(glo::no_nota)
      !IF glo::no_nota <> ''
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
      !    apklutmp{prop:sql}='delete dba.apklutmp where N0_tran='''&clip(glo::no_nota)&''''
      !    apklutmp{prop:sql}='delete dba.apklutmp where N0_tran='''&clip(glo::no_nota)&''''
      !    next(apklutmp)
      !END
      POST(EVENT:CLOSEWINDOW)
    END
  ReturnValue = PARENT.TakeAccepted()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

