extends KinematicBody2D

var speed : int = 200
export var jumpForce : int = 400
var gravity : int = 800

var vel : Vector2 = Vector2()
var grounded : bool = false

var doubleJump : bool = false

onready var sprite = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	vel.x = 0
	
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
	if Input.is_action_pressed("move_right"):
		vel.x += speed
		
	vel = move_and_slide(vel, Vector2.UP)
	
	vel.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") and doubleJump and !is_on_floor():
		vel.y = -1 * jumpForce
		doubleJump = false
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		vel.y = -1 * jumpForce
		doubleJump = true
		
	
		
	if vel.x < 0:
		sprite.flip_h = true
	if vel.x > 0:
		sprite.flip_h = false
