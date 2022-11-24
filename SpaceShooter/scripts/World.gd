extends Area2D

var preEnemies = [
	preload("res://scenes/enemies/EnemyKamikaze.tscn"),
	preload("res://scenes/enemies/EnemyMine.tscn"),
#	preload("res://scenes/enemies/EnemyTurret.tscn")
]


onready var enemy_timer = $Enemy_Spawn_Timer
var next_spawn = 2.0



func _ready():
	randomize()
	enemy_timer.start(next_spawn)

func _on_Enemy_Spawn_Timer_timeout():
	var enemies = preEnemies[randi()% preEnemies.size()]
	var enemy = enemies.instance()
	enemy.position = Vector2(rand_range(-1500,1500),rand_range(-1000,1000))
	while enemy.position.x < 1000 and enemy.position.x > -1000 and enemy.position.y <500 and  enemy.position.y > -500:
		enemy.position = Vector2(rand_range(-1500,1500),rand_range(-1000,1000))
	
	get_tree().current_scene.add_child(enemy)
	enemy_timer.start(next_spawn)
	
	



