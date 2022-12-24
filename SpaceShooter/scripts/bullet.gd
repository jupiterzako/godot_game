extends KinematicBody2D

var explode :=preload("res://scenes/enemies/EnemyExplosion.tscn")

var velocity = Vector2()
var maxtime = 5.0
export(int) var speed = 700

func _physics_process(delta):
	var collision = move_and_collide(velocity.normalized() * delta * speed)
	
	
func _on_timeout():
	self.queue_free()
	
func _ready():
	var timer = Timer.new()
	timer.wait_time = maxtime
	timer.autostart = true
	add_child(timer)
	timer.connect("timeout",self,"_on_timeout")
	$AudioStreamPlayer2D.play()
	

		
		

	
	
#	rotation_degrees = rotation_degrees + 90

#move_and_collide(delta*Speed)

#func is_outside_view_bounds():
#	return position.x>OS.get_screen_size().x or position.x<0.0\
#		or position.y>OS.get_screen_size().y or position.y<0.0
		
#func _process(delta):
#	if is_outside_view_bounds():
#		queue_free()
#	move_local_x(delta*Speed)		
