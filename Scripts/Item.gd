extends StaticBody3D

@export var health : int = 5
@export var maxhp : int = 5

@onready var groundcast = $GroundCast

func _ready() -> void:
	GlobalVariables.rockcount += 1
	print(GlobalVariables.rockcount)

func _process(delta: float) -> void:
	if groundcast != null:
		groundcast.force_raycast_update()
		var collpoint = groundcast.get_collision_point()
		self.global_position = collpoint
