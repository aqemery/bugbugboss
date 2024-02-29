extends Bullet

var _sx = 0
@onready var ball_explode = $ball_explode
var dead = false

func _ready():
    _speed = 30.0
    _sx = position.x
    _life_span = 1.8
    
func _physics_process(delta):
    position += _direction * _speed * delta
    _life_time += delta
    if _life_time > _life_span and not dead:
        ball_explode.play()
        $Sprite2D.queue_free()
        $AnimationPlayer.queue_free()
        dead = true
        ObjectMaker.create_slime(global_position, Vector2(0.15, 1), 50)
        ObjectMaker.create_slime(global_position, Vector2( - 0.15, 1), 50)
        ObjectMaker.create_slime(global_position, Vector2.DOWN)
        


func _on_ball_explode_finished():
    queue_free()
