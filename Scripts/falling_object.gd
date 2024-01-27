extends Node2D

@onready var fallingObject = $"."
@onready var col = $CollisionShape2D

var random = RandomNumberGenerator.new()
var randomVectorInRange = Vector2()

var impulseMultiplier = 300


var v = Vector2() #object velocity
var gravity = 0.98


# Called when the node enters the scene tree for the first time.
func _ready():
	
	randomVectorInRange = Vector2((random.randf()) * -1, random.randf() * -1) #random (0-1, 0-1) vector mirrored on each axis
	print(randomVectorInRange)
	fallingObject.apply_impulse(randomVectorInRange * impulseMultiplier)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
