extends Node2D
@onready var parent = $".."
var color

# Called when the node enters the scene tree for the first time.
func _ready():
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	parent.modulate = Vector3(color)
