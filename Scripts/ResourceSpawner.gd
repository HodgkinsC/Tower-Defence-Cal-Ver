extends Node3D

func _on_tree_spawn_timer_timeout() -> void:
	if !GlobalVariables.treecount >= 20:
		var rand = Vector3(randf_range(-10,10), randf_range(10, 20), randf_range(-10,10))
		var inst = preload("res://Scenes/Tree.tscn").instantiate()
		add_child(inst)
		inst.global_position = rand

func _on_rock_spawn_timer_timeout() -> void:
	if !GlobalVariables.rockcount >= 20:
		var rand = Vector3(randf_range(-10,10), randf_range(10, 20), randf_range(-10,10))
		var inst = preload("res://Scenes/Rock.tscn").instantiate()
		add_child(inst)
		inst.global_position = rand

func _on_death_plane_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		body.global_position = Vector3(0, 2, 0)
	elif body.name == "Player2":
		body.global_position = Vector3(100, 2, 0)
