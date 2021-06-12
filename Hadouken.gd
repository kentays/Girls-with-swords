extends KinematicBody2D

export var velocity = Vector2(300, 0)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func init(right: bool):
	if not right:
		velocity.x *= -1
		$AnimatedSprite.flip_h = true


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	var collision = move_and_collide(delta * velocity)
	if collision != null:
		print(collision.collider.name)
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
