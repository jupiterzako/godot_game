extends KinematicBody2D

var velocity = Vector2()
export(int) var speed = 700

func _physics_process(delta):
	var collision = move_and_collide(velocity.normalized() * delta * speed)
	
#	rotation_degrees = rotation_degrees + 90

#move_and_collide(delta*Speed)

#func is_outside_view_bounds():
#	return position.x>OS.get_screen_size().x or position.x<0.0\
#		or position.y>OS.get_screen_size().y or position.y<0.0
		
#func _process(delta):
#	if is_outside_view_bounds():
#		queue_free()
#	move_local_x(delta*Speed)		
