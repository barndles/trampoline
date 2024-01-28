extends RichTextLabel

@onready var global = get_node("/root/Autoload")

func _process(delta):
	text = "SCORE: " + str(global.score)
