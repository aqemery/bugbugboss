extends Node

const BULLET = preload("res://objects/bullet/bullet.tscn")
const SLIME = preload("res://objects/slime/slime.tscn")
const SPLAT = preload("res://objects/splat/splat.tscn")

func add_deferred(scene):
    get_tree().root.add_child(scene)

func call_add_child(scene):
    call_deferred("add_deferred", scene)

func create_bullet(pos):
    var b = BULLET.instantiate()
    b.global_position = pos
    call_add_child(b)
    
func create_splat(pos):
    var s = SPLAT.instantiate()
    s.global_position = pos
    call_add_child(s)
    
func create_slime(pos):
    var b = SLIME.instantiate()
    b.global_position = pos
    b.set_direction(Vector2.DOWN)
    call_add_child(b)
