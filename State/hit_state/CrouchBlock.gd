extends "hit_state.gd"

func enter():
	.enter()
	owner.block()

func receive_hit(height: String):
	if height == "high":
		emit_signal("finished", "hitstun")
	else:
		print("Blockstring")
		owner.block()
	
func _on_animation_finished():
	emit_signal("finished", "crouch")
