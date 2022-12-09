extends KinematicBody2D
var explode :=preload("res://scenes/enemies/EnemyExplosion.tscn")
onready var phealth = get_parent().get_node("Player/HEALTH")

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
	
		
func death():
	get_tree().reload_current_scene()
