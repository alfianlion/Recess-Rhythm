extends AudioStreamPlayer 


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var audioStream: AudioStreamMP3 = preload("res://assets/music/Voxel Revolution (1).mp3")
	self.set_stream(audioStream)
	self.set_volume_db(3.0)
	self.play(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
