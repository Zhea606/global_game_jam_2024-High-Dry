extends CanvasLayer


func _on_volver_pressed() -> void:
	get_tree().paused = false
	queue_free()
	
func _on_inicio_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/Splash/control.tscn")

func _on_salir_pressed() -> void:
	get_tree().quit()
