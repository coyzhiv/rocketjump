extends Node2D

func _ready():
	if Globals.current_level == 1:
		lvl1lvl2()

func lvl1lvl2():
	await get_tree().create_timer(3).timeout
	Transition.change_scene("res://game/levels/level_2.tscn")
