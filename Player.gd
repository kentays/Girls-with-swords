extends KinematicBody2D

var current_state = null

var speed : int = 200
export var jumpForce : int = 400
var gravity : int = 800

var input_dict = null

var inside_hurtbox : bool = false

var vel : Vector2 = Vector2()

var facing_right : bool = true


onready var states_map = {
	"idle": $States/Idle,
	"block": $States/Block,
	"jump": $States/Jump,
	"moving_jump": $States/MovingJump,
	"jab": $States/Jab,
	"crouch": $States/Crouch,
	"run": $States/Run,
	"hitstun": $States/HitStun,
	"crouch_jab": $States/CrouchJab,
	"knockdown": $States/Knockdown,
	"crouch_block": $States/CrouchBlock,
	"walk": $States/Walk,
	"backdash": $States/Backdash
}

onready var sprite = $AnimatedSprite
onready var hurtbox = $Area2D/HurtBox
onready var hitbox = $HitBox

func _ready():
	current_state = $States/Idle
	for state_node in $States.get_children():
		state_node.connect("finished", self, "_change_state")
		state_node.map_inputs(input_dict)
	_change_state("idle")
	
func _change_state(state_name):
	current_state.exit()
	current_state = states_map[state_name]
	current_state.enter()
	
func _input(event):
	current_state.handle_input(event)

func _physics_process(delta):
	current_state.update(delta)
	

func _on_AnimatedSprite_animation_finished():
	current_state._on_animation_finished()
	
func hit_connect():
	pass
	
func turn_right():
	facing_right = true
	sprite.flip_h = false
	hurtbox.position.x = 23
	
func turn_left():
	facing_right = false
	sprite.flip_h = true
	hurtbox.position.x = -23
	
func stand():
	hitbox.stand()
	hurtbox.stand()
	
	
func crouch():
	hitbox.crouch()
	hurtbox.crouch()
