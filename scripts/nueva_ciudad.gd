extends Node2D

var abuelita_scene = preload("res://scenes/dialogos/dialogo_abuelita.tscn")
var mickey_scene = preload("res://scenes/dialogos/dialogo_mickey.tscn")
var inimputable_scene = preload("res://scenes/dialogos/dialogo_inim.tscn")
var infidelidad_scene = preload("res://scenes/dialogos/dialogo_infelidad.tscn")
var diegote_scene = preload("res://scenes/dialogos/dialogo_diegote.tscn")

var personaje_en_area = false
var casa

var escena_pausa = load("res://scenes/pausa/control.tscn")

var casas = {
	"abuelita": false,
	"infidelidad": false,
	"mickey": false,
	"diegote": false
}

func _process(delta: float) -> void:
	if personaje_en_area:
		get_tree().call_group("Policia", "detener_policias")
	else:
		get_tree().call_group("Policia", "renaudar_policias")
	
	if Input.is_action_just_pressed("interactuar") and personaje_en_area:
		
		match casa:
			"abuelita":
				if not casas["abuelita"]:
					casas["abuelita"] = true
					var escena = abuelita_scene.instantiate()
					add_child(escena)
					get_tree().call_group("Player","stop_player")
					get_tree().call_group("Player","modificar_high",-10)
			"inimputable":
				get_tree().call_group("Player","stop_player")
				var escena = inimputable_scene.instantiate()
				add_child(escena)
				
			"infidelidad":
				if not casas["infidelidad"]:
					casas["infidelidad"] = true
					var escena = infidelidad_scene.instantiate()
					get_tree().call_group("Player","stop_player")
					add_child(escena)
					get_tree().call_group("Player","modificar_high",-10)
			"mickey":
				if not casas["mickey"]:
					casas["mickey"] = true
					var escena = mickey_scene.instantiate()
					add_child(escena)
					get_tree().call_group("Player","stop_player")
					get_tree().call_group("Player","modificar_high",+10)
			"diegote":
				if not casas["diegote"]:
					casas["diegote"] = true
					var escena = diegote_scene.instantiate()
					add_child(escena)
					get_tree().call_group("Player","stop_player")
					get_tree().call_group("Player","modificar_high",+20)
			"casa":
				if Autoload.llave:
					Autoload.win_game()
	
	if Input.is_action_just_pressed("ui_cancel"):
		var escena = escena_pausa.instantiate()
		add_child(escena)
		get_tree().paused = true
	

func _on_lava_platos_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		personaje_en_area = true
		casa = "abuelita"
		$LavaPlatos/Label.visible = true


func _on_mickey_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		personaje_en_area = true
		casa = "mickey"
		$Mickey/Label.visible = true

func _on_inimputable_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		personaje_en_area = true
		casa = "inimputable"
		$Inimputable/Label.visible = true

func _on_infidelidad_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		personaje_en_area = true
		casa = "infidelidad"


func _on_lava_platos_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		personaje_en_area = false
		$LavaPlatos/Label.visible = false

func _on_mickey_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		personaje_en_area = false
		$Mickey/Label.visible = false


func _on_inimputable_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		personaje_en_area = false
		$Inimputable/Label.visible = false


func _on_infidelidad_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		personaje_en_area = false


func _on_diegote_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		personaje_en_area = true
		casa = "diegote"
		$Diegote/Label.visible = true



func _on_diegote_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		personaje_en_area = false
		$Diegote/Label.visible = false


func _on_casa_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		personaje_en_area = true
		casa = "casa"
		$Casa/Label.visible = true
		if not Autoload.llave:
			body.mensaje = "TE FALTA LA LLAVE DE TU CASA"

func _on_casa_body_exited(body: Node2D) -> void:
	personaje_en_area = false
	$Casa/Label.visible = false
