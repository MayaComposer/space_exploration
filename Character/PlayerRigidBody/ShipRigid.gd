extends RigidBody2D

var thrust = Vector2(0, 50)

func _ready():
	pass
	
func _integrate_forces(state):
	if Input.is_action_pressed('space'):
		set_applied_force(thrust)
	else:
		set_applied_force(Vector2())

#player dies method
func kill():
	get_tree().reload_current_scene()