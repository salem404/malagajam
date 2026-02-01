class_name PetitionsManager
extends Node

const PETITION_LENGTH := 3

var previous_petitions : Array[Array]= []

var current_petition : Array = []

func generate_petition():
	var petition := []
	for position in PETITION_LENGTH:
		var atributo: String = Trozo.ATRIBUTOS_POSIBLES[randi() % Trozo.ATRIBUTOS_POSIBLES.size()]
		petition.append(atributo)
	
	if petition in previous_petitions:
		return generate_petition()

	previous_petitions.append(petition)
	current_petition = petition
	return petition
