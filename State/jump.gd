extends "state.gd"

export var jumpForce : int = 400
var gravity : int = 800
var vel : Vector2 = Vector2()

func enter():
	print("Entering jump state")
	owner.get_node("AnimatedSprite").play("Jump")
	vel.y = -1 * jumpForce
	
func update(delta):
	owner.move_and_slide(vel, Vector2.UP)
	vel.y += gravity * delta
	if owner.is_on_floor():
		emit_signal("finished", "idle")
