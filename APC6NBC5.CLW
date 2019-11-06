  MEMBER('apc6new.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
APC6NBC5:DctInit    PROCEDURE
APC6NBC5:DctKill    PROCEDURE
APC6NBC5:FilesInit  PROCEDURE
  END

Hide:Access:DDTBal   CLASS(FileManager),TYPE               ! FileManager for DDTBal
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DDTBal   CLASS(RelationManager),TYPE           ! RelationManager for DDTBal
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DDTSunIn CLASS(FileManager),TYPE               ! FileManager for DDTSunIn
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DDTSunIn CLASS(RelationManager),TYPE           ! RelationManager for DDTSunIn
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DDTobat  CLASS(FileManager),TYPE               ! FileManager for DDTobat
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DDTobat  CLASS(RelationManager),TYPE           ! RelationManager for DDTobat
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:IDataKtr CLASS(FileManager),TYPE               ! FileManager for IDataKtr
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:IDataKtr CLASS(RelationManager),TYPE           ! RelationManager for IDataKtr
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DDTindak CLASS(FileManager),TYPE               ! FileManager for DDTindak
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DDTindak CLASS(RelationManager),TYPE           ! RelationManager for DDTindak
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JKET     CLASS(FileManager),TYPE               ! FileManager for JKET
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JKET     CLASS(RelationManager),TYPE           ! RelationManager for JKET
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:IRekRu   CLASS(FileManager),TYPE               ! FileManager for IRekRu
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:IRekRu   CLASS(RelationManager),TYPE           ! RelationManager for IRekRu
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:HM_SUPPLIER CLASS(FileManager),TYPE            ! FileManager for HM_SUPPLIER
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:HM_SUPPLIER CLASS(RelationManager),TYPE        ! RelationManager for HM_SUPPLIER
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:HM_DOKTER CLASS(FileManager),TYPE              ! FileManager for HM_DOKTER
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:HM_DOKTER CLASS(RelationManager),TYPE          ! RelationManager for HM_DOKTER
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:HM_DOKTERLUAR CLASS(FileManager),TYPE          ! FileManager for HM_DOKTERLUAR
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:HM_DOKTERLUAR CLASS(RelationManager),TYPE      ! RelationManager for HM_DOKTERLUAR
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:HM_Kontraktor CLASS(FileManager),TYPE          ! FileManager for HM_Kontraktor
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:HM_Kontraktor CLASS(RelationManager),TYPE      ! RelationManager for HM_Kontraktor
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:HM_PASIEN CLASS(FileManager),TYPE              ! FileManager for HM_PASIEN
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:HM_PASIEN CLASS(RelationManager),TYPE          ! RelationManager for HM_PASIEN
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:HM_DIAGNOSA CLASS(FileManager),TYPE            ! FileManager for HM_DIAGNOSA
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:HM_DIAGNOSA CLASS(RelationManager),TYPE        ! RelationManager for HM_DIAGNOSA
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JTindaka CLASS(FileManager),TYPE               ! FileManager for JTindaka
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JTindaka CLASS(RelationManager),TYPE           ! RelationManager for JTindaka
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DTPBalut CLASS(FileManager),TYPE               ! FileManager for DTPBalut
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DTPBalut CLASS(RelationManager),TYPE           ! RelationManager for DTPBalut
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JUPF     CLASS(FileManager),TYPE               ! FileManager for JUPF
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JUPF     CLASS(RelationManager),TYPE           ! RelationManager for JUPF
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JPoli    CLASS(FileManager),TYPE               ! FileManager for JPoli
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JPoli    CLASS(RelationManager),TYPE           ! RelationManager for JPoli
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JKecamatan CLASS(FileManager),TYPE             ! FileManager for JKecamatan
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JKecamatan CLASS(RelationManager),TYPE         ! RelationManager for JKecamatan
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JGroupKtr CLASS(FileManager),TYPE              ! FileManager for JGroupKtr
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JGroupKtr CLASS(RelationManager),TYPE          ! RelationManager for JGroupKtr
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JTransaksi CLASS(FileManager),TYPE             ! FileManager for JTransaksi
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JTransaksi CLASS(RelationManager),TYPE         ! RelationManager for JTransaksi
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END


_Hide:Access:DDTBal  &Hide:Access:DDTBal,AUTO,THREAD
_Hide:Relate:DDTBal  &Hide:Relate:DDTBal,AUTO,THREAD
_Hide:Access:DDTSunIn &Hide:Access:DDTSunIn,AUTO,THREAD
_Hide:Relate:DDTSunIn &Hide:Relate:DDTSunIn,AUTO,THREAD
_Hide:Access:DDTobat &Hide:Access:DDTobat,AUTO,THREAD
_Hide:Relate:DDTobat &Hide:Relate:DDTobat,AUTO,THREAD
_Hide:Access:IDataKtr &Hide:Access:IDataKtr,AUTO,THREAD
_Hide:Relate:IDataKtr &Hide:Relate:IDataKtr,AUTO,THREAD
_Hide:Access:DDTindak &Hide:Access:DDTindak,AUTO,THREAD
_Hide:Relate:DDTindak &Hide:Relate:DDTindak,AUTO,THREAD
_Hide:Access:JKET    &Hide:Access:JKET,AUTO,THREAD
_Hide:Relate:JKET    &Hide:Relate:JKET,AUTO,THREAD
_Hide:Access:IRekRu  &Hide:Access:IRekRu,AUTO,THREAD
_Hide:Relate:IRekRu  &Hide:Relate:IRekRu,AUTO,THREAD
_Hide:Access:HM_SUPPLIER &Hide:Access:HM_SUPPLIER,AUTO,THREAD
_Hide:Relate:HM_SUPPLIER &Hide:Relate:HM_SUPPLIER,AUTO,THREAD
_Hide:Access:HM_DOKTER &Hide:Access:HM_DOKTER,AUTO,THREAD
_Hide:Relate:HM_DOKTER &Hide:Relate:HM_DOKTER,AUTO,THREAD
_Hide:Access:HM_DOKTERLUAR &Hide:Access:HM_DOKTERLUAR,AUTO,THREAD
_Hide:Relate:HM_DOKTERLUAR &Hide:Relate:HM_DOKTERLUAR,AUTO,THREAD
_Hide:Access:HM_Kontraktor &Hide:Access:HM_Kontraktor,AUTO,THREAD
_Hide:Relate:HM_Kontraktor &Hide:Relate:HM_Kontraktor,AUTO,THREAD
_Hide:Access:HM_PASIEN &Hide:Access:HM_PASIEN,AUTO,THREAD
_Hide:Relate:HM_PASIEN &Hide:Relate:HM_PASIEN,AUTO,THREAD
_Hide:Access:HM_DIAGNOSA &Hide:Access:HM_DIAGNOSA,AUTO,THREAD
_Hide:Relate:HM_DIAGNOSA &Hide:Relate:HM_DIAGNOSA,AUTO,THREAD
_Hide:Access:JTindaka &Hide:Access:JTindaka,AUTO,THREAD
_Hide:Relate:JTindaka &Hide:Relate:JTindaka,AUTO,THREAD
_Hide:Access:DTPBalut &Hide:Access:DTPBalut,AUTO,THREAD
_Hide:Relate:DTPBalut &Hide:Relate:DTPBalut,AUTO,THREAD
_Hide:Access:JUPF    &Hide:Access:JUPF,AUTO,THREAD
_Hide:Relate:JUPF    &Hide:Relate:JUPF,AUTO,THREAD
_Hide:Access:JPoli   &Hide:Access:JPoli,AUTO,THREAD
_Hide:Relate:JPoli   &Hide:Relate:JPoli,AUTO,THREAD
_Hide:Access:JKecamatan &Hide:Access:JKecamatan,AUTO,THREAD
_Hide:Relate:JKecamatan &Hide:Relate:JKecamatan,AUTO,THREAD
_Hide:Access:JGroupKtr &Hide:Access:JGroupKtr,AUTO,THREAD
_Hide:Relate:JGroupKtr &Hide:Relate:JGroupKtr,AUTO,THREAD
_Hide:Access:JTransaksi &Hide:Access:JTransaksi,AUTO,THREAD
_Hide:Relate:JTransaksi &Hide:Relate:JTransaksi,AUTO,THREAD


APC6NBC5:DctInit PROCEDURE
  CODE
  _Hide:Access:DDTBal &= NEW(Hide:Access:DDTBal)
  _Hide:Relate:DDTBal &= NEW(Hide:Relate:DDTBal)
  _Hide:Access:DDTSunIn &= NEW(Hide:Access:DDTSunIn)
  _Hide:Relate:DDTSunIn &= NEW(Hide:Relate:DDTSunIn)
  _Hide:Access:DDTobat &= NEW(Hide:Access:DDTobat)
  _Hide:Relate:DDTobat &= NEW(Hide:Relate:DDTobat)
  _Hide:Access:IDataKtr &= NEW(Hide:Access:IDataKtr)
  _Hide:Relate:IDataKtr &= NEW(Hide:Relate:IDataKtr)
  _Hide:Access:DDTindak &= NEW(Hide:Access:DDTindak)
  _Hide:Relate:DDTindak &= NEW(Hide:Relate:DDTindak)
  _Hide:Access:JKET &= NEW(Hide:Access:JKET)
  _Hide:Relate:JKET &= NEW(Hide:Relate:JKET)
  _Hide:Access:IRekRu &= NEW(Hide:Access:IRekRu)
  _Hide:Relate:IRekRu &= NEW(Hide:Relate:IRekRu)
  _Hide:Access:HM_SUPPLIER &= NEW(Hide:Access:HM_SUPPLIER)
  _Hide:Relate:HM_SUPPLIER &= NEW(Hide:Relate:HM_SUPPLIER)
  _Hide:Access:HM_DOKTER &= NEW(Hide:Access:HM_DOKTER)
  _Hide:Relate:HM_DOKTER &= NEW(Hide:Relate:HM_DOKTER)
  _Hide:Access:HM_DOKTERLUAR &= NEW(Hide:Access:HM_DOKTERLUAR)
  _Hide:Relate:HM_DOKTERLUAR &= NEW(Hide:Relate:HM_DOKTERLUAR)
  _Hide:Access:HM_Kontraktor &= NEW(Hide:Access:HM_Kontraktor)
  _Hide:Relate:HM_Kontraktor &= NEW(Hide:Relate:HM_Kontraktor)
  _Hide:Access:HM_PASIEN &= NEW(Hide:Access:HM_PASIEN)
  _Hide:Relate:HM_PASIEN &= NEW(Hide:Relate:HM_PASIEN)
  _Hide:Access:HM_DIAGNOSA &= NEW(Hide:Access:HM_DIAGNOSA)
  _Hide:Relate:HM_DIAGNOSA &= NEW(Hide:Relate:HM_DIAGNOSA)
  _Hide:Access:JTindaka &= NEW(Hide:Access:JTindaka)
  _Hide:Relate:JTindaka &= NEW(Hide:Relate:JTindaka)
  _Hide:Access:DTPBalut &= NEW(Hide:Access:DTPBalut)
  _Hide:Relate:DTPBalut &= NEW(Hide:Relate:DTPBalut)
  _Hide:Access:JUPF &= NEW(Hide:Access:JUPF)
  _Hide:Relate:JUPF &= NEW(Hide:Relate:JUPF)
  _Hide:Access:JPoli &= NEW(Hide:Access:JPoli)
  _Hide:Relate:JPoli &= NEW(Hide:Relate:JPoli)
  _Hide:Access:JKecamatan &= NEW(Hide:Access:JKecamatan)
  _Hide:Relate:JKecamatan &= NEW(Hide:Relate:JKecamatan)
  _Hide:Access:JGroupKtr &= NEW(Hide:Access:JGroupKtr)
  _Hide:Relate:JGroupKtr &= NEW(Hide:Relate:JGroupKtr)
  _Hide:Access:JTransaksi &= NEW(Hide:Access:JTransaksi)
  _Hide:Relate:JTransaksi &= NEW(Hide:Relate:JTransaksi)
  Relate:DDTBal &= _Hide:Relate:DDTBal
  Relate:DDTSunIn &= _Hide:Relate:DDTSunIn
  Relate:DDTobat &= _Hide:Relate:DDTobat
  Relate:IDataKtr &= _Hide:Relate:IDataKtr
  Relate:DDTindak &= _Hide:Relate:DDTindak
  Relate:JKET &= _Hide:Relate:JKET
  Relate:IRekRu &= _Hide:Relate:IRekRu
  Relate:HM_SUPPLIER &= _Hide:Relate:HM_SUPPLIER
  Relate:HM_DOKTER &= _Hide:Relate:HM_DOKTER
  Relate:HM_DOKTERLUAR &= _Hide:Relate:HM_DOKTERLUAR
  Relate:HM_Kontraktor &= _Hide:Relate:HM_Kontraktor
  Relate:HM_PASIEN &= _Hide:Relate:HM_PASIEN
  Relate:HM_DIAGNOSA &= _Hide:Relate:HM_DIAGNOSA
  Relate:JTindaka &= _Hide:Relate:JTindaka
  Relate:DTPBalut &= _Hide:Relate:DTPBalut
  Relate:JUPF &= _Hide:Relate:JUPF
  Relate:JPoli &= _Hide:Relate:JPoli
  Relate:JKecamatan &= _Hide:Relate:JKecamatan
  Relate:JGroupKtr &= _Hide:Relate:JGroupKtr
  Relate:JTransaksi &= _Hide:Relate:JTransaksi


APC6NBC5:FilesInit PROCEDURE
  CODE
  _Hide:Relate:DDTBal.Init
  _Hide:Relate:DDTSunIn.Init
  _Hide:Relate:DDTobat.Init
  _Hide:Relate:IDataKtr.Init
  _Hide:Relate:DDTindak.Init
  _Hide:Relate:JKET.Init
  _Hide:Relate:IRekRu.Init
  _Hide:Relate:HM_SUPPLIER.Init
  _Hide:Relate:HM_DOKTER.Init
  _Hide:Relate:HM_DOKTERLUAR.Init
  _Hide:Relate:HM_Kontraktor.Init
  _Hide:Relate:HM_PASIEN.Init
  _Hide:Relate:HM_DIAGNOSA.Init
  _Hide:Relate:JTindaka.Init
  _Hide:Relate:DTPBalut.Init
  _Hide:Relate:JUPF.Init
  _Hide:Relate:JPoli.Init
  _Hide:Relate:JKecamatan.Init
  _Hide:Relate:JGroupKtr.Init
  _Hide:Relate:JTransaksi.Init


APC6NBC5:DctKill PROCEDURE
  CODE
  _Hide:Relate:DDTBal.Kill
  DISPOSE(_Hide:Relate:DDTBal)
  _Hide:Relate:DDTSunIn.Kill
  DISPOSE(_Hide:Relate:DDTSunIn)
  _Hide:Relate:DDTobat.Kill
  DISPOSE(_Hide:Relate:DDTobat)
  _Hide:Relate:IDataKtr.Kill
  DISPOSE(_Hide:Relate:IDataKtr)
  _Hide:Relate:DDTindak.Kill
  DISPOSE(_Hide:Relate:DDTindak)
  _Hide:Relate:JKET.Kill
  DISPOSE(_Hide:Relate:JKET)
  _Hide:Relate:IRekRu.Kill
  DISPOSE(_Hide:Relate:IRekRu)
  _Hide:Relate:HM_SUPPLIER.Kill
  DISPOSE(_Hide:Relate:HM_SUPPLIER)
  _Hide:Relate:HM_DOKTER.Kill
  DISPOSE(_Hide:Relate:HM_DOKTER)
  _Hide:Relate:HM_DOKTERLUAR.Kill
  DISPOSE(_Hide:Relate:HM_DOKTERLUAR)
  _Hide:Relate:HM_Kontraktor.Kill
  DISPOSE(_Hide:Relate:HM_Kontraktor)
  _Hide:Relate:HM_PASIEN.Kill
  DISPOSE(_Hide:Relate:HM_PASIEN)
  _Hide:Relate:HM_DIAGNOSA.Kill
  DISPOSE(_Hide:Relate:HM_DIAGNOSA)
  _Hide:Relate:JTindaka.Kill
  DISPOSE(_Hide:Relate:JTindaka)
  _Hide:Relate:DTPBalut.Kill
  DISPOSE(_Hide:Relate:DTPBalut)
  _Hide:Relate:JUPF.Kill
  DISPOSE(_Hide:Relate:JUPF)
  _Hide:Relate:JPoli.Kill
  DISPOSE(_Hide:Relate:JPoli)
  _Hide:Relate:JKecamatan.Kill
  DISPOSE(_Hide:Relate:JKecamatan)
  _Hide:Relate:JGroupKtr.Kill
  DISPOSE(_Hide:Relate:JGroupKtr)
  _Hide:Relate:JTransaksi.Kill
  DISPOSE(_Hide:Relate:JTransaksi)


Hide:Relate:DDTBal.Init PROCEDURE
  CODE
  _Hide:Access:DDTBal.Init
  SELF.Init(Access:DDTBal,1)


Hide:Access:DDTBal.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DDTB:Record
  SELF.FileNameValue = 'DDTBal'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DDTBal
  PARENT.Init
  Access:DDTBal &= SELF


Hide:Access:DDTBal.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DDTBal &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DDTBal.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DDTBal,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DDTB:KeyNoPeriksaBal,'DDTB:KeyNoPeriksaBal',0)
    SELF.AddKey(DDTB:KeyKodeBalut,'DDTB:KeyKodeBalut',0)
    SELF.AddKey(DDTB:KeyNoPe_KBalut,'DDTB:KeyNoPe_KBalut',0)
    SELF.AddKey(DDTB:Key3rec,'DDTB:Key3rec',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DDTBal.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DDTBalKT,RI:CASCADE,RI:CASCADE,DDBK:KeyNoPe_KBalut)
  SELF.AddRelationLink(DDTB:NoPeriksa,DDBK:NoPeriksa)
  SELF.AddRelationLink(DDTB:KodeBalut,DDBK:KodeBalut)

  SELF.AddRelation(Relate:DTBalut)

  SELF.AddRelation(Relate:DHPasOp)


Hide:Relate:DDTBal.Kill PROCEDURE

  CODE
  _Hide:Access:DDTBal.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:DDTBal &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DDTBal)                             ! destroy the file manager


Hide:Relate:DDTSunIn.Init PROCEDURE
  CODE
  _Hide:Access:DDTSunIn.Init
  SELF.Init(Access:DDTSunIn,1)


Hide:Access:DDTSunIn.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DDSI:Record
  SELF.FileNameValue = 'DDTSunIn'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DDTSunIn
  PARENT.Init
  Access:DDTSunIn &= SELF


Hide:Access:DDTSunIn.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DDTSunIn &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DDTSunIn.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DDTSunIn,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DDSI:KeyNoPeriksaTindak,'DDSI:KeyNoPeriksaTindak',0)
    SELF.AddKey(DDSI:KeyKodeSunIn,'Key Kode Suntik dan Infus',0)
    SELF.AddKey(DDSI:KeyNoPe_KSunIn,'DDSI:KeyNoPe_KSunIn',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DDTSunIn.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DTAsi)

  SELF.AddRelation(Relate:DHPasOp)


Hide:Relate:DDTSunIn.Kill PROCEDURE

  CODE
  _Hide:Access:DDTSunIn.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:DDTSunIn &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DDTSunIn)                           ! destroy the file manager


Hide:Relate:DDTobat.Init PROCEDURE
  CODE
  _Hide:Access:DDTobat.Init
  SELF.Init(Access:DDTobat,1)


Hide:Access:DDTobat.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DDTO:Record
  SELF.FileNameValue = 'DDTobat'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DDTobat
  PARENT.Init
  Access:DDTobat &= SELF


Hide:Access:DDTobat.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DDTobat &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DDTobat.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DDTobat,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DDTO:KeyNoPeriksaObat,'DDTO:KeyNoPeriksaObat',0)
    SELF.AddKey(DDTO:KeyKodeObat,'DDTO:KeyKodeObat',0)
    SELF.AddKey(DDTO:KeyNoPe_KTindak,'DDTO:KeyNoPe_KTindak',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DDTobat.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DTOBAT)

  SELF.AddRelation(Relate:DHPasOp)


Hide:Relate:DDTobat.Kill PROCEDURE

  CODE
  _Hide:Access:DDTobat.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:DDTobat &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DDTobat)                            ! destroy the file manager


Hide:Relate:IDataKtr.Init PROCEDURE
  CODE
  _Hide:Access:IDataKtr.Init
  SELF.Init(Access:IDataKtr,1)


Hide:Access:IDataKtr.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IDtK:Record
  SELF.FileNameValue = 'IDataKtr'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= IDataKtr
  PARENT.Init
  Access:IDataKtr &= SELF


Hide:Access:IDataKtr.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:IDataKtr &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:IDataKtr.PrimeFields PROCEDURE

  CODE
  IDtK:Tanggal = Today()                                   ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:IDataKtr.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(IDataKtr,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(IDtK:KeyNama,'IDtK:KeyNama',0)
    SELF.AddKey(IDtK:KeyNomorMr,'IDtK:KeyNomorMr',0)
    SELF.AddKey(IDtK:KeyTanggal,'IDtK:KeyTanggal',0)
    SELF.AddKey(IDtK:KeyKodeKontrak,'IDtK:KeyKodeKontrak',0)
    SELF.AddKey(IDtK:KeyNoNota,'IDtK:KeyNoNota',0)
    SELF.AddKey(IDtK:KeyNoUrut,'IDtK:KeyNoUrut',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:IDataKtr.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:JKontrak2     USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('IDtK:Kode_kontrak')
    Save:JKontrak2 = Access:JKontrak.SaveFile()
    JKon:KODE_KTR = IDtK:Kode_kontrak
    ReturnValue = Access:JKontrak.TryFetch(JKon:KeyKodeKtr)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'JKontrak')
      END
    END
    Access:JKontrak.RestoreFile(Save:JKontrak2)
  END
  RETURN ReturnValue


Hide:Relate:IDataKtr.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JKontrak)

  SELF.AddRelation(Relate:IPasien)


Hide:Relate:IDataKtr.Kill PROCEDURE

  CODE
  _Hide:Access:IDataKtr.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:IDataKtr &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:IDataKtr)                           ! destroy the file manager


Hide:Relate:DDTindak.Init PROCEDURE
  CODE
  _Hide:Access:DDTindak.Init
  SELF.Init(Access:DDTindak,1)


Hide:Access:DDTindak.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DDTN:Record
  SELF.FileNameValue = 'DDTindak'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DDTindak
  PARENT.Init
  Access:DDTindak &= SELF


Hide:Access:DDTindak.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DDTindak &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DDTindak.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DDTindak,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DDTN:KeyNoPeriksaTindak,'DDTN:KeyNoPeriksaTindak',0)
    SELF.AddKey(DDTN:KeyKodeTindak,'DDTN:KeyKodeTindak',0)
    SELF.AddKey(DDTN:KeyNoPe_KTindak,'DDTN:KeyNoPe_KTindak',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DDTindak.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DTTindak)

  SELF.AddRelation(Relate:DHPasOp)


Hide:Relate:DDTindak.Kill PROCEDURE

  CODE
  _Hide:Access:DDTindak.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:DDTindak &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DDTindak)                           ! destroy the file manager


Hide:Relate:JKET.Init PROCEDURE
  CODE
  _Hide:Access:JKET.Init
  SELF.Init(Access:JKET,1)


Hide:Access:JKET.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JKET:Record
  SELF.FileNameValue = 'JKET'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JKET
  PARENT.Init
  Access:JKET &= SELF


Hide:Access:JKET.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JKET &= NULL                                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JKET.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JKET,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JKET:KeyKode,'JKET:KeyKode',0)
    SELF.AddKey(JKET:KeyDeskripsi,'JKET:KeyDeskripsi',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JKET.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JTindaka,RI:CASCADE,RI:RESTRICT,JTin:KeyKet)
  SELF.AddRelationLink(JKET:KODE,JTin:Keterangan)


Hide:Relate:JKET.Kill PROCEDURE

  CODE
  _Hide:Access:JKET.Kill                                   ! Kill the file manager
  PARENT.Kill
  Relate:JKET &= NULL                                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JKET)                               ! destroy the file manager


Hide:Relate:IRekRu.Init PROCEDURE
  CODE
  _Hide:Access:IRekRu.Init
  SELF.Init(Access:IRekRu,1)


Hide:Access:IRekRu.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IREK:Record
  SELF.FileNameValue = 'IRekRu'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= IRekRu
  PARENT.Init
  Access:IRekRu &= SELF


Hide:Access:IRekRu.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:IRekRu &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:IRekRu.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(IRekRu,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(IREK:KeyRuang,'IREK:KeyRuang',0)
    SELF.AddKey(IREK:KeyRekap,'IREK:KeyRekap',0)
    SELF.AddKey(IREK:KeyNomorMr,'IREK:KeyNomorMr',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:IRekRu.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JPasien)

  SELF.AddRelation(Relate:ITbrRwt)


Hide:Relate:IRekRu.Kill PROCEDURE

  CODE
  _Hide:Access:IRekRu.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:IRekRu &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:IRekRu)                             ! destroy the file manager


Hide:Relate:HM_SUPPLIER.Init PROCEDURE
  CODE
  _Hide:Access:HM_SUPPLIER.Init
  SELF.Init(Access:HM_SUPPLIER,1)


Hide:Access:HM_SUPPLIER.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= HM_S:Record
  SELF.FileNameValue = 'HM_SUPPLIER'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= HM_SUPPLIER
  PARENT.Init
  Access:HM_SUPPLIER &= SELF


Hide:Access:HM_SUPPLIER.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:HM_SUPPLIER &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:HM_SUPPLIER.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(HM_SUPPLIER,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:HM_SUPPLIER.Kill PROCEDURE

  CODE
  _Hide:Access:HM_SUPPLIER.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:HM_SUPPLIER &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:HM_SUPPLIER)                        ! destroy the file manager


Hide:Relate:HM_DOKTER.Init PROCEDURE
  CODE
  _Hide:Access:HM_DOKTER.Init
  SELF.Init(Access:HM_DOKTER,1)


Hide:Access:HM_DOKTER.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= HM_D:Record
  SELF.FileNameValue = 'HM_DOKTER'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= HM_DOKTER
  PARENT.Init
  Access:HM_DOKTER &= SELF


Hide:Access:HM_DOKTER.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:HM_DOKTER &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:HM_DOKTER.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(HM_DOKTER,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:HM_DOKTER.Kill PROCEDURE

  CODE
  _Hide:Access:HM_DOKTER.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:HM_DOKTER &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:HM_DOKTER)                          ! destroy the file manager


Hide:Relate:HM_DOKTERLUAR.Init PROCEDURE
  CODE
  _Hide:Access:HM_DOKTERLUAR.Init
  SELF.Init(Access:HM_DOKTERLUAR,1)


Hide:Access:HM_DOKTERLUAR.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= HM_DL:Record
  SELF.FileNameValue = 'HM_DOKTERLUAR'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= HM_DOKTERLUAR
  PARENT.Init
  Access:HM_DOKTERLUAR &= SELF


Hide:Access:HM_DOKTERLUAR.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:HM_DOKTERLUAR &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:HM_DOKTERLUAR.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(HM_DOKTERLUAR,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:HM_DOKTERLUAR.Kill PROCEDURE

  CODE
  _Hide:Access:HM_DOKTERLUAR.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:HM_DOKTERLUAR &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:HM_DOKTERLUAR)                      ! destroy the file manager


Hide:Relate:HM_Kontraktor.Init PROCEDURE
  CODE
  _Hide:Access:HM_Kontraktor.Init
  SELF.Init(Access:HM_Kontraktor,1)


Hide:Access:HM_Kontraktor.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= HM_K:Record
  SELF.FileNameValue = 'HM_Kontraktor'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= HM_Kontraktor
  PARENT.Init
  Access:HM_Kontraktor &= SELF


Hide:Access:HM_Kontraktor.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:HM_Kontraktor &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:HM_Kontraktor.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(HM_Kontraktor,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:HM_Kontraktor.Kill PROCEDURE

  CODE
  _Hide:Access:HM_Kontraktor.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:HM_Kontraktor &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:HM_Kontraktor)                      ! destroy the file manager


Hide:Relate:HM_PASIEN.Init PROCEDURE
  CODE
  _Hide:Access:HM_PASIEN.Init
  SELF.Init(Access:HM_PASIEN,1)


Hide:Access:HM_PASIEN.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= HM_P:Record
  SELF.FileNameValue = 'HM_PASIEN'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= HM_PASIEN
  PARENT.Init
  Access:HM_PASIEN &= SELF


Hide:Access:HM_PASIEN.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:HM_PASIEN &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:HM_PASIEN.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(HM_PASIEN,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:HM_PASIEN.Kill PROCEDURE

  CODE
  _Hide:Access:HM_PASIEN.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:HM_PASIEN &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:HM_PASIEN)                          ! destroy the file manager


Hide:Relate:HM_DIAGNOSA.Init PROCEDURE
  CODE
  _Hide:Access:HM_DIAGNOSA.Init
  SELF.Init(Access:HM_DIAGNOSA,1)


Hide:Access:HM_DIAGNOSA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= HM_DI:Record
  SELF.FileNameValue = 'HM_DIAGNOSA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= HM_DIAGNOSA
  PARENT.Init
  Access:HM_DIAGNOSA &= SELF


Hide:Access:HM_DIAGNOSA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:HM_DIAGNOSA &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:HM_DIAGNOSA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(HM_DIAGNOSA,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:HM_DIAGNOSA.Kill PROCEDURE

  CODE
  _Hide:Access:HM_DIAGNOSA.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:HM_DIAGNOSA &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:HM_DIAGNOSA)                        ! destroy the file manager


Hide:Relate:JTindaka.Init PROCEDURE
  CODE
  _Hide:Access:JTindaka.Init
  SELF.Init(Access:JTindaka,1)


Hide:Access:JTindaka.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JTin:Record
  SELF.FileNameValue = 'JTindaka'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JTindaka
  PARENT.Init
  Access:JTindaka &= SELF


Hide:Access:JTindaka.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JTindaka &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JTindaka.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JTindaka,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JTin:KeyKodeTInd,'JTin:KeyKodeTInd',0)
    SELF.AddKey(JTin:KeyNamaTind,'JTin:KeyNamaTind',0)
    SELF.AddKey(JTin:KeyUpf,'JTin:KeyUpf',0)
    SELF.AddKey(JTin:KeyKet,'JTin:KeyKet',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:JTindaka.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 5
    GlobalErrors.SetField('JTin:BiayaDasar')
    IF JTin:BiayaDasar < 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRangeLow,'0')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:JTindaka.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JTDbyr,RI:CASCADE,RI:RESTRICT,JTD:KJasa)
  SELF.AddRelationLink(JTin:KodeTind,JTD:KodeJasa)

  SELF.AddRelation(Relate:UDksRjln,RI:CASCADE,RI:RESTRICT,UKS:KJasa)
  SELF.AddRelationLink(JTin:KodeTind,UKS:Kodejasa)

  SELF.AddRelation(Relate:JTTSByr,RI:None,RI:None,JTTS:KeyKode)
  SELF.AddRelationLink(JTin:KodeTind,JTTS:Kode)

  SELF.AddRelation(Relate:JTTBayar,RI:None,RI:None,JTTB:KeyKode)
  SELF.AddRelationLink(JTin:KodeTind,JTTB:Kode)

  SELF.AddRelation(Relate:ITindak,RI:CASCADE,RI:RESTRICT,ITIN:KeyKodeTindakan)
  SELF.AddRelationLink(JTin:KodeTind,ITIN:KodeTind)

  SELF.AddRelation(Relate:JKTindak,RI:None,RI:None,JKTI:KeyKodeTnd)
  SELF.AddRelationLink(JTin:KodeTind,JKTI:KodeTind)

  SELF.AddRelation(Relate:JTPasien,RI:None,RI:None,JTPA:KeyKodeTind)
  SELF.AddRelationLink(JTin:KodeTind,JTPA:KodeTindakan)

  SELF.AddRelation(Relate:JTransaksi,RI:None,RI:None,JTra:KeyKodePoli)
  SELF.AddRelationLink(JTin:KodeTind,JTra:Kode_poli)

  SELF.AddRelation(Relate:JUPF)

  SELF.AddRelation(Relate:JKET)


Hide:Relate:JTindaka.Kill PROCEDURE

  CODE
  _Hide:Access:JTindaka.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:JTindaka &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JTindaka)                           ! destroy the file manager


Hide:Relate:DTPBalut.Init PROCEDURE
  CODE
  _Hide:Access:DTPBalut.Init
  SELF.Init(Access:DTPBalut,1)


Hide:Access:DTPBalut.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DTPB:Record
  SELF.FileNameValue = 'DTPBalut'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DTPBalut
  PARENT.Init
  Access:DTPBalut &= SELF


Hide:Access:DTPBalut.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DTPBalut &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DTPBalut.PrimeFields PROCEDURE

  CODE
  DTPB:HabisPak = 1                                        ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:DTPBalut.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DTPBalut,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DTPB:KeyUPF,'DTPB:KeyUPF',0)
    SELF.AddKey(DTPB:KeyKodeBalut,'DTPB:KeyKodeBalut',0)
    SELF.AddKey(DTPB:KeyKodePaketBalut,'DTPB:KeyKodePaketBalut',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DTPBalut.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:DTBalut)


Hide:Relate:DTPBalut.Kill PROCEDURE

  CODE
  _Hide:Access:DTPBalut.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:DTPBalut &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DTPBalut)                           ! destroy the file manager


Hide:Relate:JUPF.Init PROCEDURE
  CODE
  _Hide:Access:JUPF.Init
  SELF.Init(Access:JUPF,1)


Hide:Access:JUPF.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JUPF:Record
  SELF.FileNameValue = 'JUPF'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JUPF
  PARENT.Init
  Access:JUPF &= SELF


Hide:Access:JUPF.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JUPF &= NULL                                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JUPF.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JUPF,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JUPF:KeyKodeUpf,'JUPF:KeyKodeUpf',0)
    SELF.AddKey(JUPF:KeyNamaUpf,'JUPF:KeyNamaUpf',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JUPF.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang,RI:None,RI:None,GBAR:KeyKodeUPF)
  SELF.AddRelationLink(JUPF:Kode_UPF,GBAR:Kode_UPF)

  SELF.AddRelation(Relate:JPoli,RI:CASCADE,RI:RESTRICT,JPol:ByUPF)
  SELF.AddRelationLink(JUPF:Kode_UPF,JPol:UPF)

  SELF.AddRelation(Relate:JTindaka,RI:None,RI:None,JTin:KeyUpf)
  SELF.AddRelationLink(JUPF:Kode_UPF,JTin:UPF)


Hide:Relate:JUPF.Kill PROCEDURE

  CODE
  _Hide:Access:JUPF.Kill                                   ! Kill the file manager
  PARENT.Kill
  Relate:JUPF &= NULL                                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JUPF)                               ! destroy the file manager


Hide:Relate:JPoli.Init PROCEDURE
  CODE
  _Hide:Access:JPoli.Init
  SELF.Init(Access:JPoli,1)


Hide:Access:JPoli.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JPol:Record
  SELF.FileNameValue = 'JPoli'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JPoli
  PARENT.Init
  Access:JPoli &= SELF


Hide:Access:JPoli.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JPoli &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JPoli.PrimeFields PROCEDURE

  CODE
  JPol:Tanggal = Today()                                   ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:JPoli.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JPoli,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JPol:BY_POLI,'JPol:BY_POLI',0)
    SELF.AddKey(JPol:BY_NAMA,'JPol:BY_NAMA',0)
    SELF.AddKey(JPol:ByUPF,'JPol:ByUPF',0)
    SELF.AddKey(JPol:ByNoPoli,'JPol:ByNoPoli',0)
    SELF.AddKey(JPol:KeyTempat,'JPol:KeyTempat',0)
    SELF.AddKey(JPol:KeyLantai,'JPol:KeyLantai',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JPoli.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  DO AddRelations_2
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:UJMan,RI:CASCADE,RI:RESTRICT,UJM:Key_KsaPoliKwit)
  SELF.AddRelationLink(JPol:POLIKLINIK,UJM:Poli)

  SELF.AddRelation(Relate:RI_HRInap,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,RI_HR:KeyKlinikKirim)
  SELF.AddRelationLink(JPol:POLIKLINIK,RI_HR:DikirimOleh)

  SELF.AddRelation(Relate:JTransaksi,RI:CASCADE,RI:RESTRICT,JTra:KeyKodePoli)
  SELF.AddRelationLink(JPol:POLIKLINIK,JTra:Kode_poli)

  SELF.AddRelation(Relate:JTSBayar,RI:None,RI:None,JTBS:KeyKlinik)
  SELF.AddRelationLink(JPol:POLIKLINIK,JTBS:Kode)

  SELF.AddRelation(Relate:JREKJD,RI:None,RI:None,JRJD:KeyKodeKlinik)
  SELF.AddRelationLink(JPol:POLIKLINIK,JRJD:KodePoli)

  SELF.AddRelation(Relate:IPasien,RI:CASCADE,RI:RESTRICT,IPas:KeyKlinikKirim)
  SELF.AddRelationLink(JPol:POLIKLINIK,IPas:DikirimOleh)

  SELF.AddRelation(Relate:RoPasien,RI:None,RI:None,ROPA:KeyRuangKlinik)
  SELF.AddRelationLink(JPol:POLIKLINIK,ROPA:Ruang_Klinik)

  SELF.AddRelation(Relate:LPasLab,RI:CASCADE,RI:CASCADE,LPas:keyRuang)
  SELF.AddRelationLink(JPol:POLIKLINIK,LPas:Ruang)

  SELF.AddRelation(Relate:JKPoli,RI:None,RI:None,JKPO:BY_POLI)
  SELF.AddRelationLink(JPol:POLIKLINIK,JKPO:POLIKLINIK)

  SELF.AddRelation(Relate:JTBayar,RI:None,RI:None,JTBA:KeyKlinik)
  SELF.AddRelationLink(JPol:POLIKLINIK,JTBA:Kode)

AddRelations_2 ROUTINE
  SELF.AddRelation(Relate:JTempat)

  SELF.AddRelation(Relate:JUPF)


Hide:Relate:JPoli.Kill PROCEDURE

  CODE
  _Hide:Access:JPoli.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:JPoli &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JPoli)                              ! destroy the file manager


Hide:Relate:JKecamatan.Init PROCEDURE
  CODE
  _Hide:Access:JKecamatan.Init
  SELF.Init(Access:JKecamatan,1)


Hide:Access:JKecamatan.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JKec:Record
  SELF.FileNameValue = 'JKecamatan'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JKecamatan
  PARENT.Init
  Access:JKecamatan &= SELF


Hide:Access:JKecamatan.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JKecamatan &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JKecamatan.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JKecamatan,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JKec:KeyKecamatan,'JKec:KeyKecamatan',0)
    SELF.AddKey(JKec:KeyKota,'JKec:KeyKota',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:JKecamatan.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:JKota2        USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 2
    GlobalErrors.SetField('JKec:KOTA')
    Save:JKota2 = Access:JKota.SaveFile()
    JKot:Kota = JKec:KOTA
    ReturnValue = Access:JKota.TryFetch(JKot:KeyKota)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'JKota')
      END
    END
    Access:JKota.RestoreFile(Save:JKota2)
  END
  RETURN ReturnValue


Hide:Relate:JKecamatan.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JKelurahan,RI:CASCADE,RI:RESTRICT,JKel:KeyKecamatan)
  SELF.AddRelationLink(JKec:KECAMATAN,JKel:KECAMATAN)

  SELF.AddRelation(Relate:RoPasLu,RI:CASCADE,RI:RESTRICT,RPLU:KeyKecamatan)
  SELF.AddRelationLink(JKec:KECAMATAN,RPLU:Kecamatan)

  SELF.AddRelation(Relate:JPJawab,RI:CASCADE,RI:RESTRICT,JPJ:KeyKecamatan)
  SELF.AddRelationLink(JKec:KECAMATAN,JPJ:Kecamatan)

  SELF.AddRelation(Relate:IPJawab,RI:CASCADE,RI:RESTRICT,IPJA:KeyKecamatan)
  SELF.AddRelationLink(JKec:KECAMATAN,IPJA:Kecamatan)

  SELF.AddRelation(Relate:JKota)

  SELF.AddRelation(Relate:JPasien,RI:CASCADE,RI:RESTRICT,JPas:KeyKec)
  SELF.AddRelationLink(JKec:KECAMATAN,JPas:Kecamatan)


Hide:Relate:JKecamatan.Kill PROCEDURE

  CODE
  _Hide:Access:JKecamatan.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:JKecamatan &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JKecamatan)                         ! destroy the file manager


Hide:Relate:JGroupKtr.Init PROCEDURE
  CODE
  _Hide:Access:JGroupKtr.Init
  SELF.Init(Access:JGroupKtr,1)


Hide:Access:JGroupKtr.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GrK:Record
  SELF.FileNameValue = 'JGroupKtr'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JGroupKtr
  PARENT.Init
  Access:JGroupKtr &= SELF


Hide:Access:JGroupKtr.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JGroupKtr &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JGroupKtr.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JGroupKtr,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GrK:KeyKodeGroup,'GrK:KeyKodeGroup',1)
    SELF.AddKey(GrK:KeyNamaGroup,'GrK:KeyNamaGroup',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JGroupKtr.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JKontrak,RI:CASCADE,RI:RESTRICT,JKon:KeyGroup)
  SELF.AddRelationLink(GrK:KODE_GROUP,JKon:GROUP)


Hide:Relate:JGroupKtr.Kill PROCEDURE

  CODE
  _Hide:Access:JGroupKtr.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:JGroupKtr &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JGroupKtr)                          ! destroy the file manager


Hide:Relate:JTransaksi.Init PROCEDURE
  CODE
  _Hide:Access:JTransaksi.Init
  SELF.Init(Access:JTransaksi,1)


Hide:Access:JTransaksi.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JTra:Record
  SELF.FileNameValue = 'JTransaksi'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JTransaksi
  PARENT.Init
  Access:JTransaksi &= SELF


Hide:Access:JTransaksi.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JTransaksi &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JTransaksi.PrimeFields PROCEDURE

  CODE
  JTra:Tanggal = Today()                                   ! Assign initial field value
  JTra:Baru_Lama = 'B'                                     ! Assign initial field value
  JTra:Kode_Transaksi = 1                                  ! Assign initial field value
  JTra:Konsul = 'N'                                        ! Assign initial field value
  JTra:Selesai = 'N'                                       ! Assign initial field value
  JTra:StatusRujukan = 0                                   ! Assign initial field value
  JTra:StatusMGM = 0                                       ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:JTransaksi.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JTransaksi,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JTra:KeyNomorMr,'JTra:KeyNomorMr',0)
    SELF.AddKey(JTra:descnota_jtransaksi_ik,'JTra:descnota_jtransaksi_ik',0)
    SELF.AddKey(JTra:KeyKodeDokter,'JTra:KeyKodeDokter',0)
    SELF.AddKey(JTra:KeyRujukan,'JTra:KeyRujukan',0)
    SELF.AddKey(JTra:KeyKodePoli,'JTra:KeyKodePoli',0)
    SELF.AddKey(JTra:KeyTanggal,'JTra:KeyTanggal',0)
    SELF.AddKey(JTra:KeyNoNota,'JTra:KeyNoNota',0)
    SELF.AddKey(JTra:KeySelesai,'JTra:KeySelesai',0)
    SELF.AddKey(JTra:KeyCetak,'JTra:KeyCetak',0)
    SELF.AddKey(JTra:KeyTransaksi,'JTra:KeyTransaksi',0)
    SELF.AddKey(JTra:Pegawai_JTransaksi_FK,'JTra:Pegawai_JTransaksi_FK',0)
    SELF.AddKey(JTra:Kontraktor_JTransaksi_FK,'JTra:Kontraktor_JTransaksi_FK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:JTransaksi.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 22
    GlobalErrors.SetField('JTra:LamaBaru')
    IF INSTRING(']' & JTra:LamaBaru & '[', ']0[]1[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Lama'',''Baru''')
      END
    END
  OF 24
    GlobalErrors.SetField('JTra:PDPM')
    IF INSTRING(']' & CLIP(JTra:PDPM) & '[', ']PD[]PM[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''PD'',''PM''')
      END
    END
  OF 36
    GlobalErrors.SetField('JTra:StatusDaftar')
    IF INSTRING(']' & JTra:StatusDaftar & '[', ']0[]1[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Langsung'',''Lewat Telp.''')
      END
    END
  OF 37
    GlobalErrors.SetField('JTra:StatusJawab')
    IF INSTRING(']' & JTra:StatusJawab & '[', ']0[]1[]2[]3[]4[]5[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Ayah'',''Ibu'',''Suami'',''Istri'',''Anak'',''Wali''')
      END
    END
  OF 43
    GlobalErrors.SetField('JTra:StatusRujukan')
    IF INSTRING(']' & JTra:StatusRujukan & '[', ']1[]0[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Ya'',''Tidak''')
      END
    END
  OF 48
    GlobalErrors.SetField('JTra:StatusSelisih')
    IF INSTRING(']' & JTra:StatusSelisih & '[', ']0[]1[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Beda Poli'',''Nilai''')
      END
    END
  OF 55
    GlobalErrors.SetField('JTra:StatusBayar')
    IF INSTRING(']' & JTra:StatusBayar & '[', ']0[]1[]2[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Full'',''RSI'',''Non''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:JTransaksi.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  DO AddRelations_2
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:APEPREH,RI:None,RI:None,APE3:nonota_apepreh_fk)
  SELF.AddRelationLink(JTra:No_Nota,APE3:NoNota)

  SELF.AddRelation(Relate:VAphtransJPasien)

  SELF.AddRelation(Relate:APHTRANSBPJS,RI:None,RI:None,APHB:nonota_aphtras_key)
  SELF.AddRelationLink(JTra:No_Nota,APHB:NoNota)

  SELF.AddRelation(Relate:APHTRANS,RI:None,RI:None,APH:nonota_aphtras_key)
  SELF.AddRelationLink(JTra:No_Nota,APH:NoNota)

  SELF.AddRelation(Relate:SMPegawai)

  SELF.AddRelation(Relate:JKontrak)

  SELF.AddRelation(Relate:JTPasien,RI:None,RI:None,JTPA:KeyNoNota)
  SELF.AddRelationLink(JTra:No_Nota,JTPA:No_Nota)

  SELF.AddRelation(Relate:JTDbyr,RI:CASCADE,RI:RESTRICT,JTD:KNotaJasa)
  SELF.AddRelationLink(JTra:No_Nota,JTD:NONota)

  SELF.AddRelation(Relate:JPoli)

  SELF.AddRelation(Relate:JPTmpKel)

AddRelations_2 ROUTINE
  SELF.AddRelation(Relate:JTbTransaksi)

  SELF.AddRelation(Relate:JRujuk)

  SELF.AddRelation(Relate:JTindaka)

  SELF.AddRelation(Relate:JTBayar)

  SELF.AddRelation(Relate:JDokter)

  SELF.AddRelation(Relate:JPasien)


Hide:Relate:JTransaksi.Kill PROCEDURE

  CODE
  _Hide:Access:JTransaksi.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:JTransaksi &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JTransaksi)                         ! destroy the file manager

