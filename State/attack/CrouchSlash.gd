extends "CrouchJab.gd"


func enter():
	owner.whiff()
	owner.get_node("AnimatedSprite").play("CrouchSlash")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
