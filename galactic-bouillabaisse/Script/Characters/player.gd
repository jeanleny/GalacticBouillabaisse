extends Node2D

const ORBIT_RADIUS = 200.0 #Diamètre de la planete
@onready var SHOOT_SCENE = preload("res://Scenes/Characters/shoot.tscn")
@onready var SHOOTING_POINT = $ShootingPoint

@export var shoot_interval = 0.2
var shoot_timer = 0.0


func _process(_delta):
	
	# Actualiser la position et direction du canon
	var direction = get_global_mouse_position() - get_parent().global_position
	position = direction.normalized() * ORBIT_RADIUS
	rotation = direction.angle()
	
	# Tirer automatiquement
	shoot_timer += _delta
	if shoot_timer >= shoot_interval:
		shoot_timer = 0.0
		shoot()
		
	
		
# Fonction de tir : instancie une scène projectile
func shoot():
	var projectile = SHOOT_SCENE.instantiate()
	get_parent().add_child(projectile)
	projectile.global_position = SHOOTING_POINT.global_position
	projectile.rotation = rotation
	projectile.direction = Vector2.RIGHT.rotated(rotation)
