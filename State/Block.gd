extends "state.gd"

func enter():
	owner.get_node("AnimatedSprite").play("Block")

func receive_hit():
	print("Additional hit while blocking")
	emit_signal("finished", "block")
	
func _on_animation_finished():
	emit_signal("finished", "idle")
