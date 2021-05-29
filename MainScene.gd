extends Node2D


var p1_x : int
var p2_x : int


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var p1 = get_node("Player_1")
	var p2 = get_node("Player_2")
	if p1.position.x > p2.position.x:
		p2.sprite.flip_h = false
		p1.sprite.flip_h = true
		p1.get_node("Area2D/HurtBox").position.x = -23
		p2.get_node("Area2D/HurtBox").position.x = 23
		
	else:
		p1.sprite.flip_h = false
		p2.sprite.flip_h = true
		p1.get_node("Area2D/HurtBox").position.x = 23
		p2.get_node("Area2D/HurtBox").position.x = -23
		
func hit_p2():
	print("Player 2 hit")
	get_node("Player_2").current_state.receive_hit()
