extends "state.gd"

func enter():
	print("Entering jab state")
	owner.get_node("AnimatedSprite").play("Jab")
	
func exit():
	print("Exiting jab state")
	
func _on_animation_finished():
	emit_signal("finished", "idle")
