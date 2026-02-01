extends VBoxContainer

@onready var settings_scene = %Settings
@onready var item_list = %ItemList
@onready var petitions_manager = PetitionsManager.new()

@export var game_status := "Petition"

func _ready() -> void:
	settings_scene.hide()
	var current_petition :Array = petitions_manager.generate_petition()
	%PetitionScreen.show()
	show_petition(current_petition)
	%ResultScreen.hide()
	%NextButton.text = tr("ui_next")
	poblate_containers()
	AudioManager.play_music("res://assets/audio/music/before-beach-surf-rock-background-track-153586.mp3")
	petitions_manager.generate_petition()


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

func show_petition(petition)-> void:
	%PetitionScreen/Label.text = str(petition)

func _on_next_button_pressed() -> void:
	if game_status == "Petition":
		change_to_create_mode()
	elif game_status == "Create":
		change_to_result_mode()
	elif game_status == "Result":
		reset_game()

func change_to_create_mode() -> void:
	game_status = "Create"
	%PetitionScreen.hide()

	%NextButton.text = tr("ui_finish")

func change_to_result_mode() -> void:
	game_status = "Result"
	%ResultScreen.show()
	%ColorPickers.hide()
	%NextButton.text = tr("ui_restart")

func reset_game() -> void:
	game_status = "Petition"
	var current_petition :Array = petitions_manager.generate_petition()
	%ResultScreen.hide()
	%PetitionScreen.show()
	show_petition(current_petition)
	%NextButton.text = tr("ui_next")
	%ColorPickers.show()
	# Reset all trozo attachments
	var trozo_attaches: Array = get_tree().get_nodes_in_group("trozo_attach")
	for trozo_attach in trozo_attaches:
		trozo_attach.texture = null
		trozo_attach.visible = false
	# Reset all trozo color pickers
	var trozo_color_pickers: Array = %ColorPickers.get_children()
	for trozo_color_picker in trozo_color_pickers:
		trozo_color_picker.color = Color.WHITE