extends "jab.gd"


# needs better hitbox and timing

func enter():
	owner.whiff()
	owner.get_node("AnimatedSprite").play("JumpingPunch")

func update(delta):
	if owner.is_on_floor():
		emit_signal("finished", "idle")
	.update(delta)
	
func _on_animation_finished():
	emit_signal("finished", "fall")
