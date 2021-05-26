extends "state.gd"

export var jumpForce : int = 400
export var MOVE_SPEED : int = 200
var gravity : int = 800
var vel : Vector2 = Vector2()
var facing_right : bool = true

func enter():
	owner.get_node("AnimatedSprite").play("Jump")
	
	if Input.is_action_pressed(input_dict["move_right"]):
		facing_right = true
		owner.sprite.flip_h = false
	else:
		facing_right = false
		owner.sprite.flip_h = true
		
	vel.y = -1 * jumpForce
	
func update(delta):
	vel.y += gravity * delta
	var mod = -1
	if facing_right:
		mod = 1
	vel.x = mod * MOVE_SPEED
	owner.move_and_slide(vel, Vector2.UP)
	if owner.is_on_floor():
		emit_signal("finished", "idle")
