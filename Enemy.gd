extends KinematicBody2D

onready var player = get_parent().get_node("Player")
var speed = 100
var follow = true


func _physics_process(delta):
	look_at(player.global_position)
	var motion = Vector2.ZERO
	if follow:
		motion += position.direction_to(player.position)
		motion = move_and_slide(motion)
	
func _on_world_area_entered(area):
	if area.name == 'stop_follow':
		follow = false


func _on_world_area_exited(area):
	if area.name == 'stop_follow':
		follow = true

