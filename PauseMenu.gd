extends CanvasLayer

var paused:bool = false
var pause_enabled:bool = false

func _process(delta):
	if Input.is_action_just_pressed("pause") and pause_enabled and not paused:
		paused = true
		get_tree().paused = true
		$".".visible = true

	elif Input.is_action_just_pressed("pause") and paused:
		paused = false
		get_tree().paused = false
		$".".visible = false
