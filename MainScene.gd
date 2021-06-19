extends Node2D


var health_dict = {
	"P1" : 100,
	"P2" : 100
}

onready var p1_healthbar = $HUD/P1Health
onready var p2_healthbar = $HUD/P2Health

onready var p1 = get_node("P1")
onready var p2 = get_node("P2")

func _ready():
	start()

func _process(_delta):
	if p1.position.x > p2.position.x:
		p1.turn_left()
		p2.turn_right()
		
	else:
		p1.turn_right()
		p2.turn_left()
		
	$Camera2D.adjust(p1.position, p2.position)
		
		
func start():
	p1.start(Vector2(100, 195))
	p2.start(Vector2(275, 195))
	
	health_dict = {
	"P1" : 100,
	"P2" : 100
}
	

	
func hit_player(name: String, dmg: int, stun: int, push: Vector2, height: String, knockdown: bool):
	print(name + " hit")
	health_dict[name] -= dmg
	if (health_dict["P1"] < 0) or (health_dict["P2"] < 0):
		start()
	p1_healthbar.value = health_dict["P1"]
	p2_healthbar.value = health_dict["P2"]
	get_node(name).receive_hit(dmg, stun, push, height, knockdown)
