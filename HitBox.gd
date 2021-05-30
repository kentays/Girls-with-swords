extends CollisionShape2D


func stand():
	set_position(Vector2(0, 0))
	set_scale(Vector2(0.9, 1.94))
	
func crouch():
	set_position(Vector2(0, 20))
	set_scale(Vector2(0.9, 1))
