extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var dialog = Dialogic.start("Prolog")
	add_child(dialog)

#func after_dialog(timeline_name):
#	Global.goto_scene("res://src/scenes/levels/level01.tscn")
