extends "hit_state.gd"

func enter():
	.enter()
	owner.block()

func receive_hit(height):
	if height == "high":
		emit_signal("finished", "hitstun")
	else:
		print("Blockstring")
		owner.get_node("AnimatedSprite").set_frame(0)
	
func _on_animation_finished():
	emit_signal("finished", "crouch")
