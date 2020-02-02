extends Node2D
const MySmokeResource = preload("res://Auto.tscn")

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

var puente1 = preload("res://sprite/2/puente.png")
var puente2 = preload("res://sprite/2/puente2.png")
var puente3 = preload("res://sprite/2/puente3.png")

var vector = Vector2()
var porc
var  spri :Texture 
var  puente :Texture 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	GrabedInstance= MySmokeResource.instance()
	GrabedInstance.global_position = $SpawAutos.position
	GrabedInstance.speed = 200
	GrabedInstance.damage = 300
	GrabedInstance.type_car = type_car
	GrabedInstance.texture = bus
	self.add_child(GrabedInstance)

func _create_car():
	
	GrabedInstance.global_position = $SpawAutos.position
	var damage_const = global.damage_start + (global.total)*20
	type_car= randi()%6
	if type_car == 0:
		speed = 200
		damage = damage_const -50 
		texture = bus
	elif type_car == 1:
		speed = 180
		damage = damage_const
		texture=camioneta
	elif type_car == 2:
		speed = 150
		damage = 50 + damage_const
		texture=camioncito
	elif type_car == 3:
		speed = 110
		damage = 100 + damage_const
		texture=carrito
	elif type_car == 4:
		speed = 100
		damage = 150 + damage_const
		texture=channel5
	elif type_car == 5:
		speed = 100
		damage = 200 + damage_const
		texture=policia
	else:
		speed = 90
		damage = 700
		texture=ambulancia
	
	 
	GrabedInstance.speed = speed
	GrabedInstance.damage = damage
	GrabedInstance.type_car = type_car
	GrabedInstance.texture = texture
	self.add_child(GrabedInstance)

func _on_Timer_timeout():
	GrabedInstance= MySmokeResource.instance()
	_create_car()


