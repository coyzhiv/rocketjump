extends CanvasLayer

func _process(_delta):
	$Label.text = str(Globals.bullet_count)
