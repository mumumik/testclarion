  MEMBER('apc6new.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
APC6NBC1:DctInit    PROCEDURE
APC6NBC1:DctKill    PROCEDURE
APC6NBC1:FilesInit  PROCEDURE
  END

Hide:Access:SMPegawai CLASS(FileManager),TYPE              ! FileManager for SMPegawai
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:SMPegawai CLASS(RelationManager),TYPE          ! RelationManager for SMPegawai
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JtmTinRj CLASS(FileManager),TYPE               ! FileManager for JtmTinRj
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JtmTinRj CLASS(RelationManager),TYPE           ! RelationManager for JtmTinRj
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:APObatRuang CLASS(FileManager),TYPE            ! FileManager for APObatRuang
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:APObatRuang CLASS(RelationManager),TYPE        ! RelationManager for APObatRuang
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ApPaketH CLASS(FileManager),TYPE               ! FileManager for ApPaketH
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ApPaketH CLASS(RelationManager),TYPE           ! RelationManager for ApPaketH
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ApNotaManual CLASS(FileManager),TYPE           ! FileManager for ApNotaManual
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ApNotaManual CLASS(RelationManager),TYPE       ! RelationManager for ApNotaManual
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:Apetiket1 CLASS(FileManager),TYPE              ! FileManager for Apetiket1
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:Apetiket1 CLASS(RelationManager),TYPE          ! RelationManager for Apetiket1
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ASaldoAwal CLASS(FileManager),TYPE             ! FileManager for ASaldoAwal
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ASaldoAwal CLASS(RelationManager),TYPE         ! RelationManager for ASaldoAwal
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:Aphtransadd CLASS(FileManager),TYPE            ! FileManager for Aphtransadd
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:Aphtransadd CLASS(RelationManager),TYPE        ! RelationManager for Aphtransadd
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:OKBiayaLain CLASS(FileManager),TYPE            ! FileManager for OKBiayaLain
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:OKBiayaLain CLASS(RelationManager),TYPE        ! RelationManager for OKBiayaLain
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:OKOperator CLASS(FileManager),TYPE             ! FileManager for OKOperator
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:OKOperator CLASS(RelationManager),TYPE         ! RelationManager for OKOperator
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GBarKel  CLASS(FileManager),TYPE               ! FileManager for GBarKel
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GBarKel  CLASS(RelationManager),TYPE           ! RelationManager for GBarKel
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:INAdjust CLASS(FileManager),TYPE               ! FileManager for INAdjust
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:INAdjust CLASS(RelationManager),TYPE           ! RelationManager for INAdjust
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ApStokopSS CLASS(FileManager),TYPE             ! FileManager for ApStokopSS
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ApStokopSS CLASS(RelationManager),TYPE         ! RelationManager for ApStokopSS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GStokOp  CLASS(FileManager),TYPE               ! FileManager for GStokOp
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GStokOp  CLASS(RelationManager),TYPE           ! RelationManager for GStokOp
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RiTind   CLASS(FileManager),TYPE               ! FileManager for RiTind
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RiTind   CLASS(RelationManager),TYPE           ! RelationManager for RiTind
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ApPaketD CLASS(FileManager),TYPE               ! FileManager for ApPaketD
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ApPaketD CLASS(RelationManager),TYPE           ! RelationManager for ApPaketD
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:INHDKB   CLASS(FileManager),TYPE               ! FileManager for INHDKB
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:INHDKB   CLASS(RelationManager),TYPE           ! RelationManager for INHDKB
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GAdjusment CLASS(FileManager),TYPE             ! FileManager for GAdjusment
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GAdjusment CLASS(RelationManager),TYPE         ! RelationManager for GAdjusment
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:OKJenisBedah CLASS(FileManager),TYPE           ! FileManager for OKJenisBedah
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:OKJenisBedah CLASS(RelationManager),TYPE       ! RelationManager for OKJenisBedah
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:OKHKeluar CLASS(FileManager),TYPE              ! FileManager for OKHKeluar
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:OKHKeluar CLASS(RelationManager),TYPE          ! RelationManager for OKHKeluar
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END


_Hide:Access:SMPegawai &Hide:Access:SMPegawai,AUTO,THREAD
_Hide:Relate:SMPegawai &Hide:Relate:SMPegawai,AUTO,THREAD
_Hide:Access:JtmTinRj &Hide:Access:JtmTinRj,AUTO,THREAD
_Hide:Relate:JtmTinRj &Hide:Relate:JtmTinRj,AUTO,THREAD
_Hide:Access:APObatRuang &Hide:Access:APObatRuang,AUTO,THREAD
_Hide:Relate:APObatRuang &Hide:Relate:APObatRuang,AUTO,THREAD
_Hide:Access:ApPaketH &Hide:Access:ApPaketH,AUTO,THREAD
_Hide:Relate:ApPaketH &Hide:Relate:ApPaketH,AUTO,THREAD
_Hide:Access:ApNotaManual &Hide:Access:ApNotaManual,AUTO,THREAD
_Hide:Relate:ApNotaManual &Hide:Relate:ApNotaManual,AUTO,THREAD
_Hide:Access:Apetiket1 &Hide:Access:Apetiket1,AUTO,THREAD
_Hide:Relate:Apetiket1 &Hide:Relate:Apetiket1,AUTO,THREAD
_Hide:Access:ASaldoAwal &Hide:Access:ASaldoAwal,AUTO,THREAD
_Hide:Relate:ASaldoAwal &Hide:Relate:ASaldoAwal,AUTO,THREAD
_Hide:Access:Aphtransadd &Hide:Access:Aphtransadd,AUTO,THREAD
_Hide:Relate:Aphtransadd &Hide:Relate:Aphtransadd,AUTO,THREAD
_Hide:Access:OKBiayaLain &Hide:Access:OKBiayaLain,AUTO,THREAD
_Hide:Relate:OKBiayaLain &Hide:Relate:OKBiayaLain,AUTO,THREAD
_Hide:Access:OKOperator &Hide:Access:OKOperator,AUTO,THREAD
_Hide:Relate:OKOperator &Hide:Relate:OKOperator,AUTO,THREAD
_Hide:Access:GBarKel &Hide:Access:GBarKel,AUTO,THREAD
_Hide:Relate:GBarKel &Hide:Relate:GBarKel,AUTO,THREAD
_Hide:Access:INAdjust &Hide:Access:INAdjust,AUTO,THREAD
_Hide:Relate:INAdjust &Hide:Relate:INAdjust,AUTO,THREAD
_Hide:Access:ApStokopSS &Hide:Access:ApStokopSS,AUTO,THREAD
_Hide:Relate:ApStokopSS &Hide:Relate:ApStokopSS,AUTO,THREAD
_Hide:Access:GStokOp &Hide:Access:GStokOp,AUTO,THREAD
_Hide:Relate:GStokOp &Hide:Relate:GStokOp,AUTO,THREAD
_Hide:Access:RiTind  &Hide:Access:RiTind,AUTO,THREAD
_Hide:Relate:RiTind  &Hide:Relate:RiTind,AUTO,THREAD
_Hide:Access:ApPaketD &Hide:Access:ApPaketD,AUTO,THREAD
_Hide:Relate:ApPaketD &Hide:Relate:ApPaketD,AUTO,THREAD
_Hide:Access:INHDKB  &Hide:Access:INHDKB,AUTO,THREAD
_Hide:Relate:INHDKB  &Hide:Relate:INHDKB,AUTO,THREAD
_Hide:Access:GAdjusment &Hide:Access:GAdjusment,AUTO,THREAD
_Hide:Relate:GAdjusment &Hide:Relate:GAdjusment,AUTO,THREAD
_Hide:Access:OKJenisBedah &Hide:Access:OKJenisBedah,AUTO,THREAD
_Hide:Relate:OKJenisBedah &Hide:Relate:OKJenisBedah,AUTO,THREAD
_Hide:Access:OKHKeluar &Hide:Access:OKHKeluar,AUTO,THREAD
_Hide:Relate:OKHKeluar &Hide:Relate:OKHKeluar,AUTO,THREAD


APC6NBC1:DctInit PROCEDURE
  CODE
  _Hide:Access:SMPegawai &= NEW(Hide:Access:SMPegawai)
  _Hide:Relate:SMPegawai &= NEW(Hide:Relate:SMPegawai)
  _Hide:Access:JtmTinRj &= NEW(Hide:Access:JtmTinRj)
  _Hide:Relate:JtmTinRj &= NEW(Hide:Relate:JtmTinRj)
  _Hide:Access:APObatRuang &= NEW(Hide:Access:APObatRuang)
  _Hide:Relate:APObatRuang &= NEW(Hide:Relate:APObatRuang)
  _Hide:Access:ApPaketH &= NEW(Hide:Access:ApPaketH)
  _Hide:Relate:ApPaketH &= NEW(Hide:Relate:ApPaketH)
  _Hide:Access:ApNotaManual &= NEW(Hide:Access:ApNotaManual)
  _Hide:Relate:ApNotaManual &= NEW(Hide:Relate:ApNotaManual)
  _Hide:Access:Apetiket1 &= NEW(Hide:Access:Apetiket1)
  _Hide:Relate:Apetiket1 &= NEW(Hide:Relate:Apetiket1)
  _Hide:Access:ASaldoAwal &= NEW(Hide:Access:ASaldoAwal)
  _Hide:Relate:ASaldoAwal &= NEW(Hide:Relate:ASaldoAwal)
  _Hide:Access:Aphtransadd &= NEW(Hide:Access:Aphtransadd)
  _Hide:Relate:Aphtransadd &= NEW(Hide:Relate:Aphtransadd)
  _Hide:Access:OKBiayaLain &= NEW(Hide:Access:OKBiayaLain)
  _Hide:Relate:OKBiayaLain &= NEW(Hide:Relate:OKBiayaLain)
  _Hide:Access:OKOperator &= NEW(Hide:Access:OKOperator)
  _Hide:Relate:OKOperator &= NEW(Hide:Relate:OKOperator)
  _Hide:Access:GBarKel &= NEW(Hide:Access:GBarKel)
  _Hide:Relate:GBarKel &= NEW(Hide:Relate:GBarKel)
  _Hide:Access:INAdjust &= NEW(Hide:Access:INAdjust)
  _Hide:Relate:INAdjust &= NEW(Hide:Relate:INAdjust)
  _Hide:Access:ApStokopSS &= NEW(Hide:Access:ApStokopSS)
  _Hide:Relate:ApStokopSS &= NEW(Hide:Relate:ApStokopSS)
  _Hide:Access:GStokOp &= NEW(Hide:Access:GStokOp)
  _Hide:Relate:GStokOp &= NEW(Hide:Relate:GStokOp)
  _Hide:Access:RiTind &= NEW(Hide:Access:RiTind)
  _Hide:Relate:RiTind &= NEW(Hide:Relate:RiTind)
  _Hide:Access:ApPaketD &= NEW(Hide:Access:ApPaketD)
  _Hide:Relate:ApPaketD &= NEW(Hide:Relate:ApPaketD)
  _Hide:Access:INHDKB &= NEW(Hide:Access:INHDKB)
  _Hide:Relate:INHDKB &= NEW(Hide:Relate:INHDKB)
  _Hide:Access:GAdjusment &= NEW(Hide:Access:GAdjusment)
  _Hide:Relate:GAdjusment &= NEW(Hide:Relate:GAdjusment)
  _Hide:Access:OKJenisBedah &= NEW(Hide:Access:OKJenisBedah)
  _Hide:Relate:OKJenisBedah &= NEW(Hide:Relate:OKJenisBedah)
  _Hide:Access:OKHKeluar &= NEW(Hide:Access:OKHKeluar)
  _Hide:Relate:OKHKeluar &= NEW(Hide:Relate:OKHKeluar)
  Relate:SMPegawai &= _Hide:Relate:SMPegawai
  Relate:JtmTinRj &= _Hide:Relate:JtmTinRj
  Relate:APObatRuang &= _Hide:Relate:APObatRuang
  Relate:ApPaketH &= _Hide:Relate:ApPaketH
  Relate:ApNotaManual &= _Hide:Relate:ApNotaManual
  Relate:Apetiket1 &= _Hide:Relate:Apetiket1
  Relate:ASaldoAwal &= _Hide:Relate:ASaldoAwal
  Relate:Aphtransadd &= _Hide:Relate:Aphtransadd
  Relate:OKBiayaLain &= _Hide:Relate:OKBiayaLain
  Relate:OKOperator &= _Hide:Relate:OKOperator
  Relate:GBarKel &= _Hide:Relate:GBarKel
  Relate:INAdjust &= _Hide:Relate:INAdjust
  Relate:ApStokopSS &= _Hide:Relate:ApStokopSS
  Relate:GStokOp &= _Hide:Relate:GStokOp
  Relate:RiTind &= _Hide:Relate:RiTind
  Relate:ApPaketD &= _Hide:Relate:ApPaketD
  Relate:INHDKB &= _Hide:Relate:INHDKB
  Relate:GAdjusment &= _Hide:Relate:GAdjusment
  Relate:OKJenisBedah &= _Hide:Relate:OKJenisBedah
  Relate:OKHKeluar &= _Hide:Relate:OKHKeluar


APC6NBC1:FilesInit PROCEDURE
  CODE
  _Hide:Relate:SMPegawai.Init
  _Hide:Relate:JtmTinRj.Init
  _Hide:Relate:APObatRuang.Init
  _Hide:Relate:ApPaketH.Init
  _Hide:Relate:ApNotaManual.Init
  _Hide:Relate:Apetiket1.Init
  _Hide:Relate:ASaldoAwal.Init
  _Hide:Relate:Aphtransadd.Init
  _Hide:Relate:OKBiayaLain.Init
  _Hide:Relate:OKOperator.Init
  _Hide:Relate:GBarKel.Init
  _Hide:Relate:INAdjust.Init
  _Hide:Relate:ApStokopSS.Init
  _Hide:Relate:GStokOp.Init
  _Hide:Relate:RiTind.Init
  _Hide:Relate:ApPaketD.Init
  _Hide:Relate:INHDKB.Init
  _Hide:Relate:GAdjusment.Init
  _Hide:Relate:OKJenisBedah.Init
  _Hide:Relate:OKHKeluar.Init


APC6NBC1:DctKill PROCEDURE
  CODE
  _Hide:Relate:SMPegawai.Kill
  DISPOSE(_Hide:Relate:SMPegawai)
  _Hide:Relate:JtmTinRj.Kill
  DISPOSE(_Hide:Relate:JtmTinRj)
  _Hide:Relate:APObatRuang.Kill
  DISPOSE(_Hide:Relate:APObatRuang)
  _Hide:Relate:ApPaketH.Kill
  DISPOSE(_Hide:Relate:ApPaketH)
  _Hide:Relate:ApNotaManual.Kill
  DISPOSE(_Hide:Relate:ApNotaManual)
  _Hide:Relate:Apetiket1.Kill
  DISPOSE(_Hide:Relate:Apetiket1)
  _Hide:Relate:ASaldoAwal.Kill
  DISPOSE(_Hide:Relate:ASaldoAwal)
  _Hide:Relate:Aphtransadd.Kill
  DISPOSE(_Hide:Relate:Aphtransadd)
  _Hide:Relate:OKBiayaLain.Kill
  DISPOSE(_Hide:Relate:OKBiayaLain)
  _Hide:Relate:OKOperator.Kill
  DISPOSE(_Hide:Relate:OKOperator)
  _Hide:Relate:GBarKel.Kill
  DISPOSE(_Hide:Relate:GBarKel)
  _Hide:Relate:INAdjust.Kill
  DISPOSE(_Hide:Relate:INAdjust)
  _Hide:Relate:ApStokopSS.Kill
  DISPOSE(_Hide:Relate:ApStokopSS)
  _Hide:Relate:GStokOp.Kill
  DISPOSE(_Hide:Relate:GStokOp)
  _Hide:Relate:RiTind.Kill
  DISPOSE(_Hide:Relate:RiTind)
  _Hide:Relate:ApPaketD.Kill
  DISPOSE(_Hide:Relate:ApPaketD)
  _Hide:Relate:INHDKB.Kill
  DISPOSE(_Hide:Relate:INHDKB)
  _Hide:Relate:GAdjusment.Kill
  DISPOSE(_Hide:Relate:GAdjusment)
  _Hide:Relate:OKJenisBedah.Kill
  DISPOSE(_Hide:Relate:OKJenisBedah)
  _Hide:Relate:OKHKeluar.Kill
  DISPOSE(_Hide:Relate:OKHKeluar)


Hide:Relate:SMPegawai.Init PROCEDURE
  CODE
  _Hide:Access:SMPegawai.Init
  SELF.Init(Access:SMPegawai,1)


Hide:Access:SMPegawai.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PEGA:Record
  SELF.FileNameValue = 'SMPegawai'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SMPegawai
  PARENT.Init
  Access:SMPegawai &= SELF


Hide:Access:SMPegawai.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SMPegawai &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SMPegawai.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SMPegawai,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(PEGA:Pkey,'PEGA:Pkey',0)
    SELF.AddKey(PEGA:KeyTanggalMasuk,'PEGA:KeyTanggalMasuk',0)
    SELF.AddKey(PEGA:KeyTglLahir,'PEGA:KeyTglLahir',0)
    SELF.AddKey(PEGA:KeyNikLama,'PEGA:KeyNikLama',0)
    SELF.AddKey(PEGA:KeyRPend,'PEGA:KeyRPend',0)
    SELF.AddKey(PEGA:KeyJabatan,'PEGA:KeyJabatan',0)
    SELF.AddKey(PEGA:KeyUnit,'PEGA:KeyUnit',0)
    SELF.AddKey(PEGA:KeyNama,'PEGA:KeyNama',0)
    SELF.AddKey(PEGA:KeyAbsen,'PEGA:KeyAbsen',0)
    SELF.AddKey(PEGA:KeySub_UnitPeg,'PEGA:KeySub_UnitPeg',0)
    SELF.AddKey(PEGA:KeyNikPalingBaru,'PEGA:KeyNikPalingBaru',0)
    SELF.AddKey(PEGA:Profesi_Pegawai_FK,'PEGA:Profesi_Pegawai_FK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:SMPegawai.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 6
    GlobalErrors.SetField('PEGA:Status')
    IF INSTRING(']' & PEGA:Status & '[', ']1[]2[]3[]4[]5[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Training'',''Aktif'',''Cuti'',''Diskors'',''Keluar''')
      END
    END
  OF 9
    GlobalErrors.SetField('PEGA:Jenis_Kelamin')
    IF INSTRING(']' & PEGA:Jenis_Kelamin & '[', ']1[]2[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Pria'',''Wanita''')
      END
    END
  OF 12
    GlobalErrors.SetField('PEGA:Agama')
    IF INSTRING(']' & PEGA:Agama & '[', ']1[]2[]3[]4[]5[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Islam'',''Kristen'',''Katolik'',''Hindu'',''Budha''')
      END
    END
  OF 25
    GlobalErrors.SetField('PEGA:Sistem_Gaji')
    IF INSTRING(']' & PEGA:Sistem_Gaji & '[', ']1[]2[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Bulanan'',''Harian''')
      END
    END
  OF 27
    GlobalErrors.SetField('PEGA:Shift')
    IF INSTRING(']' & PEGA:Shift & '[', ']1[]2[]3[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''1'',''2'',''3''')
      END
    END
  OF 28
    GlobalErrors.SetField('PEGA:Jenis_Pegawai')
    IF INSTRING(']' & PEGA:Jenis_Pegawai & '[', ']1[]2[]3[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Staf Kantor'',''Staf Produksi'',''Operator''')
      END
    END
  OF 30
    GlobalErrors.SetField('PEGA:Nikah')
    IF INSTRING(']' & PEGA:Nikah & '[', ']1[]2[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Nikah'',''Belum Nikah''')
      END
    END
  OF 31
    GlobalErrors.SetField('PEGA:Fix_Sallary')
    IF INSTRING(']' & PEGA:Fix_Sallary & '[', ']1[]0[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Ya'',''Tidak''')
      END
    END
  OF 36
    GlobalErrors.SetField('Tunjangan_Keahlian')
    IF INSTRING(']' & PEGA:Lembur_Tetap & '[', ']1[]2[]3[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Ya'',''Tidak'',''Lain-lain''')
      END
    END
  OF 38
    GlobalErrors.SetField('PEGA:Astek')
    IF INSTRING(']' & PEGA:Astek & '[', ']1[]2[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Ikut'',''Tidak''')
      END
    END
  OF 39
    GlobalErrors.SetField('PEGA:SPSI')
    IF INSTRING(']' & PEGA:SPSI & '[', ']1[]2[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Ikut'',''Tidak''')
      END
    END
  OF 40
    GlobalErrors.SetField('PEGA:Koperasi')
    IF INSTRING(']' & PEGA:Koperasi & '[', ']1[]2[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Ikut'',''Tidak''')
      END
    END
  OF 41
    GlobalErrors.SetField('PEGA:Laporan')
    IF INSTRING(']' & PEGA:Laporan & '[', ']1[]2[]3[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Jakarta'',''Bandung'',''ATM''')
      END
    END
  OF 51
    GlobalErrors.SetField('PEGA:Status_Rumah')
    IF INSTRING(']' & PEGA:Status_Rumah & '[', ']1[]2[]3[]4[]5[]6[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Milik Sendiri'',''Kontrak'',''Milik Ortu/Saudara'',''Milik Perusahaan'',''Kost'',''Lain-lain''')
      END
    END
  OF 53
    GlobalErrors.SetField('PEGA:WargaNegara')
    IF INSTRING(']' & PEGA:WargaNegara & '[', ']1[]2[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''WNI'',''WNA''')
      END
    END
  OF 54
    GlobalErrors.SetField('PEGA:GolDarah')
    IF INSTRING(']' & CLIP(PEGA:GolDarah) & '[', ']A[]B[]AB[]O[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''A'',''B'',''AB'',''O''')
      END
    END
  OF 57
    GlobalErrors.SetField('PEGA:Status_Kawin')
    IF INSTRING(']' & CLIP(PEGA:Status_Kawin) & '[', ']S[]M[]J[]D[]C[]L[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Single'',''Menikah'',''Janda'',''Duda'',''Cerai'',''Lain-lain''')
      END
    END
  OF 58
    GlobalErrors.SetField('PEGA:Transportasi')
    IF INSTRING(']' & PEGA:Transportasi & '[', ']1[]2[]3[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Kendaraan Umum'',''Kendaraan Pribadi'',''Jalan Kaki''')
      END
    END
  OF 59
    GlobalErrors.SetField('PEGA:Jenis_Kendaraan')
    IF INSTRING(']' & PEGA:Jenis_Kendaraan & '[', ']1[]2[]3[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Sepeda Motor'',''Mobil'',''Lain-lain''')
      END
    END
  OF 60
    GlobalErrors.SetField('PEGA:Pemilik_Kendaraan')
    IF INSTRING(']' & PEGA:Pemilik_Kendaraan & '[', ']1[]2[]3[]4[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Sendiri'',''Orang Tua'',''Kantor'',''Lain-lain''')
      END
    END
  OF 62
    GlobalErrors.SetField('PEGA:Transport')
    IF INSTRING(']' & PEGA:Transport & '[', ']1[]0[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Ikut'',''Tidak''')
      END
    END
  OF 67
    GlobalErrors.SetField('PEGA:Pensiun')
    IF INSTRING(']' & PEGA:Pensiun & '[', ']1[]0[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Ya'',''Tidak''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:SMPegawai.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:APHTRANSBPJS,RI:None,RI:None,APHB:Pegawai_aphtrans_fk)
  SELF.AddRelationLink(PEGA:Nik,APHB:NIP)

  SELF.AddRelation(Relate:ApNotaObat,RI:None,RI:None,APN1:Pegawai_APNotaObat_FK)
  SELF.AddRelationLink(PEGA:Nik,APN1:NIP)

  SELF.AddRelation(Relate:SMRUnker)

  SELF.AddRelation(Relate:APHTRANS,RI:None,RI:None,APH:Pegawai_aphtrans_fk)
  SELF.AddRelationLink(PEGA:Nik,APH:NIP)

  SELF.AddRelation(Relate:JTransaksi,RI:None,RI:None,JTra:Pegawai_JTransaksi_FK)
  SELF.AddRelationLink(PEGA:Nik,JTra:NIP)


Hide:Relate:SMPegawai.Kill PROCEDURE

  CODE
  _Hide:Access:SMPegawai.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:SMPegawai &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SMPegawai)                          ! destroy the file manager


Hide:Relate:JtmTinRj.Init PROCEDURE
  CODE
  _Hide:Access:JtmTinRj.Init
  SELF.Init(Access:JtmTinRj,1)


Hide:Access:JtmTinRj.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JTM:Record
  SELF.FileNameValue = 'JtmTinRj'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JtmTinRj
  PARENT.Init
  Access:JtmTinRj &= SELF


Hide:Access:JtmTinRj.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JtmTinRj &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JtmTinRj.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JtmTinRj,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JTM:KNotaJenisMr,'JTM:KNotaJenisMr',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JtmTinRj.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JTPasien)


Hide:Relate:JtmTinRj.Kill PROCEDURE

  CODE
  _Hide:Access:JtmTinRj.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:JtmTinRj &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JtmTinRj)                           ! destroy the file manager


Hide:Relate:APObatRuang.Init PROCEDURE
  CODE
  _Hide:Access:APObatRuang.Init
  SELF.Init(Access:APObatRuang,1)


Hide:Access:APObatRuang.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APO1:Record
  SELF.FileNameValue = 'APObatRuang'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= APObatRuang
  PARENT.Init
  Access:APObatRuang &= SELF


Hide:Access:APObatRuang.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:APObatRuang &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:APObatRuang.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(APObatRuang,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(APO1:PK,'APO1:PK',0)
    SELF.AddKey(APO1:Apotik_ObatRuangan_FK,'APO1:Apotik_ObatRuangan_FK',0)
    SELF.AddKey(APO1:Barang_ObatRuangan_FK,'APO1:Barang_ObatRuangan_FK',0)
    SELF.AddKey(APO1:Mitra_APObatRuang_FK,'APO1:Mitra_APObatRuang_FK',0)
    SELF.AddKey(APO1:Jpasien_APObatRuang_FK,'APO1:Jpasien_APObatRuang_FK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:APObatRuang.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:JKontrak)

  SELF.AddRelation(Relate:JPasien)

  SELF.AddRelation(Relate:GApotik)


Hide:Relate:APObatRuang.Kill PROCEDURE

  CODE
  _Hide:Access:APObatRuang.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:APObatRuang &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:APObatRuang)                        ! destroy the file manager


Hide:Relate:ApPaketH.Init PROCEDURE
  CODE
  _Hide:Access:ApPaketH.Init
  SELF.Init(Access:ApPaketH,1)


Hide:Access:ApPaketH.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APP2:Record
  SELF.FileNameValue = 'ApPaketH'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ApPaketH
  PARENT.Init
  Access:ApPaketH &= SELF


Hide:Access:ApPaketH.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ApPaketH &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ApPaketH.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ApPaketH,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APP2:PrimaryKey,'APP2:PrimaryKey',1)
    SELF.AddKey(APP2:nama_apaketh_ik,'APP2:nama_apaketh_ik',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ApPaketH.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:APHTRANSBPJS,RI:None,RI:None,APHB:nopaket_aphtrans_fk)
  SELF.AddRelationLink(APP2:No,APHB:NoPaket)

  SELF.AddRelation(Relate:APHTRANS,RI:None,RI:None,APH:nopaket_aphtrans_fk)
  SELF.AddRelationLink(APP2:No,APH:NoPaket)

  SELF.AddRelation(Relate:ApPaketD,RI:CASCADE,RI:CASCADE,APP21:PrimaryKey)
  SELF.AddRelationLink(APP2:No,APP21:No)


Hide:Relate:ApPaketH.Kill PROCEDURE

  CODE
  _Hide:Access:ApPaketH.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:ApPaketH &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ApPaketH)                           ! destroy the file manager


Hide:Relate:ApNotaManual.Init PROCEDURE
  CODE
  _Hide:Access:ApNotaManual.Init
  SELF.Init(Access:ApNotaManual,1)


Hide:Access:ApNotaManual.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APN:Record
  SELF.FileNameValue = 'ApNotaManual'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ApNotaManual
  PARENT.Init
  Access:ApNotaManual &= SELF


Hide:Access:ApNotaManual.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ApNotaManual &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ApNotaManual.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ApNotaManual,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APN:PrimaryKey,'APN:PrimaryKey',0)
    SELF.AddKey(APN:Apotik_ApNotaManual_FK,'APN:Apotik_ApNotaManual_FK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:ApNotaManual.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 3
    GlobalErrors.SetField('APN:Status')
    IF INSTRING(']' & APN:Status & '[', ']1[]2[]3[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Pagi'',''Sore'',''Malam''')
      END
    END
  OF 4
    GlobalErrors.SetField('APN:Jenis_Pasien')
    IF INSTRING(']' & APN:Jenis_Pasien & '[', ']1[]2[]3[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Pegawai'',''Umum'',''Kontraktor''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:ApNotaManual.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GApotik)


Hide:Relate:ApNotaManual.Kill PROCEDURE

  CODE
  _Hide:Access:ApNotaManual.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:ApNotaManual &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ApNotaManual)                       ! destroy the file manager


Hide:Relate:Apetiket1.Init PROCEDURE
  CODE
  _Hide:Access:Apetiket1.Init
  SELF.Init(Access:Apetiket1,1)


Hide:Access:Apetiket1.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Ape1:Record
  SELF.FileNameValue = 'Apetiket1'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Apetiket1
  PARENT.Init
  Access:Apetiket1 &= SELF


Hide:Access:Apetiket1.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Apetiket1 &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Apetiket1.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Apetiket1,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Ape1:KEY1,'Ape1:KEY1',0)
    SELF.AddKey(Ape1:nama_etiket1_key,'Ape1:nama_etiket1_key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Apetiket1.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:APDTRANSDet,RI:None,RI:None,APD2:keterangan2_apdtransdet_key)
  SELF.AddRelationLink(Ape1:No,APD2:Keterangan2)


Hide:Relate:Apetiket1.Kill PROCEDURE

  CODE
  _Hide:Access:Apetiket1.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:Apetiket1 &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Apetiket1)                          ! destroy the file manager


Hide:Relate:ASaldoAwal.Init PROCEDURE
  CODE
  _Hide:Access:ASaldoAwal.Init
  SELF.Init(Access:ASaldoAwal,1)


Hide:Access:ASaldoAwal.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ASA:Record
  SELF.FileNameValue = 'ASaldoAwal'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ASaldoAwal
  PARENT.Init
  Access:ASaldoAwal &= SELF


Hide:Access:ASaldoAwal.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ASaldoAwal &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ASaldoAwal.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ASaldoAwal,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(ASA:PrimaryKey,'ASA:PrimaryKey',0)
    SELF.AddKey(ASA:Barang_ASaldoAwal_FK,'ASA:Barang_ASaldoAwal_FK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ASaldoAwal.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)


Hide:Relate:ASaldoAwal.Kill PROCEDURE

  CODE
  _Hide:Access:ASaldoAwal.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:ASaldoAwal &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ASaldoAwal)                         ! destroy the file manager


Hide:Relate:Aphtransadd.Init PROCEDURE
  CODE
  _Hide:Access:Aphtransadd.Init
  SELF.Init(Access:Aphtransadd,1)


Hide:Access:Aphtransadd.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APH1:Record
  SELF.FileNameValue = 'Aphtransadd'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Aphtransadd
  PARENT.Init
  Access:Aphtransadd &= SELF


Hide:Access:Aphtransadd.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Aphtransadd &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Aphtransadd.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Aphtransadd,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APH1:PrimaryKey,'APH1:PrimaryKey',0)
    SELF.AddKey(APH1:itbrrwt_ruangan_fk,'APH1:itbrrwt_ruangan_fk',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Aphtransadd.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:APHTRANSBPJS)

  SELF.AddRelation(Relate:ITbrRwt)

  SELF.AddRelation(Relate:APHTRANS)


Hide:Relate:Aphtransadd.Kill PROCEDURE

  CODE
  _Hide:Access:Aphtransadd.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:Aphtransadd &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Aphtransadd)                        ! destroy the file manager


Hide:Relate:OKBiayaLain.Init PROCEDURE
  CODE
  _Hide:Access:OKBiayaLain.Init
  SELF.Init(Access:OKBiayaLain,1)


Hide:Access:OKBiayaLain.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= OKB:Record
  SELF.FileNameValue = 'OKBiayaLain'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OKBiayaLain
  PARENT.Init
  Access:OKBiayaLain &= SELF


Hide:Access:OKBiayaLain.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OKBiayaLain &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OKBiayaLain.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OKBiayaLain,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(OKB:PrimaryKey,'OKB:PrimaryKey',0)
    SELF.AddKey(OKB:KeyNamaTind_OKLain,'OKB:KeyNamaTind_OKLain',0)
    SELF.AddKey(OKB:keynomor,'OKB:keynomor',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:OKBiayaLain.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:OKLain)

  SELF.AddRelation(Relate:OKHKeluar)


Hide:Relate:OKBiayaLain.Kill PROCEDURE

  CODE
  _Hide:Access:OKBiayaLain.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:OKBiayaLain &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OKBiayaLain)                        ! destroy the file manager


Hide:Relate:OKOperator.Init PROCEDURE
  CODE
  _Hide:Access:OKOperator.Init
  SELF.Init(Access:OKOperator,1)


Hide:Access:OKOperator.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= OKO:Record
  SELF.FileNameValue = 'OKOperator'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OKOperator
  PARENT.Init
  Access:OKOperator &= SELF


Hide:Access:OKOperator.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OKOperator &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OKOperator.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OKOperator,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(OKO:PrimaryKey,'OKO:PrimaryKey',0)
    SELF.AddKey(OKO:KeyKode,'OKO:KeyKode',0)
    SELF.AddKey(OKO:KeyNama,'OKO:KeyNama',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:OKOperator.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 9
    GlobalErrors.SetField('OKO:Jenis_Operasi')
    IF INSTRING(']' & OKO:Jenis_Operasi & '[', ']1[]2[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Cito'',''Biasa''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:OKOperator.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:OKIDOPAN,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,OKD21:operatorKey)
  SELF.AddRelationLink(OKO:Kode,OKD21:Operator)

  SELF.AddRelation(Relate:OKDOPAN,RI:CASCADE,RI:RESTRICT,OKD2:Operator_OKDOPAN_Key)
  SELF.AddRelationLink(OKO:Kode,OKD2:Operator)


Hide:Relate:OKOperator.Kill PROCEDURE

  CODE
  _Hide:Access:OKOperator.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:OKOperator &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OKOperator)                         ! destroy the file manager


Hide:Relate:GBarKel.Init PROCEDURE
  CODE
  _Hide:Access:GBarKel.Init
  SELF.Init(Access:GBarKel,1)


Hide:Access:GBarKel.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GBA1:Record
  SELF.FileNameValue = 'GBarKel'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GBarKel
  PARENT.Init
  Access:GBarKel &= SELF


Hide:Access:GBarKel.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GBarKel &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GBarKel.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GBarKel,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GBA1:PK,'GBA1:PK',1)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GBarKel.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,GBAR:KeyKodeKelompok)
  SELF.AddRelationLink(GBA1:Kode,GBAR:Kelompok)


Hide:Relate:GBarKel.Kill PROCEDURE

  CODE
  _Hide:Access:GBarKel.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:GBarKel &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GBarKel)                            ! destroy the file manager


Hide:Relate:INAdjust.Init PROCEDURE
  CODE
  _Hide:Access:INAdjust.Init
  SELF.Init(Access:INAdjust,1)


Hide:Access:INAdjust.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= INAD:Record
  SELF.FileNameValue = 'INAdjust'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= INAdjust
  PARENT.Init
  Access:INAdjust &= SELF


Hide:Access:INAdjust.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:INAdjust &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:INAdjust.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(INAdjust,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(INAD:PrimaryKey,'INAD:PrimaryKey',0)
    SELF.AddKey(INAD:GBarang_INADjust_Key,'INAD:GBarang_INADjust_Key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:INAdjust.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 9
    GlobalErrors.SetField('INAD:Status')
    IF INSTRING(']' & INAD:Status & '[', ']1[]2[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Tambah Stok'',''Kurang Stok''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:INAdjust.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)


Hide:Relate:INAdjust.Kill PROCEDURE

  CODE
  _Hide:Access:INAdjust.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:INAdjust &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:INAdjust)                           ! destroy the file manager


Hide:Relate:ApStokopSS.Init PROCEDURE
  CODE
  _Hide:Access:ApStokopSS.Init
  SELF.Init(Access:ApStokopSS,1)


Hide:Access:ApStokopSS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Apso1:Record
  SELF.FileNameValue = 'ApStokopSS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ApStokopSS
  PARENT.Init
  Access:ApStokopSS &= SELF


Hide:Access:ApStokopSS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ApStokopSS &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ApStokopSS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ApStokopSS,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Apso1:kdapotik_brg,'Kode apotik + barang+tahun+bulan',0)
    SELF.AddKey(Apso1:keykdap_bln_thn,'Apso1:keykdap_bln_thn',0)
    SELF.AddKey(Apso1:keykode_barang,'kode barang',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ApStokopSS.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)


Hide:Relate:ApStokopSS.Kill PROCEDURE

  CODE
  _Hide:Access:ApStokopSS.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:ApStokopSS &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ApStokopSS)                         ! destroy the file manager


Hide:Relate:GStokOp.Init PROCEDURE
  CODE
  _Hide:Access:GStokOp.Init
  SELF.Init(Access:GStokOp,1)


Hide:Access:GStokOp.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GST2:Record
  SELF.FileNameValue = 'GStokOp'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GStokOp
  PARENT.Init
  Access:GStokOp &= SELF


Hide:Access:GStokOp.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GStokOp &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GStokOp.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GStokOp,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(GST2:PrimaryKey,'GST2:PrimaryKey',0)
    SELF.AddKey(GST2:Gbar_GSokOp_Key,'GST2:Gbar_GSokOp_Key',0)
    SELF.AddKey(GST2:gstokop_bulan_tahun_key,'GST2:gstokop_bulan_tahun_key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GStokOp.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)


Hide:Relate:GStokOp.Kill PROCEDURE

  CODE
  _Hide:Access:GStokOp.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:GStokOp &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GStokOp)                            ! destroy the file manager


Hide:Relate:RiTind.Init PROCEDURE
  CODE
  _Hide:Access:RiTind.Init
  SELF.Init(Access:RiTind,1)


Hide:Access:RiTind.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Tind:Record
  SELF.FileNameValue = 'RiTind'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RiTind
  PARENT.Init
  Access:RiTind &= SELF


Hide:Access:RiTind.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RiTind &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RiTind.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RiTind,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Tind:K1,'Primary key',0)
    SELF.AddKey(Tind:KkodeJasa,'Tind:KkodeJasa',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:RiTind.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:IMJasa)

  SELF.AddRelation(Relate:RI_PinRuang)


Hide:Relate:RiTind.Kill PROCEDURE

  CODE
  _Hide:Access:RiTind.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:RiTind &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RiTind)                             ! destroy the file manager


Hide:Relate:ApPaketD.Init PROCEDURE
  CODE
  _Hide:Access:ApPaketD.Init
  SELF.Init(Access:ApPaketD,1)


Hide:Access:ApPaketD.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APP21:Record
  SELF.FileNameValue = 'ApPaketD'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ApPaketD
  PARENT.Init
  Access:ApPaketD &= SELF


Hide:Access:ApPaketD.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ApPaketD &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ApPaketD.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ApPaketD,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APP21:PrimaryKey,'APP21:PrimaryKey',0)
    SELF.AddKey(APP21:barang_appaketd_fk,'APP21:barang_appaketd_fk',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ApPaketD.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ApPaketH)

  SELF.AddRelation(Relate:GBarang)


Hide:Relate:ApPaketD.Kill PROCEDURE

  CODE
  _Hide:Access:ApPaketD.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:ApPaketD &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ApPaketD)                           ! destroy the file manager


Hide:Relate:INHDKB.Init PROCEDURE
  CODE
  _Hide:Access:INHDKB.Init
  SELF.Init(Access:INHDKB,1)


Hide:Access:INHDKB.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= INH:Record
  SELF.FileNameValue = 'INHDKB'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= INHDKB
  PARENT.Init
  Access:INHDKB &= SELF


Hide:Access:INHDKB.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:INHDKB &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:INHDKB.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(INHDKB,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(INH:PK,'INH:PK',0)
    SELF.AddKey(INH:ins_inhdkb_fk,'INH:ins_inhdkb_fk',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:INHDKB.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:TBinstli)

  SELF.AddRelation(Relate:AptoInHe,RI:None,RI:None,APTI:nodkb_aptoinhe_fk)
  SELF.AddRelationLink(INH:Nomor,APTI:nomordkb)

  SELF.AddRelation(Relate:INDDKB,RI:None,RI:None,IND:PK)
  SELF.AddRelationLink(INH:Nomor,IND:Nomor)


Hide:Relate:INHDKB.Kill PROCEDURE

  CODE
  _Hide:Access:INHDKB.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:INHDKB &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:INHDKB)                             ! destroy the file manager


Hide:Relate:GAdjusment.Init PROCEDURE
  CODE
  _Hide:Access:GAdjusment.Init
  SELF.Init(Access:GAdjusment,1)


Hide:Access:GAdjusment.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GAD:Record
  SELF.FileNameValue = 'GAdjusment'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GAdjusment
  PARENT.Init
  Access:GAdjusment &= SELF


Hide:Access:GAdjusment.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GAdjusment &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GAdjusment.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GAdjusment,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GAD:PrimaryKey,'GAD:PrimaryKey',0)
    SELF.AddKey(GAD:GBarang_GAdjusment_Key,'GAD:GBarang_GAdjusment_Key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:GAdjusment.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 8
    GlobalErrors.SetField('GAD:Status')
    IF INSTRING(']' & GAD:Status & '[', ']1[]2[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Tambah Stok'',''Kurang Stok''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:GAdjusment.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)


Hide:Relate:GAdjusment.Kill PROCEDURE

  CODE
  _Hide:Access:GAdjusment.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:GAdjusment &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GAdjusment)                         ! destroy the file manager


Hide:Relate:OKJenisBedah.Init PROCEDURE
  CODE
  _Hide:Access:OKJenisBedah.Init
  SELF.Init(Access:OKJenisBedah,1)


Hide:Access:OKJenisBedah.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= OKJ:Record
  SELF.FileNameValue = 'OKJenisBedah'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OKJenisBedah
  PARENT.Init
  Access:OKJenisBedah &= SELF


Hide:Access:OKJenisBedah.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OKJenisBedah &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OKJenisBedah.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OKJenisBedah,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(OKJ:PK,'OKJ:PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:OKJenisBedah.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 10
    GlobalErrors.SetField('OKJ:Jenis_Operasi')
    IF INSTRING(']' & OKJ:Jenis_Operasi & '[', ']1[]2[]3[]4[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Kecil'',''Sedang'',''Besar'',''Khusus''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:OKJenisBedah.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:OKHInap,RI:CASCADE,RI:RESTRICT,OKH1:OKJBedah_OKHKeluar_Key)
  SELF.AddRelationLink(OKJ:Kode,OKH1:Jenis_Bedah)

  SELF.AddRelation(Relate:OKHKeluar,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,OKH:OKJBedah_OKHKeluar_Key)
  SELF.AddRelationLink(OKJ:Kode,OKH:Jenis_Bedah)


Hide:Relate:OKJenisBedah.Kill PROCEDURE

  CODE
  _Hide:Access:OKJenisBedah.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:OKJenisBedah &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OKJenisBedah)                       ! destroy the file manager


Hide:Relate:OKHKeluar.Init PROCEDURE
  CODE
  _Hide:Access:OKHKeluar.Init
  SELF.Init(Access:OKHKeluar,1)


Hide:Access:OKHKeluar.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= OKH:Record
  SELF.FileNameValue = 'OKHKeluar'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OKHKeluar
  PARENT.Init
  Access:OKHKeluar &= SELF


Hide:Access:OKHKeluar.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OKHKeluar &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OKHKeluar.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OKHKeluar,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(OKH:PrimaryKey,'OKH:PrimaryKey',0)
    SELF.AddKey(OKH:keyNomor,'OKH:keyNomor',0)
    SELF.AddKey(OKH:keyNomorMR,'OKH:keyNomorMR',0)
    SELF.AddKey(OKH:OKJBedah_OKHKeluar_Key,'OKH:OKJBedah_OKHKeluar_Key',0)
    SELF.AddKey(OKH:OKJAnestesi_OKHKeluar_Key,'OKH:OKJAnestesi_OKHKeluar_Key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:OKHKeluar.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 8
    GlobalErrors.SetField('OKH:Jenis_operasi')
    IF INSTRING(']' & OKH:Jenis_operasi & '[', ']1[]2[]3[]4[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Kecil'',''Sedang'',''Besar'',''Khusus''')
      END
    END
  OF 10
    GlobalErrors.SetField('OKH:Operasi')
    IF INSTRING(']' & OKH:Operasi & '[', ']1[]2[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Cito'',''Biasa''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:OKHKeluar.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:OKJenisAnestesi)

  SELF.AddRelation(Relate:OKJenisBedah)

  SELF.AddRelation(Relate:JPasien)

  SELF.AddRelation(Relate:OKBiayaLain,RI:CASCADE,RI:RESTRICT,OKB:PrimaryKey)
  SELF.AddRelationLink(OKH:Nomor,OKB:Nomor)

  SELF.AddRelation(Relate:OKDOPAN,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,OKD2:KeyNomor)
  SELF.AddRelationLink(OKH:Nomor,OKD2:Nomor)

  SELF.AddRelation(Relate:OKDRinci,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,OKD1:PrimaryKey)
  SELF.AddRelationLink(OKH:Nomor,OKD1:Nomor)

  SELF.AddRelation(Relate:OKDKeluar,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,OKD:PRimaryKey)
  SELF.AddRelationLink(OKH:Nomor,OKD:Nomor)


Hide:Relate:OKHKeluar.Kill PROCEDURE

  CODE
  _Hide:Access:OKHKeluar.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:OKHKeluar &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OKHKeluar)                          ! destroy the file manager

