extends Node2D


func _ready():
	$AnimatedSprite.play()
	print("Spawning dust")
	
func flip_right():
	$AnimatedSprite.flip_h = true
	
func _on_AnimatedSprite_animation_finished():
	print("Destroying dust")
	queue_free()
