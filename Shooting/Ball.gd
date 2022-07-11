extends RigidBody

onready var player: KinematicBody = get_parent().get_parent().get_node("PlayerTest")
var origin = transform.origin

func shoot(vector: Vector2) -> void:
	print("force: " + str(vector))
	print("player: " + str(player.translation))
	print("ball: " + str(translation))
	if abs(translation.x - player.translation.x) <= 25 and abs(translation.z - player.translation.z) <= 25:
		apply_central_impulse(Vector3(3 * vector.x, vector.y, abs(5 * vector.y)))

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_left"):
		translation = origin
		linear_velocity = Vector3.ZERO
		angular_velocity = Vector3.ZERO
		sleeping = false
	
