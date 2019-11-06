  MEMBER('apc6new.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
APC6NBCE:DctInit    PROCEDURE
APC6NBCE:DctKill    PROCEDURE
APC6NBCE:FilesInit  PROCEDURE
  END

Hide:Access:RoStok   CLASS(FileManager),TYPE               ! FileManager for RoStok
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RoStok   CLASS(RelationManager),TYPE           ! RelationManager for RoStok
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RoPasien CLASS(FileManager),TYPE               ! FileManager for RoPasien
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RoPasien CLASS(RelationManager),TYPE           ! RelationManager for RoPasien
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RoPasRJ  CLASS(FileManager),TYPE               ! FileManager for RoPasRJ
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RoPasRJ  CLASS(RelationManager),TYPE           ! RelationManager for RoPasRJ
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RoPasRIXXX CLASS(FileManager),TYPE             ! FileManager for RoPasRIXXX
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RoPasRIXXX CLASS(RelationManager),TYPE         ! RelationManager for RoPasRIXXX
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:IVisitDr CLASS(FileManager),TYPE               ! FileManager for IVisitDr
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:IVisitDr CLASS(RelationManager),TYPE           ! RelationManager for IVisitDr
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ITindak  CLASS(FileManager),TYPE               ! FileManager for ITindak
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ITindak  CLASS(RelationManager),TYPE           ! RelationManager for ITindak
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:IDaftarPPSP CLASS(FileManager),TYPE            ! FileManager for IDaftarPPSP
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:IDaftarPPSP CLASS(RelationManager),TYPE        ! RelationManager for IDaftarPPSP
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:TBinstli CLASS(FileManager),TYPE               ! FileManager for TBinstli
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:TBinstli CLASS(RelationManager),TYPE           ! RelationManager for TBinstli
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ApObInst CLASS(FileManager),TYPE               ! FileManager for ApObInst
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ApObInst CLASS(RelationManager),TYPE           ! RelationManager for ApObInst
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:IHNotaSm CLASS(FileManager),TYPE               ! FileManager for IHNotaSm
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:IHNotaSm CLASS(RelationManager),TYPE           ! RelationManager for IHNotaSm
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:TBTransResepDokterEtiket CLASS(FileManager),TYPE ! FileManager for TBTransResepDokterEtiket
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:TBTransResepDokterEtiket CLASS(RelationManager),TYPE ! RelationManager for TBTransResepDokterEtiket
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:TBTransResepDokterHeader CLASS(FileManager),TYPE ! FileManager for TBTransResepDokterHeader
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:TBTransResepDokterHeader CLASS(RelationManager),TYPE ! RelationManager for TBTransResepDokterHeader
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:TBTransResepDokterHeader_RI CLASS(FileManager),TYPE ! FileManager for TBTransResepDokterHeader_RI
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:TBTransResepDokterHeader_RI CLASS(RelationManager),TYPE ! RelationManager for TBTransResepDokterHeader_RI
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:TBTransResepDokterHeader_RIHarian CLASS(FileManager),TYPE ! FileManager for TBTransResepDokterHeader_RIHarian
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:TBTransResepDokterHeader_RIHarian CLASS(RelationManager),TYPE ! RelationManager for TBTransResepDokterHeader_RIHarian
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:TBTransResepObatCampur CLASS(FileManager),TYPE ! FileManager for TBTransResepObatCampur
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:TBTransResepObatCampur CLASS(RelationManager),TYPE ! RelationManager for TBTransResepObatCampur
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:TBTransResepItter CLASS(FileManager),TYPE      ! FileManager for TBTransResepItter
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:TBTransResepItter CLASS(RelationManager),TYPE  ! RelationManager for TBTransResepItter
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:UHksRjln CLASS(FileManager),TYPE               ! FileManager for UHksRjln
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:UHksRjln CLASS(RelationManager),TYPE           ! RelationManager for UHksRjln
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:UtmptRj  CLASS(FileManager),TYPE               ! FileManager for UtmptRj
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:UtmptRj  CLASS(RelationManager),TYPE           ! RelationManager for UtmptRj
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:UDksRjln CLASS(FileManager),TYPE               ! FileManager for UDksRjln
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:UDksRjln CLASS(RelationManager),TYPE           ! RelationManager for UDksRjln
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:UJMan    CLASS(FileManager),TYPE               ! FileManager for UJMan
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:UJMan    CLASS(RelationManager),TYPE           ! RelationManager for UJMan
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END


_Hide:Access:RoStok  &Hide:Access:RoStok,AUTO,THREAD
_Hide:Relate:RoStok  &Hide:Relate:RoStok,AUTO,THREAD
_Hide:Access:RoPasien &Hide:Access:RoPasien,AUTO,THREAD
_Hide:Relate:RoPasien &Hide:Relate:RoPasien,AUTO,THREAD
_Hide:Access:RoPasRJ &Hide:Access:RoPasRJ,AUTO,THREAD
_Hide:Relate:RoPasRJ &Hide:Relate:RoPasRJ,AUTO,THREAD
_Hide:Access:RoPasRIXXX &Hide:Access:RoPasRIXXX,AUTO,THREAD
_Hide:Relate:RoPasRIXXX &Hide:Relate:RoPasRIXXX,AUTO,THREAD
_Hide:Access:IVisitDr &Hide:Access:IVisitDr,AUTO,THREAD
_Hide:Relate:IVisitDr &Hide:Relate:IVisitDr,AUTO,THREAD
_Hide:Access:ITindak &Hide:Access:ITindak,AUTO,THREAD
_Hide:Relate:ITindak &Hide:Relate:ITindak,AUTO,THREAD
_Hide:Access:IDaftarPPSP &Hide:Access:IDaftarPPSP,AUTO,THREAD
_Hide:Relate:IDaftarPPSP &Hide:Relate:IDaftarPPSP,AUTO,THREAD
_Hide:Access:TBinstli &Hide:Access:TBinstli,AUTO,THREAD
_Hide:Relate:TBinstli &Hide:Relate:TBinstli,AUTO,THREAD
_Hide:Access:ApObInst &Hide:Access:ApObInst,AUTO,THREAD
_Hide:Relate:ApObInst &Hide:Relate:ApObInst,AUTO,THREAD
_Hide:Access:IHNotaSm &Hide:Access:IHNotaSm,AUTO,THREAD
_Hide:Relate:IHNotaSm &Hide:Relate:IHNotaSm,AUTO,THREAD
_Hide:Access:TBTransResepDokterEtiket &Hide:Access:TBTransResepDokterEtiket,AUTO,THREAD
_Hide:Relate:TBTransResepDokterEtiket &Hide:Relate:TBTransResepDokterEtiket,AUTO,THREAD
_Hide:Access:TBTransResepDokterHeader &Hide:Access:TBTransResepDokterHeader,AUTO,THREAD
_Hide:Relate:TBTransResepDokterHeader &Hide:Relate:TBTransResepDokterHeader,AUTO,THREAD
_Hide:Access:TBTransResepDokterHeader_RI &Hide:Access:TBTransResepDokterHeader_RI,AUTO,THREAD
_Hide:Relate:TBTransResepDokterHeader_RI &Hide:Relate:TBTransResepDokterHeader_RI,AUTO,THREAD
_Hide:Access:TBTransResepDokterHeader_RIHarian &Hide:Access:TBTransResepDokterHeader_RIHarian,AUTO,THREAD
_Hide:Relate:TBTransResepDokterHeader_RIHarian &Hide:Relate:TBTransResepDokterHeader_RIHarian,AUTO,THREAD
_Hide:Access:TBTransResepObatCampur &Hide:Access:TBTransResepObatCampur,AUTO,THREAD
_Hide:Relate:TBTransResepObatCampur &Hide:Relate:TBTransResepObatCampur,AUTO,THREAD
_Hide:Access:TBTransResepItter &Hide:Access:TBTransResepItter,AUTO,THREAD
_Hide:Relate:TBTransResepItter &Hide:Relate:TBTransResepItter,AUTO,THREAD
_Hide:Access:UHksRjln &Hide:Access:UHksRjln,AUTO,THREAD
_Hide:Relate:UHksRjln &Hide:Relate:UHksRjln,AUTO,THREAD
_Hide:Access:UtmptRj &Hide:Access:UtmptRj,AUTO,THREAD
_Hide:Relate:UtmptRj &Hide:Relate:UtmptRj,AUTO,THREAD
_Hide:Access:UDksRjln &Hide:Access:UDksRjln,AUTO,THREAD
_Hide:Relate:UDksRjln &Hide:Relate:UDksRjln,AUTO,THREAD
_Hide:Access:UJMan   &Hide:Access:UJMan,AUTO,THREAD
_Hide:Relate:UJMan   &Hide:Relate:UJMan,AUTO,THREAD


APC6NBCE:DctInit PROCEDURE
  CODE
  _Hide:Access:RoStok &= NEW(Hide:Access:RoStok)
  _Hide:Relate:RoStok &= NEW(Hide:Relate:RoStok)
  _Hide:Access:RoPasien &= NEW(Hide:Access:RoPasien)
  _Hide:Relate:RoPasien &= NEW(Hide:Relate:RoPasien)
  _Hide:Access:RoPasRJ &= NEW(Hide:Access:RoPasRJ)
  _Hide:Relate:RoPasRJ &= NEW(Hide:Relate:RoPasRJ)
  _Hide:Access:RoPasRIXXX &= NEW(Hide:Access:RoPasRIXXX)
  _Hide:Relate:RoPasRIXXX &= NEW(Hide:Relate:RoPasRIXXX)
  _Hide:Access:IVisitDr &= NEW(Hide:Access:IVisitDr)
  _Hide:Relate:IVisitDr &= NEW(Hide:Relate:IVisitDr)
  _Hide:Access:ITindak &= NEW(Hide:Access:ITindak)
  _Hide:Relate:ITindak &= NEW(Hide:Relate:ITindak)
  _Hide:Access:IDaftarPPSP &= NEW(Hide:Access:IDaftarPPSP)
  _Hide:Relate:IDaftarPPSP &= NEW(Hide:Relate:IDaftarPPSP)
  _Hide:Access:TBinstli &= NEW(Hide:Access:TBinstli)
  _Hide:Relate:TBinstli &= NEW(Hide:Relate:TBinstli)
  _Hide:Access:ApObInst &= NEW(Hide:Access:ApObInst)
  _Hide:Relate:ApObInst &= NEW(Hide:Relate:ApObInst)
  _Hide:Access:IHNotaSm &= NEW(Hide:Access:IHNotaSm)
  _Hide:Relate:IHNotaSm &= NEW(Hide:Relate:IHNotaSm)
  _Hide:Access:TBTransResepDokterEtiket &= NEW(Hide:Access:TBTransResepDokterEtiket)
  _Hide:Relate:TBTransResepDokterEtiket &= NEW(Hide:Relate:TBTransResepDokterEtiket)
  _Hide:Access:TBTransResepDokterHeader &= NEW(Hide:Access:TBTransResepDokterHeader)
  _Hide:Relate:TBTransResepDokterHeader &= NEW(Hide:Relate:TBTransResepDokterHeader)
  _Hide:Access:TBTransResepDokterHeader_RI &= NEW(Hide:Access:TBTransResepDokterHeader_RI)
  _Hide:Relate:TBTransResepDokterHeader_RI &= NEW(Hide:Relate:TBTransResepDokterHeader_RI)
  _Hide:Access:TBTransResepDokterHeader_RIHarian &= NEW(Hide:Access:TBTransResepDokterHeader_RIHarian)
  _Hide:Relate:TBTransResepDokterHeader_RIHarian &= NEW(Hide:Relate:TBTransResepDokterHeader_RIHarian)
  _Hide:Access:TBTransResepObatCampur &= NEW(Hide:Access:TBTransResepObatCampur)
  _Hide:Relate:TBTransResepObatCampur &= NEW(Hide:Relate:TBTransResepObatCampur)
  _Hide:Access:TBTransResepItter &= NEW(Hide:Access:TBTransResepItter)
  _Hide:Relate:TBTransResepItter &= NEW(Hide:Relate:TBTransResepItter)
  _Hide:Access:UHksRjln &= NEW(Hide:Access:UHksRjln)
  _Hide:Relate:UHksRjln &= NEW(Hide:Relate:UHksRjln)
  _Hide:Access:UtmptRj &= NEW(Hide:Access:UtmptRj)
  _Hide:Relate:UtmptRj &= NEW(Hide:Relate:UtmptRj)
  _Hide:Access:UDksRjln &= NEW(Hide:Access:UDksRjln)
  _Hide:Relate:UDksRjln &= NEW(Hide:Relate:UDksRjln)
  _Hide:Access:UJMan &= NEW(Hide:Access:UJMan)
  _Hide:Relate:UJMan &= NEW(Hide:Relate:UJMan)
  Relate:RoStok &= _Hide:Relate:RoStok
  Relate:RoPasien &= _Hide:Relate:RoPasien
  Relate:RoPasRJ &= _Hide:Relate:RoPasRJ
  Relate:RoPasRIXXX &= _Hide:Relate:RoPasRIXXX
  Relate:IVisitDr &= _Hide:Relate:IVisitDr
  Relate:ITindak &= _Hide:Relate:ITindak
  Relate:IDaftarPPSP &= _Hide:Relate:IDaftarPPSP
  Relate:TBinstli &= _Hide:Relate:TBinstli
  Relate:ApObInst &= _Hide:Relate:ApObInst
  Relate:IHNotaSm &= _Hide:Relate:IHNotaSm
  Relate:TBTransResepDokterEtiket &= _Hide:Relate:TBTransResepDokterEtiket
  Relate:TBTransResepDokterHeader &= _Hide:Relate:TBTransResepDokterHeader
  Relate:TBTransResepDokterHeader_RI &= _Hide:Relate:TBTransResepDokterHeader_RI
  Relate:TBTransResepDokterHeader_RIHarian &= _Hide:Relate:TBTransResepDokterHeader_RIHarian
  Relate:TBTransResepObatCampur &= _Hide:Relate:TBTransResepObatCampur
  Relate:TBTransResepItter &= _Hide:Relate:TBTransResepItter
  Relate:UHksRjln &= _Hide:Relate:UHksRjln
  Relate:UtmptRj &= _Hide:Relate:UtmptRj
  Relate:UDksRjln &= _Hide:Relate:UDksRjln
  Relate:UJMan &= _Hide:Relate:UJMan


APC6NBCE:FilesInit PROCEDURE
  CODE
  _Hide:Relate:RoStok.Init
  _Hide:Relate:RoPasien.Init
  _Hide:Relate:RoPasRJ.Init
  _Hide:Relate:RoPasRIXXX.Init
  _Hide:Relate:IVisitDr.Init
  _Hide:Relate:ITindak.Init
  _Hide:Relate:IDaftarPPSP.Init
  _Hide:Relate:TBinstli.Init
  _Hide:Relate:ApObInst.Init
  _Hide:Relate:IHNotaSm.Init
  _Hide:Relate:TBTransResepDokterEtiket.Init
  _Hide:Relate:TBTransResepDokterHeader.Init
  _Hide:Relate:TBTransResepDokterHeader_RI.Init
  _Hide:Relate:TBTransResepDokterHeader_RIHarian.Init
  _Hide:Relate:TBTransResepObatCampur.Init
  _Hide:Relate:TBTransResepItter.Init
  _Hide:Relate:UHksRjln.Init
  _Hide:Relate:UtmptRj.Init
  _Hide:Relate:UDksRjln.Init
  _Hide:Relate:UJMan.Init


APC6NBCE:DctKill PROCEDURE
  CODE
  _Hide:Relate:RoStok.Kill
  DISPOSE(_Hide:Relate:RoStok)
  _Hide:Relate:RoPasien.Kill
  DISPOSE(_Hide:Relate:RoPasien)
  _Hide:Relate:RoPasRJ.Kill
  DISPOSE(_Hide:Relate:RoPasRJ)
  _Hide:Relate:RoPasRIXXX.Kill
  DISPOSE(_Hide:Relate:RoPasRIXXX)
  _Hide:Relate:IVisitDr.Kill
  DISPOSE(_Hide:Relate:IVisitDr)
  _Hide:Relate:ITindak.Kill
  DISPOSE(_Hide:Relate:ITindak)
  _Hide:Relate:IDaftarPPSP.Kill
  DISPOSE(_Hide:Relate:IDaftarPPSP)
  _Hide:Relate:TBinstli.Kill
  DISPOSE(_Hide:Relate:TBinstli)
  _Hide:Relate:ApObInst.Kill
  DISPOSE(_Hide:Relate:ApObInst)
  _Hide:Relate:IHNotaSm.Kill
  DISPOSE(_Hide:Relate:IHNotaSm)
  _Hide:Relate:TBTransResepDokterEtiket.Kill
  DISPOSE(_Hide:Relate:TBTransResepDokterEtiket)
  _Hide:Relate:TBTransResepDokterHeader.Kill
  DISPOSE(_Hide:Relate:TBTransResepDokterHeader)
  _Hide:Relate:TBTransResepDokterHeader_RI.Kill
  DISPOSE(_Hide:Relate:TBTransResepDokterHeader_RI)
  _Hide:Relate:TBTransResepDokterHeader_RIHarian.Kill
  DISPOSE(_Hide:Relate:TBTransResepDokterHeader_RIHarian)
  _Hide:Relate:TBTransResepObatCampur.Kill
  DISPOSE(_Hide:Relate:TBTransResepObatCampur)
  _Hide:Relate:TBTransResepItter.Kill
  DISPOSE(_Hide:Relate:TBTransResepItter)
  _Hide:Relate:UHksRjln.Kill
  DISPOSE(_Hide:Relate:UHksRjln)
  _Hide:Relate:UtmptRj.Kill
  DISPOSE(_Hide:Relate:UtmptRj)
  _Hide:Relate:UDksRjln.Kill
  DISPOSE(_Hide:Relate:UDksRjln)
  _Hide:Relate:UJMan.Kill
  DISPOSE(_Hide:Relate:UJMan)


Hide:Relate:RoStok.Init PROCEDURE
  CODE
  _Hide:Access:RoStok.Init
  SELF.Init(Access:RoStok,1)


Hide:Access:RoStok.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RSTO:Record
  SELF.FileNameValue = 'RoStok'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RoStok
  PARENT.Init
  Access:RoStok &= SELF


Hide:Access:RoStok.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RoStok &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RoStok.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RoStok,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(RSTO:KeyKodeBrg,'RSTO:KeyKodeBrg',0)
    SELF.AddKey(RSTO:KeyTempat,'RSTO:KeyTempat',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:RoStok.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ROGBarang)

  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:JTempat)


Hide:Relate:RoStok.Kill PROCEDURE

  CODE
  _Hide:Access:RoStok.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:RoStok &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RoStok)                             ! destroy the file manager


Hide:Relate:RoPasien.Init PROCEDURE
  CODE
  _Hide:Access:RoPasien.Init
  SELF.Init(Access:RoPasien,1)


Hide:Access:RoPasien.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ROPA:Record
  SELF.FileNameValue = 'RoPasien'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RoPasien
  PARENT.Init
  Access:RoPasien &= SELF


Hide:Access:RoPasien.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RoPasien &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RoPasien.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RoPasien,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(ROPA:KeyNomorMr,'ROPA:KeyNomorMr',0)
    SELF.AddKey(ROPA:KeyNoNota,'ROPA:KeyNoNota',0)
    SELF.AddKey(ROPA:KeyNoUrut,'ROPA:KeyNoUrut',0)
    SELF.AddKey(ROPA:KeyTanggal,'ROPA:KeyTanggal',0)
    SELF.AddKey(ROPA:KeyKodeBrg,'ROPA:KeyKodeBrg',0)
    SELF.AddKey(ROPA:KeyHasil,'ROPA:KeyHasil',0)
    SELF.AddKey(ROPA:KeyRuangKlinik,'ROPA:KeyRuangKlinik',0)
    SELF.AddKey(ROPA:KeyPeriksa,'ROPA:KeyPeriksa',0)
    SELF.AddKey(ROPA:KeyNoUrutNoMR,'ROPA:KeyNoUrutNoMR',0)
    SELF.AddKey(ROPA:KEYNOUrutNoMRBrg,'ROPA:KEYNOUrutNoMRBrg',0)
    SELF.AddKey(ROPA:keykodefilm,'ROPA:keykodefilm',0)
    SELF.AddKey(ROPA:keykodefilmKodeBrg,'ROPA:keykodefilmKodeBrg',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:RoPasien.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  DO AddRelations_2
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:RoPcsRJ)

  SELF.AddRelation(Relate:ROGBarang)

  SELF.AddRelation(Relate:RoPasRJ)

  SELF.AddRelation(Relate:RoPasRIXXX)

  SELF.AddRelation(Relate:RoMemo,RI:CASCADE,RI:RESTRICT,ROME:KeyNoNota)
  SELF.AddRelationLink(ROPA:NoNota,ROME:NoNota)

  SELF.AddRelation(Relate:IPasien)

  SELF.AddRelation(Relate:RoPasLu)

  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:RoTbPem)

  SELF.AddRelation(Relate:ITbrRwt)

AddRelations_2 ROUTINE
  SELF.AddRelation(Relate:RoPasHas,RI:CASCADE,RI:CASCADE,RPHA:KeyNoNota)
  SELF.AddRelationLink(ROPA:NoNota,RPHA:NoNota)

  SELF.AddRelation(Relate:JPoli)

  SELF.AddRelation(Relate:JPasien)


Hide:Relate:RoPasien.Kill PROCEDURE

  CODE
  _Hide:Access:RoPasien.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:RoPasien &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RoPasien)                           ! destroy the file manager


Hide:Relate:RoPasRJ.Init PROCEDURE
  CODE
  _Hide:Access:RoPasRJ.Init
  SELF.Init(Access:RoPasRJ,1)


Hide:Access:RoPasRJ.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RPRJ:Record
  SELF.FileNameValue = 'RoPasRJ'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RoPasRJ
  PARENT.Init
  Access:RoPasRJ &= SELF


Hide:Access:RoPasRJ.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RoPasRJ &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RoPasRJ.PrimeFields PROCEDURE

  CODE
  RPRJ:TanggalLahir = today()                              ! Assign initial field value
  RPRJ:Jenis_kelamin = 'P'                                 ! Assign initial field value
  RPRJ:Jam = Clock()                                       ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:RoPasRJ.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RoPasRJ,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(RPRJ:KeyNoUrut,'RPRJ:KeyNoUrut',0)
    SELF.AddKey(RPRJ:keydokkonsul,'RPRJ:keydokkonsul',0)
    SELF.AddKey(RPRJ:KeyNama,'Nama',0)
    SELF.AddKey(RPRJ:KeyTanggal,'RPRJ:KeyTanggal',0)
    SELF.AddKey(RPRJ:KeyNoUrutNoMR,'RPRJ:KeyNoUrutNoMR',0)
    SELF.AddKey(RPRJ:keyNomorMr,'RPRJ:keyNomorMr',0)
    SELF.AddKey(RPRJ:keyDokter,'RPRJ:keyDokter',0)
    SELF.AddKey(RPRJ:keytempat,'RPRJ:keytempat',0)
    SELF.AddKey(RPRJ:keyTempatpmpdNoUrut,'RPRJ:keyTempatpmpdNoUrut',0)
    SELF.AddKey(RPRJ:keyTempatpmpdMR,'RPRJ:keyTempatpmpdMR',0)
    SELF.AddKey(RPRJ:keyTempatpmpdNama,'RPRJ:keyTempatpmpdNama',0)
    SELF.AddKey(RPRJ:keypetugas,'RPRJ:keypetugas',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:RoPasRJ.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('Nomor Medical record pasien')
    IF NOT INRANGE(RPRJ:Nomor_MR,0,99999999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'0 .. 99999999')
      END
    END
  OF 5
    GlobalErrors.SetField('Umur pasien dalam tahun')
    IF NOT INRANGE(RPRJ:Umur,0,999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'0 .. 999')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:RoPasRJ.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JDokter)

  SELF.AddRelation(Relate:RoPasiCt,RI:CASCADE,RI:RESTRICT,ROPA1:KeyNoUrut)
  SELF.AddRelationLink(RPRJ:NoUrut,ROPA1:NoUrut)

  SELF.AddRelation(Relate:JTempat)

  SELF.AddRelation(Relate:JPasien)

  SELF.AddRelation(Relate:RoPasien,RI:CASCADE,RI:RESTRICT,ROPA:KeyNoUrut)
  SELF.AddRelationLink(RPRJ:NoUrut,ROPA:NoUrut)


Hide:Relate:RoPasRJ.Kill PROCEDURE

  CODE
  _Hide:Access:RoPasRJ.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:RoPasRJ &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RoPasRJ)                            ! destroy the file manager


Hide:Relate:RoPasRIXXX.Init PROCEDURE
  CODE
  _Hide:Access:RoPasRIXXX.Init
  SELF.Init(Access:RoPasRIXXX,1)


Hide:Access:RoPasRIXXX.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RPRI:Record
  SELF.FileNameValue = 'RoPasRIXXX'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RoPasRIXXX
  PARENT.Init
  Access:RoPasRIXXX &= SELF


Hide:Access:RoPasRIXXX.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RoPasRIXXX &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RoPasRIXXX.PrimeFields PROCEDURE

  CODE
  RPRI:TanggalLahir = Today()                              ! Assign initial field value
  RPRI:Jenis_kelamin = 'P'                                 ! Assign initial field value
  RPRI:Jam = Clock()                                       ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:RoPasRIXXX.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RoPasRIXXX,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(RPRI:KeyNoUrut,'RPRI:KeyNoUrut',0)
    SELF.AddKey(RPRI:KeyNama,'Nama',0)
    SELF.AddKey(RPRI:KeyTanggal,'RPRI:KeyTanggal',0)
    SELF.AddKey(RPRI:KeyNoUrutNoMR,'RPRI:KeyNoUrutNoMR',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:RoPasRIXXX.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('Nomor Medical record pasien')
    IF NOT INRANGE(RPRI:Nomor_MR,0,99999999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'0 .. 99999999')
      END
    END
  OF 5
    GlobalErrors.SetField('Umur pasien dalam tahun')
    IF NOT INRANGE(RPRI:Umur,0,999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'0 .. 999')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:RoPasRIXXX.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:RoPasien,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,ROPA:KeyNoUrutNoMR)
  SELF.AddRelationLink(RPRI:NoUrut,ROPA:NoUrut)
  SELF.AddRelationLink(RPRI:Nomor_MR,ROPA:Nomor_Mr)


Hide:Relate:RoPasRIXXX.Kill PROCEDURE

  CODE
  _Hide:Access:RoPasRIXXX.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:RoPasRIXXX &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RoPasRIXXX)                         ! destroy the file manager


Hide:Relate:IVisitDr.Init PROCEDURE
  CODE
  _Hide:Access:IVisitDr.Init
  SELF.Init(Access:IVisitDr,1)


Hide:Access:IVisitDr.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IVID:Record
  SELF.FileNameValue = 'IVisitDr'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= IVisitDr
  PARENT.Init
  Access:IVisitDr &= SELF


Hide:Access:IVisitDr.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:IVisitDr &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:IVisitDr.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(IVisitDr,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(IVID:KeyNoMrRuang,'IVID:KeyNoMrRuang',0)
    SELF.AddKey(IVID:KeyKodeDr,'IVID:KeyKodeDr',0)
    SELF.AddKey(IVID:KeyTanggal,'IVID:KeyTanggal',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:IVisitDr.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:IPasien)

  SELF.AddRelation(Relate:JDokter)

  SELF.AddRelation(Relate:ITrPasen)


Hide:Relate:IVisitDr.Kill PROCEDURE

  CODE
  _Hide:Access:IVisitDr.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:IVisitDr &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:IVisitDr)                           ! destroy the file manager


Hide:Relate:ITindak.Init PROCEDURE
  CODE
  _Hide:Access:ITindak.Init
  SELF.Init(Access:ITindak,1)


Hide:Access:ITindak.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ITIN:Record
  SELF.FileNameValue = 'ITindak'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ITindak
  PARENT.Init
  Access:ITindak &= SELF


Hide:Access:ITindak.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ITindak &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ITindak.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ITindak,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(ITIN:KeyNoMrRuang,'ITIN:KeyNoMrRuang',0)
    SELF.AddKey(ITIN:KeyKodeTindakan,'ITIN:KeyKodeTindakan',0)
    SELF.AddKey(ITIN:KeyNoMrSaja,'ITIN:KeyNoMrSaja',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ITindak.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ITrPasen)

  SELF.AddRelation(Relate:JTindaka)


Hide:Relate:ITindak.Kill PROCEDURE

  CODE
  _Hide:Access:ITindak.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:ITindak &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ITindak)                            ! destroy the file manager


Hide:Relate:IDaftarPPSP.Init PROCEDURE
  CODE
  _Hide:Access:IDaftarPPSP.Init
  SELF.Init(Access:IDaftarPPSP,1)


Hide:Access:IDaftarPPSP.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IDAP:Record
  SELF.FileNameValue = 'IDaftarPPSP'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= IDaftarPPSP
  PARENT.Init
  Access:IDaftarPPSP &= SELF


Hide:Access:IDaftarPPSP.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:IDaftarPPSP &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:IDaftarPPSP.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(IDaftarPPSP,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(IDAP:KeyKodeItem,'IDAP:KeyKodeItem',0)
    SELF.AddKey(IDAP:KeyNamaItem,'IDAP:KeyNamaItem',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:IDaftarPPSP.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:IPkiPPSP,RI:CASCADE,RI:RESTRICT,IPPP:KeyKodeItem)
  SELF.AddRelationLink(IDAP:KodeItem,IPPP:KodeItem)


Hide:Relate:IDaftarPPSP.Kill PROCEDURE

  CODE
  _Hide:Access:IDaftarPPSP.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:IDaftarPPSP &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:IDaftarPPSP)                        ! destroy the file manager


Hide:Relate:TBinstli.Init PROCEDURE
  CODE
  _Hide:Access:TBinstli.Init
  SELF.Init(Access:TBinstli,1)


Hide:Access:TBinstli.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TBis:Record
  SELF.FileNameValue = 'TBinstli'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TBinstli
  PARENT.Init
  Access:TBinstli &= SELF


Hide:Access:TBinstli.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TBinstli &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TBinstli.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TBinstli,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(TBis:keykodeins,'TBis:keykodeins',0)
    SELF.AddKey(TBis:keynamains,'TBis:keynamains',0)
    SELF.AddKey(TBis:key_ins_ins,'TBis:key_ins_ins',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:TBinstli.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ITbrRwt,RI:None,RI:None,ITbr:Induk_Itbrwt_FK)
  SELF.AddRelationLink(TBis:Kode_Instalasi,ITbr:Induk)

  SELF.AddRelation(Relate:INHDKB,RI:None,RI:None,INH:ins_inhdkb_fk)
  SELF.AddRelationLink(TBis:Kode_Instalasi,INH:Instalasi)

  SELF.AddRelation(Relate:AptoInSmdH,RI:None,RI:None,APTI1:key_tujuan)
  SELF.AddRelationLink(TBis:Kode_Instalasi,APTI1:Kd_ruang)

  SELF.AddRelation(Relate:RI_HSBBM,RI:CASCADE,RI:RESTRICT,RI_HSM:Instalasi_ri_hsbbm_fk)
  SELF.AddRelationLink(TBis:Kode_Instalasi,RI_HSM:Kode_Inst)

  SELF.AddRelation(Relate:RI_HToAptk,RI:CASCADE,RI:RESTRICT,RI_TOA:key_ruang)
  SELF.AddRelationLink(TBis:Jenis_ins,RI_TOA:Kd_ruang)

  SELF.AddRelation(Relate:RI_HBSBBK,RI:CASCADE,RI:RESTRICT,RI_HSB1:Instalasi_ri_hsbbk_fk)
  SELF.AddRelationLink(TBis:Kode_Instalasi,RI_HSB1:Kode_Inst)

  SELF.AddRelation(Relate:RI_HSBBK,RI:CASCADE,RI:RESTRICT,RI_HSB:Instalasi_ri_hsbbk_fk)
  SELF.AddRelationLink(TBis:Kode_Instalasi,RI_HSB:Kode_Inst)

  SELF.AddRelation(Relate:ApObInst,RI:CASCADE,RI:RESTRICT,APOB:KeyKode_ins)
  SELF.AddRelationLink(TBis:Kode_Instalasi,APOB:Kode_Instalasi)

  SELF.AddRelation(Relate:AptoInHe,RI:CASCADE,RI:RESTRICT,APTI:key_tujuan)
  SELF.AddRelationLink(TBis:Kode_Instalasi,APTI:Kd_ruang)


Hide:Relate:TBinstli.Kill PROCEDURE

  CODE
  _Hide:Access:TBinstli.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:TBinstli &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TBinstli)                           ! destroy the file manager


Hide:Relate:ApObInst.Init PROCEDURE
  CODE
  _Hide:Access:ApObInst.Init
  SELF.Init(Access:ApObInst,1)


Hide:Access:ApObInst.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APOB:Record
  SELF.FileNameValue = 'ApObInst'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ApObInst
  PARENT.Init
  Access:ApObInst &= SELF


Hide:Access:ApObInst.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ApObInst &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ApObInst.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ApObInst,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APOB:KeyKode_ins,'APOB:KeyKode_ins',0)
    SELF.AddKey(APOB:keykd_barang,'kode_brg-instalasi',0)
    SELF.AddKey(APOB:key_kd_brg,'kode barang saja',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ApObInst.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:TBinstli)

  SELF.AddRelation(Relate:GBarang)


Hide:Relate:ApObInst.Kill PROCEDURE

  CODE
  _Hide:Access:ApObInst.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:ApObInst &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ApObInst)                           ! destroy the file manager


Hide:Relate:IHNotaSm.Init PROCEDURE
  CODE
  _Hide:Access:IHNotaSm.Init
  SELF.Init(Access:IHNotaSm,1)


Hide:Access:IHNotaSm.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IHNS:Record
  SELF.FileNameValue = 'IHNotaSm'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= IHNotaSm
  PARENT.Init
  Access:IHNotaSm &= SELF


Hide:Access:IHNotaSm.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:IHNotaSm &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:IHNotaSm.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(IHNotaSm,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(IHNS:KeyNoNota,'IHNS:KeyNoNota',0)
    SELF.AddKey(IHNS:KeyNomorMr,'IHNS:KeyNomorMr',0)
    SELF.AddKey(IHNS:KeyNoMrNota,'IHNS:KeyNoMrNota',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:IHNotaSm.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JPasien)

  SELF.AddRelation(Relate:IDNotaSm,RI:CASCADE,RI:RESTRICT,IDNS:KeyNoMrNoNota)
  SELF.AddRelationLink(IHNS:No_Nota,IDNS:No_Nota)
  SELF.AddRelationLink(IHNS:Nomor_mr,IDNS:Nomor_mr)


Hide:Relate:IHNotaSm.Kill PROCEDURE

  CODE
  _Hide:Access:IHNotaSm.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:IHNotaSm &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:IHNotaSm)                           ! destroy the file manager


Hide:Relate:TBTransResepDokterEtiket.Init PROCEDURE
  CODE
  _Hide:Access:TBTransResepDokterEtiket.Init
  SELF.Init(Access:TBTransResepDokterEtiket,1)


Hide:Access:TBTransResepDokterEtiket.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TBT1:Record
  SELF.FileNameValue = 'TBTransResepDokterEtiket'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TBTransResepDokterEtiket
  PARENT.Init
  Access:TBTransResepDokterEtiket &= SELF


Hide:Access:TBTransResepDokterEtiket.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TBTransResepDokterEtiket &= NULL                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TBTransResepDokterEtiket.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TBTransResepDokterEtiket,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(TBT1:PK,'TBT1:PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:TBTransResepDokterEtiket.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:TBTransResepDokterDetail)


Hide:Relate:TBTransResepDokterEtiket.Kill PROCEDURE

  CODE
  _Hide:Access:TBTransResepDokterEtiket.Kill               ! Kill the file manager
  PARENT.Kill
  Relate:TBTransResepDokterEtiket &= NULL                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TBTransResepDokterEtiket)           ! destroy the file manager


Hide:Relate:TBTransResepDokterHeader.Init PROCEDURE
  CODE
  _Hide:Access:TBTransResepDokterHeader.Init
  SELF.Init(Access:TBTransResepDokterHeader,1)


Hide:Access:TBTransResepDokterHeader.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TBT2:Record
  SELF.FileNameValue = 'TBTransResepDokterHeader'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TBTransResepDokterHeader
  PARENT.Init
  Access:TBTransResepDokterHeader &= SELF


Hide:Access:TBTransResepDokterHeader.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TBTransResepDokterHeader &= NULL                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TBTransResepDokterHeader.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TBTransResepDokterHeader,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(TBT2:PK,'TBT2:PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:TBTransResepDokterHeader.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:TBTransResepItter,RI:None,RI:None,TBT4:PK)
  SELF.AddRelationLink(TBT2:NoTrans,TBT4:NoTrans)

  SELF.AddRelation(Relate:TBTransResepObatCampur,RI:None,RI:None,TBT3:PK)
  SELF.AddRelationLink(TBT2:NoTrans,TBT3:NoTrans)

  SELF.AddRelation(Relate:TBTransResepDokterDetail,RI:None,RI:None,TBT:PK)
  SELF.AddRelationLink(TBT2:NoTrans,TBT:NoTrans)


Hide:Relate:TBTransResepDokterHeader.Kill PROCEDURE

  CODE
  _Hide:Access:TBTransResepDokterHeader.Kill               ! Kill the file manager
  PARENT.Kill
  Relate:TBTransResepDokterHeader &= NULL                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TBTransResepDokterHeader)           ! destroy the file manager


Hide:Relate:TBTransResepDokterHeader_RI.Init PROCEDURE
  CODE
  _Hide:Access:TBTransResepDokterHeader_RI.Init
  SELF.Init(Access:TBTransResepDokterHeader_RI,1)


Hide:Access:TBTransResepDokterHeader_RI.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TBT21:Record
  SELF.FileNameValue = 'TBTransResepDokterHeader_RI'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TBTransResepDokterHeader_RI
  PARENT.Init
  Access:TBTransResepDokterHeader_RI &= SELF


Hide:Access:TBTransResepDokterHeader_RI.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TBTransResepDokterHeader_RI &= NULL               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TBTransResepDokterHeader_RI.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TBTransResepDokterHeader_RI,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(TBT21:PK,'TBT21:PK',0)
    SELF.AddKey(TBT21:JPasien_TBTTransEpreRanap_FK,'TBT21:JPasien_TBTTransEpreRanap_FK',0)
    SELF.AddKey(TBT21:koderuang_epreranap_fk,'TBT21:koderuang_epreranap_fk',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:TBTransResepDokterHeader_RI.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JPasien)

  SELF.AddRelation(Relate:TBTransResepDokterHeader_RIHarian,RI:None,RI:None,TBT211:PK)
  SELF.AddRelationLink(TBT21:NoTrans,TBT211:NoTrans)


Hide:Relate:TBTransResepDokterHeader_RI.Kill PROCEDURE

  CODE
  _Hide:Access:TBTransResepDokterHeader_RI.Kill            ! Kill the file manager
  PARENT.Kill
  Relate:TBTransResepDokterHeader_RI &= NULL               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TBTransResepDokterHeader_RI)        ! destroy the file manager


Hide:Relate:TBTransResepDokterHeader_RIHarian.Init PROCEDURE
  CODE
  _Hide:Access:TBTransResepDokterHeader_RIHarian.Init
  SELF.Init(Access:TBTransResepDokterHeader_RIHarian,1)


Hide:Access:TBTransResepDokterHeader_RIHarian.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TBT211:Record
  SELF.FileNameValue = 'TBTransResepDokterHeader_RIHarian'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TBTransResepDokterHeader_RIHarian
  PARENT.Init
  Access:TBTransResepDokterHeader_RIHarian &= SELF


Hide:Access:TBTransResepDokterHeader_RIHarian.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TBTransResepDokterHeader_RIHarian &= NULL         ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TBTransResepDokterHeader_RIHarian.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TBTransResepDokterHeader_RIHarian,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(TBT211:PK,'TBT211:PK',0)
    SELF.AddKey(TBT211:PrioritasNoTrans_TBTTransRanap_IK,'TBT211:PrioritasNoTrans_TBTTransRanap_IK',0)
    SELF.AddKey(TBT211:NoTrans_Key,'TBT211:NoTrans_Key',0)
    SELF.AddKey(TBT211:koderuang_epreranapharian_fk,'TBT211:koderuang_epreranapharian_fk',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:TBTransResepDokterHeader_RIHarian.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ITbrRwt)

  SELF.AddRelation(Relate:TBTransResepDokterHeader_RI)


Hide:Relate:TBTransResepDokterHeader_RIHarian.Kill PROCEDURE

  CODE
  _Hide:Access:TBTransResepDokterHeader_RIHarian.Kill      ! Kill the file manager
  PARENT.Kill
  Relate:TBTransResepDokterHeader_RIHarian &= NULL         ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TBTransResepDokterHeader_RIHarian)  ! destroy the file manager


Hide:Relate:TBTransResepObatCampur.Init PROCEDURE
  CODE
  _Hide:Access:TBTransResepObatCampur.Init
  SELF.Init(Access:TBTransResepObatCampur,1)


Hide:Access:TBTransResepObatCampur.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TBT3:Record
  SELF.FileNameValue = 'TBTransResepObatCampur'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TBTransResepObatCampur
  PARENT.Init
  Access:TBTransResepObatCampur &= SELF


Hide:Access:TBTransResepObatCampur.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TBTransResepObatCampur &= NULL                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TBTransResepObatCampur.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TBTransResepObatCampur,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(TBT3:PK,'TBT3:PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:TBTransResepObatCampur.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:TBTransResepDokterHeader)


Hide:Relate:TBTransResepObatCampur.Kill PROCEDURE

  CODE
  _Hide:Access:TBTransResepObatCampur.Kill                 ! Kill the file manager
  PARENT.Kill
  Relate:TBTransResepObatCampur &= NULL                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TBTransResepObatCampur)             ! destroy the file manager


Hide:Relate:TBTransResepItter.Init PROCEDURE
  CODE
  _Hide:Access:TBTransResepItter.Init
  SELF.Init(Access:TBTransResepItter,1)


Hide:Access:TBTransResepItter.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TBT4:Record
  SELF.FileNameValue = 'TBTransResepItter'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TBTransResepItter
  PARENT.Init
  Access:TBTransResepItter &= SELF


Hide:Access:TBTransResepItter.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TBTransResepItter &= NULL                         ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TBTransResepItter.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TBTransResepItter,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(TBT4:PK,'TBT4:PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:TBTransResepItter.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:TBTransResepDokterHeader)


Hide:Relate:TBTransResepItter.Kill PROCEDURE

  CODE
  _Hide:Access:TBTransResepItter.Kill                      ! Kill the file manager
  PARENT.Kill
  Relate:TBTransResepItter &= NULL                         ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TBTransResepItter)                  ! destroy the file manager


Hide:Relate:UHksRjln.Init PROCEDURE
  CODE
  _Hide:Access:UHksRjln.Init
  SELF.Init(Access:UHksRjln,1)


Hide:Access:UHksRjln.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= UHK:Record
  SELF.FileNameValue = 'UHksRjln'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= UHksRjln
  PARENT.Init
  Access:UHksRjln &= SELF


Hide:Access:UHksRjln.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:UHksRjln &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:UHksRjln.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(UHksRjln,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(UHK:KMrNota,'UHK:KMrNota',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:UHksRjln.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 5
    GlobalErrors.SetField('UHK:StatusPmb')
    IF INSTRING(']' & UHK:StatusPmb & '[', ']1[]2[]3[]4[]5[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''1'',''2'',''3'',''4'',''5''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:UHksRjln.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:UtmptRj,RI:CASCADE,RI:RESTRICT,UJT:MrNotaTmpat)
  SELF.AddRelationLink(UHK:Mr,UJT:Mr)
  SELF.AddRelationLink(UHK:Nota,UJT:Nota)

  SELF.AddRelation(Relate:JPasien)


Hide:Relate:UHksRjln.Kill PROCEDURE

  CODE
  _Hide:Access:UHksRjln.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:UHksRjln &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:UHksRjln)                           ! destroy the file manager


Hide:Relate:UtmptRj.Init PROCEDURE
  CODE
  _Hide:Access:UtmptRj.Init
  SELF.Init(Access:UtmptRj,1)


Hide:Access:UtmptRj.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= UJT:Record
  SELF.FileNameValue = 'UtmptRj'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= UtmptRj
  PARENT.Init
  Access:UtmptRj &= SELF


Hide:Access:UtmptRj.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:UtmptRj &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:UtmptRj.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(UtmptRj,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(UJT:MrNotaTmpat,'UJT:MrNotaTmpat',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:UtmptRj.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:UHksRjln)

  SELF.AddRelation(Relate:UDksRjln,RI:CASCADE,RI:RESTRICT,UKS:K1)
  SELF.AddRelationLink(UJT:Mr,UKS:Mr)
  SELF.AddRelationLink(UJT:Nota,UKS:NoNota)
  SELF.AddRelationLink(UJT:KodeTmpat,UKS:KodeTempat)


Hide:Relate:UtmptRj.Kill PROCEDURE

  CODE
  _Hide:Access:UtmptRj.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:UtmptRj &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:UtmptRj)                            ! destroy the file manager


Hide:Relate:UDksRjln.Init PROCEDURE
  CODE
  _Hide:Access:UDksRjln.Init
  SELF.Init(Access:UDksRjln,1)


Hide:Access:UDksRjln.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= UKS:Record
  SELF.FileNameValue = 'UDksRjln'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= UDksRjln
  PARENT.Init
  Access:UDksRjln &= SELF


Hide:Access:UDksRjln.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:UDksRjln &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:UDksRjln.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(UDksRjln,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(UKS:K1,'Primary key terdiri dari No Mr,Nota,Tgl,Tmpat,Kode jasa,ket1',0)
    SELF.AddKey(UKS:KJasa,'UKS:KJasa',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:UDksRjln.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:UtmptRj)

  SELF.AddRelation(Relate:JTindaka)


Hide:Relate:UDksRjln.Kill PROCEDURE

  CODE
  _Hide:Access:UDksRjln.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:UDksRjln &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:UDksRjln)                           ! destroy the file manager


Hide:Relate:UJMan.Init PROCEDURE
  CODE
  _Hide:Access:UJMan.Init
  SELF.Init(Access:UJMan,1)


Hide:Access:UJMan.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= UJM:Record
  SELF.FileNameValue = 'UJMan'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= UJMan
  PARENT.Init
  Access:UJMan &= SELF


Hide:Access:UJMan.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:UJMan &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:UJMan.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(UJMan,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(UJM:Key_KsaPoliKwit,'UJM:Key_KsaPoliKwit',0)
    SELF.AddKey(UJM:K_POLI,'UJM:K_POLI',0)
    SELF.AddKey(UJM:KKasa,'UJM:KKasa',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:UJMan.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JPoli)


Hide:Relate:UJMan.Kill PROCEDURE

  CODE
  _Hide:Access:UJMan.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:UJMan &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:UJMan)                              ! destroy the file manager

