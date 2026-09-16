extends Area2D



func _ready():
	pass
	#$AnimationPlayer/Sprite2D.global_position.x=global_position.x
	#$AnimationPlayer/Sprite2D.global_position.y=global_position.y-40


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	


func _on_body_entered(_body):
	$AnimationPlayer.play("open")


func _on_body_exited(_body):
	$AnimationPlayer.play("close")
