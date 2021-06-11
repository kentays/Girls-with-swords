extends "../state.gd"

export var PUSH_SPEED : int = 300
var vel : Vector2 = Vector2()

func enter():
	if owner.facing_right:
		vel.x = -PUSH_SPEED
	else:
		vel.x = PUSH_SPEED

func update(delta):
	owner.move_and_slide(vel, Vector2.UP)
	if vel.x > 50:
		vel.x = vel.x / 2
	else:
		vel.x = 0
