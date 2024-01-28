extends Node

@onready var resetTime = 0
var thrown_object = preload("res://Scenes/falling_object.tscn")
var help_bubble = preload("res://Scenes/help_bubble.tscn")
var spawn_points = [Vector2(831,307),Vector2(959,307),Vector2(1087,307),Vector2(831,130),Vector2(959,130),Vector2(1087,130)]
# Called when the node enters the scene tree for the first time.
func _ready():
	wait_seconds_to_spawn()

func wait_seconds_to_spawn():
	var rng_location = randi_range(0,5)
	var rng_timer = randf_range(3.0,8.0)
	#
	inst_bubble(spawn_points[rng_location] - Vector2(50,20), rng_timer)
	await get_tree().create_timer(rng_timer).timeout
	inst(spawn_points[rng_location])
	resetTime = resetTime + 1
	wait_seconds_to_spawn()

func inst(pos):
	var instance = thrown_object.instantiate();
	instance.position = pos
	add_child(instance)

func inst_bubble(pos, time):
	var instance = help_bubble.instantiate();
	instance.position = pos
	add_child(instance)
	await get_tree().create_timer(time).timeout
	instance.queue_free()
