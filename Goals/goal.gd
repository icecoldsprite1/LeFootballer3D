extends Area

onready var score = get_parent().get_node("Score")
onready var time = get_parent().get_node("Coutdown")

func _on_goal_body_entered(body: Node) -> void:
	if body.is_class("RigidBody"):
		body.sleeping = true
		score.add_score()
		time.add_time()
		score.set_text("Score:" + str(score.get_score()))
