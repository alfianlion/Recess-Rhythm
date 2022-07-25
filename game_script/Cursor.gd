extends Area2D

# Declare member variables here. Examples:
var can_move = true

const MAX_Y = 222
const MIN_Y = 98
const MOVE_TIME = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	_get_input()

func _get_input():
	if Input.is_action_just_pressed("move"):
		if can_move:
			_move()
			
func _move():
	$Tween.interpolate_property(self, "position", position,
								Vector2(position.x, clamp(get_global_mouse_position().y, MIN_Y, MAX_Y)), 
								MOVE_TIME)
	$Tween.start()
	can_move = false
	
func _on_Tween_tween_completed(_object, _key):
	can_move = true
	

func _on_Cursor_area_entered(area):
	if (area.is_in_group("Note")):
		area.queue_free()
