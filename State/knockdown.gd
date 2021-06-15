extends "state.gd"

func enter():
	owner.knockdown()
	owner.get_node("AnimatedSprite").play("Knockdown")
	

func push(arg):
	pass
	
func stun(arg):
	pass

func receive_hit(height):
	pass

	
func _on_animation_finished():
	emit_signal("finished", "idle")
