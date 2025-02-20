extends Node3D

func _process(delta):
	if GlobalVariables.itemslot == 3 or GlobalVariables.itemslot == 4 or GlobalVariables.itemslot == 5:
		$FactoryBuilding.visible = true
		$TowerBuilding.visible = false
	elif GlobalVariables.itemslot == 2:
		$FactoryBuilding.visible = false
		$TowerBuilding.visible = true
	else:
		$FactoryBuilding.visible = false
		$TowerBuilding.visible = false
