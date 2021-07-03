extends "../state.gd"

var stun_count : int = 0

func enter():
	change_animation()

func pushback(force: Vector2):
	owner.vel.x = force.x
	owner.vel.y = force.y * -1
	if force.y:
		owner.grounded = false
	
func stun(new_stun_count : int):
	stun_count = new_stun_count

func update(_delta: float):
	if abs(owner.vel.x) > 50:
		owner.vel.x = lerp(owner.vel.x, 0, .3)
	else:
		owner.vel.x = 0
	if stun_count > 0:
		stun_count -= 1
	else:
		if owner.grounded:
			emit_signal("finished", "idle")
		else:
			emit_signal("finished", "fall")
		
func knockdown():
	pass
	
