extends "BaseAttack.gd"
			
			
func handle_input(event: InputEvent):
	if hit_connect: 
		if event.is_action_pressed(input_dict["jump"]):
			print("jump cancel")
			emit_signal("finished", "jump")
		elif event.is_action_pressed(input_dict["kick"]):
			emit_signal("finished", "sweep")
	
func _on_animation_finished():
	if Input.is_action_pressed(input_dict["crouch"]):
		emit_signal("finished", "crouch")
	else:
		emit_signal("finished", "idle")
