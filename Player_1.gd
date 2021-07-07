extends "Player.gd"

func _init():
	other_player_name = "P2"
	
	input_dict = {
		"jump" : "p1_jump",
		"move_right" : "p1_move_right",
		"move_left" : "p1_move_left",
		"crouch" : "p1_crouch",
		"punch" : "p1_punch",
		"slash" : "p1_slash",
		"kick" : "p1_kick"
	}
	
func sub_hadouken():
	hadouken(2)


