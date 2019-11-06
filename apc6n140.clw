

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module

                     MAP
                       INCLUDE('APC6N140.INC'),ONCE        !Local module procedure declarations
                     END


PrintLapReturKeGudang PROCEDURE
  CODE
  GlobalErrors.ThrowMessage(Msg:ProcedureToDo,'PrintLapReturKeGudang') ! This procedure acts as a place holder for a procedure yet to be defined
  SETKEYCODE(0)
  GlobalResponse = RequestCancelled                        ! Request cancelled is the implied action
