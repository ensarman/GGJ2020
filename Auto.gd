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
