extends "BaseAttack.gd"

func _on_animation_finished():
	emit_signal("finished", "idle")
