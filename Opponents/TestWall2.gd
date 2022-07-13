extends KinematicBody

var rng = RandomNumberGenerator.new()
var origin = transform.origin

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_left"):
		translation.x = origin.x + rng.randi_range(-10, 10)
