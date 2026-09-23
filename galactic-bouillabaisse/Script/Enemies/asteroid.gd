extends CharacterBody2D
@export var speed: float = 15
@export var hp: int = 3
@export var direction: Vector2
#@onready var player = get_tree$"../Planet"
var pos = Vector2(0,0)
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var BONUS_SCENE = preload("res://Scenes/Bonus/bonus.tscn")


#@onready var sprite: Sprite2D = $Sprite2D

# Called when the node entrs the scene tree for the first time.
func _ready() -> void:
	anim.animation_finished.connect(destroy)

func destroy() ->void:
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	direction = global_position.direction_to(pos).normalized()
	velocity = direction * speed
	move_and_slide()

func hit(dmg : int) -> void:
	hp -= dmg
	if (hp <= 0):
		anim.play("destroy")
		collision_shape.set_deferred("disabled", true)
		var rand = randi() % 200
		if (rand <= 99): #Probabilite de generer un bonus (a modifier, 1 chance sur 2 pour le test)
			generateBonus(rand)
			
func generateBonus(rand : int):
	var bonus = BONUS_SCENE.instantiate()
	bonus.type = rand
	bonus.position = position
	bonus.direction = direction
	get_parent().get_parent().call_deferred("add_child", bonus)
