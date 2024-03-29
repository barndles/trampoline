extends Node2D

@onready var player1 = $player1
@onready var player2 = $player2

@onready var global = get_node("/root/Autoload")
@onready var animated_player1 = $player1/Sprite2D
@onready var animated_player2 = $player2/Sprite2D

var p1v = Vector2()
var p2v = Vector2()

@onready var playerlookup = get_node("/root/P1Lookup")

var p1speed = 2
var p2speed = 2

var friction = 0.8
var distance

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _input(event):
		if event.is_action_pressed("quit"):
			get_tree().quit() 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(distance)
	if abs(p1v.x) > 0.3:
		if(playerlookup.p1lu):
			animated_player1.play("walk_lookup")
		else:
			animated_player1.play("walk")
	else:
		animated_player1.stop()
	if abs(p2v.x) > 0.3:
		if(playerlookup.p2lu):
			animated_player2.play("walk_lookup")
		else:
			animated_player2.play("walk")
	else:
		animated_player2.stop()
	pass

func _physics_process(delta):
	distance = abs(player2.position.x - player1.position.x)* 0.0075
	if distance < 1: distance = 0
	#player1
	p1v += Vector2(Input.get_axis("p1_left", "p1_right") * p1speed, 0)
	p1v += Vector2(distance, 0)
	p1v *= friction
	player1.move_and_collide(p1v)
	#player2
	p2v += Vector2(Input.get_axis("p2_left", "p2_right") * p2speed, 0)
	p2v -= Vector2(distance, 0)
	p2v *= friction
	player2.move_and_collide(p2v)
	
