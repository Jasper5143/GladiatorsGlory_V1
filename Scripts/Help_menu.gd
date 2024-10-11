extends Node2D




func _on_menu_return_pressed():
	AudioManager.play_sound("res://Audio/menu-button-88360.mp3")
	await get_tree().create_timer(0.01).timeout
	get_tree().change_scene_to_file("res://Prefabs/menu.tscn")
