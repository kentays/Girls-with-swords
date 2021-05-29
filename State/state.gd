extends Node

signal finished(next_state_name)

var input_dict = null

func map_inputs(mapping):
	input_dict = mapping

func enter():
	pass
	
func exit():
	pass
	
func handle_input(_event):
	pass
	
func update(_delta):
	pass
	
func _on_animation_finished():
	return
	
func receive_hit():
	emit_signal("finished", "hitstun")
