extends Node

var trozos_registry := {
	"enmascarade_texture": Trozo.new(
		1,
		"texture",
		{"futurista": 0.5,"cuqui":0.5},
		),
	"enmascarade_shape": Trozo.new(
		1,
		"shape",
		{"futurista": 0.5,"cuqui":0.5},
		),
	"enmascarade_cabeza": Trozo.new(
		1,
		"cabeza",
		{"futurista": 0.5,"cuqui":0.5},
		),
	"enmascarade_ojos": Trozo.new(
		1,
		"ojos",
		{"futurista": 0.5,"cuqui":0.5},
		),
	"enmascarade_mandibula": Trozo.new(
		1,
		"mandibula",
		{"futurista": 0.5,"cuqui":0.5},
		),
	"ogro_cabeza": Trozo.new(
		2,
		"cabeza",
		{"macabro": 1.0},
		),
	"ogro_ojos": Trozo.new(
		2,
		"ojos",
		{"macabro": 1.0},
		),
	"ogro_mandibula": Trozo.new(
		2,
		"mandibula",
		{"macabro": 1.0},
		),
	"geisha_cabeza": Trozo.new(
		3,
		"cabeza",
		{"cuqui": 0.5,"macabro":0.5},
		),
	"geisha_ojos": Trozo.new(
		3,
		"ojos",
		{"cuqui": 0.5,"macabro":0.5},
		),
	"geisha_mandibula": Trozo.new(
		3,
		"mandibula",
		{"cuqui": 0.5,"macabro":0.5},
		),
	"mecha_ojos": Trozo.new(
		4,
		"ojos",
		{"futurista": 1.0},
		),
	"mecha_mandibula": Trozo.new(
		4,
		"mandibula",
		{"futurista": 1.0},
		),
}


func get_trozo(id: int,category: String) -> Trozo:
	for trozo in trozos_registry.values():
		print(trozo.id,trozo.category)
		if trozo.id == id and trozo.category == category:
			
			return trozo
	return null

func get_all_trozos() -> Dictionary:
	return trozos_registry
