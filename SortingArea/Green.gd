extends "res://SortingArea/SortingArea.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.modulate.g = 255

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	print("area entered green")
	if body.is_in_group("green"):
		Globals.score += 1
	else:
		Globals.score -= 1
