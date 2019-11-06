

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE

                     MAP
                       INCLUDE('APC6N158.INC'),ONCE        !Local module procedure declarations
                     END


ProsesPasien PROCEDURE                                     ! Generated from procedure template - Process

Progress:Thermometer BYTE                                  !
Process:View         VIEW(HM_PASIEN)
                     END
ProgressWindow       WINDOW('Process HM_PASIEN'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular),CENTER,TIMER(1),GRAY,DOUBLE
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
  GlobalErrors.SetProcedureName('ProsesPasien')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:HM_PASIEN.Open                                    ! File JPasien used by this procedure, so make sure it's RelationManager is open
  Relate:JPasien.Open                                      ! File JPasien used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ProsesPasien',ProgressWindow)              ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:HM_PASIEN, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(HM_PASIEN,'QUICKSCAN=on')
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:HM_PASIEN.Close
    Relate:JPasien.Close
  END
  IF SELF.Opened
    INIMgr.Update('ProsesPasien',ProgressWindow)           ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisProcess.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeRecord()
  if sub(clip(HM_P:NOPASIEN),1,1)='0' then
     JPas:Nomor_mr       =deformat(HM_P:NOPASIEN,@n8)
     if access:jpasien.fetch(JPas:KeyNomorMr)<>level:benign then
       JPas:Nomor_mr       =deformat(HM_P:NOPASIEN,@n8)
       JPas:Nama           =HM_P:NAMAPASIEN
       JPas:TanggalLahir   =HM_P:TGLLAHIR
       JPas:Umur           =0
       JPas:Umur_Bln       =0
       JPas:Jenis_kelamin  =HM_P:JNSKELAMIN
       JPas:Alamat         =HM_P:ALM1PASIEN
       JPas:RT             =0
       JPas:RW             =0
       JPas:Kelurahan      =HM_P:KLRHPAS
       JPas:Kecamatan      =HM_P:KECPAS
       JPas:Kota           =HM_P:KOTAPAS
       if HM_P:KODEAGAMA='1' then
          JPas:Agama       ='Islam'
       elsif HM_P:KODEAGAMA='2' then
          JPas:Agama       ='Kristen'
       elsif HM_P:KODEAGAMA='3' then
          JPas:Agama       ='Katolik'
       elsif HM_P:KODEAGAMA='4' then
          JPas:Agama       ='Hindu'
       elsif HM_P:KODEAGAMA='5' then
          JPas:Agama       ='Budha'
       elsif HM_P:KODEAGAMA='6' then
          JPas:Agama       ='Kong Hu chu'
       else
          JPas:Agama       ='Lain2'
       end
       JPas:pekerjaan      =HM_P:PEKERJAAN
       JPas:Telepon        =HM_P:TLPPASIEN
       JPas:Tanggal        =HM_P:TGLEDITSTS_DATE
       JPas:kembali        =0
       JPas:Kontrak        =''
       JPas:User           ='Adi'
       JPas:TEMPAT         ='HM'
       JPas:Jam            =clock()
       JPas:Inap           =0
       JPas:Jenis_Pasien   =2
       access:jpasien.insert()
     else
       !JPas:Nomor_mr       =deformat(HM_P:NOPASIEN,@n8)
       JPas:Nama           =HM_P:NAMAPASIEN
       JPas:TanggalLahir   =HM_P:TGLLAHIR
       JPas:Umur           =0
       JPas:Umur_Bln       =0
       JPas:Jenis_kelamin  =HM_P:JNSKELAMIN
       JPas:Alamat         =HM_P:ALM1PASIEN
       JPas:RT             =0
       JPas:RW             =0
       JPas:Kelurahan      =HM_P:KLRHPAS
       JPas:Kecamatan      =HM_P:KECPAS
       JPas:Kota           =HM_P:KOTAPAS
       if HM_P:KODEAGAMA='1' then
          JPas:Agama       ='Islam'
       elsif HM_P:KODEAGAMA='2' then
          JPas:Agama       ='Kristen'
       elsif HM_P:KODEAGAMA='3' then
          JPas:Agama       ='Katolik'
       elsif HM_P:KODEAGAMA='4' then
          JPas:Agama       ='Hindu'
       elsif HM_P:KODEAGAMA='5' then
          JPas:Agama       ='Budha'
       elsif HM_P:KODEAGAMA='6' then
          JPas:Agama       ='Kong Hu chu'
       else
          JPas:Agama       ='Lain2'
       end
       JPas:pekerjaan      =HM_P:PEKERJAAN
       JPas:Telepon        =HM_P:TLPPASIEN
       JPas:Tanggal        =HM_P:TGLEDITSTS_DATE
       JPas:kembali        =0
       JPas:Kontrak        =''
       JPas:User           ='Adi'
       JPas:TEMPAT         ='HM'
       JPas:Jam            =clock()
       JPas:Inap           =0
       JPas:Jenis_Pasien   =2
       access:jpasien.update()
     end
  end
  RETURN ReturnValue

