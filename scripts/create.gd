extends VBoxContainer

@onready var settings_scene = %Settings
@onready var item_list = %ItemList
@onready var petitions_manager = PetitionsManager.new()

@onready var create_scene_petition = $Control/Preview/AspectRatioContainer/Mask/petition

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


func _on_settings_button_pressed() -> void:
	settings_scene.show()


func _on_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func poblate_containers() -> void:
	var trozos_dict: Dictionary = TrozosRegistry.get_all_trozos()
	for trozo in trozos_dict.values():
		var category_container := item_list.get_node("%sTab/MarginContainer/%s" % [trozo.category.capitalize(), trozo.category.capitalize()])
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
	create_scene_petition.show()
	show_petition(petitions_manager.current_petition, %Control.get_node("Preview/AspectRatioContainer/Mask"))
	%NextButton.text = tr("ui_finish")

func change_to_result_mode() -> void:
	game_status = "Result"
	create_scene_petition.hide()
	%ResultScreen.show()
	%ColorPickers.hide()
	%NextButton.text = tr("ui_restart")
	
	for i in current_petition.size():
		var petition_texture = "res://assets/%s.png" % current_petition[i].capitalize()
		var result_slot = %ResultScreen.get_node("VBoxContainer/petition%d/cat_slot%d" % [i + 1, i + 1])
		result_slot.texture = load(petition_texture)
	
	calculate_score_per_attribute()

func calculate_score_per_attribute() -> void:
	var trozo_count_by_category: Dictionary = {}
	var trozo_attaches: Array = get_tree().get_nodes_in_group("trozo_attach")
	
	for trozo_attach in trozo_attaches:
		if trozo_attach.texture != null:
			var category = trozo_attach.category
			if category not in trozo_count_by_category:
				trozo_count_by_category[category] = 0
			trozo_count_by_category[category] += 1
	
	#print("Trozos por categoría: %s" % trozo_count_by_category)
	
	var score_per_attribute: Dictionary = {}
	for atributo in Trozo.ATRIBUTOS_POSIBLES:
		score_per_attribute[atributo] = 0
	
	for trozo_attach in trozo_attaches:
		if trozo_attach.texture != null:
			var category = trozo_attach.category
			var texture_path: String = trozo_attach.texture.resource_path
			var filename = texture_path.get_file()
			var trozo_id = int(filename.trim_suffix(".png"))
			
			#print("Buscando trozo: id=%d, category=%s (path=%s)" % [trozo_id, category, texture_path])
			var trozo: Trozo = TrozosRegistry.get_trozo(trozo_id, category)
			if trozo != null:
				#print("Trozo encontrado: %s, atributos=%s" % [trozo.id, trozo.atributos])
				for atributo in trozo.atributos.keys():
					if atributo in score_per_attribute:
						score_per_attribute[atributo] += trozo.atributos[atributo]
			else:
				print("Trozo NO encontrado para id=%d, category=%s" % [trozo_id, category])
	
	var total_score: float = 0.0
	for atributo in score_per_attribute.keys():
		total_score += score_per_attribute[atributo]
	
	print(score_per_attribute)
	print(total_score)
	
	# Paso 3: Distribuir los puntos en los progress bars según la petición
	distribute_progress_bars(score_per_attribute, total_score)
	
	return

func distribute_progress_bars(score_per_attribute: Dictionary, total_score: float) -> void:
	if total_score == 0:
		return
	
	var puntos_disponibles = score_per_attribute.duplicate()
	var petition_count: int = current_petition.size()
	var max_points_per_slot: float = 1.0
	
	for i in petition_count:
		var category: String = current_petition[i]
		var progress_bar: ProgressBar = %ResultScreen.get_node("VBoxContainer/petition%d/ProgressBar" % (i + 1))
		
		if progress_bar != null:
			var disponible: float = puntos_disponibles.get(category, 0.0)
			var asignado: float = min(disponible, max_points_per_slot)
			var porcentaje: float = (asignado / max_points_per_slot) * 100.0
			progress_bar.value = min(porcentaje, 100.0)
			
			puntos_disponibles[category] -= asignado
			
func reset_game() -> void:
	get_tree().reload_current_scene()
