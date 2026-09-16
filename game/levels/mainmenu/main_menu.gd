extends Node2D


func _ready():
	pass
	#Input.set_mouse_mode(3)

func _process(delta):
	if $Node2D.position.y > 0:
		$Node2D.position.y -= 100 * delta
	if $Node2D.position.y < 0:
		$Node2D.position.y = 0
	if Input.is_action_just_pressed("skip"):
		$Node2D.position.y = 0
	if $Node2D.position.y == 0:
		$Node2D/Start.disabled = false
	


func _on_start_pressed():
	$Node2D/Start.disabled = true
	Transition.change_scene("res://game/levels/level_1.tscn")
	
