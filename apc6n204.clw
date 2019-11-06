

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N204.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N203.INC'),ONCE        !Req'd for module callout resolution
                     END


Entryshift PROCEDURE                                       ! Generated from procedure template - Window

FilesOpened          BYTE                                  !
I                    BYTE                                  !
ST_simpan1           BYTE                                  !
St_simpan2           BYTE                                  !
putar                BYTE                                  !
window               WINDOW('Pendaftaran Layanan Apotik'),AT(,,185,92),FONT('Times New Roman',10,COLOR:Black,),CENTER,GRAY
                       PROMPT('Kode Shift :'),AT(41,32),USE(?GL_entryapotik:Prompt)
                       ENTRY(@n6),AT(95,30),USE(vg_shift_apotik),MSG('kode apotik'),TIP('kode apotik')
                       STRING('Masukkan Shift'),AT(43,9,101,10),USE(?String1)
                       BUTTON('&H'),AT(131,30,12,12),USE(?CallLookup),FONT('Times New Roman',10,,),KEY(F2Key)
                       BUTTON('&OK'),AT(103,67,35,20),USE(?OkButton),DEFAULT
                       PANEL,AT(16,24,160,41),USE(?Panel1)
                       BUTTON('&Batal'),AT(145,67,35,20),USE(?CancelButton)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED ! Method added to host embed code
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
  GlobalErrors.SetProcedureName('Entryshift')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GL_entryapotik:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:JLokasi.Open                                      ! File JLokasi used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Entryshift',window)                        ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:JLokasi.Close
  END
  IF SELF.Opened
    INIMgr.Update('Entryshift',window)                     ! Save window data to non-volatile store
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
    Cari_apotik_shift
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
    OF ?OkButton
      if clip(vg_shift_apotik) = '' then
          message('Shift apotik tidak boleh kosong')
          cycle
      end
      JLO:Kode=vg_shift_apotik
      GET(JLokasi,JLO:key_kode)
      if errorCode() > 0  Then
          message('Pilihan Shift tidak ada, mohon cek kembali')
          cycle
      end
      !GL_entryapotik = UPPER(GL_entryapotik)
      !GAPO:Kode_Apotik=GL_entryapotik
      !GET(GApotik,GAPO:KeyNoApotik)
      !if errorCode() > 0  Then
      !  HALT
      !end
      !GL_namaapotik=GAPO:Nama_Apotik
      
      !AAWL:Kode_apotik= GL_entryapotik
      !AAWL:Bulan      = MONTH(TODAY())
      !GET(AAwalBln,AAWL:key_bln_aptk)
      !IF ERRORCODE()
      !   IsiAwalBulan
      !ELSE
      !   putar = 1
      !   IF AAWL:status <> 1
      !      St_simpan1 = AAWL:status
      !      LOOP
      !         LOOP I= 1 TO 500.
      !         AAWL:Kode_apotik= GL_entryapotik
      !         AAWL:Bulan      = MONTH(TODAY())
      !         GET(AAwalBln,AAWL:key_bln_aptk)
      !         St_simpan2 = AAWL:status
      !         IF St_simpan2 = 1
      !            BREAK
      !         ELSE
      !            IF St_simpan1 = St_simpan2
      !               if putar < 5
      !                  putar = putar + 1
      !                  cycle
      !               else
      !                  IsiAwalBulan()
      !                  BREAK
      !               end
      !            ELSE
      !               MESSAGE('User lain Sedang Proses Awal Bulan, Coba 5 Menit Lagi')
      !               HALT
      !            END
      !         END
      !      END
      !   END
      !END
      BREAK
    OF ?CancelButton
      HALT
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?vg_shift_apotik
      IF vg_shift_apotik OR ?vg_shift_apotik{Prop:Req}
        JLO:Kode = vg_shift_apotik
        IF Access:JLokasi.TryFetch(JLO:key_kode)
          IF SELF.Run(1,SelectRecord) = RequestCompleted
            vg_shift_apotik = JLO:Kode
          ELSE
            SELECT(?vg_shift_apotik)
            CYCLE
          END
        END
      END
      ThisWindow.Reset()
    OF ?CallLookup
      ThisWindow.Update
      JLO:Kode = vg_shift_apotik
      IF SELF.Run(1,SelectRecord) = RequestCompleted
        vg_shift_apotik = JLO:Kode
      END
      ThisWindow.Reset(1)
      !GLO:INSDIGUNAKAN=GAPO:Keterangan
      !message(GLO:INSDIGUNAKAN&' '&GAPO:Keterangan)
      !display
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

