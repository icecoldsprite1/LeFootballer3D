extends RigidBody

onready var player: KinematicBody = get_parent().get_parent().get_node("PlayerTest")

func shoot(vector: Vector2) -> void:
	print("force: " + str(vector))
	print("player: " + str(player.translation))
	print("ball: " + str(translation))
	if abs(translation.x - player.translation.x) <= 25 and abs(translation.z - player.translation.z) <= 25:
		apply_central_impulse(Vector3(vector.x, vector.y, vector.y))
