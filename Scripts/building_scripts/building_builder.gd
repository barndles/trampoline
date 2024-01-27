extends Node

var buildingSpawn = preload("res://Scenes/buildings/building_orphanage.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var instance = buildingSpawn.instantiate();
	add_child(instance)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
