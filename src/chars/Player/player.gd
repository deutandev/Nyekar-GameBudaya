extends KinematicBody2D


export var speed = 300
export var friction = 10
export var acceleration = 60

var velocity = Vector2()
var cur_anim = "runRight"

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationKeris = $KerisHandler/AnimationPlayer
onready var imgKeris = $KerisHandler/Keris/Sprite
onready var keranjang = $Keranjang


func get_input():
	var input = Vector2()
	if Input.is_action_pressed('right'):
		input.x += 1
	if Input.is_action_pressed('left'):
		input.x -= 1
	if Input.is_action_pressed('down'):
		input.y += 1
	if Input.is_action_pressed('up'):
		input.y -= 1
	return input

func _physics_process(delta):
	var cur_playerHP = Global.playerHP
	var direction = get_input()
	if direction.length() > 0:
		if direction.x > 0:
			animationPlayer.play("runRight")
			cur_anim = "runRight"
		elif direction.x < 0:
			animationPlayer.play("runLeft")
			cur_anim = "runLeft"
		elif direction.y != 0:
			animationPlayer.play(cur_anim)
		velocity = lerp(velocity, direction.normalized() * speed, acceleration * delta)
	else:
		if cur_anim == "runRight":
			animationPlayer.play("idleRight")
		else:
			animationPlayer.play("idleLeft")
		velocity = lerp(velocity, Vector2.ZERO, friction * delta)
	velocity = move_and_slide(velocity)
	
	if Input.is_action_pressed("attack"):
		imgKeris.visible = true
		$KerisHandler/Keris.monitoring = true
		if cur_anim == "runRight":
			animationKeris.play("attackRight")
		else:
			animationKeris.play("attackLeft")
	elif Input.is_action_just_released("attack"):
		yield(animationKeris, "animation_finished")
		imgKeris.visible = false

	if cur_playerHP <= 0:
		Global.goto_scene("res://src/scenes/levels/Menu.tscn")
	##if Input.is_action_just_pressed("interact"):
		##keranjang.visible = true
	##elif Input.is_action_just_released("interact"):
	##	keranjang.visible = false

