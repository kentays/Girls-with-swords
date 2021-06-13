extends "../state.gd"


# needs better timing

# Called when the node enters the scene tree for the first time.
func enter():
	owner.get_node("AnimatedSprite").play("Hadouken")
	
func _on_animation_finished():
	owner.sub_hadouken()
	emit_signal("finished", "idle")
