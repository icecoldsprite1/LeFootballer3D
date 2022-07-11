extends KinematicBody

var velocity = Vector3.ZERO
var speed = 2500
var origin = transform.origin

enum {MOVE_LEFT, MOVE_RIGHT, FREEZE}
var state = MOVE_LEFT

var rng = RandomNumberGenerator.new()

func _physics_process(delta: float) -> void:
	match state:
		MOVE_LEFT:
			move_left(delta)
		MOVE_RIGHT:
			move_right(delta)
		FREEZE:
			freeze(delta)

func move_left(delta: float):
	velocity.x = speed * delta
	if translation.x - origin.x >= 10:
		state = MOVE_RIGHT
	velocity = move_and_slide(velocity)

func move_right(delta: float):
	velocity.x = -speed * delta
	if translation.x - origin.x <= -10:
		state = MOVE_LEFT
	velocity = move_and_slide(velocity)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_right"):
		state = FREEZE
		rng.randomize()
		translation.x = origin.x + rng.randi_range(-10, 10)
	if event.is_action_pressed("ui_up"):
		translation = origin
		state = MOVE_LEFT

func freeze(_delta):
	velocity.x = 0
