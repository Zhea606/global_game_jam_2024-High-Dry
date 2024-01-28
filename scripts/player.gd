extends CharacterBody2D
#class_name Jugador

var speed = 150

var speed_movimiento_aleatorio = 150

@onready var barraHigh = $"../CanvasLayer/Container/HighProgressBar"
@onready var timer = $"../Timer"
@onready var llave=$"../CanvasLayer/Container/llave"
@onready var mensaje=$"../CanvasLayer/Container/Label"

@onready var camara = $Camera2D

@onready var sprite = $AnimatedSprite2D

var tiene_llave: bool = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
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
		vibrar()
	elif Input.is_action_pressed("ui_right"):
		sprite.flip_h = true
		sprite.play("lateral")
		vibrar()
	else:
		sprite.play("default")
	move_and_slide()
	if barraHigh.value  <= 0:
		mensaje.text = "RESACA, GAME OVER"	
	elif barraHigh.value <= 30:
		mensaje.text = "CONTROLA TU ESTABILIDAD, TE VA A DAR RESACA"
	
	if barraHigh.value >= barraHigh.max_value:
		mensaje.text = "PALIDA, GAME OVER"
	elif  barraHigh.value >= 70:
		mensaje.text = "CONTROLA TU ESTABILIDAD, TE VA A DAR LA PALIDA"

	

func _on_hit_box_area_entered(area):
	if area.is_in_group("Flores"):
		barraHigh.value += 10
	if area.is_in_group("Caramelos"):
		barraHigh.value += 15
	if area.is_in_group("Mate"):
		barraHigh.value -= 10
	if area.is_in_group("Empanada"):
		barraHigh.value -= 15
	if area.is_in_group("Llave"):
		Autoload.llave = true
		llave.modulate = Color(1,1,1,1)

func _on_timer_timeout():
	barraHigh.value -= 10

func vibrar():
	camara.add_trauma()

