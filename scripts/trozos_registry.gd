extends Node

var trozos_registry := {
	"antifaz_rosa": Trozo.new(
		1,
		"ojos",
		{"cuqui": 1},
		Color("#FF69B4"),
		),
	"lagrimas": Trozo.new(
		2,
		"ojos",
		{"macabro": 2},
		Color("#0000FF"),
		),
	"cuernos_demonio": Trozo.new(
		3,
		"cabeza",
		{"macabro": 3},
		Color("#8B0000"),
		)
}


func get_trozo(id: int) -> Trozo:
	for trozo in trozos_registry.values():
		if trozo.id == id:
			return trozo
	return null

func get_all_trozos() -> Dictionary:
	return trozos_registry
