extends Line2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var min_point = Vector2()
var max_point = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	min_point = $".".position
	max_point = get_local_mouse_position()

	if min_point.distance_to(max_point) < 200:
		set_points([$".".position, get_local_mouse_position().normalized() * 200])
