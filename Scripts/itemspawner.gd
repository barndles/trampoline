extends Node

var thrown_object = preload("res://Scenes/falling_object.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	inst(Vector2(872.33,200))
	wait_seconds_to_spawn()

func wait_seconds_to_spawn():
	var rng_time = randf_range(3.0,8.0)
	await get_tree().create_timer(rng_time).timeout
	inst(Vector2(872.33,200))
	wait_seconds_to_spawn()

func inst(pos):
	var instance = thrown_object.instantiate();
	instance.position = pos
	add_child(instance)
