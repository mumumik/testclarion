  MEMBER('apc6new.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
APC6NBC4:DctInit    PROCEDURE
APC6NBC4:DctKill    PROCEDURE
APC6NBC4:FilesInit  PROCEDURE
  END

Hide:Access:Apklutmp CLASS(FileManager),TYPE               ! FileManager for Apklutmp
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:Apklutmp CLASS(RelationManager),TYPE           ! RelationManager for Apklutmp
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GSATMP   CLASS(FileManager),TYPE               ! FileManager for GSATMP
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GSATMP   CLASS(RelationManager),TYPE           ! RelationManager for GSATMP
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GBarUPF  CLASS(FileManager),TYPE               ! FileManager for GBarUPF
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GBarUPF  CLASS(RelationManager),TYPE           ! RelationManager for GBarUPF
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GHBPBMaster CLASS(FileManager),TYPE            ! FileManager for GHBPBMaster
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GHBPBMaster CLASS(RelationManager),TYPE        ! RelationManager for GHBPBMaster
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:TBDiagnosa CLASS(FileManager),TYPE             ! FileManager for TBDiagnosa
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:TBDiagnosa CLASS(RelationManager),TYPE         ! RelationManager for TBDiagnosa
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ApLapKel CLASS(FileManager),TYPE               ! FileManager for ApLapKel
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ApLapKel CLASS(RelationManager),TYPE           ! RelationManager for ApLapKel
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DDTBalKT CLASS(FileManager),TYPE               ! FileManager for DDTBalKT
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DDTBalKT CLASS(RelationManager),TYPE           ! RelationManager for DDTBalKT
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JDokter  CLASS(FileManager),TYPE               ! FileManager for JDokter
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JDokter  CLASS(RelationManager),TYPE           ! RelationManager for JDokter
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:APkemtmp CLASS(FileManager),TYPE               ! FileManager for APkemtmp
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:APkemtmp CLASS(RelationManager),TYPE           ! RelationManager for APkemtmp
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DTTindak CLASS(FileManager),TYPE               ! FileManager for DTTindak
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DTTindak CLASS(RelationManager),TYPE           ! RelationManager for DTTindak
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DDTJahit CLASS(FileManager),TYPE               ! FileManager for DDTJahit
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DDTJahit CLASS(RelationManager),TYPE           ! RelationManager for DDTJahit
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DHPasBat CLASS(FileManager),TYPE               ! FileManager for DHPasBat
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DHPasBat CLASS(RelationManager),TYPE           ! RelationManager for DHPasBat
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DDTRpTin CLASS(FileManager),TYPE               ! FileManager for DDTRpTin
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DDTRpTin CLASS(RelationManager),TYPE           ! RelationManager for DDTRpTin
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DDTLain  CLASS(FileManager),TYPE               ! FileManager for DDTLain
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DDTLain  CLASS(RelationManager),TYPE           ! RelationManager for DDTLain
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DHPToday CLASS(FileManager),TYPE               ! FileManager for DHPToday
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DHPToday CLASS(RelationManager),TYPE           ! RelationManager for DHPToday
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:AAdjust  CLASS(FileManager),TYPE               ! FileManager for AAdjust
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:AAdjust  CLASS(RelationManager),TYPE           ! RelationManager for AAdjust
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DDTambah CLASS(FileManager),TYPE               ! FileManager for DDTambah
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DDTambah CLASS(RelationManager),TYPE           ! RelationManager for DDTambah
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DDTGas   CLASS(FileManager),TYPE               ! FileManager for DDTGas
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DDTGas   CLASS(RelationManager),TYPE           ! RelationManager for DDTGas
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ROGBarang CLASS(FileManager),TYPE              ! FileManager for ROGBarang
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ROGBarang CLASS(RelationManager),TYPE          ! RelationManager for ROGBarang
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:OKKStok  CLASS(FileManager),TYPE               ! FileManager for OKKStok
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:OKKStok  CLASS(RelationManager),TYPE           ! RelationManager for OKKStok
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END


_Hide:Access:Apklutmp &Hide:Access:Apklutmp,AUTO,THREAD
_Hide:Relate:Apklutmp &Hide:Relate:Apklutmp,AUTO,THREAD
_Hide:Access:GSATMP  &Hide:Access:GSATMP,AUTO,THREAD
_Hide:Relate:GSATMP  &Hide:Relate:GSATMP,AUTO,THREAD
_Hide:Access:GBarUPF &Hide:Access:GBarUPF,AUTO,THREAD
_Hide:Relate:GBarUPF &Hide:Relate:GBarUPF,AUTO,THREAD
_Hide:Access:GHBPBMaster &Hide:Access:GHBPBMaster,AUTO,THREAD
_Hide:Relate:GHBPBMaster &Hide:Relate:GHBPBMaster,AUTO,THREAD
_Hide:Access:TBDiagnosa &Hide:Access:TBDiagnosa,AUTO,THREAD
_Hide:Relate:TBDiagnosa &Hide:Relate:TBDiagnosa,AUTO,THREAD
_Hide:Access:ApLapKel &Hide:Access:ApLapKel,AUTO,THREAD
_Hide:Relate:ApLapKel &Hide:Relate:ApLapKel,AUTO,THREAD
_Hide:Access:DDTBalKT &Hide:Access:DDTBalKT,AUTO,THREAD
_Hide:Relate:DDTBalKT &Hide:Relate:DDTBalKT,AUTO,THREAD
_Hide:Access:JDokter &Hide:Access:JDokter,AUTO,THREAD
_Hide:Relate:JDokter &Hide:Relate:JDokter,AUTO,THREAD
_Hide:Access:APkemtmp &Hide:Access:APkemtmp,AUTO,THREAD
_Hide:Relate:APkemtmp &Hide:Relate:APkemtmp,AUTO,THREAD
_Hide:Access:DTTindak &Hide:Access:DTTindak,AUTO,THREAD
_Hide:Relate:DTTindak &Hide:Relate:DTTindak,AUTO,THREAD
_Hide:Access:DDTJahit &Hide:Access:DDTJahit,AUTO,THREAD
_Hide:Relate:DDTJahit &Hide:Relate:DDTJahit,AUTO,THREAD
_Hide:Access:DHPasBat &Hide:Access:DHPasBat,AUTO,THREAD
_Hide:Relate:DHPasBat &Hide:Relate:DHPasBat,AUTO,THREAD
_Hide:Access:DDTRpTin &Hide:Access:DDTRpTin,AUTO,THREAD
_Hide:Relate:DDTRpTin &Hide:Relate:DDTRpTin,AUTO,THREAD
_Hide:Access:DDTLain &Hide:Access:DDTLain,AUTO,THREAD
_Hide:Relate:DDTLain &Hide:Relate:DDTLain,AUTO,THREAD
_Hide:Access:DHPToday &Hide:Access:DHPToday,AUTO,THREAD
_Hide:Relate:DHPToday &Hide:Relate:DHPToday,AUTO,THREAD
_Hide:Access:AAdjust &Hide:Access:AAdjust,AUTO,THREAD
_Hide:Relate:AAdjust &Hide:Relate:AAdjust,AUTO,THREAD
_Hide:Access:DDTambah &Hide:Access:DDTambah,AUTO,THREAD
_Hide:Relate:DDTambah &Hide:Relate:DDTambah,AUTO,THREAD
_Hide:Access:DDTGas  &Hide:Access:DDTGas,AUTO,THREAD
_Hide:Relate:DDTGas  &Hide:Relate:DDTGas,AUTO,THREAD
_Hide:Access:ROGBarang &Hide:Access:ROGBarang,AUTO,THREAD
_Hide:Relate:ROGBarang &Hide:Relate:ROGBarang,AUTO,THREAD
_Hide:Access:OKKStok &Hide:Access:OKKStok,AUTO,THREAD
_Hide:Relate:OKKStok &Hide:Relate:OKKStok,AUTO,THREAD


APC6NBC4:DctInit PROCEDURE
  CODE
  _Hide:Access:Apklutmp &= NEW(Hide:Access:Apklutmp)
  _Hide:Relate:Apklutmp &= NEW(Hide:Relate:Apklutmp)
  _Hide:Access:GSATMP &= NEW(Hide:Access:GSATMP)
  _Hide:Relate:GSATMP &= NEW(Hide:Relate:GSATMP)
  _Hide:Access:GBarUPF &= NEW(Hide:Access:GBarUPF)
  _Hide:Relate:GBarUPF &= NEW(Hide:Relate:GBarUPF)
  _Hide:Access:GHBPBMaster &= NEW(Hide:Access:GHBPBMaster)
  _Hide:Relate:GHBPBMaster &= NEW(Hide:Relate:GHBPBMaster)
  _Hide:Access:TBDiagnosa &= NEW(Hide:Access:TBDiagnosa)
  _Hide:Relate:TBDiagnosa &= NEW(Hide:Relate:TBDiagnosa)
  _Hide:Access:ApLapKel &= NEW(Hide:Access:ApLapKel)
  _Hide:Relate:ApLapKel &= NEW(Hide:Relate:ApLapKel)
  _Hide:Access:DDTBalKT &= NEW(Hide:Access:DDTBalKT)
  _Hide:Relate:DDTBalKT &= NEW(Hide:Relate:DDTBalKT)
  _Hide:Access:JDokter &= NEW(Hide:Access:JDokter)
  _Hide:Relate:JDokter &= NEW(Hide:Relate:JDokter)
  _Hide:Access:APkemtmp &= NEW(Hide:Access:APkemtmp)
  _Hide:Relate:APkemtmp &= NEW(Hide:Relate:APkemtmp)
  _Hide:Access:DTTindak &= NEW(Hide:Access:DTTindak)
  _Hide:Relate:DTTindak &= NEW(Hide:Relate:DTTindak)
  _Hide:Access:DDTJahit &= NEW(Hide:Access:DDTJahit)
  _Hide:Relate:DDTJahit &= NEW(Hide:Relate:DDTJahit)
  _Hide:Access:DHPasBat &= NEW(Hide:Access:DHPasBat)
  _Hide:Relate:DHPasBat &= NEW(Hide:Relate:DHPasBat)
  _Hide:Access:DDTRpTin &= NEW(Hide:Access:DDTRpTin)
  _Hide:Relate:DDTRpTin &= NEW(Hide:Relate:DDTRpTin)
  _Hide:Access:DDTLain &= NEW(Hide:Access:DDTLain)
  _Hide:Relate:DDTLain &= NEW(Hide:Relate:DDTLain)
  _Hide:Access:DHPToday &= NEW(Hide:Access:DHPToday)
  _Hide:Relate:DHPToday &= NEW(Hide:Relate:DHPToday)
  _Hide:Access:AAdjust &= NEW(Hide:Access:AAdjust)
  _Hide:Relate:AAdjust &= NEW(Hide:Relate:AAdjust)
  _Hide:Access:DDTambah &= NEW(Hide:Access:DDTambah)
  _Hide:Relate:DDTambah &= NEW(Hide:Relate:DDTambah)
  _Hide:Access:DDTGas &= NEW(Hide:Access:DDTGas)
  _Hide:Relate:DDTGas &= NEW(Hide:Relate:DDTGas)
  _Hide:Access:ROGBarang &= NEW(Hide:Access:ROGBarang)
  _Hide:Relate:ROGBarang &= NEW(Hide:Relate:ROGBarang)
  _Hide:Access:OKKStok &= NEW(Hide:Access:OKKStok)
  _Hide:Relate:OKKStok &= NEW(Hide:Relate:OKKStok)
  Relate:Apklutmp &= _Hide:Relate:Apklutmp
  Relate:GSATMP &= _Hide:Relate:GSATMP
  Relate:GBarUPF &= _Hide:Relate:GBarUPF
  Relate:GHBPBMaster &= _Hide:Relate:GHBPBMaster
  Relate:TBDiagnosa &= _Hide:Relate:TBDiagnosa
  Relate:ApLapKel &= _Hide:Relate:ApLapKel
  Relate:DDTBalKT &= _Hide:Relate:DDTBalKT
  Relate:JDokter &= _Hide:Relate:JDokter
  Relate:APkemtmp &= _Hide:Relate:APkemtmp
  Relate:DTTindak &= _Hide:Relate:DTTindak
  Relate:DDTJahit &= _Hide:Relate:DDTJahit
  Relate:DHPasBat &= _Hide:Relate:DHPasBat
  Relate:DDTRpTin &= _Hide:Relate:DDTRpTin
  Relate:DDTLain &= _Hide:Relate:DDTLain
  Relate:DHPToday &= _Hide:Relate:DHPToday
  Relate:AAdjust &= _Hide:Relate:AAdjust
  Relate:DDTambah &= _Hide:Relate:DDTambah
  Relate:DDTGas &= _Hide:Relate:DDTGas
  Relate:ROGBarang &= _Hide:Relate:ROGBarang
  Relate:OKKStok &= _Hide:Relate:OKKStok


APC6NBC4:FilesInit PROCEDURE
  CODE
  _Hide:Relate:Apklutmp.Init
  _Hide:Relate:GSATMP.Init
  _Hide:Relate:GBarUPF.Init
  _Hide:Relate:GHBPBMaster.Init
  _Hide:Relate:TBDiagnosa.Init
  _Hide:Relate:ApLapKel.Init
  _Hide:Relate:DDTBalKT.Init
  _Hide:Relate:JDokter.Init
  _Hide:Relate:APkemtmp.Init
  _Hide:Relate:DTTindak.Init
  _Hide:Relate:DDTJahit.Init
  _Hide:Relate:DHPasBat.Init
  _Hide:Relate:DDTRpTin.Init
  _Hide:Relate:DDTLain.Init
  _Hide:Relate:DHPToday.Init
  _Hide:Relate:AAdjust.Init
  _Hide:Relate:DDTambah.Init
  _Hide:Relate:DDTGas.Init
  _Hide:Relate:ROGBarang.Init
  _Hide:Relate:OKKStok.Init


APC6NBC4:DctKill PROCEDURE
  CODE
  _Hide:Relate:Apklutmp.Kill
  DISPOSE(_Hide:Relate:Apklutmp)
  _Hide:Relate:GSATMP.Kill
  DISPOSE(_Hide:Relate:GSATMP)
  _Hide:Relate:GBarUPF.Kill
  DISPOSE(_Hide:Relate:GBarUPF)
  _Hide:Relate:GHBPBMaster.Kill
  DISPOSE(_Hide:Relate:GHBPBMaster)
  _Hide:Relate:TBDiagnosa.Kill
  DISPOSE(_Hide:Relate:TBDiagnosa)
  _Hide:Relate:ApLapKel.Kill
  DISPOSE(_Hide:Relate:ApLapKel)
  _Hide:Relate:DDTBalKT.Kill
  DISPOSE(_Hide:Relate:DDTBalKT)
  _Hide:Relate:JDokter.Kill
  DISPOSE(_Hide:Relate:JDokter)
  _Hide:Relate:APkemtmp.Kill
  DISPOSE(_Hide:Relate:APkemtmp)
  _Hide:Relate:DTTindak.Kill
  DISPOSE(_Hide:Relate:DTTindak)
  _Hide:Relate:DDTJahit.Kill
  DISPOSE(_Hide:Relate:DDTJahit)
  _Hide:Relate:DHPasBat.Kill
  DISPOSE(_Hide:Relate:DHPasBat)
  _Hide:Relate:DDTRpTin.Kill
  DISPOSE(_Hide:Relate:DDTRpTin)
  _Hide:Relate:DDTLain.Kill
  DISPOSE(_Hide:Relate:DDTLain)
  _Hide:Relate:DHPToday.Kill
  DISPOSE(_Hide:Relate:DHPToday)
  _Hide:Relate:AAdjust.Kill
  DISPOSE(_Hide:Relate:AAdjust)
  _Hide:Relate:DDTambah.Kill
  DISPOSE(_Hide:Relate:DDTambah)
  _Hide:Relate:DDTGas.Kill
  DISPOSE(_Hide:Relate:DDTGas)
  _Hide:Relate:ROGBarang.Kill
  DISPOSE(_Hide:Relate:ROGBarang)
  _Hide:Relate:OKKStok.Kill
  DISPOSE(_Hide:Relate:OKKStok)


Hide:Relate:Apklutmp.Init PROCEDURE
  CODE
  _Hide:Access:Apklutmp.Init
  SELF.Init(Access:Apklutmp,1)


Hide:Access:Apklutmp.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APKL:Record
  SELF.FileNameValue = 'Apklutmp'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Apklutmp
  PARENT.Init
  Access:Apklutmp &= SELF


Hide:Access:Apklutmp.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Apklutmp &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Apklutmp.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Apklutmp,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APKL:key_nota_brg,'APKL:key_nota_brg',0)
    SELF.AddKey(APKL:key_nota,'nomor transaksi',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Apklutmp.Kill PROCEDURE

  CODE
  _Hide:Access:Apklutmp.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:Apklutmp &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Apklutmp)                           ! destroy the file manager


Hide:Relate:GSATMP.Init PROCEDURE
  CODE
  _Hide:Access:GSATMP.Init
  SELF.Init(Access:GSATMP,1)


Hide:Access:GSATMP.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GSTO1:Record
  SELF.FileNameValue = 'GSATMP'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GSATMP
  PARENT.Init
  Access:GSATMP &= SELF


Hide:Access:GSATMP.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GSATMP &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GSATMP.PrimeFields PROCEDURE

  CODE
  GSTO1:Apotik1 = 0                                        ! Assign initial field value
  GSTO1:Apotik2 = 0                                        ! Assign initial field value
  GSTO1:Apotik3 = 0                                        ! Assign initial field value
  GSTO1:Apotik4 = 0                                        ! Assign initial field value
  GSTO1:Apotik5 = 0                                        ! Assign initial field value
  GSTO1:Apotik6 = 0                                        ! Assign initial field value
  GSTO1:Apotik7 = 0                                        ! Assign initial field value
  GSTO1:Apotik8 = 0                                        ! Assign initial field value
  GSTO1:Apotik9 = 0                                        ! Assign initial field value
  GSTO1:Apotik10 = 0                                       ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:GSATMP.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GSATMP,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GSTO1:KeyBarang,'GSTO1:KeyBarang',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GSATMP.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)


Hide:Relate:GSATMP.Kill PROCEDURE

  CODE
  _Hide:Access:GSATMP.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:GSATMP &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GSATMP)                             ! destroy the file manager


Hide:Relate:GBarUPF.Init PROCEDURE
  CODE
  _Hide:Access:GBarUPF.Init
  SELF.Init(Access:GBarUPF,1)


Hide:Access:GBarUPF.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GBA:Record
  SELF.FileNameValue = 'GBarUPF'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GBarUPF
  PARENT.Init
  Access:GBarUPF &= SELF


Hide:Access:GBarUPF.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GBarUPF &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GBarUPF.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GBarUPF,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GBA:KeyUPF,'GBA:KeyUPF',0)
    SELF.AddKey(GBA:KeyNama,'GBA:KeyNama',0)
    SELF.AddKey(GBA:KeyKode_Nama,'GBA:KeyKode_Nama',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GBarUPF.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang,RI:CASCADE,RI:None,GBAR:KeyKodeUPF)
  SELF.AddRelationLink(GBA:UPFBar,GBAR:Kode_UPF)


Hide:Relate:GBarUPF.Kill PROCEDURE

  CODE
  _Hide:Access:GBarUPF.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:GBarUPF &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GBarUPF)                            ! destroy the file manager


Hide:Relate:GHBPBMaster.Init PROCEDURE
  CODE
  _Hide:Access:GHBPBMaster.Init
  SELF.Init(Access:GHBPBMaster,1)


Hide:Access:GHBPBMaster.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GHBPB1:Record
  SELF.FileNameValue = 'GHBPBMaster'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GHBPBMaster
  PARENT.Init
  Access:GHBPBMaster &= SELF


Hide:Access:GHBPBMaster.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GHBPBMaster &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GHBPBMaster.PrimeFields PROCEDURE

  CODE
  GHBPB1:Status = 'Buka'                                   ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:GHBPBMaster.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GHBPBMaster,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GHBPB1:KeyNoBPB,'No BPB',0)
    SELF.AddKey(GHBPB1:KeyStatus,'GHBPB1:KeyStatus',0)
    SELF.AddKey(GHBPB1:KeyNoApotik,'No Apotik',0)
    SELF.AddKey(GHBPB1:KeyTanggal,'GHBPB1:KeyTanggal',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:GHBPBMaster.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 5
    GlobalErrors.SetField('GHBPB1:Verifikasi')
    IF INSTRING(']' & GHBPB1:Verifikasi & '[', ']0[]1[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Belum'',''Sudah''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:GHBPBMaster.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GApotik)

  SELF.AddRelation(Relate:GHBPB,RI:None,RI:None,GHBPB:KeyMasterGHBPB)
  SELF.AddRelationLink(GHBPB1:NoBPB,GHBPB:NoMaster)

  SELF.AddRelation(Relate:GDBPBMaster,RI:None,RI:None,GDBPB1:KeyNoBPB)
  SELF.AddRelationLink(GHBPB1:NoBPB,GDBPB1:NoBPB)


Hide:Relate:GHBPBMaster.Kill PROCEDURE

  CODE
  _Hide:Access:GHBPBMaster.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:GHBPBMaster &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GHBPBMaster)                        ! destroy the file manager


Hide:Relate:TBDiagnosa.Init PROCEDURE
  CODE
  _Hide:Access:TBDiagnosa.Init
  SELF.Init(Access:TBDiagnosa,1)


Hide:Access:TBDiagnosa.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TBDI:Record
  SELF.FileNameValue = 'TBDiagnosa'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TBDiagnosa
  PARENT.Init
  Access:TBDiagnosa &= SELF


Hide:Access:TBDiagnosa.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TBDiagnosa &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TBDiagnosa.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TBDiagnosa,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(TBDI:KeyDiagnosa,'TBDI:KeyDiagnosa',0)
    SELF.AddKey(TBDI:KeyDeskripsi,'TBDI:KeyDeskripsi',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:TBDiagnosa.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:RI_Diagnosa,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,RI_DI:KeyDiagnosa)
  SELF.AddRelationLink(TBDI:Diagnosa,RI_DI:Diagnosa)

  SELF.AddRelation(Relate:JDiagnosa,RI:CASCADE,RI:RESTRICT,JDIA:KeyDiagnosa)
  SELF.AddRelationLink(TBDI:Diagnosa,JDIA:Diagnosa)

  SELF.AddRelation(Relate:IDiagnosa,RI:CASCADE,RI:RESTRICT,IDIA:KeyDiagnosa)
  SELF.AddRelationLink(TBDI:Diagnosa,IDIA:Diagnosa)


Hide:Relate:TBDiagnosa.Kill PROCEDURE

  CODE
  _Hide:Access:TBDiagnosa.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:TBDiagnosa &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TBDiagnosa)                         ! destroy the file manager


Hide:Relate:ApLapKel.Init PROCEDURE
  CODE
  _Hide:Access:ApLapKel.Init
  SELF.Init(Access:ApLapKel,1)


Hide:Access:ApLapKel.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APLK:Record
  SELF.FileNameValue = 'ApLapKel'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ApLapKel
  PARENT.Init
  Access:ApLapKel &= SELF


Hide:Access:ApLapKel.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ApLapKel &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ApLapKel.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ApLapKel,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APLK:key_no_tgl,'No_laporan-tanggal',0)
    SELF.AddKey(APLK:key_no_lap,'nomor laporan',0)
    SELF.AddKey(APLK:key_kode_brg,'APLK:key_kode_brg',0)
    SELF.AddKey(APLK:PrimaryKey,'APLK:PrimaryKey',2)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ApLapKel.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)


Hide:Relate:ApLapKel.Kill PROCEDURE

  CODE
  _Hide:Access:ApLapKel.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:ApLapKel &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ApLapKel)                           ! destroy the file manager


Hide:Relate:DDTBalKT.Init PROCEDURE
  CODE
  _Hide:Access:DDTBalKT.Init
  SELF.Init(Access:DDTBalKT,1)


Hide:Access:DDTBalKT.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DDBK:Record
  SELF.FileNameValue = 'DDTBalKT'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DDTBalKT
  PARENT.Init
  Access:DDTBalKT &= SELF


Hide:Access:DDTBalKT.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DDTBalKT &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DDTBalKT.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DDTBalKT,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DDBK:KeyNoPeriksaBal,'DDBK:KeyNoPeriksaBal',0)
    SELF.AddKey(DDBK:KeyKodeBalut,'DDBK:KeyKodeBalut',0)
    SELF.AddKey(DDBK:KeyNoPe_KBalut,'DDBK:KeyNoPe_KBalut',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DDTBalKT.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DDTBal)


Hide:Relate:DDTBalKT.Kill PROCEDURE

  CODE
  _Hide:Access:DDTBalKT.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:DDTBalKT &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DDTBalKT)                           ! destroy the file manager


Hide:Relate:JDokter.Init PROCEDURE
  CODE
  _Hide:Access:JDokter.Init
  SELF.Init(Access:JDokter,1)


Hide:Access:JDokter.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JDok:Record
  SELF.FileNameValue = 'JDokter'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JDokter
  PARENT.Init
  Access:JDokter &= SELF


Hide:Access:JDokter.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JDokter &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JDokter.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JDokter,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JDok:KeyKodeDokter,'JDok:KeyKodeDokter',0)
    SELF.AddKey(JDok:KeyNamaDokter,'JDok:KeyNamaDokter',0)
    SELF.AddKey(JDok:KeyStatus,'JDok:KeyStatus',0)
    SELF.AddKey(JDok:Kstatusmitra,'JDok:Kstatusmitra',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JDokter.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  DO AddRelations_2
  
  DO AddRelations_3
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:APEPREH,RI:None,RI:None,APE3:dokter_apepreh_fk)
  SELF.AddRelationLink(JDok:Kode_Dokter,APE3:Dokter)

  SELF.AddRelation(Relate:APHTRANSBPJS,RI:None,RI:None,APHB:dokter_aphtrans_fk)
  SELF.AddRelationLink(JDok:Kode_Dokter,APHB:dokter)

  SELF.AddRelation(Relate:APHTRANS,RI:None,RI:None,APH:dokter_aphtrans_fk)
  SELF.AddRelationLink(JDok:Kode_Dokter,APH:dokter)

  SELF.AddRelation(Relate:RoPasRJ,RI:None,RI:None,RPRJ:keyDokter)
  SELF.AddRelationLink(JDok:Kode_Dokter,RPRJ:Dokter)

  SELF.AddRelation(Relate:RoPcsRJ,RI:None,RI:None,RPCJ:keyDokter)
  SELF.AddRelationLink(JDok:Kode_Dokter,RPCJ:Dokter)

  SELF.AddRelation(Relate:JTDokter,RI:None,RI:None,JTDr:KeyKodeDokter)
  SELF.AddRelationLink(JDok:Kode_Dokter,JTDr:KodeDokter)

  SELF.AddRelation(Relate:JStatusDr)

  SELF.AddRelation(Relate:RekJsaDr,RI:CASCADE,RI:None,REK:KKodedr)
  SELF.AddRelationLink(JDok:Kode_Dokter,REK:Kode_dr)

  SELF.AddRelation(Relate:JSUMDR)

  SELF.AddRelation(Relate:RI_Diagnosa,RI:CASCADE_SERVER,RI:None,RI_DI:KeyDokter)
  SELF.AddRelationLink(JDok:Kode_Dokter,RI_DI:KodeDokter)

AddRelations_2 ROUTINE
  SELF.AddRelation(Relate:RI_VisitDr,RI:CASCADE_SERVER,RI:None,VI_SI:KeyKodeDr)
  SELF.AddRelationLink(JDok:Kode_Dokter,VI_SI:KodeDokter)

  SELF.AddRelation(Relate:RI_PinRuang,RI:None,RI:RESTRICT_SERVER,RI_PI:KeyKodeDokter)
  SELF.AddRelationLink(JDok:Kode_Dokter,RI_PI:Kode_Dokter)

  SELF.AddRelation(Relate:JTBayar,RI:CASCADE,RI:None,JTBA:KeyDokter)
  SELF.AddRelationLink(JDok:Kode_Dokter,JTBA:Dokter)

  SELF.AddRelation(Relate:IByTrPas,RI:CASCADE,RI:None,IBYT:KeyKodeDokter)
  SELF.AddRelationLink(JDok:Kode_Dokter,IBYT:KodeDokter)

  SELF.AddRelation(Relate:JJDokter,RI:CASCADE,RI:None,JJDO:KeyDokter)
  SELF.AddRelationLink(JDok:Kode_Dokter,JJDO:KodeDokter)

  SELF.AddRelation(Relate:ITrPasen,RI:CASCADE,RI:None,ITRP:KeyKodeDokter)
  SELF.AddRelationLink(JDok:Kode_Dokter,ITRP:Kode_Dokter)

  SELF.AddRelation(Relate:IDiagnosa,RI:CASCADE,RI:None,IDIA:KeyDokter)
  SELF.AddRelationLink(JDok:Kode_Dokter,IDIA:KodeDokter)

  SELF.AddRelation(Relate:JTSBayar,RI:CASCADE,RI:None,JTBS:KeyDokter)
  SELF.AddRelationLink(JDok:Kode_Dokter,JTBS:Dokter)

  SELF.AddRelation(Relate:JTTSByr,RI:CASCADE,RI:None,JTTS:KeyDokter)
  SELF.AddRelationLink(JDok:Kode_Dokter,JTTS:Dokter)

  SELF.AddRelation(Relate:JTTBayar,RI:CASCADE,RI:RESTRICT,JTTB:KeyDokter)
  SELF.AddRelationLink(JDok:Kode_Dokter,JTTB:Dokter)

AddRelations_3 ROUTINE
  SELF.AddRelation(Relate:JREKJD,RI:CASCADE,RI:None,JRJD:KeyDokter)
  SELF.AddRelationLink(JDok:Kode_Dokter,JRJD:KodeDokter)

  SELF.AddRelation(Relate:DTabDoc,RI:CASCADE,RI:None,DTDK:KeyNIP)
  SELF.AddRelationLink(JDok:Kode_Dokter,DTDK:NIP)

  SELF.AddRelation(Relate:IVisitDr,RI:CASCADE,RI:None,IVID:KeyKodeDr)
  SELF.AddRelationLink(JDok:Kode_Dokter,IVID:KodeDokter)

  SELF.AddRelation(Relate:IPasien,RI:CASCADE,RI:None,IPas:KeyKodeDr)
  SELF.AddRelationLink(JDok:Kode_Dokter,IPas:DrPengirim)

  SELF.AddRelation(Relate:JDiagnosa,RI:CASCADE,RI:None,JDIA:KeyNomorMR)
  SELF.AddRelationLink(JDok:Kode_Dokter,JDIA:Nomor_MR)

  SELF.AddRelation(Relate:JTPasien,RI:CASCADE,RI:None,JTPA:KeyKodeDokter)
  SELF.AddRelationLink(JDok:Kode_Dokter,JTPA:Kode_dokter)

  SELF.AddRelation(Relate:JTransaksi,RI:CASCADE,RI:None,JTra:KeyKodeDokter)
  SELF.AddRelationLink(JDok:Kode_Dokter,JTra:Kode_dokter)


Hide:Relate:JDokter.Kill PROCEDURE

  CODE
  _Hide:Access:JDokter.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:JDokter &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JDokter)                            ! destroy the file manager


Hide:Relate:APkemtmp.Init PROCEDURE
  CODE
  _Hide:Access:APkemtmp.Init
  SELF.Init(Access:APkemtmp,1)


Hide:Access:APkemtmp.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APKT:Record
  SELF.FileNameValue = 'APkemtmp'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= APkemtmp
  PARENT.Init
  Access:APkemtmp &= SELF


Hide:Access:APkemtmp.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:APkemtmp &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:APkemtmp.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(APkemtmp,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APKT:key_no_mr,'No_mr-kode_brg',0)
    SELF.AddKey(APKT:key_mr,'nomor_mr',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:APkemtmp.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('Nomor Medical record pasien')
    IF NOT INRANGE(APKT:Nomor_mr,0,99999999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'0 .. 99999999')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:APkemtmp.Kill PROCEDURE

  CODE
  _Hide:Access:APkemtmp.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:APkemtmp &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:APkemtmp)                           ! destroy the file manager


Hide:Relate:DTTindak.Init PROCEDURE
  CODE
  _Hide:Access:DTTindak.Init
  SELF.Init(Access:DTTindak,1)


Hide:Access:DTTindak.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DTTI:Record
  SELF.FileNameValue = 'DTTindak'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DTTindak
  PARENT.Init
  Access:DTTindak &= SELF


Hide:Access:DTTindak.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DTTindak &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DTTindak.PrimeFields PROCEDURE

  CODE
  DTTI:Type = 'Suntik'                                     ! Assign initial field value
  DTTI:Jenis = 'Non Paket'                                 ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:DTTindak.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DTTindak,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DTTI:KeyKodeTindak,'Key untuk kode Tindakan',1)
    SELF.AddKey(DTTI:KeyUPF,'DTTI:KeyUPF',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DTTindak.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DTTindHr,RI:CASCADE,RI:CASCADE,DTNH:KeyKodeTindak_and_Jasa)
  SELF.AddRelationLink(DTTI:KodeTindak,DTNH:KodeTindak)

  SELF.AddRelation(Relate:DDTindak,RI:CASCADE,RI:CASCADE,DDTN:KeyKodeTindak)
  SELF.AddRelationLink(DTTI:KodeTindak,DDTN:KodeTindak)


Hide:Relate:DTTindak.Kill PROCEDURE

  CODE
  _Hide:Access:DTTindak.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:DTTindak &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DTTindak)                           ! destroy the file manager


Hide:Relate:DDTJahit.Init PROCEDURE
  CODE
  _Hide:Access:DDTJahit.Init
  SELF.Init(Access:DDTJahit,1)


Hide:Access:DDTJahit.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DDTJ:Record
  SELF.FileNameValue = 'DDTJahit'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DDTJahit
  PARENT.Init
  Access:DDTJahit &= SELF


Hide:Access:DDTJahit.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DDTJahit &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DDTJahit.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DDTJahit,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DDTJ:KeyNoPeriksaJah,'DDTJ:KeyNoPeriksaJah',0)
    SELF.AddKey(DDTJ:KeyKodeJahit,'DDTJ:KeyKodeJahit',0)
    SELF.AddKey(DDTJ:KeyNoPe_KJahit,'DDTJ:KeyNoPe_KJahit',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DDTJahit.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DTBena)

  SELF.AddRelation(Relate:DHPasOp)


Hide:Relate:DDTJahit.Kill PROCEDURE

  CODE
  _Hide:Access:DDTJahit.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:DDTJahit &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DDTJahit)                           ! destroy the file manager


Hide:Relate:DHPasBat.Init PROCEDURE
  CODE
  _Hide:Access:DHPasBat.Init
  SELF.Init(Access:DHPasBat,1)


Hide:Access:DHPasBat.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DHPB:Record
  SELF.FileNameValue = 'DHPasBat'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DHPasBat
  PARENT.Init
  Access:DHPasBat &= SELF


Hide:Access:DHPasBat.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DHPasBat &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DHPasBat.PrimeFields PROCEDURE

  CODE
  DHPB:Jammasuk = Clock()                                  ! Assign initial field value
  DHPB:JamBatal = Clock()                                  ! Assign initial field value
  DHPB:StatusPP = 'PP'                                     ! Assign initial field value
  DHPB:Sifat = 'Biasa'                                     ! Assign initial field value
  DHPB:Pembayaran = 2                                      ! Assign initial field value
  DHPB:StatusCetakKerja = 'Masuk'                          ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:DHPasBat.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DHPasBat,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DHPB:KeyNomorMr,'Nomor RM',0)
    SELF.AddKey(DHPB:KeyNomorPeriksa,'DHPB:KeyNomorPeriksa',0)
    SELF.AddKey(DHPB:KeyNomPTgJamBalik,'Key NomorPeriksa Tanggal dan Jam yg dibalik',0)
    SELF.AddKey(DHPB:KeyKodeDiagKerja,'DHPB:KeyKodeDiagKerja',0)
    SELF.AddKey(DHPB:KeyDiagTambah,'Key Diagnosa Tambahan',0)
    SELF.AddKey(DHPB:keyKodeRegion,'DHPB:keyKodeRegion',0)
    SELF.AddKey(DHPB:KeyTanggalMasuk,'DHPB:KeyTanggalMasuk',0)
    SELF.AddKey(DHPB:KeyTglMasuk_Jam,'Untuk Pengontrolan TanggalMasuk dan Jam',0)
    SELF.AddKey(DHPB:KeyTindakanAkhir,'DHPB:KeyTindakanAkhir',0)
    SELF.AddKey(DHPB:KeyKodeRuang,'DHPB:KeyKodeRuang',0)
    SELF.AddKey(DHPB:KeyTindakan,'DHPB:KeyTindakan',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:DHPasBat.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('Nomor Medical record pasien')
    IF NOT INRANGE(DHPB:Nomor_mr,0,99999999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'0 .. 99999999')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:DHPasBat.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JPasien)


Hide:Relate:DHPasBat.Kill PROCEDURE

  CODE
  _Hide:Access:DHPasBat.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:DHPasBat &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DHPasBat)                           ! destroy the file manager


Hide:Relate:DDTRpTin.Init PROCEDURE
  CODE
  _Hide:Access:DDTRpTin.Init
  SELF.Init(Access:DDTRpTin,1)


Hide:Access:DDTRpTin.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DDTP:Record
  SELF.FileNameValue = 'DDTRpTin'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DDTRpTin
  PARENT.Init
  Access:DDTRpTin &= SELF


Hide:Access:DDTRpTin.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DDTRpTin &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DDTRpTin.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DDTRpTin,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DDTP:KeyNoPeriksaTindak,'DDTP:KeyNoPeriksaTindak',0)
    SELF.AddKey(DDTP:KeyKodeAlatDetail,'Key Kode alat Detail',0)
    SELF.AddKey(DDTP:KeyNoPe_KDet,'Key No Periksa dan Kode Detail',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DDTRpTin.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DHPasOp)

  SELF.AddRelation(Relate:DTAlLain)

  SELF.AddRelation(Relate:DTAsi)

  SELF.AddRelation(Relate:DTBalut)

  SELF.AddRelation(Relate:DTBena)

  SELF.AddRelation(Relate:DTGas)

  SELF.AddRelation(Relate:DTOBAT)


Hide:Relate:DDTRpTin.Kill PROCEDURE

  CODE
  _Hide:Access:DDTRpTin.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:DDTRpTin &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DDTRpTin)                           ! destroy the file manager


Hide:Relate:DDTLain.Init PROCEDURE
  CODE
  _Hide:Access:DDTLain.Init
  SELF.Init(Access:DDTLain,1)


Hide:Access:DDTLain.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DDTL:Record
  SELF.FileNameValue = 'DDTLain'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DDTLain
  PARENT.Init
  Access:DDTLain &= SELF


Hide:Access:DDTLain.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DDTLain &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DDTLain.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DDTLain,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DDTL:KeyNoPeriksaLain,'DDTL:KeyNoPeriksaLain',0)
    SELF.AddKey(DDTL:KeyKodeLain,'DDTL:KeyKodeLain',0)
    SELF.AddKey(DDTL:KeyNoPe_KLain,'DDTL:KeyNoPe_KLain',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DDTLain.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DTAlLain)

  SELF.AddRelation(Relate:DHPasOp)


Hide:Relate:DDTLain.Kill PROCEDURE

  CODE
  _Hide:Access:DDTLain.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:DDTLain &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DDTLain)                            ! destroy the file manager


Hide:Relate:DHPToday.Init PROCEDURE
  CODE
  _Hide:Access:DHPToday.Init
  SELF.Init(Access:DHPToday,1)


Hide:Access:DHPToday.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DHPT:Record
  SELF.FileNameValue = 'DHPToday'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DHPToday
  PARENT.Init
  Access:DHPToday &= SELF


Hide:Access:DHPToday.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DHPToday &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DHPToday.PrimeFields PROCEDURE

  CODE
  DHPT:Jammasuk = Clock()                                  ! Assign initial field value
  DHPT:JamKeluar = Clock()                                 ! Assign initial field value
  DHPT:StatusPP = 'PP'                                     ! Assign initial field value
  DHPT:Sifat = 'Biasa'                                     ! Assign initial field value
  DHPT:Pembayaran = 2                                      ! Assign initial field value
  DHPT:StatusCetakKerja = 'Masuk'                          ! Assign initial field value
  DHPT:K_OBATOBATAN = 1                                    ! Assign initial field value
  DHPT:K_alSunIn = 2                                       ! Assign initial field value
  DHPT:K_Benjah = 3                                        ! Assign initial field value
  DHPT:K_Bal = 4                                           ! Assign initial field value
  DHPT:K_GasAnes = 5                                       ! Assign initial field value
  DHPT:K_AlLain = 6                                        ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:DHPToday.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DHPToday,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DHPT:KeyNomorMr,'Nomor RM',0)
    SELF.AddKey(DHPT:KeyNomorPeriksa,'DHPT:KeyNomorPeriksa',0)
    SELF.AddKey(DHPT:KeyNomorPeriksaBalik,'DHPT:KeyNomorPeriksaBalik',0)
    SELF.AddKey(DHPT:KeyKodeDiagKerja,'DHPT:KeyKodeDiagKerja',0)
    SELF.AddKey(DHPT:KeyDiagTambah,'Key Diagnosa Tambahan',0)
    SELF.AddKey(DHPT:keyKodeRegion,'DHPT:keyKodeRegion',0)
    SELF.AddKey(DHPT:KeyTglMasuk_Jam,'Untuk Pengontrolan TanggalMasuk dan Jam',0)
    SELF.AddKey(DHPT:KeyTindakanAkhir,'DHPT:KeyTindakanAkhir',0)
    SELF.AddKey(DHPT:KeyKodeRuang,'DHPT:KeyKodeRuang',0)
    SELF.AddKey(DHPT:KeyObatNotta,'Kode Nomr Notta dan Obat',0)
    SELF.AddKey(DHPT:KeyTindakan,'DHPT:KeyTindakan',0)
    SELF.AddKey(DHPT:KeySunInNotta,' Key Nomor Notta dan SuntikInfus',0)
    SELF.AddKey(DHPT:KeyBenJahNotta,'Key Nomor Notta dan BenangJahit',0)
    SELF.AddKey(DHPT:KeyBalNotta,'Key Nomor Notta dan Balutan',0)
    SELF.AddKey(DHPT:KeyGasAnNotta,'Key Nomor Notta dan GasNesthesi',0)
    SELF.AddKey(DHPT:KeyLainNotta,'Key Nomor Notta dan Lain-lain',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:DHPToday.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('Nomor Medical record pasien')
    IF NOT INRANGE(DHPT:Nomor_mr,0,99999999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'0 .. 99999999')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:DHPToday.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JPasien)

  SELF.AddRelation(Relate:DHPasOp,RI:None,RI:None,DHPA:KeyNomorPeriksa)
  SELF.AddRelationLink(DHPT:NoPeriksa,DHPA:NoPeriksa)


Hide:Relate:DHPToday.Kill PROCEDURE

  CODE
  _Hide:Access:DHPToday.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:DHPToday &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DHPToday)                           ! destroy the file manager


Hide:Relate:AAdjust.Init PROCEDURE
  CODE
  _Hide:Access:AAdjust.Init
  SELF.Init(Access:AAdjust,1)


Hide:Access:AAdjust.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AAD:Record
  SELF.FileNameValue = 'AAdjust'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AAdjust
  PARENT.Init
  Access:AAdjust &= SELF


Hide:Access:AAdjust.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AAdjust &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AAdjust.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AAdjust,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(AAD:PrimaryKey,'AAD:PrimaryKey',0)
    SELF.AddKey(AAD:GBarang_GAdjusment_Key,'AAD:GBarang_GAdjusment_Key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:AAdjust.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 8
    GlobalErrors.SetField('AAD:Status')
    IF INSTRING(']' & AAD:Status & '[', ']1[]2[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Tambah Stok'',''Kurang Stok''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:AAdjust.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)


Hide:Relate:AAdjust.Kill PROCEDURE

  CODE
  _Hide:Access:AAdjust.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:AAdjust &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AAdjust)                            ! destroy the file manager


Hide:Relate:DDTambah.Init PROCEDURE
  CODE
  _Hide:Access:DDTambah.Init
  SELF.Init(Access:DDTambah,1)


Hide:Access:DDTambah.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DDTh:Record
  SELF.FileNameValue = 'DDTambah'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DDTambah
  PARENT.Init
  Access:DDTambah &= SELF


Hide:Access:DDTambah.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DDTambah &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DDTambah.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DDTambah,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DDTh:KeyNoPeriksaTindak,'DDTh:KeyNoPeriksaTindak',0)
    SELF.AddKey(DDTh:KeyNamaDiagReg,'KeyKodeDiagnosa dan Region',0)
    SELF.AddKey(DDTh:KeyNamaDiag,'DDTh:KeyNamaDiag',0)
    SELF.AddKey(DDTh:KeyNamaRegion,'DDTh:KeyNamaRegion',0)
    SELF.AddKey(DDTh:KeyNoPe_KTindak,'DDTh:KeyNoPe_KTindak',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DDTambah.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DHPasOp)


Hide:Relate:DDTambah.Kill PROCEDURE

  CODE
  _Hide:Access:DDTambah.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:DDTambah &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DDTambah)                           ! destroy the file manager


Hide:Relate:DDTGas.Init PROCEDURE
  CODE
  _Hide:Access:DDTGas.Init
  SELF.Init(Access:DDTGas,1)


Hide:Access:DDTGas.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DDTG:Record
  SELF.FileNameValue = 'DDTGas'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DDTGas
  PARENT.Init
  Access:DDTGas &= SELF


Hide:Access:DDTGas.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DDTGas &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DDTGas.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DDTGas,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DDTG:KeyNoPeriksaGas,'DDTG:KeyNoPeriksaGas',0)
    SELF.AddKey(DDTG:KeyKodeGas,'DDTG:KeyKodeGas',0)
    SELF.AddKey(DDTG:KeyNoPe_KGas,'DDTG:KeyNoPe_KGas',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DDTGas.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DTGas)

  SELF.AddRelation(Relate:DHPasOp)


Hide:Relate:DDTGas.Kill PROCEDURE

  CODE
  _Hide:Access:DDTGas.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:DDTGas &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DDTGas)                             ! destroy the file manager


Hide:Relate:ROGBarang.Init PROCEDURE
  CODE
  _Hide:Access:ROGBarang.Init
  SELF.Init(Access:ROGBarang,1)


Hide:Access:ROGBarang.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RoGB:Record
  SELF.FileNameValue = 'ROGBarang'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ROGBarang
  PARENT.Init
  Access:ROGBarang &= SELF


Hide:Access:ROGBarang.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ROGBarang &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ROGBarang.PrimeFields PROCEDURE

  CODE
  RoGB:Jenis_Brg = 'Obat'                                  ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:ROGBarang.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ROGBarang,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(RoGB:KeyKodeBrg,'Kode Barang',0)
    SELF.AddKey(RoGB:keyjenisfilm,'RoGB:keyjenisfilm',0)
    SELF.AddKey(RoGB:KeyNama,'Nama Barang',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ROGBarang.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ROGFpmpd,RI:None,RI:None,RoF:key_kd_brg)
  SELF.AddRelationLink(RoGB:Kode_brg,RoF:Kode_brg)

  SELF.AddRelation(Relate:RoKStok,RI:CASCADE,RI:RESTRICT,RoKS:KEY1)
  SELF.AddRelationLink(RoGB:Kode_brg,RoKS:Kode_Barang)

  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:RoPasien,RI:CASCADE,RI:RESTRICT,ROPA:KeyKodeBrg)
  SELF.AddRelationLink(RoGB:Kode_brg,ROPA:Kode_Brg)

  SELF.AddRelation(Relate:RoStok,RI:CASCADE,RI:RESTRICT,RSTO:KeyKodeBrg)
  SELF.AddRelationLink(RoGB:Kode_brg,RSTO:Kode_Brg)


Hide:Relate:ROGBarang.Kill PROCEDURE

  CODE
  _Hide:Access:ROGBarang.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:ROGBarang &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ROGBarang)                          ! destroy the file manager


Hide:Relate:OKKStok.Init PROCEDURE
  CODE
  _Hide:Access:OKKStok.Init
  SELF.Init(Access:OKKStok,1)


Hide:Access:OKKStok.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GKS1:Record
  SELF.FileNameValue = 'OKKStok'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OKKStok
  PARENT.Init
  Access:OKKStok &= SELF


Hide:Access:OKKStok.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OKKStok &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OKKStok.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OKKStok,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(GKS1:PrimaryKey,'GKS1:PrimaryKey',0)
    SELF.AddKey(GKS1:UrutTanggal_Key,'GKS1:UrutTanggal_Key',0)
    SELF.AddKey(GKS1:BrgTglJamNoTrans_Key,'GKS1:BrgTglJamNoTrans_Key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:OKKStok.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)


Hide:Relate:OKKStok.Kill PROCEDURE

  CODE
  _Hide:Access:OKKStok.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:OKKStok &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OKKStok)                            ! destroy the file manager

