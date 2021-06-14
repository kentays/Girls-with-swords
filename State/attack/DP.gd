extends "jab.gd"

export var launchForce : Vector2 = Vector2(50, 300)

func enter():
	owner.vel.y = -1 * launchForce.y
	.enter()
	
func handle_input(event):
	pass
	
func update(delta):
	var mod = -1
	if owner.facing_right:
		mod = 1
	owner.vel.x = mod * launchForce.x
	.update(delta)
	
func _on_animation_finished():
	emit_signal("finished", "fall")
