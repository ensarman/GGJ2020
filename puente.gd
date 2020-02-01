extends Node2D
var time_generate_new_oponent = 100 #esto tendria que se aleatorio dependiendo del nivel
const MySmokeResource = preload("res://Auto.tscn")
const slime = preload("res://Slime.tscn")
#const slime = preload("res://Auto.tscn")
var damage_temp:int = 10
var GrabedInstance
var type_car:int = 0
var speed :int = 200
var damage:int = 10
var texture:Texture 

var bus = preload("res://sprite/bus.png")
var camioneta = preload("res://sprite/camioneta.png")
var combi = preload("res://sprite/combi.png")
var compacto = preload("res://sprite/compacto.png")
var convertible = preload("res://sprite/convertible.png")
var furgon = preload("res://sprite/furgon.png")
var hatchbag = preload("res://sprite/hatchbag.png")
var micro = preload("res://sprite/micro.png")
var sedanantiguo = preload("res://sprite/sedanantiguo.png")
var smart = preload("res://sprite/smart.png")
var stationwagon = preload("res://sprite/stationwagon.png")
var vector = Vector2()

var  spri :Texture 

var slime1 = preload("res://sprite/slime1.png")
var slime2 = preload("res://sprite/slime2.png")
var slime3 = preload("res://sprite/slime3.png")
var requered_energy

# Called when the node enters the scene tree for the first time.
func _ready():
	
	get_parent().get_node("Interface/life_struct").max_value = global.life_struct_max
	get_parent().get_node("Interface/enegy").max_value = global.energy_total
	GrabedInstance= MySmokeResource.instance()
	GrabedInstance.global_position = $SpawAutos.position
	GrabedInstance.speed = 200
	GrabedInstance.damage = 300
	GrabedInstance.type_car = type_car
	GrabedInstance.texture = bus
	self.add_child(GrabedInstance)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_parent().get_node("Interface/Puntaje").text = String(global.total)
	get_parent().get_node("Interface/life_struct").value = global.life_struct
	get_parent().get_node("Interface/life_struct/Label2").text = String(global.life_struct)
	get_parent().get_node("Interface/enegy").value = global.energy
	get_parent().get_node("Interface/enegy/Label2").text = String(global.energy)
	$SpawAutos.connect("my_signal", self, "_test")
#	pass
func _test():
	print("ingresa a test")
	pass
func _on_Area2D_body_exited(body):
	body.text = ""
	pass # Replace with function body.


func _on_Timer_timeout():
	GrabedInstance= MySmokeResource.instance()
	_create_car()
	pass # Replace with function body.

func _create_car():
	
	GrabedInstance.global_position = $SpawAutos.position
	type_car= randi()%6
	if type_car == 0:
		speed = 200
		damage = 100
		texture = convertible
	elif type_car == 1:
		speed = 180
		damage = 200
		texture=compacto
	elif type_car == 2:
		speed = 150
		damage = 300
		texture=hatchbag
	elif type_car == 3:
		speed = 110
		damage = 400
		texture=camioneta
	elif type_car == 4:
		speed = 100
		damage = 500
		texture=combi
	elif type_car == 5:
		speed = 100
		damage = 500
		texture=stationwagon
	elif type_car == 6:
		speed = 100
		damage = 500
		texture=bus
	else:
		speed = 90
		damage = 700
		texture=furgon
	
	 
	GrabedInstance.speed = speed
	GrabedInstance.damage = damage
	GrabedInstance.type_car = type_car
	GrabedInstance.texture = texture
	self.add_child(GrabedInstance)
	pass


func _on_end_body_entered(body):
	global.add_point()
	body.free()
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	global.take_damage(body.damage)
	body.text = String(body.damage)
	pass # Replace with function body.

func _on_Button_button_up():
	_create_buff(1, 200)
	pass # Replace with function body.

func _on_Button2_button_up():
	_create_buff(2, 300)
	pass # Replace with function body.

func _on_Button3_button_up():
	_create_buff(3, 500)
	pass # Replace with function body.

func _create_buff(slime_num: int, heal:int):
	var death_time
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
		GrabedInstance.global_position = $SpawHeal/Position2D1.position
		GrabedInstance.death_time = death_time
		global.energy -= requered_energy
		self.add_child(GrabedInstance)
	pass
