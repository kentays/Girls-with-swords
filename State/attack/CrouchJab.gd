extends "BaseAttack.gd"
			
			
func handle_input(event):
	if hit_connect and event.is_action_pressed(input_dict["jump"]):
		print("jump cancel")
		emit_signal("finished", "jump")

	
func exit():
	hit_connect = false
	
func _on_animation_finished():
	if Input.is_action_pressed(input_dict["crouch"]):
		emit_signal("finished", "crouch")
	else:
		emit_signal("finished", "idle")
