extends Node

var moustog = false

var itemslot : int = 1

var woodamt : int = 0
var rockamt : int = 0
var goldamt : int = 0

var treecount: int = 0
var rockcount: int = 0

var activeplr : int = -1

func _input(event):
	if Input.is_action_just_pressed("switch"):
		activeplr = 0 - activeplr
