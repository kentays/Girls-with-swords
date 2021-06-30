extends "jab.gd"

export var jumpForce : int = 300

func enter():
	.enter()
	owner.grounded = false
	owner.vel.y = -1 * jumpForce
	
func handle_input(_event: InputEvent):
	pass
	
func _on_animation_finished():
	emit_signal("finished", "fall")
