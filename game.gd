extends Node2D

var ship_scene = preload ("res://objects/ship/ship.tscn")
var _ship: Area2D
var _current_level = 10
var _level: Node2D
var _lives = 3
var _level_complete: bool = false

@onready var lives = $lives
@onready var wave_label = $wave_label
@onready var camera = $camera

@onready var ship_die = $ship_die
@onready var game_over = $game_over
@onready var level_start = $level_start
@onready var level_music = $level_music
@onready var boss_music = $boss_music
@onready var boss_spawn = $boss_spawn


func _ready():
    spawn_ship()
    start_level()
    SignalManager.enemy_dies.connect(check_level_complete)
    SignalManager.ship_dies.connect(player_died)
    SignalManager.level_complete.connect(complete_level)

func player_died():
    ship_die.play()
    level_music.stop()
    boss_music.stop()
    camera.shake(10, 0.5, 100)
    if _lives:
        respawn_ship()
    else:
        wave_label.visible = true
        wave_label.set_text("game over")
        game_over.play()
        
func respawn_ship():
    _lives -= 1
    await get_tree().create_timer(1).timeout
    start_level()
    spawn_ship()

func check_level_complete():
    camera.shake(4, 0.5, 50)
    
    
func start_play(level):
    level_start.play()
    wave_label.set_text("wave %d" % level)
    await get_tree().create_timer(1).timeout
    var level_string = "res://levels/level_%s.tscn" % level
    _level = load(level_string).instantiate()
    add_child(_level)
    wave_label.visible = false
    await get_tree().create_timer(1).timeout
    SignalManager.begin_play.emit()
    level_music.play()
    
func start_boss():
    wave_label.set_text("wave")
    await get_tree().create_timer(0.5).timeout
    wave_label.set_text("wave.")
    await get_tree().create_timer(0.5).timeout
    wave_label.set_text("wave..")
    await get_tree().create_timer(0.5).timeout
    wave_label.set_text("wave...")
    await get_tree().create_timer(0.5).timeout
    wave_label.set_text("wave... boss!!!")
    boss_spawn.play()
    camera.shake(4, 2, 3)
    add_child(load("res://levels/level_boss.tscn").instantiate())
    await get_tree().create_timer(1).timeout
    wave_label.visible = false
    boss_music.play()
    await get_tree().create_timer(1).timeout
    SignalManager.begin_play.emit()
    
func start_level():
    if _level:
        _level.queue_free()
        remove_bullets() 
        
    _level_complete = false
    wave_label.visible = true

    
    if _current_level == 10:
        start_boss()
    else:
        start_play(_current_level)


func remove_bullets():
    get_tree().call_group('bullet', 'queue_free')


func spawn_ship():
    _ship = ship_scene.instantiate()
    _ship.global_position = Vector2(64, 124)
    add_child(_ship)
    lives.set_lives(_lives)
    
func complete_level():
    boss_music.stop()
    _level_complete = true
    _current_level += 1
    await get_tree().create_timer(1).timeout
    start_level()
    level_music.stop()
    
