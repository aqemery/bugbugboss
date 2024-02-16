extends Node

const BULLET = preload("res://objects/bullet/bullet.tscn")
const SLIME = preload("res://objects/slime/slime.tscn")
const SPLAT = preload("res://objects/splat/splat.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_deferred(scene):
	get_tree().root.add_child(scene)

func call_add_child(scene):
	call_deferred("add_deferred", scene)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func create_bullet(pos):
	var b = BULLET.instantiate()
	b.global_position = pos
	call_add_child(b)
	
func create_splat(pos):
	var s = SPLAT.instantiate()
	s.global_position = pos
	call_add_child(s)
	
func create_slime(pos):
	var b = SLIME.instantiate()
	b.global_position = pos
	b.set_direction(Vector2.DOWN)
	call_add_child(b)
	
	
