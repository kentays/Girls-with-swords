extends "state.gd"

func enter():
	print("Entering Idle State")
	owner.get_node("AnimatedSprite").play("Neutral")
	
func exit():
	print("Exiting Idle State")
	
func handle_input(event):
	if event.is_action_pressed("jump"):
		emit_signal("finished", "jump")
	
	if event.is_action_pressed("punch"):
		emit_signal("finished", "jab")
