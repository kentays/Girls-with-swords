extends "../state.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func enter():
	owner.get_node("AnimatedSprite").play("Hadouken")
	
func _on_animation_finished():
	owner.sub_hadouken()
	emit_signal("finished", "idle")
