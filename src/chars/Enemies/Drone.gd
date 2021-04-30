extends KinematicBody2D


export var enemyHP = 50


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func handle_hit(damage):
	# print(enemyHP)
	enemyHP -= damage
	if enemyHP <= 0:
		queue_free()
