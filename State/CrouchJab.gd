extends "state.gd"

var hit_connect : bool = false

func enter():
	owner.get_node("AnimatedSprite").play("CrouchJab")
			
func handle_input(event):
	if hit_connect and event.is_action_pressed(input_dict["jump"]):
		print("jump cancel")
		emit_signal("finished", "jump")
		
func update(_delta):
	var frame_count = owner.get_node("AnimatedSprite").frame
	if 4 > frame_count and frame_count > 2:
		if owner.inside_hurtbox and not hit_connect:
			owner.hit_connect()
			hit_connect = true
	
func exit():
	hit_connect = false
	
func _on_animation_finished():
	if Input.is_action_pressed(input_dict["crouch"]):
		emit_signal("finished", "crouch")
	else:
		emit_signal("finished", "idle")
