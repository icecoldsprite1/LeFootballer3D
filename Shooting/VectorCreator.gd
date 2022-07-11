extends Area2D

signal vector_created(vector)

var max_length: int = 500
var touch_down: bool = false
var pos_start: Vector2 = Vector2.ZERO
var pos_end: Vector2 = Vector2.ZERO

var vector: Vector2 = Vector2.ZERO

func _ready() -> void:
	connect("input_event", self, "_on_input_event")

func reset():
	pos_start = Vector2.ZERO
	pos_end = Vector2.ZERO
	vector = Vector2.ZERO
	update()
	
func _draw() -> void:
	draw_line(pos_start - global_position, pos_end - global_position, Color.red, 16)
	# draw_line(pos_start - global_position, pos_start - global_position + vector, Color.red, 16)

func _input(event: InputEvent) -> void:
	if not touch_down:
		return
		
	if event.is_action_pressed("left_click"):
		touch_down = false
		# emit_signal("vector_created", vector)
		reset()
		
	if event is InputEventMouseMotion:
		pos_end = event.position
		vector = -(pos_end - pos_start).clamped(max_length)
		# print("vector: " + str(vector))
		update()
		
func _on_input_event(_viewport: Object, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("left_click"):
		touch_down = true
		pos_start = event.position
	if event.is_action_released("left_click") :
		touch_down = false
		emit_signal("vector_created", vector)
		reset()
		
func _on_VectorCreator_mouse_exited() -> void:
	touch_down = false
	emit_signal("vector_created", vector)
	reset()
