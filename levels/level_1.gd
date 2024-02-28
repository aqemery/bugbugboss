extends Node2D

enum Intro {TOP,FLY
}

#export var 
# Called when the node enters the scene tree for the first time.
func _ready():
    for c:Node2D in get_children():
        var end_pos = c.position
        c.position += Vector2(0, -c.position.y -10)
        var t: Animator = animator.create(c)
        t.fly(end_pos, 0.5)


func _on_child_exiting_tree(node):
    if get_child_count() == 1:
        SignalManager.level_complete.emit()


