extends KinematicBody2D

var current_state = null
var other_player_name : String

var speed : int = 200
export var jumpForce : int = 400
var gravity : int = 800

export (PackedScene) var Dust
export (PackedScene) var Hadouken

var input_dict : Dictionary

var inside_hurtbox : bool = false

var vel : Vector2 = Vector2()

var facing_right : bool = true
var grounded : bool = false
var touching_wall : bool = false
var pushback : bool = false
var hitstopped : bool = false

var combo : int = 0

var input_buf = []


onready var states_map = {
	"idle": $States/Idle,
	"block": $States/HitState/Block,
	"jump": $States/Air/Jump,
	"moving_jump": $States/Air/MovingJump,
	"jab": $States/Attack/Jab,
	"kick": $States/Attack/Kick,
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
	"anti_air": $States/Attack/AntiAir,
	"jumping_kick": $States/Attack/JumpKick,
	"jumping_slash": $States/Attack/JumpSlash
}

onready var new_sprite = $Sprite
onready var hurtbox = $HurtArea/HurtBox
onready var hitbox = $HitArea/HitBox

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
	
func start(pos: Vector2):
	self.position = pos
	
func _change_state(state_name: String):
	current_state.exit()
	current_state = states_map[state_name]
	current_state.enter()
	
func _input(event: InputEvent):
	try_buffer(event)
	if hitstopped:
		return
	current_state.handle_input(event)

func _physics_process(delta: float):
	if hitstopped:
		return
	vel.y += gravity * delta
	move_and_slide(vel, Vector2.UP)
	
	inside_hurtbox = false
	for area in $HurtArea.get_overlapping_areas():
		if area.name == "HitArea" and area.owner.name == other_player_name:
			inside_hurtbox = true
	
	if vel.x != 0:
		touching_wall = false
		
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.get_class() == "KinematicBody2D":
			if collision.collider.name == "Hadouken":
				collision.collider.hit_player(name)
				return
			# Pushback running into a player
			if collision.normal.y == 0:
				collision.collider.push(vel.x)
			else:
			# Sliding to prevent landing on top of each other
				grounded = false
				collision.collider.slide_away()
				slide_away()
		
		if collision.collider.name == "Floor":
			grounded = true
			
		if is_on_wall() and collision.collider.name in ["Wall", "Wall2"]:
			touching_wall = true

	current_state.update(delta)
	
	if pushback:
		if abs(vel.x) > 50:
			vel.x = lerp(vel.x, 0, .3)
		else:
			vel.x = 0
			pushback = false
			
func hitstop():
	hitstopped = true
	$AnimationPlayer.stop(false)
	$BufTimer.paused = true
	
func resume():
	hitstopped = false
	$AnimationPlayer.play()
	$BufTimer.paused = false
	
func push(x_vel : int):
	current_state.push(x_vel)


func hit_connect(dmg: int, stun: int, push: Vector2, height: String, knockdown: bool):
	get_parent().hit_player(other_player_name, dmg, stun, push, height, knockdown)
	
func slide_away():
	var mod = 1
	if facing_right:
		mod = -1
	global_position.x += 4 * mod
	
func turn_right():
	facing_right = true
	new_sprite.flip_h = false
	hurtbox.position.x = abs(hurtbox.position.x)
	hitbox.position.x = abs(hitbox.position.x) * -1
	
func turn_left():
	facing_right = false
	new_sprite.flip_h = true
	hurtbox.position.x = abs(hurtbox.position.x) * -1
	hitbox.position.x = abs(hitbox.position.x)

func receive_hit(dmg: int, stun: int, push: Vector2, height: String, knockdown: bool):
	current_state.receive_hit(height)
	if facing_right:
		push.x *= -1
	current_state.damage(dmg)
	current_state.pushback(push)
	if touching_wall:
		get_parent().push_attacker(other_player_name, push.x)
	current_state.stun(stun)
	if knockdown:
		current_state.knockdown()
		
func deduct_health(dmg: int):
	get_parent().deduct_health(name, dmg)

func combo_up():
	combo += 1
	if combo > 1:
		get_parent().combo_on(name, combo)
	
func reset_combo():
	combo = 0
	get_parent().combo_off(name)

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
	
func dash(moving_right: bool):
	$AudioStreamPlayer.dash()
	var dust = Dust.instance()
	dust.set_global_position(position)
	if moving_right:
		dust.flip_right()
	get_parent().add_child(dust)
	
func run():
	$AudioStreamPlayer.run()
	
func walk():
	$AudioStreamPlayer.walk()
	
func stop_sfx():
	$AudioStreamPlayer.stop()
	
func hadouken(mask: int): # make sure this works
	var h = Hadouken.instance()
	get_parent().add_child(h)
	h.init(facing_right)
	h.set_global_position(position)
	h.set_collision_mask_bit(mask, true)
	h.set_collision_layer_bit(mask, true)
	print(h.collision_mask)
	
	
func check_buffer(key: String) -> bool:
	if len(input_buf) < 2:
		return false
	if key in input_buf:
		return true	
	return false
	
func check_complex_buffer(keys: Array) -> bool:
	var keys_copy = keys.duplicate()
	if not facing_right:
		keys_copy = Global.flip_keys(keys)
	keys_copy.invert() # the buffer is always backwards
	return Global.is_subset_of(keys_copy, input_buf)
	
	
func try_buffer(event: InputEvent):
	for key in input_dict.keys():
		if event.is_action_pressed(input_dict[key]):
			buffer(key)
	if event.is_action_released(input_dict["crouch"]):
		buffer("stand")
			
func buffer(key: String):
	input_buf.push_front(key)
	while len(input_buf) > 4:
		input_buf.pop_back()
	$BufTimer.start()

func _on_BufTimer_timeout():
	input_buf = []
	
func change_animation(name: String):
	$AnimationPlayer.play(name)
	
func restart_animation():
	$AnimationPlayer.seek(0)


func _on_AnimationPlayer_animation_finished(anim_name: String):
	# print(anim_name + " has finished")
	current_state._on_animation_finished()


func _on_AudioStreamPlayer_finished():
	current_state._on_audio_finished()




	
		
