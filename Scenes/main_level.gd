extends Node2D
@onready var global = get_node("/root/Autoload")

# Called when the node enters the scene tree for the first time.
func _ready():
	update_score(global.score)

func update_score(score):
	$Points.text = str(score)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_score(global.score)
