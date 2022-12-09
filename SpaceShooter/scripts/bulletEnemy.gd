extends KinematicBody2D

var explode :=preload("res://scenes/enemies/EnemyExplosion.tscn")

var velocity = Vector2()
var maxtime = 5.0
export(int) var speed = 700
onready var phealth = get_parent().get_node("Player/HEALTH")

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
	
		
func _on_Area2D_body_entered(body):
	if body.get_name()=="Player":
		var effect = explode.instance()
		effect.global_position = global_position
		get_tree().current_scene.add_child(effect)
		phealth.value -=10
		
		queue_free()
