extends Area2D

@onready var playerlookup = get_node("/root/P1Lookup")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func object_spotted(body):
	playerlookup.p2lu = true

func object_gone(body):
	playerlookup.p2lu = false
