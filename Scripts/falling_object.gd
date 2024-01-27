extends Node2D

@onready var fallingObject = $"."
@onready var col = $CollisionShape2D
var trampolineHeight = 583.405 #dont mind me hardcoding the height

var random = RandomNumberGenerator.new()
var randomVectorInRange = Vector2()

var impulseMultiplier = 500


var v = Vector2() #object velocity
var gravity = 0.98

var bouncing = false
var canBounce = true

# Called when the node enters the scene tree for the first time.
func _ready():
	
	randomVectorInRange = Vector2(((random.randf()* .5) + 0.25) * -1, ((random.randf()* .5) + 0.25) * -1) #random (0.25-0.75, 0.25-0.75) vector mirrored on each axis
	print(randomVectorInRange)
	fallingObject.apply_impulse(randomVectorInRange * impulseMultiplier)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if (fallingObject.position.y > trampolineHeight) and canBounce: bouncing = true
	if bouncing: 
		bouncing = false
		canBounce = false
		fallingObject.apply_impulse(Vector2(0,500))
	if fallingObject.position.y < trampolineHeight: canBounce = true
	
	
	
	
	#TEMPORARY SCENE RELOAD - DEBUGGING ONLY - SPACEBAR
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().reload_current_scene()
