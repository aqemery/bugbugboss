extends Area2D

var health = 20
var last_called
# Called when the node enters the scene tree for the first time.
@onready var _animator = animator.create(self)
@onready var hit = $hit
@onready var die = $die

func _ready():
    animate_intro()

func animate_intro():
    _animator.fly(Vector2(50, 64), 0.5)
    _animator.fly(Vector2(100, 75), 0.5)
    _animator.fly(Vector2(70, 30), 1)
    _animator.callback(start_loop)

func start_loop():
    var options: Array[Callable] = [move_right, move_left, move_center, fire_slime, lay_mines, fire_plasma]
    var next_op: Callable = options.pick_random()
    if next_op != last_called:
        last_called = next_op
        next_op.call()
    else:
        start_loop()
    
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
    _animator = animator.create(self)
    _animator.fly(Vector2(10, 10), 1)
    _animator.callback(drop_mines)


func drop_mines():
    _animator = animator.create(self)
    _animator.fly(Vector2(118, 10), 2)
    _animator.callback(start_loop)
    for i in range(0, 12):
        if [true, false].pick_random():
            ObjectMaker.create_slime_ball(global_position)
        await get_tree().create_timer(0.15).timeout
    



func fire_plasma():
    _animator = animator.create(self)
    _animator.fly(Vector2(30, 30), 0.5)
    _animator.fly(Vector2(60, 20), 0.5)
    _animator.fly(Vector2(100, 10), 0.5)
    _animator.callback(start_loop)

    for i in range(0, 3):
        await get_tree().create_timer(0.5).timeout
        ObjectMaker.create_plasma(global_position)
        
    

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
        $CollisionShape2D.queue_free()
        $AnimatedSprite2D.queue_free()
        die.play()
    else:
        hit.play()

func _on_die_finished():
    queue_free()
