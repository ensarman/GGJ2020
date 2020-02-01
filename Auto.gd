extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2()
export (int) var speed = 200
export (int) var damage = 10
export (int) var type_car = 0
export (String) var text = ""
export (Texture) var texture

#var bus = preload("res://sprite/bus.png")
#var camioneta = preload("res://sprite/camioneta.png")
#var combi = preload("res://sprite/combi.png")
#var compacto = preload("res://sprite/compacto.png")
#var convertible = preload("res://sprite/convertible.png")
#var furgon = preload("res://sprite/furgon.png")
#var hatchbag = preload("res://sprite/hatchbag.png")
#var micro = preload("res://sprite/micro.png")
#var sedanantiguo = preload("res://sprite/sedanantiguo.png")
#var smart = preload("res://sprite/smart.png")
#var stationwagon = preload("res://sprite/stationwagon.png")


#var bus = preload("res://sprite/bus.png")
#export(Texture) var asset setget my_func

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.texture = texture
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.x += 1
	velocity = velocity.normalized() * speed
	velocity = move_and_slide(velocity)
	$Label.text = text
#	self.connect("area_entered", self, "cuerpo" )
	pass


#func cuerpo(body):
#	print("ingreso en el area designada")
#	global.take_damage(type_car)
#	pass # Replace with function body.
