extends Node2D

func _ready():
	$AudioStreamPlayer2D2.play()
	await get_tree().create_timer(83).timeout
	$AudioStreamPlayer2D.play()
	



func _on_menu_return_pressed():
	AudioManager.play_sound("res://Audio/menu-button-88360.mp3")
	await get_tree().create_timer(0.01).timeout
	get_tree().change_scene_to_file("res://Prefabs/menu.tscn")


func _on_cheat_button_pressed():
	# Toggle the cheats when the button is pressed
	AudioManager.play_sound("res://Audio/menu-button-88360.mp3")
	Cheats.toggle_cheats()
	print("Cheats are now: ", Cheats.cheats_enabled)
