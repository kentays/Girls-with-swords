extends "run.gd"

func enter():
	change_animation()
	if Input.is_action_pressed(input_dict["move_right"]):
		moving_right = true
	else:
		moving_right = false
	owner.dash(moving_right)

func handle_input(event: InputEvent):
	if event.is_action_pressed(input_dict["jump"]):
		emit_signal("finished", "moving_jump")
	
func _on_audio_finished():
	emit_signal("finished", "idle")
