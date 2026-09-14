extends Marker2D

@onready var asteroid = preload("res://Scenes/asteroid.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var entity = asteroid.instantiate()
	add_child(entity)
	entity.set_global_position(position)
