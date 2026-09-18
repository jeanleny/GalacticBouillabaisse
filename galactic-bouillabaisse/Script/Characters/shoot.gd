extends Area2D

@export var dmg = 1
var speed = 50
var direction = Vector2.RIGHT

func _process(delta) -> void:
	global_position += direction * speed * delta



func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if (body.is_in_group("Ennemy")):
		body.hit(dmg)
	queue_free()
