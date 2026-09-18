extends CharacterBody2D
@export var speed: float = 15
@export var hp: int = 3
#@onready var player = get_tree$"../Planet"
var pos = Vector2(0,0)
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
#@onready var sprite: Sprite2D = $Sprite2D

# Called when the node entrs the scene tree for the first time.
func _ready() -> void:
	anim.animation_finished.connect(destroy)

func destroy() ->void:
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = global_position.direction_to(pos).normalized()
	velocity = direction * speed
	move_and_slide()

func hit(dmg : int) -> void:
	hp -= dmg
	if (hp <= 0):
		anim.play("destroy")
