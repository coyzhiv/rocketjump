extends Node2D

class_name LevelParent

var bullet_scene: PackedScene = preload("res://game/player/bullet.tscn")






func _on_player_shot(pos):
	$Audios/BulletSound.pitch_scale = randf_range(0.9,1.1)
	$Audios/BulletSound.play()
	var bullet = bullet_scene.instantiate()
	bullet.position = pos
	bullet.direction = (get_global_mouse_position()-$Player.position).normalized()
	bullet.rotation_degrees = rad_to_deg(bullet.direction.angle())
	$".".add_child(bullet)
	


	
