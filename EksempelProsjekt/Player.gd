extends KinematicBody2D

const UP = Vector2(0, -1);
const JUMP = -500
const SPEED = 175
const GRAVITY = 20

var motion = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):

	motion.y += GRAVITY
	
	if motion.x > 0:
		$Sprite.flip_h = false
	if motion.x < 0:
		$Sprite.flip_h = true
		
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	else:
		motion.x = 0
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP
			
		elif motion.x != 0:
			$Sprite.play("run")
		else:
			$Sprite.play("idle")
	else:
		if motion.y < 0:
			$Sprite.play("jump")
		else:
			$Sprite.play("fall")
		
	motion = move_and_slide(motion, UP)
