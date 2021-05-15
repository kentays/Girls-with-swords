extends "state.gd"

func enter():
	print("Entering jump state")
	owner.get_node("AnimatedSprite").play("Jump")
