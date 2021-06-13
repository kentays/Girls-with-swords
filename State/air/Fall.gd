extends 'jump.gd'


func enter():
	if Input.is_action_pressed(input_dict["move_right"]) or Input.is_action_pressed(input_dict["move_left"]):
		emit_signal("finished", "moving_jump")
	owner.get_node("AnimatedSprite").play("Falling")


func _on_animation_finished():
	pass
