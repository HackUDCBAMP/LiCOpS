extends CharacterBody2D

@export var speed: float = 2.5
const TILE_SIZE = 320

@onready var anim_tree = $AnimationTree
@onready var anim_state = anim_tree.get("parameters/playback")


var init_position = Vector2(0,0)
var input_direction = Vector2(0,0)
var is_moving = false
var next_tile_percent = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	init_position = position
	pass # Replace with function body.

func process_input() -> void:
	if input_direction.y == 0:
		input_direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	if input_direction.x == 0:
		input_direction.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))

	# Si hay alguna dirección distinta de (0,0), empezamos a movernos
	if input_direction != Vector2.ZERO:
		anim_tree.set("parameters/Idle/blend_position", input_direction)
		anim_tree.set("parameters/Walk/blend_position", input_direction)
		
		init_position = position
		is_moving = true
	else:
		anim_state.travel("Idle")

func move(delta) -> void:
	next_tile_percent += speed * delta
	if next_tile_percent >= 1.0:
		position = init_position + (TILE_SIZE * input_direction)
		next_tile_percent = 0.0
		is_moving = false
	else:
		position = init_position + (TILE_SIZE * input_direction * next_tile_percent)

func _physics_process(delta):
	if is_moving == false:
		process_input()
	elif input_direction != Vector2.ZERO:
		anim_state.travel("Walk")
		move(delta)
	else:
		anim_state.travel("Idle")
		is_moving = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
