extends Node2D

var _radius:float = 50.0
var _duration:float = 2.0
var _color:Color = Color.WHITE

func _process(delta):	
    _duration -= delta
    queue_redraw()
    if _duration < 0:
        queue_free()

func _draw():
    draw_circle(Vector2.ZERO, _duration * _radius, _color)
