extends Area2D


var matchTimer2= Timer.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	setUpTimers()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("Player"):
		$AudioErupto.play()
	
		matchTimer2.start(.5)
	pass
func setUpTimers():
	
	matchTimer2.connect("timeout", Callable(self, "quitar"))
	matchTimer2.set_one_shot(true)
	add_child(matchTimer2)
	pass
	
func AudioErupto():
	$AudioErupto.play()
	pass
func quitar():
	queue_free()
	pass
	
