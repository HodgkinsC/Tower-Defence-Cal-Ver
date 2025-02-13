extends Node

var moustog = false

func _unhandled_input(event):
		if Input.is_action_just_pressed("buildmenu"):
			moustog = !moustog
		if moustog:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
