extends Bullet

var _vx = 1
var _sx = 0

func _ready():
    _speed = 30.0
    _life_span = 5.0
    _sx = position.x
    
func _physics_process(delta):
    position.x += _vx
    if abs(_sx - position.x) > 15:
        _vx = -_vx
    super._physics_process(delta)
