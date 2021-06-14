extends "../state.gd"

var hit_connect : bool = false

export var startup_frames : int = 0
export var cooldown_frames : int = 0
			
	
	
		
func update(delta):
	var frame_count = owner.get_node("AnimatedSprite").frame
	if 8 > cooldown_frames and cooldown_frames > 4:
		if owner.inside_hurtbox and not hit_connect:
			owner.hit_connect()
			hit_connect = true
	
func exit():
	hit_connect = false
	
func _on_animation_finished():
	emit_signal("finished", "idle")
