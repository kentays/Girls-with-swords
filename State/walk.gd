extends "run.gd"

func enter():
	MOVE_SPEED = 100
	owner.get_node("AnimatedSprite").play("Walk")
	if Input.is_action_pressed(input_dict["move_right"]):
		moving_right = true
	else:
		moving_right = false

func handle_input(event):
	if event.is_action_pressed(input_dict["dash"]):
		print("Dash command")
		emit_signal("finished", "run")
	else: 
		.handle_input(event)
	
