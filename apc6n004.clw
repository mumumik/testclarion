

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module

                     MAP
                       INCLUDE('APC6N004.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('APC6N003.INC'),ONCE        !Req'd for module callout resolution
                     END


AngkaKeTulisan       PROCEDURE  (real A)                   ! Declare Procedure
!AngkaKeTulisan Function (ULong A)
tulisan String(255)
i short
j short
KeStr string(18)
KeStr_M String(18)
KeStr_E String(18)
PjStr short
HbKeStr String(18)
Ratus  String(12)
Spasi  String(1)
Data   String(255)
HasilSem String(15)
Hasil  string(15)
Ada     short,Dim(20)
belas  String(10)
Exponen String(40)
  CODE
!Kumpulan Procedure untuk terjemahkan angka ke tulisan
! Misalnya 1203 -> seribu dua ratus tiga
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!                    ********************                 !
!                     ******************                  !
!                      ****************                   !
!                       *************

                              !
!****************************************************



!************************************
!Procedure Convert angka ke tulisan
!angkakeTulisan(Ulong A),String
!Procedure utamanya convert angka ke tulisan
!AngkaKeTulisan Function (Ulong A),String(255)


! CODE

  belas ='BELAS '
  KeStr = round(A,.01) !convert ke string

 !Balik Susunan String '123045' -> '540321'***********!
 KeSTR_M =  PisahMantisa(Clip(KeStr),1)   !pisahkan mantisa
 KeStR_E = PisahMantisa(Clip(KeStr),2)   !pisahkan exponen
 HbKeStr = Balik(Clip(KeStr_M))                         !
 !****************************************************!

  PjStr = Len(Clip(KeStr_M))
  Data = ''

 !Cek(KeStr)*******************************************
         j = 1                                        !
   loop until j > 20                                  !
      ada[j] = 0                                      !
      j = j+1                                         !
   end                                                !
   j = 1                                              !
   loop until j > PjStr                               !
      ada[j] = 1                                      !
      j = j+1
                                      
   end
                                                      !
 !****************************************************

 !Balik Susunan String '123045' -> '540321'***********!
 !KeSTR_M =  PisahMantisa(Clip(KeStr),1)   !pisahkan mantisa
 !KeStR_E = PisahMantisa(Clip(KeStr),2)   !pisahkan exponen
 !HbKeStr = Balik(Clip(KeStr_M))                         !
 !****************************************************!

 !initial
 data = ''
 i = 1

 !Looping**********
 loop until i > 16;
  if ada[i] = 1 THEN
    RATUS = TRANS(I,HbKeStr)   !'Puluh' /'Ratus' / 'Ribu' / .....
    !jika dalam posisi yang memungkinkan terjadinya belasan
     if ((i =1) or (i = 4) or (i=7) or (i=10) or (i=13)) then
          if (HbKeStr[i+1] = '1') and (HbKeStr[i] <> '0') and (Ada[i+1] = 1) then
              HasilSem = Convert(HbKeStr[i],i,1,HbKeStr)
              i = i+1
              HASIL = Clip(HasilSem) & belas !'   '+'Belas'-> TigaBelas
            ELSE
              !nanti akan menjadi: Hasil + puluh  -> Sepuluh,Empat Puluh
              Hasil = Convert(HbKeStr[i],i,2,HbKeStr)
          END !endif3
       else  !jika tidak masuk area puluhan /belasan
         Hasil  = Convert(HbKeStr[i],i,2,HbKeStr)
     end !endif2

         !hilangkan spasi yang berlebihan*******************************
         !                         |||
         ! misalnya enam ratus ribu___seBelas
         spasi = ' '
         if len(Clip(Ratus)) = 0 then !hilangkan sepasi yg berlebihan
            DATA = Clip(Hasil)&Clip(Spasi)& Clip(Ratus)&Clip(Spasi)&Clip(data)
         else
             If Clip(Hasil) = 'SE' then
                DATA = Clip(Hasil)& Clip(Ratus)&Spasi&Clip(data)
              else
                DATA = Clip(Hasil)&Spasi& Clip(Ratus)&Spasi&Clip(data)
             end
         end
         !*****************************************************************

  end !endif
    i = i + 1
 END !end of loop source
 !**********************
   Exponen = ConvertExp(KeStr_E)
   Tulisan = Clip(Data)&' '&Clip(Exponen)
   !&' Rupiah'
 return (Tulisan)

!                      **
!                     ****
!                    ******                                              !
!                  **********                                            !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!EOF
Trans                PROCEDURE  (Short A,String B)         ! Declare Procedure
H STRING(18)
  CODE
 !*********************tRANSLATE
!Trans(Short A,Short B),String(18)
!Trans Function(short A,string B)

   !CODE
    H = Clip(H)
    CASE  (A)
       OF 1
          H = ''
       OF 2
          IF B[2] <> '0' THEN
             H = 'PULUH '
          END
       OF 3
          IF B[3] <> '0' THEN
             H = 'RATUS '
          END
       OF 4
          IF B[4] <> '0' THEN
               H = 'RIBU '
          END
       OF 5
          IF B[5] <> '0' THEN
             IF B[4] = '0' THEN
               H = 'PULUH RIBU '
              ELSE
               H = 'PULUH '
             END
          END
       OF 6
          IF B[6] <> '0' THEN
            IF (B[5] = '0') AND (B[4] = '0') THEN
                H = 'RATUS RIBU '
              ELSE
                H = 'RATUS '
            END
          END
       OF 7
          IF B[7] <> '0' THEN
            H = 'JUTA '
          END
       OF 8
          IF B[8] <> '0' THEN
            IF B[7] = '0' THEN
              H = 'PULUH JUTA'
             ELSE
               H = 'PULUH ';
            END
          END
       OF 9
          IF B[9] <> '0' THEN
            IF (B[8] = '0') AND (B[7] = '0') THEN
                 H = 'RATUS JUTA '
               ELSE
                 H = 'RATUS ';
            END
          END
       OF 10
          IF B[10] <> '0' THEN
            H = 'MILYAR '
          END
       OF 11
           IF B[11] <> '0' THEN
             IF B[10] = '0' THEN
                 H = 'PULUH MILYAR '
              ELSE
                 H = 'PULUH '
             END
            END
       OF 12
           IF B[12] <> '0' THEN
             IF (B[11] = '0')  AND (B[10] = '0') THEN
                 H = 'RATUS MILYAR '
               ELSE
                 H = 'RATUS '
             END
           END
       OF 13
           IF B[13] <> '0' THEN
               H = 'TRILYUN '
           END
       OF 14
           IF B[14] <> '0' THEN
              IF B[13] = '0' THEN
                H = 'PULUH TRILYUN '
               ELSE
                H = 'PULUH '
              END
           END
        OF 15
           IF B[15] <> '0' THEN
             IF (B[14] = '0') AND (B[13] = '0')  THEN
               H = 'RATUS TRILYUN '
              ELSE
               H = 'RATUS ';
             END
           END
        OF 16
           IF B[16] <> '0' THEN
               H = 'BILYUN '
           END
        ELSE
           !MESSAGE('TERLALU BESAR')
    END
  RETURN (Clip(H))
!***********end of translate**
                       
Convert              PROCEDURE  (STRING C,SHORT N,SHORT BEL,STRING B) ! Declare Procedure
H STRING(18)
HB USHORT
  CODE
   !CONVERT*********************************************
!Convert(string C,Short N,Short Bel,String B),String(18)
!CONVERT FUNCTION(STRING C,SHORT N,SHORT BEL,STRING B)

 ! CODE
    H = Clip(H)
    HB = LEN(Clip(B))
    CASE (Clip(C))
      OF '0'
         IF HB = 1  THEN
              H = 'NOL'
              ELSE
              H = '';
         END
      OF '1'
         IF ((N >= 2) and (N <= 6)) OR (N = 8) OR (N = 9) |
            OR (N=11) OR (N=12) OR (N=15) OR (BEL = 1) THEN
             ! message('KE'&N)
              H = 'SE'
              IF (N = 4) AND (HB > 4) AND (BEL <> 1) THEN
              !    message('tidak')
                  H = 'SATU'
                ELSE
               !   message('masuk')
                 !H = 'SATU '
              END
            ELSE
             !  IF (N = 4) AND (HB <=4) THEN
             !    message('tidak')
             !    H = 'SE'
             !   ELSE
             !     message('masuk')
             !    H = 'SATU '
             !  END
             H = 'SATU'
         END
     OF '2'
          H = 'DUA '
     OF '3'
         H = 'TIGA '
     OF '4'
         H = 'EMPAT '
     OF '5'
         H = 'LIMA '
     OF '6'
         H = 'ENAM '
     OF '7'
         H = 'TUJUH '
     OF '8'
         H = 'DELAPAN '
     OF '9'
         H = 'SEMBILAN '
     ELSE
       !NO Comment
    END

  RETURN Clip(H)                              !
!END OF CONVERT*******************************

PisahMantisa         PROCEDURE  (String P,Short M)         ! Declare Procedure
Result string(60)
i Short
!String
exponen short
  CODE
       i = 1
     if M = 1 then
        loop until (i > len(Clip(P))) or (P[i] = '.')
            !sb[i] =sa[len(sa)-i+1]
            !if M = 1 then
            Result[i] = P[i]
            !end
           i = i+1
        end !endloop
      else     !untuk cari exponen
          exponen = 0
          loop until (i > len(Clip(P)))
            if (P[i] = '.') then      !cari sampai ketemu titik
              exponen = 1
            end
            if exponen = 1 then     !setelah melalu titik
               Result[i] = P[i]
            end
           i = i+1
        end !endloop
    end
 Return(Clip(Result))
ConvertExp           PROCEDURE  (STRING Exp)               ! Declare Procedure
Result String(100)
H STRING(1)
PEx Byte
i byte
Hasil String(15)
  CODE
!CONVERT MANTISA *********************************************
!Convert(string C,Short N,Short Bel,String B),String(18)
!CONVERT FUNCTION(STRING C,SHORT N,SHORT BEL,STRING B)

 ! CODE
    i = 1

    PEx = LEN(Clip(Exp))  !panjang string exponen
    !message(PEx)
   loop Until (i > PEx)
     H = Clip(Exp[i])
     CASE (Clip(H))
      OF '.'
           Hasil = 'koma'

      OF ','
           Hasil = 'koma'
      OF '0'
           Hasil = 'NOL'
      OF '1'
           Hasil = 'SATU'
      OF '2'
           Hasil = 'DUA '
      OF '3'
          Hasil = 'TIGA '
         ! message(Hasil)
      OF '4'
          Hasil = 'EMPAT '
      OF '5'
          Hasil = 'LIMA '
      OF '6'
          Hasil = 'ENAM '
      OF '7'
          Hasil = 'TUJUH '
      OF '8'
          Hasil = 'DELAPAN '
      OF '9'
          Hasil = 'SEMBILAN '
      ELSE
       !NO Commend
    END

    i += 1
    Result = clip(Result)&' '&CLIP(Hasil)
   END !ENDLOOP
   !message('Result:'&result)
 RETURN Clip(Result)                              !
!END OF CONVERT*******************************

