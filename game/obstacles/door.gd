extends StaticBody2D

var normal_position: Vector2
var already_opening: bool = false

signal door_closed()

func _ready():
	normal_position = global_position
	

func open(x, time):
	if already_opening:
		await get_tree().create_timer(0.5).timeout
	already_opening = true
	var tween = get_tree().create_tween()
	var direction: Vector2 = Vector2(x,0)
	tween.tween_property($".", "position", position + direction , time)
	await tween.finished
	already_opening = false
	
func close(x, time):
	if already_opening:
		await get_tree().create_timer(0.5).timeout
	already_opening = true
	var tween = get_tree().create_tween()
	var direction: Vector2 = Vector2(x,0)
	tween.tween_property($".", "position", position + direction , time)
	await tween.finished
	door_closed.emit()
	already_opening = false
	

func reset():
	global_position = normal_position
