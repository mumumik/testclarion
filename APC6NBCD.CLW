  MEMBER('apc6new.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
APC6NBCD:DctInit    PROCEDURE
APC6NBCD:DctKill    PROCEDURE
APC6NBCD:FilesInit  PROCEDURE
  END

Hide:Access:LsPel    CLASS(FileManager),TYPE               ! FileManager for LsPel
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:LsPel    CLASS(RelationManager),TYPE           ! RelationManager for LsPel
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:OKDRinci CLASS(FileManager),TYPE               ! FileManager for OKDRinci
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:OKDRinci CLASS(RelationManager),TYPE           ! RelationManager for OKDRinci
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:OKJenisAnestesi CLASS(FileManager),TYPE        ! FileManager for OKJenisAnestesi
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:OKJenisAnestesi CLASS(RelationManager),TYPE    ! RelationManager for OKJenisAnestesi
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:OKDKeluar CLASS(FileManager),TYPE              ! FileManager for OKDKeluar
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:OKDKeluar CLASS(RelationManager),TYPE          ! RelationManager for OKDKeluar
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:NomorUse CLASS(FileManager),TYPE               ! FileManager for NomorUse
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:NomorUse CLASS(RelationManager),TYPE           ! RelationManager for NomorUse
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DDOPe    CLASS(FileManager),TYPE               ! FileManager for DDOPe
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DDOPe    CLASS(RelationManager),TYPE           ! RelationManager for DDOPe
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DHPasOp  CLASS(FileManager),TYPE               ! FileManager for DHPasOp
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DHPasOp  CLASS(RelationManager),TYPE           ! RelationManager for DHPasOp
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:IKKelas  CLASS(FileManager),TYPE               ! FileManager for IKKelas
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:IKKelas  CLASS(RelationManager),TYPE           ! RelationManager for IKKelas
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ROGFpmpd CLASS(FileManager),TYPE               ! FileManager for ROGFpmpd
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ROGFpmpd CLASS(RelationManager),TYPE           ! RelationManager for ROGFpmpd
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:LAdaMemo CLASS(FileManager),TYPE               ! FileManager for LAdaMemo
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:LAdaMemo CLASS(RelationManager),TYPE           ! RelationManager for LAdaMemo
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:LDLAB    CLASS(FileManager),TYPE               ! FileManager for LDLAB
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:LDLAB    CLASS(RelationManager),TYPE           ! RelationManager for LDLAB
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RI_DBSBBK CLASS(FileManager),TYPE              ! FileManager for RI_DBSBBK
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RI_DBSBBK CLASS(RelationManager),TYPE          ! RelationManager for RI_DBSBBK
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:SubGrouplab CLASS(FileManager),TYPE            ! FileManager for SubGrouplab
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:SubGrouplab CLASS(RelationManager),TYPE        ! RelationManager for SubGrouplab
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RoPasiCt CLASS(FileManager),TYPE               ! FileManager for RoPasiCt
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RoPasiCt CLASS(RelationManager),TYPE           ! RelationManager for RoPasiCt
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RI_HBSBBK CLASS(FileManager),TYPE              ! FileManager for RI_HBSBBK
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RI_HBSBBK CLASS(RelationManager),TYPE          ! RelationManager for RI_HBSBBK
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:FileSql  CLASS(FileManager),TYPE               ! FileManager for FileSql
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:FileSql  CLASS(RelationManager),TYPE           ! RelationManager for FileSql
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RoPcsRJ  CLASS(FileManager),TYPE               ! FileManager for RoPcsRJ
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RoPcsRJ  CLASS(RelationManager),TYPE           ! RelationManager for RoPcsRJ
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RoMemo   CLASS(FileManager),TYPE               ! FileManager for RoMemo
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RoMemo   CLASS(RelationManager),TYPE           ! RelationManager for RoMemo
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RoPasHas CLASS(FileManager),TYPE               ! FileManager for RoPasHas
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RoPasHas CLASS(RelationManager),TYPE           ! RelationManager for RoPasHas
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RoTbPem  CLASS(FileManager),TYPE               ! FileManager for RoTbPem
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RoTbPem  CLASS(RelationManager),TYPE           ! RelationManager for RoTbPem
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END


_Hide:Access:LsPel   &Hide:Access:LsPel,AUTO,THREAD
_Hide:Relate:LsPel   &Hide:Relate:LsPel,AUTO,THREAD
_Hide:Access:OKDRinci &Hide:Access:OKDRinci,AUTO,THREAD
_Hide:Relate:OKDRinci &Hide:Relate:OKDRinci,AUTO,THREAD
_Hide:Access:OKJenisAnestesi &Hide:Access:OKJenisAnestesi,AUTO,THREAD
_Hide:Relate:OKJenisAnestesi &Hide:Relate:OKJenisAnestesi,AUTO,THREAD
_Hide:Access:OKDKeluar &Hide:Access:OKDKeluar,AUTO,THREAD
_Hide:Relate:OKDKeluar &Hide:Relate:OKDKeluar,AUTO,THREAD
_Hide:Access:NomorUse &Hide:Access:NomorUse,AUTO,THREAD
_Hide:Relate:NomorUse &Hide:Relate:NomorUse,AUTO,THREAD
_Hide:Access:DDOPe   &Hide:Access:DDOPe,AUTO,THREAD
_Hide:Relate:DDOPe   &Hide:Relate:DDOPe,AUTO,THREAD
_Hide:Access:DHPasOp &Hide:Access:DHPasOp,AUTO,THREAD
_Hide:Relate:DHPasOp &Hide:Relate:DHPasOp,AUTO,THREAD
_Hide:Access:IKKelas &Hide:Access:IKKelas,AUTO,THREAD
_Hide:Relate:IKKelas &Hide:Relate:IKKelas,AUTO,THREAD
_Hide:Access:ROGFpmpd &Hide:Access:ROGFpmpd,AUTO,THREAD
_Hide:Relate:ROGFpmpd &Hide:Relate:ROGFpmpd,AUTO,THREAD
_Hide:Access:LAdaMemo &Hide:Access:LAdaMemo,AUTO,THREAD
_Hide:Relate:LAdaMemo &Hide:Relate:LAdaMemo,AUTO,THREAD
_Hide:Access:LDLAB   &Hide:Access:LDLAB,AUTO,THREAD
_Hide:Relate:LDLAB   &Hide:Relate:LDLAB,AUTO,THREAD
_Hide:Access:RI_DBSBBK &Hide:Access:RI_DBSBBK,AUTO,THREAD
_Hide:Relate:RI_DBSBBK &Hide:Relate:RI_DBSBBK,AUTO,THREAD
_Hide:Access:SubGrouplab &Hide:Access:SubGrouplab,AUTO,THREAD
_Hide:Relate:SubGrouplab &Hide:Relate:SubGrouplab,AUTO,THREAD
_Hide:Access:RoPasiCt &Hide:Access:RoPasiCt,AUTO,THREAD
_Hide:Relate:RoPasiCt &Hide:Relate:RoPasiCt,AUTO,THREAD
_Hide:Access:RI_HBSBBK &Hide:Access:RI_HBSBBK,AUTO,THREAD
_Hide:Relate:RI_HBSBBK &Hide:Relate:RI_HBSBBK,AUTO,THREAD
_Hide:Access:FileSql &Hide:Access:FileSql,AUTO,THREAD
_Hide:Relate:FileSql &Hide:Relate:FileSql,AUTO,THREAD
_Hide:Access:RoPcsRJ &Hide:Access:RoPcsRJ,AUTO,THREAD
_Hide:Relate:RoPcsRJ &Hide:Relate:RoPcsRJ,AUTO,THREAD
_Hide:Access:RoMemo  &Hide:Access:RoMemo,AUTO,THREAD
_Hide:Relate:RoMemo  &Hide:Relate:RoMemo,AUTO,THREAD
_Hide:Access:RoPasHas &Hide:Access:RoPasHas,AUTO,THREAD
_Hide:Relate:RoPasHas &Hide:Relate:RoPasHas,AUTO,THREAD
_Hide:Access:RoTbPem &Hide:Access:RoTbPem,AUTO,THREAD
_Hide:Relate:RoTbPem &Hide:Relate:RoTbPem,AUTO,THREAD


APC6NBCD:DctInit PROCEDURE
  CODE
  _Hide:Access:LsPel &= NEW(Hide:Access:LsPel)
  _Hide:Relate:LsPel &= NEW(Hide:Relate:LsPel)
  _Hide:Access:OKDRinci &= NEW(Hide:Access:OKDRinci)
  _Hide:Relate:OKDRinci &= NEW(Hide:Relate:OKDRinci)
  _Hide:Access:OKJenisAnestesi &= NEW(Hide:Access:OKJenisAnestesi)
  _Hide:Relate:OKJenisAnestesi &= NEW(Hide:Relate:OKJenisAnestesi)
  _Hide:Access:OKDKeluar &= NEW(Hide:Access:OKDKeluar)
  _Hide:Relate:OKDKeluar &= NEW(Hide:Relate:OKDKeluar)
  _Hide:Access:NomorUse &= NEW(Hide:Access:NomorUse)
  _Hide:Relate:NomorUse &= NEW(Hide:Relate:NomorUse)
  _Hide:Access:DDOPe &= NEW(Hide:Access:DDOPe)
  _Hide:Relate:DDOPe &= NEW(Hide:Relate:DDOPe)
  _Hide:Access:DHPasOp &= NEW(Hide:Access:DHPasOp)
  _Hide:Relate:DHPasOp &= NEW(Hide:Relate:DHPasOp)
  _Hide:Access:IKKelas &= NEW(Hide:Access:IKKelas)
  _Hide:Relate:IKKelas &= NEW(Hide:Relate:IKKelas)
  _Hide:Access:ROGFpmpd &= NEW(Hide:Access:ROGFpmpd)
  _Hide:Relate:ROGFpmpd &= NEW(Hide:Relate:ROGFpmpd)
  _Hide:Access:LAdaMemo &= NEW(Hide:Access:LAdaMemo)
  _Hide:Relate:LAdaMemo &= NEW(Hide:Relate:LAdaMemo)
  _Hide:Access:LDLAB &= NEW(Hide:Access:LDLAB)
  _Hide:Relate:LDLAB &= NEW(Hide:Relate:LDLAB)
  _Hide:Access:RI_DBSBBK &= NEW(Hide:Access:RI_DBSBBK)
  _Hide:Relate:RI_DBSBBK &= NEW(Hide:Relate:RI_DBSBBK)
  _Hide:Access:SubGrouplab &= NEW(Hide:Access:SubGrouplab)
  _Hide:Relate:SubGrouplab &= NEW(Hide:Relate:SubGrouplab)
  _Hide:Access:RoPasiCt &= NEW(Hide:Access:RoPasiCt)
  _Hide:Relate:RoPasiCt &= NEW(Hide:Relate:RoPasiCt)
  _Hide:Access:RI_HBSBBK &= NEW(Hide:Access:RI_HBSBBK)
  _Hide:Relate:RI_HBSBBK &= NEW(Hide:Relate:RI_HBSBBK)
  _Hide:Access:FileSql &= NEW(Hide:Access:FileSql)
  _Hide:Relate:FileSql &= NEW(Hide:Relate:FileSql)
  _Hide:Access:RoPcsRJ &= NEW(Hide:Access:RoPcsRJ)
  _Hide:Relate:RoPcsRJ &= NEW(Hide:Relate:RoPcsRJ)
  _Hide:Access:RoMemo &= NEW(Hide:Access:RoMemo)
  _Hide:Relate:RoMemo &= NEW(Hide:Relate:RoMemo)
  _Hide:Access:RoPasHas &= NEW(Hide:Access:RoPasHas)
  _Hide:Relate:RoPasHas &= NEW(Hide:Relate:RoPasHas)
  _Hide:Access:RoTbPem &= NEW(Hide:Access:RoTbPem)
  _Hide:Relate:RoTbPem &= NEW(Hide:Relate:RoTbPem)
  Relate:LsPel &= _Hide:Relate:LsPel
  Relate:OKDRinci &= _Hide:Relate:OKDRinci
  Relate:OKJenisAnestesi &= _Hide:Relate:OKJenisAnestesi
  Relate:OKDKeluar &= _Hide:Relate:OKDKeluar
  Relate:NomorUse &= _Hide:Relate:NomorUse
  Relate:DDOPe &= _Hide:Relate:DDOPe
  Relate:DHPasOp &= _Hide:Relate:DHPasOp
  Relate:IKKelas &= _Hide:Relate:IKKelas
  Relate:ROGFpmpd &= _Hide:Relate:ROGFpmpd
  Relate:LAdaMemo &= _Hide:Relate:LAdaMemo
  Relate:LDLAB &= _Hide:Relate:LDLAB
  Relate:RI_DBSBBK &= _Hide:Relate:RI_DBSBBK
  Relate:SubGrouplab &= _Hide:Relate:SubGrouplab
  Relate:RoPasiCt &= _Hide:Relate:RoPasiCt
  Relate:RI_HBSBBK &= _Hide:Relate:RI_HBSBBK
  Relate:FileSql &= _Hide:Relate:FileSql
  Relate:RoPcsRJ &= _Hide:Relate:RoPcsRJ
  Relate:RoMemo &= _Hide:Relate:RoMemo
  Relate:RoPasHas &= _Hide:Relate:RoPasHas
  Relate:RoTbPem &= _Hide:Relate:RoTbPem


APC6NBCD:FilesInit PROCEDURE
  CODE
  _Hide:Relate:LsPel.Init
  _Hide:Relate:OKDRinci.Init
  _Hide:Relate:OKJenisAnestesi.Init
  _Hide:Relate:OKDKeluar.Init
  _Hide:Relate:NomorUse.Init
  _Hide:Relate:DDOPe.Init
  _Hide:Relate:DHPasOp.Init
  _Hide:Relate:IKKelas.Init
  _Hide:Relate:ROGFpmpd.Init
  _Hide:Relate:LAdaMemo.Init
  _Hide:Relate:LDLAB.Init
  _Hide:Relate:RI_DBSBBK.Init
  _Hide:Relate:SubGrouplab.Init
  _Hide:Relate:RoPasiCt.Init
  _Hide:Relate:RI_HBSBBK.Init
  _Hide:Relate:FileSql.Init
  _Hide:Relate:RoPcsRJ.Init
  _Hide:Relate:RoMemo.Init
  _Hide:Relate:RoPasHas.Init
  _Hide:Relate:RoTbPem.Init


APC6NBCD:DctKill PROCEDURE
  CODE
  _Hide:Relate:LsPel.Kill
  DISPOSE(_Hide:Relate:LsPel)
  _Hide:Relate:OKDRinci.Kill
  DISPOSE(_Hide:Relate:OKDRinci)
  _Hide:Relate:OKJenisAnestesi.Kill
  DISPOSE(_Hide:Relate:OKJenisAnestesi)
  _Hide:Relate:OKDKeluar.Kill
  DISPOSE(_Hide:Relate:OKDKeluar)
  _Hide:Relate:NomorUse.Kill
  DISPOSE(_Hide:Relate:NomorUse)
  _Hide:Relate:DDOPe.Kill
  DISPOSE(_Hide:Relate:DDOPe)
  _Hide:Relate:DHPasOp.Kill
  DISPOSE(_Hide:Relate:DHPasOp)
  _Hide:Relate:IKKelas.Kill
  DISPOSE(_Hide:Relate:IKKelas)
  _Hide:Relate:ROGFpmpd.Kill
  DISPOSE(_Hide:Relate:ROGFpmpd)
  _Hide:Relate:LAdaMemo.Kill
  DISPOSE(_Hide:Relate:LAdaMemo)
  _Hide:Relate:LDLAB.Kill
  DISPOSE(_Hide:Relate:LDLAB)
  _Hide:Relate:RI_DBSBBK.Kill
  DISPOSE(_Hide:Relate:RI_DBSBBK)
  _Hide:Relate:SubGrouplab.Kill
  DISPOSE(_Hide:Relate:SubGrouplab)
  _Hide:Relate:RoPasiCt.Kill
  DISPOSE(_Hide:Relate:RoPasiCt)
  _Hide:Relate:RI_HBSBBK.Kill
  DISPOSE(_Hide:Relate:RI_HBSBBK)
  _Hide:Relate:FileSql.Kill
  DISPOSE(_Hide:Relate:FileSql)
  _Hide:Relate:RoPcsRJ.Kill
  DISPOSE(_Hide:Relate:RoPcsRJ)
  _Hide:Relate:RoMemo.Kill
  DISPOSE(_Hide:Relate:RoMemo)
  _Hide:Relate:RoPasHas.Kill
  DISPOSE(_Hide:Relate:RoPasHas)
  _Hide:Relate:RoTbPem.Kill
  DISPOSE(_Hide:Relate:RoTbPem)


Hide:Relate:LsPel.Init PROCEDURE
  CODE
  _Hide:Access:LsPel.Init
  SELF.Init(Access:LsPel,1)


Hide:Access:LsPel.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LsPn:Record
  SELF.FileNameValue = 'LsPel'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LsPel
  PARENT.Init
  Access:LsPel &= SELF


Hide:Access:LsPel.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LsPel &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LsPel.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LsPel,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(LsPn:keynoauto,'LsPn:keynoauto',1)
    SELF.AddKey(LsPn:keypelayanan,'LsPn:keypelayanan',0)
    SELF.AddKey(LsPn:keynama,'LsPn:keynama',0)
    SELF.AddKey(LsPn:keygroup,'LsPn:keygroup',0)
    SELF.AddKey(LsPn:keygroupsize,'LsPn:keygroupsize',0)
    SELF.AddKey(LsPn:keykoderuang,'LsPn:keykoderuang',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:LsPel.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ITbrRwt)


Hide:Relate:LsPel.Kill PROCEDURE

  CODE
  _Hide:Access:LsPel.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:LsPel &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LsPel)                              ! destroy the file manager


Hide:Relate:OKDRinci.Init PROCEDURE
  CODE
  _Hide:Access:OKDRinci.Init
  SELF.Init(Access:OKDRinci,1)


Hide:Access:OKDRinci.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= OKD1:Record
  SELF.FileNameValue = 'OKDRinci'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OKDRinci
  PARENT.Init
  Access:OKDRinci &= SELF


Hide:Access:OKDRinci.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OKDRinci &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OKDRinci.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OKDRinci,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(OKD1:PrimaryKey,'OKD1:PrimaryKey',0)
    SELF.AddKey(OKD1:OKAlatKamar_OKDRinci_Key,'OKD1:OKAlatKamar_OKDRinci_Key',0)
    SELF.AddKey(OKD1:KeyNomor,'OKD1:KeyNomor',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:OKDRinci.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:OKAlatKamar)

  SELF.AddRelation(Relate:OKHKeluar)


Hide:Relate:OKDRinci.Kill PROCEDURE

  CODE
  _Hide:Access:OKDRinci.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:OKDRinci &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OKDRinci)                           ! destroy the file manager


Hide:Relate:OKJenisAnestesi.Init PROCEDURE
  CODE
  _Hide:Access:OKJenisAnestesi.Init
  SELF.Init(Access:OKJenisAnestesi,1)


Hide:Access:OKJenisAnestesi.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= OKJ1:Record
  SELF.FileNameValue = 'OKJenisAnestesi'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OKJenisAnestesi
  PARENT.Init
  Access:OKJenisAnestesi &= SELF


Hide:Access:OKJenisAnestesi.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OKJenisAnestesi &= NULL                           ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OKJenisAnestesi.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OKJenisAnestesi,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(OKJ1:PK,'OKJ1:PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:OKJenisAnestesi.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:OKHInap,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,OKH1:OKJAnestesi_OKHKeluar_Key)
  SELF.AddRelationLink(OKJ1:Kode,OKH1:Jenis_Anesthesi)

  SELF.AddRelation(Relate:OKHKeluar,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,OKH:OKJAnestesi_OKHKeluar_Key)
  SELF.AddRelationLink(OKJ1:Kode,OKH:Jenis_Anesthesi)


Hide:Relate:OKJenisAnestesi.Kill PROCEDURE

  CODE
  _Hide:Access:OKJenisAnestesi.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:OKJenisAnestesi &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OKJenisAnestesi)                    ! destroy the file manager


Hide:Relate:OKDKeluar.Init PROCEDURE
  CODE
  _Hide:Access:OKDKeluar.Init
  SELF.Init(Access:OKDKeluar,1)


Hide:Access:OKDKeluar.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= OKD:Record
  SELF.FileNameValue = 'OKDKeluar'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OKDKeluar
  PARENT.Init
  Access:OKDKeluar &= SELF


Hide:Access:OKDKeluar.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OKDKeluar &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OKDKeluar.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OKDKeluar,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(OKD:PRimaryKey,'OKD:PRimaryKey',0)
    SELF.AddKey(OKD:Barang_OKDKeluar_Key,'OKD:Barang_OKDKeluar_Key',0)
    SELF.AddKey(OKD:KeyNomor,'OKD:KeyNomor',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:OKDKeluar.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:OKHKeluar)


Hide:Relate:OKDKeluar.Kill PROCEDURE

  CODE
  _Hide:Access:OKDKeluar.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:OKDKeluar &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OKDKeluar)                          ! destroy the file manager


Hide:Relate:NomorUse.Init PROCEDURE
  CODE
  _Hide:Access:NomorUse.Init
  SELF.Init(Access:NomorUse,1)


Hide:Access:NomorUse.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= NOMU:Record
  SELF.FileNameValue = 'NomorUse'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= NomorUse
  PARENT.Init
  Access:NomorUse &= SELF


Hide:Access:NomorUse.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:NomorUse &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:NomorUse.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(NomorUse,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(NOMU:PrimaryKey,'NOMU:PrimaryKey',0)
    SELF.AddKey(NOMU:Urut_NomorUse_FK,'NOMU:Urut_NomorUse_FK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:NomorUse.Kill PROCEDURE

  CODE
  _Hide:Access:NomorUse.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:NomorUse &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:NomorUse)                           ! destroy the file manager


Hide:Relate:DDOPe.Init PROCEDURE
  CODE
  _Hide:Access:DDOPe.Init
  SELF.Init(Access:DDOPe,1)


Hide:Access:DDOPe.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DDOP:Record
  SELF.FileNameValue = 'DDOPe'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DDOPe
  PARENT.Init
  Access:DDOPe &= SELF


Hide:Access:DDOPe.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DDOPe &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DDOPe.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DDOPe,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DDOP:KeyNoPeriksa,'DDOP:KeyNoPeriksa',0)
    SELF.AddKey(DDOP:KeyNoPeriksaKodeUrut,'DDOP:KeyNoPeriksaKodeUrut',0)
    SELF.AddKey(DDOP:KeyGKodeLab,'Kunci Kode Group Lab',0)
    SELF.AddKey(DDOP:KeyKodeLab,'DDOP:KeyKodeLab',0)
    SELF.AddKey(DDOP:KeyKodePasien,'DDOP:KeyKodePasien',0)
    SELF.AddKey(DDOP:KeyNoPer_SGLab,'Key  NomorPeriksa dan SubGroupLab',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DDOPe.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DHPasOp)


Hide:Relate:DDOPe.Kill PROCEDURE

  CODE
  _Hide:Access:DDOPe.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:DDOPe &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DDOPe)                              ! destroy the file manager


Hide:Relate:DHPasOp.Init PROCEDURE
  CODE
  _Hide:Access:DHPasOp.Init
  SELF.Init(Access:DHPasOp,1)


Hide:Access:DHPasOp.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DHPA:Record
  SELF.FileNameValue = 'DHPasOp'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DHPasOp
  PARENT.Init
  Access:DHPasOp &= SELF


Hide:Access:DHPasOp.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DHPasOp &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DHPasOp.PrimeFields PROCEDURE

  CODE
  DHPA:Jammasuk = Clock()                                  ! Assign initial field value
  DHPA:JamKeluar = Clock()                                 ! Assign initial field value
  DHPA:StatusPP = 'PP'                                     ! Assign initial field value
  DHPA:Sifat = 'Biasa'                                     ! Assign initial field value
  DHPA:Pembayaran = 2                                      ! Assign initial field value
  DHPA:StatusCetakKerja = 'Masuk'                          ! Assign initial field value
  DHPA:K_OBATOBATAN = 1                                    ! Assign initial field value
  DHPA:K_alSunIn = 2                                       ! Assign initial field value
  DHPA:K_Benjah = 3                                        ! Assign initial field value
  DHPA:K_Bal = 4                                           ! Assign initial field value
  DHPA:K_GasAnes = 5                                       ! Assign initial field value
  DHPA:K_AlLain = 6                                        ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:DHPasOp.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DHPasOp,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DHPA:KeyNomorMr,'Nomor RM',0)
    SELF.AddKey(DHPA:key:KodeDoc,'DHPA:key:KodeDoc',0)
    SELF.AddKey(DHPA:KeyAnes,'DHPA:KeyAnes',0)
    SELF.AddKey(DHPA:KeyNomorPeriksa,'DHPA:KeyNomorPeriksa',0)
    SELF.AddKey(DHPA:KeyNomorPeriksaBalik,'DHPA:KeyNomorPeriksaBalik',0)
    SELF.AddKey(DHPA:KeyKodeDiagKerja,'DHPA:KeyKodeDiagKerja',0)
    SELF.AddKey(DHPA:KeyDiagTambah,'Key Diagnosa Tambahan',0)
    SELF.AddKey(DHPA:keyKodeRegion,'DHPA:keyKodeRegion',0)
    SELF.AddKey(DHPA:KeyTanggalMasuk,'DHPA:KeyTanggalMasuk',0)
    SELF.AddKey(DHPA:KeyTglMasuk_Jam,'Untuk Pengontrolan TanggalMasuk dan Jam',0)
    SELF.AddKey(DHPA:KeyTindakanAkhir,'DHPA:KeyTindakanAkhir',0)
    SELF.AddKey(DHPA:KeyKodeRuang,'DHPA:KeyKodeRuang',0)
    SELF.AddKey(DHPA:KeyObatNotta,'Kode Nomr Notta dan Obat',0)
    SELF.AddKey(DHPA:KeyTindakan,'DHPA:KeyTindakan',0)
    SELF.AddKey(DHPA:KeySunInNotta,' Key Nomor Notta dan SuntikInfus',0)
    SELF.AddKey(DHPA:KeyBenJahNotta,'Key Nomor Notta dan BenangJahit',0)
    SELF.AddKey(DHPA:KeyBalNotta,'Key Nomor Notta dan Balutan',0)
    SELF.AddKey(DHPA:KeyGasAnNotta,'Key Nomor Notta dan GasNesthesi',0)
    SELF.AddKey(DHPA:KeyLainNotta,'Key Nomor Notta dan Lain-lain',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:DHPasOp.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('Nomor Medical record pasien')
    IF NOT INRANGE(DHPA:Nomor_mr,0,99999999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'0 .. 99999999')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:DHPasOp.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  DO AddRelations_2
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DTabDoc)

  SELF.AddRelation(Relate:DHPToday)

  SELF.AddRelation(Relate:DDTRpTin,RI:CASCADE,RI:CASCADE,DDTP:KeyNoPeriksaTindak)
  SELF.AddRelationLink(DHPA:NoPeriksa,DDTP:NoPeriksa)

  SELF.AddRelation(Relate:DTTin_Ak)

  SELF.AddRelation(Relate:ITbrRwt)

  SELF.AddRelation(Relate:JPasien)

  SELF.AddRelation(Relate:DTDiKer)

  SELF.AddRelation(Relate:DDTambah,RI:CASCADE,RI:CASCADE,DDTh:KeyNoPeriksaTindak)
  SELF.AddRelationLink(DHPA:NoPeriksa,DDTh:NoPeriksa)

  SELF.AddRelation(Relate:DTDDKer)

  SELF.AddRelation(Relate:DDTGas,RI:CASCADE,RI:CASCADE,DDTG:KeyNoPeriksaGas)
  SELF.AddRelationLink(DHPA:NoPeriksa,DDTG:NoPeriksa)

AddRelations_2 ROUTINE
  SELF.AddRelation(Relate:DDTSunIn,RI:CASCADE,RI:CASCADE,DDSI:KeyNoPeriksaTindak)
  SELF.AddRelationLink(DHPA:NoPeriksa,DDSI:NoPeriksa)

  SELF.AddRelation(Relate:DDTobat,RI:CASCADE,RI:CASCADE,DDTO:KeyNoPeriksaObat)
  SELF.AddRelationLink(DHPA:NoPeriksa,DDTO:NoPeriksa)

  SELF.AddRelation(Relate:DDTLain,RI:CASCADE,RI:CASCADE,DDTL:KeyNoPeriksaLain)
  SELF.AddRelationLink(DHPA:NoPeriksa,DDTL:NoPeriksa)

  SELF.AddRelation(Relate:DDTJahit,RI:CASCADE,RI:CASCADE,DDTJ:KeyNoPeriksaJah)
  SELF.AddRelationLink(DHPA:NoPeriksa,DDTJ:NoPeriksa)

  SELF.AddRelation(Relate:DDTBal,RI:CASCADE,RI:CASCADE,DDTB:KeyNoPeriksaBal)
  SELF.AddRelationLink(DHPA:NoPeriksa,DDTB:NoPeriksa)

  SELF.AddRelation(Relate:DDOPe,RI:CASCADE,RI:CASCADE,DDOP:KeyNoPeriksa)
  SELF.AddRelationLink(DHPA:NoPeriksa,DDOP:NoPeriksa)

  SELF.AddRelation(Relate:DDTindak,RI:CASCADE,RI:CASCADE,DDTN:KeyNoPeriksaTindak)
  SELF.AddRelationLink(DHPA:NoPeriksa,DDTN:NoPeriksa)


Hide:Relate:DHPasOp.Kill PROCEDURE

  CODE
  _Hide:Access:DHPasOp.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:DHPasOp &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DHPasOp)                            ! destroy the file manager


Hide:Relate:IKKelas.Init PROCEDURE
  CODE
  _Hide:Access:IKKelas.Init
  SELF.Init(Access:IKKelas,1)


Hide:Access:IKKelas.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IKTB:Record
  SELF.FileNameValue = 'IKKelas'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= IKKelas
  PARENT.Init
  Access:IKKelas &= SELF


Hide:Access:IKKelas.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:IKKelas &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:IKKelas.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(IKKelas,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(IKTB:KeyKodeKelas,'IKTB:KeyKodeKelas',0)
    SELF.AddKey(IKTB:KeyKontraktor,'IKTB:KeyKontraktor',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:IKKelas.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ITbKelas)


Hide:Relate:IKKelas.Kill PROCEDURE

  CODE
  _Hide:Access:IKKelas.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:IKKelas &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:IKKelas)                            ! destroy the file manager


Hide:Relate:ROGFpmpd.Init PROCEDURE
  CODE
  _Hide:Access:ROGFpmpd.Init
  SELF.Init(Access:ROGFpmpd,1)


Hide:Access:ROGFpmpd.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RoF:Record
  SELF.FileNameValue = 'ROGFpmpd'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ROGFpmpd
  PARENT.Init
  Access:ROGFpmpd &= SELF


Hide:Access:ROGFpmpd.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ROGFpmpd &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ROGFpmpd.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ROGFpmpd,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(RoF:KeyKode_inspmpd,'RoF:KeyKode_inspmpd',0)
    SELF.AddKey(RoF:keykd_barang_pmpd,'kode_brg-instalasi',0)
    SELF.AddKey(RoF:key_kd_brg,'kode barang saja',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ROGFpmpd.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:RoKStok,RI:CASCADE,RI:RESTRICT,RoKS:KEY1)
  SELF.AddRelationLink(RoF:Kode_brg,RoKS:Kode_Barang)
  SELF.AddRelationLink(RoF:Kode_tempat,RoKS:Kode_Tempat)

  SELF.AddRelation(Relate:ROGBarang)


Hide:Relate:ROGFpmpd.Kill PROCEDURE

  CODE
  _Hide:Access:ROGFpmpd.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:ROGFpmpd &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ROGFpmpd)                           ! destroy the file manager


Hide:Relate:LAdaMemo.Init PROCEDURE
  CODE
  _Hide:Access:LAdaMemo.Init
  SELF.Init(Access:LAdaMemo,1)


Hide:Access:LAdaMemo.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LADA:Record
  SELF.FileNameValue = 'LAdaMemo'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LAdaMemo
  PARENT.Init
  Access:LAdaMemo &= SELF


Hide:Access:LAdaMemo.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LAdaMemo &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LAdaMemo.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LAdaMemo,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(LADA:KeyNomorNotta,'LADA:KeyNomorNotta',0)
    SELF.AddKey(LADA:KeyAda,'LADA:KeyAda',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:LAdaMemo.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:LPasLab)


Hide:Relate:LAdaMemo.Kill PROCEDURE

  CODE
  _Hide:Access:LAdaMemo.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:LAdaMemo &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LAdaMemo)                           ! destroy the file manager


Hide:Relate:LDLAB.Init PROCEDURE
  CODE
  _Hide:Access:LDLAB.Init
  SELF.Init(Access:LDLAB,1)


Hide:Access:LDLAB.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LDL:Record
  SELF.FileNameValue = 'LDLAB'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LDLAB
  PARENT.Init
  Access:LDLAB &= SELF


Hide:Access:LDLAB.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LDLAB &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LDLAB.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LDLAB,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(LDL:KeyGKodeLab,'LDL:KeyGKodeLab',0)
    SELF.AddKey(LDL:KeyNamaJenisPeriksa,'LDL:KeyNamaJenisPeriksa',0)
    SELF.AddKey(LDL:KeyKodeLab,'LDL:KeyKodeLab',0)
    SELF.AddKey(LDL:KeySGLab,'LDL:KeySGLab',0)
    SELF.AddKey(LDL:KeyGk_Kode,'LDL:KeyGk_Kode',0)
    SELF.AddKey(LDL:KeyGK_Nama,'LDL:KeyGK_Nama',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:LDLAB.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:LKtrPers)

  SELF.AddRelation(Relate:LHLAB)

  SELF.AddRelation(Relate:SubGrouplab)

  SELF.AddRelation(Relate:LDDPerik,RI:CASCADE,RI:RESTRICT,LDD:KeyKodeLab)
  SELF.AddRelationLink(LDL:KodeLab,LDD:KodeLab)


Hide:Relate:LDLAB.Kill PROCEDURE

  CODE
  _Hide:Access:LDLAB.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:LDLAB &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LDLAB)                              ! destroy the file manager


Hide:Relate:RI_DBSBBK.Init PROCEDURE
  CODE
  _Hide:Access:RI_DBSBBK.Init
  SELF.Init(Access:RI_DBSBBK,1)


Hide:Access:RI_DBSBBK.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RI_DSB1:Record
  SELF.FileNameValue = 'RI_DBSBBK'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RI_DBSBBK
  PARENT.Init
  Access:RI_DBSBBK &= SELF


Hide:Access:RI_DBSBBK.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RI_DBSBBK &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RI_DBSBBK.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RI_DBSBBK,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(RI_DSB1:PrimaryKey,'RI_DSB1:PrimaryKey',0)
    SELF.AddKey(RI_DSB1:by_transaksi,'RI_DSB1:by_transaksi',0)
    SELF.AddKey(RI_DSB1:Barang_RI_DSBBK_FK,'RI_DSB1:Barang_RI_DSBBK_FK',0)
    SELF.AddKey(RI_DSB1:by_tran_cam,'index atas transaksi dan campur',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:RI_DBSBBK.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:RI_HBSBBK)

  SELF.AddRelation(Relate:GBarang)


Hide:Relate:RI_DBSBBK.Kill PROCEDURE

  CODE
  _Hide:Access:RI_DBSBBK.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:RI_DBSBBK &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RI_DBSBBK)                          ! destroy the file manager


Hide:Relate:SubGrouplab.Init PROCEDURE
  CODE
  _Hide:Access:SubGrouplab.Init
  SELF.Init(Access:SubGrouplab,1)


Hide:Access:SubGrouplab.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SGL:Record
  SELF.FileNameValue = 'SubGrouplab'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SubGrouplab
  PARENT.Init
  Access:SubGrouplab &= SELF


Hide:Access:SubGrouplab.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SubGrouplab &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SubGrouplab.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SubGrouplab,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(SGL:KeySGKodeLab,'SGL:KeySGKodeLab',0)
    SELF.AddKey(SGL:KeyGKodeGroup,'SGL:KeyGKodeGroup',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SubGrouplab.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:LHLAB)

  SELF.AddRelation(Relate:LDLAB,RI:CASCADE,RI:None,LDL:KeySGLab)
  SELF.AddRelationLink(SGL:KodeSGLab,LDL:SubGLab)


Hide:Relate:SubGrouplab.Kill PROCEDURE

  CODE
  _Hide:Access:SubGrouplab.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:SubGrouplab &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SubGrouplab)                        ! destroy the file manager


Hide:Relate:RoPasiCt.Init PROCEDURE
  CODE
  _Hide:Access:RoPasiCt.Init
  SELF.Init(Access:RoPasiCt,1)


Hide:Access:RoPasiCt.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ROPA1:Record
  SELF.FileNameValue = 'RoPasiCt'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RoPasiCt
  PARENT.Init
  Access:RoPasiCt &= SELF


Hide:Access:RoPasiCt.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RoPasiCt &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RoPasiCt.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RoPasiCt,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(ROPA1:KeyNomorMr,'ROPA1:KeyNomorMr',0)
    SELF.AddKey(ROPA1:KeyNoNota,'ROPA1:KeyNoNota',0)
    SELF.AddKey(ROPA1:KeyNoUrut,'ROPA1:KeyNoUrut',0)
    SELF.AddKey(ROPA1:KeyTanggal,'ROPA1:KeyTanggal',0)
    SELF.AddKey(ROPA1:KeyKodeBrg,'ROPA1:KeyKodeBrg',0)
    SELF.AddKey(ROPA1:KeyHasil,'ROPA1:KeyHasil',0)
    SELF.AddKey(ROPA1:KeyRuangKlinik,'ROPA1:KeyRuangKlinik',0)
    SELF.AddKey(ROPA1:KeyPeriksa,'ROPA1:KeyPeriksa',0)
    SELF.AddKey(ROPA1:KeyNoUrutNoMR,'ROPA1:KeyNoUrutNoMR',0)
    SELF.AddKey(ROPA1:KEYNOUrutNoMRBrg,'ROPA1:KEYNOUrutNoMRBrg',0)
    SELF.AddKey(ROPA1:keykodefilm,'ROPA1:keykodefilm',0)
    SELF.AddKey(ROPA1:keykodefilmKodeBrg,'ROPA1:keykodefilmKodeBrg',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:RoPasiCt.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JPasien)

  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:RoPasRJ)


Hide:Relate:RoPasiCt.Kill PROCEDURE

  CODE
  _Hide:Access:RoPasiCt.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:RoPasiCt &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RoPasiCt)                           ! destroy the file manager


Hide:Relate:RI_HBSBBK.Init PROCEDURE
  CODE
  _Hide:Access:RI_HBSBBK.Init
  SELF.Init(Access:RI_HBSBBK,1)


Hide:Access:RI_HBSBBK.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RI_HSB1:Record
  SELF.FileNameValue = 'RI_HBSBBK'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RI_HBSBBK
  PARENT.Init
  Access:RI_HBSBBK &= SELF


Hide:Access:RI_HBSBBK.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RI_HBSBBK &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RI_HBSBBK.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RI_HBSBBK,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(RI_HSB1:PrimaryKey,'RI_HSB1:PrimaryKey',0)
    SELF.AddKey(RI_HSB1:pasien_ri_hsbbk_fk,'RI_HSB1:pasien_ri_hsbbk_fk',0)
    SELF.AddKey(RI_HSB1:Instalasi_ri_hsbbk_fk,'RI_HSB1:Instalasi_ri_hsbbk_fk',0)
    SELF.AddKey(RI_HSB1:keytanggal,'RI_HSB1:keytanggal',0)
    SELF.AddKey(RI_HSB1:Aptotik_rihsbbk_fk,'RI_HSB1:Aptotik_rihsbbk_fk',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:RI_HBSBBK.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('Nomor Medical record pasien')
    IF NOT INRANGE(RI_HSB1:Nomor_mr,0,99999999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'0 .. 99999999')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:RI_HBSBBK.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GApotik)

  SELF.AddRelation(Relate:RI_DBSBBK,RI:CASCADE,RI:RESTRICT,RI_DSB1:PrimaryKey)
  SELF.AddRelationLink(RI_HSB1:Nomor,RI_DSB1:Nomor)

  SELF.AddRelation(Relate:TBinstli)

  SELF.AddRelation(Relate:JPasien)


Hide:Relate:RI_HBSBBK.Kill PROCEDURE

  CODE
  _Hide:Access:RI_HBSBBK.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:RI_HBSBBK &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RI_HBSBBK)                          ! destroy the file manager


Hide:Relate:FileSql.Init PROCEDURE
  CODE
  _Hide:Access:FileSql.Init
  SELF.Init(Access:FileSql,1)


Hide:Access:FileSql.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= FIL:Record
  SELF.FileNameValue = 'FileSql'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= FileSql
  PARENT.Init
  Access:FileSql &= SELF


Hide:Access:FileSql.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:FileSql &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:FileSql.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(FileSql,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(FIL:PrimaryKey,'FIL:PrimaryKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:FileSql.Kill PROCEDURE

  CODE
  _Hide:Access:FileSql.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:FileSql &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:FileSql)                            ! destroy the file manager


Hide:Relate:RoPcsRJ.Init PROCEDURE
  CODE
  _Hide:Access:RoPcsRJ.Init
  SELF.Init(Access:RoPcsRJ,1)


Hide:Access:RoPcsRJ.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RPCJ:Record
  SELF.FileNameValue = 'RoPcsRJ'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RoPcsRJ
  PARENT.Init
  Access:RoPcsRJ &= SELF


Hide:Access:RoPcsRJ.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RoPcsRJ &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RoPcsRJ.PrimeFields PROCEDURE

  CODE
  RPCJ:TanggalLahir = today()                              ! Assign initial field value
  RPCJ:Jenis_kelamin = 'P'                                 ! Assign initial field value
  RPCJ:Jam = Clock()                                       ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:RoPcsRJ.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RoPcsRJ,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(RPCJ:KeyNoUrut,'RPCJ:KeyNoUrut',0)
    SELF.AddKey(RPCJ:keydokkonsul,'RPCJ:keydokkonsul',0)
    SELF.AddKey(RPCJ:KeyNama,'Nama',0)
    SELF.AddKey(RPCJ:KeyTanggal,'RPCJ:KeyTanggal',0)
    SELF.AddKey(RPCJ:KeyNoUrutNoMR,'RPCJ:KeyNoUrutNoMR',0)
    SELF.AddKey(RPCJ:keyNomorMr,'RPCJ:keyNomorMr',0)
    SELF.AddKey(RPCJ:keyDokter,'RPCJ:keyDokter',0)
    SELF.AddKey(RPCJ:keytempat,'RPCJ:keytempat',0)
    SELF.AddKey(RPCJ:keyPetugas,'RPCJ:keyPetugas',0)
    SELF.AddKey(RPCJ:keyTempatpmpdNoUrut,'RPCJ:keyTempatpmpdNoUrut',0)
    SELF.AddKey(RPCJ:KeytempatpmpdMR,'RPCJ:KeytempatpmpdMR',0)
    SELF.AddKey(RPCJ:keytempatpmpdnama,'RPCJ:keytempatpmpdnama',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:RoPcsRJ.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('Nomor Medical record pasien')
    IF NOT INRANGE(RPCJ:Nomor_MR,0,99999999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'0 .. 99999999')
      END
    END
  OF 5
    GlobalErrors.SetField('Umur pasien dalam tahun')
    IF NOT INRANGE(RPCJ:Umur,0,999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'0 .. 999')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:RoPcsRJ.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JDokter)

  SELF.AddRelation(Relate:JPasien)

  SELF.AddRelation(Relate:RoPasien,RI:CASCADE,RI:RESTRICT,ROPA:KeyNoUrut)
  SELF.AddRelationLink(RPCJ:NoUrut,ROPA:NoUrut)

  SELF.AddRelation(Relate:JTempat)


Hide:Relate:RoPcsRJ.Kill PROCEDURE

  CODE
  _Hide:Access:RoPcsRJ.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:RoPcsRJ &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RoPcsRJ)                            ! destroy the file manager


Hide:Relate:RoMemo.Init PROCEDURE
  CODE
  _Hide:Access:RoMemo.Init
  SELF.Init(Access:RoMemo,1)


Hide:Access:RoMemo.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ROME:Record
  SELF.FileNameValue = 'RoMemo'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RoMemo
  PARENT.Init
  Access:RoMemo &= SELF


Hide:Access:RoMemo.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RoMemo &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RoMemo.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RoMemo,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(ROME:KeyNoNota,'ROME:KeyNoNota',0)
    SELF.AddKey(ROME:KeyNomorMr,'ROME:KeyNomorMr',0)
    SELF.AddKey(ROME:KeyTanggal,'ROME:KeyTanggal',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:RoMemo.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:RoPasien)


Hide:Relate:RoMemo.Kill PROCEDURE

  CODE
  _Hide:Access:RoMemo.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:RoMemo &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RoMemo)                             ! destroy the file manager


Hide:Relate:RoPasHas.Init PROCEDURE
  CODE
  _Hide:Access:RoPasHas.Init
  SELF.Init(Access:RoPasHas,1)


Hide:Access:RoPasHas.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RPHA:Record
  SELF.FileNameValue = 'RoPasHas'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RoPasHas
  PARENT.Init
  Access:RoPasHas &= SELF


Hide:Access:RoPasHas.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RoPasHas &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RoPasHas.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RoPasHas,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(RPHA:KeyNoNota,'RPHA:KeyNoNota',0)
    SELF.AddKey(RPHA:KeyTanggal,'RPHA:KeyTanggal',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:RoPasHas.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:RoPasien)


Hide:Relate:RoPasHas.Kill PROCEDURE

  CODE
  _Hide:Access:RoPasHas.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:RoPasHas &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RoPasHas)                           ! destroy the file manager


Hide:Relate:RoTbPem.Init PROCEDURE
  CODE
  _Hide:Access:RoTbPem.Init
  SELF.Init(Access:RoTbPem,1)


Hide:Access:RoTbPem.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ROTP:Record
  SELF.FileNameValue = 'RoTbPem'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RoTbPem
  PARENT.Init
  Access:RoTbPem &= SELF


Hide:Access:RoTbPem.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RoTbPem &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RoTbPem.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RoTbPem,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(ROTP:KeyPeriksa,'ROTP:KeyPeriksa',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:RoTbPem.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:RoPasien,RI:CASCADE,RI:RESTRICT,ROPA:KeyPeriksa)
  SELF.AddRelationLink(ROTP:Periksa,ROPA:Periksa)


Hide:Relate:RoTbPem.Kill PROCEDURE

  CODE
  _Hide:Access:RoTbPem.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:RoTbPem &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RoTbPem)                            ! destroy the file manager

