extends Node

signal finished(next_state_name)

var input_dict = null

func map_inputs(mapping):
	input_dict = mapping

func enter():
	pass
	
func exit():
	pass
	
func handle_input(event):
	pass
	
func update(delta):
	pass
	
func _on_animation_finished():
	return
