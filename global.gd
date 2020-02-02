extends Node


# Declare member variables here. Examples:
var damage_start = 100
var life_struct_max : int = 2500
var life_struct = life_struct_max
var total = 0
var energy = 50
var energy_total = 500
var multiplicador : float= 0.1

var puntos_ganados_por_auto = 1
var energia_ganados_por_auto = 50

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
	total += puntos_ganados_por_auto
	multiplicador += 0.1
	_add_energy()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _heal(heal :int):
	if life_struct + heal <= life_struct_max:
		life_struct += heal
	else:
		life_struct = life_struct_max
		
func _add_energy():
	if energy + energia_ganados_por_auto <= energy_total:
		energy += energia_ganados_por_auto
	else:
		energy = energy_total
	
	


