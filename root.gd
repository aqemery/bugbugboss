extends Node2D

const GAME = preload("res://scenes/game/game.tscn")
const MENU = preload("res://scenes/menu/menu.tscn")

var _scene:Node2D

func _ready():
    SignalManager.main_menu.connect(show_menu)
    SignalManager.start_game.connect(play_game)
    show_menu()

func clear_scene():
    if _scene:
        _scene.queue_free()

func show_menu():
    clear_scene()
    _scene = MENU.instantiate()
    add_child(_scene)
    
func play_game():
    clear_scene()
    _scene = GAME.instantiate()
    add_child(_scene)
    
func _input(event):
    if event.is_action_pressed("pause"):
        _scene.can_process()
        get_tree().paused = not get_tree().paused 
    
    
