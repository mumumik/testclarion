  MEMBER('apc6new.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
APC6NBC6:DctInit    PROCEDURE
APC6NBC6:DctKill    PROCEDURE
APC6NBC6:FilesInit  PROCEDURE
  END

Hide:Access:JDataKtr CLASS(FileManager),TYPE               ! FileManager for JDataKtr
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JDataKtr CLASS(RelationManager),TYPE           ! RelationManager for JDataKtr
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:INSaldoawal CLASS(FileManager),TYPE            ! FileManager for INSaldoawal
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:INSaldoawal CLASS(RelationManager),TYPE        ! RelationManager for INSaldoawal
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JTbTransaksi CLASS(FileManager),TYPE           ! FileManager for JTbTransaksi
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JTbTransaksi CLASS(RelationManager),TYPE       ! RelationManager for JTbTransaksi
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DTPBena  CLASS(FileManager),TYPE               ! FileManager for DTPBena
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DTPBena  CLASS(RelationManager),TYPE           ! RelationManager for DTPBena
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DTTin_Ak CLASS(FileManager),TYPE               ! FileManager for DTTin_Ak
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DTTin_Ak CLASS(RelationManager),TYPE           ! RelationManager for DTTin_Ak
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DTTindHr CLASS(FileManager),TYPE               ! FileManager for DTTindHr
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DTTindHr CLASS(RelationManager),TYPE           ! RelationManager for DTTindHr
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:DTPLain  CLASS(FileManager),TYPE               ! FileManager for DTPLain
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:DTPLain  CLASS(RelationManager),TYPE           ! RelationManager for DTPLain
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JKota    CLASS(FileManager),TYPE               ! FileManager for JKota
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JKota    CLASS(RelationManager),TYPE           ! RelationManager for JKota
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JStatusDr CLASS(FileManager),TYPE              ! FileManager for JStatusDr
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JStatusDr CLASS(RelationManager),TYPE          ! RelationManager for JStatusDr
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JDKuitansi CLASS(FileManager),TYPE             ! FileManager for JDKuitansi
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JDKuitansi CLASS(RelationManager),TYPE         ! RelationManager for JDKuitansi
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:RI_KStok CLASS(FileManager),TYPE               ! FileManager for RI_KStok
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:RI_KStok CLASS(RelationManager),TYPE           ! RelationManager for RI_KStok
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ITrPasen CLASS(FileManager),TYPE               ! FileManager for ITrPasen
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ITrPasen CLASS(RelationManager),TYPE           ! RelationManager for ITrPasen
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:AAwalBln CLASS(FileManager),TYPE               ! FileManager for AAwalBln
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:AAwalBln CLASS(RelationManager),TYPE           ! RelationManager for AAwalBln
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:INDDKB   CLASS(FileManager),TYPE               ! FileManager for INDDKB
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:INDDKB   CLASS(RelationManager),TYPE           ! RelationManager for INDDKB
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JAnggota CLASS(FileManager),TYPE               ! FileManager for JAnggota
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JAnggota CLASS(RelationManager),TYPE           ! RelationManager for JAnggota
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JPJawab  CLASS(FileManager),TYPE               ! FileManager for JPJawab
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JPJawab  CLASS(RelationManager),TYPE           ! RelationManager for JPJawab
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:IPJawab  CLASS(FileManager),TYPE               ! FileManager for IPJawab
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:IPJawab  CLASS(RelationManager),TYPE           ! RelationManager for IPJawab
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JTempat  CLASS(FileManager),TYPE               ! FileManager for JTempat
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JTempat  CLASS(RelationManager),TYPE           ! RelationManager for JTempat
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JKPoli   CLASS(FileManager),TYPE               ! FileManager for JKPoli
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JKPoli   CLASS(RelationManager),TYPE           ! RelationManager for JKPoli
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ITmpPas  CLASS(FileManager),TYPE               ! FileManager for ITmpPas
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ITmpPas  CLASS(RelationManager),TYPE           ! RelationManager for ITmpPas
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END


_Hide:Access:JDataKtr &Hide:Access:JDataKtr,AUTO,THREAD
_Hide:Relate:JDataKtr &Hide:Relate:JDataKtr,AUTO,THREAD
_Hide:Access:INSaldoawal &Hide:Access:INSaldoawal,AUTO,THREAD
_Hide:Relate:INSaldoawal &Hide:Relate:INSaldoawal,AUTO,THREAD
_Hide:Access:JTbTransaksi &Hide:Access:JTbTransaksi,AUTO,THREAD
_Hide:Relate:JTbTransaksi &Hide:Relate:JTbTransaksi,AUTO,THREAD
_Hide:Access:DTPBena &Hide:Access:DTPBena,AUTO,THREAD
_Hide:Relate:DTPBena &Hide:Relate:DTPBena,AUTO,THREAD
_Hide:Access:DTTin_Ak &Hide:Access:DTTin_Ak,AUTO,THREAD
_Hide:Relate:DTTin_Ak &Hide:Relate:DTTin_Ak,AUTO,THREAD
_Hide:Access:DTTindHr &Hide:Access:DTTindHr,AUTO,THREAD
_Hide:Relate:DTTindHr &Hide:Relate:DTTindHr,AUTO,THREAD
_Hide:Access:DTPLain &Hide:Access:DTPLain,AUTO,THREAD
_Hide:Relate:DTPLain &Hide:Relate:DTPLain,AUTO,THREAD
_Hide:Access:JKota   &Hide:Access:JKota,AUTO,THREAD
_Hide:Relate:JKota   &Hide:Relate:JKota,AUTO,THREAD
_Hide:Access:JStatusDr &Hide:Access:JStatusDr,AUTO,THREAD
_Hide:Relate:JStatusDr &Hide:Relate:JStatusDr,AUTO,THREAD
_Hide:Access:JDKuitansi &Hide:Access:JDKuitansi,AUTO,THREAD
_Hide:Relate:JDKuitansi &Hide:Relate:JDKuitansi,AUTO,THREAD
_Hide:Access:RI_KStok &Hide:Access:RI_KStok,AUTO,THREAD
_Hide:Relate:RI_KStok &Hide:Relate:RI_KStok,AUTO,THREAD
_Hide:Access:ITrPasen &Hide:Access:ITrPasen,AUTO,THREAD
_Hide:Relate:ITrPasen &Hide:Relate:ITrPasen,AUTO,THREAD
_Hide:Access:AAwalBln &Hide:Access:AAwalBln,AUTO,THREAD
_Hide:Relate:AAwalBln &Hide:Relate:AAwalBln,AUTO,THREAD
_Hide:Access:INDDKB  &Hide:Access:INDDKB,AUTO,THREAD
_Hide:Relate:INDDKB  &Hide:Relate:INDDKB,AUTO,THREAD
_Hide:Access:JAnggota &Hide:Access:JAnggota,AUTO,THREAD
_Hide:Relate:JAnggota &Hide:Relate:JAnggota,AUTO,THREAD
_Hide:Access:JPJawab &Hide:Access:JPJawab,AUTO,THREAD
_Hide:Relate:JPJawab &Hide:Relate:JPJawab,AUTO,THREAD
_Hide:Access:IPJawab &Hide:Access:IPJawab,AUTO,THREAD
_Hide:Relate:IPJawab &Hide:Relate:IPJawab,AUTO,THREAD
_Hide:Access:JTempat &Hide:Access:JTempat,AUTO,THREAD
_Hide:Relate:JTempat &Hide:Relate:JTempat,AUTO,THREAD
_Hide:Access:JKPoli  &Hide:Access:JKPoli,AUTO,THREAD
_Hide:Relate:JKPoli  &Hide:Relate:JKPoli,AUTO,THREAD
_Hide:Access:ITmpPas &Hide:Access:ITmpPas,AUTO,THREAD
_Hide:Relate:ITmpPas &Hide:Relate:ITmpPas,AUTO,THREAD


APC6NBC6:DctInit PROCEDURE
  CODE
  _Hide:Access:JDataKtr &= NEW(Hide:Access:JDataKtr)
  _Hide:Relate:JDataKtr &= NEW(Hide:Relate:JDataKtr)
  _Hide:Access:INSaldoawal &= NEW(Hide:Access:INSaldoawal)
  _Hide:Relate:INSaldoawal &= NEW(Hide:Relate:INSaldoawal)
  _Hide:Access:JTbTransaksi &= NEW(Hide:Access:JTbTransaksi)
  _Hide:Relate:JTbTransaksi &= NEW(Hide:Relate:JTbTransaksi)
  _Hide:Access:DTPBena &= NEW(Hide:Access:DTPBena)
  _Hide:Relate:DTPBena &= NEW(Hide:Relate:DTPBena)
  _Hide:Access:DTTin_Ak &= NEW(Hide:Access:DTTin_Ak)
  _Hide:Relate:DTTin_Ak &= NEW(Hide:Relate:DTTin_Ak)
  _Hide:Access:DTTindHr &= NEW(Hide:Access:DTTindHr)
  _Hide:Relate:DTTindHr &= NEW(Hide:Relate:DTTindHr)
  _Hide:Access:DTPLain &= NEW(Hide:Access:DTPLain)
  _Hide:Relate:DTPLain &= NEW(Hide:Relate:DTPLain)
  _Hide:Access:JKota &= NEW(Hide:Access:JKota)
  _Hide:Relate:JKota &= NEW(Hide:Relate:JKota)
  _Hide:Access:JStatusDr &= NEW(Hide:Access:JStatusDr)
  _Hide:Relate:JStatusDr &= NEW(Hide:Relate:JStatusDr)
  _Hide:Access:JDKuitansi &= NEW(Hide:Access:JDKuitansi)
  _Hide:Relate:JDKuitansi &= NEW(Hide:Relate:JDKuitansi)
  _Hide:Access:RI_KStok &= NEW(Hide:Access:RI_KStok)
  _Hide:Relate:RI_KStok &= NEW(Hide:Relate:RI_KStok)
  _Hide:Access:ITrPasen &= NEW(Hide:Access:ITrPasen)
  _Hide:Relate:ITrPasen &= NEW(Hide:Relate:ITrPasen)
  _Hide:Access:AAwalBln &= NEW(Hide:Access:AAwalBln)
  _Hide:Relate:AAwalBln &= NEW(Hide:Relate:AAwalBln)
  _Hide:Access:INDDKB &= NEW(Hide:Access:INDDKB)
  _Hide:Relate:INDDKB &= NEW(Hide:Relate:INDDKB)
  _Hide:Access:JAnggota &= NEW(Hide:Access:JAnggota)
  _Hide:Relate:JAnggota &= NEW(Hide:Relate:JAnggota)
  _Hide:Access:JPJawab &= NEW(Hide:Access:JPJawab)
  _Hide:Relate:JPJawab &= NEW(Hide:Relate:JPJawab)
  _Hide:Access:IPJawab &= NEW(Hide:Access:IPJawab)
  _Hide:Relate:IPJawab &= NEW(Hide:Relate:IPJawab)
  _Hide:Access:JTempat &= NEW(Hide:Access:JTempat)
  _Hide:Relate:JTempat &= NEW(Hide:Relate:JTempat)
  _Hide:Access:JKPoli &= NEW(Hide:Access:JKPoli)
  _Hide:Relate:JKPoli &= NEW(Hide:Relate:JKPoli)
  _Hide:Access:ITmpPas &= NEW(Hide:Access:ITmpPas)
  _Hide:Relate:ITmpPas &= NEW(Hide:Relate:ITmpPas)
  Relate:JDataKtr &= _Hide:Relate:JDataKtr
  Relate:INSaldoawal &= _Hide:Relate:INSaldoawal
  Relate:JTbTransaksi &= _Hide:Relate:JTbTransaksi
  Relate:DTPBena &= _Hide:Relate:DTPBena
  Relate:DTTin_Ak &= _Hide:Relate:DTTin_Ak
  Relate:DTTindHr &= _Hide:Relate:DTTindHr
  Relate:DTPLain &= _Hide:Relate:DTPLain
  Relate:JKota &= _Hide:Relate:JKota
  Relate:JStatusDr &= _Hide:Relate:JStatusDr
  Relate:JDKuitansi &= _Hide:Relate:JDKuitansi
  Relate:RI_KStok &= _Hide:Relate:RI_KStok
  Relate:ITrPasen &= _Hide:Relate:ITrPasen
  Relate:AAwalBln &= _Hide:Relate:AAwalBln
  Relate:INDDKB &= _Hide:Relate:INDDKB
  Relate:JAnggota &= _Hide:Relate:JAnggota
  Relate:JPJawab &= _Hide:Relate:JPJawab
  Relate:IPJawab &= _Hide:Relate:IPJawab
  Relate:JTempat &= _Hide:Relate:JTempat
  Relate:JKPoli &= _Hide:Relate:JKPoli
  Relate:ITmpPas &= _Hide:Relate:ITmpPas


APC6NBC6:FilesInit PROCEDURE
  CODE
  _Hide:Relate:JDataKtr.Init
  _Hide:Relate:INSaldoawal.Init
  _Hide:Relate:JTbTransaksi.Init
  _Hide:Relate:DTPBena.Init
  _Hide:Relate:DTTin_Ak.Init
  _Hide:Relate:DTTindHr.Init
  _Hide:Relate:DTPLain.Init
  _Hide:Relate:JKota.Init
  _Hide:Relate:JStatusDr.Init
  _Hide:Relate:JDKuitansi.Init
  _Hide:Relate:RI_KStok.Init
  _Hide:Relate:ITrPasen.Init
  _Hide:Relate:AAwalBln.Init
  _Hide:Relate:INDDKB.Init
  _Hide:Relate:JAnggota.Init
  _Hide:Relate:JPJawab.Init
  _Hide:Relate:IPJawab.Init
  _Hide:Relate:JTempat.Init
  _Hide:Relate:JKPoli.Init
  _Hide:Relate:ITmpPas.Init


APC6NBC6:DctKill PROCEDURE
  CODE
  _Hide:Relate:JDataKtr.Kill
  DISPOSE(_Hide:Relate:JDataKtr)
  _Hide:Relate:INSaldoawal.Kill
  DISPOSE(_Hide:Relate:INSaldoawal)
  _Hide:Relate:JTbTransaksi.Kill
  DISPOSE(_Hide:Relate:JTbTransaksi)
  _Hide:Relate:DTPBena.Kill
  DISPOSE(_Hide:Relate:DTPBena)
  _Hide:Relate:DTTin_Ak.Kill
  DISPOSE(_Hide:Relate:DTTin_Ak)
  _Hide:Relate:DTTindHr.Kill
  DISPOSE(_Hide:Relate:DTTindHr)
  _Hide:Relate:DTPLain.Kill
  DISPOSE(_Hide:Relate:DTPLain)
  _Hide:Relate:JKota.Kill
  DISPOSE(_Hide:Relate:JKota)
  _Hide:Relate:JStatusDr.Kill
  DISPOSE(_Hide:Relate:JStatusDr)
  _Hide:Relate:JDKuitansi.Kill
  DISPOSE(_Hide:Relate:JDKuitansi)
  _Hide:Relate:RI_KStok.Kill
  DISPOSE(_Hide:Relate:RI_KStok)
  _Hide:Relate:ITrPasen.Kill
  DISPOSE(_Hide:Relate:ITrPasen)
  _Hide:Relate:AAwalBln.Kill
  DISPOSE(_Hide:Relate:AAwalBln)
  _Hide:Relate:INDDKB.Kill
  DISPOSE(_Hide:Relate:INDDKB)
  _Hide:Relate:JAnggota.Kill
  DISPOSE(_Hide:Relate:JAnggota)
  _Hide:Relate:JPJawab.Kill
  DISPOSE(_Hide:Relate:JPJawab)
  _Hide:Relate:IPJawab.Kill
  DISPOSE(_Hide:Relate:IPJawab)
  _Hide:Relate:JTempat.Kill
  DISPOSE(_Hide:Relate:JTempat)
  _Hide:Relate:JKPoli.Kill
  DISPOSE(_Hide:Relate:JKPoli)
  _Hide:Relate:ITmpPas.Kill
  DISPOSE(_Hide:Relate:ITmpPas)


Hide:Relate:JDataKtr.Init PROCEDURE
  CODE
  _Hide:Access:JDataKtr.Init
  SELF.Init(Access:JDataKtr,1)


Hide:Access:JDataKtr.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JDKt:Record
  SELF.FileNameValue = 'JDataKtr'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JDataKtr
  PARENT.Init
  Access:JDataKtr &= SELF


Hide:Access:JDataKtr.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JDataKtr &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JDataKtr.PrimeFields PROCEDURE

  CODE
  JDKt:Tgl_surat_pgt = Today()                             ! Assign initial field value
  JDKt:Tanggal = Today()                                   ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:JDataKtr.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JDataKtr,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JDKt:KeyNomorMr,'JDKt:KeyNomorMr',0)
    SELF.AddKey(JDKt:KeyNama,'JDKt:KeyNama',0)
    SELF.AddKey(JDKt:KeyKodeKontrak,'JDKt:KeyKodeKontrak',0)
    SELF.AddKey(JDKt:KeyTanggal,'JDKt:KeyTanggal',0)
    SELF.AddKey(JDKt:KeyNoUrut,'JDKt:KeyNoUrut',0)
    SELF.AddKey(JDKt:KeyNomorMrSendiri,'Key Ini Jangan dihapus sama sekali',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JDataKtr.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JPasien)

  SELF.AddRelation(Relate:JKontrak)


Hide:Relate:JDataKtr.Kill PROCEDURE

  CODE
  _Hide:Access:JDataKtr.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:JDataKtr &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JDataKtr)                           ! destroy the file manager


Hide:Relate:INSaldoawal.Init PROCEDURE
  CODE
  _Hide:Access:INSaldoawal.Init
  SELF.Init(Access:INSaldoawal,1)


Hide:Access:INSaldoawal.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= INSA:Record
  SELF.FileNameValue = 'INSaldoawal'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= INSaldoawal
  PARENT.Init
  Access:INSaldoawal &= SELF


Hide:Access:INSaldoawal.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:INSaldoawal &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:INSaldoawal.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(INSaldoawal,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(INSA:PrimaryKey,'INSA:PrimaryKey',0)
    SELF.AddKey(INSA:oksawal_gbar_fk,'INSA:oksawal_gbar_fk',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:INSaldoawal.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)


Hide:Relate:INSaldoawal.Kill PROCEDURE

  CODE
  _Hide:Access:INSaldoawal.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:INSaldoawal &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:INSaldoawal)                        ! destroy the file manager


Hide:Relate:JTbTransaksi.Init PROCEDURE
  CODE
  _Hide:Access:JTbTransaksi.Init
  SELF.Init(Access:JTbTransaksi,1)


Hide:Access:JTbTransaksi.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JTbT:Record
  SELF.FileNameValue = 'JTbTransaksi'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JTbTransaksi
  PARENT.Init
  Access:JTbTransaksi &= SELF


Hide:Access:JTbTransaksi.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JTbTransaksi &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JTbTransaksi.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JTbTransaksi,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JTbT:KeyKodeTransaksi,'JTbT:KeyKodeTransaksi',1)
    SELF.AddKey(JTbT:KeyNamaTransaksi,'JTbT:KeyNamaTransaksi',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JTbTransaksi.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JTransaksi,RI:None,RI:None,JTra:KeyTransaksi)
  SELF.AddRelationLink(JTbT:KODE_TRANS,JTra:Kode_Transaksi)

  SELF.AddRelation(Relate:JTBayar,RI:None,RI:None,JTBA:KeyTransaksi)
  SELF.AddRelationLink(JTbT:KODE_TRANS,JTBA:Transaksi)


Hide:Relate:JTbTransaksi.Kill PROCEDURE

  CODE
  _Hide:Access:JTbTransaksi.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:JTbTransaksi &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JTbTransaksi)                       ! destroy the file manager


Hide:Relate:DTPBena.Init PROCEDURE
  CODE
  _Hide:Access:DTPBena.Init
  SELF.Init(Access:DTPBena,1)


Hide:Access:DTPBena.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DTPE:Record
  SELF.FileNameValue = 'DTPBena'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DTPBena
  PARENT.Init
  Access:DTPBena &= SELF


Hide:Access:DTPBena.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DTPBena &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DTPBena.PrimeFields PROCEDURE

  CODE
  DTPE:HabisPak = 1                                        ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:DTPBena.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DTPBena,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DTPE:KeyUPF,'DTPE:KeyUPF',0)
    SELF.AddKey(DTPE:KeyKodeBenang,'DTPE:KeyKodeBenang',0)
    SELF.AddKey(DTPE:KeyKodePaketBenang,'DTPE:KeyKodePaketBenang',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DTPBena.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:DTBena)


Hide:Relate:DTPBena.Kill PROCEDURE

  CODE
  _Hide:Access:DTPBena.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:DTPBena &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DTPBena)                            ! destroy the file manager


Hide:Relate:DTTin_Ak.Init PROCEDURE
  CODE
  _Hide:Access:DTTin_Ak.Init
  SELF.Init(Access:DTTin_Ak,1)


Hide:Access:DTTin_Ak.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DTTA:Record
  SELF.FileNameValue = 'DTTin_Ak'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DTTin_Ak
  PARENT.Init
  Access:DTTin_Ak &= SELF


Hide:Access:DTTin_Ak.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DTTin_Ak &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DTTin_Ak.PrimeFields PROCEDURE

  CODE
  DTTA:Type = 'Suntik'                                     ! Assign initial field value
  DTTA:Jenis = 'Non Paket'                                 ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:DTTin_Ak.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DTTin_Ak,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DTTA:KeyKodeTindak,'Key untuk kode Tindakan',0)
    SELF.AddKey(DTTA:KeyUPF,'DTTA:KeyUPF',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DTTin_Ak.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DHPasOp,RI:CASCADE,RI:None,DHPA:KeyTindakanAkhir)
  SELF.AddRelationLink(DTTA:KodeTindakAk,DHPA:TindakanAkhir)


Hide:Relate:DTTin_Ak.Kill PROCEDURE

  CODE
  _Hide:Access:DTTin_Ak.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:DTTin_Ak &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DTTin_Ak)                           ! destroy the file manager


Hide:Relate:DTTindHr.Init PROCEDURE
  CODE
  _Hide:Access:DTTindHr.Init
  SELF.Init(Access:DTTindHr,1)


Hide:Access:DTTindHr.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DTNH:Record
  SELF.FileNameValue = 'DTTindHr'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DTTindHr
  PARENT.Init
  Access:DTTindHr &= SELF


Hide:Access:DTTindHr.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DTTindHr &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DTTindHr.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DTTindHr,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DTNH:KeyKodeTindak_and_Jasa,'Key untuk kode Tindakan',0)
    SELF.AddKey(DTNH:KeyUPF,'DTNH:KeyUPF',0)
    SELF.AddKey(DTNH:keykodetindak,'DTNH:keykodetindak',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DTTindHr.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:DTTindak)


Hide:Relate:DTTindHr.Kill PROCEDURE

  CODE
  _Hide:Access:DTTindHr.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:DTTindHr &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DTTindHr)                           ! destroy the file manager


Hide:Relate:DTPLain.Init PROCEDURE
  CODE
  _Hide:Access:DTPLain.Init
  SELF.Init(Access:DTPLain,1)


Hide:Access:DTPLain.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DTPL:Record
  SELF.FileNameValue = 'DTPLain'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DTPLain
  PARENT.Init
  Access:DTPLain &= SELF


Hide:Access:DTPLain.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DTPLain &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DTPLain.PrimeFields PROCEDURE

  CODE
  DTPL:HabisPak = 1                                        ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:DTPLain.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DTPLain,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DTPL:KeyUPF,'DTPL:KeyUPF',0)
    SELF.AddKey(DTPL:KeyKodeLain,'DTPL:KeyKodeLain',0)
    SELF.AddKey(DTPL:KeyKodePaketlain,'DTPL:KeyKodePaketlain',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DTPLain.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:DTAlLain)


Hide:Relate:DTPLain.Kill PROCEDURE

  CODE
  _Hide:Access:DTPLain.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:DTPLain &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DTPLain)                            ! destroy the file manager


Hide:Relate:JKota.Init PROCEDURE
  CODE
  _Hide:Access:JKota.Init
  SELF.Init(Access:JKota,1)


Hide:Access:JKota.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JKot:Record
  SELF.FileNameValue = 'JKota'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JKota
  PARENT.Init
  Access:JKota &= SELF


Hide:Access:JKota.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JKota &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JKota.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JKota,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JKot:KeyKota,'JKot:KeyKota',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JKota.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:RoPasLu,RI:None,RI:None,RPLU:KeyKota)
  SELF.AddRelationLink(JKot:Kota,RPLU:Kota)

  SELF.AddRelation(Relate:IPJawab,RI:CASCADE,RI:RESTRICT,IPJA:KeyKota)
  SELF.AddRelationLink(JKot:Kota,IPJA:Kota)

  SELF.AddRelation(Relate:JPJawab,RI:None,RI:None,JPJ:KeyKota)
  SELF.AddRelationLink(JKot:Kota,JPJ:Kota)

  SELF.AddRelation(Relate:JPasien,RI:None,RI:None,JPas:KeyKota)
  SELF.AddRelationLink(JKot:Kota,JPas:Kota)

  SELF.AddRelation(Relate:JKecamatan,RI:CASCADE,RI:RESTRICT,JKec:KeyKota)
  SELF.AddRelationLink(JKot:Kota,JKec:KOTA)


Hide:Relate:JKota.Kill PROCEDURE

  CODE
  _Hide:Access:JKota.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:JKota &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JKota)                              ! destroy the file manager


Hide:Relate:JStatusDr.Init PROCEDURE
  CODE
  _Hide:Access:JStatusDr.Init
  SELF.Init(Access:JStatusDr,1)


Hide:Access:JStatusDr.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JSta:Record
  SELF.FileNameValue = 'JStatusDr'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JStatusDr
  PARENT.Init
  Access:JStatusDr &= SELF


Hide:Access:JStatusDr.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JStatusDr &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JStatusDr.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JStatusDr,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JSta:KeyStatus,'JSta:KeyStatus',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JStatusDr.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JDokter,RI:None,RI:None,JDok:KeyStatus)
  SELF.AddRelationLink(JSta:Status,JDok:Status)


Hide:Relate:JStatusDr.Kill PROCEDURE

  CODE
  _Hide:Access:JStatusDr.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:JStatusDr &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JStatusDr)                          ! destroy the file manager


Hide:Relate:JDKuitansi.Init PROCEDURE
  CODE
  _Hide:Access:JDKuitansi.Init
  SELF.Init(Access:JDKuitansi,1)


Hide:Access:JDKuitansi.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JDKU:Record
  SELF.FileNameValue = 'JDKuitansi'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JDKuitansi
  PARENT.Init
  Access:JDKuitansi &= SELF


Hide:Access:JDKuitansi.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JDKuitansi &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JDKuitansi.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JDKuitansi,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JDKU:KeyNoKuitansi,'JDKU:KeyNoKuitansi',0)
    SELF.AddKey(JDKU:KeyTanggal,'JDKU:KeyTanggal',0)
    SELF.AddKey(JDKU:KeyNoBukti,'JDKU:KeyNoBukti',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JDKuitansi.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JHKuitansi)


Hide:Relate:JDKuitansi.Kill PROCEDURE

  CODE
  _Hide:Access:JDKuitansi.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:JDKuitansi &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JDKuitansi)                         ! destroy the file manager


Hide:Relate:RI_KStok.Init PROCEDURE
  CODE
  _Hide:Access:RI_KStok.Init
  SELF.Init(Access:RI_KStok,1)


Hide:Access:RI_KStok.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RI_KS:Record
  SELF.FileNameValue = 'RI_KStok'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RI_KStok
  PARENT.Init
  Access:RI_KStok &= SELF


Hide:Access:RI_KStok.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RI_KStok &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RI_KStok.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RI_KStok,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(RI_KS:PrimaryKey,'RI_KS:PrimaryKey',5)
    SELF.AddKey(RI_KS:UrutTanggal_Key,'RI_KS:UrutTanggal_Key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:RI_KStok.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)


Hide:Relate:RI_KStok.Kill PROCEDURE

  CODE
  _Hide:Access:RI_KStok.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:RI_KStok &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RI_KStok)                           ! destroy the file manager


Hide:Relate:ITrPasen.Init PROCEDURE
  CODE
  _Hide:Access:ITrPasen.Init
  SELF.Init(Access:ITrPasen,1)


Hide:Access:ITrPasen.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ITRP:Record
  SELF.FileNameValue = 'ITrPasen'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ITrPasen
  PARENT.Init
  Access:ITrPasen &= SELF


Hide:Access:ITrPasen.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ITrPasen &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ITrPasen.PrimeFields PROCEDURE

  CODE
  ITRP:Jam_Masuk = Clock()                                 ! Assign initial field value
  ITRP:Tanggal_Masuk = Today()                             ! Assign initial field value
  ITRP:Jam_Keluar = Clock()                                ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:ITrPasen.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ITrPasen,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(ITRP:KeyNomorMr,'ITRP:KeyNomorMr',0)
    SELF.AddKey(ITRP:keymr_tgl,'ITRP:keymr_tgl',0)
    SELF.AddKey(ITRP:KeyTanggalMasuk,'ITRP:KeyTanggalMasuk',0)
    SELF.AddKey(ITRP:KeyKodeRuang,'ITRP:KeyKodeRuang',0)
    SELF.AddKey(ITRP:KeyKodeDokter,'ITRP:KeyKodeDokter',0)
    SELF.AddKey(ITRP:KeyNoNota,'ITRP:KeyNoNota',0)
    SELF.AddKey(ITRP:KeyNoMrRuang,'ITRP:KeyNoMrRuang',0)
    SELF.AddKey(ITRP:KeyNoMrSaja,'ITRP:KeyNoMrSaja',0)
    SELF.AddKey(ITRP:KeyNoMrStatus,'ITRP:KeyNoMrStatus',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:ITrPasen.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 9
    GlobalErrors.SetField('Status pasien')
    IF NOT INRANGE(ITRP:Status,1,3)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'1 .. 3')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:ITrPasen.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  DO AddRelations_2
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JPasien)

  SELF.AddRelation(Relate:JDokter)

  SELF.AddRelation(Relate:LPasLab,RI:CASCADE,RI:RESTRICT,LPas:KeyNoMrRuang)
  SELF.AddRelationLink(ITRP:Nomor_mr,LPas:Nomor_mr)
  SELF.AddRelationLink(ITRP:Ruang,LPas:Ruang)

  SELF.AddRelation(Relate:IPkiTlp,RI:CASCADE,RI:RESTRICT,IPAT:KeyNoMrRuang)
  SELF.AddRelationLink(ITRP:Nomor_mr,IPAT:Nomor_mr)
  SELF.AddRelationLink(ITRP:Ruang,IPAT:Ruang)

  SELF.AddRelation(Relate:IPkiGizi,RI:CASCADE,RI:RESTRICT,IPAG:KeyNoMrRuang)
  SELF.AddRelationLink(ITRP:Nomor_mr,IPAG:Nomor_mr)
  SELF.AddRelationLink(ITRP:Ruang,IPAG:Ruang)

  SELF.AddRelation(Relate:IPkiPPSP,RI:CASCADE,RI:RESTRICT,IPPP:KeyNoMrRuang)
  SELF.AddRelationLink(ITRP:Nomor_mr,IPPP:Nomor_mr)
  SELF.AddRelationLink(ITRP:Ruang,IPPP:Ruang)

  SELF.AddRelation(Relate:IPkiAlat,RI:CASCADE,RI:RESTRICT,IPKA:KeyNoMrRuang)
  SELF.AddRelationLink(ITRP:Nomor_mr,IPKA:Nomor_mr)
  SELF.AddRelationLink(ITRP:Ruang,IPKA:Ruang)

  SELF.AddRelation(Relate:ITindak,RI:CASCADE,RI:RESTRICT,ITIN:KeyNoMrRuang)
  SELF.AddRelationLink(ITRP:Nomor_mr,ITIN:Nomor_mr)
  SELF.AddRelationLink(ITRP:Ruang,ITIN:Ruang)

  SELF.AddRelation(Relate:IVisitDr,RI:CASCADE,RI:RESTRICT,IVID:KeyNoMrRuang)
  SELF.AddRelationLink(ITRP:Nomor_mr,IVID:Nomor_mr)

  SELF.AddRelation(Relate:IPkiObat,RI:CASCADE,RI:RESTRICT,IPKO:KeyNoMrRuang)
  SELF.AddRelationLink(ITRP:Nomor_mr,IPKO:Nomor_mr)
  SELF.AddRelationLink(ITRP:Ruang,IPKO:Ruang)

AddRelations_2 ROUTINE
  SELF.AddRelation(Relate:ITmpPas,RI:CASCADE,RI:RESTRICT,ITMP:KeyNomor_Mr)
  SELF.AddRelationLink(ITRP:Nomor_mr,ITMP:Nomor_mr)

  SELF.AddRelation(Relate:IByTrPas,RI:CASCADE,RI:RESTRICT,IBYT:KeyNomorMR)
  SELF.AddRelationLink(ITRP:Nomor_mr,IBYT:Nomor_MR)

  SELF.AddRelation(Relate:IPasien)

  SELF.AddRelation(Relate:ITbrRwt)


Hide:Relate:ITrPasen.Kill PROCEDURE

  CODE
  _Hide:Access:ITrPasen.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:ITrPasen &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ITrPasen)                           ! destroy the file manager


Hide:Relate:AAwalBln.Init PROCEDURE
  CODE
  _Hide:Access:AAwalBln.Init
  SELF.Init(Access:AAwalBln,1)


Hide:Access:AAwalBln.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AAWL:Record
  SELF.FileNameValue = 'AAwalBln'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AAwalBln
  PARENT.Init
  Access:AAwalBln &= SELF


Hide:Access:AAwalBln.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AAwalBln &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AAwalBln.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AAwalBln,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AAWL:Key_bln_aptk,'AAWL:Key_bln_aptk',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AAwalBln.Kill PROCEDURE

  CODE
  _Hide:Access:AAwalBln.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:AAwalBln &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AAwalBln)                           ! destroy the file manager


Hide:Relate:INDDKB.Init PROCEDURE
  CODE
  _Hide:Access:INDDKB.Init
  SELF.Init(Access:INDDKB,1)


Hide:Access:INDDKB.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IND:Record
  SELF.FileNameValue = 'INDDKB'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= INDDKB
  PARENT.Init
  Access:INDDKB &= SELF


Hide:Access:INDDKB.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:INDDKB &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:INDDKB.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(INDDKB,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(IND:PK,'IND:PK',0)
    SELF.AddKey(IND:barang_inddkb_fk,'IND:barang_inddkb_fk',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:INDDKB.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:INHDKB)

  SELF.AddRelation(Relate:GBarang)


Hide:Relate:INDDKB.Kill PROCEDURE

  CODE
  _Hide:Access:INDDKB.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:INDDKB &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:INDDKB)                             ! destroy the file manager


Hide:Relate:JAnggota.Init PROCEDURE
  CODE
  _Hide:Access:JAnggota.Init
  SELF.Init(Access:JAnggota,1)


Hide:Access:JAnggota.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JAng:Record
  SELF.FileNameValue = 'JAnggota'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JAnggota
  PARENT.Init
  Access:JAnggota &= SELF


Hide:Access:JAnggota.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JAnggota &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JAnggota.PrimeFields PROCEDURE

  CODE
  JAng:Tanggal = Today()                                   ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:JAnggota.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JAnggota,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JAng:KeyNomor_Mr,'JAng:KeyNomor_Mr',0)
    SELF.AddKey(JAng:KeyNomorAnggota,'JAng:KeyNomorAnggota',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JAnggota.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JPasien)


Hide:Relate:JAnggota.Kill PROCEDURE

  CODE
  _Hide:Access:JAnggota.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:JAnggota &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JAnggota)                           ! destroy the file manager


Hide:Relate:JPJawab.Init PROCEDURE
  CODE
  _Hide:Access:JPJawab.Init
  SELF.Init(Access:JPJawab,1)


Hide:Access:JPJawab.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JPJ:Record
  SELF.FileNameValue = 'JPJawab'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JPJawab
  PARENT.Init
  Access:JPJawab &= SELF


Hide:Access:JPJawab.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JPJawab &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JPJawab.PrimeFields PROCEDURE

  CODE
  JPJ:Tanggal = Today()                                    ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:JPJawab.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JPJawab,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JPJ:KeyNomorMr,'JPJ:KeyNomorMr',0)
    SELF.AddKey(JPJ:KeyTanggal,'JPJ:KeyTanggal',0)
    SELF.AddKey(JPJ:KeyNama,'JPJ:KeyNama',0)
    SELF.AddKey(JPJ:KeyKecamatan,'JPJ:KeyKecamatan',0)
    SELF.AddKey(JPJ:KeyKota,'JPJ:KeyKota',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JPJawab.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JKecamatan)

  SELF.AddRelation(Relate:JKota)

  SELF.AddRelation(Relate:JPasien)


Hide:Relate:JPJawab.Kill PROCEDURE

  CODE
  _Hide:Access:JPJawab.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:JPJawab &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JPJawab)                            ! destroy the file manager


Hide:Relate:IPJawab.Init PROCEDURE
  CODE
  _Hide:Access:IPJawab.Init
  SELF.Init(Access:IPJawab,1)


Hide:Access:IPJawab.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= IPJA:Record
  SELF.FileNameValue = 'IPJawab'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= IPJawab
  PARENT.Init
  Access:IPJawab &= SELF


Hide:Access:IPJawab.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:IPJawab &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:IPJawab.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(IPJawab,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(IPJA:KeyNomorMr,'IPJA:KeyNomorMr',0)
    SELF.AddKey(IPJA:KeyTanggal,'IPJA:KeyTanggal',0)
    SELF.AddKey(IPJA:KeyNama,'IPJA:KeyNama',0)
    SELF.AddKey(IPJA:KeyKecamatan,'IPJA:KeyKecamatan',0)
    SELF.AddKey(IPJA:KeyKota,'IPJA:KeyKota',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:IPJawab.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:IPasien)

  SELF.AddRelation(Relate:JKecamatan)

  SELF.AddRelation(Relate:JKota)


Hide:Relate:IPJawab.Kill PROCEDURE

  CODE
  _Hide:Access:IPJawab.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:IPJawab &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:IPJawab)                            ! destroy the file manager


Hide:Relate:JTempat.Init PROCEDURE
  CODE
  _Hide:Access:JTempat.Init
  SELF.Init(Access:JTempat,1)


Hide:Access:JTempat.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JTem:Record
  SELF.FileNameValue = 'JTempat'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JTempat
  PARENT.Init
  Access:JTempat &= SELF


Hide:Access:JTempat.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JTempat &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JTempat.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JTempat,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JTem:KeyKodeTempat,'JTem:KeyKodeTempat',0)
    SELF.AddKey(JTem:KeyNamaTempat,'JTem:KeyNamaTempat',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JTempat.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:RoPcsRJ,RI:None,RI:None,RPCJ:keytempat)
  SELF.AddRelationLink(JTem:KodeTempat,RPCJ:PMPD)

  SELF.AddRelation(Relate:RoPasRJ,RI:None,RI:RESTRICT,RPRJ:keytempat)
  SELF.AddRelationLink(JTem:KodeTempat,RPRJ:PMPD)

  SELF.AddRelation(Relate:ITbrRwt,RI:CASCADE,RI:RESTRICT,ITbr:KPDPM)
  SELF.AddRelationLink(JTem:KodeTempat,ITbr:PDPM)

  SELF.AddRelation(Relate:JTTBayar,RI:None,RI:None,JTTB:KeyTempat)
  SELF.AddRelationLink(JTem:NamaTempat,JTTB:Tempat)

  SELF.AddRelation(Relate:RoStok,RI:None,RI:None,RSTO:KeyTempat)
  SELF.AddRelationLink(JTem:KodeTempat,RSTO:KodeTempat)

  SELF.AddRelation(Relate:JTBayar,RI:None,RI:None,JTBA:KeyTempat)
  SELF.AddRelationLink(JTem:KodeTempat,JTBA:Tempat)

  SELF.AddRelation(Relate:JPoli,RI:None,RI:None,JPol:KeyTempat)
  SELF.AddRelationLink(JTem:KodeTempat,JPol:TEMPAT)


Hide:Relate:JTempat.Kill PROCEDURE

  CODE
  _Hide:Access:JTempat.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:JTempat &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JTempat)                            ! destroy the file manager


Hide:Relate:JKPoli.Init PROCEDURE
  CODE
  _Hide:Access:JKPoli.Init
  SELF.Init(Access:JKPoli,1)


Hide:Access:JKPoli.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JKPO:Record
  SELF.FileNameValue = 'JKPoli'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JKPoli
  PARENT.Init
  Access:JKPoli &= SELF


Hide:Access:JKPoli.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JKPoli &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JKPoli.PrimeFields PROCEDURE

  CODE
  JKPO:Tanggal = Today()                                   ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:JKPoli.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JKPoli,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JKPO:BY_POLI,'JKPO:BY_POLI',0)
    SELF.AddKey(JKPO:KeyKontrak,'JKPO:KeyKontrak',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JKPoli.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JKontrak)

  SELF.AddRelation(Relate:JPoli)


Hide:Relate:JKPoli.Kill PROCEDURE

  CODE
  _Hide:Access:JKPoli.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:JKPoli &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JKPoli)                             ! destroy the file manager


Hide:Relate:ITmpPas.Init PROCEDURE
  CODE
  _Hide:Access:ITmpPas.Init
  SELF.Init(Access:ITmpPas,1)


Hide:Access:ITmpPas.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ITMP:Record
  SELF.FileNameValue = 'ITmpPas'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ITmpPas
  PARENT.Init
  Access:ITmpPas &= SELF


Hide:Access:ITmpPas.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ITmpPas &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ITmpPas.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ITmpPas,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(ITMP:KeyNomor_Mr,'ITMP:KeyNomor_Mr',0)
    SELF.AddKey(ITMP:KeyRekap,'ITMP:KeyRekap',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ITmpPas.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ITrPasen)


Hide:Relate:ITmpPas.Kill PROCEDURE

  CODE
  _Hide:Access:ITmpPas.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:ITmpPas &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ITmpPas)                            ! destroy the file manager

