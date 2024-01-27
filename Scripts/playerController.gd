extends Node2D

@onready var player1 = $player1
@onready var player2 = $player2

var p1v = Vector2()
var p2v = Vector2()

var p1speed = 7
var p2speed = 7

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	#player1
	p1v = Vector2(Input.get_axis("p1_left", "p1_right") * p1speed, 0)
	player1.move_and_collide(p1v)
	#player2
	p2v = Vector2(Input.get_axis("p2_left", "p2_right") * p2speed, 0)
	player2.move_and_collide(p2v)
	
