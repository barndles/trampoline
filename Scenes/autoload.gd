extends Node2D
var lives = 5
var score = 0

var countdown = 6

func _input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit() 
