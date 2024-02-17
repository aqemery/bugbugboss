extends Node2D

var _radius:float = 50.0
var _duration:float = 2.0
var _color = Color.WHITE

func _process(delta):	
    _duration -= delta
    queue_redraw()
    if _duration < 0:
        print("free")
        queue_free()

func _draw():
    print("drawing")
    draw_circle(Vector2.ZERO, _duration * _radius, _color)
