extends Node2D

@onready var boss = $boss
@onready var health = $health_bar/health

var _max: float
var _boss_max: float

func _ready():
    _max = health.size.x
    _boss_max = boss.health
    boss.health_changed.connect(update_health_bar)
    
    
func update_health_bar():
    var _current = health.size.x
    print("health: ", boss.health)
    print("_boss_max: ", _boss_max)
    print("_max: ", _max)
    print("boss.health / _boss_max: ", boss.health / _boss_max)
    var _new = (boss.health / _boss_max) * _max
    health.size.x = _new
    print("Health: ", health.size.x)
