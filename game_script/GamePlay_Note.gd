extends Area2D

const TARGET_X = 111
const SPAWN_X = 1000
const DIST_TO_TARGET = SPAWN_X - TARGET_X

const UP_LANE_SPAWN = Vector2(SPAWN_X, 70)
const CENTER_LANE_SPAWN = Vector2(SPAWN_X, 140)
const BOTTOM_LANE_SPAWN = Vector2(SPAWN_X, 210)

var speed = 0
var hit = false; 

func _physics_process(delta):
	position.x -= speed * delta
	if position.x < -50:
		queue_free()
		get_parent()._note_pass()

func initialize(lane):
	if lane == 0:
		$AnimatedSprite.frame = 0
		position = UP_LANE_SPAWN
	elif lane == 1:
		$AnimatedSprite.frame = 1
		position = CENTER_LANE_SPAWN
	elif lane == 2:
		$AnimatedSprite.frame = 2
		position = BOTTOM_LANE_SPAWN
	else:
		return
	
	speed = DIST_TO_TARGET * 0.7
	
func _on_CollisionShape2D_item_rect_changed():
	get_parent()._increment_score(1)

func _on_Timer_timeout():
	queue_free()
	
func destroy(score):
	hit = true
