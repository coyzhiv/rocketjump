extends StaticBody2D

signal button_pressed()
var can_reset:bool = true

func _on_area_2d_body_entered(_body):
	$MashSound.play()
	$Area2D.set_deferred("monitoring", false)
	$AnimatedSprite2D.frame = 1
	button_pressed.emit()
	


func _on_area_2d_area_entered(_area):
	$MashSound.play()
	$Area2D.set_deferred("monitoring", false)
	$AnimatedSprite2D.frame = 1
	button_pressed.emit()
	
func reset():
	if can_reset:
		$Area2D.set_deferred("monitoring", true)
		$AnimatedSprite2D.frame = 0

func disable():
	$Area2D.queue_free()
	can_reset = false
	$AnimatedSprite2D.frame = 1
	
