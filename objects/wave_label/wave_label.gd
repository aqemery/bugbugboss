extends Control

@onready var label = $CenterContainer/Label


func set_text(text):
    label.text = text
