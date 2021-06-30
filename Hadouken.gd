extends KinematicBody2D

export var velocity = Vector2(300, 0)

export var dmg : int = 0
export var stun : int = 0
export var push : Vector2 = Vector2.ZERO
export(String, "low", "mid", "high") var height
export var knockdown : bool = false

func init(right: bool):
	if not right:
		velocity.x *= -1
		$AnimatedSprite.flip_h = true


# Called when the node enters the scene tree for the first time.
func _physics_process(delta: float):
	var collision = move_and_collide(delta * velocity)
	if collision != null:
		if collision.collider.get_class() == "KinematicBody2D":
			get_parent().hit_player(collision.collider.name, dmg, stun, push, height, knockdown)
			queue_free()
		else:
			queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
