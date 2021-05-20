extends "state.gd"

func enter():
	owner.get_node("AnimatedSprite").play("Neutral")
	
func handle_input(event):
	if event.is_action_pressed(input_dict["jump"]):
		emit_signal("finished", "jump")
	
	elif event.is_action_pressed(input_dict["punch"]):
		emit_signal("finished", "jab")
		
	elif event.is_action_pressed(input_dict["crouch"]):
		emit_signal("finished", "crouch")
		
	elif event.is_action_pressed(input_dict["move_right"]) \
	or event.is_action_pressed(input_dict["move_left"]):
		emit_signal("finished", "run")
