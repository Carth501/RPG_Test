extends CharacterBody3D

@export var camera_pivot : Node3D
@export var camera : Camera3D
@export var speed := 2.0
@export var jump_speed := 4.0
var mouse_sensitivity := 0.002

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(_delta):
	apply_controls(_delta)
	move_and_slide()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if event.is_action_pressed("click") && Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		camera_pivot.rotate_y(-event.relative.x * mouse_sensitivity)
		camera.rotate_x(-event.relative.y * mouse_sensitivity)
		camera.rotation.x = clampf(camera.rotation.x, -deg_to_rad(85), deg_to_rad(80))

func apply_controls(delta):
	if(is_on_floor()):
		var input = Input.get_vector("left", "right", "forward", "backward").normalized()
		var movement_dir = basis * camera_pivot.basis * Vector3(input.x, 0, input.y)
		velocity.x = movement_dir.x * speed
		velocity.z = movement_dir.z * speed
		if Input.is_action_just_pressed("jump"):
			jump()
	else:
		velocity.y += -10 * delta

func jump():
	var jump_dir = basis * Vector3(0, jump_speed, 0)
	velocity.y = jump_dir.y
