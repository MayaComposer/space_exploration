extends RayCast2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
#	add_exception(get_node('../world.tscn'))
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	#set the max vector 
	#make raycast follow mouse
	# locator_root.position = get_local_mouse_position()
	set_cast_to(get_local_mouse_position().normalized() * 200)
#	position = get_global_mouse_position()
