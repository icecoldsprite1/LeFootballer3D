extends KinematicBody

var velocity = Vector3.ZERO
var snap_vector = Vector3.DOWN
var max_speed = 50
#var acceleration = 2000
#var friction = 1000
var jump_strength = 30
var gravity = 100
var rotation_speed = 10

func _physics_process(delta: float) -> void:

	var move_direction: Vector3 = Vector3.ZERO
	move_direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	move_direction.z = Input.get_action_strength("backward") - Input.get_action_strength("forward")
	move_direction = move_direction.rotated(Vector3.UP, $SpringArm.rotation.y).normalized()
	
	velocity.x = move_direction.x * max_speed
	velocity.z = move_direction.z * max_speed
	velocity.y -= gravity * delta
	
	var just_landed: bool = is_on_floor() and snap_vector == Vector3.ZERO
	var is_jumping: bool = is_on_floor() and Input.is_action_just_pressed("jump")
	if is_jumping:
		velocity.y = jump_strength
		snap_vector = Vector3.ZERO
	elif just_landed:
		snap_vector = Vector3.DOWN
	velocity = move_and_slide_with_snap(velocity, snap_vector, Vector3.UP, true)
	
	if velocity.length() > 0.2:
		var look_direction = Vector2(velocity.z, velocity.x)
		rotation.y = lerp_angle(rotation.y, look_direction.angle(), rotation_speed * delta)
		
func _process(delta: float) -> void:
	$SpringArm.translation = translation

func shoot(vector) -> void:
	pass # Replace with function body.
