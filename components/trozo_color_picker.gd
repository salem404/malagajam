class_name TrozoColorPicker
extends ColorPickerButton

@export var category: String

@onready var picker = get_picker()

signal color_picker_changed(new_color: Color)

func _ready() -> void:
	color = Color.WHITE
	connect("color_changed", Callable(self, "_on_color_changed"))
	picker.picker_shape = ColorPicker.PickerShapeType.SHAPE_VHS_CIRCLE
	picker.color_modes_visible = false
	picker.hex_visible = false
	picker.presets_visible = false

func _on_color_changed(new_color: Color) -> void:
	color_picker_changed.emit(new_color)
