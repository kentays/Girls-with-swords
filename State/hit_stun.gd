extends "state.gd"

func enter():
	owner.get_node("AnimatedSprite").play("Hitstun")

	
func _on_animation_finished():
	emit_signal("finished", "idle")
