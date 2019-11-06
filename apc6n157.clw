

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('APC6N157.INC'),ONCE        !Local module procedure declarations
                     END


ProsesKontraktor PROCEDURE                                 ! Generated from procedure template - Process

Progress:Thermometer BYTE                                  !
Process:View         VIEW(HM_Kontraktor)
                     END
ProgressWindow       WINDOW('Process HM_Kontraktor'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular),CENTER,TIMER(1),GRAY,DOUBLE
                       PROGRESS,USE(Progress:Thermometer),AT(15,15,111,12),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),FLAT,LEFT,MSG('Cancel Process'),TIP('Cancel Process'),ICON('WACANCEL.ICO')
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ThisProcess          CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

ProgressMgr          StepClass                             ! Progress Manager

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It's called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ProsesKontraktor')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:HM_Kontraktor.Open                                ! File JKontrak used by this procedure, so make sure it's RelationManager is open
  Relate:JKontrak.Open                                     ! File JKontrak used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesKontraktor',ProgressWindow)          ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:HM_Kontraktor, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(HM_Kontraktor,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:HM_Kontraktor.Close
    Relate:JKontrak.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesKontraktor',ProgressWindow)       ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  JKon:KODE_KTR   =HM_K:KODEPT
  JKon:NAMA_KTR   =HM_K:NAMAPT
  JKon:ALAMAT     =HM_K:ALAMAT1
  JKon:KOTA       =HM_K:ALAMAT2
  JKon:TELPON     =HM_K:TLPRMH1
  JKon:KET        =HM_K:NOHP1
  JKon:RawatJalan =1
  JKon:RawatInap  =1
  JKon:CONTACT_PERSON =HM_K:COPERSON1
  JKon:GROUP      =0
  JKon:No_Ktr     =0
  JKon:Tanggal    =HM_K:TGLAWALKONTRAK_DATE
  JKon:USER       =''
  JKon:PercentTarif   =0
  JKon:PKS        =0
  JKon:DM         =0
  JKon:OBT        =0
  JKon:MCU        =0
  JKon:Keterangan =''
  JKon:Fax        =HM_K:TLPRMH2
  JKon:PM         =0
  JKon:PD         =0
  JKon:Jenis_Obat =0
  JKon:Status     =0
  JKon:Aktif      =1
  JKon:view_nip   =0
  JKon:status_brs =0
  JKon:status_jpk =0
  JKon:HargaObat  =0
  JKon:Status_Pis_LapRjln =0
  JKon:Tanpa_Adm  =0
  JKon:Status_Pis_LapRin  =0
  access:jkontrak.insert()
  RETURN ReturnValue

