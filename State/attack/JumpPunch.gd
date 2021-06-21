extends "BaseAttack.gd"

func update(delta: float):
	.update(delta)
	if owner.grounded:
		print("Touched floor")
		owner.land()
		emit_signal("finished", "idle")
	
func _on_animation_finished():
	emit_signal("finished", "fall")
