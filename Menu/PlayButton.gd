extends Button

func _on_PlayButton_pressed() -> void:
	get_tree().reload_current_scene()
	get_tree().change_scene("res://Spatial.tscn")
