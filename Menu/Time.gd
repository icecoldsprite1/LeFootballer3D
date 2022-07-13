extends Control

var seconds = 60

onready var results = get_parent().get_node("Results")

signal times_up()

func _physics_process(delta: float) -> void:
	
	if seconds >= 10:
		$Seconds.set_text(str(seconds) + "s")
	else:
		$Seconds.set_text("0" + str(seconds) + "s")
		
	if seconds <= 0:
		emit_signal("times_up")

func _on_Timer_timeout() -> void:
	seconds -= 1
	
func _on_Time_times_up() -> void:
	results.visible = true
	results.get_child(2).button_visible()
	$Timer.stop()

func add_time():
	seconds += 5
