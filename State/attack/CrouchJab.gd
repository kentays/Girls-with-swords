extends "BaseAttack.gd"
			
			
func _init():
	add_gatling("kick", "sweep")
	add_gatling("slash", "crouch_slash")
	add_complex_gatling(["stand", "kick"], "kick")
	add_complex_gatling(["stand", "punch"], "jab")
	add_complex_gatling(["stand", "slash"], "slash")
	add_gatling("jump", "jump")
	
func _on_animation_finished():
	if Input.is_action_pressed(input_dict["crouch"]):
		emit_signal("finished", "crouch")
	else:
		emit_signal("finished", "idle")
