extends Node2D
@onready var global = get_node("/root/Autoload")

var points = 0
var currentLives = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	global.countdown = 6
	musicPlayer()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if points < global.score:
		get_node("RescueVehicle").play("bounce")
		get_node("RescueVehicle/scored").play()
		points = global.score
	#update_score(global.score,global.countdown)
#	if global.countdown == 0:
#		get_tree().change_scene_to_file("res://Scenes/TransitionScene.tscn")

func musicPlayer():
	var track = randi_range(0,2)
	var album = [$Music1,$Music2,$Music3]
	album[track].play()


func _on_music_1_finished():
	musicPlayer()


func _on_music_2_finished():
	musicPlayer()


func _on_music_3_finished():
	musicPlayer()
