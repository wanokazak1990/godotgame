extends KinematicBody2D

var speed = 500
var maxSpeed = 400
var jumpPower = -1000
var gravity = 2000

var vel = Vector2()
onready var imagePlayer = get_node("Sprite")

func _physics_process(delta):
	
	vel.y += gravity * delta
	vel.x = 0
	if Input.is_action_pressed("player_left"):
		vel.x = -speed
		imagePlayer.flip_h = true
	elif Input.is_action_pressed("player_right"):
		vel.x  = speed
		imagePlayer.flip_h = false
	if Input.is_action_pressed("player_jump") && is_on_floor():
		vel.y = jumpPower
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
			
	
