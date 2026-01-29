class_name TrozoAttach
extends Sprite2D

@export var category: String
@export var trozo_id: int
var trozo: Trozo

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
	else:
		texture = null
		visible = false

func _apply_trozo(selected_trozo: Trozo) -> void:
	texture = load(
		"res://assets/trozos/%s/%d.png" %
		[selected_trozo.category, selected_trozo.id],
	)
	visible = true

func _category_from_name() -> String:
	if name.begins_with("Attach"):
		return name.substr(6).to_lower()
	return ""
