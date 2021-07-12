extends "BaseAttack.gd"

func _init():
	add_gatling("kick", "jumping_kick")
	add_gatling("slash", "jumping_slash")

func update(delta: float):
	.update(delta)
	if owner.grounded:
		print("Touched floor")
		owner.land()
		emit_signal("finished", "idle")
	
func _on_animation_finished():
	emit_signal("finished", "fall")
