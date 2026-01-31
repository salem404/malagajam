class_name PetitionsManager
extends Node

const PETITION_LENGTH := 3

var previous_petitions : Array[Array]= [
	["cuqui","cuqui","macabro"],
	]

var current_petition : Array = []

func generate_petition():
	var petition := []
	for position in PETITION_LENGTH:
		var atributo: String = Trozo.ATRIBUTOS_POSIBLES[randi() % Trozo.ATRIBUTOS_POSIBLES.size()]
		petition.append(atributo)
		
	previous_petitions.append(petition)
	current_petition = petition
	return petition
