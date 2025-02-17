extends CharacterBody3D

@export var look_sensitivity = 0.006

const SPEED = 5.0
const JUMP_VELOCITY = 6.5

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@export var plrid : int

@onready var cam = %Camera3D

func _unhandled_input(event):
	if plrid == GlobalVariables.activeplr:
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			if event is InputEventMouseMotion:
				rotate_y(-event.relative.x * look_sensitivity)
				%Camera3D.rotate_x(-event.relative.y * look_sensitivity)
				%Camera3D.rotation.x = clamp(%Camera3D.rotation.x, deg_to_rad(-90), deg_to_rad(90))

func _physics_process(delta):

	if not is_on_floor():
		velocity.y -= gravity * delta
	if plrid == GlobalVariables.activeplr:
		cam.current = true
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		var input_dir = Input.get_vector("left", "right", "forward", "back")
		var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)
	else:
		cam.current = false
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
