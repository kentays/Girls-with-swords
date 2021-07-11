extends "../state.gd"

var stun_count : int = 0

func enter():
	change_animation()
	owner.get_parent().hitstop()
		
func stun(new_stun_count : int):
	stun_count = new_stun_count
	
func impact(anim: String):
	var i: AnimatedSprite = owner.Impact.instance()
	i.z_index = 2
	i.play(anim)
	owner.get_parent().add_child(i)
	
	var rect1: Rect2 = owner.get_hit_rect()
	var rect2: Rect2 = owner.get_other_hurt_rect()
	var clipped: Rect2 = rect1.clip(rect2)
	var clip_center: Vector2 = clipped.position + clipped.size/2.0
	i.global_position = owner.global_position
	
	

func update(_delta: float):
	if stun_count > 0:
		stun_count -= 1
	else:
		if owner.grounded:
			emit_signal("finished", "idle")
		else:
			emit_signal("finished", "fall")
		
func knockdown():
	pass

func exit():
	owner.pushback = false
	
