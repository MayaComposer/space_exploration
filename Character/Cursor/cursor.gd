extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var locator = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	print("parent: ", get_parent())
	print("node: ", locator)
	
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = get_global_mouse_position()