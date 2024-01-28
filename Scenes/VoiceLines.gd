extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	var joke = get_child(randi_range(0, get_child_count()))
	
	await get_tree().create_timer(randi_range(10, 20)).timeout
	joke.play()
