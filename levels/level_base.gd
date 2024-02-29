extends Node2D


func _on_child_exiting_tree(node):
    if get_child_count() == 1:
        SignalManager.level_complete.emit()
 
