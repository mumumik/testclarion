  MEMBER('apc6new.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
APC6NBC0:DctInit    PROCEDURE
APC6NBC0:DctKill    PROCEDURE
APC6NBC0:FilesInit  PROCEDURE
  END

Hide:Access:APEPREH  CLASS(FileManager),TYPE               ! FileManager for APEPREH
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:APEPREH  CLASS(RelationManager),TYPE           ! RelationManager for APEPREH
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JPengirim CLASS(FileManager),TYPE              ! FileManager for JPengirim
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JPengirim CLASS(RelationManager),TYPE          ! RelationManager for JPengirim
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:HM_BARANGNEW CLASS(FileManager),TYPE           ! FileManager for HM_BARANGNEW
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:HM_BARANGNEW CLASS(RelationManager),TYPE       ! RelationManager for HM_BARANGNEW
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ASetApotik CLASS(FileManager),TYPE             ! FileManager for ASetApotik
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ASetApotik CLASS(RelationManager),TYPE         ! RelationManager for ASetApotik
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:TBTransResepDokterDetail CLASS(FileManager),TYPE ! FileManager for TBTransResepDokterDetail
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:TBTransResepDokterDetail CLASS(RelationManager),TYPE ! RelationManager for TBTransResepDokterDetail
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JHBILLING CLASS(FileManager),TYPE              ! FileManager for JHBILLING
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JHBILLING CLASS(RelationManager),TYPE          ! RelationManager for JHBILLING
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JDDBILLING CLASS(FileManager),TYPE             ! FileManager for JDDBILLING
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JDDBILLING CLASS(RelationManager),TYPE         ! RelationManager for JDDBILLING
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JDBILLING CLASS(FileManager),TYPE              ! FileManager for JDBILLING
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JDBILLING CLASS(RelationManager),TYPE          ! RelationManager for JDBILLING
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:FileSql2 CLASS(FileManager),TYPE               ! FileManager for FileSql2
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:FileSql2 CLASS(RelationManager),TYPE           ! RelationManager for FileSql2
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:JKontrakObat CLASS(FileManager),TYPE           ! FileManager for JKontrakObat
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:JKontrakObat CLASS(RelationManager),TYPE       ! RelationManager for JKontrakObat
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ApEmbalase CLASS(FileManager),TYPE             ! FileManager for ApEmbalase
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ApEmbalase CLASS(RelationManager),TYPE         ! RelationManager for ApEmbalase
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:VAPDTRANS CLASS(FileManager),TYPE              ! FileManager for VAPDTRANS
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:VAPDTRANS CLASS(RelationManager),TYPE          ! RelationManager for VAPDTRANS
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:APEPRED  CLASS(FileManager),TYPE               ! FileManager for APEPRED
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:APEPRED  CLASS(RelationManager),TYPE           ! RelationManager for APEPRED
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:AFIFOOUTTemp CLASS(FileManager),TYPE           ! FileManager for AFIFOOUTTemp
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:AFIFOOUTTemp CLASS(RelationManager),TYPE       ! RelationManager for AFIFOOUTTemp
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:APDTRANSBackup CLASS(FileManager),TYPE         ! FileManager for APDTRANSBackup
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:APDTRANSBackup CLASS(RelationManager),TYPE     ! RelationManager for APDTRANSBackup
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:vstokfifo CLASS(FileManager),TYPE              ! FileManager for vstokfifo
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:vstokfifo CLASS(RelationManager),TYPE          ! RelationManager for vstokfifo
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:SMUnit_Master CLASS(FileManager),TYPE          ! FileManager for SMUnit_Master
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:SMUnit_Master CLASS(RelationManager),TYPE      ! RelationManager for SMUnit_Master
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:APHTRANSBackup CLASS(FileManager),TYPE         ! FileManager for APHTRANSBackup
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:APHTRANSBackup CLASS(RelationManager),TYPE     ! RelationManager for APHTRANSBackup
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:ApNotaObat CLASS(FileManager),TYPE             ! FileManager for ApNotaObat
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:ApNotaObat CLASS(RelationManager),TYPE         ! RelationManager for ApNotaObat
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END

Hide:Access:SMRUnker CLASS(FileManager),TYPE               ! FileManager for SMRUnker
Init                   PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED ! Method added to host embed code
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED ! Method added to host embed code
                     END


Hide:Relate:SMRUnker CLASS(RelationManager),TYPE           ! RelationManager for SMRUnker
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED                 ! Method added to host embed code
Kill                   PROCEDURE(),DERIVED                 ! Method added to host embed code
                     END


_Hide:Access:APEPREH &Hide:Access:APEPREH,AUTO,THREAD
_Hide:Relate:APEPREH &Hide:Relate:APEPREH,AUTO,THREAD
_Hide:Access:JPengirim &Hide:Access:JPengirim,AUTO,THREAD
_Hide:Relate:JPengirim &Hide:Relate:JPengirim,AUTO,THREAD
_Hide:Access:HM_BARANGNEW &Hide:Access:HM_BARANGNEW,AUTO,THREAD
_Hide:Relate:HM_BARANGNEW &Hide:Relate:HM_BARANGNEW,AUTO,THREAD
_Hide:Access:ASetApotik &Hide:Access:ASetApotik,AUTO,THREAD
_Hide:Relate:ASetApotik &Hide:Relate:ASetApotik,AUTO,THREAD
_Hide:Access:TBTransResepDokterDetail &Hide:Access:TBTransResepDokterDetail,AUTO,THREAD
_Hide:Relate:TBTransResepDokterDetail &Hide:Relate:TBTransResepDokterDetail,AUTO,THREAD
_Hide:Access:JHBILLING &Hide:Access:JHBILLING,AUTO,THREAD
_Hide:Relate:JHBILLING &Hide:Relate:JHBILLING,AUTO,THREAD
_Hide:Access:JDDBILLING &Hide:Access:JDDBILLING,AUTO,THREAD
_Hide:Relate:JDDBILLING &Hide:Relate:JDDBILLING,AUTO,THREAD
_Hide:Access:JDBILLING &Hide:Access:JDBILLING,AUTO,THREAD
_Hide:Relate:JDBILLING &Hide:Relate:JDBILLING,AUTO,THREAD
_Hide:Access:FileSql2 &Hide:Access:FileSql2,AUTO,THREAD
_Hide:Relate:FileSql2 &Hide:Relate:FileSql2,AUTO,THREAD
_Hide:Access:JKontrakObat &Hide:Access:JKontrakObat,AUTO,THREAD
_Hide:Relate:JKontrakObat &Hide:Relate:JKontrakObat,AUTO,THREAD
_Hide:Access:ApEmbalase &Hide:Access:ApEmbalase,AUTO,THREAD
_Hide:Relate:ApEmbalase &Hide:Relate:ApEmbalase,AUTO,THREAD
_Hide:Access:VAPDTRANS &Hide:Access:VAPDTRANS,AUTO,THREAD
_Hide:Relate:VAPDTRANS &Hide:Relate:VAPDTRANS,AUTO,THREAD
_Hide:Access:APEPRED &Hide:Access:APEPRED,AUTO,THREAD
_Hide:Relate:APEPRED &Hide:Relate:APEPRED,AUTO,THREAD
_Hide:Access:AFIFOOUTTemp &Hide:Access:AFIFOOUTTemp,AUTO,THREAD
_Hide:Relate:AFIFOOUTTemp &Hide:Relate:AFIFOOUTTemp,AUTO,THREAD
_Hide:Access:APDTRANSBackup &Hide:Access:APDTRANSBackup,AUTO,THREAD
_Hide:Relate:APDTRANSBackup &Hide:Relate:APDTRANSBackup,AUTO,THREAD
_Hide:Access:vstokfifo &Hide:Access:vstokfifo,AUTO,THREAD
_Hide:Relate:vstokfifo &Hide:Relate:vstokfifo,AUTO,THREAD
_Hide:Access:SMUnit_Master &Hide:Access:SMUnit_Master,AUTO,THREAD
_Hide:Relate:SMUnit_Master &Hide:Relate:SMUnit_Master,AUTO,THREAD
_Hide:Access:APHTRANSBackup &Hide:Access:APHTRANSBackup,AUTO,THREAD
_Hide:Relate:APHTRANSBackup &Hide:Relate:APHTRANSBackup,AUTO,THREAD
_Hide:Access:ApNotaObat &Hide:Access:ApNotaObat,AUTO,THREAD
_Hide:Relate:ApNotaObat &Hide:Relate:ApNotaObat,AUTO,THREAD
_Hide:Access:SMRUnker &Hide:Access:SMRUnker,AUTO,THREAD
_Hide:Relate:SMRUnker &Hide:Relate:SMRUnker,AUTO,THREAD


APC6NBC0:DctInit PROCEDURE
  CODE
  _Hide:Access:APEPREH &= NEW(Hide:Access:APEPREH)
  _Hide:Relate:APEPREH &= NEW(Hide:Relate:APEPREH)
  _Hide:Access:JPengirim &= NEW(Hide:Access:JPengirim)
  _Hide:Relate:JPengirim &= NEW(Hide:Relate:JPengirim)
  _Hide:Access:HM_BARANGNEW &= NEW(Hide:Access:HM_BARANGNEW)
  _Hide:Relate:HM_BARANGNEW &= NEW(Hide:Relate:HM_BARANGNEW)
  _Hide:Access:ASetApotik &= NEW(Hide:Access:ASetApotik)
  _Hide:Relate:ASetApotik &= NEW(Hide:Relate:ASetApotik)
  _Hide:Access:TBTransResepDokterDetail &= NEW(Hide:Access:TBTransResepDokterDetail)
  _Hide:Relate:TBTransResepDokterDetail &= NEW(Hide:Relate:TBTransResepDokterDetail)
  _Hide:Access:JHBILLING &= NEW(Hide:Access:JHBILLING)
  _Hide:Relate:JHBILLING &= NEW(Hide:Relate:JHBILLING)
  _Hide:Access:JDDBILLING &= NEW(Hide:Access:JDDBILLING)
  _Hide:Relate:JDDBILLING &= NEW(Hide:Relate:JDDBILLING)
  _Hide:Access:JDBILLING &= NEW(Hide:Access:JDBILLING)
  _Hide:Relate:JDBILLING &= NEW(Hide:Relate:JDBILLING)
  _Hide:Access:FileSql2 &= NEW(Hide:Access:FileSql2)
  _Hide:Relate:FileSql2 &= NEW(Hide:Relate:FileSql2)
  _Hide:Access:JKontrakObat &= NEW(Hide:Access:JKontrakObat)
  _Hide:Relate:JKontrakObat &= NEW(Hide:Relate:JKontrakObat)
  _Hide:Access:ApEmbalase &= NEW(Hide:Access:ApEmbalase)
  _Hide:Relate:ApEmbalase &= NEW(Hide:Relate:ApEmbalase)
  _Hide:Access:VAPDTRANS &= NEW(Hide:Access:VAPDTRANS)
  _Hide:Relate:VAPDTRANS &= NEW(Hide:Relate:VAPDTRANS)
  _Hide:Access:APEPRED &= NEW(Hide:Access:APEPRED)
  _Hide:Relate:APEPRED &= NEW(Hide:Relate:APEPRED)
  _Hide:Access:AFIFOOUTTemp &= NEW(Hide:Access:AFIFOOUTTemp)
  _Hide:Relate:AFIFOOUTTemp &= NEW(Hide:Relate:AFIFOOUTTemp)
  _Hide:Access:APDTRANSBackup &= NEW(Hide:Access:APDTRANSBackup)
  _Hide:Relate:APDTRANSBackup &= NEW(Hide:Relate:APDTRANSBackup)
  _Hide:Access:vstokfifo &= NEW(Hide:Access:vstokfifo)
  _Hide:Relate:vstokfifo &= NEW(Hide:Relate:vstokfifo)
  _Hide:Access:SMUnit_Master &= NEW(Hide:Access:SMUnit_Master)
  _Hide:Relate:SMUnit_Master &= NEW(Hide:Relate:SMUnit_Master)
  _Hide:Access:APHTRANSBackup &= NEW(Hide:Access:APHTRANSBackup)
  _Hide:Relate:APHTRANSBackup &= NEW(Hide:Relate:APHTRANSBackup)
  _Hide:Access:ApNotaObat &= NEW(Hide:Access:ApNotaObat)
  _Hide:Relate:ApNotaObat &= NEW(Hide:Relate:ApNotaObat)
  _Hide:Access:SMRUnker &= NEW(Hide:Access:SMRUnker)
  _Hide:Relate:SMRUnker &= NEW(Hide:Relate:SMRUnker)
  Relate:APEPREH &= _Hide:Relate:APEPREH
  Relate:JPengirim &= _Hide:Relate:JPengirim
  Relate:HM_BARANGNEW &= _Hide:Relate:HM_BARANGNEW
  Relate:ASetApotik &= _Hide:Relate:ASetApotik
  Relate:TBTransResepDokterDetail &= _Hide:Relate:TBTransResepDokterDetail
  Relate:JHBILLING &= _Hide:Relate:JHBILLING
  Relate:JDDBILLING &= _Hide:Relate:JDDBILLING
  Relate:JDBILLING &= _Hide:Relate:JDBILLING
  Relate:FileSql2 &= _Hide:Relate:FileSql2
  Relate:JKontrakObat &= _Hide:Relate:JKontrakObat
  Relate:ApEmbalase &= _Hide:Relate:ApEmbalase
  Relate:VAPDTRANS &= _Hide:Relate:VAPDTRANS
  Relate:APEPRED &= _Hide:Relate:APEPRED
  Relate:AFIFOOUTTemp &= _Hide:Relate:AFIFOOUTTemp
  Relate:APDTRANSBackup &= _Hide:Relate:APDTRANSBackup
  Relate:vstokfifo &= _Hide:Relate:vstokfifo
  Relate:SMUnit_Master &= _Hide:Relate:SMUnit_Master
  Relate:APHTRANSBackup &= _Hide:Relate:APHTRANSBackup
  Relate:ApNotaObat &= _Hide:Relate:ApNotaObat
  Relate:SMRUnker &= _Hide:Relate:SMRUnker


APC6NBC0:FilesInit PROCEDURE
  CODE
  _Hide:Relate:APEPREH.Init
  _Hide:Relate:JPengirim.Init
  _Hide:Relate:HM_BARANGNEW.Init
  _Hide:Relate:ASetApotik.Init
  _Hide:Relate:TBTransResepDokterDetail.Init
  _Hide:Relate:JHBILLING.Init
  _Hide:Relate:JDDBILLING.Init
  _Hide:Relate:JDBILLING.Init
  _Hide:Relate:FileSql2.Init
  _Hide:Relate:JKontrakObat.Init
  _Hide:Relate:ApEmbalase.Init
  _Hide:Relate:VAPDTRANS.Init
  _Hide:Relate:APEPRED.Init
  _Hide:Relate:AFIFOOUTTemp.Init
  _Hide:Relate:APDTRANSBackup.Init
  _Hide:Relate:vstokfifo.Init
  _Hide:Relate:SMUnit_Master.Init
  _Hide:Relate:APHTRANSBackup.Init
  _Hide:Relate:ApNotaObat.Init
  _Hide:Relate:SMRUnker.Init


APC6NBC0:DctKill PROCEDURE
  CODE
  _Hide:Relate:APEPREH.Kill
  DISPOSE(_Hide:Relate:APEPREH)
  _Hide:Relate:JPengirim.Kill
  DISPOSE(_Hide:Relate:JPengirim)
  _Hide:Relate:HM_BARANGNEW.Kill
  DISPOSE(_Hide:Relate:HM_BARANGNEW)
  _Hide:Relate:ASetApotik.Kill
  DISPOSE(_Hide:Relate:ASetApotik)
  _Hide:Relate:TBTransResepDokterDetail.Kill
  DISPOSE(_Hide:Relate:TBTransResepDokterDetail)
  _Hide:Relate:JHBILLING.Kill
  DISPOSE(_Hide:Relate:JHBILLING)
  _Hide:Relate:JDDBILLING.Kill
  DISPOSE(_Hide:Relate:JDDBILLING)
  _Hide:Relate:JDBILLING.Kill
  DISPOSE(_Hide:Relate:JDBILLING)
  _Hide:Relate:FileSql2.Kill
  DISPOSE(_Hide:Relate:FileSql2)
  _Hide:Relate:JKontrakObat.Kill
  DISPOSE(_Hide:Relate:JKontrakObat)
  _Hide:Relate:ApEmbalase.Kill
  DISPOSE(_Hide:Relate:ApEmbalase)
  _Hide:Relate:VAPDTRANS.Kill
  DISPOSE(_Hide:Relate:VAPDTRANS)
  _Hide:Relate:APEPRED.Kill
  DISPOSE(_Hide:Relate:APEPRED)
  _Hide:Relate:AFIFOOUTTemp.Kill
  DISPOSE(_Hide:Relate:AFIFOOUTTemp)
  _Hide:Relate:APDTRANSBackup.Kill
  DISPOSE(_Hide:Relate:APDTRANSBackup)
  _Hide:Relate:vstokfifo.Kill
  DISPOSE(_Hide:Relate:vstokfifo)
  _Hide:Relate:SMUnit_Master.Kill
  DISPOSE(_Hide:Relate:SMUnit_Master)
  _Hide:Relate:APHTRANSBackup.Kill
  DISPOSE(_Hide:Relate:APHTRANSBackup)
  _Hide:Relate:ApNotaObat.Kill
  DISPOSE(_Hide:Relate:ApNotaObat)
  _Hide:Relate:SMRUnker.Kill
  DISPOSE(_Hide:Relate:SMRUnker)


Hide:Relate:APEPREH.Init PROCEDURE
  CODE
  _Hide:Access:APEPREH.Init
  SELF.Init(Access:APEPREH,1)


Hide:Access:APEPREH.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APE3:Record
  SELF.FileNameValue = 'APEPREH'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= APEPREH
  PARENT.Init
  Access:APEPREH &= SELF


Hide:Access:APEPREH.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:APEPREH &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:APEPREH.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(APEPREH,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APE3:by_medrec,'APE3:by_medrec',0)
    SELF.AddKey(APE3:by_transaksi,'APE3:by_transaksi',0)
    SELF.AddKey(APE3:BY_KODEAP,'APE3:BY_KODEAP',0)
    SELF.AddKey(APE3:keytanggal,'APE3:keytanggal',0)
    SELF.AddKey(APE3:KeyNoMrAsal,'APE3:KeyNoMrAsal',0)
    SELF.AddKey(APE3:dokter_apepreh_fk,'APE3:dokter_apepreh_fk',0)
    SELF.AddKey(APE3:nonota_apepreh_fk,'APE3:nonota_apepreh_fk',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:APEPREH.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:APHTRANS,RI:None,RI:None,APH:keyEpre)
  SELF.AddRelationLink(APE3:N0_tran,APH:NomorEPresribing)

  SELF.AddRelation(Relate:APEPRED,RI:None,RI:None,APE4:notran_kode)
  SELF.AddRelationLink(APE3:N0_tran,APE4:N0_tran)

  SELF.AddRelation(Relate:JDokter)

  SELF.AddRelation(Relate:JTransaksi)


Hide:Relate:APEPREH.Kill PROCEDURE

  CODE
  _Hide:Access:APEPREH.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:APEPREH &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:APEPREH)                            ! destroy the file manager


Hide:Relate:JPengirim.Init PROCEDURE
  CODE
  _Hide:Access:JPengirim.Init
  SELF.Init(Access:JPengirim,1)


Hide:Access:JPengirim.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JPE:Record
  SELF.FileNameValue = 'JPengirim'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JPengirim
  PARENT.Init
  Access:JPengirim &= SELF


Hide:Access:JPengirim.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JPengirim &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JPengirim.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JPengirim,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JPE:primarykey,'JPE:primarykey',1)
    SELF.AddKey(JPE:nama_jpengirim_key,'JPE:nama_jpengirim_key',0)
    SELF.AddKey(JPE:salesman_jpengirim_fk,'JPE:salesman_jpengirim_fk',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:JPengirim.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 3
    GlobalErrors.SetField('JPE:Jenis')
    IF INSTRING(']' & JPE:Jenis & '[', ']1[]2[]3[]4[]5[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Dokter'',''Bidan'',''Perawat'',''Rumah Sakit'',''Klinik''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:JPengirim.Kill PROCEDURE

  CODE
  _Hide:Access:JPengirim.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:JPengirim &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JPengirim)                          ! destroy the file manager


Hide:Relate:HM_BARANGNEW.Init PROCEDURE
  CODE
  _Hide:Access:HM_BARANGNEW.Init
  SELF.Init(Access:HM_BARANGNEW,1)


Hide:Access:HM_BARANGNEW.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= HM_:Record
  SELF.FileNameValue = 'HM_BARANGNEW'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= HM_BARANGNEW
  PARENT.Init
  Access:HM_BARANGNEW &= SELF


Hide:Access:HM_BARANGNEW.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:HM_BARANGNEW &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:HM_BARANGNEW.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(HM_BARANGNEW,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(HM_:PK,'HM_:PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:HM_BARANGNEW.Kill PROCEDURE

  CODE
  _Hide:Access:HM_BARANGNEW.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:HM_BARANGNEW &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:HM_BARANGNEW)                       ! destroy the file manager


Hide:Relate:ASetApotik.Init PROCEDURE
  CODE
  _Hide:Access:ASetApotik.Init
  SELF.Init(Access:ASetApotik,1)


Hide:Access:ASetApotik.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ASE:Record
  SELF.FileNameValue = 'ASetApotik'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ASetApotik
  PARENT.Init
  Access:ASetApotik &= SELF


Hide:Access:ASetApotik.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ASetApotik &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ASetApotik.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ASetApotik,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(ASE:PK,'ASE:PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ASetApotik.Kill PROCEDURE

  CODE
  _Hide:Access:ASetApotik.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:ASetApotik &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ASetApotik)                         ! destroy the file manager


Hide:Relate:TBTransResepDokterDetail.Init PROCEDURE
  CODE
  _Hide:Access:TBTransResepDokterDetail.Init
  SELF.Init(Access:TBTransResepDokterDetail,1)


Hide:Access:TBTransResepDokterDetail.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TBT:Record
  SELF.FileNameValue = 'TBTransResepDokterDetail'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TBTransResepDokterDetail
  PARENT.Init
  Access:TBTransResepDokterDetail &= SELF


Hide:Access:TBTransResepDokterDetail.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TBTransResepDokterDetail &= NULL                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TBTransResepDokterDetail.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TBTransResepDokterDetail,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(TBT:PK,'TBT:PK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:TBTransResepDokterDetail.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:TBTransResepDokterEtiket,RI:None,RI:None,TBT1:PK)
  SELF.AddRelationLink(TBT:NoTrans,TBT1:NoTrans)
  SELF.AddRelationLink(TBT:ItemCode,TBT1:ItemCode)

  SELF.AddRelation(Relate:TBTransResepDokterHeader)


Hide:Relate:TBTransResepDokterDetail.Kill PROCEDURE

  CODE
  _Hide:Access:TBTransResepDokterDetail.Kill               ! Kill the file manager
  PARENT.Kill
  Relate:TBTransResepDokterDetail &= NULL                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TBTransResepDokterDetail)           ! destroy the file manager


Hide:Relate:JHBILLING.Init PROCEDURE
  CODE
  _Hide:Access:JHBILLING.Init
  SELF.Init(Access:JHBILLING,1)


Hide:Access:JHBILLING.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JHB:Record
  SELF.FileNameValue = 'JHBILLING'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JHBILLING
  PARENT.Init
  Access:JHBILLING &= SELF


Hide:Access:JHBILLING.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JHBILLING &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JHBILLING.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JHBILLING,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JHB:KNOMOR,'JHB:KNOMOR',0)
    SELF.AddKey(JHB:KMR,'JHB:KMR',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JHBILLING.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:APHTRANS,RI:None,RI:None,APH:nonota_aphtras_key)
  SELF.AddRelationLink(JHB:NOMOR,APH:NoNota)

  SELF.AddRelation(Relate:JDBILLING,RI:None,RI:None,JDB:PK1)
  SELF.AddRelationLink(JHB:NOMOR,JDB:NOMOR)


Hide:Relate:JHBILLING.Kill PROCEDURE

  CODE
  _Hide:Access:JHBILLING.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:JHBILLING &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JHBILLING)                          ! destroy the file manager


Hide:Relate:JDDBILLING.Init PROCEDURE
  CODE
  _Hide:Access:JDDBILLING.Init
  SELF.Init(Access:JDDBILLING,1)


Hide:Access:JDDBILLING.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JDDB:Record
  SELF.FileNameValue = 'JDDBILLING'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JDDBILLING
  PARENT.Init
  Access:JDDBILLING &= SELF


Hide:Access:JDDBILLING.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JDDBILLING &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JDDBILLING.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JDDBILLING,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JDDB:PK1,'JDDB:PK1',0)
    SELF.AddKey(JDDB:KSUBKODEJASA,'JDDB:KSUBKODEJASA',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JDDBILLING.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JDBILLING)


Hide:Relate:JDDBILLING.Kill PROCEDURE

  CODE
  _Hide:Access:JDDBILLING.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:JDDBILLING &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JDDBILLING)                         ! destroy the file manager


Hide:Relate:JDBILLING.Init PROCEDURE
  CODE
  _Hide:Access:JDBILLING.Init
  SELF.Init(Access:JDBILLING,1)


Hide:Access:JDBILLING.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JDB:Record
  SELF.FileNameValue = 'JDBILLING'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JDBILLING
  PARENT.Init
  Access:JDBILLING &= SELF


Hide:Access:JDBILLING.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JDBILLING &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JDBILLING.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JDBILLING,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JDB:PK1,'JDB:PK1',0)
    SELF.AddKey(JDB:notranint_jdbilling_ik,'JDB:notranint_jdbilling_ik',0)
    SELF.AddKey(JDB:K_KODEJASA,'JDB:K_KODEJASA',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JDBILLING.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JDDBILLING,RI:None,RI:None,JDDB:PK1)
  SELF.AddRelationLink(JDB:NOMOR,JDDB:NOMOR)
  SELF.AddRelationLink(JDB:NOTRAN_INTERNAL,JDDB:NOTRAN_INTERNAL)
  SELF.AddRelationLink(JDB:KODEJASA,JDDB:KODEJASA)

  SELF.AddRelation(Relate:JHBILLING)


Hide:Relate:JDBILLING.Kill PROCEDURE

  CODE
  _Hide:Access:JDBILLING.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:JDBILLING &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JDBILLING)                          ! destroy the file manager


Hide:Relate:FileSql2.Init PROCEDURE
  CODE
  _Hide:Access:FileSql2.Init
  SELF.Init(Access:FileSql2,1)


Hide:Access:FileSql2.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= FIL1:Record
  SELF.FileNameValue = 'FileSql2'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= FileSql2
  PARENT.Init
  Access:FileSql2 &= SELF


Hide:Access:FileSql2.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:FileSql2 &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:FileSql2.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(FileSql2,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(FIL1:PrimaryKey,'FIL1:PrimaryKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:FileSql2.Kill PROCEDURE

  CODE
  _Hide:Access:FileSql2.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:FileSql2 &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:FileSql2)                           ! destroy the file manager


Hide:Relate:JKontrakObat.Init PROCEDURE
  CODE
  _Hide:Access:JKontrakObat.Init
  SELF.Init(Access:JKontrakObat,1)


Hide:Access:JKontrakObat.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= JKOO:Record
  SELF.FileNameValue = 'JKontrakObat'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= JKontrakObat
  PARENT.Init
  Access:JKontrakObat &= SELF


Hide:Access:JKontrakObat.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:JKontrakObat &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:JKontrakObat.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(JKontrakObat,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(JKOO:by_kode_ktr,'JKOO:by_kode_ktr',0)
    SELF.AddKey(JKOO:by_kode_brg,'JKOO:by_kode_brg',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:JKontrakObat.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JKontrakMaster)

  SELF.AddRelation(Relate:GBarang)


Hide:Relate:JKontrakObat.Kill PROCEDURE

  CODE
  _Hide:Access:JKontrakObat.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:JKontrakObat &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:JKontrakObat)                       ! destroy the file manager


Hide:Relate:ApEmbalase.Init PROCEDURE
  CODE
  _Hide:Access:ApEmbalase.Init
  SELF.Init(Access:ApEmbalase,1)


Hide:Access:ApEmbalase.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APE2:Record
  SELF.FileNameValue = 'ApEmbalase'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ApEmbalase
  PARENT.Init
  Access:ApEmbalase &= SELF


Hide:Access:ApEmbalase.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ApEmbalase &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ApEmbalase.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ApEmbalase,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APE2:PrimaryKey,'APE2:PrimaryKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ApEmbalase.Kill PROCEDURE

  CODE
  _Hide:Access:ApEmbalase.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:ApEmbalase &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ApEmbalase)                         ! destroy the file manager


Hide:Relate:VAPDTRANS.Init PROCEDURE
  CODE
  _Hide:Access:VAPDTRANS.Init
  SELF.Init(Access:VAPDTRANS,1)


Hide:Access:VAPDTRANS.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APD4:Record
  SELF.FileNameValue = 'VAPDTRANS'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= VAPDTRANS
  PARENT.Init
  Access:VAPDTRANS &= SELF


Hide:Access:VAPDTRANS.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:VAPDTRANS &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:VAPDTRANS.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(VAPDTRANS,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APD4:PK,'APD4:PK',0)
    SELF.AddKey(APD4:kodebrg_apdtrans_fk,'APD4:kodebrg_apdtrans_fk',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:VAPDTRANS.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)


Hide:Relate:VAPDTRANS.Kill PROCEDURE

  CODE
  _Hide:Access:VAPDTRANS.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:VAPDTRANS &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:VAPDTRANS)                          ! destroy the file manager


Hide:Relate:APEPRED.Init PROCEDURE
  CODE
  _Hide:Access:APEPRED.Init
  SELF.Init(Access:APEPRED,1)


Hide:Access:APEPRED.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APE4:Record
  SELF.FileNameValue = 'APEPRED'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= APEPRED
  PARENT.Init
  Access:APEPRED &= SELF


Hide:Access:APEPRED.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:APEPRED &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:APEPRED.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(APEPRED,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APE4:by_transaksi,'APE4:by_transaksi',0)
    SELF.AddKey(APE4:notran_kode,'APE4:notran_kode',0)
    SELF.AddKey(APE4:by_kodebrg,'APE4:by_kodebrg',0)
    SELF.AddKey(APE4:by_tran_cam,'index atas transaksi dan campur',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:APEPRED.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:APEPREH)

  SELF.AddRelation(Relate:GBarang)


Hide:Relate:APEPRED.Kill PROCEDURE

  CODE
  _Hide:Access:APEPRED.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:APEPRED &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:APEPRED)                            ! destroy the file manager


Hide:Relate:AFIFOOUTTemp.Init PROCEDURE
  CODE
  _Hide:Access:AFIFOOUTTemp.Init
  SELF.Init(Access:AFIFOOUTTemp,1)


Hide:Access:AFIFOOUTTemp.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AFI21:Record
  SELF.FileNameValue = 'AFIFOOUTTemp'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AFIFOOUTTemp
  PARENT.Init
  Access:AFIFOOUTTemp &= SELF


Hide:Access:AFIFOOUTTemp.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AFIFOOUTTemp &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AFIFOOUTTemp.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AFIFOOUTTemp,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(AFI21:KEY1,'AFI21:KEY1',0)
    SELF.AddKey(AFI21:urut1_afifoouttemp_key,'AFI21:urut1_afifoouttemp_key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AFIFOOUTTemp.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)


Hide:Relate:AFIFOOUTTemp.Kill PROCEDURE

  CODE
  _Hide:Access:AFIFOOUTTemp.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:AFIFOOUTTemp &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AFIFOOUTTemp)                       ! destroy the file manager


Hide:Relate:APDTRANSBackup.Init PROCEDURE
  CODE
  _Hide:Access:APDTRANSBackup.Init
  SELF.Init(Access:APDTRANSBackup,1)


Hide:Access:APDTRANSBackup.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APD3:Record
  SELF.FileNameValue = 'APDTRANSBackup'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= APDTRANSBackup
  PARENT.Init
  Access:APDTRANSBackup &= SELF


Hide:Access:APDTRANSBackup.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:APDTRANSBackup &= NULL                            ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:APDTRANSBackup.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(APDTRANSBackup,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APD3:by_transaksi,'APD3:by_transaksi',0)
    SELF.AddKey(APD3:notran_kode,'APD3:notran_kode',0)
    SELF.AddKey(APD3:by_kodebrg,'APD3:by_kodebrg',0)
    SELF.AddKey(APD3:by_tran_cam,'index atas transaksi dan campur',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:APDTRANSBackup.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:APHTRANSBackup)


Hide:Relate:APDTRANSBackup.Kill PROCEDURE

  CODE
  _Hide:Access:APDTRANSBackup.Kill                         ! Kill the file manager
  PARENT.Kill
  Relate:APDTRANSBackup &= NULL                            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:APDTRANSBackup)                     ! destroy the file manager


Hide:Relate:vstokfifo.Init PROCEDURE
  CODE
  _Hide:Access:vstokfifo.Init
  SELF.Init(Access:vstokfifo,1)


Hide:Access:vstokfifo.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= VST:Record
  SELF.FileNameValue = 'vstokfifo'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= vstokfifo
  PARENT.Init
  Access:vstokfifo &= SELF


Hide:Access:vstokfifo.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:vstokfifo &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:vstokfifo.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(vstokfifo,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(VST:primarykey,'VST:primarykey',0)
    SELF.AddKey(VST:apotik_vstokfifo_key,'VST:apotik_vstokfifo_key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:vstokfifo.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:GBarang)

  SELF.AddRelation(Relate:GApotik)


Hide:Relate:vstokfifo.Kill PROCEDURE

  CODE
  _Hide:Access:vstokfifo.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:vstokfifo &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:vstokfifo)                          ! destroy the file manager


Hide:Relate:SMUnit_Master.Init PROCEDURE
  CODE
  _Hide:Access:SMUnit_Master.Init
  SELF.Init(Access:SMUnit_Master,1)


Hide:Access:SMUnit_Master.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= UNM:Record
  SELF.FileNameValue = 'SMUnit_Master'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SMUnit_Master
  PARENT.Init
  Access:SMUnit_Master &= SELF


Hide:Access:SMUnit_Master.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SMUnit_Master &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SMUnit_Master.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SMUnit_Master,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(UNM:Key1,'UNM:Key1',0)
    SELF.AddKey(UNM:KeyNama,'UNM:KeyNama',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SMUnit_Master.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SMRUnker,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,RUNK:KeyUnitMaster)
  SELF.AddRelationLink(UNM:NO,RUNK:Unit_Master)


Hide:Relate:SMUnit_Master.Kill PROCEDURE

  CODE
  _Hide:Access:SMUnit_Master.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:SMUnit_Master &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SMUnit_Master)                      ! destroy the file manager


Hide:Relate:APHTRANSBackup.Init PROCEDURE
  CODE
  _Hide:Access:APHTRANSBackup.Init
  SELF.Init(Access:APHTRANSBackup,1)


Hide:Access:APHTRANSBackup.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APH2:Record
  SELF.FileNameValue = 'APHTRANSBackup'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= APHTRANSBackup
  PARENT.Init
  Access:APHTRANSBackup &= SELF


Hide:Access:APHTRANSBackup.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:APHTRANSBackup &= NULL                            ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:APHTRANSBackup.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(APHTRANSBackup,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APH2:by_medrec,'APH2:by_medrec',0)
    SELF.AddKey(APH2:Prescribe_Aphtrans_FK,'APH2:Prescribe_Aphtrans_FK',0)
    SELF.AddKey(APH2:nonota_aphtras_key,'APH2:nonota_aphtras_key',0)
    SELF.AddKey(APH2:dokter_aphtrans_fk,'APH2:dokter_aphtrans_fk',0)
    SELF.AddKey(APH2:by_transaksi,'APH2:by_transaksi',0)
    SELF.AddKey(APH2:BY_KODEAP,'APH2:BY_KODEAP',0)
    SELF.AddKey(APH2:keytanggal,'APH2:keytanggal',0)
    SELF.AddKey(APH2:KeyNoMrAsal,'APH2:KeyNoMrAsal',0)
    SELF.AddKey(APH2:Pegawai_aphtrans_fk,'APH2:Pegawai_aphtrans_fk',0)
    SELF.AddKey(APH2:Kontrak_aphtrans_fk,'APH2:Kontrak_aphtrans_fk',0)
    SELF.AddKey(APH2:nopaket_aphtrans_fk,'APH2:nopaket_aphtrans_fk',0)
    SELF.AddKey(APH2:Ktgl_jam,'APH2:Ktgl_jam',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:APHTRANSBackup.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:JPasien)

  SELF.AddRelation(Relate:APDTRANSBackup,RI:None,RI:None,APD3:by_transaksi)
  SELF.AddRelationLink(APH2:N0_tran,APD3:N0_tran)


Hide:Relate:APHTRANSBackup.Kill PROCEDURE

  CODE
  _Hide:Access:APHTRANSBackup.Kill                         ! Kill the file manager
  PARENT.Kill
  Relate:APHTRANSBackup &= NULL                            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:APHTRANSBackup)                     ! destroy the file manager


Hide:Relate:ApNotaObat.Init PROCEDURE
  CODE
  _Hide:Access:ApNotaObat.Init
  SELF.Init(Access:ApNotaObat,1)


Hide:Access:ApNotaObat.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= APN1:Record
  SELF.FileNameValue = 'ApNotaObat'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ApNotaObat
  PARENT.Init
  Access:ApNotaObat &= SELF


Hide:Access:ApNotaObat.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ApNotaObat &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ApNotaObat.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ApNotaObat,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(APN1:PrimaryKey,'APN1:PrimaryKey',0)
    SELF.AddKey(APN1:Pegawai_APNotaObat_FK,'APN1:Pegawai_APNotaObat_FK',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ApNotaObat.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:APHTRANSBPJS)

  SELF.AddRelation(Relate:SMPegawai)

  SELF.AddRelation(Relate:APHTRANS)


Hide:Relate:ApNotaObat.Kill PROCEDURE

  CODE
  _Hide:Access:ApNotaObat.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:ApNotaObat &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ApNotaObat)                         ! destroy the file manager


Hide:Relate:SMRUnker.Init PROCEDURE
  CODE
  _Hide:Access:SMRUnker.Init
  SELF.Init(Access:SMRUnker,1)


Hide:Access:SMRUnker.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RUNK:Record
  SELF.FileNameValue = 'SMRUnker'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SMRUnker
  PARENT.Init
  Access:SMRUnker &= SELF


Hide:Access:SMRUnker.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SMRUnker &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SMRUnker.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SMRUnker,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(RUNK:Pkey,'RUNK:Pkey',0)
    SELF.AddKey(RUNK:KeyNama,'RUNK:KeyNama',0)
    SELF.AddKey(RUNK:KeyUnitMaster,'RUNK:KeyUnitMaster',0)
    SELF.AddKey(RUNK:KeyNewCode,'RUNK:KeyNewCode',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:SMRUnker.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 7
    GlobalErrors.SetField('RUNK:Kelas_PA')
    IF INSTRING(']' & RUNK:Kelas_PA & '[', ']1[]2[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''A'',''B''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:SMRUnker.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:SMPegawai,RI:CASCADE_SERVER,RI:RESTRICT_SERVER,PEGA:KeyUnit)
  SELF.AddRelationLink(RUNK:KodeUnker,PEGA:Unit)

  SELF.AddRelation(Relate:SMUnit_Master)


Hide:Relate:SMRUnker.Kill PROCEDURE

  CODE
  _Hide:Access:SMRUnker.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:SMRUnker &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SMRUnker)                           ! destroy the file manager

