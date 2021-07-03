extends "hit_state.gd"

func enter():
	.enter()
	owner.combo = 1
	owner.receive_hit_confirm()
	

func receive_hit(_height: String):
	owner.combo_up()
	stun_count = 0
	owner.receive_hit_confirm()
	owner.restart_animation()
		
func knockdown():
	emit_signal("finished", "knockdown")
	
func exit():
	.exit()
	owner.reset_combo()

	
