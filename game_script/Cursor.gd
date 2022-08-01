extends Area2D

# Declare member variables here. Examples:
var can_move = true
var screen_size

const MAX_Y = 210
const MIN_Y = 70
const MOVE_TIME = 0.25

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	_move()

func _move():
	if can_move:
		var motion_vector = Vector2()
		if Input.is_action_pressed("ui_up"):
			motion_vector += Vector2( 0, -1)
		if Input.is_action_pressed("ui_down"):
			motion_vector += Vector2( 0, 1)
		if Input.is_action_pressed("ui_left"):
			motion_vector += Vector2( -1, 0)
		if Input.is_action_pressed("ui_right"):
			motion_vector += Vector2( 1, 0)

		if motion_vector != Vector2():
			#tile_size is the size of the tilemap in pixels.
			var new_position = position + motion_vector * MIN_Y
			#Yes. I'm assuming you have a Tween node as a child.
			$Tween.interpolate_property (self, 'position', position, 
										Vector2(position.x, clamp(new_position.y,  MIN_Y, MAX_Y)), 
										MOVE_TIME, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			#That last method's fifth property is how long it takes to go from one tile to the other in seconds.
			$Tween.start()
			can_move = false
			print(new_position.y)
	
func _on_Tween_tween_completed(_object, _key):
	can_move = true
	

func _on_Cursor_area_entered(area):
	if (area.is_in_group("Note")):
		area.queue_free()
