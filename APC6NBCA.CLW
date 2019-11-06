  MEMBER('apc6new.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
APC6NBCA:DctInit    PROCEDURE
APC6NBCA:DctKill    PROCEDURE
APC6NBCA:FilesInit  PROCEDURE
  END

Hide:Access:IAORDER  CLASS(FileManager),TYPE               ! FileManager for IAORDER
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:IAORDER  CLASS(RelationManager),TYPE           ! RelationManager for IAORDER
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:IDAOrder CLASS(FileManager),TYPE               ! FileManager for IDAOrder
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:IDAOrder CLASS(RelationManager),TYPE           ! RelationManager for IDAOrder
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ISetupAp CLASS(FileManager),TYPE               ! FileManager for ISetupAp
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ISetupAp CLASS(RelationManager),TYPE           ! RelationManager for ISetupAp
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JAnestesi CLASS(FileManager),TYPE              ! FileManager for JAnestesi
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JAnestesi CLASS(RelationManager),TYPE          ! RelationManager for JAnestesi
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:IDiagnosa CLASS(FileManager),TYPE              ! FileManager for IDiagnosa
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:IDiagnosa CLASS(RelationManager),TYPE          ! RelationManager for IDiagnosa
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:IAP_SET  CLASS(FileManager),TYPE               ! FileManager for IAP_SET
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:IAP_SET  CLASS(RelationManager),TYPE           ! RelationManager for IAP_SET
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GStockGdg CLASS(FileManager),TYPE              ! FileManager for GStockGdg
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GStockGdg CLASS(RelationManager),TYPE          ! RelationManager for GStockGdg
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JKelurahan CLASS(FileManager),TYPE             ! FileManager for JKelurahan
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JKelurahan CLASS(RelationManager),TYPE         ! RelationManager for JKelurahan
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GBAStock CLASS(FileManager),TYPE               ! FileManager for GBAStock
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GBAStock CLASS(RelationManager),TYPE           ! RelationManager for GBAStock
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GRekapBK CLASS(FileManager),TYPE               ! FileManager for GRekapBK
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GRekapBK CLASS(RelationManager),TYPE           ! RelationManager for GRekapBK
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GPBF     CLASS(FileManager),TYPE               ! FileManager for GPBF
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GPBF     CLASS(RelationManager),TYPE           ! RelationManager for GPBF
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GDBSBBK  CLASS(FileManager),TYPE               ! FileManager for GDBSBBK
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GDBSBBK  CLASS(RelationManager),TYPE           ! RelationManager for GDBSBBK
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GHSBBM   CLASS(FileManager),TYPE               ! FileManager for GHSBBM
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GHSBBM   CLASS(RelationManager),TYPE           ! RelationManager for GHSBBM
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GDSBBM   CLASS(FileManager),TYPE               ! FileManager for GDSBBM
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GDSBBM   CLASS(RelationManager),TYPE           ! RelationManager for GDSBBM
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DTabDoc  CLASS(FileManager),TYPE               ! FileManager for DTabDoc
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DTabDoc  CLASS(RelationManager),TYPE           ! RelationManager for DTabDoc
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GHBatal  CLASS(FileManager),TYPE               ! FileManager for GHBatal
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GHBatal  CLASS(RelationManager),TYPE           ! RelationManager for GHBatal
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JSUMDR   CLASS(FileManager),TYPE               ! FileManager for JSUMDR
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JSUMDR   CLASS(RelationManager),TYPE           ! RelationManager for JSUMDR
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GDBatal  CLASS(FileManager),TYPE               ! FileManager for GDBatal
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GDBatal  CLASS(RelationManager),TYPE           ! RelationManager for GDBatal
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GHSPB    CLASS(FileManager),TYPE               ! FileManager for GHSPB
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GHSPB    CLASS(RelationManager),TYPE           ! RelationManager for GHSPB
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GHBSBBK  CLASS(FileManager),TYPE               ! FileManager for GHBSBBK
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GHBSBBK  CLASS(RelationManager),TYPE           ! RelationManager for GHBSBBK
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END


_Hide:Access:IAORDER &Hide:Access:IAORDER,AUTO,THREAD
_Hide:Relate:IAORDER &Hide:Relate:IAORDER,AUTO,THREAD
_Hide:Access:IDAOrder &Hide:Access:IDAOrder,AUTO,THREAD
_Hide:Relate:IDAOrder &Hide:Relate:IDAOrder,AUTO,THREAD
_Hide:Access:ISetupAp &Hide:Access:ISetupAp,AUTO,THREAD
_Hide:Relate:ISetupAp &Hide:Relate:ISetupAp,AUTO,THREAD
_Hide:Access:JAnestesi &Hide:Access:JAnestesi,AUTO,THREAD
_Hide:Relate:JAnestesi &Hide:Relate:JAnestesi,AUTO,THREAD
_Hide:Access:IDiagnosa &Hide:Access:IDiagnosa,AUTO,THREAD
_Hide:Relate:IDiagnosa &Hide:Relate:IDiagnosa,AUTO,THREAD
_Hide:Access:IAP_SET &Hide:Access:IAP_SET,AUTO,THREAD
_Hide:Relate:IAP_SET &Hide:Relate:IAP_SET,AUTO,THREAD
_Hide:Access:GStockGdg &Hide:Access:GStockGdg,AUTO,THREAD
_Hide:Relate:GStockGdg &Hide:Relate:GStockGdg,AUTO,THREAD
_Hide:Access:JKelurahan &Hide:Access:JKelurahan,AUTO,THREAD
_Hide:Relate:JKelurahan &Hide:Relate:JKelurahan,AUTO,THREAD
_Hide:Access:GBAStock &Hide:Access:GBAStock,AUTO,THREAD
_Hide:Relate:GBAStock &Hide:Relate:GBAStock,AUTO,THREAD
_Hide:Access:GRekapBK &Hide:Access:GRekapBK,AUTO,THREAD
_Hide:Relate:GRekapBK &Hide:Relate:GRekapBK,AUTO,THREAD
_Hide:Access:GPBF    &Hide:Access:GPBF,AUTO,THREAD
_Hide:Relate:GPBF    &Hide:Relate:GPBF,AUTO,THREAD
_Hide:Access:GDBSBBK &Hide:Access:GDBSBBK,AUTO,THREAD
_Hide:Relate:GDBSBBK &Hide:Relate:GDBSBBK,AUTO,THREAD
_Hide:Access:GHSBBM  &Hide:Access:GHSBBM,AUTO,THREAD
_Hide:Relate:GHSBBM  &Hide:Relate:GHSBBM,AUTO,THREAD
_Hide:Access:GDSBBM  &Hide:Access:GDSBBM,AUTO,THREAD
_Hide:Relate:GDSBBM  &Hide:Relate:GDSBBM,AUTO,THREAD
_Hide:Access:DTabDoc &Hide:Access:DTabDoc,AUTO,THREAD
_Hide:Relate:DTabDoc &Hide:Relate:DTabDoc,AUTO,THREAD
_Hide:Access:GHBatal &Hide:Access:GHBatal,AUTO,THREAD
_Hide:Relate:GHBatal &Hide:Relate:GHBatal,AUTO,THREAD
_Hide:Access:JSUMDR  &Hide:Access:JSUMDR,AUTO,THREAD
_Hide:Relate:JSUMDR  &Hide:Relate:JSUMDR,AUTO,THREAD
_Hide:Access:GDBatal &Hide:Access:GDBatal,AUTO,THREAD
_Hide:Relate:GDBatal &Hide:Relate:GDBatal,AUTO,THREAD
_Hide:Access:GHSPB   &Hide:Access:GHSPB,AUTO,THREAD
_Hide:Relate:GHSPB   &Hide:Relate:GHSPB,AUTO,THREAD
_Hide:Access:GHBSBBK &Hide:Access:GHBSBBK,AUTO,THREAD
_Hide:Relate:GHBSBBK &Hide:Relate:GHBSBBK,AUTO,THREAD


APC6NBCA:DctInit PROCEDURE
  CODE
  _Hide:Access:IAORDER &= NEW(Hide:Access:IAORDER)
  _Hide:Relate:IAORDER &= NEW(Hide:Relate:IAORDER)
  _Hide:Access:IDAOrder &= NEW(Hide:Access:IDAOrder)
  _Hide:Relate:IDAOrder &= NEW(Hide:Relate:IDAOrder)
  _Hide:Access:ISetupAp &= NEW(Hide:Access:ISetupAp)
  _Hide:Relate:ISetupAp &= NEW(Hide:Relate:ISetupAp)
  _Hide:Access:JAnestesi &= NEW(Hide:Access:JAnestesi)
  _Hide:Relate:JAnestesi &= NEW(Hide:Relate:JAnestesi)
  _Hide:Access:IDiagnosa &= NEW(Hide:Access:IDiagnosa)
  _Hide:Relate:IDiagnosa &= NEW(Hide:Relate:IDiagnosa)
  _Hide:Access:IAP_SET &= NEW(Hide:Access:IAP_SET)
  _Hide:Relate:IAP_SET &= NEW(Hide:Relate:IAP_SET)
  _Hide:Access:GStockGdg &= NEW(Hide:Access:GStockGdg)
  _Hide:Relate:GStockGdg &= NEW(Hide:Relate:GStockGdg)
  _Hide:Access:JKelurahan &= NEW(Hide:Access:JKelurahan)
  _Hide:Relate:JKelurahan &= NEW(Hide:Relate:JKelurahan)
  _Hide:Access:GBAStock &= NEW(Hide:Access:GBAStock)
  _Hide:Relate:GBAStock &= NEW(Hide:Relate:GBAStock)
  _Hide:Access:GRekapBK &= NEW(Hide:Access:GRekapBK)
  _Hide:Relate:GRekapBK &= NEW(Hide:Relate:GRekapBK)
  _Hide:Access:GPBF &= NEW(Hide:Access:GPBF)
  _Hide:Relate:GPBF &= NEW(Hide:Relate:GPBF)
  _Hide:Access:GDBSBBK &= NEW(Hide:Access:GDBSBBK)
  _Hide:Relate:GDBSBBK &= NEW(Hide:Relate:GDBSBBK)
  _Hide:Access:GHSBBM &= NEW(Hide:Access:GHSBBM)
  _Hide:Relate:GHSBBM &= NEW(Hide:Relate:GHSBBM)
  _Hide:Access:GDSBBM &= NEW(Hide:Access:GDSBBM)
  _Hide:Relate:GDSBBM &= NEW(Hide:Relate:GDSBBM)
  _Hide:Access:DTabDoc &= NEW(Hide:Access:DTabDoc)
  _Hide:Relate:DTabDoc &= NEW(Hide:Relate:DTabDoc)
  _Hide:Access:GHBatal &= NEW(Hide:Access:GHBatal)
  _Hide:Relate:GHBatal &= NEW(Hide:Relate:GHBatal)
  _Hide:Access:JSUMDR &= NEW(Hide:Access:JSUMDR)
  _Hide:Relate:JSUMDR &= NEW(Hide:Relate:JSUMDR)
  _Hide:Access:GDBatal &= NEW(Hide:Access:GDBatal)
  _Hide:Relate:GDBatal &= NEW(Hide:Relate:GDBatal)
  _Hide:Access:GHSPB &= NEW(Hide:Access:GHSPB)
  _Hide:Relate:GHSPB &= NEW(Hide:Relate:GHSPB)
  _Hide:Access:GHBSBBK &= NEW(Hide:Access:GHBSBBK)
  _Hide:Relate:GHBSBBK &= NEW(Hide:Relate:GHBSBBK)
  Relate:IAORDER &= _Hide:Relate:IAORDER
  Relate:IDAOrder &= _Hide:Relate:IDAOrder
  Relate:ISetupAp &= _Hide:Relate:ISetupAp
  Relate:JAnestesi &= _Hide:Relate:JAnestesi
  Relate:IDiagnosa &= _Hide:Relate:IDiagnosa
  Relate:IAP_SET &= _Hide:Relate:IAP_SET
  Relate:GStockGdg &= _Hide:Relate:GStockGdg
  Relate:JKelurahan &= _Hide:Relate:JKelurahan
  Relate:GBAStock &= _Hide:Relate:GBAStock
  Relate:GRekapBK &= _Hide:Relate:GRekapBK
  Relate:GPBF &= _Hide:Relate:GPBF
  Relate:GDBSBBK &= _Hide:Relate:GDBSBBK
  Relate:GHSBBM &= _Hide:Relate:GHSBBM
  Relate:GDSBBM &= _Hide:Relate:GDSBBM
  Relate:DTabDoc &= _Hide:Relate:DTabDoc
  Relate:GHBatal &= _Hide:Relate:GHBatal
  Relate:JSUMDR &= _Hide:Relate:JSUMDR
  Relate:GDBatal &= _Hide:Relate:GDBatal
  Relate:GHSPB &= _Hide:Relate:GHSPB
  Relate:GHBSBBK &= _Hide:Relate:GHBSBBK


APC6NBCA:FilesInit PROCEDURE
  CODE
  _Hide:Relate:IAORDER.Init
  _Hide:Relate:IDAOrder.Init
  _Hide:Relate:ISetupAp.Init
  _Hide:Relate:JAnestesi.Init
  _Hide:Relate:IDiagnosa.Init
  _Hide:Relate:IAP_SET.Init
  _Hide:Relate:GStockGdg.Init
  _Hide:Relate:JKelurahan.Init
  _Hide:Relate:GBAStock.Init
  _Hide:Relate:GRekapBK.Init
  _Hide:Relate:GPBF.Init
  _Hide:Relate:GDBSBBK.Init
  _Hide:Relate:GHSBBM.Init
  _Hide:Relate:GDSBBM.Init
  _Hide:Relate:DTabDoc.Init
  _Hide:Relate:GHBatal.Init
  _Hide:Relate:JSUMDR.Init
  _Hide:Relate:GDBatal.Init
  _Hide:Relate:GHSPB.Init
  _Hide:Relate:GHBSBBK.Init


APC6NBCA:DctKill PROCEDURE
  CODE
  _Hide:Relate:IAORDER.Kill
  DISPOSE(_Hide:Relate:IAORDER)
  _Hide:Relate:IDAOrder.Kill
  DISPOSE(_Hide:Relate:IDAOrder)
  _Hide:Relate:ISetupAp.Kill
  DISPOSE(_Hide:Relate:ISetupAp)
  _Hide:Relate:JAnestesi.Kill
  DISPOSE(_Hide:Relate:JAnestesi)
  _Hide:Relate:IDiagnosa.Kill
  DISPOSE(_Hide:Relate:IDiagnosa)
  _Hide:Relate:IAP_SET.Kill
  DISPOSE(_Hide:Relate:IAP_SET)
  _Hide:Relate:GStockGdg.Kill
  DISPOSE(_Hide:Relate:GStockGdg)
  _Hide:Relate:JKelurahan.Kill
  DISPOSE(_Hide:Relate:JKelurahan)
  _Hide:Relate:GBAStock.Kill
  DISPOSE(_Hide:Relate:GBAStock)
  _Hide:Relate:GRekapBK.Kill
  DISPOSE(_Hide:Relate:GRekapBK)
  _Hide:Relate:GPBF.Kill
  DISPOSE(_Hide:Relate:GPBF)
  _Hide:Relate:GDBSBBK.Kill
  DISPOSE(_Hide:Relate:GDBSBBK)
  _Hide:Relate:GHSBBM.Kill
  DISPOSE(_Hide:Relate:GHSBBM)
  _Hide:Relate:GDSBBM.Kill
  DISPOSE(_Hide:Relate:GDSBBM)
  _Hide:Relate:DTabDoc.Kill
  DISPOSE(_Hide:Relate:DTabDoc)
  _Hide:Relate:GHBatal.Kill
  DISPOSE(_Hide:Relate:GHBatal)
  _Hide:Relate:JSUMDR.Kill
  DISPOSE(_Hide:Relate:JSUMDR)
  _Hide:Relate:GDBatal.Kill
  DISPOSE(_Hide:Relate:GDBatal)
  _Hide:Relate:GHSPB.Kill
  DISPOSE(_Hide:Relate:GHSPB)
  _Hide:Relate:GHBSBBK.Kill
  DISPOSE(_Hide:Relate:GHBSBBK)


Hide:Relate:IAORDER.Init PROCEDURE
  CODE
  _Hide:Access:IAORDER.Init
  SELF.Init(Access:IAORDER,1)


Hide:Access:IAORDER.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IAOR:Record
  SELF.FileNameValue = 'IAORDER'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= IAORDER
  PARENT.Init
  Access:IAORDER &= SELF


Hide:Access:IAORDER.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:IAORDER &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:IAORDER.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(IAORDER,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(IAOR:keyno_order,'nomor order',0)
    SELF.AddKey(IAOR:key_nomorRM,'IAOR:key_nomorRM',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:IAORDER.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:IPasien)

  SELF.AddRelation(Relate:IDAOrder,RI:CASCADE,RI:CASCADE,IDAO:keyorder)
  SELF.AddRelationLink(IAOR:ORDER,IDAO:ORDER)


Hide:Relate:IAORDER.Kill PROCEDURE

  CODE
  _Hide:Access:IAORDER.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:IAORDER &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:IAORDER)                            ! destroy the file manager


Hide:Relate:IDAOrder.Init PROCEDURE
  CODE
  _Hide:Access:IDAOrder.Init
  SELF.Init(Access:IDAOrder,1)


Hide:Access:IDAOrder.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IDAO:Record
  SELF.FileNameValue = 'IDAOrder'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= IDAOrder
  PARENT.Init
  Access:IDAOrder &= SELF


Hide:Access:IDAOrder.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:IDAOrder &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:IDAOrder.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(IDAOrder,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(IDAO:keyorder,'IDAO:keyorder',0)
    SELF.AddKey(IDAO:key_kodeobat,'IDAO:key_kodeobat',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:IDAOrder.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:IAORDER)


Hide:Relate:IDAOrder.Kill PROCEDURE

  CODE
  _Hide:Access:IDAOrder.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:IDAOrder &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:IDAOrder)                           ! destroy the file manager


Hide:Relate:ISetupAp.Init PROCEDURE
  CODE
  _Hide:Access:ISetupAp.Init
  SELF.Init(Access:ISetupAp,1)


Hide:Access:ISetupAp.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ISET:Record
  SELF.FileNameValue = 'ISetupAp'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ISetupAp
  PARENT.Init
  Access:ISetupAp &= SELF


Hide:Access:ISetupAp.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ISetupAp &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ISetupAp.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ISetupAp,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(ISET:by_deskripsi,'ISET:by_deskripsi',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ISetupAp.Kill PROCEDURE

  CODE
  _Hide:Access:ISetupAp.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:ISetupAp &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ISetupAp)                           ! destroy the file manager


Hide:Relate:JAnestesi.Init PROCEDURE
  CODE
  _Hide:Access:JAnestesi.Init
  SELF.Init(Access:JAnestesi,1)


Hide:Access:JAnestesi.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JANE:Record
  SELF.FileNameValue = 'JAnestesi'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JAnestesi
  PARENT.Init
  Access:JAnestesi &= SELF


Hide:Access:JAnestesi.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JAnestesi &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JAnestesi.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JAnestesi,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JANE:KeyKodeAnestesi,'JANE:KeyKodeAnestesi',0)
    SELF.AddKey(JANE:KeyNamaAnestesi,'JANE:KeyNamaAnestesi',0)
    SELF.AddKey(JANE:KeyStatus,'JANE:KeyStatus',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JAnestesi.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JTPasien,RI:CASCADE,RI:RESTRICT,JTPA:KeyAnestesi)
  SELF.AddRelationLink(JANE:KodeAnestesi,JTPA:Anestesi)


Hide:Relate:JAnestesi.Kill PROCEDURE

  CODE
  _Hide:Access:JAnestesi.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:JAnestesi &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JAnestesi)                          ! destroy the file manager


Hide:Relate:IDiagnosa.Init PROCEDURE
  CODE
  _Hide:Access:IDiagnosa.Init
  SELF.Init(Access:IDiagnosa,1)


Hide:Access:IDiagnosa.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IDIA:Record
  SELF.FileNameValue = 'IDiagnosa'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= IDiagnosa
  PARENT.Init
  Access:IDiagnosa &= SELF


Hide:Access:IDiagnosa.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:IDiagnosa &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:IDiagnosa.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(IDiagnosa,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(IDIA:KeyNomorMR,'IDIA:KeyNomorMR',0)
    SELF.AddKey(IDIA:KeyNoMRSaja,'IDIA:KeyNoMRSaja',0)
    SELF.AddKey(IDIA:KeyTanggal,'IDIA:KeyTanggal',0)
    SELF.AddKey(IDIA:KeyDiagnosa,'IDIA:KeyDiagnosa',0)
    SELF.AddKey(IDIA:KeyDokter,'IDIA:KeyDokter',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:IDiagnosa.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JPasien)

  SELF.AddRelation(Relate:IPasPul)

  SELF.AddRelation(Relate:ILIST)

  SELF.AddRelation(Relate:JDokter)

  SELF.AddRelation(Relate:TBDiagnosa)

  SELF.AddRelation(Relate:IPasien)


Hide:Relate:IDiagnosa.Kill PROCEDURE

  CODE
  _Hide:Access:IDiagnosa.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:IDiagnosa &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:IDiagnosa)                          ! destroy the file manager


Hide:Relate:IAP_SET.Init PROCEDURE
  CODE
  _Hide:Access:IAP_SET.Init
  SELF.Init(Access:IAP_SET,1)


Hide:Access:IAP_SET.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IAPS:Record
  SELF.FileNameValue = 'IAP_SET'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= IAP_SET
  PARENT.Init
  Access:IAP_SET &= SELF


Hide:Access:IAP_SET.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:IAP_SET &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:IAP_SET.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(IAP_SET,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(IAPS:BYPATOKAN,'IAPS:BYPATOKAN',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:IAP_SET.Kill PROCEDURE

  CODE
  _Hide:Access:IAP_SET.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:IAP_SET &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:IAP_SET)                            ! destroy the file manager


Hide:Relate:GStockGdg.Init PROCEDURE
  CODE
  _Hide:Access:GStockGdg.Init
  SELF.Init(Access:GStockGdg,1)


Hide:Access:GStockGdg.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GSGD:Record
  SELF.FileNameValue = 'GStockGdg'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GStockGdg
  PARENT.Init
  Access:GStockGdg &= SELF


Hide:Access:GStockGdg.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GStockGdg &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GStockGdg.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GStockGdg,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GSGD:KeyKodeBrg,'Kode Barang',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GStockGdg.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:GDBatal,RI:CASCADE,RI:None,GDBTL:KeyKodeBarang)
  SELF.AddRelationLink(GSGD:Kode_brg,GDBTL:KodeBarang)


Hide:Relate:GStockGdg.Kill PROCEDURE

  CODE
  _Hide:Access:GStockGdg.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:GStockGdg &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GStockGdg)                          ! destroy the file manager


Hide:Relate:JKelurahan.Init PROCEDURE
  CODE
  _Hide:Access:JKelurahan.Init
  SELF.Init(Access:JKelurahan,1)


Hide:Access:JKelurahan.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JKel:Record
  SELF.FileNameValue = 'JKelurahan'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JKelurahan
  PARENT.Init
  Access:JKelurahan &= SELF


Hide:Access:JKelurahan.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JKelurahan &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JKelurahan.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JKelurahan,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JKel:Kelurahan_PK,'JKel:Kelurahan_PK',0)
    SELF.AddKey(JKel:KeyKecamatan,'JKel:KeyKecamatan',0)
    SELF.AddKey(JKel:KeyKota,'JKel:KeyKota',0)
    SELF.AddKey(JKel:Kelurahan_Only_Key,'JKel:Kelurahan_Only_Key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JKelurahan.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JKecamatan)


Hide:Relate:JKelurahan.Kill PROCEDURE

  CODE
  _Hide:Access:JKelurahan.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:JKelurahan &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JKelurahan)                         ! destroy the file manager


Hide:Relate:GBAStock.Init PROCEDURE
  CODE
  _Hide:Access:GBAStock.Init
  SELF.Init(Access:GBAStock,1)


Hide:Access:GBAStock.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GBAS:Record
  SELF.FileNameValue = 'GBAStock'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GBAStock
  PARENT.Init
  Access:GBAStock &= SELF


Hide:Access:GBAStock.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GBAStock &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GBAStock.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GBAStock,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GBAS:KeyKodeBrg,'GBAS:KeyKodeBrg',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GBAStock.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)


Hide:Relate:GBAStock.Kill PROCEDURE

  CODE
  _Hide:Access:GBAStock.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:GBAStock &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GBAStock)                           ! destroy the file manager


Hide:Relate:GRekapBK.Init PROCEDURE
  CODE
  _Hide:Access:GRekapBK.Init
  SELF.Init(Access:GRekapBK,1)


Hide:Access:GRekapBK.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GREK:Record
  SELF.FileNameValue = 'GRekapBK'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GRekapBK
  PARENT.Init
  Access:GRekapBK &= SELF


Hide:Access:GRekapBK.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GRekapBK &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GRekapBK.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GRekapBK,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GREK:KeyKodeBrg,'GREK:KeyKodeBrg',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GRekapBK.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)


Hide:Relate:GRekapBK.Kill PROCEDURE

  CODE
  _Hide:Access:GRekapBK.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:GRekapBK &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GRekapBK)                           ! destroy the file manager


Hide:Relate:GPBF.Init PROCEDURE
  CODE
  _Hide:Access:GPBF.Init
  SELF.Init(Access:GPBF,1)


Hide:Access:GPBF.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GPBF:Record
  SELF.FileNameValue = 'GPBF'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GPBF
  PARENT.Init
  Access:GPBF &= SELF


Hide:Access:GPBF.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GPBF &= NULL                                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GPBF.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GPBF,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GPBF:KeyKodePBF,'Kode PBF',0)
    SELF.AddKey(GPBF:KeyNamaPBF,'Nama PBF',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GPBF.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang,RI:CASCADE,RI:RESTRICT,GBAR:KeyKodeUPF)
  SELF.AddRelationLink(GPBF:KODE_PBF,GBAR:Kode_UPF)

  SELF.AddRelation(Relate:GHSPB,RI:CASCADE,RI:RESTRICT,GHSPB:KeyPBF)
  SELF.AddRelationLink(GPBF:KODE_PBF,GHSPB:KodePBF)

  SELF.AddRelation(Relate:GHSBBM,RI:CASCADE,RI:None,GHSBM:KeyKodePBF)
  SELF.AddRelationLink(GPBF:KODE_PBF,GHSBM:KodePBF)

  SELF.AddRelation(Relate:GHBatal,RI:CASCADE,RI:RESTRICT,GHBTL:KeyKodePBF)
  SELF.AddRelationLink(GPBF:KODE_PBF,GHBTL:KodePBF)


Hide:Relate:GPBF.Kill PROCEDURE

  CODE
  _Hide:Access:GPBF.Kill                                   ! Kill the file manager
  PARENT.Kill
  Relate:GPBF &= NULL                                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GPBF)                               ! destroy the file manager


Hide:Relate:GDBSBBK.Init PROCEDURE
  CODE
  _Hide:Access:GDBSBBK.Init
  SELF.Init(Access:GDBSBBK,1)


Hide:Access:GDBSBBK.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GDBSB:Record
  SELF.FileNameValue = 'GDBSBBK'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GDBSBBK
  PARENT.Init
  Access:GDBSBBK &= SELF


Hide:Access:GDBSBBK.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GDBSBBK &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GDBSBBK.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GDBSBBK,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GDBSB:KeyNoBSBBKItem,'SBBK',0)
    SELF.AddKey(GDBSB:KeyNoBSBBK,'GDBSB:KeyNoBSBBK',0)
    SELF.AddKey(GDBSB:KeyBarang,'Barang',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GDBSBBK.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GHBSBBK)

  SELF.AddRelation(Relate:GBarang)


Hide:Relate:GDBSBBK.Kill PROCEDURE

  CODE
  _Hide:Access:GDBSBBK.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:GDBSBBK &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GDBSBBK)                            ! destroy the file manager


Hide:Relate:GHSBBM.Init PROCEDURE
  CODE
  _Hide:Access:GHSBBM.Init
  SELF.Init(Access:GHSBBM,1)


Hide:Access:GHSBBM.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GHSBM:Record
  SELF.FileNameValue = 'GHSBBM'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GHSBBM
  PARENT.Init
  Access:GHSBBM &= SELF


Hide:Access:GHSBBM.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GHSBBM &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GHSBBM.PrimeFields PROCEDURE

  CODE
  GHSBM:TglSBBM = Today()                                  ! Assign initial field value
  GHSBM:TglFaktur = Today()                                ! Assign initial field value
  GHSBM:TglJatuhTempo = Today()                            ! Assign initial field value
  GHSBM:Printed = 0                                        ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:GHSBBM.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GHSBBM,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GHSBM:KeyNoSBBM,'No SBBM',0)
    SELF.AddKey(GHSBM:KeyKodePBF,'Kode PBF',0)
    SELF.AddKey(GHSBM:KeyNoSPB,'Np SPB',0)
    SELF.AddKey(GHSBM:KeyNoFaktur,'GHSBM:KeyNoFaktur',0)
    SELF.AddKey(GHSBM:KeyTglSBBM,'GHSBM:KeyTglSBBM',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GHSBBM.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GHSPB)

  SELF.AddRelation(Relate:GHBatal,RI:None,RI:None,GHBTL:KeyNoSBBM)
  SELF.AddRelationLink(GHSBM:NoSBBM,GHBTL:NoSBBM)

  SELF.AddRelation(Relate:GPBF)

  SELF.AddRelation(Relate:GDSBBM,RI:CASCADE,RI:RESTRICT,GDSBM:KeyNoSBBM)
  SELF.AddRelationLink(GHSBM:NoSBBM,GDSBM:NoSBBM)


Hide:Relate:GHSBBM.Kill PROCEDURE

  CODE
  _Hide:Access:GHSBBM.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:GHSBBM &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GHSBBM)                             ! destroy the file manager


Hide:Relate:GDSBBM.Init PROCEDURE
  CODE
  _Hide:Access:GDSBBM.Init
  SELF.Init(Access:GDSBBM,1)


Hide:Access:GDSBBM.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GDSBM:Record
  SELF.FileNameValue = 'GDSBBM'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GDSBBM
  PARENT.Init
  Access:GDSBBM &= SELF


Hide:Access:GDSBBM.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GDSBBM &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GDSBBM.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GDSBBM,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GDSBM:KeyNoSBBMKodeBrg,'GDSBM:KeyNoSBBMKodeBrg',0)
    SELF.AddKey(GDSBM:KeyNoSBBM,'No SBBM',0)
    SELF.AddKey(GDSBM:KeyKodeBarang,'Kode Barang',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:GDSBBM.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 8
    GlobalErrors.SetField('GDSBM:Jenis_PPn')
    IF INSTRING(']' & GDSBM:Jenis_PPn & '[', ']1[]2[]3[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Include'',''Exclude'',''Non''')
      END
    END
  OF 11
    GlobalErrors.SetField('GDSBM:statusDisc')
    IF INSTRING(']' & GDSBM:statusDisc & '[', ']1[]2[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''SebelumPPn'',''SesudahPPn''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:GDSBBM.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:GHSBBM)


Hide:Relate:GDSBBM.Kill PROCEDURE

  CODE
  _Hide:Access:GDSBBM.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:GDSBBM &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GDSBBM)                             ! destroy the file manager


Hide:Relate:DTabDoc.Init PROCEDURE
  CODE
  _Hide:Access:DTabDoc.Init
  SELF.Init(Access:DTabDoc,1)


Hide:Access:DTabDoc.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DTDK:Record
  SELF.FileNameValue = 'DTabDoc'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DTabDoc
  PARENT.Init
  Access:DTabDoc &= SELF


Hide:Access:DTabDoc.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DTabDoc &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DTabDoc.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DTabDoc,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DTDK:KeyNIP,'DTDK:KeyNIP',0)
    SELF.AddKey(DTDK:KeyNama,'DTDK:KeyNama',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DTabDoc.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DHPasOp,RI:CASCADE,RI:None,DHPA:key:KodeDoc)
  SELF.AddRelationLink(DTDK:NIP,DHPA:Dokter_OP)

  SELF.AddRelation(Relate:JDokter)


Hide:Relate:DTabDoc.Kill PROCEDURE

  CODE
  _Hide:Access:DTabDoc.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:DTabDoc &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DTabDoc)                            ! destroy the file manager


Hide:Relate:GHBatal.Init PROCEDURE
  CODE
  _Hide:Access:GHBatal.Init
  SELF.Init(Access:GHBatal,1)


Hide:Access:GHBatal.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GHBTL:Record
  SELF.FileNameValue = 'GHBatal'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GHBatal
  PARENT.Init
  Access:GHBatal &= SELF


Hide:Access:GHBatal.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GHBatal &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GHBatal.PrimeFields PROCEDURE

  CODE
  GHBTL:TglBatal = today()                                 ! Assign initial field value
  GHBTL:Printed = 0                                        ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:GHBatal.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GHBatal,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GHBTL:KeyNoBatal,'NoBatal',0)
    SELF.AddKey(GHBTL:KeyNoSBBM,'No SBBM',0)
    SELF.AddKey(GHBTL:KeyKodePBF,'Kode PBF',0)
    SELF.AddKey(GHBTL:KeyTglBatal,'GHBTL:KeyTglBatal',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GHBatal.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GHSBBM)

  SELF.AddRelation(Relate:GPBF)

  SELF.AddRelation(Relate:GDBatal,RI:CASCADE,RI:RESTRICT,GDBTL:KeyNoBatal)
  SELF.AddRelationLink(GHBTL:NoBatal,GDBTL:NoBatal)


Hide:Relate:GHBatal.Kill PROCEDURE

  CODE
  _Hide:Access:GHBatal.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:GHBatal &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GHBatal)                            ! destroy the file manager


Hide:Relate:JSUMDR.Init PROCEDURE
  CODE
  _Hide:Access:JSUMDR.Init
  SELF.Init(Access:JSUMDR,1)


Hide:Access:JSUMDR.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JSU:Record
  SELF.FileNameValue = 'JSUMDR'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JSUMDR
  PARENT.Init
  Access:JSUMDR &= SELF


Hide:Access:JSUMDR.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JSUMDR &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JSUMDR.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JSUMDR,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JSU:kuser,'JSU:kuser',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JSUMDR.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JDokter,RI:None,RI:None,JDok:Kstatusmitra)
  SELF.AddRelationLink(JSU:Statusmitra,JDok:status_mitra_pengantar)


Hide:Relate:JSUMDR.Kill PROCEDURE

  CODE
  _Hide:Access:JSUMDR.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:JSUMDR &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JSUMDR)                             ! destroy the file manager


Hide:Relate:GDBatal.Init PROCEDURE
  CODE
  _Hide:Access:GDBatal.Init
  SELF.Init(Access:GDBatal,1)


Hide:Access:GDBatal.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GDBTL:Record
  SELF.FileNameValue = 'GDBatal'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GDBatal
  PARENT.Init
  Access:GDBatal &= SELF


Hide:Access:GDBatal.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GDBatal &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GDBatal.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GDBatal,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GDBTL:KeyNoBatalKodeBrg,'GDBTL:KeyNoBatalKodeBrg',0)
    SELF.AddKey(GDBTL:KeyNoBatal,'No Batal',0)
    SELF.AddKey(GDBTL:KeyKodeBarang,'Kode Barang',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:GDBatal.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 10
    GlobalErrors.SetField('GDBTL:Jenis_PPn')
    IF INSTRING(']' & GDBTL:Jenis_PPn & '[', ']1[]2[]3[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Include'',''exclude'',''Non''')
      END
    END
  OF 12
    GlobalErrors.SetField('GDBTL:status_disc')
    IF INSTRING(']' & GDBTL:status_disc & '[', ']1[]2[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''SebelumPPn'',''SetelahPPn''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:GDBatal.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GHBatal)

  SELF.AddRelation(Relate:GStockGdg)


Hide:Relate:GDBatal.Kill PROCEDURE

  CODE
  _Hide:Access:GDBatal.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:GDBatal &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GDBatal)                            ! destroy the file manager


Hide:Relate:GHSPB.Init PROCEDURE
  CODE
  _Hide:Access:GHSPB.Init
  SELF.Init(Access:GHSPB,1)


Hide:Access:GHSPB.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GHSPB:Record
  SELF.FileNameValue = 'GHSPB'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GHSPB
  PARENT.Init
  Access:GHSPB &= SELF


Hide:Access:GHSPB.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GHSPB &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GHSPB.PrimeFields PROCEDURE

  CODE
  GHSPB:STATUS = 'Belum di Acc'                            ! Assign initial field value
  GHSPB:JenisPPn = 'Exclude'                               ! Assign initial field value
  GHSPB:StatusPembayaran = 'Kredit'                        ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:GHSPB.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GHSPB,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GHSPB:KeyNoSPB,'No SPB',0)
    SELF.AddKey(GHSPB:KeyTanggal,'GHSPB:KeyTanggal',0)
    SELF.AddKey(GHSPB:KeyNoSPBBalik,'GHSPB:KeyNoSPBBalik',0)
    SELF.AddKey(GHSPB:KeyPBF,'PBF',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:GHSPB.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 16
    GlobalErrors.SetField('GHSPB:StatusNum')
    IF INSTRING(']' & GHSPB:StatusNum & '[', ']1[]2[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Acc'',''Blm_Acc''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:GHSPB.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GHSBBM,RI:CASCADE,RI:None,GHSBM:KeyNoSPB)
  SELF.AddRelationLink(GHSPB:NoSPB,GHSBM:NoSPB)

  SELF.AddRelation(Relate:GPBF)

  SELF.AddRelation(Relate:GDSPB,RI:CASCADE,RI:RESTRICT,GDSPB:PrimaryKey)
  SELF.AddRelationLink(GHSPB:NoSPB,GDSPB:NoSPB)


Hide:Relate:GHSPB.Kill PROCEDURE

  CODE
  _Hide:Access:GHSPB.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:GHSPB &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GHSPB)                              ! destroy the file manager


Hide:Relate:GHBSBBK.Init PROCEDURE
  CODE
  _Hide:Access:GHBSBBK.Init
  SELF.Init(Access:GHBSBBK,1)


Hide:Access:GHBSBBK.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GHBSB:Record
  SELF.FileNameValue = 'GHBSBBK'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GHBSBBK
  PARENT.Init
  Access:GHBSBBK &= SELF


Hide:Access:GHBSBBK.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GHBSBBK &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GHBSBBK.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GHBSBBK,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GHBSB:KeyNoBSBBK,'No SBBK',0)
    SELF.AddKey(GHBSB:KeyTanggal,'GHBSB:KeyTanggal',0)
    SELF.AddKey(GHBSB:KeyNoSBBK,'GHBSB:KeyNoSBBK',0)
    SELF.AddKey(GHBSB:Key_NoSBBK_Status,'No SBBK Status',0)
    SELF.AddKey(GHBSB:KeyKdAptk,'GHBSB:KeyKdAptk',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GHBSBBK.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GApotik)

  SELF.AddRelation(Relate:GDBSBBK,RI:CASCADE,RI:RESTRICT,GDBSB:KeyNoBSBBKItem)
  SELF.AddRelationLink(GHBSB:NoBSBBK,GDBSB:NoBSBBK)

  SELF.AddRelation(Relate:GHSBBK)


Hide:Relate:GHBSBBK.Kill PROCEDURE

  CODE
  _Hide:Access:GHBSBBK.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:GHBSBBK &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GHBSBBK)                            ! destroy the file manager

