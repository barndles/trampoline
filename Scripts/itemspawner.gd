extends Node

var thrown_object = preload("res://Scenes/falling_object.tscn")
@onready var t = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	inst(Vector2(-80,0))
	wait_seconds_to_spawn()

func wait_seconds_to_spawn():
	await get_tree().create_timer(3.0).timeout
	print("timer is working")

func inst(pos):
	var instance = thrown_object.instantiate();
	instance.position = pos
	add_child(instance)
