extends "Player.gd"

func _init():
	input_dict = {
		"jump" : "p1_jump",
		"move_right" : "p1_move_right",
		"move_left" : "p1_move_left",
		"crouch" : "p1_crouch",
		"punch" : "p1_punch",
		"dash" : "p1_dash"
	}


func _on_Area2D_body_entered(body):
	if body.name == "Player_2":
		inside_hurtbox = true
	

func _on_Area2D_body_exited(body):
	if body.name == "Player_2":
		inside_hurtbox = false

func hit_connect():
	get_parent().hit_p2()
