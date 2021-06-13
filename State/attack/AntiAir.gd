extends "jab.gd"

export var jumpForce : int = 300

func enter():
	owner.whiff()
	owner.get_node("AnimatedSprite").play("2H")
	owner.vel.y = -1 * jumpForce
	
func handle_input(event):
	pass
	
func _on_animation_finished():
	emit_signal("finished", "fall")
