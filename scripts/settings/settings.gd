class_name Settings
extends Control


signal settings_closed


func _ready() -> void:
	visible = false
	_load_last_tab()


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
