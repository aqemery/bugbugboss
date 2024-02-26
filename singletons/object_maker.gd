extends Node

const BULLET = preload ("res://objects/bullet/bullet.tscn")
const SLIME = preload ("res://objects/slime/slime.tscn")
const PLASMA = preload ("res://objects/plasma/plasma.tscn")
const SLIME_BALL = preload ("res://objects/slime_ball/slime_ball.tscn")
const SPLAT = preload ("res://objects/splat/splat.tscn")
const EXPLODE = preload ("res://objects/explode/explode.tscn")

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
    
func create_slime(pos, dir=Vector2.DOWN, speed=100.0):
    var b = SLIME.instantiate()
    b.global_position = pos
    b._direction = dir
    call_add_child(b)
    b._speed = speed

func create_plasma(pos):
    var b = PLASMA.instantiate()
    b.global_position = pos
    b._direction = Vector2.DOWN
    call_add_child(b)
    
func create_slime_ball(pos, dir=Vector2.DOWN):
    var b = SLIME_BALL.instantiate()
    b.global_position = pos
    b._direction = dir
    call_add_child(b)

func create_explosion(pos, duration: float, color):
    var e = EXPLODE.instantiate()
    e.global_position = pos
    e._duration = duration
    e._color = color
    call_add_child(e)
