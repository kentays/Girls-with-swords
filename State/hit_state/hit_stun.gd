extends "hit_state.gd"

func enter():
	.enter()
	owner.receive_hit_confirm()
	change_animation()
	

func receive_hit(height):
	print("COMBO")
	emit_signal("finished", "knockdown")

	
