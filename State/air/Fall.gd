extends 'jump.gd'


func enter():
	change_animation()
	owner.get_node("AnimatedSprite").play("Falling")

func push(_vel):
	pass

func _on_animation_finished():
	pass
