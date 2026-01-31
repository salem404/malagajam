class_name TrozoAttach
extends Sprite2D

@export var category: String
@export var trozo_id: int
@onready var color_pickers = %ColorPickers
var trozo: Trozo
var _color_picker: TrozoColorPicker

func _ready():
	if trozo_id > 0:
		trozo = TrozosRegistry.get_trozo(trozo_id)
	else:
		trozo = null

	add_to_group("trozo_attach")

	if category.strip_edges() == "":
		category = _category_from_name()

	if trozo == null:
		visible = false
		return

	_apply_trozo(trozo)

func on_trozo_toggled(toggled_trozo: Trozo, toggled_on: bool) -> void:
	if toggled_trozo == null:
		return

	if toggled_trozo.category != category:
		return

	if toggled_on:
		_apply_trozo(toggled_trozo)
		_connect_color_picker()
	else:
		texture = null
		visible = false
		_disconnect_color_picker()

func _apply_trozo(selected_trozo: Trozo) -> void:
	texture = load(
		"res://assets/trozos/%s/%d.png" %
		[selected_trozo.category, selected_trozo.id],
	)
	var color_picker: TrozoColorPicker = color_pickers.get_node("%s" % selected_trozo.category)
	
	if color_picker != null and color_picker.color != selected_trozo.preset_color:
		self_modulate = color_picker.color
	else:
		self_modulate = selected_trozo.preset_color
	visible = true

func _category_from_name() -> String:
	if name.begins_with("Attach"):
		return name.substr(6).to_lower()
	return ""

func _connect_color_picker() -> void:
	_color_picker = color_pickers.get_node("%s" %category)
	if _color_picker != null and not _color_picker.color_picker_changed.is_connected(_on_color_picker_changed):
		_color_picker.color_picker_changed.connect(_on_color_picker_changed)

func _disconnect_color_picker() -> void:
	if _color_picker != null and _color_picker.color_picker_changed.is_connected(_on_color_picker_changed):
		_color_picker.color_picker_changed.disconnect(_on_color_picker_changed)

func _on_color_picker_changed(new_color: Color) -> void:
	self_modulate = new_color
