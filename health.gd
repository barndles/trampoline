extends Node2D

@onready var global = get_node("/root/Autoload")
var currentLives
# Called when the node enters the scene tree for the first time.
func _ready():
	print(get_child(global.lives - 1).name)
	currentLives = global.lives


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if currentLives != global.lives:
		get_child(global.lives).texture = load("res://Sprites/Images/BlackCross.png")
