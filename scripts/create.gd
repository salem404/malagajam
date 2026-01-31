extends VBoxContainer

@onready var settings_scene = %Settings
@onready var item_list = %ItemList

func _ready() -> void:
	settings_scene.hide()
	poblate_containers()
	AudioManager.play_music("res://assets/audio/music/before-beach-surf-rock-background-track-153586.mp3")

func _on_settings_button_pressed() -> void:
	settings_scene.show()


func _on_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func poblate_containers() -> void:
	var trozos_dict: Dictionary = TrozosRegistry.get_all_trozos()
	for trozo in trozos_dict.values():	
		var category_container:= item_list.get_node("%sTab/MarginContainer/%s" % [trozo.category.capitalize(), trozo.category.capitalize()])
		if category_container != null:
			var trozo_button: TrozoButton = TrozoButton.new()
			trozo_button.trozo_id = trozo.id
			category_container.add_child(trozo_button)
			trozo_button.pressed.connect(AudioManager.play_button_sound)
