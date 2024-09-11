extends Node2D



func _on_button_pressed():
	
	get_tree().change_scene_to_file("res://Prefabs/game.tscn")

func _process(delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)



func _on_help_pressed():
	get_tree().change_scene_to_file("res://Prefabs/Help_menu.tscn")
