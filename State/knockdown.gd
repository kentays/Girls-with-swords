extends "state.gd"

func enter():
	owner.knockdown()
	change_animation()
	

func pushback(arg: int):
	pass

	
func update(_delta):
	owner.vel.x = 0

func push(_vel):
	pass
	
func stun(arg: int):
	pass

func receive_hit(height: String):
	pass

	
func _on_animation_finished():
	emit_signal("finished", "idle")
