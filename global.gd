extends Node


# Declare member variables here. Examples:
var life_struct : int= 10000
var total = 0
var energy = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func take_damage(damage):
	if (life_struct - damage <= 0):
		life_struct = 0
	else:
		life_struct -= damage

func lose():
	self.free()
	
func add_point():
	total += 1
	energy += 50
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
