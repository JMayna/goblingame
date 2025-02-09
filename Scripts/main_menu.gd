extends Control


@onready var loadButton = $Panel/loadButton

func _on_load_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Game_Menu.tscn")
