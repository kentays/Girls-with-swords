extends "BaseAttack.gd"

func _init():
	add_complex_gatling(["crouch", "move_right", "stand", "slash"], "hadouken")

func _on_animation_finished():
	emit_signal("finished", "idle")
