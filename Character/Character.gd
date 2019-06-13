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

const NORMAL = Vector2(0, 0)

var move_speed = 15 * 16

var max_jump_velocity

var min_jump_velocity

var gravity

onready var ignore_velocity = false

#var max_jump_height = 6.00 * Globals.UNIT_SIZE
#var min_jump_height = 1.2 * Globals.UNIT_SIZE
#var jump_duration = 0.6

var velocity = Vector2()

#mass of the character. Taken into account when pushing and pulling
export var mass = 50

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass	

func _get_input():
	if Input.is_action_pressed('space'):
		var mouse_point = get_global_mouse_position()
		velocity = (mouse_point - position).normalized() * move_speed
	else:
		velocity = Vector2(0, 0)
	#reloading the level
	if Input.is_action_just_pressed('reload'):
		get_tree().reload_current_scene()
	
func _process(delta):
	#rotate the sprite
	var angular_speed = 4
	var angle = get_local_mouse_position().angle()
	if abs(angle) > .05:
	    if angle < 0:
	        rotate(-angular_speed*delta)
	    elif angle > 0:
	        rotate(angular_speed*delta)
			
func _physics_process(delta):
	_get_input()
	velocity = move_and_collide(velocity * delta)

#player dies method
func kill():
	get_tree().reload_current_scene()