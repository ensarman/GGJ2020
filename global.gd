extends Node


# Declare member variables here. Examples:
var life_struct = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func take_damage(var damage):
	life_struct -= damage

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass