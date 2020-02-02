extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true
	pass # Replace with function body.

func _on_Cura_button_up():
	get_tree().paused = false
	global._gana_buff(2)
	queue_free()
	pass # Replace with function body.


func _on_Energia_button_up():
	get_tree().paused = false
	global._gana_buff(3)
	queue_free()

func _on_Vida_button_down():
	get_tree().paused = false
	global._gana_buff(1)
	queue_free()
	print("despaussa")
