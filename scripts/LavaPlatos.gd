extends Area2D

var popup = preload("res://scenes/PopUp/control.tscn")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		var escena = popup.instantiate()
		get_parent().add_child(escena)
		print("player colisiona")
