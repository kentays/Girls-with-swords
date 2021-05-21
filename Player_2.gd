extends "Player.gd"

func _init():
	input_dict = {
		"jump" : "p2_jump",
		"move_right" : "p2_move_right",
		"move_left" : "p2_move_left",
		"crouch" : "p2_crouch",
		"punch" : "p2_punch"
	}
