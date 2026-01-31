class_name Trozo
extends Resource

@export var id: int
@export var category: String
@export var atributos: Dictionary
@export var preset_color: Color


const CATEGORIES := [
	"cabeza",
	"ojos",
	"mandibula",
    "extra"
]

const ATRIBUTOS_POSIBLES := [
	"cuqui",
	"macabro",
    "futurista"
]


func _init(p_id: int, p_category: String = "", p_atributos: Dictionary = {}, p_color: Color = Color("#FFFFFF")):
	id = p_id
	category = p_category
	atributos = p_atributos
	preset_color = p_color
