extends Label

var score = 0

func get_score():
	return score

func add_score():
	score += 1

func _on_PlayAgainButton_pressed() -> void:
	get_tree().reload_current_scene()
	get_tree().change_scene("res://Spatial.tscn")

func _on_Coutdown_times_up() -> void:
	set_text("Score:" + str(get_score()))
