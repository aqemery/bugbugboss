extends Area2D

var health = 20
# Called when the node enters the scene tree for the first time.
@onready var _animator = animator.create(self)

func _ready():
    animate_intro()

func animate_intro():
    _animator.fly(Vector2(50, 64), 0.5)
    _animator.fly(Vector2(100, 75), 0.5)
    _animator.fly(Vector2(70, 30), 1)
    _animator.callback(start_loop)

func start_loop():
    var options: Array[Callable] = [move_right, move_left, move_center, fire_slime]
    var next_op: Callable = options.pick_random()
    next_op.call()
    
func move_right():
    _animator = animator.create(self)
    _animator.fly(Vector2(118, 10), 1)
    _animator.callback(start_loop)

func move_left():
    _animator = animator.create(self)
    _animator.fly(Vector2(10, 10), 1)
    _animator.callback(start_loop)

func move_center():
    _animator = animator.create(self)
    _animator.fly(Vector2(60, 30), 1)
    _animator.callback(start_loop)

func fire_slime():
    for i in range(0, 6):
        _fire_at_player()
        await get_tree().create_timer(0.15).timeout
    start_loop()

func lay_mines():
    pass

func fire_plasma():
    pass

func _fire_at_player():
    var player = get_tree().get_first_node_in_group("ship")
    if player:
        var direction = (player.global_position - global_position).normalized()
        ObjectMaker.create_slime(global_position, direction)

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
