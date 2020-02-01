extends Node2D
var time_generate_new_oponent = 100 #esto tendria que se aleatorio dependiendo del nivel
const MySmokeResource = preload("res://Auto.tscn")
var damage_temp = 10
var GrabedInstance
var type_car = 0
var speed = 200
var damage = 10

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	GrabedInstance= MySmokeResource.instance()
	GrabedInstance.global_position = $SpawAutos.position
	GrabedInstance.speed = 200
	GrabedInstance.damage = 300
	self.add_child(GrabedInstance)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_parent().get_node("Label").text = String(global.life_struct)
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
	elif type_car == 1:
		speed = 180
		damage = 200
	elif type_car == 2:
		speed = 150
		damage = 300
	elif type_car == 3:
		speed = 110
		damage = 400
	elif type_car == 4:
		speed = 100
		damage = 500
	else:
		speed = 90
		damage = 700
	
	 
	GrabedInstance.speed = speed
	GrabedInstance.damage = damage
	GrabedInstance.type_car = type_car
	self.add_child(GrabedInstance)
	pass


func _on_end_body_entered(body):
	body.free()
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	global.take_damage(body.damage)
	body.text = String(body.damage)
	pass # Replace with function body.
