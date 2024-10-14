extends Node2D

func _ready():
	AudioManager.play_sound("res://Audio/8-bit-game-158815.mp3")

# Starts the game
func _on_button_pressed():
	AudioManager.play_sound("res://Audio/menu-button-88360.mp3")
	await get_tree().create_timer(0.01).timeout
	get_tree().change_scene_to_file("res://Prefabs/game.tscn")

# Hides mouse while the game is active
func _process(delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

# Opens help screen
func _on_help_pressed():
	AudioManager.play_sound("res://Audio/menu-button-88360.mp3")
	await get_tree().create_timer(0.01).timeout
	get_tree().change_scene_to_file("res://Prefabs/Help_menu.tscn")


func _on_easter_egg_pressed():
	pass # Replace with function body.
