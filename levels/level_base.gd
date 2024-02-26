extends Node2D


func _on_child_exiting_tree(node):
    print(node, get_child_count())
    if get_child_count() == 1:
        SignalManager.level_complete.emit()
