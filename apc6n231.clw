

   MEMBER('apc6new.clw')                                   ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('APC6N231.INC'),ONCE        !Local module procedure declarations
                     END


FaqHargaJualObat PROCEDURE                                 ! Generated from procedure template - Browse

Window               WINDOW('FAQ'),AT(,,422,224),FONT('MS Sans Serif',8,,FONT:regular),GRAY
                       SHEET,AT(6,4,409,192),USE(?Sheet1)
                         TAB('Penghitungan Harga Jual Obat'),USE(?Tab1)
                           STRING('Update terakhir : 13 Maret 2019'),AT(13,23),USE(?String1),FONT(,,,FONT:bold,CHARSET:ANSI)
                           STRING('Pasien Umum :'),AT(15,42),USE(?String2),FONT(,,,FONT:bold,CHARSET:ANSI)
                           PANEL,AT(12,38,394,18),USE(?Panel1)
                           STRING('((((Harga Dasar Obat - Diskon Obat) + Margin 25%) + PPN 10%) X Jumlah ) + tuslah'),AT(85,42),USE(?String3),FONT(,8,,FONT:bold,CHARSET:ANSI)
                           PANEL,AT(12,62,394,18),USE(?Panel1:2)
                           STRING('Pasien BPJS :'),AT(15,65),USE(?String2:2),FONT(,,,FONT:bold,CHARSET:ANSI)
                           STRING('((((Harga Dasar Obat - Diskon Obat) + Margin 25%) + PPN 10%) X Jumlah ) + tuslah'),AT(85,65),USE(?String3:2),FONT(,8,,FONT:bold,CHARSET:ANSI)
                           PANEL,AT(11,84,394,18),USE(?Panel1:3)
                           STRING('Pasien Rekanan :'),AT(15,87),USE(?String2:3),FONT(,,,FONT:bold,CHARSET:ANSI)
                           STRING('((((Harga Dasar Obat - Diskon Obat) + Margin 25%) + PPN 10%) X Jumlah ) + tuslah'),AT(85,87),USE(?String3:3),FONT(,8,,FONT:bold,CHARSET:ANSI)
                         END
                       END
                       BUTTON('&OK'),AT(309,201,35,14),USE(?OkButton),LEFT,DEFAULT
                       BUTTON('&Cancel'),AT(351,201,36,14),USE(?CancelButton),LEFT
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
Kill                   PROCEDURE(),BYTE,PROC,DERIVED       ! Method added to host embed code
                     END

Toolbar              ToolbarClass

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
  GlobalErrors.SetProcedureName('FaqHargaJualObat')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?String1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('FaqHargaJualObat',Window)                  ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('FaqHargaJualObat',Window)               ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue

