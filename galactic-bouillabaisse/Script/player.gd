extends Node2D

const ORBIT_RADIUS = 200.0

func _process(_delta):
	var direction = get_global_mouse_position() - get_parent().global_position
	position = direction.normalized() * ORBIT_RADIUS
	rotation = direction.angle()
