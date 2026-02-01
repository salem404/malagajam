extends Node

var trozos_registry := {
	"base_shape": Trozo.new(
		1,
		"shape",
		{},
		),
	"2_shape": Trozo.new(
		2,
		"shape",
		{},
		),
	"3_shape": Trozo.new(
		3,
		"shape",
		{},
		),
	"4_shape": Trozo.new(
		4,
		"shape",
		{},
		),
	"5_shape": Trozo.new(
		5,
		"shape",
		{},
		),
	"6_shape": Trozo.new(
		6,
		"shape",
		{},
		),
	"7_shape": Trozo.new(
		7,
		"shape",
		{},
		),
	"8_shape": Trozo.new(
		8,
		"shape",
		{},
		),
	"9_shape": Trozo.new(
		9,
		"shape",
		{},
		),
	"10_shape": Trozo.new(
		10,
		"shape",
		{},
		),
	"11_shape": Trozo.new(
		11,
		"shape",
		{},
		),
	"12_shape": Trozo.new(
		12,
		"shape",
		{},
		),
	"13_shape": Trozo.new(
		13,
		"shape",
		{},
		),
	"14_shape": Trozo.new(
		14,
		"shape",
		{},
		),
	"15_shape": Trozo.new(
		15,
		"shape",
		{},
		),
	"16_shape": Trozo.new(
		16,
		"shape",
		{},
		),
	"17_shape": Trozo.new(
		17,
		"shape",
		{},
		),
	"18_shape": Trozo.new(
		18,
		"shape",
		{},
		),
	"19_shape": Trozo.new(
		19,
		"shape",
		{},
		),
	"20_shape": Trozo.new(
		20,
		"shape",
		{},
		),
	"21_shape": Trozo.new(
		21,
		"shape",
		{},
		),
	"enmascarade_cabeza": Trozo.new(
		1,
		"cabeza",
		{"cuqui":1.0},
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
		{"cuqui": 1.0},
		),
	"geisha_ojos": Trozo.new(
		3,
		"ojos",
		{"cuqui": 1.0},
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
	"cabeza4": Trozo.new(
		4,
		"cabeza",
		{"macabra": 1.0},
		),
	"cabeza5": Trozo.new(
		5,
		"cabeza",
		{"futurista":1.0},
		),
	"cabeza6": Trozo.new(
		6,
		"cabeza",
		{"cuqui":1.0},
		),
	"cabeza7": Trozo.new(
		7,
		"cabeza",
		{"cuqui":1.0},
		),
	"kappa_cabeza": Trozo.new(
		8,
		"cabeza",
		{"cuqui":1.0},
		),
	"cabeza9": Trozo.new(
		9,
		"cabeza",
		{"cuqui":0.5,"macabro":0.5},
		),
	"cabeza10": Trozo.new(
		10,
		"cabeza",
		{"cuqui":0.5,"macabro":0.5},
		),
	"cabeza11": Trozo.new(
		11,
		"cabeza",
		{"cuqui":1.0},
		),
	"cabeza12": Trozo.new(
		12,
		"cabeza",
		{"macabro":1.0},
		),
	"cabeza13": Trozo.new(
		13,
		"cabeza",
		{"macabro":1.0},
		),
	"ojos5": Trozo.new(
		5,
		"ojos",
		{"cuqui":0.5,"macabro":0.5},
		),
	"ojos6": Trozo.new(
		6,
		"ojos",
		{"futurista":1.0},
		),
	"ojos7": Trozo.new(
		7,
		"ojos",
		{"cuqui":1.0},
		),
	"ojos8": Trozo.new(
		8,
		"ojos",
		{"cuqui":1.0},
		),
	"ojos9": Trozo.new(
		9,
		"ojos",
		{"futurista":0.5,"macabro":0.5},
		),
	"ojos10": Trozo.new(
		10,
		"ojos",
		{"futurista":1.0},
		),
	"ojos11": Trozo.new(
		11,
		"ojos",
		{"futurista":1.0},
		),
	"ojos12": Trozo.new(
		12,
		"ojos",
		{"cuqui":1.0},
		),
	"ojos13": Trozo.new(
		13,
		"ojos",
		{"futurista":1.0},
		),
	"mandibula5": Trozo.new(
		5,
		"mandibula",
		{"macabro":1.0},
		),
	"mandibula6": Trozo.new(
		6,
		"mandibula",
		{"futurista":1.0},
		),
	"mandibula7": Trozo.new(
		7,
		"mandibula",
		{"cuqui":1.0},
		),
	"mandibula8": Trozo.new(
		8,
		"mandibula",
		{"cuqui":1.0},
		),
	"mandibula9": Trozo.new(
		9,
		"mandibula",
		{"cuqui":0.5,"macabro":0.5},
		),
	"mandibula10": Trozo.new(
		10,
		"mandibula",
		{"macabro":1.0},
		),
	"mandibula11": Trozo.new(
		11,
		"mandibula",
		{"macabro":1.0},
		),
	"mandibula12": Trozo.new(
		12,
		"mandibula",
		{"futurista":1.0},
		),
	"mandibula13": Trozo.new(
		13,
		"mandibula",
		{"futurista":1.0},
		),
	"miku_cabeza": Trozo.new(
		14,
		"cabeza",
		{"cuqui":1.0},
		),
	"cabeza15": Trozo.new(
		15,
		"cabeza",
		{"cuqui":1.0},
		),
	"miku_ojos": Trozo.new(
		14,
		"ojos",
		{"cuqui":1.0},
		),
	"miku_mandibula": Trozo.new(
		14,
		"mandibula",
		{"cuqui":0.5,"futurista":0.5},
		),
	"mandibula15": Trozo.new(
		15,
		"mandibula",
		{"futurista":0.5,"macabro":0.5},
		),
	"cabeza16": Trozo.new(
		16,
		"cabeza",
		{"futurista":0.5,"macabro":0.5},
		),
	
}


func get_trozo(id: int,category: String) -> Trozo:
	for trozo in trozos_registry.values():
		if trozo.id == id and trozo.category == category:
			
			return trozo
	return null

func get_all_trozos() -> Dictionary:
	return trozos_registry
