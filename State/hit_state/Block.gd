extends "hit_state.gd"

func enter():
	.enter()
	owner.block()

func receive_hit(height: String):
	if height == "low":
		emit_signal("finished", "hitstun")
	else:
		print("Blockstring")
		owner.block()
