extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var character_scene = load("res://Character/Character.tscn") as PackedScene

onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	#timer
	timer.set_one_shot(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_Timer_timeout():
	var character_instance = character_scene.instance()
	add_child(character_instance)
	print(character_instance)
	print("timer done")
	timer.start(1.0)
	
