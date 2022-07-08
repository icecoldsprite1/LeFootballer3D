extends KinematicBody

var velocity = Vector3.ZERO
var max_speed = 50
var acceleration = 2000
var friction = 1000

func _physics_process(delta: float) -> void:
	
#	if Input.is_action_pressed("right") and Input.is_action_pressed("left"):
#		velocity.x = 0
#	elif Input.is_action_pressed("right"):
#		velocity.x = speed
#	elif Input.is_action_pressed("left"):
#		velocity.x = -speed
#	else:
#		velocity.x = lerp(velocity.x, 0, 0.1)
#
#	if Input.is_action_pressed("forward") and Input.is_action_pressed("backward"):
#		velocity.z = 0
#	elif Input.is_action_pressed("forward"):
#		velocity.z = -speed
#	elif Input.is_action_pressed("backward"):
#		velocity.z = speed
#	else:
#		velocity.z = lerp(velocity.z, 0, 0.1)

	var input_vector = Vector3.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.z = Input.get_action_strength("backward") - Input.get_action_strength("forward")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector3.ZERO:
		velocity = velocity.move_toward(input_vector * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector3.ZERO, friction * delta)
		
	velocity = move_and_slide(velocity)
#	move_and_slide(velocity)

