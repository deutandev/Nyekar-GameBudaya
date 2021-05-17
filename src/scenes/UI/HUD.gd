extends Control


onready var hpbar = $HPLabel/HPBar

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var playerHP = Global.playerHP
	$HPLabel.text = "Player HP: " + str(Global.playerHP)
	$BungaLabel.text = "Jumlah Kembang: " + str(Global.bunga) + "/20"
	hpbar.value = playerHP
