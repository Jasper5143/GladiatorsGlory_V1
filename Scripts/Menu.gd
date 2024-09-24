extends Node2D

#Starts the game
func _on_button_pressed():
	
	get_tree().change_scene_to_file("res://Prefabs/game.tscn")

#hides mouse wile the game is active
func _process(delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

#Opens help screen
func _on_help_pressed():
	get_tree().change_scene_to_file("res://Prefabs/Help_menu.tscn")
