extends Node

var moustog = false

var itemslot : int = 1

var activeplr = 1

var woodamt : int = 0
var rockamt : int = 0
var factamt : int = 0
var toweamt : int = 0

func _unhandled_input(event):
	if Input.is_action_just_pressed("buildmenu"):
		moustog = !moustog
	if moustog:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.is_action_just_pressed("switch"):
		activeplr = 0-activeplr
		print(activeplr)
