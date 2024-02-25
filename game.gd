extends Node2D

var ship_scene = preload ("res://objects/ship/ship.tscn")
var _ship: Area2D
var _current_level = 1
var _level: Node2D
var _lives = 3
var _level_complete: bool = false

@onready var lives = $lives
@onready var audio = $audio
@onready var wave_label = $wave_label
@onready var camera = $camera

func _ready():
    spawn_ship()
    start_level()
    SignalManager.enemy_dies.connect(check_level_complete)
    SignalManager.ship_dies.connect(player_died)


func player_died():
    audio.play()
    if _lives:
        _lives -= 1
        await get_tree().create_timer(1).timeout
        start_level()
        spawn_ship()
    
func check_level_complete():
    print('check')
    var bugs = len(get_tree().get_nodes_in_group("bug"))
    print(bugs)
    if bugs == 1:
        complete_level()
    
func start_level():
    if _level:
        _level.queue_free()
    _level_complete = false
    wave_label.visible = true
    var level_string = "res://levels/level_%s.tscn" % _current_level
    _level = load(level_string).instantiate()
    wave_label.set_text("wave %d" % _current_level)
    
    add_child(_level)
    await get_tree().create_timer(1).timeout
    SignalManager.begin_play.emit()
    wave_label.visible = false

func spawn_ship():
    _ship = ship_scene.instantiate()
    _ship.global_position = Vector2(64, 124)
    add_child(_ship)
    lives.set_lives(_lives)
    
func complete_level():
    _level_complete = true
    _current_level += 1
    await get_tree().create_timer(1).timeout
    start_level()
