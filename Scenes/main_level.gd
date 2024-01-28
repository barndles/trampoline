extends Node2D
@onready var global = get_node("/root/Autoload")

# Called when the node enters the scene tree for the first time.
func _ready():
	update_score(global.score)
	global.countdown = 6
	global.lives = 5

func update_score(score):
	$Points.text = str(score)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_score(global.score)
	if global.countdown == 0:
		get_tree().change_scene_to_file("res://Scenes/TransitionScene.tscn")
