extends Control

var selectedSlot = GlobalVariables.itemslot

func _process(delta):
	if $"..".plrid == GlobalVariables.activeplr:
		self.visible = true
		selectedslot()
		GlobalVariables.itemslot = selectedSlot
		viewmodel()
		$"../Head/Camera3D/BuildCast".force_raycast_update()
		var collPoint = $"../Head/Camera3D/BuildCast".get_collision_point()
		$Preview.global_position = collPoint
		var coll = $"../Head/Camera3D/BuildCast".get_collider()
		print(coll)
		print(collPoint)
		if coll != null:
			$Preview.visible = true
			iteminfo(coll)
			if Input.is_action_just_pressed("click"):
				if selectedSlot == 1:
					if coll.is_in_group("Mineable"):
						coll.health -= 1
						if coll.is_in_group("Rock"): GlobalVariables.rockamt += 10
						if coll.is_in_group("Tree"): GlobalVariables.woodamt += 10
						if coll.health <= 0:
							if coll.is_in_group("Factory"): GlobalVariables.woodamt += 50
							if coll.is_in_group("Tower"): GlobalVariables.rockamt += 50; GlobalVariables.woodamt += 50
							coll.queue_free()
				if selectedSlot == 2:
					if GlobalVariables.woodamt >= 50:
						var factoryinst = preload("res://Scenes/FactoryBuilding.tscn").instantiate()
						add_child(factoryinst)
						factoryinst.global_position = collPoint
						GlobalVariables.woodamt = GlobalVariables.woodamt - 50
						
					else:
						print("broke")
				if selectedSlot == 3:
					if GlobalVariables.rockamt >=50 and GlobalVariables.woodamt >=50:
						var towerinst = preload("res://Scenes/TowerBuilding.tscn").instantiate()
						add_child(towerinst)
						towerinst.global_position = collPoint
						GlobalVariables.rockamt =GlobalVariables.rockamt-50
						GlobalVariables.woodamt = GlobalVariables.woodamt - 50
					else:
						print("broke")
		else:
			$MineInfo.visible = false
			$Preview.visible = false
	else:
		self.visible = false
	$Rock.text = "Rock: " + str(GlobalVariables.rockamt)
	$Wood.text = "Wood: " + str(GlobalVariables.woodamt)
	$"Golden Rock".text = "Gold: " + str(GlobalVariables.goldamt)

func iteminfo(coll):
	if coll.is_in_group("Mineable"):
		var hpmod = $MineInfo/HealthRectBG.size.x / coll.maxhp
		$MineInfo/HealthRect.size.x = $MineInfo/HealthRectBG.size.x - hpmod * (coll.maxhp - coll.health)
		$MineInfo.visible = true
	if coll.is_in_group("Rock"):
		$MineInfo/ItemName.text = "Rock"
	elif coll.is_in_group("Tree"):
		$MineInfo/ItemName.text = "Tree"
	elif coll.is_in_group("Factory"):
		$MineInfo/ItemName.text = "Factory"
	elif coll.is_in_group("Tower"):
		$MineInfo/ItemName.text = "Tower"
	else:
		$MineInfo.visible = false

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
	if Input.is_action_just_pressed("esc"): GlobalVariables.moustog = !GlobalVariables.moustog
	if GlobalVariables.moustog: Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	else: Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.is_action_just_pressed("MWU") and selectedSlot >= 2:
		selectedSlot -= 1
	if Input.is_action_just_pressed("MWD") and selectedSlot <= 4:
		selectedSlot += 1
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
	get_tree().paused = !GlobalVariables.moustog

func _on_button_pressed():
	get_tree().quit()

func _on_button_2_pressed() -> void:
	GlobalVariables.moustog = !GlobalVariables.moustog
