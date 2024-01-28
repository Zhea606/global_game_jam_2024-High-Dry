extends Camera2D

@export var randomStrength: float = 0.3
@export var shakeFade: float = 5

var rng = RandomNumberGenerator.new()

var shake_strength: float = 0.0

@onready var old_offset = offset

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func add_trauma() -> void:
	shake_strength = randomStrength

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if shake_strength > 0:
		shake_strength = lerpf(shake_strength,0,shakeFade * delta)
		
		offset = randomOffset()
	
func randomOffset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strength,shake_strength),rng.randf_range(-shake_strength,shake_strength))
