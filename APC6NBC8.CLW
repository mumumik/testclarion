  MEMBER('apc6new.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
APC6NBC8:DctInit    PROCEDURE
APC6NBC8:DctKill    PROCEDURE
APC6NBC8:FilesInit  PROCEDURE
  END

Hide:Access:JHKuitansi CLASS(FileManager),TYPE             ! FileManager for JHKuitansi
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JHKuitansi CLASS(RelationManager),TYPE         ! RelationManager for JHKuitansi
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:IPkiTlp  CLASS(FileManager),TYPE               ! FileManager for IPkiTlp
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:IPkiTlp  CLASS(RelationManager),TYPE           ! RelationManager for IPkiTlp
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ITabelGizi CLASS(FileManager),TYPE             ! FileManager for ITabelGizi
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ITabelGizi CLASS(RelationManager),TYPE         ! RelationManager for ITabelGizi
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:IDNotaSm CLASS(FileManager),TYPE               ! FileManager for IDNotaSm
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:IDNotaSm CLASS(RelationManager),TYPE           ! RelationManager for IDNotaSm
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:IPkiPPSP CLASS(FileManager),TYPE               ! FileManager for IPkiPPSP
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:IPkiPPSP CLASS(RelationManager),TYPE           ! RelationManager for IPkiPPSP
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RI_Diagnosa CLASS(FileManager),TYPE            ! FileManager for RI_Diagnosa
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RI_Diagnosa CLASS(RelationManager),TYPE        ! RelationManager for RI_Diagnosa
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:IUMPasen CLASS(FileManager),TYPE               ! FileManager for IUMPasen
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:IUMPasen CLASS(RelationManager),TYPE           ! RelationManager for IUMPasen
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:IPkiGizi CLASS(FileManager),TYPE               ! FileManager for IPkiGizi
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:IPkiGizi CLASS(RelationManager),TYPE           ! RelationManager for IPkiGizi
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:INoPasen CLASS(FileManager),TYPE               ! FileManager for INoPasen
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:INoPasen CLASS(RelationManager),TYPE           ! RelationManager for INoPasen
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JJDokter CLASS(FileManager),TYPE               ! FileManager for JJDokter
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JJDokter CLASS(RelationManager),TYPE           ! RelationManager for JJDokter
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RI_LIST  CLASS(FileManager),TYPE               ! FileManager for RI_LIST
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RI_LIST  CLASS(RelationManager),TYPE           ! RelationManager for RI_LIST
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JKTindak CLASS(FileManager),TYPE               ! FileManager for JKTindak
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JKTindak CLASS(RelationManager),TYPE           ! RelationManager for JKTindak
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:IPkiObat CLASS(FileManager),TYPE               ! FileManager for IPkiObat
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:IPkiObat CLASS(RelationManager),TYPE           ! RelationManager for IPkiObat
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RI_HRInap CLASS(FileManager),TYPE              ! FileManager for RI_HRInap
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RI_HRInap CLASS(RelationManager),TYPE          ! RelationManager for RI_HRInap
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:IPasPul  CLASS(FileManager),TYPE               ! FileManager for IPasPul
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:IPasPul  CLASS(RelationManager),TYPE           ! RelationManager for IPasPul
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JTDokter CLASS(FileManager),TYPE               ! FileManager for JTDokter
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JTDokter CLASS(RelationManager),TYPE           ! RelationManager for JTDokter
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JKontrakMaster CLASS(FileManager),TYPE         ! FileManager for JKontrakMaster
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JKontrakMaster CLASS(RelationManager),TYPE     ! RelationManager for JKontrakMaster
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JLokasi  CLASS(FileManager),TYPE               ! FileManager for JLokasi
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JLokasi  CLASS(RelationManager),TYPE           ! RelationManager for JLokasi
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:IPkiAlat CLASS(FileManager),TYPE               ! FileManager for IPkiAlat
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:IPkiAlat CLASS(RelationManager),TYPE           ! RelationManager for IPkiAlat
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:VAphtransJPasien CLASS(FileManager),TYPE       ! FileManager for VAphtransJPasien
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:VAphtransJPasien CLASS(RelationManager),TYPE   ! RelationManager for VAphtransJPasien
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END


_Hide:Access:JHKuitansi &Hide:Access:JHKuitansi,AUTO,THREAD
_Hide:Relate:JHKuitansi &Hide:Relate:JHKuitansi,AUTO,THREAD
_Hide:Access:IPkiTlp &Hide:Access:IPkiTlp,AUTO,THREAD
_Hide:Relate:IPkiTlp &Hide:Relate:IPkiTlp,AUTO,THREAD
_Hide:Access:ITabelGizi &Hide:Access:ITabelGizi,AUTO,THREAD
_Hide:Relate:ITabelGizi &Hide:Relate:ITabelGizi,AUTO,THREAD
_Hide:Access:IDNotaSm &Hide:Access:IDNotaSm,AUTO,THREAD
_Hide:Relate:IDNotaSm &Hide:Relate:IDNotaSm,AUTO,THREAD
_Hide:Access:IPkiPPSP &Hide:Access:IPkiPPSP,AUTO,THREAD
_Hide:Relate:IPkiPPSP &Hide:Relate:IPkiPPSP,AUTO,THREAD
_Hide:Access:RI_Diagnosa &Hide:Access:RI_Diagnosa,AUTO,THREAD
_Hide:Relate:RI_Diagnosa &Hide:Relate:RI_Diagnosa,AUTO,THREAD
_Hide:Access:IUMPasen &Hide:Access:IUMPasen,AUTO,THREAD
_Hide:Relate:IUMPasen &Hide:Relate:IUMPasen,AUTO,THREAD
_Hide:Access:IPkiGizi &Hide:Access:IPkiGizi,AUTO,THREAD
_Hide:Relate:IPkiGizi &Hide:Relate:IPkiGizi,AUTO,THREAD
_Hide:Access:INoPasen &Hide:Access:INoPasen,AUTO,THREAD
_Hide:Relate:INoPasen &Hide:Relate:INoPasen,AUTO,THREAD
_Hide:Access:JJDokter &Hide:Access:JJDokter,AUTO,THREAD
_Hide:Relate:JJDokter &Hide:Relate:JJDokter,AUTO,THREAD
_Hide:Access:RI_LIST &Hide:Access:RI_LIST,AUTO,THREAD
_Hide:Relate:RI_LIST &Hide:Relate:RI_LIST,AUTO,THREAD
_Hide:Access:JKTindak &Hide:Access:JKTindak,AUTO,THREAD
_Hide:Relate:JKTindak &Hide:Relate:JKTindak,AUTO,THREAD
_Hide:Access:IPkiObat &Hide:Access:IPkiObat,AUTO,THREAD
_Hide:Relate:IPkiObat &Hide:Relate:IPkiObat,AUTO,THREAD
_Hide:Access:RI_HRInap &Hide:Access:RI_HRInap,AUTO,THREAD
_Hide:Relate:RI_HRInap &Hide:Relate:RI_HRInap,AUTO,THREAD
_Hide:Access:IPasPul &Hide:Access:IPasPul,AUTO,THREAD
_Hide:Relate:IPasPul &Hide:Relate:IPasPul,AUTO,THREAD
_Hide:Access:JTDokter &Hide:Access:JTDokter,AUTO,THREAD
_Hide:Relate:JTDokter &Hide:Relate:JTDokter,AUTO,THREAD
_Hide:Access:JKontrakMaster &Hide:Access:JKontrakMaster,AUTO,THREAD
_Hide:Relate:JKontrakMaster &Hide:Relate:JKontrakMaster,AUTO,THREAD
_Hide:Access:JLokasi &Hide:Access:JLokasi,AUTO,THREAD
_Hide:Relate:JLokasi &Hide:Relate:JLokasi,AUTO,THREAD
_Hide:Access:IPkiAlat &Hide:Access:IPkiAlat,AUTO,THREAD
_Hide:Relate:IPkiAlat &Hide:Relate:IPkiAlat,AUTO,THREAD
_Hide:Access:VAphtransJPasien &Hide:Access:VAphtransJPasien,AUTO,THREAD
_Hide:Relate:VAphtransJPasien &Hide:Relate:VAphtransJPasien,AUTO,THREAD


APC6NBC8:DctInit PROCEDURE
  CODE
  _Hide:Access:JHKuitansi &= NEW(Hide:Access:JHKuitansi)
  _Hide:Relate:JHKuitansi &= NEW(Hide:Relate:JHKuitansi)
  _Hide:Access:IPkiTlp &= NEW(Hide:Access:IPkiTlp)
  _Hide:Relate:IPkiTlp &= NEW(Hide:Relate:IPkiTlp)
  _Hide:Access:ITabelGizi &= NEW(Hide:Access:ITabelGizi)
  _Hide:Relate:ITabelGizi &= NEW(Hide:Relate:ITabelGizi)
  _Hide:Access:IDNotaSm &= NEW(Hide:Access:IDNotaSm)
  _Hide:Relate:IDNotaSm &= NEW(Hide:Relate:IDNotaSm)
  _Hide:Access:IPkiPPSP &= NEW(Hide:Access:IPkiPPSP)
  _Hide:Relate:IPkiPPSP &= NEW(Hide:Relate:IPkiPPSP)
  _Hide:Access:RI_Diagnosa &= NEW(Hide:Access:RI_Diagnosa)
  _Hide:Relate:RI_Diagnosa &= NEW(Hide:Relate:RI_Diagnosa)
  _Hide:Access:IUMPasen &= NEW(Hide:Access:IUMPasen)
  _Hide:Relate:IUMPasen &= NEW(Hide:Relate:IUMPasen)
  _Hide:Access:IPkiGizi &= NEW(Hide:Access:IPkiGizi)
  _Hide:Relate:IPkiGizi &= NEW(Hide:Relate:IPkiGizi)
  _Hide:Access:INoPasen &= NEW(Hide:Access:INoPasen)
  _Hide:Relate:INoPasen &= NEW(Hide:Relate:INoPasen)
  _Hide:Access:JJDokter &= NEW(Hide:Access:JJDokter)
  _Hide:Relate:JJDokter &= NEW(Hide:Relate:JJDokter)
  _Hide:Access:RI_LIST &= NEW(Hide:Access:RI_LIST)
  _Hide:Relate:RI_LIST &= NEW(Hide:Relate:RI_LIST)
  _Hide:Access:JKTindak &= NEW(Hide:Access:JKTindak)
  _Hide:Relate:JKTindak &= NEW(Hide:Relate:JKTindak)
  _Hide:Access:IPkiObat &= NEW(Hide:Access:IPkiObat)
  _Hide:Relate:IPkiObat &= NEW(Hide:Relate:IPkiObat)
  _Hide:Access:RI_HRInap &= NEW(Hide:Access:RI_HRInap)
  _Hide:Relate:RI_HRInap &= NEW(Hide:Relate:RI_HRInap)
  _Hide:Access:IPasPul &= NEW(Hide:Access:IPasPul)
  _Hide:Relate:IPasPul &= NEW(Hide:Relate:IPasPul)
  _Hide:Access:JTDokter &= NEW(Hide:Access:JTDokter)
  _Hide:Relate:JTDokter &= NEW(Hide:Relate:JTDokter)
  _Hide:Access:JKontrakMaster &= NEW(Hide:Access:JKontrakMaster)
  _Hide:Relate:JKontrakMaster &= NEW(Hide:Relate:JKontrakMaster)
  _Hide:Access:JLokasi &= NEW(Hide:Access:JLokasi)
  _Hide:Relate:JLokasi &= NEW(Hide:Relate:JLokasi)
  _Hide:Access:IPkiAlat &= NEW(Hide:Access:IPkiAlat)
  _Hide:Relate:IPkiAlat &= NEW(Hide:Relate:IPkiAlat)
  _Hide:Access:VAphtransJPasien &= NEW(Hide:Access:VAphtransJPasien)
  _Hide:Relate:VAphtransJPasien &= NEW(Hide:Relate:VAphtransJPasien)
  Relate:JHKuitansi &= _Hide:Relate:JHKuitansi
  Relate:IPkiTlp &= _Hide:Relate:IPkiTlp
  Relate:ITabelGizi &= _Hide:Relate:ITabelGizi
  Relate:IDNotaSm &= _Hide:Relate:IDNotaSm
  Relate:IPkiPPSP &= _Hide:Relate:IPkiPPSP
  Relate:RI_Diagnosa &= _Hide:Relate:RI_Diagnosa
  Relate:IUMPasen &= _Hide:Relate:IUMPasen
  Relate:IPkiGizi &= _Hide:Relate:IPkiGizi
  Relate:INoPasen &= _Hide:Relate:INoPasen
  Relate:JJDokter &= _Hide:Relate:JJDokter
  Relate:RI_LIST &= _Hide:Relate:RI_LIST
  Relate:JKTindak &= _Hide:Relate:JKTindak
  Relate:IPkiObat &= _Hide:Relate:IPkiObat
  Relate:RI_HRInap &= _Hide:Relate:RI_HRInap
  Relate:IPasPul &= _Hide:Relate:IPasPul
  Relate:JTDokter &= _Hide:Relate:JTDokter
  Relate:JKontrakMaster &= _Hide:Relate:JKontrakMaster
  Relate:JLokasi &= _Hide:Relate:JLokasi
  Relate:IPkiAlat &= _Hide:Relate:IPkiAlat
  Relate:VAphtransJPasien &= _Hide:Relate:VAphtransJPasien


APC6NBC8:FilesInit PROCEDURE
  CODE
  _Hide:Relate:JHKuitansi.Init
  _Hide:Relate:IPkiTlp.Init
  _Hide:Relate:ITabelGizi.Init
  _Hide:Relate:IDNotaSm.Init
  _Hide:Relate:IPkiPPSP.Init
  _Hide:Relate:RI_Diagnosa.Init
  _Hide:Relate:IUMPasen.Init
  _Hide:Relate:IPkiGizi.Init
  _Hide:Relate:INoPasen.Init
  _Hide:Relate:JJDokter.Init
  _Hide:Relate:RI_LIST.Init
  _Hide:Relate:JKTindak.Init
  _Hide:Relate:IPkiObat.Init
  _Hide:Relate:RI_HRInap.Init
  _Hide:Relate:IPasPul.Init
  _Hide:Relate:JTDokter.Init
  _Hide:Relate:JKontrakMaster.Init
  _Hide:Relate:JLokasi.Init
  _Hide:Relate:IPkiAlat.Init
  _Hide:Relate:VAphtransJPasien.Init


APC6NBC8:DctKill PROCEDURE
  CODE
  _Hide:Relate:JHKuitansi.Kill
  DISPOSE(_Hide:Relate:JHKuitansi)
  _Hide:Relate:IPkiTlp.Kill
  DISPOSE(_Hide:Relate:IPkiTlp)
  _Hide:Relate:ITabelGizi.Kill
  DISPOSE(_Hide:Relate:ITabelGizi)
  _Hide:Relate:IDNotaSm.Kill
  DISPOSE(_Hide:Relate:IDNotaSm)
  _Hide:Relate:IPkiPPSP.Kill
  DISPOSE(_Hide:Relate:IPkiPPSP)
  _Hide:Relate:RI_Diagnosa.Kill
  DISPOSE(_Hide:Relate:RI_Diagnosa)
  _Hide:Relate:IUMPasen.Kill
  DISPOSE(_Hide:Relate:IUMPasen)
  _Hide:Relate:IPkiGizi.Kill
  DISPOSE(_Hide:Relate:IPkiGizi)
  _Hide:Relate:INoPasen.Kill
  DISPOSE(_Hide:Relate:INoPasen)
  _Hide:Relate:JJDokter.Kill
  DISPOSE(_Hide:Relate:JJDokter)
  _Hide:Relate:RI_LIST.Kill
  DISPOSE(_Hide:Relate:RI_LIST)
  _Hide:Relate:JKTindak.Kill
  DISPOSE(_Hide:Relate:JKTindak)
  _Hide:Relate:IPkiObat.Kill
  DISPOSE(_Hide:Relate:IPkiObat)
  _Hide:Relate:RI_HRInap.Kill
  DISPOSE(_Hide:Relate:RI_HRInap)
  _Hide:Relate:IPasPul.Kill
  DISPOSE(_Hide:Relate:IPasPul)
  _Hide:Relate:JTDokter.Kill
  DISPOSE(_Hide:Relate:JTDokter)
  _Hide:Relate:JKontrakMaster.Kill
  DISPOSE(_Hide:Relate:JKontrakMaster)
  _Hide:Relate:JLokasi.Kill
  DISPOSE(_Hide:Relate:JLokasi)
  _Hide:Relate:IPkiAlat.Kill
  DISPOSE(_Hide:Relate:IPkiAlat)
  _Hide:Relate:VAphtransJPasien.Kill
  DISPOSE(_Hide:Relate:VAphtransJPasien)


Hide:Relate:JHKuitansi.Init PROCEDURE
  CODE
  _Hide:Access:JHKuitansi.Init
  SELF.Init(Access:JHKuitansi,1)


Hide:Access:JHKuitansi.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JHKU:Record
  SELF.FileNameValue = 'JHKuitansi'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JHKuitansi
  PARENT.Init
  Access:JHKuitansi &= SELF


Hide:Access:JHKuitansi.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JHKuitansi &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JHKuitansi.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JHKuitansi,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JHKU:KeyNomorMr,'JHKU:KeyNomorMr',0)
    SELF.AddKey(JHKU:KeyTanggal,'JHKU:KeyTanggal',0)
    SELF.AddKey(JHKU:KeyNoKuitansi,'JHKU:KeyNoKuitansi',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:JHKuitansi.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 6
    GlobalErrors.SetField('JHKU:Cetak')
    IF NOT INRANGE(JHKU:Cetak,0,1)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'0 .. 1')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:JHKuitansi.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JDKuitansi,RI:CASCADE,RI:RESTRICT,JDKU:KeyNoKuitansi)
  SELF.AddRelationLink(JHKU:NoKuitansi,JDKU:NoKuitansi)

  SELF.AddRelation(Relate:JPasien)

  SELF.AddRelation(Relate:JTBayar,RI:CASCADE,RI:RESTRICT,JTBA:KeyNomorMr)
  SELF.AddRelationLink(JHKU:Nomor_MR,JTBA:Nomor_Mr)


Hide:Relate:JHKuitansi.Kill PROCEDURE

  CODE
  _Hide:Access:JHKuitansi.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:JHKuitansi &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JHKuitansi)                         ! destroy the file manager


Hide:Relate:IPkiTlp.Init PROCEDURE
  CODE
  _Hide:Access:IPkiTlp.Init
  SELF.Init(Access:IPkiTlp,1)


Hide:Access:IPkiTlp.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IPAT:Record
  SELF.FileNameValue = 'IPkiTlp'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= IPkiTlp
  PARENT.Init
  Access:IPkiTlp &= SELF


Hide:Access:IPkiTlp.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:IPkiTlp &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:IPkiTlp.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(IPkiTlp,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(IPAT:KeyNoMrRuang,'IPAT:KeyNoMrRuang',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:IPkiTlp.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ITrPasen)


Hide:Relate:IPkiTlp.Kill PROCEDURE

  CODE
  _Hide:Access:IPkiTlp.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:IPkiTlp &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:IPkiTlp)                            ! destroy the file manager


Hide:Relate:ITabelGizi.Init PROCEDURE
  CODE
  _Hide:Access:ITabelGizi.Init
  SELF.Init(Access:ITabelGizi,1)


Hide:Access:ITabelGizi.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ITAG:Record
  SELF.FileNameValue = 'ITabelGizi'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ITabelGizi
  PARENT.Init
  Access:ITabelGizi &= SELF


Hide:Access:ITabelGizi.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ITabelGizi &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ITabelGizi.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ITabelGizi,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(ITAG:KeyKode,'ITAG:KeyKode',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ITabelGizi.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:IPkiGizi,RI:CASCADE,RI:RESTRICT,IPAG:KeyKode)
  SELF.AddRelationLink(ITAG:Kode,IPAG:Kode)


Hide:Relate:ITabelGizi.Kill PROCEDURE

  CODE
  _Hide:Access:ITabelGizi.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:ITabelGizi &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ITabelGizi)                         ! destroy the file manager


Hide:Relate:IDNotaSm.Init PROCEDURE
  CODE
  _Hide:Access:IDNotaSm.Init
  SELF.Init(Access:IDNotaSm,1)


Hide:Access:IDNotaSm.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IDNS:Record
  SELF.FileNameValue = 'IDNotaSm'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= IDNotaSm
  PARENT.Init
  Access:IDNotaSm &= SELF


Hide:Access:IDNotaSm.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:IDNotaSm &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:IDNotaSm.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(IDNotaSm,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(IDNS:KeyNoMrNoNota,'IDNS:KeyNoMrNoNota',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:IDNotaSm.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:IHNotaSm)


Hide:Relate:IDNotaSm.Kill PROCEDURE

  CODE
  _Hide:Access:IDNotaSm.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:IDNotaSm &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:IDNotaSm)                           ! destroy the file manager


Hide:Relate:IPkiPPSP.Init PROCEDURE
  CODE
  _Hide:Access:IPkiPPSP.Init
  SELF.Init(Access:IPkiPPSP,1)


Hide:Access:IPkiPPSP.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IPPP:Record
  SELF.FileNameValue = 'IPkiPPSP'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= IPkiPPSP
  PARENT.Init
  Access:IPkiPPSP &= SELF


Hide:Access:IPkiPPSP.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:IPkiPPSP &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:IPkiPPSP.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(IPkiPPSP,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(IPPP:KeyNoMrRuang,'IPPP:KeyNoMrRuang',0)
    SELF.AddKey(IPPP:KeyKodeItem,'IPPP:KeyKodeItem',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:IPkiPPSP.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ITrPasen)

  SELF.AddRelation(Relate:IDaftarPPSP)


Hide:Relate:IPkiPPSP.Kill PROCEDURE

  CODE
  _Hide:Access:IPkiPPSP.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:IPkiPPSP &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:IPkiPPSP)                           ! destroy the file manager


Hide:Relate:RI_Diagnosa.Init PROCEDURE
  CODE
  _Hide:Access:RI_Diagnosa.Init
  SELF.Init(Access:RI_Diagnosa,1)


Hide:Access:RI_Diagnosa.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RI_DI:Record
  SELF.FileNameValue = 'RI_Diagnosa'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RI_Diagnosa
  PARENT.Init
  Access:RI_Diagnosa &= SELF


Hide:Access:RI_Diagnosa.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RI_Diagnosa &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RI_Diagnosa.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RI_Diagnosa,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(RI_DI:PrimaryKey,'RI_DI:PrimaryKey',0)
    SELF.AddKey(RI_DI:KeyNoMRSaja,'RI_DI:KeyNoMRSaja',0)
    SELF.AddKey(RI_DI:KeyTanggal,'RI_DI:KeyTanggal',0)
    SELF.AddKey(RI_DI:KeyDiagnosa,'RI_DI:KeyDiagnosa',0)
    SELF.AddKey(RI_DI:KeyDokter,'RI_DI:KeyDokter',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:RI_Diagnosa.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:RI_HRInap)

  SELF.AddRelation(Relate:JDokter)

  SELF.AddRelation(Relate:TBDiagnosa)


Hide:Relate:RI_Diagnosa.Kill PROCEDURE

  CODE
  _Hide:Access:RI_Diagnosa.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:RI_Diagnosa &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RI_Diagnosa)                        ! destroy the file manager


Hide:Relate:IUMPasen.Init PROCEDURE
  CODE
  _Hide:Access:IUMPasen.Init
  SELF.Init(Access:IUMPasen,1)


Hide:Access:IUMPasen.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IUMP:Record
  SELF.FileNameValue = 'IUMPasen'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= IUMPasen
  PARENT.Init
  Access:IUMPasen &= SELF


Hide:Access:IUMPasen.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:IUMPasen &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:IUMPasen.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(IUMPasen,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(IUMP:KeyNomorMRUrtTgl,'IUMP:KeyNomorMRUrtTgl',0)
    SELF.AddKey(IUMP:KeyNoBukti,'IUMP:KeyNoBukti',0)
    SELF.AddKey(IUMP:KeyTanggal,'IUMP:KeyTanggal',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:IUMPasen.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:RI_HRInap)


Hide:Relate:IUMPasen.Kill PROCEDURE

  CODE
  _Hide:Access:IUMPasen.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:IUMPasen &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:IUMPasen)                           ! destroy the file manager


Hide:Relate:IPkiGizi.Init PROCEDURE
  CODE
  _Hide:Access:IPkiGizi.Init
  SELF.Init(Access:IPkiGizi,1)


Hide:Access:IPkiGizi.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IPAG:Record
  SELF.FileNameValue = 'IPkiGizi'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= IPkiGizi
  PARENT.Init
  Access:IPkiGizi &= SELF


Hide:Access:IPkiGizi.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:IPkiGizi &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:IPkiGizi.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(IPkiGizi,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(IPAG:KeyNoMrRuang,'IPAG:KeyNoMrRuang',0)
    SELF.AddKey(IPAG:KeyKode,'IPAG:KeyKode',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:IPkiGizi.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ITabelGizi)

  SELF.AddRelation(Relate:ITrPasen)


Hide:Relate:IPkiGizi.Kill PROCEDURE

  CODE
  _Hide:Access:IPkiGizi.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:IPkiGizi &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:IPkiGizi)                           ! destroy the file manager


Hide:Relate:INoPasen.Init PROCEDURE
  CODE
  _Hide:Access:INoPasen.Init
  SELF.Init(Access:INoPasen,1)


Hide:Access:INoPasen.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= INOP:Record
  SELF.FileNameValue = 'INoPasen'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= INoPasen
  PARENT.Init
  Access:INoPasen &= SELF


Hide:Access:INoPasen.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:INoPasen &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:INoPasen.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(INoPasen,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(INOP:KeyNomorMr,'INOP:KeyNomorMr',0)
    SELF.AddKey(INOP:KeyTanggal,'INOP:KeyTanggal',0)
    SELF.AddKey(INOP:KeyNoNota,'INOP:KeyNoNota',0)
    SELF.AddKey(INOP:KeyNoBukti,'INOP:KeyNoBukti',0)
    SELF.AddKey(INOP:KeyNoKuitansi,'INOP:KeyNoKuitansi',0)
    SELF.AddKey(INOP:KeyKodeRuang,'INOP:KeyKodeRuang',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:INoPasen.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ITbrRwt)

  SELF.AddRelation(Relate:IPasien)


Hide:Relate:INoPasen.Kill PROCEDURE

  CODE
  _Hide:Access:INoPasen.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:INoPasen &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:INoPasen)                           ! destroy the file manager


Hide:Relate:JJDokter.Init PROCEDURE
  CODE
  _Hide:Access:JJDokter.Init
  SELF.Init(Access:JJDokter,1)


Hide:Access:JJDokter.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JJDO:Record
  SELF.FileNameValue = 'JJDokter'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JJDokter
  PARENT.Init
  Access:JJDokter &= SELF


Hide:Access:JJDokter.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JJDokter &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JJDokter.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JJDokter,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JJDO:KeyNomorMr,'JJDO:KeyNomorMr',0)
    SELF.AddKey(JJDO:KeyTglKel,'JJDO:KeyTglKel',0)
    SELF.AddKey(JJDO:KeyTglPem,'JJDO:KeyTglPem',0)
    SELF.AddKey(JJDO:KeyNoNota,'JJDO:KeyNoNota',0)
    SELF.AddKey(JJDO:KeyNoBukti,'JJDO:KeyNoBukti',0)
    SELF.AddKey(JJDO:KeyDokter,'JJDO:KeyDokter',0)
    SELF.AddKey(JJDO:KeyNoPengeluaran,'JJDO:KeyNoPengeluaran',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JJDokter.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JDokter)


Hide:Relate:JJDokter.Kill PROCEDURE

  CODE
  _Hide:Access:JJDokter.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:JJDokter &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JJDokter)                           ! destroy the file manager


Hide:Relate:RI_LIST.Init PROCEDURE
  CODE
  _Hide:Access:RI_LIST.Init
  SELF.Init(Access:RI_LIST,1)


Hide:Access:RI_LIST.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RI_LI:Record
  SELF.FileNameValue = 'RI_LIST'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RI_LIST
  PARENT.Init
  Access:RI_LIST &= SELF


Hide:Access:RI_LIST.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RI_LIST &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RI_LIST.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RI_LIST,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(RI_LI:KeyNomorMR,'RI_LI:KeyNomorMR',0)
    SELF.AddKey(RI_LI:KeyTanggal,'RI_LI:KeyTanggal',0)
    SELF.AddKey(RI_LI:KeyStatus,'RI_LI:KeyStatus',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:RI_LIST.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JPasien)


Hide:Relate:RI_LIST.Kill PROCEDURE

  CODE
  _Hide:Access:RI_LIST.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:RI_LIST &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RI_LIST)                            ! destroy the file manager


Hide:Relate:JKTindak.Init PROCEDURE
  CODE
  _Hide:Access:JKTindak.Init
  SELF.Init(Access:JKTindak,1)


Hide:Access:JKTindak.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JKTI:Record
  SELF.FileNameValue = 'JKTindak'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JKTindak
  PARENT.Init
  Access:JKTindak &= SELF


Hide:Access:JKTindak.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JKTindak &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JKTindak.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JKTindak,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JKTI:KeyKontrak,'JKTI:KeyKontrak',0)
    SELF.AddKey(JKTI:KeyKodeTnd,'JKTI:KeyKodeTnd',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:JKTindak.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 4
    GlobalErrors.SetField('JKTI:BiayaRSI')
    IF JKTI:BiayaRSI < 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRangeLow,'0')
      END
    END
  OF 5
    GlobalErrors.SetField('JKTI:BiayaDr')
    IF JKTI:BiayaDr < 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRangeLow,'0')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:JKTindak.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JKontrak)

  SELF.AddRelation(Relate:JTindaka)


Hide:Relate:JKTindak.Kill PROCEDURE

  CODE
  _Hide:Access:JKTindak.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:JKTindak &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JKTindak)                           ! destroy the file manager


Hide:Relate:IPkiObat.Init PROCEDURE
  CODE
  _Hide:Access:IPkiObat.Init
  SELF.Init(Access:IPkiObat,1)


Hide:Access:IPkiObat.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IPKO:Record
  SELF.FileNameValue = 'IPkiObat'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= IPkiObat
  PARENT.Init
  Access:IPkiObat &= SELF


Hide:Access:IPkiObat.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:IPkiObat &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:IPkiObat.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(IPkiObat,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(IPKO:KeyNoMrRuang,'IPKO:KeyNoMrRuang',0)
    SELF.AddKey(IPKO:KeyKodeObat,'IPKO:KeyKodeObat',0)
    SELF.AddKey(IPKO:KeyObatTanggal,'IPKO:KeyObatTanggal',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:IPkiObat.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ITrPasen)

  SELF.AddRelation(Relate:GBarang)


Hide:Relate:IPkiObat.Kill PROCEDURE

  CODE
  _Hide:Access:IPkiObat.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:IPkiObat &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:IPkiObat)                           ! destroy the file manager


Hide:Relate:RI_HRInap.Init PROCEDURE
  CODE
  _Hide:Access:RI_HRInap.Init
  SELF.Init(Access:RI_HRInap,1)


Hide:Access:RI_HRInap.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RI_HR:Record
  SELF.FileNameValue = 'RI_HRInap'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RI_HRInap
  PARENT.Init
  Access:RI_HRInap &= SELF


Hide:Access:RI_HRInap.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RI_HRInap &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RI_HRInap.PrimeFields PROCEDURE

  CODE
  RI_HR:Kontrak = 'N'                                      ! Assign initial field value
  RI_HR:Pulang = 0                                         ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:RI_HRInap.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RI_HRInap,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(RI_HR:PrimaryKey,'RI_HR:PrimaryKey',0)
    SELF.AddKey(RI_HR:KeyTanggalKeluar,'RI_HR:KeyTanggalKeluar',0)
    SELF.AddKey(RI_HR:KeyTanggalMasuk,'RI_HR:KeyTanggalMasuk',0)
    SELF.AddKey(RI_HR:KeyNoNota,'RI_HR:KeyNoNota',0)
    SELF.AddKey(RI_HR:KeyKodeDr,'RI_HR:KeyKodeDr',0)
    SELF.AddKey(RI_HR:KeyKlinikKirim,'RI_HR:KeyKlinikKirim',0)
    SELF.AddKey(RI_HR:KNomr_status,'RI_HR:KNomr_status',0)
    SELF.AddKey(RI_HR:Kmr,'RI_HR:Kmr',0)
    SELF.AddKey(RI_HR:Ruang_RI_HRInap_FK,'RI_HR:Ruang_RI_HRInap_FK',0)
    SELF.AddKey(RI_HR:Kruang,'RI_HR:Kruang',0)
    SELF.AddKey(RI_HR:KMrUrtDiscn,'RI_HR:KMrUrtDiscn',0)
    SELF.AddKey(RI_HR:Pegawai_RIHRInap_FK,'RI_HR:Pegawai_RIHRInap_FK',0)
    SELF.AddKey(RI_HR:Kontraktor_RIHRINAP_FK,'RI_HR:Kontraktor_RIHRINAP_FK',0)
    SELF.AddKey(RI_HR:salesman_ri_hrinap_fk,'RI_HR:salesman_ri_hrinap_fk',0)
    SELF.AddKey(RI_HR:keynoTrans,'RI_HR:keynoTrans',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:RI_HRInap.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 41
    GlobalErrors.SetField('RI_HR:Pulang')
    IF INSTRING(']' & RI_HR:Pulang & '[', ']1[]0[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Sudah'',''Belum''')
      END
    END
  OF 43
    GlobalErrors.SetField('RI_HR:Status_Keluar')
    IF INSTRING(']' & RI_HR:Status_Keluar & '[', ']1[]2[]3[]4[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Pulang'',''Pulang dgn. Syarat'',''Kabur'',''Meninggal''')
      END
    END
  OF 44
    GlobalErrors.SetField('RI_HR:Status_Hubungan')
    IF INSTRING(']' & CLIP(RI_HR:Status_Hubungan) & '[', ']Ayah[]Ibu[]Suami[]Istri[]Anak[]Wali[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Ayah'',''Ibu'',''Suami'',''Istri'',''Anak'',''Wali''')
      END
    END
  OF 45
    GlobalErrors.SetField('RI_HR:JK_Penjawab')
    IF INSTRING(']' & CLIP(RI_HR:JK_Penjawab) & '[', ']L[]P[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''L'',''P''')
      END
    END
  OF 54
    GlobalErrors.SetField('RI_HR:LamaBaru')
    IF INSTRING(']' & RI_HR:LamaBaru & '[', ']0[]1[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Lama'',''Baru''')
      END
    END
  OF 71
    GlobalErrors.SetField('RI_HR:OneDayCare')
    IF INSTRING(']' & RI_HR:OneDayCare & '[', ']0[]1[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Tidak'',''ya''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:RI_HRInap.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  DO AddRelations_2
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:APHTRANS,RI:None,RI:None,APH:mrurut_aphtrans_fk)
  SELF.AddRelationLink(RI_HR:Nomor_mr,APH:Nomor_mr)
  SELF.AddRelationLink(RI_HR:NoUrut,APH:Urut)

  SELF.AddRelation(Relate:JKontrak,RI:None,RI:None,JKon:KeyKodeKtr)
  SELF.AddRelationLink(RI_HR:Kontraktor,JKon:KODE_KTR)

  SELF.AddRelation(Relate:OKHInap,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,OKH1:RI_HRInap_OKHKeluar_key)
  SELF.AddRelationLink(RI_HR:Nomor_mr,OKH1:NomorMR)

  SELF.AddRelation(Relate:ITbrRwt)

  SELF.AddRelation(Relate:IRK_PDPT,RI:CASCADE,RI:RESTRICT,IR_KP:KMr_NoNota)
  SELF.AddRelationLink(RI_HR:Nomor_mr,IR_KP:No_Mr)
  SELF.AddRelationLink(RI_HR:NoUrut,IR_KP:no_urut)

  SELF.AddRelation(Relate:IKUmPesn,RI:CASCADE,RI:RESTRICT,IKUPs:KeyNomorMRUrtTgl)
  SELF.AddRelationLink(RI_HR:Nomor_mr,IKUPs:Nomor_MR)
  SELF.AddRelationLink(RI_HR:NoUrut,IKUPs:NOUrut)

  SELF.AddRelation(Relate:IUMPasen,RI:CASCADE,RI:RESTRICT,IUMP:KeyNomorMRUrtTgl)
  SELF.AddRelationLink(RI_HR:Nomor_mr,IUMP:Nomor_MR)
  SELF.AddRelationLink(RI_HR:NoUrut,IUMP:NOUrut)

  SELF.AddRelation(Relate:RI_JasaRawat,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,RI_JA:K1)
  SELF.AddRelationLink(RI_HR:Nomor_mr,RI_JA:no_mr)
  SELF.AddRelationLink(RI_HR:NoUrut,RI_JA:No_urut)

  SELF.AddRelation(Relate:RekJsaDr,RI:CASCADE,RI:RESTRICT,REK:K1)
  SELF.AddRelationLink(RI_HR:Nomor_mr,REK:NOMR)
  SELF.AddRelationLink(RI_HR:NoUrut,REK:No_urut)

  SELF.AddRelation(Relate:IR_Bayi,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,IRB:PrimaryKey)
  SELF.AddRelationLink(RI_HR:Nomor_mr,IRB:Nomor_mr)
  SELF.AddRelationLink(RI_HR:NoUrut,IRB:NoUrut)

AddRelations_2 ROUTINE
  SELF.AddRelation(Relate:ITrPsMan,RI:CASCADE,RI:RESTRICT,ITRMn:K1)
  SELF.AddRelationLink(RI_HR:Nomor_mr,ITRMn:no_mr)
  SELF.AddRelationLink(RI_HR:NoUrut,ITRMn:No_urut)

  SELF.AddRelation(Relate:RI_Diagnosa,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,RI_DI:PrimaryKey)
  SELF.AddRelationLink(RI_HR:Nomor_mr,RI_DI:Nomor_MR)
  SELF.AddRelationLink(RI_HR:NoUrut,RI_DI:NoUrut)

  SELF.AddRelation(Relate:JPoli)

  SELF.AddRelation(Relate:RI_PinRuang,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,RI_PI:PrimaryKey)
  SELF.AddRelationLink(RI_HR:Nomor_mr,RI_PI:Nomor_mr)
  SELF.AddRelationLink(RI_HR:NoUrut,RI_PI:NoUrut)

  SELF.AddRelation(Relate:JPasien)


Hide:Relate:RI_HRInap.Kill PROCEDURE

  CODE
  _Hide:Access:RI_HRInap.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:RI_HRInap &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RI_HRInap)                          ! destroy the file manager


Hide:Relate:IPasPul.Init PROCEDURE
  CODE
  _Hide:Access:IPasPul.Init
  SELF.Init(Access:IPasPul,1)


Hide:Access:IPasPul.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IPAL:Record
  SELF.FileNameValue = 'IPasPul'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= IPasPul
  PARENT.Init
  Access:IPasPul &= SELF


Hide:Access:IPasPul.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:IPasPul &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:IPasPul.PrimeFields PROCEDURE

  CODE
  IPAL:Kontrak = 'N'                                       ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:IPasPul.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(IPasPul,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(IPAL:KeyNomorMr,'IPAL:KeyNomorMr',0)
    SELF.AddKey(IPAL:KeyTanggalKeluar,'IPAL:KeyTanggalKeluar',0)
    SELF.AddKey(IPAL:KeyTanggalMasuk,'IPAL:KeyTanggalMasuk',0)
    SELF.AddKey(IPAL:KeyNoNota,'IPAL:KeyNoNota',0)
    SELF.AddKey(IPAL:KeyKodeDr,'IPAL:KeyKodeDr',0)
    SELF.AddKey(IPAL:KeyKlinikKirim,'IPAL:KeyKlinikKirim',0)
    SELF.AddKey(IPAL:KeyNoMrSaja,'IPAL:KeyNoMrSaja',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:IPasPul.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:IDiagnosa,RI:CASCADE,RI:RESTRICT,IDIA:KeyNoMRSaja)
  SELF.AddRelationLink(IPAL:Nomor_mr,IDIA:Nomor_MR)

  SELF.AddRelation(Relate:JPasien)

  SELF.AddRelation(Relate:ILIST,RI:CASCADE,RI:RESTRICT,ILIS:KeyNomorMR)
  SELF.AddRelationLink(IPAL:Nomor_mr,ILIS:Nomor_MR)


Hide:Relate:IPasPul.Kill PROCEDURE

  CODE
  _Hide:Access:IPasPul.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:IPasPul &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:IPasPul)                            ! destroy the file manager


Hide:Relate:JTDokter.Init PROCEDURE
  CODE
  _Hide:Access:JTDokter.Init
  SELF.Init(Access:JTDokter,1)


Hide:Access:JTDokter.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JTDr:Record
  SELF.FileNameValue = 'JTDokter'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JTDokter
  PARENT.Init
  Access:JTDokter &= SELF


Hide:Access:JTDokter.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JTDokter &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JTDokter.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JTDokter,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JTDr:keyNoNotaSaja,'JTDr:keyNoNotaSaja',0)
    SELF.AddKey(JTDr:KeyNota,'JTDr:KeyNota',0)
    SELF.AddKey(JTDr:KeyKodeDokter,'JTDr:KeyKodeDokter',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JTDokter.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JDokter)

  SELF.AddRelation(Relate:JTPasien)


Hide:Relate:JTDokter.Kill PROCEDURE

  CODE
  _Hide:Access:JTDokter.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:JTDokter &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JTDokter)                           ! destroy the file manager


Hide:Relate:JKontrakMaster.Init PROCEDURE
  CODE
  _Hide:Access:JKontrakMaster.Init
  SELF.Init(Access:JKontrakMaster,1)


Hide:Access:JKontrakMaster.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JKOM:Record
  SELF.FileNameValue = 'JKontrakMaster'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JKontrakMaster
  PARENT.Init
  Access:JKontrakMaster &= SELF


Hide:Access:JKontrakMaster.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JKontrakMaster &= NULL                            ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JKontrakMaster.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JKontrakMaster,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JKOM:PrimaryKey,'JKOM:PrimaryKey',1)
    SELF.AddKey(JKOM:nama_jkontrakmaster_key,'JKOM:nama_jkontrakmaster_key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:JKontrakMaster.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 3
    GlobalErrors.SetField('JKOM:StatusTabelObat')
    IF INSTRING(']' & JKOM:StatusTabelObat & '[', ']1[]0[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Ditanggung'',''Tidak Ditanggung''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:JKontrakMaster.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JKontrakObat,RI:CASCADE,RI:RESTRICT,JKOO:by_kode_ktr)
  SELF.AddRelationLink(JKOM:Kode,JKOO:KodeKontrak)

  SELF.AddRelation(Relate:JKontrak,RI:CASCADE,RI:RESTRICT,JKon:KeyKodeKtr)
  SELF.AddRelationLink(JKOM:Kode,JKon:KODE_KTR)


Hide:Relate:JKontrakMaster.Kill PROCEDURE

  CODE
  _Hide:Access:JKontrakMaster.Kill                         ! Kill the file manager
  PARENT.Kill
  Relate:JKontrakMaster &= NULL                            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JKontrakMaster)                     ! destroy the file manager


Hide:Relate:JLokasi.Init PROCEDURE
  CODE
  _Hide:Access:JLokasi.Init
  SELF.Init(Access:JLokasi,1)


Hide:Access:JLokasi.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JLO:Record
  SELF.FileNameValue = 'JLokasi'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JLokasi
  PARENT.Init
  Access:JLokasi &= SELF


Hide:Access:JLokasi.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JLokasi &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JLokasi.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JLokasi,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JLO:key_kode,'JLO:key_kode',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JLokasi.Kill PROCEDURE

  CODE
  _Hide:Access:JLokasi.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:JLokasi &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JLokasi)                            ! destroy the file manager


Hide:Relate:IPkiAlat.Init PROCEDURE
  CODE
  _Hide:Access:IPkiAlat.Init
  SELF.Init(Access:IPkiAlat,1)


Hide:Access:IPkiAlat.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IPKA:Record
  SELF.FileNameValue = 'IPkiAlat'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= IPkiAlat
  PARENT.Init
  Access:IPkiAlat &= SELF


Hide:Access:IPkiAlat.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:IPkiAlat &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:IPkiAlat.PrimeFields PROCEDURE

  CODE
  IPKA:Jumlah = 1                                          ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:IPkiAlat.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(IPkiAlat,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(IPKA:KeyNoMrRuang,'IPKA:KeyNoMrRuang',0)
    SELF.AddKey(IPKA:KeyKodeAlat,'IPKA:KeyKodeAlat',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:IPkiAlat.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:IDaftarAlat)

  SELF.AddRelation(Relate:ITrPasen)


Hide:Relate:IPkiAlat.Kill PROCEDURE

  CODE
  _Hide:Access:IPkiAlat.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:IPkiAlat &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:IPkiAlat)                           ! destroy the file manager


Hide:Relate:VAphtransJPasien.Init PROCEDURE
  CODE
  _Hide:Access:VAphtransJPasien.Init
  SELF.Init(Access:VAphtransJPasien,1)


Hide:Access:VAphtransJPasien.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= VAP:Record
  SELF.FileNameValue = 'VAphtransJPasien'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= VAphtransJPasien
  PARENT.Init
  Access:VAphtransJPasien &= SELF


Hide:Access:VAphtransJPasien.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:VAphtransJPasien &= NULL                          ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:VAphtransJPasien.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(VAphtransJPasien,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(VAP:PK,'VAP:PK',0)
    SELF.AddKey(VAP:JTransaksi_VAphtransJpasien_FK,'VAP:JTransaksi_VAphtransJpasien_FK',0)
    SELF.AddKey(VAP:Nama_VAphtransJpasien_IK,'VAP:Nama_VAphtransJpasien_IK',0)
    SELF.AddKey(VAP:MR_VAphtransJpasien_IK,'VAP:MR_VAphtransJpasien_IK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:VAphtransJPasien.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JTransaksi,RI:None,RI:None,JTra:KeyNoNota)
  SELF.AddRelationLink(VAP:NoNota,JTra:No_Nota)


Hide:Relate:VAphtransJPasien.Kill PROCEDURE

  CODE
  _Hide:Access:VAphtransJPasien.Kill                       ! Kill the file manager
  PARENT.Kill
  Relate:VAphtransJPasien &= NULL                          ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:VAphtransJPasien)                   ! destroy the file manager

