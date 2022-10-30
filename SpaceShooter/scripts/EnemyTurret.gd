extends KinematicBody2D

onready var player = get_parent().get_node("Player")
var speed = 0.1
var follow = true


func _physics_process(delta):
	look_at(player.global_position)
	var motion = Vector2.ZERO
	follow = true
	motion += position.direction_to(player.position)
	motion = motion * speed
	motion = move_and_slide(motion)
	rotation_degrees = rotation_degrees + 90
		
	
