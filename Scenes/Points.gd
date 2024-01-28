extends Area2D

@onready var global = get_node("/root/Autoload")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_body_entered(body):
	global.score += 17
	body.queue_free()
	print(global.score)
