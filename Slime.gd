extends Node2D
export (Texture) var texture
export (int) var heal
export (int) var death_time

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
#	$Label.text = '+' + String(heal)
	if $Sprite.frame == 1:
		$Sprite.frame = 0
		$Label.text =  ""
	else:
		
		$Label.text = '+' + String(heal)
		$Sprite.frame = 1
		
	pass # Replace with function body.

func _on_end_timeout():
	queue_free()
	pass # Replace with function body.
