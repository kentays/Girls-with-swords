extends "Player.gd"

func _init():
	other_player_name = "P1"
	
	input_dict = {
		"jump" : "p2_jump",
		"move_right" : "p2_move_right",
		"move_left" : "p2_move_left",
		"crouch" : "p2_crouch",
		"punch" : "p2_punch",
		"slash" : "p2_slash",
		"kick" : "p2_kick"
	}

func sub_hadouken():
	hadouken(1)
