extends KinematicBody2D

onready var player = get_parent().get_node("Player")
var speed = 2
var follow = true


func _physics_process(delta):
	look_at(player.global_position)
	var motion = Vector2.ZERO
	follow = true
	motion += position.direction_to(player.position)
	motion = motion * speed
	motion = move_and_collide(motion)
	rotation_degrees = rotation_degrees + 90
		
	

#func _on_Camera2D_child_entered_tree(node):
#	if node.name == 'stop_follow':
#		follow = false


#func _on_Camera2D_child_exiting_tree(node):
#	if node.name == 'stop_follow':
#		follow = true

