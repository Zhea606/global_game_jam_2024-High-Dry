extends Node

var llave = false


func game_over():
	get_tree().change_scene_to_file("res://scenes/Muerte/control.tscn")

func win_game():
	get_tree().change_scene_to_file("res://scenes/victoria/victoria.tscn")
