extends AnimatedSprite

func _process(delta:float) -> void:
	look_at(get_global_mouse_position())

	rotation_degrees = rotation_degrees + 90 


