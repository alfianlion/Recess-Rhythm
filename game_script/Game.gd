extends Node2D

const BPM = 100
const MAX_Y = 222
const MIN_Y = 98
var screen_size

var note = load("res://game_scene/GamePlay_Note.tscn")
var instance

var score = 0

func _ready():
	screen_size = get_viewport_rect().size
	$NoteTimer.wait_time = 60.0 / BPM
	$SpawnTimer.wait_time = 2.0
	$NoteTimer.start()

func _on_SpawnTimer_timeout():
	$SpawnTimer.start()

func _on_NoteTimer_timeout():
	instance = note.instance()
	instance.position.y = randi() % (int(screen_size.y * 0.5) + int(screen_size.y / 60)) - int(screen_size.y / 60)
	instance.position.x = 1000
	add_child(instance)
	
func increment_score(val):
	score += val
	$Score.text = "Score: " + str(score)

func _note_pass():
	pass
