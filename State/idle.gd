extends "state.gd"

func enter():
	owner.get_node("AnimatedSprite").play("Neutral")
	
func handle_input(event):
	if event.is_action_pressed("jump"):
		emit_signal("finished", "jump")
	
	elif event.is_action_pressed("punch"):
		emit_signal("finished", "jab")
		
	elif event.is_action_pressed("crouch"):
		emit_signal("finished", "crouch")
