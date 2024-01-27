extends Node

@onready var buildingSprite = $Sprite2D
var buildingSpawn = preload("res://Scenes/buildings/building_orphanage.tscn")
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	var random_num = rng.randi_range(1,3)
	for n in random_num:
		inst(Vector2(0,((n+1) * (-buildingSprite.texture.get_height()))))
	pass # Replace with function body.

func inst(pos):
	var instance = buildingSpawn.instantiate();
	instance.position = pos
	add_child(instance)
