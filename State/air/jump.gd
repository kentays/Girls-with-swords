extends "../state.gd"

export var jumpForce : int = 400

func enter():
	change_animation()
	owner.grounded = false
	# this is required due to a ground detection bug
	if Input.is_action_pressed(input_dict["move_right"]) or Input.is_action_pressed(input_dict["move_left"]):
		emit_signal("finished", "moving_jump")
	owner.get_node("AnimatedSprite").play("Jump")
	owner.jump()
	owner.vel.y = -1 * jumpForce
	
func handle_input(event):
	if event.is_action_pressed(input_dict["punch"]):
		emit_signal("finished", "jumping_punch")
	elif event.is_action_pressed(input_dict["kick"]):
		emit_signal("finished", "jumping_kick")
	
func update(delta):
	if owner.grounded:
		print("Touched floor")
		owner.land()
		emit_signal("finished", "idle")
		
func push(_vel):
	pass
		
func _on_animation_finished():
	emit_signal("finished", "fall")
