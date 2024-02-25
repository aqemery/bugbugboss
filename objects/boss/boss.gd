extends Area2D

var health = 20
# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    pass

func _on_area_entered(_area):
    health -= 1
    if health <= 0:
        ObjectMaker.create_splat(global_position + Vector2(4, -4))
        ObjectMaker.create_splat(global_position + Vector2( - 4, -4))
        ObjectMaker.create_splat(global_position + Vector2(4, 4))
        ObjectMaker.create_splat(global_position + Vector2( - 4, 4))
        ObjectMaker.create_explosion(position + Vector2(4, -4), 0.1, Color.GREEN)
        ObjectMaker.create_explosion(position + Vector2( - 4, -4), 0.1, Color.GREEN)
        ObjectMaker.create_explosion(position + Vector2(4, 4), 0.1, Color.GREEN)
        ObjectMaker.create_explosion(position + Vector2( - 4, 4), 0.1, Color.GREEN)
        ObjectMaker.create_explosion(position, 0.1, Color.GREEN)
        queue_free()
    pass # Replace with function body.
