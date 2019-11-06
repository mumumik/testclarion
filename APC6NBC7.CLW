  MEMBER('apc6new.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
APC6NBC7:DctInit    PROCEDURE
APC6NBC7:DctKill    PROCEDURE
APC6NBC7:FilesInit  PROCEDURE
  END

Hide:Access:JPSWUP   CLASS(FileManager),TYPE               ! FileManager for JPSWUP
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JPSWUP   CLASS(RelationManager),TYPE           ! RelationManager for JPSWUP
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:IByTrPas CLASS(FileManager),TYPE               ! FileManager for IByTrPas
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:IByTrPas CLASS(RelationManager),TYPE           ! RelationManager for IByTrPas
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JTBayar  CLASS(FileManager),TYPE               ! FileManager for JTBayar
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JTBayar  CLASS(RelationManager),TYPE           ! RelationManager for JTBayar
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JDiagnosa CLASS(FileManager),TYPE              ! FileManager for JDiagnosa
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JDiagnosa CLASS(RelationManager),TYPE          ! RelationManager for JDiagnosa
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RI_Stok  CLASS(FileManager),TYPE               ! FileManager for RI_Stok
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RI_Stok  CLASS(RelationManager),TYPE           ! RelationManager for RI_Stok
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:Nomor_Batal CLASS(FileManager),TYPE            ! FileManager for Nomor_Batal
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:Nomor_Batal CLASS(RelationManager),TYPE        ! RelationManager for Nomor_Batal
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JTPasien CLASS(FileManager),TYPE               ! FileManager for JTPasien
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JTPasien CLASS(RelationManager),TYPE           ! RelationManager for JTPasien
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DTOBAT   CLASS(FileManager),TYPE               ! FileManager for DTOBAT
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DTOBAT   CLASS(RelationManager),TYPE           ! RelationManager for DTOBAT
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DTDiKer  CLASS(FileManager),TYPE               ! FileManager for DTDiKer
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DTDiKer  CLASS(RelationManager),TYPE           ! RelationManager for DTDiKer
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DTBalut  CLASS(FileManager),TYPE               ! FileManager for DTBalut
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DTBalut  CLASS(RelationManager),TYPE           ! RelationManager for DTBalut
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DTAlLain CLASS(FileManager),TYPE               ! FileManager for DTAlLain
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DTAlLain CLASS(RelationManager),TYPE           ! RelationManager for DTAlLain
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RoKStok  CLASS(FileManager),TYPE               ! FileManager for RoKStok
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RoKStok  CLASS(RelationManager),TYPE           ! RelationManager for RoKStok
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DTGas    CLASS(FileManager),TYPE               ! FileManager for DTGas
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DTGas    CLASS(RelationManager),TYPE           ! RelationManager for DTGas
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DTDDKer  CLASS(FileManager),TYPE               ! FileManager for DTDDKer
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DTDDKer  CLASS(RelationManager),TYPE           ! RelationManager for DTDDKer
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GStokPerBulan CLASS(FileManager),TYPE          ! FileManager for GStokPerBulan
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GStokPerBulan CLASS(RelationManager),TYPE      ! RelationManager for GStokPerBulan
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:IDaftarAlat CLASS(FileManager),TYPE            ! FileManager for IDaftarAlat
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:IDaftarAlat CLASS(RelationManager),TYPE        ! RelationManager for IDaftarAlat
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ILIST    CLASS(FileManager),TYPE               ! FileManager for ILIST
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ILIST    CLASS(RelationManager),TYPE           ! RelationManager for ILIST
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DTAsi    CLASS(FileManager),TYPE               ! FileManager for DTAsi
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DTAsi    CLASS(RelationManager),TYPE           ! RelationManager for DTAsi
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DTBena   CLASS(FileManager),TYPE               ! FileManager for DTBena
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DTBena   CLASS(RelationManager),TYPE           ! RelationManager for DTBena
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JRujuk   CLASS(FileManager),TYPE               ! FileManager for JRujuk
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JRujuk   CLASS(RelationManager),TYPE           ! RelationManager for JRujuk
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END


_Hide:Access:JPSWUP  &Hide:Access:JPSWUP,AUTO,THREAD
_Hide:Relate:JPSWUP  &Hide:Relate:JPSWUP,AUTO,THREAD
_Hide:Access:IByTrPas &Hide:Access:IByTrPas,AUTO,THREAD
_Hide:Relate:IByTrPas &Hide:Relate:IByTrPas,AUTO,THREAD
_Hide:Access:JTBayar &Hide:Access:JTBayar,AUTO,THREAD
_Hide:Relate:JTBayar &Hide:Relate:JTBayar,AUTO,THREAD
_Hide:Access:JDiagnosa &Hide:Access:JDiagnosa,AUTO,THREAD
_Hide:Relate:JDiagnosa &Hide:Relate:JDiagnosa,AUTO,THREAD
_Hide:Access:RI_Stok &Hide:Access:RI_Stok,AUTO,THREAD
_Hide:Relate:RI_Stok &Hide:Relate:RI_Stok,AUTO,THREAD
_Hide:Access:Nomor_Batal &Hide:Access:Nomor_Batal,AUTO,THREAD
_Hide:Relate:Nomor_Batal &Hide:Relate:Nomor_Batal,AUTO,THREAD
_Hide:Access:JTPasien &Hide:Access:JTPasien,AUTO,THREAD
_Hide:Relate:JTPasien &Hide:Relate:JTPasien,AUTO,THREAD
_Hide:Access:DTOBAT  &Hide:Access:DTOBAT,AUTO,THREAD
_Hide:Relate:DTOBAT  &Hide:Relate:DTOBAT,AUTO,THREAD
_Hide:Access:DTDiKer &Hide:Access:DTDiKer,AUTO,THREAD
_Hide:Relate:DTDiKer &Hide:Relate:DTDiKer,AUTO,THREAD
_Hide:Access:DTBalut &Hide:Access:DTBalut,AUTO,THREAD
_Hide:Relate:DTBalut &Hide:Relate:DTBalut,AUTO,THREAD
_Hide:Access:DTAlLain &Hide:Access:DTAlLain,AUTO,THREAD
_Hide:Relate:DTAlLain &Hide:Relate:DTAlLain,AUTO,THREAD
_Hide:Access:RoKStok &Hide:Access:RoKStok,AUTO,THREAD
_Hide:Relate:RoKStok &Hide:Relate:RoKStok,AUTO,THREAD
_Hide:Access:DTGas   &Hide:Access:DTGas,AUTO,THREAD
_Hide:Relate:DTGas   &Hide:Relate:DTGas,AUTO,THREAD
_Hide:Access:DTDDKer &Hide:Access:DTDDKer,AUTO,THREAD
_Hide:Relate:DTDDKer &Hide:Relate:DTDDKer,AUTO,THREAD
_Hide:Access:GStokPerBulan &Hide:Access:GStokPerBulan,AUTO,THREAD
_Hide:Relate:GStokPerBulan &Hide:Relate:GStokPerBulan,AUTO,THREAD
_Hide:Access:IDaftarAlat &Hide:Access:IDaftarAlat,AUTO,THREAD
_Hide:Relate:IDaftarAlat &Hide:Relate:IDaftarAlat,AUTO,THREAD
_Hide:Access:ILIST   &Hide:Access:ILIST,AUTO,THREAD
_Hide:Relate:ILIST   &Hide:Relate:ILIST,AUTO,THREAD
_Hide:Access:DTAsi   &Hide:Access:DTAsi,AUTO,THREAD
_Hide:Relate:DTAsi   &Hide:Relate:DTAsi,AUTO,THREAD
_Hide:Access:DTBena  &Hide:Access:DTBena,AUTO,THREAD
_Hide:Relate:DTBena  &Hide:Relate:DTBena,AUTO,THREAD
_Hide:Access:JRujuk  &Hide:Access:JRujuk,AUTO,THREAD
_Hide:Relate:JRujuk  &Hide:Relate:JRujuk,AUTO,THREAD


APC6NBC7:DctInit PROCEDURE
  CODE
  _Hide:Access:JPSWUP &= NEW(Hide:Access:JPSWUP)
  _Hide:Relate:JPSWUP &= NEW(Hide:Relate:JPSWUP)
  _Hide:Access:IByTrPas &= NEW(Hide:Access:IByTrPas)
  _Hide:Relate:IByTrPas &= NEW(Hide:Relate:IByTrPas)
  _Hide:Access:JTBayar &= NEW(Hide:Access:JTBayar)
  _Hide:Relate:JTBayar &= NEW(Hide:Relate:JTBayar)
  _Hide:Access:JDiagnosa &= NEW(Hide:Access:JDiagnosa)
  _Hide:Relate:JDiagnosa &= NEW(Hide:Relate:JDiagnosa)
  _Hide:Access:RI_Stok &= NEW(Hide:Access:RI_Stok)
  _Hide:Relate:RI_Stok &= NEW(Hide:Relate:RI_Stok)
  _Hide:Access:Nomor_Batal &= NEW(Hide:Access:Nomor_Batal)
  _Hide:Relate:Nomor_Batal &= NEW(Hide:Relate:Nomor_Batal)
  _Hide:Access:JTPasien &= NEW(Hide:Access:JTPasien)
  _Hide:Relate:JTPasien &= NEW(Hide:Relate:JTPasien)
  _Hide:Access:DTOBAT &= NEW(Hide:Access:DTOBAT)
  _Hide:Relate:DTOBAT &= NEW(Hide:Relate:DTOBAT)
  _Hide:Access:DTDiKer &= NEW(Hide:Access:DTDiKer)
  _Hide:Relate:DTDiKer &= NEW(Hide:Relate:DTDiKer)
  _Hide:Access:DTBalut &= NEW(Hide:Access:DTBalut)
  _Hide:Relate:DTBalut &= NEW(Hide:Relate:DTBalut)
  _Hide:Access:DTAlLain &= NEW(Hide:Access:DTAlLain)
  _Hide:Relate:DTAlLain &= NEW(Hide:Relate:DTAlLain)
  _Hide:Access:RoKStok &= NEW(Hide:Access:RoKStok)
  _Hide:Relate:RoKStok &= NEW(Hide:Relate:RoKStok)
  _Hide:Access:DTGas &= NEW(Hide:Access:DTGas)
  _Hide:Relate:DTGas &= NEW(Hide:Relate:DTGas)
  _Hide:Access:DTDDKer &= NEW(Hide:Access:DTDDKer)
  _Hide:Relate:DTDDKer &= NEW(Hide:Relate:DTDDKer)
  _Hide:Access:GStokPerBulan &= NEW(Hide:Access:GStokPerBulan)
  _Hide:Relate:GStokPerBulan &= NEW(Hide:Relate:GStokPerBulan)
  _Hide:Access:IDaftarAlat &= NEW(Hide:Access:IDaftarAlat)
  _Hide:Relate:IDaftarAlat &= NEW(Hide:Relate:IDaftarAlat)
  _Hide:Access:ILIST &= NEW(Hide:Access:ILIST)
  _Hide:Relate:ILIST &= NEW(Hide:Relate:ILIST)
  _Hide:Access:DTAsi &= NEW(Hide:Access:DTAsi)
  _Hide:Relate:DTAsi &= NEW(Hide:Relate:DTAsi)
  _Hide:Access:DTBena &= NEW(Hide:Access:DTBena)
  _Hide:Relate:DTBena &= NEW(Hide:Relate:DTBena)
  _Hide:Access:JRujuk &= NEW(Hide:Access:JRujuk)
  _Hide:Relate:JRujuk &= NEW(Hide:Relate:JRujuk)
  Relate:JPSWUP &= _Hide:Relate:JPSWUP
  Relate:IByTrPas &= _Hide:Relate:IByTrPas
  Relate:JTBayar &= _Hide:Relate:JTBayar
  Relate:JDiagnosa &= _Hide:Relate:JDiagnosa
  Relate:RI_Stok &= _Hide:Relate:RI_Stok
  Relate:Nomor_Batal &= _Hide:Relate:Nomor_Batal
  Relate:JTPasien &= _Hide:Relate:JTPasien
  Relate:DTOBAT &= _Hide:Relate:DTOBAT
  Relate:DTDiKer &= _Hide:Relate:DTDiKer
  Relate:DTBalut &= _Hide:Relate:DTBalut
  Relate:DTAlLain &= _Hide:Relate:DTAlLain
  Relate:RoKStok &= _Hide:Relate:RoKStok
  Relate:DTGas &= _Hide:Relate:DTGas
  Relate:DTDDKer &= _Hide:Relate:DTDDKer
  Relate:GStokPerBulan &= _Hide:Relate:GStokPerBulan
  Relate:IDaftarAlat &= _Hide:Relate:IDaftarAlat
  Relate:ILIST &= _Hide:Relate:ILIST
  Relate:DTAsi &= _Hide:Relate:DTAsi
  Relate:DTBena &= _Hide:Relate:DTBena
  Relate:JRujuk &= _Hide:Relate:JRujuk


APC6NBC7:FilesInit PROCEDURE
  CODE
  _Hide:Relate:JPSWUP.Init
  _Hide:Relate:IByTrPas.Init
  _Hide:Relate:JTBayar.Init
  _Hide:Relate:JDiagnosa.Init
  _Hide:Relate:RI_Stok.Init
  _Hide:Relate:Nomor_Batal.Init
  _Hide:Relate:JTPasien.Init
  _Hide:Relate:DTOBAT.Init
  _Hide:Relate:DTDiKer.Init
  _Hide:Relate:DTBalut.Init
  _Hide:Relate:DTAlLain.Init
  _Hide:Relate:RoKStok.Init
  _Hide:Relate:DTGas.Init
  _Hide:Relate:DTDDKer.Init
  _Hide:Relate:GStokPerBulan.Init
  _Hide:Relate:IDaftarAlat.Init
  _Hide:Relate:ILIST.Init
  _Hide:Relate:DTAsi.Init
  _Hide:Relate:DTBena.Init
  _Hide:Relate:JRujuk.Init


APC6NBC7:DctKill PROCEDURE
  CODE
  _Hide:Relate:JPSWUP.Kill
  DISPOSE(_Hide:Relate:JPSWUP)
  _Hide:Relate:IByTrPas.Kill
  DISPOSE(_Hide:Relate:IByTrPas)
  _Hide:Relate:JTBayar.Kill
  DISPOSE(_Hide:Relate:JTBayar)
  _Hide:Relate:JDiagnosa.Kill
  DISPOSE(_Hide:Relate:JDiagnosa)
  _Hide:Relate:RI_Stok.Kill
  DISPOSE(_Hide:Relate:RI_Stok)
  _Hide:Relate:Nomor_Batal.Kill
  DISPOSE(_Hide:Relate:Nomor_Batal)
  _Hide:Relate:JTPasien.Kill
  DISPOSE(_Hide:Relate:JTPasien)
  _Hide:Relate:DTOBAT.Kill
  DISPOSE(_Hide:Relate:DTOBAT)
  _Hide:Relate:DTDiKer.Kill
  DISPOSE(_Hide:Relate:DTDiKer)
  _Hide:Relate:DTBalut.Kill
  DISPOSE(_Hide:Relate:DTBalut)
  _Hide:Relate:DTAlLain.Kill
  DISPOSE(_Hide:Relate:DTAlLain)
  _Hide:Relate:RoKStok.Kill
  DISPOSE(_Hide:Relate:RoKStok)
  _Hide:Relate:DTGas.Kill
  DISPOSE(_Hide:Relate:DTGas)
  _Hide:Relate:DTDDKer.Kill
  DISPOSE(_Hide:Relate:DTDDKer)
  _Hide:Relate:GStokPerBulan.Kill
  DISPOSE(_Hide:Relate:GStokPerBulan)
  _Hide:Relate:IDaftarAlat.Kill
  DISPOSE(_Hide:Relate:IDaftarAlat)
  _Hide:Relate:ILIST.Kill
  DISPOSE(_Hide:Relate:ILIST)
  _Hide:Relate:DTAsi.Kill
  DISPOSE(_Hide:Relate:DTAsi)
  _Hide:Relate:DTBena.Kill
  DISPOSE(_Hide:Relate:DTBena)
  _Hide:Relate:JRujuk.Kill
  DISPOSE(_Hide:Relate:JRujuk)


Hide:Relate:JPSWUP.Init PROCEDURE
  CODE
  _Hide:Access:JPSWUP.Init
  SELF.Init(Access:JPSWUP,1)


Hide:Access:JPSWUP.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JPS1:Record
  SELF.FileNameValue = 'JPSWUP'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JPSWUP
  PARENT.Init
  Access:JPSWUP &= SELF


Hide:Access:JPSWUP.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JPSWUP &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JPSWUP.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JPSWUP,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JPS1:KeyUSerId,'JPS1:KeyUSerId',0)
    SELF.AddKey(JPS1:KeyId,'JPS1:KeyId',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JPSWUP.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JPASSWRD)


Hide:Relate:JPSWUP.Kill PROCEDURE

  CODE
  _Hide:Access:JPSWUP.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:JPSWUP &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JPSWUP)                             ! destroy the file manager


Hide:Relate:IByTrPas.Init PROCEDURE
  CODE
  _Hide:Access:IByTrPas.Init
  SELF.Init(Access:IByTrPas,1)


Hide:Access:IByTrPas.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IBYT:Record
  SELF.FileNameValue = 'IByTrPas'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= IByTrPas
  PARENT.Init
  Access:IByTrPas &= SELF


Hide:Access:IByTrPas.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:IByTrPas &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:IByTrPas.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(IByTrPas,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(IBYT:KeyNomorMR,'IBYT:KeyNomorMR',0)
    SELF.AddKey(IBYT:KeyTglMasuk,'IBYT:KeyTglMasuk',0)
    SELF.AddKey(IBYT:KeyKodeDokter,'IBYT:KeyKodeDokter',0)
    SELF.AddKey(IBYT:KeyRuang,'IBYT:KeyRuang',0)
    SELF.AddKey(IBYT:KeyNoNota,'IBYT:KeyNoNota',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:IByTrPas.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 7
    GlobalErrors.SetField('IBYT:Status')
    IF NOT INRANGE(IBYT:Status,1,3)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'1 .. 3')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:IByTrPas.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JDokter)

  SELF.AddRelation(Relate:ITrPasen)

  SELF.AddRelation(Relate:IPasien)

  SELF.AddRelation(Relate:ITbrRwt)


Hide:Relate:IByTrPas.Kill PROCEDURE

  CODE
  _Hide:Access:IByTrPas.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:IByTrPas &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:IByTrPas)                           ! destroy the file manager


Hide:Relate:JTBayar.Init PROCEDURE
  CODE
  _Hide:Access:JTBayar.Init
  SELF.Init(Access:JTBayar,1)


Hide:Access:JTBayar.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JTBA:Record
  SELF.FileNameValue = 'JTBayar'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JTBayar
  PARENT.Init
  Access:JTBayar &= SELF


Hide:Access:JTBayar.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JTBayar &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JTBayar.PrimeFields PROCEDURE

  CODE
  JTBA:Selesai = 'N'                                       ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:JTBayar.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JTBayar,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JTBA:KeyNomorMr,'JTBA:KeyNomorMr',0)
    SELF.AddKey(JTBA:KeyNoBukti,'JTBA:KeyNoBukti',0)
    SELF.AddKey(JTBA:KeyKlinik,'JTBA:KeyKlinik',0)
    SELF.AddKey(JTBA:KeyDokter,'JTBA:KeyDokter',0)
    SELF.AddKey(JTBA:KeyTanggal,'JTBA:KeyTanggal',0)
    SELF.AddKey(JTBA:KeyNoNota,'JTBA:KeyNoNota',0)
    SELF.AddKey(JTBA:KeyTempat,'JTBA:KeyTempat',0)
    SELF.AddKey(JTBA:KeyTransaksi,'JTBA:KeyTransaksi',0)
    SELF.AddKey(JTBA:KeyKodeDokter,'JTBA:KeyKodeDokter',0)
    SELF.AddKey(JTBA:KeyLantai,'JTBA:KeyLantai',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JTBayar.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JDokter)

  SELF.AddRelation(Relate:JHKuitansi)

  SELF.AddRelation(Relate:JTempat)

  SELF.AddRelation(Relate:JPasien)

  SELF.AddRelation(Relate:JPoli)

  SELF.AddRelation(Relate:JTbTransaksi)

  SELF.AddRelation(Relate:JTransaksi,RI:None,RI:None,JTra:KeyNomorMr)
  SELF.AddRelationLink(JTBA:Nomor_Mr,JTra:Nomor_Mr)


Hide:Relate:JTBayar.Kill PROCEDURE

  CODE
  _Hide:Access:JTBayar.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:JTBayar &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JTBayar)                            ! destroy the file manager


Hide:Relate:JDiagnosa.Init PROCEDURE
  CODE
  _Hide:Access:JDiagnosa.Init
  SELF.Init(Access:JDiagnosa,1)


Hide:Access:JDiagnosa.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JDIA:Record
  SELF.FileNameValue = 'JDiagnosa'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JDiagnosa
  PARENT.Init
  Access:JDiagnosa &= SELF


Hide:Access:JDiagnosa.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JDiagnosa &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JDiagnosa.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JDiagnosa,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JDIA:KeyNomorMR,'JDIA:KeyNomorMR',0)
    SELF.AddKey(JDIA:KeyTanggal,'JDIA:KeyTanggal',0)
    SELF.AddKey(JDIA:KeyNoMrSaja,'JDIA:KeyNoMrSaja',0)
    SELF.AddKey(JDIA:KeyDiagnosa,'JDIA:KeyDiagnosa',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JDiagnosa.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:TBDiagnosa)

  SELF.AddRelation(Relate:JDokter)

  SELF.AddRelation(Relate:JPasien)


Hide:Relate:JDiagnosa.Kill PROCEDURE

  CODE
  _Hide:Access:JDiagnosa.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:JDiagnosa &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JDiagnosa)                          ! destroy the file manager


Hide:Relate:RI_Stok.Init PROCEDURE
  CODE
  _Hide:Access:RI_Stok.Init
  SELF.Init(Access:RI_Stok,1)


Hide:Access:RI_Stok.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RI_ST:Record
  SELF.FileNameValue = 'RI_Stok'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RI_Stok
  PARENT.Init
  Access:RI_Stok &= SELF


Hide:Access:RI_Stok.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RI_Stok &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RI_Stok.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RI_Stok,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(RI_ST:Ruangan_RI_Stok_FK,'Apotik',0)
    SELF.AddKey(RI_ST:KeyBarang,'Barang-kd_apotik',0)
    SELF.AddKey(RI_ST:key_kd_brg,'kode barang saja',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:RI_Stok.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:ITbrRwt)


Hide:Relate:RI_Stok.Kill PROCEDURE

  CODE
  _Hide:Access:RI_Stok.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:RI_Stok &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RI_Stok)                            ! destroy the file manager


Hide:Relate:Nomor_Batal.Init PROCEDURE
  CODE
  _Hide:Access:Nomor_Batal.Init
  SELF.Init(Access:Nomor_Batal,1)


Hide:Access:Nomor_Batal.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= NOM:Record
  SELF.FileNameValue = 'Nomor_Batal'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Nomor_Batal
  PARENT.Init
  Access:Nomor_Batal &= SELF


Hide:Access:Nomor_Batal.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Nomor_Batal &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Nomor_Batal.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Nomor_Batal,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(NOM:PrimaryKey,'NOM:PrimaryKey',0)
    SELF.AddKey(NOM:NoUrut_NoBatal_FK,'NOM:NoUrut_NoBatal_FK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Nomor_Batal.Kill PROCEDURE

  CODE
  _Hide:Access:Nomor_Batal.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:Nomor_Batal &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Nomor_Batal)                        ! destroy the file manager


Hide:Relate:JTPasien.Init PROCEDURE
  CODE
  _Hide:Access:JTPasien.Init
  SELF.Init(Access:JTPasien,1)


Hide:Access:JTPasien.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JTPA:Record
  SELF.FileNameValue = 'JTPasien'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JTPasien
  PARENT.Init
  Access:JTPasien &= SELF


Hide:Access:JTPasien.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JTPasien &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JTPasien.PrimeFields PROCEDURE

  CODE
  JTPA:Tanggal = Today()                                   ! Assign initial field value
  JTPA:Kode_Transaksi = 1                                  ! Assign initial field value
  JTPA:Selesai = 'N'                                       ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:JTPasien.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JTPasien,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JTPA:KeyNomorMr,'JTPA:KeyNomorMr',0)
    SELF.AddKey(JTPA:KeyKodeTind,'JTPA:KeyKodeTind',0)
    SELF.AddKey(JTPA:KeyTanggal,'JTPA:KeyTanggal',0)
    SELF.AddKey(JTPA:KeyNoNota,'JTPA:KeyNoNota',0)
    SELF.AddKey(JTPA:KeyKodeDokter,'JTPA:KeyKodeDokter',0)
    SELF.AddKey(JTPA:KeyAnestesi,'JTPA:KeyAnestesi',0)
    SELF.AddKey(JTPA:KeyTransaksi,'JTPA:KeyTransaksi',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:JTPasien.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('Nomor Kiup')
    IF JTPA:Nomor_Mr < 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRangeLow,'0')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:JTPasien.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JtmTinRj,RI:CASCADE,RI:RESTRICT,JTM:KNotaJenisMr)
  SELF.AddRelationLink(JTPA:No_Nota,JTM:Nota)

  SELF.AddRelation(Relate:JTDokter,RI:CASCADE,RI:RESTRICT,JTDr:KeyNota)
  SELF.AddRelationLink(JTPA:No_Nota,JTDr:NoNota)

  SELF.AddRelation(Relate:JTransaksi)

  SELF.AddRelation(Relate:JTTBayar)

  SELF.AddRelation(Relate:JAnestesi)

  SELF.AddRelation(Relate:JDokter)

  SELF.AddRelation(Relate:JTindaka)

  SELF.AddRelation(Relate:JPasien)


Hide:Relate:JTPasien.Kill PROCEDURE

  CODE
  _Hide:Access:JTPasien.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:JTPasien &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JTPasien)                           ! destroy the file manager


Hide:Relate:DTOBAT.Init PROCEDURE
  CODE
  _Hide:Access:DTOBAT.Init
  SELF.Init(Access:DTOBAT,1)


Hide:Access:DTOBAT.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DTOB:Record
  SELF.FileNameValue = 'DTOBAT'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DTOBAT
  PARENT.Init
  Access:DTOBAT &= SELF


Hide:Access:DTOBAT.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DTOBAT &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DTOBAT.PrimeFields PROCEDURE

  CODE
  DTOB:Jenis = 'Non Paket'                                 ! Assign initial field value
  DTOB:HabisPak = 1                                        ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:DTOBAT.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DTOBAT,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DTOB:KeyKodeObat,'DTOB:KeyKodeObat',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DTOBAT.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DDTRpTin,RI:CASCADE,RI:CASCADE,DDTP:KeyKodeAlatDetail)
  SELF.AddRelationLink(DTOB:KodeObat,DDTP:KodeDet)

  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:DDTobat,RI:CASCADE,RI:CASCADE,DDTO:KeyKodeObat)
  SELF.AddRelationLink(DTOB:KodeObat,DDTO:KodeObat)


Hide:Relate:DTOBAT.Kill PROCEDURE

  CODE
  _Hide:Access:DTOBAT.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:DTOBAT &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DTOBAT)                             ! destroy the file manager


Hide:Relate:DTDiKer.Init PROCEDURE
  CODE
  _Hide:Access:DTDiKer.Init
  SELF.Init(Access:DTDiKer,1)


Hide:Access:DTDiKer.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DKER:Record
  SELF.FileNameValue = 'DTDiKer'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DTDiKer
  PARENT.Init
  Access:DTDiKer &= SELF


Hide:Access:DTDiKer.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DTDiKer &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DTDiKer.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DTDiKer,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DKER:KeyKodeDiag,'DKER:KeyKodeDiag',1)
    SELF.AddKey(DKER:KeyNamaDiag,'DKER:KeyNamaDiag',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DTDiKer.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DHPasOp,RI:CASCADE,RI:None,DHPA:KeyKodeDiagKerja)
  SELF.AddRelationLink(DKER:KodeDiagnosa,DHPA:KodeDiagnosa)

  SELF.AddRelation(Relate:DTDDKer,RI:CASCADE,RI:None,DDDR:KeyKode_DiagRegion)
  SELF.AddRelationLink(DKER:KodeDiagnosa,DDDR:KodeDiagnosa)


Hide:Relate:DTDiKer.Kill PROCEDURE

  CODE
  _Hide:Access:DTDiKer.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:DTDiKer &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DTDiKer)                            ! destroy the file manager


Hide:Relate:DTBalut.Init PROCEDURE
  CODE
  _Hide:Access:DTBalut.Init
  SELF.Init(Access:DTBalut,1)


Hide:Access:DTBalut.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DTBA:Record
  SELF.FileNameValue = 'DTBalut'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DTBalut
  PARENT.Init
  Access:DTBalut &= SELF


Hide:Access:DTBalut.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DTBalut &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DTBalut.PrimeFields PROCEDURE

  CODE
  DTBA:Jenis = 'Non Paket'                                 ! Assign initial field value
  DTBA:HabisPak = 1                                        ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:DTBalut.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DTBalut,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DTBA:KeyUPF,'DTBA:KeyUPF',0)
    SELF.AddKey(DTBA:KeyKodeBalut,'DTBA:KeyKodeBalut',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DTBalut.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DDTRpTin,RI:CASCADE,RI:CASCADE,DDTP:KeyKodeAlatDetail)
  SELF.AddRelationLink(DTBA:KodeBalut,DDTP:KodeDet)

  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:DTPBalut,RI:CASCADE,RI:CASCADE,DTPB:KeyKodePaketBalut)
  SELF.AddRelationLink(DTBA:KodeBalut,DTPB:KodePBalut)

  SELF.AddRelation(Relate:DDTBal,RI:CASCADE,RI:CASCADE,DDTB:KeyKodeBalut)
  SELF.AddRelationLink(DTBA:KodeBalut,DDTB:KodeBalut)


Hide:Relate:DTBalut.Kill PROCEDURE

  CODE
  _Hide:Access:DTBalut.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:DTBalut &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DTBalut)                            ! destroy the file manager


Hide:Relate:DTAlLain.Init PROCEDURE
  CODE
  _Hide:Access:DTAlLain.Init
  SELF.Init(Access:DTAlLain,1)


Hide:Access:DTAlLain.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DAL:Record
  SELF.FileNameValue = 'DTAlLain'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DTAlLain
  PARENT.Init
  Access:DTAlLain &= SELF


Hide:Access:DTAlLain.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DTAlLain &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DTAlLain.PrimeFields PROCEDURE

  CODE
  DAL:Jenis = 'Non Paket'                                  ! Assign initial field value
  DAL:HabisPak = 1                                         ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:DTAlLain.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DTAlLain,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DAL:KeyUPF,'DAL:KeyUPF',0)
    SELF.AddKey(DAL:KeyKodeAlat,'DAL:KeyKodeAlat',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DTAlLain.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DDTRpTin,RI:CASCADE,RI:CASCADE,DDTP:KeyKodeAlatDetail)
  SELF.AddRelationLink(DAL:KodeAlat,DDTP:KodeDet)

  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:DTPLain,RI:CASCADE,RI:CASCADE,DTPL:KeyKodePaketlain)
  SELF.AddRelationLink(DAL:KodeAlat,DTPL:KodePLain)

  SELF.AddRelation(Relate:DDTLain,RI:CASCADE,RI:CASCADE,DDTL:KeyKodeLain)
  SELF.AddRelationLink(DAL:KodeAlat,DDTL:KodeLain)


Hide:Relate:DTAlLain.Kill PROCEDURE

  CODE
  _Hide:Access:DTAlLain.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:DTAlLain &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DTAlLain)                           ! destroy the file manager


Hide:Relate:RoKStok.Init PROCEDURE
  CODE
  _Hide:Access:RoKStok.Init
  SELF.Init(Access:RoKStok,1)


Hide:Access:RoKStok.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RoKS:Record
  SELF.FileNameValue = 'RoKStok'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RoKStok
  PARENT.Init
  Access:RoKStok &= SELF


Hide:Access:RoKStok.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RoKStok &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RoKStok.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RoKStok,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(RoKS:KEY1,'RoKS:KEY1',0)
    SELF.AddKey(RoKS:BrgTanggalJamFKApKStok,'RoKS:BrgTanggalJamFKApKStok',0)
    SELF.AddKey(RoKS:KeyBarangAPKSTOK,'RoKS:KeyBarangAPKSTOK',0)
    SELF.AddKey(RoKS:INKSTOK_RUANG_FK,'RoKS:INKSTOK_RUANG_FK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:RoKStok.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ROGFpmpd)

  SELF.AddRelation(Relate:ROGBarang)


Hide:Relate:RoKStok.Kill PROCEDURE

  CODE
  _Hide:Access:RoKStok.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:RoKStok &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RoKStok)                            ! destroy the file manager


Hide:Relate:DTGas.Init PROCEDURE
  CODE
  _Hide:Access:DTGas.Init
  SELF.Init(Access:DTGas,1)


Hide:Access:DTGas.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DTGA:Record
  SELF.FileNameValue = 'DTGas'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DTGas
  PARENT.Init
  Access:DTGas &= SELF


Hide:Access:DTGas.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DTGas &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DTGas.PrimeFields PROCEDURE

  CODE
  DTGA:Jenis = 'Non Paket'                                 ! Assign initial field value
  DTGA:HabisPak = 1                                        ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:DTGas.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DTGas,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DTGA:KeyUPF,'DTGA:KeyUPF',0)
    SELF.AddKey(DTGA:KeyKodeGas,'DTGA:KeyKodeGas',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DTGas.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DDTRpTin,RI:CASCADE,RI:CASCADE,DDTP:KeyKodeAlatDetail)
  SELF.AddRelationLink(DTGA:KodeGas,DDTP:KodeDet)

  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:DDTGas,RI:CASCADE,RI:CASCADE,DDTG:KeyKodeGas)
  SELF.AddRelationLink(DTGA:KodeGas,DDTG:KodeGas)


Hide:Relate:DTGas.Kill PROCEDURE

  CODE
  _Hide:Access:DTGas.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:DTGas &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DTGas)                              ! destroy the file manager


Hide:Relate:DTDDKer.Init PROCEDURE
  CODE
  _Hide:Access:DTDDKer.Init
  SELF.Init(Access:DTDDKer,1)


Hide:Access:DTDDKer.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DDDR:Record
  SELF.FileNameValue = 'DTDDKer'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DTDDKer
  PARENT.Init
  Access:DTDDKer &= SELF


Hide:Access:DTDDKer.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DTDDKer &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DTDDKer.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DTDDKer,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DDDR:KeyKodeDiagnosa,'DDDR:KeyKodeDiagnosa',0)
    SELF.AddKey(DDDR:KeyKode_DiagRegion,'DDDR:KeyKode_DiagRegion',0)
    SELF.AddKey(DDDR:KeyKodeRegion,'DDDR:KeyKodeRegion',1)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DTDDKer.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DHPasOp,RI:CASCADE,RI:None,DHPA:keyKodeRegion)
  SELF.AddRelationLink(DDDR:KodeRegion,DHPA:KodeRegion)

  SELF.AddRelation(Relate:DTDiKer)


Hide:Relate:DTDDKer.Kill PROCEDURE

  CODE
  _Hide:Access:DTDDKer.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:DTDDKer &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DTDDKer)                            ! destroy the file manager


Hide:Relate:GStokPerBulan.Init PROCEDURE
  CODE
  _Hide:Access:GStokPerBulan.Init
  SELF.Init(Access:GStokPerBulan,1)


Hide:Access:GStokPerBulan.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GST:Record
  SELF.FileNameValue = 'GStokPerBulan'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GStokPerBulan
  PARENT.Init
  Access:GStokPerBulan &= SELF


Hide:Access:GStokPerBulan.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GStokPerBulan &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GStokPerBulan.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GStokPerBulan,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(GST:PrimaryKey,'GST:PrimaryKey',0)
    SELF.AddKey(GST:KeyKodeBarang,'GST:KeyKodeBarang',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GStokPerBulan.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)


Hide:Relate:GStokPerBulan.Kill PROCEDURE

  CODE
  _Hide:Access:GStokPerBulan.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:GStokPerBulan &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GStokPerBulan)                      ! destroy the file manager


Hide:Relate:IDaftarAlat.Init PROCEDURE
  CODE
  _Hide:Access:IDaftarAlat.Init
  SELF.Init(Access:IDaftarAlat,1)


Hide:Access:IDaftarAlat.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IDFA:Record
  SELF.FileNameValue = 'IDaftarAlat'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= IDaftarAlat
  PARENT.Init
  Access:IDaftarAlat &= SELF


Hide:Access:IDaftarAlat.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:IDaftarAlat &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:IDaftarAlat.PrimeFields PROCEDURE

  CODE
  IDFA:SatuanSewa = 'Jam'                                  ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:IDaftarAlat.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(IDaftarAlat,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(IDFA:KeyKodeAlat,'IDFA:KeyKodeAlat',0)
    SELF.AddKey(IDFA:KeyNamaAlat,'IDFA:KeyNamaAlat',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:IDaftarAlat.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:IPkiAlat,RI:CASCADE,RI:RESTRICT,IPKA:KeyKodeAlat)
  SELF.AddRelationLink(IDFA:KodeAlat,IPKA:KodeAlat)


Hide:Relate:IDaftarAlat.Kill PROCEDURE

  CODE
  _Hide:Access:IDaftarAlat.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:IDaftarAlat &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:IDaftarAlat)                        ! destroy the file manager


Hide:Relate:ILIST.Init PROCEDURE
  CODE
  _Hide:Access:ILIST.Init
  SELF.Init(Access:ILIST,1)


Hide:Access:ILIST.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ILIS:Record
  SELF.FileNameValue = 'ILIST'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ILIST
  PARENT.Init
  Access:ILIST &= SELF


Hide:Access:ILIST.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ILIST &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ILIST.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ILIST,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(ILIS:KeyNomorMR,'ILIS:KeyNomorMR',0)
    SELF.AddKey(ILIS:KeyTanggal,'ILIS:KeyTanggal',0)
    SELF.AddKey(ILIS:KeyStatus,'ILIS:KeyStatus',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ILIST.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:IDiagnosa,RI:CASCADE,RI:RESTRICT,IDIA:KeyNoMRSaja)
  SELF.AddRelationLink(ILIS:Nomor_MR,IDIA:Nomor_MR)

  SELF.AddRelation(Relate:IPasPul)

  SELF.AddRelation(Relate:IPasien)


Hide:Relate:ILIST.Kill PROCEDURE

  CODE
  _Hide:Access:ILIST.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:ILIST &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ILIST)                              ! destroy the file manager


Hide:Relate:DTAsi.Init PROCEDURE
  CODE
  _Hide:Access:DTAsi.Init
  SELF.Init(Access:DTAsi,1)


Hide:Access:DTAsi.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DTAI:Record
  SELF.FileNameValue = 'DTAsi'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DTAsi
  PARENT.Init
  Access:DTAsi &= SELF


Hide:Access:DTAsi.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DTAsi &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DTAsi.PrimeFields PROCEDURE

  CODE
  DTAI:Type = 'Suntik'                                     ! Assign initial field value
  DTAI:Jenis = 'Non Paket'                                 ! Assign initial field value
  DTAI:HabisPak = 1                                        ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:DTAsi.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DTAsi,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DTAI:KeyKodeAsIn,'Key Kode Alat Suntik dan Infus',0)
    SELF.AddKey(DTAI:KeyUPF,'DTAI:KeyUPF',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DTAsi.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DDTRpTin,RI:CASCADE,RI:CASCADE,DDTP:KeyKodeAlatDetail)
  SELF.AddRelationLink(DTAI:KodeAlSI,DDTP:KodeDet)

  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:DDTSunIn,RI:CASCADE,RI:CASCADE,DDSI:KeyKodeSunIn)
  SELF.AddRelationLink(DTAI:KodeAlSI,DDSI:KodeSunIn)


Hide:Relate:DTAsi.Kill PROCEDURE

  CODE
  _Hide:Access:DTAsi.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:DTAsi &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DTAsi)                              ! destroy the file manager


Hide:Relate:DTBena.Init PROCEDURE
  CODE
  _Hide:Access:DTBena.Init
  SELF.Init(Access:DTBena,1)


Hide:Access:DTBena.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DTBE:Record
  SELF.FileNameValue = 'DTBena'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DTBena
  PARENT.Init
  Access:DTBena &= SELF


Hide:Access:DTBena.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DTBena &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DTBena.PrimeFields PROCEDURE

  CODE
  DTBE:Jenis = 'Non Paket'                                 ! Assign initial field value
  DTBE:HabisPak = 1                                        ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:DTBena.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DTBena,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DTBE:KeyUPF,'DTBE:KeyUPF',0)
    SELF.AddKey(DTBE:KeyKodeBenang,'DTBE:KeyKodeBenang',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DTBena.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DDTRpTin,RI:CASCADE,RI:CASCADE,DDTP:KeyKodeAlatDetail)
  SELF.AddRelationLink(DTBE:KodeBenang,DDTP:KodeDet)

  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:DTPBena,RI:CASCADE,RI:CASCADE,DTPE:KeyKodePaketBenang)
  SELF.AddRelationLink(DTBE:KodeBenang,DTPE:KodePBenang)

  SELF.AddRelation(Relate:DDTJahit,RI:CASCADE,RI:CASCADE,DDTJ:KeyKodeJahit)
  SELF.AddRelationLink(DTBE:KodeBenang,DDTJ:KodeJahit)


Hide:Relate:DTBena.Kill PROCEDURE

  CODE
  _Hide:Access:DTBena.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:DTBena &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DTBena)                             ! destroy the file manager


Hide:Relate:JRujuk.Init PROCEDURE
  CODE
  _Hide:Access:JRujuk.Init
  SELF.Init(Access:JRujuk,1)


Hide:Access:JRujuk.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JRUK:Record
  SELF.FileNameValue = 'JRujuk'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JRujuk
  PARENT.Init
  Access:JRujuk &= SELF


Hide:Access:JRujuk.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JRujuk &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JRujuk.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JRujuk,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JRUK:KeyRujukan,'JRUK:KeyRujukan',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JRujuk.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JTransaksi,RI:None,RI:None,JTra:KeyRujukan)
  SELF.AddRelationLink(JRUK:Rujukan,JTra:Rujukan)


Hide:Relate:JRujuk.Kill PROCEDURE

  CODE
  _Hide:Access:JRujuk.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:JRujuk &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JRujuk)                             ! destroy the file manager

