extends CharacterBody2D
@export var speed: float = 150
#@onready var player = get_tree$"../Planet"
var pos = Vector2(0,0)

# Called when the node entrs the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = global_position.direction_to(pos).normalized()
	velocity = direction * speed
	move_and_slide()
