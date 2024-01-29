extends CanvasLayer

var dialogo

@export var personaje: String

func _ready() -> void:
	dialogo = DialogueManager.show_example_dialogue_balloon(load("res://dialogues/test.dialogue"),personaje)
	
func _process(delta: float) -> void:
	if not dialogo:
		
		Autoload.game_over()
		queue_free()
		
