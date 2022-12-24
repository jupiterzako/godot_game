extends Label



func _process(delta):
	var score = Global.points
	text = "Score: %s" % score
