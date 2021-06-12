extends "CrouchJab.gd"

func enter():
	owner.whiff()
	owner.get_node("AnimatedSprite").play("Sweep")
			
