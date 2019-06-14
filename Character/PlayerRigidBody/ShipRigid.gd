extends RigidBody2D

var thrust = Vector2(0, 250)
var torque = 20000

func _ready():
	pass
	
func _integrate_forces(state):
	#break	
	if Input.is_action_pressed('break'):
		set_applied_force(thrust * -1)
	#add thrust force
	elif Input.is_action_pressed('space'):
		set_applied_force(state.get_total_gravity() + thrust.rotated(get_rotation()))
	else:
		set_applied_force(Vector2())
	
	
	#rotation
	var t = int(Input.is_action_pressed('right')) - int(Input.is_action_pressed('left'))
	set_applied_torque(torque * t)

#player dies method
func kill():
	get_tree().reload_current_scene()