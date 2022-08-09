extends Node2D

var BPM = 122
const MAX_Y = 210
const MIN_Y = 70

var score = 0
var max_combo = 0
var combo = 0
var time = 0.0
var great = 0
var good = 0
var okay = 0
var missed = 0

var note = load("res://game_scene/GamePlay_Note.tscn")

var lane = 0
var rand = 0

var song_position = 0.0
var song_position_in_beats = 0
var last_spawned_beat = 0
var sec_per_beat = 60.0 / BPM

var spawn_1_beat = 0
var spawn_2_beat = 0
var spawn_3_beat = 1
var spawn_4_beat = 0

var screen_size
var instance
var player


func _ready():
	screen_size = get_viewport_rect().size
	randomize()
	$Conductor.play_from_beat(0,2)		
	
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
#	print(position)
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
	if song_position_in_beats > 396:
		spawn_1_beat = 0
		spawn_2_beat = 0
		spawn_3_beat = 0
		spawn_4_beat = 0
	if song_position_in_beats > 404 and score >= 100:
		get_tree().change_scene("res://Scenes/End.tscn")
	if song_position_in_beats > 404 and score < 100:
		get_tree().change_scene("res://game_scene/StageSelect.tscn")
		
func increment_score(val):
	score += val * 1
	$Score.text = "Score to clear: 50 Score: " + str(score)

func _note_pass():
	pass

