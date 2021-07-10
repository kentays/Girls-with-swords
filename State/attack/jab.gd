extends "BaseAttack.gd"

func _init():
	add_gatling("kick", "kick")
	add_gatling("slash", "slash")
	add_gatling("jump", "jump")
				
		
func _on_animation_finished():
	emit_signal("finished", "idle")
