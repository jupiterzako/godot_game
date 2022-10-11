extends KinematicBody2D

export (int) var basic_speed = 250
export (int) var basic_health = 100
export (int) var basic_damage = 10
export (int) var basic_fireRate = 5
export (int) var basic_numberOfBullets = 1

#func game_over():

#func death():
#	if basic_health < 0
#		game_over()

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	velocity = velocity.normalized() * basic_speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

#extends KinematicBody2D

#export (int) var speed = 300
#var velocity = Vector2()
# var moving = false 

#func get_input():
#	look_at(get_global_mouse_position())
#	velocity = Vector2()
#	if Input.is_action_pressed("go "):
#		velocity = Vector2(speed, 0)

#func get_input():
#	look_at(get_global_mouse_position())
#	if Input.is_action_pressed("go "):
#		velocity = Vector2(+speed, 0)
#	if Input.is_action_pressed("go "):
#		velocity = Vector2(speed, 0).rotated(rotation)

#func _physics_process(delta):
#	get_input()
#	velocity = move_and_slide(velocity) 


#func _physics_process(delta):
#		target = get_global_mouse_position()
#	  (target) * speed	
#	if global_position.distance_to(target) > 5:
#		velocity = move_and_slide(velocity)
#func _process(delta):

#func _move_to_mouse():
#	direction = direction + position

#func _unhandled_input(event):
#	if event.is_action_pressed("go "):
#		moving = true
#		direction = direction + get_global_mouse_position()
