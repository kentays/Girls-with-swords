extends "Player.gd"

func _init():
	input_dict = {
		"jump" : "p2_jump",
		"move_right" : "p2_move_right",
		"move_left" : "p2_move_left",
		"crouch" : "p2_crouch",
		"punch" : "p2_punch",
		"dash" : "p2_dash"
	}



func _on_Area2D_body_entered(body):
	if body.name == "Player_1":
		inside_hurtbox = true
	

func _on_Area2D_body_exited(body):
	if body.name == "Player_1":
		inside_hurtbox = false
