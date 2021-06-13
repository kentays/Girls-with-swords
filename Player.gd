extends KinematicBody2D

var current_state = null

var speed : int = 200
export var jumpForce : int = 400
var gravity : int = 800

export (PackedScene) var Dust
export (PackedScene) var Hadouken

var input_dict : Dictionary

var inside_hurtbox : bool = false

var vel : Vector2 = Vector2()

var facing_right : bool = true

var input_buf = []


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
	"backdash": $States/Backdash,
	"slash": $States/Slash,
	"sweep": $States/Sweep,
	"hadouken": $States/Hadouken,
	"jumping_punch": $States/JumpPunch,
	"fall": $States/Fall,
	"crouch_slash": $States/CrouchSlash,
	"DP": $States/DP,
	"anti_air": $States/AntiAir
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
	try_buffer(event)
	current_state.handle_input(event)

func _physics_process(delta):
	vel.y += gravity * delta
	move_and_slide(vel, Vector2.UP)
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

func block():
	$AudioStreamPlayer.block()

func receive_hit_confirm():
	# called when the state object confirms that it is in a hittable state
	$AudioStreamPlayer.hit()
	
func knockdown():
	$AudioStreamPlayer.knockdown()
	
func whiff():
	$AudioStreamPlayer.whiff()
	
func jump():
	$AudioStreamPlayer.jump()
	
func dash(moving_right):
	$AudioStreamPlayer.dash()
	var dust = Dust.instance()
	dust.set_global_position(position)
	if moving_right:
		dust.flip_right()
	get_parent().add_child(dust)
	
func hadouken(mask: int):
	var h = Hadouken.instance()
	get_parent().add_child(h)
	h.init(facing_right)
	h.set_global_position(position)
	
	
func try_buffer(event):
	for key in input_dict.keys():
		if event.is_action_pressed(input_dict[key]):
			buffer(key)
			
func buffer(key):
	input_buf.push_front(key)
	while len(input_buf) > 4:
		input_buf.pop_back()
	$BufTimer.start()

func _on_BufTimer_timeout():
	input_buf = []
