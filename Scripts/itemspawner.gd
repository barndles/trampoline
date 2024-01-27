extends Node

var thrown_object = preload("res://Scenes/falling_object.tscn")
var spawn_points = [Vector2(831,327),Vector2(959,327),Vector2(1087,327),Vector2(831,150),Vector2(959,150),Vector2(1087,150)]
# Called when the node enters the scene tree for the first time.
func _ready():
	inst(spawn_points[0])
	wait_seconds_to_spawn()

func wait_seconds_to_spawn():
	await get_tree().create_timer(randf_range(3.0,8.0)).timeout
	inst(spawn_points[randi_range(0,5)]) 
	wait_seconds_to_spawn()

func inst(pos):
	var instance = thrown_object.instantiate();
	instance.position = pos
	add_child(instance)
