; description:	Simple helper to move the cmd-window to the right side of the screen and expand its height.
;				Needs to be done with every debugging-session ..
; author:	Marcel Petrick (mail@marcelpetrick.it)
; date:		20160913
; version:	0.1
; license:	GNU GENERAL PUBLIC LICENSE Version 2

; ********************************

; assign the hotkey for the quitting-functionality
HotKeySet("{F5}", "quitScript") ; stop, come back home!

; ********************************
;  ; brief: main
 While 1
   LoopCheckAndMove()
   Sleep(1000)
WEnd

; ********************************
 ; brief: check every second if the windows with the given title is at the expected position; if not: move and expand
Func LoopCheckAndMove()
   ConsoleWrite("LoopCheckAndMove()" & @CRLF)

	; wait 10s while trying to create an handle
	Local const $hWnd = WinWait("Windows Task Manager", "", 2) ; wait at least two seconds

   ; check if the handle is valid
   If(IsHWnd($hWnd)) Then
	   ConsoleWrite("valid handle" & @CRLF)

	  ; retrieve the position
	  Local $aPos = WinGetPos($hWnd)

	  ConsoleWrite("found window at " & $aPos[0] & "/ " & $aPos[1] & " with size " & $aPos[2] & "/ " & $aPos[3] & @CRLF)

	  ; if obviously not located on the right monitor -> move
	  If(($aPos[0] <> 2200) Or ($aPos[1] <> 360)) Then
		 ConsoleWrite("xPos < 2000 -> move" & @CRLF)
		 WinMove($hWnd, "", 2200, 360, 666, 820)
	  EndIf
   EndIf
EndFunc

; ********************************
 ; brief: interupts and exits script
Func quitScript()
   ConsoleWrite("quitScript()" & @CRLF)
   Exit
EndFunc