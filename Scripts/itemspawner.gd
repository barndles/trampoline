extends Node

var thrown_object = preload("res://Scenes/falling_object.tscn")
var spawn_points = [Vector2(831,307),Vector2(959,307),Vector2(1087,307),Vector2(831,130),Vector2(959,130),Vector2(1087,130)]
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
