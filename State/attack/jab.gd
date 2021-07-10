extends "BaseAttack.gd"
			
func handle_input(event: InputEvent):
	if hit_connect:
		print("Attempting to gatling...")
		if event.is_action_pressed(input_dict["jump"]):
			emit_signal("finished", "jump")
		elif event.is_action_pressed(input_dict["kick"]):
			print("Gatling to kick")
			emit_signal("finished", "kick")	
		elif event.is_action_pressed(input_dict["slash"]):
			print("Gatling to slash")
			emit_signal("finished", "slash")	
		
func _on_animation_finished():
	emit_signal("finished", "idle")
