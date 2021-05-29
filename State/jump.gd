extends "state.gd"

export var jumpForce : int = 400
var gravity : int = 800
var vel : Vector2 = Vector2()

func enter():
	owner.get_node("AnimatedSprite").play("Jump")
	vel.y = -1 * jumpForce
	
func update(delta):
	vel.y += gravity * delta
	owner.move_and_slide(vel, Vector2.UP)
	if owner.is_on_floor():
		emit_signal("finished", "idle")
