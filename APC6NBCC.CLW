  MEMBER('apc6new.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
APC6NBCC:DctInit    PROCEDURE
APC6NBCC:DctKill    PROCEDURE
APC6NBCC:FilesInit  PROCEDURE
  END

Hide:Access:ODDOp    CLASS(FileManager),TYPE               ! FileManager for ODDOp
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ODDOp    CLASS(RelationManager),TYPE           ! RelationManager for ODDOp
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:LHLAB    CLASS(FileManager),TYPE               ! FileManager for LHLAB
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:LHLAB    CLASS(RelationManager),TYPE           ! RelationManager for LHLAB
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ITbKelas CLASS(FileManager),TYPE               ! FileManager for ITbKelas
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ITbKelas CLASS(RelationManager),TYPE           ! RelationManager for ITbKelas
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:LKtrPers CLASS(FileManager),TYPE               ! FileManager for LKtrPers
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:LKtrPers CLASS(RelationManager),TYPE           ! RelationManager for LKtrPers
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:LPasExt  CLASS(FileManager),TYPE               ! FileManager for LPasExt
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:LPasExt  CLASS(RelationManager),TYPE           ! RelationManager for LPasExt
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:OKIBiayaLain CLASS(FileManager),TYPE           ! FileManager for OKIBiayaLain
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:OKIBiayaLain CLASS(RelationManager),TYPE       ! RelationManager for OKIBiayaLain
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:OKIDKeluar CLASS(FileManager),TYPE             ! FileManager for OKIDKeluar
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:OKIDKeluar CLASS(RelationManager),TYPE         ! RelationManager for OKIDKeluar
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:OKIDOPAN CLASS(FileManager),TYPE               ! FileManager for OKIDOPAN
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:OKIDOPAN CLASS(RelationManager),TYPE           ! RelationManager for OKIDOPAN
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:LPasLab  CLASS(FileManager),TYPE               ! FileManager for LPasLab
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:LPasLab  CLASS(RelationManager),TYPE           ! RelationManager for LPasLab
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:OKIDRinci CLASS(FileManager),TYPE              ! FileManager for OKIDRinci
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:OKIDRinci CLASS(RelationManager),TYPE          ! RelationManager for OKIDRinci
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:OKHInap  CLASS(FileManager),TYPE               ! FileManager for OKHInap
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:OKHInap  CLASS(RelationManager),TYPE           ! RelationManager for OKHInap
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:OKAlatKamar CLASS(FileManager),TYPE            ! FileManager for OKAlatKamar
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:OKAlatKamar CLASS(RelationManager),TYPE        ! RelationManager for OKAlatKamar
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:OKAnestesist CLASS(FileManager),TYPE           ! FileManager for OKAnestesist
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:OKAnestesist CLASS(RelationManager),TYPE       ! RelationManager for OKAnestesist
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:OKDOPAN  CLASS(FileManager),TYPE               ! FileManager for OKDOPAN
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:OKDOPAN  CLASS(RelationManager),TYPE           ! RelationManager for OKDOPAN
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JTTSByr  CLASS(FileManager),TYPE               ! FileManager for JTTSByr
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JTTSByr  CLASS(RelationManager),TYPE           ! RelationManager for JTTSByr
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RoPasLu  CLASS(FileManager),TYPE               ! FileManager for RoPasLu
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RoPasLu  CLASS(RelationManager),TYPE           ! RelationManager for RoPasLu
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RI_DSBBM CLASS(FileManager),TYPE               ! FileManager for RI_DSBBM
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RI_DSBBM CLASS(RelationManager),TYPE           ! RelationManager for RI_DSBBM
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:OHPasOp  CLASS(FileManager),TYPE               ! FileManager for OHPasOp
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:OHPasOp  CLASS(RelationManager),TYPE           ! RelationManager for OHPasOp
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:LDDPerik CLASS(FileManager),TYPE               ! FileManager for LDDPerik
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:LDDPerik CLASS(RelationManager),TYPE           ! RelationManager for LDDPerik
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RI_HSBBM CLASS(FileManager),TYPE               ! FileManager for RI_HSBBM
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RI_HSBBM CLASS(RelationManager),TYPE           ! RelationManager for RI_HSBBM
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END


_Hide:Access:ODDOp   &Hide:Access:ODDOp,AUTO,THREAD
_Hide:Relate:ODDOp   &Hide:Relate:ODDOp,AUTO,THREAD
_Hide:Access:LHLAB   &Hide:Access:LHLAB,AUTO,THREAD
_Hide:Relate:LHLAB   &Hide:Relate:LHLAB,AUTO,THREAD
_Hide:Access:ITbKelas &Hide:Access:ITbKelas,AUTO,THREAD
_Hide:Relate:ITbKelas &Hide:Relate:ITbKelas,AUTO,THREAD
_Hide:Access:LKtrPers &Hide:Access:LKtrPers,AUTO,THREAD
_Hide:Relate:LKtrPers &Hide:Relate:LKtrPers,AUTO,THREAD
_Hide:Access:LPasExt &Hide:Access:LPasExt,AUTO,THREAD
_Hide:Relate:LPasExt &Hide:Relate:LPasExt,AUTO,THREAD
_Hide:Access:OKIBiayaLain &Hide:Access:OKIBiayaLain,AUTO,THREAD
_Hide:Relate:OKIBiayaLain &Hide:Relate:OKIBiayaLain,AUTO,THREAD
_Hide:Access:OKIDKeluar &Hide:Access:OKIDKeluar,AUTO,THREAD
_Hide:Relate:OKIDKeluar &Hide:Relate:OKIDKeluar,AUTO,THREAD
_Hide:Access:OKIDOPAN &Hide:Access:OKIDOPAN,AUTO,THREAD
_Hide:Relate:OKIDOPAN &Hide:Relate:OKIDOPAN,AUTO,THREAD
_Hide:Access:LPasLab &Hide:Access:LPasLab,AUTO,THREAD
_Hide:Relate:LPasLab &Hide:Relate:LPasLab,AUTO,THREAD
_Hide:Access:OKIDRinci &Hide:Access:OKIDRinci,AUTO,THREAD
_Hide:Relate:OKIDRinci &Hide:Relate:OKIDRinci,AUTO,THREAD
_Hide:Access:OKHInap &Hide:Access:OKHInap,AUTO,THREAD
_Hide:Relate:OKHInap &Hide:Relate:OKHInap,AUTO,THREAD
_Hide:Access:OKAlatKamar &Hide:Access:OKAlatKamar,AUTO,THREAD
_Hide:Relate:OKAlatKamar &Hide:Relate:OKAlatKamar,AUTO,THREAD
_Hide:Access:OKAnestesist &Hide:Access:OKAnestesist,AUTO,THREAD
_Hide:Relate:OKAnestesist &Hide:Relate:OKAnestesist,AUTO,THREAD
_Hide:Access:OKDOPAN &Hide:Access:OKDOPAN,AUTO,THREAD
_Hide:Relate:OKDOPAN &Hide:Relate:OKDOPAN,AUTO,THREAD
_Hide:Access:JTTSByr &Hide:Access:JTTSByr,AUTO,THREAD
_Hide:Relate:JTTSByr &Hide:Relate:JTTSByr,AUTO,THREAD
_Hide:Access:RoPasLu &Hide:Access:RoPasLu,AUTO,THREAD
_Hide:Relate:RoPasLu &Hide:Relate:RoPasLu,AUTO,THREAD
_Hide:Access:RI_DSBBM &Hide:Access:RI_DSBBM,AUTO,THREAD
_Hide:Relate:RI_DSBBM &Hide:Relate:RI_DSBBM,AUTO,THREAD
_Hide:Access:OHPasOp &Hide:Access:OHPasOp,AUTO,THREAD
_Hide:Relate:OHPasOp &Hide:Relate:OHPasOp,AUTO,THREAD
_Hide:Access:LDDPerik &Hide:Access:LDDPerik,AUTO,THREAD
_Hide:Relate:LDDPerik &Hide:Relate:LDDPerik,AUTO,THREAD
_Hide:Access:RI_HSBBM &Hide:Access:RI_HSBBM,AUTO,THREAD
_Hide:Relate:RI_HSBBM &Hide:Relate:RI_HSBBM,AUTO,THREAD


APC6NBCC:DctInit PROCEDURE
  CODE
  _Hide:Access:ODDOp &= NEW(Hide:Access:ODDOp)
  _Hide:Relate:ODDOp &= NEW(Hide:Relate:ODDOp)
  _Hide:Access:LHLAB &= NEW(Hide:Access:LHLAB)
  _Hide:Relate:LHLAB &= NEW(Hide:Relate:LHLAB)
  _Hide:Access:ITbKelas &= NEW(Hide:Access:ITbKelas)
  _Hide:Relate:ITbKelas &= NEW(Hide:Relate:ITbKelas)
  _Hide:Access:LKtrPers &= NEW(Hide:Access:LKtrPers)
  _Hide:Relate:LKtrPers &= NEW(Hide:Relate:LKtrPers)
  _Hide:Access:LPasExt &= NEW(Hide:Access:LPasExt)
  _Hide:Relate:LPasExt &= NEW(Hide:Relate:LPasExt)
  _Hide:Access:OKIBiayaLain &= NEW(Hide:Access:OKIBiayaLain)
  _Hide:Relate:OKIBiayaLain &= NEW(Hide:Relate:OKIBiayaLain)
  _Hide:Access:OKIDKeluar &= NEW(Hide:Access:OKIDKeluar)
  _Hide:Relate:OKIDKeluar &= NEW(Hide:Relate:OKIDKeluar)
  _Hide:Access:OKIDOPAN &= NEW(Hide:Access:OKIDOPAN)
  _Hide:Relate:OKIDOPAN &= NEW(Hide:Relate:OKIDOPAN)
  _Hide:Access:LPasLab &= NEW(Hide:Access:LPasLab)
  _Hide:Relate:LPasLab &= NEW(Hide:Relate:LPasLab)
  _Hide:Access:OKIDRinci &= NEW(Hide:Access:OKIDRinci)
  _Hide:Relate:OKIDRinci &= NEW(Hide:Relate:OKIDRinci)
  _Hide:Access:OKHInap &= NEW(Hide:Access:OKHInap)
  _Hide:Relate:OKHInap &= NEW(Hide:Relate:OKHInap)
  _Hide:Access:OKAlatKamar &= NEW(Hide:Access:OKAlatKamar)
  _Hide:Relate:OKAlatKamar &= NEW(Hide:Relate:OKAlatKamar)
  _Hide:Access:OKAnestesist &= NEW(Hide:Access:OKAnestesist)
  _Hide:Relate:OKAnestesist &= NEW(Hide:Relate:OKAnestesist)
  _Hide:Access:OKDOPAN &= NEW(Hide:Access:OKDOPAN)
  _Hide:Relate:OKDOPAN &= NEW(Hide:Relate:OKDOPAN)
  _Hide:Access:JTTSByr &= NEW(Hide:Access:JTTSByr)
  _Hide:Relate:JTTSByr &= NEW(Hide:Relate:JTTSByr)
  _Hide:Access:RoPasLu &= NEW(Hide:Access:RoPasLu)
  _Hide:Relate:RoPasLu &= NEW(Hide:Relate:RoPasLu)
  _Hide:Access:RI_DSBBM &= NEW(Hide:Access:RI_DSBBM)
  _Hide:Relate:RI_DSBBM &= NEW(Hide:Relate:RI_DSBBM)
  _Hide:Access:OHPasOp &= NEW(Hide:Access:OHPasOp)
  _Hide:Relate:OHPasOp &= NEW(Hide:Relate:OHPasOp)
  _Hide:Access:LDDPerik &= NEW(Hide:Access:LDDPerik)
  _Hide:Relate:LDDPerik &= NEW(Hide:Relate:LDDPerik)
  _Hide:Access:RI_HSBBM &= NEW(Hide:Access:RI_HSBBM)
  _Hide:Relate:RI_HSBBM &= NEW(Hide:Relate:RI_HSBBM)
  Relate:ODDOp &= _Hide:Relate:ODDOp
  Relate:LHLAB &= _Hide:Relate:LHLAB
  Relate:ITbKelas &= _Hide:Relate:ITbKelas
  Relate:LKtrPers &= _Hide:Relate:LKtrPers
  Relate:LPasExt &= _Hide:Relate:LPasExt
  Relate:OKIBiayaLain &= _Hide:Relate:OKIBiayaLain
  Relate:OKIDKeluar &= _Hide:Relate:OKIDKeluar
  Relate:OKIDOPAN &= _Hide:Relate:OKIDOPAN
  Relate:LPasLab &= _Hide:Relate:LPasLab
  Relate:OKIDRinci &= _Hide:Relate:OKIDRinci
  Relate:OKHInap &= _Hide:Relate:OKHInap
  Relate:OKAlatKamar &= _Hide:Relate:OKAlatKamar
  Relate:OKAnestesist &= _Hide:Relate:OKAnestesist
  Relate:OKDOPAN &= _Hide:Relate:OKDOPAN
  Relate:JTTSByr &= _Hide:Relate:JTTSByr
  Relate:RoPasLu &= _Hide:Relate:RoPasLu
  Relate:RI_DSBBM &= _Hide:Relate:RI_DSBBM
  Relate:OHPasOp &= _Hide:Relate:OHPasOp
  Relate:LDDPerik &= _Hide:Relate:LDDPerik
  Relate:RI_HSBBM &= _Hide:Relate:RI_HSBBM


APC6NBCC:FilesInit PROCEDURE
  CODE
  _Hide:Relate:ODDOp.Init
  _Hide:Relate:LHLAB.Init
  _Hide:Relate:ITbKelas.Init
  _Hide:Relate:LKtrPers.Init
  _Hide:Relate:LPasExt.Init
  _Hide:Relate:OKIBiayaLain.Init
  _Hide:Relate:OKIDKeluar.Init
  _Hide:Relate:OKIDOPAN.Init
  _Hide:Relate:LPasLab.Init
  _Hide:Relate:OKIDRinci.Init
  _Hide:Relate:OKHInap.Init
  _Hide:Relate:OKAlatKamar.Init
  _Hide:Relate:OKAnestesist.Init
  _Hide:Relate:OKDOPAN.Init
  _Hide:Relate:JTTSByr.Init
  _Hide:Relate:RoPasLu.Init
  _Hide:Relate:RI_DSBBM.Init
  _Hide:Relate:OHPasOp.Init
  _Hide:Relate:LDDPerik.Init
  _Hide:Relate:RI_HSBBM.Init


APC6NBCC:DctKill PROCEDURE
  CODE
  _Hide:Relate:ODDOp.Kill
  DISPOSE(_Hide:Relate:ODDOp)
  _Hide:Relate:LHLAB.Kill
  DISPOSE(_Hide:Relate:LHLAB)
  _Hide:Relate:ITbKelas.Kill
  DISPOSE(_Hide:Relate:ITbKelas)
  _Hide:Relate:LKtrPers.Kill
  DISPOSE(_Hide:Relate:LKtrPers)
  _Hide:Relate:LPasExt.Kill
  DISPOSE(_Hide:Relate:LPasExt)
  _Hide:Relate:OKIBiayaLain.Kill
  DISPOSE(_Hide:Relate:OKIBiayaLain)
  _Hide:Relate:OKIDKeluar.Kill
  DISPOSE(_Hide:Relate:OKIDKeluar)
  _Hide:Relate:OKIDOPAN.Kill
  DISPOSE(_Hide:Relate:OKIDOPAN)
  _Hide:Relate:LPasLab.Kill
  DISPOSE(_Hide:Relate:LPasLab)
  _Hide:Relate:OKIDRinci.Kill
  DISPOSE(_Hide:Relate:OKIDRinci)
  _Hide:Relate:OKHInap.Kill
  DISPOSE(_Hide:Relate:OKHInap)
  _Hide:Relate:OKAlatKamar.Kill
  DISPOSE(_Hide:Relate:OKAlatKamar)
  _Hide:Relate:OKAnestesist.Kill
  DISPOSE(_Hide:Relate:OKAnestesist)
  _Hide:Relate:OKDOPAN.Kill
  DISPOSE(_Hide:Relate:OKDOPAN)
  _Hide:Relate:JTTSByr.Kill
  DISPOSE(_Hide:Relate:JTTSByr)
  _Hide:Relate:RoPasLu.Kill
  DISPOSE(_Hide:Relate:RoPasLu)
  _Hide:Relate:RI_DSBBM.Kill
  DISPOSE(_Hide:Relate:RI_DSBBM)
  _Hide:Relate:OHPasOp.Kill
  DISPOSE(_Hide:Relate:OHPasOp)
  _Hide:Relate:LDDPerik.Kill
  DISPOSE(_Hide:Relate:LDDPerik)
  _Hide:Relate:RI_HSBBM.Kill
  DISPOSE(_Hide:Relate:RI_HSBBM)


Hide:Relate:ODDOp.Init PROCEDURE
  CODE
  _Hide:Access:ODDOp.Init
  SELF.Init(Access:ODDOp,1)


Hide:Access:ODDOp.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ODP:Record
  SELF.FileNameValue = 'ODDOp'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ODDOp
  PARENT.Init
  Access:ODDOp &= SELF


Hide:Access:ODDOp.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ODDOp &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ODDOp.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ODDOp,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(ODP:KeyNoPeriksa,'ODP:KeyNoPeriksa',0)
    SELF.AddKey(ODP:KeyNoPeriksaKodeUrut,'ODP:KeyNoPeriksaKodeUrut',0)
    SELF.AddKey(ODP:KeyGKodeLab,'Kunci Kode Group Lab',0)
    SELF.AddKey(ODP:KeyKodeLab,'ODP:KeyKodeLab',0)
    SELF.AddKey(ODP:KeyKodePasien,'ODP:KeyKodePasien',0)
    SELF.AddKey(ODP:KeyNoPer_SGLab,'Key  NomorPeriksa dan SubGroupLab',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ODDOp.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:OHPasOp)


Hide:Relate:ODDOp.Kill PROCEDURE

  CODE
  _Hide:Access:ODDOp.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:ODDOp &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ODDOp)                              ! destroy the file manager


Hide:Relate:LHLAB.Init PROCEDURE
  CODE
  _Hide:Access:LHLAB.Init
  SELF.Init(Access:LHLAB,1)


Hide:Access:LHLAB.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= HLA:Record
  SELF.FileNameValue = 'LHLAB'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LHLAB
  PARENT.Init
  Access:LHLAB &= SELF


Hide:Access:LHLAB.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LHLAB &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LHLAB.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LHLAB,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(HLA:KeyGKodeLab,'HLA:KeyGKodeLab',0)
    SELF.AddKey(HLA:KeyGKN,'HLA:KeyGKN',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:LHLAB.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:LDLAB,RI:CASCADE,RI:RESTRICT,LDL:KeyGKodeLab)
  SELF.AddRelationLink(HLA:GKodeLab,LDL:GKodeLab)

  SELF.AddRelation(Relate:SubGrouplab,RI:CASCADE,RI:RESTRICT,SGL:KeyGKodeGroup)
  SELF.AddRelationLink(HLA:GKodeLab,SGL:KodeGroup)


Hide:Relate:LHLAB.Kill PROCEDURE

  CODE
  _Hide:Access:LHLAB.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:LHLAB &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LHLAB)                              ! destroy the file manager


Hide:Relate:ITbKelas.Init PROCEDURE
  CODE
  _Hide:Access:ITbKelas.Init
  SELF.Init(Access:ITbKelas,1)


Hide:Access:ITbKelas.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ITbk:Record
  SELF.FileNameValue = 'ITbKelas'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ITbKelas
  PARENT.Init
  Access:ITbKelas &= SELF


Hide:Access:ITbKelas.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ITbKelas &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ITbKelas.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ITbKelas,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(ITbk:KeyKodeKelas,'ITbk:KeyKodeKelas',0)
    SELF.AddKey(ITbk:KeyNamaKelas,'ITbk:KeyNamaKelas',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ITbKelas.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:IKKelas,RI:CASCADE,RI:RESTRICT,IKTB:KeyKodeKelas)
  SELF.AddRelationLink(ITbk:KodeKelas,IKTB:KodeKelas)

  SELF.AddRelation(Relate:ITbrRwt,RI:CASCADE,RI:RESTRICT,ITbr:KeyKodeKelas)
  SELF.AddRelationLink(ITbk:KodeKelas,ITbr:KodeKelas)


Hide:Relate:ITbKelas.Kill PROCEDURE

  CODE
  _Hide:Access:ITbKelas.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:ITbKelas &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ITbKelas)                           ! destroy the file manager


Hide:Relate:LKtrPers.Init PROCEDURE
  CODE
  _Hide:Access:LKtrPers.Init
  SELF.Init(Access:LKtrPers,1)


Hide:Access:LKtrPers.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LKtP:Record
  SELF.FileNameValue = 'LKtrPers'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LKtrPers
  PARENT.Init
  Access:LKtrPers &= SELF


Hide:Access:LKtrPers.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LKtrPers &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LKtrPers.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LKtrPers,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(LKtP:KeyKodeKontrak,'Kode Perusahaan Kontraktor',0)
    SELF.AddKey(LKtP:KeyKodeLab,'LKtP:KeyKodeLab',0)
    SELF.AddKey(LKtP:KeyPersen,'LKtP:KeyPersen',0)
    SELF.AddKey(LKtP:KeyKonKLab,'Kontrak dan Kode Lab',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:LKtrPers.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 3
    GlobalErrors.SetField('Persentase')
    IF NOT INRANGE(LKtP:Persen,0,100)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'0 .. 100')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:LKtrPers.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JKontrak)

  SELF.AddRelation(Relate:LDLAB,RI:CASCADE,RI:CASCADE,LDL:KeyKodeLab)
  SELF.AddRelationLink(LKtP:KodeLab,LDL:KodeLab)


Hide:Relate:LKtrPers.Kill PROCEDURE

  CODE
  _Hide:Access:LKtrPers.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:LKtrPers &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LKtrPers)                           ! destroy the file manager


Hide:Relate:LPasExt.Init PROCEDURE
  CODE
  _Hide:Access:LPasExt.Init
  SELF.Init(Access:LPasExt,1)


Hide:Access:LPasExt.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LPaX:Record
  SELF.FileNameValue = 'LPasExt'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LPasExt
  PARENT.Init
  Access:LPasExt &= SELF


Hide:Access:LPasExt.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LPasExt &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LPasExt.PrimeFields PROCEDURE

  CODE
  LPaX:TanggalLahir = Today()                              ! Assign initial field value
  LPaX:Jenis_kelamin = 'P'                                 ! Assign initial field value
  LPaX:Agama = 'ISLAM'                                     ! Assign initial field value
  LPaX:Jam = Clock()                                       ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:LPasExt.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LPasExt,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(LPaX:KeyNomorNotta,'Nomor RM',0)
    SELF.AddKey(LPaX:KeyNomor_MR,'LPaX:KeyNomor_MR',0)
    SELF.AddKey(LPaX:KeyNama,'Nama',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:LPasExt.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('Nomor Medical record pasien')
    IF NOT INRANGE(LPaX:Nomor_MR,0,99999999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'0 .. 99999999')
      END
    END
  OF 5
    GlobalErrors.SetField('Umur pasien dalam tahun')
    IF NOT INRANGE(LPaX:Umur,0,999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'0 .. 999')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:LPasExt.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:LPasLab)


Hide:Relate:LPasExt.Kill PROCEDURE

  CODE
  _Hide:Access:LPasExt.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:LPasExt &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LPasExt)                            ! destroy the file manager


Hide:Relate:OKIBiayaLain.Init PROCEDURE
  CODE
  _Hide:Access:OKIBiayaLain.Init
  SELF.Init(Access:OKIBiayaLain,1)


Hide:Access:OKIBiayaLain.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= OKB1:Record
  SELF.FileNameValue = 'OKIBiayaLain'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OKIBiayaLain
  PARENT.Init
  Access:OKIBiayaLain &= SELF


Hide:Access:OKIBiayaLain.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OKIBiayaLain &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OKIBiayaLain.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OKIBiayaLain,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(OKB1:PrimaryKey,'OKB1:PrimaryKey',0)
    SELF.AddKey(OKB1:keyTindakan_oklain,'OKB1:keyTindakan_oklain',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:OKIBiayaLain.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:OKLain)

  SELF.AddRelation(Relate:OKHInap)


Hide:Relate:OKIBiayaLain.Kill PROCEDURE

  CODE
  _Hide:Access:OKIBiayaLain.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:OKIBiayaLain &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OKIBiayaLain)                       ! destroy the file manager


Hide:Relate:OKIDKeluar.Init PROCEDURE
  CODE
  _Hide:Access:OKIDKeluar.Init
  SELF.Init(Access:OKIDKeluar,1)


Hide:Access:OKIDKeluar.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= OKD3:Record
  SELF.FileNameValue = 'OKIDKeluar'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OKIDKeluar
  PARENT.Init
  Access:OKIDKeluar &= SELF


Hide:Access:OKIDKeluar.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OKIDKeluar &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OKIDKeluar.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OKIDKeluar,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(OKD3:PRimaryKey,'OKD3:PRimaryKey',0)
    SELF.AddKey(OKD3:KeyNomor,'OKD3:KeyNomor',0)
    SELF.AddKey(OKD3:Barang_OKIDKeluar_Key,'OKD3:Barang_OKIDKeluar_Key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:OKIDKeluar.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:OKHInap)


Hide:Relate:OKIDKeluar.Kill PROCEDURE

  CODE
  _Hide:Access:OKIDKeluar.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:OKIDKeluar &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OKIDKeluar)                         ! destroy the file manager


Hide:Relate:OKIDOPAN.Init PROCEDURE
  CODE
  _Hide:Access:OKIDOPAN.Init
  SELF.Init(Access:OKIDOPAN,1)


Hide:Access:OKIDOPAN.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= OKD21:Record
  SELF.FileNameValue = 'OKIDOPAN'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OKIDOPAN
  PARENT.Init
  Access:OKIDOPAN &= SELF


Hide:Access:OKIDOPAN.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OKIDOPAN &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OKIDOPAN.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OKIDOPAN,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(OKD21:PK,'OKD21:PK',0)
    SELF.AddKey(OKD21:KeyNomor,'OKD21:KeyNomor',0)
    SELF.AddKey(OKD21:operatorKey,'OKD21:operatorKey',0)
    SELF.AddKey(OKD21:anestesiskey,'OKD21:anestesiskey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:OKIDOPAN.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:OKAnestesist)

  SELF.AddRelation(Relate:OKOperator)

  SELF.AddRelation(Relate:OKHInap)


Hide:Relate:OKIDOPAN.Kill PROCEDURE

  CODE
  _Hide:Access:OKIDOPAN.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:OKIDOPAN &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OKIDOPAN)                           ! destroy the file manager


Hide:Relate:LPasLab.Init PROCEDURE
  CODE
  _Hide:Access:LPasLab.Init
  SELF.Init(Access:LPasLab,1)


Hide:Access:LPasLab.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LPas:Record
  SELF.FileNameValue = 'LPasLab'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LPasLab
  PARENT.Init
  Access:LPasLab &= SELF


Hide:Access:LPasLab.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LPasLab &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LPasLab.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LPasLab,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(LPas:KeyNomorMr,'Nomor RM',0)
    SELF.AddKey(LPas:KeyNomorPeriksa,'LPas:KeyNomorPeriksa',0)
    SELF.AddKey(LPas:keynama,'LPas:keynama',0)
    SELF.AddKey(LPas:KeyNomorPeriksaBalik,'LPas:KeyNomorPeriksaBalik',0)
    SELF.AddKey(LPas:KeyJenis,'Jeni Rawat Jalan/Inap -> 1/0 (di field jalan)',0)
    SELF.AddKey(LPas:keyRuang,'LPas:keyRuang',0)
    SELF.AddKey(LPas:KeyTglMasuk_Jam,'Untuk Pengontrolan TanggalMasuk dan Jam',0)
    SELF.AddKey(LPas:KeyNoMrRuang,'LPas:KeyNoMrRuang',0)
    SELF.AddKey(LPas:KeyNomorMrInapTgl,'LPas:KeyNomorMrInapTgl',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:LPasLab.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('Nomor Medical record pasien')
    IF NOT INRANGE(LPas:Nomor_mr,0,99999999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'0 .. 99999999')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:LPasLab.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ITrPasen)

  SELF.AddRelation(Relate:IPasien)

  SELF.AddRelation(Relate:JPoli)

  SELF.AddRelation(Relate:JPasien)

  SELF.AddRelation(Relate:LAdaMemo,RI:CASCADE,RI:CASCADE,LADA:KeyNomorNotta)
  SELF.AddRelationLink(LPas:NoPeriksa,LADA:NomorNotta)

  SELF.AddRelation(Relate:LPasExt,RI:CASCADE,RI:CASCADE,LPaX:KeyNomorNotta)
  SELF.AddRelationLink(LPas:NoPeriksa,LPaX:Nomor_Notta)

  SELF.AddRelation(Relate:LDDPerik,RI:CASCADE,RI:CASCADE,LDD:KeyNPer_KLab)
  SELF.AddRelationLink(LPas:NoPeriksa,LDD:NoPeriksa)


Hide:Relate:LPasLab.Kill PROCEDURE

  CODE
  _Hide:Access:LPasLab.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:LPasLab &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LPasLab)                            ! destroy the file manager


Hide:Relate:OKIDRinci.Init PROCEDURE
  CODE
  _Hide:Access:OKIDRinci.Init
  SELF.Init(Access:OKIDRinci,1)


Hide:Access:OKIDRinci.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= OKD11:Record
  SELF.FileNameValue = 'OKIDRinci'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OKIDRinci
  PARENT.Init
  Access:OKIDRinci &= SELF


Hide:Access:OKIDRinci.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OKIDRinci &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OKIDRinci.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OKIDRinci,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(OKD11:PrimaryKey,'OKD11:PrimaryKey',0)
    SELF.AddKey(OKD11:KEyNomor,'OKD11:KEyNomor',0)
    SELF.AddKey(OKD11:OKAlatKamar_OKDRinci_Key,'OKD11:OKAlatKamar_OKDRinci_Key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:OKIDRinci.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:OKAlatKamar)

  SELF.AddRelation(Relate:OKHInap)


Hide:Relate:OKIDRinci.Kill PROCEDURE

  CODE
  _Hide:Access:OKIDRinci.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:OKIDRinci &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OKIDRinci)                          ! destroy the file manager


Hide:Relate:OKHInap.Init PROCEDURE
  CODE
  _Hide:Access:OKHInap.Init
  SELF.Init(Access:OKHInap,1)


Hide:Access:OKHInap.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= OKH1:Record
  SELF.FileNameValue = 'OKHInap'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OKHInap
  PARENT.Init
  Access:OKHInap &= SELF


Hide:Access:OKHInap.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OKHInap &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OKHInap.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OKHInap,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(OKH1:PrimaryKey,'OKH1:PrimaryKey',0)
    SELF.AddKey(OKH1:KeyNoMR,'OKH1:KeyNoMR',0)
    SELF.AddKey(OKH1:KeyNomor,'OKH1:KeyNomor',0)
    SELF.AddKey(OKH1:RI_HRInap_OKHKeluar_key,'OKH1:RI_HRInap_OKHKeluar_key',0)
    SELF.AddKey(OKH1:OKJBedah_OKHKeluar_Key,'OKH1:OKJBedah_OKHKeluar_Key',0)
    SELF.AddKey(OKH1:OKJAnestesi_OKHKeluar_Key,'OKH1:OKJAnestesi_OKHKeluar_Key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:OKHInap.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 8
    GlobalErrors.SetField('OKH1:Jenis_Operasi')
    IF INSTRING(']' & OKH1:Jenis_Operasi & '[', ']1[]2[]3[]4[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Kecil'',''Sedang'',''Besar'',''Khusus''')
      END
    END
  OF 10
    GlobalErrors.SetField('OKH1:Operasi')
    IF INSTRING(']' & OKH1:Operasi & '[', ']1[]2[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Cito'',''Biasa''')
      END
    END
  OF 12
    GlobalErrors.SetField('OKH1:Kelas')
    IF INSTRING(']' & OKH1:Kelas & '[', ']1[]2[]3[]4[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''KelasA'',''KelasB'',''KelasC'',''KelasD''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:OKHInap.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:OKJenisAnestesi)

  SELF.AddRelation(Relate:OKJenisBedah)

  SELF.AddRelation(Relate:OKIBiayaLain,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,OKB1:PrimaryKey)
  SELF.AddRelationLink(OKH1:Nomor,OKB1:Nomor)

  SELF.AddRelation(Relate:OKIDOPAN,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,OKD21:KeyNomor)
  SELF.AddRelationLink(OKH1:Nomor,OKD21:Nomor)

  SELF.AddRelation(Relate:OKIDRinci,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,OKD11:KEyNomor)
  SELF.AddRelationLink(OKH1:Nomor,OKD11:Nomor)

  SELF.AddRelation(Relate:OKIDKeluar,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,OKD3:PRimaryKey)
  SELF.AddRelationLink(OKH1:Nomor,OKD3:Nomor)

  SELF.AddRelation(Relate:RI_HRInap)


Hide:Relate:OKHInap.Kill PROCEDURE

  CODE
  _Hide:Access:OKHInap.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:OKHInap &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OKHInap)                            ! destroy the file manager


Hide:Relate:OKAlatKamar.Init PROCEDURE
  CODE
  _Hide:Access:OKAlatKamar.Init
  SELF.Init(Access:OKAlatKamar,1)


Hide:Access:OKAlatKamar.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= OKA1:Record
  SELF.FileNameValue = 'OKAlatKamar'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OKAlatKamar
  PARENT.Init
  Access:OKAlatKamar &= SELF


Hide:Access:OKAlatKamar.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OKAlatKamar &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OKAlatKamar.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OKAlatKamar,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(OKA1:PrimaryKey,'OKA1:PrimaryKey',0)
    SELF.AddKey(OKA1:keyNama,'OKA1:keyNama',0)
    SELF.AddKey(OKA1:KodeKey,'OKA1:KodeKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:OKAlatKamar.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:OKIDRinci,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,OKD11:OKAlatKamar_OKDRinci_Key)
  SELF.AddRelationLink(OKA1:Kode,OKD11:Jasa)

  SELF.AddRelation(Relate:OKDRinci,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,OKD1:OKAlatKamar_OKDRinci_Key)
  SELF.AddRelationLink(OKA1:Kode,OKD1:Jasa)


Hide:Relate:OKAlatKamar.Kill PROCEDURE

  CODE
  _Hide:Access:OKAlatKamar.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:OKAlatKamar &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OKAlatKamar)                        ! destroy the file manager


Hide:Relate:OKAnestesist.Init PROCEDURE
  CODE
  _Hide:Access:OKAnestesist.Init
  SELF.Init(Access:OKAnestesist,1)


Hide:Access:OKAnestesist.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= OKA:Record
  SELF.FileNameValue = 'OKAnestesist'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OKAnestesist
  PARENT.Init
  Access:OKAnestesist &= SELF


Hide:Access:OKAnestesist.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OKAnestesist &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OKAnestesist.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OKAnestesist,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(OKA:KeyKodeOpr,'OKA:KeyKodeOpr',0)
    SELF.AddKey(OKA:keyNama,'OKA:keyNama',0)
    SELF.AddKey(OKA:key_kode,'OKA:key_kode',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:OKAnestesist.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:OKIDOPAN,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,OKD21:anestesiskey)
  SELF.AddRelationLink(OKA:Kode,OKD21:Anestesis)

  SELF.AddRelation(Relate:OKDOPAN,RI:CASCADE,RI:RESTRICT,OKD2:Anestesis_OKDOPAN_Key)
  SELF.AddRelationLink(OKA:Kode,OKD2:Anestesis)


Hide:Relate:OKAnestesist.Kill PROCEDURE

  CODE
  _Hide:Access:OKAnestesist.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:OKAnestesist &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OKAnestesist)                       ! destroy the file manager


Hide:Relate:OKDOPAN.Init PROCEDURE
  CODE
  _Hide:Access:OKDOPAN.Init
  SELF.Init(Access:OKDOPAN,1)


Hide:Access:OKDOPAN.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= OKD2:Record
  SELF.FileNameValue = 'OKDOPAN'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OKDOPAN
  PARENT.Init
  Access:OKDOPAN &= SELF


Hide:Access:OKDOPAN.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OKDOPAN &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OKDOPAN.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OKDOPAN,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(OKD2:PK,'OKD2:PK',0)
    SELF.AddKey(OKD2:KeyNomor,'OKD2:KeyNomor',0)
    SELF.AddKey(OKD2:Operator_OKDOPAN_Key,'OKD2:Operator_OKDOPAN_Key',0)
    SELF.AddKey(OKD2:Anestesis_OKDOPAN_Key,'OKD2:Anestesis_OKDOPAN_Key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:OKDOPAN.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:OKOperator)

  SELF.AddRelation(Relate:OKAnestesist)

  SELF.AddRelation(Relate:OKHKeluar)


Hide:Relate:OKDOPAN.Kill PROCEDURE

  CODE
  _Hide:Access:OKDOPAN.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:OKDOPAN &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OKDOPAN)                            ! destroy the file manager


Hide:Relate:JTTSByr.Init PROCEDURE
  CODE
  _Hide:Access:JTTSByr.Init
  SELF.Init(Access:JTTSByr,1)


Hide:Access:JTTSByr.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JTTS:Record
  SELF.FileNameValue = 'JTTSByr'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JTTSByr
  PARENT.Init
  Access:JTTSByr &= SELF


Hide:Access:JTTSByr.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JTTSByr &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JTTSByr.PrimeFields PROCEDURE

  CODE
  JTTS:Selesai = 'N'                                       ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:JTTSByr.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JTTSByr,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JTTS:KeyNomorMr,'JTTS:KeyNomorMr',0)
    SELF.AddKey(JTTS:KeyNoBukti,'JTTS:KeyNoBukti',0)
    SELF.AddKey(JTTS:KeyKode,'JTTS:KeyKode',0)
    SELF.AddKey(JTTS:KeyDokter,'JTTS:KeyDokter',0)
    SELF.AddKey(JTTS:KeyTanggal,'JTTS:KeyTanggal',0)
    SELF.AddKey(JTTS:KeyNoNota,'JTTS:KeyNoNota',0)
    SELF.AddKey(JTTS:KeyTempat,'JTTS:KeyTempat',0)
    SELF.AddKey(JTTS:KeyTransaksi,'JTTS:KeyTransaksi',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JTTSByr.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JTindaka)

  SELF.AddRelation(Relate:JDokter)

  SELF.AddRelation(Relate:JPasien)


Hide:Relate:JTTSByr.Kill PROCEDURE

  CODE
  _Hide:Access:JTTSByr.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:JTTSByr &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JTTSByr)                            ! destroy the file manager


Hide:Relate:RoPasLu.Init PROCEDURE
  CODE
  _Hide:Access:RoPasLu.Init
  SELF.Init(Access:RoPasLu,1)


Hide:Access:RoPasLu.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RPLU:Record
  SELF.FileNameValue = 'RoPasLu'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RoPasLu
  PARENT.Init
  Access:RoPasLu &= SELF


Hide:Access:RoPasLu.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RoPasLu &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RoPasLu.PrimeFields PROCEDURE

  CODE
  RPLU:TanggalLahir = Today()                              ! Assign initial field value
  RPLU:Jenis_kelamin = 'P'                                 ! Assign initial field value
  RPLU:Agama = 'ISLAM'                                     ! Assign initial field value
  RPLU:Jam = Clock()                                       ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:RoPasLu.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RoPasLu,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(RPLU:KeyNoUrut,'RPLU:KeyNoUrut',0)
    SELF.AddKey(RPLU:KeyNama,'Nama',0)
    SELF.AddKey(RPLU:KeyTanggal,'RPLU:KeyTanggal',0)
    SELF.AddKey(RPLU:KeyKecamatan,'RPLU:KeyKecamatan',0)
    SELF.AddKey(RPLU:KeyKota,'RPLU:KeyKota',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:RoPasLu.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('Nomor Medical record pasien')
    IF NOT INRANGE(RPLU:Nomor_MR,0,99999999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'0 .. 99999999')
      END
    END
  OF 5
    GlobalErrors.SetField('Umur pasien dalam tahun')
    IF NOT INRANGE(RPLU:Umur,0,999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'0 .. 999')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:RoPasLu.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:RoPasien,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,ROPA:KeyNoUrut)
  SELF.AddRelationLink(RPLU:NoUrut,ROPA:NoUrut)

  SELF.AddRelation(Relate:JKecamatan)

  SELF.AddRelation(Relate:JKota)


Hide:Relate:RoPasLu.Kill PROCEDURE

  CODE
  _Hide:Access:RoPasLu.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:RoPasLu &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RoPasLu)                            ! destroy the file manager


Hide:Relate:RI_DSBBM.Init PROCEDURE
  CODE
  _Hide:Access:RI_DSBBM.Init
  SELF.Init(Access:RI_DSBBM,1)


Hide:Access:RI_DSBBM.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RI_DSM:Record
  SELF.FileNameValue = 'RI_DSBBM'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RI_DSBBM
  PARENT.Init
  Access:RI_DSBBM &= SELF


Hide:Access:RI_DSBBM.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RI_DSBBM &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RI_DSBBM.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RI_DSBBM,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(RI_DSM:PrimaryKey,'RI_DSM:PrimaryKey',0)
    SELF.AddKey(RI_DSM:by_transaksi,'RI_DSM:by_transaksi',0)
    SELF.AddKey(RI_DSM:Barang_RI_DSBBM_FK,'RI_DSM:Barang_RI_DSBBM_FK',0)
    SELF.AddKey(RI_DSM:by_tran_cam,'index atas transaksi dan campur',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:RI_DSBBM.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:RI_HSBBM)

  SELF.AddRelation(Relate:GBarang)


Hide:Relate:RI_DSBBM.Kill PROCEDURE

  CODE
  _Hide:Access:RI_DSBBM.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:RI_DSBBM &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RI_DSBBM)                           ! destroy the file manager


Hide:Relate:OHPasOp.Init PROCEDURE
  CODE
  _Hide:Access:OHPasOp.Init
  SELF.Init(Access:OHPasOp,1)


Hide:Access:OHPasOp.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= OPas:Record
  SELF.FileNameValue = 'OHPasOp'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OHPasOp
  PARENT.Init
  Access:OHPasOp &= SELF


Hide:Access:OHPasOp.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OHPasOp &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OHPasOp.PrimeFields PROCEDURE

  CODE
  OPas:Sifat = 'Biasa'                                     ! Assign initial field value
  OPas:Pembayaran = 2                                      ! Assign initial field value
  OPas:StatusCetakKerja = 'Masuk'                          ! Assign initial field value
  OPas:Jam = Clock()                                       ! Assign initial field value
  OPas:K_OBATOBATAN = 1                                    ! Assign initial field value
  OPas:K_alSunIn = 2                                       ! Assign initial field value
  OPas:K_Benjah = 3                                        ! Assign initial field value
  OPas:K_Bal = 4                                           ! Assign initial field value
  OPas:K_GasAnes = 5                                       ! Assign initial field value
  OPas:K_AlLain = 6                                        ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:OHPasOp.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OHPasOp,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(OPas:KeyNomorMr,'Nomor RM',0)
    SELF.AddKey(OPas:KeyNomorPeriksa,'OPas:KeyNomorPeriksa',0)
    SELF.AddKey(OPas:KeyNomorPeriksaBalik,'OPas:KeyNomorPeriksaBalik',0)
    SELF.AddKey(OPas:KeyJenis,'Jeni Rawat Jalan/Inap -> 1/0 (di field jalan)',0)
    SELF.AddKey(OPas:keyRuang,'OPas:keyRuang',0)
    SELF.AddKey(OPas:KeyTglMasuk_Jam,'Untuk Pengontrolan TanggalMasuk dan Jam',0)
    SELF.AddKey(OPas:KeyObatNotta,'Kode Nomr Notta dan Obat',0)
    SELF.AddKey(OPas:KeySunInNotta,' Key Nomor Notta dan SuntikInfus',0)
    SELF.AddKey(OPas:KeyBenJahNotta,'Key Nomor Notta dan BenangJahit',0)
    SELF.AddKey(OPas:KeyBalNotta,'Key Nomor Notta dan Balutan',0)
    SELF.AddKey(OPas:KeyGasAnNotta,'Key Nomor Notta dan GasNesthesi',0)
    SELF.AddKey(OPas:KeyLainNotta,'Key Nomor Notta dan Lain-lain',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:OHPasOp.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('Nomor Medical record pasien')
    IF NOT INRANGE(OPas:Nomor_mr,0,99999999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'0 .. 99999999')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:OHPasOp.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ODDOp,RI:CASCADE,RI:CASCADE,ODP:KeyNoPeriksa)
  SELF.AddRelationLink(OPas:NoPeriksa,ODP:NoPeriksa)

  SELF.AddRelation(Relate:JPasien)


Hide:Relate:OHPasOp.Kill PROCEDURE

  CODE
  _Hide:Access:OHPasOp.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:OHPasOp &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OHPasOp)                            ! destroy the file manager


Hide:Relate:LDDPerik.Init PROCEDURE
  CODE
  _Hide:Access:LDDPerik.Init
  SELF.Init(Access:LDDPerik,1)


Hide:Access:LDDPerik.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LDD:Record
  SELF.FileNameValue = 'LDDPerik'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LDDPerik
  PARENT.Init
  Access:LDDPerik &= SELF


Hide:Access:LDDPerik.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LDDPerik &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LDDPerik.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LDDPerik,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(LDD:KeyNoPeriksa,'LDD:KeyNoPeriksa',0)
    SELF.AddKey(LDD:KeyNPer_KLab,'LDD:KeyNPer_KLab',0)
    SELF.AddKey(LDD:KeyGKodeLab,'Kunci Kode Group Lab',0)
    SELF.AddKey(LDD:KeyKodeLab,'LDD:KeyKodeLab',0)
    SELF.AddKey(LDD:KeyTanggal,'LDD:KeyTanggal',0)
    SELF.AddKey(LDD:KeyKodePasien,'LDD:KeyKodePasien',0)
    SELF.AddKey(LDD:KeySGLab,'LDD:KeySGLab',0)
    SELF.AddKey(LDD:KeyNoPer_SGLab,'Key  NomorPeriksa dan SubGroupLab',0)
    SELF.AddKey(LDD:KeyNoperiksaTglmasuk,'LDD:KeyNoperiksaTglmasuk',0)
    SELF.AddKey(LDD:keyNoPeriksaGroupTglmasuk,'LDD:keyNoPeriksaGroupTglmasuk',0)
    SELF.AddKey(LDD:KeyNoPeriksaTglmasukGroup,'LDD:KeyNoPeriksaTglmasukGroup',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:LDDPerik.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:LAdaDet,RI:CASCADE,RI:CASCADE,LADD:KeyNPer_KLab)
  SELF.AddRelationLink(LDD:NoPeriksa,LADD:NoPeriksa)
  SELF.AddRelationLink(LDD:KodeLab,LADD:KodeLab)

  SELF.AddRelation(Relate:LPasLab)

  SELF.AddRelation(Relate:LDLAB)


Hide:Relate:LDDPerik.Kill PROCEDURE

  CODE
  _Hide:Access:LDDPerik.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:LDDPerik &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LDDPerik)                           ! destroy the file manager


Hide:Relate:RI_HSBBM.Init PROCEDURE
  CODE
  _Hide:Access:RI_HSBBM.Init
  SELF.Init(Access:RI_HSBBM,1)


Hide:Access:RI_HSBBM.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RI_HSM:Record
  SELF.FileNameValue = 'RI_HSBBM'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RI_HSBBM
  PARENT.Init
  Access:RI_HSBBM &= SELF


Hide:Access:RI_HSBBM.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RI_HSBBM &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RI_HSBBM.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RI_HSBBM,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(RI_HSM:PrimaryKey,'RI_HSM:PrimaryKey',0)
    SELF.AddKey(RI_HSM:Instalasi_ri_hsbbm_fk,'RI_HSM:Instalasi_ri_hsbbm_fk',0)
    SELF.AddKey(RI_HSM:keytanggal,'RI_HSM:keytanggal',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:RI_HSBBM.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 7
    GlobalErrors.SetField('RI_HSM:Batal')
    IF INSTRING(']' & RI_HSM:Batal & '[', ']1[]0[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Ya'',''Tidak''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:RI_HSBBM.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:RI_DSBBM,RI:CASCADE,RI:RESTRICT,RI_DSM:PrimaryKey)
  SELF.AddRelationLink(RI_HSM:Nomor,RI_DSM:Nomor)

  SELF.AddRelation(Relate:TBinstli)


Hide:Relate:RI_HSBBM.Kill PROCEDURE

  CODE
  _Hide:Access:RI_HSBBM.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:RI_HSBBM &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RI_HSBBM)                           ! destroy the file manager

