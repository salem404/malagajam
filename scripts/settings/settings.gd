class_name Settings
extends Control

signal settings_closed

func _ready() -> void:
	visible = false
	_load_last_tab()
	#setup_button_sounds()
	connect_all_buttons()

func _load_last_tab() -> void:
	var tab_container = get_node_or_null("MarginContainer/TabContainer")
	if tab_container:
		var last_tab: int = get_node("/root/ConfigManager").get_setting("settings", "last_tab", 0)
		tab_container.current_tab = last_tab
		tab_container.tab_changed.connect(_on_tab_changed)

func _on_tab_changed(tab_index: int) -> void:
	get_node("/root/ConfigManager").set_setting("settings", "last_tab", tab_index)

func show_settings() -> void:
	visible = true


func _on_close_button_pressed() -> void:
	visible = false
	settings_closed.emit()
	
func connect_all_buttons() -> void:
	for button in get_all_buttons(self):
		if not button.pressed.is_connected(AudioManager.play_button_sound):
			button.pressed.connect(AudioManager.play_button_sound)

func get_all_buttons(node: Node) -> Array:
	var buttons = []
	for child in node.get_children():
		if child is Button:
			buttons.append(child)
		buttons += get_all_buttons(child)
	return buttons
