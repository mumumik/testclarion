  MODULE('APC6N004.CLW')
AngkaKeTulisan         FUNCTION(real A),String
Trans                  FUNCTION(Short A,String B),String !Dipakai din proc AngkaTulisan-(Transfer Letak Angka ke String)
Convert                FUNCTION(STRING C,SHORT N,SHORT BEL,STRING B),string !Dipakai di proc AngkaTulisan-(Transfer hanya Angka ke String)
PisahMantisa           FUNCTION(String P,short M),String
ConvertExp             FUNCTION(STRING Exp),string    !Dipakai di proc AngkaTulisan-(Transfer hanya Angka ke String)
  END
