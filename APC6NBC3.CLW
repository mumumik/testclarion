  MEMBER('apc6new.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
APC6NBC3:DctInit    PROCEDURE
APC6NBC3:DctKill    PROCEDURE
APC6NBC3:FilesInit  PROCEDURE
  END

Hide:Access:Apcettmp CLASS(FileManager),TYPE               ! FileManager for Apcettmp
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:Apcettmp CLASS(RelationManager),TYPE           ! RelationManager for Apcettmp
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RI_HToAptk CLASS(FileManager),TYPE             ! FileManager for RI_HToAptk
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RI_HToAptk CLASS(RelationManager),TYPE         ! RelationManager for RI_HToAptk
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:Nomor_SKR CLASS(FileManager),TYPE              ! FileManager for Nomor_SKR
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:Nomor_SKR CLASS(RelationManager),TYPE          ! RelationManager for Nomor_SKR
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:Ano_pakai CLASS(FileManager),TYPE              ! FileManager for Ano_pakai
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:Ano_pakai CLASS(RelationManager),TYPE          ! RelationManager for Ano_pakai
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:Tbstawal CLASS(FileManager),TYPE               ! FileManager for Tbstawal
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:Tbstawal CLASS(RelationManager),TYPE           ! RelationManager for Tbstawal
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GNOBBPB  CLASS(FileManager),TYPE               ! FileManager for GNOBBPB
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GNOBBPB  CLASS(RelationManager),TYPE           ! RelationManager for GNOBBPB
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GNOABPB  CLASS(FileManager),TYPE               ! FileManager for GNOABPB
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GNOABPB  CLASS(RelationManager),TYPE           ! RelationManager for GNOABPB
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:APpotkem CLASS(FileManager),TYPE               ! FileManager for APpotkem
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:APpotkem CLASS(RelationManager),TYPE           ! RelationManager for APpotkem
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ApLapBln CLASS(FileManager),TYPE               ! FileManager for ApLapBln
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ApLapBln CLASS(RelationManager),TYPE           ! RelationManager for ApLapBln
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:VGBarangNew CLASS(FileManager),TYPE            ! FileManager for VGBarangNew
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:VGBarangNew CLASS(RelationManager),TYPE        ! RelationManager for VGBarangNew
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JPASSWRD CLASS(FileManager),TYPE               ! FileManager for JPASSWRD
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JPASSWRD CLASS(RelationManager),TYPE           ! RelationManager for JPASSWRD
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JPasien  CLASS(FileManager),TYPE               ! FileManager for JPasien
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JPasien  CLASS(RelationManager),TYPE           ! RelationManager for JPasien
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:IPasien  CLASS(FileManager),TYPE               ! FileManager for IPasien
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:IPasien  CLASS(RelationManager),TYPE           ! RelationManager for IPasien
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JKontrak CLASS(FileManager),TYPE               ! FileManager for JKontrak
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JKontrak CLASS(RelationManager),TYPE           ! RelationManager for JKontrak
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ApStokop CLASS(FileManager),TYPE               ! FileManager for ApStokop
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ApStokop CLASS(RelationManager),TYPE           ! RelationManager for ApStokop
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GBarangAlias CLASS(FileManager),TYPE           ! FileManager for GBarangAlias
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GBarangAlias CLASS(RelationManager),TYPE       ! RelationManager for GBarangAlias
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ITbrRwt  CLASS(FileManager),TYPE               ! FileManager for ITbrRwt
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ITbrRwt  CLASS(RelationManager),TYPE           ! RelationManager for ITbrRwt
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GDBPBMaster CLASS(FileManager),TYPE            ! FileManager for GDBPBMaster
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GDBPBMaster CLASS(RelationManager),TYPE        ! RelationManager for GDBPBMaster
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:OKFIFOIN CLASS(FileManager),TYPE               ! FileManager for OKFIFOIN
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:OKFIFOIN CLASS(RelationManager),TYPE           ! RelationManager for OKFIFOIN
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:OKFIFOOUT CLASS(FileManager),TYPE              ! FileManager for OKFIFOOUT
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:OKFIFOOUT CLASS(RelationManager),TYPE          ! RelationManager for OKFIFOOUT
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END


_Hide:Access:Apcettmp &Hide:Access:Apcettmp,AUTO,THREAD
_Hide:Relate:Apcettmp &Hide:Relate:Apcettmp,AUTO,THREAD
_Hide:Access:RI_HToAptk &Hide:Access:RI_HToAptk,AUTO,THREAD
_Hide:Relate:RI_HToAptk &Hide:Relate:RI_HToAptk,AUTO,THREAD
_Hide:Access:Nomor_SKR &Hide:Access:Nomor_SKR,AUTO,THREAD
_Hide:Relate:Nomor_SKR &Hide:Relate:Nomor_SKR,AUTO,THREAD
_Hide:Access:Ano_pakai &Hide:Access:Ano_pakai,AUTO,THREAD
_Hide:Relate:Ano_pakai &Hide:Relate:Ano_pakai,AUTO,THREAD
_Hide:Access:Tbstawal &Hide:Access:Tbstawal,AUTO,THREAD
_Hide:Relate:Tbstawal &Hide:Relate:Tbstawal,AUTO,THREAD
_Hide:Access:GNOBBPB &Hide:Access:GNOBBPB,AUTO,THREAD
_Hide:Relate:GNOBBPB &Hide:Relate:GNOBBPB,AUTO,THREAD
_Hide:Access:GNOABPB &Hide:Access:GNOABPB,AUTO,THREAD
_Hide:Relate:GNOABPB &Hide:Relate:GNOABPB,AUTO,THREAD
_Hide:Access:APpotkem &Hide:Access:APpotkem,AUTO,THREAD
_Hide:Relate:APpotkem &Hide:Relate:APpotkem,AUTO,THREAD
_Hide:Access:ApLapBln &Hide:Access:ApLapBln,AUTO,THREAD
_Hide:Relate:ApLapBln &Hide:Relate:ApLapBln,AUTO,THREAD
_Hide:Access:VGBarangNew &Hide:Access:VGBarangNew,AUTO,THREAD
_Hide:Relate:VGBarangNew &Hide:Relate:VGBarangNew,AUTO,THREAD
_Hide:Access:JPASSWRD &Hide:Access:JPASSWRD,AUTO,THREAD
_Hide:Relate:JPASSWRD &Hide:Relate:JPASSWRD,AUTO,THREAD
_Hide:Access:JPasien &Hide:Access:JPasien,AUTO,THREAD
_Hide:Relate:JPasien &Hide:Relate:JPasien,AUTO,THREAD
_Hide:Access:IPasien &Hide:Access:IPasien,AUTO,THREAD
_Hide:Relate:IPasien &Hide:Relate:IPasien,AUTO,THREAD
_Hide:Access:JKontrak &Hide:Access:JKontrak,AUTO,THREAD
_Hide:Relate:JKontrak &Hide:Relate:JKontrak,AUTO,THREAD
_Hide:Access:ApStokop &Hide:Access:ApStokop,AUTO,THREAD
_Hide:Relate:ApStokop &Hide:Relate:ApStokop,AUTO,THREAD
_Hide:Access:GBarangAlias &Hide:Access:GBarangAlias,AUTO,THREAD
_Hide:Relate:GBarangAlias &Hide:Relate:GBarangAlias,AUTO,THREAD
_Hide:Access:ITbrRwt &Hide:Access:ITbrRwt,AUTO,THREAD
_Hide:Relate:ITbrRwt &Hide:Relate:ITbrRwt,AUTO,THREAD
_Hide:Access:GDBPBMaster &Hide:Access:GDBPBMaster,AUTO,THREAD
_Hide:Relate:GDBPBMaster &Hide:Relate:GDBPBMaster,AUTO,THREAD
_Hide:Access:OKFIFOIN &Hide:Access:OKFIFOIN,AUTO,THREAD
_Hide:Relate:OKFIFOIN &Hide:Relate:OKFIFOIN,AUTO,THREAD
_Hide:Access:OKFIFOOUT &Hide:Access:OKFIFOOUT,AUTO,THREAD
_Hide:Relate:OKFIFOOUT &Hide:Relate:OKFIFOOUT,AUTO,THREAD


APC6NBC3:DctInit PROCEDURE
  CODE
  _Hide:Access:Apcettmp &= NEW(Hide:Access:Apcettmp)
  _Hide:Relate:Apcettmp &= NEW(Hide:Relate:Apcettmp)
  _Hide:Access:RI_HToAptk &= NEW(Hide:Access:RI_HToAptk)
  _Hide:Relate:RI_HToAptk &= NEW(Hide:Relate:RI_HToAptk)
  _Hide:Access:Nomor_SKR &= NEW(Hide:Access:Nomor_SKR)
  _Hide:Relate:Nomor_SKR &= NEW(Hide:Relate:Nomor_SKR)
  _Hide:Access:Ano_pakai &= NEW(Hide:Access:Ano_pakai)
  _Hide:Relate:Ano_pakai &= NEW(Hide:Relate:Ano_pakai)
  _Hide:Access:Tbstawal &= NEW(Hide:Access:Tbstawal)
  _Hide:Relate:Tbstawal &= NEW(Hide:Relate:Tbstawal)
  _Hide:Access:GNOBBPB &= NEW(Hide:Access:GNOBBPB)
  _Hide:Relate:GNOBBPB &= NEW(Hide:Relate:GNOBBPB)
  _Hide:Access:GNOABPB &= NEW(Hide:Access:GNOABPB)
  _Hide:Relate:GNOABPB &= NEW(Hide:Relate:GNOABPB)
  _Hide:Access:APpotkem &= NEW(Hide:Access:APpotkem)
  _Hide:Relate:APpotkem &= NEW(Hide:Relate:APpotkem)
  _Hide:Access:ApLapBln &= NEW(Hide:Access:ApLapBln)
  _Hide:Relate:ApLapBln &= NEW(Hide:Relate:ApLapBln)
  _Hide:Access:VGBarangNew &= NEW(Hide:Access:VGBarangNew)
  _Hide:Relate:VGBarangNew &= NEW(Hide:Relate:VGBarangNew)
  _Hide:Access:JPASSWRD &= NEW(Hide:Access:JPASSWRD)
  _Hide:Relate:JPASSWRD &= NEW(Hide:Relate:JPASSWRD)
  _Hide:Access:JPasien &= NEW(Hide:Access:JPasien)
  _Hide:Relate:JPasien &= NEW(Hide:Relate:JPasien)
  _Hide:Access:IPasien &= NEW(Hide:Access:IPasien)
  _Hide:Relate:IPasien &= NEW(Hide:Relate:IPasien)
  _Hide:Access:JKontrak &= NEW(Hide:Access:JKontrak)
  _Hide:Relate:JKontrak &= NEW(Hide:Relate:JKontrak)
  _Hide:Access:ApStokop &= NEW(Hide:Access:ApStokop)
  _Hide:Relate:ApStokop &= NEW(Hide:Relate:ApStokop)
  _Hide:Access:GBarangAlias &= NEW(Hide:Access:GBarangAlias)
  _Hide:Relate:GBarangAlias &= NEW(Hide:Relate:GBarangAlias)
  _Hide:Access:ITbrRwt &= NEW(Hide:Access:ITbrRwt)
  _Hide:Relate:ITbrRwt &= NEW(Hide:Relate:ITbrRwt)
  _Hide:Access:GDBPBMaster &= NEW(Hide:Access:GDBPBMaster)
  _Hide:Relate:GDBPBMaster &= NEW(Hide:Relate:GDBPBMaster)
  _Hide:Access:OKFIFOIN &= NEW(Hide:Access:OKFIFOIN)
  _Hide:Relate:OKFIFOIN &= NEW(Hide:Relate:OKFIFOIN)
  _Hide:Access:OKFIFOOUT &= NEW(Hide:Access:OKFIFOOUT)
  _Hide:Relate:OKFIFOOUT &= NEW(Hide:Relate:OKFIFOOUT)
  Relate:Apcettmp &= _Hide:Relate:Apcettmp
  Relate:RI_HToAptk &= _Hide:Relate:RI_HToAptk
  Relate:Nomor_SKR &= _Hide:Relate:Nomor_SKR
  Relate:Ano_pakai &= _Hide:Relate:Ano_pakai
  Relate:Tbstawal &= _Hide:Relate:Tbstawal
  Relate:GNOBBPB &= _Hide:Relate:GNOBBPB
  Relate:GNOABPB &= _Hide:Relate:GNOABPB
  Relate:APpotkem &= _Hide:Relate:APpotkem
  Relate:ApLapBln &= _Hide:Relate:ApLapBln
  Relate:VGBarangNew &= _Hide:Relate:VGBarangNew
  Relate:JPASSWRD &= _Hide:Relate:JPASSWRD
  Relate:JPasien &= _Hide:Relate:JPasien
  Relate:IPasien &= _Hide:Relate:IPasien
  Relate:JKontrak &= _Hide:Relate:JKontrak
  Relate:ApStokop &= _Hide:Relate:ApStokop
  Relate:GBarangAlias &= _Hide:Relate:GBarangAlias
  Relate:ITbrRwt &= _Hide:Relate:ITbrRwt
  Relate:GDBPBMaster &= _Hide:Relate:GDBPBMaster
  Relate:OKFIFOIN &= _Hide:Relate:OKFIFOIN
  Relate:OKFIFOOUT &= _Hide:Relate:OKFIFOOUT


APC6NBC3:FilesInit PROCEDURE
  CODE
  _Hide:Relate:Apcettmp.Init
  _Hide:Relate:RI_HToAptk.Init
  _Hide:Relate:Nomor_SKR.Init
  _Hide:Relate:Ano_pakai.Init
  _Hide:Relate:Tbstawal.Init
  _Hide:Relate:GNOBBPB.Init
  _Hide:Relate:GNOABPB.Init
  _Hide:Relate:APpotkem.Init
  _Hide:Relate:ApLapBln.Init
  _Hide:Relate:VGBarangNew.Init
  _Hide:Relate:JPASSWRD.Init
  _Hide:Relate:JPasien.Init
  _Hide:Relate:IPasien.Init
  _Hide:Relate:JKontrak.Init
  _Hide:Relate:ApStokop.Init
  _Hide:Relate:GBarangAlias.Init
  _Hide:Relate:ITbrRwt.Init
  _Hide:Relate:GDBPBMaster.Init
  _Hide:Relate:OKFIFOIN.Init
  _Hide:Relate:OKFIFOOUT.Init


APC6NBC3:DctKill PROCEDURE
  CODE
  _Hide:Relate:Apcettmp.Kill
  DISPOSE(_Hide:Relate:Apcettmp)
  _Hide:Relate:RI_HToAptk.Kill
  DISPOSE(_Hide:Relate:RI_HToAptk)
  _Hide:Relate:Nomor_SKR.Kill
  DISPOSE(_Hide:Relate:Nomor_SKR)
  _Hide:Relate:Ano_pakai.Kill
  DISPOSE(_Hide:Relate:Ano_pakai)
  _Hide:Relate:Tbstawal.Kill
  DISPOSE(_Hide:Relate:Tbstawal)
  _Hide:Relate:GNOBBPB.Kill
  DISPOSE(_Hide:Relate:GNOBBPB)
  _Hide:Relate:GNOABPB.Kill
  DISPOSE(_Hide:Relate:GNOABPB)
  _Hide:Relate:APpotkem.Kill
  DISPOSE(_Hide:Relate:APpotkem)
  _Hide:Relate:ApLapBln.Kill
  DISPOSE(_Hide:Relate:ApLapBln)
  _Hide:Relate:VGBarangNew.Kill
  DISPOSE(_Hide:Relate:VGBarangNew)
  _Hide:Relate:JPASSWRD.Kill
  DISPOSE(_Hide:Relate:JPASSWRD)
  _Hide:Relate:JPasien.Kill
  DISPOSE(_Hide:Relate:JPasien)
  _Hide:Relate:IPasien.Kill
  DISPOSE(_Hide:Relate:IPasien)
  _Hide:Relate:JKontrak.Kill
  DISPOSE(_Hide:Relate:JKontrak)
  _Hide:Relate:ApStokop.Kill
  DISPOSE(_Hide:Relate:ApStokop)
  _Hide:Relate:GBarangAlias.Kill
  DISPOSE(_Hide:Relate:GBarangAlias)
  _Hide:Relate:ITbrRwt.Kill
  DISPOSE(_Hide:Relate:ITbrRwt)
  _Hide:Relate:GDBPBMaster.Kill
  DISPOSE(_Hide:Relate:GDBPBMaster)
  _Hide:Relate:OKFIFOIN.Kill
  DISPOSE(_Hide:Relate:OKFIFOIN)
  _Hide:Relate:OKFIFOOUT.Kill
  DISPOSE(_Hide:Relate:OKFIFOOUT)


Hide:Relate:Apcettmp.Init PROCEDURE
  CODE
  _Hide:Access:Apcettmp.Init
  SELF.Init(Access:Apcettmp,1)


Hide:Access:Apcettmp.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Apcp:Record
  SELF.FileNameValue = 'Apcettmp'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Apcettmp
  PARENT.Init
  Access:Apcettmp &= SELF


Hide:Access:Apcettmp.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Apcettmp &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Apcettmp.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Apcettmp,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Apcp:keynokd,'nomor+kode barang',0)
    SELF.AddKey(Apcp:keykodebrg,'kode Barang',0)
    SELF.AddKey(Apcp:keynmbrg,'Nama barang',0)
    SELF.AddKey(Apcp:key_no,'Apcp:key_no',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Apcettmp.Kill PROCEDURE

  CODE
  _Hide:Access:Apcettmp.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:Apcettmp &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Apcettmp)                           ! destroy the file manager


Hide:Relate:RI_HToAptk.Init PROCEDURE
  CODE
  _Hide:Access:RI_HToAptk.Init
  SELF.Init(Access:RI_HToAptk,1)


Hide:Access:RI_HToAptk.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RI_TOA:Record
  SELF.FileNameValue = 'RI_HToAptk'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RI_HToAptk
  PARENT.Init
  Access:RI_HToAptk &= SELF


Hide:Access:RI_HToAptk.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RI_HToAptk &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RI_HToAptk.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RI_HToAptk,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(RI_TOA:key_no_tran,'RI_TOA:key_no_tran',0)
    SELF.AddKey(RI_TOA:key_apotik,'RI_TOA:key_apotik',0)
    SELF.AddKey(RI_TOA:key_ruang,'RI_TOA:key_ruang',0)
    SELF.AddKey(RI_TOA:key_tanggal,'tanggal transaksi',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:RI_HToAptk.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GApotik)

  SELF.AddRelation(Relate:TBinstli)

  SELF.AddRelation(Relate:RI_DTOAPTK,RI:CASCADE,RI:RESTRICT,RIDTO:key_no_nota)
  SELF.AddRelationLink(RI_TOA:N0_tran,RIDTO:N0_tran)


Hide:Relate:RI_HToAptk.Kill PROCEDURE

  CODE
  _Hide:Access:RI_HToAptk.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:RI_HToAptk &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RI_HToAptk)                         ! destroy the file manager


Hide:Relate:Nomor_SKR.Init PROCEDURE
  CODE
  _Hide:Access:Nomor_SKR.Init
  SELF.Init(Access:Nomor_SKR,1)


Hide:Access:Nomor_SKR.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= NOM1:Record
  SELF.FileNameValue = 'Nomor_SKR'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Nomor_SKR
  PARENT.Init
  Access:Nomor_SKR &= SELF


Hide:Access:Nomor_SKR.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Nomor_SKR &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Nomor_SKR.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Nomor_SKR,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(NOM1:PrimaryKey,'NOM1:PrimaryKey',1)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Nomor_SKR.Kill PROCEDURE

  CODE
  _Hide:Access:Nomor_SKR.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:Nomor_SKR &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Nomor_SKR)                          ! destroy the file manager


Hide:Relate:Ano_pakai.Init PROCEDURE
  CODE
  _Hide:Access:Ano_pakai.Init
  SELF.Init(Access:Ano_pakai,1)


Hide:Access:Ano_pakai.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ANOp:Record
  SELF.FileNameValue = 'Ano_pakai'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Ano_pakai
  PARENT.Init
  Access:Ano_pakai &= SELF


Hide:Access:Ano_pakai.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Ano_pakai &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Ano_pakai.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Ano_pakai,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(ANOp:key_isi,'ANOp:key_isi',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Ano_pakai.Kill PROCEDURE

  CODE
  _Hide:Access:Ano_pakai.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:Ano_pakai &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Ano_pakai)                          ! destroy the file manager


Hide:Relate:Tbstawal.Init PROCEDURE
  CODE
  _Hide:Access:Tbstawal.Init
  SELF.Init(Access:Tbstawal,1)


Hide:Access:Tbstawal.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TBS:Record
  SELF.FileNameValue = 'Tbstawal'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Tbstawal
  PARENT.Init
  Access:Tbstawal &= SELF


Hide:Access:Tbstawal.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Tbstawal &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Tbstawal.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Tbstawal,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(TBS:kdap_brg,'Kode apotik + barang',0)
    SELF.AddKey(TBS:key_kd_barang,'kode barang',0)
    SELF.AddKey(TBS:KeyThnFar,'TBS:KeyThnFar',0)
    SELF.AddKey(TBS:KeyTahunSaja,'TBS:KeyTahunSaja',0)
    SELF.AddKey(TBS:KeyFarSaja,'TBS:KeyFarSaja',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Tbstawal.Kill PROCEDURE

  CODE
  _Hide:Access:Tbstawal.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:Tbstawal &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Tbstawal)                           ! destroy the file manager


Hide:Relate:GNOBBPB.Init PROCEDURE
  CODE
  _Hide:Access:GNOBBPB.Init
  SELF.Init(Access:GNOBBPB,1)


Hide:Access:GNOBBPB.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GNOBBPB:Record
  SELF.FileNameValue = 'GNOBBPB'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GNOBBPB
  PARENT.Init
  Access:GNOBBPB &= SELF


Hide:Access:GNOBBPB.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GNOBBPB &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GNOBBPB.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GNOBBPB,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GNOBBPB:KeyNomor,'GNOBBPB:KeyNomor',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GNOBBPB.Kill PROCEDURE

  CODE
  _Hide:Access:GNOBBPB.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:GNOBBPB &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GNOBBPB)                            ! destroy the file manager


Hide:Relate:GNOABPB.Init PROCEDURE
  CODE
  _Hide:Access:GNOABPB.Init
  SELF.Init(Access:GNOABPB,1)


Hide:Access:GNOABPB.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GNOABPB:Record
  SELF.FileNameValue = 'GNOABPB'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GNOABPB
  PARENT.Init
  Access:GNOABPB &= SELF


Hide:Access:GNOABPB.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GNOABPB &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GNOABPB.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GNOABPB,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GNOABPB:KeyNo,'GNOABPB:KeyNo',0)
    SELF.AddKey(GNOABPB:keynomor,'GNOABPB:keynomor',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GNOABPB.Kill PROCEDURE

  CODE
  _Hide:Access:GNOABPB.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:GNOABPB &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GNOABPB)                            ! destroy the file manager


Hide:Relate:APpotkem.Init PROCEDURE
  CODE
  _Hide:Access:APpotkem.Init
  SELF.Init(Access:APpotkem,1)


Hide:Access:APpotkem.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APP1:Record
  SELF.FileNameValue = 'APpotkem'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= APpotkem
  PARENT.Init
  Access:APpotkem &= SELF


Hide:Access:APpotkem.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:APpotkem &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:APpotkem.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(APpotkem,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APP1:key_nota_brg,'no_nota - kd barang',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:APpotkem.Kill PROCEDURE

  CODE
  _Hide:Access:APpotkem.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:APpotkem &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:APpotkem)                           ! destroy the file manager


Hide:Relate:ApLapBln.Init PROCEDURE
  CODE
  _Hide:Access:ApLapBln.Init
  SELF.Init(Access:ApLapBln,1)


Hide:Access:ApLapBln.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Alab:Record
  SELF.FileNameValue = 'ApLapBln'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ApLapBln
  PARENT.Init
  Access:ApLapBln &= SELF


Hide:Access:ApLapBln.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ApLapBln &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ApLapBln.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ApLapBln,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Alab:KeyNo,'Alab:KeyNo',0)
    SELF.AddKey(Alab:key_no_kdbrg,'nomo+ kode barang',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ApLapBln.Kill PROCEDURE

  CODE
  _Hide:Access:ApLapBln.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:ApLapBln &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ApLapBln)                           ! destroy the file manager


Hide:Relate:VGBarangNew.Init PROCEDURE
  CODE
  _Hide:Access:VGBarangNew.Init
  SELF.Init(Access:VGBarangNew,1)


Hide:Access:VGBarangNew.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GBAR2:Record
  SELF.FileNameValue = 'VGBarangNew'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= VGBarangNew
  PARENT.Init
  Access:VGBarangNew &= SELF


Hide:Access:VGBarangNew.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:VGBarangNew &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:VGBarangNew.PrimeFields PROCEDURE

  CODE
  GBAR2:Jenis_Brg = 'Obat'                                 ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:VGBarangNew.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(VGBarangNew,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GBAR2:KeyKodeBrg,'Kode Barang',0)
    SELF.AddKey(GBAR2:KeyNama,'Nama Barang',0)
    SELF.AddKey(GBAR2:KeyKodeUPF,'GBAR2:KeyKodeUPF',0)
    SELF.AddKey(GBAR2:KeyKodeKelompok,'GBAR2:KeyKodeKelompok',0)
    SELF.AddKey(GBAR2:KeyKodeAsliBrg,'GBAR2:KeyKodeAsliBrg',0)
    SELF.AddKey(GBAR2:Barcode_GBarang_FK,'GBAR2:Barcode_GBarang_FK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:VGBarangNew.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 10
    GlobalErrors.SetField('GBAR2:Status')
    IF INSTRING(']' & GBAR2:Status & '[', ']1[]2[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Aktif'',''Tidak_Aktif''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:VGBarangNew.Kill PROCEDURE

  CODE
  _Hide:Access:VGBarangNew.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:VGBarangNew &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:VGBarangNew)                        ! destroy the file manager


Hide:Relate:JPASSWRD.Init PROCEDURE
  CODE
  _Hide:Access:JPASSWRD.Init
  SELF.Init(Access:JPASSWRD,1)


Hide:Access:JPASSWRD.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JPSW:Record
  SELF.FileNameValue = 'JPASSWRD'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JPASSWRD
  PARENT.Init
  Access:JPASSWRD &= SELF


Hide:Access:JPASSWRD.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JPASSWRD &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JPASSWRD.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JPASSWRD,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JPSW:KeyUSerId,'JPSW:KeyUSerId',0)
    SELF.AddKey(JPSW:KeyId,'JPSW:KeyId',0)
    SELF.AddKey(JPSW:KEYBAGIAN,'JPSW:KEYBAGIAN',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JPASSWRD.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JPSWUP,RI:CASCADE,RI:RESTRICT,JPS1:KeyUSerId)
  SELF.AddRelationLink(JPSW:USER_ID,JPS1:USER_ID)


Hide:Relate:JPASSWRD.Kill PROCEDURE

  CODE
  _Hide:Access:JPASSWRD.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:JPASSWRD &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JPASSWRD)                           ! destroy the file manager


Hide:Relate:JPasien.Init PROCEDURE
  CODE
  _Hide:Access:JPasien.Init
  SELF.Init(Access:JPasien,1)


Hide:Access:JPasien.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JPas:Record
  SELF.FileNameValue = 'JPasien'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JPasien
  PARENT.Init
  Access:JPasien &= SELF


Hide:Access:JPasien.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JPasien &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JPasien.PrimeFields PROCEDURE

  CODE
  JPas:TanggalLahir = Today()                              ! Assign initial field value
  JPas:Jenis_kelamin = 'P'                                 ! Assign initial field value
  JPas:Kota = 'BANDUNG'                                    ! Assign initial field value
  JPas:Agama = 'ISLAM'                                     ! Assign initial field value
  JPas:Tanggal = TODAY()                                   ! Assign initial field value
  JPas:Kontrak = 'N'                                       ! Assign initial field value
  JPas:Jam = clock()                                       ! Assign initial field value
  JPas:Inap = 0                                            ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:JPasien.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JPasien,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JPas:KeyNomorMr,'Nomor RM',0)
    SELF.AddKey(JPas:KeyAlamat,'JPas:KeyAlamat',0)
    SELF.AddKey(JPas:KeyNama,'Nama',0)
    SELF.AddKey(JPas:KeyKec,'JPas:KeyKec',0)
    SELF.AddKey(JPas:KeyKembali,'Status RM',0)
    SELF.AddKey(JPas:KeyTanggal,'tgl. kunjungan',0)
    SELF.AddKey(JPas:KeyKota,'JPas:KeyKota',0)
    SELF.AddKey(JPas:KeyKelurahan,'JPas:KeyKelurahan',0)
    SELF.AddKey(JPas:Inap_JPasien_FK,'JPas:Inap_JPasien_FK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:JPasien.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('Nomor Medical record pasien')
    IF NOT INRANGE(JPas:Nomor_mr,0,99999999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'0 .. 99999999')
      END
    END
  OF 4
    GlobalErrors.SetField('Umur pasien dalam tahun')
    IF NOT INRANGE(JPas:Umur,0,999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'0 .. 999')
      END
    END
  OF 5
    GlobalErrors.SetField('Sekian Bulan')
    IF NOT INRANGE(JPas:Umur_Bln,0,11)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'0 .. 11')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:JPasien.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  DO AddRelations_2
  
  DO AddRelations_3
  
  DO AddRelations_4
  
  DO AddRelations_5
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:APObatRuang,RI:None,RI:None,APO1:Jpasien_APObatRuang_FK)
  SELF.AddRelationLink(JPas:Nomor_mr,APO1:NomorMR)

  SELF.AddRelation(Relate:TBTransResepDokterHeader_RI,RI:None,RI:None,TBT21:JPasien_TBTTransEpreRanap_FK)
  SELF.AddRelationLink(JPas:Nomor_mr,TBT21:KodePasien)

  SELF.AddRelation(Relate:APHTRANSBackup,RI:None,RI:None,APH2:by_medrec)
  SELF.AddRelationLink(JPas:Nomor_mr,APH2:Nomor_mr)

  SELF.AddRelation(Relate:APHTRANSBPJS,RI:None,RI:None,APHB:by_medrec)
  SELF.AddRelationLink(JPas:Nomor_mr,APHB:Nomor_mr)

  SELF.AddRelation(Relate:RoPasiCt,RI:None,RI:None,ROPA1:KeyNomorMr)
  SELF.AddRelationLink(JPas:Nomor_mr,ROPA1:Nomor_Mr)

  SELF.AddRelation(Relate:RoPcsRJ,RI:None,RI:None,RPCJ:keyNomorMr)
  SELF.AddRelationLink(JPas:Nomor_mr,RPCJ:Nomor_MR)

  SELF.AddRelation(Relate:OKHKeluar,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,OKH:keyNomorMR)
  SELF.AddRelationLink(JPas:Nomor_mr,OKH:NomorMR)

  SELF.AddRelation(Relate:UHksRjln,RI:None,RI:None,UHK:KMrNota)
  SELF.AddRelationLink(JPas:Nomor_mr,UHK:Mr)

  SELF.AddRelation(Relate:RoPasRJ,RI:None,RI:None,RPRJ:keyNomorMr)
  SELF.AddRelationLink(JPas:Nomor_mr,RPRJ:Nomor_MR)

  SELF.AddRelation(Relate:RI_HBSBBK,RI:CASCADE,RI:RESTRICT,RI_HSB1:pasien_ri_hsbbk_fk)
  SELF.AddRelationLink(JPas:Nomor_mr,RI_HSB1:Nomor_mr)

AddRelations_2 ROUTINE
  SELF.AddRelation(Relate:RI_HSBBK,RI:CASCADE,RI:RESTRICT,RI_HSB:pasien_ri_hsbbk_fk)
  SELF.AddRelationLink(JPas:Nomor_mr,RI_HSB:Nomor_mr)

  SELF.AddRelation(Relate:RI_LIST,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,RI_LI:KeyNomorMR)
  SELF.AddRelationLink(JPas:Nomor_mr,RI_LI:Nomor_MR)

  SELF.AddRelation(Relate:ITrPasen,RI:CASCADE,RI:RESTRICT,ITRP:KeyNomorMr)
  SELF.AddRelationLink(JPas:Nomor_mr,ITRP:Nomor_mr)

  SELF.AddRelation(Relate:RI_HRInap,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,RI_HR:PrimaryKey)
  SELF.AddRelationLink(JPas:Nomor_mr,RI_HR:Nomor_mr)

  SELF.AddRelation(Relate:ITAGUM,RI:CASCADE,RI:RESTRICT,ITGU:KeyNoMrSaja)
  SELF.AddRelationLink(JPas:Nomor_mr,ITGU:Nomor_Mr)

  SELF.AddRelation(Relate:IDiagnosa,RI:CASCADE,RI:CASCADE,IDIA:KeyNoMRSaja)
  SELF.AddRelationLink(JPas:Nomor_mr,IDIA:Nomor_MR)

  SELF.AddRelation(Relate:IPasPul,RI:CASCADE,RI:RESTRICT,IPAL:KeyNomorMr)
  SELF.AddRelationLink(JPas:Nomor_mr,IPAL:Nomor_mr)

  SELF.AddRelation(Relate:IRekRu,RI:CASCADE,RI:RESTRICT,IREK:KeyNomorMr)
  SELF.AddRelationLink(JPas:Nomor_mr,IREK:Nomor_Mr)

  SELF.AddRelation(Relate:JTTSByr,RI:None,RI:None,JTTS:KeyNomorMr)
  SELF.AddRelationLink(JPas:Nomor_mr,JTTS:Nomor_Mr)

  SELF.AddRelation(Relate:JTTBayar,RI:None,RI:None,JTTB:KeyNomorMr)
  SELF.AddRelationLink(JPas:Nomor_mr,JTTB:Nomor_Mr)

AddRelations_3 ROUTINE
  SELF.AddRelation(Relate:JTSBayar,RI:None,RI:None,JTBS:KeyNomorMr)
  SELF.AddRelationLink(JPas:Nomor_mr,JTBS:Nomor_Mr)

  SELF.AddRelation(Relate:DHPasBat,RI:CASCADE,RI:RESTRICT,DHPB:KeyNomorMr)
  SELF.AddRelationLink(JPas:Nomor_mr,DHPB:Nomor_mr)

  SELF.AddRelation(Relate:DHPToday,RI:CASCADE,RI:CASCADE,DHPT:KeyNomorMr)
  SELF.AddRelationLink(JPas:Nomor_mr,DHPT:Nomor_mr)

  SELF.AddRelation(Relate:IHNotaSm,RI:CASCADE,RI:RESTRICT,IHNS:KeyNomorMr)
  SELF.AddRelationLink(JPas:Nomor_mr,IHNS:Nomor_mr)

  SELF.AddRelation(Relate:DHPasOp,RI:CASCADE,RI:None,DHPA:KeyNomorMr)
  SELF.AddRelationLink(JPas:Nomor_mr,DHPA:Nomor_mr)

  SELF.AddRelation(Relate:OHPasOp,RI:CASCADE,RI:CASCADE,OPas:KeyNomorMr)
  SELF.AddRelationLink(JPas:Nomor_mr,OPas:Nomor_mr)

  SELF.AddRelation(Relate:RoPasien,RI:None,RI:None,ROPA:KeyNomorMr)
  SELF.AddRelationLink(JPas:Nomor_mr,ROPA:Nomor_Mr)

  SELF.AddRelation(Relate:LPasLab,RI:CASCADE,RI:None,LPas:KeyNomorMr)
  SELF.AddRelationLink(JPas:Nomor_mr,LPas:Nomor_mr)

  SELF.AddRelation(Relate:JKelPeg,RI:CASCADE,RI:RESTRICT,JKE:by_nomor)
  SELF.AddRelationLink(JPas:Nomor_mr,JKE:Nomor_mr)

  SELF.AddRelation(Relate:APHTRANS,RI:CASCADE,RI:RESTRICT,APH:by_medrec)
  SELF.AddRelationLink(JPas:Nomor_mr,APH:Nomor_mr)

AddRelations_4 ROUTINE
  SELF.AddRelation(Relate:JHKuitansi,RI:CASCADE,RI:RESTRICT,JHKU:KeyNomorMr)
  SELF.AddRelationLink(JPas:Nomor_mr,JHKU:Nomor_MR)

  SELF.AddRelation(Relate:JTPasien,RI:None,RI:None,JTPA:KeyNomorMr)
  SELF.AddRelationLink(JPas:Nomor_mr,JTPA:Nomor_Mr)

  SELF.AddRelation(Relate:JDiagnosa,RI:CASCADE,RI:RESTRICT,JDIA:KeyNomorMR)
  SELF.AddRelationLink(JPas:Nomor_mr,JDIA:Nomor_MR)

  SELF.AddRelation(Relate:JTBayar,RI:None,RI:None,JTBA:KeyNomorMr)
  SELF.AddRelationLink(JPas:Nomor_mr,JTBA:Nomor_Mr)

  SELF.AddRelation(Relate:JDataKtr,RI:CASCADE,RI:RESTRICT,JDKt:KeyNomorMr)
  SELF.AddRelationLink(JPas:Nomor_mr,JDKt:Nomor_mr)

  SELF.AddRelation(Relate:JPJawab,RI:None,RI:None,JPJ:KeyNomorMr)
  SELF.AddRelationLink(JPas:Nomor_mr,JPJ:Nomor_Mr)

  SELF.AddRelation(Relate:JAnggota,RI:CASCADE,RI:RESTRICT,JAng:KeyNomor_Mr)
  SELF.AddRelationLink(JPas:Nomor_mr,JAng:Nomor_MR)

  SELF.AddRelation(Relate:IPasien,RI:CASCADE,RI:RESTRICT,IPas:KeyNomorMr)
  SELF.AddRelationLink(JPas:Nomor_mr,IPas:Nomor_mr)

  SELF.AddRelation(Relate:JKota)

  SELF.AddRelation(Relate:JKecamatan)

AddRelations_5 ROUTINE
  SELF.AddRelation(Relate:JTransaksi,RI:None,RI:None,JTra:KeyNomorMr)
  SELF.AddRelationLink(JPas:Nomor_mr,JTra:Nomor_Mr)


Hide:Relate:JPasien.Kill PROCEDURE

  CODE
  _Hide:Access:JPasien.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:JPasien &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JPasien)                            ! destroy the file manager


Hide:Relate:IPasien.Init PROCEDURE
  CODE
  _Hide:Access:IPasien.Init
  SELF.Init(Access:IPasien,1)


Hide:Access:IPasien.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IPas:Record
  SELF.FileNameValue = 'IPasien'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= IPasien
  PARENT.Init
  Access:IPasien &= SELF


Hide:Access:IPasien.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:IPasien &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:IPasien.PrimeFields PROCEDURE

  CODE
  IPas:Kontrak = 'N'                                       ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:IPasien.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(IPasien,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(IPas:KeyNomorMr,'IPas:KeyNomorMr',0)
    SELF.AddKey(IPas:KeyTanggalKeluar,'IPas:KeyTanggalKeluar',0)
    SELF.AddKey(IPas:KeyTanggalMasuk,'IPas:KeyTanggalMasuk',0)
    SELF.AddKey(IPas:KeyNoNota,'IPas:KeyNoNota',0)
    SELF.AddKey(IPas:KeyKodeDr,'IPas:KeyKodeDr',0)
    SELF.AddKey(IPas:KeyKlinikKirim,'IPas:KeyKlinikKirim',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:IPasien.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

Save:JPasien1      USHORT,AUTO
  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('IPas:Nomor_mr')
    Save:JPasien1 = Access:JPasien.SaveFile()
    JPas:Nomor_mr = IPas:Nomor_mr
    ReturnValue = Access:JPasien.TryFetch(JPas:KeyNomorMr)
    IF ReturnValue <> Level:Benign
      IF HandleErrors                                      ! Display message if handling errors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInFile,'JPasien')
      END
    END
    Access:JPasien.RestoreFile(Save:JPasien1)
  END
  RETURN ReturnValue


Hide:Relate:IPasien.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  DO AddRelations_2
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:APHTRANSBPJS,RI:None,RI:None,APHB:by_medrec)
  SELF.AddRelationLink(IPas:Nomor_mr,APHB:Nomor_mr)

  SELF.AddRelation(Relate:ILIST,RI:CASCADE,RI:RESTRICT,ILIS:KeyNomorMR)
  SELF.AddRelationLink(IPas:Nomor_mr,ILIS:Nomor_MR)

  SELF.AddRelation(Relate:IDiagnosa,RI:CASCADE,RI:RESTRICT,IDIA:KeyNoMRSaja)
  SELF.AddRelationLink(IPas:Nomor_mr,IDIA:Nomor_MR)

  SELF.AddRelation(Relate:IVisitDr,RI:CASCADE,RI:RESTRICT,IVID:KeyNoMrRuang)
  SELF.AddRelationLink(IPas:Nomor_mr,IVID:Nomor_mr)

  SELF.AddRelation(Relate:IPJawab,RI:CASCADE,RI:RESTRICT,IPJA:KeyNomorMr)
  SELF.AddRelationLink(IPas:Nomor_mr,IPJA:Nomor_Mr)

  SELF.AddRelation(Relate:JPoli)

  SELF.AddRelation(Relate:LPasLab,RI:CASCADE,RI:RESTRICT,LPas:KeyNomorMr)
  SELF.AddRelationLink(IPas:Nomor_mr,LPas:Nomor_mr)

  SELF.AddRelation(Relate:APHTRANS,RI:CASCADE,RI:RESTRICT,APH:by_medrec)
  SELF.AddRelationLink(IPas:Nomor_mr,APH:Nomor_mr)

  SELF.AddRelation(Relate:RoPasien,RI:CASCADE,RI:RESTRICT,ROPA:KeyNomorMr)
  SELF.AddRelationLink(IPas:Nomor_mr,ROPA:Nomor_Mr)

  SELF.AddRelation(Relate:JDokter)

AddRelations_2 ROUTINE
  SELF.AddRelation(Relate:IAORDER,RI:CASCADE,RI:RESTRICT,IAOR:key_nomorRM)
  SELF.AddRelationLink(IPas:Nomor_mr,IAOR:Nomor_mr)

  SELF.AddRelation(Relate:INoPasen,RI:CASCADE,RI:RESTRICT,INOP:KeyNomorMr)
  SELF.AddRelationLink(IPas:Nomor_mr,INOP:Nomor_Mr)

  SELF.AddRelation(Relate:IByTrPas,RI:CASCADE,RI:RESTRICT,IBYT:KeyNomorMR)
  SELF.AddRelationLink(IPas:Nomor_mr,IBYT:Nomor_MR)

  SELF.AddRelation(Relate:ITrPasen,RI:CASCADE,RI:RESTRICT,ITRP:KeyNomorMr)
  SELF.AddRelationLink(IPas:Nomor_mr,ITRP:Nomor_mr)

  SELF.AddRelation(Relate:IDataKtr,RI:CASCADE,RI:RESTRICT,IDtK:KeyNomorMr)
  SELF.AddRelationLink(IPas:Nomor_mr,IDtK:Nomor_mr)

  SELF.AddRelation(Relate:JPasien)


Hide:Relate:IPasien.Kill PROCEDURE

  CODE
  _Hide:Access:IPasien.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:IPasien &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:IPasien)                            ! destroy the file manager


Hide:Relate:JKontrak.Init PROCEDURE
  CODE
  _Hide:Access:JKontrak.Init
  SELF.Init(Access:JKontrak,1)


Hide:Access:JKontrak.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JKon:Record
  SELF.FileNameValue = 'JKontrak'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JKontrak
  PARENT.Init
  Access:JKontrak &= SELF


Hide:Access:JKontrak.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JKontrak &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JKontrak.PrimeFields PROCEDURE

  CODE
  JKon:RawatJalan = 'N'                                    ! Assign initial field value
  JKon:RawatInap = 'N'                                     ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:JKontrak.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JKontrak,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JKon:KeyKodeKtr,'JKon:KeyKodeKtr',0)
    SELF.AddKey(JKon:KeyNamaKtr,'JKon:KeyNamaKtr',0)
    SELF.AddKey(JKon:KeyGroup,'JKon:KeyGroup',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JKontrak.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  DO AddRelations_2
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:APHTRANSBPJS,RI:None,RI:None,APHB:Kontrak_aphtrans_fk)
  SELF.AddRelationLink(JKon:KODE_KTR,APHB:Kontrak)

  SELF.AddRelation(Relate:APObatRuang,RI:None,RI:None,APO1:Mitra_APObatRuang_FK)
  SELF.AddRelationLink(JKon:KODE_KTR,APO1:KodeMitra)

  SELF.AddRelation(Relate:RI_HRInap)

  SELF.AddRelation(Relate:JKontrakMaster)

  SELF.AddRelation(Relate:APHTRANS,RI:None,RI:None,APH:Kontrak_aphtrans_fk)
  SELF.AddRelationLink(JKon:KODE_KTR,APH:Kontrak)

  SELF.AddRelation(Relate:JTransaksi,RI:None,RI:None,JTra:Kontraktor_JTransaksi_FK)
  SELF.AddRelationLink(JKon:KODE_KTR,JTra:Kontraktor)

  SELF.AddRelation(Relate:LKtrPers,RI:CASCADE,RI:RESTRICT,LKtP:KeyKodeKontrak)
  SELF.AddRelationLink(JKon:KODE_KTR,LKtP:KODE_KTR)

  SELF.AddRelation(Relate:JKTindak,RI:CASCADE,RI:RESTRICT,JKTI:KeyKontrak)
  SELF.AddRelationLink(JKon:KODE_KTR,JKTI:Kontrak)

  SELF.AddRelation(Relate:APOBKONT,RI:CASCADE,RI:RESTRICT,APO:by_kode_ktr)
  SELF.AddRelationLink(JKon:KODE_KTR,APO:KODE_KTR)

  SELF.AddRelation(Relate:JKPoli,RI:CASCADE,RI:RESTRICT,JKPO:KeyKontrak)
  SELF.AddRelationLink(JKon:KODE_KTR,JKPO:Kontrak)

AddRelations_2 ROUTINE
  SELF.AddRelation(Relate:IDataKtr,RI:CASCADE,RI:RESTRICT,IDtK:KeyKodeKontrak)
  SELF.AddRelationLink(JKon:KODE_KTR,IDtK:Kode_kontrak)

  SELF.AddRelation(Relate:JGroupKtr)

  SELF.AddRelation(Relate:JDataKtr,RI:CASCADE,RI:RESTRICT,JDKt:KeyKodeKontrak)
  SELF.AddRelationLink(JKon:KODE_KTR,JDKt:Kode_Kontrak)


Hide:Relate:JKontrak.Kill PROCEDURE

  CODE
  _Hide:Access:JKontrak.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:JKontrak &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JKontrak)                           ! destroy the file manager


Hide:Relate:ApStokop.Init PROCEDURE
  CODE
  _Hide:Access:ApStokop.Init
  SELF.Init(Access:ApStokop,1)


Hide:Access:ApStokop.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Apso:Record
  SELF.FileNameValue = 'ApStokop'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ApStokop
  PARENT.Init
  Access:ApStokop &= SELF


Hide:Access:ApStokop.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ApStokop &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ApStokop.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ApStokop,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Apso:kdapotik_brg,'Kode apotik + barang+tahun+bulan',0)
    SELF.AddKey(Apso:keykdap_bln_thn,'Apso:keykdap_bln_thn',0)
    SELF.AddKey(Apso:keykode_barang,'kode barang',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ApStokop.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)


Hide:Relate:ApStokop.Kill PROCEDURE

  CODE
  _Hide:Access:ApStokop.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:ApStokop &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ApStokop)                           ! destroy the file manager


Hide:Relate:GBarangAlias.Init PROCEDURE
  CODE
  _Hide:Access:GBarangAlias.Init
  SELF.Init(Access:GBarangAlias,1)


Hide:Access:GBarangAlias.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GBAR1:Record
  SELF.FileNameValue = 'GBarangAlias'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GBarangAlias
  PARENT.Init
  Access:GBarangAlias &= SELF


Hide:Access:GBarangAlias.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GBarangAlias &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GBarangAlias.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GBarangAlias,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GBAR1:KeyKodeBrg,'Kode Barang',0)
    SELF.AddKey(GBAR1:Keykodealias,'Nama Barang',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GBarangAlias.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarangA)

  SELF.AddRelation(Relate:GBarang)


Hide:Relate:GBarangAlias.Kill PROCEDURE

  CODE
  _Hide:Access:GBarangAlias.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:GBarangAlias &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GBarangAlias)                       ! destroy the file manager


Hide:Relate:ITbrRwt.Init PROCEDURE
  CODE
  _Hide:Access:ITbrRwt.Init
  SELF.Init(Access:ITbrRwt,1)


Hide:Access:ITbrRwt.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ITbr:Record
  SELF.FileNameValue = 'ITbrRwt'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ITbrRwt
  PARENT.Init
  Access:ITbrRwt &= SELF


Hide:Access:ITbrRwt.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ITbrRwt &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ITbrRwt.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ITbrRwt,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(ITbr:KeyKodeRuang,'ITbr:KeyKodeRuang',0)
    SELF.AddKey(ITbr:KeyNamaRuang,'ITbr:KeyNamaRuang',0)
    SELF.AddKey(ITbr:KeyKodeKelas,'ITbr:KeyKodeKelas',0)
    SELF.AddKey(ITbr:KeyTempat,'ITbr:KeyTempat',0)
    SELF.AddKey(ITbr:KPDPM,'ITbr:KPDPM',0)
    SELF.AddKey(ITbr:Induk_Itbrwt_FK,'ITbr:Induk_Itbrwt_FK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ITbrRwt.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  DO AddRelations_2
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:TBinstli)

  SELF.AddRelation(Relate:TBTransResepDokterHeader_RIHarian,RI:None,RI:None,TBT211:koderuang_epreranapharian_fk)
  SELF.AddRelationLink(ITbr:KODE_RUANG,TBT211:KodeRuang)

  SELF.AddRelation(Relate:Aphtransadd,RI:None,RI:None,APH1:itbrrwt_ruangan_fk)
  SELF.AddRelationLink(ITbr:KODE_RUANG,APH1:Ruangan)

  SELF.AddRelation(Relate:RI_HRInap,RI:None,RI:None,RI_HR:Kruang)
  SELF.AddRelationLink(ITbr:KODE_RUANG,RI_HR:LastRoom)

  SELF.AddRelation(Relate:JTempat)

  SELF.AddRelation(Relate:RI_Stok,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,RI_ST:Ruangan_RI_Stok_FK)
  SELF.AddRelationLink(ITbr:KODE_RUANG,RI_ST:Kode_Ruang)

  SELF.AddRelation(Relate:LsPel,RI:CASCADE,RI:None,LsPn:keykoderuang)
  SELF.AddRelationLink(ITbr:KODE_RUANG,LsPn:Ruang)

  SELF.AddRelation(Relate:ITr_Umka,RI:CASCADE,RI:RESTRICT,Tr_Um:K_ruangan)
  SELF.AddRelationLink(ITbr:KODE_RUANG,Tr_Um:Kode_ruangan)

  SELF.AddRelation(Relate:RI_PinRuang,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,RI_PI:KeyKodeRuang)
  SELF.AddRelationLink(ITbr:KODE_RUANG,RI_PI:Ruang)

  SELF.AddRelation(Relate:ITAGUM,RI:CASCADE,RI:RESTRICT,ITGU:KeyRuang)
  SELF.AddRelationLink(ITbr:KODE_RUANG,ITGU:Ruang)

AddRelations_2 ROUTINE
  SELF.AddRelation(Relate:IRekRu,RI:CASCADE,RI:RESTRICT,IREK:KeyRuang)
  SELF.AddRelationLink(ITbr:KODE_RUANG,IREK:Ruang)

  SELF.AddRelation(Relate:DHPasOp,RI:CASCADE,RI:RESTRICT,DHPA:KeyKodeRuang)
  SELF.AddRelationLink(ITbr:KODE_RUANG,DHPA:Ruang)

  SELF.AddRelation(Relate:RoPasien,RI:CASCADE,RI:RESTRICT,ROPA:KeyRuangKlinik)
  SELF.AddRelationLink(ITbr:KODE_RUANG,ROPA:Ruang_Klinik)

  SELF.AddRelation(Relate:ITbKelas)

  SELF.AddRelation(Relate:INoPasen,RI:CASCADE,RI:RESTRICT,INOP:KeyKodeRuang)
  SELF.AddRelationLink(ITbr:KODE_RUANG,INOP:Ruang)

  SELF.AddRelation(Relate:IByTrPas,RI:CASCADE,RI:RESTRICT,IBYT:KeyRuang)
  SELF.AddRelationLink(ITbr:KODE_RUANG,IBYT:Ruang)

  SELF.AddRelation(Relate:ITrPasen,RI:CASCADE,RI:RESTRICT,ITRP:KeyKodeRuang)
  SELF.AddRelationLink(ITbr:KODE_RUANG,ITRP:Ruang)


Hide:Relate:ITbrRwt.Kill PROCEDURE

  CODE
  _Hide:Access:ITbrRwt.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:ITbrRwt &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ITbrRwt)                            ! destroy the file manager


Hide:Relate:GDBPBMaster.Init PROCEDURE
  CODE
  _Hide:Access:GDBPBMaster.Init
  SELF.Init(Access:GDBPBMaster,1)


Hide:Access:GDBPBMaster.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GDBPB1:Record
  SELF.FileNameValue = 'GDBPBMaster'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GDBPBMaster
  PARENT.Init
  Access:GDBPBMaster &= SELF


Hide:Access:GDBPBMaster.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GDBPBMaster &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GDBPBMaster.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GDBPBMaster,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GDBPB1:KeyNoBPB,'No BPB',0)
    SELF.AddKey(GDBPB1:KeyBPBItem,'BPB Item',0)
    SELF.AddKey(GDBPB1:KeyKodeBarang,'Kode Barang',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GDBPBMaster.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:GHBPBMaster)


Hide:Relate:GDBPBMaster.Kill PROCEDURE

  CODE
  _Hide:Access:GDBPBMaster.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:GDBPBMaster &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GDBPBMaster)                        ! destroy the file manager


Hide:Relate:OKFIFOIN.Init PROCEDURE
  CODE
  _Hide:Access:OKFIFOIN.Init
  SELF.Init(Access:OKFIFOIN,1)


Hide:Access:OKFIFOIN.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= FIF1:Record
  SELF.FileNameValue = 'OKFIFOIN'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OKFIFOIN
  PARENT.Init
  Access:OKFIFOIN &= SELF


Hide:Access:OKFIFOIN.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OKFIFOIN &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OKFIFOIN.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OKFIFOIN,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(FIF1:KEY1,'FIF1:KEY1',0)
    SELF.AddKey(FIF1:kodebrg_notrans_key,'FIF1:kodebrg_notrans_key',0)
    SELF.AddKey(FIF1:MataUang_OKFIFOIN_FK,'FIF1:MataUang_OKFIFOIN_FK',0)
    SELF.AddKey(FIF1:barang_OKFIFOIN_FK,'FIF1:barang_OKFIFOIN_FK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:OKFIFOIN.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:OKFIFOOUT,RI:CASCADE,RI:RESTRICT,FIF21:KEY1)
  SELF.AddRelationLink(FIF1:Kode_Barang,FIF21:Kode_Barang)
  SELF.AddRelationLink(FIF1:Mata_Uang,FIF21:Mata_Uang)
  SELF.AddRelationLink(FIF1:NoTransaksi,FIF21:NoTransaksi)
  SELF.AddRelationLink(FIF1:Transaksi,FIF21:Transaksi)

  SELF.AddRelation(Relate:GBarang)


Hide:Relate:OKFIFOIN.Kill PROCEDURE

  CODE
  _Hide:Access:OKFIFOIN.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:OKFIFOIN &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OKFIFOIN)                           ! destroy the file manager


Hide:Relate:OKFIFOOUT.Init PROCEDURE
  CODE
  _Hide:Access:OKFIFOOUT.Init
  SELF.Init(Access:OKFIFOOUT,1)


Hide:Access:OKFIFOOUT.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= FIF21:Record
  SELF.FileNameValue = 'OKFIFOOUT'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OKFIFOOUT
  PARENT.Init
  Access:OKFIFOOUT &= SELF


Hide:Access:OKFIFOOUT.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OKFIFOOUT &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OKFIFOOUT.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OKFIFOOUT,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(FIF21:KEY1,'FIF21:KEY1',0)
    SELF.AddKey(FIF21:FIFOIN_FIFOOUT_FK,'FIF21:FIFOIN_FIFOOUT_FK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:OKFIFOOUT.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:OKFIFOIN)


Hide:Relate:OKFIFOOUT.Kill PROCEDURE

  CODE
  _Hide:Access:OKFIFOOUT.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:OKFIFOOUT &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OKFIFOOUT)                          ! destroy the file manager

