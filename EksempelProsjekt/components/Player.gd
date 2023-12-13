extends CharacterBody2D

const ACCELERATION = 30.0
const MAX_SPEED = 400.0
const JUMP_VELOCITY = -500.0
var has_double_jump = true
var disable_movement_until = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
	animateSprite()

func _physics_process(delta):		
	handle_horizontal_movement()
	handle_gravity(delta)
	reset_jumps()
	handle_jump()
	move_and_slide()
	
func reset_jumps():
	if is_on_floor():
		has_double_jump = true
		
func handle_horizontal_movement():
	var direction = Input.get_axis("ui_left", "ui_right")	
	if Time.get_ticks_msec() > disable_movement_until:
		if direction != 0:
			velocity.x += direction * ACCELERATION
			if velocity.x > MAX_SPEED:
				velocity.x = MAX_SPEED
			elif velocity.x < -MAX_SPEED:
				velocity.x = -MAX_SPEED
		elif velocity.x * direction <= 0:
			if is_on_floor():
				velocity.x *= 0.6
			else:
				velocity.x *= 0.85
			if velocity.x < 100:
				velocity.x = 0
	
	
func handle_jump():
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			$AudioStreamPlayer.play()
		elif is_on_wall():
			$AudioStreamPlayer.play()
			var direction = Input.get_axis("ui_left", "ui_right")
			velocity.y = JUMP_VELOCITY
			velocity.x = direction * MAX_SPEED * -1
			disable_movement_until = Time.get_ticks_msec() + 200
		elif has_double_jump:
			velocity.y = JUMP_VELOCITY
			has_double_jump = false
			$AudioStreamPlayer.play()


func handle_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if is_on_wall():
		velocity.y *= 0.9
	
func animateSprite():
	if velocity.x > 0:
		$Sprite2D.flip_h = false
	if velocity.x < 0:
		$Sprite2D.flip_h = true
		
	if is_on_floor():
		if absf(velocity.x) > 0.1:
			$Sprite2D.play("run")
			$Sprite2D.play
		else:
			$Sprite2D.play("idle")
	else:
		if velocity.y < 0 and $Sprite2D.animation != "jump":
			$Sprite2D.play("jump")
		elif velocity.y > 0 and $Sprite2D.animation != "fall":
			$Sprite2D.play("fall")
