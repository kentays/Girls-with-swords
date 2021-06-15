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
	"block": $States/HitState/Block,
	"jump": $States/Air/Jump,
	"moving_jump": $States/Air/MovingJump,
	"jab": $States/Attack/Jab,
	"crouch": $States/Crouch,
	"run": $States/Move/Run,
	"hitstun": $States/HitState/HitStun,
	"crouch_jab": $States/Attack/CrouchJab,
	"knockdown": $States/Knockdown,
	"crouch_block": $States/HitState/CrouchBlock,
	"walk": $States/Move/Walk,
	"backdash": $States/Move/Backdash,
	"slash": $States/Attack/Slash,
	"sweep": $States/Attack/Sweep,
	"hadouken": $States/Attack/Hadouken,
	"jumping_punch": $States/Attack/JumpPunch,
	"fall": $States/Air/Fall,
	"crouch_slash": $States/Attack/CrouchSlash,
	"DP": $States/Attack/DP,
	"anti_air": $States/Attack/AntiAir
}

onready var sprite = $AnimatedSprite
onready var new_sprite = $Sprite
onready var hurtbox = $Area2D/HurtBox
onready var hitbox = $HitBox

func _ready():
	current_state = $States/Idle
	for state_node in $States.get_children():
		if state_node.get_children():
			for sub_node in state_node.get_children():
				sub_node.connect("finished", self, "_change_state")
				sub_node.map_inputs(input_dict)
		else:
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
	
func hit_connect(dmg: int, stun: int, push: Vector2, height: String):
	pass
	
func turn_right():
	facing_right = true
	sprite.flip_h = false
	new_sprite.flip_h = false
	hurtbox.position.x = abs(hurtbox.position.x)
	hitbox.position.x = abs(hitbox.position.x) * -1
	
func turn_left():
	facing_right = false
	sprite.flip_h = true
	new_sprite.flip_h = true
	hurtbox.position.x = abs(hurtbox.position.x) * -1
	hitbox.position.x = abs(hitbox.position.x)

func receive_hit(dmg: int, stun: int, push: Vector2, height: String):
	current_state.receive_hit(height)
	if facing_right:
		push.x *= -1
	current_state.push(push)
	current_state.stun(stun)

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
	
func land():
	$AudioStreamPlayer.land()
	
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
	
func change_animation(name: String):
	$AnimatedSprite.play(name)
	$AnimationPlayer.play(name)
