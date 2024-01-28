extends Area2D

@onready var playerlookup = get_node("/root/P1Lookup")

func object_spotted(body):
	playerlookup.p1lu = true

func object_gone(body):
	playerlookup.p1lu = false
