extends "../state.gd"

var stun_count : int = 0

func enter():
	change_animation()
	
func stun(new_stun_count : int):
	stun_count = new_stun_count

func update(_delta: float):
	if stun_count > 0:
		stun_count -= 1
	else:
		if owner.grounded:
			emit_signal("finished", "idle")
		else:
			emit_signal("finished", "fall")
		
func knockdown():
	pass

func exit():
	owner.pushback = false
	
