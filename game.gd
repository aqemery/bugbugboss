extends Node2D


var ship_scene = preload("res://objects/ship/ship.tscn")
var _ship:Area2D
var _current_level = 1
var _level:Node2D
var _lives = 3

@onready var lives = $lives
@onready var audio = $audio


func _ready():
    spawn_ship()
    start_level()
    
    pass
    #Animator.fly($red_bug, Vector2(100,100), 5)
    #Animator.move_by($red_bug2, Vector2(10,50), 2,2)
    #Animator.fly_circle($bug16, 10)
    


func start_level():
    if _level:
        _level.queue_free()
    var level_string = "res://levels/level_%s.tscn" % _current_level
    _level = load(level_string).instantiate()
    add_child(_level)

func spawn_ship():
    _ship = ship_scene.instantiate()
    _ship.global_position = Vector2(64,124)
    add_child(_ship)
    lives.set_lives(_lives)
    

func _process(delta):
    var bugs = len(get_tree().get_nodes_in_group("bug"))
    if not bugs:
        _current_level += 1
        start_level()
        #
        
    if not _ship and _lives:
        _lives -= 1

        audio.play()
        spawn_ship()
    #if not shi
        #
    #
    #
    #if not ship:
        #_lives -= 1
        
        
    
    #print(len(get_tree().get_nodes_in_group("bug")))
