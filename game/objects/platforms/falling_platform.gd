extends AnimatableBody2D

var breakable:bool = true

func _ready():
	pass

func _process(delta):
	pass

func reset():
	$AnimationPlayer.stop(true)
	$AnimationPlayer.play_backwards('fall')
	$Area2D/Area2D.disabled = false
	$CollisionPolygon2D.disabled = false
	breakable = true
	
	
func fall():
	if breakable:
		breakable = false
		particles_emit()
		await get_tree().create_timer(0.5).timeout
		$AudioStreamPlayer.play()
		$AnimationPlayer.play('fall')
		$Area2D/Area2D.disabled = true
		$CollisionPolygon2D.disabled = true

func particles_emit():
	$Dust/LandingParticles.restart()
	$Dust/LandingParticles2.restart()
	$Dust/LandingParticles3.restart()
	$Dust/LandingParticles4.restart()
	$Dust/LandingParticles5.restart()
	$Dust/LandingParticles.emitting = true
	$Dust/LandingParticles2.emitting = true
	$Dust/LandingParticles3.emitting = true
	$Dust/LandingParticles4.emitting = true
	$Dust/LandingParticles5.emitting = true

func _on_area_2d_area_entered(area):
	fall()
