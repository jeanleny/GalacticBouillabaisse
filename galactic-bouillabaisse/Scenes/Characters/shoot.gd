extends Area2D

var speed = 50
var direction = Vector2.RIGHT

func _process(delta) -> void:
	global_position += direction * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
