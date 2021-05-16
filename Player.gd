extends KinematicBody2D

var current_state = null

var speed : int = 200
export var jumpForce : int = 400
var gravity : int = 800


var vel : Vector2 = Vector2()

onready var states_map = {
	"idle": $States/Idle,
	"jump": $States/Jump,
	"jab": $States/Jab,
	"crouch": $States/Crouch,
	"run": $States/Run
}

onready var sprite = $AnimatedSprite

func _ready():
	current_state = $States/Idle
	for state_node in $States.get_children():
		state_node.connect("finished", self, "_change_state")
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
