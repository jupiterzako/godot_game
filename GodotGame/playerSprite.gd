extends Sprite

func _process(delta:float) -> void:
	look_at(get_global_mouse_position())
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

	rotation_degrees = rotation_degrees + 90 


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
