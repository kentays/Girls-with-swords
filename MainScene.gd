extends Node2D


var health_dict = {
	"P1" : 100,
	"P2" : 100
}


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

	
func hit_player(name: String, dmg: int, stun: int, push: Vector2):
	print(name + " hit")
	health_dict[name] -= dmg
	print(health_dict)
	get_node(name).receive_hit(dmg, stun, push)
