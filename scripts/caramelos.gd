extends Area2D

var matchTimer= Timer.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	setUpTimers()
	pass # Replace with function body.
func setUpTimers():
	matchTimer.connect("timeout", Callable(self, "quitar"))
	matchTimer.set_one_shot(true)
	add_child(matchTimer)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("Player"):
		$AudioCaramelo.play()
		matchTimer.start(.5)
		
		
func quitar():
	queue_free()
	pass
	
