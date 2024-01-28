extends Node2D

var abuelita_scene = preload("res://scenes/dialogos/dialogo_abuelita.tscn")
var mickey_scene = preload("res://scenes/dialogos/dialogo_mickey.tscn")
var inimputable_scene = preload("res://scenes/dialogos/dialogo_inim.tscn")
var infidelidad_scene = preload("res://scenes/dialogos/dialogo_infelidad.tscn")

var personaje_en_area = false
var casa

func _process(delta: float) -> void:
	if personaje_en_area:
		get_tree().call_group("Policia", "detener_policias")
	else:
		get_tree().call_group("Policia", "renaudar_policias")
	
	if Input.is_action_just_pressed("interactuar") and personaje_en_area:
		
		match casa:
			"abuelita":
				var escena = abuelita_scene.instantiate()
				add_child(escena)
			"inimputable":
				var escena = inimputable_scene.instantiate()
				add_child(escena)
			"infidelidad":
				var escena = infidelidad_scene.instantiate()
				add_child(escena)
			"mickey":
				var escena = mickey_scene.instantiate()
				add_child(escena)
		

func _on_lava_platos_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		personaje_en_area = true
		casa = "abuelita"


func _on_mickey_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		personaje_en_area = true
		casa = "mickey"

func _on_inimputable_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		personaje_en_area = true
		casa = "inimputable"

func _on_infidelidad_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		$CanvasLayer/Infidelidad/Label.visible = true
		personaje_en_area = true
		casa = "infidelidad"


func _on_lava_platos_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		personaje_en_area = false

func _on_mickey_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		personaje_en_area = false


func _on_inimputable_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		personaje_en_area = false


func _on_infidelidad_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		$Infidelidad/Label.visible = false
		personaje_en_area = false
