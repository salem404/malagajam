extends Node

var button_sound: AudioStreamPlayer
var music_player: AudioStreamPlayer
var musica: Dictionary = {}

func _ready() -> void:
#sfx de click
	button_sound = AudioStreamPlayer.new()
	button_sound.bus = "SFX"
	button_sound.stream = load("res://assets/audio/SFX/clickSFXesteSi.mp3")
	add_child(button_sound)

	music_player = AudioStreamPlayer.new()
	music_player.bus = "Music"
	add_child(music_player)

func play_button_sound() -> void:
	button_sound.play()

func play_music(path: String, loop: bool = true) -> void:
	var stream = load(path)
	if stream is AudioStreamMP3:
		stream.loop = loop
	elif stream is AudioStreamOggVorbis:
		stream.loop = loop
	music_player.stream = stream
	music_player.play()

func stop_music() -> void:
	music_player.stop()

func set_music_volume(volume_db: float) -> void:
	music_player.volume_db = volume_db
