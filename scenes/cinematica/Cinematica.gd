extends Control


@onready var sprite = $AnimatedSprite2D
@onready var button = $Button
var matchTimer= Timer.new()

func _ready():
	button.hide()
	setUpTimers()
	
	sprite.play("default")
	matchTimer.start(6)
	
	pass
func setUpTimers():
	matchTimer.connect("timeout", Callable(self, "botoncinematica"))
	matchTimer.set_one_shot(true)
	add_child(matchTimer)
	pass
	
func botoncinematica():
		button.show()
		pass

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/nueva_ciudad.tscn")
	pass # Replace with function body.
