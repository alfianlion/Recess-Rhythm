extends "res://game_script/BaseGame.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Stage 2 : Inherit from base")
	pass # Replace with function body.

func _spawn_notes(to_spawn):
	if to_spawn > 0:
		lane = randi() % 3
		instance = note.instance()
		instance.initialize(lane)
		add_child(instance)
	if to_spawn > 1:
		while rand == lane:
			rand = randi() % 3
		lane = rand
		instance = note.instance()
		instance.initialize(lane)
		add_child(instance)
		
func _on_Conductor_measure(position):
	if position == 1:
		_spawn_notes(spawn_1_beat)
	elif position == 2:
		_spawn_notes(spawn_2_beat)
	elif position == 3:
		_spawn_notes(spawn_3_beat)
	elif position == 4:
		_spawn_notes(spawn_4_beat)
		
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
		spawn_1_beat = 0
		spawn_2_beat = 1
		spawn_3_beat = 0
		spawn_4_beat = 1
	if song_position_in_beats > 420:
		spawn_1_beat = 1
		spawn_2_beat = 0
		spawn_3_beat = 0
		spawn_4_beat = 1	
	if song_position_in_beats > 450:
		spawn_1_beat = 0
		spawn_2_beat = 0
		spawn_3_beat = 0
		spawn_4_beat = 1
	if song_position_in_beats > 475:
		spawn_1_beat = 0
		spawn_2_beat = 0
		spawn_3_beat = 0
		spawn_4_beat = 0
	if song_position_in_beats > 490 and score >= 50:
		get_tree().change_scene("res://game_scene/end_scene/End2.tscn")
	if song_position_in_beats > 490 and score < 50:
		get_tree().change_scene("res://game_scene/StageSelect.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
