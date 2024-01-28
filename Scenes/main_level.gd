extends Node2D
@onready var global = get_node("/root/Autoload")

var points = global.score

# Called when the node enters the scene tree for the first time.
func _ready():
	global.countdown = 6
	musicPlayer()

func _input(event):	
	if event.is_action_pressed("skip"):
		global.countdown -= 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if points < global.score:
		get_node("RescueVehicle").play("bounce")
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
