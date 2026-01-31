class_name TrozoColorPicker
extends ColorPickerButton

@export var category: String

signal color_picker_changed(new_color: Color)

func _ready() -> void:
	color = Color.WHITE
	connect("color_changed", Callable(self, "_on_color_changed"))

func _on_color_changed(new_color: Color) -> void:
	color_picker_changed.emit(new_color)
