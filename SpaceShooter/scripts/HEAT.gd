extends ProgressBar

func _ready():
	if value ==0:
		get_tree().reload_current_scene()
