extends "run.gd"

func enter():
	MOVE_SPEED = 100
	change_animation()
	owner.walk()
	if Input.is_action_pressed(input_dict["move_right"]):
		moving_right = true
	else:
		moving_right = false
	
	if len(owner.input_buf) < 2:
		return
	
	if owner.input_buf[0] == owner.input_buf[1]:
		if moving_right == owner.facing_right:
			print("Run forward")
			emit_signal("finished", "run")
		else:
			emit_signal("finished", "backdash")
			
func exit():
	owner.stop_sfx()
	.exit()
