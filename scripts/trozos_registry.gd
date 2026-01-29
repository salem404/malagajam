extends Node

# TODO: Investigar si es mejor usar Resources

const CATEGORIES := [
	"ojos",
	"cabeza",
]

# Atributos de relleno
const ATRIBUTOS_POSIBLES := [
	"fuerza",
	"agilidad",
	"inteligencia",
	"carisma",
	"suerte",
]

const TROZOS_REGISTRY := {
	"antifaz_rosa": {
		"id": 1,
		"category": "ojos",
		"atributos": {
			"carisma": 5,
			"suerte": 2,
		},
	},
	"lagrimas": {
		"id": 2,
		"category": "ojos",
		"atributos": {
			"inteligencia": 3,
			"carisma": -1,
		},
	},
	"cuernos_demonio": {
		"id": 3,
		"category": "cabeza",
		"atributos": { },
	},
}


func get_trozo(id: int) -> Trozo:
	for trozo_data in TROZOS_REGISTRY.values():
		if trozo_data["id"] == id:
			var trozo = Trozo.new()
			trozo.id = trozo_data["id"]
			trozo.category = trozo_data["category"]
			trozo.atributos = trozo_data["atributos"]
			return trozo
	return null
