extends Node2D

#Starts the game
func _on_button_pressed():
	AudioManager.play_sound("res://sounds/button_click.wav")
	await get_tree().create_timer(0.01).timeout
	get_tree().change_scene_to_file("res://Prefabs/game.tscn")

#hides mouse wile the game is active
func _process(delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

#Opens help screen
func _on_help_pressed():
	AudioManager.play_sound("res://sounds/button_click.wav")
	await get_tree().create_timer(0.01).timeout
	get_tree().change_scene_to_file("res://Prefabs/Help_menu.tscn")
