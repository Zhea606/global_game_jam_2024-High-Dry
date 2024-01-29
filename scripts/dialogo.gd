extends CanvasLayer

var dialogo

@export var personaje: String

func _ready() -> void:
	dialogo = DialogueManager.show_example_dialogue_balloon(load("res://dialogues/test.dialogue"),personaje)
	
func _process(delta: float) -> void:
	if not dialogo:
		get_tree().call_group("Player","resume_player")
		queue_free()
