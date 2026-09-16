extends Node2D

var normal_position:Vector2

func _ready():
	$Sprite2D.frame = randf_range(0,3)
	normal_position = global_position

func reset():
	global_position = normal_position
	$Sprite2D.frame = randf_range(0,3)
	await get_tree().create_timer(0.05).timeout
	$Sprite2D.visible = true
	$DeathArea.set_deferred("monitoring", true)
	$DeathArea.set_deferred("monitorable", true)
	$FallingArea.set_deferred("monitoring", true)
	$FallingArea.set_deferred("monitorable", true)

func _on_death_area_body_entered(body):
	if body.has_method("death"):
		body.death()
	$Sprite2D.visible = false
	$DeathArea.set_deferred("monitoring", false)
	$DeathArea.set_deferred("monitorable", false)
	$FallingArea.set_deferred("monitoring", false)
	$FallingArea.set_deferred("monitorable", false)
	$CPUParticles2D.emitting = true


func _on_falling_area_body_entered(body):
	$FallingArea.set_deferred("monitoring", false)
	$FallingArea.set_deferred("monitorable", false)
	var tween = get_tree().create_tween()
	tween.tween_property($".", "global_position", global_position + Vector2(0,400), 0.9).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
