extends Line2D

@onready var blanket = $"."
@onready var player1 = $"../player1"
@onready var player2 = $"../player2"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	blanket.points[0] = player1.position
	blanket.points[1] = player2.position
	pass
