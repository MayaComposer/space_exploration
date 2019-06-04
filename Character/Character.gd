extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
#to do:
#	- Find vector to mouse pos
#	- Move character to mouse pos
#	- Keep moving when pulling even when object raycast isn't colliding with target anymore
#	- Make character move to mouse pos in one go,
#	without having to hold left click
#	- Add more spikes

const PULL_SPEED = 220

const SLOPE_STOP = 0

const UP = Vector2(0, -1)

var move_speed = 15 * 16

var max_jump_velocity

var min_jump_velocity

var gravity

onready var ignore_velocity = false

#var max_jump_height = 6.00 * Globals.UNIT_SIZE
#var min_jump_height = 1.2 * Globals.UNIT_SIZE
#var jump_duration = 0.6

var velocity = Vector2()

var collider

var move_direction

var target = null

var pulling = false

var is_grounded

var is_jumping

var stamina = 100

#mass of the character. Taken into account when pushing and pulling
export var mass = 50

#position of mouse
var mouse_point

#vector to target
var target_vector

#current player position
var current_pos

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#set speed
	velocity.y = move_speed
	randomize()
	var rand_val = rand_range(0.0, 100.0)
	print(rand_val)
	$Sprite.modulate.g = 0 if rand_val < 50 else 255
	
	if $Sprite.modulate.g == 0:
		add_to_group("purple")
	else:
		add_to_group("green")
		
	position = get_parent().position

func _physics_process(delta):
	#get input
	get_input()
	velocity = move_and_slide(velocity, UP, SLOPE_STOP)

func _get_h_weight():
	return 0.2 if is_grounded else 0.1

func _input(event):
#	if Input.is_action_pressed('space') && is_grounded:
#		velocity.y = max_jump_velocity
#		is_jumping = true
#		print("grounded: ", is_grounded)
#		print("jumping: ", is_jumping)
#	if Input.is_action_just_released('space') && velocity.y < min_jump_velocity:
#		velocity.y = min_jump_height
#		print("grounded: ", is_grounded)
#		print("jumping: ", is_jumping)
	pass


func get_input():
#	#walking
#	move_direction = -int(Input.is_action_pressed('left')) + int(Input.is_action_pressed('right'))
#
#	velocity.x = lerp(velocity.x, move_speed * move_direction, _get_h_weight())

	#reloading the level
	if Input.is_action_just_pressed('reload'):
		get_tree().reload_current_scene()


#player dies method
func kill():
	get_tree().reload_current_scene()