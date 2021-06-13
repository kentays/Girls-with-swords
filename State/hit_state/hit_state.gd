extends "../state.gd"

export var PUSH_SPEED : int = 300

func enter():
	if owner.facing_right:
		owner.vel.x = -PUSH_SPEED
	else:
		owner.vel.x = PUSH_SPEED

func update(delta):
	if owner.vel.x > 50:
		owner.vel.x = owner.vel.x / 2
	else:
		owner.vel.x = 0
