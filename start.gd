extends Node2D


func _ready():
	$Label2.hide()
	
	if global.show_game_over:
		
		$Label2.text = "NIVEL ALCANZADO: " + str(global.total) 
		$Label2.show()
		$Button.text = "Volver a Jugar"
		$AudioStreamPlayer2D.playing = true
		global.init()
		for i in range(10):
			$Label.text = "GAME OVER"
			yield(get_tree().create_timer(0.4), "timeout")
			$Label.text = ""
			yield(get_tree().create_timer(0.4), "timeout")
			if (i==3):
				$AudioStreamPlayer2D.playing = false
			
		#yield(get_tree().create_timer(5.0), "timeout")
		$Label.text = "EL PUENTE"
	
	#pass # Replace with function body.

func _on_Button_button_down():
	$Label2.hide()
	get_tree().change_scene("res://puente.tscn")
	
func _on_ButtonExplanation_button_up():
	get_tree().change_scene("res://explanation.tscn")
