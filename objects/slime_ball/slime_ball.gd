extends Bullet

var _sx = 0

func _ready():
    _speed = 30.0
    _sx = position.x
    _life_span = 1.8
    
func _physics_process(delta):
    super._physics_process(delta)
    if _life_time > _life_span:
        ObjectMaker.create_slime(global_position, Vector2(0.15, 1), 50)
        ObjectMaker.create_slime(global_position, Vector2( - 0.15, 1), 50)
        ObjectMaker.create_slime(global_position, Vector2.DOWN)
