extends AnimatedSprite2D

func _ready():	
    var animation_name = "splat_%d" % randi_range(1,2)
    play(animation_name)

func _on_animation_finished():
    #queue_free()
    call_deferred("queue_free")
