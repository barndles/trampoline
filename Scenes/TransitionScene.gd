extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _input(event):
	if event.is_action_pressed("Continue"):
		get_tree().change_scene_to_file("res://Scenes/main_level.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass