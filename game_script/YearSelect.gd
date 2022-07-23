extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _unhandled_input(event):
	if event is InputEventKey:
		if Input.is_action_pressed("ui_accept"):
			get_tree().change_scene("res://game_scene/StageSelect.tscn")
#		if event.pressed and event.scancode == KEY_ESCAPE:
#			get_tree().quit()
