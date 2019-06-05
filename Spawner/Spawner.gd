extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var character_scene = preload("res://Character/Character.tscn")

onready var timer = $Timer

var initial_time = 1.5
var spawn_time = 1.5
# Called when the node enters the scene tree for the first time.
func _ready():
	var character_instance = character_scene.instance()
	add_child(character_instance)
	character_instance.position = self.position
	#timer
	timer.set_one_shot(true)
	timer.start(spawn_time)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	var current_score = Globals.score
#	if abs(Globals.score - current_score) >= 3:
	pass

func _on_Timer_timeout():
	var character_instance = character_scene.instance()
	add_child(character_instance)
	character_instance.position = self.position
	print(character_instance)
	print("timer done")
	print("time: ", spawn_time)
	if Globals.score > 3 and spawn_time == initial_time:
		spawn_time -= 0.5
	elif Globals.score > 6 and spawn_time != initial_time:
		spawn_time -= 0.5
	elif Globals.score > 10 and spawn_time > 0.5:
		spawn_time -= 0.5
	elif Globals.score > 20 and spawn_time > 0.5:
		spawn_time = 0.4
		
	timer.start(spawn_time)
	
