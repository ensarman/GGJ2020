extends Node2D
export (Texture) var texture
export (int) var heal
export (int) var death_time

signal my_signal
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text =  ""
	$Sprite.texture = texture
#	$end.stop()
	print(death_time)
	$end.wait_time = death_time
	$end.start() 
#	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Timer_timeout():
	global._heal(heal)
	$Label.text = '+' + String(heal)
	pass # Replace with function body.

func _on_end_timeout():
	queue_free()
	pass # Replace with function body.

func _on_Timer2_timeout():
	$Label.text =  ""
	pass # Replace with function body.
