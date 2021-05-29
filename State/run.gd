extends "state.gd"

export var MOVE_SPEED : int = 200
var vel : Vector2 = Vector2()
var facing_right : bool = true

func enter():
	owner.get_node("AnimatedSprite").play("Run")
	if Input.is_action_pressed(input_dict["move_right"]):
		facing_right = true
	else:
		facing_right = false
	
func handle_input(event):
	if event.is_action_pressed(input_dict["jump"]):
		emit_signal("finished", "moving_jump")
	
	elif event.is_action_released(input_dict["move_right"]) and facing_right:
		emit_signal("finished", "idle")
		
	elif event.is_action_released(input_dict["move_left"]) and not facing_right:
		emit_signal("finished", "idle")
	
	elif event.is_action_pressed(input_dict["crouch"]):
		emit_signal("finished", "crouch")
		
	elif event.is_action_pressed(input_dict["punch"]):
		emit_signal("finished", "jab")
		
func update(_delta):
	var mod = -1
	if facing_right:
		mod = 1
	vel.x = mod * MOVE_SPEED
	owner.move_and_slide(vel, Vector2.UP)
