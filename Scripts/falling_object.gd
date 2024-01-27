extends Node2D

@onready var fallingObject = $"."
@onready var col = $CollisionShape2D
var trampolineHeight

var random = RandomNumberGenerator.new()
var randomVectorInRange = Vector2()

var impulseMultiplier = 500
@onready var player1 = $"../Player/player1"
@onready var player2 = $"../Player/player2"
var v = Vector2() #object velocity
var gravity = 0.98

var bouncing = false
var canBounce = false

# Called when the node enters the scene tree for the first time.
func _ready():
	trampolineHeight = player1.global_position.y #set base bounce height
	
	randomVectorInRange = Vector2(((random.randf()* .5) + 0.25) * -1, ((random.randf()* .5) + 0.25) * -1) #random (0.25-0.75, 0.25-0.75) vector mirrored on each axis
	print(randomVectorInRange)
	fallingObject.apply_impulse(randomVectorInRange * impulseMultiplier)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	if (fallingObject.position.y > trampolineHeight) and canBounce:
		bouncing = true
		canBounce = false
		fallingObject.linear_velocity = Vector2(fallingObject.linear_velocity.x, 0)
		fallingObject.apply_impulse(Vector2(0,-1000))
	if (fallingObject.position.y < trampolineHeight):
		if (fallingObject.position.x > player1.global_position.x) and (fallingObject.position.x < player2.global_position.x):
			canBounce = true
		else: canBounce = false

	
	
	
	
	#TEMPORARY SCENE RELOAD - DEBUGGING ONLY - SPACEBAR
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().reload_current_scene()
