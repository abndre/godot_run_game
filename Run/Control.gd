extends Control




func _on_Button_pressed():
	#pass # replace with function body
	get_tree().change_scene("res://Cenas/Levels/Level1.tscn")


func _on_QuitButton_pressed():
	pass # replace with function body
	get_tree().quit()
