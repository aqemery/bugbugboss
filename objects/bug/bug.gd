extends Area2D
class_name Bug

const COOLDOWN = 1
var _cool: float = 0
var _can_fire: bool = false

func _ready():
    SignalManager.begin_play.connect(enable_fire)
    animate_intro()

func _process(delta):
    _cool -= delta
    fire()
    
func enable_fire():
    _can_fire = true

func _on_area_entered(_area):
    ObjectMaker.create_splat(global_position)
    ObjectMaker.create_explosion(position, 0.1, Color.GREEN)
    queue_free()
    SignalManager.enemy_dies.emit()
    
func fire():
    if _can_fire and _cool <= 0:
        if randf() > 0.6:
            fire_bullet()
        _cool = COOLDOWN
        
func fire_bullet():
    ObjectMaker.create_slime(global_position)

func animate_intro():
    var end_pos = position
    position += Vector2(0, -position.y - 10)
    var t: Animator = animator.create(self)
    t.fly(end_pos, 0.5)
