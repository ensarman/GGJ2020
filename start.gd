extends Node2D





func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_Button_button_down():
	get_tree().change_scene("res://puente.tscn")
	
