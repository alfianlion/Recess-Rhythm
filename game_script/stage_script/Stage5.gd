extends "res://game_script/BaseGame.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Stage 5 : Inherited from base")
	pass # Replace with function body.

func _on_Conductor_beat(position):
	song_position_in_beats = position
	print(position)
	if song_position_in_beats > 36:
		spawn_1_beat = 1
		spawn_2_beat = 0
		spawn_3_beat = 0
		spawn_4_beat = 1
	if song_position_in_beats > 53:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 0
		spawn_4_beat = 1
	if song_position_in_beats > 70:
		spawn_1_beat = 0
		spawn_2_beat = 1
		spawn_3_beat = 0
		spawn_4_beat = 1	
	if song_position_in_beats > 100:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 1
		spawn_4_beat = 1
	if song_position_in_beats > 131:
		spawn_1_beat = 0
		spawn_2_beat = 1
		spawn_3_beat = 1
		spawn_4_beat = 1	
	if song_position_in_beats > 155:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 1
		spawn_4_beat = 0	
	if song_position_in_beats > 185:
		spawn_1_beat = 0
		spawn_2_beat = 0
		spawn_3_beat = 0
		spawn_4_beat = 0
	if song_position_in_beats > 193:
		if get_tree().change_scene("res://game_scene/end_scene/End5.tscn") != OK:
			print ("Error changing scene to End")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
