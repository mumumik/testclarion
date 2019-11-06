  MEMBER('apc6new.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
APC6NBCB:DctInit    PROCEDURE
APC6NBCB:DctKill    PROCEDURE
APC6NBCB:FilesInit  PROCEDURE
  END

Hide:Access:GDSPB    CLASS(FileManager),TYPE               ! FileManager for GDSPB
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GDSPB    CLASS(RelationManager),TYPE           ! RelationManager for GDSPB
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GStokAptk CLASS(FileManager),TYPE              ! FileManager for GStokAptk
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GStokAptk CLASS(RelationManager),TYPE          ! RelationManager for GStokAptk
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GHBPB    CLASS(FileManager),TYPE               ! FileManager for GHBPB
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GHBPB    CLASS(RelationManager),TYPE           ! RelationManager for GHBPB
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JPTmpKel CLASS(FileManager),TYPE               ! FileManager for JPTmpKel
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JPTmpKel CLASS(RelationManager),TYPE           ! RelationManager for JPTmpKel
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JTDbyr   CLASS(FileManager),TYPE               ! FileManager for JTDbyr
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JTDbyr   CLASS(RelationManager),TYPE           ! RelationManager for JTDbyr
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JREKJD   CLASS(FileManager),TYPE               ! FileManager for JREKJD
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JREKJD   CLASS(RelationManager),TYPE           ! RelationManager for JREKJD
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GDBPB    CLASS(FileManager),TYPE               ! FileManager for GDBPB
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GDBPB    CLASS(RelationManager),TYPE           ! RelationManager for GDBPB
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:MBarang  CLASS(FileManager),TYPE               ! FileManager for MBarang
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:MBarang  CLASS(RelationManager),TYPE           ! RelationManager for MBarang
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GHSBBK   CLASS(FileManager),TYPE               ! FileManager for GHSBBK
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GHSBBK   CLASS(RelationManager),TYPE           ! RelationManager for GHSBBK
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GDSBBK   CLASS(FileManager),TYPE               ! FileManager for GDSBBK
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GDSBBK   CLASS(RelationManager),TYPE           ! RelationManager for GDSBBK
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GApotik  CLASS(FileManager),TYPE               ! FileManager for GApotik
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GApotik  CLASS(RelationManager),TYPE           ! RelationManager for GApotik
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JTSBayar CLASS(FileManager),TYPE               ! FileManager for JTSBayar
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JTSBayar CLASS(RelationManager),TYPE           ! RelationManager for JTSBayar
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GRBatalK CLASS(FileManager),TYPE               ! FileManager for GRBatalK
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GRBatalK CLASS(RelationManager),TYPE           ! RelationManager for GRBatalK
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GBarang  CLASS(FileManager),TYPE               ! FileManager for GBarang
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GBarang  CLASS(RelationManager),TYPE           ! RelationManager for GBarang
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GLapBln  CLASS(FileManager),TYPE               ! FileManager for GLapBln
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GLapBln  CLASS(RelationManager),TYPE           ! RelationManager for GLapBln
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:GSatuan  CLASS(FileManager),TYPE               ! FileManager for GSatuan
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:GSatuan  CLASS(RelationManager),TYPE           ! RelationManager for GSatuan
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:LAdaDet  CLASS(FileManager),TYPE               ! FileManager for LAdaDet
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:LAdaDet  CLASS(RelationManager),TYPE           ! RelationManager for LAdaDet
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:MBarangMK CLASS(FileManager),TYPE              ! FileManager for MBarangMK
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:MBarangMK CLASS(RelationManager),TYPE          ! RelationManager for MBarangMK
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JTTBayar CLASS(FileManager),TYPE               ! FileManager for JTTBayar
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
PrimeFields            PROCEDURE(),PROC,DERIVED            ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JTTBayar CLASS(RelationManager),TYPE           ! RelationManager for JTTBayar
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:OKLain   CLASS(FileManager),TYPE               ! FileManager for OKLain
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:OKLain   CLASS(RelationManager),TYPE           ! RelationManager for OKLain
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END


_Hide:Access:GDSPB   &Hide:Access:GDSPB,AUTO,THREAD
_Hide:Relate:GDSPB   &Hide:Relate:GDSPB,AUTO,THREAD
_Hide:Access:GStokAptk &Hide:Access:GStokAptk,AUTO,THREAD
_Hide:Relate:GStokAptk &Hide:Relate:GStokAptk,AUTO,THREAD
_Hide:Access:GHBPB   &Hide:Access:GHBPB,AUTO,THREAD
_Hide:Relate:GHBPB   &Hide:Relate:GHBPB,AUTO,THREAD
_Hide:Access:JPTmpKel &Hide:Access:JPTmpKel,AUTO,THREAD
_Hide:Relate:JPTmpKel &Hide:Relate:JPTmpKel,AUTO,THREAD
_Hide:Access:JTDbyr  &Hide:Access:JTDbyr,AUTO,THREAD
_Hide:Relate:JTDbyr  &Hide:Relate:JTDbyr,AUTO,THREAD
_Hide:Access:JREKJD  &Hide:Access:JREKJD,AUTO,THREAD
_Hide:Relate:JREKJD  &Hide:Relate:JREKJD,AUTO,THREAD
_Hide:Access:GDBPB   &Hide:Access:GDBPB,AUTO,THREAD
_Hide:Relate:GDBPB   &Hide:Relate:GDBPB,AUTO,THREAD
_Hide:Access:MBarang &Hide:Access:MBarang,AUTO,THREAD
_Hide:Relate:MBarang &Hide:Relate:MBarang,AUTO,THREAD
_Hide:Access:GHSBBK  &Hide:Access:GHSBBK,AUTO,THREAD
_Hide:Relate:GHSBBK  &Hide:Relate:GHSBBK,AUTO,THREAD
_Hide:Access:GDSBBK  &Hide:Access:GDSBBK,AUTO,THREAD
_Hide:Relate:GDSBBK  &Hide:Relate:GDSBBK,AUTO,THREAD
_Hide:Access:GApotik &Hide:Access:GApotik,AUTO,THREAD
_Hide:Relate:GApotik &Hide:Relate:GApotik,AUTO,THREAD
_Hide:Access:JTSBayar &Hide:Access:JTSBayar,AUTO,THREAD
_Hide:Relate:JTSBayar &Hide:Relate:JTSBayar,AUTO,THREAD
_Hide:Access:GRBatalK &Hide:Access:GRBatalK,AUTO,THREAD
_Hide:Relate:GRBatalK &Hide:Relate:GRBatalK,AUTO,THREAD
_Hide:Access:GBarang &Hide:Access:GBarang,AUTO,THREAD
_Hide:Relate:GBarang &Hide:Relate:GBarang,AUTO,THREAD
_Hide:Access:GLapBln &Hide:Access:GLapBln,AUTO,THREAD
_Hide:Relate:GLapBln &Hide:Relate:GLapBln,AUTO,THREAD
_Hide:Access:GSatuan &Hide:Access:GSatuan,AUTO,THREAD
_Hide:Relate:GSatuan &Hide:Relate:GSatuan,AUTO,THREAD
_Hide:Access:LAdaDet &Hide:Access:LAdaDet,AUTO,THREAD
_Hide:Relate:LAdaDet &Hide:Relate:LAdaDet,AUTO,THREAD
_Hide:Access:MBarangMK &Hide:Access:MBarangMK,AUTO,THREAD
_Hide:Relate:MBarangMK &Hide:Relate:MBarangMK,AUTO,THREAD
_Hide:Access:JTTBayar &Hide:Access:JTTBayar,AUTO,THREAD
_Hide:Relate:JTTBayar &Hide:Relate:JTTBayar,AUTO,THREAD
_Hide:Access:OKLain  &Hide:Access:OKLain,AUTO,THREAD
_Hide:Relate:OKLain  &Hide:Relate:OKLain,AUTO,THREAD


APC6NBCB:DctInit PROCEDURE
  CODE
  _Hide:Access:GDSPB &= NEW(Hide:Access:GDSPB)
  _Hide:Relate:GDSPB &= NEW(Hide:Relate:GDSPB)
  _Hide:Access:GStokAptk &= NEW(Hide:Access:GStokAptk)
  _Hide:Relate:GStokAptk &= NEW(Hide:Relate:GStokAptk)
  _Hide:Access:GHBPB &= NEW(Hide:Access:GHBPB)
  _Hide:Relate:GHBPB &= NEW(Hide:Relate:GHBPB)
  _Hide:Access:JPTmpKel &= NEW(Hide:Access:JPTmpKel)
  _Hide:Relate:JPTmpKel &= NEW(Hide:Relate:JPTmpKel)
  _Hide:Access:JTDbyr &= NEW(Hide:Access:JTDbyr)
  _Hide:Relate:JTDbyr &= NEW(Hide:Relate:JTDbyr)
  _Hide:Access:JREKJD &= NEW(Hide:Access:JREKJD)
  _Hide:Relate:JREKJD &= NEW(Hide:Relate:JREKJD)
  _Hide:Access:GDBPB &= NEW(Hide:Access:GDBPB)
  _Hide:Relate:GDBPB &= NEW(Hide:Relate:GDBPB)
  _Hide:Access:MBarang &= NEW(Hide:Access:MBarang)
  _Hide:Relate:MBarang &= NEW(Hide:Relate:MBarang)
  _Hide:Access:GHSBBK &= NEW(Hide:Access:GHSBBK)
  _Hide:Relate:GHSBBK &= NEW(Hide:Relate:GHSBBK)
  _Hide:Access:GDSBBK &= NEW(Hide:Access:GDSBBK)
  _Hide:Relate:GDSBBK &= NEW(Hide:Relate:GDSBBK)
  _Hide:Access:GApotik &= NEW(Hide:Access:GApotik)
  _Hide:Relate:GApotik &= NEW(Hide:Relate:GApotik)
  _Hide:Access:JTSBayar &= NEW(Hide:Access:JTSBayar)
  _Hide:Relate:JTSBayar &= NEW(Hide:Relate:JTSBayar)
  _Hide:Access:GRBatalK &= NEW(Hide:Access:GRBatalK)
  _Hide:Relate:GRBatalK &= NEW(Hide:Relate:GRBatalK)
  _Hide:Access:GBarang &= NEW(Hide:Access:GBarang)
  _Hide:Relate:GBarang &= NEW(Hide:Relate:GBarang)
  _Hide:Access:GLapBln &= NEW(Hide:Access:GLapBln)
  _Hide:Relate:GLapBln &= NEW(Hide:Relate:GLapBln)
  _Hide:Access:GSatuan &= NEW(Hide:Access:GSatuan)
  _Hide:Relate:GSatuan &= NEW(Hide:Relate:GSatuan)
  _Hide:Access:LAdaDet &= NEW(Hide:Access:LAdaDet)
  _Hide:Relate:LAdaDet &= NEW(Hide:Relate:LAdaDet)
  _Hide:Access:MBarangMK &= NEW(Hide:Access:MBarangMK)
  _Hide:Relate:MBarangMK &= NEW(Hide:Relate:MBarangMK)
  _Hide:Access:JTTBayar &= NEW(Hide:Access:JTTBayar)
  _Hide:Relate:JTTBayar &= NEW(Hide:Relate:JTTBayar)
  _Hide:Access:OKLain &= NEW(Hide:Access:OKLain)
  _Hide:Relate:OKLain &= NEW(Hide:Relate:OKLain)
  Relate:GDSPB &= _Hide:Relate:GDSPB
  Relate:GStokAptk &= _Hide:Relate:GStokAptk
  Relate:GHBPB &= _Hide:Relate:GHBPB
  Relate:JPTmpKel &= _Hide:Relate:JPTmpKel
  Relate:JTDbyr &= _Hide:Relate:JTDbyr
  Relate:JREKJD &= _Hide:Relate:JREKJD
  Relate:GDBPB &= _Hide:Relate:GDBPB
  Relate:MBarang &= _Hide:Relate:MBarang
  Relate:GHSBBK &= _Hide:Relate:GHSBBK
  Relate:GDSBBK &= _Hide:Relate:GDSBBK
  Relate:GApotik &= _Hide:Relate:GApotik
  Relate:JTSBayar &= _Hide:Relate:JTSBayar
  Relate:GRBatalK &= _Hide:Relate:GRBatalK
  Relate:GBarang &= _Hide:Relate:GBarang
  Relate:GLapBln &= _Hide:Relate:GLapBln
  Relate:GSatuan &= _Hide:Relate:GSatuan
  Relate:LAdaDet &= _Hide:Relate:LAdaDet
  Relate:MBarangMK &= _Hide:Relate:MBarangMK
  Relate:JTTBayar &= _Hide:Relate:JTTBayar
  Relate:OKLain &= _Hide:Relate:OKLain


APC6NBCB:FilesInit PROCEDURE
  CODE
  _Hide:Relate:GDSPB.Init
  _Hide:Relate:GStokAptk.Init
  _Hide:Relate:GHBPB.Init
  _Hide:Relate:JPTmpKel.Init
  _Hide:Relate:JTDbyr.Init
  _Hide:Relate:JREKJD.Init
  _Hide:Relate:GDBPB.Init
  _Hide:Relate:MBarang.Init
  _Hide:Relate:GHSBBK.Init
  _Hide:Relate:GDSBBK.Init
  _Hide:Relate:GApotik.Init
  _Hide:Relate:JTSBayar.Init
  _Hide:Relate:GRBatalK.Init
  _Hide:Relate:GBarang.Init
  _Hide:Relate:GLapBln.Init
  _Hide:Relate:GSatuan.Init
  _Hide:Relate:LAdaDet.Init
  _Hide:Relate:MBarangMK.Init
  _Hide:Relate:JTTBayar.Init
  _Hide:Relate:OKLain.Init


APC6NBCB:DctKill PROCEDURE
  CODE
  _Hide:Relate:GDSPB.Kill
  DISPOSE(_Hide:Relate:GDSPB)
  _Hide:Relate:GStokAptk.Kill
  DISPOSE(_Hide:Relate:GStokAptk)
  _Hide:Relate:GHBPB.Kill
  DISPOSE(_Hide:Relate:GHBPB)
  _Hide:Relate:JPTmpKel.Kill
  DISPOSE(_Hide:Relate:JPTmpKel)
  _Hide:Relate:JTDbyr.Kill
  DISPOSE(_Hide:Relate:JTDbyr)
  _Hide:Relate:JREKJD.Kill
  DISPOSE(_Hide:Relate:JREKJD)
  _Hide:Relate:GDBPB.Kill
  DISPOSE(_Hide:Relate:GDBPB)
  _Hide:Relate:MBarang.Kill
  DISPOSE(_Hide:Relate:MBarang)
  _Hide:Relate:GHSBBK.Kill
  DISPOSE(_Hide:Relate:GHSBBK)
  _Hide:Relate:GDSBBK.Kill
  DISPOSE(_Hide:Relate:GDSBBK)
  _Hide:Relate:GApotik.Kill
  DISPOSE(_Hide:Relate:GApotik)
  _Hide:Relate:JTSBayar.Kill
  DISPOSE(_Hide:Relate:JTSBayar)
  _Hide:Relate:GRBatalK.Kill
  DISPOSE(_Hide:Relate:GRBatalK)
  _Hide:Relate:GBarang.Kill
  DISPOSE(_Hide:Relate:GBarang)
  _Hide:Relate:GLapBln.Kill
  DISPOSE(_Hide:Relate:GLapBln)
  _Hide:Relate:GSatuan.Kill
  DISPOSE(_Hide:Relate:GSatuan)
  _Hide:Relate:LAdaDet.Kill
  DISPOSE(_Hide:Relate:LAdaDet)
  _Hide:Relate:MBarangMK.Kill
  DISPOSE(_Hide:Relate:MBarangMK)
  _Hide:Relate:JTTBayar.Kill
  DISPOSE(_Hide:Relate:JTTBayar)
  _Hide:Relate:OKLain.Kill
  DISPOSE(_Hide:Relate:OKLain)


Hide:Relate:GDSPB.Init PROCEDURE
  CODE
  _Hide:Access:GDSPB.Init
  SELF.Init(Access:GDSPB,1)


Hide:Access:GDSPB.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GDSPB:Record
  SELF.FileNameValue = 'GDSPB'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GDSPB
  PARENT.Init
  Access:GDSPB &= SELF


Hide:Access:GDSPB.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GDSPB &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GDSPB.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GDSPB,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GDSPB:KeyNoSPB,'No SPB',0)
    SELF.AddKey(GDSPB:KeyKodeBrg,'Kode Barang',0)
    SELF.AddKey(GDSPB:PrimaryKey,'GDSPB:PrimaryKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:GDSPB.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 5
    GlobalErrors.SetField('GDSPB:Jenis_PPN')
    IF INSTRING(']' & GDSPB:Jenis_PPN & '[', ']1[]2[]3[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Include'',''Exclde'',''Non''')
      END
    END
  OF 9
    GlobalErrors.SetField('GDSPB:StatusDisc')
    IF INSTRING(']' & GDSPB:StatusDisc & '[', ']1[]2[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''SebelumPPn'',''SesudahPPn''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:GDSPB.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:GHSPB)


Hide:Relate:GDSPB.Kill PROCEDURE

  CODE
  _Hide:Access:GDSPB.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:GDSPB &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GDSPB)                              ! destroy the file manager


Hide:Relate:GStokAptk.Init PROCEDURE
  CODE
  _Hide:Access:GStokAptk.Init
  SELF.Init(Access:GStokAptk,1)


Hide:Access:GStokAptk.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GSTO:Record
  SELF.FileNameValue = 'GStokAptk'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GStokAptk
  PARENT.Init
  Access:GStokAptk &= SELF


Hide:Access:GStokAptk.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GStokAptk &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GStokAptk.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GStokAptk,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GSTO:KeyApotik,'Apotik',0)
    SELF.AddKey(GSTO:KeyBarang,'Barang-kd_apotik',0)
    SELF.AddKey(GSTO:key_kd_brg,'kode barang saja',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GStokAptk.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:GApotik)


Hide:Relate:GStokAptk.Kill PROCEDURE

  CODE
  _Hide:Access:GStokAptk.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:GStokAptk &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GStokAptk)                          ! destroy the file manager


Hide:Relate:GHBPB.Init PROCEDURE
  CODE
  _Hide:Access:GHBPB.Init
  SELF.Init(Access:GHBPB,1)


Hide:Access:GHBPB.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GHBPB:Record
  SELF.FileNameValue = 'GHBPB'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GHBPB
  PARENT.Init
  Access:GHBPB &= SELF


Hide:Access:GHBPB.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GHBPB &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GHBPB.PrimeFields PROCEDURE

  CODE
  GHBPB:Status = 'Buka'                                    ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:GHBPB.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GHBPB,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GHBPB:KeyNoBPB,'No BPB',0)
    SELF.AddKey(GHBPB:KeyStatus,'GHBPB:KeyStatus',0)
    SELF.AddKey(GHBPB:KeyNoApotik,'No Apotik',0)
    SELF.AddKey(GHBPB:KeyTanggal,'GHBPB:KeyTanggal',0)
    SELF.AddKey(GHBPB:KeyMasterGHBPB,'GHBPB:KeyMasterGHBPB',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:GHBPB.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 5
    GlobalErrors.SetField('GHBPB:Verifikasi')
    IF INSTRING(']' & GHBPB:Verifikasi & '[', ']0[]1[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Belum'',''Sudah''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:GHBPB.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GHBPBMaster)

  SELF.AddRelation(Relate:GHSBBK,RI:CASCADE,RI:RESTRICT,GHSB:KeyNoBPB)
  SELF.AddRelationLink(GHBPB:NoBPB,GHSB:NoBPB)

  SELF.AddRelation(Relate:GApotik)

  SELF.AddRelation(Relate:GDBPB,RI:CASCADE,RI:RESTRICT,GDBPB:KeyNoBPB)
  SELF.AddRelationLink(GHBPB:NoBPB,GDBPB:NoBPB)


Hide:Relate:GHBPB.Kill PROCEDURE

  CODE
  _Hide:Access:GHBPB.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:GHBPB &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GHBPB)                              ! destroy the file manager


Hide:Relate:JPTmpKel.Init PROCEDURE
  CODE
  _Hide:Access:JPTmpKel.Init
  SELF.Init(Access:JPTmpKel,1)


Hide:Access:JPTmpKel.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JPTK:Record
  SELF.FileNameValue = 'JPTmpKel'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JPTmpKel
  PARENT.Init
  Access:JPTmpKel &= SELF


Hide:Access:JPTmpKel.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JPTmpKel &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JPTmpKel.PrimeFields PROCEDURE

  CODE
  JPTK:TanggalLahir = Today()                              ! Assign initial field value
  JPTK:Jenis_kelamin = 'P'                                 ! Assign initial field value
  JPTK:Kota = 'BANDUNG'                                    ! Assign initial field value
  JPTK:Agama = 'ISLAM'                                     ! Assign initial field value
  JPTK:Tanggal = TODAY()                                   ! Assign initial field value
  JPTK:Kontrak = 'N'                                       ! Assign initial field value
  JPTK:Jam = Clock()                                       ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:JPTmpKel.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JPTmpKel,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JPTK:KeyNomorMr,'Nomor RM',0)
    SELF.AddKey(JPTK:KeyNama,'Nama',0)
    SELF.AddKey(JPTK:KeyKec,'JPTK:KeyKec',0)
    SELF.AddKey(JPTK:KeyKembali,'Status RM',0)
    SELF.AddKey(JPTK:KeyTanggal,'tgl. kunjungan',0)
    SELF.AddKey(JPTK:KeyKota,'JPTK:KeyKota',0)
    SELF.AddKey(JPTK:KeyLantai,'JPTK:KeyLantai',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:JPTmpKel.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('Nomor Medical record pasien')
    IF NOT INRANGE(JPTK:Nomor_mr,0,99999999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'0 .. 99999999')
      END
    END
  OF 4
    GlobalErrors.SetField('Umur pasien dalam tahun')
    IF NOT INRANGE(JPTK:Umur,0,999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'0 .. 999')
      END
    END
  OF 5
    GlobalErrors.SetField('Sekian Bulan')
    IF NOT INRANGE(JPTK:Umur_Bln,0,11)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'0 .. 11')
      END
    END
  OF 17
    GlobalErrors.SetField('Apakah Status sudah kembali')
    IF NOT INRANGE(JPTK:kembali,1,3)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'1 .. 3')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:JPTmpKel.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JTransaksi,RI:None,RI:None,JTra:KeyNomorMr)
  SELF.AddRelationLink(JPTK:Nomor_mr,JTra:Nomor_Mr)


Hide:Relate:JPTmpKel.Kill PROCEDURE

  CODE
  _Hide:Access:JPTmpKel.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:JPTmpKel &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JPTmpKel)                           ! destroy the file manager


Hide:Relate:JTDbyr.Init PROCEDURE
  CODE
  _Hide:Access:JTDbyr.Init
  SELF.Init(Access:JTDbyr,1)


Hide:Access:JTDbyr.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JTD:Record
  SELF.FileNameValue = 'JTDbyr'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JTDbyr
  PARENT.Init
  Access:JTDbyr &= SELF


Hide:Access:JTDbyr.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JTDbyr &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JTDbyr.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JTDbyr,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JTD:KNotaJasa,'JTD:KNotaJasa',0)
    SELF.AddKey(JTD:KJasa,'JTD:KJasa',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JTDbyr.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JTransaksi)

  SELF.AddRelation(Relate:JTindaka)


Hide:Relate:JTDbyr.Kill PROCEDURE

  CODE
  _Hide:Access:JTDbyr.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:JTDbyr &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JTDbyr)                             ! destroy the file manager


Hide:Relate:JREKJD.Init PROCEDURE
  CODE
  _Hide:Access:JREKJD.Init
  SELF.Init(Access:JREKJD,1)


Hide:Access:JREKJD.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JRJD:Record
  SELF.FileNameValue = 'JREKJD'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JREKJD
  PARENT.Init
  Access:JREKJD &= SELF


Hide:Access:JREKJD.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JREKJD &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JREKJD.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JREKJD,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JRJD:KeyKodeKlinik,'JRJD:KeyKodeKlinik',0)
    SELF.AddKey(JRJD:KeyDokter,'JRJD:KeyDokter',0)
    SELF.AddKey(JRJD:KeyNo,'JRJD:KeyNo',0)
    SELF.AddKey(JRJD:KeyRekap,'JRJD:KeyRekap',0)
    SELF.AddKey(JRJD:KeyRekapSaja,'JRJD:KeyRekapSaja',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JREKJD.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JPoli)

  SELF.AddRelation(Relate:JDokter)


Hide:Relate:JREKJD.Kill PROCEDURE

  CODE
  _Hide:Access:JREKJD.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:JREKJD &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JREKJD)                             ! destroy the file manager


Hide:Relate:GDBPB.Init PROCEDURE
  CODE
  _Hide:Access:GDBPB.Init
  SELF.Init(Access:GDBPB,1)


Hide:Access:GDBPB.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GDBPB:Record
  SELF.FileNameValue = 'GDBPB'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GDBPB
  PARENT.Init
  Access:GDBPB &= SELF


Hide:Access:GDBPB.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GDBPB &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GDBPB.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GDBPB,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GDBPB:KeyNoBPB,'No BPB',0)
    SELF.AddKey(GDBPB:KeyBPBItem,'BPB Item',0)
    SELF.AddKey(GDBPB:KeyKodeBarang,'Kode Barang',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GDBPB.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:GHBPB)


Hide:Relate:GDBPB.Kill PROCEDURE

  CODE
  _Hide:Access:GDBPB.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:GDBPB &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GDBPB)                              ! destroy the file manager


Hide:Relate:MBarang.Init PROCEDURE
  CODE
  _Hide:Access:MBarang.Init
  SELF.Init(Access:MBarang,1)


Hide:Access:MBarang.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= MBA1:Record
  SELF.FileNameValue = 'MBarang'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= MBarang
  PARENT.Init
  Access:MBarang &= SELF


Hide:Access:MBarang.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:MBarang &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:MBarang.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(MBarang,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:MBarang.Kill PROCEDURE

  CODE
  _Hide:Access:MBarang.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:MBarang &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:MBarang)                            ! destroy the file manager


Hide:Relate:GHSBBK.Init PROCEDURE
  CODE
  _Hide:Access:GHSBBK.Init
  SELF.Init(Access:GHSBBK,1)


Hide:Access:GHSBBK.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GHSB:Record
  SELF.FileNameValue = 'GHSBBK'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GHSBBK
  PARENT.Init
  Access:GHSBBK &= SELF


Hide:Access:GHSBBK.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GHSBBK &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GHSBBK.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GHSBBK,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GHSB:KeyNoSBBK,'No SBBK',0)
    SELF.AddKey(GHSB:KeyTanggal,'GHSB:KeyTanggal',0)
    SELF.AddKey(GHSB:Key_NoSBBK_Status,'No SBBK Status',0)
    SELF.AddKey(GHSB:KeyNoBPB,'No BPB',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GHSBBK.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GHBSBBK,RI:CASCADE,RI:RESTRICT,GHBSB:KeyNoSBBK)
  SELF.AddRelationLink(GHSB:NoSBBK,GHBSB:NoSBBK)

  SELF.AddRelation(Relate:GDSBBK,RI:CASCADE,RI:RESTRICT,GDSB:KeyNoSBBKItem)
  SELF.AddRelationLink(GHSB:NoSBBK,GDSB:NoSBBK)

  SELF.AddRelation(Relate:GHBPB)


Hide:Relate:GHSBBK.Kill PROCEDURE

  CODE
  _Hide:Access:GHSBBK.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:GHSBBK &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GHSBBK)                             ! destroy the file manager


Hide:Relate:GDSBBK.Init PROCEDURE
  CODE
  _Hide:Access:GDSBBK.Init
  SELF.Init(Access:GDSBBK,1)


Hide:Access:GDSBBK.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GDSB:Record
  SELF.FileNameValue = 'GDSBBK'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GDSBBK
  PARENT.Init
  Access:GDSBBK &= SELF


Hide:Access:GDSBBK.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GDSBBK &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GDSBBK.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GDSBBK,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GDSB:KeyNoSBBKItem,'SBBK',0)
    SELF.AddKey(GDSB:KeyNoSBBK,'GDSB:KeyNoSBBK',0)
    SELF.AddKey(GDSB:KeyBarang,'Barang',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GDSBBK.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GHSBBK)

  SELF.AddRelation(Relate:GBarang)


Hide:Relate:GDSBBK.Kill PROCEDURE

  CODE
  _Hide:Access:GDSBBK.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:GDSBBK &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GDSBBK)                             ! destroy the file manager


Hide:Relate:GApotik.Init PROCEDURE
  CODE
  _Hide:Access:GApotik.Init
  SELF.Init(Access:GApotik,1)


Hide:Access:GApotik.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GAPO:Record
  SELF.FileNameValue = 'GApotik'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GApotik
  PARENT.Init
  Access:GApotik &= SELF


Hide:Access:GApotik.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GApotik &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GApotik.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GApotik,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GAPO:KeyNoApotik,'No Apotik',1)
    SELF.AddKey(GAPO:KeyNama,'Nama Apotik',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GApotik.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  DO AddRelations_2
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:APHTRANSBPJS,RI:None,RI:None,APHB:BY_KODEAP)
  SELF.AddRelationLink(GAPO:Kode_Apotik,APHB:Kode_Apotik)

  SELF.AddRelation(Relate:APObatRuang,RI:None,RI:None,APO1:Apotik_ObatRuangan_FK)
  SELF.AddRelationLink(GAPO:Kode_Apotik,APO1:Kode_Apotik)

  SELF.AddRelation(Relate:GHBPBMaster,RI:None,RI:None,GHBPB1:KeyNoApotik)
  SELF.AddRelationLink(GAPO:Kode_Apotik,GHBPB1:Kode_Apotik)

  SELF.AddRelation(Relate:vstokfifo,RI:None,RI:None,VST:apotik_vstokfifo_key)
  SELF.AddRelationLink(GAPO:Kode_Apotik,VST:kode_apotik)

  SELF.AddRelation(Relate:AptoInSmdH,RI:None,RI:None,APTI1:key_apotik)
  SELF.AddRelationLink(GAPO:Kode_Apotik,APTI1:Kode_Apotik)

  SELF.AddRelation(Relate:ApNotaManual,RI:None,RI:None,APN:Apotik_ApNotaManual_FK)
  SELF.AddRelationLink(GAPO:Kode_Apotik,APN:Kode_Apotik)

  SELF.AddRelation(Relate:RI_HBSBBK,RI:CASCADE,RI:RESTRICT,RI_HSB1:Aptotik_rihsbbk_fk)
  SELF.AddRelationLink(GAPO:Kode_Apotik,RI_HSB1:Apotik)

  SELF.AddRelation(Relate:ApHProd,RI:CASCADE,RI:RESTRICT,APHP:key_apotik)
  SELF.AddRelationLink(GAPO:Kode_Apotik,APHP:Kode_Apotik)

  SELF.AddRelation(Relate:RI_HToAptk,RI:CASCADE,RI:RESTRICT,RI_TOA:key_apotik)
  SELF.AddRelationLink(GAPO:Kode_Apotik,RI_TOA:Kode_Apotik)

  SELF.AddRelation(Relate:GHBSBBK,RI:CASCADE,RI:RESTRICT,GHBSB:KeyKdAptk)
  SELF.AddRelationLink(GAPO:Kode_Apotik,GHBSB:kode_apotik)

AddRelations_2 ROUTINE
  SELF.AddRelation(Relate:AptoInHe,RI:CASCADE,RI:RESTRICT,APTI:key_apotik)
  SELF.AddRelationLink(GAPO:Kode_Apotik,APTI:Kode_Apotik)

  SELF.AddRelation(Relate:AptoApHe,RI:CASCADE,RI:RESTRICT,APTH:key_kode_ap)
  SELF.AddRelationLink(GAPO:Kode_Apotik,APTH:Kode_Apotik)

  SELF.AddRelation(Relate:APHTRANS,RI:CASCADE,RI:RESTRICT,APH:BY_KODEAP)
  SELF.AddRelationLink(GAPO:Kode_Apotik,APH:Kode_Apotik)

  SELF.AddRelation(Relate:GStokAptk,RI:CASCADE,RI:RESTRICT,GSTO:KeyApotik)
  SELF.AddRelationLink(GAPO:Kode_Apotik,GSTO:Kode_Apotik)

  SELF.AddRelation(Relate:GHBPB,RI:CASCADE,RI:RESTRICT,GHBPB:KeyNoApotik)
  SELF.AddRelationLink(GAPO:Kode_Apotik,GHBPB:Kode_Apotik)


Hide:Relate:GApotik.Kill PROCEDURE

  CODE
  _Hide:Access:GApotik.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:GApotik &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GApotik)                            ! destroy the file manager


Hide:Relate:JTSBayar.Init PROCEDURE
  CODE
  _Hide:Access:JTSBayar.Init
  SELF.Init(Access:JTSBayar,1)


Hide:Access:JTSBayar.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JTBS:Record
  SELF.FileNameValue = 'JTSBayar'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JTSBayar
  PARENT.Init
  Access:JTSBayar &= SELF


Hide:Access:JTSBayar.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JTSBayar &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JTSBayar.PrimeFields PROCEDURE

  CODE
  JTBS:Selesai = 'N'                                       ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:JTSBayar.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JTSBayar,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JTBS:KeyNomorMr,'JTBS:KeyNomorMr',0)
    SELF.AddKey(JTBS:KeyNoBukti,'JTBS:KeyNoBukti',0)
    SELF.AddKey(JTBS:KeyKlinik,'JTBS:KeyKlinik',0)
    SELF.AddKey(JTBS:KeyDokter,'JTBS:KeyDokter',0)
    SELF.AddKey(JTBS:KeyTanggal,'JTBS:KeyTanggal',0)
    SELF.AddKey(JTBS:KeyNoNota,'JTBS:KeyNoNota',0)
    SELF.AddKey(JTBS:KeyTempat,'JTBS:KeyTempat',0)
    SELF.AddKey(JTBS:KeyTransaksi,'JTBS:KeyTransaksi',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JTSBayar.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JPoli)

  SELF.AddRelation(Relate:JDokter)

  SELF.AddRelation(Relate:JPasien)


Hide:Relate:JTSBayar.Kill PROCEDURE

  CODE
  _Hide:Access:JTSBayar.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:JTSBayar &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JTSBayar)                           ! destroy the file manager


Hide:Relate:GRBatalK.Init PROCEDURE
  CODE
  _Hide:Access:GRBatalK.Init
  SELF.Init(Access:GRBatalK,1)


Hide:Access:GRBatalK.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GRBK:Record
  SELF.FileNameValue = 'GRBatalK'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GRBatalK
  PARENT.Init
  Access:GRBatalK &= SELF


Hide:Access:GRBatalK.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GRBatalK &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GRBatalK.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GRBatalK,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GRBK:KeyKodeBrg,'GRBK:KeyKodeBrg',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GRBatalK.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)


Hide:Relate:GRBatalK.Kill PROCEDURE

  CODE
  _Hide:Access:GRBatalK.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:GRBatalK &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GRBatalK)                           ! destroy the file manager


Hide:Relate:GBarang.Init PROCEDURE
  CODE
  _Hide:Access:GBarang.Init
  SELF.Init(Access:GBarang,1)


Hide:Access:GBarang.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GBAR:Record
  SELF.FileNameValue = 'GBarang'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GBarang
  PARENT.Init
  Access:GBarang &= SELF


Hide:Access:GBarang.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GBarang &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GBarang.PrimeFields PROCEDURE

  CODE
  GBAR:Jenis_Brg = 'Obat'                                  ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:GBarang.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GBarang,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GBAR:keyNamaKandungan,'GBAR:keyNamaKandungan',0)
    SELF.AddKey(GBAR:KeyKodeBrg,'Kode Barang',0)
    SELF.AddKey(GBAR:KeyNama,'Nama Barang',0)
    SELF.AddKey(GBAR:KeyKodeUPF,'GBAR:KeyKodeUPF',0)
    SELF.AddKey(GBAR:KeyKodeKelompok,'GBAR:KeyKodeKelompok',0)
    SELF.AddKey(GBAR:KeyKodeAsliBrg,'GBAR:KeyKodeAsliBrg',0)
    SELF.AddKey(GBAR:Barcode_GBarang_FK,'GBAR:Barcode_GBarang_FK',0)
    SELF.AddKey(GBAR:Ket1_gbarang_fk,'GBAR:Ket1_gbarang_fk',0)
    SELF.AddKey(GBAR:KeyKodeKandungan,'GBAR:KeyKodeKandungan',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GBarang.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  DO AddRelations_2
  
  DO AddRelations_3
  
  DO AddRelations_4
  
  DO AddRelations_5
  
  DO AddRelations_6
  
  DO AddRelations_7
  
  DO AddRelations_8
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:APEPRED,RI:None,RI:None,APE4:by_kodebrg)
  SELF.AddRelationLink(GBAR:Kode_brg,APE4:Kode_brg)

  SELF.AddRelation(Relate:VAPDTRANS,RI:None,RI:None,APD4:kodebrg_apdtrans_fk)
  SELF.AddRelationLink(GBAR:Kode_brg,APD4:Kode_brg)

  SELF.AddRelation(Relate:APObatRuang,RI:None,RI:None,APO1:Barang_ObatRuangan_FK)
  SELF.AddRelationLink(GBAR:Kode_brg,APO1:Kode_Barang)

  SELF.AddRelation(Relate:ApStokopSS,RI:None,RI:None,Apso1:keykode_barang)
  SELF.AddRelationLink(GBAR:Kode_brg,Apso1:Kode_Barang)

  SELF.AddRelation(Relate:GDBPBMaster,RI:None,RI:None,GDBPB1:KeyKodeBarang)
  SELF.AddRelationLink(GBAR:Kode_brg,GDBPB1:Kode_Brg)

  SELF.AddRelation(Relate:INDDKB,RI:None,RI:None,IND:barang_inddkb_fk)
  SELF.AddRelationLink(GBAR:Kode_brg,IND:KodeBarang)

  SELF.AddRelation(Relate:GBarangAlias,RI:None,RI:None,GBAR1:KeyKodeBrg)
  SELF.AddRelationLink(GBAR:Kode_brg,GBAR1:Kode_brg)

  SELF.AddRelation(Relate:AFIFOOUTTemp,RI:None,RI:None,AFI21:KEY1)
  SELF.AddRelationLink(GBAR:Kode_brg,AFI21:Kode_Barang)

  SELF.AddRelation(Relate:JKontrakObat,RI:CASCADE,RI:RESTRICT,JKOO:by_kode_brg)
  SELF.AddRelationLink(GBAR:Kode_brg,JKOO:Kode_brg)

  SELF.AddRelation(Relate:ApPaketD,RI:None,RI:None,APP21:barang_appaketd_fk)
  SELF.AddRelationLink(GBAR:Kode_brg,APP21:Kode_Barang)

AddRelations_2 ROUTINE
  SELF.AddRelation(Relate:vstokfifo,RI:None,RI:None,VST:primarykey)
  SELF.AddRelationLink(GBAR:Kode_brg,VST:kode_barang)

  SELF.AddRelation(Relate:AptoInSmdD,RI:None,RI:None,APTD1:key_kd_brg)
  SELF.AddRelationLink(GBAR:Kode_brg,APTD1:Kode_Brg)

  SELF.AddRelation(Relate:RoPasiCt,RI:None,RI:None,ROPA1:KeyKodeBrg)
  SELF.AddRelationLink(GBAR:Kode_brg,ROPA1:Kode_Brg)

  SELF.AddRelation(Relate:OKKStok,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,GKS1:PrimaryKey)
  SELF.AddRelationLink(GBAR:Kode_brg,GKS1:Kode_Barang)

  SELF.AddRelation(Relate:OKFIFOIN,RI:CASCADE,RI:RESTRICT,FIF1:barang_OKFIFOIN_FK)
  SELF.AddRelationLink(GBAR:Kode_brg,FIF1:Kode_Barang)

  SELF.AddRelation(Relate:OKIDKeluar,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,OKD3:Barang_OKIDKeluar_Key)
  SELF.AddRelationLink(GBAR:Kode_brg,OKD3:Kode_Barang)

  SELF.AddRelation(Relate:INSaldoawal,RI:CASCADE,RI:RESTRICT,INSA:oksawal_gbar_fk)
  SELF.AddRelationLink(GBAR:Kode_brg,INSA:Kode_barang)

  SELF.AddRelation(Relate:OKDKeluar,RI:CASCADE,RI:RESTRICT,OKD:Barang_OKDKeluar_Key)
  SELF.AddRelationLink(GBAR:Kode_brg,OKD:Kode_Barang)

  SELF.AddRelation(Relate:GStokOp,RI:None,RI:None,GST2:Gbar_GSokOp_Key)
  SELF.AddRelationLink(GBAR:Kode_brg,GST2:Kode_Barang)

  SELF.AddRelation(Relate:GSaldoawal,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,GSA:gsawal_gbar_fk)
  SELF.AddRelationLink(GBAR:Kode_brg,GSA:Kode_barang)

AddRelations_3 ROUTINE
  SELF.AddRelation(Relate:ROGFpmpd,RI:None,RI:None,RoF:key_kd_brg)
  SELF.AddRelationLink(GBAR:Kode_brg,RoF:Kode_brg)

  SELF.AddRelation(Relate:ApStokop,RI:None,RI:None,Apso:keykode_barang)
  SELF.AddRelationLink(GBAR:Kode_brg,Apso:Kode_Barang)

  SELF.AddRelation(Relate:ASaldoAwal,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,ASA:Barang_ASaldoAwal_FK)
  SELF.AddRelationLink(GBAR:Kode_brg,ASA:Kode_Barang)

  SELF.AddRelation(Relate:RI_DSBBM,RI:CASCADE,RI:RESTRICT,RI_DSM:Barang_RI_DSBBM_FK)
  SELF.AddRelationLink(GBAR:Kode_brg,RI_DSM:Kode_brg)

  SELF.AddRelation(Relate:GBarKel)

  SELF.AddRelation(Relate:INAdjust,RI:CASCADE,RI:RESTRICT,INAD:GBarang_INADjust_Key)
  SELF.AddRelationLink(GBAR:Kode_brg,INAD:Kode_Barang)

  SELF.AddRelation(Relate:ROGBarang,RI:None,RI:None,RoGB:KeyKodeBrg)
  SELF.AddRelationLink(GBAR:Kode_brg,RoGB:Kode_brg)

  SELF.AddRelation(Relate:AAdjust,RI:None,RI:None,AAD:GBarang_GAdjusment_Key)
  SELF.AddRelationLink(GBAR:Kode_brg,AAD:Kode_Barang)

  SELF.AddRelation(Relate:GAdjusment,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,GAD:GBarang_GAdjusment_Key)
  SELF.AddRelationLink(GBAR:Kode_brg,GAD:Kode_Barang)

  SELF.AddRelation(Relate:AFIFOIN,RI:CASCADE,RI:RESTRICT,AFI:KeyBarangFIFOIN)
  SELF.AddRelationLink(GBAR:Kode_brg,AFI:Kode_Barang)

AddRelations_4 ROUTINE
  SELF.AddRelation(Relate:APKStok,RI:CASCADE,RI:RESTRICT,APK:KeyBarangAPKSTOK)
  SELF.AddRelationLink(GBAR:Kode_brg,APK:Kode_Barang)

  SELF.AddRelation(Relate:ApDDProd,RI:CASCADE,RI:RESTRICT,APDDP:Key_Kode_asal)
  SELF.AddRelationLink(GBAR:Kode_brg,APDDP:Kode_Asal)

  SELF.AddRelation(Relate:ApDProd,RI:CASCADE,RI:RESTRICT,APDP:key_kd_brg)
  SELF.AddRelationLink(GBAR:Kode_brg,APDP:Kode_Brg)

  SELF.AddRelation(Relate:RI_DTOAPTK,RI:CASCADE,RI:RESTRICT,RIDTO:key_kd_brg)
  SELF.AddRelationLink(GBAR:Kode_brg,RIDTO:Kode_Brg)

  SELF.AddRelation(Relate:RI_DBSBBK,RI:CASCADE,RI:RESTRICT,RI_DSB1:Barang_RI_DSBBK_FK)
  SELF.AddRelationLink(GBAR:Kode_brg,RI_DSB1:Kode_brg)

  SELF.AddRelation(Relate:RI_DSBBK,RI:CASCADE,RI:RESTRICT,RI_DSB:Barang_RI_DSBBK_FK)
  SELF.AddRelationLink(GBAR:Kode_brg,RI_DSB:Kode_brg)

  SELF.AddRelation(Relate:RI_KStok,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,RI_KS:PrimaryKey)
  SELF.AddRelationLink(GBAR:Kode_brg,RI_KS:Kode_Barang)

  SELF.AddRelation(Relate:RI_Stok,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,RI_ST:key_kd_brg)
  SELF.AddRelationLink(GBAR:Kode_brg,RI_ST:Kode_Barang)

  SELF.AddRelation(Relate:ApInOutBln,RI:None,RI:None,APIN:Barang_Apinoutbln_fk)
  SELF.AddRelationLink(GBAR:Kode_brg,APIN:Kode)

  SELF.AddRelation(Relate:GKStok,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,GKS:PrimaryKey)
  SELF.AddRelationLink(GBAR:Kode_brg,GKS:Kode_Barang)

AddRelations_5 ROUTINE
  SELF.AddRelation(Relate:GBrgDis,RI:CASCADE,RI:RESTRICT,GBR:PK)
  SELF.AddRelationLink(GBAR:Kode_brg,GBR:Kode_Brg)

  SELF.AddRelation(Relate:FIFOIN,RI:CASCADE,RI:RESTRICT,FIF:barang_FIFOIN_FK)
  SELF.AddRelationLink(GBAR:Kode_brg,FIF:Kode_Barang)

  SELF.AddRelation(Relate:GStokPerBulan,RI:CASCADE,RI:RESTRICT,GST:KeyKodeBarang)
  SELF.AddRelationLink(GBAR:Kode_brg,GST:KodeBrg)

  SELF.AddRelation(Relate:GPBF)

  SELF.AddRelation(Relate:ApLapKel,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,APLK:key_kode_brg)
  SELF.AddRelationLink(GBAR:Kode_brg,APLK:Kode_brg)

  SELF.AddRelation(Relate:DTOBAT,RI:CASCADE,RI:None,DTOB:KeyKodeObat)
  SELF.AddRelationLink(GBAR:Kode_brg,DTOB:KodeObat)

  SELF.AddRelation(Relate:DTPLain,RI:CASCADE,RI:None,DTPL:KeyKodeLain)
  SELF.AddRelationLink(GBAR:Kode_brg,DTPL:KodeLain)

  SELF.AddRelation(Relate:DTPBena,RI:CASCADE,RI:None,DTPE:KeyKodeBenang)
  SELF.AddRelationLink(GBAR:Kode_brg,DTPE:KodeBenang)

  SELF.AddRelation(Relate:DTPBalut,RI:CASCADE,RI:None,DTPB:KeyKodeBalut)
  SELF.AddRelationLink(GBAR:Kode_brg,DTPB:KodeBalut)

  SELF.AddRelation(Relate:DTAlLain,RI:CASCADE,RI:None,DAL:KeyKodeAlat)
  SELF.AddRelationLink(GBAR:Kode_brg,DAL:KodeAlat)

AddRelations_6 ROUTINE
  SELF.AddRelation(Relate:DTGas,RI:CASCADE,RI:None,DTGA:KeyKodeGas)
  SELF.AddRelationLink(GBAR:Kode_brg,DTGA:KodeGas)

  SELF.AddRelation(Relate:DTAsi,RI:CASCADE,RI:None,DTAI:KeyKodeAsIn)
  SELF.AddRelationLink(GBAR:Kode_brg,DTAI:KodeAlSI)

  SELF.AddRelation(Relate:DTBena,RI:CASCADE,RI:None,DTBE:KeyKodeBenang)
  SELF.AddRelationLink(GBAR:Kode_brg,DTBE:KodeBenang)

  SELF.AddRelation(Relate:DTBalut,RI:CASCADE,RI:None,DTBA:KeyKodeBalut)
  SELF.AddRelationLink(GBAR:Kode_brg,DTBA:KodeBalut)

  SELF.AddRelation(Relate:GSATMP,RI:CASCADE,RI:None,GSTO1:KeyBarang)
  SELF.AddRelationLink(GBAR:Kode_brg,GSTO1:Kode_Barang)

  SELF.AddRelation(Relate:ApObInst,RI:CASCADE,RI:RESTRICT,APOB:keykd_barang)
  SELF.AddRelationLink(GBAR:Kode_brg,APOB:Kode_brg)

  SELF.AddRelation(Relate:RoPasien,RI:None,RI:None,ROPA:KeyKodeBrg)
  SELF.AddRelationLink(GBAR:Kode_brg,ROPA:Kode_Brg)

  SELF.AddRelation(Relate:GBarUPF)

  SELF.AddRelation(Relate:RoStok,RI:None,RI:None,RSTO:KeyKodeBrg)
  SELF.AddRelationLink(GBAR:Kode_brg,RSTO:Kode_Brg)

  SELF.AddRelation(Relate:JUPF)

AddRelations_7 ROUTINE
  SELF.AddRelation(Relate:IPkiObat,RI:CASCADE,RI:None,IPKO:KeyKodeObat)
  SELF.AddRelationLink(GBAR:Kode_brg,IPKO:KodeObat)

  SELF.AddRelation(Relate:AptoInDe,RI:CASCADE,RI:RESTRICT,APTD:key_kd_brg)
  SELF.AddRelationLink(GBAR:Kode_brg,APTD:Kode_Brg)

  SELF.AddRelation(Relate:APtoAPde,RI:CASCADE,RI:RESTRICT,APTO:KeyKodeBrg)
  SELF.AddRelationLink(GBAR:Kode_brg,APTO:Kode_Brg)

  SELF.AddRelation(Relate:APOBKONT,RI:CASCADE,RI:RESTRICT,APO:by_kode_brg)
  SELF.AddRelationLink(GBAR:Kode_brg,APO:Kode_brg)

  SELF.AddRelation(Relate:APBRGCMP,RI:CASCADE,RI:RESTRICT,APB:by_kd_barang)
  SELF.AddRelationLink(GBAR:Kode_brg,APB:Kode_brg)

  SELF.AddRelation(Relate:APDTcam,RI:CASCADE,RI:RESTRICT,APD1:by_kodebrg)
  SELF.AddRelationLink(GBAR:Kode_brg,APD1:Kode_brg)

  SELF.AddRelation(Relate:APDTRANS,RI:CASCADE,RI:RESTRICT,APD:by_kodebrg)
  SELF.AddRelationLink(GBAR:Kode_brg,APD:Kode_brg)

  SELF.AddRelation(Relate:IDAOrder,RI:CASCADE,RI:None,IDAO:key_kodeobat)
  SELF.AddRelationLink(GBAR:Kode_brg,IDAO:Kode_brg)

  SELF.AddRelation(Relate:GBAStock,RI:CASCADE,RI:None,GBAS:KeyKodeBrg)
  SELF.AddRelationLink(GBAR:Kode_brg,GBAS:Kode_brg)

  SELF.AddRelation(Relate:GRBatalK,RI:CASCADE,RI:None,GRBK:KeyKodeBrg)
  SELF.AddRelationLink(GBAR:Kode_brg,GRBK:KodeBrg)

AddRelations_8 ROUTINE
  SELF.AddRelation(Relate:GDBSBBK,RI:CASCADE,RI:RESTRICT,GDBSB:KeyBarang)
  SELF.AddRelationLink(GBAR:Kode_brg,GDBSB:KodeBarang)

  SELF.AddRelation(Relate:GLapBln,RI:CASCADE,RI:None,GLAB:KeyKode)
  SELF.AddRelationLink(GBAR:Kode_brg,GLAB:Kode)

  SELF.AddRelation(Relate:GRekapBK,RI:CASCADE,RI:None,GREK:KeyKodeBrg)
  SELF.AddRelationLink(GBAR:Kode_brg,GREK:KodeBrg)

  SELF.AddRelation(Relate:GDSPB,RI:CASCADE,RI:None,GDSPB:KeyKodeBrg)
  SELF.AddRelationLink(GBAR:Kode_brg,GDSPB:KodeBarang)

  SELF.AddRelation(Relate:GDSBBK,RI:CASCADE,RI:RESTRICT,GDSB:KeyBarang)
  SELF.AddRelationLink(GBAR:Kode_brg,GDSB:KodeBarang)

  SELF.AddRelation(Relate:GDBPB,RI:CASCADE,RI:RESTRICT,GDBPB:KeyKodeBarang)
  SELF.AddRelationLink(GBAR:Kode_brg,GDBPB:Kode_Brg)

  SELF.AddRelation(Relate:GStokAptk,RI:CASCADE,RI:None,GSTO:KeyBarang)
  SELF.AddRelationLink(GBAR:Kode_brg,GSTO:Kode_Barang)

  SELF.AddRelation(Relate:GStockGdg,RI:CASCADE,RI:CASCADE,GSGD:KeyKodeBrg)
  SELF.AddRelationLink(GBAR:Kode_brg,GSGD:Kode_brg)

  SELF.AddRelation(Relate:GDSBBM,RI:CASCADE,RI:None,GDSBM:KeyKodeBarang)
  SELF.AddRelationLink(GBAR:Kode_brg,GDSBM:KodeBarang)


Hide:Relate:GBarang.Kill PROCEDURE

  CODE
  _Hide:Access:GBarang.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:GBarang &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GBarang)                            ! destroy the file manager


Hide:Relate:GLapBln.Init PROCEDURE
  CODE
  _Hide:Access:GLapBln.Init
  SELF.Init(Access:GLapBln,1)


Hide:Access:GLapBln.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GLAB:Record
  SELF.FileNameValue = 'GLapBln'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GLapBln
  PARENT.Init
  Access:GLapBln &= SELF


Hide:Access:GLapBln.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GLapBln &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GLapBln.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GLapBln,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GLAB:KeyNo,'GLAB:KeyNo',1)
    SELF.AddKey(GLAB:KeyKode,'GLAB:KeyKode',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GLapBln.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)


Hide:Relate:GLapBln.Kill PROCEDURE

  CODE
  _Hide:Access:GLapBln.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:GLapBln &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GLapBln)                            ! destroy the file manager


Hide:Relate:GSatuan.Init PROCEDURE
  CODE
  _Hide:Access:GSatuan.Init
  SELF.Init(Access:GSatuan,1)


Hide:Access:GSatuan.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GSAT:Record
  SELF.FileNameValue = 'GSatuan'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GSatuan
  PARENT.Init
  Access:GSatuan &= SELF


Hide:Access:GSatuan.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GSatuan &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GSatuan.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GSatuan,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(GSAT:Key_No_Satuan,'No Satuan',1)
    SELF.AddKey(GSAT:Key_Nama_Satuan,'Nama Satuan',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GSatuan.Kill PROCEDURE

  CODE
  _Hide:Access:GSatuan.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:GSatuan &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GSatuan)                            ! destroy the file manager


Hide:Relate:LAdaDet.Init PROCEDURE
  CODE
  _Hide:Access:LAdaDet.Init
  SELF.Init(Access:LAdaDet,1)


Hide:Access:LAdaDet.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LADD:Record
  SELF.FileNameValue = 'LAdaDet'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LAdaDet
  PARENT.Init
  Access:LAdaDet &= SELF


Hide:Access:LAdaDet.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LAdaDet &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LAdaDet.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LAdaDet,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(LADD:KeyNPer_KLab,'Nomor Periksa dan KodeLab',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:LAdaDet.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:LDDPerik)


Hide:Relate:LAdaDet.Kill PROCEDURE

  CODE
  _Hide:Access:LAdaDet.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:LAdaDet &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LAdaDet)                            ! destroy the file manager


Hide:Relate:MBarangMK.Init PROCEDURE
  CODE
  _Hide:Access:MBarangMK.Init
  SELF.Init(Access:MBarangMK,1)


Hide:Access:MBarangMK.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= MBA:Record
  SELF.FileNameValue = 'MBarangMK'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= MBarangMK
  PARENT.Init
  Access:MBarangMK &= SELF


Hide:Access:MBarangMK.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:MBarangMK &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:MBarangMK.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(MBarangMK,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:MBarangMK.Kill PROCEDURE

  CODE
  _Hide:Access:MBarangMK.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:MBarangMK &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:MBarangMK)                          ! destroy the file manager


Hide:Relate:JTTBayar.Init PROCEDURE
  CODE
  _Hide:Access:JTTBayar.Init
  SELF.Init(Access:JTTBayar,1)


Hide:Access:JTTBayar.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JTTB:Record
  SELF.FileNameValue = 'JTTBayar'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JTTBayar
  PARENT.Init
  Access:JTTBayar &= SELF


Hide:Access:JTTBayar.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JTTBayar &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JTTBayar.PrimeFields PROCEDURE

  CODE
  JTTB:Selesai = 'N'                                       ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:JTTBayar.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JTTBayar,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JTTB:KeyNomorMr,'JTTB:KeyNomorMr',0)
    SELF.AddKey(JTTB:KeyNoBukti,'JTTB:KeyNoBukti',0)
    SELF.AddKey(JTTB:KeyKode,'JTTB:KeyKode',0)
    SELF.AddKey(JTTB:KeyDokter,'JTTB:KeyDokter',0)
    SELF.AddKey(JTTB:KeyTanggal,'JTTB:KeyTanggal',0)
    SELF.AddKey(JTTB:KeyNoNota,'JTTB:KeyNoNota',0)
    SELF.AddKey(JTTB:KeyTempat,'JTTB:KeyTempat',0)
    SELF.AddKey(JTTB:KeyTransaksi,'JTTB:KeyTransaksi',0)
    SELF.AddKey(JTTB:KeyKodeDokter,'JTTB:KeyKodeDokter',0)
    SELF.AddKey(JTTB:KeyLantai,'JTTB:KeyLantai',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JTTBayar.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JTindaka)

  SELF.AddRelation(Relate:JDokter)

  SELF.AddRelation(Relate:JTempat)

  SELF.AddRelation(Relate:JPasien)

  SELF.AddRelation(Relate:JTPasien,RI:None,RI:None,JTPA:KeyNomorMr)
  SELF.AddRelationLink(JTTB:Nomor_Mr,JTPA:Nomor_Mr)


Hide:Relate:JTTBayar.Kill PROCEDURE

  CODE
  _Hide:Access:JTTBayar.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:JTTBayar &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JTTBayar)                           ! destroy the file manager


Hide:Relate:OKLain.Init PROCEDURE
  CODE
  _Hide:Access:OKLain.Init
  SELF.Init(Access:OKLain,1)


Hide:Access:OKLain.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= OKL:Record
  SELF.FileNameValue = 'OKLain'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= OKLain
  PARENT.Init
  Access:OKLain &= SELF


Hide:Access:OKLain.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:OKLain &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:OKLain.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(OKLain,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(OKL:PrimaryKey,'OKL:PrimaryKey',0)
    SELF.AddKey(OKL:KeyNama,'OKL:KeyNama',0)
    SELF.AddKey(OKL:KeyKode,'OKL:KeyKode',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:OKLain.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:OKBiayaLain,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,OKB:KeyNamaTind_OKLain)
  SELF.AddRelationLink(OKL:kode,OKB:Nama_Tindakan)

  SELF.AddRelation(Relate:OKIBiayaLain,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,OKB1:keyTindakan_oklain)
  SELF.AddRelationLink(OKL:kode,OKB1:Nama_Tindakan)


Hide:Relate:OKLain.Kill PROCEDURE

  CODE
  _Hide:Access:OKLain.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:OKLain &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:OKLain)                             ! destroy the file manager

