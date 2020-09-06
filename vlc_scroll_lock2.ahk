; Key for media players such as VLC Player / AIMP
; Set VLC Player to listen for global keys
; ============= VLC Setup ====================
; I personally use VLC only for video
; VLC -> Tools -> Preferences -> HotKeys
; search for "Play/Pause" and set it in Global column to CTRL+SHIFT+x
; search for "Very short backwards jump" and set it in Global column to CTRL+SHIFT+v
; search for "Very short forward jump" and set it in Global column to CTRL+SHIFT+b
;
; ============ AIMP Setup =====================
; AIMP -> CTRL + P -> Hotkeys (left menu)
; Search for "Play/Pause" and set it in Global 1 column to SHIFT+CTRL+X
; Search for "Previous track" and set it in Global 1 column to SHIFT+CTRL+V
; Search for "Next track" and set it in Global 1 column to SHIFT+CTRL+B
;
; ======== DO NOT RUN VLC and AIMP SIMULTANEOUSLY
;

PrintScreen::
    Send ^+v        ;PrintScreen -> CTRL+SHIFT+V ;back/prev
    ;youtubeSeekBack()
    return



ScrollLock::
    Send ^+x        ;ScrollLock  -> CTRL+SHIFT+X ;play/pause
    ;youtubePlay()
    return



Pause::
    Send ^+b        ;Pause       -> CTRL+SHIFT+B ;forward/next
    ;youtubeSeekForward()
    return



; double tap left shift do volume down
~Lshift::
	KeyWait,Lshift
	KeyWait,Lshift,D T0.2
	If ErrorLevel {
		Send +
	} else {
		Send {Volume_Down 5}
	}
	return

; double tap right shift do volume up
~Rshift::
    KeyWait,Rshift
	KeyWait,Rshift,D T0.2
	If ErrorLevel {
		Send +
	} else {
		Send {Volume_Up 5}
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
