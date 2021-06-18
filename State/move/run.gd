extends "../state.gd"

export var MOVE_SPEED : int = 200
var moving_right : bool = true

func enter():
	if Input.is_action_pressed(input_dict["move_right"]):
		moving_right = true
	else:
		moving_right = false
	owner.dash(moving_right)
	change_animation()

func exit():
	owner.vel.x = 0
	
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
		
	elif event.is_action_pressed(input_dict["slash"]):
		if len(owner.input_buf) > 2:
			var dir: String = "move_right"
			if not owner.facing_right: dir = "move_left"
			if (owner.input_buf[1] == dir) and (owner.input_buf[2] == "crouch"):
				emit_signal("finished", "hadouken")
				return
		
		emit_signal("finished", "slash")
		
func update(_delta):
	var mod = -1
	if moving_right:
		mod = 1
	owner.vel.x = mod * MOVE_SPEED
	
func push(_vel):
	pass
	
func receive_hit(height):
	if height == "high":
		emit_signal("finished", "hitstun")
		return
	if moving_right and not owner.facing_right:
		emit_signal("finished", "block")
	elif owner.facing_right and not moving_right:
		emit_signal("finished", "block")
	else:
		emit_signal("finished", "hitstun")
