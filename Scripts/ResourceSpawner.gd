extends Node3D

func _on_tree_spawn_timer_timeout() -> void:
	var rand = Vector3(randf_range(-10,10), randf_range(10, 20), randf_range(-10,10))
	var inst = preload("res://Scenes/Tree.tscn").instantiate()
	add_child(inst)
	inst.global_position = rand

func _on_rock_spawn_timer_timeout() -> void:
	var rand = Vector3(randf_range(-10,10), randf_range(10, 20), randf_range(-10,10))
	var inst = preload("res://Scenes/Rock.tscn").instantiate()
	add_child(inst)
	inst.global_position = rand
