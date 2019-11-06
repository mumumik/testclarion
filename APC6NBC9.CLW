  MEMBER('apc6new.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
APC6NBC9:DctInit    PROCEDURE
APC6NBC9:DctKill    PROCEDURE
APC6NBC9:FilesInit  PROCEDURE
  END

Hide:Access:AptoInHe CLASS(FileManager),TYPE               ! FileManager for AptoInHe
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:AptoInHe CLASS(RelationManager),TYPE           ! RelationManager for AptoInHe
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:AptoApHe CLASS(FileManager),TYPE               ! FileManager for AptoApHe
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:AptoApHe CLASS(RelationManager),TYPE           ! RelationManager for AptoApHe
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:APtoAPde CLASS(FileManager),TYPE               ! FileManager for APtoAPde
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:APtoAPde CLASS(RelationManager),TYPE           ! RelationManager for APtoAPde
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:IKUmPesn CLASS(FileManager),TYPE               ! FileManager for IKUmPesn
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:IKUmPesn CLASS(RelationManager),TYPE           ! RelationManager for IKUmPesn
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:APOBKONT CLASS(FileManager),TYPE               ! FileManager for APOBKONT
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:APOBKONT CLASS(RelationManager),TYPE           ! RelationManager for APOBKONT
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RI_JasaRawat CLASS(FileManager),TYPE           ! FileManager for RI_JasaRawat
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RI_JasaRawat CLASS(RelationManager),TYPE       ! RelationManager for RI_JasaRawat
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:APBRGCMP CLASS(FileManager),TYPE               ! FileManager for APBRGCMP
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:APBRGCMP CLASS(RelationManager),TYPE           ! RelationManager for APBRGCMP
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JKelPeg  CLASS(FileManager),TYPE               ! FileManager for JKelPeg
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JKelPeg  CLASS(RelationManager),TYPE           ! RelationManager for JKelPeg
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:queue    CLASS(FileManager),TYPE               ! FileManager for queue
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:queue    CLASS(RelationManager),TYPE           ! RelationManager for queue
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:APDTcam  CLASS(FileManager),TYPE               ! FileManager for APDTcam
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:APDTcam  CLASS(RelationManager),TYPE           ! RelationManager for APDTcam
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:APDTRANS CLASS(FileManager),TYPE               ! FileManager for APDTRANS
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:APDTRANS CLASS(RelationManager),TYPE           ! RelationManager for APDTRANS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:AptoInDe CLASS(FileManager),TYPE               ! FileManager for AptoInDe
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:AptoInDe CLASS(RelationManager),TYPE           ! RelationManager for AptoInDe
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ApReLuar CLASS(FileManager),TYPE               ! FileManager for ApReLuar
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ApReLuar CLASS(RelationManager),TYPE           ! RelationManager for ApReLuar
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ITAGUM   CLASS(FileManager),TYPE               ! FileManager for ITAGUM
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ITAGUM   CLASS(RelationManager),TYPE           ! RelationManager for ITAGUM
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:APHTRANSBPJS CLASS(FileManager),TYPE           ! FileManager for APHTRANSBPJS
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:APHTRANSBPJS CLASS(RelationManager),TYPE       ! RelationManager for APHTRANSBPJS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RI_PinRuang CLASS(FileManager),TYPE            ! FileManager for RI_PinRuang
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RI_PinRuang CLASS(RelationManager),TYPE        ! RelationManager for RI_PinRuang
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RI_VisitDr CLASS(FileManager),TYPE             ! FileManager for RI_VisitDr
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RI_VisitDr CLASS(RelationManager),TYPE         ! RelationManager for RI_VisitDr
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:APHTRANS CLASS(FileManager),TYPE               ! FileManager for APHTRANS
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:APHTRANS CLASS(RelationManager),TYPE           ! RelationManager for APHTRANS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JPegawai CLASS(FileManager),TYPE               ! FileManager for JPegawai
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JPegawai CLASS(RelationManager),TYPE           ! RelationManager for JPegawai
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:Appegrsi CLASS(FileManager),TYPE               ! FileManager for Appegrsi
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:Appegrsi CLASS(RelationManager),TYPE           ! RelationManager for Appegrsi
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END


_Hide:Access:AptoInHe &Hide:Access:AptoInHe,AUTO,THREAD
_Hide:Relate:AptoInHe &Hide:Relate:AptoInHe,AUTO,THREAD
_Hide:Access:AptoApHe &Hide:Access:AptoApHe,AUTO,THREAD
_Hide:Relate:AptoApHe &Hide:Relate:AptoApHe,AUTO,THREAD
_Hide:Access:APtoAPde &Hide:Access:APtoAPde,AUTO,THREAD
_Hide:Relate:APtoAPde &Hide:Relate:APtoAPde,AUTO,THREAD
_Hide:Access:IKUmPesn &Hide:Access:IKUmPesn,AUTO,THREAD
_Hide:Relate:IKUmPesn &Hide:Relate:IKUmPesn,AUTO,THREAD
_Hide:Access:APOBKONT &Hide:Access:APOBKONT,AUTO,THREAD
_Hide:Relate:APOBKONT &Hide:Relate:APOBKONT,AUTO,THREAD
_Hide:Access:RI_JasaRawat &Hide:Access:RI_JasaRawat,AUTO,THREAD
_Hide:Relate:RI_JasaRawat &Hide:Relate:RI_JasaRawat,AUTO,THREAD
_Hide:Access:APBRGCMP &Hide:Access:APBRGCMP,AUTO,THREAD
_Hide:Relate:APBRGCMP &Hide:Relate:APBRGCMP,AUTO,THREAD
_Hide:Access:JKelPeg &Hide:Access:JKelPeg,AUTO,THREAD
_Hide:Relate:JKelPeg &Hide:Relate:JKelPeg,AUTO,THREAD
_Hide:Access:queue   &Hide:Access:queue,AUTO,THREAD
_Hide:Relate:queue   &Hide:Relate:queue,AUTO,THREAD
_Hide:Access:APDTcam &Hide:Access:APDTcam,AUTO,THREAD
_Hide:Relate:APDTcam &Hide:Relate:APDTcam,AUTO,THREAD
_Hide:Access:APDTRANS &Hide:Access:APDTRANS,AUTO,THREAD
_Hide:Relate:APDTRANS &Hide:Relate:APDTRANS,AUTO,THREAD
_Hide:Access:AptoInDe &Hide:Access:AptoInDe,AUTO,THREAD
_Hide:Relate:AptoInDe &Hide:Relate:AptoInDe,AUTO,THREAD
_Hide:Access:ApReLuar &Hide:Access:ApReLuar,AUTO,THREAD
_Hide:Relate:ApReLuar &Hide:Relate:ApReLuar,AUTO,THREAD
_Hide:Access:ITAGUM  &Hide:Access:ITAGUM,AUTO,THREAD
_Hide:Relate:ITAGUM  &Hide:Relate:ITAGUM,AUTO,THREAD
_Hide:Access:APHTRANSBPJS &Hide:Access:APHTRANSBPJS,AUTO,THREAD
_Hide:Relate:APHTRANSBPJS &Hide:Relate:APHTRANSBPJS,AUTO,THREAD
_Hide:Access:RI_PinRuang &Hide:Access:RI_PinRuang,AUTO,THREAD
_Hide:Relate:RI_PinRuang &Hide:Relate:RI_PinRuang,AUTO,THREAD
_Hide:Access:RI_VisitDr &Hide:Access:RI_VisitDr,AUTO,THREAD
_Hide:Relate:RI_VisitDr &Hide:Relate:RI_VisitDr,AUTO,THREAD
_Hide:Access:APHTRANS &Hide:Access:APHTRANS,AUTO,THREAD
_Hide:Relate:APHTRANS &Hide:Relate:APHTRANS,AUTO,THREAD
_Hide:Access:JPegawai &Hide:Access:JPegawai,AUTO,THREAD
_Hide:Relate:JPegawai &Hide:Relate:JPegawai,AUTO,THREAD
_Hide:Access:Appegrsi &Hide:Access:Appegrsi,AUTO,THREAD
_Hide:Relate:Appegrsi &Hide:Relate:Appegrsi,AUTO,THREAD


APC6NBC9:DctInit PROCEDURE
  CODE
  _Hide:Access:AptoInHe &= NEW(Hide:Access:AptoInHe)
  _Hide:Relate:AptoInHe &= NEW(Hide:Relate:AptoInHe)
  _Hide:Access:AptoApHe &= NEW(Hide:Access:AptoApHe)
  _Hide:Relate:AptoApHe &= NEW(Hide:Relate:AptoApHe)
  _Hide:Access:APtoAPde &= NEW(Hide:Access:APtoAPde)
  _Hide:Relate:APtoAPde &= NEW(Hide:Relate:APtoAPde)
  _Hide:Access:IKUmPesn &= NEW(Hide:Access:IKUmPesn)
  _Hide:Relate:IKUmPesn &= NEW(Hide:Relate:IKUmPesn)
  _Hide:Access:APOBKONT &= NEW(Hide:Access:APOBKONT)
  _Hide:Relate:APOBKONT &= NEW(Hide:Relate:APOBKONT)
  _Hide:Access:RI_JasaRawat &= NEW(Hide:Access:RI_JasaRawat)
  _Hide:Relate:RI_JasaRawat &= NEW(Hide:Relate:RI_JasaRawat)
  _Hide:Access:APBRGCMP &= NEW(Hide:Access:APBRGCMP)
  _Hide:Relate:APBRGCMP &= NEW(Hide:Relate:APBRGCMP)
  _Hide:Access:JKelPeg &= NEW(Hide:Access:JKelPeg)
  _Hide:Relate:JKelPeg &= NEW(Hide:Relate:JKelPeg)
  _Hide:Access:queue &= NEW(Hide:Access:queue)
  _Hide:Relate:queue &= NEW(Hide:Relate:queue)
  _Hide:Access:APDTcam &= NEW(Hide:Access:APDTcam)
  _Hide:Relate:APDTcam &= NEW(Hide:Relate:APDTcam)
  _Hide:Access:APDTRANS &= NEW(Hide:Access:APDTRANS)
  _Hide:Relate:APDTRANS &= NEW(Hide:Relate:APDTRANS)
  _Hide:Access:AptoInDe &= NEW(Hide:Access:AptoInDe)
  _Hide:Relate:AptoInDe &= NEW(Hide:Relate:AptoInDe)
  _Hide:Access:ApReLuar &= NEW(Hide:Access:ApReLuar)
  _Hide:Relate:ApReLuar &= NEW(Hide:Relate:ApReLuar)
  _Hide:Access:ITAGUM &= NEW(Hide:Access:ITAGUM)
  _Hide:Relate:ITAGUM &= NEW(Hide:Relate:ITAGUM)
  _Hide:Access:APHTRANSBPJS &= NEW(Hide:Access:APHTRANSBPJS)
  _Hide:Relate:APHTRANSBPJS &= NEW(Hide:Relate:APHTRANSBPJS)
  _Hide:Access:RI_PinRuang &= NEW(Hide:Access:RI_PinRuang)
  _Hide:Relate:RI_PinRuang &= NEW(Hide:Relate:RI_PinRuang)
  _Hide:Access:RI_VisitDr &= NEW(Hide:Access:RI_VisitDr)
  _Hide:Relate:RI_VisitDr &= NEW(Hide:Relate:RI_VisitDr)
  _Hide:Access:APHTRANS &= NEW(Hide:Access:APHTRANS)
  _Hide:Relate:APHTRANS &= NEW(Hide:Relate:APHTRANS)
  _Hide:Access:JPegawai &= NEW(Hide:Access:JPegawai)
  _Hide:Relate:JPegawai &= NEW(Hide:Relate:JPegawai)
  _Hide:Access:Appegrsi &= NEW(Hide:Access:Appegrsi)
  _Hide:Relate:Appegrsi &= NEW(Hide:Relate:Appegrsi)
  Relate:AptoInHe &= _Hide:Relate:AptoInHe
  Relate:AptoApHe &= _Hide:Relate:AptoApHe
  Relate:APtoAPde &= _Hide:Relate:APtoAPde
  Relate:IKUmPesn &= _Hide:Relate:IKUmPesn
  Relate:APOBKONT &= _Hide:Relate:APOBKONT
  Relate:RI_JasaRawat &= _Hide:Relate:RI_JasaRawat
  Relate:APBRGCMP &= _Hide:Relate:APBRGCMP
  Relate:JKelPeg &= _Hide:Relate:JKelPeg
  Relate:queue &= _Hide:Relate:queue
  Relate:APDTcam &= _Hide:Relate:APDTcam
  Relate:APDTRANS &= _Hide:Relate:APDTRANS
  Relate:AptoInDe &= _Hide:Relate:AptoInDe
  Relate:ApReLuar &= _Hide:Relate:ApReLuar
  Relate:ITAGUM &= _Hide:Relate:ITAGUM
  Relate:APHTRANSBPJS &= _Hide:Relate:APHTRANSBPJS
  Relate:RI_PinRuang &= _Hide:Relate:RI_PinRuang
  Relate:RI_VisitDr &= _Hide:Relate:RI_VisitDr
  Relate:APHTRANS &= _Hide:Relate:APHTRANS
  Relate:JPegawai &= _Hide:Relate:JPegawai
  Relate:Appegrsi &= _Hide:Relate:Appegrsi


APC6NBC9:FilesInit PROCEDURE
  CODE
  _Hide:Relate:AptoInHe.Init
  _Hide:Relate:AptoApHe.Init
  _Hide:Relate:APtoAPde.Init
  _Hide:Relate:IKUmPesn.Init
  _Hide:Relate:APOBKONT.Init
  _Hide:Relate:RI_JasaRawat.Init
  _Hide:Relate:APBRGCMP.Init
  _Hide:Relate:JKelPeg.Init
  _Hide:Relate:queue.Init
  _Hide:Relate:APDTcam.Init
  _Hide:Relate:APDTRANS.Init
  _Hide:Relate:AptoInDe.Init
  _Hide:Relate:ApReLuar.Init
  _Hide:Relate:ITAGUM.Init
  _Hide:Relate:APHTRANSBPJS.Init
  _Hide:Relate:RI_PinRuang.Init
  _Hide:Relate:RI_VisitDr.Init
  _Hide:Relate:APHTRANS.Init
  _Hide:Relate:JPegawai.Init
  _Hide:Relate:Appegrsi.Init


APC6NBC9:DctKill PROCEDURE
  CODE
  _Hide:Relate:AptoInHe.Kill
  DISPOSE(_Hide:Relate:AptoInHe)
  _Hide:Relate:AptoApHe.Kill
  DISPOSE(_Hide:Relate:AptoApHe)
  _Hide:Relate:APtoAPde.Kill
  DISPOSE(_Hide:Relate:APtoAPde)
  _Hide:Relate:IKUmPesn.Kill
  DISPOSE(_Hide:Relate:IKUmPesn)
  _Hide:Relate:APOBKONT.Kill
  DISPOSE(_Hide:Relate:APOBKONT)
  _Hide:Relate:RI_JasaRawat.Kill
  DISPOSE(_Hide:Relate:RI_JasaRawat)
  _Hide:Relate:APBRGCMP.Kill
  DISPOSE(_Hide:Relate:APBRGCMP)
  _Hide:Relate:JKelPeg.Kill
  DISPOSE(_Hide:Relate:JKelPeg)
  _Hide:Relate:queue.Kill
  DISPOSE(_Hide:Relate:queue)
  _Hide:Relate:APDTcam.Kill
  DISPOSE(_Hide:Relate:APDTcam)
  _Hide:Relate:APDTRANS.Kill
  DISPOSE(_Hide:Relate:APDTRANS)
  _Hide:Relate:AptoInDe.Kill
  DISPOSE(_Hide:Relate:AptoInDe)
  _Hide:Relate:ApReLuar.Kill
  DISPOSE(_Hide:Relate:ApReLuar)
  _Hide:Relate:ITAGUM.Kill
  DISPOSE(_Hide:Relate:ITAGUM)
  _Hide:Relate:APHTRANSBPJS.Kill
  DISPOSE(_Hide:Relate:APHTRANSBPJS)
  _Hide:Relate:RI_PinRuang.Kill
  DISPOSE(_Hide:Relate:RI_PinRuang)
  _Hide:Relate:RI_VisitDr.Kill
  DISPOSE(_Hide:Relate:RI_VisitDr)
  _Hide:Relate:APHTRANS.Kill
  DISPOSE(_Hide:Relate:APHTRANS)
  _Hide:Relate:JPegawai.Kill
  DISPOSE(_Hide:Relate:JPegawai)
  _Hide:Relate:Appegrsi.Kill
  DISPOSE(_Hide:Relate:Appegrsi)


Hide:Relate:AptoInHe.Init PROCEDURE
  CODE
  _Hide:Access:AptoInHe.Init
  SELF.Init(Access:AptoInHe,1)


Hide:Access:AptoInHe.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APTI:Record
  SELF.FileNameValue = 'AptoInHe'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AptoInHe
  PARENT.Init
  Access:AptoInHe &= SELF


Hide:Access:AptoInHe.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AptoInHe &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AptoInHe.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AptoInHe,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APTI:key_no_tran,'APTI:key_no_tran',0)
    SELF.AddKey(APTI:key_apotik,'APTI:key_apotik',0)
    SELF.AddKey(APTI:key_tujuan,'APTI:key_tujuan',0)
    SELF.AddKey(APTI:key_tanggal,'tanggal transaksi',0)
    SELF.AddKey(APTI:nodkb_aptoinhe_fk,'APTI:nodkb_aptoinhe_fk',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AptoInHe.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:INHDKB)

  SELF.AddRelation(Relate:TBinstli)

  SELF.AddRelation(Relate:GApotik)

  SELF.AddRelation(Relate:AptoInDe,RI:CASCADE,RI:RESTRICT,APTD:key_no_nota)
  SELF.AddRelationLink(APTI:N0_tran,APTD:N0_tran)


Hide:Relate:AptoInHe.Kill PROCEDURE

  CODE
  _Hide:Access:AptoInHe.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:AptoInHe &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AptoInHe)                           ! destroy the file manager


Hide:Relate:AptoApHe.Init PROCEDURE
  CODE
  _Hide:Access:AptoApHe.Init
  SELF.Init(Access:AptoApHe,1)


Hide:Access:AptoApHe.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APTH:Record
  SELF.FileNameValue = 'AptoApHe'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AptoApHe
  PARENT.Init
  Access:AptoApHe &= SELF


Hide:Access:AptoApHe.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AptoApHe &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AptoApHe.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AptoApHe,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APTH:key_kode_ap,'kode_ap-tgl',0)
    SELF.AddKey(APTH:key_notran,'APTH:key_notran',0)
    SELF.AddKey(APTH:key_ap_kel,'ap_keluar-tgl',0)
    SELF.AddKey(APTH:key_tanggal,'tanggal transaksi',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AptoApHe.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GApotik)

  SELF.AddRelation(Relate:APtoAPde,RI:CASCADE,RI:RESTRICT,APTO:key_no_nota)
  SELF.AddRelationLink(APTH:N0_tran,APTO:N0_tran)


Hide:Relate:AptoApHe.Kill PROCEDURE

  CODE
  _Hide:Access:AptoApHe.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:AptoApHe &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AptoApHe)                           ! destroy the file manager


Hide:Relate:APtoAPde.Init PROCEDURE
  CODE
  _Hide:Access:APtoAPde.Init
  SELF.Init(Access:APtoAPde,1)


Hide:Access:APtoAPde.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APTO:Record
  SELF.FileNameValue = 'APtoAPde'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= APtoAPde
  PARENT.Init
  Access:APtoAPde &= SELF


Hide:Access:APtoAPde.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:APtoAPde &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:APtoAPde.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(APtoAPde,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APTO:KeyKodeBrg,'APTO:KeyKodeBrg',0)
    SELF.AddKey(APTO:key_no_nota,'APTO:key_no_nota',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:APtoAPde.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:AptoApHe)


Hide:Relate:APtoAPde.Kill PROCEDURE

  CODE
  _Hide:Access:APtoAPde.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:APtoAPde &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:APtoAPde)                           ! destroy the file manager


Hide:Relate:IKUmPesn.Init PROCEDURE
  CODE
  _Hide:Access:IKUmPesn.Init
  SELF.Init(Access:IKUmPesn,1)


Hide:Access:IKUmPesn.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IKUPs:Record
  SELF.FileNameValue = 'IKUmPesn'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= IKUmPesn
  PARENT.Init
  Access:IKUmPesn &= SELF


Hide:Access:IKUmPesn.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:IKUmPesn &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:IKUmPesn.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(IKUmPesn,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(IKUPs:KeyNomorMRUrtTgl,'IKUPs:KeyNomorMRUrtTgl',0)
    SELF.AddKey(IKUPs:KeyNoBukti,'IKUPs:KeyNoBukti',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:IKUmPesn.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:RI_HRInap)


Hide:Relate:IKUmPesn.Kill PROCEDURE

  CODE
  _Hide:Access:IKUmPesn.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:IKUmPesn &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:IKUmPesn)                           ! destroy the file manager


Hide:Relate:APOBKONT.Init PROCEDURE
  CODE
  _Hide:Access:APOBKONT.Init
  SELF.Init(Access:APOBKONT,1)


Hide:Access:APOBKONT.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APO:Record
  SELF.FileNameValue = 'APOBKONT'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= APOBKONT
  PARENT.Init
  Access:APOBKONT &= SELF


Hide:Access:APOBKONT.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:APOBKONT &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:APOBKONT.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(APOBKONT,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APO:by_kode_ktr,'APO:by_kode_ktr',0)
    SELF.AddKey(APO:by_kode_brg,'APO:by_kode_brg',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:APOBKONT.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:JKontrak)


Hide:Relate:APOBKONT.Kill PROCEDURE

  CODE
  _Hide:Access:APOBKONT.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:APOBKONT &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:APOBKONT)                           ! destroy the file manager


Hide:Relate:RI_JasaRawat.Init PROCEDURE
  CODE
  _Hide:Access:RI_JasaRawat.Init
  SELF.Init(Access:RI_JasaRawat,1)


Hide:Access:RI_JasaRawat.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RI_JA:Record
  SELF.FileNameValue = 'RI_JasaRawat'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RI_JasaRawat
  PARENT.Init
  Access:RI_JasaRawat &= SELF


Hide:Access:RI_JasaRawat.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RI_JasaRawat &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RI_JasaRawat.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RI_JasaRawat,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(RI_JA:K1,'Key dg nomor mr dan nomor urut kode jasa',0)
    SELF.AddKey(RI_JA:K_kodeJasa,'RI_JA:K_kodeJasa',0)
    SELF.AddKey(RI_JA:Kmr,'RI_JA:Kmr',0)
    SELF.AddKey(RI_JA:KMrUrutJasa,'RI_JA:KMrUrutJasa',0)
    SELF.AddKey(RI_JA:KMrUrutJasaKet,'RI_JA:KMrUrutJasaKet',0)
    SELF.AddKey(RI_JA:Kket,'RI_JA:Kket',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:RI_JasaRawat.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:RI_HRInap)

  SELF.AddRelation(Relate:IMJasa)


Hide:Relate:RI_JasaRawat.Kill PROCEDURE

  CODE
  _Hide:Access:RI_JasaRawat.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:RI_JasaRawat &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RI_JasaRawat)                       ! destroy the file manager


Hide:Relate:APBRGCMP.Init PROCEDURE
  CODE
  _Hide:Access:APBRGCMP.Init
  SELF.Init(Access:APBRGCMP,1)


Hide:Access:APBRGCMP.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APB:Record
  SELF.FileNameValue = 'APBRGCMP'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= APBRGCMP
  PARENT.Init
  Access:APBRGCMP &= SELF


Hide:Access:APBRGCMP.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:APBRGCMP &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:APBRGCMP.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(APBRGCMP,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APB:by_kd_barang,'APB:by_kd_barang',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:APBRGCMP.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)


Hide:Relate:APBRGCMP.Kill PROCEDURE

  CODE
  _Hide:Access:APBRGCMP.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:APBRGCMP &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:APBRGCMP)                           ! destroy the file manager


Hide:Relate:JKelPeg.Init PROCEDURE
  CODE
  _Hide:Access:JKelPeg.Init
  SELF.Init(Access:JKelPeg,1)


Hide:Access:JKelPeg.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JKE:Record
  SELF.FileNameValue = 'JKelPeg'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JKelPeg
  PARENT.Init
  Access:JKelPeg &= SELF


Hide:Access:JKelPeg.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JKelPeg &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JKelPeg.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JKelPeg,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JKE:by_nip,'JKE:by_nip',0)
    SELF.AddKey(JKE:by_nomor,'JKE:by_nomor',0)
    SELF.AddKey(JKE:by_nama,'JKE:by_nama',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:JKelPeg.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:JPegawai1     USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('JKE:NIP')
    Save:JPegawai1 = Access:JPegawai.SaveFile()
    PEG:NIP = JKE:NIP
    ReturnValue = Access:JPegawai.TryFetch(PEG:KeyNIP)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'JPegawai')
      END
    END
    Access:JPegawai.RestoreFile(Save:JPegawai1)
  END
  RETURN ReturnValue


Hide:Relate:JKelPeg.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JPasien)

  SELF.AddRelation(Relate:JPegawai)


Hide:Relate:JKelPeg.Kill PROCEDURE

  CODE
  _Hide:Access:JKelPeg.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:JKelPeg &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JKelPeg)                            ! destroy the file manager


Hide:Relate:queue.Init PROCEDURE
  CODE
  _Hide:Access:queue.Init
  SELF.Init(Access:queue,1)


Hide:Access:queue.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= QUE:Record
  SELF.FileNameValue = 'queue'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= queue
  PARENT.Init
  Access:queue &= SELF


Hide:Access:queue.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:queue &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:queue.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(queue,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(QUE:kqueue,'QUE:kqueue',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:queue.Kill PROCEDURE

  CODE
  _Hide:Access:queue.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:queue &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:queue)                              ! destroy the file manager


Hide:Relate:APDTcam.Init PROCEDURE
  CODE
  _Hide:Access:APDTcam.Init
  SELF.Init(Access:APDTcam,1)


Hide:Access:APDTcam.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APD1:Record
  SELF.FileNameValue = 'APDTcam'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= APDTcam
  PARENT.Init
  Access:APDTcam &= SELF


Hide:Access:APDTcam.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:APDTcam &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:APDTcam.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(APDTcam,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APD1:by_tran_cam,'nomor transaksi-campur',0)
    SELF.AddKey(APD1:by_kodebrg,'APD1:by_kodebrg',0)
    SELF.AddKey(APD1:by_tranno,'APD1:by_tranno',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:APDTcam.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:APDTRANS)


Hide:Relate:APDTcam.Kill PROCEDURE

  CODE
  _Hide:Access:APDTcam.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:APDTcam &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:APDTcam)                            ! destroy the file manager


Hide:Relate:APDTRANS.Init PROCEDURE
  CODE
  _Hide:Access:APDTRANS.Init
  SELF.Init(Access:APDTRANS,1)


Hide:Access:APDTRANS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APD:Record
  SELF.FileNameValue = 'APDTRANS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= APDTRANS
  PARENT.Init
  Access:APDTRANS &= SELF


Hide:Access:APDTRANS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:APDTRANS &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:APDTRANS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(APDTRANS,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APD:by_transaksi,'APD:by_transaksi',0)
    SELF.AddKey(APD:notran_kode,'APD:notran_kode',0)
    SELF.AddKey(APD:by_kodebrg,'APD:by_kodebrg',0)
    SELF.AddKey(APD:by_tran_cam,'index atas transaksi dan campur',0)
    SELF.AddKey(APD:transjum_apdtrans_fk,'APD:transjum_apdtrans_fk',0)
    SELF.AddKey(APD:by_tran_kdbrg,'APD:by_tran_kdbrg',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:APDTRANS.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:APHTRANSBPJS)

  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:APDTcam,RI:CASCADE,RI:RESTRICT,APD1:by_tran_cam)
  SELF.AddRelationLink(APD:N0_tran,APD1:N0_tran)

  SELF.AddRelation(Relate:APHTRANS)


Hide:Relate:APDTRANS.Kill PROCEDURE

  CODE
  _Hide:Access:APDTRANS.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:APDTRANS &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:APDTRANS)                           ! destroy the file manager


Hide:Relate:AptoInDe.Init PROCEDURE
  CODE
  _Hide:Access:AptoInDe.Init
  SELF.Init(Access:AptoInDe,1)


Hide:Access:AptoInDe.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APTD:Record
  SELF.FileNameValue = 'AptoInDe'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AptoInDe
  PARENT.Init
  Access:AptoInDe &= SELF


Hide:Access:AptoInDe.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AptoInDe &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AptoInDe.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AptoInDe,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APTD:key_kd_brg,'APTD:key_kd_brg',0)
    SELF.AddKey(APTD:key_no_nota,'APTD:key_no_nota',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AptoInDe.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:AptoInHe)


Hide:Relate:AptoInDe.Kill PROCEDURE

  CODE
  _Hide:Access:AptoInDe.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:AptoInDe &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AptoInDe)                           ! destroy the file manager


Hide:Relate:ApReLuar.Init PROCEDURE
  CODE
  _Hide:Access:ApReLuar.Init
  SELF.Init(Access:ApReLuar,1)


Hide:Access:ApReLuar.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APR:Record
  SELF.FileNameValue = 'ApReLuar'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ApReLuar
  PARENT.Init
  Access:ApReLuar &= SELF


Hide:Access:ApReLuar.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ApReLuar &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ApReLuar.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ApReLuar,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APR:by_transaksi,'no_transaksi',0)
    SELF.AddKey(APR:key_nama_pasien,'nama-alamat',0)
    SELF.AddKey(APR:key_nama,'nama pasien',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ApReLuar.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:APHTRANSBPJS)

  SELF.AddRelation(Relate:APHTRANS)


Hide:Relate:ApReLuar.Kill PROCEDURE

  CODE
  _Hide:Access:ApReLuar.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:ApReLuar &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ApReLuar)                           ! destroy the file manager


Hide:Relate:ITAGUM.Init PROCEDURE
  CODE
  _Hide:Access:ITAGUM.Init
  SELF.Init(Access:ITAGUM,1)


Hide:Access:ITAGUM.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ITGU:Record
  SELF.FileNameValue = 'ITAGUM'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ITAGUM
  PARENT.Init
  Access:ITAGUM &= SELF


Hide:Access:ITAGUM.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ITAGUM &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ITAGUM.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ITAGUM,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(ITGU:KeyNomor_Mr,'ITGU:KeyNomor_Mr',0)
    SELF.AddKey(ITGU:KeyNoMrSaja,'ITGU:KeyNoMrSaja',0)
    SELF.AddKey(ITGU:KeyTanggal,'ITGU:KeyTanggal',0)
    SELF.AddKey(ITGU:KeyRuang,'ITGU:KeyRuang',0)
    SELF.AddKey(ITGU:KeyCetak,'ITGU:KeyCetak',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ITAGUM.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JPasien)

  SELF.AddRelation(Relate:ITbrRwt)


Hide:Relate:ITAGUM.Kill PROCEDURE

  CODE
  _Hide:Access:ITAGUM.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:ITAGUM &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ITAGUM)                             ! destroy the file manager


Hide:Relate:APHTRANSBPJS.Init PROCEDURE
  CODE
  _Hide:Access:APHTRANSBPJS.Init
  SELF.Init(Access:APHTRANSBPJS,1)


Hide:Access:APHTRANSBPJS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APHB:Record
  SELF.FileNameValue = 'APHTRANSBPJS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= APHTRANSBPJS
  PARENT.Init
  Access:APHTRANSBPJS &= SELF


Hide:Access:APHTRANSBPJS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:APHTRANSBPJS &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:APHTRANSBPJS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(APHTRANSBPJS,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APHB:by_medrec,'APHB:by_medrec',0)
    SELF.AddKey(APHB:Prescribe_Aphtrans_FK,'APHB:Prescribe_Aphtrans_FK',0)
    SELF.AddKey(APHB:nonota_aphtras_key,'APHB:nonota_aphtras_key',0)
    SELF.AddKey(APHB:dokter_aphtrans_fk,'APHB:dokter_aphtrans_fk',0)
    SELF.AddKey(APHB:by_transaksi,'APHB:by_transaksi',0)
    SELF.AddKey(APHB:BY_KODEAP,'APHB:BY_KODEAP',0)
    SELF.AddKey(APHB:keytanggal,'APHB:keytanggal',0)
    SELF.AddKey(APHB:KeyNoMrAsal,'APHB:KeyNoMrAsal',0)
    SELF.AddKey(APHB:Pegawai_aphtrans_fk,'APHB:Pegawai_aphtrans_fk',0)
    SELF.AddKey(APHB:Kontrak_aphtrans_fk,'APHB:Kontrak_aphtrans_fk',0)
    SELF.AddKey(APHB:nopaket_aphtrans_fk,'APHB:nopaket_aphtrans_fk',0)
    SELF.AddKey(APHB:Ktgl_jam,'APHB:Ktgl_jam',0)
    SELF.AddKey(APHB:mrurut_aphtrans_fk,'APHB:mrurut_aphtrans_fk',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:APHTRANSBPJS.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  DO AddRelations_2
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SMPegawai)

  SELF.AddRelation(Relate:JDokter)

  SELF.AddRelation(Relate:ApPaketH)

  SELF.AddRelation(Relate:JKontrak)

  SELF.AddRelation(Relate:ApNotaObat,RI:None,RI:None,APN1:PrimaryKey)
  SELF.AddRelationLink(APHB:N0_tran,APN1:Nomor)

  SELF.AddRelation(Relate:Aphtransadd,RI:None,RI:None,APH1:PrimaryKey)
  SELF.AddRelationLink(APHB:N0_tran,APH1:Nomor)

  SELF.AddRelation(Relate:IPasien)

  SELF.AddRelation(Relate:Appegrsi,RI:None,RI:None,APP:by_tran)
  SELF.AddRelationLink(APHB:N0_tran,APP:N0_tran)

  SELF.AddRelation(Relate:ApReLuar,RI:None,RI:None,APR:by_transaksi)
  SELF.AddRelationLink(APHB:N0_tran,APR:N0_tran)

  SELF.AddRelation(Relate:APDTRANS,RI:None,RI:None,APD:notran_kode)
  SELF.AddRelationLink(APHB:N0_tran,APD:N0_tran)

AddRelations_2 ROUTINE
  SELF.AddRelation(Relate:JTransaksi)

  SELF.AddRelation(Relate:GApotik)

  SELF.AddRelation(Relate:JPasien)


Hide:Relate:APHTRANSBPJS.Kill PROCEDURE

  CODE
  _Hide:Access:APHTRANSBPJS.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:APHTRANSBPJS &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:APHTRANSBPJS)                       ! destroy the file manager


Hide:Relate:RI_PinRuang.Init PROCEDURE
  CODE
  _Hide:Access:RI_PinRuang.Init
  SELF.Init(Access:RI_PinRuang,1)


Hide:Access:RI_PinRuang.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RI_PI:Record
  SELF.FileNameValue = 'RI_PinRuang'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RI_PinRuang
  PARENT.Init
  Access:RI_PinRuang &= SELF


Hide:Access:RI_PinRuang.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RI_PinRuang &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RI_PinRuang.PrimeFields PROCEDURE

  CODE
  RI_PI:Jam_Masuk = Clock()                                ! Assign initial field value
  RI_PI:Tanggal_Masuk = Today()                            ! Assign initial field value
  RI_PI:Jam_Keluar = Clock()                               ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:RI_PinRuang.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RI_PinRuang,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(RI_PI:PrimaryKey,'RI_PI:PrimaryKey',0)
    SELF.AddKey(RI_PI:keymr_tgl,'RI_PI:keymr_tgl',0)
    SELF.AddKey(RI_PI:KeyTanggalMasuk,'RI_PI:KeyTanggalMasuk',0)
    SELF.AddKey(RI_PI:KeyKodeRuang,'RI_PI:KeyKodeRuang',0)
    SELF.AddKey(RI_PI:KeyKodeDokter,'RI_PI:KeyKodeDokter',0)
    SELF.AddKey(RI_PI:KeyNoNota,'RI_PI:KeyNoNota',0)
    SELF.AddKey(RI_PI:KeyNoMrRuang,'RI_PI:KeyNoMrRuang',0)
    SELF.AddKey(RI_PI:KeyNoMrSaja,'RI_PI:KeyNoMrSaja',0)
    SELF.AddKey(RI_PI:KeyNoMrStatus,'RI_PI:KeyNoMrStatus',0)
    SELF.AddKey(RI_PI:NomorMR_Urut_Key,'RI_PI:NomorMR_Urut_Key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:RI_PinRuang.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 11
    GlobalErrors.SetField('Status pasien')
    IF NOT INRANGE(RI_PI:Status,1,3)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'1 .. 3')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:RI_PinRuang.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:RiTind,RI:None,RI:RESTRICT,Tind:K1)
  SELF.AddRelationLink(RI_PI:Nomor_mr,Tind:Mr)
  SELF.AddRelationLink(RI_PI:NoUrut,Tind:Urut)
  SELF.AddRelationLink(RI_PI:Tanggal_Masuk,Tind:TglMasuk)
  SELF.AddRelationLink(RI_PI:Jam_Masuk,Tind:JamMasuk)

  SELF.AddRelation(Relate:RI_VisitDr,RI:None,RI:None,VI_SI:PrimaryKey)
  SELF.AddRelationLink(RI_PI:Nomor_mr,VI_SI:Nomor_mr)
  SELF.AddRelationLink(RI_PI:NoUrut,VI_SI:NoUrut)
  SELF.AddRelationLink(RI_PI:Tanggal_Masuk,VI_SI:Tanggal_Masuk)
  SELF.AddRelationLink(RI_PI:Jam_Masuk,VI_SI:Jam_Masuk)

  SELF.AddRelation(Relate:ITbrRwt)

  SELF.AddRelation(Relate:JDokter)

  SELF.AddRelation(Relate:RI_HRInap)


Hide:Relate:RI_PinRuang.Kill PROCEDURE

  CODE
  _Hide:Access:RI_PinRuang.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:RI_PinRuang &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RI_PinRuang)                        ! destroy the file manager


Hide:Relate:RI_VisitDr.Init PROCEDURE
  CODE
  _Hide:Access:RI_VisitDr.Init
  SELF.Init(Access:RI_VisitDr,1)


Hide:Access:RI_VisitDr.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= VI_SI:Record
  SELF.FileNameValue = 'RI_VisitDr'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RI_VisitDr
  PARENT.Init
  Access:RI_VisitDr &= SELF


Hide:Access:RI_VisitDr.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RI_VisitDr &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RI_VisitDr.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RI_VisitDr,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(VI_SI:PrimaryKey,'VI_SI:PrimaryKey',0)
    SELF.AddKey(VI_SI:KeyKodeDr,'VI_SI:KeyKodeDr',0)
    SELF.AddKey(VI_SI:KeyTanggal,'VI_SI:KeyTanggal',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:RI_VisitDr.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 17
    GlobalErrors.SetField('VI_SI:Dr_visit')
    IF INSTRING(']' & VI_SI:Dr_visit & '[', ']1[]2[]3[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Dr. Ruangan'',''Dr. Konsul'',''Dr Operasi''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:RI_VisitDr.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:RI_PinRuang)

  SELF.AddRelation(Relate:JDokter)


Hide:Relate:RI_VisitDr.Kill PROCEDURE

  CODE
  _Hide:Access:RI_VisitDr.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:RI_VisitDr &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RI_VisitDr)                         ! destroy the file manager


Hide:Relate:APHTRANS.Init PROCEDURE
  CODE
  _Hide:Access:APHTRANS.Init
  SELF.Init(Access:APHTRANS,1)


Hide:Access:APHTRANS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APH:Record
  SELF.FileNameValue = 'APHTRANS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= APHTRANS
  PARENT.Init
  Access:APHTRANS &= SELF


Hide:Access:APHTRANS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:APHTRANS &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:APHTRANS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(APHTRANS,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APH:keyEpre,'APH:keyEpre',0)
    SELF.AddKey(APH:by_medrec,'APH:by_medrec',0)
    SELF.AddKey(APH:Prescribe_Aphtrans_FK,'APH:Prescribe_Aphtrans_FK',0)
    SELF.AddKey(APH:nonota_aphtras_key,'APH:nonota_aphtras_key',0)
    SELF.AddKey(APH:dokter_aphtrans_fk,'APH:dokter_aphtrans_fk',0)
    SELF.AddKey(APH:by_transaksi,'APH:by_transaksi',0)
    SELF.AddKey(APH:BY_KODEAP,'APH:BY_KODEAP',0)
    SELF.AddKey(APH:keytanggal,'APH:keytanggal',0)
    SELF.AddKey(APH:KeyNoMrAsal,'APH:KeyNoMrAsal',0)
    SELF.AddKey(APH:Pegawai_aphtrans_fk,'APH:Pegawai_aphtrans_fk',0)
    SELF.AddKey(APH:Kontrak_aphtrans_fk,'APH:Kontrak_aphtrans_fk',0)
    SELF.AddKey(APH:nopaket_aphtrans_fk,'APH:nopaket_aphtrans_fk',0)
    SELF.AddKey(APH:Ktgl_jam,'APH:Ktgl_jam',0)
    SELF.AddKey(APH:mrurut_aphtrans_fk,'APH:mrurut_aphtrans_fk',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:APHTRANS.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  DO AddRelations_2
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:APEPREH)

  SELF.AddRelation(Relate:JHBILLING)

  SELF.AddRelation(Relate:RI_HRInap)

  SELF.AddRelation(Relate:JTransaksi)

  SELF.AddRelation(Relate:ApPaketH)

  SELF.AddRelation(Relate:JDokter)

  SELF.AddRelation(Relate:ApNotaObat,RI:None,RI:None,APN1:PrimaryKey)
  SELF.AddRelationLink(APH:N0_tran,APN1:Nomor)

  SELF.AddRelation(Relate:Aphtransadd,RI:None,RI:None,APH1:PrimaryKey)
  SELF.AddRelationLink(APH:N0_tran,APH1:Nomor)

  SELF.AddRelation(Relate:SMPegawai)

  SELF.AddRelation(Relate:JKontrak)

AddRelations_2 ROUTINE
  SELF.AddRelation(Relate:IPasien)

  SELF.AddRelation(Relate:GApotik)

  SELF.AddRelation(Relate:JPasien)

  SELF.AddRelation(Relate:Appegrsi,RI:CASCADE,RI:RESTRICT,APP:by_tran)
  SELF.AddRelationLink(APH:N0_tran,APP:N0_tran)

  SELF.AddRelation(Relate:ApReLuar,RI:CASCADE,RI:RESTRICT,APR:by_transaksi)
  SELF.AddRelationLink(APH:N0_tran,APR:N0_tran)

  SELF.AddRelation(Relate:APDTRANS,RI:None,RI:None,APD:notran_kode)
  SELF.AddRelationLink(APH:N0_tran,APD:N0_tran)


Hide:Relate:APHTRANS.Kill PROCEDURE

  CODE
  _Hide:Access:APHTRANS.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:APHTRANS &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:APHTRANS)                           ! destroy the file manager


Hide:Relate:JPegawai.Init PROCEDURE
  CODE
  _Hide:Access:JPegawai.Init
  SELF.Init(Access:JPegawai,1)


Hide:Access:JPegawai.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PEG:Record
  SELF.FileNameValue = 'JPegawai'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JPegawai
  PARENT.Init
  Access:JPegawai &= SELF


Hide:Access:JPegawai.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JPegawai &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JPegawai.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JPegawai,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(PEG:KeyNIP,'PEG:KeyNIP',0)
    SELF.AddKey(PEG:KeyGol,'PEG:KeyGol',0)
    SELF.AddKey(PEG:KeyJabatan,'PEG:KeyJabatan',0)
    SELF.AddKey(PEG:KeyAlamat,'PEG:KeyAlamat',0)
    SELF.AddKey(PEG:KeyNama,'PEG:KeyNama',0)
    SELF.AddKey(PEG:KeyID,'PEG:KeyID',0)
    SELF.AddKey(PEG:KeyTanggalBekerja,'PEG:KeyTanggalBekerja',0)
    SELF.AddKey(PEG:KeyPendidikan,'PEG:KeyPendidikan',0)
    SELF.AddKey(PEG:KeyTanggalLahir,'PEG:KeyTanggalLahir',0)
    SELF.AddKey(PEG:KeySex,'PEG:KeySex',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JPegawai.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JKelPeg,RI:CASCADE,RI:RESTRICT,JKE:by_nip)
  SELF.AddRelationLink(PEG:NIP,JKE:NIP)

  SELF.AddRelation(Relate:Appegrsi,RI:CASCADE,RI:RESTRICT,APP:by_nip)
  SELF.AddRelationLink(PEG:NIP,APP:NIP)


Hide:Relate:JPegawai.Kill PROCEDURE

  CODE
  _Hide:Access:JPegawai.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:JPegawai &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JPegawai)                           ! destroy the file manager


Hide:Relate:Appegrsi.Init PROCEDURE
  CODE
  _Hide:Access:Appegrsi.Init
  SELF.Init(Access:Appegrsi,1)


Hide:Access:Appegrsi.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APP:Record
  SELF.FileNameValue = 'Appegrsi'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Appegrsi
  PARENT.Init
  Access:Appegrsi &= SELF


Hide:Access:Appegrsi.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Appegrsi &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Appegrsi.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Appegrsi,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APP:by_nip,'APP:by_nip',0)
    SELF.AddKey(APP:by_tran,'APP:by_tran',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:Appegrsi.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:JPegawai1     USHORT,AUTO
Save:APHTRANS2     USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('APP:NIP')
    Save:JPegawai1 = Access:JPegawai.SaveFile()
    PEG:NIP = APP:NIP
    ReturnValue = Access:JPegawai.TryFetch(PEG:KeyNIP)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'JPegawai')
      END
    END
    Access:JPegawai.RestoreFile(Save:JPegawai1)
  OF 2
    GlobalErrors.SetField('nomor transaksi')
    Save:APHTRANS2 = Access:APHTRANS.SaveFile()
    APH:N0_tran = APP:N0_tran
    ReturnValue = Access:APHTRANS.TryFetch(APH:by_transaksi)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'APHTRANS')
      END
    END
    Access:APHTRANS.RestoreFile(Save:APHTRANS2)
  END
  RETURN ReturnValue


Hide:Relate:Appegrsi.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:APHTRANSBPJS)

  SELF.AddRelation(Relate:JPegawai)

  SELF.AddRelation(Relate:APHTRANS)


Hide:Relate:Appegrsi.Kill PROCEDURE

  CODE
  _Hide:Access:Appegrsi.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:Appegrsi &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Appegrsi)                           ! destroy the file manager

