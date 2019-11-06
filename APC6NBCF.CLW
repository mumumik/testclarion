  MEMBER('apc6new.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
APC6NBCF:DctInit    PROCEDURE
APC6NBCF:DctKill    PROCEDURE
APC6NBCF:FilesInit  PROCEDURE
  END

Hide:Access:AFIFOIN  CLASS(FileManager),TYPE               ! FileManager for AFIFOIN
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:AFIFOIN  CLASS(RelationManager),TYPE           ! RelationManager for AFIFOIN
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:AFIFOOUT CLASS(FileManager),TYPE               ! FileManager for AFIFOOUT
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:AFIFOOUT CLASS(RelationManager),TYPE           ! RelationManager for AFIFOOUT
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:APKStok  CLASS(FileManager),TYPE               ! FileManager for APKStok
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:APKStok  CLASS(RelationManager),TYPE           ! RelationManager for APKStok
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:APDTRANSDet CLASS(FileManager),TYPE            ! FileManager for APDTRANSDet
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:APDTRANSDet CLASS(RelationManager),TYPE        ! RelationManager for APDTRANSDet
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:Apetiket CLASS(FileManager),TYPE               ! FileManager for Apetiket
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:Apetiket CLASS(RelationManager),TYPE           ! RelationManager for Apetiket
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:HM_BRGLOGISTIK CLASS(FileManager),TYPE         ! FileManager for HM_BRGLOGISTIK
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:HM_BRGLOGISTIK CLASS(RelationManager),TYPE     ! RelationManager for HM_BRGLOGISTIK
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GBarangA CLASS(FileManager),TYPE               ! FileManager for GBarangA
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GBarangA CLASS(RelationManager),TYPE           ! RelationManager for GBarangA
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END


_Hide:Access:AFIFOIN &Hide:Access:AFIFOIN,AUTO,THREAD
_Hide:Relate:AFIFOIN &Hide:Relate:AFIFOIN,AUTO,THREAD
_Hide:Access:AFIFOOUT &Hide:Access:AFIFOOUT,AUTO,THREAD
_Hide:Relate:AFIFOOUT &Hide:Relate:AFIFOOUT,AUTO,THREAD
_Hide:Access:APKStok &Hide:Access:APKStok,AUTO,THREAD
_Hide:Relate:APKStok &Hide:Relate:APKStok,AUTO,THREAD
_Hide:Access:APDTRANSDet &Hide:Access:APDTRANSDet,AUTO,THREAD
_Hide:Relate:APDTRANSDet &Hide:Relate:APDTRANSDet,AUTO,THREAD
_Hide:Access:Apetiket &Hide:Access:Apetiket,AUTO,THREAD
_Hide:Relate:Apetiket &Hide:Relate:Apetiket,AUTO,THREAD
_Hide:Access:HM_BRGLOGISTIK &Hide:Access:HM_BRGLOGISTIK,AUTO,THREAD
_Hide:Relate:HM_BRGLOGISTIK &Hide:Relate:HM_BRGLOGISTIK,AUTO,THREAD
_Hide:Access:GBarangA &Hide:Access:GBarangA,AUTO,THREAD
_Hide:Relate:GBarangA &Hide:Relate:GBarangA,AUTO,THREAD


APC6NBCF:DctInit PROCEDURE
  CODE
  _Hide:Access:AFIFOIN &= NEW(Hide:Access:AFIFOIN)
  _Hide:Relate:AFIFOIN &= NEW(Hide:Relate:AFIFOIN)
  _Hide:Access:AFIFOOUT &= NEW(Hide:Access:AFIFOOUT)
  _Hide:Relate:AFIFOOUT &= NEW(Hide:Relate:AFIFOOUT)
  _Hide:Access:APKStok &= NEW(Hide:Access:APKStok)
  _Hide:Relate:APKStok &= NEW(Hide:Relate:APKStok)
  _Hide:Access:APDTRANSDet &= NEW(Hide:Access:APDTRANSDet)
  _Hide:Relate:APDTRANSDet &= NEW(Hide:Relate:APDTRANSDet)
  _Hide:Access:Apetiket &= NEW(Hide:Access:Apetiket)
  _Hide:Relate:Apetiket &= NEW(Hide:Relate:Apetiket)
  _Hide:Access:HM_BRGLOGISTIK &= NEW(Hide:Access:HM_BRGLOGISTIK)
  _Hide:Relate:HM_BRGLOGISTIK &= NEW(Hide:Relate:HM_BRGLOGISTIK)
  _Hide:Access:GBarangA &= NEW(Hide:Access:GBarangA)
  _Hide:Relate:GBarangA &= NEW(Hide:Relate:GBarangA)
  Relate:AFIFOIN &= _Hide:Relate:AFIFOIN
  Relate:AFIFOOUT &= _Hide:Relate:AFIFOOUT
  Relate:APKStok &= _Hide:Relate:APKStok
  Relate:APDTRANSDet &= _Hide:Relate:APDTRANSDet
  Relate:Apetiket &= _Hide:Relate:Apetiket
  Relate:HM_BRGLOGISTIK &= _Hide:Relate:HM_BRGLOGISTIK
  Relate:GBarangA &= _Hide:Relate:GBarangA


APC6NBCF:FilesInit PROCEDURE
  CODE
  _Hide:Relate:AFIFOIN.Init
  _Hide:Relate:AFIFOOUT.Init
  _Hide:Relate:APKStok.Init
  _Hide:Relate:APDTRANSDet.Init
  _Hide:Relate:Apetiket.Init
  _Hide:Relate:HM_BRGLOGISTIK.Init
  _Hide:Relate:GBarangA.Init


APC6NBCF:DctKill PROCEDURE
  CODE
  _Hide:Relate:AFIFOIN.Kill
  DISPOSE(_Hide:Relate:AFIFOIN)
  _Hide:Relate:AFIFOOUT.Kill
  DISPOSE(_Hide:Relate:AFIFOOUT)
  _Hide:Relate:APKStok.Kill
  DISPOSE(_Hide:Relate:APKStok)
  _Hide:Relate:APDTRANSDet.Kill
  DISPOSE(_Hide:Relate:APDTRANSDet)
  _Hide:Relate:Apetiket.Kill
  DISPOSE(_Hide:Relate:Apetiket)
  _Hide:Relate:HM_BRGLOGISTIK.Kill
  DISPOSE(_Hide:Relate:HM_BRGLOGISTIK)
  _Hide:Relate:GBarangA.Kill
  DISPOSE(_Hide:Relate:GBarangA)


Hide:Relate:AFIFOIN.Init PROCEDURE
  CODE
  _Hide:Access:AFIFOIN.Init
  SELF.Init(Access:AFIFOIN,1)


Hide:Access:AFIFOIN.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AFI:Record
  SELF.FileNameValue = 'AFIFOIN'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AFIFOIN
  PARENT.Init
  Access:AFIFOIN &= SELF


Hide:Access:AFIFOIN.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AFIFOIN &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AFIFOIN.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AFIFOIN,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AFI:KEY1,'AFI:KEY1',0)
    SELF.AddKey(AFI:KeyBarangFIFOIN,'AFI:KeyBarangFIFOIN',0)
    SELF.AddKey(AFI:BrgNoTransApotikKey,'AFI:BrgNoTransApotikKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AFIFOIN.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:AFIFOOUT,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,AFI2:KEY1)
  SELF.AddRelationLink(AFI:Kode_Barang,AFI2:Kode_Barang)
  SELF.AddRelationLink(AFI:Mata_Uang,AFI2:Mata_Uang)
  SELF.AddRelationLink(AFI:NoTransaksi,AFI2:NoTransaksi)
  SELF.AddRelationLink(AFI:Transaksi,AFI2:Transaksi)
  SELF.AddRelationLink(AFI:Kode_Apotik,AFI2:Kode_Apotik)

  SELF.AddRelation(Relate:GBarang)


Hide:Relate:AFIFOIN.Kill PROCEDURE

  CODE
  _Hide:Access:AFIFOIN.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:AFIFOIN &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AFIFOIN)                            ! destroy the file manager


Hide:Relate:AFIFOOUT.Init PROCEDURE
  CODE
  _Hide:Access:AFIFOOUT.Init
  SELF.Init(Access:AFIFOOUT,1)


Hide:Access:AFIFOOUT.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AFI2:Record
  SELF.FileNameValue = 'AFIFOOUT'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AFIFOOUT
  PARENT.Init
  Access:AFIFOOUT &= SELF


Hide:Access:AFIFOOUT.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AFIFOOUT &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AFIFOOUT.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AFIFOOUT,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AFI2:KEY1,'AFI2:KEY1',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AFIFOOUT.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:AFIFOIN)


Hide:Relate:AFIFOOUT.Kill PROCEDURE

  CODE
  _Hide:Access:AFIFOOUT.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:AFIFOOUT &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AFIFOOUT)                           ! destroy the file manager


Hide:Relate:APKStok.Init PROCEDURE
  CODE
  _Hide:Access:APKStok.Init
  SELF.Init(Access:APKStok,1)


Hide:Access:APKStok.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APK:Record
  SELF.FileNameValue = 'APKStok'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= APKStok
  PARENT.Init
  Access:APKStok &= SELF


Hide:Access:APKStok.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:APKStok &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:APKStok.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(APKStok,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(APK:KEY1,'APK:KEY1',0)
    SELF.AddKey(APK:BrgTanggalJamFKApKStok,'APK:BrgTanggalJamFKApKStok',0)
    SELF.AddKey(APK:KeyBarangAPKSTOK,'APK:KeyBarangAPKSTOK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:APKStok.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)


Hide:Relate:APKStok.Kill PROCEDURE

  CODE
  _Hide:Access:APKStok.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:APKStok &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:APKStok)                            ! destroy the file manager


Hide:Relate:APDTRANSDet.Init PROCEDURE
  CODE
  _Hide:Access:APDTRANSDet.Init
  SELF.Init(Access:APDTRANSDet,1)


Hide:Access:APDTRANSDet.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APD2:Record
  SELF.FileNameValue = 'APDTRANSDet'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= APDTRANSDet
  PARENT.Init
  Access:APDTRANSDet &= SELF


Hide:Access:APDTRANSDet.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:APDTRANSDet &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:APDTRANSDet.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(APDTRANSDet,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(APD2:KEY1,'APD2:KEY1',0)
    SELF.AddKey(APD2:Keterangan_Apdtransdet,'APD2:Keterangan_Apdtransdet',0)
    SELF.AddKey(APD2:keterangan2_apdtransdet_key,'APD2:keterangan2_apdtransdet_key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:APDTRANSDet.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Apetiket1)

  SELF.AddRelation(Relate:Apetiket)


Hide:Relate:APDTRANSDet.Kill PROCEDURE

  CODE
  _Hide:Access:APDTRANSDet.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:APDTRANSDet &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:APDTRANSDet)                        ! destroy the file manager


Hide:Relate:Apetiket.Init PROCEDURE
  CODE
  _Hide:Access:Apetiket.Init
  SELF.Init(Access:Apetiket,1)


Hide:Access:Apetiket.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Ape:Record
  SELF.FileNameValue = 'Apetiket'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Apetiket
  PARENT.Init
  Access:Apetiket &= SELF


Hide:Access:Apetiket.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Apetiket &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Apetiket.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Apetiket,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Ape:KEY1,'Ape:KEY1',0)
    SELF.AddKey(Ape:nama_etiket_key,'Ape:nama_etiket_key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Apetiket.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:APDTRANSDet,RI:None,RI:None,APD2:Keterangan_Apdtransdet)
  SELF.AddRelationLink(Ape:No,APD2:Keterangan)


Hide:Relate:Apetiket.Kill PROCEDURE

  CODE
  _Hide:Access:Apetiket.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:Apetiket &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Apetiket)                           ! destroy the file manager


Hide:Relate:HM_BRGLOGISTIK.Init PROCEDURE
  CODE
  _Hide:Access:HM_BRGLOGISTIK.Init
  SELF.Init(Access:HM_BRGLOGISTIK,1)


Hide:Access:HM_BRGLOGISTIK.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= HM_2:Record
  SELF.FileNameValue = 'HM_BRGLOGISTIK'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= HM_BRGLOGISTIK
  PARENT.Init
  Access:HM_BRGLOGISTIK &= SELF


Hide:Access:HM_BRGLOGISTIK.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:HM_BRGLOGISTIK &= NULL                            ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:HM_BRGLOGISTIK.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(HM_BRGLOGISTIK,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:HM_BRGLOGISTIK.Kill PROCEDURE

  CODE
  _Hide:Access:HM_BRGLOGISTIK.Kill                         ! Kill the file manager
  PARENT.Kill
  Relate:HM_BRGLOGISTIK &= NULL                            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:HM_BRGLOGISTIK)                     ! destroy the file manager


Hide:Relate:GBarangA.Init PROCEDURE
  CODE
  _Hide:Access:GBarangA.Init
  SELF.Init(Access:GBarangA,1)
  SELF.SetAlias(Relate:GBarang)


Hide:Access:GBarangA.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GBA2:Record
  SELF.AliasedFile &= Access:GBarang                       !This is a File Alias, so assign aliased file manager
  SELF.FileNameValue = 'GBarangA'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GBarangA
  PARENT.Init
  Access:GBarangA &= SELF


Hide:Access:GBarangA.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GBarangA &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GBarangA.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GBarangA,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GBA2:keyNamaKandungan,'GBA2:keyNamaKandungan',0)
    SELF.AddKey(GBA2:KeyKodeBrg,'Kode Barang',0)
    SELF.AddKey(GBA2:KeyNama,'Nama Barang',0)
    SELF.AddKey(GBA2:KeyKodeUPF,'GBA2:KeyKodeUPF',0)
    SELF.AddKey(GBA2:KeyKodeKelompok,'GBA2:KeyKodeKelompok',0)
    SELF.AddKey(GBA2:KeyKodeAsliBrg,'GBA2:KeyKodeAsliBrg',0)
    SELF.AddKey(GBA2:Barcode_GBarang_FK,'GBA2:Barcode_GBarang_FK',0)
    SELF.AddKey(GBA2:Ket1_gbarang_fk,'GBA2:Ket1_gbarang_fk',0)
    SELF.AddKey(GBA2:KeyKodeKandungan,'GBA2:KeyKodeKandungan',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GBarangA.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarangAlias,RI:None,RI:None,GBAR1:Keykodealias)
  SELF.AddRelationLink(GBA2:Kode_brg,GBAR1:KodeAlias)


Hide:Relate:GBarangA.Kill PROCEDURE

  CODE
  _Hide:Access:GBarangA.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:GBarangA &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GBarangA)                           ! destroy the file manager

