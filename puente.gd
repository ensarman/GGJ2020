extends Node2D
var time_generate_new_oponent = 100 #esto tendria que se aleatorio dependiendo del nivel
const MySmokeResource = preload("res://Auto.tscn")
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

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$ProgressBar.max_value = global.life_struct
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
	$Label.text = String(global.life_struct)
	$ProgressBar.value = global.life_struct
#	pass

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
	body.free()
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	global.take_damage(body.damage)
	body.text = String(body.damage)
	pass # Replace with function body.
