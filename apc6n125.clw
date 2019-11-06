

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module

                     MAP
                       INCLUDE('APC6N125.INC'),ONCE        !Local module procedure declarations
                     END


cetak_tran_antar_sub1 PROCEDURE
  CODE
  GlobalErrors.ThrowMessage(Msg:ProcedureToDo,'cetak_tran_antar_sub1') ! This procedure acts as a place holder for a procedure yet to be defined
  SETKEYCODE(0)
  GlobalResponse = RequestCancelled                        ! Request cancelled is the implied action
