extends Control

@onready var global = get_node("/root/Autoload")
# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Restart.grab_focus()
	update_score(global.score)
	if global.score < 69:
		$hater.show()
	if global.score > 70:
		$"Cool Guy".show()
	
func update_score(score):
	$"Score Label/Score".text = str(score)
	
func _on_restart_pressed():
	global.lives = 5
	global.score = 0
	get_tree().change_scene_to_file("res://Scenes/main_level.tscn")
	
func _on_quit_pressed():
	get_tree().quit()

func _on_restart_focus_entered():
	$VBoxContainer/Restart/StartCross.show()


func _on_restart_focus_exited():
	$VBoxContainer/Restart/StartCross.hide()


func _on_quit_focus_entered():
	$VBoxContainer/Quit/quitCross.show()


func _on_quit_focus_exited():
	$VBoxContainer/Quit/quitCross.hide()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




