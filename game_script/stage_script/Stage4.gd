extends "res://game_script/BaseGame.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Conductor.play_from_beat(30,2)
	print("Stage 4 : Inherited from base")
	pass # Replace with function body.

func _on_Conductor_beat(position):
	song_position_in_beats = position
	print(position)
	if song_position_in_beats > 36:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 1
		spawn_4_beat = 1
	if song_position_in_beats > 98:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 1
		spawn_4_beat = 0
	if song_position_in_beats > 132:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 0
		spawn_4_beat = 1
	if song_position_in_beats > 162:
		spawn_1_beat = 0
		spawn_2_beat = 1
		spawn_3_beat = 1
		spawn_4_beat = 0
	if song_position_in_beats > 194:
		spawn_1_beat = 1
		spawn_2_beat = 0
		spawn_3_beat = 0
		spawn_4_beat = 1
	if song_position_in_beats > 228:
		spawn_1_beat = 1
		spawn_2_beat = 0
		spawn_3_beat = 1
		spawn_4_beat = 1
	if song_position_in_beats > 258:
		spawn_1_beat = 0
		spawn_2_beat = 1
		spawn_3_beat = 0
		spawn_4_beat = 1
	if song_position_in_beats > 288:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 0
		spawn_4_beat = 0
	if song_position_in_beats > 322:
		spawn_1_beat = 0
		spawn_2_beat = 1
		spawn_3_beat = 1
		spawn_4_beat = 0
	if song_position_in_beats > 388:
		spawn_1_beat = 1
		spawn_2_beat = 0
		spawn_3_beat = 0
		spawn_4_beat = 0
	if song_position_in_beats > 396:
		spawn_1_beat = 0
		spawn_2_beat = 0
		spawn_3_beat = 0
		spawn_4_beat = 0
	if song_position_in_beats > 404 and score >= 50:
		get_tree().change_scene("res://game_scene/end_scene/End4.tscn")
	if song_position_in_beats > 404 and score < 50:
		get_tree().change_scene("res://game_scene/StageSelect.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
