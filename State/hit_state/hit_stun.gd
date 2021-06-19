extends "hit_state.gd"

func enter():
	.enter()
	owner.combo = 1
	owner.receive_hit_confirm()
	change_animation()
	

func receive_hit(height):
	owner.combo += 1
	stun_count = 0
	if owner.combo > 1:
		print("COMBO ", owner.combo)
		
func knockdown():
	emit_signal("finished", "knockdown")
	
func exit():
	owner.combo = 0

	
