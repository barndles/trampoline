extends Node

@onready var resetTime = 0
@onready var last_spawn = 0
@onready var global = get_node("/root/Autoload")

var obj_good = [preload("res://Scenes/falling_object.tscn"), preload("res://Scenes/Falling_Grandpa.tscn"),preload("res://Scenes/Falling_Cat.tscn")]
var obj_bad = [preload("res://Scenes/Falling_Bricks.tscn"), preload("res://Scenes/Fire_extinguisher.tscn")]
var help_bubble = preload("res://Scenes/help_bubble.tscn")
var window_breaker = preload("res://Scenes/windowbreaker.tscn")
var spawn_points = [Vector2(831,307),Vector2(959,307),Vector2(1087,307),Vector2(831,130),Vector2(959,130),Vector2(1087,130)]
# Called when the node enters the scene tree for the first time.
func _ready():
	wait_seconds_to_spawn()

func wait_seconds_to_spawn():
	var rng_location = randi_range(0,5)
	while(rng_location == last_spawn):
		rng_location = randi_range(0,5)
	last_spawn = rng_location
	var rng_timer = randf_range(3.0,8.0)
	inst_bubble(spawn_points[rng_location] - Vector2(50,20), rng_timer)
	await get_tree().create_timer(rng_timer).timeout
	inst(spawn_points[rng_location])
	resetTime = resetTime + 1
	wait_seconds_to_spawn()

func inst(pos):
	var instance = object_select().instantiate()
	var instance_wb = window_breaker.instantiate()
	instance.position = pos
	instance_wb.position = pos
	add_child(instance)
	add_child(instance_wb)
	await get_tree().create_timer(1.0).timeout
	instance_wb.queue_free()
	
func object_select():
	var rng_randomization = randi_range(1,5)
	if(rng_randomization % 2 == 1):
		return obj_good[randi_range(0,2)]
	if(rng_randomization % 2 == 0):
		return obj_bad[randi_range(0,1)]

func inst_bubble(pos, time):
	var instance = help_bubble.instantiate();
	instance.position = pos
	add_child(instance)
	await get_tree().create_timer(time).timeout
	instance.queue_free()
