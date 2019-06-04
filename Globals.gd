extends Node

const UNIT_SIZE = 16

var score = 0

func _ready():
	score = 0
	
func _process(delta):
	if Input.is_action_just_pressed("reload"):
		get_tree().reload_current_scene()