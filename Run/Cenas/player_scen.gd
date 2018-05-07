extends KinematicBody2D


const UP = Vector2(0,-1)
var motion = Vector2()

#constants
const GRAVITY 		= 20
const SPEED   		= 50
const JUMP_HEIGHT   = -500
const MAX_Speed 	= 250
func _physics_process(delta):
	
	#gravity
	motion.y+=GRAVITY
	var friction = false
	
	#Move Player
	if Input.is_action_pressed("ui_right"):
		#motion.x += SPEED
		motion.x = min(motion.x+SPEED,MAX_Speed)
		$Sprite.flip_h = false
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		#motion.x = -SPEED
		motion.x = max(motion.x-SPEED,-MAX_Speed)
		$Sprite.flip_h = true
		$Sprite.play("Run")
	else:
		#motion.x = 0
		#motion.x = lerp(motion.x,0,0.2)
		friction = true
		$Sprite.play("Idle")
		
	if is_on_floor():
		if friction:
			motion.x = lerp(motion.x,0,0.2)
		
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
	else:
		if motion.y <0:
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
		if friction:
			motion.x = lerp(motion.x,0,0.2)
	#print(motion)
	motion = move_and_slide(motion,UP)