extends "state.gd"

func enter():
	owner.get_node("AnimatedSprite").play("Jab")
	if owner.inside_hurtbox:
		print("Jab Connected")
	
func _on_animation_finished():
	emit_signal("finished", "idle")
