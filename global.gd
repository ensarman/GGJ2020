extends Node


# Declare member variables here. Examples:
var damage_start
var life_struct_max : int
var life_struct
var total
var energy
var energy_total
var multiplicador : float
var crear_auto : bool
var pausable : bool

var puntos_ganados_por_auto
var energia_ganados_por_auto 


var show_game_over

func init():
	damage_start = 100
	life_struct_max = 1500
	life_struct = life_struct_max
	total = 0
	energy = 50
	energy_total = 500
	multiplicador = 0.1

	puntos_ganados_por_auto = 1
	energia_ganados_por_auto = 50

	show_game_over = false

# Called when the node enters the scene tree for the first time.
func _ready():
	init()
	# pass # Replace with function body.

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
	crear_auto = true
	pausable = true
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

func _gana_buff(seleccion):
	get_tree().paused = false

func _pausa():
#	get_tree().paused = true
	pass



