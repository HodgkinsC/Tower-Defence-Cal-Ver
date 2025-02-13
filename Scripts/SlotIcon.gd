extends Control

@export var Icon : Texture2D

func _ready():
	print("no epic :(")
	if Icon != null: 
		$BuildingIcon.texture = Icon 
		print("epic :)")
