extends "state.gd"

func enter():
	owner.knockdown()
	owner.get_node("AnimatedSprite").play("Knockdown")
	

func pushback(arg):
	pass

	
func update(_delta):
	owner.vel.x = 0

func push(_vel):
	pass
	
func stun(arg):
	pass

func receive_hit(height):
	pass

	
func _on_animation_finished():
	emit_signal("finished", "idle")
