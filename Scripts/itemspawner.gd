extends Node

var thrown_object = preload("res://Scenes/falling_object.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	inst(Vector2(-100,0))
	wait_seconds_to_spawn()

func wait_seconds_to_spawn():
	await get_tree().create_timer(3.0).timeout
	inst(Vector2(-100,0))

func inst(pos):
	var instance = thrown_object.instantiate();
	instance.position = pos
	add_child(instance)
