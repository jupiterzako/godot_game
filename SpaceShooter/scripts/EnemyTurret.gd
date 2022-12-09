extends KinematicBody2D

onready var player = get_parent().get_node("Player")
var speed = 0.1
var follow = true
var ShootBullet := preload("res://scenes/BulletEnemy.tscn")
var time = 0
var maxtime = 0.2
var explode :=preload("res://scenes/enemies/EnemyExplosion.tscn")
var timer = null
var delay = 0.5
var can_shoot = true

onready var phealth = get_parent().get_node("Player/HEALTH")


func _physics_process(delta):
	look_at(player.global_position)
	var motion = Vector2.ZERO
	follow = true
	motion += position.direction_to(player.position)
	motion = motion * speed
	motion = move_and_slide(motion)
	rotation_degrees = rotation_degrees + 90

func _on_timeout():
	self.queue_free()


func _ready():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(delay)
	timer.connect("timeout",self,"on_timeout_complete")
	add_child(timer)
	
	
	
func on_timeout_complete():
	can_shoot = true

func _process(delta):
	if(can_shoot==true):
		shoot()
		can_shoot = false
		timer.start()
	
		
	#$Node2D.look_at(player.position)
	
	
func shoot():
	var Bullet = ShootBullet.instance()
	
	get_parent().add_child(Bullet)
	Bullet.position = $Node2D/gun.global_position
	
	Bullet.velocity = player.position - Bullet.position
	
	
func _on_Area2D_body_entered(body):
	if body.get_name()=="Player":
		var effect = explode.instance()
		effect.global_position = global_position
		get_tree().current_scene.add_child(effect)
		queue_free()
		phealth.value -=10
	if "Bullet" in body.name:
		var effect = explode.instance()
		effect.global_position = global_position
		get_tree().current_scene.add_child(effect)
		queue_free()
