extends KinematicBody2D

var speed = 500
var maxSpeed = 400
var jumpPower = -800
var gravity = 2000
var deathHeight = 5000
var vel = Vector2()
onready var imagePlayer = get_node("Sprite")
var jumpCount = 0

func _physics_process(delta):
	
	vel.y += gravity * delta
	vel.x = 0
	if Input.is_action_pressed("player_left"):
		vel.x = -speed
		imagePlayer.flip_h = true
	elif Input.is_action_pressed("player_right"):
		vel.x  = speed
		imagePlayer.flip_h = false
	if Input.is_action_just_pressed("player_jump") && $RayCast2D.is_colliding():
		jumpCount=1
		vel.y = jumpPower
	if Input.is_action_just_pressed("player_jump") && not $RayCast2D.is_colliding() && jumpCount == 1:
		jumpCount = 0
		vel.y = jumpPower
	if Input.is_action_pressed("player_down") && not $RayCast2D.is_colliding():
		vel.y = 1500
		
	
	animate()
	vel = move_and_slide(vel, Vector2.UP)
	
	
func animate():
	var anim = "idle"
	
	if vel.y < 0 && not $RayCast2D.is_colliding():
		anim = "jump_up"
	elif vel.y > 0 and not $RayCast2D.is_colliding():
		anim = "jump_down"
	else:
		if vel.x != 0:
			anim = "run"
	if imagePlayer.animation != anim:
		imagePlayer.play(anim)
			
func checkDown():
	if vel.y > deathHeight:
		vel.x = 0
		vel.y = -5000
	
