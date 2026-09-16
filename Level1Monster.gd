extends Node2D

var normal_position: Vector2
var started = false
var can_right_stomp: bool = true
var can_left_stomp: bool = true
signal player_entered(body)

signal stomp()


func _ready():
	normal_position = position

func _process(delta):
	if started:
		$".".position.x += 270 * delta
		

func reset():
	position = normal_position
	started = false
	get_parent().get_parent().reached_run = false
	$RightArmAnimation.stop()
	
func start():
	started = true
	hands_move()
	body_move()
	

func hands_move():
	$RightArmAnimation.play("arm")
	$LeftArmAnimation.play("arm")
	var tween1 = get_tree().create_tween()
	tween1.set_parallel()
	tween1.tween_property($LeftArm/PathFollow2D, "progress_ratio", 0.5, 0.5)
	tween1.tween_property($RightArm/PathFollow2D, "progress_ratio", 0.5, 0.5)
	await tween1.finished
	stomp.emit()
	var tween2 = get_tree().create_tween()
	tween2.set_parallel()
	tween2.tween_property($LeftArm/PathFollow2D, "progress_ratio", 1, 0.5)
	tween2.tween_property($RightArm/PathFollow2D, "progress_ratio", 1, 0.5)
	await tween2.finished
	stomp.emit()
	$RightArmAnimation.stop()
	$LeftArmAnimation.stop()
	$LeftArm/PathFollow2D.progress_ratio = 0
	$RightArm/PathFollow2D.progress_ratio = 0
	if started:
		hands_move()

func body_move():
	var tween = get_tree().create_tween()
	tween.tween_property($Body/PathFollow2D, "progress_ratio", 1, 0.5)
	await tween.finished
	$Body/PathFollow2D.progress_ratio = 0
	if started:
		body_move()

func _on_area_2d_body_entered(body):
	player_entered.emit(body)


func _on_right_area_body_entered(body):
	player_entered.emit(body)


func _on_left_area_body_entered(body):
	player_entered.emit(body)
