extends Node2D

@onready var global = get_node("/root/Autoload")
@onready var fallingObject = self
@onready var col = $CollisionShape2D
var trampolineHeight

var random = RandomNumberGenerator.new()
var randomVectorInRange = Vector2()
var impulseMultiplier = 500
@onready var player1 = $"/root/Main_Level/Player/player1"
@onready var player2 = $"/root/Main_Level/Player/player2"
var v = Vector2() #object velocity
var gravity = 0.98

var bouncing = false
var canBounce = false
var bounceAngle = Vector2()
@onready var animatedSprite = $Sprite2D

var distanceToP1
var distanceToP2
var trampolineTightness
var explode = true

@onready var flasher = $flasher

# Called when the node enters the scene tree for the first time.
func _ready():
	trampolineHeight = player1.global_position.y #set base bounce height
	
	randomVectorInRange = Vector2(((random.randf()* .5) + 0.25) * -1, ((random.randf()* .5) + 0.25) * -1) #random (0.25-0.75, 0.25-0.75) vector mirrored on each axis
	print(randomVectorInRange)
	fallingObject.apply_impulse(randomVectorInRange * impulseMultiplier)
	
	

func _process(delta):
	distanceToP1 = abs(fallingObject.position.x - player1.global_position.x) # we only care about the distance on the x axis, so we can just subtract :)
	distanceToP2 = abs(fallingObject.position.x - player2.global_position.x)
	trampolineTightness = abs(player2.global_position.x - player1.global_position.x)/100# tightness is just a matter of how far the players are apart
	
	# compute bounce angle 
	bounceAngle.x = ((0 - distanceToP1) + distanceToP2) * trampolineTightness
	
	#baby landing (badly)
	#if(fallingObject)
	if fallingObject.z_index != 0: queue_free()
	

		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if (fallingObject.linear_velocity.y > 0):
		animatedSprite.play("Falling")
	if (fallingObject.position.y > trampolineHeight) and canBounce:
		if explode:
			global.lives -= 1
			explode = false
			animatedSprite.play("Crash")
			flasher.stop()
			fallingObject.linear_velocity = Vector2(0, -100)
	if (fallingObject.position.y < trampolineHeight):
		if (fallingObject.position.x > player1.global_position.x) and (fallingObject.position.x < player2.global_position.x):
			canBounce = true
		else: canBounce = false


	#TEMPORARY SCENE RELOAD - DEBUGGING ONLY - SPACEBAR
	if Input.is_action_just_pressed("ui_accept"):
		global.lives = 5
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("ui_down"): global.lives -= 1



func _on_body_entered(body):

	animatedSprite.play("Crash")
	fallingObject.sleeping = true
	$Smack.play()



func _on_area_2d_area_entered(area):
	pass # Replace with function body.
