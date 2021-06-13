extends "jab.gd"


func enter():
	owner.whiff()
	owner.get_node("AnimatedSprite").play("JumpingPunch")

func update(delta):
	if owner.is_on_floor():
		emit_signal("finished", "idle")
	.update(delta)
