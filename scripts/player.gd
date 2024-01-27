extends CharacterBody2D
#class_name Jugador

var speed = 350
@onready var barraHigh = $HighProgressBar
@onready var timer = $"../Timer"

var tiene_llave: bool = false


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	barraHigh.max_value = timer.wait_time

func _physics_process(delta):
	# Add the gravity.
	var moverIzqDer = Input.get_axis("ui_left","ui_right")
	var moverArrAba = Input.get_axis("ui_up","ui_down")
	var moverAmbas = Vector2(moverIzqDer,moverArrAba)
	velocity= moverAmbas.normalized() * speed
	move_and_slide()
	barraHigh.value = timer.time_left



func _on_hit_box_area_entered(area):
	var timeLeft = timer.time_left
	#timer.stop()	
	print("queda :" +str(timeLeft))
	if area.is_in_group("Item"):
		timeLeft += 10
		if timeLeft > 60:
			timeLeft = 60
		timer.wait_time = timeLeft
		print("nuevo tiempo :" +str(timeLeft))
		timer.start()

