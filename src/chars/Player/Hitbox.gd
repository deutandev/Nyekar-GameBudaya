extends KinematicBody2D




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func handle_hit(damage):
	# print(playerHP)
	Global.playerHP -= damage
	if Global.playerHP <= 0:
		get_parent().queue_free()
