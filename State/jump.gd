extends "state.gd"

export var jumpForce : int = 400
var gravity : int = 800
var vel : Vector2 = Vector2()

func enter():
	if Input.is_action_pressed(input_dict["move_right"]) or Input.is_action_pressed(input_dict["move_left"]):
		emit_signal("finished", "moving_jump")
	owner.get_node("AnimatedSprite").play("Jump")
	owner.jump()
	vel.y = -1 * jumpForce
	
func update(delta):
	vel.y += gravity * delta
	owner.move_and_slide(vel, Vector2.UP)
	if owner.is_on_floor():
		emit_signal("finished", "idle")
