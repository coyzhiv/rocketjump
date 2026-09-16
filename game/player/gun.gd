extends Node2D

var can_reload: bool = false
var can_can_reload: bool = true
var active:bool = true


func _process(_delta):
	if active:
		if not Globals.gun_empty:
			look_at(get_global_mouse_position())

			if (get_global_mouse_position().x - global_position.x) < 0:
				$Sprite2D.flip_v = true
			if (get_global_mouse_position().x - global_position.x) > 0:
				$Sprite2D.flip_v = false
			if Globals.bullet_count == 0:
				Globals.gun_empty = true
				$".".rotation_degrees = 0
				$Sprite2D.flip_v = false
		
		if Globals.gun_empty:
			if (get_global_mouse_position().x - global_position.x) < 0:
				$Sprite2D.flip_h = true
			if (get_global_mouse_position().x - global_position.x) > 0:
				$Sprite2D.flip_h = false
		
		if Globals.gun_empty and can_reload and can_can_reload:

			reload()
			can_can_reload = false
	

	
func reload():
	if active:
		$AudioStreamPlayer.play()
		can_reload = false
		Globals.gun_empty = true
		var tween = get_tree().create_tween()
		$Sprite2D.flip_v = false
		$".".rotation_degrees = 0
		tween.tween_property($".", "rotation_degrees",360, 0.7).set_trans(Tween.TRANS_ELASTIC)
		await get_tree().create_timer(0.7).timeout
		$Sprite2D.flip_h = false
		Globals.bullet_count = Globals.bullet_count_max
		Globals.gun_empty = false
		can_can_reload = true

func disable():
	active = false
	$Sprite2D.visible = false
