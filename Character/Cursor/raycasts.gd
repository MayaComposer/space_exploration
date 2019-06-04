extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"



func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	for raycast in get_children():
		for child in get_parent().get_children():
			raycast.add_exception(child)
			raycast.add_exception(child.get_parent())
			for grandchild in child.get_children():
				raycast.add_exception(grandchild)
	
		
