extends "state.gd"

func enter():
	owner.sprite.play("Neutral")
	owner.stand()
	
	if Input.is_action_pressed(input_dict["crouch"]):
		emit_signal("finished", "crouch")
	
	elif Input.is_action_pressed(input_dict["move_right"]):
		emit_signal("finished", "walk")
	
	elif Input.is_action_pressed(input_dict["move_left"]):
		emit_signal("finished", "walk")
		
	elif Input.is_action_pressed(input_dict["jump"]):
		emit_signal("finished", "jump")
	
func handle_input(event):
	if event.is_action_pressed(input_dict["jump"]):
		emit_signal("finished", "jump")
	
	elif event.is_action_pressed(input_dict["punch"]):
		emit_signal("finished", "jab")
		
	elif event.is_action_pressed(input_dict["slash"]):
		emit_signal("finished", "slash")	
			
	elif event.is_action_pressed(input_dict["crouch"]):
		emit_signal("finished", "crouch")
		
	elif event.is_action_pressed(input_dict["move_right"]):
		emit_signal("finished", "walk")
	
	elif event.is_action_pressed(input_dict["move_left"]):
		emit_signal("finished", "walk")
		
