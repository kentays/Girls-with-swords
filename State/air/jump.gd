extends "../state.gd"

export var jumpForce : int = 400

func enter():
	if Input.is_action_pressed(input_dict["move_right"]) or Input.is_action_pressed(input_dict["move_left"]):
		emit_signal("finished", "moving_jump")
	owner.get_node("AnimatedSprite").play("Jump")
	owner.jump()
	owner.vel.y = -1 * jumpForce
	
func handle_input(event):
	if event.is_action_pressed(input_dict["punch"]):
		emit_signal("finished", "jumping_punch")
	
func update(delta):
	if owner.is_on_floor():
		print("Touched floor")
		owner.land()
		emit_signal("finished", "idle")
		
func _on_animation_finished():
	emit_signal("finished", "fall")
