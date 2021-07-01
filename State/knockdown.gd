extends "state.gd"

func enter():
	owner.knockdown()
	change_animation()
	

func pushback(_arg: Vector2):
	pass

	
func update(_delta):
	owner.vel.x = 0

func push(_vel: int):
	pass
	
func stun(_arg: int):
	pass

func receive_hit(_height: String):
	pass

	
func _on_animation_finished():
	emit_signal("finished", "idle")
