extends Node

@onready var buildingSprite = $Sprite2D
var array = [preload("res://Scenes/buildings/building_orphanage.tscn"), preload("res://Scenes/buildings/building_oldhome.tscn")]
var buildingSpawn = preload("res://Scenes/buildings/building_orphanage.tscn")
var babySpawn = preload("res://Scenes/falling_object.tscn")
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	for n in 3:
		inst(Vector2(0,((n+1) * (-buildingSprite.texture.get_height()))))

func inst(pos):
	var rng_Floors = rng.randi_range(0,1)
	var floor_select = array[rng_Floors]
	var instance = floor_select.instantiate();
	instance.position = pos
	add_child(instance)
	move_child(instance, 0)
