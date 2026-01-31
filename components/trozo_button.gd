class_name TrozoButton
extends Button

@export var trozo_id: int
@onready var trozo_category: String = get_parent().name.to_lower()
@onready var button_theme := load("res://theme/trozo_button_theme.tres")

@onready var trozo: Trozo = TrozosRegistry.get_trozo(trozo_id, trozo_category)

const ICON_SIZE := 180

func _ready():
	if trozo == null:
		push_warning("Trozo no encontrado para id: %d y categoria: %s" % [trozo_id, trozo_category])
		visible = false
		return

	toggle_mode = true
	expand_icon = true
	icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
	set_theme(button_theme)
	custom_minimum_size = Vector2(ICON_SIZE, ICON_SIZE)
	button_group = load(
		"res://resources/button_groups/%s.tres" %
		[trozo.category],
	)
	icon = load(
		"res://assets/trozos/%s/%d.png" %
		[trozo.category, trozo.id],
	)

func _toggled(toggled_on: bool) -> void:
	if trozo == null:
		push_warning("Trozo no encontrado para id: %d" % trozo_id)
		return

	get_tree().call_group("trozo_attach", "on_trozo_toggled", trozo, toggled_on)
