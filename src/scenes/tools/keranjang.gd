extends Area2D


var bunga = null


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if Input.is_action_just_pressed("interact"):
		visible = true
		monitoring = true
	else:
		monitoring = false
		visible = false


func _on_Keranjang_body_entered(body):
	body.queue_free()
