extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Keranjang_body_entered(body):
	if Input.is_action_just_pressed("interact"):
		if body.is_in_group("bunga"):
			body.queue_free()
