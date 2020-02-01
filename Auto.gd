extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2()
var type_car = 30
export (int) var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
#	velocity.x = 0
#	velocity.y = 0
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.x += 1
	velocity = velocity.normalized() * speed
	velocity = move_and_slide(velocity)
	pass


#func _on_Area2D_body_entered(body):
#	global.take_damage(type_car)
#	pass # Replace with function body.
