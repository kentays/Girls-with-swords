extends AudioStreamPlayer


var hit_sfx: AudioStream
var block_sfx: AudioStream
var knockdown_sfx: AudioStream


# Called when the node enters the scene tree for the first time.
func _ready():
	hit_sfx = preload("res://Sounds/hit.ogg")
	block_sfx = preload("res://Sounds/block.ogg")
	knockdown_sfx = preload("res://Sounds/bassdrop.ogg")

func hit():
	self.set_stream(hit_sfx)
	play()
	
func block():
	self.set_stream(block_sfx)
	play()

func knockdown():
	self.set_stream(knockdown_sfx)
	self.play()
