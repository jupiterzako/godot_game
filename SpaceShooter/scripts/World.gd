extends Area2D

var preEnemies = [
	preload("res://scenes/enemies/EnemyKamikaze.tscn"),
	preload("res://scenes/enemies/EnemyMine.tscn"),
	preload("res://scenes/enemies/EnemyTurret.tscn")
]


onready var enemy_timer = $Enemy_Spawn_Timer
var next_spawn = 0.5




func _ready():
	randomize()
	enemy_timer.start(next_spawn)

func _on_Enemy_Spawn_Timer_timeout():
	var enemies = preEnemies[randi()% preEnemies.size()]
	var enemy = enemies.instance()
	var p = get_node("Player").global_position
	enemy.position = Vector2(rand_range(p.x+1500,p.x-1500),rand_range(p.y+1500,p.y-1500))
	while enemy.position.x < p.x+1000 and enemy.position.x > p.x-1000 and enemy.position.y < p.y+1000 and  enemy.position.y > p.y-1000:
		p = get_node("Player").global_position
		enemy.position = Vector2(rand_range(p.x+1500,p.x-1500),rand_range(p.y+1500,p.y-1500))
	
	get_tree().current_scene.add_child(enemy)
	enemy_timer.start(next_spawn)
	
	



