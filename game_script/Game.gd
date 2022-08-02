extends Node2D

const BPM = 100
const MAX_Y = 210
const MIN_Y = 70

var score = 0
var combo = 0
var time = 0.0

var note = load("res://game_scene/GamePlay_Note.tscn")
var music = load("res://game_scene/MusicPlayer.tscn")

var lane = 0
var rand = 0

var spawn_1_beat = 0
var spawn_2_beat = 0
var spawn_3_beat = 1
var spawn_4_beat = 0

var screen_size
var instance
var player


func _ready():
	screen_size = get_viewport_rect().size
	$Conductor.play_from_beat(0,0)
	$NoteTimer.wait_time = 60.0 / BPM
	$SpawnTimer.wait_time = 2.0
	$NoteTimer.start()

func _process(delta):
	# Compensate for output latency.
	time -= AudioServer.get_output_latency()
	
func _on_SpawnTimer_timeout():
	$SpawnTimer.start()

func _on_NoteTimer_timeout():
	pass
	
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
	
func increment_score(val):
	score += val * 1
	$Score.text = "Score: " + str(score)

func _note_pass():
	pass

func _on_Cursor_body_entered(body):
	print(body.name)
	if body.name == "Cursor":
		increment_score(1)
		print("HIT")
	else:
		_note_pass()
