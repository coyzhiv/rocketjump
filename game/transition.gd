extends CanvasLayer
var windowed: bool = false

func _process(delta):
	if Input.is_action_just_pressed("FullScreen") and windowed:
		DisplayServer.window_set_mode(4)
		windowed = false
	else: if Input.is_action_just_pressed("FullScreen") and not windowed:
		DisplayServer.window_set_mode(0)
		windowed = true

func change_scene(target:String) -> void:
	$ColorRect.visible = true
	$AnimationPlayer.play("fade")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards("fade")
