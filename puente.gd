extends Node2D
var time_generate_new_oponent = 100 #esto tendria que se aleatorio dependiendo del nivel
const MySmokeResource = preload("res://Auto.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var GrabedInstance= MySmokeResource.instance()
	GrabedInstance.global_position = get_node("SpawAutos").position
#	CurrentEntry.name = "SmokeA"
	#Attach it to the tree
	self.add_child(GrabedInstance)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("Label").text = String(global.life_struct)
	
#	pass
