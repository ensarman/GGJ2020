extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _pausar():
	if get_tree().paused == false:
		get_tree().paused = true
	else:
		get_tree().paused = false

func _on_Vida_button_up():
	get_tree().paused = false
	global._gana_buff(1)
	queue_free()
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
	pass # Replace with function body.


func _on_Vida_button_down():
	print("despaussa")
	get_tree().paused = false
	queue_free()
	pass # Replace with function body.
