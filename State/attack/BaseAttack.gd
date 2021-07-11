extends "../state.gd"

var hit_connect : bool = false
var frame_after_connect : bool = false

export var begin_frame : int = 0
export var end_frame : int = 0

export var dmg : int = 0
export var stun : int = 0
# setting this to 0 results in a knockdown

export var push : Vector2 = Vector2.ZERO
export(String, "", "low", "mid", "high") var height
export var knockdown : bool = false

var gatlings: Array = []
var complex_gatlings: Array = []
			
	
func enter():
	hit_connect = false
	frame_after_connect = false
	print(height)
	owner.whiff()
	change_animation()
	
func clear_gatlings():
	gatlings = []
	complex_gatlings = []	
	
func add_gatling(input: String, state: String):
	var d: Dictionary = {"input": input, "state": state}
	gatlings.push_back(d)
	
func add_complex_gatling(inputs: Array, state: String):
	var d: Dictionary = {"inputs": inputs, "state": state}
	complex_gatlings.push_back(d)
	
func handle_input(event: InputEvent):
	if hit_connect:
		for gatling in gatlings:
			if event.is_action_pressed(input_dict[gatling.input]):
				print("Gatling via inherited method to " + gatling.state)
				emit_signal("finished", gatling.state)
		
func update(_delta):
	var frame_count = owner.get_node("AnimationPlayer").get_current_animation_position()
	frame_count = int(frame_count)
	if frame_count >= begin_frame and frame_count <= end_frame:
		if owner.inside_hurtbox and not hit_connect:
			owner.hit_connect(dmg, stun, push, height, knockdown)
			hit_connect = true
			print("Hit connect")	
	# check the buffer if we should gatling
	if frame_after_connect:
		for gatling in complex_gatlings:
			if owner.check_complex_buffer(gatling.inputs):
				print("Complex gatling via inherited method and buffer to " + gatling.state)
				emit_signal("finished", gatling.state)
		for gatling in gatlings:
			if owner.check_buffer(gatling.input):
				print("Gatling via inherited method and buffer to " + gatling.state)
				emit_signal("finished", gatling.state)
				
	if hit_connect:
		frame_after_connect = true
		# need to delay this by a frame
		

func push(_velo: float):
	pass
	
func exit():
	hit_connect = false
