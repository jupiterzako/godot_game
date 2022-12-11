extends KinematicBody2D

## variables

export (int) var basic_speed = 1000
#export (int) var basic_health = 100
var health = 100
export (int) var basic_damage = 10
export (int) var basic_fireRate = 5
export (int) var basic_numberOfBullets = 1

var ShootBullet := preload("res://scenes/Bullet.tscn")
var explode :=preload("res://scenes/enemies/EnemyExplosion.tscn")

var velocity = Vector2()

## physics

func _physics_process(delta):
	if$HEALTH.value <=0:
		death()
	movement()
	velocity = move_and_slide(velocity)

func _on_timeout():
	self.queue_free()

var timer = null
var delay = 0.2
var can_shoot = true

func _ready():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(delay)
	timer.connect("timeout",self,"on_timeout_complete")
	add_child(timer)
	
func on_timeout_complete():
	can_shoot = true

var heat = 0
var overheated = false
	
func _process(delta):
	print(timer.time_left, " -> ", heat)
	if heat <= 0 :
		overheated=false
	if heat >= 7 or overheated:
		overheated = true
		heat -= 5 * delta
		can_shoot= false
		timer.start()
		$HEAT.value = 0
		
	if(can_shoot and !overheated and timer.time_left <= 0):
		$Node2D.look_at(get_global_mouse_position())
		if Input.is_action_pressed("shoot"):
			shoot()
			heat += 100 * delta
			can_shoot=false
			timer.start()
			print(heat)
	


## movement
var velocity2 = Vector2(0,0)
func movement():
	if $HEALTH.value <= 0:
		death()
	
	if Input.is_action_just_pressed("dash"):
		basic_speed = 100000
	else:
		basic_speed = 1000
		
	var pressedX = false
	var pressedY = false
	
	if Input.is_action_pressed("right") and velocity2.x < 1:
		velocity2.x += 0.01
		pressedX = true
	if Input.is_action_pressed("left") and velocity2.x > -1:
		velocity2.x -= 0.01
		pressedX = true
	if Input.is_action_pressed("down") and velocity2.y < 1:
		velocity2.y += 0.01
		pressedY = true
	if Input.is_action_pressed("up") and velocity2.y > -1:
		velocity2.y -= 0.01
		pressedY = true
		
	if pressedX == false:
		if velocity2.x > 0:
			velocity2.x -= 0.01
		elif velocity2.x < 0:
			velocity2.x += 0.01
		else:
			velocity2.x = 0
			
	if pressedY == false:
		if velocity2.y > 0:
			velocity2.y -= 0.01
		elif velocity2.y < 0:
			velocity2.y += 0.01
		else:
			velocity2.y = 0

	velocity = velocity2 * basic_speed

## shooting

func shoot():
	var Bullet = ShootBullet.instance()
	
	get_parent().add_child(Bullet)
	Bullet.position = $Node2D/gun.global_position

	Bullet.velocity = get_global_mouse_position() - Bullet.position
	$HEAT.value +=1


func death():
	if health <= 0:
		get_tree().reload_current_scene()

func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		var effect = explode.instance()
		effect.global_position = global_position
		get_tree().current_scene.add_child(effect)
		health -= 10
	if "EnemyKamikaze" in body.name:
		health-=10
	if "EnemyMine" in body.name:
		health-=10
	if "EnemyTurret" in body.name:
		health-=10
	if health <= 0:
		death()

	
