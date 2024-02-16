extends Area2D
class_name Bug

const COOLDOWN = 1
var _cool:float = 0
var _can_fire: bool = true

func _process(delta):
    _cool -= delta
    fire()

func _on_area_entered(area):
    ObjectMaker.create_splat(global_position)
    queue_free()
    
func fire():
    if _cool <= 0:
        ObjectMaker.create_slime(global_position)
        _cool = COOLDOWN


