extends "../state.gd"

var stun_count : int = 0

func push(force: Vector2):
	owner.vel = force
	
func stun(new_stun_count : int):
	stun_count = new_stun_count

func update(delta):
	if owner.vel.x > 50:
		owner.vel.x = owner.vel.x / 2
	else:
		owner.vel.x = 0
	if stun_count > 0:
		stun_count -= 1
	else:
		emit_signal("finished", "idle")
	
