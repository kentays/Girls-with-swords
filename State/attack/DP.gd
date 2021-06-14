extends "jab.gd"

export var jumpForce : int = 400
export var MOVE_SPEED : int = 50

func enter():
	owner.vel.y = -1 * jumpForce
	.enter()
	
func handle_input(event):
	pass
	
func update(delta):
	var mod = -1
	if owner.facing_right:
		mod = 1
	owner.vel.x = mod * MOVE_SPEED
	.update(delta)
	
func _on_animation_finished():
	emit_signal("finished", "fall")
