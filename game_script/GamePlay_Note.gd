extends Area2D

var speed = 100

func _physics_process(delta):
	position.x -= speed * delta
	if position.x < -50:
		speed = 0
		get_parent()._note_pass()
