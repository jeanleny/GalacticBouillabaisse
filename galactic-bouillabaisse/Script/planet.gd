extends Area2D

@onready var hit_sprite = $Hit
var health = 10

func _on_body_entered(body: Node2D) -> void:
	if (body.is_in_group("Ennemy")):
		health -= 1
		hit_sprite.visible = true
		await get_tree().create_timer(0.1).timeout
		hit_sprite.visible = false
