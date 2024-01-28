extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var voiceLine = randi_range(0,8)
	var joke = [$Node/J1,$Node/J2A,$Node/J2B,$Node/J3,$Node/J4,$Node/J5,$Node/J6,$Node/J7,$Node/J8]
	
	await get_tree().create_timer(5).timeout
	joke[voiceLine].play()

func _input(event):
	if event.is_action_pressed("Continue"):
		get_tree().change_scene_to_file("res://Scenes/main_level.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
