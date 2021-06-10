extends "state.gd"

func enter():
	owner.knockdown()
	owner.get_node("AnimatedSprite").play("Knockdown")
	

func receive_hit():
	pass

	
func _on_animation_finished():
	emit_signal("finished", "idle")
