extends "BaseAttack.gd"

func _init():
	add_gatling("kick", "kick")
	add_gatling("slash", "slash")
	add_gatling("jump", "jump")
	add_complex_gatling(["crouch", "kick"], "sweep")
	add_complex_gatling(["crouch", "punch"], "crouch_jab")
	add_complex_gatling(["crouch", "slash"], "crouch_slash")
				
func _on_animation_finished():
	emit_signal("finished", "idle")
