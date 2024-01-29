extends CharacterBody2D

var move_speed = 15
var max_speed = 90

@onready var sensor_derecha = $sensor_derecha
@onready var sensor_izquierda = $sensor_izquierda

@onready var policia = $AnimatedSprite2D

@onready var linterna = $PointLight2D

var stopped = false

func _process(delta: float) -> void:	
	if not colision_horizontal():
		mover_policia()
	else:
		policia.flip_h = !policia.flip_h
		if linterna.rotation_degrees == 0:
			linterna.rotation_degrees = 180
		else:
			linterna.rotation_degrees = 0
	
	if not stopped:
		move_and_slide()

func colision_horizontal() -> bool:
	if policia.flip_h:
		if sensor_izquierda.is_colliding():
			return true
		else:
			return false
	else:
		if sensor_derecha.is_colliding():
			return true
		else:
			return false

func mover_policia():
	if not stopped:
		policia.play("caminar")
		if !policia.flip_h:
			velocity.x = min(velocity.x + move_speed, max_speed)
		else:
			velocity.x = max(velocity.x - move_speed, -max_speed)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Autoload.game_over()

func detener_policias():
	stopped = true

func renaudar_policias():
	stopped = false
