extends Area2D

@onready var sprite = $Sprite2D
@onready var spriteBonus1 = preload("res://Asset/bonus/bonus1.png")
@onready var spriteBonus2 = preload("res://Asset/bonus/bonus2.png")
@onready var spriteBonus3 = preload("res://Asset/bonus/bonus3.png")
@onready var speed = 15

@export var direction: Vector2
@export var type: int #type est un int compris entre 0 et 99 genere au moment de l'instanciation
#il permettra de gérer les probabilités d'apparition des différents bonus dans le jeu final

func _ready():
	if (type <= 33):
		sprite.texture = spriteBonus1
	elif (type <= 66):
		sprite.texture = spriteBonus2
	elif (type <= 99):
		sprite.texture = spriteBonus3
	
	rotation = direction.angle()
		
	
func _process(delta: float) -> void:
	position += direction * speed * delta


func _on_area_entered(area: Area2D) -> void:
	if area is Planet:
		print("youpiyeah") #faire disparaitre le bonus
	if area is Canon:
		print("etvoilamongars") #coder le comportement du bonus
