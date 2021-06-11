extends Node2D


var p1_x : int
var p2_x : int


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var p1 = get_node("P1")
	var p2 = get_node("P2")
	if p1.position.x > p2.position.x:
		p1.turn_left()
		p2.turn_right()
		
	else:
		p1.turn_right()
		p2.turn_left()
		
func hit_p2():
	print("Player 2 hit")
	get_node("P2").current_state.receive_hit()
