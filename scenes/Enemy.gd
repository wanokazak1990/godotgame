extends KinematicBody2D

var speed = 100
var maxSpeed = 400
var jumpPower = -800
var gravity = 2000
var deathHeight = 5000
var vel = Vector2()
onready var imageEnemy = get_node("AnimatedSprite")

var jumpCount = 0

const LEFT = "LEFT"
const RIGHT = "RIGHT"

var goto = LEFT

func _physics_process(delta):
	vel.y += gravity * delta
	vel.x = 0
	if goto == LEFT && $RayCastLeft.is_colliding():
		vel.x = -speed	
	elif goto == LEFT && not $RayCastLeft.is_colliding():
		goto = RIGHT
	
	if goto == RIGHT && $RayCastRight.is_colliding():
		vel.x = speed	
	elif goto == RIGHT && not $RayCastRight.is_colliding():
		goto = LEFT	
	
		
		
	
		
		
	
		
	
	animate()
	vel = move_and_slide(vel, Vector2.UP)
	
func animate():
	var anim = "idle"
	
	#if vel.y < 0 && not $RayCast2D.is_colliding():
	#	anim = "jump_up"
	#elif vel.y > 0 and not $RayCast2D.is_colliding():
	#	anim = "jump_down"
	#else:
	#	if vel.x != 0:
	#		anim = "run"
	#if imageEnemy.animation != anim:
	imageEnemy.play(anim)
