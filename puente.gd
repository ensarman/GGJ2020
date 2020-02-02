extends Node2D
var time_generate_new_oponent = 100 #esto tendria que se aleatorio dependiendo del nivel
const MySmokeResource = preload("res://Auto.tscn")
const slime = preload("res://Slime.tscn")
const bonus = preload("res://bonus.tscn")
const pausa = preload("res://Pausa.tscn")
#const slime = preload("res://Auto.tscn")
var damage_temp:int = 10
var GrabedInstance
var type_car:int = 0
var speed :int = 200
var damage:int = 10
var texture:Texture 

var bus = preload("res://sprite/2/bus22.png")
var camioneta = preload("res://sprite/2/camioneta.png")
var camioncito = preload("res://sprite/2/camioncito.png")
#var compacto = preload("res://sprite/compacto.png")
var carrito = preload("res://sprite/2/carrito.png")
var channel5 = preload("res://sprite/2/channel5.png")
var policia = preload("res://sprite/2/policia.png")
var ambulancia = preload("res://sprite/2/ambulancia.png")

#var puente1 = preload("res://sprite/2/puente.png")
#var puente2 = preload("res://sprite/2/puente2.png")
#var puente3 = preload("res://sprite/2/puente3.png")

var vector = Vector2()
var porc
var  spri :Texture 
var  puente :Texture 

var slime1 = preload("res://sprite/2/taladro.png")
var slime2 = preload("res://sprite/2/ladri.png")
var slime3 = preload("res://sprite/2/truck2.png")
var requered_energy

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = 5
	get_parent().get_node("Interface/life_struct").max_value = global.life_struct_max
	get_parent().get_node("Interface/enegy").max_value = global.energy_total
#	GrabedInstance= MySmokeResource.instance()
#	GrabedInstance.global_position = $SpawAutos.position
#	GrabedInstance.speed = 200
#	GrabedInstance.damage = global.damage_start * global.multiplicador
#	GrabedInstance.type_car = type_car
#	GrabedInstance.texture = bus
#	self.add_child(GrabedInstance)
	global.crear_auto = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	get_parent().get_node("Interface/Puntaje").text = String(global.total)
	get_parent().get_node("Interface/life_struct").value = global.life_struct
	get_parent().get_node("Interface/life_struct/Label2").text = String(global.life_struct_max)
	get_parent().get_node("Interface/enegy").value = global.energy
	get_parent().get_node("Interface/enegy/Label2").text = String(global.energy_total)
	porc = (global.life_struct * 100) / global.life_struct_max
	
	if 80< porc  && porc <= 100 :
		$Puente.frame = 0
	elif 60< porc  && porc <= 80 :
		$Puente.frame = 1
	elif 40< porc  && porc <= 60 :
		$Puente.frame = 2
	elif 1< porc  && porc <= 40 :
		$Puente.frame = 3
	else:
		$Puente.frame = 4
	
	
	porc = (global.energy * 100) / global.energy_total
	if global.energy < 50:
		$Buttons/Button.visible = 0
	else:
		$Buttons/Button.visible = 1
		
	if global.energy < 100:
		$Buttons/Button2.visible = 0
	else:
		$Buttons/Button2.visible = 1
		
	if global.energy < 150:
		$Buttons/Button3.visible = 0
	else:
		$Buttons/Button3.visible = 1
	if global.total%5 == 0 && global.total != 0 && global.pausable == true:
		global.pausable = false
		GrabedInstance= bonus.instance()
		GrabedInstance.set_global_position($Center.position)
		self.add_child(GrabedInstance)
	if global.crear_auto == true:
		_create_car()

func _test():
	print("ingresa a test")
	pass
func _on_Area2D_body_exited(body):
	body.text = ""
	pass # Replace with function body.


func _on_Timer_timeout():
	
#	_create_car()
	pass # Replace with function body.

func _create_car():
	GrabedInstance= MySmokeResource.instance()
	GrabedInstance.global_position = $SpawAutos.position
	var damage_const = global.damage_start * global.multiplicador
	type_car= randi()%6
	if type_car == 0:
		speed = 200 + damage_const
		damage = 3+ damage_const
		texture = bus
	elif type_car == 1:
		speed = 180+ damage_const
		damage = 4+ damage_const
		texture=camioneta
	elif type_car == 2:
		speed = 150+ damage_const
		damage = 5 + damage_const
		texture=camioncito
	elif type_car == 3:
		speed = 110+ damage_const
		damage = 6 + damage_const
		texture=carrito
	elif type_car == 4:
		speed = 100+ damage_const
		damage = 7 + damage_const
		texture=channel5
	elif type_car == 5:
		speed = 100+ damage_const
		damage = 8 + damage_const
		texture=policia
	else:
		speed = 90+ damage_const
		damage = 40 + damage_const
		texture=ambulancia
	
	 
	GrabedInstance.speed = speed
	GrabedInstance.damage = damage
	GrabedInstance.type_car = type_car
	GrabedInstance.texture = texture
	global.crear_auto = false
	self.add_child(GrabedInstance)
	pass

func _on_end_body_entered(body):
	$Timer.wait_time -= global.total * 0.001
	global.add_point()
	body.free()
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	global.take_damage(body.damage)
	body.text = '-'+String(body.damage)
	pass # Replace with function body.

func _on_Button_button_up():
	_create_buff(1, 1 +global.damage_start* global.multiplicador)
	pass # Replace with function body.

func _on_Button2_button_up():
	_create_buff(2, 2 + global.damage_start * global.multiplicador)
	pass # Replace with function body.

func _on_Button3_button_up():
	_create_buff(3, 3 + global.heal_start * global.multiplicador)
	pass # Replace with function body.

func _create_buff(slime_num: int, heal:int):
	var death_time
	var pos = randi()%5+1
	if slime_num==1:
		texture = slime1
		requered_energy = 50
		death_time = 2
	elif slime_num==2:
		texture = slime2
		requered_energy = 100
		death_time = 3
	else:
		texture = slime3
		requered_energy = 150
		death_time = 5
		
	if ((global.energy - requered_energy) >= 0):
		GrabedInstance = slime.instance()
		GrabedInstance = slime.instance()
		GrabedInstance.heal = heal
		GrabedInstance.texture = texture
		
		GrabedInstance.global_position = get_node("SpawHeal/Position2D"+String(pos)).position
		GrabedInstance.death_time = death_time
		global.energy -= requered_energy
		self.add_child(GrabedInstance)
	pass




func _on_life_struct_value_changed(value):
	if value == 0:
		print("perdiste")
		global.show_game_over = true
		queue_free()
		get_tree().change_scene("res://start.tscn")


func _on_Vida_button_up():
	global._gana_buff(1)
	pass # Replace with function body.


func _on_Cura_button_up():
	global._gana_buff(2)
	pass # Replace with function body.


func _on_Energia_button_up():
	global._gana_buff(3)
	pass # Replace with function body.


func _on_Pausa_button_up():
	GrabedInstance= pausa.instance()
	GrabedInstance.set_global_position($Center.position)
	self.add_child(GrabedInstance)
	pass # Replace with function body.
