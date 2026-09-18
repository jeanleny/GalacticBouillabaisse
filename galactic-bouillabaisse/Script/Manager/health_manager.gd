extends Node2D

@export var _colorLowLife: Color
@export var _colorHighLife: Color

@onready var _progressBar = $HealthBar
@onready var _maxSize = _progressBar.size.x

var _health: int
var _maxHealth: int

func init(maxHealth: int) -> void:
	_maxHealth = maxHealth
	_health = _maxHealth
	_updateProgressBar()

func takeDamage(damage: int) -> void:
	_health -= damage
	if _health < 0:
		_health = 0
	_updateProgressBar()
	
func isDead() -> bool:
	return (_health <= 0)

func _updateProgressBar() -> void:
	var ratio =  float(_health) / _maxHealth
	_progressBar.size.x = ratio * _maxSize
	_progressBar.color = _colorLowLife.lerp(_colorHighLife, ratio)
	
