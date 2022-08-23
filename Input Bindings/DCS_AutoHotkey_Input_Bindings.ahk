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

; Kneepad
; Shift 4 - Toggle (Joy2)
; Shift 5 - Left (Joy3)
; Shift 6 - Right (Joy4)
; Shift 7 - Recenter (Joy1)
Joy2::
	if GetKeyState(MODIFIER)
		send +4
	return
Joy3::
	if GetKeyState(MODIFIER)
		send +5
	return
Joy4::
	if GetKeyState(MODIFIER)
		send +6
	return
Joy1::
	if GetKeyState(MODIFIER)
		send +7
	return

; F1 - F12
Joy5::
	if GetKeyState(MODIFIER)
		send {F1}
	return
Joy6::
	if GetKeyState(MODIFIER)
		send {F2}
	return
Joy7::
	if GetKeyState(MODIFIER)
		send {F3}
	return
Joy10::
	if GetKeyState(MODIFIER)
		send {F4}
	return
Joy9::
	if GetKeyState(MODIFIER)
		send {F5}
	return
Joy8::
	if GetKeyState(MODIFIER)
		send {F6}
	return
Joy13::
	if GetKeyState(MODIFIER)
		send {F7}
	return
Joy12::
	if GetKeyState(MODIFIER)
		send {F8}
	return
Joy11::
	if GetKeyState(MODIFIER)
		send {F9}
	return
Joy14::
	if GetKeyState(MODIFIER)
		send {F10}
	return
Joy15::
	if GetKeyState(MODIFIER)
		send {F11}
	return
Joy16::
	if GetKeyState(MODIFIER)
		send {F12}
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
		sleep 1000
		send, {\}
	} else if POV = 27000
		send, {F1}
	else if POV = 18000
		send, {F2}
	else if POV = 9000
		send, {F12}
	return