extends "hit_state.gd"

func enter():
	.enter()
	owner.block()

func receive_hit(height: String):
	if height == "high":
		emit_signal("finished", "hitstun")
	else:
		print("Blockstring")
		owner.block()
		
func pushback(force: Vector2):
	.pushback(force)
	if not owner.grounded:
		emit_signal("finished", "block")
		
func damage(_dmg: int):
	pass
	
func _on_animation_finished():
	emit_signal("finished", "crouch")
