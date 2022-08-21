SetKeyDelay, 500

SetTimer, WatchPOV, 5

; 2Joy1 is the 'modifier' on the HOTAS
; we have reserved for most of these commands
MODIFIER := "2Joy1"

; For TrackIR, I have configured 'Home' as Center
; and turned off all of the other shortcuts
2Joy2::
	if GetKeyState(MODIFIER)
		send {Home}
	return

; Get to the "Other" section of the \ communications menu
; when using the hat on the joystick
WatchPOV:
	if not GetKeyState(MODIFIER)
		return
	GetKeyState, POV, JoyPOV
	if POV = 1
		return
	else if (POV = 0) {
		send, {\}
		send, {F10}
	} else if POV = 27000
		send, {F1}
	else if POV = 18000
		send, {F2}
	else if POV = 9000
		send, {F12}
	return