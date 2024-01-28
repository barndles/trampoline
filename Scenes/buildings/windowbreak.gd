extends Area2D

@onready var window_sprite = get_node("Window")

#func _ready():
	#window_sprite.play("Broken")
# Called when the node enters the scene tree for the first time.
func on_window_entered(body):
	print("entered")
	window_sprite.play("Broken")

