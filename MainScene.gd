extends Node2D


var hud_dict = {
	"P1" : {"health_num": 100},
	"P2" : {"health_num": 100}
}

onready var p1 = get_node("P1")
onready var p2 = get_node("P2")

func _ready():
	
	print("TESTING GLOBAL SUBARRAY.  Shoult be True False")
	var subarr = [1, 2]
	var arr = [0, 1, 2, 3, 4]
	print(Global.is_subset_of(subarr, arr))
	
	subarr = [0, 2]
	arr = [0, 1, 2, 3, 4]
	print(Global.is_subset_of(subarr, arr))
	
	print("TESTING KEY FLIPPING FOR [right, left, up, down]")
	print(Global.flip_keys(["move_right", "move_left", "jump", "crouch"]))
	
	hud_dict.P1.healthbar = $HUD/P1Health
	hud_dict.P2.healthbar = $HUD/P2Health
	hud_dict.P1.combo = $HUD/P1Combo
	hud_dict.P2.combo = $HUD/P2Combo
	
	combo_off("P1")
	combo_off("P2")
	
	start()

func _process(_delta: float):
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
	
	hud_dict.P1.health_num = 100
	hud_dict.P2.health_num = 100
	
	$HUD/Timer.reset()

	
func hit_player(name: String, dmg: int, stun: int, push: Vector2, height: String, knockdown: bool):
	print(name + " hit")
	get_node(name).receive_hit(dmg, stun, push, height, knockdown)

func deduct_health(name: String, dmg: int):
	hud_dict[name]["health_num"] -= dmg
	if (hud_dict.P1.health_num < 0) or (hud_dict.P2.health_num < 0):
		start()
	hud_dict.P1.healthbar.value = hud_dict.P1.health_num
	hud_dict.P2.healthbar.value = hud_dict.P2.health_num

func push_attacker(name: String, x_force: int):
	var attacker: KinematicBody2D = get_node(name)
	attacker.pushback = true
	attacker.vel.x = x_force * -1

func combo_on(name: String, combo_num: int):
	hud_dict[name]["combo"].combo(combo_num)
	
func combo_off(name: String):
	hud_dict[name]["combo"].off()


func _on_Timer_timeout():
	start()
