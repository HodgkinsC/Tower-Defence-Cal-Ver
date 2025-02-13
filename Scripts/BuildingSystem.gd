extends Control

var selectedSlot = 1

func _process(delta):
	selectedslot()
	viewmodel()
	

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
	$BuildingUI.visible = !GlobalVariables.moustog
