extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$"VBoxContainer/Start Game".grab_focus()
	$"K-9 KATCHERS_TITLE".play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit() 

func _on_start_game_pressed():
	$VBoxContainer/Starting.play()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://Scenes/main_level.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_settings_pressed():
	#get_tree().change_scene_to_file("res://Scenes/Menus/Settings.tscn")
	pass


func _on_start_game_focus_entered():
	$"VBoxContainer/Start Game/startCross".show()

func _on_start_game_focus_exited():
	$"VBoxContainer/Start Game/startCross".hide()

func _on_settings_focus_entered():
	$VBoxContainer/Settings/setCross.show()


func _on_settings_focus_exited():
	$VBoxContainer/Settings/setCross.hide()


func _on_quit_focus_entered():
	$VBoxContainer/Quit/quitCross.show()


func _on_quit_focus_exited():
	$VBoxContainer/Quit/quitCross.hide()
