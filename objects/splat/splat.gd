extends AnimatedSprite2D

func _ready():	
	var name = "splat_%d" % randi_range(1,2)
	play(name)

func _on_animation_finished():
	#queue_free()
	call_deferred("queue_free")
