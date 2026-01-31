extends VBoxContainer


@onready var settings_scene = %Settings

func _ready() -> void:
	settings_scene.hide()
	


func _on_settings_button_pressed() -> void:
	settings_scene.show()


func _on_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
