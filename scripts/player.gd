extends CharacterBody2D
#class_name Jugador

var speed = 150
@onready var barraHigh = $Camera2D/HighProgressBar
@onready var timer = $"../Timer"
@onready var llave=$Camera2D/Label

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
	elif Input.is_action_pressed("ui_right"):
		sprite.flip_h = true
		sprite.play("lateral")
	else:
		sprite.play("default")
	move_and_slide()

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
		llave.text = "Se encontro la llave!!"
		Autoload.llave = true
	if area.is_in_group("Puerta") and Autoload.llave:
		llave.text = "Felicidades,llegastea tu casa!!"
	elif area.is_in_group("Puerta") and !Autoload.llave:
		llave.text = "Encontraste tu casa, pero falta la llave!!"
func _on_timer_timeout():
	barraHigh.value -= 10

func vibrar():
	camara.add_trauma()
