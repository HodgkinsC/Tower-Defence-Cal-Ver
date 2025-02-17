extends CharacterBody3D

@export var player : CharacterBody3D
@export var SPEED = 1.0
@export var health = 200

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	#rotate towards player and move chat gpt made this don't ask me to fix it also don't fucking mess with it, it will break
	#I messed with it and it didn't break
	var playerpos = player.global_position; playerpos.y = self.position.y
	look_at(playerpos)
	var direction = (player.global_transform.origin - global_transform.origin).normalized()
	global_transform.origin += direction * SPEED * delta
	
	
	#damage code
	if health <= 0:
		#print("death")
		GlobalVariables.goldamt += 40
		queue_free()
		
	move_and_slide()

func take_damage(amount: int):
		health -= amount
		#print("Enemy health is now: " + str(health))
