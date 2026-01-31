extends Control

func _ready() -> void:
	AudioManager.play_music("res://assets/audio/music/calm-inspired-150895.mp3")

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/create.tscn")
	AudioManager.stop_music()

func _on_settings_button_pressed() -> void:
	var settings_scene = load("res://scenes/settings.tscn")
	if settings_scene:
		var settings_instance = settings_scene.instantiate()
		add_child(settings_instance)
		settings_instance.show_settings()
