extends SpringArm

var mouse_sensitivity = 0.25
var holding = false

func _ready() -> void:
	set_as_toplevel(true)
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("right_click"):
		holding = true
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	if event.is_action_released("right_click"):
		holding = false
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	if event is InputEventMouseMotion and holding:
		rotation_degrees.x -= event.relative.y * mouse_sensitivity
		rotation_degrees.x = clamp(rotation_degrees.x, -90, 30)
		
		rotation_degrees.y -= event.relative.x * mouse_sensitivity
		rotation_degrees.y = wrapf(rotation_degrees.y, 0, 360)
		
		
