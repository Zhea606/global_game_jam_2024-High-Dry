extends Control




func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/ciudad.tscn")
	pass # Replace with function body.


func _on_button_2_pressed():
	queue_free()
	pass # Replace with function body.

