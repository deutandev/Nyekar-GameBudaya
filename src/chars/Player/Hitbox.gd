extends KinematicBody2D


export var playerHP = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func handle_hit(damage):
	print(playerHP)
	playerHP -= damage
	if playerHP <= 0:
		get_parent().queue_free()
