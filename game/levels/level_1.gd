extends LevelParent

var monster_scene: PackedScene = preload("res://game/enemies/monster/level_1_monster.tscn")

var reached1: bool = false
var reached2: bool = false
var reached2_5: bool = false
var reached3: bool = false
var reached4: bool = false
var reached5: bool = false
var reached6: bool = false
var reached_run: bool = false
var body_dead: bool = false
var floor1_button_count = 0
var floor2_button_count = 0
var floor4_button_count = 0
var floor5_button_count = 0
var monster_deleted:bool = false
var restartable:bool = true


func _ready():
	Globals.current_level = 1
	$NoteTip2.get_child(4).text = "Use MMB to\nreload."
	$NoteTip3.get_child(4).text = "To activate\nbuttons use\nbody or bullets."
	$NoteTip4.get_child(4).text = "Use RMB to\nDash."
	$NoteTip5.get_child(4).text = "run"
	PauseMenu.pause_enabled = true
	

func _process(delta):
	if Input.is_action_just_pressed("restart") and restartable:
		$Player.death()
		floor1_button_count = 0
		floor2_button_count = 0
		floor4_button_count = 0
		floor5_button_count = 0
		if reached_run:
			$CanvasLayer/ColorRect.modulate = ("#ffffff")
			music($Audios/RunMusic1,'off')
			music($Audios/Piano4,'on')
			music($Audios/MonsterLoop,'on')
			$Player/Camera2D.limit_left = -634
			await get_tree().create_timer(2).timeout
			var tween = get_tree().create_tween()
			tween.tween_property($CanvasLayer/ColorRect,"modulate", Color(0,0,0,0), 1)
	if not reached6:
		if $Player.position.x > 1271:
			$Player/Camera2D.limit_right = 1537
		if $Player.position.x < 1271:
			$Player/Camera2D.limit_right = 1280
	if $Player.position.y < -504.455 and not reached1: #Camera move from screen 0 to screen 1`
		reached1 = true
		var tween = get_tree().create_tween()
		tween.set_parallel()
		tween.tween_property($Player/Camera2D,"limit_top", -1153, 1).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
		tween.tween_property($Player/Camera2D,"limit_bottom", -433, 1).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
		music($Audios/Drums,'on')
		$Player.velocity = Vector2.UP * 500
		$Player/Camera2D.add_trauma(0.2,0.3) #camera shake
		$Audios/DoorClose.play()
		$Floor1Obstacles/door.close(-80,0.3)
		$Floor1Obstacles/door2.close(80,0.3)
		await $Floor1Obstacles/door.door_closed
		await $Floor1Obstacles/door2.door_closed
		$Player/Camera2D.add_trauma(0.2,4)
		$Floor1Obstacles/door.normal_position = $Floor1Obstacles/door.global_position
		$Floor1Obstacles/door2.normal_position = $Floor1Obstacles/door2.global_position
		Globals.checkpoint = Vector2(640.29, -557.73)
	if $Player.position.y < -1155.455 and not reached2:
		reached2 = true
		var tween = get_tree().create_tween()
		tween.set_parallel()
		tween.tween_property($Player/Camera2D,"limit_top", -1808, 1).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
		tween.tween_property($Player/Camera2D,"limit_bottom", -1088, 1).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
		$Player.velocity = Vector2.UP * 500
		music($Audios/Piano0,'on')
		$Audios/DoorClose.play()
		$Player/Camera2D.add_trauma(0.2,0.3) #camera shake
		$Floor2Obstacles/door3.close(-26,0.3)
		$Floor2Obstacles/door4.close(26,0.3)
		await $Floor2Obstacles/door3.door_closed
		await $Floor2Obstacles/door4.door_closed
		$Player/Camera2D.add_trauma(0.2,4)
		$Floor2Obstacles/door3.normal_position = $Floor2Obstacles/door3.global_position
		$Floor2Obstacles/door4.normal_position = $Floor2Obstacles/door4.global_position
		Globals.checkpoint = Vector2(644, -1231)
	if $Player.position.y < -1795 and not reached2_5:
		reached2_5 = true
		var tween = get_tree().create_tween()
		tween.set_parallel()
		tween.tween_property($Player/Camera2D,"limit_top", -2433, 1).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
		tween.tween_property($Player/Camera2D,"limit_bottom", -1713, 1).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
		$Player.velocity = Vector2.UP * 500
		$Audios/DoorClose.play()
		$Player/Camera2D.add_trauma(0.2,0.3) #camera shake
		music($Audios/Piano0,'off')
		music($Audios/Piano1,'on')
		$Floor3Obstacles/door.close(26,0.3)
		$Floor3Obstacles/door2.close(-26,0.3)
		await $Floor3Obstacles/door.door_closed
		await $Floor3Obstacles/door2.door_closed
		$Player/Camera2D.add_trauma(0.2,4)
		$Floor3Obstacles/door.normal_position = $Floor3Obstacles/door.global_position
		$Floor3Obstacles/door2.normal_position = $Floor3Obstacles/door2.global_position
		Globals.checkpoint = Vector2(365, -1850)
	if $Player.position.y < -2435 and not reached3:
		reached3 = true
		var tween = get_tree().create_tween()
		tween.set_parallel()
		tween.tween_property($Player/Camera2D,"limit_top", -3079, 1).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
		tween.tween_property($Player/Camera2D,"limit_bottom", -2359, 1).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
		$Player.velocity = Vector2.UP * 500
		$Player/Camera2D.add_trauma(0.2,0.3) #camera shake
		music($Audios/Piano1,'off')
		music($Audios/Piano2,'on')
		$Audios/DoorClose.play()
		$Floor3_5Obstacles/door.close(-83,0.3)
		$Floor3_5Obstacles/door2.close(83,0.3)
		await $Floor3_5Obstacles/door.door_closed
		await $Floor3_5Obstacles/door2.door_closed
		$Player/Camera2D.add_trauma(0.2,4)
		$Floor3_5Obstacles/door.normal_position = $Floor3_5Obstacles/door.global_position
		$Floor3_5Obstacles/door2.normal_position = $Floor3_5Obstacles/door2.global_position
		Globals.checkpoint = Vector2(1041, -2493)
	if $Player.position.y < -3073.455 and not reached4:
		reached4 = true
		var tween = get_tree().create_tween()
		tween.set_parallel()
		tween.tween_property($Player/Camera2D,"limit_top", -3702, 1).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
		tween.tween_property($Player/Camera2D,"limit_bottom", -2982, 1).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
		$Player.velocity = Vector2.UP * 500
		$Player/Camera2D.add_trauma(0.2,0.3) #camera shake
		music($Audios/Piano2,'off')
		music($Audios/Piano3,'on')
		$Audios/DoorClose.play()
		$Floor4Obstacles/door.close(83,0.3)
		$Floor4Obstacles/door2.close(-83,0.3)
		await $Floor4Obstacles/door.door_closed
		await $Floor4Obstacles/door2.door_closed
		$Player/Camera2D.add_trauma(0.2,4)
		$Floor4Obstacles/door.normal_position = $Floor4Obstacles/door.global_position
		$Floor4Obstacles/door2.normal_position = $Floor4Obstacles/door2.global_position
		Globals.checkpoint = Vector2(135, -3155)
	if $Player.position.y < -3713 and not reached5:
		reached5 = true
		var tween = get_tree().create_tween()
		tween.set_parallel()
		tween.tween_property($Player/Camera2D,"limit_top", -4351, 1).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
		tween.tween_property($Player/Camera2D,"limit_bottom", -3631, 1).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
		$Player.velocity = Vector2.UP * 500
		$Player/Camera2D.add_trauma(0.2,0.3) #camera shake
		music($Audios/Piano3,'off')
		music($Audios/Drums,'off')
		music($Audios/Piano4,'on')
		music($Audios/MonsterLoop,'on')
		$Audios/DoorClose.play()
		$Floor5Obstacles/door.close(83,0.3)
		$Floor5Obstacles/door2.close(-83,0.3)
		await $Floor5Obstacles/door.door_closed
		await $Floor5Obstacles/door2.door_closed
		$Player/Camera2D.add_trauma(0.2,4)
		$Floor5Obstacles/door.normal_position = $Floor5Obstacles/door.global_position
		$Floor5Obstacles/door2.normal_position = $Floor5Obstacles/door2.global_position
		Globals.checkpoint = Vector2(1029, -3793)
	if $Player.position.y < -4352 and not reached6:
		reached6 = true
		var tween = get_tree().create_tween()
		tween.set_parallel()
		tween.tween_property($Player/Camera2D,"limit_top", -4991, 1).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
		tween.tween_property($Player/Camera2D,"limit_bottom", -4271, 1).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
		tween.tween_property($Player/Camera2D,"limit_left", -634, 1).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
		tween.tween_property($Player/Camera2D,"limit_right", 8613, 1).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
		$Player.velocity = Vector2.UP * 500
		$Player/Camera2D.add_trauma(0.2,0.3) #camera shake
		$Audios/DoorClose.play()
		$Floor6Obstacles/door.close(-83,0.3)
		$Floor6Obstacles/door2.close(83,0.3)
		await $Floor6Obstacles/door.door_closed
		await $Floor6Obstacles/door2.door_closed
		$Player/Camera2D.add_trauma(0.2,4)
		$Floor6Obstacles/door.normal_position = $Floor6Obstacles/door.global_position
		$Floor6Obstacles/door2.normal_position = $Floor6Obstacles/door2.global_position
		Globals.checkpoint = Vector2(276, -4418)
	if $Player.position.y < -4024 and not body_dead:
		$Floor6Obstacles/DeadBody.death()
	if $Player.position.x > 1731 and not reached_run:
		reached_run = true
		$Floor6Obstacles/BreakingWall.restart()
		$Floor6Obstacles/BreakingWall.emitting = true
		$Floor6Obstacles/Level1Monster.start()
		$Audios/RunMusic1.play()
		$Audios/RunMusic2.play()
		$Audios/WallBreak.play()
		$Player/Camera2D.add_trauma(0.6,1)
		music($Audios/Piano4,'off')
		music($Audios/MonsterLoop,'off')
		music($Audios/RunMusic1,'on')
	if reached6 and $Player.position.x < 5662 and not monster_deleted:
		$Player/Camera2D.limit_left = $Floor6Obstacles/Level1Monster.global_position.x
		
	if floor1_button_count == 1:
		floor1_button_count = 0
		$Player/Camera2D.add_trauma(0.3,0.4)
		$Floor1Obstacles/DoorParticles.emitting = true
		$Floor1Obstacles/DoorParticles2.emitting = true
		$Floor1Obstacles/DoorParticles3.emitting = true
		$Floor1Obstacles/DoorParticles4.emitting = true
		$Audios/DoorOpen.play()
		$Floor1Obstacles/door.open(80,1)
		$Floor1Obstacles/door2.open(-80,1)
		await get_tree().create_timer(1).timeout
		$Player/Camera2D.add_trauma(0.3,4)
	
		
	if floor2_button_count == 2:
		floor2_button_count = 0

		$Player/Camera2D.add_trauma(0.3,0.4)
		$Floor2Obstacles/DoorParticles.emitting = true
		$Floor2Obstacles/DoorParticles2.emitting = true
		$Floor2Obstacles/DoorParticles3.emitting = true
		$Floor2Obstacles/DoorParticles4.emitting = true
		$Audios/DoorOpen.play()
		$Floor2Obstacles/door3.open(26,1)
		$Floor2Obstacles/door4.open(-26,1)
		await get_tree().create_timer(1).timeout
		$Player/Camera2D.add_trauma(0.3,4)
	
	if floor4_button_count == 2:
		floor4_button_count = 0
		$Player/Camera2D.add_trauma(0.3,0.4)
		$Floor4Obstacles/DoorParticles.emitting = true
		$Floor4Obstacles/DoorParticles2.emitting = true
		$Floor4Obstacles/DoorParticles3.emitting = true
		$Floor4Obstacles/DoorParticles4.emitting = true
		$Audios/DoorOpen.play()
		$Floor4Obstacles/door.open(-83,1)
		$Floor4Obstacles/door2.open(83,1)
		await get_tree().create_timer(1).timeout
		$Player/Camera2D.add_trauma(0.3,4)

	if floor5_button_count == 1:
		floor5_button_count = 0
		$Player/Camera2D.add_trauma(0.3,0.4)
		$Floor5Obstacles/DoorParticles.emitting = true
		$Floor5Obstacles/DoorParticles2.emitting = true
		$Floor5Obstacles/DoorParticles3.emitting = true
		$Floor5Obstacles/DoorParticles4.emitting = true
		$Audios/DoorOpen.play()
		$Floor5Obstacles/door.open(-83,1)
		$Floor5Obstacles/door2.open(83,1)
		await get_tree().create_timer(1).timeout
		$Player/Camera2D.add_trauma(0.3,4)
	
	
	$Level1Sky.position.x = $Player.position.x
	$Level1Wall.position.x = $Player.position.x
	$Level1Sky.position.y = $Player.position.y - $Player.position.y/50 
	$Level1Wall.position.y = $Player.position.y - $Player.position.y/1.5
	
func _on_area_2d_body_entered(body):
	body.death()
	floor1_button_count = 0
	floor2_button_count = 0
	floor4_button_count = 0
	floor5_button_count = 0
	if reached_run:
		$CanvasLayer/ColorRect.modulate = ("#ffffff")
		$Player/Camera2D.limit_left = -634
		music($Audios/RunMusic1,'off')
		music($Audios/Piano4,'on')
		music($Audios/MonsterLoop,'on')
		await get_tree().create_timer(2).timeout
		var tween = get_tree().create_tween()
		tween.tween_property($CanvasLayer/ColorRect,"modulate", Color(0,0,0,0), 1)



func music(audio1, a):
	var tween = get_tree().create_tween()
	if a == 'on':
		audio1.volume_db = -40
		tween.tween_property(audio1, "volume_db", 0, 1.5).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	if a == 'off':
		tween.tween_property(audio1, "volume_db", -80, 1.5).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN)

func _on_button_button_pressed():
	floor1_button_count += 1

func _on_button_2_button_pressed():
	floor2_button_count += 1
		
func _on_button_3_button_pressed():
	floor2_button_count += 1


func _on_button_4_button_pressed():
	floor4_button_count += 1


func _on_button_5_button_pressed():
	floor4_button_count += 1


func _on_button_6_button_pressed():
	floor5_button_count += 1


func _on_end_body_entered(body):
	$Player.ended = true
	$Player.visible = false
	Transition.change_scene("res://game/levels/between_levels.tscn")


func _on_level_1_monster_stomp():
	$Floor6Obstacles/Level1Monster/AudioStreamPlayer2D.play()
	$Player/Camera2D.add_trauma(0.4,1)


func _on_level_1_monster_player_entered(body):
	body.death()
	floor1_button_count = 0
	floor2_button_count = 0
	floor4_button_count = 0
	floor5_button_count = 0
	if reached_run:
		$CanvasLayer/ColorRect.modulate = ("#ffffff")
		$Player/Camera2D.limit_left = -634
		music($Audios/RunMusic1,'off')
		music($Audios/Piano4,'on')
		music($Audios/MonsterLoop,'on')
		await get_tree().create_timer(2).timeout
		var tween = get_tree().create_tween()
		tween.tween_property($CanvasLayer/ColorRect,"modulate", Color(0,0,0,0), 1)


func _on_cut_scene_body_entered(body):
	var tween = get_tree().create_tween()
	tween.set_parallel()
	#tween.tween_property($Player/Camera2D, "limit_top", -2396.167, 2).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property($Player/Camera2D, "limit_bottom", -3600, 0.5).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
	music($Audios/RunMusic1,'off')
	music($Audios/RunMusic2,'on')
	restartable = false
	$Audios/Fall.play()
	$Player.velocity.x = 0
	$Player.can_shoot = false
	monster_deleted = true
	$Player/Camera2D.position_smoothing_enabled = false
	await tween.finished
	$Floor6Obstacles/Level1Monster.queue_free()
	print($Player.position.y + 360)
	$Player/Camera2D.limit_top = -4610
	$Player/Camera2D.limit_bottom = 99999
