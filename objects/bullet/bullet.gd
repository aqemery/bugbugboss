extends Area2D
class_name Bullet

var _direction = Vector2.UP
var _speed = 100.0
var _life_span: float = 20.0
var _life_time: float = 0.0

func _physics_process(delta):
	position += _direction * _speed * delta
	_life_time += delta
	if _life_time > _life_span:
		queue_free()

func set_direction(dir: Vector2):
	_direction = dir

func _on_area_entered(area):
	queue_free()
