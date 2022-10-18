extends Camera2D

var player

func _ready():
	player=get_node("/root/world/KinematicBody2D/Camera2D")
	
func _process(_delta):
	position.x=player.position.x
	position.y=player.position.y	
