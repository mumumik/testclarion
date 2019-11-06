  MEMBER('apc6new.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
APC6NBC2:DctInit    PROCEDURE
APC6NBC2:DctKill    PROCEDURE
APC6NBC2:FilesInit  PROCEDURE
  END

Hide:Access:AptoInSmdD CLASS(FileManager),TYPE             ! FileManager for AptoInSmdD
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:AptoInSmdD CLASS(RelationManager),TYPE         ! RelationManager for AptoInSmdD
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:AptoInSmdH CLASS(FileManager),TYPE             ! FileManager for AptoInSmdH
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:AptoInSmdH CLASS(RelationManager),TYPE         ! RelationManager for AptoInSmdH
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:IRK_PDPT CLASS(FileManager),TYPE               ! FileManager for IRK_PDPT
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:IRK_PDPT CLASS(RelationManager),TYPE           ! RelationManager for IRK_PDPT
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RekJsaDr CLASS(FileManager),TYPE               ! FileManager for RekJsaDr
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RekJsaDr CLASS(RelationManager),TYPE           ! RelationManager for RekJsaDr
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ApDDProd CLASS(FileManager),TYPE               ! FileManager for ApDDProd
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ApDDProd CLASS(RelationManager),TYPE           ! RelationManager for ApDDProd
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GKStok   CLASS(FileManager),TYPE               ! FileManager for GKStok
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GKStok   CLASS(RelationManager),TYPE           ! RelationManager for GKStok
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RI_DSBBK CLASS(FileManager),TYPE               ! FileManager for RI_DSBBK
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RI_DSBBK CLASS(RelationManager),TYPE           ! RelationManager for RI_DSBBK
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GSaldoawal CLASS(FileManager),TYPE             ! FileManager for GSaldoawal
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GSaldoawal CLASS(RelationManager),TYPE         ! RelationManager for GSaldoawal
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GBrgDis  CLASS(FileManager),TYPE               ! FileManager for GBrgDis
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GBrgDis  CLASS(RelationManager),TYPE           ! RelationManager for GBrgDis
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RI_HSBBK CLASS(FileManager),TYPE               ! FileManager for RI_HSBBK
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RI_HSBBK CLASS(RelationManager),TYPE           ! RelationManager for RI_HSBBK
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:IR_Bayi  CLASS(FileManager),TYPE               ! FileManager for IR_Bayi
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:IR_Bayi  CLASS(RelationManager),TYPE           ! RelationManager for IR_Bayi
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:FIFOOUT  CLASS(FileManager),TYPE               ! FileManager for FIFOOUT
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:FIFOOUT  CLASS(RelationManager),TYPE           ! RelationManager for FIFOOUT
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:FIFOIN   CLASS(FileManager),TYPE               ! FileManager for FIFOIN
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:FIFOIN   CLASS(RelationManager),TYPE           ! RelationManager for FIFOIN
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ITr_Umka CLASS(FileManager),TYPE               ! FileManager for ITr_Umka
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ITr_Umka CLASS(RelationManager),TYPE           ! RelationManager for ITr_Umka
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ApInOutBln CLASS(FileManager),TYPE             ! FileManager for ApInOutBln
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ApInOutBln CLASS(RelationManager),TYPE         ! RelationManager for ApInOutBln
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:IMJasa   CLASS(FileManager),TYPE               ! FileManager for IMJasa
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:IMJasa   CLASS(RelationManager),TYPE           ! RelationManager for IMJasa
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ITrPsMan CLASS(FileManager),TYPE               ! FileManager for ITrPsMan
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ITrPsMan CLASS(RelationManager),TYPE           ! RelationManager for ITrPsMan
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RI_DTOAPTK CLASS(FileManager),TYPE             ! FileManager for RI_DTOAPTK
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RI_DTOAPTK CLASS(RelationManager),TYPE         ! RelationManager for RI_DTOAPTK
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ApDProd  CLASS(FileManager),TYPE               ! FileManager for ApDProd
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ApDProd  CLASS(RelationManager),TYPE           ! RelationManager for ApDProd
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ApHProd  CLASS(FileManager),TYPE               ! FileManager for ApHProd
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ApHProd  CLASS(RelationManager),TYPE           ! RelationManager for ApHProd
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END


_Hide:Access:AptoInSmdD &Hide:Access:AptoInSmdD,AUTO,THREAD
_Hide:Relate:AptoInSmdD &Hide:Relate:AptoInSmdD,AUTO,THREAD
_Hide:Access:AptoInSmdH &Hide:Access:AptoInSmdH,AUTO,THREAD
_Hide:Relate:AptoInSmdH &Hide:Relate:AptoInSmdH,AUTO,THREAD
_Hide:Access:IRK_PDPT &Hide:Access:IRK_PDPT,AUTO,THREAD
_Hide:Relate:IRK_PDPT &Hide:Relate:IRK_PDPT,AUTO,THREAD
_Hide:Access:RekJsaDr &Hide:Access:RekJsaDr,AUTO,THREAD
_Hide:Relate:RekJsaDr &Hide:Relate:RekJsaDr,AUTO,THREAD
_Hide:Access:ApDDProd &Hide:Access:ApDDProd,AUTO,THREAD
_Hide:Relate:ApDDProd &Hide:Relate:ApDDProd,AUTO,THREAD
_Hide:Access:GKStok  &Hide:Access:GKStok,AUTO,THREAD
_Hide:Relate:GKStok  &Hide:Relate:GKStok,AUTO,THREAD
_Hide:Access:RI_DSBBK &Hide:Access:RI_DSBBK,AUTO,THREAD
_Hide:Relate:RI_DSBBK &Hide:Relate:RI_DSBBK,AUTO,THREAD
_Hide:Access:GSaldoawal &Hide:Access:GSaldoawal,AUTO,THREAD
_Hide:Relate:GSaldoawal &Hide:Relate:GSaldoawal,AUTO,THREAD
_Hide:Access:GBrgDis &Hide:Access:GBrgDis,AUTO,THREAD
_Hide:Relate:GBrgDis &Hide:Relate:GBrgDis,AUTO,THREAD
_Hide:Access:RI_HSBBK &Hide:Access:RI_HSBBK,AUTO,THREAD
_Hide:Relate:RI_HSBBK &Hide:Relate:RI_HSBBK,AUTO,THREAD
_Hide:Access:IR_Bayi &Hide:Access:IR_Bayi,AUTO,THREAD
_Hide:Relate:IR_Bayi &Hide:Relate:IR_Bayi,AUTO,THREAD
_Hide:Access:FIFOOUT &Hide:Access:FIFOOUT,AUTO,THREAD
_Hide:Relate:FIFOOUT &Hide:Relate:FIFOOUT,AUTO,THREAD
_Hide:Access:FIFOIN  &Hide:Access:FIFOIN,AUTO,THREAD
_Hide:Relate:FIFOIN  &Hide:Relate:FIFOIN,AUTO,THREAD
_Hide:Access:ITr_Umka &Hide:Access:ITr_Umka,AUTO,THREAD
_Hide:Relate:ITr_Umka &Hide:Relate:ITr_Umka,AUTO,THREAD
_Hide:Access:ApInOutBln &Hide:Access:ApInOutBln,AUTO,THREAD
_Hide:Relate:ApInOutBln &Hide:Relate:ApInOutBln,AUTO,THREAD
_Hide:Access:IMJasa  &Hide:Access:IMJasa,AUTO,THREAD
_Hide:Relate:IMJasa  &Hide:Relate:IMJasa,AUTO,THREAD
_Hide:Access:ITrPsMan &Hide:Access:ITrPsMan,AUTO,THREAD
_Hide:Relate:ITrPsMan &Hide:Relate:ITrPsMan,AUTO,THREAD
_Hide:Access:RI_DTOAPTK &Hide:Access:RI_DTOAPTK,AUTO,THREAD
_Hide:Relate:RI_DTOAPTK &Hide:Relate:RI_DTOAPTK,AUTO,THREAD
_Hide:Access:ApDProd &Hide:Access:ApDProd,AUTO,THREAD
_Hide:Relate:ApDProd &Hide:Relate:ApDProd,AUTO,THREAD
_Hide:Access:ApHProd &Hide:Access:ApHProd,AUTO,THREAD
_Hide:Relate:ApHProd &Hide:Relate:ApHProd,AUTO,THREAD


APC6NBC2:DctInit PROCEDURE
  CODE
  _Hide:Access:AptoInSmdD &= NEW(Hide:Access:AptoInSmdD)
  _Hide:Relate:AptoInSmdD &= NEW(Hide:Relate:AptoInSmdD)
  _Hide:Access:AptoInSmdH &= NEW(Hide:Access:AptoInSmdH)
  _Hide:Relate:AptoInSmdH &= NEW(Hide:Relate:AptoInSmdH)
  _Hide:Access:IRK_PDPT &= NEW(Hide:Access:IRK_PDPT)
  _Hide:Relate:IRK_PDPT &= NEW(Hide:Relate:IRK_PDPT)
  _Hide:Access:RekJsaDr &= NEW(Hide:Access:RekJsaDr)
  _Hide:Relate:RekJsaDr &= NEW(Hide:Relate:RekJsaDr)
  _Hide:Access:ApDDProd &= NEW(Hide:Access:ApDDProd)
  _Hide:Relate:ApDDProd &= NEW(Hide:Relate:ApDDProd)
  _Hide:Access:GKStok &= NEW(Hide:Access:GKStok)
  _Hide:Relate:GKStok &= NEW(Hide:Relate:GKStok)
  _Hide:Access:RI_DSBBK &= NEW(Hide:Access:RI_DSBBK)
  _Hide:Relate:RI_DSBBK &= NEW(Hide:Relate:RI_DSBBK)
  _Hide:Access:GSaldoawal &= NEW(Hide:Access:GSaldoawal)
  _Hide:Relate:GSaldoawal &= NEW(Hide:Relate:GSaldoawal)
  _Hide:Access:GBrgDis &= NEW(Hide:Access:GBrgDis)
  _Hide:Relate:GBrgDis &= NEW(Hide:Relate:GBrgDis)
  _Hide:Access:RI_HSBBK &= NEW(Hide:Access:RI_HSBBK)
  _Hide:Relate:RI_HSBBK &= NEW(Hide:Relate:RI_HSBBK)
  _Hide:Access:IR_Bayi &= NEW(Hide:Access:IR_Bayi)
  _Hide:Relate:IR_Bayi &= NEW(Hide:Relate:IR_Bayi)
  _Hide:Access:FIFOOUT &= NEW(Hide:Access:FIFOOUT)
  _Hide:Relate:FIFOOUT &= NEW(Hide:Relate:FIFOOUT)
  _Hide:Access:FIFOIN &= NEW(Hide:Access:FIFOIN)
  _Hide:Relate:FIFOIN &= NEW(Hide:Relate:FIFOIN)
  _Hide:Access:ITr_Umka &= NEW(Hide:Access:ITr_Umka)
  _Hide:Relate:ITr_Umka &= NEW(Hide:Relate:ITr_Umka)
  _Hide:Access:ApInOutBln &= NEW(Hide:Access:ApInOutBln)
  _Hide:Relate:ApInOutBln &= NEW(Hide:Relate:ApInOutBln)
  _Hide:Access:IMJasa &= NEW(Hide:Access:IMJasa)
  _Hide:Relate:IMJasa &= NEW(Hide:Relate:IMJasa)
  _Hide:Access:ITrPsMan &= NEW(Hide:Access:ITrPsMan)
  _Hide:Relate:ITrPsMan &= NEW(Hide:Relate:ITrPsMan)
  _Hide:Access:RI_DTOAPTK &= NEW(Hide:Access:RI_DTOAPTK)
  _Hide:Relate:RI_DTOAPTK &= NEW(Hide:Relate:RI_DTOAPTK)
  _Hide:Access:ApDProd &= NEW(Hide:Access:ApDProd)
  _Hide:Relate:ApDProd &= NEW(Hide:Relate:ApDProd)
  _Hide:Access:ApHProd &= NEW(Hide:Access:ApHProd)
  _Hide:Relate:ApHProd &= NEW(Hide:Relate:ApHProd)
  Relate:AptoInSmdD &= _Hide:Relate:AptoInSmdD
  Relate:AptoInSmdH &= _Hide:Relate:AptoInSmdH
  Relate:IRK_PDPT &= _Hide:Relate:IRK_PDPT
  Relate:RekJsaDr &= _Hide:Relate:RekJsaDr
  Relate:ApDDProd &= _Hide:Relate:ApDDProd
  Relate:GKStok &= _Hide:Relate:GKStok
  Relate:RI_DSBBK &= _Hide:Relate:RI_DSBBK
  Relate:GSaldoawal &= _Hide:Relate:GSaldoawal
  Relate:GBrgDis &= _Hide:Relate:GBrgDis
  Relate:RI_HSBBK &= _Hide:Relate:RI_HSBBK
  Relate:IR_Bayi &= _Hide:Relate:IR_Bayi
  Relate:FIFOOUT &= _Hide:Relate:FIFOOUT
  Relate:FIFOIN &= _Hide:Relate:FIFOIN
  Relate:ITr_Umka &= _Hide:Relate:ITr_Umka
  Relate:ApInOutBln &= _Hide:Relate:ApInOutBln
  Relate:IMJasa &= _Hide:Relate:IMJasa
  Relate:ITrPsMan &= _Hide:Relate:ITrPsMan
  Relate:RI_DTOAPTK &= _Hide:Relate:RI_DTOAPTK
  Relate:ApDProd &= _Hide:Relate:ApDProd
  Relate:ApHProd &= _Hide:Relate:ApHProd


APC6NBC2:FilesInit PROCEDURE
  CODE
  _Hide:Relate:AptoInSmdD.Init
  _Hide:Relate:AptoInSmdH.Init
  _Hide:Relate:IRK_PDPT.Init
  _Hide:Relate:RekJsaDr.Init
  _Hide:Relate:ApDDProd.Init
  _Hide:Relate:GKStok.Init
  _Hide:Relate:RI_DSBBK.Init
  _Hide:Relate:GSaldoawal.Init
  _Hide:Relate:GBrgDis.Init
  _Hide:Relate:RI_HSBBK.Init
  _Hide:Relate:IR_Bayi.Init
  _Hide:Relate:FIFOOUT.Init
  _Hide:Relate:FIFOIN.Init
  _Hide:Relate:ITr_Umka.Init
  _Hide:Relate:ApInOutBln.Init
  _Hide:Relate:IMJasa.Init
  _Hide:Relate:ITrPsMan.Init
  _Hide:Relate:RI_DTOAPTK.Init
  _Hide:Relate:ApDProd.Init
  _Hide:Relate:ApHProd.Init


APC6NBC2:DctKill PROCEDURE
  CODE
  _Hide:Relate:AptoInSmdD.Kill
  DISPOSE(_Hide:Relate:AptoInSmdD)
  _Hide:Relate:AptoInSmdH.Kill
  DISPOSE(_Hide:Relate:AptoInSmdH)
  _Hide:Relate:IRK_PDPT.Kill
  DISPOSE(_Hide:Relate:IRK_PDPT)
  _Hide:Relate:RekJsaDr.Kill
  DISPOSE(_Hide:Relate:RekJsaDr)
  _Hide:Relate:ApDDProd.Kill
  DISPOSE(_Hide:Relate:ApDDProd)
  _Hide:Relate:GKStok.Kill
  DISPOSE(_Hide:Relate:GKStok)
  _Hide:Relate:RI_DSBBK.Kill
  DISPOSE(_Hide:Relate:RI_DSBBK)
  _Hide:Relate:GSaldoawal.Kill
  DISPOSE(_Hide:Relate:GSaldoawal)
  _Hide:Relate:GBrgDis.Kill
  DISPOSE(_Hide:Relate:GBrgDis)
  _Hide:Relate:RI_HSBBK.Kill
  DISPOSE(_Hide:Relate:RI_HSBBK)
  _Hide:Relate:IR_Bayi.Kill
  DISPOSE(_Hide:Relate:IR_Bayi)
  _Hide:Relate:FIFOOUT.Kill
  DISPOSE(_Hide:Relate:FIFOOUT)
  _Hide:Relate:FIFOIN.Kill
  DISPOSE(_Hide:Relate:FIFOIN)
  _Hide:Relate:ITr_Umka.Kill
  DISPOSE(_Hide:Relate:ITr_Umka)
  _Hide:Relate:ApInOutBln.Kill
  DISPOSE(_Hide:Relate:ApInOutBln)
  _Hide:Relate:IMJasa.Kill
  DISPOSE(_Hide:Relate:IMJasa)
  _Hide:Relate:ITrPsMan.Kill
  DISPOSE(_Hide:Relate:ITrPsMan)
  _Hide:Relate:RI_DTOAPTK.Kill
  DISPOSE(_Hide:Relate:RI_DTOAPTK)
  _Hide:Relate:ApDProd.Kill
  DISPOSE(_Hide:Relate:ApDProd)
  _Hide:Relate:ApHProd.Kill
  DISPOSE(_Hide:Relate:ApHProd)


Hide:Relate:AptoInSmdD.Init PROCEDURE
  CODE
  _Hide:Access:AptoInSmdD.Init
  SELF.Init(Access:AptoInSmdD,1)


Hide:Access:AptoInSmdD.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APTD1:Record
  SELF.FileNameValue = 'AptoInSmdD'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AptoInSmdD
  PARENT.Init
  Access:AptoInSmdD &= SELF


Hide:Access:AptoInSmdD.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AptoInSmdD &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AptoInSmdD.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AptoInSmdD,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APTD1:key_kd_brg,'APTD1:key_kd_brg',0)
    SELF.AddKey(APTD1:key_no_nota,'APTD1:key_no_nota',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AptoInSmdD.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:AptoInSmdH)

  SELF.AddRelation(Relate:GBarang)


Hide:Relate:AptoInSmdD.Kill PROCEDURE

  CODE
  _Hide:Access:AptoInSmdD.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:AptoInSmdD &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AptoInSmdD)                         ! destroy the file manager


Hide:Relate:AptoInSmdH.Init PROCEDURE
  CODE
  _Hide:Access:AptoInSmdH.Init
  SELF.Init(Access:AptoInSmdH,1)


Hide:Access:AptoInSmdH.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APTI1:Record
  SELF.FileNameValue = 'AptoInSmdH'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AptoInSmdH
  PARENT.Init
  Access:AptoInSmdH &= SELF


Hide:Access:AptoInSmdH.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AptoInSmdH &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AptoInSmdH.PrimeFields PROCEDURE

  CODE
  APTI1:Status = 0                                         ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:AptoInSmdH.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AptoInSmdH,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APTI1:key_no_tran,'APTI1:key_no_tran',0)
    SELF.AddKey(APTI1:key_apotik,'APTI1:key_apotik',0)
    SELF.AddKey(APTI1:key_tujuan,'APTI1:key_tujuan',0)
    SELF.AddKey(APTI1:key_tanggal,'tanggal transaksi',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:AptoInSmdH.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 8
    GlobalErrors.SetField('APTI1:Status')
    IF INSTRING(']' & APTI1:Status & '[', ']0[]1[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Keluar'',''Retur''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:AptoInSmdH.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:AptoInSmdD,RI:CASCADE,RI:RESTRICT,APTD1:key_no_nota)
  SELF.AddRelationLink(APTI1:N0_tran,APTD1:N0_tran)

  SELF.AddRelation(Relate:GApotik)

  SELF.AddRelation(Relate:TBinstli)


Hide:Relate:AptoInSmdH.Kill PROCEDURE

  CODE
  _Hide:Access:AptoInSmdH.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:AptoInSmdH &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AptoInSmdH)                         ! destroy the file manager


Hide:Relate:IRK_PDPT.Init PROCEDURE
  CODE
  _Hide:Access:IRK_PDPT.Init
  SELF.Init(Access:IRK_PDPT,1)


Hide:Access:IRK_PDPT.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IR_KP:Record
  SELF.FileNameValue = 'IRK_PDPT'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= IRK_PDPT
  PARENT.Init
  Access:IRK_PDPT &= SELF


Hide:Access:IRK_PDPT.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:IRK_PDPT &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:IRK_PDPT.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(IRK_PDPT,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(IR_KP:KMr_NoNota,'Primary isinya mr,urut, nota',0)
    SELF.AddKey(IR_KP:K_Mr,'IR_KP:K_Mr',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:IRK_PDPT.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:RI_HRInap)


Hide:Relate:IRK_PDPT.Kill PROCEDURE

  CODE
  _Hide:Access:IRK_PDPT.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:IRK_PDPT &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:IRK_PDPT)                           ! destroy the file manager


Hide:Relate:RekJsaDr.Init PROCEDURE
  CODE
  _Hide:Access:RekJsaDr.Init
  SELF.Init(Access:RekJsaDr,1)


Hide:Access:RekJsaDr.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= REK:Record
  SELF.FileNameValue = 'RekJsaDr'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RekJsaDr
  PARENT.Init
  Access:RekJsaDr &= SELF


Hide:Access:RekJsaDr.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RekJsaDr &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RekJsaDr.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RekJsaDr,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(REK:K1,'No mr tgl masuk, jam masuk kode jasa',0)
    SELF.AddKey(REK:KKodedr,'REK:KKodedr',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:RekJsaDr.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:RI_HRInap)

  SELF.AddRelation(Relate:JDokter)


Hide:Relate:RekJsaDr.Kill PROCEDURE

  CODE
  _Hide:Access:RekJsaDr.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:RekJsaDr &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RekJsaDr)                           ! destroy the file manager


Hide:Relate:ApDDProd.Init PROCEDURE
  CODE
  _Hide:Access:ApDDProd.Init
  SELF.Init(Access:ApDDProd,1)


Hide:Access:ApDDProd.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APDDP:Record
  SELF.FileNameValue = 'ApDDProd'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ApDDProd
  PARENT.Init
  Access:ApDDProd &= SELF


Hide:Access:ApDDProd.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ApDDProd &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ApDDProd.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ApDDProd,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APDDP:key_kd_brg,'APDDP:key_kd_brg',0)
    SELF.AddKey(APDDP:key_no_nota,'APDDP:key_no_nota',0)
    SELF.AddKey(APDDP:Key_Kode_asal,'APDDP:Key_Kode_asal',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ApDDProd.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:ApDProd)


Hide:Relate:ApDDProd.Kill PROCEDURE

  CODE
  _Hide:Access:ApDDProd.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:ApDDProd &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ApDDProd)                           ! destroy the file manager


Hide:Relate:GKStok.Init PROCEDURE
  CODE
  _Hide:Access:GKStok.Init
  SELF.Init(Access:GKStok,1)


Hide:Access:GKStok.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GKS:Record
  SELF.FileNameValue = 'GKStok'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GKStok
  PARENT.Init
  Access:GKStok &= SELF


Hide:Access:GKStok.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GKStok &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GKStok.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GKStok,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(GKS:PrimaryKey,'GKS:PrimaryKey',0)
    SELF.AddKey(GKS:UrutTanggal_Key,'GKS:UrutTanggal_Key',0)
    SELF.AddKey(GKS:BrgTglJamNoTrans_Key,'GKS:BrgTglJamNoTrans_Key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GKStok.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)


Hide:Relate:GKStok.Kill PROCEDURE

  CODE
  _Hide:Access:GKStok.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:GKStok &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GKStok)                             ! destroy the file manager


Hide:Relate:RI_DSBBK.Init PROCEDURE
  CODE
  _Hide:Access:RI_DSBBK.Init
  SELF.Init(Access:RI_DSBBK,1)


Hide:Access:RI_DSBBK.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RI_DSB:Record
  SELF.FileNameValue = 'RI_DSBBK'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RI_DSBBK
  PARENT.Init
  Access:RI_DSBBK &= SELF


Hide:Access:RI_DSBBK.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RI_DSBBK &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RI_DSBBK.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RI_DSBBK,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(RI_DSB:PrimaryKey,'RI_DSB:PrimaryKey',0)
    SELF.AddKey(RI_DSB:by_transaksi,'RI_DSB:by_transaksi',0)
    SELF.AddKey(RI_DSB:Barang_RI_DSBBK_FK,'RI_DSB:Barang_RI_DSBBK_FK',0)
    SELF.AddKey(RI_DSB:by_tran_cam,'index atas transaksi dan campur',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:RI_DSBBK.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:RI_HSBBK)


Hide:Relate:RI_DSBBK.Kill PROCEDURE

  CODE
  _Hide:Access:RI_DSBBK.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:RI_DSBBK &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RI_DSBBK)                           ! destroy the file manager


Hide:Relate:GSaldoawal.Init PROCEDURE
  CODE
  _Hide:Access:GSaldoawal.Init
  SELF.Init(Access:GSaldoawal,1)


Hide:Access:GSaldoawal.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GSA:Record
  SELF.FileNameValue = 'GSaldoawal'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GSaldoawal
  PARENT.Init
  Access:GSaldoawal &= SELF


Hide:Access:GSaldoawal.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GSaldoawal &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GSaldoawal.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GSaldoawal,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(GSA:PrimaryKey,'GSA:PrimaryKey',0)
    SELF.AddKey(GSA:gsawal_gbar_fk,'GSA:gsawal_gbar_fk',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GSaldoawal.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)


Hide:Relate:GSaldoawal.Kill PROCEDURE

  CODE
  _Hide:Access:GSaldoawal.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:GSaldoawal &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GSaldoawal)                         ! destroy the file manager


Hide:Relate:GBrgDis.Init PROCEDURE
  CODE
  _Hide:Access:GBrgDis.Init
  SELF.Init(Access:GBrgDis,1)


Hide:Access:GBrgDis.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GBR:Record
  SELF.FileNameValue = 'GBrgDis'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GBrgDis
  PARENT.Init
  Access:GBrgDis &= SELF


Hide:Access:GBrgDis.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GBrgDis &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GBrgDis.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GBrgDis,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(GBR:PK,'GBR:PK',1)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GBrgDis.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)


Hide:Relate:GBrgDis.Kill PROCEDURE

  CODE
  _Hide:Access:GBrgDis.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:GBrgDis &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GBrgDis)                            ! destroy the file manager


Hide:Relate:RI_HSBBK.Init PROCEDURE
  CODE
  _Hide:Access:RI_HSBBK.Init
  SELF.Init(Access:RI_HSBBK,1)


Hide:Access:RI_HSBBK.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RI_HSB:Record
  SELF.FileNameValue = 'RI_HSBBK'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RI_HSBBK
  PARENT.Init
  Access:RI_HSBBK &= SELF


Hide:Access:RI_HSBBK.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RI_HSBBK &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RI_HSBBK.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RI_HSBBK,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(RI_HSB:PrimaryKey,'RI_HSB:PrimaryKey',0)
    SELF.AddKey(RI_HSB:pasien_ri_hsbbk_fk,'RI_HSB:pasien_ri_hsbbk_fk',0)
    SELF.AddKey(RI_HSB:Instalasi_ri_hsbbk_fk,'RI_HSB:Instalasi_ri_hsbbk_fk',0)
    SELF.AddKey(RI_HSB:keytanggal,'RI_HSB:keytanggal',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:RI_HSBBK.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('Nomor Medical record pasien')
    IF NOT INRANGE(RI_HSB:Nomor_mr,0,99999999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'0 .. 99999999')
      END
    END
  OF 8
    GlobalErrors.SetField('RI_HSB:Batal')
    IF INSTRING(']' & RI_HSB:Batal & '[', ']1[]0[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Ya'',''Tidak''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:RI_HSBBK.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:TBinstli)

  SELF.AddRelation(Relate:JPasien)

  SELF.AddRelation(Relate:RI_DSBBK,RI:CASCADE,RI:RESTRICT,RI_DSB:PrimaryKey)
  SELF.AddRelationLink(RI_HSB:Nomor,RI_DSB:Nomor)


Hide:Relate:RI_HSBBK.Kill PROCEDURE

  CODE
  _Hide:Access:RI_HSBBK.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:RI_HSBBK &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RI_HSBBK)                           ! destroy the file manager


Hide:Relate:IR_Bayi.Init PROCEDURE
  CODE
  _Hide:Access:IR_Bayi.Init
  SELF.Init(Access:IR_Bayi,1)


Hide:Access:IR_Bayi.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IRB:Record
  SELF.FileNameValue = 'IR_Bayi'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= IR_Bayi
  PARENT.Init
  Access:IR_Bayi &= SELF


Hide:Access:IR_Bayi.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:IR_Bayi &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:IR_Bayi.PrimeFields PROCEDURE

  CODE
  IRB:Jam_Masuk = Clock()                                  ! Assign initial field value
  IRB:Tanggal_Masuk = Today()                              ! Assign initial field value
  IRB:Jam_Keluar = Clock()                                 ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:IR_Bayi.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(IR_Bayi,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(IRB:PrimaryKey,'IRB:PrimaryKey',0)
    SELF.AddKey(IRB:keymr_tgl,'IRB:keymr_tgl',0)
    SELF.AddKey(IRB:KeyTanggalMasuk,'IRB:KeyTanggalMasuk',0)
    SELF.AddKey(IRB:KeyKodeRuang,'IRB:KeyKodeRuang',0)
    SELF.AddKey(IRB:KeyNoMrRuang,'IRB:KeyNoMrRuang',0)
    SELF.AddKey(IRB:KeyNoMrSaja,'IRB:KeyNoMrSaja',0)
    SELF.AddKey(IRB:KeyNoMrStatus,'IRB:KeyNoMrStatus',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:IR_Bayi.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:RI_HRInap)


Hide:Relate:IR_Bayi.Kill PROCEDURE

  CODE
  _Hide:Access:IR_Bayi.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:IR_Bayi &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:IR_Bayi)                            ! destroy the file manager


Hide:Relate:FIFOOUT.Init PROCEDURE
  CODE
  _Hide:Access:FIFOOUT.Init
  SELF.Init(Access:FIFOOUT,1)


Hide:Access:FIFOOUT.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= FIF2:Record
  SELF.FileNameValue = 'FIFOOUT'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= FIFOOUT
  PARENT.Init
  Access:FIFOOUT &= SELF


Hide:Access:FIFOOUT.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:FIFOOUT &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:FIFOOUT.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(FIFOOUT,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(FIF2:KEY1,'FIF2:KEY1',0)
    SELF.AddKey(FIF2:FIFOIN_FIFOOUT_FK,'FIF2:FIFOIN_FIFOOUT_FK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:FIFOOUT.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:FIFOIN)


Hide:Relate:FIFOOUT.Kill PROCEDURE

  CODE
  _Hide:Access:FIFOOUT.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:FIFOOUT &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:FIFOOUT)                            ! destroy the file manager


Hide:Relate:FIFOIN.Init PROCEDURE
  CODE
  _Hide:Access:FIFOIN.Init
  SELF.Init(Access:FIFOIN,1)


Hide:Access:FIFOIN.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= FIF:Record
  SELF.FileNameValue = 'FIFOIN'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= FIFOIN
  PARENT.Init
  Access:FIFOIN &= SELF


Hide:Access:FIFOIN.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:FIFOIN &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:FIFOIN.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(FIFOIN,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(FIF:KEY1,'FIF:KEY1',0)
    SELF.AddKey(FIF:kodebrg_notrans_key,'FIF:kodebrg_notrans_key',0)
    SELF.AddKey(FIF:MataUang_FIFOIN_FK,'FIF:MataUang_FIFOIN_FK',0)
    SELF.AddKey(FIF:barang_FIFOIN_FK,'FIF:barang_FIFOIN_FK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:FIFOIN.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:FIFOOUT,RI:CASCADE,RI:RESTRICT,FIF2:KEY1)
  SELF.AddRelationLink(FIF:Kode_Barang,FIF2:Kode_Barang)
  SELF.AddRelationLink(FIF:Mata_Uang,FIF2:Mata_Uang)
  SELF.AddRelationLink(FIF:NoTransaksi,FIF2:NoTransaksi)
  SELF.AddRelationLink(FIF:Transaksi,FIF2:Transaksi)


Hide:Relate:FIFOIN.Kill PROCEDURE

  CODE
  _Hide:Access:FIFOIN.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:FIFOIN &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:FIFOIN)                             ! destroy the file manager


Hide:Relate:ITr_Umka.Init PROCEDURE
  CODE
  _Hide:Access:ITr_Umka.Init
  SELF.Init(Access:ITr_Umka,1)


Hide:Access:ITr_Umka.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Tr_Um:Record
  SELF.FileNameValue = 'ITr_Umka'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ITr_Umka
  PARENT.Init
  Access:ITr_Umka &= SELF


Hide:Access:ITr_Umka.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ITr_Umka &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ITr_Umka.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ITr_Umka,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Tr_Um:K_ruangan,'Tr_Um:K_ruangan',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ITr_Umka.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ITbrRwt)


Hide:Relate:ITr_Umka.Kill PROCEDURE

  CODE
  _Hide:Access:ITr_Umka.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:ITr_Umka &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ITr_Umka)                           ! destroy the file manager


Hide:Relate:ApInOutBln.Init PROCEDURE
  CODE
  _Hide:Access:ApInOutBln.Init
  SELF.Init(Access:ApInOutBln,1)


Hide:Access:ApInOutBln.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APIN:Record
  SELF.FileNameValue = 'ApInOutBln'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ApInOutBln
  PARENT.Init
  Access:ApInOutBln &= SELF


Hide:Access:ApInOutBln.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ApInOutBln &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ApInOutBln.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ApInOutBln,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APIN:PrimaryKey,'APIN:PrimaryKey',0)
    SELF.AddKey(APIN:Barang_Apinoutbln_fk,'APIN:Barang_Apinoutbln_fk',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ApInOutBln.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)


Hide:Relate:ApInOutBln.Kill PROCEDURE

  CODE
  _Hide:Access:ApInOutBln.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:ApInOutBln &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ApInOutBln)                         ! destroy the file manager


Hide:Relate:IMJasa.Init PROCEDURE
  CODE
  _Hide:Access:IMJasa.Init
  SELF.Init(Access:IMJasa,1)


Hide:Access:IMJasa.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IMJ:Record
  SELF.FileNameValue = 'IMJasa'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= IMJasa
  PARENT.Init
  Access:IMJasa &= SELF


Hide:Access:IMJasa.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:IMJasa &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:IMJasa.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(IMJasa,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(IMJ:KKode,'IMJ:KKode',0)
    SELF.AddKey(IMJ:KNama,'IMJ:KNama',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:IMJasa.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:RiTind,RI:CASCADE,RI:RESTRICT,Tind:KkodeJasa)
  SELF.AddRelationLink(IMJ:Kode,Tind:KodeJasa)

  SELF.AddRelation(Relate:RI_JasaRawat,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,RI_JA:K_kodeJasa)
  SELF.AddRelationLink(IMJ:Kode,RI_JA:Kode_Jasa)

  SELF.AddRelation(Relate:ITrPsMan,RI:CASCADE,RI:RESTRICT,ITRMn:K_kodeJasa)
  SELF.AddRelationLink(IMJ:Kode,ITRMn:Kode_Jasa)


Hide:Relate:IMJasa.Kill PROCEDURE

  CODE
  _Hide:Access:IMJasa.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:IMJasa &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:IMJasa)                             ! destroy the file manager


Hide:Relate:ITrPsMan.Init PROCEDURE
  CODE
  _Hide:Access:ITrPsMan.Init
  SELF.Init(Access:ITrPsMan,1)


Hide:Access:ITrPsMan.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ITRMn:Record
  SELF.FileNameValue = 'ITrPsMan'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ITrPsMan
  PARENT.Init
  Access:ITrPsMan &= SELF


Hide:Access:ITrPsMan.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ITrPsMan &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ITrPsMan.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ITrPsMan,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(ITRMn:K1,'Key dg nomor mr dan nomor urut kode jasa',0)
    SELF.AddKey(ITRMn:K_kodeJasa,'ITRMn:K_kodeJasa',0)
    SELF.AddKey(ITRMn:Kmr,'ITRMn:Kmr',0)
    SELF.AddKey(ITRMn:KMrUrutJasa,'ITRMn:KMrUrutJasa',0)
    SELF.AddKey(ITRMn:KMrUrutJasaKet,'ITRMn:KMrUrutJasaKet',0)
    SELF.AddKey(ITRMn:Kket,'ITRMn:Kket',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ITrPsMan.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:IMJasa)

  SELF.AddRelation(Relate:RI_HRInap)


Hide:Relate:ITrPsMan.Kill PROCEDURE

  CODE
  _Hide:Access:ITrPsMan.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:ITrPsMan &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ITrPsMan)                           ! destroy the file manager


Hide:Relate:RI_DTOAPTK.Init PROCEDURE
  CODE
  _Hide:Access:RI_DTOAPTK.Init
  SELF.Init(Access:RI_DTOAPTK,1)


Hide:Access:RI_DTOAPTK.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RIDTO:Record
  SELF.FileNameValue = 'RI_DTOAPTK'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RI_DTOAPTK
  PARENT.Init
  Access:RI_DTOAPTK &= SELF


Hide:Access:RI_DTOAPTK.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RI_DTOAPTK &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RI_DTOAPTK.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RI_DTOAPTK,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(RIDTO:key_kd_brg,'RIDTO:key_kd_brg',0)
    SELF.AddKey(RIDTO:key_no_nota,'RIDTO:key_no_nota',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:RI_DTOAPTK.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:RI_HToAptk)

  SELF.AddRelation(Relate:GBarang)


Hide:Relate:RI_DTOAPTK.Kill PROCEDURE

  CODE
  _Hide:Access:RI_DTOAPTK.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:RI_DTOAPTK &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RI_DTOAPTK)                         ! destroy the file manager


Hide:Relate:ApDProd.Init PROCEDURE
  CODE
  _Hide:Access:ApDProd.Init
  SELF.Init(Access:ApDProd,1)


Hide:Access:ApDProd.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APDP:Record
  SELF.FileNameValue = 'ApDProd'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ApDProd
  PARENT.Init
  Access:ApDProd &= SELF


Hide:Access:ApDProd.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ApDProd &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ApDProd.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ApDProd,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APDP:key_kd_brg,'APDP:key_kd_brg',0)
    SELF.AddKey(APDP:key_no_nota,'APDP:key_no_nota',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ApDProd.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ApHProd)

  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:ApDDProd,RI:CASCADE,RI:RESTRICT,APDDP:key_no_nota)
  SELF.AddRelationLink(APDP:N0_tran,APDDP:N0_tran)
  SELF.AddRelationLink(APDP:Kode_Brg,APDDP:Kode_Brg)


Hide:Relate:ApDProd.Kill PROCEDURE

  CODE
  _Hide:Access:ApDProd.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:ApDProd &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ApDProd)                            ! destroy the file manager


Hide:Relate:ApHProd.Init PROCEDURE
  CODE
  _Hide:Access:ApHProd.Init
  SELF.Init(Access:ApHProd,1)


Hide:Access:ApHProd.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APHP:Record
  SELF.FileNameValue = 'ApHProd'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ApHProd
  PARENT.Init
  Access:ApHProd &= SELF


Hide:Access:ApHProd.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ApHProd &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ApHProd.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ApHProd,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APHP:key_no_tran,'APHP:key_no_tran',0)
    SELF.AddKey(APHP:key_apotik,'APHP:key_apotik',0)
    SELF.AddKey(APHP:key_tujuan,'APHP:key_tujuan',0)
    SELF.AddKey(APHP:key_tanggal,'tanggal transaksi',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:ApHProd.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 6
    GlobalErrors.SetField('APHP:Jenis')
    IF INSTRING(']' & APHP:Jenis & '[', ']1[]2[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''OK'',''Batal''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:ApHProd.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ApDProd,RI:CASCADE,RI:RESTRICT,APDP:key_no_nota)
  SELF.AddRelationLink(APHP:N0_tran,APDP:N0_tran)

  SELF.AddRelation(Relate:GApotik)


Hide:Relate:ApHProd.Kill PROCEDURE

  CODE
  _Hide:Access:ApHProd.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:ApHProd &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ApHProd)                            ! destroy the file manager

