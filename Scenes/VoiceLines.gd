extends Node
var jokeNum = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	for n in 9:
		var joke = get_child(jokeNum)
		jokeNum += 1
		await get_tree().create_timer(randi_range(10, 20)).timeout
		joke.play()
