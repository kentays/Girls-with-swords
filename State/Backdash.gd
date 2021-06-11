extends "run.gd"

func enter():
	owner.get_node("AnimatedSprite").play("Backdash")
	owner.dash()
	if Input.is_action_pressed(input_dict["move_right"]):
		moving_right = true
	else:
		moving_right = false

func handle_input(event):
	if event.is_action_pressed(input_dict["jump"]):
		emit_signal("finished", "moving_jump")
	
func _on_animation_finished():
	emit_signal("finished", "idle")
