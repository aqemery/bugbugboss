extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
    for c in get_children():
        var t:Animator = animator.create(c)
        t.fly(Vector2(0,0), 4)
        t.move_by(Vector2(10,10),1)
        t.fly_circle(3)
