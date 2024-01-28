extends Node2D

@onready var global = get_node("/root/Autoload")
# Called when the node enters the scene tree for the first time.
func _ready():
	global.lives = 5

func _input(event):
	if event.is_action_pressed("Continue"):
		get_tree().change_scene_to_file("res://Scenes/main_level.tscn")
	if event.is_action_pressed("quit"):
		get_tree().quit() 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
