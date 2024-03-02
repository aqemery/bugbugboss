extends Node

func set_lives(num):
    for c in get_children():
        c.queue_free()
    for i in range(num):
        var s = Sprite2D.new()
        s.texture = load("res://assets/bugbugboss.png")
        s.region_enabled = true
        s.region_rect = Rect2(40, 8, 3, 4)
        s.global_position = Vector2(4 * i + 4, 4)
        add_child(s)
