extends Node2D

@onready var player1 = $player1
@onready var player2 = $player2

var p1v = Vector2()
var p2v = Vector2()

var p1speed = 1.5
var p2speed = 1.5

var friction = 0.8

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var distance = abs(player2.position.x - player1.position.x) * 0.01
	print(distance)
	pass

func _physics_process(delta):
	#player1
	p1v += Vector2(Input.get_axis("p1_left", "p1_right") * p1speed, 0)
	p1v *= friction
	player1.move_and_collide(p1v)
	#player2
	p2v += Vector2(Input.get_axis("p2_left", "p2_right") * p2speed, 0)
	p2v *= friction
	player2.move_and_collide(p2v)
	
