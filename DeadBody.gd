extends Node2D

var already_dead: bool = false

func death():
	if not already_dead:
		already_dead = true
		$AudioStreamPlayer.play()
		$Sprite2D.visible = false
		$DeathParticles.emitting = true
