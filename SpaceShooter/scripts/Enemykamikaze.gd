extends KinematicBody2D

onready var player = get_parent().get_node("Player")
var speed = 3
var follow = true
var explode :=preload("res://scenes/enemies/EnemyExplosion.tscn")
onready var phealth = get_parent().get_node("Player/HEALTH")

func _physics_process(delta):
	look_at(player.global_position)
	var motion = Vector2.ZERO
	follow = true
	motion += position.direction_to(player.position)
	motion = motion * speed
	motion = move_and_collide(motion)
	rotation_degrees = rotation_degrees + 90

func _on_Area2D_body_entered(body):
	if body.get_name()=="Player":
		var effect = explode.instance()
		effect.global_position = global_position
		get_tree().current_scene.add_child(effect)
		phealth.value -=10
		queue_free()
	if "Bullet" in body.name:
		var effect = explode.instance()
		effect.global_position = global_position
		get_tree().current_scene.add_child(effect)
		queue_free()
		Global.points +=1
		
func death():
	get_tree().reload_current_scene()
	
	

