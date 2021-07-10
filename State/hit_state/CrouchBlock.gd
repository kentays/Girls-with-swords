extends "Block.gd"

func pushback(force: Vector2):
	.pushback(force)
	if not owner.grounded:
		emit_signal("finished", "block")
