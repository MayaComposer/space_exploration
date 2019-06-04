extends "res://Character/StateMachine/StateMachine.gd"

var tick = 0

func _ready():
	add_state("idle")
	add_state("walk")
	add_state("jump")
	add_state("fall")
	add_state("push")
	add_state("pull")
	call_deferred("set_state", states.idle)

func _input(event):
	if Input.is_action_pressed('space') && parent.is_grounded:
		parent._jump()
	if Input.is_action_just_released('space') && parent.velocity.y < parent.min_jump_velocity:
		parent._fall()

func _state_logic(delta): #defines what each state does
	pass
	
func _get_transition(delta): #takes input to transition between state
	match state:
		states.idle:
			if !parent.is_grounded:
				if parent.velocity.y < 0:
					return states.jump
			#move to walk
			elif parent.velocity.x >= 64 || parent.velocity.x <= -64:
				return states.walk
		states.walk:
			if !parent.is_grounded:
				if parent.velocity.y < 0:
					return states.jump
			elif abs(parent.velocity.x) < 64:
				return states.idle
		states.jump:
			if parent.is_grounded:
				return states.idle
		states.fall:
			pass
		states.push:
			pass
		states.pull:
			pass
	return null

func _enter_state(new_state, old_state):
	print(state)

func _exit_state(new_state, old_state):
	pass