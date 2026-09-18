extends Marker2D

@onready var asteroid = preload("res://Scenes/Enemies/asteroid.tscn")

@onready var offset_spawn = 50
# Ratio to convert screen position to global position.
var inv: Transform2D
var width: float
var height: float
# Choose uniformly one side.
var perimeter: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var viewport_size = get_viewport().get_visible_rect().size
	inv = get_viewport().get_canvas_transform().affine_inverse()
	width = viewport_size.x
	height = viewport_size.y
	perimeter = 2.0 * (width + height)
	$Timer.start()

func _on_timer_timeout() -> void:
	var entity = asteroid.instantiate()
	var distance = randf_range(0.0, perimeter)
	var start_position: Vector2
	if (distance < 2 * width):
		if (distance < width):
			start_position = Vector2(distance, -offset_spawn)
		else:
			start_position = Vector2(distance - width, height + offset_spawn)
	else:
		distance -= 2 * width
		if (distance < height):
			start_position = Vector2(-offset_spawn, distance)
		else:
			start_position = Vector2(width + offset_spawn, distance - height)
	entity.set_global_position(inv * start_position)
	add_child(entity)
