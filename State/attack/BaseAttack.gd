extends "../state.gd"

var hit_connect : bool = false

export var begin_frame : int = 0
export var end_frame : int = 0

export var dmg : int = 0
export var stun : int = 0
# setting this to 0 results in a knockdown

export var push : Vector2 = Vector2.ZERO
export(String, "", "low", "mid", "high") var height
export var knockdown : bool = false
			
	
func enter():
	print(height)
	owner.whiff()
	change_animation()	
		
func update(_delta):
	var frame_count = owner.get_node("AnimationPlayer").get_current_animation_position()
	frame_count = int(frame_count)
	if frame_count >= begin_frame and frame_count <= end_frame:
		if owner.inside_hurtbox and not hit_connect:
			owner.hit_connect(dmg, stun, push, height, knockdown)
			hit_connect = true

func push(_velo: int):
	pass
	
func exit():
	hit_connect = false
