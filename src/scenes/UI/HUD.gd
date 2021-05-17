extends Control


onready var hpbar = $HPLabel/HPBar
onready var kembangBar = $BungaLabel/Kembang

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var playerHP = Global.playerHP
	var jmlKembang = Global.bunga
	hpbar.value = playerHP
	kembangBar.value = jmlKembang
	if jmlKembang >= 20:
		$BungaLabel/Kembang.visible = false
		$BungaLabel.text = "Kembang sudah cukup"
