extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_position = get_global_mouse_position()
	set_rotation(position.angle_to_point(mouse_position) + deg2rad(180))

func _on_Area2D_area_entered(area):
	print("body entered")
	var parent = area.get_parent()
	if rotation > 0.0 and rotation < 1.0 and parent.is_in_group("ignore") == false:
		parent.add_to_group("ignore")
		print("changing direction")
		parent.move_direction = 1
		parent.velocity.x = parent.move_speed * parent.move_direction
		parent.velocity.y = 0
		print(parent.velocity)
	elif rotation > 3.0 and rotation < 4.0:
		parent.move_direction = -1
		parent.velocity.x = parent.move_speed * parent.move_direction
		parent.velocity.y = 0
		print(parent.velocity)
