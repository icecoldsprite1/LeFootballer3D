extends Area

func _on_goal_body_entered(body: Node) -> void:
	if body.is_class("RigidBody"):
		body.sleeping = true
