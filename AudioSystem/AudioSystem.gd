extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var layers = []
var sliders = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var layers_temp = $Layers.get_children()
	for layer in layers_temp:
		layers.append(layer)
		layer.set_volume_db(-72)
	
	var sliders_temp = $Sliders.get_children()
	for slider in sliders_temp:
		sliders.append(slider)
	
	for layer in layers:
		layer.play()
	print(sliders)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for layer in layers:
		layer.set_volume_db(sliders[layer.get_index()].value)
