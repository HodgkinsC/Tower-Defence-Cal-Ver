extends StaticBody3D

@export var health : int = 5
@export var maxhp : int = 5

@onready var timer = $MONEY

func _on_money_timeout() -> void:
	GlobalVariables.goldamt += 5
