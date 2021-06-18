extends "jump.gd"

export var launchForce : Vector2 = Vector2(200, 400)
var facing_right : bool = true

func enter():
	owner.grounded = false
	owner.get_node("AnimatedSprite").play("Jump")
	owner.jump()
	if Input.is_action_pressed(input_dict["move_right"]):
		facing_right = true
	else:
		facing_right = false
		
	owner.vel.y = -1 * launchForce.y
	
func push(_vel):
	pass
	
func update(delta):
	var mod = -1
	if facing_right:
		mod = 1
	owner.vel.x = mod * launchForce.x
	.update(delta)
