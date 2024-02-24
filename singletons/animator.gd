extends Node

class_name Animator

var _tween:Tween
var _node:Node

func create(node:Node) -> Animator:
    _tween = get_tree().create_tween()
    _node = node
    return self
     

func fly(pos:Vector2, time:float, delay:float=0) -> Animator:
    _tween.tween_property(_node, "global_position", pos, time).set_delay(delay)
    return self

func move_by(pos, time, delay=0) -> Animator:
    var next_pos = _node.global_position + pos
    return fly(next_pos, time, delay)
    

func fly_circle(time, delay=0) -> Animator:
    var next_pos = _node.global_position + Vector2(30,30)
    move_by(Vector2(30,30), time/4)
    move_by(Vector2(-30,30), time/4, time/4)
    move_by(Vector2(-30,-30), time/4, 2*time/4)
    move_by(Vector2(30,-30), time/4, 3*time/4)
    return self

