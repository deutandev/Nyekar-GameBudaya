extends KinematicBody2D


export var speed = 300
export var friction = 10
export var acceleration = 60

var velocity = Vector2()

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree

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
	var direction = get_input()
	if direction.length() > 0:
		if direction.x > 0:
			animationPlayer.play("runRight")
		elif direction.x < 0:
			animationPlayer.play("runLeft")
		elif direction.y != 0:
			animationPlayer.play("runRight")
		velocity = lerp(velocity, direction.normalized() * speed, acceleration * delta)
	else:
		animationPlayer.play("idleRight")
		velocity = lerp(velocity, Vector2.ZERO, friction * delta)
	velocity = move_and_slide(velocity)
