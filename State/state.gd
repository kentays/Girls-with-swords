extends Node

signal finished(next_state_name)

var input_dict = null

func map_inputs(mapping: Dictionary):
	input_dict = mapping
	
func change_animation():
	owner.change_animation(name)

func enter():
	pass
	
func exit():
	pass
	
func handle_input(_event: InputEvent):
	pass
	
func push(x_vel : int):
	x_vel = float(x_vel)
	owner.vel.x = x_vel / 2
	
func damage(dmg : int):
	owner.deduct_health(dmg)
	
func pushback(force: Vector2):
	if not owner.touching_wall:
		owner.vel.x = force.x
		owner.pushback = true
	owner.vel.y = force.y * -1
	if force.y:
		owner.grounded = false

func update(_delta: float):
	pass
	
func _on_animation_finished():
	return
	
func _on_audio_finished():
	print("Audio finished")

func receive_hit(_height: String):
	emit_signal("finished", "hitstun")
