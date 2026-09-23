extends Area2D

@export var maxHealth = 100

@onready var healthBar = $HealthBar
@onready var hit_sprite = $Hit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	healthBar.init(maxHealth)

func _on_body_entered(body: Node2D) -> void:
	if (!body.is_in_group("Ennemy")):
		return;
	healthBar.takeDamage(10);
	if healthBar.isDead():
		get_tree().quit();
	hit_sprite.visible = true
	body.queue_free()
	await get_tree().create_timer(0.1).timeout
	hit_sprite.visible = false
