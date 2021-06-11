extends "../state.gd"

export var MOVE_SPEED : int = 200
var vel : Vector2 = Vector2()
var moving_right : bool = true

func enter():
	owner.get_node("AnimatedSprite").play("Run")
	if Input.is_action_pressed(input_dict["move_right"]):
		moving_right = true
	else:
		moving_right = false
	owner.dash(moving_right)
	
func handle_input(event):
	if event.is_action_pressed(input_dict["jump"]):
		emit_signal("finished", "moving_jump")
	
	elif event.is_action_released(input_dict["move_right"]) and moving_right:
		emit_signal("finished", "idle")
		
	elif event.is_action_released(input_dict["move_left"]) and not moving_right:
		emit_signal("finished", "idle")
	
	elif event.is_action_pressed(input_dict["crouch"]):
		emit_signal("finished", "crouch")
		
	elif event.is_action_pressed(input_dict["punch"]):
		emit_signal("finished", "jab")
		
func update(_delta):
	var mod = -1
	if moving_right:
		mod = 1
	vel.x = mod * MOVE_SPEED
	owner.move_and_collide(vel * _delta)
	
func receive_hit():
	if moving_right and not owner.facing_right:
		emit_signal("finished", "block")
	elif owner.facing_right and not moving_right:
		emit_signal("finished", "block")
	else:
		.receive_hit()
