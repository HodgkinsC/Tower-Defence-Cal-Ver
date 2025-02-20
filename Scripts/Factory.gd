extends StaticBody3D

@export var health : int = 5
@export var maxhp : int = 5

@onready var timer = $COOLDOWN

@export var vari : int

func _on_money_timeout() -> void:
	if vari == 1:
		GlobalVariables.goldamt += 5
	elif vari == 2:
		GlobalVariables.rockamt += 5
	elif vari == 3:
		GlobalVariables.woodamt += 5
	
