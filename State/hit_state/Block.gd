extends "hit_state.gd"

func enter():
	.enter()
	owner.block()

func receive_hit(height: String):
	if height == "low" and not Input.is_action_pressed(input_dict["crouch"]):
		emit_signal("finished", "hitstun")
	elif height == "high" and Input.is_action_pressed(input_dict["crouch"]):
		emit_signal("finished", "hitstun")
	else:
		print("Blockstring")
		owner.block()
	owner.get_parent().hitstop()
		
func damage(_dmg: int):
	pass
