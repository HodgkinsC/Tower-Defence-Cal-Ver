extends Node3D



var currentEnemy = {}
var turretPos
@export var shootTimeoutTime = 1
@export var damageDelt = 20
var lowestDist = [null,null]


func _ready() -> void:
	turretPos = global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Timer.wait_time = shootTimeoutTime
	findCloseset()
	

func findCloseset():
	lowestDist = [null,null]
	for enemies in currentEnemy:
		var body = currentEnemy[enemies][0]
		var bodyPos = body.global_position
		var dist = turretPos.distance_to(bodyPos)
		currentEnemy[body.name] = [body,bodyPos,dist]
		if lowestDist[0] == null:
			lowestDist = [dist,body]
		elif lowestDist[0] >= dist:
			lowestDist = [dist,body]
		#print(lowestDist)


func _on_timer_timeout() -> void:
	if !(lowestDist[0] == null):
		Draw3d.line(lowestDist[1].global_position+Vector3(0,.8,0),turretPos+Vector3(0,1.1,0),Color(128,0,128),0.1)
		lowestDist[1].take_damage(damageDelt)


func _on_damage_area__area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("enemies"):
		var bodyPos = body.global_position
		currentEnemy[body.name] = [body,bodyPos,turretPos.distance_to(bodyPos)]
		#print(body," entered")

func _on_damage_area__area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("enemies"):
		#print(body," exited")
		currentEnemy.erase(body.name)
