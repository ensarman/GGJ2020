extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2()
export (int) var speed = 200
export (int) var damage = 10
export (int) var type_car = 0
export (int) var life = 5
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


func _on_Timer_timeout():
	if $Sprite.frame == 1:
		$Sprite.frame = 0
	else:
		$Sprite.frame = 1
	pass # Replace with function body.


func _on_Button_button_down():
	pass


func _on_Button_button_up():
	life -= 1
	
	if life >= 0:
		$ProgressBar.value = life
		if life == 0:
			global._add_energy()
			$Label2.text = '+'+str(global.energia_ganados_por_auto)
			global.add_point()
			$Heal_Timer.start()
		
		
		


func _on_Heal_Timer_timeout():
#	get_parent().get_node("Timer").stop()
#	get_parent().get_node("Timer").start()
	queue_free()
	
