extends Node
var jokeNum = 0
@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _process(delta):
	var joke = get_child(jokeNum)
	if timer.time_left <= delta:
		jokeNum += 1
		joke.play()
