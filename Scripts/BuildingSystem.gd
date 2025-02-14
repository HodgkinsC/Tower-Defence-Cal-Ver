extends Control

var selectedSlot = GlobalVariables.itemslot

func _process(delta):
	selectedslot()
	GlobalVariables.itemslot = selectedSlot
	viewmodel()
	$"../Head/Camera3D/BuildCast".force_raycast_update()
	var collPoint = $"../Head/Camera3D/BuildCast".get_collision_point()
	$"../Preview".global_position = collPoint
	if Input.is_action_just_pressed("click"):
		if selectedSlot == 1:
			var coll = $"../Head/Camera3D/BuildCast".get_collider()
			if coll != null:
				if coll.is_in_group("Building"):
					coll.queue_free()
		if selectedSlot == 2:
			var factoryinst = preload("res://Scenes/FactoryBuilding.tscn").instantiate()
			add_child(factoryinst)
			factoryinst.global_position = collPoint
	
	$"../Preview".position = Vector3(-10,0,0)

func viewmodel():
	if selectedSlot == 1:
		$"../Head/Camera3D/Pickaxe".visible = true
	else:
		$"../Head/Camera3D/Pickaxe".visible = false
	if selectedSlot == 2:
		$"../Head/Camera3D/Factory".visible = true
	else:
		$"../Head/Camera3D/Factory".visible = false
	if selectedSlot == 3:
		$"../Head/Camera3D/Tower".visible = true
	else:
		$"../Head/Camera3D/Tower".visible = false

func selectedslot():
	if Input.is_action_just_pressed("1"):
		selectedSlot = 1
	if Input.is_action_just_pressed("2"):
		selectedSlot = 2
	if Input.is_action_just_pressed("3"):
		selectedSlot = 3
	if Input.is_action_just_pressed("4"):
		selectedSlot = 4
	if Input.is_action_just_pressed("5"):
		selectedSlot = 5
	$SlotSelect.global_position.x = $Hotbar/Slot1.global_position.x + (80 * selectedSlot) - 80
	$BuildingUI.visible = !GlobalVariables.moustog


