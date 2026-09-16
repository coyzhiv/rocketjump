extends CharacterBody2D

signal shot(pos)
signal just_died()
var can_fall: bool = true
var can_shoot: bool = true
var can_dash: bool = true
var can_can_reload = true
var can_cannot_reload = true
var can_die: bool = true
var die_shoot: bool = false
var ended: bool = false
var can_can_dash: bool = true
var shoot_position_y: float
var hit_the_ground: bool = false
var can_can_fall: bool = true

var max_velocity = 2000



func _process(delta):
	move_and_slide()
	if not is_on_floor():
		velocity.y += 1000*delta
	if is_on_floor():
		if velocity.x > 0:
			velocity.x -= 1000*delta
		if velocity.x < 0:
			velocity.x += 1000*delta
		if velocity.x > -50 and velocity.x < 50:
			velocity.x = 0
	
	if velocity.y > max_velocity:
		velocity.y = max_velocity
	if velocity.x > max_velocity:
		velocity.x = max_velocity
	
	if is_on_floor() and not hit_the_ground:
		if can_fall:
			velocity.x /= 2
			hit_the_ground = true
			can_fall = false
			$Audios/Fall.play()
			$Particles/LandingParticles.restart()
			$Particles/LandingParticles.emitting = true
			#await get_tree().create_timer(0.3).timeout
			#can_fall = true
	if not is_on_floor():
		hit_the_ground = false
		if can_can_fall:
			can_can_fall = false
			await get_tree().create_timer(0.3).timeout
			can_fall = true
			can_can_fall = true
	

	if not ended:
		if (get_global_mouse_position().x - global_position.x) < 0:
			$Sprite2D.flip_h = true
		if (get_global_mouse_position().x - global_position.x) > 0:
			$Sprite2D.flip_h = false
		if velocity == Vector2.ZERO:
			$AnimationPlayer.play("idle")
		if velocity != Vector2.ZERO:
			$AnimationPlayer.stop(false)
		if velocity.y >=200:
			$Sprite2D.frame = 4
		elif not $AnimationPlayer.is_playing():
			$Sprite2D.frame = 0
		
		if Input.is_action_just_pressed("shoot") and can_shoot and not Globals.gun_empty and not die_shoot:
			shoot_position_y = position.y
			velocity = (get_global_mouse_position()-global_position).normalized() * -450
			shot.emit($Gun/Marker2D.global_position)
			Globals.bullet_count -= 1
			can_shoot = false
			await get_tree().create_timer(0.1).timeout
			can_shoot = true

		if Input.is_action_just_pressed("dash") and can_dash:
			$Audios/Dash.play()
			velocity = (get_global_mouse_position()-global_position).normalized() * 700
			can_dash = false
			$Particles/DashParticles2.restart()
			$Particles/DashParticles2.emitting = true
			can_can_dash = false
			await get_tree().create_timer(0.1).timeout
			can_can_dash = true
		
		
		if Input.is_action_just_pressed("reload") and $Gun.can_reload and $Gun.can_can_reload:
			$Gun.reload()
		if $LandingArea2.has_overlapping_bodies() and not die_shoot:
			$Gun.can_reload = true
		else:
			$Gun.can_reload = false
		
		if $LandingArea2.has_overlapping_bodies() and can_can_dash:
			can_dash = true
			
		
		$Sprite2D.scale.y = 1.3 + velocity.y/5000
		$Sprite2D.scale.x = 1.3 + velocity.y/-5000
		#if not $LandingArea2.has_overlapping_bodies():
			#$Sprite2D.scale.y = remap(abs(linear_velocity.y),0,abs(position.y - shoot_position_y), 0.75, 1.75)
			#$Sprite2D.scale.x = remap(abs(linear_velocity.y),0,abs(position.y - shoot_position_y), 1.25, 0.75)
		
			
func death():
	if can_die:
		just_died.emit()
		$Audios/Death.play()
		can_dash = false
		$LightOccluder2D.visible = false
		$Sprite2D.visible = false
		$Gun.visible = false
		die_shoot = true
		can_fall = false
		can_die = false
		$CollisionPolygon2D.set_deferred("disabled", true)
		$Particles/DeathParticles.emitting = true
		var tween = get_tree().create_tween()
		tween.tween_property($".","global_position", Globals.checkpoint, 1).set_trans(Tween.TRANS_EXPO)
		await tween.finished
		for button in get_tree().get_nodes_in_group("Buttons"):
			button.reset()
		velocity = Vector2.ZERO
		Globals.bullet_count = Globals.bullet_count_max
		$Sprite2D.visible = true
		$Gun.visible = true
		die_shoot = false
		can_fall = true
		can_die = true
		$CollisionPolygon2D.set_deferred("disabled", false)
		$LightOccluder2D.visible = true
		
	
#func _physics_process(delta):
	#
	#if get_slide_collision_count() > 0:
		#var collision = get_slide_collision(0)
		#if collision != null:
			#velocity = velocity.bounce(collision.get_normal())
			#velocity.x *= 0.1
			#velocity.y *= 0.1


#
#
func _on_landing_area_2_body_entered(body):
	if body.has_method("fall"):
			body.fall()
