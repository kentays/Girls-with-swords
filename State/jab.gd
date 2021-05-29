extends "state.gd"

var hit_connect : bool = false

func enter():
	owner.get_node("AnimatedSprite").play("Jab")
	if owner.inside_hurtbox:
		owner.hit_connect()
		hit_connect = true
			
func handle_input(event):
	if hit_connect and event.is_action_pressed(input_dict["jump"]):
		print("jump cancel")
		emit_signal("finished", "jump")
	
func _on_animation_finished():
	emit_signal("finished", "idle")
