extends Node2D


var p1_x : int
var p2_x : int


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	p1_x = get_node("Player_1").position.x
	p2_x = get_node("Player_2").position.x
	if p1_x > p2_x:
		get_node("Player_2").sprite.flip_h = false
		get_node("Player_1").sprite.flip_h = true
		
	else:
		get_node("Player_1").sprite.flip_h = false
		get_node("Player_2").sprite.flip_h = true
