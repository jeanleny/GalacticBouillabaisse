extends Area2D

@export var maxHealth = 100

@onready var healthBar = $HealthBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	healthBar.init(maxHealth)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
