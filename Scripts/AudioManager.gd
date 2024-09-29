extends Node

var audio_player: AudioStreamPlayer = null

# Called when the node enters the scene tree for the first time
func _ready():
	# Create an AudioStreamPlayer node and add it as a child
	audio_player = AudioStreamPlayer.new()
	add_child(audio_player)

# Function to play a sound effect
func play_sound(sound_path: String):
	var sound = load("res://Audio/menu-button-88360.mp3")
	if sound:
		audio_player.stream = sound  # Assign it to the AudioStreamPlayer
		audio_player.play()  # Play the sound
