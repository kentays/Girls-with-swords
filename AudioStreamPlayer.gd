extends AudioStreamPlayer


var hit_sfx: AudioStream
var block_sfx: AudioStream
var knockdown_sfx: AudioStream
var whiff_sfx: AudioStream
var jump_sfx: AudioStream
var dash_sfx: AudioStream
var landing_sfx: AudioStream
var walk_sfx: AudioStream


# Called when the node enters the scene tree for the first time.
func _ready():
	hit_sfx = preload("res://Sounds/clap.ogg")
	block_sfx = preload("res://Sounds/block.ogg")
	knockdown_sfx = preload("res://Sounds/knockdown.ogg")
	whiff_sfx = preload("res://Sounds/whiff.ogg")
	jump_sfx = preload("res://Sounds/jump.ogg")
	dash_sfx = preload("res://Sounds/dash.ogg")
	landing_sfx = preload("res://Sounds/landing.ogg")
	walk_sfx = preload("res://Sounds/walk.ogg")

func hit():
	self.set_stream(hit_sfx)
	play()
	
func block():
	self.set_stream(block_sfx)
	play()

func knockdown():
	self.set_stream(knockdown_sfx)
	self.play()
	
func whiff():
	self.set_stream(whiff_sfx)
	self.play()
	
func jump():
	self.set_stream(jump_sfx)
	self.play()
	
func dash():
	self.set_stream(dash_sfx)
	self.play()
	
func land():
	self.set_stream(landing_sfx)
	self.play()
	
func walk():
	self.set_stream(walk_sfx)
	self.play()
	
func hadouken():
	pass
