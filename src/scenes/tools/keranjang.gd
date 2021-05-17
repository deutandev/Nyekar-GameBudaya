extends Area2D


var bunga = null
onready var timer = $PickTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if Input.is_action_pressed("interact"):
		visible = true
		$ProgressBar.value += 1.5
		# monitoring = true
	else:
		timer.stop()
		monitoring = false
		visible = false
		$ProgressBar.value = 0
	if Input.is_action_just_pressed("interact"):
		timer.start()
		print("start")


func _on_Keranjang_body_entered(body):
	if body.is_in_group("bunga"):
		body.queue_free()
		Global.bunga += 1


func _on_PickTimer_timeout():
	monitoring = true
	print(monitoring)
