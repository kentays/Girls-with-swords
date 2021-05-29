extends "state.gd"

func enter():
	owner.get_node("AnimatedSprite").play("Hitstun")
	

func receive_hit():
	print("COMBO")
	owner.get_node("AnimatedSprite").set_frame(0)

	
func _on_animation_finished():
	emit_signal("finished", "idle")
