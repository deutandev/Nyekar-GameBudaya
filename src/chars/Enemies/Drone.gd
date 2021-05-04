extends KinematicBody2D


onready var animationPlayer = $saber/AnimationPlayer

export var enemyHP = 50

var run_speed = 200
var velocity = Vector2.ZERO
var player = null
var curAnim = "attackLeft"


func _physics_process(delta):
	velocity = Vector2.ZERO
	if player:
		velocity = position.direction_to(player.position) * run_speed
	velocity = move_and_slide(velocity)
	
	if velocity.x > 0:
		$AnimatedSprite.flip_h = true
		curAnim = "attackRight"
		animationPlayer.play("attackRight")
	elif velocity.x < 0:
		$AnimatedSprite.flip_h = false
		curAnim = "attackLeft"
		animationPlayer.play("attackLeft")
	else:
		animationPlayer.stop()

func handle_hit(damage):
	# print(enemyHP)
	enemyHP -= damage
	if enemyHP <= 0:
		queue_free()


func _on_DetectRadius_body_entered(body):
	player = body
	return player


func _on_DetectRadius_body_exited(body):
	player = null
