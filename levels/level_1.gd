extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
    
    # create a bunch of bugs evenly spaced around the screen
    var bug = load("res://objects/bug/bug.tscn")
    for i in range(0, 10):
        var bs = bug.instantiate()
        bs.position = Vector2(6 + i * 10, 10)
        add_child(bs)

    # make them all fly around randomly
    for c in get_children():
        var t: Animator = animator.create(c)
        t.fly(Vector2(randi() % 128, 4), 2)
