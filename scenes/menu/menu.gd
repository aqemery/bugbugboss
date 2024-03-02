extends Node2D

@onready var animation_player = $AnimationPlayer
@onready var start_sounds = $start_sounds

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


func _input(event):
    if event.is_action_pressed("fire"):
        start_sounds.play()  
        animation_player.play("start_play")
        
   
func close():
    SignalManager.start_game.emit()


func _on_animation_player_animation_finished(anim_name):
    if anim_name == "start_play":
        SignalManager.start_game.emit()
        
