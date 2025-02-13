extends Control

@export var Icon : Texture2D

func _ready():
	print("Ready")
	if Icon != null: 
		$BuildingIcon.texture = Icon 
		print("Icon changed")
