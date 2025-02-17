extends CharacterBody3D

@onready var player = $"../../Player"
@export var SPEED = 3.0
const JUMP_VELOCITY = 4.5
@export var health = 100

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	#rotate towards player and move chat gpt made this don't ask me to fix it also don't fucking mess with it, it will break
	var playerpos = Vector3(player.global_transform.origin[0],position[1],player.global_transform.origin[2])
	look_at(playerpos, Vector3.UP)
	rotate_y(1.5708)
	var direction = (player.global_transform.origin - global_transform.origin).normalized()
	scale = Vector3(0.5,0.5,0.5)
	global_transform.origin += direction * SPEED * delta
	
	
	#damage code
	if health <= 0:
		#print("death")
		queue_free()
		
	move_and_slide()
	
func take_damage(amount: int):
		health -= amount
		#print("Enemy health is now: " + str(health))
