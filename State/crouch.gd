extends "state.gd"

func enter():
	owner.get_node("AnimatedSprite").play("Crouch")

func handle_input(event):
	if event.is_action_released(input_dict["crouch"]):
		emit_signal("finished", "idle")