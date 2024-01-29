extends Control


@onready var sprite = $AnimatedSprite2D
@onready var button = $Button
var matchTimer= Timer.new()
var matchTimer2= Timer.new()
var matchTimer3= Timer.new()
var matchTimer4= Timer.new()
var matchTimer5= Timer.new()
var matchTimer6= Timer.new()
var matchTimer7= Timer.new()

func _ready():
	button.hide()
	setUpTimers()
	
	sprite.play("default")
	matchTimer.start(6)
	matchTimer2.start(1)
	matchTimer3.start(2)
	matchTimer4.start(3)
	matchTimer5.start(4)
	matchTimer6.start(5)
	matchTimer7.start(6)
	
	pass
func setUpTimers():
	matchTimer.connect("timeout", Callable(self, "botoncinematica"))
	matchTimer.set_one_shot(true)
	add_child(matchTimer)
	
	matchTimer2.connect("timeout", Callable(self, "musicacinematica"))
	matchTimer2.set_one_shot(true)
	add_child(matchTimer2)
	matchTimer3.connect("timeout", Callable(self, "musicacinematica"))
	matchTimer3.set_one_shot(true)
	add_child(matchTimer3)
	matchTimer4.connect("timeout", Callable(self, "musicacinematica"))
	matchTimer4.set_one_shot(true)
	add_child(matchTimer4)
	matchTimer5.connect("timeout", Callable(self, "musicacinematica"))
	matchTimer5.set_one_shot(true)
	add_child(matchTimer5)
	matchTimer6.connect("timeout", Callable(self, "musicacinematica"))
	matchTimer6.set_one_shot(true)
	add_child(matchTimer6)
	matchTimer7.connect("timeout", Callable(self, "musicacinematica2"))
	matchTimer7.set_one_shot(true)
	add_child(matchTimer7)
	pass
	
func botoncinematica():
		button.show()
		pass

func musicacinematica():
		$AudioCinematica.play()
		pass
func musicacinematica2():
	$AudioContinuar.play()
	pass
func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/nueva_ciudad.tscn")
	pass # Replace with function body.
