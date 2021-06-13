extends "jump.gd"

export var MOVE_SPEED : int = 200
var facing_right : bool = true

# this glitches when it collides with P2

func enter():
	owner.get_node("AnimatedSprite").play("Jump")
	owner.jump()
	if Input.is_action_pressed(input_dict["move_right"]):
		facing_right = true
	else:
		facing_right = false
		
	owner.vel.y = -1 * jumpForce
	
func update(delta):
	var mod = -1
	if facing_right:
		mod = 1
	owner.vel.x = mod * MOVE_SPEED
	if owner.is_on_floor():
		emit_signal("finished", "idle")
