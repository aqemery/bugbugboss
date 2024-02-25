extends Area2D

const SPEED = 50
const COOLDOWN = 0.25
var _cool:float = 0
var _can_fire: bool = false

func _ready():
    SignalManager.begin_play.connect(enable_fire)

func enable_fire():
    _can_fire = true

func _physics_process(delta):
    var move = Input.get_axis("ui_left", "ui_right")
    position.x += move * SPEED * delta
    _cool -= delta
    keep_onscreen()
    if Input.is_action_pressed("ui_up"):
        fire()

func keep_onscreen():
    var end = get_viewport().size
    position.x = clamp(position.x, 4, 120)

func fire():
    if _can_fire and _cool <= 0:
        ObjectMaker.create_bullet(global_position + Vector2(0, -4))
        _cool = COOLDOWN

func _on_area_entered(area):
    ObjectMaker.create_explosion(position, 0.15, Color.WHITE)
    ObjectMaker.create_explosion(position, 0.1, Color.YELLOW)
    queue_free()
    SignalManager.ship_dies.emit()

