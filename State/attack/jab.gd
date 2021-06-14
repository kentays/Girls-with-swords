extends "BaseAttack.gd"
			
func handle_input(event):
	if hit_connect and event.is_action_pressed(input_dict["jump"]):
		emit_signal("finished", "jump")
	elif hit_connect and event.is_action_pressed(input_dict["slash"]):
		emit_signal("finished", "slash")	
		
func _on_animation_finished():
	emit_signal("finished", "idle")
