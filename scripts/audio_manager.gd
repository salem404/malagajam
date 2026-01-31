extends Node

var button_sound: AudioStreamPlayer

func _ready() -> void:
	button_sound = AudioStreamPlayer.new()
	button_sound.bus = "SFX"
	button_sound.stream = load("res://assets/audio/SFX/clickSFXesteSi.mp3")
	add_child(button_sound)

func play_button_sound() -> void:
	button_sound.play()
