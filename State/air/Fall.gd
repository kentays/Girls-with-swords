extends 'jump.gd'


func enter():
	owner.get_node("AnimatedSprite").play("Falling")


func _on_animation_finished():
	pass
