extends Node3D

func _process(delta):
	if GlobalVariables.itemslot == 2:
		$FactoryBuilding.visible = true
		$TowerBuilding.visible = false
	elif GlobalVariables.itemslot == 3:
		$FactoryBuilding.visible = false
		$TowerBuilding.visible = true
	else:
		$FactoryBuilding.visible = false
		$TowerBuilding.visible = false
