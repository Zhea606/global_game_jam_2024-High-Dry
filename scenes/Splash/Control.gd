extends Control


@onready var sprite = $AnimatedSprite2D

func _ready():
	sprite.play("lateral")
	pass 
	
func _on_button_pressed():
	$AudioCorte.play()
	get_tree().change_scene_to_file("res://scenes/cinematica/Cinematica.tscn")
	
	pass # Replace with function body.


func _on_button_2_pressed():
	$AudioCorte.play()
	get_tree().quit()
	pass # Replace with function body.



func _on_button_3_pressed():
	$AudioCorte.play()
	get_tree().change_scene_to_file("res://scenes/Splash2/control.tscn")
	pass # Replace with function body.
