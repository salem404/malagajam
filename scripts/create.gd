extends VBoxContainer

@onready var settings_scene = %Settings
@onready var item_list = %ItemList
@onready var petitions_manager = PetitionsManager.new()

@export var game_status := "Petition"
var current_petition: Array

func _ready() -> void:
	settings_scene.hide()
	current_petition = petitions_manager.generate_petition()
	%PetitionScreen.show()
	show_petition(current_petition)
	%ResultScreen.hide()
	%NextButton.text = tr("ui_next")
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

func show_petition(petition: Array, target_node: Node = null) -> void:
	if target_node == null:
		target_node = %PetitionScreen
	
	var petition_container = target_node.get_node_or_null("petition")
	if petition_container == null:
		return
	
	for i in petition.size():
		var petition_texture = "res://assets/%s.png" % petition[i].capitalize()
		petition_container.get_node("cat_slot%d" % (i + 1)).texture = load(petition_texture)


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
	show_petition(petitions_manager.current_petition, %Control.get_node("Preview/AspectRatioContainer/Mask"))
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
	show_petition(current_petition, %PetitionScreen)
	%NextButton.text = tr("ui_next")
	%ColorPickers.show()
	# Reset all trozo attachments
	var trozo_attaches: Array = get_tree().get_nodes_in_group("trozo_attach")
	for trozo_attach in trozo_attaches:
		trozo_attach.texture = null
		trozo_attach.visible = false
