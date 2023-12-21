; Key for media players such as VLC Player / AIMP
; Set VLC Player to listen for global keys
; ============= VLC Setup ====================
; I personally use VLC only for video
; VLC -> Tools -> Preferences -> HotKeys
; search for "Play/Pause" and set it in Global column to CTRL+SHIFT+ALT+F2
; search for "Very short backwards jump" and set it in Global column to CTRL+SHIFT+ALT+F1
; search for "Very short forward jump" and set it in Global column to CTRL+SHIFT+ALT+F3
;
; ============ AIMP Setup =====================
; AIMP -> CTRL + P -> Hotkeys (left menu)
; Search for "Play/Pause" and set it in Global 1 column to SHIFT+CTRL+ALT+F2
; Search for "Previous track" and set it in Global 1 column to SHIFT+CTRL+ALT+F1
; Search for "Next track" and set it in Global 1 column to SHIFT+CTRL+ALT+F3
;
; ======== DO NOT RUN VLC and AIMP SIMULTANEOUSLY
;

mode := "AIMP"
; ~RCtrl+ScrollLock::
;^ScrollLock::
^SC046::
    ; MsgBox  % mode
    if (mode = "AIMP"){
        mode := "VLC"
    }
    else {
        mode := "AIMP"
    }
    ;if (mode = ""){
    ;    mode := "AIMP"
    ;}
    return


PrintScreen::
    if (mode = "AIMP"){
        Send ^+!{F1}        ;PrintScreen -> CTRL+SHIFT+ALT+F1 ;back/prev
    }
    if (mode = "VLC"){
            Send ^+!{F4}        ;PrintScreen -> CTRL+SHIFT+ALT+F4 ;back/prev
    }
    ;youtubeSeekBack()
    return



;ScrollLock::
SC046::
    if (mode = "AIMP") {
        Send ^+!{F2}        ;ScrollLock  -> CTRL+SHIFT+ALT+F2 ;play/pause
    }
    if (mode = "VLC") {
        Send ^+!{F5}        ;ScrollLock  -> CTRL+SHIFT+ALT+F5 ;play/pause
    }
    ;youtubePlay()
    return





Pause::
    if (mode = "AIMP") {
        Send ^+!{F3}        ;Pause       -> CTRL+SHIFT+ALT+F3 ;forward/next
    }
    if (mode = "VLC") {
       Send ^+!{F6}        ;Pause       -> CTRL+SHIFT+ALT+F6 ;forward/next
    }
    ;youtubeSeekForward()
    return



; double tap left shift do volume down
~Lshift::
	KeyWait,Lshift
	KeyWait,Lshift,D T0.2
	If ErrorLevel {
		Send +
	} else {
		Send {Volume_Down 1}
	}
	return

; double tap right shift do volume up
~Rshift::
    KeyWait,Rshift
	KeyWait,Rshift,D T0.2
	If ErrorLevel {
		Send +
	} else {
		Send {Volume_Up 1}
	}
	return

; double tap ESC do mute
$Esc::
    KeyWait,Esc
	KeyWait,Esc,D T0.1
	If ErrorLevel {
		;MsgBox Oneclick
		Send {Esc}
		;return
	} else {
		;MsgBox Two clicks
		Send {Volume_Mute}
	}
	return

; -------------------------------------------
; smart clipboard
; CTRL +V   ->  Win+V
!v::
    ;Send {<# + v}
    Send {LWin Down}v{LWin Up}
    return



;---------------- function key for date -------------
;hourIL := A_Hour +8
!d::
    ; date time variables https://www.autohotkey.com/docs/v1/Variables.htm#NowUTC
    ; //hourIL := ( (A_Hour) +8 )
    ; //Send, %A_YYYY%-%A_MM%-%A_DD% %hourIL%:%A_Min%{Space} DRDIMA - OUT CALL{Space} ; press ALT+d
    ;Send, %hourIL% ; press ALT+d


    CurrentDateTime := "" ; empty this variable (erase its content)
    EnvAdd, CurrentDateTime, +8, hour
    ; equivalent to:
    ; CurrentDateTime += +8, HH
    FormatTime, eight_hours_plus, %CurrentDateTime%, yyyy-MM-dd HH:mm
    ; MsgBox, %eight_hours_plus%
    ;SendInput %eight_hours_plus%{Space}
    Send, %eight_hours_plus%{Space} DRDIMA - OUT CALL{Space} ; press ALT+d









; new feature Youtube play/stop





;#IfWinNotActive, ahk_exe chrome.exe

;youtubePlay(){
; MsgBox Youtube
;#Persistent
;#NoEnv
;#SingleInstance, Force
;DetectHiddenWindows, On
;SetWorkingDir %A_ScriptDir%
;SetTitleMatchMode, 2
;controlID 		:= 0
;return


;    ControlGet, controlID, Hwnd,,Chrome_RenderWidgetHostHWND1, Google Chrome
;   	ControlFocus,,ahk_id %controlID%
;
;    	IfWinExist, YouTube
;    	{
;    		ControlSend, Chrome_RenderWidgetHostHWND1, k , Google Chrome
;    		return
;    	}
;    	Loop {
;    		IfWinExist, YouTube
;    			break
;    		ControlSend, , ^{PgUp} , Google Chrome
;    		sleep 150
;    	}
;    	ControlSend, , k , Google Chrome
;    return
;}
;
;
;youtubeSeekBack(){
;
;    #Persistent
;    #NoEnv
;    #SingleInstance, Force
;    DetectHiddenWindows, On
;    SetWorkingDir %A_ScriptDir%
;    SetTitleMatchMode, 2
;    controlID 		:= 0
;
;    ControlGet, controlID, Hwnd,,Chrome_RenderWidgetHostHWND1, Google Chrome
;
;    	ControlFocus,,ahk_id %controlID%
;
;    	IfWinExist, YouTube
;    	{
;    		ControlSend, Chrome_RenderWidgetHostHWND1, j , Google Chrome
;    		return
;    	}
;    	Loop {
;    		IfWinExist, YouTube
;    			break
;
;    		ControlSend, , ^{PgUp} , Google Chrome
;    		sleep 150
;    	}
;    	ControlSend, , j , Google Chrome
;    return
;}
;
;youtubeSeekForward(){
;
;    #Persistent
;    #NoEnv
;    #SingleInstance, Force
;    DetectHiddenWindows, On
;    SetWorkingDir %A_ScriptDir%
;    SetTitleMatchMode, 2
;    controlID 		:= 0
;
;  ControlGet, controlID, Hwnd,,Chrome_RenderWidgetHostHWND1, Google Chrome
;
;  	ControlFocus,,ahk_id %controlID%
;
;  	IfWinExist, YouTube
;  	{
;  		ControlSend, Chrome_RenderWidgetHostHWND1, l , Google Chrome
;  		return
;  	}
;  	Loop {
;  		IfWinExist, YouTube
;  			break
;
;  		ControlSend, , ^{PgUp} , Google Chrome
;  		sleep 150
;  	}
;  	ControlSend, , +l , Google Chrome
;  return
;
;}
