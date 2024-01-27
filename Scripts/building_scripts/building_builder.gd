extends Node

var buildingSpawn = preload("res://Scenes/buildings/building_orphanage.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	inst(Vector2(0,0))
	inst(Vector2(0,130))
	pass # Replace with function body.

func inst(pos):
	var instance = buildingSpawn.instantiate();
	instance.position = pos
	add_child(instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
