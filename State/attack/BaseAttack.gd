extends "../state.gd"

var hit_connect : bool = false

export var begin_frame : int = 0
export var end_frame : int = 0

export var dmg : int = 0
export var stun : int = 0
export var push : Vector2 = Vector2.ZERO
export(String, "low", "mid", "high") var height
			
	
func enter():
	owner.whiff()
	change_animation()	
		
func update(delta):
	var frame_count = owner.get_node("AnimatedSprite").frame
	if frame_count >= begin_frame and frame_count <= end_frame:
		if owner.inside_hurtbox and not hit_connect:
			owner.hit_connect(dmg, stun, push, height)
			hit_connect = true
	
func exit():
	hit_connect = false
