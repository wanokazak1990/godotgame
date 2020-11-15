extends KinematicBody2D

var speed = 300
var maxSpeed = 400
var jumpPower = -500
var gravity = 2000

var vel = Vector2()
onready var imagePlayer = get_node("Sprite")

func _physics_process(delta):
	
	vel.y += gravity * delta
	vel.x = 0
	if Input.is_action_pressed("player_left"):
		vel.x = -speed
		imagePlayer.flip_h = false
	elif Input.is_action_pressed("player_right"):
		vel.x  = speed
		imagePlayer.flip_h = true
	
	if Input.is_action_pressed("player_jump") && is_on_floor():
		vel.y = jumpPower

	vel = move_and_slide(vel, Vector2.UP)
	
