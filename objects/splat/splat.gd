extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():	
	var name = "splat_%d" % randi_range(1,2)
	play(name)
	
	#await("animation_finished")
	#queue_free()



func _on_animation_finished():
	#queue_free()
	call_deferred("queue_free")

