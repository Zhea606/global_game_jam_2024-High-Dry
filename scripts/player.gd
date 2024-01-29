extends CharacterBody2D
#class_name Jugador

var speed = 150

var speed_movimiento_aleatorio = 150

@onready var barraHigh = $"../CanvasLayer/Container/HighProgressBar"
@onready var timer = $"../Timer"
@onready var llave=$"../CanvasLayer/Container/llave"
@onready var mensaje=$"../CanvasLayer/Container/Label"
@onready var pickUp = $AnimatedSprite2D2
@onready var camara = $Camera2D

@onready var sprite = $AnimatedSprite2D
var animacionFinalizada= false
var estado = ""
var tiene_llave: bool = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var high_alto = false

var stopped = false

func _ready() -> void:
	sprite.play("default")
	pickUp.hide()
	pass

func _physics_process(delta):
	# Add the gravity.
	var direction = Input.get_axis("ui_left","ui_right")
	var moverIzqDer = Input.get_axis("ui_left","ui_right")
	var moverArrAba = Input.get_axis("ui_up","ui_down")
	var moverAmbas = Vector2(moverIzqDer,moverArrAba)
	velocity= moverAmbas.normalized() * speed
	
	#sprite.flip_h = direction > 0

	if Input.is_action_pressed("ui_left"):
		sprite.flip_h = false
		sprite.play("lateral")
		estado = "normal"
		if high_alto:
			vibrar()
	elif Input.is_action_pressed("ui_right"):
		sprite.flip_h = true
		estado = "normal"
		sprite.play("lateral")
		if high_alto:
			vibrar()
	elif Input.is_action_pressed("ui_down"):
		sprite.play("abajo")
		estado = "down"
	elif Input.is_action_pressed("ui_up"):
		sprite.play("arriba")
		estado = "up"
	else:
		match (estado):
			"down":
				print("down")
				sprite.play("abajoIdle")
			"up":
				sprite.play("arribaIdle")
			"normal":
				sprite.play("default")
		#sprite.play("default")
	if not stopped:
		move_and_slide()
	if barraHigh.value  <= 0:
		mensaje.text = "RESACA, GAME OVER"
		Autoload.game_over()
	elif barraHigh.value <= 30:
		high_alto = false
		mensaje.text = "CONTROLA TU ESTABILIDAD, TE VA A DAR RESACA"
	
	if barraHigh.value >= barraHigh.max_value:
		mensaje.text = "PALIDA, GAME OVER"
		Autoload.game_over()
	elif  barraHigh.value >= 70:
		mensaje.text = "CONTROLA TU ESTABILIDAD, TE VA A DAR LA PALIDA"
		high_alto = true
	else:
		high_alto = false

	

func _on_hit_box_area_entered(area):
	if area.is_in_group("Flores"):
		barraHigh.value += 10
		pickUp.show()
		pickUp.play("pickup")

	if area.is_in_group("Caramelos"):
		barraHigh.value += 15
		pickUp.show()
		pickUp.play("pickup")		

	if area.is_in_group("Mate"):
		barraHigh.value -= 10
		pickUp.show()
		pickUp.play("pickup")

	if area.is_in_group("Empanada"):
		barraHigh.value -= 15
		pickUp.show()
		pickUp.play("pickup")

	if area.is_in_group("Llave"):
		Autoload.llave = true
		pickUp.show()
		pickUp.play("pickup")

		llave.modulate = Color(1,1,1,1)

func _on_timer_timeout():
	barraHigh.value -= 5

func vibrar():
	camara.add_trauma()

func modificar_high(cantidad):
	barraHigh.value += cantidad
	print("nuevo high", barraHigh.value)
	
func stop_player():
	stopped = true

func resume_player():
	stopped = false
