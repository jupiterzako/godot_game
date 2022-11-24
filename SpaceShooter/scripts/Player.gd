extends KinematicBody2D

## variables

export (int) var basic_speed = 100
export (int) var basic_health = 100
var health = basic_health
export (int) var basic_damage = 10
export (int) var basic_fireRate = 5
export (int) var basic_numberOfBullets = 1

var ShootBullet := preload("res://scenes/Bullet.tscn")
var explode :=preload("res://scenes/enemies/EnemyExplosion.tscn")

var velocity = Vector2()

## physics

func _physics_process(delta):
	movement()
	velocity = move_and_slide(velocity)
		
func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()
		
	$Node2D.look_at(get_global_mouse_position())

## movement

func movement():
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

## shooting

func shoot():
	var Bullet = ShootBullet.instance()
	
	get_parent().add_child(Bullet)
	Bullet.position = $Node2D/gun.global_position

	Bullet.velocity = get_global_mouse_position() - Bullet.position

func death():
	if health == 0:
		get_tree().reload_current_scene()

func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		var effect = explode.instance()
		effect.global_position = global_position
		get_tree().current_scene.add_child(effect)
		health=health-10
	if "EnemyKamikaze" in body.name:
		health=health-10
	if "EnemyMine" in body.name:
		health=health-10
	if "EnemyTurret" in body.name:
		health=health-10
	if health == 0:
		death()

	
