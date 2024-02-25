extends Node2D

var _stars = []
var _color = Color(0.11, 0.17, 0.33)

func _ready():
    for i in range(30):
        var s = {}
        s.x = randi_range(0, 127)
        s.y = randi_range(0, 127)
        s.dy = (0.5 + (randi_range(0, 70) * 0.01)) / 4
        if s.dy > 1.45:
            s.dy = 4
        if s.dy < 1.2:
            s.col = 1
        else:
            s.col = 7
        _stars.append(s)

func _process(_delta):
    for s in _stars:
        s.y += s.dy
        if s.y > 127:
            s.y = -10
            s.x = randi_range(0, 127)
    queue_redraw()

func _draw():
    for s in _stars:
        var sy2 = s.y + s.dy * 12
        draw_line(Vector2(s.x, s.y), Vector2(s.x, sy2), _color, 1)
